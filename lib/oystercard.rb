
class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
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
    @in_journey
  end

  def touch_in
    fail "Balance is below the minimum" if balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @in_journey = false
  end
end

private

def deduct(amount)
  @balance -= amount
end
