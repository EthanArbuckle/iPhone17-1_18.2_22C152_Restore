@interface ISBasePlayer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_videoForwardPlaybackEndTime;
- (BOOL)_needsUpdate;
- (BOOL)behavior:(id)a3 prerollVideoAtRate:(float)a4 completionHandler:(id)a5;
- (BOOL)behavior:(id)a3 seekVideoPlayerToTime:(id *)a4 completionHandler:(id)a5;
- (BOOL)behavior:(id)a3 seekVideoPlayerToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6 completionHandler:(id)a7;
- (BOOL)isAudioEnabled;
- (BOOL)videoLayersReadyForDisplay;
- (ISBasePlayer)init;
- (ISBasePlayer)initWithVideoPlayer:(id)a3;
- (ISBasePlayerDelegate)delegate;
- (ISBehavior)activeBehavior;
- (ISPlayerItem)playerItem;
- (ISPlayerOutputContent)_outputContent;
- (ISPlayerState)lastAppliedLayoutInfo;
- (ISWrappedAVPlayer)videoPlayer;
- (NSError)error;
- (PXAVResourceReclamationController)resourceReclamationController;
- (double)lastAppliedScale;
- (double)videoWillPlayToEndInterval;
- (double)videoWillPlayToPhotoInterval;
- (float)audioVolume;
- (float)videoPlayRate;
- (float)videoVolume;
- (id)_newWrappedPlayer;
- (id)_videoWillPlayToEndObserver;
- (id)_videoWillPlayToPhotoObserver;
- (id)apertureMode;
- (id)behavior:(id)a3 addBoundaryTimeObserverForTimes:(id)a4 queue:(id)a5 usingBlock:(id)a6;
- (int64_t)status;
- (void)_configureNewOutput:(id)a3;
- (void)_finishResettingAVObjects;
- (void)_handleErrorsIfNeeded;
- (void)_invalidateContentFromPlayerItem;
- (void)_invalidateStatus;
- (void)_invalidateVideoPlayer;
- (void)_invalidateVideoPlayerVolume;
- (void)_invalidateWillPlayToEndObserver;
- (void)_invalidateWillPlayToPhotoObserver;
- (void)_mainQueue_handleMediaServicesReset;
- (void)_mainQueue_resetAVObjectsWithResetCount:(int64_t)a3;
- (void)_outputVideoReadyForDisplayDidChange:(id)a3;
- (void)_setError:(id)a3;
- (void)_setForwardPlaybackEndTime:(id *)a3;
- (void)_setLastAppliedLayoutInfo:(id)a3;
- (void)_setLastAppliedScale:(double)a3;
- (void)_setOutputContent:(id)a3;
- (void)_setStatus:(int64_t)a3;
- (void)_setVideoForwardPlaybackEndTime:(id *)a3;
- (void)_setVideoPlayer:(id)a3;
- (void)_setVideoWillPlayToEndObserver:(id)a3;
- (void)_setVideoWillPlayToPhotoObserver:(id)a3;
- (void)_updateContentFromPlayerItemIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateStatusIfNeeded;
- (void)_updateVideoPlayerIfNeeded;
- (void)_updateVideoPlayerVolumeIfNeeded;
- (void)_updateWillPlayToEndObserverIfNeeded;
- (void)_updateWillPlayToPhotoObserverIfNeeded;
- (void)_videoDidPlayToEnd;
- (void)_videoWillPlayToEnd;
- (void)_videoWillPlayToPhoto;
- (void)addOutput:(id)a3;
- (void)applyOutputInfo:(id)a3 fromBehavior:(id)a4 withTransitionOptions:(id)a5 completion:(id)a6;
- (void)applyScale:(double)a3 withTransitionOptions:(id)a4 completion:(id)a5;
- (void)behavior:(id)a3 didSetOutputInfo:(id)a4 withTransitionOptions:(id)a5 completion:(id)a6;
- (void)behavior:(id)a3 playVideoToTime:(id *)a4 initialRate:(float)a5 overDuration:(double)a6 progressHandler:(id)a7;
- (void)behavior:(id)a3 removeTimeObserver:(id)a4;
- (void)behavior:(id)a3 setVideoForwardPlaybackEndTime:(id *)a4;
- (void)behavior:(id)a3 setVideoPlayRate:(float)a4;
- (void)behavior:(id)a3 setVideoVolume:(float)a4;
- (void)dealloc;
- (void)didPerformChanges;
- (void)enumerateOutputsWithBlock:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)playerItemDidChange;
- (void)removeOutput:(id)a3;
- (void)resourceReclamationEventDidOccur:(id)a3;
- (void)setActiveBehavior:(id)a3;
- (void)setApertureMode:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioVolume:(float)a3;
- (void)setDelegate:(id)a3;
- (void)setPlayerItem:(id)a3;
- (void)setResourceReclamationController:(id)a3;
- (void)setVideoVolume:(float)a3;
- (void)statusDidChange;
- (void)willRemoveOutput:(id)a3;
@end

@implementation ISBasePlayer

- (void)removeOutput:(id)a3
{
  id v4 = a3;
  [(ISBasePlayer *)self willRemoveOutput:v4];
  [(NSHashTable *)self->_outputs removeObject:v4];
}

- (void)willRemoveOutput:(id)a3
{
}

- (ISBehavior)activeBehavior
{
  return self->_activeBehavior;
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)dealloc
{
  [(ISBehavior *)self->_activeBehavior setDelegate:0];
  activeBehavior = self->_activeBehavior;
  self->_activeBehavior = 0;

  id v4 = self->_videoPlayer;
  v5 = v4;
  if (self->__videoWillPlayToEndObserver) {
    -[ISWrappedAVPlayer removeTimeObserver:](v4, "removeTimeObserver:");
  }
  [(ISWrappedAVPlayer *)v5 cancelPendingPrerolls];
  if (self->_videoPlayer)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained playerWillRelinquishVideoPlayer:self->_videoPlayer];
  }
  v7 = +[ISDeferredDealloc sharedInstance];
  [v7 _performDeferredDealloc:v5];

  v8.receiver = self;
  v8.super_class = (Class)ISBasePlayer;
  [(ISBasePlayer *)&v8 dealloc];
}

