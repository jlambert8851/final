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
  Integer :rating
  String :comments, text: true
end
DB.create_table! :users do
  primary_key :id
  String :name
  String :email
  String :password
end



# Insert initial (seed) data
books_table = DB.from(:books)
reviews_table = DB.from(:reviews)
users_table = DB.from(:users)

books_table.insert(title: "Dreams of El Dorado", 
                   author: "H. W. Brands",
                   id: 1)

books_table.insert(title: "The Hard Thing About Hard Things", 
                   author: "Ben Horowitz",
                   id: 2)

books_table.insert(title: "Humility is the New Smart", 
                   author: "Hess and Ludwig",
                   id: 3)

books_table.insert(title: "Age of Illusions", 
                   author: "Andrew Bacevich",
                   id: 4)
                   
books_table.insert(title: "Everybody Lies", 
                   author: "Seth Stephens-Davidowitz",
                   id: 5)

books_table.insert(title: "Oryx and Crake", 
                   author: "Margaret Atwood",
                   id: 6)

books_table.insert(title: "Shadow of the Wind", 
                   author: "Carlos Ruiz Zafon",
                   id: 7)

books_table.insert(title: "Submarineer", 
                   author: "John Coote",
                   id: 8)

books_table.insert(title: "Your Strategy Needs a Strategy", 
                   author: "Sinha, Haanaes, and Reeves",
                   id: 9)

reviews_table.insert(book_id: 1,
                    user_id: 1,
                    rating: 5,
                    comments: "The history of the American West, told through individual stories. A must read for anyone who lives in or loves the West."
                    )
reviews_table.insert(book_id: 2,
                    user_id: 1,
                    rating: 4,
                    comments: "Ben Horowitz, now a famous venture capitalist, uses stories from his start up days to share useful business advice."
                    )
reviews_table.insert(book_id: 3,
                    user_id: 1,
                    rating: 2,
                    comments: "The authors decribe how they think AI will drive which skills humans are still valued for. Could have been a three page HBR article."
                    )
reviews_table.insert(book_id: 4,
                    user_id: 1,
                    rating: 3,
                    comments: "Bacevich puts forth a great framework for analyzing the last 30 years of American history, and how they led to our current issues."
                    )
reviews_table.insert(book_id: 5,
                    user_id: 1,
                    rating: 3,
                    comments: "A decent high level overview of big data; somewhat narrowly focused on the author's use of Google search data."
                    )
reviews_table.insert(book_id: 6,
                    user_id: 1,
                    rating: 4,
                    comments: "Great sci-fi with themes of inequality and environmentalism. Super relevant to current events. Starts off slow."
                    )
reviews_table.insert(book_id: 7,
                    user_id: 1,
                    rating: 5,
                    comments: "A coming-of-age story in Franco's Spain. Magical realism and mystery. So captivating I read the last 300 pages in one sitting."
                    )
reviews_table.insert(book_id: 8,
                    user_id: 1,
                    rating: 3,
                    comments: "A Royal Navy submarine officer's experience in the Mediterranean during WWII. Very niche, but if it's your thing you'll love it."
                    )
reviews_table.insert(book_id: 9,
                    user_id: 1,
                    rating: 5,
                    comments: "Great combination of theory with more tangible case studies. Interesting application of the multi-armed bandit problem."
                    )                    
                    
users_table.insert(id: 1,
                    name: "James",
                    password: "test"
                    )          
