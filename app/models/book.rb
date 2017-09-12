class Book < ApplicationRecord
  belongs_to :subject
  validates_presence_of :title # not null
  validates_numbericality_of :price, :message=>"Error message"
end
