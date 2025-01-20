@interface PXAVPlayerAudioSession
+ (OpaqueCMClock)sourceClock;
+ (id)_audioSession;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playerTime;
- (AVQueuePlayer)playerQueue_player;
- (BOOL)isPlaybackDesired;
- (BOOL)isPreparingToPlay;
- (BOOL)playerTimeHasChangedSinceSeeking;
- (OS_dispatch_queue)playerQueue;
- (PXAVPlayerAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7;
- (PXUpdater)updater;
- (float)playerRate;
- (id)playerTimeObserver;
- (void)_handleAVAsset:(id)a3 audioMix:(id)a4 info:(id)a5;
- (void)_handlePlayerItemFinishedSeekingForPlayback:(id)a3;
- (void)_handlePlayerTime:(id *)a3;
- (void)_invalidatePlayerRate;
- (void)_invalidatePlayerVolume;
- (void)_invalidateStatus;
- (void)_loadDurationFromAsset:(id)a3;
- (void)_performPlayerTransaction:(id)a3;
- (void)_playerQueue_performPlayerTransaction:(id)a3;
- (void)_prepareToPlayIfNeeded;
- (void)_updatePlayerRate;
- (void)_updatePlayerVolume;
- (void)_updateStatus;
- (void)cancelMediaRequest;
- (void)dealloc;
- (void)desiredPlayerVolumeDidChange;
- (void)didPerformChanges;
- (void)errorDidChange;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)performFinalCleanup;
- (void)performInternalChanges:(id)a3;
- (void)play;
- (void)playFromTime:(id *)a3;
- (void)prepareToPlay;
- (void)requestMediaWithResultHandler:(id)a3;
- (void)setIsPlaybackDesired:(BOOL)a3;
- (void)setIsPreparingToPlay:(BOOL)a3;
- (void)setPlayerRate:(float)a3;
- (void)setPlayerTime:(id *)a3;
- (void)setPlayerTimeHasChangedSinceSeeking:(BOOL)a3;
- (void)setPlayerTimeObserver:(id)a3;
@end

@implementation PXAVPlayerAudioSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerQueue_player, 0);
  objc_storeStrong((id *)&self->_playerQueue, 0);
  objc_storeStrong(&self->_playerTimeObserver, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

- (AVQueuePlayer)playerQueue_player
{
  return self->_playerQueue_player;
}

- (OS_dispatch_queue)playerQueue
{
  return self->_playerQueue;
}

- (void)setPlayerTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_playerTime.value = *(_OWORD *)&a3->var0;
  self->_playerTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playerTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[11];
  return self;
}

- (void)setPlayerTimeObserver:(id)a3
{
}

- (id)playerTimeObserver
{
  return self->_playerTimeObserver;
}

- (void)setPlayerTimeHasChangedSinceSeeking:(BOOL)a3
{
  self->_playerTimeHasChangedSinceSeeking = a3;
}

- (BOOL)playerTimeHasChangedSinceSeeking
{
  return self->_playerTimeHasChangedSinceSeeking;
}

- (float)playerRate
{
  return self->_playerRate;
}

- (BOOL)isPlaybackDesired
{
  return self->_isPlaybackDesired;
}

- (BOOL)isPreparingToPlay
{
  return self->_isPreparingToPlay;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)_handlePlayerItemFinishedSeekingForPlayback:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PXAVPlayerAudioSession__handlePlayerItemFinishedSeekingForPlayback___block_invoke;
  v6[3] = &unk_1E5DCFAF8;
  id v7 = v4;
  id v5 = v4;
  [(PXAVPlayerAudioSession *)self _performPlayerTransaction:v6];
  [(PXAVPlayerAudioSession *)self performInternalChanges:&__block_literal_global_56_275320];
}

uint64_t __70__PXAVPlayerAudioSession__handlePlayerItemFinishedSeekingForPlayback___block_invoke(uint64_t a1, void *a2)
{
  return [a2 replaceCurrentItemWithPlayerItem:*(void *)(a1 + 32)];
}

void __70__PXAVPlayerAudioSession__handlePlayerItemFinishedSeekingForPlayback___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIsReadyToPlay:1];
  [v2 setIsPreparingToPlay:0];
}

