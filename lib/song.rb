require "pry"
class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
      @@all << self
    end 
    

    def self.all
        @@all
    end 

    def self.new_by_filename(file_name)
        artist_info = file_name.split(" - ")
        artist_name = artist_info[0]
        song_name = artist_info[1]
        song_genre = artist_info[2]

        new_song = Song.new(song_name)
        artist = Artist.find_or_create_by_name(artist_name)

        new_song.artist = artist
    # new_song.genre = song_genre
        #binding.pry
        new_song
    end

    def artist_name=(artist)
        Artist.find_or_create_by_name(artist).add_song(self)
    end

end