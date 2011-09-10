class Feed < ActiveRecord::Base

  def self.retrieve_contents
    Feed.all.each do |feed|
      feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)
      feed.entries.each do |entry|
        puts "Retrieving #{feed.title}, #{entry.title}..."
        begin
          BlogPost.create(:title => entry.title,
                          :body => entry.content.sanitize,
                          :custom_teaser => entry.summary, 
                          :tag_list => entry.categories.join(','),
                          :custom_url => entry.url,
                          :draft => false,
                          :published_at => entry.published)
        rescue
          logger.error "Feed entry failed - #{entry.title}"
        end
      end
    end
  end

end
