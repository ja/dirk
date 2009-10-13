# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dirk}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Andrews"]
  s.date = %q{2009-10-13}
  s.email = %q{me@jamesandre.ws}
  s.files = ["test/fixtures", "test/fixtures/data", "test/fixtures/data/_attributes.txt", "test/fixtures/data/about", "test/fixtures/data/news", "test/fixtures/data/news/_2009-04-36.txt", "test/fixtures/data/portfolio", "test/fixtures/data/portfolio/project_1", "test/fixtures/data/portfolio/project_1/_attributes.txt", "test/fixtures/data/portfolio/project_1/sub-project_1", "test/fixtures/data/portfolio/project_1/sub-project_1/_attributes.txt", "test/fixtures/data/portfolio/project_1/sub-project_2", "test/fixtures/data/portfolio/project_1/sub-project_2/_attributes.txt", "test/fixtures/data/portfolio/project_1/sub-project_3", "test/fixtures/data/portfolio/project_1/sub-project_3/_attributes.txt", "test/fixtures/data/portfolio/project_2", "test/fixtures/data/portfolio/project_2/_attributes.txt", "test/fixtures/data/portfolio/project_2/_file_attributes.txt", "test/fixtures/data/portfolio/project_2/image_1.jpg", "test/fixtures/data/portfolio/project_2/image_2.jpg", "test/fixtures/data/portfolio/project_2/sub-project_1", "test/fixtures/data/portfolio/project_2/sub-project_1/_attributes.txt", "test/fixtures/data/portfolio/project_2/sub-project_2", "test/fixtures/data/portfolio/project_2/sub-project_2/broken_image_1.jpg", "test/fixtures/data/portfolio/project_3", "test/fixtures/data/portfolio/project_3/^attributes.txt", "test/test_dirk.rb", "lib/dirk.rb", "lib/processes", "lib/processes/read_file.rb"]
  s.homepage = %q{http://jamesandre.ws}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{dirk}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Makes your file system act as a database}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
