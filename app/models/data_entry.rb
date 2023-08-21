class DataEntry < ApplicationRecord
  validates :name, length: { in: 3..20 }, presence: true
  validates :type, presence: true
  validates :data, length: { maximum: 500 },presence: true
end
