WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [0, 4, 8]
  ]
  
  
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end 
  
  
def input_to_index(user_input)
  user_input = user_input.to_i - 1 
end 
  
  
def move(board, index, token)
  board[index] = token
end 
  
  
def position_taken?(board, index)
  !(board[index] == " " || board[index].nil?)
end 
      
    
def valid_move?(board, index)
  position_taken?(board, index) == false && index.between?(0, 8)
end
    
    
def turn(board)
  puts "What is your move? Choose 1-9."
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
    else 
      turn(board)
  end
end 
    
    
def turn_count(board)
  board.count do |turns|
    turns != " "
  end 
end 


def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else 
    "O"
  end 
end 


def won?(board)
  WIN_COMBINATIONS.detect do |combos|
    position_taken?(board, combos[0]) &&
    board[combos[0]] == board[combos[1]] &&
    board[combos[1]] == board[combos[2]]
  end 
end 
    
    
def full?(board)
  board.all? do |check|
    check != " "
  end 
end 


def draw?(board)
  !won?(board) && full?(board)
end 


def over?(board)
  won?(board) || draw?(board) || full?(board)
end 


def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end 
end 


def play(board)
  until over?(board) do
    current_player(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end 
end 
    
    
    