- (void)behavior:(id)a3 didSetOutputInfo:(id)a4 withTransitionOptions:(id)a5 completion:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(ISBasePlayer *)self activeBehavior];

  if (v14 == v10)
  {
    [(ISBasePlayer *)self applyOutputInfo:v11 fromBehavior:v10 withTransitionOptions:v12 completion:v13];
  }
  else
  {
    v15 = ISGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412290;
      id v17 = v10;
      _os_log_debug_impl(&dword_1DB21E000, v15, OS_LOG_TYPE_DEBUG, "Ignoring output from behavior that is not active: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceReclamationController, 0);
  objc_storeStrong((id *)&self->__outputContent, 0);
  objc_storeStrong((id *)&self->_lastAppliedLayoutInfo, 0);
  objc_storeStrong(&self->__videoWillPlayToPhotoObserver, 0);
  objc_storeStrong(&self->__videoWillPlayToEndObserver, 0);
  objc_storeStrong((id *)&self->_activeBehavior, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_apertureMode, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);

  objc_storeStrong((id *)&self->_providedAVPlayer, 0);
}

- (void)setResourceReclamationController:(id)a3
{
}

- (PXAVResourceReclamationController)resourceReclamationController
{
  return self->_resourceReclamationController;
}

- (void)_setVideoForwardPlaybackEndTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->value = *(_OWORD *)&a3->var0;
  self->epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_videoForwardPlaybackEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 256);
  return self;
}

- (void)_setLastAppliedScale:(double)a3
{
  self->_lastAppliedScale = a3;
}

- (double)lastAppliedScale
{
  return self->_lastAppliedScale;
}

- (ISPlayerOutputContent)_outputContent
{
  return self->__outputContent;
}

- (void)_setLastAppliedLayoutInfo:(id)a3
{
}

- (ISPlayerState)lastAppliedLayoutInfo
{
  return self->_lastAppliedLayoutInfo;
}

- (void)_setVideoWillPlayToPhotoObserver:(id)a3
{
}

- (id)_videoWillPlayToPhotoObserver
{
  return self->__videoWillPlayToPhotoObserver;
}

- (void)_setVideoWillPlayToEndObserver:(id)a3
{
}

- (id)_videoWillPlayToEndObserver
{
  return self->__videoWillPlayToEndObserver;
}

- (ISBasePlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ISBasePlayerDelegate *)WeakRetained;
}

- (BOOL)isAudioEnabled
{
  return self->_audioEnabled;
}

- (float)audioVolume
{
  return self->_audioVolume;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)status
{
  return self->_status;
}

- (ISPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)resourceReclamationEventDidOccur:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ISBasePlayer_resourceReclamationEventDidOccur___block_invoke;
  block[3] = &unk_1E6BECD80;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __49__ISBasePlayer_resourceReclamationEventDidOccur___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_handleMediaServicesReset");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__ISBasePlayer_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E6BEC5A0;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  is_dispatch_on_main_queue(v5);
}

uint64_t __45__ISBasePlayer_observable_didChange_context___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__ISBasePlayer_observable_didChange_context___block_invoke_2;
  v2[3] = &unk_1E6BEC8F8;
  v2[6] = *(void *)(a1 + 48);
  return [*(id *)(a1 + 32) performChanges:v2];
}

void __45__ISBasePlayer_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == ISPlayerItemObservableContext)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = v3;
    if (v6)
    {
      [*(id *)(a1 + 32) _invalidateStatus];
      id v3 = v7;
      uint64_t v6 = *(void *)(a1 + 48);
    }
    if ((v6 & 2) != 0)
    {
      [*(id *)(a1 + 32) _invalidateContentFromPlayerItem];
      goto LABEL_11;
    }
  }
  else if (v4 == ISWrappedAVPlayerObservableContext)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = v3;
    if ((v5 & 0x15) != 0)
    {
      [*(id *)(a1 + 32) _invalidateStatus];
      id v3 = v7;
      uint64_t v5 = *(void *)(a1 + 48);
    }
    if ((v5 & 0x800) != 0)
    {
      [*(id *)(a1 + 32) _invalidateWillPlayToEndObserver];
LABEL_11:
      id v3 = v7;
    }
  }
}

- (void)behavior:(id)a3 playVideoToTime:(id *)a4 initialRate:(float)a5 overDuration:(double)a6 progressHandler:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  id v14 = [(ISBasePlayer *)self activeBehavior];

  if (v14 == v13)
  {
    v15 = [(ISBasePlayer *)self videoPlayer];
    long long v16 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    objc_msgSend(v15, "playToTime:withInitialRate:overDuration:progressHandler:", &v16, v12, COERCE_DOUBLE(__PAIR64__(DWORD1(v16), LODWORD(a5))), a6);
  }
}

- (void)behavior:(id)a3 removeTimeObserver:(id)a4
{
  id v5 = a4;
  id v6 = [(ISBasePlayer *)self videoPlayer];
  [v6 removeTimeObserver:v5];
}

- (id)behavior:(id)a3 addBoundaryTimeObserverForTimes:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(ISBasePlayer *)self videoPlayer];
  id v13 = [v12 addBoundaryTimeObserverForTimes:v11 queue:v10 usingBlock:v9];

  return v13;
}

- (void)behavior:(id)a3 setVideoVolume:(float)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(ISBasePlayer *)self activeBehavior];

  if (v7 == v6)
  {
    objc_super v8 = ISGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412802;
      id v11 = self;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2048;
      double v15 = a4;
      _os_log_debug_impl(&dword_1DB21E000, v8, OS_LOG_TYPE_DEBUG, "%@: will set video volume: %@ - %f", (uint8_t *)&v10, 0x20u);
    }

    *(float *)&double v9 = a4;
    [(ISBasePlayer *)self setVideoVolume:v9];
  }
}

