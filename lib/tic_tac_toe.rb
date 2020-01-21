  require "pry"
class TicTacToe
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  
  
  def initialize (board = nil)
    @board = Array.new(9, " ")
    @move_count = 0
  
  #def initialize(board = nil)
  #  @board = board || Array.new(9, " ")
  
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(position)
  #binding.pry
    #@position = 
    position.to_i-1
    
  end
  
  def move(position,token)
    #@board[input_to_index(position)] = token
    #binding.pry
    @board[position] = token
  #  move_count+=1
    
  end
  
  def position_taken?(position)
   # binding.pry
    @board[position] != (" ")
   #   TRUE
  #  else
   #   FALSE
  #  end
  end
  
  def valid_move?(position)
    # binding.pry
    position.between?(0,8) && !position_taken?(position)
	
  end
  
  def turn_count
  
    @board.count {|x| x != " "}
    
  end
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  
  def turn
    
    puts "Enter position 1-9?"
    position = gets
    index = input_to_index(position)
    if valid_move?(index)
      move(index,current_player)
      display_board
      #valid_move?(input_to_index(position))
      #move(input_to_index(position),current_player)
    else
      puts "Enter position 1-9?"
      position = gets
    end
  end
  
  def won?
    win_numbers = nil
    WIN_COMBINATIONS.each do |win_comb|
   # binding.pry 
      if (@board[win_comb[0]] == "X" && @board[win_comb[1]] == "X" &&   @board[win_comb[2]] == "X") || (@board[win_comb[0]] == "O" && @board[win_comb[1]] == "O" &&   @board[win_comb[2]] == "O" )  
        win_numbers = win_comb
        break
      end
    end
   win_numbers
      
  end
  
  def full?
  
    @board.all? {|x| x != " "}  # check all fields of the board to make sure none of them are   
                                #   blank
  
  end
    
  def draw?
  
    full? && !won?              # if game is full (no more moves) and not won (no winning 
                                #   combination), return true, else false
  
  end
  
  def over?
    
    won? || draw?               # if game is won or draw, return true - GAME OVER
    
  end
  
  def winner
  
    if won?                     # check if winining combination exist
      @board[won?[0]]           # display any token of winining combination
    else
      nil                       # otherwise show nil
    end
  
  end
  
  def play
    
    while !over? do
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
    
    
  end  
  
  
  
  
  
  
end