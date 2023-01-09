require 'csv'
@students = [] # an empty array accessible to all methods
@filename = "" # an empty string accessible to all methods

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
      # add the student hash to the array
      push_students_to_hash(name)
      puts "Now we have #{@students.count} students"
      name = STDIN.gets.chomp
  end
end

def push_students_to_hash(name, cohort = :november)
  @students << {name: name, cohort: cohort}
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_students_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great students", ""
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit", ""
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    try_load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again", ""
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  puts "What file do you want to save to?"
  filename = "#{STDIN.gets.chomp}.csv"
  CSV.open("./#{filename}", "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
end

def load_students
  CSV.foreach("./#{@filename}") do |line|
    name, cohort = line
    push_students_to_hash(name, cohort)
  end
end

def try_load_students
  @filename = ARGV.first # the first argument from the command line
  if @filename.nil?
    puts "What file do you want to load?" 
    @filename = "#{STDIN.gets.chomp}.csv"
  end
  file_exist?(@filename) ? load_students : interactive_menu
end

def file_exist?(filename)
  if File.exist?(filename)
    puts "Loaded #{filename}", ""
    true
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist.", ""
    false
  end
end

try_load_students
interactive_menu