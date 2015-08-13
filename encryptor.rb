class Encryptor
  def cipher(rotation)
      characters = (' '..'z').to_a
      characters << "\n"
      rotated_characters = characters.rotate(rotation)
      Hash[characters.zip(rotated_characters)]
    end

    def encrypt_letter(letter,rotation)
      cipher_for_rotation = cipher(rotation)
      cipher_for_rotation[letter]
    end

    def encrypt(string,rotation)
      letters = string.split("")
      results = []
      letters.collect {|letter| results.push(encrypt_letter(letter,rotation)) }

      results.join
    end

    def decrypt(string, rotation)
      encrypt(string,-rotation)
    end

    def encrypt_file(filename, rotation)
      input = File.open(filename, "r")
      text = input.read
      encrypted = encrypt(text, rotation)
      out_name = ( "#{filename}.encrypted")
      out = File.open(out_name, "w")
      out.write(encrypted)
      out.close
    end

    def decrypt_file(filename, rotation)
        input = File.open(filename, "r")
        text = input.read
        decrypted = decrypt(text, rotation)
        output_filename = filename.gsub("encrypted", "decrypted")
        out = File.open(output_filename, "w")
        out.write(decrypted)
        out.close
    end
end

    class Encryptor
      #... other Encryptor methods ...

      def supported_characters
        (' '..'z').to_a
      end

      def crack(message)
        supported_characters.count.times.collect do |attempt|
          decrypt(message,attempt)
        end
      end

  end


# This is a commment and you car erase when back. It will not effect your code.. it is for commenting on your code.
