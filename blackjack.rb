#Blackjack
#Kellian P. Valenti

# Interactive command line blackjack game


def calculate_total(cards) 
  # Correct for Face Cards
  arr = cards.map{|e| e[1] }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 # J, Q, K
      total += 10
    else
      total += value.to_i
    end
  end

  #correct for Aces
  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end

# Begin

puts "Welcome to Blackjack!"

suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
deck.shuffle!

# Deal

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)

# Show

puts "Dealer's cards are #{dealercards[0]} and #{dealercards[1]}. His total is #{dealertotal}"
puts "Your cards are: #{mycards[0]} and #{mycards[1]}. Your total of: #{mytotal}"
puts ""

# Player Turn
if mytotal == 21
  puts "Congratulations, you hit blackjack! You win!"
  exit
end

while mytotal < 21
  puts "What would you like to do? 1) Hit 2) Stay"
  hit_or_stay = gets.chomp

  if !['1', '2'].include?(hit_or_stay)
    puts "Error: you must enter 1 or 2"
    next
  end

  if hit_or_stay == "2"
    puts "You chose to stay."
    break
  end

  # Hit
  new_card = deck.pop
  puts "New card dealt to player: #{new_card}"
  mycards << new_card
  mytotal = calculate_total(mycards)
  puts "Your total is: #{mytotal}"

  if mytotal == 21
    puts "Congratulations, you hit blackjack! You win!"
    exit
  elsif mytotal > 21
    puts "Sorry, it looks like you busted!"
    exit
  end
end

# Dealer Turn

if dealertotal == 21
  puts "Sorry, dealer hit blackjack. You lose."
  exit
end

while dealertotal < 17
  #hit
  new_card = deck.pop
  puts "Dealing new card for dealer: #{new_card}"
  dealercards << new_card
  dealertotal = calculate_total(dealercards)
  puts "Dealer total is now: #{dealertotal}"

  if dealertotal == 21
    puts "Sorry, dealer hit blackjack. You lose."
    exit
  elsif dealertotal > 21
    puts "Congratulations, dealer busted! You win!"
    exit
  end
end

# Push

if dealertotal == 21 && mytotal == 21
  puts "Both players hit blackjack. Push."
  exit
end

# Compare hands

puts "Dealer's cards: "
dealercards.each do |card|
  puts "=> #{card}"
end
puts ""

puts "Your cards:"
mycards.each do |card|
  puts "=> #{card}"
end
puts ""

if dealertotal > mytotal
  puts "Dealer wins."
elsif dealertotal < mytotal
  puts "You win!"
else
  puts "Push!"
end

exit