- (void)behavior:(id)a3 setVideoForwardPlaybackEndTime:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(ISBasePlayer *)self activeBehavior];

  if (v7 == v6)
  {
    objc_super v8 = ISGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
      Float64 Seconds = CMTimeGetSeconds((CMTime *)&v10);
      LODWORD(v10.var0) = 138412802;
      *(int64_t *)((char *)&v10.var0 + 4) = (int64_t)self;
      LOWORD(v10.var2) = 2112;
      *(void *)((char *)&v10.var2 + 2) = v6;
      HIWORD(v10.var3) = 2048;
      Float64 v11 = Seconds;
      _os_log_debug_impl(&dword_1DB21E000, v8, OS_LOG_TYPE_DEBUG, "%@: will set video end time: %@ - %f", (uint8_t *)&v10, 0x20u);
    }

    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
    [(ISBasePlayer *)self _setForwardPlaybackEndTime:&v10];
  }
}

- (BOOL)behavior:(id)a3 prerollVideoAtRate:(float)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(ISBasePlayer *)self activeBehavior];

  if (v10 == v8)
  {
    uint64_t v12 = ISGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v20 = self;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2048;
      double v24 = a4;
      _os_log_debug_impl(&dword_1DB21E000, v12, OS_LOG_TYPE_DEBUG, "%@: will set video preroll rate: %@ - %f", buf, 0x20u);
    }

    id v13 = [(ISBasePlayer *)self videoPlayer];
    __int16 v14 = [v13 currentItem];
    BOOL v11 = v14 != 0;

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__ISBasePlayer_behavior_prerollVideoAtRate_completionHandler___block_invoke;
    v17[3] = &unk_1E6BEC620;
    id v18 = v9;
    *(float *)&double v15 = a4;
    [v13 prerollAtRate:v17 completionHandler:v15];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __62__ISBasePlayer_behavior_prerollVideoAtRate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)behavior:(id)a3 seekVideoPlayerToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6 completionHandler:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  id v14 = [(ISBasePlayer *)self activeBehavior];

  if (v14 == v12)
  {
    uint64_t v16 = [(ISBasePlayer *)self videoPlayer];
    id v17 = [v16 currentItem];
    id v18 = v17;
    if (v17 && [v17 status] == 1)
    {
      v19 = ISGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        CMTime time = (CMTime)*a4;
        Float64 Seconds = CMTimeGetSeconds(&time);
        LODWORD(time.value) = 138412802;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
        LOWORD(time.flags) = 2112;
        *(void *)((char *)&time.flags + 2) = v12;
        HIWORD(time.epoch) = 2048;
        Float64 v34 = Seconds;
        _os_log_debug_impl(&dword_1DB21E000, v19, OS_LOG_TYPE_DEBUG, "%@: will seek video to time: %@ - %f", (uint8_t *)&time, 0x20u);
      }

      [v16 setRate:0.0];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __96__ISBasePlayer_behavior_seekVideoPlayerToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke;
      v28[3] = &unk_1E6BEC578;
      v28[4] = self;
      id v29 = v12;
      long long v31 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      id v30 = v13;
      CMTime time = (CMTime)*a4;
      long long v26 = *(_OWORD *)&a5->var0;
      int64_t v27 = a5->var3;
      long long v24 = *(_OWORD *)&a6->var0;
      int64_t v25 = a6->var3;
      [v16 seekToTime:&time toleranceBefore:&v26 toleranceAfter:&v24 completionHandler:v28];

      BOOL v15 = 1;
    }
    else
    {
      v20 = ISGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        CMTime time = (CMTime)*a4;
        Float64 v22 = CMTimeGetSeconds(&time);
        LODWORD(time.value) = 138412802;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
        LOWORD(time.flags) = 2112;
        *(void *)((char *)&time.flags + 2) = v12;
        HIWORD(time.epoch) = 2048;
        Float64 v34 = v22;
        _os_log_debug_impl(&dword_1DB21E000, v20, OS_LOG_TYPE_DEBUG, "%@: unable to seek video to time: %@ - %f", (uint8_t *)&time, 0x20u);
      }

      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

uint64_t __96__ISBasePlayer_behavior_seekVideoPlayerToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = ISGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    CMTimeValue v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    CMTime v7 = *(CMTime *)(a1 + 56);
    Float64 Seconds = CMTimeGetSeconds(&v7);
    LODWORD(v7.value) = 138412802;
    *(CMTimeValue *)((char *)&v7.value + 4) = v4;
    LOWORD(v7.flags) = 2112;
    *(void *)((char *)&v7.flags + 2) = v5;
    HIWORD(v7.epoch) = 2048;
    Float64 v8 = Seconds;
    _os_log_debug_impl(&dword_1DB21E000, v2, OS_LOG_TYPE_DEBUG, "%@: did seek video to time: %@ - %f", (uint8_t *)&v7, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)behavior:(id)a3 seekVideoPlayerToTime:(id *)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(ISBasePlayer *)self videoPlayer];
  BOOL v11 = [v10 currentItem];
  memset(&v20, 0, sizeof(v20));
  CMTimeMake(&v20, 20, 600);
  id v12 = [v11 videoComposition];

  if (v12)
  {
    memset(&v19, 0, sizeof(v19));
    id v13 = [v11 videoComposition];
    id v14 = v13;
    if (v13) {
      [v13 frameDuration];
    }
    else {
      memset(&v19, 0, sizeof(v19));
    }

    if (v19.flags)
    {
      CMTime time1 = v19;
      CMTime v17 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (CMTimeCompare(&time1, &v17)) {
        CMTime v20 = v19;
      }
    }
  }
  CMTime v19 = (CMTime)*a4;
  CMTime time1 = v20;
  CMTime v17 = v20;
  BOOL v15 = [(ISBasePlayer *)self behavior:v8 seekVideoPlayerToTime:&v19 toleranceBefore:&time1 toleranceAfter:&v17 completionHandler:v9];

  return v15;
}

- (float)videoPlayRate
{
  v2 = [(ISBasePlayer *)self videoPlayer];
  [v2 rate];
  float v4 = v3;

  return v4;
}

- (void)behavior:(id)a3 setVideoPlayRate:(float)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(ISBasePlayer *)self activeBehavior];

  if (v7 == v6)
  {
    id v8 = ISGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412802;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2048;
      double v16 = a4;
      _os_log_debug_impl(&dword_1DB21E000, v8, OS_LOG_TYPE_DEBUG, "%@: will set video rate: %@ - %f", (uint8_t *)&v11, 0x20u);
    }

    id v9 = [(ISBasePlayer *)self videoPlayer];
    *(float *)&double v10 = a4;
    [v9 setRate:v10];
  }
}

