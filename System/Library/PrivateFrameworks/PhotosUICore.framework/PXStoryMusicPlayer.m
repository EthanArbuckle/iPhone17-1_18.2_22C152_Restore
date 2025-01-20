@interface PXStoryMusicPlayer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackStartTimeForIncomingSong:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetDuration;
- (BOOL)isActive;
- (BOOL)isDucked;
- (BOOL)shouldDuckForCurrentTouch;
- (BOOL)targetDurationMatchesTimeline;
- (NSDate)touchingBeganDate;
- (NSMutableSet)internalFailedAudioAssets;
- (NSSet)failedAudioAssets;
- (NSString)description;
- (NSString)duckingReason;
- (NSString)pauseReason;
- (NSTimer)playbackTimer;
- (OS_dispatch_queue)storyQueue;
- (PXAudioAsset)currentAudioAsset;
- (PXAudioCueProvider)cueProvider;
- (PXAudioCueSource)cueSource;
- (PXAudioPlayer)player;
- (PXNumberAnimator)duckingVolumeAnimator;
- (PXNumberAnimator)fadeOutVolumeAnimator;
- (PXNumberAnimator)focusVolumeAnimator;
- (PXNumberAnimator)viewControllerTransitionVolumeAnimator;
- (PXStoryModel)model;
- (PXStoryMusicPlayer)init;
- (PXStoryMusicPlayer)initWithModel:(id)a3;
- (PXStoryMusicPlayer)initWithModel:(id)a3 targetDurationMatchesTimeline:(BOOL)a4;
- (PXStorySongResource)currentSongResource;
- (PXUpdater)updater;
- (float)duckedVolume;
- (float)volume;
- (id)AVAudioSessionForPlayer:(id)a3;
- (id)diagnosticCueStringForSize:(CGSize)a3 withIndicatorTime:(id *)a4 rangeIndicatorTimeRange:(id *)a5;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (id)windowSceneID;
- (int64_t)audioDesiredPlayState;
- (int64_t)bufferingEvents;
- (int64_t)cueRequestID;
- (int64_t)cuesVersion;
- (int64_t)desiredPlayState;
- (int64_t)readinessStatus;
- (void)_handleAudioCues:(id)a3 asset:(id)a4 error:(id)a5 requestID:(int64_t)a6;
- (void)_handleDuckingDelayPassedForTouchingBeganDate:(id)a3;
- (void)_handlePlaybackFailureIfNeeded;
- (void)_handlePlaybackTimerFired:(id)a3;
- (void)_invalidateCueSource;
- (void)_invalidateCurrentAudioAsset;
- (void)_invalidateCurrentSongResource;
- (void)_invalidateDesiredPlayState;
- (void)_invalidateDucked;
- (void)_invalidateDuckingVolumeAnimator;
- (void)_invalidateError;
- (void)_invalidateFadeOutVolumeAnimator;
- (void)_invalidateFailedAudioAssets;
- (void)_invalidateFocusVolumeAnimator;
- (void)_invalidateModelProperties;
- (void)_invalidatePlaybackTimer;
- (void)_invalidatePlayerCurrentAsset;
- (void)_invalidatePlayerDesiredPlayState;
- (void)_invalidatePlayerVolume;
- (void)_invalidateReadinessStatus;
- (void)_invalidateTargetDuration;
- (void)_invalidateTouchingBeganDate;
- (void)_invalidateViewControllerTransitionVolumeAnimator;
- (void)_updateCueSource;
- (void)_updateCurrentAudioAsset;
- (void)_updateCurrentSongResource;
- (void)_updateDesiredPlayState;
- (void)_updateDucked;
- (void)_updateDuckingVolumeAnimator;
- (void)_updateError;
- (void)_updateFadeOutVolumeAnimator;
- (void)_updateFailedAudioAssets;
- (void)_updateFocusVolumeAnimator;
- (void)_updateModelProperties;
- (void)_updatePlaybackTimer;
- (void)_updatePlayerCurrentAsset;
- (void)_updatePlayerDesiredPlayState;
- (void)_updatePlayerVolume;
- (void)_updateReadinessStatus;
- (void)_updateTargetDuration;
- (void)_updateTouchingBeganDate;
- (void)_updateViewControllerTransitionVolumeAnimator;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)replay;
- (void)setAudioDesiredPlayState:(int64_t)a3;
- (void)setBufferingEvents:(int64_t)a3;
- (void)setCueProvider:(id)a3;
- (void)setCueRequestID:(int64_t)a3;
- (void)setCueSource:(id)a3;
- (void)setCuesVersion:(int64_t)a3;
- (void)setCurrentAudioAsset:(id)a3;
- (void)setCurrentSongResource:(id)a3;
- (void)setDesiredPlayState:(int64_t)a3;
- (void)setDuckedVolume:(float)a3;
- (void)setDuckingReason:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsDucked:(BOOL)a3;
- (void)setPauseReason:(id)a3;
- (void)setPlaybackTimer:(id)a3;
- (void)setReadinessStatus:(int64_t)a3;
- (void)setShouldDuckForCurrentTouch:(BOOL)a3;
- (void)setTargetDuration:(id *)a3;
- (void)setTouchingBeganDate:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PXStoryMusicPlayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cueProvider, 0);
  objc_storeStrong((id *)&self->_currentSongResource, 0);
  objc_storeStrong((id *)&self->_internalFailedAudioAssets, 0);
  objc_storeStrong((id *)&self->_playbackTimer, 0);
  objc_storeStrong((id *)&self->_touchingBeganDate, 0);
  objc_storeStrong((id *)&self->_duckingReason, 0);
  objc_storeStrong((id *)&self->_pauseReason, 0);
  objc_storeStrong((id *)&self->_cueSource, 0);
  objc_storeStrong((id *)&self->_currentAudioAsset, 0);
  objc_storeStrong((id *)&self->_viewControllerTransitionVolumeAnimator, 0);
  objc_storeStrong((id *)&self->_fadeOutVolumeAnimator, 0);
  objc_storeStrong((id *)&self->_focusVolumeAnimator, 0);
  objc_storeStrong((id *)&self->_duckingVolumeAnimator, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

- (void)setCueProvider:(id)a3
{
}

- (PXAudioCueProvider)cueProvider
{
  return self->_cueProvider;
}

- (int64_t)audioDesiredPlayState
{
  return self->_audioDesiredPlayState;
}

- (PXStorySongResource)currentSongResource
{
  return self->_currentSongResource;
}

- (float)duckedVolume
{
  return self->_duckedVolume;
}

- (BOOL)isDucked
{
  return self->_isDucked;
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)targetDurationMatchesTimeline
{
  return self->_targetDurationMatchesTimeline;
}

- (NSMutableSet)internalFailedAudioAssets
{
  return self->_internalFailedAudioAssets;
}

- (void)setPlaybackTimer:(id)a3
{
}

- (NSTimer)playbackTimer
{
  return self->_playbackTimer;
}

- (void)setBufferingEvents:(int64_t)a3
{
  self->_bufferingEvents = a3;
}

- (int64_t)bufferingEvents
{
  return self->_bufferingEvents;
}

- (BOOL)shouldDuckForCurrentTouch
{
  return self->_shouldDuckForCurrentTouch;
}

- (NSDate)touchingBeganDate
{
  return self->_touchingBeganDate;
}

- (void)setDuckingReason:(id)a3
{
}

- (NSString)duckingReason
{
  return self->_duckingReason;
}

- (void)setPauseReason:(id)a3
{
}

- (NSString)pauseReason
{
  return self->_pauseReason;
}

- (void)setCuesVersion:(int64_t)a3
{
  self->_cuesVersion = a3;
}

- (int64_t)cuesVersion
{
  return self->_cuesVersion;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 296);
  return self;
}