- (void)_loadDurationFromAsset:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = NSStringFromSelector(sel_duration);
  id v16 = 0;
  uint64_t v6 = [v4 statusOfValueForKey:v5 error:&v16];
  id v7 = v16;

  if (v6 == 3)
  {
    v8 = PLAudioPlaybackGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v4;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Failed to load duration from %@. Error: %@", buf, 0x16u);
    }
  }
  else if (v6 == 2)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__PXAVPlayerAudioSession__loadDurationFromAsset___block_invoke;
    v14[3] = &unk_1E5DCFAD0;
    id v15 = v4;
    [(PXAVPlayerAudioSession *)self performInternalChanges:v14];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v9 = NSStringFromSelector(sel_duration);
    v17 = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__PXAVPlayerAudioSession__loadDurationFromAsset___block_invoke_54;
    v11[3] = &unk_1E5DD20C8;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = v4;
    [v12 loadValuesAsynchronouslyForKeys:v10 completionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void __49__PXAVPlayerAudioSession__loadDurationFromAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 duration];
  }
  else
  {
    long long v7 = 0uLL;
    uint64_t v8 = 0;
  }
  long long v5 = v7;
  uint64_t v6 = v8;
  [v3 setDuration:&v5];
}

void __49__PXAVPlayerAudioSession__loadDurationFromAsset___block_invoke_54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _loadDurationFromAsset:*(void *)(a1 + 32)];
}

- (void)_handleAVAsset:(id)a3 audioMix:(id)a4 info:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8)
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F16620]) initWithAsset:v8];
    [v12 setAudioMix:v9];
    id v13 = PLAudioPlaybackGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(PXAudioSession *)self asset];
      id v15 = [v11 objectForKeyedSubscript:@"ProgramLoudnessLKFS"];
      id v16 = [v11 objectForKeyedSubscript:@"PeakdBFS"];
      *(_DWORD *)buf = 138543874;
      v27 = v14;
      __int16 v28 = 2114;
      v29 = v15;
      __int16 v30 = 2114;
      v31 = v16;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "Applying content loudness for %{public}@:\n\tLoudness: %{public}@\n\tPeak: %{public}@", buf, 0x20u);
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __55__PXAVPlayerAudioSession__handleAVAsset_audioMix_info___block_invoke_50;
    v22[3] = &unk_1E5DCFAD0;
    id v23 = v11;
    [(PXAVPlayerAudioSession *)self performInternalChanges:v22];
    [(PXAVPlayerAudioSession *)self _loadDurationFromAsset:v8];
    objc_initWeak((id *)buf, self);
    [(PXAudioSession *)self startTime];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__PXAVPlayerAudioSession__handleAVAsset_audioMix_info___block_invoke_2;
    v18[3] = &unk_1E5DD21B0;
    objc_copyWeak(&v20, (id *)buf);
    id v17 = v12;
    id v19 = v17;
    [v17 seekToTime:v21 completionHandler:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __55__PXAVPlayerAudioSession__handleAVAsset_audioMix_info___block_invoke;
    v24[3] = &unk_1E5DCFA98;
    v24[4] = self;
    id v25 = v10;
    [(PXAVPlayerAudioSession *)self performInternalChanges:v24];
  }
}

void __55__PXAVPlayerAudioSession__handleAVAsset_audioMix_info___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setStatus:4];
  uint64_t v10 = *MEMORY[0x1E4F28228];
  id v4 = (void *)[[NSString alloc] initWithFormat:@"%@ failed to fetch media for this song.", *(void *)(a1 + 32), v10];
  v11[0] = v4;
  long long v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Error"];
  if (v6)
  {
    long long v7 = (void *)[v5 mutableCopy];
    [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v8 = [v7 copy];

    long long v5 = (void *)v8;
  }
  id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "px_audioSessionErrorWithCode:userInfo:", 1, v5);
  [v3 setError:v9];
}

void __55__PXAVPlayerAudioSession__handleAVAsset_audioMix_info___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  long long v5 = [v3 objectForKeyedSubscript:@"PeakdBFS"];
  [v4 setContentPeakDecibels:v5];

  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ProgramLoudnessLKFS"];
  [v4 setContentLoudnessInLKFS:v6];
}

void __55__PXAVPlayerAudioSession__handleAVAsset_audioMix_info___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handlePlayerItemFinishedSeekingForPlayback:*(void *)(a1 + 32)];
}

