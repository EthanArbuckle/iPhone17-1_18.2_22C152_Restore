@interface PBUIScrollableIrisWallpaperView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isIrisInteracting;
- (NSURL)videoFileURL;
- (PBUIIrisWallpaperPlayerDelegate)irisDelegate;
- (PBUIScrollableIrisWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 wallpaperVideo:(id)a5 variant:(int64_t)a6;
- (UIGestureRecognizer)irisGestureRecognizer;
- (double)stillTimeInVideo;
- (id)_newImageView;
- (int64_t)irisPlaybackState;
- (void)dealloc;
- (void)playerViewIsInteractingDidChange:(id)a3;
- (void)playerViewPlaybackStateDidChange:(id)a3;
- (void)setIrisDelegate:(id)a3;
@end

@implementation PBUIScrollableIrisWallpaperView

- (PBUIScrollableIrisWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 wallpaperVideo:(id)a5 variant:(int64_t)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PBUIScrollableIrisWallpaperView;
  v15 = -[PBUIScrollableStaticWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v27, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, v13, a6, 0, 0, 0, x, y, width, height);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_video, a5);
    [(PBUILivePhotoPlayerView *)v16->_playerView setContentMode:1];
    v17 = [v13 wallpaperImage];
    v18 = [v13 wallpaperOptions];
    [v18 stillTimeInVideo];
    double v20 = v19;

    playerView = v16->_playerView;
    id v22 = v17;
    -[PBUILivePhotoPlayerView prepareWithPhoto:videoAsset:photoTime:photoEXIFOrientation:](playerView, "prepareWithPhoto:videoAsset:photoTime:photoEXIFOrientation:", [v22 CGImage], v16->_video, objc_msgSend(v22, "pbui_EXIFOrientation"), v20);
    v23 = [(PBUILivePhotoPlayerView *)v16->_playerView gestureRecognizer];
    [v23 setDelegate:v16];

    v24 = [(PBUIScrollableStaticWallpaperView *)v16 _scrollView];
    v25 = [(PBUILivePhotoPlayerView *)v16->_playerView gestureRecognizer];
    [v24 addGestureRecognizer:v25];
  }
  return v16;
}

- (void)dealloc
{
  [(PBUILivePhotoPlayerView *)self->_playerView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PBUIScrollableIrisWallpaperView;
  [(PBUIScrollableStaticWallpaperView *)&v3 dealloc];
}

- (int64_t)irisPlaybackState
{
  return self->_playbackState;
}

- (BOOL)isIrisInteracting
{
  return [(PBUILivePhotoPlayerView *)self->_playerView isInteracting];
}

- (UIGestureRecognizer)irisGestureRecognizer
{
  return [(PBUILivePhotoPlayerView *)self->_playerView gestureRecognizer];
}

- (id)_newImageView
{
  objc_super v3 = [(PBUIStaticWallpaperView *)self wallpaperImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  v8 = +[PBUILivePhotoPlayerView playerViewWithRewindPlaybackStyle:0];
  playerView = self->_playerView;
  self->_playerView = v8;

  -[PBUILivePhotoPlayerView setFrame:](self->_playerView, "setFrame:", 0.0, 0.0, v5, v7);
  [(PBUILivePhotoPlayerView *)self->_playerView setDelegate:self];
  [(PBUIScrollableIrisWallpaperView *)self playerViewPlaybackStateDidChange:self->_playerView];
  v10 = self->_playerView;
  return v10;
}

- (NSURL)videoFileURL
{
  objc_super v3 = self;
  if (objc_opt_isKindOfClass())
  {
    double v4 = [(AVAsset *)self->_video URL];
  }
  else
  {
    double v4 = 0;
  }

  return (NSURL *)v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a4;
  double v6 = [(PBUIScrollableStaticWallpaperView *)self _scrollView];
  id v7 = [v6 panGestureRecognizer];
  if (v7 == v5)
  {
    BOOL v10 = 1;
  }
  else
  {
    v8 = [(PBUIScrollableStaticWallpaperView *)self _scrollView];
    id v9 = [v8 pinchGestureRecognizer];
    BOOL v10 = v9 == v5;
  }
  return v10;
}

- (void)playerViewPlaybackStateDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_playerView == a3)
  {
    unint64_t v4 = PBUIIrisWallpaperPlaybackStateForISPlaybackState([a3 playbackState]);
    id v5 = PBUILogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = PBUIIrisWallpaperPlaybackStateDescription(self->_playbackState);
      id v7 = PBUIIrisWallpaperPlaybackStateDescription(v4);
      int v9 = 138412546;
      BOOL v10 = v6;
      __int16 v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_DEFAULT, "Scrollable Iris wallpaper playback state changed. Current State: %@, New State: %@", (uint8_t *)&v9, 0x16u);
    }
    if (v4 != -1 && v4 != self->_playbackState)
    {
      self->_playbackState = v4;
      v8 = [(PBUIScrollableIrisWallpaperView *)self irisDelegate];
      if (objc_opt_respondsToSelector()) {
        [v8 irisWallpaperPlayerPlaybackStateDidChange:self];
      }
    }
  }
}

- (void)playerViewIsInteractingDidChange:(id)a3
{
  if (self->_playerView == a3)
  {
    id v4 = [(PBUIScrollableIrisWallpaperView *)self irisDelegate];
    if (objc_opt_respondsToSelector()) {
      [v4 irisWallpaperPlayerIsInteractingDidChange:self];
    }
  }
}

- (PBUIIrisWallpaperPlayerDelegate)irisDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_irisDelegate);
  return (PBUIIrisWallpaperPlayerDelegate *)WeakRetained;
}

- (void)setIrisDelegate:(id)a3
{
}

- (double)stillTimeInVideo
{
  return self->_stillTimeInVideo;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_irisDelegate);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_video, 0);
}

@end