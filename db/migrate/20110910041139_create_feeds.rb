class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.string :url
      t.string :feed_url
      t.string :author
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :feeds
  end
end