- (void)setDesiredPlayState:(int64_t)a3
{
  self->_desiredPlayState = a3;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (void)setCueSource:(id)a3
{
}

- (PXAudioCueSource)cueSource
{
  return self->_cueSource;
}

- (PXAudioAsset)currentAudioAsset
{
  return self->_currentAudioAsset;
}

- (PXNumberAnimator)viewControllerTransitionVolumeAnimator
{
  return self->_viewControllerTransitionVolumeAnimator;
}

- (PXNumberAnimator)fadeOutVolumeAnimator
{
  return self->_fadeOutVolumeAnimator;
}

- (PXNumberAnimator)focusVolumeAnimator
{
  return self->_focusVolumeAnimator;
}

- (PXNumberAnimator)duckingVolumeAnimator
{
  return self->_duckingVolumeAnimator;
}

- (void)setCueRequestID:(int64_t)a3
{
  self->_cueRequestID = a3;
}

- (int64_t)cueRequestID
{
  return self->_cueRequestID;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXAudioPlayer)player
{
  return self->_player;
}

- (int64_t)readinessStatus
{
  return self->_readinessStatus;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (NSSet)failedAudioAssets
{
  v2 = [(PXStoryMusicPlayer *)self internalFailedAudioAssets];
  v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (void)_updateFailedAudioAssets
{
  v3 = [(PXStoryMusicPlayer *)self player];
  uint64_t v4 = [v3 state];

  if (v4 == 5)
  {
    v5 = [(PXStoryMusicPlayer *)self player];
    id v11 = [v5 currentAsset];

    if (!self->_internalFailedAudioAssets)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      internalFailedAudioAssets = self->_internalFailedAudioAssets;
      self->_internalFailedAudioAssets = v6;
    }
    v8 = [(PXStoryMusicPlayer *)self internalFailedAudioAssets];
    char v9 = [v8 containsObject:v11];

    if ((v9 & 1) == 0)
    {
      v10 = [(PXStoryMusicPlayer *)self internalFailedAudioAssets];
      [v10 addObject:v11];

      [(PXStoryMusicPlayer *)self signalChange:4];
    }
  }
}

- (void)_invalidateFailedAudioAssets
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFailedAudioAssets];
}

- (void)_handlePlaybackTimerFired:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__PXStoryMusicPlayer__handlePlaybackTimerFired___block_invoke;
  v3[3] = &unk_1E5DCE180;
  v3[4] = self;
  [(PXStoryMusicPlayer *)self performChanges:v3];
}

uint64_t __48__PXStoryMusicPlayer__handlePlaybackTimerFired___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePlayerVolume];
}

- (void)setAudioDesiredPlayState:(int64_t)a3
{
  if (self->_audioDesiredPlayState != a3)
  {
    self->_audioDesiredPlayState = a3;
    [(PXStoryMusicPlayer *)self _invalidatePlayerDesiredPlayState];
    [(PXStoryMusicPlayer *)self _invalidatePlaybackTimer];
  }
}

- (void)_handlePlaybackFailureIfNeeded
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PXStoryMusicPlayer *)self player];
  uint64_t v4 = [v3 state];

  if (v4 == 5)
  {
    v5 = (void *)MEMORY[0x1E4F56658];
    v16[0] = *MEMORY[0x1E4F56560];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v16[1] = @"interactiveMemoryMusicCatalog";
    v17[0] = v7;
    v8 = [(PXStoryMusicPlayer *)self currentAudioAsset];
    unint64_t v9 = [v8 catalog];
    if (v9 > 4) {
      v10 = @"Mock";
    }
    else {
      v10 = off_1E5DC36E0[v9];
    }
    id v11 = v10;
    v17[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    v13 = [(PXStoryMusicPlayer *)self player];
    v14 = [v13 error];
    v15 = objc_msgSend(v12, "px_dictionaryBySettingObject:forKey:", v14, *MEMORY[0x1E4F56568]);
    [v5 sendEvent:@"com.apple.photos.memory.interactiveMemoryMusicFailed" withPayload:v15];

    [(PXStoryMusicPlayer *)self _invalidateError];
  }
}

- (void)setShouldDuckForCurrentTouch:(BOOL)a3
{
  if (self->_shouldDuckForCurrentTouch != a3)
  {
    self->_shouldDuckForCurrentTouch = a3;
    [(PXStoryMusicPlayer *)self _invalidateDucked];
  }
}

- (void)_handleDuckingDelayPassedForTouchingBeganDate:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryMusicPlayer *)self touchingBeganDate];
  int v6 = [v4 isEqualToDate:v5];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__PXStoryMusicPlayer__handleDuckingDelayPassedForTouchingBeganDate___block_invoke;
    v7[3] = &unk_1E5DCE180;
    v7[4] = self;
    [(PXStoryMusicPlayer *)self performChanges:v7];
  }
}

uint64_t __68__PXStoryMusicPlayer__handleDuckingDelayPassedForTouchingBeganDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldDuckForCurrentTouch:1];
}

- (void)setTouchingBeganDate:(id)a3
{
  v5 = (NSDate *)a3;
  int v6 = self->_touchingBeganDate;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(NSDate *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_touchingBeganDate, a3);
      if (v5)
      {
        unint64_t v9 = +[PXStorySettings sharedInstance];
        [v9 musicTouchDuckingDelay];
        double v11 = v10;

        objc_initWeak(&location, self);
        dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
        v13 = [(PXStoryMusicPlayer *)self storyQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __43__PXStoryMusicPlayer_setTouchingBeganDate___block_invoke;
        block[3] = &unk_1E5DD20C8;
        objc_copyWeak(&v17, &location);
        v16 = v5;
        dispatch_after(v12, v13, block);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      else
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __43__PXStoryMusicPlayer_setTouchingBeganDate___block_invoke_2;
        v14[3] = &unk_1E5DCE180;
        v14[4] = self;
        [(PXStoryMusicPlayer *)self performChanges:v14];
      }
    }
  }
}

void __43__PXStoryMusicPlayer_setTouchingBeganDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleDuckingDelayPassedForTouchingBeganDate:*(void *)(a1 + 32)];
}

uint64_t __43__PXStoryMusicPlayer_setTouchingBeganDate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldDuckForCurrentTouch:0];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackStartTimeForIncomingSong:(SEL)a3
{
  id v6 = a4;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  v7 = [(PXStoryMusicPlayer *)self model];
  long long v14 = 0uLL;
  int64_t v15 = 0;
  char v8 = [(PXStoryMusicPlayer *)self player];
  unint64_t v9 = v8;
  if (v8)
  {
    [v8 currentTime];
  }
  else
  {
    long long v14 = 0uLL;
    int64_t v15 = 0;
  }

  if ([v7 viewMode] == 4
    && ([v7 isPresentingMusicEditor] & 1) == 0
    && (BYTE12(v14) & 0x1D) == 1)
  {
    *(_OWORD *)&retstr->var0 = v14;
    retstr->var3 = v15;
  }
  else
  {
    double v10 = PXAudioAssetDefaultEntryPoint(v6);
    [v10 time];
    CMTimeMakeWithSeconds(&v13, v11, 600);
    *(CMTime *)retstr = v13;
  }
  return result;
}

- (id)windowSceneID
{
  id v2 = [(PXStoryMusicPlayer *)self model];
  v3 = [v2 windowSceneID];

  return v3;
}

- (id)AVAudioSessionForPlayer:(id)a3
{
  v3 = [(PXStoryMusicPlayer *)self model];
  id v4 = [v3 audioSession];

  return v4;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v8 = a4;
  NSStringFromSelector(sel_musicTargetLoudnessLKFS);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v8)
  {

    goto LABEL_5;
  }
  int v6 = [v8 isEqualToString:v5];

  if (v6)
  {
LABEL_5:
    v7 = [(PXStoryMusicPlayer *)self player];
    [v7 performChanges:&__block_literal_global_191];
  }
}

