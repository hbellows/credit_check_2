require './lib/ credit_check'

puts "*" * 50
puts "\n"
puts "Credit Card Validation"
puts "\n"
puts "*" * 50
puts "\n"
puts "Please enter your credit card number here:"
puts "\n"
print "> "

user_input = gets.chomp
card_number = user_input.to_i

credit_check = CreditCheck.new

puts "\n"
puts credit_check.validation_output(card_number)
puts "\n"
puts "*" * 50
