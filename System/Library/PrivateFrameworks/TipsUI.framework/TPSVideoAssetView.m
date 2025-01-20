@interface TPSVideoAssetView
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- (BOOL)displayingVideoLastFrame;
- (BOOL)lastFrameDominant;
- (BOOL)readyToDisplayAVPlayer;
- (BOOL)supportsVideoAssetViewCanShowMedia;
- (BOOL)supportsVideoAssetViewFinishedPlayingVideo;
- (BOOL)supportsVideoAssetViewUpdateAssetLoadingFinished;
- (BOOL)updateImageToVideoLastFrame;
- (BOOL)videoInProgress;
- (BOOL)videoPlaybackFinished;
- (NSString)cacheVideoIdentifier;
- (NSString)downloadedVideoPath;
- (NSString)videoPath;
- (TPSURLSessionItem)videoURLSessionItem;
- (TPSVideoAssetViewDelegate)videoDelegate;
- (UIButton)replayButton;
- (UIImage)lastFrameImage;
- (UIImageView)replayGradientView;
- (double)videoDelayTime;
- (void)avplayerDidFinishPlaying:(id)a3;
- (void)avplayerItemErrorChanged:(id)a3;
- (void)cancel;
- (void)cancelReplayButtonTimer;
- (void)cancelVideoDownloadTask;
- (void)commonInit;
- (void)continuePlayVideo;
- (void)dealloc;
- (void)fetchImageWithIdentifier:(id)a3 path:(id)a4;
- (void)layoutSubviews;
- (void)playVideo;
- (void)playVideoDelay;
- (void)removeVideoPlayerLayer;
- (void)replayVideo;
- (void)resetVideoPlayer;
- (void)restartVideoDelay;
- (void)scrubVideoToFirstFrame;
- (void)setAspectFillAsset:(BOOL)a3;
- (void)setCacheVideoIdentifier:(id)a3;
- (void)setDownloadedVideoPath:(id)a3;
- (void)setLastFrameDominant:(BOOL)a3;
- (void)setLastFrameImage:(id)a3;
- (void)setReadyToDisplayAVPlayer:(BOOL)a3;
- (void)setReplayButton:(id)a3;
- (void)setReplayGradientView:(id)a3;
- (void)setSupportsVideoAssetViewCanShowMedia:(BOOL)a3;
- (void)setSupportsVideoAssetViewFinishedPlayingVideo:(BOOL)a3;
- (void)setSupportsVideoAssetViewUpdateAssetLoadingFinished:(BOOL)a3;
- (void)setVideoDelayTime:(double)a3;
- (void)setVideoDelegate:(id)a3;
- (void)setVideoPath:(id)a3;
- (void)setVideoPlaybackFinished:(BOOL)a3;
- (void)setVideoURLSessionItem:(id)a3;
- (void)stopVideoPlayer;
- (void)updateReplayButtonHiddenState:(BOOL)a3;
- (void)updateVideoGravity;
@end

@implementation TPSVideoAssetView

- (void)dealloc
{
  [(TPSVideoAssetView *)self stopVideoPlayer];
  [(TPSVideoAssetView *)self cancelVideoDownloadTask];
  [(TPSKVOManager *)self->_KVOManager removeAllKVOObjects];
  v3.receiver = self;
  v3.super_class = (Class)TPSVideoAssetView;
  [(TPSVideoAssetView *)&v3 dealloc];
}

- (void)commonInit
{
  v5.receiver = self;
  v5.super_class = (Class)TPSVideoAssetView;
  [(TPSImageAssetView *)&v5 commonInit];
  objc_super v3 = (TPSKVOManager *)[objc_alloc(MEMORY[0x263F7F5F0]) initWithObserver:self];
  KVOManager = self->_KVOManager;
  self->_KVOManager = v3;

  self->_videoDelayTime = 0.4;
}

