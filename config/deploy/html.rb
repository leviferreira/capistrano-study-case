set :repo_url, 'git@bitbucket.org:leviferreira/leviferreira.com.git'

Rake::Task['deploy:updated'].prerequisites.delete('composer:install')