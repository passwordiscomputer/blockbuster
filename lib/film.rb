class Film
 attr_accessor(:title, :synopsis, :rental_id, :film_id)

 def initialize(attributes)
   @title = attributes.fetch(:title)
   @synopsis = attributes.fetch(:synopsis)
   @rental_id = attributes.fetch(:rental_id)
   @film_id = attributes.fetch(:film_id)
 end

  def self.all
    returned_films = DB.exec("SELECT * FROM film")
    films = []
    returned_films.each do |item|
      title = item.fetch("title")
      synopsis = item.fetch("synopsis")
      rental_id = item.fetch("rental_id").to_i
      film_id = item.fetch("film_id").to_i
      filmss.push(Film.new({:title => title, :synopsis => synopsis, :rental_id => rental_id, :film_id => film_id}))
      end
    films
  end

 def save
   DB.exec("INSERT INTO film (title, synopsis, rental_id) VALUES ('#{@title}', '#{@synopsis}', #{@rental_id});")
   result = DB.exec("SELECT film_id FROM film WHERE title = '#{@title}' AND synopsis = '#{@synopsis}';")
    @film_id = result[0].fetch('film_id').to_i
 end

  def ==(another_film)
    self.title.==(another_film.title).&(self.synopsis.==(another_film.synopsis)).&(self.film_id.==(another_film.film_id))
  end
end
