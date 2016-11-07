class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :number
      t.string :title
      t.string :composer

      t.timestamps null: false
    end
  end
end
