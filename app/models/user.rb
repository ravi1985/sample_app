class User < ApplicationRecord
    before_save { self.email = email.downcase }
    before_create :create_remember_token
    validates :name, presence: true, length: { maximum: 20 }
    validates :email, presence: true
    has_secure_password
    validates :password, length: { minimum: 6 }
    validates_confirmation_of :password,
                          if: lambda { |m| m.password.present? }
    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end
    
    def User.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
    end
                       
    private
                      
    def create_remember_token
        self.remember_token = User.digest(User.new_remember_token)
    end
end
