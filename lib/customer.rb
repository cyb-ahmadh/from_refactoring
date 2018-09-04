require 'movie'
require 'rental'

class Customer
 attr_reader :name

 def initialize(name)
   @name = name
   @rentals = []
 end

 def add_rental(arg)
   @rentals << arg
 end

 def statement
   total_amount, frequent_renter_points = 0, 0
   result = "Rental Record for #{@name}\n"
   @rentals.each do |element|

     # add frequent renter points
     frequent_renter_points += element.frequent_renter_points

     # show figures for this rental
     result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
   end

   # add footer lines
   result += "Amount owned is #{total_charge}\n"
   result += "You earned #{frequent_renter_points} frequent renter points"
   result
 end

 private

 def total_charge
   result = 0
   @rentals.each do |rental|
     result += rental.charge
   end
   result
 end
end
