source "https://rubygems.org"

gem 'rake'
gem 'foodcritic'
gem 'emeril'

# allow CI to override the version of Chef for matrix testing
gem 'chef', (ENV['CHEF_VERSION'] || '>= 0.10.10')

group :integration do
  gem 'berkshelf'
  gem 'test-kitchen',    '~> 1.0.0.alpha.6'
  gem 'kitchen-vagrant'
end
