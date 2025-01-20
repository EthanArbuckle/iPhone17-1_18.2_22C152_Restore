@interface PUBrowsingIrisPlayer
+ (PUBrowsingIrisPlayer)new;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentItemDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPhotoTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentVideoDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playerCurrentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)scrubbingPhotoTime;
- (BOOL)_needsUpdate;
- (BOOL)allowLargeVitalityInset;
- (BOOL)appIsInBackground;
- (BOOL)isActivated;
- (BOOL)isContentLoadingRequestInProgress;
- (BOOL)isImageLoadingEnabled;
- (BOOL)isLivePhotoLoadingAllowed;
- (BOOL)isLivePhotoPlaybackAllowed;
- (BOOL)isPlaying;
- (CGSize)_targetSize;
- (ISLivePhotoPlayer)player;
- (ISWrappedAVPlayer)videoPlayer;
- (NSArray)currentlyDisplayedTimes;
- (NSMutableSet)livePhotoLoadingDisablingReasons;
- (NSMutableSet)livePhotoPlaybackDisablingReasons;
- (PHLivePhoto)livePhoto;
- (PUBrowsingIrisPlayer)init;
- (PUBrowsingIrisPlayer)initWithAsset:(id)a3 mediaProvider:(id)a4;
- (PUBrowsingIrisPlayerChange)currentChange;
- (PUDisplayAsset)asset;
- (PUMediaProvider)mediaProvider;
- (__n128)vitalityTransform;
- (float)playRate;
- (id)_playerCreateIfNeeded:(BOOL)a3;
- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5;
- (id)debugDetailedDescription;
- (id)durationChangeHandler;
- (id)newViewModelChange;
- (id)playerCreateIfNeeded;
- (id)playerItem;
- (id)playerItemChangeHandler;
- (id)seekCompletionHandler;
- (id)statusChangeHandler;
- (id)wrappedVideoPlayerForPlayer:(id)a3;
- (int)livePhotoRequestID;
- (int64_t)_contentMode;
- (int64_t)_currentUnloadRequestId;
- (int64_t)livePhotoRequestState;
- (int64_t)loadingTarget;
- (int64_t)playerStatus;
- (void)_cancelAllRequests;
- (void)_handleLivePhotoResult:(id)a3 info:(id)a4 requestID:(int)a5;
- (void)_handleLoadedVitalityTransform:(__n128)a3 limitingAllowed:(__n128)a4 forAsset:(uint64_t)a5;
- (void)_handlePeriodicObserverWithTime:(id *)a3;
- (void)_handlePlaybackStyleChanged;
- (void)_invalidateLivePhoto;
- (void)_invalidatePlayerContent;
- (void)_invalidatePlayerItemLoadingTarget;
- (void)_invalidatePlayerItemScrubbingPhotoTime;
- (void)_invalidatePlaying;
- (void)_updateIfNeeded;
- (void)_updateLivePhotoIfNeeded;
- (void)_updatePlayerContentIfNeeded;
- (void)_updatePlayerItemLoadingTargetIfNeeded;
- (void)_updatePlayerItemScrubbingPhotoTimeIfNeeded;
- (void)_updatePlayingIfNeeded;
- (void)_updateVitalityTransform;
- (void)cancelPendingSeeks;
- (void)dealloc;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)playPreviewHintWhenReady;
- (void)playerWillRelinquishVideoPlayer:(id)a3;
- (void)registerChangeObserver:(id)a3;
- (void)removeTimeObserver:(id)a3;
- (void)setActivated:(BOOL)a3;
- (void)setAppIsInBackground:(BOOL)a3;
- (void)setAsset:(id)a3;
- (void)setCurrentlyDisplayedTimes:(id)a3;
- (void)setDurationChangeHandler:(id)a3;
- (void)setImageLoadingEnabled:(BOOL)a3;
- (void)setIsLivePhotoPlaybackAllowed:(BOOL)a3;
- (void)setLivePhoto:(id)a3;
- (void)setLivePhotoLoadingAllowed:(BOOL)a3;
- (void)setLivePhotoLoadingDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setLivePhotoPlaybackDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setLivePhotoRequestID:(int)a3;
- (void)setLivePhotoRequestState:(int64_t)a3;
- (void)setLoadingTarget:(int64_t)a3;
- (void)setPlayerItemChangeHandler:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setScrubbingPhotoTime:(id *)a3 completion:(id)a4;
- (void)setSeekCompletionHandler:(id)a3;
- (void)setStatusChangeHandler:(id)a3;
- (void)setVideoPlayer:(id)a3;
- (void)setVitalityTransform:(float32x4_t)a3 limitingAllowed:(float32x4_t)a4;
- (void)set_currentUnloadRequestId:(int64_t)a3;
- (void)unloadLivePhoto;
- (void)unregisterChangeObserver:(id)a3;
- (void)videoScrubberController:(id)a3 seekToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6 completionHandler:(id)a7;
@end

