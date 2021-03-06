class Genre
	attr_accessor :name, :songs, :artists

	@@all = []
	def initialize
		@name
		@songs = []
		@artists = []
		@@all << self if @@all.include?(self) == false
	end

	def artists
		songs.collect{|song| song.artist}.uniq
	end

	# CLASS METHODS
	def self.all
		@@all
	end

  def self.detect(genre_name)
    @@all.detect do |genre|
      genre.name == genre_name
    end
  end

  def self.find_or_create(genre_name)
    detect(genre_name) || Genre.new.tap {|g| g.name = genre_name}
  end

  def self.count
  	@@all.count
  end

	def self.reset_genres
		@@all.clear
	end

end
