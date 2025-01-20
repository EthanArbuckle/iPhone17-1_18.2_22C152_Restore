@interface SFMediaPlayerView
+ (Class)layerClass;
- (BOOL)isPaused;
- (BOOL)pausesAfterEachItem;
- (void)_pause;
- (void)addMovieItem:(id)a3;
- (void)advanceToNextItem;
- (void)breakFirstEnqueuedLoop;
- (void)dealloc;
- (void)dequeueNonPlayingItemsFromMediaItem:(id)a3;
- (void)enqueueItemsFromMediaItem:(id)a3 afterItem:(id)a4;
- (void)handleBoundaryTimeObserverForMediaItem:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)playerItemDidReachEnd:(id)a3;
- (void)removeAllQueuedItems;
- (void)removeMovieItem:(id)a3;
- (void)setPausesAfterEachItem:(BOOL)a3;
- (void)setUpTimeRangeNotificationsForItem:(id)a3;
- (void)speedUpRemainderOfCurrentItem;
- (void)startMovieLoopWithPath:(id)a3;
- (void)startMovieLoopWithPath:(id)a3 assetType:(int)a4 adjustmentsURL:(id)a5;
- (void)stop;
- (void)stopSpeedUpTimer;
- (void)updateViewForAssetType:(int)a3 adjustmentsURL:(id)a4;
@end

@implementation SFMediaPlayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21DB23000, log, OS_LOG_TYPE_FAULT, "SFMediaPlayerView deallocated before calling stop", v1, 2u);
}

- (void)startMovieLoopWithPath:(id)a3
{
  id v11 = a3;
  v4 = self->_avQueuePlayer;
  if (!v4)
  {
    v5 = [MEMORY[0x263EF93E0] sharedInstance];
    [v5 setCategory:*MEMORY[0x263EF9048] withOptions:1 error:0];

    v4 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x263EFA860]);
    [(AVQueuePlayer *)v4 setAllowsExternalPlayback:0];
    [(AVQueuePlayer *)v4 setPreventsDisplaySleepDuringVideoPlayback:0];
    [(AVQueuePlayer *)v4 _setDisallowsAutoPauseOnRouteRemovalIfNoAudio:1];
    objc_storeStrong((id *)&self->_avQueuePlayer, v4);
    v6 = [(SFMediaPlayerView *)self layer];
    [v6 setPlayer:v4];

    [(SFMediaPlayerView *)self setPausesAfterEachItem:[(SFMediaPlayerView *)self pausesAfterEachItem]];
  }
  v7 = [NSURL fileURLWithPath:v11 isDirectory:0];
  v8 = [MEMORY[0x263EFA800] playerItemWithURL:v7];
  v9 = [MEMORY[0x263EFA840] playerLooperWithPlayer:v4 templateItem:v8];
  avLooper = self->_avLooper;
  self->_avLooper = v9;

  [(SFMediaPlayerView *)self play];
}

- (void)updateViewForAssetType:(int)a3 adjustmentsURL:(id)a4
{
  SFAdjustmentFiltersForAssetTypeAndURL(a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(SFMediaPlayerView *)self layer];
  [v5 setFilters:v6];
}

- (void)startMovieLoopWithPath:(id)a3 assetType:(int)a4 adjustmentsURL:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  [(SFMediaPlayerView *)self updateViewForAssetType:v6 adjustmentsURL:a5];
  [(SFMediaPlayerView *)self startMovieLoopWithPath:v8];
}

- (void)stop
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SFMediaPlayerView stop]";
    _os_log_impl(&dword_21DB23000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(SFMediaPlayerView *)self _pause];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = (void *)[(NSMutableArray *)self->_mediaItems copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [(SFMediaPlayerView *)self removeMovieItem:*(void *)(*((void *)&v13 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if (self->_isKVOObserver) {
    [(AVQueuePlayer *)self->_avQueuePlayer removeObserver:self forKeyPath:@"currentItem" context:SFMediaPlayerViewObserverContext];
  }
  avQueuePlayer = self->_avQueuePlayer;
  self->_avQueuePlayer = 0;

  avLooper = self->_avLooper;
  self->_avLooper = 0;

  mediaItems = self->_mediaItems;
  self->_mediaItems = 0;

  [(SFMediaPlayerView *)self stopSpeedUpTimer];
}

- (void)play
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[SFMediaPlayerView play]";
    _os_log_impl(&dword_21DB23000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(AVQueuePlayer *)self->_avQueuePlayer play];
}

- (void)pause
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[SFMediaPlayerView pause]";
    _os_log_impl(&dword_21DB23000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(SFMediaPlayerView *)self _pause];
}

- (void)_pause
{
}

- (BOOL)isPaused
{
  [(AVQueuePlayer *)self->_avQueuePlayer rate];
  return fabsf(v2) < 0.00000011921;
}

- (void)advanceToNextItem
{
}

- (void)setPausesAfterEachItem:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = "no";
    if (v3) {
      uint64_t v6 = "yes";
    }
    int v7 = 136315394;
    uint64_t v8 = "-[SFMediaPlayerView setPausesAfterEachItem:]";
    __int16 v9 = 2080;
    v10 = v6;
    _os_log_impl(&dword_21DB23000, v5, OS_LOG_TYPE_DEFAULT, "%s %s", (uint8_t *)&v7, 0x16u);
  }

  self->_pausesAfterEachItem = v3;
  [(AVQueuePlayer *)self->_avQueuePlayer setActionAtItemEnd:v3];
}

