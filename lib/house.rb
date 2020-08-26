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

  def area
    rooms_area = @rooms.map do |room|
     room.area
    end
    rooms_area.sum
  end

  def price_per_square_foot
    (@price.delete("$").to_f / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    rooms_area = @rooms.map do |room|
     room.area.sort
    end
  end

  def rooms_by_category
   rooms_from_category = {}
    @rooms.each do |room|
     rooms_from_category[room.category] = rooms_from_category(room.category)
    end
  end
end
