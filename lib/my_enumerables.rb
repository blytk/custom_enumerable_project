module Enumerable
  # Your code goes here
  # my_each_with_index
  def my_each_with_index
    if block_given?
      i = 0
      self.my_each do |element|
        yield [element, i]
        i = i + 1
      end
      self
    end
  end
  # my_select
  def my_select
    my_select_output_array = []
    if block_given?
      self.my_each do |element|
        if yield(element) == true
          my_select_output_array << element
        end
      end
    end
    my_select_output_array
  end
  # my_all?
  def my_all?
      if block_given?
        self.my_each do |element|
          if yield(element) == false
            return false
          end
        end
        true
      else
        true
      end
  end


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    # iterate through all elements of the array
    for i in 0...self.length
      # current element
      current_element = self[i]
      # yield current element to block
      yield current_element
    end
    # return original array
    self
  end
end
