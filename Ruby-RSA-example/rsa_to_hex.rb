require 'openssl'
require "base64"
require "json"

raw_data = '123456789'

# 加密结果转为 hex 表示
def bcd_to_hex(str)
  bytes_hex = []
  str.bytes.each do |b|
    val = ((b & 0xf0) >> 4) & 0x0f
    bytes_hex << val.to_s(16)

    val = b & 0x0f
    bytes_hex << val.to_s(16)
  end
  bytes_hex.join()
end

rsa = OpenSSL::PKey::RSA.new  File.read "cms.pem"
encrypt_str = rsa.public_encrypt(raw_data)
encrypt_str = bcd_to_hex(encrypt_str)

puts '--' * 5
puts encrypt_str.length
puts encrypt_str
