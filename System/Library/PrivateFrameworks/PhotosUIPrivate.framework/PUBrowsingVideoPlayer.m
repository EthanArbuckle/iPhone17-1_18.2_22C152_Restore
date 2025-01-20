@interface PUBrowsingVideoPlayer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)desiredSeekTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackStartTime;
- (AVPlayerItem)playerItem;
- (BOOL)_isUpdatingAudioSession;
- (BOOL)isActivated;
- (BOOL)isAtBeginning;
- (BOOL)isAtEnd;
- (BOOL)isAutoPlayingVideo;
- (BOOL)isMuted;
- (BOOL)isPlayable;
- (BOOL)isPlaybackDesired;
- (BOOL)isPlayerLoadingAllowed;
- (BOOL)isSeeking;
- (BOOL)isStalled;
- (BOOL)isUserScrubbing;
- (BOOL)loopingEnabledForAllVideos;
- (BOOL)shouldFadeNextVolumeChange;
- (BOOL)shouldLoadVideoSession;
- (BOOL)shouldLoopCurrentVideo;
- (BOOL)shouldPreloadVideoContent;
- (BOOL)shouldRequestNewRender;
- (CGSize)targetSize;
- (ISWrappedAVPlayer)avPlayer;
- (NSError)error;
- (NSHashTable)timeObservers;
- (NSHashTable)videoOutputs;
- (NSMutableSet)_playerLoadingDisablingReasons;
- (NSString)description;
- (PFSlowMotionTimeRangeMapper)timeRangeMapper;
- (PUBrowsingVideoPlayer)init;
- (PUBrowsingVideoPlayer)initWithAsset:(id)a3 mediaProvider:(id)a4;
- (PUBrowsingVideoPlayerChange)currentChange;
- (PUDisplayAsset)asset;
- (PUMediaProvider)mediaProvider;
- (PXVideoSession)videoSession;
- (double)minimumDurationForLooping;
- (float)volume;
- (id)newViewModelChange;
- (int64_t)_videoSessionDesiredPlayState;
- (int64_t)audioStatus;
- (int64_t)desiredPlayState;
- (int64_t)playState;
- (unint64_t)nextPlayerLoadingEnabledUpdateID;
- (void)_handleSeekCompletion:(id)a3 finished:(BOOL)a4;
- (void)_handleShouldReloadAssetMediaNotification:(id)a3;
- (void)_performPendingSeekIfNeeded;
- (void)_requestNewRenderIfNeeded;
- (void)_setAudioStatus:(int64_t)a3;
- (void)_setError:(id)a3;
- (void)_setPlayerItem:(id)a3 timeRangeMapper:(id)a4;
- (void)_setPlayerLoadingAllowed:(BOOL)a3;
- (void)_setPlayerLoadingDisablingReasons:(id)a3;
- (void)_setTargetSize:(CGSize)a3;
- (void)_setUpdatingAudioSession:(BOOL)a3;
- (void)_setVideoSessionVolume:(id)a3;
- (void)_updateMuteState;
- (void)_updatePlayerItem;
- (void)_updatePlayerLoadingAllowedWithUpdateID:(unint64_t)a3;
- (void)_updatePlayerVolume;
- (void)_updateVideoDuration;
- (void)_updateVideoSession;
- (void)_updateVideoSessionDesiredPlayState;
- (void)assetContentDidChange;
- (void)dealloc;
- (void)didPerformChanges;
- (void)invalidateExistingPlayer;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)registerChangeObserver:(id)a3;
- (void)registerTimeObserver:(id)a3;
- (void)registerVideoOutput:(id)a3;
- (void)rewindExistingPlayer;
- (void)seekToTime:(id *)a3 completionHandler:(id)a4;
- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6;
- (void)setActivated:(BOOL)a3;
- (void)setAsset:(id)a3;
- (void)setDesiredPlayState:(int64_t)a3 reason:(id)a4;
- (void)setDesiredSeekTime:(id *)a3;
- (void)setDesiredTargetSize:(CGSize)a3;
- (void)setDuration:(id *)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setIsSeeking:(BOOL)a3;
- (void)setIsUserScrubbing:(BOOL)a3;
- (void)setLoopingEnabledForAllVideos:(BOOL)a3;
- (void)setMinimumDurationForLooping:(double)a3;
- (void)setNextPlayerLoadingEnabledUpdateID:(unint64_t)a3;
- (void)setPlaybackStartTime:(id *)a3;
- (void)setShouldFadeNextVolumeChange:(BOOL)a3;
- (void)setShouldLoadVideoSession:(BOOL)a3;
- (void)setShouldPreloadVideoContent:(BOOL)a3;
- (void)setShouldRequestNewRender:(BOOL)a3;
- (void)setVideoSession:(id)a3;
- (void)setVolume:(float)a3;
- (void)testing_setVideoSession:(id)a3;
- (void)unregisterChangeObserver:(id)a3;
- (void)unregisterTimeObserver:(id)a3;
- (void)unregisterVideoOutput:(id)a3;
- (void)videoSessionAudioSessionOutputVolumeDidChange:(id)a3 fromVolume:(float)a4 toVolume:(float)a5;
- (void)videoSessionDidPlayToEnd:(id)a3;
@end

@implementation PUBrowsingVideoPlayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__playerLoadingDisablingReasons, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_timeRangeMapper, 0);
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_videoOutputs, 0);
  objc_storeStrong((id *)&self->_timeObservers, 0);
  objc_storeStrong(&self->_pendingSeekCompletionHandler, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

- (BOOL)isUserScrubbing
{
  return self->_isUserScrubbing;
}

- (void)setIsSeeking:(BOOL)a3
{
  self->_isSeeking = a3;
}

- (BOOL)isSeeking
{
  return self->_isSeeking;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (void)setShouldRequestNewRender:(BOOL)a3
{
  self->_shouldRequestNewRender = a3;
}

- (BOOL)shouldRequestNewRender
{
  return self->_shouldRequestNewRender;
}

- (void)setShouldFadeNextVolumeChange:(BOOL)a3
{
  self->_shouldFadeNextVolumeChange = a3;
}

- (BOOL)shouldFadeNextVolumeChange
{
  return self->_shouldFadeNextVolumeChange;
}

- (BOOL)shouldLoadVideoSession
{
  return self->_shouldLoadVideoSession;
}

- (void)setNextPlayerLoadingEnabledUpdateID:(unint64_t)a3
{
  self->_nextPlayerLoadingEnabledUpdateID = a3;
}

- (unint64_t)nextPlayerLoadingEnabledUpdateID
{
  return self->_nextPlayerLoadingEnabledUpdateID;
}

- (void)_setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setUpdatingAudioSession:(BOOL)a3
{
  self->__isUpdatingAudioSession = a3;
}

- (BOOL)_isUpdatingAudioSession
{
  return self->__isUpdatingAudioSession;
}

- (void)_setPlayerLoadingDisablingReasons:(id)a3
{
}

- (NSMutableSet)_playerLoadingDisablingReasons
{
  return self->__playerLoadingDisablingReasons;
}

- (BOOL)isPlayerLoadingAllowed
{
  return self->_isPlayerLoadingAllowed;
}

- (NSError)error
{
  return self->_error;
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (BOOL)shouldPreloadVideoContent
{
  return self->_shouldPreloadVideoContent;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)desiredSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 296);
  return self;
}

- (PFSlowMotionTimeRangeMapper)timeRangeMapper
{
  return self->_timeRangeMapper;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 272);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 248);
  return self;
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (void)setMinimumDurationForLooping:(double)a3
{
  self->_minimumDurationForLooping = a3;
}

