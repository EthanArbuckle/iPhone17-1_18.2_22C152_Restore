@interface SVAVPlayer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cumulativeTimePlayed;
- (SVAVPlayer)initWithPlayerItem:(id)a3 audioMode:(int)a4;
- (SVAVPlayer)initWithURL:(id)a3;
- (SVAVPlayer)initWithURL:(id)a3 audioMode:(int)a4;
- (SVKeyValueObserver)durationObserver;
- (SVKeyValueObserver)loadedTimeRangesObserver;
- (SVKeyValueObserver)statusObserver;
- (SVKeyValueObserver)timeControlStatusObserver;
- (double)duration;
- (double)elapsedTime;
- (double)frameRate;
- (double)totalTimePlayed;
- (id)loadingProgressBlock;
- (id)playbackProgressBlock;
- (id)playbackStatusBlock;
- (id)timeObserver;
- (int)audioMode;
- (int)playbackPosition;
- (int)playbackStatus;
- (void)addObservers;
- (void)dealloc;
- (void)durationChanged;
- (void)loadFrameRate;
- (void)loadedTimeRangesChanged;
- (void)playedToEnd:(id)a3;
- (void)seekToStartWithCompletionBlock:(id)a3;
- (void)setCumulativeTimePlayed:(id *)a3;
- (void)setDuration:(double)a3;
- (void)setDurationObserver:(id)a3;
- (void)setElapsedTime:(double)a3;
- (void)setElapsedTime:(double)a3 duration:(double)a4;
- (void)setFrameRate:(double)a3;
- (void)setLoadedTimeRangesObserver:(id)a3;
- (void)setLoadingProgressBlock:(id)a3;
- (void)setPlaybackPosition:(int)a3;
- (void)setPlaybackProgressBlock:(id)a3;
- (void)setPlaybackStatus:(int)a3;
- (void)setPlaybackStatusBlock:(id)a3;
- (void)setStatusObserver:(id)a3;
- (void)setTimeControlStatusObserver:(id)a3;
- (void)setTimeObserver:(id)a3;
- (void)startTimeObserver;
- (void)statusChanged;
- (void)stopTimeObserver;
- (void)timeControlStatusChanged;
- (void)updateTime:(id *)a3 duration:(id *)a4;
@end

@implementation SVAVPlayer

- (SVAVPlayer)initWithURL:(id)a3
{
  return [(SVAVPlayer *)self initWithURL:a3 audioMode:1];
}

- (SVAVPlayer)initWithURL:(id)a3 audioMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = [MEMORY[0x263EFA470] assetWithURL:a3];
  v7 = [MEMORY[0x263EFA800] playerItemWithAsset:v6 automaticallyLoadedAssetKeys:&unk_26D96E760];
  v8 = [(SVAVPlayer *)self initWithPlayerItem:v7 audioMode:v4];

  return v8;
}

- (SVAVPlayer)initWithPlayerItem:(id)a3 audioMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SVAVPlayer;
  v7 = [(SVAVPlayer *)&v11 initWithPlayerItem:v6];
  if (v7)
  {
    [v6 setAllowedAudioSpatializationFormats:7];
    v8 = +[SVAudioSession sharedSessionForMode:v4];
    [v8 addInterestForPlayer:v7 withMode:v4];

    *((_DWORD *)v7 + 4) = v4;
    v9 = (_OWORD *)MEMORY[0x263F010E0];
    *((void *)v7 + 17) = *(void *)(MEMORY[0x263F010E0] + 16);
    *(_OWORD *)(v7 + 120) = *v9;
    [v7 setActionAtItemEnd:1];
    [v7 addObservers];
    [v7 loadFrameRate];
  }

  return (SVAVPlayer *)v7;
}

- (void)dealloc
{
  [(SVAVPlayer *)self stopTimeObserver];
  v3 = +[SVAudioSession sharedSessionForMode:[(SVAVPlayer *)self audioMode]];
  [v3 removeInterestForPlayer:self];

  v4.receiver = self;
  v4.super_class = (Class)SVAVPlayer;
  [(SVAVPlayer *)&v4 dealloc];
}