- (void)setIsPlaybackDesired:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = [(PXAudioSession *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_isPlaybackDesired != v3)
  {
    self->_isPlaybackDesired = v3;
    [(PXAVPlayerAudioSession *)self _invalidatePlayerRate];
  }
}

- (void)setIsPreparingToPlay:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = [(PXAudioSession *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_isPreparingToPlay != v3)
  {
    self->_isPreparingToPlay = v3;
    [(PXAVPlayerAudioSession *)self _invalidateStatus];
    [(PXAVPlayerAudioSession *)self _invalidatePlayerRate];
  }
}

- (void)_prepareToPlayIfNeeded
{
  if ([(PXAudioSession *)self status] <= 0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__PXAVPlayerAudioSession__prepareToPlayIfNeeded__block_invoke;
    v6[3] = &unk_1E5DD0238;
    void v6[4] = self;
    [(PXAudioSession *)self performChanges:v6];
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __48__PXAVPlayerAudioSession__prepareToPlayIfNeeded__block_invoke_2;
    v3[3] = &unk_1E5DCFA68;
    objc_copyWeak(&v4, &location);
    [(PXAVPlayerAudioSession *)self requestMediaWithResultHandler:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

uint64_t __48__PXAVPlayerAudioSession__prepareToPlayIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsPreparingToPlay:1];
}

void __48__PXAVPlayerAudioSession__prepareToPlayIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleAVAsset:v9 audioMix:v8 info:v7];
}

- (void)_handlePlayerTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(PXAVPlayerAudioSession *)self setPlayerTime:&v4];
  [(PXAVPlayerAudioSession *)self setPlayerTimeHasChangedSinceSeeking:1];
}

- (void)_playerQueue_performPlayerTransaction:(id)a3
{
  id v5 = a3;
  id v6 = [(PXAVPlayerAudioSession *)self playerQueue_player];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)_performPlayerTransaction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(PXAVPlayerAudioSession *)self playerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PXAVPlayerAudioSession__performPlayerTransaction___block_invoke;
  block[3] = &unk_1E5DD1848;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__PXAVPlayerAudioSession__performPlayerTransaction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_playerQueue_performPlayerTransaction:", *(void *)(a1 + 32));
}

- (void)setPlayerRate:(float)a3
{
  id v5 = [(PXAudioSession *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_playerRate != a3)
  {
    self->_playerRate = a3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__PXAVPlayerAudioSession_setPlayerRate___block_invoke;
    v6[3] = &__block_descriptor_36_e18_v16__0__AVPlayer_8l;
    float v7 = a3;
    [(PXAVPlayerAudioSession *)self _performPlayerTransaction:v6];
    [(PXAVPlayerAudioSession *)self _invalidateStatus];
  }
}

uint64_t __40__PXAVPlayerAudioSession_setPlayerRate___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setRate:a3];
}

- (void)_updatePlayerRate
{
  unsigned int v3 = [(PXAVPlayerAudioSession *)self isPlaybackDesired];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__PXAVPlayerAudioSession__updatePlayerRate__block_invoke;
  v4[3] = &unk_1E5DCFA20;
  v4[4] = self;
  float v5 = (float)v3;
  [(PXAudioSession *)self performChanges:v4];
}

uint64_t __43__PXAVPlayerAudioSession__updatePlayerRate__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(a1 + 32) setPlayerRate:a2];
}

- (void)_invalidatePlayerRate
{
  id v2 = [(PXAVPlayerAudioSession *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePlayerRate];
}

- (void)_updatePlayerVolume
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__PXAVPlayerAudioSession__updatePlayerVolume__block_invoke;
  v2[3] = &unk_1E5DCF920;
  v2[4] = self;
  [(PXAVPlayerAudioSession *)self _performPlayerTransaction:v2];
}

void __45__PXAVPlayerAudioSession__updatePlayerVolume__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 desiredPlayerVolume];
  objc_msgSend(v3, "setVolume:");
}

