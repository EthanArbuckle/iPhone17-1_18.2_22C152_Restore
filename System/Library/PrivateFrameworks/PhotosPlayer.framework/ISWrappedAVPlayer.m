@interface ISWrappedAVPlayer
+ (id)observedAVPlayerItemKeys;
+ (id)observedAVPlayerKeys;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentItemDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)itemForwardPlaybackEndTime;
- ($D31FB86CA7B02E89CA780FE277FE9EC8)loopTimeRange;
- (BOOL)_isOnIvarQueue;
- (BOOL)currentItemHasEnabledAudio;
- (BOOL)currentItemIsLikelyToKeepUp;
- (BOOL)currentItemPlaybackBufferEmpty;
- (BOOL)currentItemPlaybackBufferFull;
- (BOOL)isAudioEnabled;
- (BOOL)isLoopingEnabled;
- (BOOL)preventsSleepDuringVideoPlayback;
- (BOOL)suppressesAudioRendering;
- (ISWrappedAVPlayer)init;
- (ISWrappedAVPlayerDelegate)delegate;
- (float)rate;
- (float)volume;
- (id)_initWithAVPlayer:(id)a3;
- (id)_nextObserverUID;
- (id)_nilOrValue:(id)a3;
- (id)_playerQueue_avPlayer;
- (id)addBoundaryTimeObserverForTimes:(id)a3 queue:(id)a4 usingBlock:(id)a5;
- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5;
- (id)currentItem;
- (id)currentItemError;
- (id)currentItemVideoComposition;
- (id)error;
- (int64_t)currentItemStatus;
- (int64_t)status;
- (void)_avPlayerQueue_registerChangeObserver:(id)a3 context:(void *)a4;
- (void)_avPlayerQueue_unregisterChangeObserver:(id)a3 context:(void *)a4;
- (void)_performIvarRead:(id)a3;
- (void)_performIvarWrite:(id)a3;
- (void)_performPlayerTransaction:(id)a3;
- (void)_playerItemDidPlayToEnd:(id)a3;
- (void)_playerQueue_startObservingPlayerItem:(id)a3;
- (void)_playerQueue_stopObservingPlayerItem:(id)a3;
- (void)_playerQueue_updatePlayerItemAudioTracksEnabled;
- (void)attachToPlayerLayerIfNeeded:(id)a3;
- (void)becomeReusable;
- (void)cancelPendingPrerolls;
- (void)dealloc;
- (void)observeChangeforKVOProxyIdentifier:(id)a3 keyPath:(id)a4 change:(id)a5;
- (void)pause;
- (void)photosOnly_waitForPlayerTransactionsToFinish;
- (void)playToTime:(id *)a3 withInitialRate:(float)a4 overDuration:(double)a5 progressHandler:(id)a6;
- (void)prerollAtRate:(float)a3 completionHandler:(id)a4;
- (void)registerChangeObserver:(id)a3 context:(void *)a4;
- (void)removeTimeObserver:(id)a3;
- (void)replaceCurrentItemWithPlayerItem:(id)a3;
- (void)replaceCurrentItemWithPlayerItem:(id)a3 thenCall:(id)a4;
- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6;
- (void)setActionAtItemEnd:(int64_t)a3;
- (void)setAllowsExternalPlayback:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsAudioEnabled:(BOOL)a3;
- (void)setItemBlendsVideoFrames:(BOOL)a3;
- (void)setItemForwardEndPlaybackTime:(id *)a3;
- (void)setLoopTimeRange:(id *)a3;
- (void)setLoopingEnabled:(BOOL)a3;
- (void)setLoopingEnabled:(BOOL)a3 withTemplateItem:(id)a4;
- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3;
- (void)setRate:(float)a3;
- (void)setRate:(float)a3 time:(id *)a4 atHostTime:(id *)a5;
- (void)setSuppressesAudioRendering:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)setWrappedAudioSession:(id)a3;
- (void)unregisterChangeObserver:(id)a3 context:(void *)a4;
@end

@implementation ISWrappedAVPlayer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observersByID, 0);
  objc_storeStrong((id *)&self->_ivarQueue_itemVideoComposition, 0);
  objc_storeStrong((id *)&self->_ivarQueue_itemError, 0);
  objc_destroyWeak((id *)&self->_ivarQueue_error);
  objc_destroyWeak((id *)&self->_ivarQueue_currentItem);
  objc_storeStrong((id *)&self->_playerQueue_playerItemKVOIdentifier, 0);
  objc_storeStrong((id *)&self->_playerQueue_playerKVOIdentifier, 0);
  objc_storeStrong(&self->_playerQueue_playerItemDidPlayToEndObserver, 0);
  objc_storeStrong((id *)&self->_playerQueue_wrappedAudioSession, 0);
  objc_storeStrong((id *)&self->_playerQueue_avPlayer, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);

  objc_storeStrong((id *)&self->_avPlayerQueue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (ISWrappedAVPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ISWrappedAVPlayerDelegate *)WeakRetained;
}

- (void)becomeReusable
{
  [(ISWrappedAVPlayer *)self replaceCurrentItemWithPlayerItem:0];
  [(ISWrappedAVPlayer *)self setIsAudioEnabled:1];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v4[0] = *MEMORY[0x1E4F1FA20];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  [(ISWrappedAVPlayer *)self setLoopTimeRange:v4];
}

- (void)setWrappedAudioSession:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__ISWrappedAVPlayer_setWrappedAudioSession___block_invoke;
  v6[3] = &unk_1E6BECE40;
  id v7 = v4;
  id v5 = v4;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v6];
}

void __44__ISWrappedAVPlayer_setWrappedAudioSession___block_invoke(uint64_t a1, id *a2)
{
  objc_storeStrong(a2 + 15, *(id *)(a1 + 32));
  id v4 = a2;
  objc_msgSend(v4, "_playerQueue_avPlayer");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [*(id *)(a1 + 32) audioSession];
  [v6 setAudioSession:v5];
}

- (void)cancelPendingPrerolls
{
}

void __42__ISWrappedAVPlayer_cancelPendingPrerolls__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "_playerQueue_avPlayer");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v2 cancelPendingPrerolls];
  }
}

- (void)prerollAtRate:(float)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__ISWrappedAVPlayer_prerollAtRate_completionHandler___block_invoke;
  v8[3] = &unk_1E6BED218;
  float v10 = a3;
  id v9 = v6;
  id v7 = v6;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v8];
}

void __53__ISWrappedAVPlayer_prerollAtRate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_playerQueue_avPlayer");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = *(_DWORD *)(a1 + 40);
  [v4 prerollAtRate:*(void *)(a1 + 32) completionHandler:v3];
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__ISWrappedAVPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke;
  v12[3] = &unk_1E6BED1F0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a5;
  id v13 = v10;
  id v11 = v10;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v12];
}

void __81__ISWrappedAVPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  double v3 = objc_msgSend(a2, "_playerQueue_avPlayer");
  uint64_t v4 = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 104);
  [v3 seekToTime:&v9 toleranceBefore:&v7 toleranceAfter:&v5 completionHandler:v4];
}