- (void)_setVideoPlayer:(id)a3
{
  uint64_t v5 = (ISWrappedAVPlayer *)a3;
  p_videoPlayer = &self->_videoPlayer;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    __int16 v13 = v5;
    if (videoPlayer)
    {
      id v8 = [(ISWrappedAVPlayer *)videoPlayer delegate];

      if (v8 == self) {
        [(ISWrappedAVPlayer *)*p_videoPlayer setDelegate:0];
      }
      [(ISWrappedAVPlayer *)*p_videoPlayer unregisterChangeObserver:self context:ISWrappedAVPlayerObservableContext];
      id v9 = *p_videoPlayer;
      double v10 = +[ISDeferredDealloc sharedInstance];
      [v10 _performDeferredDealloc:v9];

      if (self->_delegateRespondsTo.playerWillRelinquishVideoPlayer)
      {
        int v11 = [(ISBasePlayer *)self delegate];
        [v11 playerWillRelinquishVideoPlayer:*p_videoPlayer];
      }
      id v12 = *p_videoPlayer;
      *p_videoPlayer = 0;
    }
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    [(ISWrappedAVPlayer *)*p_videoPlayer setDelegate:self];
    [(ISWrappedAVPlayer *)*p_videoPlayer registerChangeObserver:self context:ISWrappedAVPlayerObservableContext];
    [(ISBasePlayer *)self _invalidateContentFromPlayerItem];
    [(ISBasePlayer *)self _invalidateVideoPlayerVolume];
    [(ISBasePlayer *)self _invalidateWillPlayToEndObserver];
    [(ISBasePlayer *)self _invalidateWillPlayToPhotoObserver];
    videoPlayer = (ISWrappedAVPlayer *)[(ISObservable *)self signalChange:4];
    uint64_t v5 = v13;
  }

  MEMORY[0x1F41817F8](videoPlayer, v5);
}

- (id)_newWrappedPlayer
{
  if (self->_delegateRespondsTo.videoPlayerForPlayer)
  {
    float v3 = [(ISBasePlayer *)self delegate];
    float v4 = [v3 videoPlayerForPlayer:self];

    id v5 = [[ISWrappedAVPlayer alloc] _initWithAVPlayer:v4];
  }
  else
  {
    if (!self->_delegateRespondsTo.wrappedVideoPlayerForPlayer) {
      goto LABEL_7;
    }
    float v4 = [(ISBasePlayer *)self delegate];
    id v5 = [v4 wrappedVideoPlayerForPlayer:self];
  }
  id v6 = v5;

  if (v6) {
    return v6;
  }
LABEL_7:

  return objc_alloc_init(ISWrappedAVPlayer);
}

- (void)_finishResettingAVObjects
{
  id v3 = [(ISBasePlayer *)self _newWrappedPlayer];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__ISBasePlayer__finishResettingAVObjects__block_invoke;
  v5[3] = &unk_1E6BECF98;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [(ISObservable *)self performChanges:v5];
}

void __41__ISBasePlayer__finishResettingAVObjects__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setVideoPlayer:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) playerItem];
  [v2 resetAVObjects];
}

- (void)_mainQueue_resetAVObjectsWithResetCount:(int64_t)a3
{
  if (self->_mainQueue_mediaServicesResetCounter == a3)
  {
    objc_initWeak(&location, self);
    id v4 = [(ISBasePlayer *)self videoPlayer];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__ISBasePlayer__mainQueue_resetAVObjectsWithResetCount___block_invoke;
    v5[3] = &unk_1E6BECB10;
    objc_copyWeak(&v6, &location);
    [v4 replaceCurrentItemWithPlayerItem:0 thenCall:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __56__ISBasePlayer__mainQueue_resetAVObjectsWithResetCount___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ISBasePlayer__mainQueue_resetAVObjectsWithResetCount___block_invoke_2;
  block[3] = &unk_1E6BECB10;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __56__ISBasePlayer__mainQueue_resetAVObjectsWithResetCount___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishResettingAVObjects];
}

- (void)_mainQueue_handleMediaServicesReset
{
  id v2 = (void *)(self->_mainQueue_mediaServicesResetCounter + 1);
  self->_mainQueue_mediaServicesResetCounter = (int64_t)v2;
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ISBasePlayer__mainQueue_handleMediaServicesReset__block_invoke;
  block[3] = &unk_1E6BECC18;
  objc_copyWeak(v5, &location);
  v5[1] = v2;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __51__ISBasePlayer__mainQueue_handleMediaServicesReset__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_mainQueue_resetAVObjectsWithResetCount:", *(void *)(a1 + 40));
}

- (void)_setError:(id)a3
{
  id v4 = (NSError *)a3;
  id v5 = v4;
  if (self->_error != v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __26__ISBasePlayer__setError___block_invoke;
    v6[3] = &unk_1E6BECF98;
    v6[4] = self;
    id v7 = v4;
    [(ISObservable *)self performChanges:v6];
  }
}

uint64_t __26__ISBasePlayer__setError___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);

  return [v2 signalChange:8];
}

- (void)_handleErrorsIfNeeded
{
  dispatch_time_t v3 = [(ISBasePlayer *)self playerItem];
  id v6 = [v3 error];

  if (!v6)
  {
    id v4 = [(ISBasePlayer *)self videoPlayer];
    id v6 = [v4 error];

    if (!v6)
    {
      id v5 = [(ISBasePlayer *)self videoPlayer];
      id v6 = [v5 currentItemError];
    }
  }
  [(ISBasePlayer *)self _setError:v6];
}

- (void)_updateVideoPlayerIfNeeded
{
  if (!self->_isValid.videoPlayer)
  {
    self->_isValid.videoPlayer = 1;
    dispatch_time_t v3 = [(ISBasePlayer *)self playerItem];

    if (v3)
    {
      if (!self->_videoPlayer)
      {
        id v4 = [(ISBasePlayer *)self _newWrappedPlayer];
        [(ISBasePlayer *)self _setVideoPlayer:v4];
      }
    }
    else
    {
      [(ISBasePlayer *)self _setVideoPlayer:0];
    }
  }
}

