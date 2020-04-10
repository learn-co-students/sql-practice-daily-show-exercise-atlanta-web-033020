# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances
  sql = <<-SQL
    SELECT guest FROM daily_show
    GROUP BY guest
    ORDER BY COUNT(guest) DESC
  SQL
  DB[:conn].execute(sql).first.first
end

def most_popular_prof_each_year
  sql = <<-SQL
    SELECT year, occupation FROM daily_show
    GROUP BY year
    ORDER BY year
  SQL
  DB[:conn].execute(sql)
end

def most_overall_profession
  sql = <<-SQL
    SELECT occupation FROM daily_show
    GROUP BY occupation
    ORDER BY COUNT(occupation) DESC
  SQL
  DB[:conn].execute(sql).first.first
end

def how_many_first_name_bill
  sql = <<-SQL
    SELECT COUNT(guest_first_name) FROM daily_show
    WHERE guest_first_name = "Bill"
  SQL
  DB[:conn].execute(sql).first.first
end

def patrick_stewart_dates
  sql = <<-SQL
    SELECT show FROM daily_show
    WHERE guest = "Patrick Stewart"
  SQL
  DB[:conn].execute(sql).flatten
end

def year_most_guests
  sql = <<-SQL
    SELECT year FROM daily_show
    GROUP BY year
    ORDER BY COUNT(year) DESC
  SQL
  DB[:conn].execute(sql).first.first
end

def most_pop_group_by_year
  sql = <<-SQL
    SELECT year, prof_group FROM daily_show
    GROUP BY year
    ORDER BY prof_group
  SQL
  DB[:conn].execute(sql)
end