@interface PXDisplayAssetLoopingVideoContentView
- (AVPlayerItem)videoPlayerItem;
- (BOOL)canLoadVideo;
- (BOOL)isDisplayingFullQualityContent;
- (CGRect)currentContentsRect;
- (ISWrappedAVAudioSession)audioSession;
- (ISWrappedAVPlayer)videoPlayer;
- (NSNumber)queuePosition;
- (double)loadingProgress;
- (double)videoLoadingProgress;
- (id)contentView;
- (id)currentImage;
- (int64_t)playbackStyle;
- (unint64_t)activityCoordinatorQueuePosition;
- (void)_endLoadingInterval:(BOOL)a3;
- (void)_endPlaybackInterval;
- (void)_handleDidShowPlaceholderForUnloadingPlayerItem:(id)a3;
- (void)_handlePlayerItemResult:(id)a3 info:(id)a4 requestID:(int64_t)a5;
- (void)_loadVideo;
- (void)_unloadVideo;
- (void)_updateVideoPlayerPlayerItem;
- (void)_updateVideoViewContentMode;
- (void)_updateVideoViewPlaceholderFilters;
- (void)animatedContentEnabledDidChange;
- (void)contentModeDidChange;
- (void)contentsRectDidChange;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)imageDidChange;
- (void)imageProgressDidChange;
- (void)isDisplayingFullQualityContentDidChange;
- (void)placeholderImageFiltersDidChange;
- (void)setActivityCoordinatorQueuePosition:(unint64_t)a3;
- (void)setAudioSession:(id)a3;
- (void)setCanLoadVideo:(BOOL)a3;
- (void)setQueuePosition:(id)a3;
- (void)setVideoLoadingProgress:(double)a3;
- (void)setVideoPlayer:(id)a3;
- (void)setVideoPlayerItem:(id)a3;
- (void)toneMapVideoToStandardDynamicRangeDidChange;
- (void)updateContent;
@end

@implementation PXDisplayAssetLoopingVideoContentView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_queuePosition, 0);
  objc_storeStrong((id *)&self->_videoPlayerItem, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
}

- (double)videoLoadingProgress
{
  return self->_videoLoadingProgress;
}

- (ISWrappedAVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setQueuePosition:(id)a3
{
}

- (NSNumber)queuePosition
{
  return self->_queuePosition;
}

- (BOOL)canLoadVideo
{
  return self->_canLoadVideo;
}

- (AVPlayerItem)videoPlayerItem
{
  return self->_videoPlayerItem;
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)_endLoadingInterval:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_loadingIntervalID)
  {
    BOOL v3 = a3;
    v5 = [(PXDisplayAssetContentView *)self log];
    v6 = v5;
    os_signpost_id_t loadingIntervalID = self->_loadingIntervalID;
    if (loadingIntervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, loadingIntervalID, "Video Loading", "Success: %d", (uint8_t *)v8, 8u);
    }

    self->_os_signpost_id_t loadingIntervalID = 0;
  }
}

- (void)_endPlaybackInterval
{
  if (self->_playbackIntervalID)
  {
    BOOL v3 = [(PXDisplayAssetContentView *)self log];
    v4 = v3;
    os_signpost_id_t playbackIntervalID = self->_playbackIntervalID;
    if (playbackIntervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_END, playbackIntervalID, "Video Playback Latency", "", v6, 2u);
    }

    self->_os_signpost_id_t playbackIntervalID = 0;
  }
}

- (void)_updateVideoViewPlaceholderFilters
{
  if ([(PXDisplayAssetLoopingVideoContentView *)self isDisplayingFullQualityContent])
  {
    videoView = self->_videoView;
    [(PXVideoPlayerView *)videoView setPlaceholderImageFilters:0];
  }
  else
  {
    id v4 = [(PXDisplayAssetContentView *)self placeholderImageFilters];
    [(PXVideoPlayerView *)self->_videoView setPlaceholderImageFilters:v4];
  }
}

- (void)_updateVideoViewContentMode
{
  BOOL v3 = [(PXDisplayAssetLoopingVideoContentView *)self contentMode] == 1;
  videoView = self->_videoView;
  [(PXVideoPlayerView *)videoView setVideoViewContentMode:v3];
}

