require 'httparty'
require 'pp'

class Coursera
  include HTTParty

  base_uri 'https://api.coursera.org/api/courses.v1'
  default_params fields: "photoUrl,description", q: "search"
  format :json

  def self.for term
    get("", query: { query: term})["elements"]
  end
end

pp Coursera.for "python"

