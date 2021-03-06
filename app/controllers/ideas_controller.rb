class IdeasController < ApplicationController

  before_action :set_idea, only: [ :show, :update ]

  def index
    # byebug
    @ideas = Idea.includes(:participant, :tags).order(:stars => :desc).paginate(page: params[:page], per_page: 9)

    @idea_id = params[:idea_id]

    # if participant_signed_in?
    #   @participant = Participant.find(current_participant[:id])
    #   tags = @participant.tags
    # elsif organizer_signed_in?
    #   @organizer = Organizer.find(current_organizer[:id])
    #   tags = @organizer.tags
    # else 
    #   flag = 1
    # end
      
    # @ideas = []
    # idea_id = []
    # if flag != 1
    #   tags.each do |tag|
    #     idea_tmp = Idea.joins(:tags).where('tags.id = ?', tag)

    #     idea_tmp.each do |idea|
    #       if !idea_id.include? idea.id
    #         idea_id << idea.id
    #         @ideas << idea
    #       end
    #     end
    #   end 
    # end

    # if @ideas.nil? || @ideas.length==0
    #   @ideas = Idea.all
    # end
  end

  def show
  end

  def update
    like_change = params[:like] == "true" ? 1 : -1
    @idea.stars = [0, @idea.stars + like_change].max
    @idea.save

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

end