- (void)seekToStartWithCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SVAVPlayer_seekToStartWithCompletionBlock___block_invoke;
  v8[3] = &unk_2647712D0;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  long long v6 = *MEMORY[0x263F010E0];
  uint64_t v7 = *(void *)(MEMORY[0x263F010E0] + 16);
  [(SVAVPlayer *)self seekToTime:&v6 completionHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __45__SVAVPlayer_seekToStartWithCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (a2)
  {
    if (WeakRetained) {
      [WeakRetained currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    [v5 setElapsedTime:CMTimeGetSeconds(&time)];
    [v5 setPlaybackPosition:0];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (double)totalTimePlayed
{
  [(SVAVPlayer *)self cumulativeTimePlayed];
  return CMTimeGetSeconds(&time);
}

- (void)loadFrameRate
{
  objc_initWeak(&location, self);
  v3 = [(SVAVPlayer *)self currentItem];
  id v4 = [v3 asset];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__SVAVPlayer_loadFrameRate__block_invoke;
  v5[3] = &unk_264771208;
  objc_copyWeak(&v6, &location);
  [v4 loadValuesAsynchronouslyForKeys:&unk_26D96E778 completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __27__SVAVPlayer_loadFrameRate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained currentItem];
  v3 = [v2 asset];
  id v4 = [v3 tracksWithMediaType:*MEMORY[0x263EF9D48]];
  id v5 = [v4 firstObject];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__SVAVPlayer_loadFrameRate__block_invoke_2;
  v7[3] = &unk_2647712F8;
  id v8 = v5;
  id v9 = WeakRetained;
  id v6 = v5;
  [v6 loadValuesAsynchronouslyForKeys:&unk_26D96E790 completionHandler:v7];
}

uint64_t __27__SVAVPlayer_loadFrameRate__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) statusOfValueForKey:@"nominalFrameRate" error:0];
  if (result == 2)
  {
    v3 = *(void **)(a1 + 40);
    [*(id *)(a1 + 32) nominalFrameRate];
    double v5 = v4;
    return [v3 setFrameRate:v5];
  }
  return result;
}

- (void)startTimeObserver
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3810000000;
  v18 = "";
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  [(SVAVPlayer *)self currentTime];
  v3 = v16;
  float v4 = [(SVAVPlayer *)self currentItem];
  double v5 = v4;
  if (v4) {
    [v4 duration];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  *(_OWORD *)id location = *((_OWORD *)v3 + 2);
  uint64_t v13 = v3[6];
  [(SVAVPlayer *)self updateTime:location duration:v14];

  objc_initWeak(location, self);
  CMTimeMake(&v11, 1, 10);
  uint64_t v6 = MEMORY[0x263EF83A0];
  id v7 = MEMORY[0x263EF83A0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __31__SVAVPlayer_startTimeObserver__block_invoke;
  v9[3] = &unk_264771320;
  objc_copyWeak(&v10, location);
  v9[4] = &v15;
  id v8 = [(SVAVPlayer *)self addPeriodicTimeObserverForInterval:&v11 queue:v6 usingBlock:v9];
  [(SVAVPlayer *)self setTimeObserver:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(location);
  _Block_object_dispose(&v15, 8);
}

void __31__SVAVPlayer_startTimeObserver__block_invoke(uint64_t a1, long long *a2)
{
  memset(&v21, 0, sizeof(v21));
  float v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = [WeakRetained currentItem];
  id v7 = v6;
  if (v6) {
    [v6 duration];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }

  if (*((unsigned char *)a2 + 12) & 1) != 0 && (v21.flags)
  {
    memset(&v20, 0, sizeof(v20));
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    CMTime lhs = *(CMTime *)a2;
    CMTime rhs = *(CMTime *)(v8 + 32);
    CMTimeSubtract(&v20, &lhs, &rhs);
    id v9 = objc_loadWeakRetained(v4);
    id v10 = v9;
    if (v9) {
      [v9 cumulativeTimePlayed];
    }
    else {
      memset(&v16, 0, sizeof(v16));
    }
    CMTime lhs = v20;
    CMTimeAdd(&v17, &v16, &lhs);
    id v11 = objc_loadWeakRetained(v4);
    CMTime v15 = v17;
    [v11 setCumulativeTimePlayed:&v15];

    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v13 = *a2;
    *(void *)(v12 + 48) = *((void *)a2 + 2);
    *(_OWORD *)(v12 + 32) = v13;
    id v14 = objc_loadWeakRetained(v4);
    CMTime lhs = *(CMTime *)a2;
    CMTime rhs = v21;
    [v14 updateTime:&lhs duration:&rhs];
  }
}

- (void)updateTime:(id *)a3 duration:(id *)a4
{
  if (a3->var2 & 0x11) == 1 && (a4->var2)
  {
    if ((a4->var2 & 0x1D) == 1)
    {
      *(_OWORD *)&v8.value = *(_OWORD *)&a4->var0;
      CMTimeEpoch var3 = a4->var3;
    }
    else
    {
      *(_OWORD *)&v8.value = *MEMORY[0x263F010E0];
      CMTimeEpoch var3 = *(void *)(MEMORY[0x263F010E0] + 16);
    }
    v8.epoch = var3;
    CMTime v7 = *(CMTime *)a3;
    double Seconds = CMTimeGetSeconds(&v7);
    CMTime v7 = v8;
    [(SVAVPlayer *)self setElapsedTime:Seconds duration:CMTimeGetSeconds(&v7)];
  }
}

- (void)stopTimeObserver
{
  v3 = [(SVAVPlayer *)self timeObserver];
  [(SVAVPlayer *)self removeTimeObserver:v3];

  [(SVAVPlayer *)self setTimeObserver:0];
}

- (void)addObservers
{
  objc_initWeak(&location, self);
  v3 = [SVKeyValueObserver alloc];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __26__SVAVPlayer_addObservers__block_invoke;
  v22[3] = &unk_264771050;
  objc_copyWeak(&v23, &location);
  float v4 = [(SVKeyValueObserver *)v3 initWithKeyPath:@"timeControlStatus" ofObject:self withOptions:1 change:v22];
  [(SVAVPlayer *)self setTimeControlStatusObserver:v4];

  double v5 = [SVKeyValueObserver alloc];
  uint64_t v6 = [(SVAVPlayer *)self currentItem];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __26__SVAVPlayer_addObservers__block_invoke_2;
  v20[3] = &unk_264771050;
  objc_copyWeak(&v21, &location);
  CMTime v7 = [(SVKeyValueObserver *)v5 initWithKeyPath:@"status" ofObject:v6 withOptions:1 change:v20];
  [(SVAVPlayer *)self setStatusObserver:v7];

  CMTime v8 = [SVKeyValueObserver alloc];
  id v9 = [(SVAVPlayer *)self currentItem];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __26__SVAVPlayer_addObservers__block_invoke_3;
  v18[3] = &unk_264771050;
  objc_copyWeak(&v19, &location);
  id v10 = [(SVKeyValueObserver *)v8 initWithKeyPath:@"duration" ofObject:v9 withOptions:1 change:v18];
  [(SVAVPlayer *)self setDurationObserver:v10];

  id v11 = [SVKeyValueObserver alloc];
  uint64_t v12 = [(SVAVPlayer *)self currentItem];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __26__SVAVPlayer_addObservers__block_invoke_4;
  v16[3] = &unk_264771050;
  objc_copyWeak(&v17, &location);
  long long v13 = [(SVKeyValueObserver *)v11 initWithKeyPath:@"loadedTimeRanges" ofObject:v12 withOptions:1 change:v16];
  [(SVAVPlayer *)self setLoadedTimeRangesObserver:v13];

  id v14 = [MEMORY[0x263F08A00] defaultCenter];
  CMTime v15 = [(SVAVPlayer *)self currentItem];
  [v14 addObserver:self selector:sel_playedToEnd_ name:*MEMORY[0x263EFA050] object:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __26__SVAVPlayer_addObservers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained timeControlStatusChanged];
    id WeakRetained = v2;
  }
}

void __26__SVAVPlayer_addObservers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained statusChanged];
    id WeakRetained = v2;
  }
}

