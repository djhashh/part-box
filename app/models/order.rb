class Order < ApplicationRecord
  has_many :line_item, inverse_of: :order
  has_many :consumables, through: :line_item

  accepts_nested_attributes_for :line_item, allow_destroy: true
  accepts_nested_attributes_for :consumables

  after_save :remove_stock, if: :finalized?

  searchkick
  audited
  has_associated_audits

  def remove_stock
    #TODO Make this decrement the quantity of the consumable in each line item
    puts "********************************** REMOVED STOCK **********************************"
  end
end
