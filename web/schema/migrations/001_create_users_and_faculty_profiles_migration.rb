migration 1, :create_users_and_faculty_profiles  do
  up do
    create_table :users do
      column :id, DataMapper::Types::Serial
      column :login, String
      column :crypted_password, String
      column :salt, String
      column :email_address, String
      column :is_active, DataMapper::Types::Boolean
      column :created_at, DateTime
    end
    
    create_table :faculty_profiles do
      column :user_id, Integer, :primary_key => true
      column :name, String
      column :school, String
      column :email_address, String
      column :web_address, String
      column :job_title, String
      column :created_at, DateTime
    end
  end

  down do
    drop_table :faculty_profiles
    drop_table :users
  end
end
