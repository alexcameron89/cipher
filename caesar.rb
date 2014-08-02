class Caesar
	def initialize(message = "", key)
		@message = message.downcase
		@key = key
		@dictionary = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		@index = { "a" => 0, "b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7, "i" => 8, "j" => 9, "k" => 10, "l" => 11, "m" => 12, "n" => 13, "o" => 14, "p" => 15, "q" => 16, "r" => 17, "s" => 18, "t" => 19, "u" => 20, "v" => 21, "w" => 22, "x" => 23, "y" => 24, "z" => 25 }
	end


	# Could Encrypt & Decrypt work without shifting the dictionary? Add to @index value instead?
	def shift_dictionary(key = @key)
		shift = @dictionary.slice!(0...(key))
		@dictionary = @dictionary << shift
	end

	def encrypt
		shift_dictionary
		run_cipher
	end

	def decrypt
		@message.downcase!
		shift_dictionary(26-(@key * 2))
		run_cipher
	end

	def run_cipher
		@message.downcase!
		@message = @message.split("")
		@message.each do |letter|
			letter.replace(@dictionary[@index[letter]]) if letter.match(/[a-z]/)
		end
		@message = @message.join("")
		@message		
	end

	def change_key(new_key)
		@key = new_key
		puts "The shift key is now #{@key}"
	end
end