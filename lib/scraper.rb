require 'open-uri'
require 'pry'

class Scraper

 def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))   # scrapes the student index page 
    students = []          #empty array for students 

    page.css("div.student-card").each do |student| # when inspecting the website, notice that each student has their own student card 
      name = student.css(".student-name").text  #sets the variable name to the inspected name 
      location = student.css(".student-location").text  #sets location to the inspected location
      profile_url = student.css("a").attribute("href").value   # sets the profile_url to the a attribute and href value
      student_info = {:name => name,    # sets the info for the student_info
                :location => location,
                :profile_url => profile_url}
      students << student_info       # pushes the student_info into the students array 
      end
    students   # returns 
   end

  def self.scrape_profile_page(profile_url)
    page = Nokogiri::HTML(open(profile_url))
    student = {}

    container = page.css(".social-icon-container a").collect{|icon| icon.attribute("href").value}
    container.each do |link|
      if link.include?("twitter")
        student[:twitter] = link
      elsif link.include?("linkedin")
        student[:linkedin] = link
      elsif link.include?("github")
        student[:github] = link
      elsif link.include?(".com")
        student[:blog] = link
      end
    end

  end

end



# - build a class that is responsible for scraping data from a web page 
# - build a class that uses that data to instantiate new objects
# - Understand the contents of a third class that is responsible for the command line interface
# - Use meta-programming to instantiate new instances of a class and add attributes to instances of a class.