# Monkey-Patch Ruby's existing Array class to add your own custom methods

require 'byebug'
class Array
    def span
        # if self.length > 0
        if !self.empty?
            return self.max - self.min
        end
    end 

    def average
        # if self.length > 0
        if !self.empty?
            return self.sum * 1.00 / self.length
        end
    end

    def median
        return nil if self.length == 0
        
        mid = self.length * 1.0 / 2
        # if self.length % 2 == 1
        if self.length.odd?
            return self.sort[mid]
        else 
            return (self.sort[mid - 1] + self.sort[mid]) * 1.0 / 2
        end
    end

    def counts
        count = Hash.new(0)
        self.each { |ele| count[ele] += 1 }
        count
    end
    
    def my_count(value)
        count = 0
        self.each { |ele| count += 1 if ele == value }
        count
    end

    def my_index(value)
        # if self.include?(value)
            self.each.with_index { |ele, i| return i if ele == value }
        # end
        nil
    end

    def my_uniq
        # new_arr = []
        # self.each do |ele|
        #     new_arr << ele if !new_arr.include?(ele)
        # end
        # new_arr
        hash = {}
        self.each { |ele| hash[ele] = true }
        hash.keys
    end

    def my_transpose
        new_arr = []
        # self.length.times do |row|
        #     new_arr << []
        #     self.length.times do |col|
        #         new_arr[row] << []
        #     end
        # end

        # (0...new_arr.length).each do |r|
        #     (0...new_arr.length).each do |c|
        #         new_arr[r][c] = self[c][r]
        #     end
        # end

        (0...self.length).each do |r|
            new_row = []
            (0...self.length).each do |c|
                new_row << self[c][r]
            end
            new_arr << new_row
        end
    new_arr
    end
end
