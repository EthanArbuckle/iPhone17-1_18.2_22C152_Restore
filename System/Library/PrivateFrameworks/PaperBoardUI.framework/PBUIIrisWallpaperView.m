@interface PBUIIrisWallpaperView
- (BOOL)_setupContentViewForMode:(int64_t)a3;
- (BOOL)isIrisInteracting;
- (NSURL)videoFileURL;
- (PBUIIrisWallpaperPlayerDelegate)irisDelegate;
- (PBUIIrisWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8;
- (UIGestureRecognizer)irisGestureRecognizer;
- (double)stillTimeInVideo;
- (id)_playbackReasonForSimulatedTouchReason:(id)a3;
- (id)videoPlayerForPlayerView:(id)a3;
- (int64_t)currentIrisMode;
- (int64_t)irisPlaybackState;
- (int64_t)wallpaperType;
- (void)_populateContentView;
- (void)_resetPrewiredAVPlayer;
- (void)_setPlayerGestureRecognizer:(id)a3;
- (void)_setupContentViewWithOptions:(unint64_t)a3;
- (void)beginSimulatedTouchWithReason:(id)a3;
- (void)dealloc;
- (void)endSimulatedTouchWithReason:(id)a3;
- (void)playerViewIsInteractingDidChange:(id)a3;
- (void)playerViewPlaybackStateDidChange:(id)a3;
- (void)setIrisDelegate:(id)a3;
- (void)switchToIrisMode:(int64_t)a3;
@end

@implementation PBUIIrisWallpaperView

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerView);
  [WeakRetained setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)PBUIIrisWallpaperView;
  [(PBUIWallpaperView *)&v4 dealloc];
}

- (int64_t)wallpaperType
{
  return 3;
}

- (void)switchToIrisMode:(int64_t)a3
{
  -[PBUIIrisWallpaperView _setupContentViewForMode:](self, "_setupContentViewForMode:");
  self->_currentMode = a3;
  [(PBUIIrisWallpaperView *)self _populateContentView];
}

- (int64_t)irisPlaybackState
{
  return self->_playbackState;
}

- (BOOL)isIrisInteracting
{
  return self->_isInteracting;
}

- (UIGestureRecognizer)irisGestureRecognizer
{
  return self->_playerGestureRecognizer;
}

- (void)beginSimulatedTouchWithReason:(id)a3
{
  id v4 = a3;
  simulatedTouchReasons = self->_simulatedTouchReasons;
  id v10 = v4;
  if (!simulatedTouchReasons)
  {
    v6 = [MEMORY[0x1E4F1CA80] set];
    v7 = self->_simulatedTouchReasons;
    self->_simulatedTouchReasons = v6;

    id v4 = v10;
    simulatedTouchReasons = self->_simulatedTouchReasons;
  }
  [(NSMutableSet *)simulatedTouchReasons addObject:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerView);
  v9 = [(PBUIIrisWallpaperView *)self _playbackReasonForSimulatedTouchReason:v10];
  [WeakRetained startPlaybackWithReason:v9];
}

- (void)endSimulatedTouchWithReason:(id)a3
{
  simulatedTouchReasons = self->_simulatedTouchReasons;
  id v5 = a3;
  [(NSMutableSet *)simulatedTouchReasons removeObject:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerView);
  v6 = [(PBUIIrisWallpaperView *)self _playbackReasonForSimulatedTouchReason:v5];

  [WeakRetained stopPlaybackWithReason:v6];
}

- (id)_playbackReasonForSimulatedTouchReason:(id)a3
{
  return (id)[NSString stringWithFormat:@"Simulated touch with reason \"%@\"", a3];
}

- (void)_setupContentViewWithOptions:(unint64_t)a3
{
}

- (void)_setPlayerGestureRecognizer:(id)a3
{
  id v5 = a3;
  if (self->_playerState == 2)
  {
    id v8 = v5;
    v6 = self->_playerGestureRecognizer;
    objc_storeStrong((id *)&self->_playerGestureRecognizer, a3);
    if (v6 != self->_playerGestureRecognizer)
    {
      v7 = [(PBUIIrisWallpaperView *)self irisDelegate];
      if (objc_opt_respondsToSelector()) {
        [v7 irisWallpaperPlayer:self didReplaceGestureRecognizer:v6 withGestureRecognizer:self->_playerGestureRecognizer];
      }
    }
    id v5 = v8;
  }
}