void __50__PXStoryMusicPlayer_settings_changedValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[PXStorySettings sharedInstance];
  [v3 musicTargetLoudnessLKFS];
  objc_msgSend(v2, "setTargetLoudnessInLKFS:");
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  id v5 = [(PXStoryMusicPlayer *)self player];
  int v6 = [v5 error];
  [v4 setObject:v6 forKeyedSubscript:@"MusicPlayback"];

  v7 = (void *)[v4 copy];
  return v7;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t v9 = [(PXStoryMusicPlayer *)self player];
  uint64_t v10 = [v9 desiredPlayState];
  if (a3 == 2)
  {
    uint64_t v11 = v10;
    dispatch_time_t v12 = [(PXStoryMusicPlayer *)self currentSongResource];
    [v8 appendFormat:@"Song Resource: %@\n", v12];

    CMTime v13 = [(PXStoryMusicPlayer *)self currentSongResource];
    long long v14 = objc_msgSend(v13, "px_storyResourceSongAsset");
    int64_t v15 = PXAudioAssetDefaultEntryPoint(v14);
    [v15 time];
    objc_msgSend(v8, "appendFormat:", @"   Start Time: %.0f\n", v16);

    id v17 = [(PXStoryMusicPlayer *)self model];
    v18 = [v17 configuration];
    v19 = [v18 appleMusicStatusProvider];
    uint64_t v20 = [v19 statusForCapability:1];
    if ((unint64_t)(v20 - 1) > 2) {
      v21 = @"Unknown";
    }
    else {
      v21 = off_1E5DAEAE8[v20 - 1];
    }
    v22 = v21;
    [v8 appendFormat:@"Music Status: %@\n", v22];

    v23 = [(PXStoryMusicPlayer *)self duckingVolumeAnimator];
    [v23 presentationValue];
    if (v24 >= 1.0)
    {
      [v8 appendFormat:@"      Ducking: %@\n", @"Not Ducked"];
    }
    else
    {
      id v25 = [NSString alloc];
      uint64_t v26 = [(PXStoryMusicPlayer *)self duckingReason];
      v27 = (void *)v26;
      if (v26) {
        v28 = (__CFString *)v26;
      }
      else {
        v28 = @"Not Ducked";
      }
      v29 = [(PXStoryMusicPlayer *)self duckingVolumeAnimator];
      [v29 presentationValue];
      v31 = (void *)[v25 initWithFormat:@"%@ (%.2f)", v28, v30];
      [v8 appendFormat:@"      Ducking: %@\n", v31];
    }
    v32 = [(PXStoryMusicPlayer *)self fadeOutVolumeAnimator];
    [v32 presentationValue];
    if (v33 >= 1.0)
    {
      [v8 appendFormat:@"       Fading: %@\n", @"Not Fading"];
    }
    else
    {
      id v34 = [NSString alloc];
      v35 = [(PXStoryMusicPlayer *)self fadeOutVolumeAnimator];
      [v35 presentationValue];
      v37 = (void *)[v34 initWithFormat:@"Fading Out (%.2f)", v36];
      [v8 appendFormat:@"       Fading: %@\n", v37];
    }
    v38 = [(PXStoryMusicPlayer *)self viewControllerTransitionVolumeAnimator];
    [v38 presentationValue];
    objc_msgSend(v8, "appendFormat:", @" VCTransition: %0.2f\n", v39);

    [v9 volume];
    objc_msgSend(v8, "appendFormat:", @"       Volume: %.1f\n", v40);
    v41 = @"Paused";
    if (v11 == 1) {
      v41 = @"Playing";
    }
    v42 = v41;
    [v8 appendFormat:@"Desired State: %@", v42];

    v43 = [(PXStoryMusicPlayer *)self failedAudioAssets];
    if ([v43 count])
    {
      [(PXStoryMusicPlayer *)self failedAudioAssets];
      objc_claimAutoreleasedReturnValue();
      PXMap();
    }
    if (!v11)
    {
      v44 = [(PXStoryMusicPlayer *)self pauseReason];
      [v8 appendFormat:@"(%@)", v44];
    }
    v45 = [(PXStoryMusicPlayer *)self cueSource];
    if (v45)
    {
      [(PXStoryMusicPlayer *)self currentTime];
      CMTimeMake(&duration, 3, 1);
      CMTimeRangeMake(&v57, &start, &duration);
      long long v53 = *MEMORY[0x1E4F1F9F8];
      uint64_t v54 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      long long v46 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      v52[0] = *MEMORY[0x1E4F1FA20];
      v52[1] = v46;
      v52[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
      v47 = [v45 diagnosticStringForTimeRange:&v57 indicatorTime:&v53 rangeIndicatorTimeRange:v52 stringLength:50];
      [v8 appendFormat:@"\nCues: \n%@", v47];
    }
    else
    {
      [v8 appendString:@"\nCues: None"];
    }
  }
  [v8 appendString:@"\n\nPXAudioPlayer\n"];
  v48 = [(PXStoryMusicPlayer *)self player];
  v49 = objc_msgSend(v48, "lcdStringForSize:", width, height);
  [v8 appendString:v49];

  v50 = (void *)[v8 copy];
  return v50;
}

id __59__PXStoryMusicPlayer_diagnosticTextForHUDType_displaySize___block_invoke(uint64_t a1, void *a2)
{
  return PXAudioAssetShortDescription(a2);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PXStoryMusicPlayer_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5DCE118;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  [(PXStoryMusicPlayer *)self performChanges:v5];
}

