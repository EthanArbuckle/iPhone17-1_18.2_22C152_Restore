@interface NUAVPlayerController
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_effectiveTimeForTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentSeekTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- (AVAsset)videoAsset;
- (AVAudioMix)audioMix;
- (AVPlayer)player;
- (AVVideoComposition)videoComposition;
- (BOOL)currentlySeeking;
- (BOOL)isMuted;
- (BOOL)loopsVideo;
- (BOOL)prepareWithAVAsset:(id)a3 videoComposition:(id)a4 audioMix:(id)a5 loopsVideo:(BOOL)a6 seekToTime:(id *)a7;
- (NUAVPlayerController)init;
- (NUAVPlayerControllerDelegate)delegate;
- (double)updateInterval;
- (id)_loopingPlayerItemWithVideoAsset:(id)a3 videoComposition:(id)a4 audioMix:(id)a5;
- (id)_playerItemWithVideoAsset:(id)a3 videoComposition:(id)a4 audioMix:(id)a5;
- (id)_playerItemsWithVideoAsset:(id)a3 videoComposition:(id)a4 audioMix:(id)a5 loopsVideo:(BOOL)a6;
- (void)_addPlayerItemKVO:(id)a3;
- (void)_addPlayerKVO;
- (void)_addTimeObserver;
- (void)_notifyExternalPlaybackChange:(BOOL)a3;
- (void)_notifyPlaybackRateChange:(float)a3;
- (void)_notifyPlaybackTimeChange:(id *)a3;
- (void)_notifyPlayerStatusChange:(int64_t)a3;
- (void)_removePlayerItemKVO:(id)a3;
- (void)_removePlayerItemKVO:(id)a3 removeFromArray:(BOOL)a4;
- (void)_removePlayerKVO;
- (void)_removeTimeObserver;
- (void)_setRate:(float)a3;
- (void)addExternalPlaybackObserver:(id)a3 block:(id)a4;
- (void)addPlaybackRateObserver:(id)a3 block:(id)a4;
- (void)addPlaybackTimeObserver:(id)a3 block:(id)a4;
- (void)addPlayerStatusObserver:(id)a3 block:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)playerItemDidReachEnd:(id)a3;
- (void)playerItemFailedToPlayToEnd:(id)a3;
- (void)removeObserver:(id)a3;
- (void)seek:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5;
- (void)seek:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 forceSeek:(BOOL)a6;
- (void)seek:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 forceSeek:(BOOL)a6 completionHandler:(id)a7;
- (void)seekBack;
- (void)seekForward;
- (void)setDelegate:(id)a3;
- (void)setLoopsVideo:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setUpdateInterval:(double)a3;
- (void)step:(int64_t)a3;
- (void)updateAppliesPerFrameHDRDisplayMetadata:(BOOL)a3;
- (void)updateAudioMix:(id)a3;
- (void)updateVideoComposition:(id)a3;
- (void)updateWithVideoPrepareNodeFromVideoComposition:(id)a3;
@end

@implementation NUAVPlayerController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioMix, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerItemObservations, 0);
  objc_storeStrong((id *)&self->_observatory, 0);

  objc_storeStrong(&self->_playerTimeObserver, 0);
}

- (BOOL)isMuted
{
  return self->_muted;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (BOOL)loopsVideo
{
  return self->_loopsVideo;
}

- (void)setDelegate:(id)a3
{
}

- (NUAVPlayerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NUAVPlayerControllerDelegate *)WeakRetained;
}

- (AVAudioMix)audioMix
{
  return self->_audioMix;
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setPlayer:(id)a3
{
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)_addPlayerItemKVO:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_playerItemObservations;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      objc_msgSend(v10, "playerItem", (void)v15);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v10;

    if (v12) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  id v12 = (id)objc_opt_new();
  [v12 setPlayerItem:v4];
  [(NSMutableArray *)self->_playerItemObservations addObject:v12];
LABEL_12:
  if ((objc_msgSend(v12, "registeredKVO", (void)v15) & 1) == 0)
  {
    [v4 addObserver:self forKeyPath:@"status" options:3 context:kPlayerItemStatusCtx];
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:self selector:sel_playerItemDidReachEnd_ name:*MEMORY[0x263EFA050] object:v4];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:self selector:sel_playerItemFailedToPlayToEnd_ name:*MEMORY[0x263EFA060] object:v4];

    [v12 setRegisteredKVO:1];
  }
}

- (void)_removePlayerItemKVO:(id)a3 removeFromArray:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = self->_playerItemObservations;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "playerItem", (void)v17);
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v6)
        {
          id v14 = v12;

          if (v14)
          {
            if ([v14 registeredKVO])
            {
              [v6 removeObserver:self forKeyPath:@"status" context:kPlayerItemStatusCtx];
              [v14 setRegisteredKVO:0];
              long long v15 = [MEMORY[0x263F08A00] defaultCenter];
              [v15 removeObserver:self name:*MEMORY[0x263EFA050] object:v6];

              long long v16 = [MEMORY[0x263F08A00] defaultCenter];
              [v16 removeObserver:self name:*MEMORY[0x263EFA060] object:v6];

              if (v4) {
                [(NSMutableArray *)self->_playerItemObservations removeObject:v14];
              }
            }
          }
          goto LABEL_14;
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = 0;
LABEL_14:
}