- (void)_invalidateVideoPlayer
{
  self->_isValid.videoPlayer = 0;
}

- (void)_updateVideoPlayerVolumeIfNeeded
{
  if (!self->_isValid.videoPlayerVolume)
  {
    self->_isValid.videoPlayerVolume = 1;
    id v7 = [(ISBasePlayer *)self videoPlayer];
    float v4 = 0.0;
    if ([(ISBasePlayer *)self isAudioEnabled])
    {
      [(ISBasePlayer *)self videoVolume];
      float v6 = v5;
      [(ISBasePlayer *)self audioVolume];
      float v4 = v6 * *(float *)&v3;
    }
    *(float *)&double v3 = v4;
    [v7 setVolume:v3];
    [v7 setIsAudioEnabled:v4 > 0.0];
  }
}

- (void)_invalidateVideoPlayerVolume
{
  self->_isValid.videoPlayerVolume = 0;
}

- (void)_updateIfNeeded
{
  if ([(ISBasePlayer *)self _needsUpdate])
  {
    [(ISBasePlayer *)self _updateVideoPlayerIfNeeded];
    [(ISBasePlayer *)self _updateStatusIfNeeded];
    [(ISBasePlayer *)self _updateVideoPlayerVolumeIfNeeded];
    [(ISBasePlayer *)self _updateContentFromPlayerItemIfNeeded];
    [(ISBasePlayer *)self _updateWillPlayToEndObserverIfNeeded];
    [(ISBasePlayer *)self _updateWillPlayToPhotoObserverIfNeeded];
  }
}

- (BOOL)_needsUpdate
{
  return !self->_isValid.status
      || !self->_isValid.contentFromPlayerItem
      || !self->_isValid.videoPlayer
      || !self->_isValid.videoPlayerVolume
      || !self->_isValid.willPlayToEndObserver
      || !self->_isValid.willPlayToPhotoObserver;
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)ISBasePlayer;
  [(ISObservable *)&v3 didPerformChanges];
  [(ISBasePlayer *)self _updateIfNeeded];
}

- (id)apertureMode
{
  return self->_apertureMode;
}

- (void)setApertureMode:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (self->_apertureMode != (NSString *)v4)
  {
    id v8 = (void *)v4;
    uint64_t v4 = objc_msgSend((id)v4, "isEqualToString:");
    uint64_t v5 = (uint64_t)v8;
    if ((v4 & 1) == 0)
    {
      float v6 = (NSString *)[v8 copy];
      apertureMode = self->_apertureMode;
      self->_apertureMode = v6;

      uint64_t v4 = [(ISBasePlayer *)self _invalidateContentFromPlayerItem];
      uint64_t v5 = (uint64_t)v8;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)setVideoVolume:(float)a3
{
  if (self->_videoVolume != a3)
  {
    self->_videoVolume = a3;
    [(ISBasePlayer *)self _invalidateVideoPlayerVolume];
  }
}

- (float)videoVolume
{
  return self->_videoVolume;
}

- (void)_setForwardPlaybackEndTime:(id *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__ISBasePlayer__setForwardPlaybackEndTime___block_invoke;
  v3[3] = &unk_1E6BEC550;
  v3[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(ISObservable *)self performChanges:v3];
}

void __43__ISBasePlayer__setForwardPlaybackEndTime___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32) + 256;
  objc_super v3 = (CMTime *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)(a1 + 40);
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = [*(id *)(a1 + 32) videoPlayer];
  float v6 = v5;
  if (v5) {
    [v5 itemForwardPlaybackEndTime];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime v7 = *v3;
  if (CMTimeCompare(&v7, &time2))
  {
    CMTime v7 = *v3;
    [v6 setItemForwardEndPlaybackTime:&v7];
  }
  [*(id *)(a1 + 32) _invalidateWillPlayToEndObserver];
}

- (void)_setStatus:(int64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    [(ISBasePlayer *)self statusDidChange];
    [(ISObservable *)self signalChange:2];
  }
}

- (void)_updateStatusIfNeeded
{
  if (!self->_isValid.status)
  {
    self->_isValid.status = 1;
    objc_super v3 = [(ISBasePlayer *)self playerItem];
    uint64_t v4 = [v3 status];
    uint64_t v5 = [(ISBasePlayer *)self videoPlayer];
    uint64_t v6 = [v5 currentItemStatus];
    if (v4 == 1 || (uint64_t v7 = v6, [v5 status] == 2))
    {
      [(ISBasePlayer *)self _handleErrorsIfNeeded];
      uint64_t v8 = 3;
    }
    else
    {
      uint64_t v8 = 2 * (v7 == 1);
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__ISBasePlayer__updateStatusIfNeeded__block_invoke;
    v9[3] = &unk_1E6BECFE8;
    v9[4] = self;
    v9[5] = v8;
    [(ISObservable *)self performChanges:v9];
  }
}

uint64_t __37__ISBasePlayer__updateStatusIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStatus:*(void *)(a1 + 40)];
}

- (void)_invalidateStatus
{
  self->_isValid.status = 0;
}

