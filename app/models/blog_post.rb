class BlogPost < ApplicationRecord

	validates :title, :blog_entry, presence: true
	validates :title, length: { minimum: 3, maximum: 140 }
end