- (void)_removePlayerItemKVO:(id)a3
{
}

- (void)_addPlayerKVO
{
  if (!self->_playerControllerKVOFlags.registeredPlayer)
  {
    v3 = [(NUAVPlayerController *)self player];
    [v3 addObserver:self forKeyPath:@"rate" options:3 context:kPlayerRateCtx];

    BOOL v4 = [(NUAVPlayerController *)self player];
    [v4 addObserver:self forKeyPath:@"status" options:3 context:kPlayerStatusCtx];

    v5 = [(NUAVPlayerController *)self player];
    [v5 addObserver:self forKeyPath:@"currentItem" options:3 context:kPlayerCurrentItemCtx];

    id v6 = [(NUAVPlayerController *)self player];
    [v6 addObserver:self forKeyPath:@"externalPlaybackActive" options:3 context:kExternalPlaybackCtx];

    self->_playerControllerKVOFlags.registeredPlayer = 1;
  }
}

- (void)_removePlayerKVO
{
  if (self->_playerControllerKVOFlags.registeredPlayer)
  {
    v3 = [(NUAVPlayerController *)self player];
    [v3 removeObserver:self forKeyPath:@"rate" context:kPlayerRateCtx];

    BOOL v4 = [(NUAVPlayerController *)self player];
    [v4 removeObserver:self forKeyPath:@"status" context:kPlayerStatusCtx];

    v5 = [(NUAVPlayerController *)self player];
    [v5 removeObserver:self forKeyPath:@"currentItem" context:kPlayerCurrentItemCtx];

    id v6 = [(NUAVPlayerController *)self player];
    [v6 removeObserver:self forKeyPath:@"externalPlaybackActive" context:kExternalPlaybackCtx];

    self->_playerControllerKVOFlags.registeredPlayer = 0;
  }
}

- (void)_setRate:(float)a3
{
  id v5 = [(NUAVPlayerController *)self player];
  [v5 rate];
  if (*(float *)&v4 != a3)
  {
    *(float *)&double v4 = a3;
    [v5 setRate:v4];
  }
}

- (void)playerItemFailedToPlayToEnd:(id)a3
{
  double v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:*MEMORY[0x263EFA058]];

  id v5 = [(NUAVPlayerController *)self delegate];
  [v5 playerControllerFailedToPlayToEnd:self error:v6];
}

- (void)playerItemDidReachEnd:(id)a3
{
  double v4 = [(NUAVPlayerController *)self player];
  id v5 = [v4 currentItem];
  id v6 = v5;
  if (v5) {
    [v5 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  uint64_t v8 = [(NUAVPlayerController *)self delegate];
  [v8 playerControllerDidFinishPlaying:self duration:Seconds];
}

- (void)_removeTimeObserver
{
  if (self->_playerTimeObserver)
  {
    v3 = [(NUAVPlayerController *)self player];
    [v3 removeTimeObserver:self->_playerTimeObserver];

    id playerTimeObserver = self->_playerTimeObserver;
    self->_id playerTimeObserver = 0;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  id v5 = [(NUAVPlayerController *)self player];
  id v6 = v5;
  if (!v5)
  {
    uint64_t v8 = MEMORY[0x263F01090];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x263F01090];
    int64_t v7 = *(void *)(v8 + 16);
    goto LABEL_5;
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  [v5 currentTime];
  if (retstr->var2)
  {
    long long v10 = *(_OWORD *)&retstr->var0;
    int64_t var3 = retstr->var3;
    [(NUAVPlayerController *)self _effectiveTimeForTime:&v10];
    *(_OWORD *)&retstr->var0 = v12;
    int64_t v7 = v13;
LABEL_5:
    retstr->int64_t var3 = v7;
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_effectiveTimeForTime:(SEL)a3
{
  *retstr = *a4;
  return self;
}

- (void)_addTimeObserver
{
  if (!self->_playerTimeObserver)
  {
    double v4 = [(NUAVPlayerController *)self player];

    if (!v4)
    {
      uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"NUAVPlayerController.m" lineNumber:599 description:@"We should have an AVPlayer object here"];
    }
    id v5 = [(NUAVPlayerController *)self player];
    objc_initWeak(&location, v5);

    objc_copyWeak(&to, (id *)&self->_delegate);
    objc_initWeak(&from, self);
    id v6 = objc_loadWeakRetained(&location);
    CMTimeMakeWithSeconds(&v13, self->_updateInterval, 1000000000);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __40__NUAVPlayerController__addTimeObserver__block_invoke;
    v10[3] = &unk_2642C2DC0;
    objc_copyWeak(&v11, &from);
    objc_copyWeak(&v12, &to);
    int64_t v7 = [v6 addPeriodicTimeObserverForInterval:&v13 queue:0 usingBlock:v10];

    id playerTimeObserver = self->_playerTimeObserver;
    self->_id playerTimeObserver = v7;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&to);
    objc_destroyWeak(&location);
  }
}

void __40__NUAVPlayerController__addTimeObserver__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 12))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      memset(&v11, 0, sizeof(v11));
      id v6 = [WeakRetained videoAsset];
      int64_t v7 = v6;
      if (v6) {
        [v6 duration];
      }
      else {
        memset(&v11, 0, sizeof(v11));
      }

      memset(&v10[32], 0, 24);
      *(CMTime *)long long v10 = *(CMTime *)a2;
      [v5 _effectiveTimeForTime:v10];
      id v8 = objc_loadWeakRetained((id *)(a1 + 40));
      *(CMTime *)long long v10 = *(CMTime *)&v10[32];
      double Seconds = CMTimeGetSeconds((CMTime *)v10);
      *(CMTime *)long long v10 = v11;
      [v8 playerController:v5 didUpdateElapsedTime:Seconds duration:CMTimeGetSeconds((CMTime *)v10)];

      *(CMTime *)long long v10 = *(CMTime *)&v10[32];
      [v5 _notifyPlaybackTimeChange:v10];
    }
  }
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyExternalPlaybackChange:(BOOL)a3
{
  observatory = self->_observatory;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__NUAVPlayerController__notifyExternalPlaybackChange___block_invoke;
  v4[3] = &__block_descriptor_33_e14_v16__0___v___8l;
  BOOL v5 = a3;
  [(NUObservatory *)observatory notifyAllObserversForKey:3 withBlock:v4];
}