- (void)setVideoDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_videoDelegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_videoDelegate, obj);
    self->_supportsVideoAssetViewCanShowMedia = objc_opt_respondsToSelector() & 1;

    id v6 = objc_loadWeakRetained((id *)&self->_videoDelegate);
    self->_supportsVideoAssetViewFinishedPlayingVideo = objc_opt_respondsToSelector() & 1;

    id v7 = objc_loadWeakRetained((id *)&self->_videoDelegate);
    self->_supportsVideoAssetViewUpdateAssetLoadingFinished = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setAspectFillAsset:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TPSImageAssetView *)self aspectFillAsset] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)TPSVideoAssetView;
    [(TPSImageAssetView *)&v5 setAspectFillAsset:v3];
    [(TPSVideoAssetView *)self updateVideoGravity];
  }
}

- (void)setVideoPath:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_videoPath, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_videoPath, a3);
    [(TPSVideoAssetView *)self resetVideoPlayer];
  }
}

- (void)updateVideoGravity
{
  BOOL v3 = [(TPSImageAssetView *)self aspectFillAsset];
  v4 = (uint64_t *)MEMORY[0x263EF9C78];
  if (!v3) {
    v4 = (uint64_t *)MEMORY[0x263EF9C70];
  }
  uint64_t v5 = *v4;
  avplayerLayer = self->_avplayerLayer;

  [(AVPlayerLayer *)avplayerLayer setVideoGravity:v5];
}

- (void)removeVideoPlayerLayer
{
  [(AVPlayer *)self->_avplayer pause];
  avplayerLayer = self->_avplayerLayer;

  [(AVPlayerLayer *)avplayerLayer removeFromSuperlayer];
}

- (void)resetVideoPlayer
{
  [(TPSVideoAssetView *)self cancelVideoDownloadTask];
  [(TPSVideoAssetView *)self cancelReplayButtonTimer];
  [(TPSVideoAssetView *)self updateReplayButtonHiddenState:1];
  [(TPSVideoAssetView *)self stopVideoPlayer];
  [(AVPlayer *)self->_avplayer replaceCurrentItemWithPlayerItem:0];

  [(TPSVideoAssetView *)self scrubVideoToFirstFrame];
}

- (void)scrubVideoToFirstFrame
{
  if (!self->_lastFrameDominant || ![(TPSVideoAssetView *)self displayingVideoLastFrame])
  {
    BOOL v3 = [(AVPlayer *)self->_avplayer currentItem];

    if (v3)
    {
      avplayer = self->_avplayer;
      long long v8 = *MEMORY[0x263F010E0];
      uint64_t v9 = *(void *)(MEMORY[0x263F010E0] + 16);
      [(AVPlayer *)avplayer seekToTime:&v8];
    }
    else
    {
      uint64_t v5 = [(TPSImageAssetView *)self currentDisplayIdentifier];
      id v7 = +[TPSImageAssetController imageFromMemoryCacheForIdentifier:v5];

      id v6 = v7;
      if (v7)
      {
        [(TPSImageAssetView *)self setImage:v7];
        id v6 = v7;
      }
    }
  }
}

- (void)continuePlayVideo
{
  self->_videoPlaybackFinished = 0;
  [(TPSVideoAssetView *)self playVideo];
}

- (BOOL)videoInProgress
{
  return self->_avplayer || self->_avplayerLayer || self->_videoURLSessionItem != 0;
}

- (void)playVideo
{
  if (!self->_lastFrameDominant
    || ![(TPSVideoAssetView *)self displayingVideoLastFrame]
    || [(AVPlayer *)self->_avplayer timeControlStatus] != AVPlayerTimeControlStatusPlaying)
  {
    if (!self->_videoPath) {
      goto LABEL_15;
    }
    if (self->_videoURLSessionItem) {
      goto LABEL_16;
    }
    BOOL v3 = [(AVPlayerLayer *)self->_avplayerLayer superlayer];

    if (!v3)
    {
      v4 = [(TPSImageAssetView *)self imageView];
      uint64_t v5 = [v4 layer];
      [v5 addSublayer:self->_avplayerLayer];
    }
    objc_initWeak(&location, self);
    id v6 = [MEMORY[0x263F7F5A0] sharedInstance];
    videoPath = self->_videoPath;
    long long v8 = [(TPSVideoAssetView *)self cacheVideoIdentifier];
    int v9 = *MEMORY[0x263F085C0];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __30__TPSVideoAssetView_playVideo__block_invoke;
    v14[3] = &unk_2642B2080;
    objc_copyWeak(&v15, &location);
    LODWORD(v10) = v9;
    v11 = [v6 formattedDataForPath:videoPath identifier:v8 attributionIdentifier:0 priority:v14 completionHandler:v10];
    videoURLSessionItem = self->_videoURLSessionItem;
    self->_videoURLSessionItem = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    if (self->_videoPath)
    {
LABEL_16:
      if (!self->_videoPlaybackFinished)
      {
        [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_playVideoDelay object:0];
        [(TPSVideoAssetView *)self performSelector:sel_playVideoDelay withObject:0 afterDelay:self->_videoDelayTime];
      }
    }
    else
    {
LABEL_15:
      if (self->_supportsVideoAssetViewUpdateAssetLoadingFinished)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_videoDelegate);
        [WeakRetained videoAssetViewUpdateAssetLoadingFinished:self error:0];
      }
    }
  }
}

