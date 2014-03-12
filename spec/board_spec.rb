require 'board'

describe Board do

  let(:board) do
    player = double :player, {:name => "Fred"}
    Board.new(player)     
  end

  it "should have four one-cell ships on the board" do
    expect(board.rows.flatten.count {|cell| cell == 's'}).to eq(4)
  end

  it "should be a grid of 10x10 cells" do
    expect(board.rows.count).to eq(10)
    all_rows_have_10_elements = board.rows.all? {|row| row.length == 10 }
    expect(all_rows_have_10_elements).to be_true
  end

  it "should know the player's name" do
    expect(board.owner).to eq("Fred")
  end

  it "should be able to register a shot (a miss)" do
    x, y = [2, 3]
    board.rows[x][y] = '' # to make sure it is empty
    expect(board.rows[x][y]).to eq('') # now it is a blank cell
    board.register_shot([x, y])
    expect(board.rows[x][y]).to eq('o') # a miss, because there it was empty
  end

end