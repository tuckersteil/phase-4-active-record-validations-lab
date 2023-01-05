class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
   
    validate :clickbait

    def clickbait
        if title.to_s.include?("Won't Believe")
             true
        elsif title.to_s.include?( "Secret")
             true
        elsif title.to_s.include?("Top #{0..100}")
            true
        elsif title.to_s.include?("Guess")
             true
        else
            errors.add(:title, "not clickbait")
        end
     end

     
     

end
