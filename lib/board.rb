class Board

  attr_reader :rows

  def initialize(player)
    @player = player
    @rows = Array.new(10) { Array.new(10) { '' } }
    place_ships
  end

  def place_ships
    while ship_count < 4
      place_1_cell_ship
    end
  end

  def place_1_cell_ship
    begin
      x, y = rand(10), rand(10)
      is_empty = @rows[x][y] == ''
      @rows[x][y] = 's' if is_empty
    end while !is_empty
  end

  def ship_count
    @rows.flatten.count {|cell| cell == 's'}
  end

  def register_shot(at_coordinates)
    x, y = at_coordinates
    @rows[x][y] = 'o'
    "whatever"
  end

  def owner
    @player.name
  end

end