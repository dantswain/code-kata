# Add your solution here

class LazyNumber
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def prefix_op(op)
    @op = op
    self
  end

  def evaluate(other)
    other.send(@op, @value)
  end
end

module Solution
  [
    :one,
    :two,
    :three,
    :four,
    :five,
    :six,
    :seven,
    :eight,
    :nine
  ].each_with_index.map do |name, ix|
    define_method(name) do |other = nil|
      if other.nil?
        LazyNumber.new(ix + 1)
      else
        other.evaluate(ix + 1)
      end
    end
  end

  {
    times: :*,
    plus: :+,
    minus: :-,
    divided_by: :/   # lol this one describes how I feel about doing this
  }.each_pair.map do |k, v|
    define_method(k) { |n|  n.prefix_op(v)}
  end
end
