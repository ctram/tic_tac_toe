# Summary: create tic tac toe game. Game continues until someone wins or the board is filled.

# xODO: 1 - Create method to print the board
# TODO: 2 - Method to check whether someone has won.
# TODO: 3 - Method to check whether anyone else can move.

=begin ########################################################################
  Logic:
    TODO: 1 - User picks whether they want to play as X or O
          TODO: a - X gets to go first
    TODO: 2 - Ask user where they want to go.
    TODO: 3 - Update board with user's choice.
    TODO: 4 - Check whether anyone has won.
    TODO: 5 - Check whether anyone else can move. If not, end game.
    TODO: 6 - Let user press continue to show computer's choice
    TODO: 7 - Computer picks a place to move (randomly)
    TODO: 8 - User agrees to update board.
    TODO: 9 - Check whether anyone has won.
    TODO: 10 - Update board.
=end ##########################################################################
# Accepts hash of cell values - possible values are [x, o, nil]
def print_board(positions)
  puts
  puts " #{positions[:a]} | #{positions[:b]} | #{positions[:c]} "
  puts "---+---+---"
  puts " #{positions[:d]}  | #{positions[:e]}  | #{positions[:f]}   "
  puts "---+---+---"
  puts " #{positions[:g]}  | #{positions[:h]}   | #{positions[:i]}   "
  puts
end

def check_for_win?
  return bool
end

def check_for_board_empty_spaces?
  return bool
end

def raw_input msg
  puts msg
  gets.chomp
end

def reset_correct_input
  correct_input? = false
end

### Start program ############################################################

continue_game? = true
x_or_o = {user: "", comp: ""}   # Hash holding which player is x and o
correct_input? = false

begin
  puts "Welcome to Tic Tac Toe!"


  while correct_input? == false
    input = raw_input "Choose x or o"
    if input == "x" or input == "o"
      correct_input? = true
    end
  end

  reset_correct_input

  if input == "x"
    x_or_o[:user] = "x"
    x_or_o[:comp] = "o"
  else
    x_or_o[:user] = "o"
    x_or_o[:comp] = "x"
  end





  

end until continue_game? == false
