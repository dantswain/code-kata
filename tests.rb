require_relative 'solution'


describe 'solution' do
  include Solution
  it 'passes these tests' do
    expect(seven(times(five))).to eq 35
    expect(four(plus(nine))).to eq 13
    expect(eight(minus(three))).to eq 5
    expect(six(divided_by(two))).to eq 3
  end
end
