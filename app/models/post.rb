class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user

# likes
  has_many :likes, dependent: :destroy
  has_many :liked_users, :through => :likes, :source => :user
# :index => true
def find_like(user)
  self.likes.where(:user_id => user.id).first
end

end
