class User < ApplicationRecord
    validates :username, uniqueness: {message: "Username must be unique"}
end
