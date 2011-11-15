require_relative 'luhn'

class Luhnybin

  def  self.filter(input)
    @text = input
    
    check_for_possible_matches
    filter_text
    
    @text
  end
  
  def  self.check_for_possible_matches
    @matches = []
    0.upto(@text.length) do  |pos|
      12.upto(17) do |length|
        m = /\d[\d\s-]{#{length}}\d/.match(@text, pos)
        next unless (14..16).include?(m.to_s.scan(/\d/).size)
        next unless m.to_s.scan(/\d/).join.to_i.valid_luhn?
        
        @matches << m.offset(0) unless m.nil?
      end
    end
  end
  
  def self.filter_text
    @matches.each do |m|
      @text[m[0], m[1]-m[0]] = @text[m[0], m[1]-m[0]].gsub(/\d/, 'X')
    end
  end

end
