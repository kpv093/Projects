# Calculator
#Kellian P. Valenti

puts " What's the first number?"
num1 = gets.chomp

puts " What's the second number?"
num2 = gets.chomp

puts "What operation would you like to perform? 1) add 2) subtract 3) multiple 4) divide"
operator = gets.chomp

result = nil

if operator == '1'
	result = num1.to_i + num2.to_i
elsif operator == '2'
	result = num1.to_i - num2.to_i
elsif operator == '3'
	result = num1.to_i * num2.to_i
elsif operator == '4'
	result = num1.to_f / num2.to_f
end

puts "The result is #{result}"