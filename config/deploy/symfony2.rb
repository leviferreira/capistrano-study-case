
set :repo_url, 'https://github.com/leviferreira/symfony-standard.git'

set :linked_dirs, ['app/logs', 'app/cache', 'vendor']
set :linked_files, ['composer.phar']

SSHKit.config.command_map[:composer] = "php #{shared_path.join("composer.phar")}"
set :composer_install_flags, '--prefer-dist --no-interaction  --optimize-autoloader'

namespace :deploy do
  before :starting, 'composer:install_executable'
end

#namespace :symfony do
#  before :create_cache_dir, 'cache_permission'

#  task :cache_permission do
#    on roles(:web), in: :parallel do
#      execute "chmod -R 777 #{current_path}/app/cache"
#    end
#  end
#end
