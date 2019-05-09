require 'rails/generators'

module Semantic
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc 'Overwrite Rails scaffold templates with Semantic UI based templates'
      source_root ::File.expand_path('../templates', __FILE__)

      class_option :template_engine, type: :string, default: 'erb', aliases: '-t', desc: 'Set template engine to generate the views with'
      # Boolean flags that can be flagged by adding to the generator call ie: --pagination or --metag_tags
      class_option :layout, type: :boolean, default: false, aliases: "-l", desc: 'Over-write your application layout file with a Semantic UI based layout'
      class_option :metatags, type: :boolean, default: false, aliases: "-m", desc: 'If views will assign pages title using metatags gem'
      class_option :pagination, type: :boolean, default: false, aliases: '-p', desc: 'Toggle if pagination will be used with the index view/controller (based off of Pagy)'
      class_option :simpleform, type: :boolean, default: false, aliases: '-sf', desc: 'Enable SimpleForms for the form generating'

      def copy_scaffold_views
        %w[edit index show new].each do |file|
          template "scaffolds/#{options[:template_engine]}/#{file}.html.#{options[:template_engine]}", "lib/templates/#{options[:template_engine]}/scaffold/#{file}.html.#{options[:template_engine]}", force: true
        end
        copy_file "scaffolds/#{options[:template_engine]}/_form.html.#{options[:template_engine]}", "lib/templates/#{options[:template_engine]}/scaffold/_form.html.#{options[:template_engine]}", force: true
      end

      def create_layout
        template("layouts/application.html.#{options[:template_engine]}.tt", "app/views/layouts/application.html.#{options[:template_engine]}", force: true) if options[:layout]
      end

      def copy_flash_messages
        copy_file 'shared/_messages.html.erb', 'app/views/shared/_messages.html.erb', force: true
      end

      def copy_shared_pagination
        copy_file("shared/_pagination.html.#{options[:template_engine]}", "app/views/shared/_pagination.html.#{options[:template_engine]}", force: true) if options[:pagination]
      end

      def copy_simpleforms
        if options[:simpleform]
          copy_file 'initializers/simple_form.rb', 'config/initializers/simple_form.rb', force: true
          copy_file "simple_form/_form.html.#{options[:template_engine]}", "lib/templates/#{options[:template_engine]}/scaffold/_form.html.#{options[:template_engine]}", force: true
        end
      end

      def inject_helpers
        helper_str = <<-HELPER

  # For generating SemanitcUI based flash[:notices]
  def flash_class(level)
    case level
    when 'success'
      'positive'
    when 'error'
      'negative'
    when 'alert'
      'negative'
    when 'notice'
      'info'
    else
      'info'
    end
  end
HELPER
        inject_into_file 'app/helpers/application_helper.rb', helper_str, after: "module ApplicationHelper\n", force: true
      end
    end
  end
end
