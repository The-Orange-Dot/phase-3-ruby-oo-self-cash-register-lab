require 'pry'

class CashRegister
  attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @title = []
    @price = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 1)
    @quantity = quantity
    quantity.times { @title << title }
    quantity.times { @price << price }
    self.total += price * quantity
  end

  def apply_discount
    discount = self.discount.to_f / 100
    discount_total = self.total * discount
    @total -= discount_total.to_int
    if self.discount.to_f == 0
      'There is no discount to apply.'
    else
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @title
  end

  def void_last_transaction
    @total -= @price[-1] * @quantity
    @title.pop
    @price.pop
    @title.length == 0 ? @total == 0 : @total
  end
  # binding.pry
end
