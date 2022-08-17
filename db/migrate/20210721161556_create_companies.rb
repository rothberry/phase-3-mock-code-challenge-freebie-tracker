class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      # company => companies
      t.string :name
      t.integer :founding_year
    end
  end
end
