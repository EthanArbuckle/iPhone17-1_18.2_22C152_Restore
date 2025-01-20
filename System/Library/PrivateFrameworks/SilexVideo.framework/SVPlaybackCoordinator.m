@interface SVPlaybackCoordinator
- (BOOL)initiatedPlayback;
- (BOOL)muted;
- (BOOL)playbackBufferFull;
- (BOOL)playbackLikelyToKeepUp;
- (BOOL)playbackRequested;
- (BOOL)supportImpressionTracking;
- (BOOL)supportsQuartileTracking;
- (CGSize)dimensions;
- (CGSize)naturalSize;
- (NSArray)loadedTimeRanges;
- (NSError)error;
- (NSHashTable)observers;
- (NSTimer)readyToPlayTimer;
- (NSURL)videoURL;
- (SVAVPlayer)player;
- (SVAVPlayerFactory)playerFactory;
- (SVKeyValueObserver)muteStateObserver;
- (SVKeyValueObserver)playbackBufferFullObserver;
- (SVKeyValueObserver)playbackLikelyToKeepUpObserver;
- (SVKeyValueObserver)playerItemPresentationSizeObserver;
- (SVKeyValueObserver)readyForDisplayObserver;
- (SVPlaybackCoordinator)initWithVideo:(id)a3 playerFactory:(id)a4;
- (SVTimeline)timeline;
- (SVVideoPlaybackHost)host;
- (SVVideoProviding)video;
- (double)duration;
- (double)framerate;
- (double)loadingProgress;
- (double)pausedAtTime;
- (double)time;
- (double)timePlayed;
- (double)volume;
- (id)cancelHandler;
- (unint64_t)state;
- (void)addMuteStateObserver;
- (void)addPlaybackBufferObserver;
- (void)addPlaybackLikelyToKeepUpObserver;
- (void)addPlaybackObserver:(id)a3;
- (void)addPlayerItemPresentationSizeObserver;
- (void)configureTimeline;
- (void)finishedLoadingVideoURL:(id)a3;
- (void)loadVideoIfNeeded;
- (void)loadedTimeRangesChanged;
- (void)muteStateChanged;
- (void)pause;
- (void)playWithButtonTapped:(BOOL)a3;
- (void)playbackBufferFullStateChanged;
- (void)playbackFailedWithError:(id)a3;
- (void)playbackFinished;
- (void)playbackInitiatedWithButtonTapped:(BOOL)a3;
- (void)playbackLikelyToKeepUpStateChanged;
- (void)playbackPaused;
- (void)playbackReadyToStart;
- (void)playbackResumed;
- (void)playbackResumedAtTime:(double)a3;
- (void)playbackStarted;
- (void)removePlaybackObserver:(id)a3;
- (void)removePlayerItemPresentationSizeObserver;
- (void)seekToTime:(double)a3 withCompletionBlock:(id)a4;
- (void)setCancelHandler:(id)a3;
- (void)setDimensions:(CGSize)a3;
- (void)setError:(id)a3;
- (void)setHost:(id)a3;
- (void)setInitiatedPlayback:(BOOL)a3;
- (void)setMuteStateObserver:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPausedAtTime:(double)a3;
- (void)setPlaybackBufferFullObserver:(id)a3;
- (void)setPlaybackLikelyToKeepUpObserver:(id)a3;
- (void)setPlaybackRequested:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerItemPresentationSizeObserver:(id)a3;
- (void)setReadyForDisplayObserver:(id)a3;
- (void)setReadyToPlayTimer:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setVideoURL:(id)a3;
- (void)setupPlayerWithURL:(id)a3;
- (void)startedLoadingVideo;
- (void)stateChanged;
- (void)timeElapsed:(double)a3 duration:(double)a4;
@end

@implementation SVPlaybackCoordinator

- (SVPlaybackCoordinator)initWithVideo:(id)a3 playerFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SVPlaybackCoordinator;
  v9 = [(SVPlaybackCoordinator *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_video, a3);
    uint64_t v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    objc_storeStrong((id *)&v10->_playerFactory, a4);
    v13 = objc_alloc_init(SVTimeline);
    timeline = v10->_timeline;
    v10->_timeline = v13;
  }
  return v10;
}

- (void)playWithButtonTapped:(BOOL)a3
{
  [(SVPlaybackCoordinator *)self playbackInitiatedWithButtonTapped:a3];
  [(SVPlaybackCoordinator *)self loadVideoIfNeeded];
  id v4 = [(SVPlaybackCoordinator *)self player];
  [v4 play];
}

