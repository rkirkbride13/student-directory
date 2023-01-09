def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_letter(students)
    puts "Enter letter of students to print (hit enter if printing all)"
    letter_to_print = gets.chomp
    if letter_to_print.empty?
      students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    else
      students.each_with_index do |student, index|
        if (student[:name])[0].upcase == letter_to_print.upcase
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
        end
      end
    end
end

def print_length(students)
  puts "Enter min length of names to print (hit enter if printing all)"
  length_to_print = gets.chomp
  if length_to_print.empty?
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  else
    students.each_with_index do |student, index|
      if student[:name].length >= length_to_print.to_i
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

def input_students
    puts "Please enter the name of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end
    # return the array of students
    students
end

students = input_students
print_header
puts "Filter by name length or name letter?"
length_or_letter = gets.chomp
length_or_letter == "length" ? print_length(students) : print_letter(students)
print_footer(students)