void __30__TPSVideoAssetView_playVideo__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v9 = a3;
  id v10 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (v10)
  {
    if ([WeakRetained supportsVideoAssetViewUpdateAssetLoadingFinished])
    {
      v13 = [MEMORY[0x263F7F5F8] data];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __30__TPSVideoAssetView_playVideo__block_invoke_cold_1(v12, (uint64_t)v10, v13);
      }

      v14 = [v12 videoDelegate];
      [v14 videoAssetViewUpdateAssetLoadingFinished:v12 error:v10];
    }
  }
  else
  {
    id v15 = [v9 path];
    [v12 setDownloadedVideoPath:v15];

    if ([v12 readyToDisplayAVPlayer]) {
      [v12 playVideoDelay];
    }
  }
  [v12 setVideoURLSessionItem:0];
}

- (void)playVideoDelay
{
  if (!self->_supportsVideoAssetViewCanShowMedia
    || (id v3 = objc_loadWeakRetained((id *)&self->_videoDelegate),
        int v4 = [v3 videoAssetViewCanDisplayAssets:self],
        v3,
        v4))
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_playVideoDelay object:0];
    [(TPSVideoAssetView *)self cancelReplayButtonTimer];
    self->_readyToDisplayAVPlayer = 1;
    if (self->_downloadedVideoPath)
    {
      [(AVPlayer *)self->_avplayer rate];
      if (v5 == 0.0 && !self->_videoPlaybackFinished)
      {
        if (self->_supportsVideoAssetViewUpdateAssetLoadingFinished)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_videoDelegate);
          [WeakRetained videoAssetViewUpdateAssetLoadingFinished:self error:0];
        }
        uint64_t v7 = [NSURL fileURLWithPath:self->_downloadedVideoPath isDirectory:0];
        long long v8 = (void *)v7;
        if (v7)
        {
          uint64_t v7 = [MEMORY[0x263EFA800] playerItemWithURL:v7];
        }
        id v23 = (id)v7;
        avplayer = self->_avplayer;
        if (avplayer)
        {
          [(AVPlayer *)avplayer replaceCurrentItemWithPlayerItem:v23];
        }
        else
        {
          id v10 = [MEMORY[0x263EFA7F0] playerWithPlayerItem:v23];
          v11 = self->_avplayer;
          self->_avplayer = v10;

          [(AVPlayer *)self->_avplayer setActionAtItemEnd:1];
          [(AVPlayer *)self->_avplayer setAllowsExternalPlayback:0];
          [(AVPlayer *)self->_avplayer setMuted:1];
          [(AVPlayer *)self->_avplayer _setDisallowsVideoLayerDisplayCompositing:1];
          v12 = [MEMORY[0x263EFA838] playerLayerWithPlayer:self->_avplayer];
          avplayerLayer = self->_avplayerLayer;
          self->_avplayerLayer = v12;

          v14 = [(TPSImageAssetView *)self imageView];
          id v15 = [v14 layer];
          [v15 addSublayer:self->_avplayerLayer];

          [(AVPlayerLayer *)self->_avplayerLayer frame];
          double v17 = v16;
          double v19 = v18;
          [(TPSVideoAssetView *)self bounds];
          -[AVPlayerLayer setFrame:](self->_avplayerLayer, "setFrame:", v17, v19);
          [(TPSVideoAssetView *)self updateVideoGravity];
        }
        if (v23)
        {
          if (!self->_registeredForAVPlayerNotification)
          {
            self->_registeredForAVPlayerNotification = 1;
            v20 = [MEMORY[0x263F08A00] defaultCenter];
            [v20 addObserver:self selector:sel_avplayerDidFinishPlaying_ name:*MEMORY[0x263EFA050] object:0];

            KVOManager = self->_KVOManager;
            v22 = [(AVPlayer *)self->_avplayer currentItem];
            [(TPSKVOManager *)KVOManager addKVOObject:v22 forKeyPath:@"error" options:1 context:sel_avplayerItemErrorChanged_];
          }
          [(TPSVideoAssetView *)self updateReplayButtonHiddenState:1];
          [(AVPlayer *)self->_avplayer play];
        }
      }
    }
  }
}

