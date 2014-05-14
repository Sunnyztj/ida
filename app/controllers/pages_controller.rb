class PagesController < ApplicationController

  def show
    @page = Page.find params[:id]
    if @page.nil?
      redirect_to root_path
      return
    end
    render params[:id].underscore if lookup_context.template_exists?(params[:id].underscore, "pages", false)
  end

end