- (void)replaceCurrentItemWithPlayerItem:(id)a3
{
}

- (void)replaceCurrentItemWithPlayerItem:(id)a3 thenCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__ISWrappedAVPlayer_replaceCurrentItemWithPlayerItem_thenCall___block_invoke;
  v10[3] = &unk_1E6BED1C8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v10];
}

void __63__ISWrappedAVPlayer_replaceCurrentItemWithPlayerItem_thenCall___block_invoke(uint64_t a1, void *a2)
{
  double v3 = a2;
  uint64_t v4 = [(dispatch_queue_t *)v3 _playerQueue_avPlayer];
  long long v5 = [v4 currentItem];

  id v6 = *(void **)(a1 + 32);
  if (v5 != v6)
  {
    [v6 setAllowedAudioSpatializationFormats:4];
    if ([(dispatch_queue_t *)v3 isLoopingEnabled])
    {
      if (v3)
      {
        [(dispatch_queue_t *)v3 loopTimeRange];
        if (BYTE12(v21))
        {
          [(dispatch_queue_t *)v3 loopTimeRange];
          if (v20)
          {
            [(dispatch_queue_t *)v3 loopTimeRange];
            if (!v19)
            {
              [(dispatch_queue_t *)v3 loopTimeRange];
              if ((v18 & 0x8000000000000000) == 0)
              {
                [(dispatch_queue_t *)v3 loopTimeRange];
                id v7 = *(void **)(a1 + 32);
                v17[0] = v17[3];
                v17[1] = v17[4];
                v17[2] = v17[5];
                [v7 setLoopTimeRange:v17];
                goto LABEL_14;
              }
            }
          }
        }
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v21 = 0u;
      }
      id v8 = [*(id *)(a1 + 32) asset];
      id v9 = v8;
      if (v8) {
        [v8 duration];
      }
      else {
        memset(&duration, 0, sizeof(duration));
      }
      CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      CMTimeRangeMake(&v16, &start, &duration);
      uint64_t v10 = *(void **)(a1 + 32);
      CMTimeRange v13 = v16;
      [v10 setLoopTimeRange:&v13];
    }
LABEL_14:
    [(dispatch_queue_t *)v3 _playerQueue_stopObservingPlayerItem:v5];
    id v11 = [(dispatch_queue_t *)v3 _playerQueue_avPlayer];
    [v11 replaceCurrentItemWithPlayerItem:*(void *)(a1 + 32)];
  }
  id v12 = *(void **)(a1 + 40);
  if (v12) {
    dispatch_async(v3[13], v12);
  }
}

- (void)pause
{
}

void __26__ISWrappedAVPlayer_pause__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_playerQueue_avPlayer");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 pause];
}

- (void)setRate:(float)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__ISWrappedAVPlayer_setRate___block_invoke;
  v3[3] = &__block_descriptor_36_e27_v16__0__ISWrappedAVPlayer_8l;
  float v4 = a3;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v3];
}

void __29__ISWrappedAVPlayer_setRate___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_playerQueue_avPlayer");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = *(_DWORD *)(a1 + 32);
  [v4 setRate:v3];
}

- (void)setVolume:(float)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__ISWrappedAVPlayer_setVolume___block_invoke;
  v3[3] = &__block_descriptor_36_e27_v16__0__ISWrappedAVPlayer_8l;
  float v4 = a3;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v3];
}

void __31__ISWrappedAVPlayer_setVolume___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_playerQueue_avPlayer");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = *(_DWORD *)(a1 + 32);
  [v4 setVolume:v3];
}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__ISWrappedAVPlayer_setAllowsExternalPlayback___block_invoke;
  v3[3] = &__block_descriptor_33_e27_v16__0__ISWrappedAVPlayer_8l;
  BOOL v4 = a3;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v3];
}

void __47__ISWrappedAVPlayer_setAllowsExternalPlayback___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_playerQueue_avPlayer");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setAllowsExternalPlayback:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setActionAtItemEnd:(int64_t)a3
{
  if (a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __40__ISWrappedAVPlayer_setActionAtItemEnd___block_invoke;
    _OWORD v4[3] = &__block_descriptor_40_e27_v16__0__ISWrappedAVPlayer_8l;
    v4[4] = a3;
    [(ISWrappedAVPlayer *)self _performPlayerTransaction:v4];
  }
  else
  {
    id v3 = ISGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DB21E000, v3, OS_LOG_TYPE_ERROR, "-[ISWrappedAVPlayer setActionAtItemEnd:] ignoring AVPlayerActionAtItemEndAdvance argument because the underlying player is not an AVQueuePlayer. This should not be necessary if you are setting loopingEnabled or loopTimeRange.", buf, 2u);
    }
  }
}

void __40__ISWrappedAVPlayer_setActionAtItemEnd___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_playerQueue_avPlayer");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setActionAtItemEnd:*(void *)(a1 + 32)];
}

- (void)playToTime:(id *)a3 withInitialRate:(float)a4 overDuration:(double)a5 progressHandler:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__ISWrappedAVPlayer_playToTime_withInitialRate_overDuration_progressHandler___block_invoke;
  v12[3] = &unk_1E6BED140;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a3;
  float v16 = a4;
  double v14 = a5;
  id v13 = v10;
  id v11 = v10;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v12];
}

void __77__ISWrappedAVPlayer_playToTime_withInitialRate_overDuration_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "_playerQueue_avPlayer");
  LODWORD(v4) = *(_DWORD *)(a1 + 72);
  double v5 = *(double *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 64);
  [v3 playToTime:&v7 withInitialRate:v6 overDuration:v4 progressHandler:v5];
}

- (void)setRate:(float)a3 time:(id *)a4 atHostTime:(id *)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__ISWrappedAVPlayer_setRate_time_atHostTime___block_invoke;
  v5[3] = &__block_descriptor_84_e27_v16__0__ISWrappedAVPlayer_8l;
  float v6 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a5;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v5];
}

void __45__ISWrappedAVPlayer_setRate_time_atHostTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "_playerQueue_avPlayer");
  LODWORD(v4) = *(_DWORD *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 36);
  uint64_t v8 = *(void *)(a1 + 52);
  long long v5 = *(_OWORD *)(a1 + 60);
  uint64_t v6 = *(void *)(a1 + 76);
  [v3 setRate:&v7 time:&v5 atHostTime:v4];
}

- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__ISWrappedAVPlayer_setPreventsSleepDuringVideoPlayback___block_invoke;
  v3[3] = &unk_1E6BED0B0;
  BOOL v4 = a3;
  void v3[4] = self;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v3];
}

void __57__ISWrappedAVPlayer_setPreventsSleepDuringVideoPlayback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_msgSend(v3, "_playerQueue_avPlayer");
  [v4 setPreventsDisplaySleepDuringVideoPlayback:*(unsigned __int8 *)(a1 + 40)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__ISWrappedAVPlayer_setPreventsSleepDuringVideoPlayback___block_invoke_2;
  v5[3] = &unk_1E6BED088;
  void v5[4] = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 40);
  [v3 _performIvarWrite:v5];
}

