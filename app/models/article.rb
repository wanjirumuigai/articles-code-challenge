class Article
attr_reader :author, :magazine, :title

@@all = []

    def initialize(author, magazine, title)

        if author.is_a?(Author) && magazine.is_a?(Magazine)
        @author = author
        @magazine = magazine
        @title = title
        @@all = self
        end

    end

    def title
        @title
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

end
