class Question
  attr_reader :number1, :number2, :answer

  def initialize(current_player, opposing_player)
    @number1 = prompt_number(opposing_player, "first")
    @number2 = prompt_number(opposing_player, "second")
    @answer = @number1 + @number2
  end

  def ask(current_player)
    puts "#{current_player.name}, what is #{@number1} + #{@number2}?"
    player_answer = gets.chomp.to_i
    if player_answer == @answer
      puts "Correct!"
      true
    else
      puts "Wrong! The correct answer was #{@answer}."
      false
    end
  end

  def prompt_number(player, order)
    loop do
      puts "#{player.name}, please enter the #{order} number between 1 and 20:"
      number = gets.chomp.to_i
      return number if number.between?(1, 20)
      puts "Invalid input. Please enter a number between 1 and 20."
    end
  end
end
