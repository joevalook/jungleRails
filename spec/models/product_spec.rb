require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.create(name: "test-category") }
  subject {
    category.products.create(
      name: "testing",
      price_cents: 1000,
      quantity: 1
    )
  }

  describe 'Validations' do
    # validation tests/examples here
    it 'should save successfully' do
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
      expect(subject.name).to be_present
      expect(subject.price).to be_present
      expect(subject.quantity).to be_present
      expect(subject.category).to be_present
    end
    it 'should be invalid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Name can't be blank"
    end
    it 'should be invalid without price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Price can't be blank"
    end
    it 'should be invalid without quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Quantity can't be blank"
    end
    it 'should be invalid without a category' do
      product = Product.create(
        name: "testing",
        price_cents: 100,
        quantity: 10
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
