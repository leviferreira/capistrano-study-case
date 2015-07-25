ask :branch, 'master'

set :application, proc { fetch(:stage).split(':').reverse[1] }

set :current_stage, proc { fetch(:stage).split(':').last }

set :deploy_to, proc { "/data/deploy/#{fetch(:application)}/#{fetch(:current_stage)}" }

set :scm, :git

set :linked_files, []

set :linked_dirs, []

set :default_env, { path: "$PATH" }

set :keep_releases, 5

set :format, :pretty

set :log_level, :info

set :pty, true