uint64_t __57__ISWrappedAVPlayer_setPreventsSleepDuringVideoPlayback___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 234) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setLoopTimeRange:(id *)a3
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  long long v5 = *(_OWORD *)&a3->var0.var3;
  long long v12 = *(_OWORD *)&a3->var0.var0;
  v11[2] = __38__ISWrappedAVPlayer_setLoopTimeRange___block_invoke;
  v11[3] = &unk_1E6BED0D8;
  v11[4] = self;
  long long v13 = v5;
  long long v14 = *(_OWORD *)&a3->var1.var1;
  [(ISWrappedAVPlayer *)self _performIvarWrite:v11];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__ISWrappedAVPlayer_setLoopTimeRange___block_invoke_2;
  v7[3] = &__block_descriptor_80_e27_v16__0__ISWrappedAVPlayer_8l;
  long long v6 = *(_OWORD *)&a3->var0.var3;
  long long v8 = *(_OWORD *)&a3->var0.var0;
  long long v9 = v6;
  long long v10 = *(_OWORD *)&a3->var1.var1;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v7];
}

__n128 __38__ISWrappedAVPlayer_setLoopTimeRange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 184;
  __n128 result = *(__n128 *)(a1 + 72);
  long long v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v1 + 16) = v3;
  *(__n128 *)(v1 + 32) = result;
  return result;
}

void __38__ISWrappedAVPlayer_setLoopTimeRange___block_invoke_2(_OWORD *a1, void *a2)
{
  long long v3 = [a2 currentItem];
  long long v4 = a1[3];
  v5[0] = a1[2];
  v5[1] = v4;
  v5[2] = a1[4];
  [v3 setLoopTimeRange:v5];
}

- (void)setLoopingEnabled:(BOOL)a3 withTemplateItem:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  [(ISWrappedAVPlayer *)self setLoopingEnabled:v4];
  id v6 = [(ISWrappedAVPlayer *)self currentItem];

  long long v7 = v8;
  if (v6 != v8)
  {
    [(ISWrappedAVPlayer *)self replaceCurrentItemWithPlayerItem:v8];
    long long v7 = v8;
  }
}

- (void)setLoopingEnabled:(BOOL)a3
{
  if ([(ISWrappedAVPlayer *)self isLoopingEnabled] != a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__ISWrappedAVPlayer_setLoopingEnabled___block_invoke;
    v7[3] = &unk_1E6BED088;
    void v7[4] = self;
    BOOL v8 = a3;
    [(ISWrappedAVPlayer *)self _performIvarWrite:v7];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__ISWrappedAVPlayer_setLoopingEnabled___block_invoke_2;
    _OWORD v5[3] = &__block_descriptor_33_e27_v16__0__ISWrappedAVPlayer_8l;
    BOOL v6 = a3;
    [(ISWrappedAVPlayer *)self _performPlayerTransaction:v5];
  }
}

uint64_t __39__ISWrappedAVPlayer_setLoopingEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 232) = *(unsigned char *)(result + 40);
  return result;
}

void __39__ISWrappedAVPlayer_setLoopingEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  long long v3 = objc_msgSend(a2, "_playerQueue_avPlayer");
  BOOL v4 = [v3 currentItem];

  if (*(unsigned char *)(a1 + 32))
  {
    long long v5 = [v4 asset];
    BOOL v6 = v5;
    if (v5) {
      [v5 duration];
    }
    else {
      memset(&duration, 0, sizeof(duration));
    }
    CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTimeRangeMake(&v11, &start, &duration);
    CMTimeRange v8 = v11;
    [v4 setLoopTimeRange:&v8];
  }
  else
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)&v11.start.value = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&v11.start.epoch = v7;
    *(_OWORD *)&v11.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    *(_OWORD *)&v8.start.value = *(_OWORD *)&v11.start.value;
    *(_OWORD *)&v8.start.epoch = v7;
    *(_OWORD *)&v8.duration.timescale = *(_OWORD *)&v11.duration.timescale;
    [v4 setLoopTimeRange:&v8];
  }
}

- (void)_playerQueue_updatePlayerItemAudioTracksEnabled
{
  BOOL v3 = [(ISWrappedAVPlayer *)self isAudioEnabled];
  id v6 = [(ISWrappedAVPlayer *)self currentItem];
  BOOL v4 = [v6 asset];
  long long v5 = [v4 mediaSelectionGroupForMediaCharacteristic:*MEMORY[0x1E4F15B00]];

  if (v5)
  {
    if (v3) {
      [v6 selectMediaOptionAutomaticallyInMediaSelectionGroup:v5];
    }
    else {
      [v6 selectMediaOption:0 inMediaSelectionGroup:v5];
    }
  }
  else
  {
    objc_msgSend(v6, "is_setAudioTracksEnabled:", v3);
  }
}

- (void)photosOnly_waitForPlayerTransactionsToFinish
{
  BOOL v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__ISWrappedAVPlayer_photosOnly_waitForPlayerTransactionsToFinish__block_invoke;
  _OWORD v5[3] = &unk_1E6BECE40;
  id v6 = v3;
  BOOL v4 = v3;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v5];
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

void __65__ISWrappedAVPlayer_photosOnly_waitForPlayerTransactionsToFinish__block_invoke(uint64_t a1)
{
}

- (void)setIsAudioEnabled:(BOOL)a3
{
  if ([(ISWrappedAVPlayer *)self isAudioEnabled] != a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__ISWrappedAVPlayer_setIsAudioEnabled___block_invoke;
    _OWORD v5[3] = &__block_descriptor_33_e27_v16__0__ISWrappedAVPlayer_8l;
    BOOL v6 = a3;
    [(ISWrappedAVPlayer *)self _performPlayerTransaction:v5];
  }
}

void __39__ISWrappedAVPlayer_setIsAudioEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  long long v7 = __39__ISWrappedAVPlayer_setIsAudioEnabled___block_invoke_2;
  CMTimeRange v8 = &unk_1E6BED088;
  id v9 = v3;
  char v10 = *(unsigned char *)(a1 + 32);
  id v4 = v3;
  [v4 _performIvarWrite:&v5];
  objc_msgSend(v4, "_playerQueue_updatePlayerItemAudioTracksEnabled", v5, v6, v7, v8);
}

uint64_t __39__ISWrappedAVPlayer_setIsAudioEnabled___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 233) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setSuppressesAudioRendering:(BOOL)a3
{
  if ([(ISWrappedAVPlayer *)self suppressesAudioRendering] != a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__ISWrappedAVPlayer_setSuppressesAudioRendering___block_invoke;
    _OWORD v5[3] = &unk_1E6BED0B0;
    void v5[4] = self;
    BOOL v6 = a3;
    [(ISWrappedAVPlayer *)self _performPlayerTransaction:v5];
  }
}

