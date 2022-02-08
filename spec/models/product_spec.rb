require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "Saves a product successfully" do
      @category = Category.create(name: "Game")
      @product = Product.new(
        name: "Zelda", 
        description: "Ocarina of Time", 
        category: @category, 
        quantity: 25, 
        price:  800, 
        image: "https://imgur.com/zvvpxDq")

        expect(@product).to be_valid
    end
    
    it "Returns an error when name is equal to nil" do
      @category = Category.create(name: "Game")
      @product = Product.new(
        name: nil, 
        description: "Ocarina of Time", 
        category: @category, 
        quantity: 25, 
        price:  800, 
        image: "https://imgur.com/zvvpxDq")

        expect(@product).not_to be_valid
        @product.errors.full_messages
    end

    it "Returns an error when price is equal to nil" do
      @category = Category.create(name: "Game")
      @product = Product.new(
        name: "Zelda", 
        description: "Ocarina of Time", 
        category: @category, 
        quantity: 25, 
        price:  nil, 
        image: "https://imgur.com/zvvpxDq")

        expect(@product).not_to be_valid
        @product.errors.full_messages
    end

    it "Returns an error when quantity is equal to nil" do
      @category = Category.create(name: "Game")
      @product = Product.new(
        name: "Zelda", 
        description: "Ocarina of Time", 
        category: @category, 
        quantity: nil, 
        price:  800, 
        image: "https://imgur.com/zvvpxDq")

        expect(@product).not_to be_valid
        @product.errors.full_messages
    end

    it "Returns an error when category is equal to nil" do
      @category = Category.create(name: "Game")
      @product = Product.new(
        name: "Zelda", 
        description: "Ocarina of Time", 
        category: nil, 
        quantity: 25, 
        price:  800, 
        image: "https://imgur.com/zvvpxDq")

        expect(@product).not_to be_valid
        @product.errors.full_messages
    end
  end
end
