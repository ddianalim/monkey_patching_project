# Monkey-Patch Ruby's existing Array class to add your own custom methods

require 'byebug'
class Array
    def span
        if self.length > 0
            return self.max - self.min
        end
    end 

    def average
        if self.length > 0
            return self.sum * 1.00 / self.length
        end
    end

    def median
        return nil if self.length == 0
        
        mid = self.length * 1.0 / 2
        if self.length % 2 == 1
            return self.sort[mid]
        else 
            return (self.sort[mid - 1] + self.sort[mid]) * 1.0 / 2
        end
    end

    def counts
        count = Hash.new(0)
        self.each { |ele| count[ele] += 1 }
        return count
    end
    
    def my_count(value)
        count = 0
        self.each { |ele| count += 1 if ele == value }
        return count
    end

    def my_index(value)
        if self.include?(value)
            self.each.with_index { |ele, i| return i if ele == value }
        end
    end

    def my_uniq
        new_arr = []
        self.each do |ele|
            new_arr << ele if !new_arr.include?(ele)
        end
        new_arr
    end

    def my_transpose
        new_arr = []
            self.each do |arr|
                new_arr << arr
            end

        (new_arr.length*new_arr.length).times do
            # debugger
            c = 0
            while c < new_arr.length-1 
                (0...new_arr.length-1).each do |r|
                    new_arr[r][c], new_arr[c][r] = new_arr[c][r], new_arr[r][c]
                end
                c += 1
            end
        end

        return new_arr
    end

end