uint64_t __54__NUAVPlayerController__notifyExternalPlaybackChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(unsigned __int8 *)(a1 + 32));
}

- (void)addExternalPlaybackObserver:(id)a3 block:(id)a4
{
}

- (void)_notifyPlayerStatusChange:(int64_t)a3
{
  observatory = self->_observatory;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__NUAVPlayerController__notifyPlayerStatusChange___block_invoke;
  v4[3] = &__block_descriptor_40_e14_v16__0___v___8l;
  void v4[4] = a3;
  [(NUObservatory *)observatory notifyAllObserversForKey:2 withBlock:v4];
}

uint64_t __50__NUAVPlayerController__notifyPlayerStatusChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (void)addPlayerStatusObserver:(id)a3 block:(id)a4
{
}

- (void)_notifyPlaybackTimeChange:(id *)a3
{
  observatory = self->_observatory;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__NUAVPlayerController__notifyPlaybackTimeChange___block_invoke;
  v4[3] = &__block_descriptor_56_e14_v16__0___v___8l;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(NUObservatory *)observatory notifyAllObserversForKey:1 withBlock:v4];
}

uint64_t __50__NUAVPlayerController__notifyPlaybackTimeChange___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(uint64_t (**)(uint64_t, long long *))(a2 + 16);
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  return v2(a2, &v4);
}

- (void)addPlaybackTimeObserver:(id)a3 block:(id)a4
{
}

- (void)_notifyPlaybackRateChange:(float)a3
{
  observatory = self->_observatory;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__NUAVPlayerController__notifyPlaybackRateChange___block_invoke;
  v4[3] = &__block_descriptor_36_e14_v16__0___v___8l;
  float v5 = a3;
  [(NUObservatory *)observatory notifyAllObserversForKey:0 withBlock:v4];
}

uint64_t __50__NUAVPlayerController__notifyPlaybackRateChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, float))(a2 + 16))(a2, *(float *)(a1 + 32));
}

- (void)addPlaybackRateObserver:(id)a3 block:(id)a4
{
}

- (void)step:(int64_t)a3
{
  id v6 = [(NUAVPlayerController *)self player];
  long long v4 = [v6 currentItem];
  float v5 = v4;
  if (v4) {
    [v4 stepByCount:a3];
  }
}

