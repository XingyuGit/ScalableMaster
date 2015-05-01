class Participants::ProfileController < ApplicationController

  before_action :set_participant, only: [ :show, :update ]

  def show
  end

  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to participant_profile_path(@participant), 
                      notice: 'Participant was successfully updated.' }
        format.js
      else
        format.html { render :show }
        format.js
      end
    end
  end

  private
    def set_participant
      @participant = Participant.find(params[:participant_id])
    end

    def participant_params
      params.require(:participant).permit(:name, :nickname, :gender, :age, :phone, :address, :img_url)
    end

end