void __51__PXStoryMusicPlayer_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == StyleManagerContext_266378)
  {
    if (*(unsigned char *)(a1 + 49)) {
      [*(id *)(a1 + 32) _invalidateFocusVolumeAnimator];
    }
    goto LABEL_39;
  }
  if (v3 == ModelContext_266379)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if ((v4 & 0x18000210002) != 0)
    {
      [*(id *)(a1 + 32) _invalidateDesiredPlayState];
      uint64_t v4 = *(void *)(a1 + 48);
    }
    if ((v4 & 0x8000000000) != 0)
    {
      [*(id *)(a1 + 32) _invalidateCurrentAudioAsset];
      uint64_t v4 = *(void *)(a1 + 48);
      if ((v4 & 0x800000000000) == 0)
      {
LABEL_13:
        if ((v4 & 0x400) == 0) {
          goto LABEL_14;
        }
        goto LABEL_31;
      }
    }
    else if ((v4 & 0x800000000000) == 0)
    {
      goto LABEL_13;
    }
    [*(id *)(a1 + 32) _invalidateDesiredPlayState];
    uint64_t v4 = *(void *)(a1 + 48);
    if ((v4 & 0x400) == 0)
    {
LABEL_14:
      if ((v4 & 0x40000000000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
LABEL_31:
    [*(id *)(a1 + 32) _invalidateCurrentSongResource];
    uint64_t v4 = *(void *)(a1 + 48);
    if ((v4 & 0x40000000000) == 0)
    {
LABEL_16:
      if ((v4 & 0x10100) != 0)
      {
        [*(id *)(a1 + 32) _invalidateDucked];
        uint64_t v4 = *(void *)(a1 + 48);
      }
      if ((v4 & 0x4000000) != 0)
      {
        [*(id *)(a1 + 32) _invalidateTouchingBeganDate];
        uint64_t v4 = *(void *)(a1 + 48);
        if ((v4 & 0x10) == 0)
        {
LABEL_20:
          if ((v4 & 0x400000000000) == 0) {
            goto LABEL_21;
          }
          goto LABEL_35;
        }
      }
      else if ((v4 & 0x10) == 0)
      {
        goto LABEL_20;
      }
      [*(id *)(a1 + 32) _invalidateTargetDuration];
      uint64_t v4 = *(void *)(a1 + 48);
      if ((v4 & 0x400000000000) == 0)
      {
LABEL_21:
        if ((v4 & 0x200000000000000) == 0) {
          goto LABEL_22;
        }
        goto LABEL_36;
      }
LABEL_35:
      [*(id *)(a1 + 32) _invalidateFadeOutVolumeAnimator];
      uint64_t v4 = *(void *)(a1 + 48);
      if ((v4 & 0x200000000000000) == 0)
      {
LABEL_22:
        if ((v4 & 0x10000) == 0) {
          goto LABEL_23;
        }
        goto LABEL_37;
      }
LABEL_36:
      [*(id *)(a1 + 32) _invalidateViewControllerTransitionVolumeAnimator];
      uint64_t v4 = *(void *)(a1 + 48);
      if ((v4 & 0x10000) == 0)
      {
LABEL_23:
        if ((v4 & 0x200000000000000) == 0) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }
LABEL_37:
      [*(id *)(a1 + 32) _invalidateCurrentSongResource];
      if ((*(void *)(a1 + 48) & 0x200000000000000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
LABEL_15:
    [*(id *)(a1 + 32) _invalidateDucked];
    uint64_t v4 = *(void *)(a1 + 48);
    goto LABEL_16;
  }
  if (v3 != PlayerContext)
  {
    if (v3 != VolumeAnimatorContext)
    {
      int v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PXStoryMusicPlayer.m" lineNumber:704 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((*(unsigned char *)(a1 + 48) & 2) == 0) {
      goto LABEL_39;
    }
LABEL_38:
    [*(id *)(a1 + 32) _invalidatePlayerVolume];
    goto LABEL_39;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if ((v5 & 4) != 0)
  {
    [*(id *)(a1 + 32) _invalidateReadinessStatus];
    [*(id *)(a1 + 32) _invalidatePlayerDesiredPlayState];
    [*(id *)(a1 + 32) _invalidateFailedAudioAssets];
    [*(id *)(a1 + 32) _handlePlaybackFailureIfNeeded];
    uint64_t v5 = *(void *)(a1 + 48);
  }
  if ((v5 & 0x20) != 0) {
    [*(id *)(a1 + 32) _invalidateError];
  }
LABEL_39:
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryMusicPlayer;
  [(PXStoryMusicPlayer *)&v4 didPerformChanges];
  uint64_t v3 = [(PXStoryMusicPlayer *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryMusicPlayer;
  [(PXStoryMusicPlayer *)&v3 performChanges:a3];
}

- (id)diagnosticCueStringForSize:(CGSize)a3 withIndicatorTime:(id *)a4 rangeIndicatorTimeRange:(id *)a5
{
  memset(&v20, 0, sizeof(v20));
  CMTimeMake(&v20, 3, 1);
  id v8 = [(PXStoryMusicPlayer *)self cueSource];
  [(PXStoryMusicPlayer *)self currentTime];
  long long v13 = *(_OWORD *)&v20.value;
  *(void *)&long long v14 = v20.epoch;
  CMTimeRangeMake(&v19, &start, (CMTime *)&v13);
  long long v9 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  long long v10 = *(_OWORD *)&a5->var0.var3;
  long long v13 = *(_OWORD *)&a5->var0.var0;
  long long v14 = v10;
  long long v15 = *(_OWORD *)&a5->var1.var1;
  long long v16 = v9;
  uint64_t v11 = [v8 diagnosticStringForTimeRange:&v19 indicatorTime:&v16 rangeIndicatorTimeRange:&v13 stringLength:45];

  return v11;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  uint64_t v5 = [(PXStoryMusicPlayer *)self currentSongResource];

  if (v5)
  {
    id v7 = [(PXStoryMusicPlayer *)self player];
    if (v7)
    {
      long long v9 = v7;
      [v7 currentTime];
      id v7 = v9;
    }
    else
    {
      retstr->var0 = 0;
      *(void *)&retstr->var1 = 0;
      retstr->int64_t var3 = 0;
    }
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->int64_t var3 = *(void *)(v8 + 16);
  }
  return result;
}

- (void)_updateError
{
  objc_super v3 = [(PXStoryMusicPlayer *)self player];
  objc_super v4 = [v3 error];

  if (v4)
  {
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(6, v4, @"Music playback failed.", v5, v6, v7, v8, v9, v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    long long v10 = [(PXStoryMusicPlayer *)self model];
    [v10 reportNetworkRelatedPlaybackFailure];
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v11 = [(PXStoryMusicPlayer *)self model];
  dispatch_time_t v12 = [v11 errorReporter];
  [v12 setError:v14 forComponent:@"MusicPlayback"];
}

- (void)_invalidateError
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateError];
}

- (void)_updateViewControllerTransitionVolumeAnimator
{
  objc_super v3 = [(PXStoryMusicPlayer *)self model];
  [v3 volumeDuringViewControllerTransition];
  float v5 = v4;

  if (v5 >= 0.0) {
    double v6 = v5;
  }
  else {
    double v6 = 0.0;
  }
  uint64_t v7 = [(PXStoryMusicPlayer *)self viewControllerTransitionVolumeAnimator];
  [v7 value];
  if (v6 != v8)
  {
    [v7 presentationValue];
    v10[1] = 3221225472;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[2] = __67__PXStoryMusicPlayer__updateViewControllerTransitionVolumeAnimator__block_invoke;
    v10[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v10[4] = v6;
    objc_msgSend(v7, "performChangesWithDuration:curve:changes:", 1, v10, vabdd_f64(v6, v9) / 3.33333333);
  }
}

uint64_t __67__PXStoryMusicPlayer__updateViewControllerTransitionVolumeAnimator__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

- (void)_invalidateViewControllerTransitionVolumeAnimator
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateViewControllerTransitionVolumeAnimator];
}

- (void)_updateFocusVolumeAnimator
{
  objc_super v3 = [(PXStoryMusicPlayer *)self model];
  float v4 = [v3 styleManager];
  [v4 selectionFocus];
  double v6 = v5;

  float v7 = vabdd_f64(v6, round(v6)) * -2.0 + 1.0;
  double v8 = [(PXStoryMusicPlayer *)self focusVolumeAnimator];
  [v8 value];
  double v10 = v9;

  uint64_t v11 = [(PXStoryMusicPlayer *)self focusVolumeAnimator];
  dispatch_time_t v12 = v11;
  if (v10 >= v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__PXStoryMusicPlayer__updateFocusVolumeAnimator__block_invoke_2;
    v14[3] = &__block_descriptor_36_e35_v16__0___PXMutableNumberAnimator__8l;
    float v15 = v7;
    [v11 performChangesWithoutAnimation:v14];
  }
  else
  {
    uint64_t v13 = +[PXStorySettings sharedInstance];
    [v13 focusChangeFadeDuration];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __48__PXStoryMusicPlayer__updateFocusVolumeAnimator__block_invoke;
    v16[3] = &__block_descriptor_36_e35_v16__0___PXMutableNumberAnimator__8l;
    float v17 = v7;
    objc_msgSend(v12, "performChangesWithDuration:curve:changes:", 4, v16);
  }
}

uint64_t __48__PXStoryMusicPlayer__updateFocusVolumeAnimator__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(float *)(a1 + 32)];
}

uint64_t __48__PXStoryMusicPlayer__updateFocusVolumeAnimator__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:*(float *)(a1 + 32)];
}

- (void)_invalidateFocusVolumeAnimator
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFocusVolumeAnimator];
}

- (void)_updateDuckingVolumeAnimator
{
  float v3 = 1.0;
  if ([(PXStoryMusicPlayer *)self isDucked])
  {
    [(PXStoryMusicPlayer *)self duckedVolume];
    float v3 = v4;
  }
  double v5 = [(PXStoryMusicPlayer *)self duckingVolumeAnimator];
  double v6 = +[PXStorySettings sharedInstance];
  [v6 duckingFadeDuration];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PXStoryMusicPlayer__updateDuckingVolumeAnimator__block_invoke;
  v7[3] = &__block_descriptor_36_e35_v16__0___PXMutableNumberAnimator__8l;
  float v8 = v3;
  objc_msgSend(v5, "performChangesWithDuration:curve:changes:", 4, v7);
}

uint64_t __50__PXStoryMusicPlayer__updateDuckingVolumeAnimator__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(float *)(a1 + 32)];
}

- (void)_invalidateDuckingVolumeAnimator
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDuckingVolumeAnimator];
}

- (void)_updateFadeOutVolumeAnimator
{
  float v3 = [(PXStoryMusicPlayer *)self model];
  [v3 outroFractionCompleted];
  float v5 = v4;

  double v6 = [(PXStoryMusicPlayer *)self fadeOutVolumeAnimator];
  float v7 = v6;
  if (v5 <= 0.0)
  {
    [v6 performChangesWithDuration:4 curve:&__block_literal_global_266399 changes:0.3];
  }
  else
  {
    float v8 = [(PXStoryMusicPlayer *)self model];
    double v9 = [v8 configuration];
    float v10 = 0.0;
    if (([v9 isPresentedForAirPlay] & 1) == 0)
    {
      uint64_t v11 = +[PXStorySettings sharedInstance];
      [v11 musicFadeOutVolume];
      float v10 = v12;
    }
    float v13 = PXStoryVolumeForFadeOutFractionCompleted(v5);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__PXStoryMusicPlayer__updateFadeOutVolumeAnimator__block_invoke;
    v14[3] = &__block_descriptor_36_e35_v16__0___PXMutableNumberAnimator__8l;
    float v15 = v10 + (float)(v13 * (float)(1.0 - v10));
    [v7 performChangesUsingDefaultSpringAnimationWithInitialVelocity:v14 changes:0.0];
  }
}