- (void)seek:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 forceSeek:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v12 = a7;
  CMTime v13 = [(NUAVPlayerController *)self player];
  id v14 = [v13 currentItem];
  if (v14 && (![(NUAVPlayerController *)self currentlySeeking] || v7))
  {
    memset(&v30, 0, sizeof(v30));
    videoAsset = self->_videoAsset;
    if (videoAsset) {
      [(AVAsset *)videoAsset duration];
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v29 = *a3;
    CMTime time1 = (CMTime)*a3;
    CMTime time2 = v30;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      CMTime time1 = (CMTime)*a3;
      long long v23 = *MEMORY[0x263F010E0];
      *(_OWORD *)&time2.value = *MEMORY[0x263F010E0];
      CMTimeEpoch v16 = *(void *)(MEMORY[0x263F010E0] + 16);
      time2.epoch = v16;
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        *(_OWORD *)&v29.var0 = v23;
        v29.int64_t var3 = v16;
      }
    }
    else
    {
      [v14 duration];
    }
    self->_currentSeekTime = ($95D729B680665BEAEFA1D6FCA8238556)v29;
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
    }
    long long v17 = (void *)*MEMORY[0x263F58700];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
    {
      CMTime time1 = (CMTime)*a3;
      long long v18 = v17;
      Float64 Seconds = CMTimeGetSeconds(&time1);
      CMTime time1 = (CMTime)*a4;
      Float64 v20 = CMTimeGetSeconds(&time1);
      CMTime time1 = (CMTime)*a5;
      double v21 = CMTimeGetSeconds(&time1);
      LODWORD(time1.value) = 134219010;
      uint64_t v22 = @"NO";
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)self;
      LOWORD(time1.flags) = 2048;
      if (v7) {
        uint64_t v22 = @"YES";
      }
      *(Float64 *)((char *)&time1.flags + 2) = Seconds;
      HIWORD(time1.epoch) = 2048;
      Float64 v32 = v20;
      __int16 v33 = 2048;
      double v34 = v21;
      __int16 v35 = 2112;
      v36 = v22;
      _os_log_debug_impl(&dword_217C0A000, v18, OS_LOG_TYPE_DEBUG, "<%p> seekToTime:%f toleranceBefore:%f toleranceAfter:%f forceSeek:%@", (uint8_t *)&time1, 0x34u);
    }
    objc_msgSend(v14, "cancelPendingSeeks", v23);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __88__NUAVPlayerController_seek_toleranceBefore_toleranceAfter_forceSeek_completionHandler___block_invoke;
    v26[3] = &unk_2642C2D18;
    v26[4] = self;
    id v27 = v12;
    CMTime time1 = (CMTime)v29;
    CMTime time2 = (CMTime)*a4;
    long long v24 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    [v14 seekToTime:&time1 toleranceBefore:&time2 toleranceAfter:&v24 completionHandler:v26];
  }
}

uint64_t __88__NUAVPlayerController_seek_toleranceBefore_toleranceAfter_forceSeek_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = MEMORY[0x263F01090];
    *(_OWORD *)(v2 + 96) = *MEMORY[0x263F01090];
    *(void *)(v2 + 112) = *(void *)(v3 + 16);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)seek:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 forceSeek:(BOOL)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a5;
  [(NUAVPlayerController *)self seek:&v8 toleranceBefore:&v7 toleranceAfter:&v6 forceSeek:a6 completionHandler:0];
}

- (void)seek:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  [(NUAVPlayerController *)self seek:&v7 toleranceBefore:&v6 toleranceAfter:&v5 forceSeek:0];
}

- (void)seekBack
{
  uint64_t v3 = [(NUAVPlayerController *)self player];
  long long v4 = [v3 currentItem];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = v4;
  if (v4)
  {
    memset(&v13, 0, sizeof(v13));
    [v4 currentTime];
    memset(&v12, 0, sizeof(v12));
    CMTimeMake(&v12, 10, 1);
    memset(&v11, 0, sizeof(v11));
    CMTime lhs = v13;
    CMTime rhs = v12;
    CMTimeSubtract(&v11, &lhs, &rhs);
    CMTime lhs = v11;
    long long v8 = *MEMORY[0x263F010E0];
    *(_OWORD *)&rhs.value = *MEMORY[0x263F010E0];
    CMTimeEpoch v6 = *(void *)(MEMORY[0x263F010E0] + 16);
    rhs.epoch = v6;
    if (CMTimeCompare(&lhs, &rhs) == -1)
    {
      *(_OWORD *)&v11.value = v8;
      v11.epoch = v6;
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [(NUAVPlayerController *)self player];
    CMTime lhs = v11;
    [v7 seekToTime:&lhs];
  }
}

- (void)seekForward
{
  uint64_t v3 = [(NUAVPlayerController *)self player];
  long long v4 = [v3 currentItem];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = v4;
  if (v4)
  {
    memset(&v12[1], 0, sizeof(CMTime));
    [v4 duration];
    memset(v12, 0, 24);
    [v5 currentTime];
    memset(&v11, 0, sizeof(v11));
    CMTimeMake(&v11, 30, 1);
    memset(&v10, 0, sizeof(v10));
    CMTime lhs = v12[0];
    CMTime rhs = v11;
    CMTimeAdd(&v10, &lhs, &rhs);
    CMTime lhs = v10;
    CMTime rhs = v12[1];
    if (CMTimeCompare(&lhs, &rhs) >= 1)
    {
      CMTimeMake(&v7, 10, 1);
      CMTime rhs = v12[1];
      CMTimeSubtract(&lhs, &rhs, &v7);
      CMTime v10 = lhs;
    }
    CMTimeEpoch v6 = [(NUAVPlayerController *)self player];
    CMTime lhs = v10;
    [v6 seekToTime:&lhs];
  }
}

- (BOOL)currentlySeeking
{
  [(NUAVPlayerController *)self currentSeekTime];
  return v3 & 1;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (void)setLoopsVideo:(BOOL)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (self->_loopsVideo != a3)
  {
    BOOL v3 = a3;
    if (self->_videoAsset)
    {
      [(NUAVPlayerController *)self _removePlayerKVO];
      $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [(NUAVPlayerController *)self _playerItemsWithVideoAsset:self->_videoAsset videoComposition:self->_videoComposition audioMix:self->_audioMix loopsVideo:v3];
      CMTimeEpoch v6 = [(NUAVPlayerController *)self player];
      [v6 rate];
      int v8 = v7;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v9 = [v6 items];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            [(NUAVPlayerController *)self _removePlayerItemKVO:*(void *)(*((void *)&v24 + 1) + 8 * v13++)];
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v11);
      }

      [v6 removeAllItems];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v14 = v5;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v21;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v21 != v17) {
              objc_enumerationMutation(v14);
            }
            objc_msgSend(v6, "insertItem:afterItem:", *(void *)(*((void *)&v20 + 1) + 8 * v18++), 0, (void)v20);
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
        }
        while (v16);
      }

      [(AVPlayer *)self->_player setActionAtItemEnd:v3 ^ 1];
      LODWORD(v19) = v8;
      [v6 setRate:v19];
      [(NUAVPlayerController *)self _addPlayerKVO];
    }
    self->_loopsVideo = v3;
  }
}

