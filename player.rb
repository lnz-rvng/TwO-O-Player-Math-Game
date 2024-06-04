class Player
  attr_accessor :name, :lives

  def initialize name
    @name = name
    @lives = 3
  end

  def lose_life
    self.lives -= 1
  end

  def alive?
    self.lives > 0
  end
end
