# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :foos do
      primary_key :id

      column :random_column, String
      column :column_with_default, String
    end

    create_table :bars do
      primary_key :id

      column :random_column, 'jsonb'
      column :column_with_default, String
    end
  end
end