@implementation PUBrowsingIrisPlayer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_seekCompletionHandler, 0);
  objc_storeStrong((id *)&self->_livePhoto, 0);
  objc_storeStrong((id *)&self->_livePhotoPlaybackDisablingReasons, 0);
  objc_storeStrong((id *)&self->_livePhotoLoadingDisablingReasons, 0);
  objc_storeStrong((id *)&self->_currentlyDisplayedTimes, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong(&self->playerItemChangeHandler, 0);
  objc_storeStrong(&self->statusChangeHandler, 0);
  objc_storeStrong(&self->durationChangeHandler, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong(&self->_videoPeriodicObserver, 0);
}

- (void)setAppIsInBackground:(BOOL)a3
{
  self->_appIsInBackground = a3;
}

- (BOOL)appIsInBackground
{
  return self->_appIsInBackground;
}

- (void)setSeekCompletionHandler:(id)a3
{
}

- (id)seekCompletionHandler
{
  return self->_seekCompletionHandler;
}

- (void)setLivePhotoRequestID:(int)a3
{
  self->_livePhotoRequestID = a3;
}

- (int)livePhotoRequestID
{
  return self->_livePhotoRequestID;
}

- (void)setLivePhotoRequestState:(int64_t)a3
{
  self->_livePhotoRequestState = a3;
}

- (int64_t)livePhotoRequestState
{
  return self->_livePhotoRequestState;
}

- (PHLivePhoto)livePhoto
{
  return self->_livePhoto;
}

- (void)set_currentUnloadRequestId:(int64_t)a3
{
  self->__currentUnloadRequestId = a3;
}

- (int64_t)_currentUnloadRequestId
{
  return self->__currentUnloadRequestId;
}

- (NSMutableSet)livePhotoPlaybackDisablingReasons
{
  return self->_livePhotoPlaybackDisablingReasons;
}

- (NSMutableSet)livePhotoLoadingDisablingReasons
{
  return self->_livePhotoLoadingDisablingReasons;
}

- (BOOL)allowLargeVitalityInset
{
  return self->_allowLargeVitalityInset;
}

- (__n128)vitalityTransform
{
  return a1[16];
}

- (BOOL)isImageLoadingEnabled
{
  return self->_imageLoadingEnabled;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (NSArray)currentlyDisplayedTimes
{
  return self->_currentlyDisplayedTimes;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)scrubbingPhotoTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (BOOL)isLivePhotoPlaybackAllowed
{
  return self->_isLivePhotoPlaybackAllowed;
}

- (BOOL)isLivePhotoLoadingAllowed
{
  return self->_livePhotoLoadingAllowed;
}

- (int64_t)loadingTarget
{
  return self->_loadingTarget;
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (void)setPlayerItemChangeHandler:(id)a3
{
}

- (id)playerItemChangeHandler
{
  return self->playerItemChangeHandler;
}

- (void)setStatusChangeHandler:(id)a3
{
}

- (id)statusChangeHandler
{
  return self->statusChangeHandler;
}

- (void)setDurationChangeHandler:(id)a3
{
}

- (id)durationChangeHandler
{
  return self->durationChangeHandler;
}

- (id)playerItem
{
  v2 = [(PUBrowsingIrisPlayer *)self videoPlayer];
  v3 = [v2 currentItem];

  return v3;
}

- (int64_t)playerStatus
{
  v2 = [(PUBrowsingIrisPlayer *)self videoPlayer];
  int64_t v3 = [v2 status];

  return v3;
}

- (void)removeTimeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PUBrowsingIrisPlayer *)self videoPlayer];
  [v5 removeTimeObserver:v4];
}

- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [(PUBrowsingIrisPlayer *)self videoPlayer];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a3;
  v11 = [v10 addPeriodicTimeObserverForInterval:&v13 queue:v9 usingBlock:v8];

  return v11;
}

- (float)playRate
{
  v2 = [(PUBrowsingIrisPlayer *)self videoPlayer];
  [v2 rate];
  float v4 = v3;

  return v4;
}

- (void)cancelPendingSeeks
{
  id v3 = [(PUBrowsingIrisPlayer *)self videoPlayer];
  v2 = [v3 currentItem];
  [v2 cancelPendingSeeks];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playerCurrentTime
{
  float v4 = [(PUBrowsingIrisPlayer *)self videoPlayer];
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  if (v4)
  {
    id v6 = v4;
    [v4 currentTime];
    float v4 = v6;
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentItemDuration
{
  float v4 = [(PUBrowsingIrisPlayer *)self videoPlayer];
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  if (v4)
  {
    id v6 = v4;
    [v4 currentItemDuration];
    float v4 = v6;
  }

  return result;
}

- (void)videoScrubberController:(id)a3 seekToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6 completionHandler:(id)a7
{
  id v9 = a7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __108__PUBrowsingIrisPlayer_videoScrubberController_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke;
  v11[3] = &unk_1E5F23F78;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a4;
  v11[4] = self;
  id v12 = v9;
  id v10 = v9;
  [(PUViewModel *)self performChanges:v11];
}

uint64_t __108__PUBrowsingIrisPlayer_videoScrubberController_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  return [v2 setScrubbingPhotoTime:&v4 completion:v1];
}

- (void)playerWillRelinquishVideoPlayer:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLVideoPlaybackGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "%@ checking in player %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [MEMORY[0x1E4F908C0] sharedInstance];
  [v6 checkInReusableWrappedPlayer:v4];
}

- (id)wrappedVideoPlayerForPlayer:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F908C0], "sharedInstance", a3);
  uint64_t v5 = [v4 checkOutReusableWrappedPlayer];

  id v6 = PLVideoPlaybackGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    __int16 v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEBUG, "%@ checking out player %@", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v8 = a3;
  if ((void *)PULivePhotoPlayerObservationContext == a5)
  {
    if ((v6 & 8) != 0) {
      [(PUBrowsingIrisPlayer *)self _handlePlaybackStyleChanged];
    }
    if ((v6 & 4) != 0)
    {
      v15 = [(PUBrowsingIrisPlayer *)self player];
      v16 = [v15 videoPlayer];
      [(PUBrowsingIrisPlayer *)self setVideoPlayer:v16];
    }
  }
  else if ((void *)PUISWrappedAVPlayerObservationContext == a5)
  {
    if (v6)
    {
      __int16 v9 = [(PUBrowsingIrisPlayer *)self statusChangeHandler];

      if (v9)
      {
        __int16 v10 = [(PUBrowsingIrisPlayer *)self statusChangeHandler];
        v10[2]();
      }
    }
    if ((v6 & 4) != 0)
    {
      uint64_t v11 = [(PUBrowsingIrisPlayer *)self playerItemChangeHandler];

      if (v11)
      {
        uint64_t v12 = [(PUBrowsingIrisPlayer *)self playerItemChangeHandler];
        v12[2]();
      }
      px_dispatch_on_main_queue();
    }
    if ((v6 & 0x200) != 0)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = [(PUBrowsingIrisPlayer *)self durationChangeHandler];

      if (v13)
      {
        v14 = [(PUBrowsingIrisPlayer *)self durationChangeHandler];
        v14[2]();
      }
    }
  }
}