- (void)addMovieItem:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  mediaItems = self->_mediaItems;
  if (!mediaItems)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    int v7 = self->_mediaItems;
    self->_mediaItems = v6;

    mediaItems = self->_mediaItems;
  }
  [(NSMutableArray *)mediaItems addObject:v4];
  uint64_t v8 = (void *)MEMORY[0x263EFA800];
  __int16 v9 = [v4 url];
  v10 = [v8 playerItemWithURL:v9];

  [v4 setPlayerItem:v10];
  uint64_t v11 = self->_avQueuePlayer;
  if (!v11)
  {
    v12 = [MEMORY[0x263EF93E0] sharedInstance];
    [v12 setCategory:*MEMORY[0x263EF9048] withOptions:1 error:0];

    uint64_t v11 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x263EFA860]);
    [(AVQueuePlayer *)v11 setAllowsExternalPlayback:0];
    [(AVQueuePlayer *)v11 setPreventsDisplaySleepDuringVideoPlayback:0];
    [(AVQueuePlayer *)v11 _setDisallowsAutoPauseOnRouteRemovalIfNoAudio:1];
    objc_storeStrong((id *)&self->_avQueuePlayer, v11);
    long long v13 = [(SFMediaPlayerView *)self layer];
    [v13 setPlayer:v11];

    [(SFMediaPlayerView *)self setPausesAfterEachItem:[(SFMediaPlayerView *)self pausesAfterEachItem]];
    [(AVQueuePlayer *)self->_avQueuePlayer addObserver:self forKeyPath:@"currentItem" options:3 context:SFMediaPlayerViewObserverContext];
    self->_isKVOObserver = 1;
  }
  long long v14 = framework_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    long long v16 = "-[SFMediaPlayerView addMovieItem:]";
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_21DB23000, v14, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v15, 0x16u);
  }

  [(SFMediaPlayerView *)self enqueueItemsFromMediaItem:v4 afterItem:0];
}

- (void)removeAllQueuedItems
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)[(NSMutableArray *)self->_mediaItems copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[SFMediaPlayerView removeMovieItem:](self, "removeMovieItem:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeMovieItem:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    long long v10 = "-[SFMediaPlayerView removeMovieItem:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_21DB23000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v6 = [v4 observerToken];

  if (v6)
  {
    avQueuePlayer = self->_avQueuePlayer;
    uint64_t v8 = [v4 observerToken];
    [(AVQueuePlayer *)avQueuePlayer removeTimeObserver:v8];
  }
  [v4 invalidate];
  [(NSMutableArray *)self->_mediaItems removeObject:v4];
}

- (void)breakFirstEnqueuedLoop
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_mediaItems;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "shouldLoop", (void)v10))
        {
          [v8 setShouldLoop:0];
          [(SFMediaPlayerView *)self dequeueNonPlayingItemsFromMediaItem:v8];
          int v9 = framework_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            int v15 = "-[SFMediaPlayerView breakFirstEnqueuedLoop]";
            __int16 v16 = 2112;
            __int16 v17 = v8;
            _os_log_impl(&dword_21DB23000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
          }

          goto LABEL_13;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)speedUpRemainderOfCurrentItem
{
  [(SFMediaPlayerView *)self stopSpeedUpTimer];
  BOOL v3 = [(AVQueuePlayer *)self->_avQueuePlayer currentItem];
  if (v3)
  {
    uint64_t v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    speedUpTimer = self->_speedUpTimer;
    self->_speedUpTimer = v4;

    uint64_t v6 = self->_speedUpTimer;
    dispatch_time_t v7 = dispatch_time(0, 100000000);
    dispatch_source_set_timer(v6, v7, 0x5F5E100uLL, 0x17D7840uLL);
    uint64_t v8 = self->_speedUpTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __50__SFMediaPlayerView_speedUpRemainderOfCurrentItem__block_invoke;
    handler[3] = &unk_2644723C8;
    handler[4] = self;
    handler[5] = v3;
    handler[6] = 200;
    long long v10 = xmmword_21DBB2110;
    uint64_t v11 = 100;
    uint64_t v12 = 0x4000000000000000;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume((dispatch_object_t)self->_speedUpTimer);
  }
}

