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
  # my_any?
  def my_any?
    if block_given?
      self.my_each do |element|
        if yield(element) == true
          return true
        end
      end
      false
    end
    false
  end
  # my_none?
  # returns true if no element of self meet a given criterion
  # with no block given and no argument, returns true if self has no truthy elements, false otherwise
  def my_none?
    if block_given?
      self.my_each do |element|
        if yield(element) == true
          return false
        end
      end
      true
    else
      self.my_each do |element|
        if element == true
          return false
        end
      end
      false
    end
  end
  # my_count
  # returns a count of specified elements
  # with no argument and no block, returns the count of all elements
  def my_count
    count = 0
    if block_given?
      self.my_each do |element|
        if yield(element) == true
          count += 1
        end
      end
      count
    else
      self.my_each do |element|
        count += 1
      end
      count
    end
  end
  # my_map
  # calls the block, if given, with each element of self
  # returns a new Array whose elements are the return values from the block
  def my_map
    output_array = []
    if block_given?
      self.my_each do |element|
        output_array << yield(element)
      end
      output_array
    else
      self
    end
  end
  # my_inject
  # returns an object formed from operands
  def my_inject(initial_operand = 0)
    sum = initial_operand
    if block_given?
      self.my_each do |element|
        sum = yield(sum, element)
      end
      sum
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
