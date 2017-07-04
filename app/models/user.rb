class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  def display_name
    self.email.split("@").first
  end
  # likes
  has_many :likes, :dependent => :destroy
  has_many :liked_posts, :through => :likes, :source => :post
  # collect
  has_many :collects, :dependent => :destroy
  has_many :collected_posts, :through => :collects, :source => :post

  
end
