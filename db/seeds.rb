# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

8.times do 
  department = Department.create(
    name: Faker::Commerce.department(1)
    )

    20.times do
      department.items.create(
        name: Faker::Commerce.product_name,
        price: Faker::Number.decimal(2)
      )
    end
end

puts 'seeded'