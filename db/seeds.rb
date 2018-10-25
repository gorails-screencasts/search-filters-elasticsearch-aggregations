# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brands  = 1.upto(10).map{ FFaker::Product.brand }
display = ["LCD", "LED", "QLED"]
sizes   = [42, 50, 55, 60, 65, 75, 80, 85]

Television.delete_all

ApplicationRecord.transaction do
  1000.times do
    Television.create(
      brand: brands.sample,
      name:  FFaker::Lorem.word,
      display: display.sample,
      price: rand(200..4000),
      size: sizes.sample,
      year: rand(2010..2019),
    )
  end
end

Television.reindex