- (void)pause
{
  id v2 = [(SVPlaybackCoordinator *)self player];
  [v2 pause];
}

- (void)addPlaybackObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SVPlaybackCoordinator *)self observers];
  [v5 addObject:v4];
}

- (void)removePlaybackObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SVPlaybackCoordinator *)self observers];
  [v5 removeObject:v4];
}

- (void)setHost:(id)a3
{
  p_host = &self->_host;
  id v9 = a3;
  id v5 = objc_storeWeak((id *)p_host, v9);
  v6 = [(SVPlaybackCoordinator *)self player];
  [v9 setPlayer:v6];

  id v7 = [(SVPlaybackCoordinator *)self player];
  id v8 = [v7 currentItem];
  [v8 setPreferredForwardBufferDuration:0.0];
}

- (void)seekToTime:(double)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__SVPlaybackCoordinator_seekToTime_withCompletionBlock___block_invoke;
  v16[3] = &unk_2647710F0;
  id v7 = v6;
  id v17 = v7;
  id v8 = (void *)MEMORY[0x22A63E020](v16);
  [(SVPlaybackCoordinator *)self pause];
  [(SVPlaybackCoordinator *)self duration];
  [(SVPlaybackCoordinator *)self timeElapsed:a3 duration:v9];
  if (a3 >= 0.0) {
    double v10 = a3;
  }
  else {
    double v10 = -a3;
  }
  uint64_t v11 = [(SVPlaybackCoordinator *)self player];
  v12 = v11;
  if (v10 >= 0.00000011920929)
  {
    CMTimeMake(&v15, (uint64_t)a3, 1);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __56__SVPlaybackCoordinator_seekToTime_withCompletionBlock___block_invoke_2;
    v13[3] = &unk_264771118;
    id v14 = v8;
    [v12 seekToTime:&v15 completionHandler:v13];

    v12 = v14;
  }
  else
  {
    [v11 seekToStartWithCompletionBlock:v8];
  }
}

uint64_t __56__SVPlaybackCoordinator_seekToTime_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __56__SVPlaybackCoordinator_seekToTime_withCompletionBlock___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (double)framerate
{
  id v2 = [(SVPlaybackCoordinator *)self player];
  [v2 frameRate];
  double v4 = v3;

  return v4;
}

