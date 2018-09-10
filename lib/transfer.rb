class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def sender
    @sender
  end

  def sender=(new_sender)
    @sender=new_sender
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance >= amount
  end


  def execute_transaction
    if self.status == "pending"
      if self.valid?
        receiver.balance += amount
        sender.balance -= amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

#HOW TO FIX?
  def reject_transaction
    if !sender.valid? || sender.balance < amount
      "Transaction rejected.  Please check your account balance."
    end

  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
    end
      self.status = "reversed"
  end
end