- (void)_updateVideoPlayerPlayerItem
{
  BOOL v3 = [(PXDisplayAssetLoopingVideoContentView *)self audioSession];

  if (v3)
  {
    id v4 = [(PXDisplayAssetLoopingVideoContentView *)self videoPlayerItem];
    v5 = [(PXVideoPlayerView *)self->_videoView player];
    v6 = v5;
    if (v4)
    {
      v7 = [(PXDisplayAssetContentView *)self log];
      self->_os_signpost_id_t playbackIntervalID = os_signpost_id_generate(v7);
      v8 = v7;
      uint64_t v9 = v8;
      os_signpost_id_t playbackIntervalID = self->_playbackIntervalID;
      if (playbackIntervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, playbackIntervalID, "Video Playback Latency", "", v12, 2u);
      }

      [v6 setLoopingEnabled:1 withTemplateItem:v4];
      LODWORD(v11) = 1.0;
      [v6 setRate:v11];
      [(PXVideoPlayerView *)self->_videoView setPlaceholderDisplayMode:0];
    }
    else
    {
      [v5 setLoopingEnabled:0 withTemplateItem:0];
      [v6 setRate:0.0];
      [v6 replaceCurrentItemWithPlayerItem:0];
    }
    [(PXDisplayAssetLoopingVideoContentView *)self _updateVideoViewPlaceholderFilters];
  }
}

- (void)_handlePlayerItemResult:(id)a3 info:(id)a4 requestID:(int64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 objectForKeyedSubscript:*(void *)off_1E5DAAFB8];
  int v10 = [v9 BOOLValue];

  if ([(PXDisplayAssetContentView *)self requestID] != a5 || v10)
  {
    [(PXDisplayAssetLoopingVideoContentView *)self _endLoadingInterval:0];
  }
  else
  {
    [(PXDisplayAssetLoopingVideoContentView *)self _endLoadingInterval:v12 != 0];
    [(PXDisplayAssetLoopingVideoContentView *)self setVideoPlayerItem:v12];
    if (v12)
    {
      [(PXDisplayAssetLoopingVideoContentView *)self setVideoLoadingProgress:1.0];
    }
    else
    {
      double v11 = [v8 objectForKeyedSubscript:*(void *)off_1E5DAAFC0];
      [(PXDisplayAssetContentView *)self handleError:v11];
    }
  }
}

- (void)_loadVideo
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXDisplayAssetContentView *)self asset];
  [(PXDisplayAssetLoopingVideoContentView *)self _endLoadingInterval:0];
  id v4 = [(PXDisplayAssetContentView *)self log];
  self->_os_signpost_id_t loadingIntervalID = os_signpost_id_generate(v4);
  v5 = [v3 uuid];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v3 description];
  }
  id v8 = v7;

  uint64_t v9 = v4;
  int v10 = v9;
  os_signpost_id_t loadingIntervalID = self->_loadingIntervalID;
  if (loadingIntervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, loadingIntervalID, "Video Loading", "Asset: %@", (uint8_t *)&buf, 0xCu);
  }

  id v12 = objc_alloc_init(PXVideoRequestOptions);
  [(PXVideoRequestOptions *)v12 setNetworkAccessAllowed:1];
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __51__PXDisplayAssetLoopingVideoContentView__loadVideo__block_invoke;
  v21[3] = &unk_1E5DD1230;
  objc_copyWeak(&v22, &location);
  [(PXVideoRequestOptions *)v12 setProgressHandler:v21];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v13 = [(PXDisplayAssetContentView *)self mediaProvider];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __51__PXDisplayAssetLoopingVideoContentView__loadVideo__block_invoke_3;
  v18 = &unk_1E5DB9A90;
  objc_copyWeak(&v20, &location);
  p_long long buf = &buf;
  uint64_t v14 = [v13 requestPlayerItemForVideo:v3 options:v12 resultHandler:&v15];

  *(void *)(*((void *)&buf + 1) + 24) = v14;
  -[PXDisplayAssetContentView setRequestID:](self, "setRequestID:", v14, v15, v16, v17, v18);
  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __51__PXDisplayAssetLoopingVideoContentView__loadVideo__block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  objc_copyWeak(v10, (id *)(a1 + 32));
  v10[1] = *(id *)&a3;
  px_dispatch_on_main_queue();
}