- (void)_updateWillPlayToPhotoObserverIfNeeded
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!self->_isValid.willPlayToPhotoObserver)
  {
    self->_isValid.willPlayToPhotoObserver = 1;
    objc_super v3 = [(ISBasePlayer *)self videoPlayer];
    uint64_t v4 = [(ISBasePlayer *)self _videoWillPlayToPhotoObserver];

    if (v4)
    {
      uint64_t v5 = [(ISBasePlayer *)self _videoWillPlayToPhotoObserver];
      [v3 removeTimeObserver:v5];
    }
    uint64_t v6 = [(ISBasePlayer *)self playerItem];

    if (v6)
    {
      memset(&v22, 0, sizeof(v22));
      uint64_t v7 = [(ISBasePlayer *)self playerItem];
      uint64_t v8 = [v7 playerContent];
      id v9 = v8;
      if (v8) {
        [v8 photoTime];
      }
      else {
        memset(&v22, 0, sizeof(v22));
      }

      memset(&v21, 0, sizeof(v21));
      [(ISBasePlayer *)self videoWillPlayToPhotoInterval];
      CMTimeMakeWithSeconds(&rhs, v10, 600);
      CMTime lhs = v22;
      CMTimeSubtract(&v21, &lhs, &rhs);
      CMTime time1 = v21;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      CMTimeMaximum(&lhs, &time1, &time2);
      CMTime v21 = lhs;
      int v11 = ISGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        CMTime lhs = v21;
        Float64 Seconds = CMTimeGetSeconds(&lhs);
        LODWORD(lhs.value) = 138412546;
        *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)self;
        LOWORD(lhs.flags) = 2048;
        *(Float64 *)((char *)&lhs.flags + 2) = Seconds;
        _os_log_debug_impl(&dword_1DB21E000, v11, OS_LOG_TYPE_DEBUG, "%@: will add video observer for will-play-to-photo time: %f", (uint8_t *)&lhs, 0x16u);
      }

      objc_initWeak((id *)&time1, self);
      CMTime lhs = v21;
      id v12 = [MEMORY[0x1E4F29238] valueWithCMTime:&lhs];
      __int16 v23 = v12;
      __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __54__ISBasePlayer__updateWillPlayToPhotoObserverIfNeeded__block_invoke;
      v16[3] = &unk_1E6BECB10;
      objc_copyWeak(&v17, (id *)&time1);
      id v14 = [v3 addBoundaryTimeObserverForTimes:v13 queue:0 usingBlock:v16];

      [(ISBasePlayer *)self _setVideoWillPlayToPhotoObserver:v14];
      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)&time1);
    }
  }
}

void __54__ISBasePlayer__updateWillPlayToPhotoObserverIfNeeded__block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __54__ISBasePlayer__updateWillPlayToPhotoObserverIfNeeded__block_invoke_2;
  v1[3] = &unk_1E6BECB10;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  is_dispatch_on_main_queue(v1);
  objc_destroyWeak(&v2);
}

void __54__ISBasePlayer__updateWillPlayToPhotoObserverIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _videoWillPlayToPhoto];
}

- (void)_invalidateWillPlayToPhotoObserver
{
  self->_isValid.willPlayToPhotoObserver = 0;
}

- (void)_updateWillPlayToEndObserverIfNeeded
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self->_isValid.willPlayToEndObserver)
  {
    self->_isValid.willPlayToEndObserver = 1;
    objc_super v3 = [(ISBasePlayer *)self videoPlayer];
    if (v3)
    {
      memset(&v23, 0, sizeof(v23));
      [(ISBasePlayer *)self _videoForwardPlaybackEndTime];
      if ((unsigned __int128)0 >> 96 != 1)
      {
        uint64_t v4 = [(ISBasePlayer *)self playerItem];
        uint64_t v5 = [v4 playerContent];
        uint64_t v6 = v5;
        if (v5) {
          [v5 videoDuration];
        }
        else {
          memset(&v22, 0, sizeof(v22));
        }
        CMTime v23 = v22;
      }
      uint64_t v7 = [(ISBasePlayer *)self _videoWillPlayToEndObserver];

      if (v7)
      {
        uint64_t v8 = [(ISBasePlayer *)self _videoWillPlayToEndObserver];
        [v3 removeTimeObserver:v8];
      }
      memset(&v22, 0, sizeof(v22));
      [(ISBasePlayer *)self videoWillPlayToEndInterval];
      CMTimeMakeWithSeconds(&rhs, v9, 600);
      CMTime lhs = v23;
      CMTimeSubtract(&v22, &lhs, &rhs);
      Float64 v10 = ISGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        CMTime lhs = v22;
        Float64 Seconds = CMTimeGetSeconds(&lhs);
        LODWORD(lhs.value) = 138412546;
        *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)self;
        LOWORD(lhs.flags) = 2048;
        *(Float64 *)((char *)&lhs.flags + 2) = Seconds;
        _os_log_debug_impl(&dword_1DB21E000, v10, OS_LOG_TYPE_DEBUG, "%@: will add video observer for will-end time: %f", (uint8_t *)&lhs, 0x16u);
      }

      objc_initWeak(&location, self);
      CMTime lhs = v22;
      int v11 = [MEMORY[0x1E4F29238] valueWithCMTime:&lhs];
      long long v24 = v11;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      id v17 = __52__ISBasePlayer__updateWillPlayToEndObserverIfNeeded__block_invoke;
      id v18 = &unk_1E6BECB10;
      objc_copyWeak(&v19, &location);
      __int16 v13 = [v3 addBoundaryTimeObserverForTimes:v12 queue:0 usingBlock:&v15];

      -[ISBasePlayer _setVideoWillPlayToEndObserver:](self, "_setVideoWillPlayToEndObserver:", v13, v15, v16, v17, v18);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

void __52__ISBasePlayer__updateWillPlayToEndObserverIfNeeded__block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __52__ISBasePlayer__updateWillPlayToEndObserverIfNeeded__block_invoke_2;
  v1[3] = &unk_1E6BECB10;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  is_dispatch_on_main_queue(v1);
  objc_destroyWeak(&v2);
}

void __52__ISBasePlayer__updateWillPlayToEndObserverIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _videoWillPlayToEnd];
}

- (void)_invalidateWillPlayToEndObserver
{
  self->_isValid.willPlayToEndObserver = 0;
}

- (void)_setOutputContent:(id)a3
{
  uint64_t v5 = (ISPlayerOutputContent *)a3;
  if (self->__outputContent != v5)
  {
    objc_storeStrong((id *)&self->__outputContent, a3);
    [(ISBasePlayer *)self _invalidateWillPlayToPhotoObserver];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__ISBasePlayer__setOutputContent___block_invoke;
    v6[3] = &unk_1E6BEC528;
    uint64_t v7 = v5;
    [(ISBasePlayer *)self enumerateOutputsWithBlock:v6];
  }
}

uint64_t __34__ISBasePlayer__setOutputContent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContent:*(void *)(a1 + 32)];
}