- (double)duration
{
  id v2 = [(SVPlaybackCoordinator *)self player];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (double)time
{
  id v2 = [(SVPlaybackCoordinator *)self player];
  [v2 elapsedTime];
  double v4 = v3;

  return v4;
}

- (double)timePlayed
{
  id v2 = [(SVPlaybackCoordinator *)self player];
  [v2 totalTimePlayed];
  double v4 = v3;

  return v4;
}

- (NSArray)loadedTimeRanges
{
  id v2 = [(SVPlaybackCoordinator *)self player];
  double v3 = [v2 currentItem];
  double v4 = [v3 loadedTimeRanges];

  return (NSArray *)v4;
}

- (double)volume
{
  id v2 = [MEMORY[0x263EF93E0] sharedInstance];
  [v2 outputVolume];
  double v4 = v3;

  return v4;
}

- (double)loadingProgress
{
  float v3 = [(SVPlaybackCoordinator *)self loadedTimeRanges];
  double v4 = v3;
  if (v3)
  {
    memset(&v13, 0, sizeof(v13));
    id v5 = [v3 firstObject];
    id v6 = v5;
    if (v5) {
      [v5 CMTimeRangeValue];
    }
    else {
      memset(&v13, 0, sizeof(v13));
    }

    CMTimeRange v11 = v13;
    CMTimeRangeGetEnd(&time, &v11);
    double Seconds = CMTimeGetSeconds(&time);
    [(SVPlaybackCoordinator *)self duration];
    double v7 = Seconds / v9;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (CGSize)naturalSize
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v4 = [(SVPlaybackCoordinator *)self player];
  id v5 = [v4 currentItem];
  id v6 = [v5 tracks];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        CMTimeRange v11 = [*(id *)(*((void *)&v19 + 1) + 8 * v10) assetTrack];
        if ([v11 statusOfValueForKey:@"naturalSize" error:0] == 2)
        {
          [v11 naturalSize];
          if (v13 != v2 || v12 != v3)
          {
            [v11 naturalSize];
            double v2 = v15;
            double v3 = v16;

            goto LABEL_14;
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
LABEL_14:

  double v17 = v2;
  double v18 = v3;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)loadVideoIfNeeded
{
  double v3 = [(SVPlaybackCoordinator *)self player];
  if (v3)
  {
  }
  else
  {
    double v4 = [(SVPlaybackCoordinator *)self cancelHandler];

    if (!v4)
    {
      [(SVPlaybackCoordinator *)self startedLoadingVideo];
      objc_initWeak(&location, self);
      id v5 = [(SVPlaybackCoordinator *)self video];
      uint64_t v7 = MEMORY[0x263EF8330];
      uint64_t v8 = 3221225472;
      uint64_t v9 = __42__SVPlaybackCoordinator_loadVideoIfNeeded__block_invoke;
      uint64_t v10 = &unk_264771140;
      objc_copyWeak(&v11, &location);
      id v6 = [v5 loadWithCompletionBlock:&v7];
      -[SVPlaybackCoordinator setCancelHandler:](self, "setCancelHandler:", v6, v7, v8, v9, v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

id __42__SVPlaybackCoordinator_loadVideoIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3)
  {
    [WeakRetained setupPlayerWithURL:v3];
    [v5 setCancelHandler:0];
    [v5 finishedLoadingVideoURL:v3];
    [v5 setVideoURL:v3];
  }
  else
  {
    id v6 = [MEMORY[0x263F087E8] videoErrorWithErrorCode:2];
    [v5 playbackFailedWithError:v6];
  }

  return v5;
}

- (void)setupPlayerWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [(SVPlaybackCoordinator *)self playerFactory];
  id v6 = [v5 createPlayerWithURL:v4];
  [(SVPlaybackCoordinator *)self setPlayer:v6];

  uint64_t v7 = [(SVPlaybackCoordinator *)self player];
  objc_msgSend(v7, "setMuted:", -[SVPlaybackCoordinator muted](self, "muted"));

  [(SVPlaybackCoordinator *)self addPlayerItemPresentationSizeObserver];
  [(SVPlaybackCoordinator *)self addMuteStateObserver];
  [(SVPlaybackCoordinator *)self addPlaybackBufferObserver];
  [(SVPlaybackCoordinator *)self addPlaybackLikelyToKeepUpObserver];
  uint64_t v8 = [(SVPlaybackCoordinator *)self video];
  LODWORD(v6) = [v8 conformsToProtocol:&unk_26D988128];

  if (v6)
  {
    uint64_t v9 = [(SVPlaybackCoordinator *)self video];
    objc_initWeak(&location, self);
    uint64_t v10 = (void *)MEMORY[0x263EFFA20];
    [v9 prerollReadyToPlayTimeout];
    double v12 = v11;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke;
    v25[3] = &unk_264771168;
    objc_copyWeak(&v26, &location);
    double v13 = [v10 scheduledTimerWithTimeInterval:0 repeats:v25 block:v12];
    [(SVPlaybackCoordinator *)self setReadyToPlayTimer:v13];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  id v14 = [(SVPlaybackCoordinator *)self player];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke_2;
  v23[3] = &unk_264771190;
  objc_copyWeak(&v24, &location);
  [v14 setPlaybackStatusBlock:v23];

  double v15 = [(SVPlaybackCoordinator *)self player];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke_3;
  v21[3] = &unk_2647711B8;
  objc_copyWeak(&v22, &location);
  [v15 setPlaybackProgressBlock:v21];

  double v16 = [(SVPlaybackCoordinator *)self player];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke_4;
  v19[3] = &unk_2647711E0;
  objc_copyWeak(&v20, &location);
  [v16 setLoadingProgressBlock:v19];

  double v17 = [(SVPlaybackCoordinator *)self host];
  double v18 = [(SVPlaybackCoordinator *)self player];
  [v17 setPlayer:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x263F087E8] videoErrorWithErrorCode:5];
  [WeakRetained playbackFailedWithError:v1];
}

void __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v14 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  switch(a3)
  {
    case 1:
      uint64_t v7 = [WeakRetained readyToPlayTimer];
      int v8 = [v7 isValid];

      if (v8)
      {
        uint64_t v9 = [v6 readyToPlayTimer];
        [v9 invalidate];
      }
      [v6 playbackReadyToStart];
      break;
    case 2:
      if ([v14 playbackPosition]) {
        [v6 playbackResumed];
      }
      else {
        [v6 playbackStarted];
      }
      break;
    case 3:
      [WeakRetained playbackPaused];
      break;
    case 4:
      [WeakRetained playbackFinished];
      break;
    case 5:
      uint64_t v10 = (void *)MEMORY[0x263F087E8];
      double v11 = [v14 currentItem];
      double v12 = [v11 error];
      double v13 = [v10 videoErrorWithUnderlyingError:v12];

      [v6 playbackFailedWithError:v13];
      break;
    default:
      break;
  }
}

void __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke_3(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained timeElapsed:a2 duration:a3];
}

void __44__SVPlaybackCoordinator_setupPlayerWithURL___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained loadedTimeRangesChanged];
}

- (void)startedLoadingVideo
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(SVPlaybackCoordinator *)self setState:1];
  id v3 = [(SVPlaybackCoordinator *)self video];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SVPlaybackCoordinator *)self video];
    [v5 startedLoadingVideo];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(SVPlaybackCoordinator *)self observers];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 playbackCoordinatorStartedLoadingVideo:self];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)finishedLoadingVideoURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SVPlaybackCoordinator *)self video];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(SVPlaybackCoordinator *)self video];
    [v7 finishedLoadingVideoWithURL:v4];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(SVPlaybackCoordinator *)self observers];
  uint64_t v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 playbackCoordinatorFinishedLoadingVideoURL:self];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)playbackInitiatedWithButtonTapped:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(SVPlaybackCoordinator *)self initiatedPlayback])
  {
    id v5 = [(SVPlaybackCoordinator *)self video];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [(SVPlaybackCoordinator *)self video];
      [v7 playbackInitiatedWithButtonTapped:v3];
    }
  }
  [(SVPlaybackCoordinator *)self setPlaybackRequested:1];

  [(SVPlaybackCoordinator *)self setInitiatedPlayback:1];
}

