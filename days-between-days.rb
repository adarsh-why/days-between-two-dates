def add_one year, month, date
	return year, month, date+1 if(date < month_days(month,year))
	return year, month+1, 1 if month < 12
	return year+1, 1, 1		
end

def number_of_days y1, m1, d1, y2, m2, d2
	days = 0 
	until [y2, m2, d1] == [y1, m1, d2]
		days += 1
		y1, m1, d1 = add_one y1, m1, d1
	end
	return days
end

def month_days month, year
	case month
		when 1, 3, 5, 7, 8, 11, 12
		return 31

		when 4, 6, 9, 10 
		return 30

		when 2
			if is_leap_year year
				return 29
			else
				return 28
			end
	end
end

def is_leap_year year
	checker = year % 400
	return true if checker == 0
	if checker % 100 != 0 and checker % 4 == 0
		return true
	else
		return false
	end
end

p number_of_days 1947, 8, 15, 2016, 3, 2      # 25037