uint64_t __49__ISWrappedAVPlayer_setSuppressesAudioRendering___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  char v10 = __49__ISWrappedAVPlayer_setSuppressesAudioRendering___block_invoke_2;
  CMTimeRange v11 = &unk_1E6BED088;
  long long v12 = v3;
  LOBYTE(v13) = *(unsigned char *)(a1 + 40);
  id v4 = a2;
  [v3 _performIvarWrite:&v8];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  BOOL v6 = (void *)v4[14];

  return objc_msgSend(v6, "_setSuppressesAudioRendering:", v5, v8, v9, v10, v11, v12, v13);
}

uint64_t __49__ISWrappedAVPlayer_setSuppressesAudioRendering___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 235) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)suppressesAudioRendering
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__ISWrappedAVPlayer_suppressesAudioRendering__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __45__ISWrappedAVPlayer_suppressesAudioRendering__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 235);
  return result;
}

- (BOOL)preventsSleepDuringVideoPlayback
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__ISWrappedAVPlayer_preventsSleepDuringVideoPlayback__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __53__ISWrappedAVPlayer_preventsSleepDuringVideoPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 234);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)itemForwardPlaybackEndTime
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3810000000;
  uint64_t v9 = &unk_1DB2514EB;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__ISWrappedAVPlayer_itemForwardPlaybackEndTime__block_invoke;
  _OWORD v5[3] = &unk_1E6BED060;
  void v5[4] = self;
  void v5[5] = &v6;
  [(ISWrappedAVPlayer *)self _performIvarRead:v5];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v7 + 4);
  _Block_object_dispose(&v6, 8);
  return result;
}

__n128 __47__ISWrappedAVPlayer_itemForwardPlaybackEndTime__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  char v2 = (__n128 *)(*(void *)(a1 + 32) + 256);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 272);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  __n128 result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_playerQueue_avPlayer;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result currentTime];
  }
  return result;
}

- (BOOL)isAudioEnabled
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__ISWrappedAVPlayer_isAudioEnabled__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __35__ISWrappedAVPlayer_isAudioEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 233);
  return result;
}

- (float)volume
{
  uint64_t v5 = 0;
  uint64_t v6 = (float *)&v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__ISWrappedAVPlayer_volume__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  float v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

float __27__ISWrappedAVPlayer_volume__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 180);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (float)rate
{
  uint64_t v5 = 0;
  uint64_t v6 = (float *)&v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__ISWrappedAVPlayer_rate__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  float v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

float __25__ISWrappedAVPlayer_rate__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 176);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)currentItem
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__4016;
  uint64_t v11 = __Block_byref_object_dispose__4017;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__ISWrappedAVPlayer_currentItem__block_invoke;
  v6[3] = &unk_1E6BED060;
  void v6[4] = self;
  v6[5] = &v7;
  [(ISWrappedAVPlayer *)self _performIvarRead:v6];
  id v2 = (id)v8[5];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
    if (v2 == v3) {
      id v4 = 0;
    }
    else {
      id v4 = (void *)v8[5];
    }
    id v2 = v4;
  }
  _Block_object_dispose(&v7, 8);

  return v2;
}

uint64_t __32__ISWrappedAVPlayer_currentItem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 152));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  return MEMORY[0x1F41817F8](WeakRetained, v4);
}

- (id)error
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__4016;
  uint64_t v11 = __Block_byref_object_dispose__4017;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__ISWrappedAVPlayer_error__block_invoke;
  v6[3] = &unk_1E6BED060;
  void v6[4] = self;
  v6[5] = &v7;
  [(ISWrappedAVPlayer *)self _performIvarRead:v6];
  id v2 = (id)v8[5];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
    if (v2 == v3) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = (void *)v8[5];
    }
    id v2 = v4;
  }
  _Block_object_dispose(&v7, 8);

  return v2;
}

uint64_t __26__ISWrappedAVPlayer_error__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  return MEMORY[0x1F41817F8](WeakRetained, v4);
}

- (id)currentItemError
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  int v8 = __Block_byref_object_copy__4016;
  uint64_t v9 = __Block_byref_object_dispose__4017;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__ISWrappedAVPlayer_currentItemError__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __37__ISWrappedAVPlayer_currentItemError__block_invoke(uint64_t a1)
{
}

- (BOOL)currentItemHasEnabledAudio
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__ISWrappedAVPlayer_currentItemHasEnabledAudio__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __47__ISWrappedAVPlayer_currentItemHasEnabledAudio__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 322);
  return result;
}

- (id)currentItemVideoComposition
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__4016;
  uint64_t v9 = __Block_byref_object_dispose__4017;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__ISWrappedAVPlayer_currentItemVideoComposition__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __48__ISWrappedAVPlayer_currentItemVideoComposition__block_invoke(uint64_t a1)
{
}

- (BOOL)currentItemIsLikelyToKeepUp
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__ISWrappedAVPlayer_currentItemIsLikelyToKeepUp__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __48__ISWrappedAVPlayer_currentItemIsLikelyToKeepUp__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 320);
  return result;
}

- (BOOL)currentItemPlaybackBufferEmpty
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__ISWrappedAVPlayer_currentItemPlaybackBufferEmpty__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __51__ISWrappedAVPlayer_currentItemPlaybackBufferEmpty__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 321);
  return result;
}

- (BOOL)currentItemPlaybackBufferFull
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__ISWrappedAVPlayer_currentItemPlaybackBufferFull__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __50__ISWrappedAVPlayer_currentItemPlaybackBufferFull__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 304);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentItemDuration
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3810000000;
  uint64_t v9 = &unk_1DB2514EB;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__ISWrappedAVPlayer_currentItemDuration__block_invoke;
  _OWORD v5[3] = &unk_1E6BED060;
  void v5[4] = self;
  void v5[5] = &v6;
  [(ISWrappedAVPlayer *)self _performIvarRead:v5];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v7 + 4);
  _Block_object_dispose(&v6, 8);
  return result;
}

__n128 __40__ISWrappedAVPlayer_currentItemDuration__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  char v2 = (__n128 *)(*(void *)(a1 + 32) + 280);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 296);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (int64_t)currentItemStatus
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__ISWrappedAVPlayer_currentItemStatus__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__ISWrappedAVPlayer_currentItemStatus__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 240);
  return result;
}

- (int64_t)status
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__ISWrappedAVPlayer_status__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __27__ISWrappedAVPlayer_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 160);
  return result;
}

- ($D31FB86CA7B02E89CA780FE277FE9EC8)loopTimeRange
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x5010000000;
  uint64_t v11 = &unk_1DB2514EB;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__ISWrappedAVPlayer_loopTimeRange__block_invoke;
  v7[3] = &unk_1E6BED060;
  void v7[4] = self;
  void v7[5] = &v8;
  [(ISWrappedAVPlayer *)self _performIvarRead:v7];
  uint64_t v4 = v9;
  long long v5 = *((_OWORD *)v9 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v9 + 2);
  *(_OWORD *)&retstr->var0.var3 = v5;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v4 + 4);
  _Block_object_dispose(&v8, 8);
  return result;
}

