class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications


  def self.first_five
    self.all.limit(5)
  end

  def self.dinghy
    self.all.where("length < 20")
  end

  def self.ship
    self.all.where("length >= 20")
  end

  def self.last_three_alphabetically
    # self.all.order(name: :desc).first(3) => this is an Array class
    self.all.order(name: :desc).limit(3) #=> this is a Boat::ActiveRecord_Relation class
  end

  def self.without_a_captain
    self.all.where(captain_id: nil)
  end

  def self.sailboats
    binding.pry
  end


end
