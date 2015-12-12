class ProjectsController < ApplicationController
    
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
end
