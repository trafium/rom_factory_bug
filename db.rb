require 'rom'
require 'rom-sql'

module Entities
  class Foo < ROM::Struct; end

  class Bar < ROM::Struct; end
end

class Foos < ROM::Relation[:sql]
  UUID = Types::String.default { SecureRandom.uuid }

  schema(:foos, infer: true) do
    attribute :column_with_default, UUID
  end
end

class Bars < ROM::Relation[:sql]
  UUID = Types::String.default { SecureRandom.uuid }

  schema(:bars, infer: true) do
    attribute :column_with_default, UUID
  end
end

module DB
  def self.db
    @rom ||= ROM.container(configuration)
  end

  def self.configuration
    @configuration ||= ROM::Configuration.new(:sql, ENV.fetch('DATABASE_URL')) do |config|
      config.register_relation(Foos)
      config.register_relation(Bars)
    end
  end
end
