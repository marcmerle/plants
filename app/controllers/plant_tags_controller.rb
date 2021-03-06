class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    # @tags = Tag.where(id: params[:plant_tag][:tag])
    tag_ids = params[:plant_tag][:tag]
    tag_ids.each do |tag_id|
      @plant_tag = PlantTag.new(plant: @plant, tag_id: tag_id)
      @plant_tag.save
    end
    redirect_to garden_path(@plant.garden)
  end
end
