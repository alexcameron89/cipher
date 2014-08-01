class Caesar
	def initialize(message = "", key)
		@message = message.downcase
		@key = key
		@dictionary = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		@index = { "a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5, "f" => 6, "g" => 7, "h" => 8, "i" => 9, "j" => 10, "k" => 11, "l" => 12, "m" => 13, "n" => 14, "o" => 15, "p" => 16, "q" => 17, "r" => 18, "s" => 19, "t" => 20, "u" => 21, "v" => 22, "w" => 23, "x" => 24, "y" => 25, "z" => 26 }

	end

	def shift_dictionary(key = @key)
		shift = @dictionary.slice!(0..(key - 1))
		@dictionary = @dictionary << shift
	end

	def encrypt
		shift_dictionary
		@message = @message.split("")
		@message.each do |letter|
			next if letter.match(/[^a-z]/)
			letter.replace(@dictionary[@index[letter]]) if letter.match(/[a-z]/)
		end
		@message = @message.join("")
		@message
	end

# BROKEN
	def decrypt
		@message.downcase!
		shift_dictionary(27-@key*2)
		@message = @message.split("")
		@message.each do |letter|
			next if letter.match(/[^a-z]/)
			letter.replace(@dictionary[@index[letter]-@key]) if letter.match(/[a-z]/)
		end
		@message = @message.join("")
		@message

	end
end