- (void)_updateContentFromPlayerItemIfNeeded
{
  if (!self->_isValid.contentFromPlayerItem)
  {
    self->_isValid.contentFromPlayerItem = 1;
    id v17 = [(ISBasePlayer *)self playerItem];
    objc_super v3 = [v17 playerContent];
    uint64_t v4 = v3;
    if (v3) {
      unsigned int v16 = [v3 photoIsOriginal];
    }
    else {
      unsigned int v16 = 1;
    }
    uint64_t v5 = [(ISBasePlayer *)self videoPlayer];
    uint64_t v6 = [v4 videoPlayerItem];
    uint64_t v7 = [v5 currentItem];
    uint64_t v8 = [(ISBasePlayer *)self apertureMode];
    Float64 v9 = [v6 asset];
    Float64 v10 = [v7 asset];

    if (v9 == v10)
    {
      [v7 setVideoApertureMode:v8];
    }
    else
    {
      [v6 setVideoApertureMode:v8];
      [v5 replaceCurrentItemWithPlayerItem:v6];
    }
    int v11 = [ISPlayerOutputContent alloc];
    uint64_t v12 = [v4 photo];
    uint64_t v13 = [v4 photoEXIFOrientation];
    id v14 = [v17 contentAspectRatio];
    uint64_t v15 = [(ISPlayerOutputContent *)v11 initWithPhoto:v12 photoIsOriginal:v16 photoEXIFOrientation:v13 videoPlayer:v5 aspectRatio:v14];

    [(ISBasePlayer *)self _setOutputContent:v15];
  }
}

- (void)_invalidateContentFromPlayerItem
{
  self->_isValid.contentFromPlayerItem = 0;
}

- (void)_configureNewOutput:(id)a3
{
  id v4 = a3;
  id v6 = [(ISBasePlayer *)self _outputContent];
  [v4 setContent:v6];
  uint64_t v5 = [(ISBasePlayer *)self lastAppliedLayoutInfo];
  [v4 applyOutputInfo:v5 withTransitionOptions:0 completion:0];
}

- (void)enumerateOutputsWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_outputs;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)applyOutputInfo:(id)a3 fromBehavior:(id)a4 withTransitionOptions:(id)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = ISGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_debug_impl(&dword_1DB21E000, v14, OS_LOG_TYPE_DEBUG, "%@: will apply output info: %@ - %@\n\toptions: %@", buf, 0x2Au);
  }

  [(ISBasePlayer *)self _setLastAppliedLayoutInfo:v10];
  dispatch_group_t v15 = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v28) = 1;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke;
  v22[3] = &unk_1E6BEC500;
  unsigned int v16 = v15;
  CMTime v23 = v16;
  id v17 = v10;
  id v24 = v17;
  id v18 = v12;
  id v25 = v18;
  uint64_t v26 = buf;
  [(ISBasePlayer *)self enumerateOutputsWithBlock:v22];
  if (v13)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke_4;
    v19[3] = &unk_1E6BECC68;
    id v20 = v13;
    CMTime v21 = buf;
    dispatch_group_notify(v16, MEMORY[0x1E4F14428], v19);
  }
  _Block_object_dispose(buf, 8);
}

void __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke_2;
  v7[3] = &unk_1E6BEC4D8;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v10 = v4;
  uint64_t v12 = v5;
  id v11 = *(id *)(a1 + 32);
  id v6 = v3;
  is_dispatch_on_main_queue(v7);
}

uint64_t __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke_3;
  v6[3] = &unk_1E6BECC40;
  long long v5 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v5;
  long long v7 = v5;
  [v1 applyOutputInfo:v2 withTransitionOptions:v3 completion:v6];
}

void __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)applyScale:(double)a3 withTransitionOptions:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = ISGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2112;
    id v23 = v8;
    _os_log_debug_impl(&dword_1DB21E000, v10, OS_LOG_TYPE_DEBUG, "%@: will apply scale %.2f\n\toptions: %@", buf, 0x20u);
  }

  [(ISBasePlayer *)self _setLastAppliedScale:a3];
  dispatch_group_t v11 = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v23) = 1;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__ISBasePlayer_applyScale_withTransitionOptions_completion___block_invoke;
  v17[3] = &unk_1E6BEC4B0;
  uint64_t v12 = v11;
  id v18 = v12;
  double v21 = a3;
  id v13 = v8;
  id v19 = v13;
  id v20 = buf;
  [(ISBasePlayer *)self enumerateOutputsWithBlock:v17];
  if (v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__ISBasePlayer_applyScale_withTransitionOptions_completion___block_invoke_3;
    v14[3] = &unk_1E6BECC68;
    id v15 = v9;
    unsigned int v16 = buf;
    dispatch_group_notify(v12, MEMORY[0x1E4F14428], v14);
  }
  _Block_object_dispose(buf, 8);
}

void __60__ISBasePlayer_applyScale_withTransitionOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  double v5 = *(double *)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__ISBasePlayer_applyScale_withTransitionOptions_completion___block_invoke_2;
  v7[3] = &unk_1E6BECC40;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  [v4 applyScale:v6 withTransitionOptions:v7 completion:v5];
}

uint64_t __60__ISBasePlayer_applyScale_withTransitionOptions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __60__ISBasePlayer_applyScale_withTransitionOptions_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)setActiveBehavior:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v5 = (ISBehavior *)a3;
  p_activeBehavior = &self->_activeBehavior;
  activeBehavior = self->_activeBehavior;
  if (activeBehavior != v5)
  {
    [(ISBehavior *)activeBehavior setDelegate:0];
    [(ISBehavior *)*p_activeBehavior resignActive];
    id v8 = ISGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_debug_impl(&dword_1DB21E000, v8, OS_LOG_TYPE_DEBUG, "ACTIVE BEHAVIOR: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)&self->_activeBehavior, a3);
    [(ISBehavior *)*p_activeBehavior setDelegate:self];
    [(ISBehavior *)*p_activeBehavior becomeActive];
    [(ISBasePlayer *)self activeBehaviorDidChange];
  }
}

- (void)setAudioVolume:(float)a3
{
  if (self->_audioVolume != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __31__ISBasePlayer_setAudioVolume___block_invoke;
    v3[3] = &unk_1E6BEC708;
    v3[4] = self;
    float v4 = a3;
    [(ISObservable *)self performChanges:v3];
  }
}

