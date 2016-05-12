require 'minitest/autorun'
require 'minitest/pride'
require './lib/bank.rb'
require './lib/person.rb'

class BankTest < Minitest::Test

  def test_can_create_a_bank
    new_wizards_bank = Bank.new('New Wizards Bank')
    assert_equal 'New Wizards Bank has been created.', new_wizards_bank.create
  end

  def test__person_can_have_assigned_account
    new_wizards_bank = Bank.new('New Wizards Bank')
    person = Person.new("Luna")
    assert_equal "An account has been opened for Luna with New Wizards Bank.", new_wizards_bank.open_account(person)
  end

  def test_it_can_deposit_money
    new_wizards_bank = Bank.new('New Wizards Bank')
    person = Person.new("Minerva", 1000)
    assert_equal "750 galleons have been deposited into Minerva's New Wizards Bank account. Balance: 750 Cash: 250", new_wizards_bank.deposit(person, 750)
  end

  def test_it_cannot_deposit_more_than_it_has
    new_wizards_bank = Bank.new('New Wizards Bank')
    person = Person.new("Minerva", 1000)
    assert_equal "Minerva does not have enough cash to perform this deposit.", new_wizards_bank.deposit(person, 5000)
  end

  def test_it_tracks_withdrawals
    new_wizards_bank = Bank.new('New Wizards Bank')
    person = Person.new("Minerva", 500)
    new_wizards_bank.deposit(person, 500)
    assert_equal "Minerva has withdrawn 250 galleons. Balance: 250", new_wizards_bank.withdrawal(person, 250)
  end

  def test_insufficient_funds
    new_wizards_bank = Bank.new('New Wizards Bank')
    person = Person.new("Minerva", 500)
    new_wizards_bank.deposit(person, 500)
    assert_equal "Insufficient funds.", new_wizards_bank.withdrawal(person, 5000)
  end

  def test_it_can_tranfer_money
    wizards_bank = Bank.new('Wizards Bank of the Rockies')
    new_wizards_bank = Bank.new('New Wizards Bank')
    person = Person.new("Luna", 1000)
    assert_equal "500 galleons have been deposited into Luna's New Wizards Bank account. Balance: 500 Cash: 500", new_wizards_bank.deposit(person, 500)
    assert_equal "Luna has transferred 250 galleons from New Wizards Bank to Wizards Bank of the Rockies.", new_wizards_bank.transfer(person, wizards_bank, 250)
  end

  def test_tranfer_cannot_exceed_balance
    wizards_bank = Bank.new('Wizards Bank of the Rockies')
    new_wizards_bank = Bank.new('New Wizards Bank')
    person = Person.new("Luna", 1000)
    assert_equal "An account has been opened for Luna with Wizards Bank of the Rockies.", wizards_bank.open_account(person)
    assert_equal "An account has been opened for Luna with New Wizards Bank.", new_wizards_bank.open_account(person)
    assert_equal "500 galleons have been deposited into Luna's New Wizards Bank account. Balance: 500 Cash: 500", new_wizards_bank.deposit(person, 500)
    assert_equal "Insufficient funds.", new_wizards_bank.transfer(person, wizards_bank, 5000)
  end

  def test_it_has_to_have_accounts_with_both_banks_to_transfer_money
    wizards_bank = Bank.new('Wizards Bank of the Rockies')
    new_wizards_bank = Bank.new('New Wizards Bank')
    person = Person.new("Luna", 1000)
    person2 = Person.new("Minerva", 1000)
    assert_equal "An account has been opened for Luna with Wizards Bank of the Rockies.", wizards_bank.open_account(person)
    assert_equal "An account has been opened for Luna with New Wizards Bank.", new_wizards_bank.open_account(person)
    assert_equal "500 galleons have been deposited into Luna's Wizards Bank of the Rockies account. Balance: 500 Cash: 500", wizards_bank.deposit(person, 500)
    assert_equal "Minerva does not have an account with New Wizards Bank.", wizards_bank.transfer(person2, new_wizards_bank, 1)
  end

end
