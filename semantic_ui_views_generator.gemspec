
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'semantic_ui_views_generator/version'

Gem::Specification.new do |spec|
  spec.name          = 'semantic_ui_views_generator'
  spec.version       = SemanticUiViewsGenerator::VERSION
  spec.authors       = ['Brandon Hicks']
  spec.email         = ['tarellel@gmail.com']

  spec.summary       = %q{Semantic UI generators for overwriting the default Rails view generators}
  spec.description   = %q{A Rails based generator for creating Semantic UI Views/layouts for for your application}
  spec.homepage      = 'https://github.com/tarellel/semantic_ui_views_generator'
  spec.license       = 'MIT'

  spec.required_ruby_version     = '>= 2.2.2'
  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = spec.homepage
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  # spec.files         = Dir.glob("{bin,lib}/**/*")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'railties', '>= 4.0', '<= 7'
  spec.add_development_dependency 'bundler', '>= 1.17', '<= 3'
  spec.add_development_dependency 'rake', '>= 10.0'
end