uint64_t __50__PXStoryMusicPlayer__updateFadeOutVolumeAnimator__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(float *)(a1 + 32)];
}

uint64_t __50__PXStoryMusicPlayer__updateFadeOutVolumeAnimator__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:1.0];
}

- (void)_invalidateFadeOutVolumeAnimator
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFadeOutVolumeAnimator];
}

- (void)_updateDucked
{
  id v15 = [(PXStoryMusicPlayer *)self model];
  uint64_t v3 = [v15 viewMode];
  double v4 = [(PXStoryMusicPlayer *)self model];
  int v5 = [v4 isAtPlaybackEnd];

  if (v5)
  {
    double v6 = +[PXStorySettings sharedInstance];
    [v6 musicFadeOutVolume];
    float v8 = v7;
    double v9 = @"Story Played To End";
LABEL_11:

    uint64_t v13 = 1;
    goto LABEL_12;
  }
  if (v3 != 1 && v3 != 4)
  {
    double v6 = +[PXStorySettings sharedInstance];
    [v6 musicBackgroundVolume];
    float v8 = v11;
    double v9 = @"View Mode";
    goto LABEL_11;
  }
  if ([(PXStoryMusicPlayer *)self shouldDuckForCurrentTouch] && v3 == 1)
  {
    double v6 = +[PXStorySettings sharedInstance];
    [v6 musicBackgroundVolume];
    float v8 = v10;
    double v9 = @"Touching Fullsize Player";
    goto LABEL_11;
  }
  if ([v15 wantsMusicDucked])
  {
    double v6 = +[PXStorySettings sharedInstance];
    [v6 musicDuckedVolume];
    float v8 = v12;
    double v9 = @"Model";
    goto LABEL_11;
  }
  uint64_t v13 = 0;
  double v9 = 0;
  float v8 = 1.0;
LABEL_12:
  [(PXStoryMusicPlayer *)self setIsDucked:v13];
  *(float *)&double v14 = v8;
  [(PXStoryMusicPlayer *)self setDuckedVolume:v14];
  [(PXStoryMusicPlayer *)self setDuckingReason:v9];
}

- (void)_invalidateDucked
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDucked];
}

- (void)_updateTouchingBeganDate
{
  id v4 = [(PXStoryMusicPlayer *)self model];
  if ([v4 isTouching])
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    [(PXStoryMusicPlayer *)self setTouchingBeganDate:v3];
  }
  else
  {
    [(PXStoryMusicPlayer *)self setTouchingBeganDate:0];
  }
}

- (void)_invalidateTouchingBeganDate
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTouchingBeganDate];
}

- (void)_updatePlayerVolume
{
  uint64_t v3 = [(PXStoryMusicPlayer *)self duckingVolumeAnimator];
  [v3 presentationValue];
  float v5 = v4;

  double v6 = [(PXStoryMusicPlayer *)self focusVolumeAnimator];
  [v6 presentationValue];
  float v8 = v7;

  double v9 = [(PXStoryMusicPlayer *)self fadeOutVolumeAnimator];
  [v9 presentationValue];
  float v11 = v10;

  if (v5 >= v11) {
    float v12 = v11;
  }
  else {
    float v12 = v5;
  }
  float v13 = v12 * v8;
  double v14 = +[PXStorySettings sharedInstance];
  float v15 = (float)[v14 musicDemoVolumeAdjustment];

  memset(&v34, 0, sizeof(v34));
  long long v16 = [(PXStoryMusicPlayer *)self player];
  float v17 = v16;
  if (v16) {
    [v16 currentTime];
  }
  else {
    memset(&v34, 0, sizeof(v34));
  }
  float v18 = v13 * v15;

  if ((v34.flags & 0x1D) == 1)
  {
    CMTime time = v34;
    double Seconds = CMTimeGetSeconds(&time);
    CMTime v20 = [(PXStoryMusicPlayer *)self currentAudioAsset];
    v21 = PXAudioAssetDefaultEntryPoint(v20);

    if (v21)
    {
      [v21 time];
      [v21 fadeInGainAtOffset:Seconds - v22];
      float v18 = v18 * v23;
    }
  }
  double v24 = [(PXStoryMusicPlayer *)self viewControllerTransitionVolumeAnimator];
  [v24 presentationValue];
  float v26 = v25 * v18;

  v27 = [(PXStoryMusicPlayer *)self model];
  [v27 volume];
  float v29 = v28 * v26;

  self->_volume = v29;
  uint64_t v30 = [(PXStoryMusicPlayer *)self player];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __41__PXStoryMusicPlayer__updatePlayerVolume__block_invoke;
  v31[3] = &__block_descriptor_36_e32_v16__0___PXMutableAudioPlayer__8l;
  float v32 = v29;
  [v30 performChanges:v31];
}

uint64_t __41__PXStoryMusicPlayer__updatePlayerVolume__block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setVolume:a3];
}

- (void)_invalidatePlayerVolume
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePlayerVolume];
}

- (void)_updateModelProperties
{
  int64_t v3 = [(PXStoryMusicPlayer *)self readinessStatus];
  double v4 = [(PXStoryMusicPlayer *)self model];
  float v5 = [v4 storyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PXStoryMusicPlayer__updateModelProperties__block_invoke;
  v7[3] = &unk_1E5DD08D8;
  id v8 = v4;
  int64_t v9 = v3;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __44__PXStoryMusicPlayer__updateModelProperties__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__PXStoryMusicPlayer__updateModelProperties__block_invoke_2;
  v3[3] = &__block_descriptor_40_e31_v16__0___PXStoryMutableModel__8l;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 performChanges:v3];
}

uint64_t __44__PXStoryMusicPlayer__updateModelProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setMusicReadinessStatus:*(void *)(a1 + 32)];
}

- (void)_invalidateModelProperties
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateModelProperties];
}

- (void)_updateReadinessStatus
{
  id v6 = [(PXStoryMusicPlayer *)self currentSongResource];
  if (PXStorySongResourceIsNullResource(v6))
  {
    uint64_t v3 = 3;
  }
  else
  {
    double v4 = [(PXStoryMusicPlayer *)self player];
    uint64_t v5 = [v4 state];

    if ((unint64_t)(v5 - 2) > 3) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_1AB35CAD8[v5 - 2];
    }
  }
  [(PXStoryMusicPlayer *)self setReadinessStatus:v3];
}

- (void)_invalidateReadinessStatus
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateReadinessStatus];
}

- (void)_updatePlaybackTimer
{
  int64_t v3 = [(PXStoryMusicPlayer *)self audioDesiredPlayState];
  double v4 = [(PXStoryMusicPlayer *)self playbackTimer];
  uint64_t v5 = v4;
  if (v3 == 1)
  {

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E4F1CB00], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__handlePlaybackTimerFired_, 0, 1, 0.0333333333);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      [(PXStoryMusicPlayer *)self setPlaybackTimer:v6];
    }
  }
  else
  {
    [v4 invalidate];

    [(PXStoryMusicPlayer *)self setPlaybackTimer:0];
  }
}

- (void)_invalidatePlaybackTimer
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePlaybackTimer];
}

- (void)_updatePlayerDesiredPlayState
{
  int64_t v3 = [(PXStoryMusicPlayer *)self audioDesiredPlayState];
  double v4 = [(PXStoryMusicPlayer *)self player];
  if ([v4 state] != 5)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__PXStoryMusicPlayer__updatePlayerDesiredPlayState__block_invoke;
    v5[3] = &unk_1E5DCE0B0;
    v5[4] = self;
    v5[5] = v3;
    [v4 performChanges:v5];
  }
}

