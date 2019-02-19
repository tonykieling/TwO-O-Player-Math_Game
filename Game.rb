require_relative "Player"
require_relative "Questions"

# class Game responsable for running the game
class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @questions = Questions.new
    @winner = ""
    @actual_player = ""

    start_game
  end


  # this method is called once, when the class Game is instantiated
  def start_game
    puts "game starting now.."
    main
  end


  # main method is gonna do loop because turn will call it until the game's finished
  def main
    @actual_player = @player1 if (@actual_player == "")

    turn
  end


  # only checks whether the game is over checking the player's lives
  def check_game_over
    true if @actual_player.lives == 0
  end

  
  # this is the game's 'kernel' due to have most of logic
  def turn
    question, answer =  @questions.generate_question

    print "#{@actual_player.name}: #{question}\n> "
    user_answer = gets.chomp.to_i
    if user_answer != answer
      puts "#{@actual_player.name}: Seriously? No!"
      @actual_player.lose_live
    else
      puts "#{@actual_player.name}: YES! You are correct."
    end
    
    puts "\tP1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    
    if check_game_over == true
      if @actual_player = @player1
        puts "\n#{@player2.name} wins with a score of #{@player2.lives}/3"
      else
        puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
      end

      puts "----- GAME OVER -----"
      puts "Good bye!"
      exit(0)
    end
    if @actual_player == @player1
      @actual_player = @player2
    else
      @actual_player = @player1
    end

    puts "\n---- NEW TURN -----"
    main
  end

end

# instantiate a game
game = Game.new()
