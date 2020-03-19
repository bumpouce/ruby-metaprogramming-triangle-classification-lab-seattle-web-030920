class Triangle
  attr_accessor :side1, :side2, :side3
 
  def initialize (side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind 
    is_triangle?
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side3 == side1
      :isosceles
    else
      :scalene
    end
  end

  def is_triangle?
    triangle = [(side1 + side2 > side3), (side1 + side3 > side2), (side2 + side3 > side1)]
    [side1, side2, side3].each do |side|
      begin
        triangle << false if side <= 0
        raise TriangleError
      rescue TriangleError => error
          puts error.message
      end
      raise TriangleError if triangle.include?(false)
    end
  end


  class TriangleError < StandardError
    def message
      "This is not a triangle!"
    end
  end
end