- (void)playbackReadyToStart
{
  [(SVPlaybackCoordinator *)self setState:2];
  BOOL v3 = [(SVPlaybackCoordinator *)self video];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SVPlaybackCoordinator *)self video];
    [v5 playbackReadyToStart];
  }
}

- (void)playbackStarted
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(SVPlaybackCoordinator *)self configureTimeline];
  [(SVPlaybackCoordinator *)self setState:3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(SVPlaybackCoordinator *)self observers];
  char v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 playbackCoordinatorStartedPlayback:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(SVPlaybackCoordinator *)self video];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v12 = [(SVPlaybackCoordinator *)self video];
    [v12 playbackStarted];
  }
}

- (void)playbackPaused
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(SVPlaybackCoordinator *)self time];
  -[SVPlaybackCoordinator playbackPausedAtTime:](self, "playbackPausedAtTime:");
  [(SVPlaybackCoordinator *)self setState:4];
  BOOL v3 = [(SVPlaybackCoordinator *)self video];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(SVPlaybackCoordinator *)self video];
    [v5 playbackPaused];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(SVPlaybackCoordinator *)self observers];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 playbackCoordinatorPausedPlayback:self];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)playbackResumed
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(SVPlaybackCoordinator *)self time];
  -[SVPlaybackCoordinator playbackResumedAtTime:](self, "playbackResumedAtTime:");
  [(SVPlaybackCoordinator *)self setState:3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(SVPlaybackCoordinator *)self observers];
  char v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 playbackCoordinatorResumedPlayback:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(SVPlaybackCoordinator *)self video];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v12 = [(SVPlaybackCoordinator *)self video];
    [v12 playbackResumed];
  }
}

