# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
puts "Cleaning database..."

Ingredient.destroy_all

puts "Adding ingredients to list..."

url = open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients = JSON.parse(url)
list = ingredients["drinks"]

list.each do |i|
  p "Adding #{i['strIngredient1']}"
  Ingredient.create!(name: i['strIngredient1'])
end

p "#{Ingredient.count} added!"