- (void)fetchImageWithIdentifier:(id)a3 path:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_lastFrameDominant && [(TPSVideoAssetView *)self updateImageToVideoLastFrame])
  {
    [(TPSImageAssetView *)self setCurrentImagePath:v7];
    long long v8 = [(TPSImageAssetView *)self delegate];
    [v8 imageAssetViewImageUpdated:self];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TPSVideoAssetView;
    [(TPSImageAssetView *)&v9 fetchImageWithIdentifier:v6 path:v7];
  }
}

- (void)avplayerItemErrorChanged:(id)a3
{
  id v8 = a3;
  id v4 = [(AVPlayer *)self->_avplayer currentItem];
  if (v4 == v8)
  {
    float v5 = [v8 error];

    if (v5)
    {
      id v6 = [MEMORY[0x263F7F5A0] sharedInstance];
      id v7 = [(TPSVideoAssetView *)self cacheVideoIdentifier];
      [v6 removeCacheForIdentifier:v7];
    }
  }
}

- (void)updateReplayButtonHiddenState:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIButton setHidden:](self->_replayButton, "setHidden:");
  [(UIImageView *)self->_replayGradientView setHidden:v3];
  if (!v3)
  {
    [(UIButton *)self->_replayButton setAlpha:0.0];
    [(UIImageView *)self->_replayGradientView setAlpha:0.0];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__TPSVideoAssetView_updateReplayButtonHiddenState___block_invoke;
    v6[3] = &unk_2642B1F70;
    v6[4] = self;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __51__TPSVideoAssetView_updateReplayButtonHiddenState___block_invoke_2;
    v5[3] = &unk_2642B20A8;
    v5[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v6 animations:v5 completion:1.0];
  }
}

void __51__TPSVideoAssetView_updateReplayButtonHiddenState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) replayButton];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) replayGradientView];
  [v3 setAlpha:1.0];
}

void __51__TPSVideoAssetView_updateReplayButtonHiddenState___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) replayButton];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) replayGradientView];
  [v3 setAlpha:1.0];
}

- (void)replayVideo
{
  [(TPSVideoAssetView *)self cancelReplayButtonTimer];
  [(TPSVideoAssetView *)self updateReplayButtonHiddenState:1];
  avplayer = self->_avplayer;
  long long v4 = *MEMORY[0x263F010E0];
  uint64_t v5 = *(void *)(MEMORY[0x263F010E0] + 16);
  [(AVPlayer *)avplayer seekToTime:&v4];
  [(AVPlayer *)self->_avplayer pause];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_restartVideoDelay object:0];
  [(TPSVideoAssetView *)self performSelector:sel_restartVideoDelay withObject:0 afterDelay:self->_videoDelayTime];
}

- (void)restartVideoDelay
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_restartVideoDelay object:0];
  avplayer = self->_avplayer;

  [(AVPlayer *)avplayer play];
}