uint64_t __53__PUBrowsingIrisPlayer_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVitalityTransform];
}

- (id)debugDetailedDescription
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(PUBrowsingIrisPlayer *)self mediaProvider];
  [v3 appendFormat:@"Media Provider: %@\n", v4];

  objc_msgSend(v3, "appendFormat:", @"Loading Target: %ld\n", -[PUBrowsingIrisPlayer loadingTarget](self, "loadingTarget"));
  if ([(PUBrowsingIrisPlayer *)self isLivePhotoLoadingAllowed]) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  __int16 v6 = v5;
  [v3 appendFormat:@"isLivePhotoLoadingAllowed: %@\n", v6];

  int v7 = [(PUBrowsingIrisPlayer *)self livePhotoLoadingDisablingReasons];
  [v3 appendFormat:@"livePhotoLoadingDisablingReasons: %@\n", v7];

  if ([(PUBrowsingIrisPlayer *)self isLivePhotoPlaybackAllowed]) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  __int16 v9 = v8;
  [v3 appendFormat:@"isLivePhotoPlaybackAllowed: %@\n", v9];

  __int16 v10 = [(PUBrowsingIrisPlayer *)self livePhotoPlaybackDisablingReasons];
  [v3 appendFormat:@"livePhotoPlaybackDisablingReasons: %@\n", v10];

  uint64_t v11 = [(PUBrowsingIrisPlayer *)self player];
  [v3 appendFormat:@"Iris Player: %@\n", v11];

  uint64_t v12 = NSString;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v15 = objc_msgSend(v3, "pu_stringByIndentingNewLines");
  v16 = [v12 stringWithFormat:@"<%@ %p> {\n\t%@}", v14, self, v15];

  return v16;
}

- (void)_handlePlaybackStyleChanged
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__PUBrowsingIrisPlayer__handlePlaybackStyleChanged__block_invoke;
  v2[3] = &unk_1E5F2ED10;
  v2[4] = self;
  [(PUViewModel *)self performChanges:v2];
}

uint64_t __51__PUBrowsingIrisPlayer__handlePlaybackStyleChanged__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentChange];
  [v2 setPlaybackStateDidChange:1];

  id v3 = [*(id *)(a1 + 32) player];
  uint64_t v4 = [v3 currentPlaybackStyle];

  if (v4)
  {
    uint64_t v5 = +[PUOneUpSettings sharedInstance];
    int v6 = [v5 livePhotoScrubberShowForPlayback];

    if (v6) {
      [*(id *)(a1 + 32) setActivated:1];
    }
  }
  int v7 = *(void **)(a1 + 32);
  return [v7 _invalidatePlaying];
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    id v3 = [(PUBrowsingIrisPlayer *)self currentChange];
    [v3 setPlayingDidChange:1];
  }
}

- (void)_updatePlayingIfNeeded
{
  if (!self->_isValid.playing)
  {
    self->_isValid.playing = 1;
    id v3 = [(PUBrowsingIrisPlayer *)self player];
    -[PUBrowsingIrisPlayer setPlaying:](self, "setPlaying:", (unint64_t)([v3 currentPlaybackStyle] - 1) < 2);
  }
}

- (void)_invalidatePlaying
{
  self->_isValid.playing = 0;
}

- (void)_handlePeriodicObserverWithTime:(id *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PUBrowsingIrisPlayer__handlePeriodicObserverWithTime___block_invoke;
  v3[3] = &unk_1E5F2D670;
  v3[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(PUViewModel *)self performChanges:v3];
}

void __56__PUBrowsingIrisPlayer__handlePeriodicObserverWithTime___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) player];
  if ([v2 currentPlaybackStyle])
  {
    id v3 = [*(id *)(a1 + 32) player];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = [v3 videoPlayer];
    [v4 rate];
    float v6 = v5;

    if (v6 != 0.0)
    {
      CMTime v10 = *(CMTime *)(a1 + 40);
      int v7 = [NSNumber numberWithDouble:CMTimeGetSeconds(&v10)];
      v11[0] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [*(id *)(a1 + 32) setCurrentlyDisplayedTimes:v8];

      return;
    }
  }
  else
  {
  }
  __int16 v9 = *(void **)(a1 + 32);
  [v9 setCurrentlyDisplayedTimes:0];
}

