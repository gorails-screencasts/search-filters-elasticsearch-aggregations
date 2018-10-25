class CreateTelevisions < ActiveRecord::Migration[5.2]
  def change
    create_table :televisions do |t|
      t.string :brand
      t.string :name
      t.string :display
      t.float :price
      t.integer :size
      t.integer :year

      t.timestamps
    end
  end
end
