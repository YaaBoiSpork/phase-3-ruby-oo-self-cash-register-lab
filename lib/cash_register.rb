require 'pry'
class CashRegister
    attr_accessor :discount, :total, :price, :items, :last_transaction
    def initialize (discount = 0, total = 0)
        @discount = discount
        @total = total
        @items = []
    end
    
    def add_item (title, price, quantity = 1)
        self.last_transaction = price * quantity
        self.total += self.last_transaction
        quantity.times do 
            self.items << title
        end
    end
    
    def apply_discount
        if discount != 0
            self.total = self.total - ((self.discount * self.total) / 100)
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - last_transaction
    end
end
