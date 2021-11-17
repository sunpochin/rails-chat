class User < ApplicationRecord
  validates :username, uniqueness: { case_sensitive: false}, presence: true, length: {minimum: 3,  maximum: 50 }
  has_many :messages
  has_secure_password
end
