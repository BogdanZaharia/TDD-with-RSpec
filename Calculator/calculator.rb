require "rspec/autorun"
class Calculator

  def add(a,b)
    a + b
  end

  def factorial(n)
    if (n == 0)
      1
    else
      (1..n).reduce(:*)
    end
  end
end

describe Calculator do
  describe "#add" do
    it "returns the sum of its two arguments" do
      calc = Calculator.new
      expect(calc.add(5,10)).to eq(15)
    end
  end

  describe "#add" do
    it "returns the sum of its two arguments" do
      calc = Calculator.new
      expect(calc.add(7,15)).to eq(22)
    end
  end

  describe "#factorial" do
    it "returns 1 when given 0 (0! = 1)" do
      calc = Calculator.new
      expect(calc.factorial(5)).to eq(120)
    end
  end

  describe "#factorial" do
    it "returns 40320 when given 8 (8! = 40320)" do
      calc = Calculator.new
      expect(calc.factorial(8)).to eq(40320)
    end
  end
end