void __51__PXStoryMusicPlayer__updatePlayerDesiredPlayState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    if (v5 == 1 && [v3 desiredPlayState] != 1)
    {
      id v6 = [*(id *)(a1 + 32) model];
      double v7 = v6;
      if (v6) {
        [v6 nominalPlaybackTime];
      }
      else {
        memset(&v11[1], 0, sizeof(CMTime));
      }
      CMTime lhs = v11[1];
      id v8 = [v4 currentAsset];
      int64_t v9 = PXAudioAssetDefaultEntryPoint(v8);
      [v9 time];
      CMTimeMakeWithSeconds(v11, v10, PXAudioDefaultCMTimeScale);
      CMTimeAdd(&v13, &lhs, v11);
      [v4 playFromStartTime:&v13];
    }
  }
  else
  {
    [v3 setDesiredPlayState:0];
  }
}

- (void)_invalidatePlayerDesiredPlayState
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePlayerDesiredPlayState];
}

- (void)_updateDesiredPlayState
{
  double v4 = [(PXStoryMusicPlayer *)self model];
  unint64_t v5 = [v4 viewMode];
  char v6 = 0;
  if (v5 <= 5)
  {
    if (((1 << v5) & 0x36) != 0)
    {
      char v6 = 1;
    }
    else if (!v5)
    {
      int64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PXStoryMusicPlayer.m" lineNumber:333 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PXStoryMusicPlayer__updateDesiredPlayState__block_invoke;
  aBlock[3] = &unk_1E5DCE088;
  id v11 = v4;
  float v12 = self;
  char v13 = v6;
  id v7 = v4;
  id v8 = (unsigned int (**)(void))_Block_copy(aBlock);
  [(PXStoryMusicPlayer *)self setAudioDesiredPlayState:v8[2]() ^ 1];
}

uint64_t __45__PXStoryMusicPlayer__updateDesiredPlayState__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isPresentingMusicEditor] & 1) == 0)
  {
    if ([*(id *)(a1 + 32) desiredPlayState] != 1)
    {
      id v2 = NSString;
      id v3 = "model.desiredPlayState != PXStoryDesiredPlayStatePlaying";
      goto LABEL_15;
    }
    if ([*(id *)(a1 + 32) viewMode] != 4 && objc_msgSend(*(id *)(a1 + 32), "readinessStatus") != 3)
    {
      id v2 = NSString;
      id v3 = "model.readinessStatus != PXStoryPlaybackReadinessStatusReadyToPlay";
      goto LABEL_15;
    }
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    id v2 = NSString;
    id v3 = "!canPlayInCurrentViewMode";
    goto LABEL_15;
  }
  if (([*(id *)(a1 + 40) isActive] & 1) == 0)
  {
    id v2 = NSString;
    id v3 = "!self.isActive";
    goto LABEL_15;
  }
  if ([*(id *)(a1 + 32) isPresentingColorGradeEditor])
  {
    id v2 = NSString;
    id v3 = "model.isPresentingColorGradeEditor";
LABEL_15:
    char v6 = [v2 stringWithUTF8String:v3];
    [*(id *)(a1 + 40) setPauseReason:v6];

    return 1;
  }
  double v4 = [*(id *)(a1 + 40) currentSongResource];
  int IsNullResource = PXStorySongResourceIsNullResource(v4);

  if (IsNullResource)
  {
    id v2 = NSString;
    id v3 = "songResourceIsNull";
    goto LABEL_15;
  }
  [*(id *)(a1 + 40) setPauseReason:0];
  return 0;
}

- (void)_invalidateDesiredPlayState
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDesiredPlayState];
}

- (void)_updatePlayerCurrentAsset
{
  id v3 = [(PXStoryMusicPlayer *)self currentAudioAsset];
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  [(PXStoryMusicPlayer *)self playbackStartTimeForIncomingSong:v3];
  double v4 = [(PXStoryMusicPlayer *)self player];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PXStoryMusicPlayer__updatePlayerCurrentAsset__block_invoke;
  v6[3] = &unk_1E5DCE060;
  id v7 = v3;
  long long v8 = v10;
  uint64_t v9 = v11;
  id v5 = v3;
  [v4 performChanges:v6];
}

uint64_t __47__PXStoryMusicPlayer__updatePlayerCurrentAsset__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  return [a2 setCurrentAsset:v2 startTime:&v4];
}

- (void)_invalidatePlayerCurrentAsset
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePlayerCurrentAsset];
}

- (void)_handleAudioCues:(id)a3 asset:(id)a4 error:(id)a5 requestID:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = [(PXStoryMusicPlayer *)self storyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PXStoryMusicPlayer__handleAudioCues_asset_error_requestID___block_invoke;
  block[3] = &unk_1E5DCE038;
  id v20 = v12;
  int64_t v21 = a6;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __61__PXStoryMusicPlayer__handleAudioCues_asset_error_requestID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t result = [*(id *)(a1 + 32) cueRequestID];
  if (v2 == result)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (!v4)
    {
      uint64_t v5 = PLAudioPlaybackGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)(a1 + 48);
        uint64_t v7 = *(void *)(a1 + 56);
        int v8 = 138412546;
        uint64_t v9 = v6;
        __int16 v10 = 2112;
        uint64_t v11 = v7;
        _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Failed to retrieve audio cues for asset %@. Error: %@", (uint8_t *)&v8, 0x16u);
      }

      uint64_t v4 = *(void *)(a1 + 40);
    }
    return [*(id *)(a1 + 32) setCueSource:v4];
  }
  return result;
}

- (void)_updateCueSource
{
  id v3 = [(PXStoryMusicPlayer *)self currentAudioAsset];
  objc_initWeak(&location, self);
  [(PXStoryMusicPlayer *)self setCueRequestID:[(PXStoryMusicPlayer *)self cueRequestID] + 1];
  uint64_t v4 = [(PXStoryMusicPlayer *)self cueRequestID];
  uint64_t v5 = [(PXStoryMusicPlayer *)self cueProvider];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__PXStoryMusicPlayer__updateCueSource__block_invoke;
  v8[3] = &unk_1E5DCE010;
  objc_copyWeak(v10, &location);
  id v6 = v3;
  id v9 = v6;
  v10[1] = v4;
  id v7 = (id)[v5 requestCuesForAudioAsset:v6 resultHandler:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __38__PXStoryMusicPlayer__updateCueSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleAudioCues:v7 asset:*(void *)(a1 + 32) error:v6 requestID:*(void *)(a1 + 48)];
}

- (void)_invalidateCueSource
{
  [(PXStoryMusicPlayer *)self setCueSource:0];
  id v3 = [(PXStoryMusicPlayer *)self updater];
  [v3 setNeedsUpdateOf:sel__updateCueSource];
}

- (void)_updateCurrentAudioAsset
{
  id v4 = [(PXStoryMusicPlayer *)self currentSongResource];
  id v3 = objc_msgSend(v4, "px_storyResourceSongAsset");
  [(PXStoryMusicPlayer *)self setCurrentAudioAsset:v3];
}

- (void)_invalidateCurrentAudioAsset
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentAudioAsset];
}

- (void)_updateCurrentSongResource
{
  id v4 = [(PXStoryMusicPlayer *)self model];
  uint64_t v5 = [v4 activeSongResource];

  id v6 = objc_msgSend(v5, "px_storyResourceSongAsset");
  if ([v6 catalog] == 4)
  {
    [(PXStoryMusicPlayer *)self targetDuration];
    if ((v14[36] & 0x1D) == 1)
    {
      id v7 = v6;
      if (v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_5:
          [(PXStoryMusicPlayer *)self targetDuration];
          uint64_t v8 = [v7 assetWithTargetDuration:v14];

          uint64_t v5 = (void *)v8;
          goto LABEL_6;
        }
        id v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v12 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v12);
        char v13 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
        [v9 handleFailureInMethod:a2, self, @"PXStoryMusicPlayer.m", 268, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v11, v13 object file lineNumber description];
      }
      else
      {
        id v9 = [MEMORY[0x1E4F28B00] currentHandler];
        __int16 v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        [v9 handleFailureInMethod:a2, self, @"PXStoryMusicPlayer.m", 268, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v11 object file lineNumber description];
      }

      goto LABEL_5;
    }
  }
LABEL_6:
  [(PXStoryMusicPlayer *)self setCurrentSongResource:v5];
}

- (void)_invalidateCurrentSongResource
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentSongResource];
}

