class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def genre_name
    self.genre.name if self.genre
  end

  def note_contents=(note_contents_array)
    note_contents_array.each do |note_contents|
      if note_contents != ""
        note = Note.create(content: note_contents)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end
end
