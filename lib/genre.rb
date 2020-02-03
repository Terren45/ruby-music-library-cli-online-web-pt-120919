class Genre
  Concerns::Findable
  
  attr_accessor :name, :songs
   
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    song.genre = self if song.genre == nil
    self.songs << song if self.songs.include?(song) == false
  end
  
   def artists
    self.songs.collect{|song|song.artist}.uniq
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save 
    @@all << self
  end
  
  def self.create(genre_name)
    self.new(genre_name)
  end
end