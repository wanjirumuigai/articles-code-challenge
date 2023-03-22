require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###

sidney = Author.new("Sidney Sheldon")

mag1 = Magazine.new("Drum", "Lifestyle")

article1 = Article.new(sidney, mag1, "Nothing lasts forever")









### DO NOT REMOVE THIS
binding.pry

0
