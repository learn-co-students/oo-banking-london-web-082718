# # We're going to build a BankAccount class where one instance of the class can
# transfer money to another instance through a Transfer class. The Transfer class acts as a
# space for a transaction between two instances of the bank account class. Think of it this way: you
# can't just transfer money to another account without the bank running checks first. Transfer instances
# will do all of this, as well as check the validity of the accounts before the transaction occurs. Transfer
#   instances should be able to reject a transfer if the accounts aren't valid or if the sender doesn't have the money.
# #
# # Transfers start out in a "pending" status. They can be executed and go to a "complete" state.
# They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status.


# BankAccount
#   BankAccount
#     #initialize
#       can initialize a Bank Account (FAILED - 1)
#       initializes with a name (FAILED - 2)
#       always initializes with balance of 1000 (FAILED - 3)
#       always initializes with a status of 'open' (FAILED - 4)
#       can't change its name
#   #deposit
#     can deposit money into its account (FAILED - 5)
#   #display_balance
#     can display its balance (FAILED - 6)
#   #valid?
#     is valid with an open status and a balance greater than 0 (FAILED - 7)
#   #close_account
#     can close its account (FAILED - 8)
#
require 'pry'
class BankAccount

attr_accessor :balance, :status, :valid
attr_reader :name

@@all_accounts = []

def initialize(name, balance = 1000)
  @name = name
  @balance = 1000
  @status = "open"
  @@all_accounts << self
end

def deposit(money)
  # binding.pry
  @balance += money
end

def balance
  @balance
end

def display_balance
  "Your balance is $#{@balance}."
end

def valid?
  if @balance > 0 && @status == "open"
    true
  else
    false
  end
end

def close_account
@status = "closed"
end

end