uint64_t __31__ISBasePlayer_setAudioVolume___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 156) = *(_DWORD *)(a1 + 40);
  return [*(id *)(a1 + 32) _invalidateVideoPlayerVolume];
}

- (void)setAudioEnabled:(BOOL)a3
{
  if (self->_audioEnabled != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __32__ISBasePlayer_setAudioEnabled___block_invoke;
    v3[3] = &unk_1E6BEC990;
    v3[4] = self;
    BOOL v4 = a3;
    [(ISObservable *)self performChanges:v3];
  }
}

uint64_t __32__ISBasePlayer_setAudioEnabled___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 152) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _invalidateVideoPlayerVolume];
}

- (double)videoWillPlayToPhotoInterval
{
  return 0.065;
}

- (double)videoWillPlayToEndInterval
{
  return 0.065;
}

- (void)_videoWillPlayToEnd
{
  id v2 = [(ISBasePlayer *)self activeBehavior];
  [v2 videoWillPlayToEnd];
}

- (void)_videoWillPlayToPhoto
{
  id v2 = [(ISBasePlayer *)self activeBehavior];
  [v2 videoWillPlayToPhoto];
}

- (void)_videoDidPlayToEnd
{
  id v2 = [(ISBasePlayer *)self activeBehavior];
  [v2 videoDidPlayToEnd];
}

- (BOOL)videoLayersReadyForDisplay
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = self->_outputs;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v7, "isVideoReadyForDisplay", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (void)_outputVideoReadyForDisplayDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__ISBasePlayer__outputVideoReadyForDisplayDidChange___block_invoke;
  v6[3] = &unk_1E6BECF48;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  is_dispatch_on_main_queue(v6);
}

void __53__ISBasePlayer__outputVideoReadyForDisplayDidChange___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 112) containsObject:*(void *)(a1 + 40)])
  {
    id v2 = [*(id *)(a1 + 32) activeBehavior];
    [v2 videoReadyForDisplayDidChange];
  }
}

- (void)addOutput:(id)a3
{
  id v4 = a3;
  [(NSHashTable *)self->_outputs addObject:v4];
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    id v7 = __26__ISBasePlayer_addOutput___block_invoke;
    BOOL v8 = &unk_1E6BEC488;
    objc_copyWeak(&v9, &location);
    objc_copyWeak(&v10, &from);
    [v4 setVideoLayerReadyForDisplayChangeHandler:&v5];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  -[ISBasePlayer didAddOutput:](self, "didAddOutput:", v4, v5, v6, v7, v8);
}

void __26__ISBasePlayer_addOutput___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _outputVideoReadyForDisplayDidChange:v2];
}

- (void)statusDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __31__ISBasePlayer_statusDidChange__block_invoke;
  v2[3] = &unk_1E6BED038;
  v2[4] = self;
  [(ISObservable *)self performChanges:v2];
}

uint64_t __31__ISBasePlayer_statusDidChange__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateWillPlayToEndObserver];
  id v2 = *(void **)(a1 + 32);

  return [v2 _invalidateWillPlayToPhotoObserver];
}

- (void)playerItemDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __35__ISBasePlayer_playerItemDidChange__block_invoke;
  v2[3] = &unk_1E6BED038;
  v2[4] = self;
  [(ISObservable *)self performChanges:v2];
}

uint64_t __35__ISBasePlayer_playerItemDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateStatus];
}

- (void)setPlayerItem:(id)a3
{
  id v4 = (ISPlayerItem *)a3;
  uint64_t v5 = v4;
  if (self->_playerItem != v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __30__ISBasePlayer_setPlayerItem___block_invoke;
    v6[3] = &unk_1E6BECF98;
    void v6[4] = self;
    id v7 = v4;
    [(ISObservable *)self performChanges:v6];
  }
}

uint64_t __30__ISBasePlayer_setPlayerItem___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setVideoPlayer:0];
  [*(id *)(*(void *)(a1 + 32) + 160) unregisterChangeObserver:*(void *)(a1 + 32) context:ISPlayerItemObservableContext];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 160) registerChangeObserver:*(void *)(a1 + 32) context:ISPlayerItemObservableContext];
  [*(id *)(a1 + 32) configurePlayerItem];
  [*(id *)(a1 + 32) _invalidateVideoPlayer];
  [*(id *)(a1 + 32) _invalidateContentFromPlayerItem];
  id v2 = *(void **)(a1 + 32);

  return [v2 playerItemDidChange];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->wrappedVideoPlayerForPlayer = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->videoPlayerForPlayer = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->playerWillRelinquishVideoPlayer = objc_opt_respondsToSelector() & 1;
  }
}

- (ISBasePlayer)initWithVideoPlayer:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ISBasePlayer;
  uint64_t v6 = [(ISObservable *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    v6->_audioVolume = 1.0;
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    outputs = v7->_outputs;
    v7->_outputs = (NSHashTable *)v8;

    objc_storeStrong((id *)&v7->_providedAVPlayer, a3);
    uint64_t v10 = MEMORY[0x1E4F1FA10];
    *(_OWORD *)&v7->value = *MEMORY[0x1E4F1FA10];
    v7->epoch = *(void *)(v10 + 16);
    v7->_lastAppliedScale = 1.0;
    v7->_audioEnabled = 1;
    objc_storeStrong((id *)&v7->_apertureMode, (id)*MEMORY[0x1E4F161D0]);
    long long v11 = (PXAVResourceReclamationController *)objc_alloc_init(MEMORY[0x1E4F8EB78]);
    resourceReclamationController = v7->_resourceReclamationController;
    v7->_resourceReclamationController = v11;

    [(PXAVResourceReclamationController *)v7->_resourceReclamationController registerObserver:v7];
    long long v13 = objc_alloc_init(ISDefaultBehavior);
    [(ISBasePlayer *)v7 setActiveBehavior:v13];
  }
  return v7;
}

- (ISBasePlayer)init
{
  return [(ISBasePlayer *)self initWithVideoPlayer:0];
}

@end