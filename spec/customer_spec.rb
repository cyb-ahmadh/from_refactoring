require 'byebug'
require 'customer'

describe Customer do
  describe 'Statement' do
    let(:movie) do
      Movie.new(movie_name, price_code)
    end

    let(:rental) do
      Rental.new(movie, days_rented)
    end

    let(:customer) do
      name = 'Ahmad'
      Customer.new(name)
    end

    subject do
      customer.statement
    end

    before do
      customer.add_rental(rental)
    end

    context 'new release' do
      let(:movie_name) { 'Stree' }
      let(:price_code) { 1 }
      let(:days_rented) { 3 }
      it 'should match the statement' do
        expect(subject).to eq("Rental Record for Ahmad\n\tStree\t9\nAmount owned is 9\nYou earned 2 frequent renter points")
      end
    end

    context 'regular release' do
      let(:movie_name) { 'Iron Man' }
      let(:price_code) { 0 }
      let(:days_rented) { 2 }

      it 'should match the statement' do
        expect(subject).to eq("Rental Record for Ahmad\n\tIron Man\t2\nAmount owned is 2\nYou earned 1 frequent renter points")
      end
    end

    context 'children release' do
      let(:movie_name) { 'Mowgli' }
      let(:price_code) { 2 }
      let(:days_rented) { 4 }

      it 'should match the statement' do
        expect(subject).to eq("Rental Record for Ahmad\n\tMowgli\t3.0\nAmount owned is 3.0\nYou earned 1 frequent renter points")
      end
    end
  end
end
