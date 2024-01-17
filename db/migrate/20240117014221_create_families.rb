class CreateFamilies < ActiveRecord::Migration[7.0]
  def change
    create_table :families do |t|
      t.string :name
      t.string :description
      t.decimal :discount, precision: 10, scale: 2, default: 0
      t.decimal :profit, precision: 10, scale: 2, default: 0

      t.timestamps
    end
  end
end
