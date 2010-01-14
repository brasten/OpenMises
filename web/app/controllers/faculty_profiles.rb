class FacultyProfiles < Application
  # provides :xml, :yaml, :js

  def index
    @faculty_profiles = FacultyProfile.all
    display @faculty_profiles
  end

  def show(id)
    @faculty_profile = FacultyProfile.get(id)
    raise NotFound unless @faculty_profile
    display @faculty_profile
  end

  def new
    only_provides :html
    @faculty_profile = FacultyProfile.new
    display @faculty_profile
  end

  def edit(id)
    only_provides :html
    @faculty_profile = FacultyProfile.get(id)
    raise NotFound unless @faculty_profile
    display @faculty_profile
  end

  def create(faculty_profile)
    @faculty_profile = FacultyProfile.new(faculty_profile)
    if @faculty_profile.save
      redirect resource(@faculty_profile), :message => {:notice => "FacultyProfile was successfully created"}
    else
      message[:error] = "FacultyProfile failed to be created"
      render :new
    end
  end

  def update(id, faculty_profile)
    @faculty_profile = FacultyProfile.get(id)
    raise NotFound unless @faculty_profile
    if @faculty_profile.update(faculty_profile)
       redirect resource(@faculty_profile), :message => {:notice => "FacultyProfile was successfully updated"}
    else
      message[:error] = "FacultyProfile failed to be updated"
      display @faculty_profile, :edit
    end
  end

  def destroy(id)
    @faculty_profile = FacultyProfile.get(id)
    raise NotFound unless @faculty_profile
    if @faculty_profile.destroy
      redirect resource(:faculty_profiles), :message => {:notice => "FacultyProfile was successfully deleted"}
    else
      raise InternalServerError
    end
  end

end # FacultyProfiles
