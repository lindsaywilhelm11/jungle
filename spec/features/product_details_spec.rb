require 'rails_helper'

RSpec.feature "Visitor navigates to home page then product detail page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all product details" do
    # ACT
    visit root_path
    first('article.product').click_link 'Details'

    # DEBUG
    save_screenshot

    #VERIFY
    expect(page).to have_css('.products-show')

  end
end
