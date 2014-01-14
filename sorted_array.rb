class SortedArray
  attr_accessor :internal_arr # This is for convenience in the tests.

  def initialize(input_arr=[])
    @internal_arr = []
    input_arr.each do |elem|
      add(elem)
    end
    # Fill in the rest of the initialize method here.
    # What should you do with each element of the incoming array?
  end

  def add(new_ele)
    # Hint: Use the Array#insert method.
    @internal_arr.insert(first_larger_index(new_ele), new_ele)
  end

  def size
    @internal_arr.size
  end

  def [](index)
    @internal_arr[index]
  end

  def first_larger_index(target, start_ind=0, end_ind=@internal_arr.size)

      return 0 if @internal_arr.length == 0
      return @internal_arr.size if target > @internal_arr[@internal_arr.length-1]

      if @internal_arr.length == 1
        return start_ind if target < @internal_arr[0]
        return start_end+1 if target > @internal_arr[0]
      end

      if @internal_arr.length == 2
        return end_ind if target > @internal_arr[1]
        return start_ind if target < @internal_arr[0]
        return start_ind + 1
      end

      return start_ind if start_ind >= end_ind
      mid_index = (end_ind+start_ind)/2 
      mid_element = @internal_arr[mid_index]
      if mid_element == target
        return mid_index+1
      elsif mid_element > target
        return first_larger_index(target, start_ind, mid_index)
      elsif mid_element < target
        return first_larger_index(target, mid_index+1, end_ind)
      end

  end

  def index(target)
      @internal_arr.index(target)
  end
end
