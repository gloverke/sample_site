# This migration comes from simple_chat (originally 20140911160619)
class CreateSimpleChatRooms < ActiveRecord::Migration
  def change
    create_table :simple_chat_rooms do |t|
      t.string :name
      t.integer :user_id
      t.boolean :is_public

      t.timestamps
    end
  end
end
