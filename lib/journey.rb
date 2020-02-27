class Journey
  attr_reader :journey, :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journey_record = []
  end

  def current_journey(entry_station, exit_station)