- (void)play
{
  LODWORD(v2) = 1.0;
  [(NUAVPlayerController *)self _setRate:v2];
}

- (void)pause
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if ((void *)kPlayerItemStatusCtx == a6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v11;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;
    uint64_t v16 = [v13 objectForKey:*MEMORY[0x263F081B8]];
    uint64_t v17 = [v16 integerValue];

    if (v17 == 2)
    {
      if (*MEMORY[0x263F586F0] != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
      }
      __int16 v33 = (void *)*MEMORY[0x263F58700];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_48;
      }
      double v34 = v33;
      __int16 v35 = [v15 error];
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v35;
      _os_log_debug_impl(&dword_217C0A000, v34, OS_LOG_TYPE_DEBUG, "<%p> AVPlayerStatusFailed with error %@", buf, 0x16u);
    }
    else
    {
      if (v17 != 1)
      {
        if (!v17)
        {
          if (*MEMORY[0x263F586F0] != -1) {
            dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
          }
          uint64_t v18 = *MEMORY[0x263F58700];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = self;
            _os_log_debug_impl(&dword_217C0A000, v18, OS_LOG_TYPE_DEBUG, "<%p> AVPlayerStatusUnknown", buf, 0xCu);
          }
        }
        goto LABEL_48;
      }
      if (*MEMORY[0x263F586F0] != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
      }
      v36 = *MEMORY[0x263F58700];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = self;
        _os_log_debug_impl(&dword_217C0A000, v36, OS_LOG_TYPE_DEBUG, "<%p> AVPlayerStatusReadyToPlay", buf, 0xCu);
      }
      uint64_t v37 = [(NUAVPlayerController *)self player];
      v38 = [v37 currentItem];
      int v39 = [v38 isEqual:v11];

      if (!v39) {
        goto LABEL_48;
      }
      double v34 = [(NUAVPlayerController *)self delegate];
      [v34 playerControllerIsReadyForPlayback:self];
    }

LABEL_48:
    goto LABEL_49;
  }
  if ((void *)kPlayerRateCtx == a6)
  {
    double v19 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    [v19 floatValue];
    float v21 = v20;

    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
    }
    long long v22 = *MEMORY[0x263F58700];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v21;
      _os_log_debug_impl(&dword_217C0A000, v22, OS_LOG_TYPE_DEBUG, "<%p> rate %g", buf, 0x16u);
    }
    *(float *)&double v23 = v21;
    [(NUAVPlayerController *)self _notifyPlaybackRateChange:v23];
    long long v24 = [(NUAVPlayerController *)self player];
    long long v25 = [v24 currentItem];
    long long v26 = [v25 videoComposition];
    long long v27 = [v26 instructions];
    v28 = [v27 firstObject];

    if (v28)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(float *)&double v29 = v21;
        [v28 setPlaybackRate:v29];
      }
    }
  }
  else if ((void *)kPlayerStatusCtx == a6)
  {
    uint64_t v30 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    uint64_t v31 = [v30 integerValue];

    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
    }
    Float64 v32 = *MEMORY[0x263F58700];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v31;
      _os_log_debug_impl(&dword_217C0A000, v32, OS_LOG_TYPE_DEBUG, "<%p> status %d", buf, 0x12u);
    }
    [(NUAVPlayerController *)self _notifyPlayerStatusChange:v31];
  }
  else
  {
    if ((void *)kPlayerCurrentItemCtx != a6)
    {
      if ((void *)kExternalPlaybackCtx == a6)
      {
        v42 = [v12 objectForKey:*MEMORY[0x263F081B8]];
        uint64_t v43 = [v42 BOOLValue];

        if (*MEMORY[0x263F586F0] != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
        }
        v44 = *MEMORY[0x263F58700];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v43;
          _os_log_debug_impl(&dword_217C0A000, v44, OS_LOG_TYPE_DEBUG, "<%p> external playback active %d", buf, 0x12u);
        }
        [(NUAVPlayerController *)self _notifyExternalPlaybackChange:v43];
      }
      else
      {
        v45.receiver = self;
        v45.super_class = (Class)NUAVPlayerController;
        [(NUAVPlayerController *)&v45 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
      }
      goto LABEL_49;
    }
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
    }
    v40 = *MEMORY[0x263F58700];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = self;
      _os_log_debug_impl(&dword_217C0A000, v40, OS_LOG_TYPE_DEBUG, "<%p> kPlayerCurrentItemCtx", buf, 0xCu);
    }
    if (self->_loopsVideo)
    {
      id v15 = [v13 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      if (v15)
      {
        [(NUAVPlayerController *)self _removePlayerKVO];
        *(_OWORD *)buf = *MEMORY[0x263F010E0];
        *(void *)&buf[16] = *(void *)(MEMORY[0x263F010E0] + 16);
        [v15 seekToTime:buf completionHandler:&__block_literal_global];
        v41 = [(NUAVPlayerController *)self player];
        [v41 insertItem:v15 afterItem:0];

        [(NUAVPlayerController *)self _addPlayerKVO];
      }
      goto LABEL_48;
    }
  }
