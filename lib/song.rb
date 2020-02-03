class Song 
 # Concerns::Findable
  attr_accessor :name, :artist, :genre
 
  @@all = []
 
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
    save
  end
  
  def self.create(name)
    instance = Song.new(name)
    instance.save
    instance
  end
  
  def artist
    @artist
   end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
 
 def genre
    @genre
  end
  
  def genre=(genre)
    @genre = genre
     self.genre.add_song(self)
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save 
    @@all << self
  end
  
  def self.create(name)
    self.new(name)
  end
  
  def self.find_by_name(song_name)
    self.all.find {|song|song.name == song_name}
  end
end