- (void)_resetPrewiredAVPlayer
{
  prewiredAVPlayer = self->_prewiredAVPlayer;
  self->_prewiredAVPlayer = 0;

  id v4 = [MEMORY[0x1E4F4F730] serial];
  id v5 = [v4 serviceClass:25];
  id v9 = (id)BSDispatchQueueCreate();

  v6 = (ISAVPlayer *)[objc_alloc(getISAVPlayerClass()) initWithDispatchQueue:v9];
  v7 = self->_prewiredAVPlayer;
  self->_prewiredAVPlayer = v6;

  if (*MEMORY[0x1E4F1DB30] != self->_prewiredSize.width
    || *(double *)(MEMORY[0x1E4F1DB30] + 8) != self->_prewiredSize.height)
  {
    -[ISAVPlayer setDimensionsOfReservedVideoMemory:](self->_prewiredAVPlayer, "setDimensionsOfReservedVideoMemory:");
  }
}

- (BOOL)_setupContentViewForMode:(int64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->_currentMode == a3)
  {
    v6 = [(PBUIWallpaperView *)self contentView];

    if (v6) {
      return 0;
    }
  }
  [(PBUIIrisWallpaperView *)self _setPlayerGestureRecognizer:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerView);
  [WeakRetained setDelegate:0];
  [WeakRetained removeFromSuperview];
  objc_storeWeak((id *)&self->_playerView, 0);
  self->_playerState = 0;
  if (a3)
  {
    id v9 = [(ISAVPlayer *)self->_prewiredAVPlayer dispatchQueue];
    id v10 = v9;
    if (!v9)
    {
      id v10 = MEMORY[0x1E4F14428];
      id v11 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PBUIIrisWallpaperView__setupContentViewForMode___block_invoke;
    block[3] = &unk_1E62B2798;
    block[4] = self;
    dispatch_sync(v10, block);
    if (!v9) {

    }
    [(PBUIIrisWallpaperView *)self playerViewPlaybackStateDidChange:0];
    [(PBUIIrisWallpaperView *)self playerViewIsInteractingDidChange:0];
    [(PBUIStaticWallpaperView *)self _imageSize];
    v14 = -[PBUIStaticWallpaperImageView initWithFrame:]([PBUIStaticWallpaperImageView alloc], "initWithFrame:", 0.0, 0.0, v12, v13);
    objc_storeWeak((id *)&self->_imageView, v14);
    [(PBUIStaticWallpaperImageView *)v14 setContentMode:1];
    [(PBUIStaticWallpaperView *)self _setUpStaticImageContentView:v14];
    [(PBUIWallpaperView *)self setContentView:v14];
  }
  else
  {
    id v15 = objc_loadWeakRetained((id *)&self->_imageView);
    [v15 removeFromSuperview];

    objc_storeWeak((id *)&self->_imageView, 0);
    [(PBUIStaticWallpaperView *)self _imageSize];
    double v17 = v16;
    double v19 = v18;
    prewiredAVPlayer = self->_prewiredAVPlayer;
    if (prewiredAVPlayer)
    {
      if ([(ISAVPlayer *)prewiredAVPlayer status] == 2)
      {
        v21 = [(ISAVPlayer *)self->_prewiredAVPlayer error];
        v22 = [v21 domain];
        if ([v22 isEqualToString:*MEMORY[0x1E4F15AC0]])
        {
          uint64_t v23 = [v21 code];

          if (v23 == -11819) {
            [(PBUIIrisWallpaperView *)self _resetPrewiredAVPlayer];
          }
        }
        else
        {
        }
      }
    }
    else
    {
      [(PBUIIrisWallpaperView *)self _resetPrewiredAVPlayer];
    }
    id v24 = objc_loadWeakRetained((id *)&self->_playerView);

    if (v24)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2 object:self file:@"PBUIIrisWallpaperView.m" lineNumber:177 description:@"about to stomp on a previous playerView"];
    }
    v25 = +[PBUILivePhotoPlayerView playerViewWithRewindPlaybackStyle:self->_useRewindPlaybackStyle];
    objc_storeWeak((id *)&self->_playerView, v25);
    objc_msgSend(v25, "setFrame:", 0.0, 0.0, v17, v19);
    [v25 setDelegate:self];
    [(PBUIIrisWallpaperView *)self playerViewPlaybackStateDidChange:v25];
    [(PBUIIrisWallpaperView *)self playerViewIsInteractingDidChange:v25];
    [(PBUIWallpaperView *)self setContentView:v25];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v26 = self->_simulatedTouchReasons;
    uint64_t v27 = [(NSMutableSet *)v26 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v26);
          }
          [v25 startPlaybackWithReason:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        }
        uint64_t v28 = [(NSMutableSet *)v26 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v28);
    }

    id WeakRetained = v24;
  }

  return 1;
}

