require_relative('models/castings')
require_relative('models/stars')
require_relative('models/movies')
require('pry')

Star.delete_all()
Movie.delete_all()

movie1 = Movie.new(
  {
    'title' => 'Lord of The Rings',
    'genre' => 'epic fantasy'
  }
)

movie1.save()

star1 = Star.new(
  {
    'first_name' => 'Ian',
    'last_name' => 'McKellen'
  }
)

star1.save()

# casting1 = Casting.new(
#   {
#     'movie_id' => movie1.id,
#     'star_id' => star1.id,
#     'fee' => 100
#   }
# )
#
# casting1.save()

binding.pry
nil
