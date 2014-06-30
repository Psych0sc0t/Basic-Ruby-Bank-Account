class Account
	attr_reader :username, :balance, :amount
	def initialize(username,balance = 1_000)
		@username = username
		@balance = balance
	end

	def display_balance(pin_num)
		puts pin_num == pin ? "Current Balance: #{@balance}" : pin_error
	end

	def pin_error
		puts "Error! Invalid PIN"
	end

	def deposit_error
		puts "You can't deposit a negative amount!"
	end

	def withdraw_error
		puts "You do not have the funds to withdraw $#{@amount}."
	end

	def withdraw_balance(pin_num,amount)
		@amount = amount
		if pin_num == pin
			@balance -= amount
				if @balance < 0
					withdraw_error
				else
					puts "Withdrew $#{amount}. New Balance: $#{@balance}"
				end
		else
			pin_error
		end
	end

	def deposit_balance(pin_num,amount)
		if pin_num == pin && amount >= 0
			@balance += amount
			puts "Deposited $#{amount}. New Balance: $#{@balance}"
		else
			deposit_error
		end
	end

	private

	def pin
		@pin = 12345
	end

end

class Another_Account < Account
	private
	def pin
		@pin = 56789
	end
end

puts "-----------------------------------------------"
test = Account.new("SMB",100_000)
test.display_balance(12345)
test.deposit_balance(12345,100_000)
test.withdraw_balance(12345,200_000)
test.display_balance(12345)
puts "-----------------------------------------------"
test.display_balance(12346)
puts "-----------------------------------------------"
test2 = Another_Account.new("LOL",1_000_000_000)
test2.display_balance(56789)
test2.withdraw_balance(56789,500_000_000)
test2.display_balance(56789)
test2.deposit_balance(56789,999_999)
test2.display_balance(56789)
puts "-----------------------------------------------"
test2.display_balance(56780)
