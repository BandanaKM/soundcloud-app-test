class AddUserToPlaylists < ActiveRecord::Migration
  def change
    add_reference :playlists, :user, index: true
  end
end
