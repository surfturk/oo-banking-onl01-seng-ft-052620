class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end  
  
  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false  
    end
  end  
  
  
  def execute_transaction
      if status = "pending" && self.valid? && sender.balance > amount
      
    receiver.balance += amount
    sender.balance -= amount
    self.status = "complete"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end 
 end  
  
  
  def reverse_order
    if self.status == "complete"
      receiver.balance -= amount
      sender.balnce += amount
      self.status
  end  
  
  
end
