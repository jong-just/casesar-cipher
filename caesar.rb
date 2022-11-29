#main function, first converts string+convert to ascii. then each letter
#is ran through the cipher
def caesar_cipher(phrase, key = 0)
  #convert to array and ascii
  message = ascii_conversion(phrase)

  #new array to hold converted message
  new_message = []

  #running through each array and pushing the converted letter to
  #new message
  for i in 0..phrase.length-1
    new_message.push(character_check(message[i], key))
  end

  return decipher(new_message)
end

#function that splits the string that converts each letter into ascii and
#inputs into an array
def ascii_conversion(phrase)
  message = []
  for i in 0..phrase.length-1
    message.push(phrase[i].ord)
  end
  return message
end

#function that sorts the character between upper case, lower case, non-letter
def character_check(character, key)
  if character >= 65 && character <= 90
    upcase_cipher(character, key) #sends upper case letter to be converted
  elsif character >= 97 && character <= 122
    downcase_cipher(character, key) #sends lower case letter to be converted
  else
    character #these are non-letter, does nothing to them
  end

  #no return as this function runs one letter at a time, once
end

#function that runs the cipher for lower case letters
def downcase_cipher(down_character, key)
  key.times do
    down_character+=1

    #wrap around
    if down_character == 123
      down_character = 97
    end
  end

  #needs return because things are ran multiple times in this function
  return down_character
end

#function that runs the cipher for upper case letters
def upcase_cipher(up_character, key)
  key.times do
    up_character+=1

    #wrap around
    if up_character == 91
      up_character = 65
    end
  end

  #needs return because multiple times are ran
  return up_character
end

#deciphers the message and brings it back into string
def decipher(phrase)
  message = []
  for i in 0..phrase.length-1
    message.push(phrase[i].chr)
  end

  #returns the array as a string
  return message.join
end

#message input from user
print "Message: "
secret = gets.chomp

#key input from user
print "Key: "
code = gets.chomp.to_i

#outputs results
puts "Secret: #{caesar_cipher(secret, code)}"


#The PLAN
#convert phrase to ascii
#goes over each character
#if letters, convert
#if not letters, skip
#return it