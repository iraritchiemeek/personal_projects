require 'pp'

# As a user I want to be able to enter my name
# As a user I want to be able to select single player (player vs computer) or two player (Maybe more)
# As a user I want a board to be generated at random with snakes and ladders on it
# As a user when I roll the die I want to move 1-6 places on the board
# As a user when i land on a ladder or snake I want to move up or down the board
# As a user if I am the first to reach the end of the board I want to win

class SnakesAndLadders
  attr_accessor :board

  def initialize
    @start_row = start_row
    @start_column = start_column
    @snake_length = snake_length
  end

  def empty_board
    @board = Array.new(10) { Array.new(10) { ' ' } }
  end

  def start_row
    @start_row = rand(0..8)
  end

  def start_column
    @start_column = rand(0..8)
  end

  def snake_length
    @snake_length = rand(1..6)
  end

  def print_board
    @board.each do |array|
       pp array.join("|")
    end
  end

  def snake
    start_column
    start_row
    snake_length
    @board[@start_row.to_i][@start_column.to_i] = 'S'
      @snake_length.times do
        if @start_row == 9 || @start_column == 9
          break
        else
        @board[@start_row+=1][@start_column+=1] = 's'
        end
      end
  end

  def ladder
    start_column
    start_row
    snake_length
    @board[@start_row.to_i][@start_column.to_i] = 'l'
      @snake_length.times do
        if @start_row == 9 || @start_column == 9
          break
        else
        @board[@start_row+=1][@start_column+=1] = 'L'
        end
      end
  end

end

new_board = SnakesAndLadders.new

new_board.empty_board
new_board.snake
new_board.ladder
new_board.print_board