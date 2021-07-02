require_relative 'init'
require_relative 'db'

require 'rom-factory'

Factory = ROM::Factory.configure do |config|
  config.rom = DB.db
end

Factory.define(:foo, struct_namespace: Entities) do |f|
end

Factory.define(:bar, struct_namespace: Entities) do |f|
end

puts Factory.structs[:foo].inspect
puts Factory.structs[:bar].inspect
