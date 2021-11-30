class SubsController < ApplicationController
  # index, show, new, and edit are pages that the user can see 
  # fat models, skinny controllers 
  # any logic with the object or instance of the object would be in the model
  # controllers are traffic directors (main actions)
  # actions - functionality you are able to do in the app 
  # crud      http verb
  # Create    post
  # Read      get
  # Update    put
  # Destroy   delete
  # actions needs to return html, xml, or json, redirect to an action that does 
  # each action will be its own method

# index - show all of the objects in the table, show a list of objects
  # - showing all the subs within the app 
# show - show an individual record, pass in an obj id 
  # individual object
# new - create the obj but only in memory, return the new form 
# create - creation of the obj into the database with the info from before
# edit - pass in the obj id, update but only in memory, return the edit form 
# update - pass in the obj id, updates in the database with the info from the form 
# destroy - pass in object id, delete from the database, redirect to another action 

# private_params - helper to validate in the controller side 
# helper methods - help you out with other actions 
# pattern, pay attention to the case, plural or not, model name 
# pattern to the parent relationship 
# if child controller, replace Model_name -> @parent.model_names
# at the top
# before_action :set_parent
# # at the bottom
# private
# def set_parent
# @parent = ParentModelName.find(params[:parent_id])
# end

# def index
# @model_names = Model_name.all 
# render component: 'ModelNames', props: {model_names: @model_names}
# end

# def show
#   @model_name = Model_name.find(params[:id])
#   render component: 'ModelName', props: { model_name: @model_name}
# end

# def new
#  @model_name = Model_name.new()
#   render component: 'ModelNameNew', props: { model_name: @model_name}
# end

# def create
#   @model_name = Model_name.new(model_name_params)
#   if model_name.save
#     #take them to another action
#   else
#     render component 'ModelNameNew', props: { model_name: @model_name }
#   end
# end

# def edit
#   @model_name = Model_name.find(params[:id])
#   render component 'ModelNameEdit', props: {model_name: @model_name}
# end

# def update
# @model_name = Model_name.find(params[:id])
#   if @model_name.updates(model_name_params)
#     #take them to another action
#   else
#     render component 'ModelNameEdit', props: { model_name: @model_name}
#   end
# end

# def destroy
#   @model_name = Model_name.find(params[:id])
#   @model_name.destroy 
#   # take them to another action 

#   # or

#   Model_name.find(params[:id]).destroy 
#   # take them to another action 
# end

# - at the end of the controller
# private 
#  def model_name_params
#   params.require(:model_name).permit(:attr, :attr2))
#  end

# model - sub
  def index
    @subs = Sub.all
    render component: 'Subs', props: {subs: @subs}
  end

  def show
    @sub = Sub.find(params[:id])
    render component: 'Sub', props: {sub: @sub}
  end

  def new
    @sub = Sub.new
    render component: 'SubNew', props: {sub: @sub}
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to subs_path
    else
      render component: 'SubNew', props: {sub: @sub}
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render component: 'SubEdit', props: {sub: @sub}
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render component: 'SubEdit', props: {sub: @sub }
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
   redirect_to subs_path
    # or
    # Sub.find(params[:id]).destroy
    # redirect_to subs_path
  end

  private
  # { sub: { name: '' } }
  # sql injection
  # { sub: { name: select * from CCNUM} }
   # { sub: { name: 'select * from CCNUM'} }
  # # not permitted
  # { sub: {name: '', age: 23}}
  # { sub: {name: 23, age: 23}}
    def sub_params
     params.require(:sub).permit(:name) 
    end


end
