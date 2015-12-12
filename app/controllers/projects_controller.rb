class ProjectsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    
    def index
        @projects = Project.all
        @displayed_projects = Project.take(4)
    end
    
    def show
    end
    
    def new
        @project = Project.new
    end
    
    def edit
    end
    
    def create
        @project = current_user.projects.build(project_params)
        respond_to do |format|
            if @project.save
                format.html { redirect_to @project, notice: "Project was successfuly created!" }
                format.html { render :show, status: :ok, location: @project }
            else
                format.html { render :new }
                format.json { render json: @project.errors, status: :unprocessable_entity }
            end
        end
    end
    
    
    private
    
    def set_project
        @project = Project.find(params[:id])
    end
    
    def project_params
        params.require(:project).permit(:name, :short_description, :description, :goal, :image_url, :expiration_date)
    end
end