void __51__PXDisplayAssetLoopingVideoContentView__loadVideo__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v5;
  v6;
  px_dispatch_on_main_queue();
}

void __51__PXDisplayAssetLoopingVideoContentView__loadVideo__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handlePlayerItemResult:*(void *)(a1 + 32) info:*(void *)(a1 + 40) requestID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
}

void __51__PXDisplayAssetLoopingVideoContentView__loadVideo__block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setVideoLoadingProgress:v1];
}

- (void)_handleDidShowPlaceholderForUnloadingPlayerItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PXDisplayAssetLoopingVideoContentView *)self videoPlayerItem];

  if (v5 == v4)
  {
    [(PXDisplayAssetLoopingVideoContentView *)self setVideoPlayerItem:0];
  }
}

- (void)_unloadVideo
{
  [(PXDisplayAssetLoopingVideoContentView *)self _endPlaybackInterval];
  [(PXDisplayAssetLoopingVideoContentView *)self _endLoadingInterval:0];
  BOOL v3 = [(PXDisplayAssetLoopingVideoContentView *)self videoPlayerItem];
  objc_initWeak(&location, self);
  videoView = self->_videoView;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PXDisplayAssetLoopingVideoContentView__unloadVideo__block_invoke;
  v6[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v8, &location);
  id v5 = v3;
  id v7 = v5;
  [(PXVideoPlayerView *)videoView setPlaceholderDisplayMode:1 completion:v6];
  [(PXDisplayAssetContentView *)self setRequestID:0];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __53__PXDisplayAssetLoopingVideoContentView__unloadVideo__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleDidShowPlaceholderForUnloadingPlayerItem:*(void *)(a1 + 32)];
}

- (void)setVideoPlayerItem:(id)a3
{
  id v5 = (AVPlayerItem *)a3;
  if (self->_videoPlayerItem != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_videoPlayerItem, a3);
    [(PXDisplayAssetLoopingVideoContentView *)self _updateVideoPlayerPlayerItem];
    [(PXDisplayAssetLoopingVideoContentView *)self isDisplayingFullQualityContentDidChange];
    id v5 = v6;
  }
}

- (void)setCanLoadVideo:(BOOL)a3
{
  if (self->_canLoadVideo != a3)
  {
    self->_canLoadVideo = a3;
    if (a3) {
      [(PXDisplayAssetLoopingVideoContentView *)self _loadVideo];
    }
    else {
      [(PXDisplayAssetLoopingVideoContentView *)self _unloadVideo];
    }
  }
}

- (unint64_t)activityCoordinatorQueuePosition
{
  v2 = [(PXDisplayAssetLoopingVideoContentView *)self queuePosition];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setActivityCoordinatorQueuePosition:(unint64_t)a3
{
  uint64_t v5 = [(PXDisplayAssetLoopingVideoContentView *)self queuePosition];
  if (!v5
    || (id v6 = (void *)v5,
        [(PXDisplayAssetLoopingVideoContentView *)self queuePosition],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 unsignedIntegerValue],
        v7,
        v6,
        v8 != a3))
  {
    id v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(PXDisplayAssetLoopingVideoContentView *)self setQueuePosition:v9];

    int v10 = +[PXForYouSettings sharedInstance];
    unint64_t v11 = [v10 maxSimultaneousVideoCount];

    [(PXDisplayAssetLoopingVideoContentView *)self setCanLoadVideo:v11 > a3];
  }
}

- (void)setVideoLoadingProgress:(double)a3
{
  if (self->_videoLoadingProgress != a3)
  {
    self->_videoLoadingProgress = a3;
    [(PXDisplayAssetContentView *)self invalidateLoadingProgress];
  }
}