__n128 __34__ISWrappedAVPlayer_loopTimeRange__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v3 = *(_OWORD *)(*(void *)(a1 + 32) + 200);
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 216);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(void *)(a1 + 32) + 184);
  *(_OWORD *)(v1 + 48) = v3;
  *(__n128 *)(v1 + 64) = result;
  return result;
}

- (BOOL)isLoopingEnabled
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__ISWrappedAVPlayer_isLoopingEnabled__block_invoke;
  _OWORD v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISWrappedAVPlayer *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __37__ISWrappedAVPlayer_isLoopingEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 232);
  return result;
}

- (void)observeChangeforKVOProxyIdentifier:(id)a3 keyPath:(id)a4 change:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a5 valueForKey:*MEMORY[0x1E4F284C8]];
  if ([v8 isEqualToString:self->_playerQueue_playerKVOIdentifier])
  {
    if ([v9 isEqualToString:@"rate"])
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke;
      v48[3] = &unk_1E6BECF98;
      v48[4] = self;
      id v49 = v10;
      [(ISObservable *)self performChanges:v48];
      uint64_t v11 = v49;
LABEL_37:

      goto LABEL_38;
    }
    if ([v9 isEqualToString:@"status"])
    {
      uint64_t v14 = [v10 integerValue];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_3;
      v47[3] = &unk_1E6BECFE8;
      v47[4] = self;
      v47[5] = v14;
      long long v13 = v47;
      goto LABEL_10;
    }
    if ([v9 isEqualToString:@"error"])
    {
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_5;
      v45[3] = &unk_1E6BECF98;
      v45[4] = self;
      id v46 = v10;
      [(ISObservable *)self performChanges:v45];
      uint64_t v11 = v46;
      goto LABEL_37;
    }
    if ([v9 isEqualToString:@"currentItem"])
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = [(ISWrappedAVPlayer *)self _nilOrValue:v10];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_7;
      v43[3] = &unk_1E6BECF48;
      v43[4] = self;
      id v16 = v15;
      id v44 = v16;
      v17 = (void (**)(void))MEMORY[0x1E018D1E0](v43);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_8;
      v41[3] = &unk_1E6BECF98;
      v41[4] = self;
      id v42 = v16;
      id v18 = v16;
      [(ISObservable *)self performChanges:v41];

      if (!v17) {
        goto LABEL_38;
      }
      goto LABEL_22;
    }
    if ([v9 isEqualToString:@"volume"])
    {
      [v10 floatValue];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_10;
      v39[3] = &unk_1E6BED010;
      v39[4] = self;
      int v40 = v19;
      [(ISWrappedAVPlayer *)self _performIvarWrite:v39];
    }
  }
  else if ([v8 isEqualToString:self->_playerQueue_playerItemKVOIdentifier])
  {
    if ([v9 isEqualToString:@"status"])
    {
      uint64_t v12 = [v10 integerValue];
      if ([(ISWrappedAVPlayer *)self currentItemStatus] != v12)
      {
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_11;
        v38[3] = &unk_1E6BECFE8;
        v38[4] = self;
        v38[5] = v12;
        long long v13 = v38;
LABEL_10:
        [(ISObservable *)self performChanges:v13];
      }
    }
    else
    {
      if ([v9 isEqualToString:@"error"])
      {
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_13;
        v36[3] = &unk_1E6BECF98;
        v36[4] = self;
        id v37 = v10;
        [(ISObservable *)self performChanges:v36];
        uint64_t v11 = v37;
        goto LABEL_37;
      }
      if ([v9 isEqualToString:@"forwardPlaybackEndTime"])
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_15;
        v34[3] = &unk_1E6BECF98;
        v34[4] = self;
        id v35 = v10;
        [(ISObservable *)self performChanges:v34];
        uint64_t v11 = v35;
        goto LABEL_37;
      }
      if ([v9 isEqualToString:@"tracks"])
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_17;
        v33[3] = &unk_1E6BED038;
        v33[4] = self;
        [(ISObservable *)self performChanges:v33];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_18;
        v32[3] = &unk_1E6BECD80;
        v32[4] = self;
        v17 = (void (**)(void))MEMORY[0x1E018D1E0](v32);
        if (!v17) {
          goto LABEL_38;
        }
LABEL_22:
        v17[2](v17);

        goto LABEL_38;
      }
      if ([v9 isEqualToString:@"playbackLikelyToKeepUp"])
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_19;
        v30[3] = &unk_1E6BECF98;
        v30[4] = self;
        id v31 = v10;
        [(ISObservable *)self performChanges:v30];
        uint64_t v11 = v31;
        goto LABEL_37;
      }
      if ([v9 isEqualToString:@"videoComposition"])
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_21;
        v28[3] = &unk_1E6BECF98;
        v28[4] = self;
        id v29 = v10;
        [(ISObservable *)self performChanges:v28];
        uint64_t v11 = v29;
        goto LABEL_37;
      }
      if ([v9 isEqualToString:@"playbackBufferFull"])
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_23;
        v26[3] = &unk_1E6BECF98;
        v26[4] = self;
        id v27 = v10;
        [(ISObservable *)self performChanges:v26];
        uint64_t v11 = v27;
        goto LABEL_37;
      }
      if ([v9 isEqualToString:@"duration"])
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_25;
        v24[3] = &unk_1E6BECF98;
        v24[4] = self;
        id v25 = v10;
        [(ISObservable *)self performChanges:v24];
        uint64_t v11 = v25;
        goto LABEL_37;
      }
      if ([v9 isEqualToString:@"playbackBufferEmpty"])
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_27;
        v22[3] = &unk_1E6BECF98;
        v22[4] = self;
        id v23 = v10;
        [(ISObservable *)self performChanges:v22];
        uint64_t v11 = v23;
        goto LABEL_37;
      }
      if ([v9 isEqualToString:@"hasEnabledAudio"])
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_29;
        v20[3] = &unk_1E6BECF98;
        v20[4] = self;
        id v21 = v10;
        [(ISObservable *)self performChanges:v20];
        uint64_t v11 = v21;
        goto LABEL_37;
      }
    }
  }
LABEL_38:
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_2;
  uint64_t v6 = &unk_1E6BECF48;
  uint64_t v7 = v2;
  id v8 = *(id *)(a1 + 40);
  [v2 _performIvarWrite:&v3];
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2, v3, v4, v5, v6, v7);
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_3(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_4;
  _OWORD v5[3] = &unk_1E6BECFC0;
  uint64_t v3 = *(void *)(a1 + 40);
  void v5[4] = v2;
  void v5[5] = v3;
  [v2 _performIvarWrite:v5];
  return [*(id *)(a1 + 32) signalChange:1];
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_5(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_6;
  uint64_t v6 = &unk_1E6BECF48;
  uint64_t v7 = v2;
  id v8 = *(id *)(a1 + 40);
  [v2 _performIvarWrite:&v3];
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 8, v3, v4, v5, v6, v7);
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playerQueue_startObservingPlayerItem:", *(void *)(a1 + 40));
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_8(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_9;
  uint64_t v6 = &unk_1E6BECF48;
  uint64_t v7 = v2;
  id v8 = *(id *)(a1 + 40);
  [v2 _performIvarWrite:&v3];
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 4, v3, v4, v5, v6, v7);
}

