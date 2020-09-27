require 'open-uri'
require 'pry'

class Scraper

 def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))   # scrapes the student index page 
    students = []

    page.css("div.student-card").each do |student|
      binding.pry
      name = student.css(".student-name").text
      location = student.css(".student-location").text
      profile_url = student.css("a").attribute("href").value
      student_info = {:name => name,
                :location => location,
                :profile_url => profile_url}
      students << student_info
      end
    students   # returns 
   end

  def self.scrape_profile_page(profile_url)
      page = Nokogiri::HTML(open(profile_url))
      student = {}
  end

end



# - build a class that is responsible for scraping data from a web page 
# - build a class that uses that data to instantiate new objects
# - Understand the contents of a third class that is responsible for the command line interface
# - Use meta-programming to instantiate new instances of a class and add attributes to instances of a class.