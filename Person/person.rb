# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  # implement your behavior here
  def full_name
    #[@first_name,@middle_name,@last_name].compact.join(" ")
    if @middle_name == nil
      @first_name<<" "<<@last_name
    else
      @first_name<<" "<<@middle_name<<" "<<@last_name
    end
  end

  def full_name_with_middle_initial
    if @middle_name != nil
      @first_name<<" "<<@middle_name[0,1]<<". "<<@last_name
    else
      @first_name<<" "<<@last_name
    end
  end

  def initials
    if @middle_name != nil
      @first_name[0]<<". "<<@middle_name[0]<<". "<<@last_name[0]<<"."
    else
      @first_name[0]<<". "<<@last_name[0]<<"."
    end
  end
end

RSpec.describe Person do
  describe "#full_name" do

    it "concatenates first name, middle name, and last name with spaces" do
      person = Person.new(first_name: "John", middle_name: "Andrew", last_name: "Smith")
      expect(person.full_name).to eq("John Andrew Smith")
    end

    it "does not add extra spaces if middle name is missing" do
      person = Person.new(first_name: "Ken", middle_name: nil, last_name: "Rogers")
      expect(person.full_name).to eq("Ken Rogers")
    end
  end

  describe "#full_name_with_middle_initial" do

    it "returns the first name, the initial of the middle name and the last name concatenated" do
      person = Person.new(first_name: "Tim", middle_name: "Andy", last_name: "Howard")
      expect(person.full_name_with_middle_initial).to eq("Tim A. Howard")
    end

    it "returns only the first name and the last name if middle name is missing" do
      person = Person.new(first_name: "Angelina", middle_name: nil, last_name: "Jones")
      expect(person.full_name_with_middle_initial).to eq("Angelina Jones")
    end
  end

  describe "#initials" do

    it "returns the initials of the first name, middle name, last name" do
      person = Person.new(first_name: "Ross", middle_name: "Keane", last_name: "Tucker")
      expect(person.initials).to eq("R. K. T.")
    end

    it "returns the initials of the first and last name when middle name is missing" do
      person = Person.new(first_name: "George", middle_name: nil, last_name: "Best")
      expect(person.initials).to eq("G. B.")
    end
  end
end