void __50__SFMediaPlayerView_speedUpRemainderOfCurrentItem__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 416) rate];
  float v3 = v2;
  memset(&v24, 0, sizeof(v24));
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    [v4 duration];
  }
  else {
    memset(&lhs, 0, sizeof(lhs));
  }
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 416);
  if (v5) {
    [v5 currentTime];
  }
  else {
    memset(&rhs, 0, sizeof(rhs));
  }
  CMTimeSubtract(&v24, &lhs, &rhs);
  CMTime time = v24;
  unint64_t v6 = (unint64_t)(CMTimeGetSeconds(&time) * 1000.0);
  unint64_t v7 = *(void *)(a1 + 48);
  BOOL v8 = v6 >= v7;
  unint64_t v9 = v6 - v7;
  if (!v8) {
    unint64_t v9 = 0;
  }
  double v10 = v3;
  double v11 = *(double *)(a1 + 56);
  double v12 = *(double *)(a1 + 64);
  double v13 = v3 - v11;
  double v14 = (double)*(unint64_t *)(a1 + 72);
  unint64_t v15 = (unint64_t)(v13 / v12 * v14);
  if (v9 <= v15)
  {
    if (v13 <= v11) {
      double v13 = *(double *)(a1 + 56);
    }
    float v16 = v13 / (double)v9 * v14;
    double v17 = (float)(v3 - v16);
    if (v11 < v17) {
      double v11 = v17;
    }
  }
  else
  {
    double v11 = v12 + v10;
    if (v12 + v10 >= *(double *)(a1 + 80)) {
      double v11 = *(double *)(a1 + 80);
    }
  }
  float v18 = v11;
  if (vabds_f32(v3, v18) >= 0.00000011921)
  {
    uint64_t v19 = framework_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 48);
      LODWORD(time.value) = 136316418;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)"-[SFMediaPlayerView speedUpRemainderOfCurrentItem]_block_invoke";
      LOWORD(time.flags) = 2048;
      *(void *)((char *)&time.flags + 2) = v15;
      HIWORD(time.epoch) = 2048;
      unint64_t v26 = v6;
      __int16 v27 = 2048;
      uint64_t v28 = v20;
      __int16 v29 = 2048;
      double v30 = v3;
      __int16 v31 = 2048;
      double v32 = v18;
      _os_log_impl(&dword_21DB23000, v19, OS_LOG_TYPE_DEFAULT, "%s timeToReturnMS:%lums, timeRemaining:%lums (buffer: %lums), rate change %f->%f", (uint8_t *)&time, 0x3Eu);
    }

    *(float *)&double v21 = v18;
    [*(id *)(*(void *)(a1 + 32) + 416) setRate:v21];
  }
}

