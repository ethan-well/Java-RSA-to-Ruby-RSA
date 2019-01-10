require 'openssl'
require 'base64'

data = '123456789WEWEWE'
key_public = OpenSSL::PKey::RSA.new File.read 'rsa_pub.pem'

puts key_public.public?
encrypt_str = key_public.public_encrypt(data)
puts Base64.encode64(encrypt_str)

puts '---'*5

key_private = OpenSSL::PKey::RSA.new File.read 'rsa_private.pem'
puts key_private.private?
puts key_private.private_decrypt(encrypt_str)