- (void)setVideoPlayer:(id)a3
{
  float v5 = (ISWrappedAVPlayer *)a3;
  p_videoPlayer = &self->_videoPlayer;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    [(ISWrappedAVPlayer *)videoPlayer unregisterChangeObserver:self context:PUISWrappedAVPlayerObservationContext];
    [(ISWrappedAVPlayer *)*p_videoPlayer removeTimeObserver:self->_videoPeriodicObserver];
    id videoPeriodicObserver = self->_videoPeriodicObserver;
    self->_id videoPeriodicObserver = 0;

    objc_storeStrong((id *)&self->_videoPlayer, a3);
    [(ISWrappedAVPlayer *)*p_videoPlayer registerChangeObserver:self context:PUISWrappedAVPlayerObservationContext];
    objc_initWeak(&location, self);
    __int16 v9 = *p_videoPlayer;
    CMTimeMake(&v16, 1, 30);
    uint64_t v10 = MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __39__PUBrowsingIrisPlayer_setVideoPlayer___block_invoke;
    v14[3] = &unk_1E5F2B040;
    objc_copyWeak(&v15, &location);
    uint64_t v12 = [(ISWrappedAVPlayer *)v9 addPeriodicTimeObserverForInterval:&v16 queue:v10 usingBlock:v14];
    id v13 = self->_videoPeriodicObserver;
    self->_id videoPeriodicObserver = v12;

    [(PUBrowsingIrisPlayer *)self _updateVitalityTransform];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __39__PUBrowsingIrisPlayer_setVideoPlayer___block_invoke(uint64_t a1, long long *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v4 = *a2;
  uint64_t v5 = *((void *)a2 + 2);
  [WeakRetained _handlePeriodicObserverWithTime:&v4];
}

- (void)_updatePlayerItemScrubbingPhotoTimeIfNeeded
{
  if (!self->_isValid.playerItemScrubbingPhotoTime)
  {
    self->_isValid.playerItemScrubbingPhotoTime = 1;
    id v3 = [(PUBrowsingIrisPlayer *)self player];
    [(PUBrowsingIrisPlayer *)self scrubbingPhotoTime];
    long long v4 = [(PUBrowsingIrisPlayer *)self seekCompletionHandler];
    [v3 setSeekTime:v5 completion:v4];
  }
}

- (void)_invalidatePlayerItemScrubbingPhotoTime
{
  self->_isValid.playerItemScrubbingPhotoTime = 0;
}

- (void)_updatePlayerItemLoadingTargetIfNeeded
{
  if (!self->_isValid.playerLoadingTarget)
  {
    self->_isValid.playerLoadingTarget = 1;
    id v4 = [(PUBrowsingIrisPlayer *)self _playerCreateIfNeeded:0];
    id v3 = [v4 playerItem];
    objc_msgSend(v3, "setLoadingTarget:", -[PUBrowsingIrisPlayer loadingTarget](self, "loadingTarget"));
  }
}

- (void)_invalidatePlayerItemLoadingTarget
{
  self->_isValid.playerLoadingTarget = 0;
}

- (void)setVitalityTransform:(float32x4_t)a3 limitingAllowed:(float32x4_t)a4
{
  uint32x4_t v6 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a3, a1[17]), (int8x16_t)vceqq_f32(a2, a1[16])), (int8x16_t)vceqq_f32(a4, a1[18]));
  v6.i32[3] = v6.i32[2];
  if ((vminvq_u32(v6) & 0x80000000) == 0 || a1[5].u8[13] != a6)
  {
    a1[5].i8[13] = a6;
    a1[16] = a2;
    a1[17] = a3;
    a1[18] = a4;
    id v7 = [(float32x4_t *)a1 currentChange];
    [v7 setVitalityTransformDidChange:1];
  }
}

- (void)_handleLoadedVitalityTransform:(__n128)a3 limitingAllowed:(__n128)a4 forAsset:(uint64_t)a5
{
  id v9 = a7;
  uint64_t v10 = [a1 _playerCreateIfNeeded:0];
  id v11 = [v10 playerItem];
  uint64_t v12 = [v11 asset];
  id v13 = [v12 videoAsset];

  if (v13 == v9)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__PUBrowsingIrisPlayer__handleLoadedVitalityTransform_limitingAllowed_forAsset___block_invoke;
    v17[3] = &unk_1E5F23F50;
    v21 = a1;
    __n128 v18 = a2;
    __n128 v19 = a3;
    __n128 v20 = a4;
    char v22 = a6;
    [a1 performChanges:v17];
  }
}

uint64_t __80__PUBrowsingIrisPlayer__handleLoadedVitalityTransform_limitingAllowed_forAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 80), "setVitalityTransform:limitingAllowed:", *(unsigned __int8 *)(a1 + 88), *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));
}

- (void)_updateVitalityTransform
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__PUBrowsingIrisPlayer__updateVitalityTransform__block_invoke;
  v2[3] = &unk_1E5F2ED10;
  v2[4] = self;
  [(PUViewModel *)self performChanges:v2];
}

void __48__PUBrowsingIrisPlayer__updateVitalityTransform__block_invoke(uint64_t a1)
{
  v2 = +[PUOneUpSettings sharedInstance];
  int v3 = [v2 applyPerspectiveTransformDuringVitality];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v4 _playerCreateIfNeeded:0];
    uint32x4_t v6 = [v5 playerItem];
    id v7 = [v6 asset];
    id v8 = [v7 videoAsset];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) asset];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(v9, "pu_vitalityPerspectiveTransform");
        *(void *)&long long v17 = v11;
        *(void *)&long long v18 = v10;
        *(void *)&long long v16 = v12;
      }
      else
      {
        long long v17 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
        long long v18 = *MEMORY[0x1E4F14998];
        long long v16 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
      }
      objc_initWeak(&location, *(id *)(a1 + 32));
      objc_initWeak(&from, v8);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __48__PUBrowsingIrisPlayer__updateVitalityTransform__block_invoke_2;
      v19[3] = &unk_1E5F23F28;
      objc_copyWeak(&v20, &location);
      objc_copyWeak(&v21, &from);
      objc_msgSend(v8, "pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform:completion:", v19, *(double *)&v18, *(double *)&v17, *(double *)&v16);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setVitalityTransform:limitingAllowed:", 0, *MEMORY[0x1E4F14998], *(double *)(MEMORY[0x1E4F14998] + 16), *(double *)(MEMORY[0x1E4F14998] + 32));
    }
  }
  else
  {
    long long v13 = *MEMORY[0x1E4F14998];
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
    objc_msgSend(v4, "setVitalityTransform:limitingAllowed:", 0, *(double *)&v13, *(double *)&v14, *(double *)&v15);
  }
}

void __48__PUBrowsingIrisPlayer__updateVitalityTransform__block_invoke_2(uint64_t a1, char a2, __n128 a3, __n128 a4, __n128 a5)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PUBrowsingIrisPlayer__updateVitalityTransform__block_invoke_3;
  block[3] = &unk_1E5F23F00;
  objc_copyWeak(&v14, (id *)(a1 + 32));
  __n128 v11 = a3;
  __n128 v12 = a4;
  __n128 v13 = a5;
  char v16 = a2;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
}

void __48__PUBrowsingIrisPlayer__updateVitalityTransform__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v2 = *(unsigned __int8 *)(a1 + 96);
  id v3 = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "_handleLoadedVitalityTransform:limitingAllowed:forAsset:", v2, v3, *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));
}

