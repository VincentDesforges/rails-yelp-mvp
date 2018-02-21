# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

puts 'Creating restaurants and reviews...'

5.times do
  restaurants_attributes = {
    name:           Faker::Hobbit.character,
    address:        Faker::Hobbit.location,
    phone_number:   Faker::PhoneNumber.cell_phone,
    category:       ["chinese", "italian", "japanese", "french", "belgian"].sample
  }
  restaurant = Restaurant.new(restaurants_attributes)
  restaurant.save

  10.times do
    review_attributes = {
      content:        Faker::Beer.name,
      restaurant_id:  restaurant.id,
      rating:         [0, 1, 2, 3, 4, 5].sample
    }
    review = Review.new(review_attributes)
    review.save
  end
end

puts 'Finished!'

# puts 'Creating restaurants...'
# restaurants_attributes = [
#   {
#     name:           'Dishoom',
#     address:        '7 Boundary St, London E2 7JE',
#     phone_number:   '+447123456789',
#     category:       'chinese'
#   },
#   {
#     name:           'Pizza East',
#     address:        '56A Shoreditch High St, London E1 6PQ',
#     phone_number:   '+447111111111',
#     category:       'italian'
#   },
#   {
#     name:           'Sushi Shop',
#     address:        'London street, London',
#     phone_number:   '+447222222222',
#     category:       'japanese'
#   }
# ]
# Restaurant.create!(restaurants_attributes)

# dishoom = Restaurant.where(name: "Dishoom").first
# # p dishoom.id

# puts 'Creating reviews...'
# reviews_attributes = [
#   {
#     content:        'Really great place, friendly staff',
#     restaurant_id:  dishoom.id,
#     rating:         5
#   },
#   {
#     content:        'Horrific, almost died when I ate the soup...',
#     restaurant_id:  dishoom.id,
#     rating:         1
#   }
# ]

# Review.create!(reviews_attributes)
# puts 'Finished!'
