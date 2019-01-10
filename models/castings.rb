require_relative('../db/sql_runner')

class Casting

  attr_accessor(:movie_id, :star_id, :fee)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id']
    @star_id = options['star_id']
    @fee = options['fee']
  end

  def save
    sql = "INSERT INTO castings (movie_id, star_id, fee)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@movie_id, @star_id, @fee]
    casting = SqlRunner.run(sql, values).first
    @id = casting['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM castings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE castings SET (fee) = ($1) WHERE id = $2"
    values = [@fee, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM castings"
    values = []
    castings = SqlRunner.run(sql, values)
    result = castings.map {|casting| Casting.new(casting)}
    return result
  end


end
