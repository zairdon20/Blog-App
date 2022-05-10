class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
  
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
  
    after_save :update_counter
  
    def update_counter
      author.increment!(:posts_counter)
    end
  
    def recent_comments
      comments.order(created_at: :desc).limit(5)
    end
  end
