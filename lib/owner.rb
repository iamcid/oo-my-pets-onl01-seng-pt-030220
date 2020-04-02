class Owner
  attr_accessor :pets
  attr_reader :name, :species
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @pets = { :cats => [], :dogs => []}
    @@all << self
  end
  
  def say_species
    @species = "I am a human."
  end
  
  def cats
    Cat.all.select do |cats| 
      cats.owner == self
    end
  end
  
  def buy_cat(name)
     @pets[:cats] << Cat.new(name, self)
  end
  
  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end
  
  def buy_dog(name)
    @pets[:dogs] << Dog.new(name, self)
  end
  
  def walk_dogs 
    @pets[:dogs].each{|d| d.mood = "happy"}
  end 
  
  def feed_cats
    @pets[:cats].each{|c| c.mood = "happy"}
  end
  
  def sell_pets
    
  end

  
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end