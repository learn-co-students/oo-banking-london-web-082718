class Transfer
  # your code here

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @reverse = amount
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction

    if @sender.valid? && @sender.balance > @amount
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
      @amount = 0
      true
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if execute_transaction
      @receiver.balance -= @reverse
      @sender.balance += @reverse
      @status = "reversed"
    end
  end

end
