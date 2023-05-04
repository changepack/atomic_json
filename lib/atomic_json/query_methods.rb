# frozen_string_literal: true

require 'atomic_json/query'
require 'atomic_json/callbacks'

module AtomicJson
  module QueryMethods

    extend ActiveSupport::Concern

    def json_update(input)
      Callbacks.run(on: self) do
        Query.new(self)
          .build(input, touch: true)
          .execute!
        reload.validate
      end
    end

    def json_update!(input)
      Callbacks.run(on: self) do
        Query.new(self)
          .build(input, touch: true)
          .execute!
        reload.validate!
      end
    end

    def json_update_columns(input)
      Query.new(self)
        .build(input)
        .execute!
    end

  end
end
