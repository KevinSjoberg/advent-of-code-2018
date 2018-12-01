require "spec"
require "../lib/frequency_calibrator"

describe FrequencyCalibrator do
  it "calculates increasing and decreasing frequency" do
    calibrator = FrequencyCalibrator.new
    calibrator.frequency_from_deltas([1, 1, 1]).should eq(3)
    calibrator.frequency_from_deltas([-1, -1, -1]).should eq(-3)
    calibrator.frequency_from_deltas([1, 1, -1]).should eq(1)
  end

  it "calculates first repeating frequency" do
    calibrator = FrequencyCalibrator.new
    calibrator.repeating_frequency_from_deltas([1, -1]).should eq(0)
    calibrator.repeating_frequency_from_deltas([3, 3, 4, -2, -4]).should eq(10)
    calibrator.repeating_frequency_from_deltas([-6, 3, 8, 5, -6]).should eq(5)
    calibrator.repeating_frequency_from_deltas([7, 7, -2, -7, -4]).should eq(14)
  end
end
