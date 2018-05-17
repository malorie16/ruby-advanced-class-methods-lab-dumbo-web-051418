require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  puts "writing on the class, self is: #{self}"



  def self.all
    @@all
  end

  def save
    puts "writing in the instance method, self is: #{self}"
    self.class.all << self
  end

  def self.create
    puts "writing in the class method, self is: #{self}"
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    first = file.split(" - ")
    second = first[1].split(".")
    # binding.pry
    if first[-1].include?("mp3")
      song = self.new
      song.artist_name = first[0]
      song.name = second[0]
      song
    end
  end
#Pry.start
  def self.destroy_all
    self.all.clear
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end
end
