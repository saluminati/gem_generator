require 'thor'

class GemGenerator < Thor::Group
  include Thor::Actions
  
  # Define arguments and options
  argument :name
  class_option :use_rspec_suit, :default => :false
  class_option :use_rubocop, :default => :false

  # Define the generator's root folder
  def self.source_root
    File.dirname(__FILE__)
  end
  
  def make_gem_folder
    empty_directory(name)
  end

  
  # Create our gem's gemspec
  def create_gem_config_files
    template("templates/template.gemspec.tt", "#{name}/#{name}.gemspec")
    template("templates/Gemfile", "#{name}/Gemfile")
    template("templates/README.md.tt", "#{name}/README.md")
    template("templates/.gitignore", "#{name}/.gitignore")
  end

  
  # Create our gem's lib folder
  def create_lib_and_namespace_folder
    empty_directory("#{name}/lib")
    empty_directory("#{name}/lib/#{name}")
  end
  
  # Create our gem's main file
  def crear_main_files
    template("templates/main.rb.tt", "#{name}/lib/#{name}.rb")
    template("templates/version.rb.tt", "#{name}/lib/#{name}/version.rb")
  end

  def create_rspec_suit
    return unless options[:use_rspec_suit] == 'true'

    empty_directory("#{name}/spec")
    empty_directory("#{name}/spec/lib/#{name}")
    template("templates/spec/main_spec.rb.tt", "#{name}/spec/lib/#{name}_spec.rb")
    template("templates/spec/spec_helper.rb.tt", "#{name}/spec/lib/spec_helper.rb")
  end
  
end