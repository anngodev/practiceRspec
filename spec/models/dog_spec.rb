require "shoulda/matchers"
require 'rails_helper'

describe Dog do
	[:name, :email, :birthday, :city, :state].each do |attribute|
	it { should validate_presence_of(attribute) }
end

	let(:valid_attributes) {
		@valid_attributes = {
			name: "Rufus",
			birthday: Time.now,
			city: "Southampton",
			state: "New York",
			email: "rufus.barksworth@gmail.com",
			password: "password"
		}	
	}

	it "is valid with valid attributes" do
		dog = Dog.new(valid_attributes)

		expect(dog).to be_valid
	end

	it "is invalid without a name" do
		dog = Dog.new(valid_attributes)
		dog.name = nil
		expect(dog).to be_invalid
	end

	describe "@birthday?" do
		it "returns true when it is the dog's birthday" do
			dog = Dog.create(valid_attributes)

			expect(dog.birthday?).to eq true
		end


		it "returns false when it is NOT the dog's birthday" do
			dog = Dog.new(valid_attributes)
			dog.birthday = Time.now - 10000000

			expect(dog.birthday?).to eq false
		end
	end
end