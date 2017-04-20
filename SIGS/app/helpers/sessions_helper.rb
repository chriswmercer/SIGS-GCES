module SessionsHelper

  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def permission
    coordinator = Coordinator.find_by(user_id: session[:user_id])
    department_assistant = DepartmentAssistant.find_by(user_id: session[:user_id])
    administrative_assistant = AdministrativeAssistant.find_by(user_id: session[:user_id])
    if coordinator
      @permission ||= {:level => 1, :type => "Coordinator"}
  elsif department_assistant
      @permission ||= {:level => 2, :type => "Department Assistant"}
  elsif administrative_assistant
      @permission ||= {:level => 3, :type => "Administrative Assistant"}
    end
  end

  def logged_in?
      if current_user.nil?
        flash.now[:notice] =  'Você precisa estar logado'
        render 'sessions/new'
      end
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
    @permission = nil
  end
end