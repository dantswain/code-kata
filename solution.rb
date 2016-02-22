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
    other.value.send(@op, @value)
  end
end

module NameToNumber
  module_function

  def number(name)
    as_int = {:one => 1,
              :two => 2,
              :three => 3,
              :four => 4,
              :five => 5,
              :six => 6,
              :seven => 7,
              :eight => 8,
              :nine => 9}[name]
    if as_int.nil?
      nil
    else
      LazyNumber.new(as_int)
    end
  end
end

module Solution
  def method_missing(name, *args, &block)
    value = NameToNumber.number(name)
    if value && args.size == 0
      value
    elsif value && args.size == 1
      args.first.evaluate(value)
    else
      super
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
