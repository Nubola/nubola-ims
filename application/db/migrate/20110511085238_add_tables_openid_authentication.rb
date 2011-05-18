class AddTablesOpenidAuthentication < ActiveRecord::Migration
  def self.up
 		create_table "open_id_authentication_associations", :force => true do |t|
		  t.integer "issued"
		  t.integer "lifetime"
		  t.string  "handle"
		  t.string  "assoc_type"
		  t.binary  "server_url"
		  t.binary  "secret"
 		end

		create_table "open_id_authentication_nonces", :force => true do |t|
		  t.integer "timestamp",  :null => false
		  t.string  "server_url"
		  t.string  "salt",       :null => false	
  	end

		add_column :users, :identity_url, :string
  end

  def self.down
	  drop_column :users, :identity_url
 		drop_table "open_id_authentication_associations"
    drop_table "open_id_authentication_nonces"
  end
end
