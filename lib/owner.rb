require 'pry'
class Owner
  @@all = []
  attr_accessor :name, :pets
  def initialize(name)
    @name = name
    @@all << self
    @pets = {fishes: [], dogs: [], cats: []}
  end
  def self.all
    @@all
  end
  def self.reset_all
    self.all.clear
  end
  def self.count
    self.all.count
  end
  def species
    "human"
  end
  def say_species
    "I am a human."
  end
  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end
  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end
  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end
  def walk_dogs
    @pets[:dogs].collect do |dog|
      dog.mood = "happy"
    end
  end
  def play_with_cats
    @pets[:cats].collect do |cat|
      cat.mood = "happy"
    end
  end
  def feed_fish
    @pets[:fishes].collect do |fish|
      fish.mood = "happy"
    end
  end
  def sell_pets
    @pets.each do |type, pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets.clear
  end
  def list_pets
    fish_string = ""
    cat_string = ""
    dog_string = ""
    @pets.each do |type, pets| # :cats, :dogs, :fishes
      if type == :cats
        if pets.size > 1
          cat_string = "#{pets.size} #{type.to_s}"
        else
          cat_string = "1 cat."
        end
      elsif type == :dogs
        if pets.size > 1
          dog_string = "#{pets.size} #{type.to_s}"
        else
          dog_string = "1 dog."
        end
      elsif type == :fishes
        fish_string = "#{pets.size} fish."
      end
    end
    "I have #{fish_string}, #{dog_string}, and #{cat_string}."
  end
end