- (void)stopVideoPlayer
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_restartVideoDelay object:0];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_playVideoDelay object:0];
  if (self->_registeredForAVPlayerNotification)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263EFA050] object:0];

    KVOManager = self->_KVOManager;
    uint64_t v5 = [(AVPlayer *)self->_avplayer currentItem];
    [(TPSKVOManager *)KVOManager removeKVOObject:v5 forKeyPath:@"error"];

    self->_registeredForAVPlayerNotification = 0;
  }
  [(AVPlayer *)self->_avplayer pause];
  [(AVPlayer *)self->_avplayer setRate:0.0];
  self->_readyToDisplayAVPlayer = 0;
  self->_videoPlaybackFinished = 0;
  downloadedVideoPath = self->_downloadedVideoPath;
  self->_downloadedVideoPath = 0;
}

- (BOOL)displayingVideoLastFrame
{
  id v3 = [(AVPlayer *)self->_avplayer currentItem];
  long long v4 = v3;
  if (self->_videoPlaybackFinished)
  {
    if (v3)
    {
      [v3 currentTime];
      uint64_t v5 = v10;
      [v4 duration];
      uint64_t v6 = v9;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v5 = 0;
    }
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  long long v4 = [(AVPlayer *)self->_avplayer currentItem];
  if (v4)
  {
    uint64_t v6 = v4;
    [v4 currentTime];
    long long v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (BOOL)updateImageToVideoLastFrame
{
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  id v3 = [(AVPlayer *)self->_avplayer currentItem];
  long long v4 = v3;
  if (v3)
  {
    [v3 duration];
  }
  else
  {
    long long v10 = 0uLL;
    uint64_t v11 = 0;
  }

  uint64_t v5 = v10;
  if ((uint64_t)v10 >= 1)
  {
    avplayer = self->_avplayer;
    long long v8 = v10;
    uint64_t v9 = v11;
    [(AVPlayer *)avplayer seekToTime:&v8];
  }
  return v5 > 0;
}

- (void)avplayerDidFinishPlaying:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  uint64_t v6 = [(AVPlayer *)self->_avplayer currentItem];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    self->_videoPlaybackFinished = 1;
    if (self->_supportsVideoAssetViewFinishedPlayingVideo)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_videoDelegate);
      [WeakRetained videoAssetViewFinishedPlayingVideo:self];
    }
    if (self->_replayButton)
    {
      objc_initWeak(&location, self);
      uint64_t v9 = (void *)MEMORY[0x263EFFA20];
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      id v15 = __46__TPSVideoAssetView_avplayerDidFinishPlaying___block_invoke;
      double v16 = &unk_2642B20D0;
      objc_copyWeak(&v17, &location);
      long long v10 = [v9 timerWithTimeInterval:0 repeats:&v13 block:4.0];
      replayButtonTimer = self->_replayButtonTimer;
      self->_replayButtonTimer = v10;

      v12 = objc_msgSend(MEMORY[0x263EFF9F0], "currentRunLoop", v13, v14, v15, v16);
      [v12 addTimer:self->_replayButtonTimer forMode:*MEMORY[0x263EFF478]];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __46__TPSVideoAssetView_avplayerDidFinishPlaying___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateReplayButtonHiddenState:0];
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)TPSVideoAssetView;
  [(TPSImageAssetView *)&v3 cancel];
  [(TPSVideoAssetView *)self cancelVideoDownloadTask];
  [(TPSVideoAssetView *)self cancelReplayButtonTimer];
}

- (void)cancelVideoDownloadTask
{
  objc_super v3 = [MEMORY[0x263F7F638] defaultManager];
  [v3 cancelSessionItem:self->_videoURLSessionItem];

  videoURLSessionItem = self->_videoURLSessionItem;
  self->_videoURLSessionItem = 0;
}

- (void)cancelReplayButtonTimer
{
  [(NSTimer *)self->_replayButtonTimer invalidate];
  replayButtonTimer = self->_replayButtonTimer;
  self->_replayButtonTimer = 0;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)TPSVideoAssetView;
  [(TPSImageAssetView *)&v15 layoutSubviews];
  avplayerLayer = self->_avplayerLayer;
  if (avplayerLayer)
  {
    [(AVPlayerLayer *)avplayerLayer frame];
    double v5 = v4;
    double v7 = v6;
    [(TPSVideoAssetView *)self bounds];
    double v9 = v8;
    double v11 = v10;
    [(AVPlayerLayer *)self->_avplayerLayer frame];
    if (v9 != v13 || v11 != v12) {
      -[AVPlayerLayer setFrame:](self->_avplayerLayer, "setFrame:", v5, v7, v9, v11);
    }
  }
}