- (void)_updatePlayerContentIfNeeded
{
  if (!self->_isValid.playerContent)
  {
    self->_isValid.playerContent = 1;
    id v3 = [(PUBrowsingIrisPlayer *)self livePhoto];
    id v4 = [(PUBrowsingIrisPlayer *)self _playerCreateIfNeeded:0];
    uint64_t v5 = [v3 videoAsset];
    if (v3)
    {
      uint32x4_t v6 = [v3 image];
      [v6 imageOrientation];
      uint64_t v7 = PLExifOrientationFromImageOrientation();
      [v3 photoTime];
      double Seconds = 0.0;
      if ((v19 & 0x1D) == 1)
      {
        [v3 photoTime];
        double Seconds = CMTimeGetSeconds(&v18);
      }
      uint64_t v9 = [v3 hasPhotoColorAdjustments];
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F8EB98]) initWithVideoAsset:v5 UIImage:v6 photoTime:v7 photoEXIFOrientation:v9 options:Seconds];
      __n128 v11 = [(PUBrowsingIrisPlayer *)self asset];
      [v11 aspectRatio];
      double v13 = v12;

      if (v13 <= 0.0)
      {
        id v14 = 0;
      }
      else
      {
        id v14 = [NSNumber numberWithDouble:v13];
      }
      char v16 = (void *)MEMORY[0x1E4F8EBB0];
      [(PUBrowsingIrisPlayer *)self _targetSize];
      id v15 = objc_msgSend(v16, "playerItemWithAsset:targetSize:contentAspectRatio:", v10, v14);
      [(PUBrowsingIrisPlayer *)self _invalidatePlayerItemScrubbingPhotoTime];
      [(PUBrowsingIrisPlayer *)self _invalidatePlayerItemLoadingTarget];

      if (v15)
      {
        uint64_t v17 = [(PUBrowsingIrisPlayer *)self _playerCreateIfNeeded:1];

        id v4 = (void *)v17;
      }
    }
    else
    {
      id v15 = 0;
    }
    [v4 setPlayerItem:v15];
  }
}

- (void)_invalidatePlayerContent
{
  self->_isValid.playerContent = 0;
}

