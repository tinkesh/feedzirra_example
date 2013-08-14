require 'feedzirra'

# fetching a single feed
feed = Feedzirra::Feed.fetch_and_parse("http://feeds.feedburner.com/PaulDixExplainsNothing")


# feed and entries accessors
puts feed.title          
puts feed.url           
puts feed.feed_url       
puts feed.etag          
puts feed.last_modified  

feed_size =  feed.entries.size 

feed.entries.each { |entry| puts entry.title }

=begin
puts entry = feed.entries.first
puts entry.title      
puts entry.url       
puts entry.author     
puts entry.summary    
puts entry.content    
puts entry.published  
puts entry.categories 
=end

puts "updating the feed"

# updating a single feed
updated_feed = Feedzirra::Feed.update(feed)

# an updated feed has the following extra accessors
puts updated_feed.updated?     # returns true if any of the feed attributes have been modified. will return false if only new entries
puts updated_feed.new_entries  # a collection of the entry objects that are newer than the latest in the feed before update