float __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_10(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 180) = result;
  return result;
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_11(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_12;
  _OWORD v5[3] = &unk_1E6BECFC0;
  uint64_t v3 = *(void *)(a1 + 40);
  void v5[4] = v2;
  void v5[5] = v3;
  [v2 _performIvarWrite:v5];
  return [*(id *)(a1 + 32) signalChange:16];
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_13(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_14;
  uint64_t v6 = &unk_1E6BECF48;
  uint64_t v7 = v2;
  id v8 = *(id *)(a1 + 40);
  [v2 _performIvarWrite:&v3];
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 8, v3, v4, v5, v6, v7);
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_15(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_16;
  uint64_t v6 = &unk_1E6BECF48;
  uint64_t v7 = v2;
  id v8 = *(id *)(a1 + 40);
  [v2 _performIvarWrite:&v3];
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2048, v3, v4, v5, v6, v7);
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:0x2000];
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playerQueue_updatePlayerItemAudioTracksEnabled");
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_19(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_20;
  uint64_t v6 = &unk_1E6BECF48;
  uint64_t v7 = v2;
  id v8 = *(id *)(a1 + 40);
  [v2 _performIvarWrite:&v3];
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 64, v3, v4, v5, v6, v7);
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_21(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_22;
  uint64_t v6 = &unk_1E6BECF48;
  uint64_t v7 = v2;
  id v8 = *(id *)(a1 + 40);
  [v2 _performIvarWrite:&v3];
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 4096, v3, v4, v5, v6, v7);
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_23(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_24;
  uint64_t v6 = &unk_1E6BECF48;
  uint64_t v7 = v2;
  id v8 = *(id *)(a1 + 40);
  [v2 _performIvarWrite:&v3];
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 128, v3, v4, v5, v6, v7);
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_25(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_26;
  uint64_t v6 = &unk_1E6BECF48;
  uint64_t v7 = v2;
  id v8 = *(id *)(a1 + 40);
  [v2 _performIvarWrite:&v3];
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 512, v3, v4, v5, v6, v7);
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_27(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_28;
  uint64_t v6 = &unk_1E6BECF48;
  uint64_t v7 = v2;
  id v8 = *(id *)(a1 + 40);
  [v2 _performIvarWrite:&v3];
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 256, v3, v4, v5, v6, v7);
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_29(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_30;
  uint64_t v6 = &unk_1E6BECF48;
  uint64_t v7 = v2;
  id v8 = *(id *)(a1 + 40);
  [v2 _performIvarWrite:&v3];
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 0x4000, v3, v4, v5, v6, v7);
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_30(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) BOOLValue];
  *(unsigned char *)(*(void *)(a1 + 32) + 322) = result;
  return result;
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_28(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) BOOLValue];
  *(unsigned char *)(*(void *)(a1 + 32) + 321) = result;
  return result;
}

__n128 __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_26(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    [v1 CMTimeValue];
  }
  else
  {
    __n128 v4 = 0uLL;
    uint64_t v5 = 0;
  }
  __n128 result = v4;
  *(void *)(v2 + 296) = v5;
  *(__n128 *)(v2 + 280) = v4;
  return result;
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_24(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) BOOLValue];
  *(unsigned char *)(*(void *)(a1 + 32) + 304) = result;
  return result;
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_22(uint64_t a1)
{
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_20(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) BOOLValue];
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = result;
  return result;
}

__n128 __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_16(uint64_t a1)
{
  uint64_t v2 = *(__n128 **)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    [v1 CMTimeValue];
  }
  else
  {
    __n128 v4 = 0uLL;
    unint64_t v5 = 0;
  }
  __n128 result = v4;
  v2[17].n128_u64[0] = v5;
  v2[16] = v4;
  return result;
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_14(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nilOrValue:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 248);
  *(void *)(v3 + 248) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_12(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 240) = *(void *)(result + 40);
  return result;
}

id __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_9(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 152), *(id *)(a1 + 40));
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _nilOrValue:*(void *)(a1 + 40)];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 168), v2);
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_4(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 160) = *(void *)(result + 40);
  return result;
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) floatValue];
  *(_DWORD *)(*(void *)(a1 + 32) + 176) = v3;
  return result;
}

- (id)_nilOrValue:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4F1CA98];
  id v4 = a3;
  id v5 = [v3 null];
  if (v5 == v4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (void)_playerItemDidPlayToEnd:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  uint64_t v6 = [(ISWrappedAVPlayer *)self delegate];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(AVPlayer *)self->_playerQueue_avPlayer currentItem];

    if (v8 == v5)
    {
      delegateQueue = self->_delegateQueue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __45__ISWrappedAVPlayer__playerItemDidPlayToEnd___block_invoke;
      v10[3] = &unk_1E6BECF48;
      void v10[4] = self;
      id v11 = v4;
      dispatch_async(delegateQueue, v10);
    }
  }
}

void __45__ISWrappedAVPlayer__playerItemDidPlayToEnd___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) object];
  [v4 avPlayer:v2 itemDidPlayToEnd:v3];
}

- (void)_playerQueue_stopObservingPlayerItem:(id)a3
{
  id v4 = +[ISKVOProxyManager sharedManager];
  [v4 removeProxyWithIdentifier:self->_playerQueue_playerItemKVOIdentifier];
}

- (void)_playerQueue_startObservingPlayerItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[ISKVOProxyManager sharedManager];
    [v5 removeProxyWithIdentifier:self->_playerQueue_playerItemKVOIdentifier];

    uint64_t v6 = +[ISKVOProxyManager sharedManager];
    avPlayerQueue = self->_avPlayerQueue;
    id v8 = [(id)objc_opt_class() observedAVPlayerItemKeys];
    id v9 = [v6 addProxyWithTarget:v4 queue:avPlayerQueue keyPaths:v8 delegate:self];
    playerQueue_playerItemKVOIdentifier = self->_playerQueue_playerItemKVOIdentifier;
    self->_playerQueue_playerItemKVOIdentifier = v9;
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__ISWrappedAVPlayer__playerQueue_startObservingPlayerItem___block_invoke;
    v11[3] = &unk_1E6BECD80;
    v11[4] = self;
    [(ISWrappedAVPlayer *)self _performIvarWrite:v11];
  }
}

__n128 __59__ISWrappedAVPlayer__playerQueue_startObservingPlayerItem___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 312);
  *(void *)(v2 + 312) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 248);
  *(void *)(v4 + 248) = 0;

  *(void *)(*(void *)(a1 + 32) + 240) = 0;
  uint64_t v6 = *(void *)(a1 + 32) + 280;
  id v7 = (__n128 *)MEMORY[0x1E4F1F9F8];
  *(void *)(v6 + 16) = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  __n128 result = *v7;
  *(__n128 *)uint64_t v6 = *v7;
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 304) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 321) = 0;
  return result;
}