- (void)_updateLivePhotoIfNeeded
{
  if (!self->_isValid.livePhoto)
  {
    self->_isValid.livePhoto = 1;
    if ([(PUBrowsingIrisPlayer *)self isLivePhotoLoadingAllowed])
    {
      id v3 = [(PUBrowsingIrisPlayer *)self asset];
      int v4 = [v3 canPlayPhotoIris];

      if (v4)
      {
        if ([(PUBrowsingIrisPlayer *)self livePhotoRequestState] != 2) {
          [(PUBrowsingIrisPlayer *)self setLivePhotoRequestState:1];
        }
        uint64_t v5 = [(PUBrowsingIrisPlayer *)self mediaProvider];
        uint32x4_t v6 = [(PUBrowsingIrisPlayer *)self asset];
        objc_initWeak(&location, self);
        uint64_t v16 = 0;
        uint64_t v17 = &v16;
        uint64_t v18 = 0x2020000000;
        int v19 = 0;
        [(PUBrowsingIrisPlayer *)self setLivePhotoRequestID:0];
        [(PUBrowsingIrisPlayer *)self _targetSize];
        double v8 = v7;
        double v10 = v9;
        int64_t v11 = [(PUBrowsingIrisPlayer *)self _contentMode];
        id v12 = objc_alloc_init(MEMORY[0x1E4F39148]);
        [v12 setNetworkAccessAllowed:1];
        [v12 setDeliveryMode:1];
        objc_msgSend(v12, "setIncludeImage:", -[PUBrowsingIrisPlayer isImageLoadingEnabled](self, "isImageLoadingEnabled"));
        [v12 setDownloadIntent:3];
        [v12 setDownloadPriority:0];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __48__PUBrowsingIrisPlayer__updateLivePhotoIfNeeded__block_invoke;
        v14[3] = &unk_1E5F23ED8;
        objc_copyWeak(&v15, &location);
        void v14[4] = &v16;
        uint64_t v13 = objc_msgSend(v5, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v6, v11, v12, v14, v8, v10);
        *((_DWORD *)v17 + 6) = v13;
        [(PUBrowsingIrisPlayer *)self setLivePhotoRequestID:v13];
        objc_destroyWeak(&v15);

        _Block_object_dispose(&v16, 8);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __48__PUBrowsingIrisPlayer__updateLivePhotoIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = v5;
  id v8 = v6;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __48__PUBrowsingIrisPlayer__updateLivePhotoIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleLivePhotoResult:*(void *)(a1 + 32) info:*(void *)(a1 + 40) requestID:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
}

- (void)_invalidateLivePhoto
{
  self->_isValid.livePhoto = 0;
}

- (void)unloadLivePhoto
{
  [(PUBrowsingIrisPlayer *)self _invalidateLivePhoto];
  [(PUBrowsingIrisPlayer *)self setLivePhoto:0];
}

- (void)_updateIfNeeded
{
  if ([(PUBrowsingIrisPlayer *)self _needsUpdate])
  {
    [(PUBrowsingIrisPlayer *)self _updateLivePhotoIfNeeded];
    [(PUBrowsingIrisPlayer *)self _updatePlayerContentIfNeeded];
    [(PUBrowsingIrisPlayer *)self _updatePlayerItemScrubbingPhotoTimeIfNeeded];
    [(PUBrowsingIrisPlayer *)self _updatePlayerItemLoadingTargetIfNeeded];
    [(PUBrowsingIrisPlayer *)self _updatePlayingIfNeeded];
    if ([(PUBrowsingIrisPlayer *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2, self, @"PUBrowsingIrisPlayer.m", 435, @"[%@] Update still needed after update pass", self object file lineNumber description];
    }
  }
}

- (BOOL)_needsUpdate
{
  return !self->_isValid.livePhoto
      || !self->_isValid.playerContent
      || !self->_isValid.playerLoadingTarget
      || !self->_isValid.playerItemScrubbingPhotoTime
      || !self->_isValid.playing;
}

- (BOOL)isContentLoadingRequestInProgress
{
  int64_t v3 = [(PUBrowsingIrisPlayer *)self livePhotoRequestState];
  if (v3 != 1) {
    LOBYTE(v3) = [(PUBrowsingIrisPlayer *)self livePhotoRequestState] == 2;
  }
  return v3;
}

- (void)_cancelAllRequests
{
  id v3 = [(PUBrowsingIrisPlayer *)self mediaProvider];
  objc_msgSend(v3, "cancelImageRequest:", -[PUBrowsingIrisPlayer livePhotoRequestID](self, "livePhotoRequestID"));
}

- (void)_handleLivePhotoResult:(id)a3 info:(id)a4 requestID:(int)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(PUBrowsingIrisPlayer *)self livePhotoRequestID] == a5)
  {
    double v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    int64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
    int v12 = [v11 BOOLValue];

    uint64_t v13 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
    char v14 = [v13 BOOLValue];

    if (v12)
    {
      id v15 = self;
      uint64_t v16 = 4;
LABEL_4:
      [(PUBrowsingIrisPlayer *)v15 setLivePhotoRequestState:v16];
LABEL_18:

      goto LABEL_19;
    }
    char v17 = v14 ^ 1;
    if (!v8) {
      char v17 = 1;
    }
    if ((v17 & 1) == 0)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __62__PUBrowsingIrisPlayer__handleLivePhotoResult_info_requestID___block_invoke;
      v26[3] = &unk_1E5F2ECC8;
      v26[4] = self;
      id v27 = v8;
      [(PUViewModel *)self performChanges:v26];
      uint64_t v18 = v27;
LABEL_17:

      goto LABEL_18;
    }
    if (v8 || !v10)
    {
      if (v8)
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __62__PUBrowsingIrisPlayer__handleLivePhotoResult_info_requestID___block_invoke_2;
        v23[3] = &unk_1E5F2ECC8;
        v23[4] = self;
        id v24 = v8;
        [(PUViewModel *)self performChanges:v23];
        [(PUBrowsingIrisPlayer *)self setLivePhotoRequestState:5];
        uint64_t v18 = v24;
        goto LABEL_17;
      }
    }
    else if ([(PUBrowsingIrisPlayer *)self livePhotoRequestState] == 1)
    {
      int v19 = PLOneUpGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v20 = [(PUBrowsingIrisPlayer *)self asset];
        *(_DWORD *)buf = 138412802;
        v29 = self;
        __int16 v30 = 2112;
        v31 = v20;
        __int16 v32 = 2112;
        id v33 = v9;
        _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_DEBUG, "%@ Failed to load live photo for Iris asset %@: %@, will retry...", buf, 0x20u);
      }
      [(PUBrowsingIrisPlayer *)self setLivePhotoRequestState:2];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __62__PUBrowsingIrisPlayer__handleLivePhotoResult_info_requestID___block_invoke_58;
      v25[3] = &unk_1E5F2ED10;
      v25[4] = self;
      [(PUViewModel *)self performChanges:v25];
      goto LABEL_18;
    }
    id v21 = PLOneUpGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      char v22 = [(PUBrowsingIrisPlayer *)self asset];
      *(_DWORD *)buf = 138412802;
      v29 = self;
      __int16 v30 = 2112;
      v31 = v22;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_DEBUG, "%@ Failed to load live photo for Iris asset %@: %@", buf, 0x20u);
    }
    id v15 = self;
    uint64_t v16 = 3;
    goto LABEL_4;
  }
LABEL_19:
}

uint64_t __62__PUBrowsingIrisPlayer__handleLivePhotoResult_info_requestID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLivePhoto:*(void *)(a1 + 40)];
}

uint64_t __62__PUBrowsingIrisPlayer__handleLivePhotoResult_info_requestID___block_invoke_58(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateLivePhoto];
}

uint64_t __62__PUBrowsingIrisPlayer__handleLivePhotoResult_info_requestID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLivePhoto:*(void *)(a1 + 40)];
}

- (int64_t)_contentMode
{
  return 0;
}

- (CGSize)_targetSize
{
  uint64_t v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  double v7 = v4 * *(double *)&PUMainScreenScale_screenScale;
  double v8 = v6 * *(double *)&PUMainScreenScale_screenScale;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)playerCreateIfNeeded
{
  return [(PUBrowsingIrisPlayer *)self _playerCreateIfNeeded:1];
}

- (ISLivePhotoPlayer)player
{
  return (ISLivePhotoPlayer *)[(PUBrowsingIrisPlayer *)self _playerCreateIfNeeded:0];
}

- (id)_playerCreateIfNeeded:(BOOL)a3
{
  player = self->_player;
  if (player) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    double v6 = (ISLivePhotoPlayer *)objc_alloc_init(MEMORY[0x1E4F8EBA0]);
    double v7 = self->_player;
    self->_player = v6;

    [(ISLivePhotoPlayer *)self->_player registerChangeObserver:self context:PULivePhotoPlayerObservationContext];
    [(ISLivePhotoPlayer *)self->_player setAudioEnabled:0];
    [(ISLivePhotoPlayer *)self->_player setDelegate:self];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__PUBrowsingIrisPlayer__playerCreateIfNeeded___block_invoke;
    v9[3] = &unk_1E5F2ED10;
    v9[4] = self;
    [(PUViewModel *)self performChanges:v9];
    player = self->_player;
  }
  return player;
}

void __46__PUBrowsingIrisPlayer__playerCreateIfNeeded___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) currentChange];
  [v1 setPlayerDidChange:1];
}

- (void)setLoadingTarget:(int64_t)a3
{
  if (self->_loadingTarget != a3)
  {
    self->_loadingTarget = a3;
    [(PUBrowsingIrisPlayer *)self _invalidatePlayerItemLoadingTarget];
  }
}