- (void)setAudioSession:(id)a3
{
  uint64_t v5 = (ISWrappedAVAudioSession *)a3;
  if (self->_audioSession != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_audioSession, a3);
    if (v7)
    {
      id v6 = [(PXDisplayAssetLoopingVideoContentView *)self videoPlayer];
      [v6 setWrappedAudioSession:v7];
    }
    [(PXDisplayAssetLoopingVideoContentView *)self _updateVideoPlayerPlayerItem];
    uint64_t v5 = v7;
  }
}

- (void)toneMapVideoToStandardDynamicRangeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  [(PXDisplayAssetContentView *)&v3 toneMapVideoToStandardDynamicRangeDidChange];
  [(PXVideoPlayerView *)self->_videoView setToneMapToStandardDynamicRange:[(PXDisplayAssetContentView *)self toneMapVideoToStandardDynamicRange]];
}

- (void)contentsRectDidChange
{
  v2.receiver = self;
  v2.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  [(PXDisplayAssetContentView *)&v2 contentsRectDidChange];
}

- (void)isDisplayingFullQualityContentDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  [(PXDisplayAssetContentView *)&v3 isDisplayingFullQualityContentDidChange];
  [(PXDisplayAssetLoopingVideoContentView *)self _updateVideoViewPlaceholderFilters];
}

- (BOOL)isDisplayingFullQualityContent
{
  objc_super v2 = [(PXDisplayAssetLoopingVideoContentView *)self videoPlayerItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)contentModeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  [(PXDisplayAssetContentView *)&v3 contentModeDidChange];
  [(PXDisplayAssetLoopingVideoContentView *)self _updateVideoViewContentMode];
}

- (void)placeholderImageFiltersDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  [(PXDisplayAssetContentView *)&v3 placeholderImageFiltersDidChange];
  [(PXDisplayAssetLoopingVideoContentView *)self _updateVideoViewPlaceholderFilters];
}

- (void)animatedContentEnabledDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  [(PXDisplayAssetContentView *)&v3 animatedContentEnabledDidChange];
  [(PXDisplayAssetLoopingVideoContentView *)self updateContent];
}

- (void)imageProgressDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  [(PXDisplayAssetContentView *)&v3 imageProgressDidChange];
  [(PXDisplayAssetContentView *)self invalidateLoadingProgress];
}

- (void)imageDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  [(PXDisplayAssetContentView *)&v4 imageDidChange];
  objc_super v3 = [(PXDisplayAssetContentView *)self image];
  [(PXVideoPlayerView *)self->_videoView setPlaceholderImage:v3];

  [(PXDisplayAssetLoopingVideoContentView *)self _updateVideoViewPlaceholderFilters];
}

- (double)loadingProgress
{
  objc_super v3 = [(PXDisplayAssetLoopingVideoContentView *)self videoPlayerItem];

  if (v3) {
    return 1.0;
  }
  [(PXDisplayAssetContentView *)self imageProgress];
  double v6 = v5;
  [(PXDisplayAssetLoopingVideoContentView *)self videoLoadingProgress];
  return v7 * 0.75 + v6 * 0.25;
}

