class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(beefy_params(:name, :artist_id, :genre_id))
    redirect_to artist_path(@artist)
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(beefy_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  private

  def beefy_params(*args)
    params.require(:artist).permit(*args)
  end

end
