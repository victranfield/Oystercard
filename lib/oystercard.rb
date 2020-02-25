
class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    # @in_journey = false
  end

  # def balance
  #   0
  # end

  def top_up(amount)
    # puts 'Maximum balance of #Oystercard::MAXIMUM_BALANCE exceeded'
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    fail "Maximum balance of #{maximum_balance} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end


  def in_journey?
    @entry_station != nil
  end

  def touch_in(entry_station)
    fail "Balance is below the minimum" if balance < MINIMUM_BALANCE
    @entry_station = entry_station
    # @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @entry_station = nil
    # @in_journey = false
  end
end

private

def deduct(amount)
  @balance -= amount
end