LABEL_49:
}

- (void)updateAppliesPerFrameHDRDisplayMetadata:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  self->_appliesPerFrameHDRDisplayMetadata = a3;
  AlwaysApplyPerFrameHDRDisplayMetadata();
  self->_appliesPerFrameHDRDisplayMetadata = 1;
  long long v4 = [(NUAVPlayerController *)self player];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = objc_msgSend(v4, "items", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) setAppliesPerFrameHDRDisplayMetadata:self->_appliesPerFrameHDRDisplayMetadata];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v7);
  }

  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
  }
  id v10 = (void *)*MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    id v12 = [v4 items];
    uint64_t v13 = [v12 count];
    id v14 = @"view with dolby metadata";
    if (!self->_appliesPerFrameHDRDisplayMetadata) {
      id v14 = @"view ignoring dolby metadata";
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    long long v22 = v14;
    _os_log_impl(&dword_217C0A000, v11, OS_LOG_TYPE_DEFAULT, "Updated %lu items to %@", buf, 0x16u);
  }
}

- (void)updateAudioMix:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = (AVAudioMix *)a3;
  if (self->_audioMix != v5)
  {
    objc_storeStrong((id *)&self->_audioMix, a3);
    BOOL v6 = [(NUAVPlayerController *)self loopsVideo];
    if (v5 && v6)
    {
      id v19 = 0;
      uint64_t v7 = [MEMORY[0x263F586C0] repeatAudio:v5 count:10 error:&v19];
      id v8 = v19;
      if (!v7)
      {
        if (*MEMORY[0x263F586F0] != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
        }
        id v14 = *MEMORY[0x263F58700];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v8;
          _os_log_error_impl(&dword_217C0A000, v14, OS_LOG_TYPE_ERROR, "Failed to loop audio mix, error: %@", buf, 0xCu);
        }
        goto LABEL_14;
      }

      $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = (AVAudioMix *)v7;
    }
    id v8 = [(NUAVPlayerController *)self player];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = objc_msgSend(v8, "items", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) setAudioMix:v5];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v11);
    }

LABEL_14:
  }
}

- (void)updateWithVideoPrepareNodeFromVideoComposition:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v4 = [a3 instructions];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [v4 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NUAVPlayerController *)self player];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v18 = v28 = 0u;
    id obj = [v18 items];
    uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v20 = *(void *)v26;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * v8);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v10 = [v9 videoComposition];
          uint64_t v11 = [v10 instructions];

          uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v22;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v22 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v17 = [v5 videoRenderPrepareNode];
                  [v16 setVideoRenderPrepareNode:v17];
                }
                ++v15;
              }
              while (v13 != v15);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v13);
          }

          ++v8;
        }
        while (v8 != v7);
        uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v7);
    }
  }
}

- (void)updateVideoComposition:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = (AVVideoComposition *)a3;
  if (self->_videoComposition != v5)
  {
    objc_storeStrong((id *)&self->_videoComposition, a3);
    BOOL v6 = [(NUAVPlayerController *)self loopsVideo];
    if (v5 && v6)
    {
      id v19 = 0;
      uint64_t v7 = [MEMORY[0x263F586C0] repeatVideoComposition:v5 count:10 error:&v19];
      id v8 = v19;
      if (!v7)
      {
        if (*MEMORY[0x263F586F0] != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
        }
        uint64_t v14 = *MEMORY[0x263F58700];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v8;
          _os_log_error_impl(&dword_217C0A000, v14, OS_LOG_TYPE_ERROR, "Failed to repeat video composition, error: %@", buf, 0xCu);
        }
        goto LABEL_14;
      }

      $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = (AVVideoComposition *)v7;
    }
    id v8 = [(NUAVPlayerController *)self player];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = objc_msgSend(v8, "items", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) setVideoComposition:v5];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v11);
    }

LABEL_14:
  }
}

