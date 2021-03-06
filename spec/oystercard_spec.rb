require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
  end

  it 'can top up the balance' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up 1}.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end
end

describe Oystercard do
    # it { is_expected.to respond_to(:deduct).with(1).argument }
    #
    # it 'deducts an amount from the balance' do
    #   subject.top_up(20)
    #   expect{ subject.deduct 3}.to change{ subject.balance }.by -3
    # end

describe 'in_journey?' do
      it { is_expected.to respond_to(:in_journey?) }
    end

describe 'touch_in' do
  it 'can return touch_in' do
    subject.top_up(5)
    subject.touch_in("Waterloo")
    expect(subject).to be_in_journey
    # expect(subject.in_journey?).to eq(true)
  end

describe 'touch_out' do
  it 'can return touch_out' do
    subject.touch_out("Old Street")
    expect(subject).to_not be_in_journey
    # expect(subject.in_journey?).to eq(false)
  end

  it 'raises an error if your balance is below the minimum' do
    minimum_balance = Oystercard::MINIMUM_BALANCE
    expect{ subject.touch_in("Waterloo")}.to raise_error "Balance is below the minimum"
  end

  it 'reduces balance on touch_out' do
    expect{ subject.touch_out("Old Street")}.to change{subject.balance}.by -Oystercard::MINIMUM_BALANCE
  end

  it 'can report entry_station name' do
    #enough balance to touch in
    #add an entry station to touch in
    #call entry station after touch in
    subject.top_up(6)
    subject.touch_in("Moorgate")
    expect(subject.entry_station).to eq("Moorgate")
  end

  it 'can report exit_station name' do
    subject.top_up(6)
    subject.touch_in("Moorgate")
    subject.touch_out("Old Street")
    expect(subject.exit_station). to eq("Old Street")
  end

  it 'reports nil' do
    subject.top_up(6)
    subject.touch_in("Moorgate")
    subject.touch_out("Old Street")
    expect(subject.entry_station).to eq nil
  end

  it 'stores journey history' do
    subject.top_up(6)
    subject.touch_in("Moorgate")
    subject.touch_out("Old Street")
    expect(subject.journey_record).to eq [{enter: "Moorgate", exit: "Old Street"}]
  end

end

end

end
