
# Players class, which holds info about the players
class Player

  attr_reader :name, :lives
  attr_accessor :lose_live

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_live
    @lives -= 1
  end

  def check_lives
    @lives
  end

end

