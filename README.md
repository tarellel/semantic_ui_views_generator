# Semantic-UI Views Generator

![](https://ruby-gem-downloads-badge.herokuapp.com/semantic_ui_views_generator?type=total)  [![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT) [![Gem Version](https://badge.fury.io/rb/semantic_ui_views_generator.svg)](https://badge.fury.io/rb/semantic_ui_views_generator)

This gem is used for generating semantic based scaffold views for your Rails application. They can be Erb, Slim, or HAML. You can include pagination (using Pagy), simple_form (for the form components), and if you'd like you can utilize the meta-tags gems to all dynamic page titles when switching between your view components.

This is more or less a sister project of the [bootstrap_views_generator](https://github.com/tarellel/bootstrap_views_generator) gem, but for those who prefer to use Semantic UI.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'semantic_ui_views_generator', group: :development

# Before continuing make sure you have the semantic-ui-sass gem installed and included in your application.scss file
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'

# application.scss
@import 'semantic-ui';

```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install semantic_ui_views_generator

## Usage

```shell
Usage:
  rails g semantic:install [options]

Options:
Options:
-t, [--template-engine=TEMPLATE_ENGINE]     # Indicates when to generate using a designated template engine (erb, slim, haml)
                                            # Default: erb
--simpleform                                # Indicates if simple_form is to be used to generate the forms
                                            # Default: false
--pagination                                # Specify if you want to add pagination to the index pages
                                            # Defaults: false (requires Pagy to use pagination)
--metatags                                  # If you want the pages titles to use the meta-tags gem function for the page title
                                            # Default: false
--layout                                    # Over-write your application layout file with a Semantic UI based layout
                                            # Default: false
--devise                                    # If you want to generate semantic based devise views
                                            # Default: false
--skip_javascript                           # If you want to skip adding javascript_include_tag || javascript_pack_tag to the layouts
                                            # Default: false
--skip_turbolinks                           # Do you want to skip associating turbolinks with the assets and views
                                            # Default: false
```

## Options

##### Template Engines

Supported Template Engines

* ERB
* HAML
* Slim

**HAML**

Make sure you have haml added to your your Gemfile
```ruby
gem 'haml-rails'

# generate haml views
rails g semantic:install --template_engine=haml
```

**Slim**
Make sure you have Slim added to your Gemfile
```ruby
gem 'slim-rails'

# generate Slim views
rails g semantic:install --template_engine=slim
```

#### Pagination

Ensure you have [Pagy](https://github.com/ddnexus/pagy) gem installed
```ruby
gem 'pagy'

# Make sure you have the semantic-ui pagy helper included
# config/initializers/pagy.rb
require 'pagy/extras/semantic'
```


#### Meta-Tags
Ensure you have the [meta-tags](https://github.com/kpumuk/meta-tags) gem installed
```ruby
gem 'meta-tags'
```

### Examples

Generate semantic views with pagination enabled
```shell
rails g semantic:install --pagination
```

Generate semantic views with slim and using simple_form
```shell
rails g semantic:install --template_engine=slim --simpleform
```

Generate semantic scaffolds, devise views, while using simpleform, metatags, and slim template engine.
```shell
 rails g semantic:install --devise --simpleform --metatags --template_engine=slim
```

### Extras

* If you like to use the [meta-tags](https://github.com/kpumuk/meta-tags) gem to add page titles based on the views.
* Pagination defaults to using [Pagy](https://github.com/ddnexus/pagy) on the index pages.
* With [simple_form](https://github.com/plataformatec/simple_form) it generates a `config/initializers/simple_form.rb` file for your simple_form formatting.
