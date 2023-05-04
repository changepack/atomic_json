module AtomicJson
  module Callbacks
    def self.run(on:)
      on.run_callbacks(:save) do
        if on.new_record?
          on.run_callbacks(:create) do
            on.run_callbacks(:commit) do
              yield
            end
          end
        else
          on.run_callbacks(:update) do
            on.run_callbacks(:commit) do
              yield
            end
          end
        end
      end
    end
  end
end
