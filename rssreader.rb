require 'rss'
require 'open-uri'

# Extracts feed from given url
def extract_feed(url)
  URI.open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    return feed
  end
end

# Method to print feed items to consple if needed
def print_feed_items(feed)
  puts "Title: #{feed.channel.title}"
  feed.items.each do |item|
    puts "Item: #{item.title}"
  end
end

url = 'https://www.ruby-lang.org/en/feeds/news.rss'
feed = extract_feed(url)
print_feed_items(feed)
