class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room_number)
    @rooms << room_number
  end

  def above_market_average?
    @price.delete("$").to_i > 500000
  end

  def rooms_from_category(type)
    @rooms.find_all do |room|
     room.category == type
    end
  end
end
