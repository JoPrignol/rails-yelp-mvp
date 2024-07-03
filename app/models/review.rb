class Review < ApplicationRecord
  belongs_to :restaurant
  # Les notes sont comprises entre 0 et 5, et sont des entiers
  validates :rating, inclusion: { in: (0..5), allow_nill: false }, numericality: { only_integer: true }
  # L'avis comporte obligatoirement un commentaire
  validates :content, presence: true
end
