require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  target_character = character_hash['results'].find do |result|
    result['name'] == character
  end
  target_character['films']
end


def parse_character_movies(films_hash)
  films_hash.map do |film|
    film_info = RestClient.get(film)
    film_info = JSON.parse(film_info)
    film_info['title']
  end

  # some iteration magic and puts out the movies in a nice list
end


def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

show_character_movies("Luke Skywalker")
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
