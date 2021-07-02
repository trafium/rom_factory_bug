require 'rom/sql/rake_task'
require_relative 'init'
require_relative 'db'

namespace :db do
  task :setup do
    ROM::SQL::RakeSupport.env = DB.configuration
  end

  task :create do
    system "createdb -h #{ENV.fetch('DATABASE_HOST')} #{ENV.fetch('DATABASE_NAME')}"
  end

  task :drop do
    system "psql -h #{ENV.fetch('DATABASE_HOST')} -c \"SELECT pg_terminate_backend (pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = '#{ENV.fetch('DATABASE_NAME')}';\""
    system "dropdb -h #{ENV.fetch('DATABASE_HOST')} #{ENV.fetch('DATABASE_NAME')}"
  end
end
