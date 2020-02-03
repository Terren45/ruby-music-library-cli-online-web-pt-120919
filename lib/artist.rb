class Artist 
  extend Concerns::Findable
   attr_accessor :name, :songs

  @@all = []
 
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def genres
    self.songs.map {|song|song.genre}.uniq
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
  
  def self.create(artist)
    self.new(artist)
  end
  
  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    
    if !@songs.include?(song)
      @songs << song
    end
  
  end
end