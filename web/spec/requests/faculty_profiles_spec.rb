require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a faculty_profile exists" do
  FacultyProfile.all.destroy!
  request(resource(:faculty_profiles), :method => "POST", 
    :params => { :faculty_profile => { :id => nil }})
end

describe "resource(:faculty_profiles)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:faculty_profiles))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of faculty_profiles" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a faculty_profile exists" do
    before(:each) do
      @response = request(resource(:faculty_profiles))
    end
    
    it "has a list of faculty_profiles" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      FacultyProfile.all.destroy!
      @response = request(resource(:faculty_profiles), :method => "POST", 
        :params => { :faculty_profile => { :id => nil }})
    end
    
    it "redirects to resource(:faculty_profiles)" do
      @response.should redirect_to(resource(FacultyProfile.first), :message => {:notice => "faculty_profile was successfully created"})
    end
    
  end
end

describe "resource(@faculty_profile)" do 
  describe "a successful DELETE", :given => "a faculty_profile exists" do
     before(:each) do
       @response = request(resource(FacultyProfile.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:faculty_profiles))
     end

   end
end

describe "resource(:faculty_profiles, :new)" do
  before(:each) do
    @response = request(resource(:faculty_profiles, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@faculty_profile, :edit)", :given => "a faculty_profile exists" do
  before(:each) do
    @response = request(resource(FacultyProfile.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@faculty_profile)", :given => "a faculty_profile exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(FacultyProfile.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @faculty_profile = FacultyProfile.first
      @response = request(resource(@faculty_profile), :method => "PUT", 
        :params => { :faculty_profile => {:id => @faculty_profile.id} })
    end
  
    it "redirect to the faculty_profile show action" do
      @response.should redirect_to(resource(@faculty_profile))
    end
  end
  
end

