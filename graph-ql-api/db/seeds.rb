# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.delete_all
Book.delete_all
Author.delete_all

User.create(name: 'A')
User.create(name: 'B')
User.create(name: 'C')
User.create(name: 'D')

Author.create(first_name: 'A', last_name: 'a')
Author.create(first_name: 'B', last_name: 'b')
Author.create(first_name: 'C', last_name: 'c')
Author.create(first_name: 'D', last_name: 'd')

Book.create(name: 'A', price: 10, author: Author.first)
Book.create(name: 'B', price: 20, author: Author.second)
Book.create(name: 'C', price: 30, author: Author.third)
Book.create(name: 'D', price: 40, author: Author.first)
Book.create(name: 'E', price: 40, author: Author.second)
Book.create(name: 'F', price: 40, author: Author.first)

puts 'Data Seeded'
