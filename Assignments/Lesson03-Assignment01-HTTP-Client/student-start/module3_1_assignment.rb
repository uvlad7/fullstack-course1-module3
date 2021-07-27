require 'httparty'
require 'addressable'

class Recipe
  include HTTParty
  base_uri "https://edamam-recipe-search.p.rapidapi.com/search"
  headers 'X-RapidAPI-Key' => ENV['RAPIDAPI_KEY'], 'X-RapidAPI-Host' => 'edamam-recipe-search.p.rapidapi.com'
  default_params from: '0', to: '10'
  format :json
  # API doesn't work when there is '/' before '?'
  # so we should move search to path or use addressable to parse empty path
  uri_adapter Addressable::URI

  def self.for (keyword)
    get("", query: {q: keyword})['hits']
  end
end
