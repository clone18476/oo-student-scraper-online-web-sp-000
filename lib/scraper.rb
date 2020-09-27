require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    # - should use Nokogiri and open-uri to access the index_url
    # - reutrn value should be an array of hashes in which each hash represents a single student
    # - The keys of the individual student hashes should be :name, :location and :profile_url.

  end

  def self.scrape_profile_page(profile_url)
    
  end

end



# - build a class that is responsible for scraping data from a web page 
# - build a class that uses that data to instantiate new objects
# - Understand the contents of a third class that is responsible for the command line interface
# - Use meta-programming to instantiate new instances of a class and add attributes to instances of a class.