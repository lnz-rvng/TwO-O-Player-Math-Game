require './player'
require './math_questions'

class Game
  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    @current_player = @player1
  end

  def play
    until game_over?
      question = Question.new(@current_player, opposing_player)
      if !question.ask(@current_player)
        @current_player.lose_life
      end
      display_scores
      switch_turns
    end
    announce_winner
  end

  private

  def switch_turns
    @current_player = opposing_player
  end

  def opposing_player
    @current_player == @player1 ? @player2 : @player1
  end

  def display_scores
    puts "Scores: #{@player1.name}: #{@player1.lives} lives, #{@player2.name}: #{@player2.lives} lives"
  end

  def game_over?
    !@player1.alive? || !@player2.alive?
  end

  def announce_winner
    if @player1.alive?
      winner = @player1
      loser = @player2
    else
      winner = @player2
      loser = @player1
    end
    puts "#{winner.name} wins with a score of #{winner.lives}/3. #{loser.name} has been defeated."
    puts "Good Bye!"
  end
end
