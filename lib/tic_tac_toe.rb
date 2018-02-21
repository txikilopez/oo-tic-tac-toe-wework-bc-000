class TicTacToe
  WIN_COMBINATIONS =  [
  [0,1,2], #row 1
  [3,4,5], #row 2
  [6,7,8], #row 3
  [2,4,6], #diagonal 2
  [0,4,8], #diagonal 1
  [0,3,6], #column 1
  [1,4,7], #column 2
  [2,5,8], #column 3
  ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  #GITGHUB
  #Position Taken
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  #Play
  def play
    until over?
      turn
    end
    if won?
      puts("Congratulations " + winner + "!")
    else
      puts("Cat's Game!")
    end
  end
  
    
  #FULL BOARD CODE
  def full?
    !(@board.any? {|slot| slot == " " || slot == ""})
  end
  
  
  #WON CODE
  def won?
    
    winning_move = nil
    
    WIN_COMBINATIONS.each do |move_win|
      position_1 = move_win[0]
      position_2 = move_win[1]
      position_3 = move_win[2]
      
      if @board[position_1] == "X" && @board[position_2] == "X" && @board[position_3] == "X"
        winning_move = move_win
      elsif @board[position_1] == "O" && @board[position_2] == "O" && @board[position_3] == "O"
        winning_move = move_win
      end
    end
    winning_move
  end
  
  
  #DRAW CODE
  def draw?
    full? && !won?
  end
  
  #OVER CODE
  def over?
    won? || draw? || full?  || turn_count == 9
  end
  
  
  #WINNER CODE
  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end
  
  
  #turn count
  def turn_count
    @board.count{|x| x !=" "}
  end
  
  
  # Turn
  def turn
    puts("Please enter 1-9:")
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index) == true
      move(index, token)
      display_board
    else
      turn
    end
  end
  
  
  #Move
  def move(index, character = "X")
    @board[index] = current_player
  end
  
  #input to index
  def input_to_index(input)
    @index = input.to_i - 1
  end
  
  
  #Valid Move?
  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
        true
    else
      false
    end
  end
  
  
end