- (id)_loopingPlayerItemWithVideoAsset:(id)a3 videoComposition:(id)a4 audioMix:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v22 = 0;
  uint64_t v10 = [MEMORY[0x263F586C0] repeatVideo:a3 count:10 error:&v22];
  id v11 = v22;
  if (v10)
  {
    if (v8)
    {
      id v21 = 0;
      uint64_t v12 = [MEMORY[0x263F586C0] repeatVideoComposition:v8 count:10 error:&v21];
      id v13 = v21;

      if (!v12)
      {
        if (*MEMORY[0x263F586F0] != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
        }
        long long v18 = *MEMORY[0x263F58700];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v13;
          _os_log_error_impl(&dword_217C0A000, v18, OS_LOG_TYPE_ERROR, "Failed to loop video composition %@", buf, 0xCu);
        }
        long long v16 = 0;
        goto LABEL_25;
      }
      id v11 = v13;
      if (v9)
      {
LABEL_5:
        id v20 = 0;
        uint64_t v14 = [MEMORY[0x263F586C0] repeatAudio:v9 count:10 error:&v20];
        id v13 = v20;

        if (!v14)
        {
          if (*MEMORY[0x263F586F0] != -1) {
            dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
          }
          long long v15 = *MEMORY[0x263F58700];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v13;
            _os_log_error_impl(&dword_217C0A000, v15, OS_LOG_TYPE_ERROR, "Failed to loop audio mix %@", buf, 0xCu);
          }
          long long v16 = 0;
          goto LABEL_19;
        }
LABEL_18:
        long long v16 = [(NUAVPlayerController *)self _playerItemWithVideoAsset:v10 videoComposition:v12 audioMix:v14];

LABEL_19:
LABEL_25:
        id v11 = v13;
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v12 = 0;
      if (v9) {
        goto LABEL_5;
      }
    }
    uint64_t v14 = 0;
    id v13 = v11;
    goto LABEL_18;
  }
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
  }
  long long v17 = *MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v11;
    _os_log_error_impl(&dword_217C0A000, v17, OS_LOG_TYPE_ERROR, "Failed to loop video composition %@", buf, 0xCu);
  }
  long long v16 = 0;
LABEL_26:

  return v16;
}

- (id)_playerItemWithVideoAsset:(id)a3 videoComposition:(id)a4 audioMix:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = (void *)MEMORY[0x263EFA800];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 playerItemWithAsset:a3];
  [v11 setVideoComposition:v10];

  [v11 setAudioMix:v9];
  [v11 setSeekingWaitsForVideoCompositionRendering:1];
  [v11 setAllowedAudioSpatializationFormats:4];
  AlwaysApplyPerFrameHDRDisplayMetadata();
  self->_appliesPerFrameHDRDisplayMetadata = 1;
  [v11 setAppliesPerFrameHDRDisplayMetadata:1];
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
  }
  uint64_t v12 = *MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEFAULT))
  {
    if (self->_appliesPerFrameHDRDisplayMetadata) {
      id v13 = @"view with dolby metadata";
    }
    else {
      id v13 = @"view ignoring dolby metadata";
    }
    int v15 = 138412290;
    long long v16 = v13;
    _os_log_impl(&dword_217C0A000, v12, OS_LOG_TYPE_DEFAULT, "Created 1 item to %@", (uint8_t *)&v15, 0xCu);
  }

  return v11;
}

- (id)_playerItemsWithVideoAsset:(id)a3 videoComposition:(id)a4 audioMix:(id)a5 loopsVideo:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v6)
  {
    id v13 = [(NUAVPlayerController *)self _loopingPlayerItemWithVideoAsset:v10 videoComposition:v11 audioMix:v12];
    if (v13)
    {
      uint64_t v14 = v13;
      v22[0] = v13;
      int v15 = (void *)[v13 copy];
      v22[1] = v15;
      long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];

LABEL_6:
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __88__NUAVPlayerController__playerItemsWithVideoAsset_videoComposition_audioMix_loopsVideo___block_invoke;
      v20[3] = &unk_2642C2CD0;
      v20[4] = self;
      [v16 enumerateObjectsUsingBlock:v20];

      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v17 = [(NUAVPlayerController *)self _playerItemWithVideoAsset:v10 videoComposition:v11 audioMix:v12];
    if (v17)
    {
      uint64_t v14 = (void *)v17;
      uint64_t v21 = v17;
      long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
      goto LABEL_6;
    }
  }
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_196);
  }
  long long v18 = *MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v10;
    _os_log_error_impl(&dword_217C0A000, v18, OS_LOG_TYPE_ERROR, "Failed to create player item from asset: %@", buf, 0xCu);
  }
  long long v16 = 0;
LABEL_12:

  return v16;
}

uint64_t __88__NUAVPlayerController__playerItemsWithVideoAsset_videoComposition_audioMix_loopsVideo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addPlayerItemKVO:a2];
}