- (void)playbackFinished
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(SVPlaybackCoordinator *)self setState:4];
  BOOL v3 = [(SVPlaybackCoordinator *)self video];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(SVPlaybackCoordinator *)self video];
    [v5 playbackFinished];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(SVPlaybackCoordinator *)self observers];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 playbackCoordinatorFinishedPlayback:self];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)playbackFailedWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SVPlaybackCoordinator *)self setState:5];
  [(SVPlaybackCoordinator *)self setError:v4];
  uint64_t v5 = [(SVPlaybackCoordinator *)self video];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(SVPlaybackCoordinator *)self video];
    [v7 playbackFailedWithError:v4];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(SVPlaybackCoordinator *)self observers];
  uint64_t v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 playbackCoordinator:self playbackFailedWithError:v4];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)timeElapsed:(double)a3 duration:(double)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(SVPlaybackCoordinator *)self timeline];
  -[SVTimeline setTime:]((uint64_t)v7, a3);

  uint64_t v8 = [(SVPlaybackCoordinator *)self video];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(SVPlaybackCoordinator *)self video];
    [v10 timeElapsed:a3 duration:a4];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [(SVPlaybackCoordinator *)self observers];
  uint64_t v12 = (void *)[v11 copy];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v18 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector()) {
          [v17 playbackCoordinator:self timeElapsed:a3 duration:a4];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)loadedTimeRangesChanged
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(SVPlaybackCoordinator *)self loadingProgress];
  if (v3 != 0.0)
  {
    double v4 = v3;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [(SVPlaybackCoordinator *)self observers];
    char v6 = (void *)[v5 copy];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 playbackCoordinator:self loadingProgressed:v4];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)stateChanged
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = [(SVPlaybackCoordinator *)self observers];
  double v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 playbackCoordinatorStateChanged:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)addPlaybackBufferObserver
{
  objc_initWeak(&location, self);
  double v3 = [SVKeyValueObserver alloc];
  double v4 = [(SVPlaybackCoordinator *)self player];
  uint64_t v5 = [v4 currentItem];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __50__SVPlaybackCoordinator_addPlaybackBufferObserver__block_invoke;
  long long v10 = &unk_264771050;
  objc_copyWeak(&v11, &location);
  uint64_t v6 = [(SVKeyValueObserver *)v3 initWithKeyPath:@"playbackBufferFull" ofObject:v5 withOptions:1 change:&v7];
  -[SVPlaybackCoordinator setPlaybackBufferFullObserver:](self, "setPlaybackBufferFullObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__SVPlaybackCoordinator_addPlaybackBufferObserver__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained player];
  double v2 = [v1 currentItem];
  WeakRetained[9] = [v2 isPlaybackBufferFull];

  [WeakRetained playbackBufferFullStateChanged];
}

- (void)playbackBufferFullStateChanged
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = [(SVPlaybackCoordinator *)self observers];
  double v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 playbackCoordinatorPlaybackBufferFullStateChanged:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)addPlaybackLikelyToKeepUpObserver
{
  objc_initWeak(&location, self);
  double v3 = [SVKeyValueObserver alloc];
  double v4 = [(SVPlaybackCoordinator *)self player];
  uint64_t v5 = [v4 currentItem];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __58__SVPlaybackCoordinator_addPlaybackLikelyToKeepUpObserver__block_invoke;
  long long v10 = &unk_264771050;
  objc_copyWeak(&v11, &location);
  uint64_t v6 = [(SVKeyValueObserver *)v3 initWithKeyPath:@"playbackLikelyToKeepUp" ofObject:v5 withOptions:1 change:&v7];
  -[SVPlaybackCoordinator setPlaybackLikelyToKeepUpObserver:](self, "setPlaybackLikelyToKeepUpObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __58__SVPlaybackCoordinator_addPlaybackLikelyToKeepUpObserver__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained player];
  double v2 = [v1 currentItem];
  WeakRetained[8] = [v2 isPlaybackLikelyToKeepUp];

  [WeakRetained playbackLikelyToKeepUpStateChanged];
}

- (void)playbackLikelyToKeepUpStateChanged
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = [(SVPlaybackCoordinator *)self observers];
  double v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 playbackCoordinatorPlaybackLikelyToKeepUpStateChanged:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)addMuteStateObserver
{
  objc_initWeak(&location, self);
  double v3 = [SVKeyValueObserver alloc];
  double v4 = [(SVPlaybackCoordinator *)self player];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __45__SVPlaybackCoordinator_addMuteStateObserver__block_invoke;
  uint64_t v9 = &unk_264771050;
  objc_copyWeak(&v10, &location);
  uint64_t v5 = [(SVKeyValueObserver *)v3 initWithKeyPath:@"muted" ofObject:v4 withOptions:1 change:&v6];
  -[SVPlaybackCoordinator setMuteStateObserver:](self, "setMuteStateObserver:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __45__SVPlaybackCoordinator_addMuteStateObserver__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained player];
  WeakRetained[10] = [v1 isMuted];

  [WeakRetained muteStateChanged];
}

- (void)muteStateChanged
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = [(SVPlaybackCoordinator *)self observers];
  double v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 playbackCoordinatorMuteStateChanged:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)addPlayerItemPresentationSizeObserver
{
  objc_initWeak(&location, self);
  double v3 = [SVKeyValueObserver alloc];
  double v4 = [(SVPlaybackCoordinator *)self player];
  uint64_t v5 = [v4 currentItem];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __62__SVPlaybackCoordinator_addPlayerItemPresentationSizeObserver__block_invoke;
  long long v10 = &unk_264771050;
  objc_copyWeak(&v11, &location);
  uint64_t v6 = [(SVKeyValueObserver *)v3 initWithKeyPath:@"presentationSize" ofObject:v5 withOptions:1 change:&v7];
  -[SVPlaybackCoordinator setPlayerItemPresentationSizeObserver:](self, "setPlayerItemPresentationSizeObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __62__SVPlaybackCoordinator_addPlayerItemPresentationSizeObserver__block_invoke(uint64_t a1)
{
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v3 player];
  double v2 = [v1 currentItem];
  [v2 presentationSize];
  objc_msgSend(v3, "setDimensions:");
}

- (void)removePlayerItemPresentationSizeObserver
{
}

- (void)configureTimeline
{
  id v3 = [(SVPlaybackCoordinator *)self timeline];
  -[SVTimeline cancelScheduledBlocks]((uint64_t)v3);

  double v4 = [(SVPlaybackCoordinator *)self timeline];
  -[SVTimeline resetTime]((uint64_t)v4);

  uint64_t v5 = [(SVPlaybackCoordinator *)self timeline];
  [(SVPlaybackCoordinator *)self duration];
  -[SVTimeline setDuration:]((uint64_t)v5, v6);

  if ([(SVPlaybackCoordinator *)self supportImpressionTracking])
  {
    objc_initWeak(&location, self);
    uint64_t v7 = [(SVPlaybackCoordinator *)self timeline];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __42__SVPlaybackCoordinator_configureTimeline__block_invoke;
    v35[3] = &unk_264771208;
    objc_copyWeak(&v36, &location);
    uint64_t v8 = [(SVPlaybackCoordinator *)self video];
    [v8 impressionThreshold];
    id v10 = -[SVTimeline performBlock:at:](v7, v35, v9);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  if ([(SVPlaybackCoordinator *)self supportsQuartileTracking])
  {
    [(SVPlaybackCoordinator *)self duration];
    double v12 = v11;
    [(SVPlaybackCoordinator *)self duration];
    double v14 = v13;
    [(SVPlaybackCoordinator *)self duration];
    double v16 = v15;
    objc_initWeak(&location, self);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __42__SVPlaybackCoordinator_configureTimeline__block_invoke_2;
    v33[3] = &unk_264771230;
    objc_copyWeak(&v34, &location);
    uint64_t v17 = (void *)MEMORY[0x22A63E020](v33);
    long long v18 = [(SVPlaybackCoordinator *)self timeline];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __42__SVPlaybackCoordinator_configureTimeline__block_invoke_3;
    v31[3] = &unk_2647710F0;
    id v19 = v17;
    id v32 = v19;
    id v20 = -[SVTimeline performBlock:at:](v18, v31, v12 * 0.25);

    long long v21 = [(SVPlaybackCoordinator *)self timeline];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __42__SVPlaybackCoordinator_configureTimeline__block_invoke_4;
    v29[3] = &unk_2647710F0;
    id v22 = v19;
    id v30 = v22;
    id v23 = -[SVTimeline performBlock:at:](v21, v29, v14 * 0.5);

    id v24 = [(SVPlaybackCoordinator *)self timeline];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __42__SVPlaybackCoordinator_configureTimeline__block_invoke_5;
    v27[3] = &unk_2647710F0;
    id v25 = v22;
    id v28 = v25;
    id v26 = -[SVTimeline performBlock:at:](v24, v27, v16 * 0.75);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
}

void __42__SVPlaybackCoordinator_configureTimeline__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained video];
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v3 = [WeakRetained video];
    [v3 playbackPassedImpressionThreshold];
  }
}