- (double)minimumDurationForLooping
{
  return self->_minimumDurationForLooping;
}

- (BOOL)loopingEnabledForAllVideos
{
  return self->_loopingEnabledForAllVideos;
}

- (float)volume
{
  return self->_volume;
}

- (int64_t)audioStatus
{
  return self->_audioStatus;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (void)_updateVideoDuration
{
  memset(&v10, 0, sizeof(v10));
  v3 = [(PUBrowsingVideoPlayer *)self videoSession];
  v4 = v3;
  if (v3) {
    [v3 videoDuration];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }

  if ((v10.flags & 0x1D) != 1)
  {
    v5 = [(PUBrowsingVideoPlayer *)self asset];
    [v5 duration];
    Float64 v7 = v6;

    CMTimeMakeWithSeconds(&v9, v7, 60);
    CMTime v10 = v9;
  }
  CMTime v8 = v10;
  [(PUBrowsingVideoPlayer *)self setDuration:&v8];
}

- (void)_setVideoSessionVolume:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PUBrowsingVideoPlayer *)self shouldFadeNextVolumeChange];
  [(PUBrowsingVideoPlayer *)self setShouldFadeNextVolumeChange:0];
  float v6 = 0.0;
  if (![(PUBrowsingVideoPlayer *)self isMuted])
  {
    [(PUBrowsingVideoPlayer *)self volume];
    float v6 = v7;
  }
  CMTime v8 = PLVideoPlaybackGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    double v11 = v6;
    __int16 v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "Browsing Video Player setting player volume to %f: %@", (uint8_t *)&v10, 0x16u);
  }

  *(float *)&double v9 = v6;
  [v4 setVolume:v5 withFade:v9];
}

- (void)_performPendingSeekIfNeeded
{
  v3 = [(PUBrowsingVideoPlayer *)self videoSession];
  id v4 = v3;
  if (v3)
  {
    p_pendingSeekTime = &self->_pendingSeekTime;
    if ((self->_pendingSeekTime.flags & 0x1D) == 1)
    {
      if ([v3 isReadyForSeeking])
      {
        id pendingSeekCompletionHandler = self->_pendingSeekCompletionHandler;
        long long v9 = *(_OWORD *)&p_pendingSeekTime->value;
        int64_t epoch = self->_pendingSeekTime.epoch;
        [v4 seekToTime:&v9 completionHandler:pendingSeekCompletionHandler];
        id v7 = self->_pendingSeekCompletionHandler;
        self->_id pendingSeekCompletionHandler = 0;

        uint64_t v8 = MEMORY[0x1E4F1F9F8];
        *(_OWORD *)&p_pendingSeekTime->value = *MEMORY[0x1E4F1F9F8];
        self->_pendingSeekTime.int64_t epoch = *(void *)(v8 + 16);
      }
    }
  }
}

- (void)_updatePlayerVolume
{
  v3 = [(PUBrowsingVideoPlayer *)self videoSession];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__PUBrowsingVideoPlayer__updatePlayerVolume__block_invoke;
  v4[3] = &unk_1E5F240A0;
  v4[4] = self;
  [v3 performChanges:v4 withPresentationContext:1 presenter:self->_videoSessionPresenter];
}

uint64_t __44__PUBrowsingVideoPlayer__updatePlayerVolume__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setVideoSessionVolume:a2];
}

- (void)_updateVideoSessionDesiredPlayState
{
  int64_t v3 = [(PUBrowsingVideoPlayer *)self _videoSessionDesiredPlayState];
  id v4 = [(PUBrowsingVideoPlayer *)self videoSession];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PUBrowsingVideoPlayer__updateVideoSessionDesiredPlayState__block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0___PXMutableVideoSession__8l;
  v5[4] = v3;
  [v4 performChanges:v5 withPresentationContext:1 presenter:self->_videoSessionPresenter];
}

uint64_t __60__PUBrowsingVideoPlayer__updateVideoSessionDesiredPlayState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDesiredPlayState:*(void *)(a1 + 32)];
}

- (int64_t)_videoSessionDesiredPlayState
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUBrowsingVideoPlayer *)self isPlaybackDesired];
  uint64_t v4 = [(PUBrowsingVideoPlayer *)self videoSession];
  BOOL v5 = (void *)v4;
  if (!v3 || !v4)
  {
LABEL_7:
    [v5 desiredPlayState];
    BOOL v7 = 0;
    goto LABEL_8;
  }
  if ([(PUBrowsingVideoPlayer *)self isUserScrubbing])
  {
    float v6 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543362;
      v21 = self;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "[PUBrowsingVideoPlayer] %{public}@ will remain paused while user is scrubbing.", (uint8_t *)&v20, 0xCu);
    }

    goto LABEL_7;
  }
  v13 = [MEMORY[0x1E4F8FFA8] sharedState];
  uint64_t v14 = [v13 visibilityState];

  uint64_t v15 = [v5 desiredPlayState];
  BOOL v7 = v14 == 1;
  if (v14 == 1 && v15 != 1)
  {
    v16 = [(PUBrowsingVideoPlayer *)self videoOutputs];
    PXFilter();
    v17 = (PUBrowsingVideoPlayer *)objc_claimAutoreleasedReturnValue();

    uint64_t v18 = [(PUBrowsingVideoPlayer *)v17 count];
    BOOL v7 = v18 == 0;
    if (v18)
    {
      v19 = PLVideoPlaybackGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543618;
        v21 = v17;
        __int16 v22 = 2114;
        v23 = self;
        _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_DEFAULT, "[PUBrowsingVideoPlayer] Unable to start video session playback because one or more video outputs is not ready for display:\n\t%{public}@\n\t%{public}@", (uint8_t *)&v20, 0x16u);
      }
    }
  }
LABEL_8:
  uint64_t v8 = [(PUBrowsingVideoPlayer *)self asset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v9 = [(PUBrowsingVideoPlayer *)self asset];
    if ([v9 needsDeferredProcessing])
    {
      int v10 = +[PUPhotoEditProtoSettings sharedInstance];
      int v11 = [v10 enableLiveVideoRender];
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 1;
  }

  return v7 & v11;
}

uint64_t __54__PUBrowsingVideoPlayer__videoSessionDesiredPlayState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 videoOutputIsReadyForDisplay] ^ 1;
}

