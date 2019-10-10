class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 20 }
    validates :email, presence: true
    has_secure_password
    validates :password, length: { minimum: 6 }
    validates_confirmation_of :password,
                          if: lambda { |m| m.password.present? }
end