void __42__SVPlaybackCoordinator_configureTimeline__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained video];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [WeakRetained video];
    [v5 playbackPassedQuartile:a2];
  }
}

uint64_t __42__SVPlaybackCoordinator_configureTimeline__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __42__SVPlaybackCoordinator_configureTimeline__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __42__SVPlaybackCoordinator_configureTimeline__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)playbackResumedAtTime:(double)a3
{
  [(SVPlaybackCoordinator *)self pausedAtTime];
  double v5 = v4;
  [(SVPlaybackCoordinator *)self time];
  double v7 = v5 - v6;
  if (v7 < 0.0) {
    double v7 = -v7;
  }
  if (v7 > 0.5)
  {
    uint64_t v8 = [(SVPlaybackCoordinator *)self timeline];
    -[SVTimeline cancelScheduledBlocks]((uint64_t)v8);
  }

  [(SVPlaybackCoordinator *)self setPausedAtTime:0.0];
}

- (BOOL)supportImpressionTracking
{
  id v3 = [(SVPlaybackCoordinator *)self video];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  double v5 = [(SVPlaybackCoordinator *)self video];
  [v5 impressionThreshold];
  BOOL v7 = v6 > 0.0;

  return v7;
}

- (BOOL)supportsQuartileTracking
{
  [(SVPlaybackCoordinator *)self duration];
  [(SVPlaybackCoordinator *)self duration];
  return v3 > 0.0;
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(SVPlaybackCoordinator *)self stateChanged];
  }
}

