# tic_tac_toe.rb

# Accepts hash of cell values - possible values are [x, o, nil]
def print_board(positions)  # positions is a hash
  clear_screen
  puts
  puts " #{positions[:a]}  | #{positions[:b]}  | #{positions[:c]} "
  puts "----+----+----"
  puts " #{positions[:d]}  | #{positions[:e]}  | #{positions[:f]}   "
  puts "----+----+----"
  puts " #{positions[:g]}  | #{positions[:h]}  | #{positions[:i]}   "
  puts
end

# Method to determine winner -- if there is a winner, returns true and who won, if no winner, returns false only
def board_has_win?(positions)
  # x's
  if## Check for win ################################################
    # Check for horizontal wins
    (positions[:a] == positions[:b] and positions[:b] == positions[:c] and positions[:a] != " ") or
    (positions[:d] == positions[:e] and positions[:e] == positions[:f] and positions[:d] != " ") or
    (positions[:g] == positions[:h] and positions[:h] == positions[:i] and positions[:g] != " ") or

    # Check for vertical wins
    (positions[:a] == positions[:d] and positions[:d] == positions[:g] and positions[:a] != " ") or
    (positions[:b] == positions[:e] and positions[:e] == positions[:h] and positions[:b] != " ") or
    (positions[:c] == positions[:f] and positions[:f] == positions[:i] and positions[:c] != " ") or

    # Check for diagonal wins
    (positions[:a] == positions[:e] and positions[:e] == positions[:i] and positions[:a] != " ") or
    (positions[:g] == positions[:e] and positions[:e] == positions[:c] and positions[:g] != " ")
    # End conditional ########################################################

    # Determine who won -- if x won, he will have one more move than o. If o won, he will have the same amount of moves as x.
    num_of_x = 0
    num_of_o = 0

    positions.each do |k,v|
      if v == "x"
        num_of_x += 1
      elsif v == "o"
        num_of_o += 1
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

# Check the positions hash -- if all values are filled (not ""), then board is full, end game
# Returns true or false
def board_has_empty_spaces?(positions)
  if positions.has_value?(" ")
    # Board still has empty cells
    true
  else
    false
  end
end

# Returns input and user_wants_to_quit_bool --
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

# Outputs comp's move
def comp_picks_move(positions)
  possible_moves = positions.select do |k,v|
    v != "x" and v != "o"
  end

  # Turn hash into array of possible moves
  possible_moves = possible_moves.keys
  comp_move = possible_moves.shuffle[0]
end

def clear_screen
  system 'clear'
end

# Returns User picked position and user_wants_to_quit_bool
def ask_user_to_pick_move(positions)
  # Ask User for next position
  # Check for acceptable input
  acceptable_input = %w( a b c d e f g h i)
  input = " "
  while positions[input.to_sym] != " " and acceptable_input.include?(input) and (positions[input.to_sym] != "x" or positions[input.to_sym] != "o") or positions[input.to_sym] == nil
    input, user_wants_to_quit_bool = raw_input "Choose move (a - i)"
  end

  input = input.to_sym

  return input, user_wants_to_quit_bool
end

# Returns continue_game_bool
def check_for_winner_and_filled_board(positions)

  there_is_a_win_bool, who_won = board_has_win?(positions)
  if there_is_a_win_bool
    puts "#{who_won} has won! Thanks for playing!"
    continue_game_bool = false
    return continue_game_bool
  end

  if board_has_empty_spaces?(positions)
  else
    puts "Board is full, game is a tie"
    continue_game_bool = false
    return continue_game_bool
  end

end

def check_that_user_wants_to_quit(user_wants_to_quit_bool)
  if user_wants_to_quit_bool
    exit
  end
end
### Start program #####################################################
positions = Hash.new(" ")
positions = {
              a: " ", b: " ", c: " ",
              d: " ", e: " ", f: " ",
              g: " ", h: " ", i: " "
}

continue_game_bool = true
correct_input_bool = false
user_wants_to_quit_bool = false
there_are_moves_available_bool = true
there_is_a_winner_bool = false

begin
  puts "Welcome to Tic Tac Toe!\nAt anytime, enter \"q\" to quit\n\n"

  # Ask User to choose shape to play
  correct_input = %w( x o q)
  input = ""
  while !correct_input.include?(input)
    input, user_wants_to_quit_bool = raw_input "Choose x or o"
  end

  check_that_user_wants_to_quit(user_wants_to_quit_bool)

  # Set which shape the User and Comp have chosen
  if input == "x"
    user_is = :x
    comp_is = :o
  else
    user_is = :o
    comp_is = :x
  end

  # Check whether user is x or o
  if user_is == :x
    # User go first

    # Play game until there are no moves left or there is a winner
    while there_are_moves_available_bool == true or there_is_a_winner_bool == false
      print_board(positions)
      cell_user_picked, user_wants_to_quit_bool = ask_user_to_pick_move(positions)
      positions[cell_user_picked] = "x"
      print_board(positions)
      continue_game_bool = check_for_winner_and_filled_board(positions)

      if continue_game_bool == false
        break
      end

      positions[comp_picks_move(positions)] = "o"
      print_board(positions)
      continue_game_bool = check_for_winner_and_filled_board(positions)

      if continue_game_bool == false
        break
      end

    end
  else
    # Comp goes first
    # Play game until there are no moves left or there is a winner
    while there_are_moves_available_bool == true or there_is_a_winner_bool == false
      positions[comp_picks_move(positions)] = "x"

      print_board(positions)

      continue_game_bool = check_for_winner_and_filled_board(positions)

      if continue_game_bool == false
        break
      end

      cell_user_picked, user_wants_to_quit_bool = ask_user_to_pick_move(positions)
      positions[cell_user_picked] = "o"

      print_board(positions)

      continue_game_bool = check_for_winner_and_filled_board(positions)

      if continue_game_bool == false
        break
      end

    end
  end

end until continue_game_bool == false or user_wants_to_quit_bool == true
