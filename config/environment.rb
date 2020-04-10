require 'bundler'
require 'sqlite3'
require_relative '../lib/queries'
require_relative '../db/seed'
Bundler.require

# Setup a DB connection here
DB = {:conn => SQLite3::Database.new("db/daily_show.db")}