uint64_t __50__PBUIIrisWallpaperView__setupContentViewForMode___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 712) replaceCurrentItemWithPlayerItem:0];
}

- (void)_populateContentView
{
}

- (void)playerViewPlaybackStateDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerView);

  if (WeakRetained == v4)
  {
    unint64_t v6 = PBUIIrisWallpaperPlaybackStateForISPlaybackState([v4 playbackState]);
    v7 = PBUILogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = PBUIIrisWallpaperPlaybackStateDescription(self->_playbackState);
      id v9 = PBUIIrisWallpaperPlaybackStateDescription(v6);
      int v11 = 138412546;
      double v12 = v8;
      __int16 v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1BC4B3000, v7, OS_LOG_TYPE_DEFAULT, "Iris wallpaper playback state changed. Current State: %@, New State: %@", (uint8_t *)&v11, 0x16u);
    }
    if (v6 != -1 && v6 != self->_playbackState)
    {
      self->_playbackState = v6;
      id v10 = [(PBUIIrisWallpaperView *)self irisDelegate];
      if (objc_opt_respondsToSelector()) {
        [v10 irisWallpaperPlayerPlaybackStateDidChange:self];
      }
    }
  }
}

- (void)playerViewIsInteractingDidChange:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerView);
  if (WeakRetained == v7)
  {
    int v5 = [v7 isInteracting];
    if (self->_isInteracting != v5)
    {
      self->_isInteracting = v5;
      unint64_t v6 = [(PBUIIrisWallpaperView *)self irisDelegate];
      if (objc_opt_respondsToSelector()) {
        [v6 irisWallpaperPlayerIsInteractingDidChange:self];
      }
    }
  }
}

- (id)videoPlayerForPlayerView:(id)a3
{
  [(PBUIIrisWallpaperView *)self _resetPrewiredAVPlayer];
  prewiredAVPlayer = self->_prewiredAVPlayer;
  return prewiredAVPlayer;
}

- (PBUIIrisWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  v20 = [v17 videoURL];
  if ((a8 & 8) != 0)
  {
    v21 = [MEMORY[0x1E4F16330] assetWithURL:v20];
    v22 = [v21 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
    [v22 firstObject];
    id v23 = v18;
    v25 = id v24 = v20;
    [v25 naturalSize];
    self->_prewiredSize.double width = v26;
    self->_prewiredSize.double height = v27;

    v20 = v24;
    id v18 = v23;
  }
  self->_useRewindPlaybackStyle = (a8 & 0x10) != 0;
  v36.receiver = self;
  v36.super_class = (Class)PBUIIrisWallpaperView;
  uint64_t v28 = -[PBUIStaticWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v36, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, v17, a5, v18, v19, a8 | ((a8 & 0x10) >> 2), x, y, width, height);
  if (v28)
  {
    unint64_t v29 = (a8 & 0x10) >> 4;
    v30 = [v17 videoURL];
    uint64_t v31 = [v30 copy];
    videoFileURL = v28->_videoFileURL;
    v28->_videoFileURL = (NSURL *)v31;

    long long v33 = [v17 wallpaperOptions];
    [v33 stillTimeInVideo];
    v28->_stillTimeInVideo = v34;

    v28->_useRewindPlaybackStyle = v29;
    [(PBUIIrisWallpaperView *)v28 _populateContentView];
  }

  return v28;
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

- (NSURL)videoFileURL
{
  return self->_videoFileURL;
}

- (int64_t)currentIrisMode
{
  return self->_currentMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedTouchReasons, 0);
  objc_storeStrong((id *)&self->_playerGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_playerView);
  objc_storeStrong((id *)&self->_prewiredAVPlayer, 0);
  objc_storeStrong((id *)&self->_videoFileURL, 0);
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_irisDelegate);
}

@end