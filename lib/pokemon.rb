class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
    # @id = id
    # @name = name
    # @type = type
    # @db = db
  end
  
 def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  

    def self.find(num, db)
    poke_id = db.execute("SELECT * FROM pokemon WHERE id=?", num).flatten
    Pokemon.new(id: poke_id[0], name: poke_id[1], type: poke_id[2], hp: poke_id[3], db: db)
  end
end
