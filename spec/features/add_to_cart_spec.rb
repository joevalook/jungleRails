require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
      )
    end
  end
  scenario "product added to cart" do
    visit root_path
    expect(page).to have_content 'My Cart (0)'
    save_screenshot 'test-3-home_page1.png'

    first('.btn-primary').click
    sleep(1)
    save_screenshot 'test-3-home_page2.png'
    expect(page).to_not have_content 'My Cart (0)'
    expect(page).to have_content 'My Cart (1)'
  end
end