- (void)_invalidatePlayerVolume
{
  id v2 = [(PXAVPlayerAudioSession *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePlayerVolume];
}

- (void)_updateStatus
{
  id v3 = [(PXAudioSession *)self error];

  if (v3)
  {
    uint64_t v4 = 4;
  }
  else if ([(PXAVPlayerAudioSession *)self isPreparingToPlay])
  {
    uint64_t v4 = 1;
  }
  else
  {
    [(PXAVPlayerAudioSession *)self playerRate];
    uint64_t v4 = 2;
    if (v5 > 0.0) {
      uint64_t v4 = 3;
    }
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__PXAVPlayerAudioSession__updateStatus__block_invoke;
  v6[3] = &__block_descriptor_40_e49_v16__0___PXInternalMutableAVPlayerAudioSession__8l;
  void v6[4] = v4;
  [(PXAVPlayerAudioSession *)self performInternalChanges:v6];
}

uint64_t __39__PXAVPlayerAudioSession__updateStatus__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStatus:*(void *)(a1 + 32)];
}

- (void)_invalidateStatus
{
  id v2 = [(PXAVPlayerAudioSession *)self updater];
  [v2 setNeedsUpdateOf:sel__updateStatus];
}

- (void)didPerformChanges
{
  id v3 = [(PXAudioSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4.receiver = self;
  v4.super_class = (Class)PXAVPlayerAudioSession;
  [(PXAudioSession *)&v4 didPerformChanges];
  [(PXUpdater *)self->_updater updateIfNeeded];
}

- (void)cancelMediaRequest
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  float v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXAVPlayerAudioSession.m", 213, @"Method %s is a responsibility of subclass %@", "-[PXAVPlayerAudioSession cancelMediaRequest]", v6 object file lineNumber description];

  abort();
}

- (void)requestMediaWithResultHandler:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  float v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXAVPlayerAudioSession.m", 209, @"Method %s is a responsibility of subclass %@", "-[PXAVPlayerAudioSession requestMediaWithResultHandler:]", v8 object file lineNumber description];

  abort();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  float v7 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0], a4);
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];

    if (v7 != v8)
    {
      memset(&v15, 0, sizeof(v15));
      id v9 = [(PXAudioSession *)self asset];
      uint64_t v10 = PXAudioAssetDefaultEntryPoint(v9);
      [v10 time];
      CMTimeMakeWithSeconds(&v15, v11, 600);

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __73__PXAVPlayerAudioSession_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v12[3] = &unk_1E5DCF9D8;
      id v13 = v7;
      CMTime v14 = v15;
      [(PXAVPlayerAudioSession *)self _performPlayerTransaction:v12];
    }
  }
}

void __73__PXAVPlayerAudioSession_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__PXAVPlayerAudioSession_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v8[3] = &unk_1E5DD0058;
  id v9 = v3;
  id v10 = v4;
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  id v5 = v3;
  [v10 seekToTime:&v6 completionHandler:v8];
}

uint64_t __73__PXAVPlayerAudioSession_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) insertItem:*(void *)(a1 + 40) afterItem:0];
}

- (void)performInternalChanges:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PXAVPlayerAudioSession_performInternalChanges___block_invoke;
  v7[3] = &unk_1E5DCF9B0;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)PXAVPlayerAudioSession;
  id v5 = v4;
  [(PXAudioSession *)&v6 performInternalChanges:v7];
}

uint64_t __49__PXAVPlayerAudioSession_performInternalChanges___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)errorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXAVPlayerAudioSession;
  [(PXAudioSession *)&v3 errorDidChange];
  [(PXAVPlayerAudioSession *)self _invalidateStatus];
}

- (void)desiredPlayerVolumeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXAVPlayerAudioSession;
  [(PXAudioSession *)&v3 desiredPlayerVolumeDidChange];
  [(PXAVPlayerAudioSession *)self _invalidatePlayerVolume];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  if ([(PXAVPlayerAudioSession *)self playerTimeHasChangedSinceSeeking])
  {
    return [(PXAVPlayerAudioSession *)self playerTime];
  }
  else
  {
    return [(PXAudioSession *)self startTime];
  }
}

- (void)playFromTime:(id *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__PXAVPlayerAudioSession_playFromTime___block_invoke;
  v3[3] = &__block_descriptor_56_e18_v16__0__AVPlayer_8l;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(PXAVPlayerAudioSession *)self _performPlayerTransaction:v3];
}

void __39__PXAVPlayerAudioSession_playFromTime___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v2 = a2;
  [v2 seekToTime:&v3];
  objc_msgSend(v2, "play", v3, v4);
}