void __26__SVAVPlayer_addObservers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained durationChanged];
    id WeakRetained = v2;
  }
}

void __26__SVAVPlayer_addObservers__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained loadedTimeRangesChanged];
}

- (void)playedToEnd:(id)a3
{
  [(SVAVPlayer *)self setPlaybackPosition:1];

  [(SVAVPlayer *)self setPlaybackStatus:4];
}

- (void)setElapsedTime:(double)a3 duration:(double)a4
{
  if (self->_elapsedTime != a3 || self->_duration != a4)
  {
    [(SVAVPlayer *)self setElapsedTime:fmax(a3, 0.0)];
    [(SVAVPlayer *)self setDuration:fmax(a4, 0.0)];
    uint64_t v6 = [(SVAVPlayer *)self playbackProgressBlock];

    if (v6)
    {
      id v10 = [(SVAVPlayer *)self playbackProgressBlock];
      [(SVAVPlayer *)self elapsedTime];
      double v8 = v7;
      [(SVAVPlayer *)self duration];
      v10[2](v10, self, v8, v9);
    }
  }
}

- (void)setPlaybackStatus:(int)a3
{
  if (self->_playbackStatus != a3)
  {
    uint64_t v3 = *(void *)&a3;
    self->_playbackStatus = a3;
    double v5 = [(SVAVPlayer *)self currentItem];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 currentTime];
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
    }
    double v7 = [(SVAVPlayer *)self currentItem];
    double v8 = v7;
    if (v7)
    {
      [v7 duration];
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
    [(SVAVPlayer *)self updateTime:&v14 duration:&v11];

    if (v3 == 2)
    {
      [(SVAVPlayer *)self startTimeObserver];
    }
    else if ((v3 - 3) <= 2)
    {
      [(SVAVPlayer *)self stopTimeObserver];
    }
    double v9 = [(SVAVPlayer *)self playbackStatusBlock];

    if (v9)
    {
      id v10 = [(SVAVPlayer *)self playbackStatusBlock];
      ((void (**)(void, SVAVPlayer *, uint64_t))v10)[2](v10, self, v3);
    }
  }
}

