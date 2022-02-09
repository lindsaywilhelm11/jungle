require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should have password and password_confirmation" do
      @user = User.create(
        name: "Lindsay Wilhelm",
        email: "lindsaywilhelm11@gmail.com",
        password: "hello",
        password_confirmation: "hello"
      )

      expect(@user).to be_valid
      @user.errors.full_messages
    end

    it "should have password and password_confirmation match" do
      @user = User.create(
        name: "Loki Laufeyson",
        email: "born2rule@asgard.com",
        password: "betterthanThor",
        password_confirmation: "betterthanthor"
      )

      expect(@user.password).not_to be_equal(@user.password_confirmation)
      @user.errors.full_messages
    end

    it "should have unique emails" do
      @user = User.create(
        name: "Anakin Skywalker",
        email: "skywalker@starwars.com",
        password: "darkside",
        password_confirmation: "darkside"
      )

      @another_user = User.create(
        name: "Luke Skywalker",
        email: "Skywalker@starwars.com",
        password: "jediway",
        password_confirmation: "jediway"
      )
      
      @user.valid?
      @another_user.valid?

      expect(@user).to be_valid
      expect(@another_user).not_to be_valid
      @user.errors.full_messages
    end

    it "should have passwords that are at least 5 characters" do
      @user = User.create(
        name: "Harry Potter",
        email: "chosenone@wizard.com",
        password: "wiz",
        password_confirmation: "wiz"
      )

      expect(@user.password.length).to be >= 5
      @user.errors.full_messages
    end

    it "must have a valid email address" do
      @user = User.create(
        name: "Paul Atreides",
        email: nil,
        password: "dune",
        password_confirmation: "dune"
      )

      expect(@user).not_to be_valid
      @user.errors.full_messages
    end

    it "must have a valid name" do
      @user = User.new(
        name: nil,
        email: "guesswho@whoknows.com",
        password: "idk",
        password_confirmation: "idk"
      )

      expect(@user.name).not_to be(nil)
      @user.errors.full_messages
    end
  end

  describe '.authenticate_with_credentials' do
    it "should login with correct credentials" do
    @user = User.new(
      name: "Bugs Bunny",
      email: "bugs@looneytunes.com",
      password: "whatsupdoc",
      password_confirmation: "whatsupdoc"
      )
    authentication = User.authenticate_with_credentials("bugs@looneytunes.com", "whatsupdoc")
    expect(authentication).to be == @user
    end

    it "should login with correct credentials" do
      @user = User.new(
        name: "Bugs Bunny",
        email: "bugs@looneytunes.com",
        password: "whatsupdoc",
        password_confirmation: "whatsupdoc"
        )
      authentication = User.authenticate_with_credentials(" Bugs@looneytunes.com", "whatsupdoc")
      expect(authentication).to be == @user
      end
  end
end


