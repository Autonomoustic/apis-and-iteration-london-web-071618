#!/usr/bin/env ruby

#require_relative "../lib/api_communicator.rb"
#require_relative "../lib/command_line_interface.rb"

#welcome
#character = get_character_from_user
#show_character_movies(character)

require 'rest-client'

require 'JSON'

character_data = RestClient.get('http://swapi.co/api/people/1')

JSON.parse(character_data)
