source 'https://rubygems.org'

# ############################
# Core
# ############################
gem 'rails', '4.0.2'
gem 'thin'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :production do 
  gem 'mysql2'
end

# ############################
# Interface
# ############################
group :assets do
  gem 'sass-rails', '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'therubyracer', platforms: :ruby
end
gem 'jquery-rails'
gem 'jquery-ui-rails','~> 4.2.1'
gem 'haml'
gem 'haml-rails'
gem 'execjs'

# ############################
# Testing
# ############################
group :development, :test do
  gem 'rspec-rails'
  gem "factory_girl_rails"
  gem "guard-rspec"
  gem "capybara"
  gem "faker"
  gem 'rb-fsevent'
  gem 'growl'  
  gem 'database_cleaner'
  gem 'launchy'
  gem 'poltergeist'
  gem 'spork'
  gem 'guard-spork'
  gem 'sqlite3'
end

# ############################
# Utilities
# ############################
group :development do 
  gem 'meta_request'
  gem 'pry-rails'
  gem 'rails-erd'
  gem "better_errors"
  gem "binding_of_caller"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end