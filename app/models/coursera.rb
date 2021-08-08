class Coursera
  include HTTParty

  base_uri 'https://api.coursera.org/api/courses.v1'
  default_params fields: "photoUrl,description", q: "search"
  format :json

  def self.for term
    # presence just to simulate old api behavior
    get("", query: { query: term})["elements"].presence
  end
end
