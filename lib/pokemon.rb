require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, dbc)
    dbc.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, dbc)
    result = dbc.execute("SELECT * FROM pokemon WHERE id = #{id}")
    poke = Pokemon.new(id: result[0][0], name: result[0][1], type: result[0][2], db: dbc)
    poke
  end
end
