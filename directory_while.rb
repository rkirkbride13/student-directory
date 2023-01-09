def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    accumulator = 0
    while accumulator < students.count
      puts "#{(students[accumulator])[:name]}, #{(students[accumulator])[:age]} (#{(students[accumulator])[:cohort]} cohort)"
      accumulator += 1
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great student#{students.count == 1 ? "" : "s"}"
end

def input_students
    puts "Please enter the name, cohort and age"
    puts "To finish, hit return after number of students is reported"
    # create an empty array
    students = []
    # get the first name
    puts "Name?"
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        puts "Cohort?"
        cohort = gets.chomp
        cohort.empty? ? cohort = :November : cohort.to_sym
        puts "Age?"
        age = gets.chomp
        # add the student hash to the array
        students << {name: name, cohort: cohort, age: age}
        puts "Now we have #{students.count} student#{students.count == 1 ? "" : "s"}"
        puts "Name?"
        name = gets.chomp
    end
    # return the array of students
    students
end

students = input_students
print_header
print(students)
#print_groups(students)
print_footer(students)