desc "Get daily feeds..."
task :cron => :environment do
  Feed.retrieve_contents
end