- (BOOL)prepareWithAVAsset:(id)a3 videoComposition:(id)a4 audioMix:(id)a5 loopsVideo:(BOOL)a6 seekToTime:(id *)a7
{
  BOOL v7 = a6;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id obj = a4;
  id v14 = a4;
  id v39 = a5;
  id v15 = a5;
  player = self->_player;
  v42 = v13;
  uint64_t v43 = v14;
  v44 = v15;
  if (player)
  {
    [(NUAVPlayerController *)self _removeTimeObserver];
    [(NUAVPlayerController *)self _removePlayerKVO];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v37 = [MEMORY[0x263F08690] currentHandler];
      [v37 handleFailureInMethod:a2 object:self file:@"NUAVPlayerController.m" lineNumber:132 description:@"expected an AVQueuePlayer"];
    }
    long long v16 = self->_player;
    uint64_t v17 = [(AVPlayer *)v16 items];
    long long v18 = (void *)[v17 copy];

    id v19 = [(NUAVPlayerController *)self _playerItemsWithVideoAsset:v42 videoComposition:v14 audioMix:v44 loopsVideo:v7];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v59 != v21) {
            objc_enumerationMutation(v19);
          }
          [(AVPlayer *)v16 insertItem:*(void *)(*((void *)&v58 + 1) + 8 * i) afterItem:0];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v58 objects:v63 count:16];
      }
      while (v20);
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v23 = v18;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v55 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void *)(*((void *)&v54 + 1) + 8 * j);
          [(NUAVPlayerController *)self _removePlayerItemKVO:v27 removeFromArray:1];
          [(AVPlayer *)v16 removeItem:v27];
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v54 objects:v62 count:16];
      }
      while (v24);
    }
  }
  else
  {
    long long v28 = [(NUAVPlayerController *)self _playerItemsWithVideoAsset:v13 videoComposition:v14 audioMix:v15 loopsVideo:v7];
    double v29 = (AVPlayer *)[objc_alloc(MEMORY[0x263EFA860]) initWithItems:v28];
    [(AVPlayer *)v29 setPreventsDisplaySleepDuringVideoPlayback:0];
    [(AVPlayer *)v29 setActionAtItemEnd:v7 ^ 1];
    [(AVPlayer *)v29 setMuted:self->_muted];
    uint64_t v30 = self->_player;
    self->_player = v29;
    uint64_t v31 = v29;

    Float64 v32 = [MEMORY[0x263EF93E0] auxiliarySession];
    __int16 v33 = v32;
    double v34 = (void *)MEMORY[0x263EF9048];
    if (!v7) {
      double v34 = (void *)MEMORY[0x263EF9060];
    }
    [v32 setCategory:*v34 error:0];
    [(AVPlayer *)self->_player setAudioSession:v33];
  }
  uint64_t v35 = MEMORY[0x263F01090];
  *(_OWORD *)&self->_currentSeekTime.value = *MEMORY[0x263F01090];
  self->_currentSeekTime.epoch = *(void *)(v35 + 16);
  objc_storeStrong((id *)&self->_videoAsset, a3);
  objc_storeStrong((id *)&self->_videoComposition, obj);
  objc_storeStrong((id *)&self->_audioMix, v39);
  self->_loopsVideo = v7;
  [(NUAVPlayerController *)self _addPlayerKVO];
  if (a7->var2)
  {
    objc_initWeak(&location, self);
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __91__NUAVPlayerController_prepareWithAVAsset_videoComposition_audioMix_loopsVideo_seekToTime___block_invoke;
    v51[3] = &unk_2642C3128;
    objc_copyWeak(&v52, &location);
    long long v49 = *(_OWORD *)&a7->var0;
    int64_t var3 = a7->var3;
    long long v47 = *MEMORY[0x263F010E0];
    uint64_t v48 = *(void *)(MEMORY[0x263F010E0] + 16);
    long long v45 = v47;
    uint64_t v46 = v48;
    [(NUAVPlayerController *)self seek:&v49 toleranceBefore:&v47 toleranceAfter:&v45 forceSeek:1 completionHandler:v51];
    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);
  }
  else
  {
    [(NUAVPlayerController *)self _addTimeObserver];
  }

  return player == 0;
}

void __91__NUAVPlayerController_prepareWithAVAsset_videoComposition_audioMix_loopsVideo_seekToTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _addTimeObserver];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_playerItemObservations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) playerItem];
        [(NUAVPlayerController *)self _removePlayerItemKVO:v8 removeFromArray:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NUAVPlayerController *)self _removePlayerKVO];
  [(NUAVPlayerController *)self _removeTimeObserver];
  v9.receiver = self;
  v9.super_class = (Class)NUAVPlayerController;
  [(NUAVPlayerController *)&v9 dealloc];
}

- (NUAVPlayerController)init
{
  v8.receiver = self;
  v8.super_class = (Class)NUAVPlayerController;
  double v2 = [(NUAVPlayerController *)&v8 init];
  v2->_updateInterval = 0.0333333333;
  uint64_t v3 = objc_opt_new();
  playerItemObservations = v2->_playerItemObservations;
  v2->_playerItemObservations = (NSMutableArray *)v3;

  uint64_t v5 = (NUObservatory *)objc_alloc_init(MEMORY[0x263F58658]);
  observatory = v2->_observatory;
  v2->_observatory = v5;

  v2->_appliesPerFrameHDRDisplayMetadata = 0;
  return v2;
}

@end