- (void)_updateVideoSession
{
  v34[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUBrowsingVideoPlayer *)self asset];
  uint64_t v4 = [PUWrappingPXMediaProvider alloc];
  BOOL v5 = [(PUBrowsingVideoPlayer *)self mediaProvider];
  float v6 = [(PUWrappingPXMediaProvider *)v4 initWithWrappedMediaProvider:v5];

  BOOL v7 = [(PUBrowsingVideoPlayer *)self videoSession];
  if ([(PUBrowsingVideoPlayer *)self isPlayerLoadingAllowed])
  {
    BOOL v8 = [(PUBrowsingVideoPlayer *)self shouldLoadVideoSession];
    if (v7) {
      goto LABEL_14;
    }
  }
  else
  {
    BOOL v8 = 0;
    if (v7) {
      goto LABEL_14;
    }
  }
  if (v3 && v6)
  {
    long long v9 = [(PUBrowsingVideoPlayer *)self asset];
    if ([v9 playbackStyle] == 5) {
      [MEMORY[0x1E4F8EBC8] sharedAmbientInstance];
    }
    else {
    int v10 = [MEMORY[0x1E4F8EBC8] sharedVideoPlaybackInstance];
    }

    id v11 = objc_alloc_init(MEMORY[0x1E4F900E0]);
    [v11 setIsStreamingAllowed:1];
    [v11 setQuality:2];
    [(PUBrowsingVideoPlayer *)self targetSize];
    objc_msgSend(v11, "setTargetSize:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = objc_alloc(MEMORY[0x1E4F904E8]);
      v34[0] = v11;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
      uint64_t v14 = (void *)[v12 initWithAsset:v3 mediaProvider:v6 deliveryStrategies:v13 audioSession:v10 requestURLOnly:0];
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x1E4F900E8]);
      id v33 = v11;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
      uint64_t v14 = (void *)[v15 initWithAsset:v3 mediaProvider:v6 deliveryStrategies:v16 audioSession:v10 requestURLOnly:0];

      [v14 makeUniqueContentIdentifier];
    }
    v17 = [MEMORY[0x1E4F908C0] sharedInstance];
    BOOL v7 = [v17 checkOutSessionWithContentProvider:v14];

    [(PUBrowsingVideoPlayer *)self setVideoSession:v7];
  }
LABEL_14:
  if (v8)
  {
    BOOL v18 = [(PUBrowsingVideoPlayer *)self isActivated];
    v19 = [(PUBrowsingVideoPlayer *)self asset];
    uint64_t v20 = [v19 playbackStyle];

    int v21 = v20 == 5 || v18;
    if (v21) {
      uint64_t v22 = 3;
    }
    else {
      uint64_t v22 = 2;
    }
    if ((v21 & 1) == 0
      && [v7 playState] == 5
      && ([v7 contentProvider],
          v23 = objc_claimAutoreleasedReturnValue(),
          [v23 loadingResult],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          uint64_t v25 = [v24 priority],
          v24,
          v23,
          v25 == 2))
    {
      v26 = PLVideoPlaybackGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = self;
        _os_log_impl(&dword_1AE9F8000, v26, OS_LOG_TYPE_DEFAULT, "[PUBrowsingVideoPlayer] Declining to trigger autoplay video because it has already failed for %@", buf, 0xCu);
      }
    }
    else
    {
      [v7 loadIfNeededWithPriority:v22];
    }
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __44__PUBrowsingVideoPlayer__updateVideoSession__block_invoke;
  v29[3] = &unk_1E5F24038;
  v29[4] = self;
  id v30 = v3;
  videoSessionPresenter = self->_videoSessionPresenter;
  id v28 = v3;
  [v7 performChanges:v29 withPresentationContext:1 presenter:videoSessionPresenter];
}

void __44__PUBrowsingVideoPlayer__updateVideoSession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 playbackStartTime];
  }
  else
  {
    long long v14 = 0uLL;
    uint64_t v15 = 0;
  }
  long long v12 = v14;
  uint64_t v13 = v15;
  [v3 setPlaybackStartTime:&v12];
  BOOL v5 = [*(id *)(a1 + 32) asset];
  uint64_t v6 = [v5 playbackStyle];

  if (v6 == 5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = [*(id *)(a1 + 32) shouldLoopCurrentVideo];
  }
  [v3 setLoopingEnabled:v6 == 5];
  [v3 setSeekToBeginningAtEnd:v7];
  [v3 setAllowsExternalPlayback:0];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v11[0] = *MEMORY[0x1E4F1FA20];
  v11[1] = v8;
  v11[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  [v3 setPlaybackTimeRange:v11];
  [*(id *)(a1 + 32) _setVideoSessionVolume:v3];
  int v9 = [*(id *)(a1 + 32) isPlaybackDesired];
  BOOL v10 = 0;
  if (v9) {
    BOOL v10 = objc_msgSend(*(id *)(a1 + 40), "playbackStyle", 0) != 5;
  }
  [v3 setPreventsSleepDuringVideoPlayback:v10];
}

- (void)_requestNewRenderIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(PUBrowsingVideoPlayer *)self shouldRequestNewRender]
    && ![(PUBrowsingVideoPlayer *)self isPlaybackDesired])
  {
    [(PUBrowsingVideoPlayer *)self setShouldRequestNewRender:0];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = [(PUBrowsingVideoPlayer *)self videoOutputs];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v7++) prepareForVideoResolutionChange];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__PUBrowsingVideoPlayer__requestNewRenderIfNeeded__block_invoke;
    v8[3] = &unk_1E5F2ED10;
    v8[4] = self;
    [(PUViewModel *)self performChanges:v8];
  }
}

uint64_t __50__PUBrowsingVideoPlayer__requestNewRenderIfNeeded__block_invoke(uint64_t a1)
{
  long long v8 = 0uLL;
  uint64_t v9 = 0;
  v2 = [*(id *)(a1 + 32) videoSession];
  id v3 = v2;
  if (v2)
  {
    [v2 currentTime];
  }
  else
  {
    long long v8 = 0uLL;
    uint64_t v9 = 0;
  }

  [*(id *)(a1 + 32) invalidateExistingPlayer];
  uint64_t v4 = *(void **)(a1 + 32);
  long long v6 = v8;
  uint64_t v7 = v9;
  [v4 seekToTime:&v6 completionHandler:0];
  return [*(id *)(*(void *)(a1 + 32) + 64) setNeedsUpdateOf:sel__updateVideoSession];
}

- (void)_updatePlayerLoadingAllowedWithUpdateID:(unint64_t)a3
{
  if ([(PUBrowsingVideoPlayer *)self nextPlayerLoadingEnabledUpdateID] == a3)
  {
    uint64_t v4 = [(PUBrowsingVideoPlayer *)self _playerLoadingDisablingReasons];
    BOOL v5 = [v4 count] == 0;

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__PUBrowsingVideoPlayer__updatePlayerLoadingAllowedWithUpdateID___block_invoke;
    v6[3] = &unk_1E5F2E120;
    v6[4] = self;
    BOOL v7 = v5;
    [(PUViewModel *)self performChanges:v6];
  }
}

uint64_t __65__PUBrowsingVideoPlayer__updatePlayerLoadingAllowedWithUpdateID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPlayerLoadingAllowed:*(unsigned __int8 *)(a1 + 40)];
}

