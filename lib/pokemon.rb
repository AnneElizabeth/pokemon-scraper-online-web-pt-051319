class Pokemon

    #gives capability to read/write attributes
    attr_accessor :id, :name, :type, :db
 
    #each time a pokemon is initialized it will have the following attributes

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    #class method / ?? = placeholders and then pass in variables as values of those placeholders
    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES(?, ?);", name, type)
    end

    def self.find(id, db)
        #find pokemon by id
        #return new pokemon object

        found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten #makes nested array into one-dimensional array
        Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db) #setting attributes to values from returned array
    end

    #instance method, already aware of pokemon object that's been created, being called on that instance
    #def alter_hp(new_hp, db)
       # db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", new_hp, self.id)
    #end

    
end
