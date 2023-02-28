class CreateLeases < ActiveRecord::Migration[6.1]
  def change
    create_table :leases do |t|
      t.integer :rent
      t.references :apartment, index: true, foreign_key: true
      t.references :tenant, index: true, foreign_key: true

      t.timestamps
    end
  end
end
