# Summary: create tic tac toe game. Game continues until someone wins or the board is filled.

# xODO: 1 - Create method to print the board
# TODO: 2 - Method to check whether someone has won.
# TODO: 3 - Method to check whether anyone else can move.

=begin ########################################################################
  Logic:
    xODO: 1 - User picks whether they want to play as X or O
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
def print_board(positions)  # positions is a hash
  puts
  puts " #{positions[:a]}  | #{positions[:b]}  | #{positions[:c]} "
  puts "---+---+---"
  puts " #{positions[:d]}  | #{positions[:e]}  | #{positions[:f]}   "
  puts "---+---+---"
  puts " #{positions[:g]}  | #{positions[:h]}  | #{positions[:i]}   "
  puts
end

# xODO: Method to determine winner -- if there is winner, returns true and who won, if no winner, returns false only
def board_has_win?(positions)
  # x's
  if## Check for win ################################################
    # Check for horizontal wins
    positions[:a] == positions[:b] == positions[:c] or
    positions[:d] == positions[:e] == positions[:f] or
    positions[:g] == positions[:h] == positions[:i] or

    # Check for vertical wins
    positions[:a] == positions[:d] == positions[:g] or
    positions[:b] == positions[:e] == positions[:h] or
    positions[:c] == positions[:f] == positions[:i] or

    # Check for diagonal wins
    positions[:a] == positions[:e] == positions[:i] or
    positions[:g] == positions[:e] == positions[:c]
    # End conditional ################################

    # Determine who won -- if x won, he will have one more move than o. If o won, he will have the same amount of moves as x.

    num_of_x = 0
    num_of_o = 0
    positions.each do |cell|
      if cell == "x" ? num_x += 1 : num_of_o += 1
      end
    end

    if num_of_x > num_of_o
      # x won
      return true, :x
    else
      # o won
      return true, :o
    end
  else
    # No winner yet
    false
  end
end

# xODO: Check the positions hash -- if all values are filled (not ""), then board is full, end game
def board_has_empty_spaces?(positions)
  if positions.has_value?(" ")
    # Board still has empty cells
    true
  else
    false
  end
end

def raw_input(msg)
  puts msg
  print ">> "
  input = gets.chomp
  if input.downcase == "q"
    return input, true
  else
    return input, false
  end
end

def reset_correct_input(input)
  input = false
end

### Start program ############################################################
positions = {
              a: "", b: "", c: "",
              d: "", e: "", f: "",
              g: "", h: "", i: ""
}

continue_game_bool = true
correct_input_bool = false
player_wants_to_quit_bool = false
moves_available_bool = true
is_a_winner_bool = false

begin
  puts "Welcome to Tic Tac Toe!\nAt anytime, enter \"q\" to quit\n\n"

  while correct_input_bool == false
    input, player_wants_to_quit_bool = raw_input "Choose x or o"
    if input == "x" or input == "o"
      correct_input_bool = true
    end
  end

  reset_correct_input(correct_input_bool)

  if input == "x"
    user_is = "x"
    comp_is = "o"
  else
    user_is = "o"
    comp_is = "x"
  end

  # Play game until there are no moves left or there is a winner
  while moves_available_bool == true or is_a_winner_bool == false
    print_board(positions)

    moves_available = false

  end


end until continue_game_bool == false or player_wants_to_quit_bool == true
