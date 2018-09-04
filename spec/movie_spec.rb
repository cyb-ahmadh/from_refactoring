require 'byebug'
require 'movie'

describe Movie do
  describe 'Charge' do
    let(:movie) do
      Movie.new(movie_name, price_code)
    end

    subject do
      movie.charge(days_rented)
    end

    context 'For new release' do
      let(:movie_name) { 'Avengers - Infinity Wars' }
      let(:price_code) { 1 }
      let(:days_rented) { 2 }

      it 'should match the price' do
        expect(subject).to eq(6)
      end
    end

    context 'For regular release' do
      let(:movie_name) { 'Avengers - Age of Ultron' }
      let(:price_code) { 0 }

      context 'With less or equal than 2 days' do
        let(:days_rented) { 2 }

        it 'should match the price' do
          expect(subject).to eq(2)
        end
      end

      context 'With more than 2 days' do
        let(:days_rented) { 3 }

        it 'should match the price' do
          expect(subject).to eq(3.5)
        end
      end
    end

    context 'For Childrens' do
      let(:movie_name) { 'Ice Age' }
      let(:price_code) { 2 }

      context 'With less or equal than 3 days' do
        let(:days_rented) { 2 }

        it 'should match the price' do
          expect(subject).to eq(1.5)
        end
      end

      context 'With more than 3 days' do
        let(:days_rented) { 4 }

        it 'should match the price' do
          expect(subject).to eq(3.0)
        end
      end
    end
  end
end
