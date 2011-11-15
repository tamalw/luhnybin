class Integer
  def valid_luhn?
    digits = [] 
    
    self.to_s.reverse.chars.each_with_index do |digit, i|
      if i % 2 != 0
        double_digit = (digit.to_i * 2).to_s
        if double_digit.size > 1
          double_digit = double_digit[0].to_i + double_digit[1].to_i
        end
        digits << double_digit
      else
        digits << digit
      end
    end
    
    digits.inject(0) { |sum, n| sum + n.to_i } % 10 == 0
  end
  
end