- (NSHashTable)videoOutputs
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUBrowsingVideoPlayer.m", 748, @"%s must be called on the main thread", "-[PUBrowsingVideoPlayer videoOutputs]");
  }
  videoOutputs = self->_videoOutputs;
  if (!videoOutputs)
  {
    BOOL v5 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    long long v6 = self->_videoOutputs;
    self->_videoOutputs = v5;

    videoOutputs = self->_videoOutputs;
  }
  return videoOutputs;
}

- (NSHashTable)timeObservers
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUBrowsingVideoPlayer.m", 738, @"%s must be called on the main thread", "-[PUBrowsingVideoPlayer timeObservers]");
  }
  timeObservers = self->_timeObservers;
  if (!timeObservers)
  {
    BOOL v5 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    long long v6 = self->_timeObservers;
    self->_timeObservers = v5;

    timeObservers = self->_timeObservers;
  }
  return timeObservers;
}

- (void)_handleShouldReloadAssetMediaNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUBrowsingVideoPlayer *)self asset];
  long long v6 = [v4 object];

  if ([v6 conformsToProtocol:&unk_1F07DC470])
  {
    id v7 = v6;
    long long v8 = [v5 uuid];
    uint64_t v9 = [v7 uuid];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __67__PUBrowsingVideoPlayer__handleShouldReloadAssetMediaNotification___block_invoke;
      _OWORD v11[3] = &unk_1E5F2ED10;
      v11[4] = self;
      [(PUViewModel *)self performChanges:v11];
    }
  }
}

uint64_t __67__PUBrowsingVideoPlayer__handleShouldReloadAssetMediaNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setNeedsUpdateOf:sel__updateVideoSession];
}

- (void)setVideoSession:(id)a3
{
  BOOL v5 = (PXVideoSession *)a3;
  p_videoSession = &self->_videoSession;
  videoSession = self->_videoSession;
  if (videoSession != v5)
  {
    long long v12 = v5;
    [(PXVideoSession *)videoSession unregisterChangeObserver:self context:videoSessionObservationContext];
    long long v8 = [(PXVideoSession *)*p_videoSession delegate];

    if (v8 == self) {
      [(PXVideoSession *)*p_videoSession setDelegate:0];
    }
    [(PXVideoSession *)*p_videoSession leavePresentationContext:1 presenter:self->_videoSessionPresenter];
    uint64_t v9 = [MEMORY[0x1E4F908C0] sharedInstance];
    [v9 checkInVideoSession:*p_videoSession];

    objc_storeStrong((id *)&self->_videoSession, a3);
    [(PXVideoSession *)v12 setDelegate:self];
    [(PUBrowsingVideoPlayer *)self _updatePlayerItem];
    [(PUBrowsingVideoPlayer *)self _updateVideoDuration];
    [(PUBrowsingVideoPlayer *)self _setAudioStatus:[(PXVideoSession *)v12 audioStatus]];
    int v10 = [(PXVideoSession *)v12 error];
    [(PUBrowsingVideoPlayer *)self _setError:v10];

    [(PXVideoSession *)*p_videoSession registerChangeObserver:self context:videoSessionObservationContext];
    [(PXVideoSession *)*p_videoSession enterPresentationContext:1 presenter:self->_videoSessionPresenter];
    long long v11 = [(PUBrowsingVideoPlayer *)self currentChange];
    [v11 _setAVPlayerDidChange:1];

    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateVideoSessionDesiredPlayState];
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updatePlayerVolume];
    BOOL v5 = v12;
  }
}

- (void)testing_setVideoSession:(id)a3
{
  id v8 = a3;
  if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v6 = NSStringFromSelector(a2);
    id v7 = [MEMORY[0x1E4F29060] callStackSymbols];
    [v5 handleFailureInMethod:a2, self, @"PUBrowsingVideoPlayer.m", 688, @"%@ should only be called as part of a unit test, but it was called from: \n%@", v6, v7 object file lineNumber description];
  }
  [(PUBrowsingVideoPlayer *)self setVideoSession:v8];
}

- (void)_setPlayerLoadingAllowed:(BOOL)a3
{
  if (self->_isPlayerLoadingAllowed != a3)
  {
    BOOL v3 = a3;
    self->_isPlayerLoadingAllowed = a3;
    BOOL v5 = [(PUBrowsingVideoPlayer *)self currentChange];
    [v5 _setPlayerLoadingAllowedDidChange:1];

    if (v3)
    {
      updater = self->_updater;
      [(PXUpdater *)updater setNeedsUpdateOf:sel__updateVideoSession];
    }
  }
}

- (void)_setAudioStatus:(int64_t)a3
{
  if (self->_audioStatus != a3)
  {
    self->_audioStatus = a3;
    id v3 = [(PUBrowsingVideoPlayer *)self currentChange];
    [v3 _setAudioStatusDidChange:1];
  }
}

- (void)_setError:(id)a3
{
  BOOL v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    long long v6 = [(PUBrowsingVideoPlayer *)self currentChange];
    [v6 _setErrorDidChange:1];

    BOOL v5 = v7;
  }
}

- (void)_setPlayerItem:(id)a3 timeRangeMapper:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (*(_OWORD *)&self->_timeRangeMapper != __PAIR128__((unint64_t)v9, (unint64_t)v7))
  {
    objc_storeStrong((id *)&self->_playerItem, a3);
    objc_storeStrong((id *)&self->_timeRangeMapper, a4);
    id v8 = [(PUBrowsingVideoPlayer *)self currentChange];
    [v8 _setPlayerItemDidChange:1];
  }
}

- (BOOL)isAutoPlayingVideo
{
  id v3 = +[PUOneUpSettings sharedInstance];
  id v4 = [(PUBrowsingVideoPlayer *)self asset];
  char v5 = [v3 allowAutoplayVideoForAsset:v4];

  return v5;
}

- (void)_updateMuteState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__PUBrowsingVideoPlayer__updateMuteState__block_invoke;
  v2[3] = &unk_1E5F2ED10;
  v2[4] = self;
  [(PUViewModel *)self performChanges:v2];
}

void __41__PUBrowsingVideoPlayer__updateMuteState__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAutoPlayingVideo]
    && ([*(id *)(a1 + 32) asset],
        v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v2 playbackStyle],
        v2,
        v3 != 5))
  {
    id v5 = [MEMORY[0x1E4F908A0] sharedController];
    objc_msgSend(*(id *)(a1 + 32), "setIsMuted:", objc_msgSend(v5, "isMuted"));
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    [v4 setIsMuted:0];
  }
}

