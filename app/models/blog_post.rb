class BlogPost < ApplicationRecord

	has_many :comments,  dependent: :destroy

	validates :title, :blog_entry, presence: true
	validates :title, length: { minimum: 3, maximum: 140 }
end