- (TPSVideoAssetViewDelegate)videoDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_videoDelegate);

  return (TPSVideoAssetViewDelegate *)WeakRetained;
}

- (BOOL)videoPlaybackFinished
{
  return self->_videoPlaybackFinished;
}

- (void)setVideoPlaybackFinished:(BOOL)a3
{
  self->_videoPlaybackFinished = a3;
}

- (BOOL)lastFrameDominant
{
  return self->_lastFrameDominant;
}

- (void)setLastFrameDominant:(BOOL)a3
{
  self->_lastFrameDominant = a3;
}

- (double)videoDelayTime
{
  return self->_videoDelayTime;
}

- (void)setVideoDelayTime:(double)a3
{
  self->_videoDelayTime = a3;
}

- (UIImage)lastFrameImage
{
  return self->_lastFrameImage;
}

- (void)setLastFrameImage:(id)a3
{
}

- (NSString)cacheVideoIdentifier
{
  return self->_cacheVideoIdentifier;
}

- (void)setCacheVideoIdentifier:(id)a3
{
}

- (NSString)videoPath
{
  return self->_videoPath;
}

- (NSString)downloadedVideoPath
{
  return self->_downloadedVideoPath;
}

- (void)setDownloadedVideoPath:(id)a3
{
}

- (UIButton)replayButton
{
  return self->_replayButton;
}

- (void)setReplayButton:(id)a3
{
}

- (UIImageView)replayGradientView
{
  return self->_replayGradientView;
}

- (void)setReplayGradientView:(id)a3
{
}

- (BOOL)readyToDisplayAVPlayer
{
  return self->_readyToDisplayAVPlayer;
}

- (void)setReadyToDisplayAVPlayer:(BOOL)a3
{
  self->_readyToDisplayAVPlayer = a3;
}

- (BOOL)supportsVideoAssetViewCanShowMedia
{
  return self->_supportsVideoAssetViewCanShowMedia;
}

- (void)setSupportsVideoAssetViewCanShowMedia:(BOOL)a3
{
  self->_supportsVideoAssetViewCanShowMedia = a3;
}

- (BOOL)supportsVideoAssetViewFinishedPlayingVideo
{
  return self->_supportsVideoAssetViewFinishedPlayingVideo;
}

- (void)setSupportsVideoAssetViewFinishedPlayingVideo:(BOOL)a3
{
  self->_supportsVideoAssetViewFinishedPlayingVideo = a3;
}

- (BOOL)supportsVideoAssetViewUpdateAssetLoadingFinished
{
  return self->_supportsVideoAssetViewUpdateAssetLoadingFinished;
}

- (void)setSupportsVideoAssetViewUpdateAssetLoadingFinished:(BOOL)a3
{
  self->_supportsVideoAssetViewUpdateAssetLoadingFinished = a3;
}

- (TPSURLSessionItem)videoURLSessionItem
{
  return self->_videoURLSessionItem;
}

- (void)setVideoURLSessionItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoURLSessionItem, 0);
  objc_storeStrong((id *)&self->_replayGradientView, 0);
  objc_storeStrong((id *)&self->_replayButton, 0);
  objc_storeStrong((id *)&self->_downloadedVideoPath, 0);
  objc_storeStrong((id *)&self->_videoPath, 0);
  objc_storeStrong((id *)&self->_cacheVideoIdentifier, 0);
  objc_storeStrong((id *)&self->_lastFrameImage, 0);
  objc_destroyWeak((id *)&self->_videoDelegate);
  objc_storeStrong((id *)&self->_KVOManager, 0);
  objc_storeStrong((id *)&self->_replayButtonTimer, 0);
  objc_storeStrong((id *)&self->_avplayerLayer, 0);

  objc_storeStrong((id *)&self->_avplayer, 0);
}

void __30__TPSVideoAssetView_playVideo__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v5 = [a1 videoPath];
  int v6 = 138412546;
  double v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_217984000, a3, OS_LOG_TYPE_DEBUG, "Video asset path %@ fetch error: %@", (uint8_t *)&v6, 0x16u);
}

@end