- (BOOL)shouldLoopCurrentVideo
{
  uint64_t v3 = [(PUBrowsingVideoPlayer *)self asset];
  if ([v3 playbackStyle] == 5)
  {
    BOOL v4 = 1;
  }
  else if ([(PUBrowsingVideoPlayer *)self loopingEnabledForAllVideos])
  {
    id v5 = [(PUBrowsingVideoPlayer *)self asset];
    [v5 duration];
    double v7 = v6;
    [(PUBrowsingVideoPlayer *)self minimumDurationForLooping];
    BOOL v4 = v7 >= v8;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)videoSessionAudioSessionOutputVolumeDidChange:(id)a3 fromVolume:(float)a4 toVolume:(float)a5
{
  if (a4 < a5) {
    px_dispatch_on_main_queue();
  }
}

uint64_t __91__PUBrowsingVideoPlayer_videoSessionAudioSessionOutputVolumeDidChange_fromVolume_toVolume___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __91__PUBrowsingVideoPlayer_videoSessionAudioSessionOutputVolumeDidChange_fromVolume_toVolume___block_invoke_2;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

void __91__PUBrowsingVideoPlayer_videoSessionAudioSessionOutputVolumeDidChange_fromVolume_toVolume___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) currentChange];
  [v1 _setAudioSessionVolumeIncreaseDidOccur:1];
}

- (void)videoSessionDidPlayToEnd:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:PUBrowsingVideoPlayerDidPlayToEndTimeNotification object:self];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)VideoMuteControllerContext == a5)
  {
    if (a4) {
      [(PUBrowsingVideoPlayer *)self _updateMuteState];
    }
  }
  else if ((void *)videoSessionObservationContext == a5)
  {
    void v11[5] = MEMORY[0x1E4F143A8];
    v11[6] = 3221225472;
    v11[7] = __54__PUBrowsingVideoPlayer_observable_didChange_context___block_invoke;
    v11[8] = &unk_1E5F2E0A8;
    v11[9] = self;
    v11[10] = a4;
    px_dispatch_on_main_queue();
  }
  else
  {
    if ((void *)ApplicationStateContext != a5)
    {
      int v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PUBrowsingVideoPlayer.m" lineNumber:605 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__PUBrowsingVideoPlayer_observable_didChange_context___block_invoke_3;
    _OWORD v11[3] = &unk_1E5F2ED10;
    v11[4] = self;
    [(PUViewModel *)self performChanges:v11];
  }
}

uint64_t __54__PUBrowsingVideoPlayer_observable_didChange_context___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__PUBrowsingVideoPlayer_observable_didChange_context___block_invoke_2;
  v3[3] = &unk_1E5F2E0A8;
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v1;
  return [v4 performChanges:v3];
}

uint64_t __54__PUBrowsingVideoPlayer_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setNeedsUpdateOf:sel__updateVideoSessionDesiredPlayState];
}

void __54__PUBrowsingVideoPlayer_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    [*(id *)(a1 + 32) _updatePlayerItem];
    uint64_t v2 = *(void *)(a1 + 40);
    if ((v2 & 0x80) == 0)
    {
LABEL_3:
      if ((v2 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((v2 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  long long v37 = 0uLL;
  uint64_t v38 = 0;
  uint64_t v3 = [*(id *)(a1 + 32) videoSession];
  id v4 = v3;
  if (v3)
  {
    [v3 currentTime];
  }
  else
  {
    long long v37 = 0uLL;
    uint64_t v38 = 0;
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = [*(id *)(a1 + 32) timeObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v11 = *(void *)(a1 + 32);
        long long v31 = v37;
        uint64_t v32 = v38;
        [v10 videoPlayer:v11 currentTimeDidChange:&v31];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v7);
  }

  uint64_t v2 = *(void *)(a1 + 40);
  if ((v2 & 0x10) == 0)
  {
LABEL_4:
    if ((v2 & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  long long v12 = [*(id *)(a1 + 32) videoSession];
  objc_msgSend(*(id *)(a1 + 32), "_setAudioStatus:", objc_msgSend(v12, "audioStatus"));

  uint64_t v2 = *(void *)(a1 + 40);
  if ((v2 & 0x100) == 0)
  {
LABEL_5:
    if ((v2 & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v13 = [*(id *)(a1 + 32) currentChange];
  [v13 _setAtBeginningDidChange:1];

  if ((*(void *)(a1 + 40) & 0x200) == 0) {
    goto LABEL_25;
  }
LABEL_21:
  uint64_t v14 = [*(id *)(a1 + 32) currentChange];
  [v14 _setAtEndDidChange:1];

  uint64_t v15 = [*(id *)(a1 + 32) videoSession];
  if ([v15 isAtEnd])
  {
    char v16 = [*(id *)(a1 + 32) shouldLoopCurrentVideo];

    if ((v16 & 1) == 0) {
      [*(id *)(a1 + 32) setDesiredPlayState:1 reason:@"Video played to end"];
    }
  }
  else
  {
  }
LABEL_25:
  uint64_t v17 = *(void *)(a1 + 40);
  if ((v17 & 2) != 0)
  {
    BOOL v18 = [*(id *)(a1 + 32) currentChange];
    [v18 _setStalledDidChange:1];

    uint64_t v17 = *(void *)(a1 + 40);
    if ((v17 & 0x20) == 0)
    {
LABEL_27:
      if ((v17 & 4) == 0) {
        goto LABEL_28;
      }
      goto LABEL_34;
    }
  }
  else if ((v17 & 0x20) == 0)
  {
    goto LABEL_27;
  }
  v19 = [*(id *)(a1 + 32) currentChange];
  [v19 _setPlayableDidChange:1];

  uint64_t v17 = *(void *)(a1 + 40);
  if ((v17 & 4) == 0)
  {
LABEL_28:
    if ((v17 & 0x2000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_41;
  }
LABEL_34:
  [*(id *)(*(void *)(a1 + 32) + 64) setNeedsUpdateOf:sel__updateVideoSession];
  uint64_t v20 = [*(id *)(a1 + 32) videoSession];
  int v21 = [v20 error];
  [*(id *)(a1 + 32) _setError:v21];

  uint64_t v22 = [*(id *)(a1 + 32) currentChange];
  [v22 _setPlayStateDidChange:1];

  v23 = [*(id *)(a1 + 32) avPlayer];
  uint64_t v24 = [v23 currentItem];
  uint64_t v25 = [v24 videoComposition];
  v26 = [v25 instructions];
  v27 = [v26 firstObject];

  if (v27)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v28 = [*(id *)(a1 + 32) videoSession];
      if ([v28 playState] == 3) {
        float v29 = 1.0;
      }
      else {
        float v29 = 0.0;
      }

      *(float *)&double v30 = v29;
      [v27 setPlaybackRate:v30];
    }
  }

  uint64_t v17 = *(void *)(a1 + 40);
  if ((v17 & 0x2000) == 0)
  {
LABEL_29:
    if ((v17 & 0x40) == 0) {
      return;
    }
    goto LABEL_30;
  }
LABEL_41:
  [*(id *)(a1 + 32) _performPendingSeekIfNeeded];
  if ((*(void *)(a1 + 40) & 0x40) == 0) {
    return;
  }
LABEL_30:
  [*(id *)(a1 + 32) _updateVideoDuration];
}

- (void)_updatePlayerItem
{
  id v5 = [(PUBrowsingVideoPlayer *)self videoSession];
  uint64_t v3 = [v5 playerItem];
  id v4 = [v5 timeRangeMapper];
  [(PUBrowsingVideoPlayer *)self _setPlayerItem:v3 timeRangeMapper:v4];
}

- (void)unregisterVideoOutput:(id)a3
{
  id v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a3;
  if (([v5 isMainThread] & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUBrowsingVideoPlayer.m", 521, @"%s must be called on the main thread", "-[PUBrowsingVideoPlayer unregisterVideoOutput:]");
  }
  uint64_t v7 = objc_getAssociatedObject(v6, (const void *)VideoOutputPlayerReferenceKey);
  [v7 setPlayer:0];
  [v6 setReadyForDisplayChangeHandler:0];
  uint64_t v8 = [(PUBrowsingVideoPlayer *)self videoOutputs];
  [v8 removeObject:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__PUBrowsingVideoPlayer_unregisterVideoOutput___block_invoke;
  v10[3] = &unk_1E5F2ED10;
  v10[4] = self;
  [(PUViewModel *)self performChanges:v10];
}

uint64_t __47__PUBrowsingVideoPlayer_unregisterVideoOutput___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setNeedsUpdateOf:sel__updateVideoSessionDesiredPlayState];
}

- (void)registerVideoOutput:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUBrowsingVideoPlayer.m", 502, @"%s must be called on the main thread", "-[PUBrowsingVideoPlayer registerVideoOutput:]");
  }
  objc_getAssociatedObject(v5, (const void *)VideoOutputPlayerReferenceKey);
  id v6 = (_PUBrowsingVideoOutputPlayerReference *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [(_PUBrowsingVideoOutputPlayerReference *)v6 player];

  if (v7)
  {
    uint64_t v8 = PXAssertGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = [(_PUBrowsingVideoOutputPlayerReference *)v6 player];
      *(_DWORD *)location = 138412802;
      *(void *)&location[4] = v5;
      __int16 v16 = 2112;
      uint64_t v17 = self;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_error_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "[PUBrowsingVideoPlayer] Attempted to register output %@ with %@, but it is already registered with %@", location, 0x20u);
    }
  }
  if (!v6)
  {
    id v6 = objc_alloc_init(_PUBrowsingVideoOutputPlayerReference);
    objc_setAssociatedObject(v5, (const void *)VideoOutputPlayerReferenceKey, v6, (void *)1);
  }
  [(_PUBrowsingVideoOutputPlayerReference *)v6 setPlayer:self];
  id v9 = [(PUBrowsingVideoPlayer *)self videoOutputs];
  [v9 addObject:v5];

  objc_initWeak((id *)location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__PUBrowsingVideoPlayer_registerVideoOutput___block_invoke;
  v13[3] = &unk_1E5F2E530;
  objc_copyWeak(&v14, (id *)location);
  [v5 setReadyForDisplayChangeHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__PUBrowsingVideoPlayer_registerVideoOutput___block_invoke_2;
  v12[3] = &unk_1E5F2ED10;
  v12[4] = self;
  [(PUViewModel *)self performChanges:v12];
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)location);
}

void __45__PUBrowsingVideoPlayer_registerVideoOutput___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateVideoSessionDesiredPlayState];
}

uint64_t __45__PUBrowsingVideoPlayer_registerVideoOutput___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setNeedsUpdateOf:sel__updateVideoSessionDesiredPlayState];
}

- (void)unregisterTimeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PUBrowsingVideoPlayer *)self timeObservers];
  [v5 removeObject:v4];
}