- (void)statusChanged
{
  uint64_t v3 = [(SVAVPlayer *)self currentItem];
  uint64_t v4 = [v3 status];

  if (v4 == 2)
  {
    uint64_t v5 = 5;
  }
  else
  {
    if (v4 != 1 || [(SVAVPlayer *)self playbackStatus]) {
      return;
    }
    uint64_t v5 = 1;
  }

  [(SVAVPlayer *)self setPlaybackStatus:v5];
}

- (void)timeControlStatusChanged
{
  if ([(SVAVPlayer *)self timeControlStatus] == 2)
  {
    if ([(SVAVPlayer *)self playbackStatus] != 2)
    {
      [(SVAVPlayer *)self setPlaybackStatus:2];
      [(SVAVPlayer *)self setPlaybackPosition:2];
    }
  }
  else if (![(SVAVPlayer *)self timeControlStatus])
  {
    [(SVAVPlayer *)self stopTimeObserver];
    if ([(SVAVPlayer *)self playbackStatus] == 2
      && [(SVAVPlayer *)self playbackPosition] == 2)
    {
      [(SVAVPlayer *)self setPlaybackStatus:3];
    }
  }
}

- (void)loadedTimeRangesChanged
{
  uint64_t v3 = [(SVAVPlayer *)self loadingProgressBlock];

  if (v3)
  {
    uint64_t v6 = [(SVAVPlayer *)self loadingProgressBlock];
    uint64_t v4 = [(SVAVPlayer *)self currentItem];
    uint64_t v5 = [v4 loadedTimeRanges];
    v6[2](v6, self, v5);
  }
}

- (void)durationChanged
{
  uint64_t v3 = [(SVAVPlayer *)self currentItem];
  uint64_t v4 = v3;
  if (v3) {
    [v3 currentTime];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  uint64_t v5 = [(SVAVPlayer *)self currentItem];
  uint64_t v6 = v5;
  if (v5) {
    [v5 duration];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  [(SVAVPlayer *)self updateTime:v8 duration:v7];
}

- (int)audioMode
{
  return self->_audioMode;
}

- (int)playbackPosition
{
  return self->_playbackPosition;
}

- (void)setPlaybackPosition:(int)a3
{
  self->_playbackPosition = a3;
}

- (int)playbackStatus
{
  return self->_playbackStatus;
}

- (id)playbackStatusBlock
{
  return self->_playbackStatusBlock;
}

- (void)setPlaybackStatusBlock:(id)a3
{
}

- (id)playbackProgressBlock
{
  return self->_playbackProgressBlock;
}

- (void)setPlaybackProgressBlock:(id)a3
{
}

- (id)loadingProgressBlock
{
  return self->_loadingProgressBlock;
}

- (void)setLoadingProgressBlock:(id)a3
{
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(double)a3
{
  self->_frameRate = a3;
}

- (id)timeObserver
{
  return self->_timeObserver;
}

- (void)setTimeObserver:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cumulativeTimePlayed
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setCumulativeTimePlayed:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_cumulativeTimePlayed.value = *(_OWORD *)&a3->var0;
  self->_cumulativeTimePlayed.epoch = var3;
}

- (SVKeyValueObserver)timeControlStatusObserver
{
  return self->_timeControlStatusObserver;
}

- (void)setTimeControlStatusObserver:(id)a3
{
}

- (SVKeyValueObserver)statusObserver
{
  return self->_statusObserver;
}

- (void)setStatusObserver:(id)a3
{
}

- (SVKeyValueObserver)durationObserver
{
  return self->_durationObserver;
}

- (void)setDurationObserver:(id)a3
{
}

- (SVKeyValueObserver)loadedTimeRangesObserver
{
  return self->_loadedTimeRangesObserver;
}

- (void)setLoadedTimeRangesObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedTimeRangesObserver, 0);
  objc_storeStrong((id *)&self->_durationObserver, 0);
  objc_storeStrong((id *)&self->_statusObserver, 0);
  objc_storeStrong((id *)&self->_timeControlStatusObserver, 0);
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong(&self->_loadingProgressBlock, 0);
  objc_storeStrong(&self->_playbackProgressBlock, 0);

  objc_storeStrong(&self->_playbackStatusBlock, 0);
}

@end