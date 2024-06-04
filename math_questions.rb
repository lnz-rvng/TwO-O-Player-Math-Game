class Question
  attr_reader :num1, :num2, :answer

  # initializing
  def initialize(current_player, opposing_player)
    @num1 = what_number?(opposing_player, "first")
    @num2 = what_number?(opposing_player, "second")
    @correct_answer = @num1 + @num2
  end

  # asking the current player for the answer on the given equation
  def ask(current_player)
    puts "#{current_player.name}, what is #{@num1} + #{@num2}?"
    player_answer = gets.chomp.to_i # convert the answer to an integer using the to_i method
    if player_answer == @correct_answer # checking if the player's answer is correct
      puts "Correct!"
      true
    else
      puts "Wrong! The correct answer was #{@correct_answer}."
      false
    end
  end

  # prompts the player what number to put in the equation
  def what_number?(player, order)
    loop do
      puts "#{player.name}, please enter the #{order} number between 1 and 20:"
      number = gets.chomp.to_i
      return number if number.between?(1, 20) # checking if the number is between 1 and 20
      puts "Invalid input. Please enter a number between 1 and 20."
    end
  end
end
