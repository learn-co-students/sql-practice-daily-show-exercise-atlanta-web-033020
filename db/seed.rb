require 'csv'
require 'pry'

def read_csv(path)
    CSV.read(path)
end

def drop_table
    sql = <<-SQL
        DROP TABLE IF EXISTS daily_show
    SQL
    DB[:conn].execute(sql)
end

def create_table
    sql = <<-SQL
        CREATE TABLE IF NOT EXISTS daily_show (
            id INTEGER PRIMARY KEY,
            year INTEGER,
            occupation TEXT,
            show TEXT,
            prof_group TEXT,
            guest TEXT,
            guest_first_name TEXT,
            guest_last_name TEXT
        )
    SQL
    DB[:conn].execute(sql)
end

def insert_data(data)
    data.each do |row|
        first_name = row[4].split(' ').first
        last_name = row[4].split(' ').last
        sql = <<-SQL
            INSERT INTO daily_show (year, occupation, show, prof_group, guest, guest_first_name, guest_last_name)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        SQL
        DB[:conn].execute(sql, row[0], row[1], row[2], row[3], row[4], first_name, last_name)
    end
end

def load_db
    drop_table
    table = read_csv('./daily_show_guests.csv')
    create_table
    insert_data(table.drop(1))
end