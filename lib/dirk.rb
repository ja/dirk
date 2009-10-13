require 'rubygems'
require 'yaml'

class Dirk
  attr_reader :path, :attributes, :attr_file

  def self.dir
    ""
  end    

  def initialize(p = "", options = {})
    @prefix     = options[:prefix] || "_"
    @attr_file  = @prefix + (options[:attr_file] || "attributes.txt")
    @root_path  = Pathname.new(options[:root] || "public/data")
    @path       = (@root_path + self.class.dir + p).realpath
    @attributes = get_attributes
  end            

  # used to access the attributes of the current object
  def method_missing(name, *args, &block)
    @attributes ? @attributes[name.to_s] : nil
  end

  def name
    slug.gsub(/_/, " ").split(".")[0]
  end

  def slug
    path.basename.to_s
  end
  
  # returns the path relative to the root_path for the application
  def relative_path(p = path)
    anchor = p.ftype == "directory" ? @root_path : "public"
    p.relative_path_from(Pathname.new(anchor).realpath)
  end

  # returns the url corresponding to the path
  def url(p = path)
    "/" + relative_path(p).to_s.downcase.gsub(/\s/, " ")
  end

  def extension
    @path.extname[1..-1]
  end

  def parent
    Dirk.new(@path.parent)
  end

  # creates a hash of Dirk objects for any non-system sub-directories of the current directory
  def children(options = {})
    children = get_children("directory").collect { |child| Dirk.new(child) }
    children.reject! { |child| child.published == false || child.draft == true }
    children.sort! { |a, b| a.send(options[:sort]).to_s <=> b.send(options[:sort]).to_s } if options[:sort]
    children.reverse if options[:order].to_s.upcase == "DESC"
    children
  end

  # creates a hash of Dirk objects for any non-system files in the current directory
  def files(options = {})
    resize_images_if_needed  
    files = get_children("file").collect do |file| 
      Dirk.new(file, { :attr_file => file.basename.to_s.gsub(file.extname, '.txt') })
    end
  
    files.sort! { |a, b| a.send(options[:sort]).to_s <=> b.send(options[:sort]).to_s } if options[:sort]
    files
  end

  def thumb_path
    thumb_path = Pathname.new(parent.path.realpath.to_s + "/#{@prefix}thumbs/" + path.basename)
    create_thumbnail(path) unless thumb_path.exist?
    thumb_path.realpath
  end

  def thumb_url
    url(thumb_path)
  end

  private

  def resize_images_if_needed
    resize_path = Pathname.new(path.parent.realpath.to_s + "/#{@prefix}resize/")

    if resize_path.exist?
      back_path = (file.dirname).realpath.to_s + "/#{@prefix}backup"
      FileUtils.mkdir_p back_dir unless File.exists?(back_dir)
      FileUtils.mv(file, back_dir)
      
      resize_path.entries.each do |image_path|
        convert_size(image_path, path.parent.real_path)
      end
    end
  end

  def convert_size(file, destination)
    %x{convert #{destination + "/" + file.basename} -resize 1000x1000 #{file}}
  end

  def get_children(type = %w{directory file})
    @path.children.
      reject { |child| [@prefix, "."].include?(child.basename.to_s[0..0]) }.
      reject { |child| not [*type].include?(child.ftype) }
  end

  def get_attributes
    file_contents = read_file(@attr_file)
    return YAML::load(file_contents) if file_contents
    {}
  end

  #TODO needs re-factoring - path should only be the directory and the file should be separate
  def read_file(file)
    text_file = (path.ftype == "directory" ? path : Pathname.new(path.dirname)) + file
    File.read(text_file) if File.exists?(text_file)
  end
end

class FileAttributes
  def initialize(file)
    return false unless file && !File.exists?(file)
    contents = File.read(file)
    @attribs = YAML::load(contents) if contents
  end
  
  def read(filename)
    @attribs[filename]["title"]
  end
  
  def keys(filename)
    @attribs[filename].keys
  end
end