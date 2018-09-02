# Transfer
#   Transfer
#     initialize
#       can initialize a Transfer (FAILED - 2)
#       initializes with a sender (FAILED - 3)
#       initializes with a receiver (FAILED - 4)
#       always initializes with a status of 'pending' (FAILED - 5)
#       initializes with a transfer amount (FAILED - 6)
#     #valid?
#       can check that both accounts are valid (FAILED - 7)
#       calls on the sender and reciever's #valid? methods (FAILED - 8)
#     #execute_transaction
#       can execute a successful transaction between two accounts (FAILED - 9)
#       each transfer can only happen once (FAILED - 10)
#       rejects a transfer if the sender doesn't have a valid account (FAILED - 11)
#     #reverse_transfer
#       can reverse a transfer between two accounts (FAILED - 12)
#       it can only reverse executed transfers (FAILED - 13)

require 'pry'
class Transfer


attr_accessor :sender, :receiver, :transfer_amount, :status, :amount, :all_transfers

@@all_transfers = []


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@all_transfers << self
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
  if @sender.valid? && @sender.balance > @amount && status == "pending"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
    # binding.pry
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  @@all_transfers.select do |transaction|
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
  end
end
end

end