- (void)registerTimeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PUBrowsingVideoPlayer *)self timeObservers];
  [v5 addObject:v4];
}

- (void)setPlaybackStartTime:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 playbackStartTime = &self->_playbackStartTime;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 playbackStartTime = self->_playbackStartTime;
  if (CMTimeCompare(&time1, (CMTime *)&playbackStartTime))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_playbackStartTime->int64_t epoch = a3->var3;
    *(_OWORD *)&p_playbackStartTime->value = v6;
    [(PUBrowsingVideoPlayer *)self _updateVideoSession];
  }
}

- (void)setDesiredSeekTime:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_desiredSeekTime = &self->_desiredSeekTime;
  CMTime time1 = *(CMTime *)a3;
  CMTime time2 = (CMTime)self->_desiredSeekTime;
  if (CMTimeCompare(&time1, &time2))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_desiredSeekTime->int64_t epoch = a3->var3;
    *(_OWORD *)&p_desiredSeekTime->value = v6;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [(PUBrowsingVideoPlayer *)self timeObservers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
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
          long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          CMTime time1 = (CMTime)*a3;
          [v12 videoPlayer:self desiredSeekTimeDidChange:&time1];
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  id v4 = self + 3;
  if ((self[3].var2 & 0x1D) == 1) {
    goto LABEL_7;
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  id v5 = [($3CC8671D27C23BF42ADDB32F2B5E48AE *)self videoSession];
  long long v6 = v5;
  if (v5)
  {
    [v5 currentTime];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  if ((retstr->var2 & 0x1D) != 1)
  {
    id v4 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x1E4F1FA48];
LABEL_7:
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&v4->var0;
    retstr->var3 = v4->var3;
  }
  return self;
}

- (void)rewindExistingPlayer
{
  id v2 = [(PUBrowsingVideoPlayer *)self videoSession];
  [v2 seekToPlaybackStartTime];
}

- (void)setShouldPreloadVideoContent:(BOOL)a3
{
  if (self->_shouldPreloadVideoContent != a3)
  {
    self->_shouldPreloadVideoContent = a3;
    if (a3) {
      [(PUBrowsingVideoPlayer *)self setShouldLoadVideoSession:1];
    }
    updater = self->_updater;
    [(PXUpdater *)updater setNeedsUpdateOf:sel__updateVideoSession];
  }
}

- (void)setActivated:(BOOL)a3
{
  if (self->_isActivated != a3)
  {
    self->_isActivated = a3;
    if (a3) {
      [(PUBrowsingVideoPlayer *)self setShouldLoadVideoSession:1];
    }
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateVideoSession];
    id v4 = [(PUBrowsingVideoPlayer *)self currentChange];
    [v4 _setActivatedDidChange:1];
  }
}