- (void)unregisterChangeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingIrisPlayer;
  [(PUViewModel *)&v3 unregisterChangeObserver:a3];
}

- (void)registerChangeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingIrisPlayer;
  [(PUViewModel *)&v3 registerChangeObserver:a3];
}

- (PUBrowsingIrisPlayerChange)currentChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUBrowsingIrisPlayer;
  uint64_t v2 = [(PUViewModel *)&v4 currentChange];
  return (PUBrowsingIrisPlayerChange *)v2;
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUBrowsingIrisPlayerChange);
}

- (void)setLivePhoto:(id)a3
{
  BOOL v5 = (PHLivePhoto *)a3;
  if (self->_livePhoto != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_livePhoto, a3);
    double v6 = [(PUBrowsingIrisPlayer *)self currentChange];
    [v6 setLivePhotoDidChange:1];

    [(PUBrowsingIrisPlayer *)self _invalidatePlayerContent];
    BOOL v5 = v7;
  }
}

- (void)setImageLoadingEnabled:(BOOL)a3
{
  if (self->_imageLoadingEnabled != a3)
  {
    self->_imageLoadingEnabled = a3;
    [(PUBrowsingIrisPlayer *)self _invalidateLivePhoto];
    id v4 = [(PUBrowsingIrisPlayer *)self currentChange];
    [v4 setImageLoadingEnabledDidChange:1];
  }
}

- (void)setActivated:(BOOL)a3
{
  if (self->_activated != a3)
  {
    self->_activated = a3;
    if (!a3)
    {
      id v4 = [(PUBrowsingIrisPlayer *)self player];
      [v4 stopPlaybackAnimated:1];

      long long v6 = *MEMORY[0x1E4F1F9F8];
      uint64_t v7 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      [(PUBrowsingIrisPlayer *)self setScrubbingPhotoTime:&v6 completion:0];
    }
    BOOL v5 = [(PUBrowsingIrisPlayer *)self currentChange];
    [v5 setActivatedDidChange:1];
  }
}

- (void)setLivePhotoLoadingAllowed:(BOOL)a3
{
  if (self->_livePhotoLoadingAllowed != a3)
  {
    BOOL v3 = a3;
    self->_livePhotoLoadingAllowed = a3;
    BOOL v5 = [(PUBrowsingIrisPlayer *)self currentChange];
    [v5 setIsLivePhotoLoadingAllowedDidChange:1];

    long long v6 = [(PUBrowsingIrisPlayer *)self livePhoto];
    if (v6 || !v3)
    {
    }
    else if (![(PUBrowsingIrisPlayer *)self isContentLoadingRequestInProgress])
    {
      [(PUBrowsingIrisPlayer *)self _invalidateLivePhoto];
    }
  }
}

- (void)setLivePhotoLoadingDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  if (!v10)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUBrowsingIrisPlayer.m", 239, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  uint64_t v7 = [(PUBrowsingIrisPlayer *)self livePhotoLoadingDisablingReasons];
  double v8 = v7;
  if (v4) {
    [v7 addObject:v10];
  }
  else {
    [v7 removeObject:v10];
  }
  -[PUBrowsingIrisPlayer setLivePhotoLoadingAllowed:](self, "setLivePhotoLoadingAllowed:", [v8 count] == 0);
}

- (void)setCurrentlyDisplayedTimes:(id)a3
{
  BOOL v4 = (NSArray *)a3;
  BOOL v5 = v4;
  if (self->_currentlyDisplayedTimes != v4)
  {
    id v10 = v4;
    char v6 = -[NSArray isEqual:](v4, "isEqual:");
    BOOL v5 = v10;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (NSArray *)[(NSArray *)v10 copy];
      currentlyDisplayedTimes = self->_currentlyDisplayedTimes;
      self->_currentlyDisplayedTimes = v7;

      id v9 = [(PUBrowsingIrisPlayer *)self currentChange];
      [v9 setCurrentlyDisplayedTimesDidChange:1];

      BOOL v5 = v10;
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentVideoDuration
{
  BOOL v4 = [(PUBrowsingIrisPlayer *)self videoPlayer];
  if (v4)
  {
    char v6 = v4;
    [v4 currentItemDuration];
    BOOL v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPhotoTime
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  CGSize result = [(PUBrowsingIrisPlayer *)self scrubbingPhotoTime];
  if ((retstr->var2 & 1) == 0)
  {
    char v6 = [(PUBrowsingIrisPlayer *)self player];
    uint64_t v7 = [v6 playerItem];
    double v8 = [v7 asset];
    id v9 = v8;
    if (v8)
    {
      [v8 photoCMTime];
    }
    else
    {
      long long v10 = 0uLL;
      int64_t v11 = 0;
    }
    *(_OWORD *)&retstr->var0 = v10;
    retstr->var3 = v11;
  }
  return result;
}

- (void)setScrubbingPhotoTime:(id *)a3 completion:(id)a4
{
  id v6 = a4;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 scrubbingPhotoTime = self->_scrubbingPhotoTime;
  if (CMTimeCompare(&time1, (CMTime *)&scrubbingPhotoTime))
  {
    [(PUBrowsingIrisPlayer *)self setSeekCompletionHandler:v6];
    long long v7 = *(_OWORD *)&a3->var0;
    self->_scrubbingPhotoTime.epoch = a3->var3;
    *(_OWORD *)&self->_scrubbingPhotoTime.value = v7;
    [(PUBrowsingIrisPlayer *)self _invalidatePlayerItemScrubbingPhotoTime];
    double v8 = [(PUBrowsingIrisPlayer *)self currentChange];
    [v8 setScrubbingPhotoTimeDidChange:1];
  }
}

- (void)setIsLivePhotoPlaybackAllowed:(BOOL)a3
{
  if (self->_isLivePhotoPlaybackAllowed != a3)
  {
    BOOL v3 = a3;
    self->_isLivePhotoPlaybackAllowed = a3;
    BOOL v5 = [(PUBrowsingIrisPlayer *)self currentChange];
    [v5 setIsLivePhotoPlaybackAllowedDidChange:1];

    id v6 = [(PUBrowsingIrisPlayer *)self _playerCreateIfNeeded:0];
    [v6 setPlaybackAllowed:v3];
  }
}

- (void)setLivePhotoPlaybackDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  if (!v10)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUBrowsingIrisPlayer.m", 181, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  long long v7 = [(PUBrowsingIrisPlayer *)self livePhotoPlaybackDisablingReasons];
  double v8 = v7;
  if (v4) {
    [v7 addObject:v10];
  }
  else {
    [v7 removeObject:v10];
  }
  -[PUBrowsingIrisPlayer setIsLivePhotoPlaybackAllowed:](self, "setIsLivePhotoPlaybackAllowed:", [v8 count] == 0);
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingIrisPlayer;
  [(PUViewModel *)&v3 didPerformChanges];
  [(PUBrowsingIrisPlayer *)self _updateIfNeeded];
}

- (void)playPreviewHintWhenReady
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__PUBrowsingIrisPlayer_playPreviewHintWhenReady__block_invoke;
  v2[3] = &unk_1E5F2ED10;
  v2[4] = self;
  [(PUViewModel *)self performChanges:v2];
}

void __48__PUBrowsingIrisPlayer_playPreviewHintWhenReady__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playerCreateIfNeeded];
  [*(id *)(a1 + 32) setActivated:1];
  [v2 playHintWhenReady];
}