- (void)setMuted:(BOOL)a3
{
  if (self->_muted != a3)
  {
    BOOL v3 = a3;
    self->_muted = a3;
    id v4 = [(SVPlaybackCoordinator *)self player];
    [v4 setMuted:v3];
  }
}

- (BOOL)playbackLikelyToKeepUp
{
  return self->_playbackLikelyToKeepUp;
}

- (BOOL)playbackBufferFull
{
  return self->_playbackBufferFull;
}

- (SVVideoProviding)video
{
  return self->_video;
}

- (unint64_t)state
{
  return self->_state;
}

- (CGSize)dimensions
{
  double width = self->_dimensions.width;
  double height = self->_dimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDimensions:(CGSize)a3
{
  self->_dimensions = a3;
}

- (SVVideoPlaybackHost)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (SVVideoPlaybackHost *)WeakRetained;
}

- (BOOL)muted
{
  return self->_muted;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)playbackRequested
{
  return self->_playbackRequested;
}

- (void)setPlaybackRequested:(BOOL)a3
{
  self->_playbackRequested = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (SVAVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
}

- (BOOL)initiatedPlayback
{
  return self->_initiatedPlayback;
}

- (void)setInitiatedPlayback:(BOOL)a3
{
  self->_initiatedPlayback = a3;
}

- (SVKeyValueObserver)playerItemPresentationSizeObserver
{
  return self->_playerItemPresentationSizeObserver;
}

- (void)setPlayerItemPresentationSizeObserver:(id)a3
{
}

- (SVKeyValueObserver)readyForDisplayObserver
{
  return self->_readyForDisplayObserver;
}

- (void)setReadyForDisplayObserver:(id)a3
{
}

- (SVAVPlayerFactory)playerFactory
{
  return self->_playerFactory;
}

- (SVKeyValueObserver)muteStateObserver
{
  return self->_muteStateObserver;
}

- (void)setMuteStateObserver:(id)a3
{
}

- (SVKeyValueObserver)playbackLikelyToKeepUpObserver
{
  return self->_playbackLikelyToKeepUpObserver;
}

- (void)setPlaybackLikelyToKeepUpObserver:(id)a3
{
}

- (SVKeyValueObserver)playbackBufferFullObserver
{
  return self->_playbackBufferFullObserver;
}

- (void)setPlaybackBufferFullObserver:(id)a3
{
}

- (SVTimeline)timeline
{
  return self->_timeline;
}

- (double)pausedAtTime
{
  return self->_pausedAtTime;
}

- (void)setPausedAtTime:(double)a3
{
  self->_pausedAtTime = a3;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
}

- (NSTimer)readyToPlayTimer
{
  return self->_readyToPlayTimer;
}

- (void)setReadyToPlayTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readyToPlayTimer, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_playbackBufferFullObserver, 0);
  objc_storeStrong((id *)&self->_playbackLikelyToKeepUpObserver, 0);
  objc_storeStrong((id *)&self->_muteStateObserver, 0);
  objc_storeStrong((id *)&self->_playerFactory, 0);
  objc_storeStrong((id *)&self->_readyForDisplayObserver, 0);
  objc_storeStrong((id *)&self->_playerItemPresentationSizeObserver, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_host);

  objc_storeStrong((id *)&self->_video, 0);
}

@end