- (void)removeTimeObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__ISWrappedAVPlayer_removeTimeObserver___block_invoke;
    v6[3] = &unk_1E6BECF70;
    id v7 = v4;
    id v8 = self;
    [(ISWrappedAVPlayer *)self _performPlayerTransaction:v6];
  }
}

void __40__ISWrappedAVPlayer_removeTimeObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v14 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4016;
  id v18 = __Block_byref_object_dispose__4017;
  id v19 = 0;
  id v5 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__ISWrappedAVPlayer_removeTimeObserver___block_invoke_62;
  v11[3] = &unk_1E6BECF20;
  long long v13 = &v14;
  v11[4] = v5;
  id v6 = v4;
  id v12 = v6;
  [v5 _performIvarRead:v11];
  if (v15[5])
  {
    id v7 = objc_msgSend(v3, "_playerQueue_avPlayer");
    [v7 removeTimeObserver:v15[5]];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__ISWrappedAVPlayer_removeTimeObserver___block_invoke_2;
    v8[3] = &unk_1E6BECF48;
    id v9 = v3;
    id v10 = v6;
    [v9 _performIvarWrite:v8];
  }
  _Block_object_dispose(&v14, 8);
}

uint64_t __40__ISWrappedAVPlayer_removeTimeObserver___block_invoke_62(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 328) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __40__ISWrappedAVPlayer_removeTimeObserver___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 328) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)addBoundaryTimeObserverForTimes:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ISWrappedAVPlayer *)self _nextObserverUID];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__ISWrappedAVPlayer_addBoundaryTimeObserverForTimes_queue_usingBlock___block_invoke;
  v19[3] = &unk_1E6BECEF8;
  id v20 = v8;
  id v21 = v9;
  id v23 = v10;
  id v12 = v11;
  id v22 = v12;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v19];
  uint64_t v16 = v22;
  id v17 = v12;

  return v17;
}

void __70__ISWrappedAVPlayer_addBoundaryTimeObserverForTimes_queue_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "_playerQueue_avPlayer");
  id v5 = [v4 addBoundaryTimeObserverForTimes:*(void *)(a1 + 32) queue:*(void *)(a1 + 40) usingBlock:*(void *)(a1 + 56)];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__ISWrappedAVPlayer_addBoundaryTimeObserverForTimes_queue_usingBlock___block_invoke_2;
  v8[3] = &unk_1E6BECEA8;
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v11 = v5;
  id v6 = v5;
  id v7 = v3;
  [v7 _performIvarWrite:v8];
}

uint64_t __70__ISWrappedAVPlayer_addBoundaryTimeObserverForTimes_queue_usingBlock___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 328) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ISWrappedAVPlayer *)self _nextObserverUID];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__ISWrappedAVPlayer_addPeriodicTimeObserverForInterval_queue_usingBlock___block_invoke;
  v17[3] = &unk_1E6BECED0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21 = *a3;
  id v18 = v8;
  id v20 = v9;
  id v11 = v10;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v17];
  id v14 = v19;
  id v15 = v11;

  return v15;
}

void __73__ISWrappedAVPlayer_addPeriodicTimeObserverForInterval_queue_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "_playerQueue_avPlayer");
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  long long v14 = *(_OWORD *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 72);
  id v7 = [v4 addPeriodicTimeObserverForInterval:&v14 queue:v5 usingBlock:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__ISWrappedAVPlayer_addPeriodicTimeObserverForInterval_queue_usingBlock___block_invoke_2;
  v10[3] = &unk_1E6BECEA8;
  id v11 = v3;
  id v12 = *(id *)(a1 + 40);
  id v13 = v7;
  id v8 = v7;
  id v9 = v3;
  [v9 _performIvarWrite:v10];
}

uint64_t __73__ISWrappedAVPlayer_addPeriodicTimeObserverForInterval_queue_usingBlock___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 328) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (id)_nextObserverUID
{
  uint64_t add = atomic_fetch_add(s_uniqueObserverID, 1u);
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"avPlayerWrapperObserverID-%d", add);
}

- (void)setItemBlendsVideoFrames:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__ISWrappedAVPlayer_setItemBlendsVideoFrames___block_invoke;
  v3[3] = &__block_descriptor_33_e27_v16__0__ISWrappedAVPlayer_8l;
  BOOL v4 = a3;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v3];
}

void __46__ISWrappedAVPlayer_setItemBlendsVideoFrames___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_playerQueue_avPlayer");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v4 currentItem];
  [v3 setBlendsVideoFrames:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setItemForwardEndPlaybackTime:(id *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__ISWrappedAVPlayer_setItemForwardEndPlaybackTime___block_invoke;
  v3[3] = &__block_descriptor_56_e27_v16__0__ISWrappedAVPlayer_8l;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v3];
}

void __51__ISWrappedAVPlayer_setItemForwardEndPlaybackTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "_playerQueue_avPlayer");
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = [v3 currentItem];
  long long v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  [v4 setForwardPlaybackEndTime:&v5];
}

- (void)attachToPlayerLayerIfNeeded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__ISWrappedAVPlayer_attachToPlayerLayerIfNeeded___block_invoke;
  v6[3] = &unk_1E6BECE40;
  id v7 = v4;
  id v5 = v4;
  [(ISWrappedAVPlayer *)self _performPlayerTransaction:v6];
}

void __49__ISWrappedAVPlayer_attachToPlayerLayerIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) player];
  id v4 = objc_msgSend(v7, "_playerQueue_avPlayer");

  if (v3 != v4)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = objc_msgSend(v7, "_playerQueue_avPlayer");
    [v5 setWrappedPlayer:v6];
  }
}

- (void)dealloc
{
  observersByID = self->_observersByID;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__ISWrappedAVPlayer_dealloc__block_invoke;
  v9[3] = &unk_1E6BECE18;
  v9[4] = self;
  [(NSMutableDictionary *)observersByID enumerateKeysAndObjectsUsingBlock:v9];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self->_playerQueue_playerItemDidPlayToEndObserver];

  id v5 = +[ISKVOProxyManager sharedManager];
  [v5 removeProxyWithIdentifier:self->_playerQueue_playerKVOIdentifier];

  uint64_t v6 = +[ISKVOProxyManager sharedManager];
  [v6 removeProxyWithIdentifier:self->_playerQueue_playerItemKVOIdentifier];

  id v7 = +[ISDeferredDealloc sharedInstance];
  [v7 _performDeferredDealloc:self->_playerQueue_avPlayer];

  v8.receiver = self;
  v8.super_class = (Class)ISWrappedAVPlayer;
  [(ISWrappedAVPlayer *)&v8 dealloc];
}

uint64_t __28__ISWrappedAVPlayer_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "removeTimeObserver:");
}

- (id)_playerQueue_avPlayer
{
  return self->_playerQueue_avPlayer;
}

- (ISWrappedAVPlayer)init
{
  if (init_onceToken != -1) {
    dispatch_once(&init_onceToken, &__block_literal_global_4059);
  }
  id v3 = [ISAVPlayer alloc];
  id v4 = [(ISAVPlayer *)v3 initWithDispatchQueue:init_avpq];
  id v5 = [(ISWrappedAVPlayer *)self _initWithAVPlayer:v4];

  return v5;
}

