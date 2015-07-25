require 'capistrano/composer'
require 'capistrano/symfony'

set :repo_url, 'https://github.com/leviferreira/symfony-standard.git'

set :linked_dirs, ['app/cache', 'app/logs']
set :linked_files, ['composer.phar']

SSHKit.config.command_map[:composer] = "php #{shared_path.join("composer.phar")}"
set :composer_install_flags, '--no-dev --no-interaction --prefer-dist --optimize-autoloader'

namespace :deploy do
  before :starting, 'composer:install_executable'
end
