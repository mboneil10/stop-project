# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'stop-project'
set :repo_url, 'git@github.com:umts/stop-project.git'
set :branch, :master
set :deploy_to, "/srv/#{fetch :application}"
set :log_level, :info
set :scm, :git
set :keep_releases, 5

set :linked_files, fetch(:linked_files, []).push(
  'config/database.yml'
)

set :linked_dirs, fetch(:linked_dirs, []).push(
  'log'
)
