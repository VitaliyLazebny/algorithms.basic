# power calculator
def calc_power(n)
  result = 1              # initialize variable for result of method
  n.times { result *= n } # calculation
  result                  # return result
end

result = 0 # initialize variable for result

# summ powers of numbers from 1 to 1000
1.upto(1000) {|i| result += calc_power(i) }

# convert result into string and put to user last 10 digits
puts result.to_s[-10..-1]