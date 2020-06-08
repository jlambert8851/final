# Set up for the application and database. DO NOT CHANGE. #############################
require "sequel"                                                                      #
connection_string = ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite3"  #
DB = Sequel.connect(connection_string)                                                #
#######################################################################################

# Database schema - this should reflect your domain model
DB.create_table! :books do
  primary_key :id
  String :title
  String :author
end
DB.create_table! :reviews do
  primary_key :id
  foreign_key :book_id
  foreign_key :user_id
  Numeric :rating
  String :comments, text: true
end
DB.create_table! :users do
  primary_key :id
  foreign_key :event_id
  Boolean :going
  String :username
  String :password
end



# Insert initial (seed) data
books_table = DB.from(:books)
reviews_table = DB.from(:reviews)

books_table.insert(title: "War and Peace", 
                   author: "Some Russian Guy")

books_table.insert(title: "Fight Club", 
                   author: "Chuckie P")
