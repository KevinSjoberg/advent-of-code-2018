class FrequencyCalibrator
  def frequency_from_deltas(deltas)
    deltas.sum
  end

  def repeating_frequency_from_deltas(deltas)
    frequencies = Set{0}
    deltas.each.cycle.reduce(0) do |acc, frequency|
      break acc + frequency if frequencies.includes?(acc + frequency)
      frequencies.add(acc + frequency)
      acc + frequency
    end
  end
end
