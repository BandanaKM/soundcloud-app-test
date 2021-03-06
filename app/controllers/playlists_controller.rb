class PlaylistsController < ApplicationController

  # before_action :require_user
  # before_action :require_user


  def index
    @playlists = Playlist.all
  end


  def show
    @playlist = Playlist.find(params[:id])
  end


  def new
    @playlist = Playlist.new
    @songs = Song.all
  end


  def create
    @playlist = Playlist.new(playlist_params)
    params[:playlist][:song_ids].pop
    song_ids = params[:playlist][:song_ids]
    songs = Song.where(id: song_ids)
    @playlist.songs = songs
    if @playlist.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  # need to refactor this code. also need to make sure a user can add songs to their playlist. 

  # playlist needs to be associate with a current user 


  def edit
    @playlist = Playlist.find(params[:id])
  end


  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update_attributes(playlist_params)
      redirect_to(:action => 'show', :id => @playlist.id)
    else
      render('index')
    end
  end


  def destroy
    playlist = Playlist.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end



  private

    def playlist_params
      params.require(:playlist).permit(:title)
    end

end