- (void)setAsset:(id)a3
{
  BOOL v5 = (PUDisplayAsset *)a3;
  p_asset = &self->_asset;
  if (self->_asset != v5)
  {
    long long v7 = [(PUBrowsingIrisPlayer *)self _playerCreateIfNeeded:0];
    if (v5 && [(PUDisplayAsset *)*p_asset isPhotoIrisPlaceholder]) {
      int v8 = [(PUDisplayAsset *)v5 isPhotoIrisPlaceholder] ^ 1;
    }
    else {
      int v8 = 0;
    }
    id v9 = *p_asset;
    id v10 = v5;
    int64_t v11 = v9;
    if (v11 == v10)
    {
      BOOL v13 = 0;
    }
    else
    {
      uint64_t v12 = [(PUDisplayAsset *)v10 isContentEqualTo:v11];
      if (!v12) {
        uint64_t v12 = [(PUDisplayAsset *)v11 isContentEqualTo:v10];
      }
      BOOL v13 = v12 != 2;
    }

    objc_storeStrong((id *)&self->_asset, a3);
    char v14 = [(PUBrowsingIrisPlayer *)self currentChange];
    [v14 setHasChanges];

    if (v8)
    {
      if ([(PUBrowsingIrisPlayer *)self livePhotoRequestState] != 5) {
        goto LABEL_20;
      }
      if (v7)
      {
        char v15 = [v7 status] != 2 || v13;
        if ((v15 & 1) == 0) {
          goto LABEL_22;
        }
        goto LABEL_20;
      }
    }
    if (!v13)
    {
LABEL_22:

      goto LABEL_23;
    }
LABEL_20:
    if (![v7 currentPlaybackStyle])
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __33__PUBrowsingIrisPlayer_setAsset___block_invoke;
      v16[3] = &unk_1E5F2ED10;
      v16[4] = self;
      [(PUViewModel *)self performChanges:v16];
    }
    goto LABEL_22;
  }
LABEL_23:
}

uint64_t __33__PUBrowsingIrisPlayer_setAsset___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setActivated:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 unloadLivePhoto];
}

- (void)dealloc
{
  if (self->_videoPeriodicObserver) {
    -[ISWrappedAVPlayer removeTimeObserver:](self->_videoPlayer, "removeTimeObserver:");
  }
  [(PUBrowsingIrisPlayer *)self _cancelAllRequests];
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingIrisPlayer;
  [(PUBrowsingIrisPlayer *)&v3 dealloc];
}

- (PUBrowsingIrisPlayer)initWithAsset:(id)a3 mediaProvider:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PUBrowsingIrisPlayer;
  id v10 = [(PUViewModel *)&v20 init];
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        objc_storeStrong((id *)&v10->_asset, a3);
        objc_storeStrong((id *)&v10->_mediaProvider, a4);
        v10->_loadingTarget = 0;
        int64_t v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        livePhotoLoadingDisablingReasons = v10->_livePhotoLoadingDisablingReasons;
        v10->_livePhotoLoadingDisablingReasons = v11;

        BOOL v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        livePhotoPlaybackDisablingReasons = v10->_livePhotoPlaybackDisablingReasons;
        v10->_livePhotoPlaybackDisablingReasons = v13;

        uint64_t v15 = MEMORY[0x1E4F14998];
        long long v16 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
        *(_OWORD *)&v10[1].super.super.isa = *MEMORY[0x1E4F14998];
        *(_OWORD *)&v10[1].super._nestedChanges = v16;
        *(_OWORD *)&v10[1].super._numAppliedPendingChanges = *(_OWORD *)(v15 + 32);
        v10->_imageLoadingEnabled = 1;
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v10, @"PUBrowsingIrisPlayer.m", 109, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];

      if (v9) {
        goto LABEL_4;
      }
    }
    int v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, v10, @"PUBrowsingIrisPlayer.m", 110, @"Invalid parameter not satisfying: %@", @"mediaProvider != nil" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

- (PUBrowsingIrisPlayer)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUBrowsingIrisPlayer.m", 99, @"%s is not available as initializer", "-[PUBrowsingIrisPlayer init]");

  abort();
}

+ (PUBrowsingIrisPlayer)new
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PUBrowsingIrisPlayer.m", 103, @"%s is not available as initializer", "+[PUBrowsingIrisPlayer new]");

  abort();
}

@end