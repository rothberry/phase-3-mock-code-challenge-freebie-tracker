class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  #   Dev#received_one?(item_name)
  # accepts an item_name (string) and returns true if any of the freebies associated with the dev has that item_name, otherwise returns false

  def received_one?(check_item)

    # self.freebies.find_by(item_name: check_item) ? true : false
    !!self.freebies.find_by(item_name: check_item)

    # self.freebies.where(item_name: check_item).length > 0

    # !self.freebies.where(item_name: check_item).empty?
  end

  # Dev#give_away(dev, freebie)
  # accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev; your code should only make the change if the freebie belongs to the dev who's giving it away

  def give_away(new_dev, freebie_inst)
    if self.received_one?(freebie_inst.item_name)
      freebie_inst.update(dev: new_dev)
    else
      puts "Nice try...."
    end
  end
end
