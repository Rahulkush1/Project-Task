class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :category
      t.string :image
      t.decimal :rating
      t.integer :count

      t.timestamps
    end
  end
end