- (void)_handleSeekCompletion:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [(PUBrowsingVideoPlayer *)self setIsSeeking:0];
  long long v6 = v7;
  if (v7)
  {
    (*((void (**)(id, BOOL))v7 + 2))(v7, v4);
    long long v6 = v7;
  }
  if (v4)
  {
    [(PUBrowsingVideoPlayer *)self _performPendingSeekIfNeeded];
    long long v6 = v7;
  }
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6
{
  id v10 = a6;
  uint64_t v11 = [(PUBrowsingVideoPlayer *)self videoSession];
  long long v12 = v11;
  if (v11 && [v11 isReadyForSeeking] && !self->_isSeeking)
  {
    self->_isSeeking = 1;
    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __85__PUBrowsingVideoPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke;
    v23[3] = &unk_1E5F24010;
    objc_copyWeak(&v25, &location);
    id v24 = v10;
    long long v21 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    long long v19 = *(_OWORD *)&a4->var0;
    int64_t v20 = a4->var3;
    long long v17 = *(_OWORD *)&a5->var0;
    int64_t v18 = a5->var3;
    [v12 seekToTime:&v21 toleranceBefore:&v19 toleranceAfter:&v17 completionHandler:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    int64_t v13 = a3->var3;
    *(_OWORD *)&self->_pendingSeekTime.value = *(_OWORD *)&a3->var0;
    self->_pendingSeekTime.int64_t epoch = v13;
    long long v14 = (void *)[v10 copy];
    id pendingSeekCompletionHandler = self->_pendingSeekCompletionHandler;
    self->_id pendingSeekCompletionHandler = v14;

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__PUBrowsingVideoPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke_3;
    v16[3] = &unk_1E5F2ED10;
    v16[4] = self;
    [(PUViewModel *)self performChanges:v16];
  }
}

void __85__PUBrowsingVideoPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PUBrowsingVideoPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke_2;
  block[3] = &unk_1E5F23FE8;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  char v7 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

uint64_t __85__PUBrowsingVideoPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldLoadVideoSession:1];
}

void __85__PUBrowsingVideoPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleSeekCompletion:*(void *)(a1 + 32) finished:*(unsigned __int8 *)(a1 + 48)];
}

- (void)seekToTime:(id *)a3 completionHandler:(id)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  long long v6 = *MEMORY[0x1E4F1FA10];
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  long long v4 = v6;
  uint64_t v5 = v7;
  [(PUBrowsingVideoPlayer *)self seekToTime:&v8 toleranceBefore:&v6 toleranceAfter:&v4 completionHandler:a4];
}

- (BOOL)isStalled
{
  uint64_t v3 = [(PUBrowsingVideoPlayer *)self videoSession];

  if (!v3) {
    return 0;
  }
  long long v4 = [(PUBrowsingVideoPlayer *)self videoSession];
  char v5 = [v4 isStalled];

  return v5;
}

- (int64_t)playState
{
  id v2 = [(PUBrowsingVideoPlayer *)self videoSession];
  uint64_t v3 = v2;
  if (v2) {
    int64_t v4 = [v2 playState];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isPlayable
{
  uint64_t v3 = [(PUBrowsingVideoPlayer *)self videoSession];

  if (!v3) {
    return 1;
  }
  int64_t v4 = [(PUBrowsingVideoPlayer *)self videoSession];
  char v5 = [v4 isPlayable];

  return v5;
}

- (BOOL)isAtEnd
{
  uint64_t v3 = [(PUBrowsingVideoPlayer *)self videoSession];

  if (!v3) {
    return 0;
  }
  int64_t v4 = [(PUBrowsingVideoPlayer *)self videoSession];
  char v5 = [v4 isAtEnd];

  return v5;
}

- (BOOL)isAtBeginning
{
  uint64_t v3 = [(PUBrowsingVideoPlayer *)self videoSession];

  if (!v3) {
    return 1;
  }
  int64_t v4 = [(PUBrowsingVideoPlayer *)self videoSession];
  char v5 = [v4 isAtBeginning];

  return v5;
}

- (void)setLoopingEnabledForAllVideos:(BOOL)a3
{
  if (self->_loopingEnabledForAllVideos != a3)
  {
    self->_loopingEnabledForAllVideos = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateVideoSession];
  }
}

- (void)setVolume:(float)a3
{
  if (self->_volume != a3)
  {
    self->_volume = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updatePlayerVolume];
  }
}

- (void)setShouldLoadVideoSession:(BOOL)a3
{
  if (self->_shouldLoadVideoSession != a3)
  {
    self->_shouldLoadVideoSession = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateVideoSession];
  }
}

- (void)setDuration:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 duration = &self->_duration;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 duration = self->_duration;
  if (CMTimeCompare(&time1, (CMTime *)&duration))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_duration->int64_t epoch = a3->var3;
    *(_OWORD *)&p_duration->value = v6;
    uint64_t v7 = [(PUBrowsingVideoPlayer *)self currentChange];
    [v7 setDurationDidChange:1];
  }
}

- (void)setDesiredTargetSize:(CGSize)a3
{
  PXSizeMin();
  double v5 = v4;
  double v7 = v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = +[PUPhotoEditProtoSettings sharedInstance];
  int v9 = [v8 enableDynamicVideoScaling];

  if (v9 && (PXSizeApproximatelyEqualOrBiggerThanSize() & 1) == 0)
  {
    [(PUBrowsingVideoPlayer *)self setShouldRequestNewRender:1];
    -[PUBrowsingVideoPlayer _setTargetSize:](self, "_setTargetSize:", v5, v7);
    [(PUBrowsingVideoPlayer *)self _requestNewRenderIfNeeded];
  }
}

- (void)setIsUserScrubbing:(BOOL)a3
{
  if (self->_isUserScrubbing != a3)
  {
    self->_isUserScrubbing = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateVideoSessionDesiredPlayState];
  }
}

- (void)setIsMuted:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_isMuted != a3)
  {
    self->_isMuted = a3;
    [(PUBrowsingVideoPlayer *)self setShouldFadeNextVolumeChange:1];
    double v4 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      double v6 = self;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "Browsing Video Player detected mute state change. Will update player volume. %@", (uint8_t *)&v5, 0xCu);
    }

    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updatePlayerVolume];
  }
}

- (BOOL)isPlaybackDesired
{
  return (unint64_t)([(PUBrowsingVideoPlayer *)self desiredPlayState] - 3) < 2;
}

- (void)setDesiredPlayState:(int64_t)a3 reason:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_desiredPlayState != a3)
  {
    uint64_t v7 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = PUBrowsingVideoDesiredPlayStateDescription(self->_desiredPlayState);
      int v9 = PUBrowsingVideoDesiredPlayStateDescription(a3);
      int v11 = 138413058;
      long long v12 = v8;
      __int16 v13 = 2112;
      long long v14 = v9;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      int64_t v18 = self;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Desired play state changing from %@ to %@ with reason: %@\n\t%@", (uint8_t *)&v11, 0x2Au);
    }
    self->_desiredPlayState = a3;
    if ([(PUBrowsingVideoPlayer *)self isPlaybackDesired]) {
      [(PUBrowsingVideoPlayer *)self setShouldLoadVideoSession:1];
    }
    [(PUBrowsingVideoPlayer *)self _requestNewRenderIfNeeded];
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateVideoSessionDesiredPlayState];
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateVideoSession];
    id v10 = [(PUBrowsingVideoPlayer *)self currentChange];
    [v10 _setDesiredPlayStateDidChange:1];
  }
}

- (ISWrappedAVPlayer)avPlayer
{
  id v2 = [(PUBrowsingVideoPlayer *)self videoSession];
  uint64_t v3 = [v2 videoPlayer];

  return (ISWrappedAVPlayer *)v3;
}

