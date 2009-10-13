require 'rubygems'
require 'test/unit'
require File.expand_path(
    File.join(File.dirname(__FILE__), %w[.. lib dirk]))

class Projects < Dirk
  def self.dir
    "portfolio"
  end
end

class TestDirk < Test::Unit::TestCase
  def setup
    test_root     = File.join(File.dirname(__FILE__), 'fixtures', 'data')
    @test_options = { :root => test_root }
    
    @root               = Dirk.new("", @test_options )
    @projects           = Projects.new("", @test_options )
    @first_project      = Dirk.new("portfolio/project_1", @test_options )
    @second_project     = Dirk.new("portfolio/project_2", @test_options )
    @second_sub_project = Dirk.new("portfolio/project_2/sub-project_2", @test_options )
    @image_1            = Pathname.new(test_root) + "portfolio/project_2/image_1.jpg"
    @image_2            = Pathname.new(test_root) + "portfolio/project_2/image_2.jpg"
  end
  
  def test_subclass_can_set_starting_directory
    assert_equal @projects.path, Dirk.new("portfolio", @test_options ).path
  end
  
  def test_dirk_correctly_counts_files
    assert_equal 0, @root.files.size
    assert_equal 1, @second_sub_project.files.size
    assert_equal 2, @second_sub_project.parent.files.size
  end
  
  def test_dirk_correctly_shows_files
    assert_equal @image_1, @projects.children[1].files[0].path
    assert_equal [@image_1, @image_2], @second_sub_project.parent.files.collect { |file| file.path }
  end
  
  def test_dirk_correctly_counts_children
    assert_equal 3, @root.children.size
  end
  
  def test_dirk_correctly_reads_parent
    assert_equal @root.path, @root.children.first.parent.path
    assert_equal @root.title, @root.children.first.parent.title
  end
  
  def test_dirk_correctly_traverses_heirarchy
    assert_equal "portfolio", @root.children[2].path.basename.to_s
  end
  
  def test_dirk_correctly_computes_object_directory
    assert_equal @second_sub_project.path, @root.children[2].children[1].children[1].path
  end

  def test_dirk_correctly_reads_attributes
    assert_equal "Portfolio Site", @root.title
    assert_equal "This is the portfolio of a madman.", @root.sub_title
    assert_equal "Welcome to the terrordome.\nWe do things differently inside.\nThere is no place to hide.", @root.body
    assert_equal "Project 2", @second_sub_project.parent.title
    assert_equal "This is a really great project", @second_sub_project.parent.sub_title
  end
  
  def test_dirk_accepts_root_override
    assert true
  end
  
  def test_dirk_accepts_prefix_override
    project = Dirk.new("portfolio/project_3", @test_options.merge({:prefix => "^"}) )
    assert_equal "This is project 3", project.title
  end
  
  def test_dirk_returns_slug
    assert_equal "image_1.jpg", Dirk.new(@image_1).slug
  end
  
  def test_dirk_returns_name
    assert_equal "image 1", Dirk.new(@image_1).name
  end
end