- (void)_updateTargetDuration
{
  if ([(PXStoryMusicPlayer *)self targetDurationMatchesTimeline])
  {
    id v3 = [(PXStoryMusicPlayer *)self model];
    id v4 = [v3 timeline];
    uint64_t v5 = v4;
    if (v4)
    {
      [v4 timeRange];
    }
    else
    {
      memset(v9, 0, sizeof(v9));
      long long v8 = 0u;
    }
    long long v6 = *(_OWORD *)((char *)v9 + 8);
    uint64_t v7 = *((void *)&v9[1] + 1);
    [(PXStoryMusicPlayer *)self setTargetDuration:&v6];
  }
}

- (void)_invalidateTargetDuration
{
  id v2 = [(PXStoryMusicPlayer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTargetDuration];
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  long long v6 = [(PXStoryMusicPlayer *)self model];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@ %p; Model: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (void)replay
{
  id v3 = [(PXStoryMusicPlayer *)self player];
  id v4 = [v3 currentAsset];

  memset(&v10, 0, sizeof(v10));
  uint64_t v5 = PXAudioAssetDefaultEntryPoint(v4);
  [v5 time];
  CMTimeMakeWithSeconds(&v10, v6, 600);

  uint64_t v7 = [(PXStoryMusicPlayer *)self player];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__PXStoryMusicPlayer_replay__block_invoke;
  v8[3] = &__block_descriptor_56_e32_v16__0___PXMutableAudioPlayer__8l;
  CMTime v9 = v10;
  [v7 performChanges:v8];
}

uint64_t __28__PXStoryMusicPlayer_replay__block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [a2 replayFromTime:&v3];
}

- (id)diagnosticTextForHUDType:(int64_t)a3
{
  id v4 = [NSString alloc];
  [(PXStoryMusicPlayer *)self currentTime];
  CMTime v9 = v8;
  uint64_t v5 = PXStoryTimeDescription(&v9);
  Float64 v6 = (void *)[v4 initWithFormat:@"Music Time: %@", v5];

  return v6;
}

- (void)setDuckedVolume:(float)a3
{
  if (self->_duckedVolume != a3)
  {
    self->_duckedVolume = a3;
    [(PXStoryMusicPlayer *)self _invalidateDuckingVolumeAnimator];
  }
}

- (void)setIsDucked:(BOOL)a3
{
  if (self->_isDucked != a3)
  {
    self->_isDucked = a3;
    [(PXStoryMusicPlayer *)self _invalidateDuckingVolumeAnimator];
  }
}

- (void)setTargetDuration:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_$95D729B680665BEAEFA1D6FCA8238556 targetDuration = &self->_targetDuration;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 targetDuration = self->_targetDuration;
  if (CMTimeCompare(&time1, (CMTime *)&targetDuration))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_targetDuration->epoch = a3->var3;
    *(_OWORD *)&p_targetDuration->value = v6;
    uint64_t v7 = [(PXStoryMusicPlayer *)self log];
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        CMTimeValue v10 = [(PXStoryMusicPlayer *)self logContext];
        LODWORD(time1.value) = 134217984;
        *(CMTimeValue *)((char *)&time1.value + 4) = v10;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v9, "PXStoryMusicPlayer.targetDuration", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&time1, 0xCu);
      }
    }

    uint64_t v11 = v7;
    os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v13 = v12;
      if (os_signpost_enabled(v11))
      {
        CMTimeValue v14 = [(PXStoryMusicPlayer *)self logContext];
        CMTime time1 = (CMTime)*a3;
        id v15 = PXStoryTimeDescription(&time1);
        LODWORD(time1.value) = 134218242;
        *(CMTimeValue *)((char *)&time1.value + 4) = v14;
        LOWORD(time1.flags) = 2114;
        *(void *)((char *)&time1.flags + 2) = v15;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_EVENT, v13, "PXStoryMusicPlayer.targetDuration", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&time1, 0x16u);
      }
    }

    id v16 = v11;
    os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, self);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v18 = v17;
      if (os_signpost_enabled(v16))
      {
        CMTimeValue v19 = [(PXStoryMusicPlayer *)self logContext];
        CMTime time1 = (CMTime)*a3;
        id v20 = PXStoryTimeDescription(&time1);
        LODWORD(time1.value) = 134218242;
        *(CMTimeValue *)((char *)&time1.value + 4) = v19;
        LOWORD(time1.flags) = 2114;
        *(void *)((char *)&time1.flags + 2) = v20;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PXStoryMusicPlayer.targetDuration", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&time1, 0x16u);
      }
    }

    [(PXStoryMusicPlayer *)self _invalidateCurrentSongResource];
  }
}

- (void)setCurrentAudioAsset:(id)a3
{
  uint64_t v7 = (PXAudioAsset *)a3;
  uint64_t v5 = self->_currentAudioAsset;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXAudioAsset *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentAudioAsset, a3);
      [(PXStoryMusicPlayer *)self _invalidatePlayerCurrentAsset];
      [(PXStoryMusicPlayer *)self _invalidateCueSource];
      [(PXStoryMusicPlayer *)self _invalidatePlayerVolume];
    }
  }
}

- (void)setCurrentSongResource:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentSongResource, a3);
  char v6 = [(PXStoryMusicPlayer *)self log];
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      int v17 = 134217984;
      uint64_t v18 = [(PXStoryMusicPlayer *)self logContext];
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PXStoryMusicPlayer.currentSongResource", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
    }
  }

  os_signpost_id_t v9 = v6;
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      uint64_t v12 = [(PXStoryMusicPlayer *)self logContext];
      int v17 = 134218242;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_EVENT, v11, "PXStoryMusicPlayer.currentSongResource", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }

  os_signpost_id_t v13 = v9;
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v13))
    {
      uint64_t v16 = [(PXStoryMusicPlayer *)self logContext];
      int v17 = 134218242;
      uint64_t v18 = v16;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PXStoryMusicPlayer.currentSongResource", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }

  [(PXStoryMusicPlayer *)self setCuesVersion:[(PXStoryMusicPlayer *)self cuesVersion] + 1];
  [(PXStoryMusicPlayer *)self _invalidateCurrentAudioAsset];
  [(PXStoryMusicPlayer *)self _invalidateReadinessStatus];
  [(PXStoryMusicPlayer *)self _invalidateDesiredPlayState];
}

- (void)setReadinessStatus:(int64_t)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int64_t readinessStatus = self->_readinessStatus;
  if (readinessStatus == a3) {
    return;
  }
  if (a3 == 1)
  {
    [(PXStoryMusicPlayer *)self setBufferingEvents:[(PXStoryMusicPlayer *)self bufferingEvents] + 1];
    char v6 = [(PXStoryMusicPlayer *)self log];
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v8 = v7;
      if (os_signpost_enabled(v6))
      {
        uint64_t v9 = [(PXStoryMusicPlayer *)self logContext];
        os_signpost_id_t v10 = [(PXStoryMusicPlayer *)self currentSongResource];
        *(_DWORD *)buf = 134218242;
        uint64_t v33 = v9;
        __int16 v34 = 2112;
        int64_t v35 = (int64_t)v10;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PXStoryMusicPlayer.Buffering", "Context=%{signpost.telemetry:string2}lu %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (a3 != 3 || readinessStatus != 1) {
      goto LABEL_12;
    }
    char v6 = [(PXStoryMusicPlayer *)self log];
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v6, self);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v6))
      {
        uint64_t v31 = [(PXStoryMusicPlayer *)self logContext];
        os_signpost_id_t v13 = +[PXNetworkStatusMonitor sharedInstance];
        uint64_t v14 = [v13 bestAvailableNetworkType];
        int64_t v15 = [(PXStoryMusicPlayer *)self bufferingEvents];
        uint64_t v16 = [(PXStoryMusicPlayer *)self currentSongResource];
        int v17 = (objc_class *)objc_opt_class();
        uint64_t v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 134218754;
        uint64_t v33 = v31;
        __int16 v34 = 2050;
        int64_t v35 = v14;
        __int16 v36 = 2050;
        int64_t v37 = v15;
        __int16 v38 = 2114;
        uint64_t v39 = v18;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, v12, "PXStoryMusicPlayer.Buffering", "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES networkType=%{signpost.telemetry:number1,public}lu bufferingEvents=%{signpost.telemetry:number2,public}lu assetType=%{signpost.telemetry:string1,public}@ ", buf, 0x2Au);
      }
    }
  }

