class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.each_with_index.reduce(0) do |inthash, (el, i)|
      # p inthash
      # p el
      # p i
      (el.hash + i.hash) ^ inthash
    end
  end
end

p [1,2,3,4,5].hash

class String
  def hash
    # chars.each do |chr|
    #   chr.to_i.hash
    # end
    chars.map(&:ord).hash
    #converst
  end
end

# 'Ruby'.hash

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
     self.to_a.sort_by(&:hash).hash
    # self.to_a.sort_by {|p| p.hash}
  end
end