- (void)stopSpeedUpTimer
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  speedUpTimer = self->_speedUpTimer;
  if (speedUpTimer)
  {
    uint64_t v4 = speedUpTimer;
    dispatch_source_cancel(v4);
    uint64_t v5 = self->_speedUpTimer;
    self->_speedUpTimer = 0;

    LODWORD(v6) = 1.0;
    [(AVQueuePlayer *)self->_avQueuePlayer setRate:v6];
    unint64_t v7 = framework_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      [(AVQueuePlayer *)self->_avQueuePlayer rate];
      int v9 = 136315394;
      double v10 = "-[SFMediaPlayerView stopSpeedUpTimer]";
      __int16 v11 = 2048;
      double v12 = v8;
      _os_log_impl(&dword_21DB23000, v7, OS_LOG_TYPE_DEFAULT, "%s Resetting rate to %f", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)enqueueItemsFromMediaItem:(id)a3 afterItem:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  float v8 = framework_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SFMediaPlayerView enqueueItemsFromMediaItem:afterItem:]";
    _os_log_impl(&dword_21DB23000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v9 = v7;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v20 = v6;
  id obj = [v6 playerItems];
  uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  double v21 = v9;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    uint64_t v22 = *MEMORY[0x263EFA050];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        unint64_t v15 = [(AVQueuePlayer *)self->_avQueuePlayer items];
        char v16 = [v15 containsObject:v14];

        if ((v16 & 1) == 0)
        {
          *(_OWORD *)buf = *MEMORY[0x263F010E0];
          *(void *)&buf[16] = *(void *)(MEMORY[0x263F010E0] + 16);
          long long v26 = *(_OWORD *)buf;
          uint64_t v27 = *(void *)&buf[16];
          long long v24 = *(_OWORD *)buf;
          uint64_t v25 = *(void *)&buf[16];
          [v14 seekToTime:buf toleranceBefore:&v26 toleranceAfter:&v24 completionHandler:0];
          double v17 = framework_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "-[SFMediaPlayerView enqueueItemsFromMediaItem:afterItem:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v14;
            *(_WORD *)&buf[22] = 2112;
            id v33 = v9;
            _os_log_impl(&dword_21DB23000, v17, OS_LOG_TYPE_DEFAULT, "%s insertItem: %@ afterItem: %@", buf, 0x20u);
          }

          [(AVQueuePlayer *)self->_avQueuePlayer insertItem:v14 afterItem:v9];
          float v18 = [MEMORY[0x263F08A00] defaultCenter];
          [v18 addObserver:self selector:sel_playerItemDidReachEnd_ name:v22 object:v14];

          id v19 = v14;
          id v9 = v19;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v11);
  }
}

- (void)dequeueNonPlayingItemsFromMediaItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v24 = "-[SFMediaPlayerView dequeueNonPlayingItemsFromMediaItem:]";
    _os_log_impl(&dword_21DB23000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = [(AVQueuePlayer *)self->_avQueuePlayer currentItem];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  float v18 = v4;
  id v7 = [v4 playerItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v13 = v6;
        id v14 = v12;
        if (v13 == v14)
        {

          continue;
        }
        unint64_t v15 = v14;
        if ((v6 == 0) != (v14 != 0))
        {
          char v16 = [v13 isEqual:v14];

          if (v16) {
            continue;
          }
        }
        else
        {
        }
        double v17 = framework_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          long long v24 = "-[SFMediaPlayerView dequeueNonPlayingItemsFromMediaItem:]";
          __int16 v25 = 2112;
          long long v26 = v15;
          _os_log_impl(&dword_21DB23000, v17, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
        }

        [(AVQueuePlayer *)self->_avQueuePlayer removeItem:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v9);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)SFMediaPlayerViewObserverContext == a6)
  {
    id v13 = (__CFString *)v10;
    if (v13 == @"currentItem"
      || (id v14 = v13) != 0
      && (int v15 = [(__CFString *)v13 isEqual:@"currentItem"], v14, v15))
    {
      id v30 = v11;
      id v31 = v10;
      uint64_t v16 = [v12 objectForKey:*MEMORY[0x263F081C8]];
      double v17 = [v12 objectForKey:*MEMORY[0x263F081B8]];
      float v18 = framework_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v41 = "-[SFMediaPlayerView observeValueForKeyPath:ofObject:change:context:]";
        __int16 v42 = 2112;
        uint64_t v43 = v16;
        __int16 v44 = 2112;
        v45 = v17;
        _os_log_impl(&dword_21DB23000, v18, OS_LOG_TYPE_DEFAULT, "%s currentItem: %@ -> %@", buf, 0x20u);
      }
      long long v29 = (void *)v16;

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v19 = self->_mediaItems;
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v35 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            __int16 v25 = [v24 playerItems];
            int v26 = [v25 containsObject:v17];

            if (v26)
            {
              uint64_t v27 = [v24 startedHandler];

              if (v27)
              {
                uint64_t v28 = [v24 startedHandler];
                v28[2]();
              }
              [(SFMediaPlayerView *)self setUpTimeRangeNotificationsForItem:v24];
              if ([v24 shouldLoop])
              {
                block[0] = MEMORY[0x263EF8330];
                block[1] = 3221225472;
                block[2] = __68__SFMediaPlayerView_observeValueForKeyPath_ofObject_change_context___block_invoke;
                block[3] = &unk_264471F30;
                block[4] = self;
                block[5] = v24;
                id v33 = v17;
                dispatch_async(MEMORY[0x263EF83A0], block);
              }
            }
          }
          uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v21);
      }

      id v11 = v30;
      id v10 = v31;
    }
  }
  else
  {
    v38.receiver = self;
    v38.super_class = (Class)SFMediaPlayerView;
    [(SFMediaPlayerView *)&v38 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __68__SFMediaPlayerView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enqueueItemsFromMediaItem:*(void *)(a1 + 40) afterItem:*(void *)(a1 + 48)];
}

