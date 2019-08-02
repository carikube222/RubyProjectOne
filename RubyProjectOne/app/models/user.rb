class User < ApplicationRecord
    has_secure_password
    #for password update only
    #validates: password, :on => :create, length: {in: 7..20}, :presence => true
    #for password create & update: validates_presence_of: password
    email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, length: {minimum: 2}, presence: true
    validates :last_name, length: {minimum: 2}, presence: true
    validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
    validates :password, length: {in: 7..20}, :presence => true
    validates :birthday, :presence => true

    before_save do
      self.email.downcase!
      self.first_name.downcase!
      self.last_name.downcase!
    end
end