- (void)setAsset:(id)a3
{
  int v5 = (PUDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    __int16 v13 = v5;
    if (setAsset__onceToken != -1)
    {
      dispatch_once(&setAsset__onceToken, &__block_literal_global_16595);
      int v5 = v13;
    }
    if (setAsset__CAMTransientAssetClass)
    {
      if (objc_opt_isKindOfClass()) {
        int isKindOfClass = objc_opt_isKindOfClass();
      }
      else {
        int isKindOfClass = 1;
      }
      int v5 = v13;
    }
    else
    {
      int isKindOfClass = 1;
    }
    asset = self->_asset;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = v5;
    int v9 = asset;
    if (v9 == v8)
    {
      int v11 = 0;
    }
    else
    {
      uint64_t v10 = [(PUDisplayAsset *)v8 isContentEqualTo:v9];
      if (!v10) {
        uint64_t v10 = [(PUDisplayAsset *)v9 isContentEqualTo:v8];
      }
      int v11 = v10 != 2;
    }

    if (((v11 | isKindOfClass) & 1) == 0) {
      int v11 = ![(PUBrowsingVideoPlayer *)self isActivated];
    }
    objc_storeStrong((id *)&self->_asset, a3);
    long long v12 = [(PUBrowsingVideoPlayer *)self currentChange];
    [v12 setHasChanges];

    if (v11) {
      [(PUBrowsingVideoPlayer *)self assetContentDidChange];
    }
    if ([(PUDisplayAsset *)v8 mediaType] != 2
      && ([(PUDisplayAsset *)v8 canPlayLoopingVideo] & 1) == 0)
    {
      [(PUBrowsingVideoPlayer *)self setActivated:0];
    }
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateVideoSession];
    int v5 = v13;
  }
}

Class __34__PUBrowsingVideoPlayer_setAsset___block_invoke()
{
  Class result = NSClassFromString(&cfstr_Camtransientas.isa);
  setAsset__CAMTransientAssetClass = (uint64_t)result;
  return result;
}

- (void)assetContentDidChange
{
  uint64_t v3 = [(PUBrowsingVideoPlayer *)self currentChange];
  [v3 setHasChanges];

  [(PUBrowsingVideoPlayer *)self setVideoSession:0];
  [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateVideoSession];
  [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updatePlayerVolume];
  updater = self->_updater;
  [(PXUpdater *)updater setNeedsUpdateOf:sel__updateVideoSessionDesiredPlayState];
}

- (void)invalidateExistingPlayer
{
}

- (void)unregisterChangeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingVideoPlayer;
  [(PUViewModel *)&v3 unregisterChangeObserver:a3];
}

- (void)registerChangeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingVideoPlayer;
  [(PUViewModel *)&v3 registerChangeObserver:a3];
}

- (PUBrowsingVideoPlayerChange)currentChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUBrowsingVideoPlayer;
  id v2 = [(PUViewModel *)&v4 currentChange];
  return (PUBrowsingVideoPlayerChange *)v2;
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUBrowsingVideoPlayerChange);
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingVideoPlayer;
  [(PUViewModel *)&v3 didPerformChanges];
  [(PXUpdater *)self->_updater updateIfNeeded];
}

- (NSString)description
{
  v11.receiver = self;
  v11.super_class = (Class)PUBrowsingVideoPlayer;
  objc_super v3 = [(PUBrowsingVideoPlayer *)&v11 description];
  objc_super v4 = (void *)[v3 mutableCopy];

  int v5 = [(PUBrowsingVideoPlayer *)self asset];
  [v4 appendFormat:@"\n\tAsset : %@", v5];

  id v6 = PUBrowsingVideoDesiredPlayStateDescription([(PUBrowsingVideoPlayer *)self desiredPlayState]);
  [v4 appendFormat:@"\n\tDesired State : %@", v6];

  uint64_t v7 = [(PUBrowsingVideoPlayer *)self videoSession];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [v7 description];
  [v4 appendFormat:@"\n\tVideoSession : %@", v8];

  int v9 = (void *)[v4 copy];
  return (NSString *)v9;
}

- (void)dealloc
{
  [(PXVideoSession *)self->_videoSession leavePresentationContext:1 presenter:self->_videoSessionPresenter];
  objc_super v3 = [MEMORY[0x1E4F908C0] sharedInstance];
  [v3 checkInVideoSession:self->_videoSession];

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PUBrowsingVideoPlayer;
  [(PUBrowsingVideoPlayer *)&v5 dealloc];
}

- (PUBrowsingVideoPlayer)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUBrowsingVideoPlayer.m", 158, @"%s is not available as initializer", "-[PUBrowsingVideoPlayer init]");

  abort();
}

- (PUBrowsingVideoPlayer)initWithAsset:(id)a3 mediaProvider:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PUBrowsingVideoPlayer.m", 120, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"PUBrowsingVideoPlayer.m", 121, @"Invalid parameter not satisfying: %@", @"mediaProvider" object file lineNumber description];

LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)PUBrowsingVideoPlayer;
  objc_super v11 = [(PUViewModel *)&v28 init];
  long long v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asset, a3);
    objc_storeStrong((id *)&v12->_mediaProvider, a4);
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F912F8]) initWithTarget:v12];
    updater = v12->_updater;
    v12->_updater = (PXUpdater *)v13;

    [(PXUpdater *)v12->_updater addUpdateSelector:sel__updateVideoSession];
    [(PXUpdater *)v12->_updater addUpdateSelector:sel__updatePlayerVolume];
    [(PXUpdater *)v12->_updater addUpdateSelector:sel__updateVideoSessionDesiredPlayState];
    [(PXUpdater *)v12->_updater setNeedsUpdateSelector:sel_assertInsideChangesBlock];
    __int16 v15 = [MEMORY[0x1E4F908A0] sharedController];
    [v15 registerChangeObserver:v12 context:VideoMuteControllerContext];

    v12->_desiredPlayState = 0;
    v12->_isPlayerLoadingAllowed = 1;
    v12->_volume = 1.0;
    [(PUBrowsingVideoPlayer *)v12 _updateMuteState];
    id v16 = [(PUBrowsingVideoPlayer *)v12 asset];
    [v16 duration];
    Float64 v18 = v17;

    CMTimeMakeWithSeconds(&v27, v18, 600);
    long long v19 = *(_OWORD *)&v27.value;
    v12->_duration.int64_t epoch = v27.epoch;
    *(_OWORD *)&v12->_duration.value = v19;
    v12->_videoSessionPresenter = &v12->_videoSessionPresenter;
    v12->_targetSize = (CGSize)PUBrowsingVideoDefaultSize;
    int64_t v20 = +[PUPhotoEditProtoSettings sharedInstance];
    int v21 = [v20 enableLiveVideoRenderAtSetSize];

    if (v21) {
      v12->_targetSize = (CGSize)PUBrowsingVideoMaxSize;
    }
    uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v12 selector:sel__handleShouldReloadAssetMediaNotification_ name:@"PUShouldReloadAssetMediaNotification" object:0];

    v23 = [MEMORY[0x1E4F8FFA8] sharedState];
    [v23 registerChangeObserver:v12 context:ApplicationStateContext];
  }
  return v12;
}

@end