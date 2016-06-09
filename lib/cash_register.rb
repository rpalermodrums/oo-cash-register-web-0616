class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction
  def initialize(discount = 0)
    @total = 0
    @discount = discount

    #@employee_discount = employee_discount
  end

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
    @last_transaction = price * quantity
    @items ||= []
    quantity.times { @items << item }
  end

  def apply_discount
    self.total -= (self.discount * self.total) / 100
    if self.discount != 0
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end
