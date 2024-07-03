class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  # un resto a forcément un nom, une adresse, et un numéro de téléphone
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  # Un resto fait forcément partie de l'une de ces catégories
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"], allow_nill: false }
end