LABEL_12:
  self->_int64_t readinessStatus = a3;
  [(PXStoryMusicPlayer *)self signalChange:2];
  __int16 v19 = [(PXStoryMusicPlayer *)self log];
  os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, self);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v21 = v20;
    if (os_signpost_enabled(v19))
    {
      uint64_t v22 = [(PXStoryMusicPlayer *)self logContext];
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v22;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v19, OS_SIGNPOST_INTERVAL_END, v21, "PXStoryMusicPlayerChangedReadinessStatus", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }
  }

  uint64_t v23 = v19;
  os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v23, self);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v25 = v24;
    if (os_signpost_enabled(v23))
    {
      uint64_t v26 = [(PXStoryMusicPlayer *)self logContext];
      *(_DWORD *)buf = 134218240;
      uint64_t v33 = v26;
      __int16 v34 = 2048;
      int64_t v35 = a3;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v23, OS_SIGNPOST_EVENT, v25, "PXStoryMusicPlayerChangedReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld", buf, 0x16u);
    }
  }

  v27 = v23;
  os_signpost_id_t v28 = os_signpost_id_make_with_pointer(v27, self);
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v29 = v28;
    if (os_signpost_enabled(v27))
    {
      uint64_t v30 = [(PXStoryMusicPlayer *)self logContext];
      *(_DWORD *)buf = 134218240;
      uint64_t v33 = v30;
      __int16 v34 = 2048;
      int64_t v35 = a3;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v29, "PXStoryMusicPlayerChangedReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld", buf, 0x16u);
    }
  }

  [(PXStoryMusicPlayer *)self _invalidateModelProperties];
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    [(PXStoryMusicPlayer *)self signalChange:1];
    [(PXStoryMusicPlayer *)self _invalidateDesiredPlayState];
    [(PXStoryMusicPlayer *)self _invalidateCurrentAudioAsset];
  }
}

- (PXStoryMusicPlayer)initWithModel:(id)a3 targetDurationMatchesTimeline:(BOOL)a4
{
  id v7 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PXStoryMusicPlayer;
  os_signpost_id_t v8 = [(PXStoryMusicPlayer *)&v46 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(PXStoryMusicPlayer *)v8 copyLogConfigurationFrom:v7];
    v9->_targetDurationMatchesTimeline = a4;
    objc_storeStrong((id *)&v9->_model, a3);
    [(PXStoryModel *)v9->_model registerChangeObserver:v9 context:ModelContext_266379];
    model = v9->_model;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __66__PXStoryMusicPlayer_initWithModel_targetDurationMatchesTimeline___block_invoke;
    v44[3] = &unk_1E5DCEE38;
    os_signpost_id_t v11 = v9;
    v45 = v11;
    [(PXStoryModel *)model performChanges:v44];
    os_signpost_id_t v12 = [(PXStoryModel *)v9->_model styleManager];
    [v12 registerChangeObserver:v11 context:StyleManagerContext_266378];

    os_signpost_id_t v13 = [PXAudioPlayer alloc];
    id v14 = [NSString alloc];
    int64_t v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    int v17 = (void *)[v14 initWithFormat:@"%@; %@", v16, v9->_model];
    uint64_t v18 = [(PXAudioPlayer *)v13 initWithName:v17];
    id v19 = v11[17];
    v11[17] = (id)v18;

    [v11[17] copyLogConfigurationFrom:v11];
    [v11[17] registerChangeObserver:v11 context:PlayerContext];
    id v20 = v11[17];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __66__PXStoryMusicPlayer_initWithModel_targetDurationMatchesTimeline___block_invoke_2;
    v42[3] = &unk_1E5DCDFA0;
    os_signpost_id_t v21 = v11;
    v43 = v21;
    [v20 performChanges:v42];
    uint64_t v22 = [(PXStoryModel *)v9->_model storyQueue];
    id v23 = v21[14];
    v21[14] = (id)v22;

    uint64_t v24 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v21];
    id v25 = v21[18];
    v21[18] = (id)v24;

    [v21[18] addUpdateSelector:sel__updateTargetDuration needsUpdate:1];
    [v21[18] addUpdateSelector:sel__updateCurrentSongResource needsUpdate:1];
    [v21[18] addUpdateSelector:sel__updateCurrentAudioAsset];
    [v21[18] addUpdateSelector:sel__updateCueSource];
    [v21[18] addUpdateSelector:sel__updateTouchingBeganDate];
    [v21[18] addUpdateSelector:sel__updateDucked];
    [v21[18] addUpdateSelector:sel__updateDuckingVolumeAnimator needsUpdate:1];
    [v21[18] addUpdateSelector:sel__updateFocusVolumeAnimator needsUpdate:1];
    [v21[18] addUpdateSelector:sel__updateFadeOutVolumeAnimator];
    [v21[18] addUpdateSelector:sel__updateViewControllerTransitionVolumeAnimator];
    [v21[18] addUpdateSelector:sel__updatePlayerVolume needsUpdate:1];
    [v21[18] addUpdateSelector:sel__updatePlayerCurrentAsset];
    [v21[18] addUpdateSelector:sel__updateDesiredPlayState needsUpdate:1];
    [v21[18] addUpdateSelector:sel__updatePlaybackTimer];
    [v21[18] addUpdateSelector:sel__updatePlayerDesiredPlayState needsUpdate:1];
    [v21[18] addUpdateSelector:sel__updateError needsUpdate:1];
    [v21[18] addUpdateSelector:sel__updateReadinessStatus];
    [v21[18] addUpdateSelector:sel__updateModelProperties];
    [v21[18] addUpdateSelector:sel__updateFailedAudioAssets];
    uint64_t v26 = objc_alloc_init(_PXDefaultAudioCueProvider);
    id v27 = v21[36];
    v21[36] = v26;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PXStoryMusicPlayer_initWithModel_targetDurationMatchesTimeline___block_invoke_3;
    aBlock[3] = &unk_1E5DCDFC8;
    os_signpost_id_t v28 = v21;
    v41 = v28;
    os_signpost_id_t v29 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
    uint64_t v30 = v29[2](v29, @"ducking");
    id v31 = v28[20];
    v28[20] = (id)v30;

    uint64_t v32 = v29[2](v29, @"focus");
    id v33 = v28[21];
    v28[21] = (id)v32;

    uint64_t v34 = v29[2](v29, @"fadeOut");
    id v35 = v28[22];
    v28[22] = (id)v34;

    uint64_t v36 = v29[2](v29, @"viewControllerTransition");
    id v37 = v28[23];
    v28[23] = (id)v36;

    __int16 v38 = +[PXStorySettings sharedInstance];
    [v38 addDeferredKeyObserver:v28];
  }
  return v9;
}

uint64_t __66__PXStoryMusicPlayer_initWithModel_targetDurationMatchesTimeline___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:2];
}

void __66__PXStoryMusicPlayer_initWithModel_targetDurationMatchesTimeline___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  long long v3 = +[PXStorySettings sharedInstance];
  [v3 musicTargetLoudnessLKFS];
  objc_msgSend(v4, "setTargetLoudnessInLKFS:");

  [v4 setAudioSessionDelegate:*(void *)(a1 + 32)];
}

id __66__PXStoryMusicPlayer_initWithModel_targetDurationMatchesTimeline___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc((Class)off_1E5DA74E8) initWithValue:1.0];
  [v4 registerChangeObserver:*(void *)(a1 + 32) context:VolumeAnimatorContext];
  id v5 = (objc_class *)objc_opt_class();
  char v6 = NSStringFromClass(v5);
  id v7 = [v6 stringByAppendingFormat:@"-%@", v3];

  [v4 setLabel:v7];
  return v4;
}

- (PXStoryMusicPlayer)initWithModel:(id)a3
{
  return [(PXStoryMusicPlayer *)self initWithModel:a3 targetDurationMatchesTimeline:1];
}

- (PXStoryMusicPlayer)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMusicPlayer.m", 87, @"%s is not available as initializer", "-[PXStoryMusicPlayer init]");

  abort();
}

@end