void __25__ISWrappedAVPlayer_init__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.photosplayer.wrappedAVPlayer.stateDispatch", v2);
  uint64_t v1 = (void *)init_avpq;
  init_avpq = (uint64_t)v0;
}

- (id)_initWithAVPlayer:(id)a3
{
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ISWrappedAVPlayer;
  uint64_t v6 = [(ISObservable *)&v34 init];
  id v7 = v6;
  if (v6)
  {
    v6[233] = 1;
    objc_super v8 = (_OWORD *)MEMORY[0x1E4F1FA20];
    *(_OWORD *)(v6 + 216) = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    long long v9 = v8[1];
    *(_OWORD *)(v6 + 184) = *v8;
    *(_OWORD *)(v6 + 200) = v9;
    v6[234] = [v5 preventsDisplaySleepDuringVideoPlayback];
    id v10 = NSNumber;
    atomic_fetch_add(_initWithAVPlayer__ivarQueueCounter, 1u);
    *((void *)v7 + 42) = objc_msgSend(v10, "numberWithInt:");
    uint64_t v11 = MEMORY[0x1E4F14428];
    objc_storeStrong((id *)v7 + 13, MEMORY[0x1E4F14428]);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.photosplayer.avplayerwrapper.ivars", MEMORY[0x1E4F14430]);
    id v13 = (void *)*((void *)v7 + 12);
    *((void *)v7 + 12) = v12;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v7 + 12), (const void *)QueueIdentifierContext_4064, *((void **)v7 + 42), 0);
    long long v14 = [v5 currentItem];

    if (v14)
    {
      uint64_t v15 = ISGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location) = 0;
        _os_log_error_impl(&dword_1DB21E000, v15, OS_LOG_TYPE_ERROR, "-[ISWrappedAVPlayer _initWithAVPlayer:] expected existing player to not have currentItem set", (uint8_t *)&location, 2u);
      }
    }
    objc_storeStrong((id *)v7 + 14, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [*((id *)v7 + 14) actualDispatchQueue];
      id v17 = (void *)*((void *)v7 + 11);
      *((void *)v7 + 11) = v16;
    }
    else
    {
      id v17 = (void *)*((void *)v7 + 11);
      *((void *)v7 + 11) = v11;
    }

    id v18 = *((void *)v7 + 11);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__ISWrappedAVPlayer__initWithAVPlayer___block_invoke;
    block[3] = &unk_1E6BECD80;
    id v19 = v7;
    id v33 = v19;
    dispatch_async(v18, block);
    objc_initWeak(&location, v19);
    objc_initWeak(&from, *((id *)v7 + 11));
    id v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v21 = *MEMORY[0x1E4F16020];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __39__ISWrappedAVPlayer__initWithAVPlayer___block_invoke_2;
    v27[3] = &unk_1E6BECDD0;
    objc_copyWeak(&v28, &from);
    objc_copyWeak(&v29, &location);
    uint64_t v22 = [v20 addObserverForName:v21 object:0 queue:0 usingBlock:v27];
    id v23 = (void *)v19[16];
    v19[16] = v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    id v25 = (void *)v19[41];
    v19[41] = v24;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v7;
}

uint64_t __39__ISWrappedAVPlayer__initWithAVPlayer___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[ISKVOProxyManager sharedManager];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 112);
  uint64_t v5 = *(void *)(v3 + 88);
  uint64_t v6 = [(id)objc_opt_class() observedAVPlayerKeys];
  uint64_t v7 = [v2 addProxyWithTarget:v4 queue:v5 keyPaths:v6 delegate:*(void *)(a1 + 32)];
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(void **)(v8 + 136);
  *(void *)(v8 + 136) = v7;

  id v10 = *(void **)(*(void *)(a1 + 32) + 112);

  return [v10 setAllowsExternalPlayback:0];
}

void __39__ISWrappedAVPlayer__initWithAVPlayer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__ISWrappedAVPlayer__initWithAVPlayer___block_invoke_3;
    _OWORD v5[3] = &unk_1E6BECDA8;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    id v6 = v3;
    dispatch_async(WeakRetained, v5);

    objc_destroyWeak(&v7);
  }
}

void __39__ISWrappedAVPlayer__initWithAVPlayer___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _playerItemDidPlayToEnd:*(void *)(a1 + 32)];
}

- (BOOL)_isOnIvarQueue
{
  return dispatch_get_specific((const void *)QueueIdentifierContext_4064) == self->_ivarQueueIdentifier;
}

- (void)_performIvarWrite:(id)a3
{
  ivarQueue = self->_ivarQueue;
  if (ivarQueue) {
    dispatch_barrier_sync(ivarQueue, a3);
  }
  else {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_performIvarRead:(id)a3
{
  id v4 = a3;
  dispatch_block_t block = v4;
  if (self->_ivarQueue && (v5 = [(ISWrappedAVPlayer *)self _isOnIvarQueue], id v4 = block, !v5)) {
    dispatch_sync((dispatch_queue_t)self->_ivarQueue, block);
  }
  else {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

- (void)_performPlayerTransaction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  avPlayerQueue = self->_avPlayerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ISWrappedAVPlayer__performPlayerTransaction___block_invoke;
  block[3] = &unk_1E6BECD58;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(avPlayerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __47__ISWrappedAVPlayer__performPlayerTransaction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v5;
  }

  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (void)_avPlayerQueue_unregisterChangeObserver:(id)a3 context:(void *)a4
{
  v4.receiver = self;
  v4.super_class = (Class)ISWrappedAVPlayer;
  [(ISObservable *)&v4 unregisterChangeObserver:a3 context:a4];
}

- (void)_avPlayerQueue_registerChangeObserver:(id)a3 context:(void *)a4
{
  v4.receiver = self;
  v4.super_class = (Class)ISWrappedAVPlayer;
  [(ISObservable *)&v4 registerChangeObserver:a3 context:a4];
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  avPlayerQueue = self->_avPlayerQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ISWrappedAVPlayer_unregisterChangeObserver_context___block_invoke;
  v9[3] = &unk_1E6BECD30;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = a4;
  id v8 = v6;
  dispatch_async(avPlayerQueue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __54__ISWrappedAVPlayer_unregisterChangeObserver_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_avPlayerQueue_unregisterChangeObserver:context:", *(void *)(a1 + 32), *(void *)(a1 + 48));
}

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  avPlayerQueue = self->_avPlayerQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ISWrappedAVPlayer_registerChangeObserver_context___block_invoke;
  v9[3] = &unk_1E6BECD30;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = a4;
  id v8 = v6;
  dispatch_async(avPlayerQueue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __52__ISWrappedAVPlayer_registerChangeObserver_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_avPlayerQueue_registerChangeObserver:context:", *(void *)(a1 + 32), *(void *)(a1 + 48));
}

+ (id)observedAVPlayerItemKeys
{
  return &unk_1F3554BD0;
}

+ (id)observedAVPlayerKeys
{
  return &unk_1F3554BB8;
}

@end