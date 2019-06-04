class User < ApplicationRecord
    validates :email, presence: true
    validates :name, presence: true
    validates :auth_token, presence: true
    has_many :posts
end
