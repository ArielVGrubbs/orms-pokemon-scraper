class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize (pokemon_hash)
        @id = pokemon_hash[:id]
        @name = pokemon_hash[:name]
        @type = pokemon_hash[:type]
        @db = pokemon_hash[:db]
    end

    def self.save (name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)       
    end

    def self.find (id, db)
        pk_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        pk_hash = {id: pk_array[0][0], name: pk_array[0][1], type: pk_array[0][2], db: db}
        # binding.pry
        Pokemon.new(pk_hash)
    end
end
