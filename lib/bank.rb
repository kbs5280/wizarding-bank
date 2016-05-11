require 'pry'

class Bank
  attr_reader   :bank_name,
                :balance

  def initialize(bank_name)
    @bank_name  = bank_name
    @balance    = 0
    @accounts   = {}
  end

  def create
    "#{@bank_name} has been created."
  end

  def open_account(person)
    @accounts.store(person, @bank_name)
    "An account has been opened for #{person.name} with #{@bank_name}."
  end

  def deposit(person, amount)
    if amount > person.cash_level
      "#{person.name} does not have enough cash to perform this deposit."
    else
      @balance = amount
      cash_level = person.cash_level - amount
      "#{amount} galleons have been deposited into #{person.name}'s #{@bank_name} account. Balance: #{@balance} Cash: #{cash_level}"
    end
  end

  def withdrawal(person, amount)
    if amount > @balance
      "Insufficient funds."
    else
      @balance = @balance - amount
      "#{person.name} has withdrawn #{amount} galleons. Balance: #{@balance}"
    end
  end

  def transfer(person, trans_bank, amount)
    if @accounts.has_key?(person)
    if amount > @balance
      "Insufficient funds."
    else
      "#{person.name} has transferred #{amount} galleons from #{@bank_name} to #{trans_bank.bank_name}."
  end
  end



end
