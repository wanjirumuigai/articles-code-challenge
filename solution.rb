# Please copy/paste all three classes into this file to submit your solution!
#Author Class
class Author
    attr_reader :name
  
  
    def initialize(name:)
      @name = name
    end
  
    def articles
      Article.all.select { |article| article.author == self }
    end
  
    def magazines
      author_mags = []
      Article.all.select do |article| 
        if article.author == self
          author_mags << article.magazine
        end
      end
      author_mags.uniq
    end
  
    def add_article(magazine:, title:)
      Article.new(author: self, magazine: magazine, title: title)
    end
  
    def topic_areas
      author_categories = []
      Article.all.select do |article|
        if article.author == self
          author_categories << article.magazine.category
        end
      end
      author_categories.uniq
    end
    
  end

  #Article Class
  class Article
    attr_reader :author, :magazine, :title

    @@all = []

    def initialize(author:, magazine:, title:)

        if author.is_a?(Author) && magazine.is_a?(Magazine)
            @author = author
            @magazine = magazine
            @title = title
            @@all << self
        else
            begin
                raise WrongClassError
            rescue WrongClassError => error
                puts error.message
            end
        end
    end

    def self.all
        @@all
    end

    def author
        @author
    end

    def magazine
        
        @magazine
    end

    class WrongClassError < StandardError
        def message
            "Check the data types of the Author and/or Magazine"
        end
    end
end

#Magazine Class
class Magazine
    attr_accessor :name, :category
  
  @@all = []
    def initialize(name:, category:)
      @name = name
      @category = category
      @@all << self
  
    end
  
    def name
      @name
    end
  
    def category
      @category
    end
  
    def self.all
      @@all
    end
  
    def contributors
      mag_contributors = []
      Article.all.select do |article|
        if article.magazine.name == @name
          mag_contributors << article.author
        end
      end
      mag_contributors.uniq
    end
   def self.find_by_name(name)
    
    @@all.find {|mag| mag.name == name}
   end
  end
  

