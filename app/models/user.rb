class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true, length: {minimum: 3,  maximum: 50 }
  has_secure_password
end
