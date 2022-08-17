class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  # takes a dev (an instance of the Dev class), an item_name (string), and a value as arguments, and creates a new Freebie instance associated with this company and the given dev

  def give_freebie(dev_inst, new_item_name, new_value)
    # dev_inst => Dev.first, or the WHOLE instance of a Dev
    # new freebie args, will just be a string and an integer
    # binding.pry

    Freebie.create(item_name: new_item_name, value: new_value, dev_id: dev_inst.id, company_id: self.id)

    # self.freebies.create(item_name: new_item_name, value: new_value, dev: dev_inst)

    # dev_inst.freebies.create(item_name: new_item_name, value: new_value, company: self)
  end

  # Company.oldest_company
  # returns the Company instance with the earliest founding year

  def self.oldest_company
    Company.order(:founding_year).first
    # Company.all.sort_by { |c| c.founding_year }[0]
    binding.pry
    
  end

end
