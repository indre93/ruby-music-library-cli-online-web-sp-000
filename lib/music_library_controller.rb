class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    loop do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      gets.chomp

      if gets.chomp == "exit"
        break
      end
    end
  end

  def list_songs
   counter = 0
   array = Song.all.sort_by {|song| song.name}
   array.uniq.each do |song|
     puts "#{counter += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end
 end

  def list_artists
    counter = 0
    sorted = Artist.all.sort_by {|artist| artist.name}
    sorted.each do |artist|
      puts "#{counter += 1}. " + artist.name
    end
  end

  def list_genres
    counter = 0
    sorted = Genre.all.sort_by {|genre| genre.name}
    sorted.each do |genre|
      puts "#{counter += 1}. " + genre.name
    end
  end

  def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artit = gets.chomp
      Song.find_by_name(artist)
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    gets.chomp
  end

  def play_song
    puts "Which song number would you like to play?"
    gets.chomp
  end

end
