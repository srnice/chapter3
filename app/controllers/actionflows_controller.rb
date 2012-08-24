
class ActionflowsController < ApplicationController
  def index
    @actionflows = Actionflow.all

    #@actionflows1 = Actionflow.paginate(:page => params[:page], :order => "created_at DESC", :per_page => 10)

    if params[:is_dashboard] == "true"
      render 'actionflows/index_dashboard' 
    else
      render 'actionflows/index'
    end

    
  end
  
  def show

    @actionflow = Actionflow.find(params[:id])

    respond_to do |format| 
      format.html # foo/bar.html.erb 
      format.js   # foo/bar.js.erb 
    end 
    
  end
  
  def create
  end
  
  def edit

  end
  
  def update
  end
  
  def destroy
  end  
end