- (void)play
{
  long long v3 = [(PXAudioSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__PXAVPlayerAudioSession_play__block_invoke;
  v4[3] = &unk_1E5DD0238;
  v4[4] = self;
  [(PXAudioSession *)self performChanges:v4];
  [(PXAVPlayerAudioSession *)self _prepareToPlayIfNeeded];
}

uint64_t __30__PXAVPlayerAudioSession_play__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsPlaybackDesired:1];
}

- (void)pause
{
  long long v3 = [(PXAudioSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__PXAVPlayerAudioSession_pause__block_invoke;
  v4[3] = &unk_1E5DD0238;
  v4[4] = self;
  [(PXAudioSession *)self performChanges:v4];
  [(PXAVPlayerAudioSession *)self _performPlayerTransaction:&__block_literal_global_20_275359];
}

uint64_t __31__PXAVPlayerAudioSession_pause__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsPlaybackDesired:0];
}

uint64_t __31__PXAVPlayerAudioSession_pause__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 pause];
}

- (void)prepareToPlay
{
  long long v3 = [(PXAudioSession *)self queue];
  dispatch_assert_queue_V2(v3);

  [(PXAVPlayerAudioSession *)self _prepareToPlayIfNeeded];
}

- (void)performFinalCleanup
{
  v4.receiver = self;
  v4.super_class = (Class)PXAVPlayerAudioSession;
  [(PXAudioSession *)&v4 performFinalCleanup];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__PXAVPlayerAudioSession_performFinalCleanup__block_invoke;
  v3[3] = &unk_1E5DCF920;
  void v3[4] = self;
  [(PXAVPlayerAudioSession *)self _performPlayerTransaction:v3];
}

uint64_t __45__PXAVPlayerAudioSession_performFinalCleanup__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeTimeObserver:*(void *)(*(void *)(a1 + 32) + 240)];
}

- (void)dealloc
{
  playerQueue_player = self->_playerQueue_player;
  objc_super v4 = NSStringFromSelector(sel_currentItem);
  [(AVQueuePlayer *)playerQueue_player removeObserver:self forKeyPath:v4];

  v5.receiver = self;
  v5.super_class = (Class)PXAVPlayerAudioSession;
  [(PXAVPlayerAudioSession *)&v5 dealloc];
}

- (PXAVPlayerAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v17.receiver = self;
  v17.super_class = (Class)PXAVPlayerAudioSession;
  $3CC8671D27C23BF42ADDB32F2B5E48AE location = *a5;
  if ([(PXAudioSession *)&v17 initWithAsset:v12 volume:&location startTime:v13 queue:v14 audioSessionDelegate:COERCE_DOUBLE(__PAIR64__(HIDWORD(location.var0), LODWORD(a4)))])
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_claimAutoreleasedReturnValue();
    px_dispatch_queue_create();
  }

  return 0;
}

uint64_t __84__PXAVPlayerAudioSession_initWithAsset_volume_startTime_queue_audioSessionDelegate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAudioSession:*(void *)(a1 + 32)];
}

void __84__PXAVPlayerAudioSession_initWithAsset_volume_startTime_queue_audioSessionDelegate___block_invoke_2(uint64_t a1, long long *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v4 = *a2;
  uint64_t v5 = *((void *)a2 + 2);
  [WeakRetained _handlePlayerTime:&v4];
}

+ (id)_audioSession
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PXAVPlayerAudioSession__audioSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_audioSession_onceToken != -1) {
    dispatch_once(&_audioSession_onceToken, block);
  }
  id v2 = (void *)_audioSession_session;
  return v2;
}

void __39__PXAVPlayerAudioSession__audioSession__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F153E0] auxiliarySession];
  long long v3 = (void *)_audioSession_session;
  _audioSession_session = v2;

  uint64_t v4 = *MEMORY[0x1E4F14F98];
  id v9 = 0;
  char v5 = [(id)_audioSession_session setCategory:v4 withOptions:1 error:&v9];
  id v6 = v9;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = PLStoryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Failed to initialize shared audio session category for %@. Error: %@", buf, 0x16u);
    }
  }
}

+ (OpaqueCMClock)sourceClock
{
  if (sourceClock_onceToken != -1) {
    dispatch_once(&sourceClock_onceToken, &__block_literal_global_275380);
  }
  return (OpaqueCMClock *)sourceClock_clock;
}

uint64_t __37__PXAVPlayerAudioSession_sourceClock__block_invoke()
{
  return CMAudioClockCreate(0, (CMClockRef *)&sourceClock_clock);
}

@end