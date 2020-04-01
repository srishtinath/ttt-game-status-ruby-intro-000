# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
  value_1 = board[win_combination[0]]
  value_2 = board[win_combination[1]]
  value_3 = board[win_combination[2]]

  if (win_combination.all? {|detail| position_taken?(board, detail)} && ((value_1 == "X" && value_2 == "X" && value_3 == "X") || (value_1 == "O" && value_2 == "O" && value_3 == "O")))
      return win_combination

    end #close if statement


  end #close do..end iteration outside

end # close def
# need to figure out empty board and draw

def full?(board)
  board.all? do |value|
    value == "X" || value == "O"
  end
end

def draw?(board)
  if full?(board) && (won?(board) == false)
    return true
  elsif won?(board) == false
    return false
  else
    return false
  end

end

def over?(board)
  if won?(board) != false
    return true
  elsif draw?(board)
    return true
  else
    return false
  end

end

def winner(board)
  if draw?(board)
    return nil
  elsif over?(board)
    return board[won?(board)[0]]
  else
    return nil
  end

end
