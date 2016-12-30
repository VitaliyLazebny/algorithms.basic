class Matrix
  attr_accessor :matrix, :x, :y, :n
    
  # -  -  -  -  -  -  -  -  -  -  -  -  -
  # Actually this is solution for task
  #
  # we have 2 dimensial array
  # we have coordinates X, Y
  #
  # what we do:
  #   print value at current coordinates
  #   remove current value
  #   move to next coordinate with some value
  #   if no values - stop execution
  def output
    loop do
      print current, ' '
      
      delete_current
      
      case
      when right && !top
        move_right
      when bottom
        move_bottom
      when left
        move_left
      when top
        move_top
      else
        break
      end # end of case
      
    end # end of loop
    
  end # end of def output
  
  # -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
  
  # initialize matrix and coordinates
  def initialize(matrix = [[  1,  2,  3,  4],
                           [ 12, 13, 14,  5], 
                           [ 11, 16, 15,  6], 
                           [ 10,  9,  8,  7]])

    @matrix = matrix
    @x      = 0 
    @y      = 0
    @n      = matrix[0].size - 1 # matrix edge size 
  end
  
  #  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
  # Get Array from STDIN
  def Matrix.get_from_imput
    n = gets.to_i
    
    arr = Array.new(n) do
      gets.split(' ')
    end
    
    self.new(arr)
  end

  
  # -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
  # left, right, top, bottom, current - will return value of corresponding
  #                                     coordinate
  # if there's no value - nil will be returned (nil same as empty)
  def right
    @matrix[@y][@x+1] if @matrix[@y] && @x < n
  end

  def left
    @matrix[@y][@x-1] if @matrix[@y] && @x > 0
  end

  def top
    @matrix[@y-1][@x] if @matrix[@y-1] && @y > 0
  end

  def bottom
    @matrix[@y+1][@x] if @matrix[@y+1] && @y < @n
  end

  def current
    @matrix[@y][@x]   if @matrix[@y]
  end
  
  # -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
  # move_* methods used to change coordinate
  def move_right
    fail if @x == @n
    
    @x += 1 
  end

  def move_left
    fail if @x == 0
    
    @x -= 1 
  end

  def move_top
    fail if @y == 0
    
    @y -= 1 
  end

  def move_bottom
    fail if @y == @n
    
    @y += 1 
  end
  
  # -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
  # delete current value to prevent secondary output
  def delete_current
    @matrix[@y][@x] = nil
  end
  
end

# - create instance
m = Matrix.get_from_imput

# execute output algorithm
m.output