- (void)setUpTimeRangeNotificationsForItem:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 playbackNotificationTimeRanges];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v8 = [v4 playbackNotificationTimeRanges];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          memset(&buf, 0, sizeof(buf));
          if (v12) {
            [v12 CMTimeRangeValue];
          }
          *(_OWORD *)&range.start.value = *(_OWORD *)&buf.start.value;
          range.start.epoch = buf.start.epoch;
          id v13 = [MEMORY[0x263F08D40] valueWithCMTime:&range];
          [v7 addObject:v13];

          id v14 = (void *)MEMORY[0x263F08D40];
          CMTimeRange range = buf;
          CMTimeRangeGetEnd(&v31, &range);
          int v15 = [v14 valueWithCMTime:&v31];
          [v7 addObject:v15];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v9);
    }

    uint64_t v16 = [v4 observerToken];

    if (v16)
    {
      avQueuePlayer = self->_avQueuePlayer;
      float v18 = [v4 observerToken];
      [(AVQueuePlayer *)avQueuePlayer removeTimeObserver:v18];
    }
    long long v19 = framework_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = SFCompactStringFromCollection();
      LODWORD(buf.start.value) = 136315650;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)"-[SFMediaPlayerView setUpTimeRangeNotificationsForItem:]";
      LOWORD(buf.start.flags) = 2112;
      *(void *)((char *)&buf.start.flags + 2) = v4;
      HIWORD(buf.start.epoch) = 2112;
      buf.duration.value = (CMTimeValue)v20;
      _os_log_impl(&dword_21DB23000, v19, OS_LOG_TYPE_DEFAULT, "%s mediaItem: %@, times: %@", (uint8_t *)&buf, 0x20u);
    }
    buf.start.value = 0;
    objc_initWeak((id *)&buf, self);
    range.start.value = 0;
    objc_initWeak((id *)&range, v4);
    uint64_t v21 = self->_avQueuePlayer;
    id v22 = MEMORY[0x263EF83A0];
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    int v26 = __56__SFMediaPlayerView_setUpTimeRangeNotificationsForItem___block_invoke;
    uint64_t v27 = &unk_2644723F0;
    objc_copyWeak(&v28, (id *)&buf);
    objc_copyWeak(&v29, (id *)&range);
    v23 = [(AVQueuePlayer *)v21 addBoundaryTimeObserverForTimes:v7 queue:MEMORY[0x263EF83A0] usingBlock:&v24];
    objc_msgSend(v4, "setObserverToken:", v23, v24, v25, v26, v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)&range);
    objc_destroyWeak((id *)&buf);
  }
}

void __56__SFMediaPlayerView_setUpTimeRangeNotificationsForItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleBoundaryTimeObserverForMediaItem:v2];
}

- (void)handleBoundaryTimeObserverForMediaItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = 0uLL;
  CMTimeEpoch v26 = 0;
  avQueuePlayer = self->_avQueuePlayer;
  if (avQueuePlayer) {
    [(AVQueuePlayer *)avQueuePlayer currentTime];
  }
  memset(&v24, 0, sizeof(v24));
  CMTimeMake(&v24, 1, 10);
  uint64_t v6 = [v4 playbackNotificationTimeRanges];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = [v4 playbackNotificationTimeRanges];
      uint64_t v10 = [v9 objectAtIndexedSubscript:v8];

      memset(&v23, 0, sizeof(v23));
      if (v10) {
        [v10 CMTimeRangeValue];
      }
      long long v21 = *(_OWORD *)&v23.start.value;
      CMTimeEpoch epoch = v23.start.epoch;
      *(_OWORD *)&lhs.start.value = *(_OWORD *)&v23.start.value;
      lhs.start.CMTimeEpoch epoch = v23.start.epoch;
      CMTime rhs = v24;
      CMTimeSubtract(&time1, &lhs.start, &rhs);
      *(_OWORD *)&lhs.start.value = v25;
      lhs.start.CMTimeEpoch epoch = v26;
      if (CMTimeCompare(&time1, &lhs.start) < 0)
      {
        *(_OWORD *)&lhs.start.value = v21;
        lhs.start.CMTimeEpoch epoch = epoch;
        CMTime rhs = v24;
        CMTimeAdd(&v18, &lhs.start, &rhs);
        *(_OWORD *)&lhs.start.value = v25;
        lhs.start.CMTimeEpoch epoch = v26;
        if (CMTimeCompare(&v18, &lhs.start) >= 1) {
          break;
        }
      }
      memset(&rhs, 0, sizeof(rhs));
      CMTimeRange lhs = v23;
      CMTimeRangeGetEnd(&rhs, &lhs);
      lhs.start = rhs;
      CMTime v16 = v24;
      CMTimeSubtract(&v17, &lhs.start, &v16);
      *(_OWORD *)&lhs.start.value = v25;
      lhs.start.CMTimeEpoch epoch = v26;
      if (CMTimeCompare(&v17, &lhs.start) < 0)
      {
        lhs.start = rhs;
        CMTime v16 = v24;
        CMTimeAdd(&v15, &lhs.start, &v16);
        *(_OWORD *)&lhs.start.value = v25;
        lhs.start.CMTimeEpoch epoch = v26;
        if (CMTimeCompare(&v15, &lhs.start) >= 1)
        {
          id v13 = framework_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(lhs.start.value) = 136315650;
            *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)"-[SFMediaPlayerView handleBoundaryTimeObserverForMediaItem:]";
            LOWORD(lhs.start.flags) = 2112;
            *(void *)((char *)&lhs.start.flags + 2) = v4;
            HIWORD(lhs.start.epoch) = 2048;
            lhs.duration.value = v8;
            _os_log_impl(&dword_21DB23000, v13, OS_LOG_TYPE_DEFAULT, "%s mediaItem: %@, triggering timeRangeHandler with end of range %ld", (uint8_t *)&lhs, 0x20u);
          }
          goto LABEL_18;
        }
      }

      ++v8;
      id v11 = [v4 playbackNotificationTimeRanges];
      unint64_t v12 = [v11 count];

      if (v8 >= v12) {
        goto LABEL_19;
      }
    }
    id v13 = framework_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(lhs.start.value) = 136315650;
      *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)"-[SFMediaPlayerView handleBoundaryTimeObserverForMediaItem:]";
      LOWORD(lhs.start.flags) = 2112;
      *(void *)((char *)&lhs.start.flags + 2) = v4;
      HIWORD(lhs.start.epoch) = 2048;
      lhs.duration.value = v8;
      _os_log_impl(&dword_21DB23000, v13, OS_LOG_TYPE_DEFAULT, "%s mediaItem: %@, triggering timeRangeHandler with start of range %ld", (uint8_t *)&lhs, 0x20u);
    }
LABEL_18:

    id v14 = [v4 timeRangeHandler];
    v14[2]();
  }
LABEL_19:
}

- (void)playerItemDidReachEnd:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SFMediaPlayerView *)self stopSpeedUpTimer];
  uint64_t v5 = [v4 object];

  uint64_t v6 = framework_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTimeRange buf = 136315394;
    id v11 = "-[SFMediaPlayerView playerItemDidReachEnd:]";
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_21DB23000, v6, OS_LOG_TYPE_DEFAULT, "%s playerItem: %@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__SFMediaPlayerView_playerItemDidReachEnd___block_invoke;
  v8[3] = &unk_264471F08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __43__SFMediaPlayerView_playerItemDidReachEnd___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 424);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v8 = objc_msgSend(v7, "playerItems", (void)v13);
        int v9 = [v8 containsObject:*(void *)(a1 + 40)];

        if (v9)
        {
          if (([v7 shouldLoop] & 1) == 0)
          {
            uint64_t v10 = framework_log();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CMTimeRange buf = 136315394;
              CMTime v18 = "-[SFMediaPlayerView playerItemDidReachEnd:]_block_invoke";
              __int16 v19 = 2112;
              uint64_t v20 = v7;
              _os_log_impl(&dword_21DB23000, v10, OS_LOG_TYPE_DEFAULT, "%s endedItem: %@", buf, 0x16u);
            }

            id v11 = [v7 completedHandler];

            if (v11)
            {
              __int16 v12 = [v7 completedHandler];
              v12[2]();
            }
            [*(id *)(a1 + 32) removeMovieItem:v7];
          }
          goto LABEL_16;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

- (BOOL)pausesAfterEachItem
{
  return self->_pausesAfterEachItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speedUpTimer, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_avQueuePlayer, 0);
  objc_storeStrong((id *)&self->_avLooper, 0);
}

@end