- (void)updateContent
{
  v11.receiver = self;
  v11.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  [(PXDisplayAssetContentView *)&v11 updateContent];
  objc_super v3 = [(PXDisplayAssetContentView *)self mediaProvider];
  objc_super v4 = [(PXDisplayAssetContentView *)self asset];
  [(PXDisplayAssetContentView *)self targetSize];
  double v6 = v5;
  double v8 = v7;
  id v9 = +[PXActivityCoordinator coordinatorForActivity:@"PXDisplayAssetContentViewActivityVideo"];
  if ([(PXDisplayAssetContentView *)self isAnimatedContentEnabled]
    && ([(PXDisplayAssetLoopingVideoContentView *)self window],
        int v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10)
    && v3
    && v4
    && v6 > 0.0
    && v8 > 0.0)
  {
    [v9 registerItem:self];
  }
  else
  {
    [v9 unregisterItem:self];
    [(PXDisplayAssetLoopingVideoContentView *)self setQueuePosition:0];
    [(PXDisplayAssetLoopingVideoContentView *)self setCanLoadVideo:0];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  [(PXDisplayAssetContentView *)&v3 didMoveToWindow];
  [(PXDisplayAssetContentView *)self setNeedsUpdateContent];
}

- (id)currentImage
{
  return [(PXVideoPlayerView *)self->_videoView generateSnapshotImage];
}

- (CGRect)currentContentsRect
{
  double v2 = *(double *)off_1E5DAB010;
  double v3 = *((double *)off_1E5DAB010 + 1);
  double v4 = *((double *)off_1E5DAB010 + 2);
  double v5 = *((double *)off_1E5DAB010 + 3);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setVideoPlayer:(id)a3
{
  double v5 = (ISWrappedAVPlayer *)a3;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    [(ISWrappedAVPlayer *)videoPlayer removeTimeObserver:self->_timeObserver];
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    double v7 = [(PXDisplayAssetLoopingVideoContentView *)self audioSession];
    if (v7) {
      [(ISWrappedAVPlayer *)v5 setWrappedAudioSession:v7];
    }
    [(ISWrappedAVPlayer *)v5 setVolume:0.0];
    [(ISWrappedAVPlayer *)v5 setPreventsSleepDuringVideoPlayback:0];
    [(PXVideoPlayerView *)self->_videoView setPlayer:v5];
    objc_initWeak(&location, self);
    CMTimeMakeWithSeconds(&v14, 0.1, 600);
    uint64_t v8 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__PXDisplayAssetLoopingVideoContentView_setVideoPlayer___block_invoke;
    v12[3] = &unk_1E5DCF948;
    objc_copyWeak(&v13, &location);
    int v10 = [(ISWrappedAVPlayer *)v5 addPeriodicTimeObserverForInterval:&v14 queue:v8 usingBlock:v12];
    id timeObserver = self->_timeObserver;
    self->_id timeObserver = v10;

    [(PXDisplayAssetLoopingVideoContentView *)self _updateVideoPlayerPlayerItem];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __56__PXDisplayAssetLoopingVideoContentView_setVideoPlayer___block_invoke(uint64_t a1, long long *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v4 = *a2;
  uint64_t v5 = *((void *)a2 + 2);
  [WeakRetained _handleVideoPlayerTimeObserverWithTime:&v4];
}

- (id)contentView
{
  videoView = self->_videoView;
  if (!videoView)
  {
    long long v4 = objc_alloc_init(PXVideoPlayerView);
    [(PXDisplayAssetContentView *)self placeholderTransitionDuration];
    -[PXVideoPlayerView setVideoAppearanceCrossfadeDuration:](v4, "setVideoAppearanceCrossfadeDuration:");
    [(PXVideoPlayerView *)v4 setClipsToBounds:1];
    [(PXVideoPlayerView *)v4 setPlaceholderDisplayMode:1];
    [(PXVideoPlayerView *)v4 setToneMapToStandardDynamicRange:[(PXDisplayAssetContentView *)self toneMapVideoToStandardDynamicRange]];
    uint64_t v5 = self->_videoView;
    self->_videoView = v4;

    [(PXDisplayAssetLoopingVideoContentView *)self _updateVideoViewContentMode];
    objc_initWeak(&location, self);
    double v6 = dispatch_get_global_queue(9, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke;
    v9[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v10, &location);
    dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v9);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    videoView = self->_videoView;
  }
  return videoView;
}

void __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F8EBD0]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke_2;
  v4[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);

  objc_destroyWeak(&v6);
}

void __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setVideoPlayer:v1];

  long long v4 = (void *)MEMORY[0x1E4F8EBC8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke_3;
  v5[3] = &unk_1E5DB9A40;
  objc_copyWeak(&v6, v2);
  [v4 sharedAmbientInstanceWithLoadHandler:v5];
  objc_destroyWeak(&v6);
}

void __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v3;
  px_dispatch_on_main_queue();
}

void __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAudioSession:v1];
}

- (int64_t)playbackStyle
{
  return 5;
}

- (void)dealloc
{
  [(PXDisplayAssetLoopingVideoContentView *)self _endLoadingInterval:0];
  [(PXDisplayAssetLoopingVideoContentView *)self _endPlaybackInterval];
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  [(PXDisplayAssetLoopingVideoContentView *)&v3 dealloc];
}

@end