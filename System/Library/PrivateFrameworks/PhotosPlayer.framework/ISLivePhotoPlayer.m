@interface ISLivePhotoPlayer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime;
- ($D31FB86CA7B02E89CA780FE277FE9EC8)trimTimeRange;
- (BOOL)_canPlayVitality;
- (BOOL)_settleAutomaticallyWhenReady;
- (BOOL)_shouldPlayVitalityWhenReady;
- (BOOL)_shouldPrepareForHintWhenReady;
- (BOOL)_shouldPrepareForVitalityWhenReady;
- (BOOL)_wantsAudioForPlaybackStyle:(int64_t)a3;
- (BOOL)immediatelyShowsPhotoWhenPlaybackEnds;
- (BOOL)isAttemptingToPlayback;
- (BOOL)isHinting;
- (BOOL)isPlaybackAllowed;
- (BOOL)isPlayingVitality;
- (BOOL)vitalityBehaviorShouldEndPlayingAtPhoto:(id)a3;
- (ISLivePhotoPlayer)init;
- (ISLivePhotoVitalityFilter)vitalityFilter;
- (NSDate)_vitalityTimeoutDate;
- (NSSet)playbackFilters;
- (double)_coalescedPlaybackFilterHintProgress;
- (double)_photoTransitionDuration;
- (double)lastAppliedScale;
- (double)videoWillPlayToPhotoInterval;
- (id)_createVitalityBehavior;
- (int64_t)_coalescedPlaybackFilterState;
- (int64_t)_styleToPlayWhenReady;
- (int64_t)currentPlaybackStyle;
- (int64_t)targetReadiness;
- (void)_configurePlaybackFilter:(id)a3;
- (void)_configurePlaybackFilters;
- (void)_fadeInAudioIfNeeded;
- (void)_handlePlaybackFilterDidChange;
- (void)_handleVitalityFilterDidChange:(id)a3;
- (void)_invalidateApertureMode;
- (void)_invalidateScale;
- (void)_playIfNeeded;
- (void)_prepareForVitalityIfNeeded;
- (void)_resetPlaybackFilters;
- (void)_setCurrentPlaybackStyle:(int64_t)a3;
- (void)_setHinting:(BOOL)a3;
- (void)_setIsAttemptingToPlayback:(BOOL)a3;
- (void)_setPlayingVitality:(BOOL)a3;
- (void)_setSettleAutomaticallyWhenReady:(BOOL)a3;
- (void)_setShouldPlayVitalityWhenReady:(BOOL)a3;
- (void)_setShouldPrepareForHintWhenReady:(BOOL)a3;
- (void)_setShouldPrepareForVitalityWhenReady:(BOOL)a3;
- (void)_setStyleToPlayWhenReady:(int64_t)a3;
- (void)_setVitalityTimeoutDate:(id)a3;
- (void)_updateApertureModeIfNeeded;
- (void)_updateHintingAndVitality;
- (void)_updatePlayerItemLoadingTarget;
- (void)_updateScaleIfNeeded;
- (void)activeBehaviorDidChange;
- (void)addPlaybackFilter:(id)a3;
- (void)configurePlayerItem;
- (void)didPerformChanges;
- (void)livePhotoPlaybackBehaviorDidFinish:(id)a3;
- (void)livePhotoPlaybackBehaviorWillTransitionToPhoto:(id)a3;
- (void)livePhotoSettleBehaviorDidFinish:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)playHintWhenReady;
- (void)playVitality;
- (void)playerItemDidChange;
- (void)prepareForVitality;
- (void)removePlaybackFilter:(id)a3;
- (void)setImmediatelyShowsPhotoWhenPlaybackEnds:(BOOL)a3;
- (void)setIsAttemptingToPlayback:(BOOL)a3;
- (void)setPlaybackAllowed:(BOOL)a3;
- (void)setSeekTime:(id *)a3 completion:(id)a4;
- (void)setTargetReadiness:(int64_t)a3;
- (void)setTrimTimeRange:(id *)a3;
- (void)setVitalityFilter:(id)a3;
- (void)startPlaybackWithStyle:(int64_t)a3;
- (void)startPlaybackWithStyle:(int64_t)a3 settleAutomatically:(BOOL)a4;
- (void)startPlaybackWithStyleWhenReady:(int64_t)a3;
- (void)startPlaybackWithStyleWhenReady:(int64_t)a3 settleAutomatically:(BOOL)a4;
- (void)statusDidChange;
- (void)stopPlayback;
- (void)stopPlaybackAnimated:(BOOL)a3;
- (void)vitalityBehaviorDidEndPlaying:(id)a3;
@end

@implementation ISLivePhotoPlayer

- (void)removePlaybackFilter:(id)a3
{
  if (a3)
  {
    playbackFilters = self->_playbackFilters;
    id v5 = a3;
    [(NSMutableSet *)playbackFilters removeObject:v5];
    [v5 unregisterChangeObserver:self context:ISLivePhotoPlaybackFilterObservationContext];
  }
}

- (void)addPlaybackFilter:(id)a3
{
  if (a3)
  {
    playbackFilters = self->_playbackFilters;
    id v5 = a3;
    [(NSMutableSet *)playbackFilters addObject:v5];
    [(ISLivePhotoPlayer *)self _configurePlaybackFilter:v5];
    [v5 registerChangeObserver:self context:ISLivePhotoPlaybackFilterObservationContext];
  }
}

- (int64_t)currentPlaybackStyle
{
  return self->_currentPlaybackStyle;
}

- (ISLivePhotoPlayer)init
{
  v8.receiver = self;
  v8.super_class = (Class)ISLivePhotoPlayer;
  v2 = [(ISBasePlayer *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lastAppliedScale = 1.0;
    v4 = +[ISPlayerSettings sharedInstance];
    v3->_immediatelyShowsPhotoWhenPlaybackEnds = [v4 playIsSticky];

    v3->_playbackAllowed = 1;
    v3->_targetReadiness = 2;
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    playbackFilters = v3->_playbackFilters;
    v3->_playbackFilters = (NSMutableSet *)v5;
  }
  return v3;
}

- (void)_updateHintingAndVitality
{
  v3 = [(ISBasePlayer *)self activeBehavior];
  if ([v3 behaviorType] == 3)
  {
    char v4 = [v3 isPlaying];
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v6 = [v3 behaviorType];
    char v4 = 0;
    BOOL v5 = v6 == 1;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ISLivePhotoPlayer__updateHintingAndVitality__block_invoke;
  v7[3] = &unk_1E6BEC6E0;
  v7[4] = self;
  char v8 = v4;
  BOOL v9 = v5;
  [(ISObservable *)self performChanges:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__vitalityTimeoutDate, 0);
  objc_storeStrong((id *)&self->_vitalityFilter, 0);

  objc_storeStrong((id *)&self->_playbackFilters, 0);
}

- (void)_setVitalityTimeoutDate:(id)a3
{
}

- (NSDate)_vitalityTimeoutDate
{
  return self->__vitalityTimeoutDate;
}

- (void)_setShouldPrepareForHintWhenReady:(BOOL)a3
{
  self->__shouldPrepareForHintWhenReady = a3;
}

- (BOOL)_shouldPrepareForHintWhenReady
{
  return self->__shouldPrepareForHintWhenReady;
}

- (void)_setShouldPlayVitalityWhenReady:(BOOL)a3
{
  self->__shouldPlayVitalityWhenReady = a3;
}

- (BOOL)_shouldPlayVitalityWhenReady
{
  return self->__shouldPlayVitalityWhenReady;
}

- (void)_setShouldPrepareForVitalityWhenReady:(BOOL)a3
{
  self->__shouldPrepareForVitalityWhenReady = a3;
}

- (BOOL)_shouldPrepareForVitalityWhenReady
{
  return self->__shouldPrepareForVitalityWhenReady;
}

- (void)_setSettleAutomaticallyWhenReady:(BOOL)a3
{
  self->__settleAutomaticallyWhenReady = a3;
}

- (BOOL)_settleAutomaticallyWhenReady
{
  return self->__settleAutomaticallyWhenReady;
}

- (void)_setStyleToPlayWhenReady:(int64_t)a3
{
  self->__styleToPlayWhenReady = a3;
}

- (int64_t)_styleToPlayWhenReady
{
  return self->__styleToPlayWhenReady;
}

- (void)setTrimTimeRange:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var3;
  long long v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_trimTimeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_trimTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_trimTimeRange.duration.timescale = v3;
}

- ($D31FB86CA7B02E89CA780FE277FE9EC8)trimTimeRange
{
  long long v3 = *(_OWORD *)&self[8].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[8].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[8].var1.var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[15];
  return self;
}

- (int64_t)targetReadiness
{
  return self->_targetReadiness;
}

- (BOOL)isPlaybackAllowed
{
  return self->_playbackAllowed;
}

- (void)setImmediatelyShowsPhotoWhenPlaybackEnds:(BOOL)a3
{
  self->_immediatelyShowsPhotoWhenPlaybackEnds = a3;
}

- (BOOL)immediatelyShowsPhotoWhenPlaybackEnds
{
  return self->_immediatelyShowsPhotoWhenPlaybackEnds;
}

- (void)_setIsAttemptingToPlayback:(BOOL)a3
{
  self->_isAttemptingToPlayback = a3;
}

- (BOOL)isAttemptingToPlayback
{
  return self->_isAttemptingToPlayback;
}

- (ISLivePhotoVitalityFilter)vitalityFilter
{
  return self->_vitalityFilter;
}

- (BOOL)isHinting
{
  return self->_hinting;
}

- (BOOL)isPlayingVitality
{
  return self->_playingVitality;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__ISLivePhotoPlayer_observable_didChange_context___block_invoke;
  v10[3] = &unk_1E6BECFC0;
  v10[4] = self;
  v10[5] = a5;
  id v8 = a3;
  is_dispatch_on_main_queue(v10);
  v9.receiver = self;
  v9.super_class = (Class)ISLivePhotoPlayer;
  [(ISBasePlayer *)&v9 observable:v8 didChange:a4 context:a5];
}

uint64_t __50__ISLivePhotoPlayer_observable_didChange_context___block_invoke(uint64_t result)
{
  if (*(void *)(result + 40) == ISLivePhotoPlaybackFilterObservationContext)
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) _handlePlaybackFilterDidChange];
    v2 = *(void **)(v1 + 32);
    return [v2 _updatePlayerItemLoadingTarget];
  }
  return result;
}

- (BOOL)vitalityBehaviorShouldEndPlayingAtPhoto:(id)a3
{
  return [(ISLivePhotoPlayer *)self _coalescedPlaybackFilterState] != 2;
}

- (void)vitalityBehaviorDidEndPlaying:(id)a3
{
  [(ISLivePhotoPlayer *)self _updateHintingAndVitality];

  [(ISLivePhotoPlayer *)self _setCurrentPlaybackStyle:0];
}

- (void)livePhotoSettleBehaviorDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(ISBasePlayer *)self activeBehavior];

  if (v5 == v4)
  {
    [(ISLivePhotoPlayer *)self _resetPlaybackFilters];
    [(ISBasePlayer *)self setActiveBehavior:0];
    [(ISLivePhotoPlayer *)self _setCurrentPlaybackStyle:0];
    [(ISLivePhotoPlayer *)self _playIfNeeded];
    [(ISLivePhotoPlayer *)self _updatePlayerItemLoadingTarget];
  }
}

- (void)livePhotoPlaybackBehaviorDidFinish:(id)a3
{
  [(ISLivePhotoPlayer *)self _resetPlaybackFilters];
  if ([(ISLivePhotoPlayer *)self _coalescedPlaybackFilterState] != 2)
  {
    [(ISLivePhotoPlayer *)self _setCurrentPlaybackStyle:0];
  }
}

- (void)livePhotoPlaybackBehaviorWillTransitionToPhoto:(id)a3
{
}

uint64_t __68__ISLivePhotoPlayer_livePhotoPlaybackBehaviorWillTransitionToPhoto___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _invalidateScale];
}

- (BOOL)_wantsAudioForPlaybackStyle:(int64_t)a3
{
  return a3 == 1;
}

- (void)didPerformChanges
{
  v5.receiver = self;
  v5.super_class = (Class)ISLivePhotoPlayer;
  [(ISBasePlayer *)&v5 didPerformChanges];
  long long v3 = [(ISBasePlayer *)self videoPlayer];
  id v4 = +[ISPlayerSettings sharedInstance];
  objc_msgSend(v3, "setLoopingEnabled:", objc_msgSend(v4, "loopingEnabled"));

  [(ISLivePhotoPlayer *)self _updateScaleIfNeeded];
  [(ISLivePhotoPlayer *)self _updateApertureModeIfNeeded];
}

- (void)_fadeInAudioIfNeeded
{
  if ([(ISLivePhotoPlayer *)self _wantsAudioForPlaybackStyle:[(ISLivePhotoPlayer *)self currentPlaybackStyle]])
  {
    long long v3 = [(ISBasePlayer *)self videoPlayer];
    [v3 volume];
    float v5 = v4;
    if (v4 < 1.0)
    {
      if ([(ISBasePlayer *)self isAudioEnabled])
      {
        float v6 = sqrtf(v5) + 0.1;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __41__ISLivePhotoPlayer__fadeInAudioIfNeeded__block_invoke_2;
        v11[3] = &unk_1E6BEC708;
        v11[4] = self;
        float v12 = v6 * v6;
        [(ISObservable *)self performChanges:v11];
        objc_initWeak(&location, self);
        dispatch_time_t v7 = dispatch_time(0, 100000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __41__ISLivePhotoPlayer__fadeInAudioIfNeeded__block_invoke_3;
        block[3] = &unk_1E6BECB10;
        objc_copyWeak(&v9, &location);
        dispatch_after(v7, MEMORY[0x1E4F14428], block);
        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__ISLivePhotoPlayer__fadeInAudioIfNeeded__block_invoke;
    v13[3] = &unk_1E6BED038;
    v13[4] = self;
    [(ISObservable *)self performChanges:v13];
  }
}

uint64_t __41__ISLivePhotoPlayer__fadeInAudioIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVideoVolume:0.0];
}

uint64_t __41__ISLivePhotoPlayer__fadeInAudioIfNeeded__block_invoke_2(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(a1 + 32) setVideoVolume:a2];
}

void __41__ISLivePhotoPlayer__fadeInAudioIfNeeded__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fadeInAudioIfNeeded];
}

uint64_t __46__ISLivePhotoPlayer__updateHintingAndVitality__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setPlayingVitality:*(unsigned __int8 *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 41);

  return [v2 _setHinting:v3];
}

- (void)_configurePlaybackFilter:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setPlaybackDisabled:forReason:", -[ISBasePlayer status](self, "status") < 2, @"PlayerNotReady");
}

- (double)_coalescedPlaybackFilterHintProgress
{
  uint64_t v6 = 0;
  dispatch_time_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ISLivePhotoPlayer *)self playbackFilters];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__ISLivePhotoPlayer__coalescedPlaybackFilterHintProgress__block_invoke;
  v5[3] = &unk_1E6BEC6B8;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__ISLivePhotoPlayer__coalescedPlaybackFilterHintProgress__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 hintProgress];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 < *(double *)(v5 + 24)) {
    double v4 = *(double *)(v5 + 24);
  }
  *(double *)(v5 + 24) = v4;
  return result;
}

- (int64_t)_coalescedPlaybackFilterState
{
  uint64_t v6 = 0;
  dispatch_time_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ISLivePhotoPlayer *)self playbackFilters];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__ISLivePhotoPlayer__coalescedPlaybackFilterState__block_invoke;
  v5[3] = &unk_1E6BEC6B8;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__ISLivePhotoPlayer__coalescedPlaybackFilterState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 state];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (result > v5) {
    uint64_t v5 = result;
  }
  *(void *)(v4 + 24) = v5;
  return result;
}

- (void)_resetPlaybackFilters
{
  id v2 = [(ISLivePhotoPlayer *)self playbackFilters];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_898];
}

uint64_t __42__ISLivePhotoPlayer__resetPlaybackFilters__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reset];
}

- (void)_configurePlaybackFilters
{
  int64_t v3 = [(ISLivePhotoPlayer *)self playbackFilters];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__ISLivePhotoPlayer__configurePlaybackFilters__block_invoke;
  v4[3] = &unk_1E6BEC670;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

uint64_t __46__ISLivePhotoPlayer__configurePlaybackFilters__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _configurePlaybackFilter:a2];
}

- (void)setIsAttemptingToPlayback:(BOOL)a3
{
  if (self->_isAttemptingToPlayback != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __47__ISLivePhotoPlayer_setIsAttemptingToPlayback___block_invoke;
    v3[3] = &unk_1E6BEC990;
    v3[4] = self;
    BOOL v4 = a3;
    [(ISObservable *)self performChanges:v3];
  }
}

uint64_t __47__ISLivePhotoPlayer_setIsAttemptingToPlayback___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 306) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) signalChange:64];
}

- (void)_setCurrentPlaybackStyle:(int64_t)a3
{
  if (self->_currentPlaybackStyle != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __46__ISLivePhotoPlayer__setCurrentPlaybackStyle___block_invoke;
    v3[3] = &unk_1E6BECFE8;
    v3[4] = self;
    void v3[5] = a3;
    [(ISObservable *)self performChanges:v3];
  }
}

uint64_t __46__ISLivePhotoPlayer__setCurrentPlaybackStyle___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 328) = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) _invalidateScale];
  id v2 = *(void **)(a1 + 32);

  return [v2 signalChange:8];
}

- (void)_setHinting:(BOOL)a3
{
  if (self->_hinting != a3)
  {
    self->_hinting = a3;
    [(ISObservable *)self signalChange:32];
  }
}

- (void)_setPlayingVitality:(BOOL)a3
{
  if (self->_playingVitality != a3)
  {
    self->_playingVitality = a3;
    [(ISObservable *)self signalChange:16];
  }
}

- (void)_updateScaleIfNeeded
{
  if (!self->_isValid.scale)
  {
    self->_isValid.scale = 1;
    double v3 = 1.0;
    if ([(ISLivePhotoPlayer *)self currentPlaybackStyle])
    {
      BOOL v4 = +[ISPlayerSettings sharedInstance];
      int v5 = [v4 scaleDuringPlayback];

      if (v5)
      {
        uint64_t v6 = [(ISBasePlayer *)self activeBehavior];
        if ([v6 behaviorType] == 2)
        {
          dispatch_time_t v7 = [(ISBasePlayer *)self activeBehavior];
          char v8 = [v7 isTransitioningToPhoto];

          if ((v8 & 1) == 0 && [(ISLivePhotoPlayer *)self currentPlaybackStyle] != 4)
          {
            uint64_t v9 = [(ISBasePlayer *)self playerItem];
            v10 = [v9 playerContent];
            int v11 = [v10 supportsVitality];

            if (v11)
            {
              float v12 = [(ISBasePlayer *)self playerItem];
              v13 = [v12 asset];
              char v14 = [v13 options];

              if ((v14 & 2) != 0) {
                double v3 = 1.0;
              }
              else {
                double v3 = 1.075;
              }
            }
          }
        }
        else
        {
        }
      }
    }
    [(ISLivePhotoPlayer *)self lastAppliedScale];
    if (v15 != v3)
    {
      self->_lastAppliedScale = v3;
      v16 = objc_alloc_init(ISPlayerOutputTransitionOptions);
      [(ISPlayerOutputTransitionOptions *)v16 setTransitionDuration:0.3];
      [(ISBasePlayer *)self applyScale:v16 withTransitionOptions:0 completion:v3];
    }
  }
}

- (void)_invalidateScale
{
  self->_isValid.scale = 0;
}

- (void)_updateApertureModeIfNeeded
{
  if (!self->_isValid.apertureMode)
  {
    self->_isValid.apertureMode = 1;
    double v3 = [(ISBasePlayer *)self activeBehavior];
    uint64_t v4 = [v3 behaviorType];

    int v5 = (uint64_t *)MEMORY[0x1E4F161C8];
    if (v4 != 5) {
      int v5 = (uint64_t *)MEMORY[0x1E4F161D0];
    }
    uint64_t v6 = *v5;
    [(ISBasePlayer *)self setApertureMode:v6];
  }
}

- (void)_invalidateApertureMode
{
  self->_isValid.apertureMode = 0;
}

- (void)_handlePlaybackFilterDidChange
{
  int64_t v3 = [(ISLivePhotoPlayer *)self _coalescedPlaybackFilterState];
  [(ISLivePhotoPlayer *)self setIsAttemptingToPlayback:v3 != 0];
  if (v3)
  {
    if (v3 == 2)
    {
      if (![(ISLivePhotoPlayer *)self currentPlaybackStyle]
        && ![(ISLivePhotoPlayer *)self isPlayingVitality])
      {
        [(ISLivePhotoPlayer *)self startPlaybackWithStyleWhenReady:1];
      }
      if ([(ISLivePhotoPlayer *)self isPlayingVitality])
      {
        [(ISLivePhotoPlayer *)self _setCurrentPlaybackStyle:1];
        id v4 = [(ISBasePlayer *)self activeBehavior];
        [v4 cancelSettleToPhoto];
      }
    }
  }
  else
  {
    [(ISLivePhotoPlayer *)self stopPlayback];
  }
}

- (void)_handleVitalityFilterDidChange:(id)a3
{
  uint64_t v4 = [a3 state];
  if (v4)
  {
    if (v4 == 2)
    {
      [(ISLivePhotoPlayer *)self playVitality];
    }
    else if (v4 == 1)
    {
      [(ISLivePhotoPlayer *)self prepareForVitality];
    }
  }
  else
  {
    id v5 = [(ISBasePlayer *)self activeBehavior];
    if ([v5 behaviorType] == 3 && objc_msgSend(v5, "isPrepared")) {
      [(ISLivePhotoPlayer *)self playVitality];
    }
    [(ISLivePhotoPlayer *)self _setShouldPrepareForVitalityWhenReady:0];
    [(ISLivePhotoPlayer *)self _setShouldPlayVitalityWhenReady:0];
  }
}

- (double)_photoTransitionDuration
{
  id v2 = [(ISBasePlayer *)self playerItem];
  int64_t v3 = [v2 asset];
  if ([v3 hasColorAdjustments]) {
    double v4 = 0.2;
  }
  else {
    double v4 = 0.065;
  }

  return v4;
}

- (void)_prepareForVitalityIfNeeded
{
  if (([(ISLivePhotoPlayer *)self _shouldPrepareForVitalityWhenReady]
     || [(ISLivePhotoPlayer *)self _shouldPlayVitalityWhenReady])
    && [(ISLivePhotoPlayer *)self _canPlayVitality]
    && [(ISBasePlayer *)self status] >= 1)
  {
    int64_t v3 = [(ISLivePhotoPlayer *)self _vitalityTimeoutDate];
    [v3 timeIntervalSinceNow];
    double v5 = v4;

    if (v5 >= 0.0)
    {
      if ([(ISLivePhotoPlayer *)self _shouldPlayVitalityWhenReady])
      {
        [(ISLivePhotoPlayer *)self playVitality];
      }
      else if ([(ISLivePhotoPlayer *)self _shouldPrepareForVitalityWhenReady])
      {
        [(ISLivePhotoPlayer *)self prepareForVitality];
      }
    }
    else
    {
      [(ISLivePhotoPlayer *)self _setShouldPrepareForVitalityWhenReady:0];
      [(ISLivePhotoPlayer *)self _setShouldPlayVitalityWhenReady:0];
    }
  }
}

- (void)_playIfNeeded
{
  if ([(ISLivePhotoPlayer *)self _styleToPlayWhenReady]
    && [(ISBasePlayer *)self status] >= 2
    && [(ISLivePhotoPlayer *)self isPlaybackAllowed]
    && ![(ISLivePhotoPlayer *)self currentPlaybackStyle])
  {
    int64_t v3 = [(ISLivePhotoPlayer *)self _styleToPlayWhenReady];
    BOOL v4 = [(ISLivePhotoPlayer *)self _settleAutomaticallyWhenReady];
    [(ISLivePhotoPlayer *)self _setStyleToPlayWhenReady:0];
    [(ISLivePhotoPlayer *)self _setSettleAutomaticallyWhenReady:0];
    [(ISLivePhotoPlayer *)self startPlaybackWithStyle:v3 settleAutomatically:v4];
  }
}

- (BOOL)_canPlayVitality
{
  id v2 = [(ISBasePlayer *)self playerItem];
  int64_t v3 = [v2 playerContent];

  if (![v3 supportsVitality]) {
    goto LABEL_5;
  }
  if (!v3)
  {
    BOOL v4 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    goto LABEL_7;
  }
  [v3 photoTime];
  if ((BYTE4(v8) & 0x1D) == 1)
  {
    [v3 photoTime];
    BOOL v4 = CMTimeGetSeconds(&v6) >= 0.1;
  }
  else
  {
LABEL_5:
    BOOL v4 = 0;
  }
LABEL_7:

  return v4;
}

- (void)setSeekTime:(id *)a3 completion:(id)a4
{
  CMTime v6 = (void (**)(id, uint64_t))a4;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 seekTime = self->_seekTime;
  if (CMTimeCompare(&time1, (CMTime *)&seekTime))
  {
    long long v7 = *(_OWORD *)&a3->var0;
    self->_seekTime.epoch = a3->var3;
    *(_OWORD *)&self->_seekTime.value = v7;
    if (a3->var2)
    {
      uint64_t v9 = [(ISBasePlayer *)self activeBehavior];
      if ([v9 behaviorType] == 5)
      {
        [v9 setSeekCompletionHandler:v6];
        CMTime time1 = (CMTime)*a3;
        [v9 setSeekTime:&time1];
      }
      else
      {
        v10 = [ISLivePhotoSeekBehavior alloc];
        int v11 = [(ISBasePlayer *)self lastAppliedLayoutInfo];
        CMTime time1 = (CMTime)*a3;
        float v12 = [(ISLivePhotoSeekBehavior *)v10 initWithInitialLayoutInfo:v11 seekTime:&time1];

        [(ISLivePhotoSeekBehavior *)v12 setSeekCompletionHandler:v6];
        [(ISBasePlayer *)self setActiveBehavior:v12];
        uint64_t v9 = v12;
      }
      [(ISLivePhotoPlayer *)self _setCurrentPlaybackStyle:3];
    }
    else
    {
      uint64_t v8 = objc_alloc_init(ISLivePhotoSettleBehavior);
      [(ISBehavior *)v8 setDelegate:self];
      [(ISBasePlayer *)self setActiveBehavior:v8];
      [(ISLivePhotoSettleBehavior *)v8 settle:1];
    }
  }
  else if (v6)
  {
    v6[2](v6, 1);
  }
}

- (id)_createVitalityBehavior
{
  int64_t v3 = +[ISVitalitySettings sharedInstance];
  BOOL v4 = [(ISBasePlayer *)self lastAppliedLayoutInfo];
  double v5 = [(ISBasePlayer *)self playerItem];
  CMTime v6 = [v5 playerContent];
  memset(&v31, 0, sizeof(v31));
  long long v7 = [v5 playerContent];
  uint64_t v8 = v7;
  if (v7) {
    [v7 videoDuration];
  }
  else {
    memset(&v31, 0, sizeof(v31));
  }

  memset(&v30, 0, sizeof(v30));
  if (v6) {
    [v6 photoTime];
  }
  [v3 postDuration];
  CMTimeMakeWithSeconds(&rhs, v9, 600);
  CMTime lhs = v30;
  CMTimeAdd(&v29, &lhs, &rhs);
  CMTime v30 = v29;
  CMTime lhs = v29;
  CMTime time2 = v31;
  CMTimeMinimum(&v29, &lhs, &time2);
  CMTime v30 = v29;
  memset(&v29, 0, sizeof(v29));
  [v3 preDuration];
  double v11 = v10;
  [v3 postDuration];
  CMTimeMakeWithSeconds(&v29, v11 + v12, 600);
  CMTime time2 = v29;
  CMTime v25 = v31;
  CMTimeMinimum(&lhs, &time2, &v25);
  CMTime v29 = lhs;
  v13 = [v6 variationIdentifier];
  if ([v13 integerValue] == 3)
  {
    char v14 = +[ISPlayerSettings sharedInstance];
    uint64_t v15 = [v14 longExposureVitality] ^ 1;
  }
  else
  {
    uint64_t v15 = 1;
  }

  v16 = [ISLivePhotoVitalityBehavior alloc];
  [v3 playbackRate];
  *(float *)&unsigned int v18 = v17;
  [(ISLivePhotoPlayer *)self videoWillPlayToPhotoInterval];
  double v20 = v19;
  v21 = [v5 asset];
  uint64_t v22 = [v21 options];
  CMTime lhs = v30;
  CMTime time2 = v29;
  v23 = [(ISLivePhotoVitalityBehavior *)v16 initWithInitialLayoutInfo:v4 playbackEndTime:&lhs playDuration:&time2 playRate:v15 photoTransitionDuration:v22 pauseDuringTransition:COERCE_DOUBLE(__PAIR64__(HIDWORD(v29.value), v18)) assetOptions:v20];

  return v23;
}

- (void)playVitality
{
  if ([(ISLivePhotoPlayer *)self isPlayingVitality]
    || ![(ISLivePhotoPlayer *)self isPlaybackAllowed])
  {
    return;
  }
  id v9 = [(ISBasePlayer *)self activeBehavior];
  if ([v9 behaviorType] == 5) {
    goto LABEL_14;
  }
  BOOL v3 = [(ISLivePhotoPlayer *)self _canPlayVitality];

  if (!v3) {
    return;
  }
  if ([(ISBasePlayer *)self status] > 0)
  {
    [(ISLivePhotoPlayer *)self _setCurrentPlaybackStyle:0];
    id v10 = [(ISBasePlayer *)self activeBehavior];
    if ([v10 behaviorType] == 3)
    {
      BOOL v4 = v10;
    }
    else
    {
      uint64_t v8 = [(ISLivePhotoPlayer *)self _createVitalityBehavior];

      [(ISBasePlayer *)self setActiveBehavior:v8];
      BOOL v4 = (void *)v8;
    }
    id v9 = v4;
    [v4 playVitality];
    [(ISLivePhotoPlayer *)self _setShouldPrepareForVitalityWhenReady:0];
    [(ISLivePhotoPlayer *)self _setShouldPlayVitalityWhenReady:0];
LABEL_14:

    return;
  }
  double v5 = (void *)MEMORY[0x1E4F1C9C8];
  CMTime v6 = +[ISVitalitySettings sharedInstance];
  [v6 maxVitalityDelay];
  long long v7 = objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  [(ISLivePhotoPlayer *)self _setVitalityTimeoutDate:v7];

  [(ISLivePhotoPlayer *)self _setShouldPlayVitalityWhenReady:1];
}

- (void)prepareForVitality
{
  if ([(ISLivePhotoPlayer *)self isPlaybackAllowed]
    && [(ISLivePhotoPlayer *)self _canPlayVitality])
  {
    if ([(ISBasePlayer *)self status] <= 0)
    {
      double v5 = (void *)MEMORY[0x1E4F1C9C8];
      CMTime v6 = +[ISVitalitySettings sharedInstance];
      [v6 maxVitalityDelay];
      long long v7 = objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
      [(ISLivePhotoPlayer *)self _setVitalityTimeoutDate:v7];

      [(ISLivePhotoPlayer *)self _setShouldPrepareForVitalityWhenReady:1];
    }
    else
    {
      [(ISLivePhotoPlayer *)self _resetPlaybackFilters];
      [(ISLivePhotoPlayer *)self _setCurrentPlaybackStyle:0];
      id v8 = [(ISBasePlayer *)self activeBehavior];
      if ([v8 behaviorType] == 3 && (objc_msgSend(v8, "isPrepared") & 1) != 0)
      {
        BOOL v3 = v8;
      }
      else
      {
        uint64_t v4 = [(ISLivePhotoPlayer *)self _createVitalityBehavior];

        [(ISBasePlayer *)self setActiveBehavior:v4];
        BOOL v3 = (void *)v4;
      }
      id v9 = v3;
      [v3 prepareForVitality];
      [(ISLivePhotoPlayer *)self _setShouldPrepareForVitalityWhenReady:0];
    }
  }
}

- (void)stopPlaybackAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(ISBasePlayer *)self activeBehavior];
  uint64_t v6 = [v5 behaviorType];

  if ((unint64_t)(v6 - 1) < 2
    || v6 == 3
    && ([(ISBasePlayer *)self activeBehavior],
        long long v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isPlayingBeyondPhoto],
        v7,
        v8))
  {
    id v9 = objc_alloc_init(ISLivePhotoSettleBehavior);
    [(ISBehavior *)v9 setDelegate:self];
    [(ISBasePlayer *)self setActiveBehavior:v9];
    [(ISLivePhotoSettleBehavior *)v9 settle:v3];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__ISLivePhotoPlayer_stopPlaybackAnimated___block_invoke;
    v10[3] = &unk_1E6BED038;
    v10[4] = self;
    [(ISObservable *)self performChanges:v10];
  }
  else
  {
    [(ISLivePhotoPlayer *)self _setCurrentPlaybackStyle:0];
  }
  [(ISLivePhotoPlayer *)self _setStyleToPlayWhenReady:0];
}

uint64_t __42__ISLivePhotoPlayer_stopPlaybackAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:128];
}

- (void)stopPlayback
{
}

- (void)startPlaybackWithStyle:(int64_t)a3 settleAutomatically:(BOOL)a4
{
  [(ISLivePhotoPlayer *)self _setShouldPrepareForVitalityWhenReady:0];
  [(ISLivePhotoPlayer *)self _setShouldPlayVitalityWhenReady:0];
  [(ISLivePhotoPlayer *)self _setStyleToPlayWhenReady:0];
  long long v7 = [(ISBasePlayer *)self playerItem];
  memset(&v25, 0, sizeof(v25));
  int v8 = [v7 playerContent];
  id v9 = v8;
  if (v8) {
    [v8 photoTime];
  }
  else {
    memset(&v25, 0, sizeof(v25));
  }

  id v10 = [(ISBasePlayer *)self lastAppliedLayoutInfo];
  if (a3 == 1)
  {
    [(ISBasePlayer *)self setVideoVolume:0.0];
    memset(&v24, 0, sizeof(v24));
    [(ISLivePhotoPlayer *)self trimTimeRange];
    BOOL v11 = 0;
    BOOL v12 = 0;
    double v13 = 0.5;
  }
  else
  {
    char v14 = +[ISVitalitySettings sharedInstance];
    [v14 minimumPhotoTransitionDuration];
    double v13 = v15;

    [(ISBasePlayer *)self setVideoVolume:0.0];
    memset(&v24, 0, sizeof(v24));
    [(ISLivePhotoPlayer *)self trimTimeRange];
    BOOL v12 = a3 == 2;
    BOOL v11 = a3 == 4;
    if (a3 == 4 || a3 == 2)
    {
      if (v24.start.flags)
      {
        CMTime start = v24.start;
        CMTime v22 = v25;
        if ((v24.duration.flags & 1) != 0 && !v24.duration.epoch && (v24.duration.value & 0x8000000000000000) == 0)
        {
          time1.CMTime start = v24.duration;
          CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
          if (CMTimeCompare(&time1.start, &time2))
          {
            CMTimeRange time1 = v24;
            CMTime time2 = v25;
            if (!CMTimeRangeContainsTime(&time1, &time2))
            {
              CMTimeRange time1 = v24;
              CMTimeRangeGetEnd(&v22, &time1);
            }
          }
        }
      }
      else
      {
        CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        CMTime v22 = v25;
      }
      CMTime time2 = start;
      CMTime v19 = v22;
      CMTimeRangeFromTimeToTime(&time1, &time2, &v19);
      CMTimeRange v24 = time1;
    }
  }
  if (a4) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = (v11 || v12) | [(ISLivePhotoPlayer *)self immediatelyShowsPhotoWhenPlaybackEnds];
  }
  double v17 = [ISLivePhotoPlaybackBehavior alloc];
  CMTime start = v25;
  CMTimeRange time1 = v24;
  unsigned int v18 = [(ISLivePhotoPlaybackBehavior *)v17 initWithInitialLayoutInfo:v10 keyTime:&start playbackTimeRange:&time1 photoTransitionDuration:v16 immediatelyShowsPhotoWhenPlaybackEnds:a3 != 4 hasBlurryTransition:v13];
  [(ISBasePlayer *)self setActiveBehavior:v18];
  [(ISLivePhotoPlaybackBehavior *)v18 startPlayback];
  [(ISLivePhotoPlayer *)self _setCurrentPlaybackStyle:a3];
}

- (void)startPlaybackWithStyle:(int64_t)a3
{
}

- (double)lastAppliedScale
{
  return self->_lastAppliedScale;
}

- (void)startPlaybackWithStyleWhenReady:(int64_t)a3
{
}

- (void)startPlaybackWithStyleWhenReady:(int64_t)a3 settleAutomatically:(BOOL)a4
{
  BOOL v4 = a4;
  [(ISLivePhotoPlayer *)self _setStyleToPlayWhenReady:a3];
  [(ISLivePhotoPlayer *)self _setSettleAutomaticallyWhenReady:v4];

  [(ISLivePhotoPlayer *)self _playIfNeeded];
}

- (void)setPlaybackAllowed:(BOOL)a3
{
  if (self->_playbackAllowed != a3)
  {
    self->_playbackAllowed = a3;
    if (a3)
    {
      [(ISLivePhotoPlayer *)self _playIfNeeded];
    }
    else
    {
      BOOL v4 = [(ISBasePlayer *)self activeBehavior];
      uint64_t v5 = [v4 behaviorType];

      if (v5 == 3)
      {
        uint64_t v6 = objc_alloc_init(ISDefaultBehavior);
        [(ISBasePlayer *)self setActiveBehavior:v6];
      }
    }
  }
}

- (void)_updatePlayerItemLoadingTarget
{
  id v12 = [(ISBasePlayer *)self playerItem];
  int64_t v3 = [(ISLivePhotoPlayer *)self targetReadiness];
  int64_t v4 = [(ISLivePhotoPlayer *)self _coalescedPlaybackFilterState];
  if (v4 | [(ISLivePhotoPlayer *)self currentPlaybackStyle])
  {
LABEL_9:
    uint64_t v10 = 2;
    goto LABEL_15;
  }
  uint64_t v5 = [(ISBasePlayer *)self activeBehavior];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    long long v7 = [(ISBasePlayer *)self activeBehavior];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v9 = 1;
    if (v3 != 1) {
      uint64_t v9 = 2;
    }
    if (v3) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    if (isKindOfClass) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v11 = 1;
    if (v3 != 1) {
      uint64_t v11 = 2;
    }
    if (v3) {
      uint64_t v10 = v11;
    }
    else {
      uint64_t v10 = 0;
    }
  }
LABEL_15:
  [v12 setLoadingTarget:v10];
  [v12 discardContentBelowLoadingTarget];
}

- (void)setTargetReadiness:(int64_t)a3
{
  if (self->_targetReadiness != a3)
  {
    self->_targetReadiness = a3;
    [(ISLivePhotoPlayer *)self _updatePlayerItemLoadingTarget];
  }
}

- (void)setVitalityFilter:(id)a3
{
  uint64_t v5 = (ISLivePhotoVitalityFilter *)a3;
  if (self->_vitalityFilter != v5)
  {
    objc_storeStrong((id *)&self->_vitalityFilter, a3);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__ISLivePhotoPlayer_setVitalityFilter___block_invoke;
    v6[3] = &unk_1E6BEC648;
    objc_copyWeak(&v7, &location);
    [(ISLivePhotoVitalityFilter *)v5 setOutputChangeHandler:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __39__ISLivePhotoPlayer_setVitalityFilter___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleVitalityFilterDidChange:v3];
}

- (NSSet)playbackFilters
{
  id v2 = (void *)[(NSMutableSet *)self->_playbackFilters copy];

  return (NSSet *)v2;
}

- (void)playHintWhenReady
{
}

- (void)activeBehaviorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)ISLivePhotoPlayer;
  [(ISBasePlayer *)&v4 activeBehaviorDidChange];
  [(ISLivePhotoPlayer *)self _updateHintingAndVitality];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__ISLivePhotoPlayer_activeBehaviorDidChange__block_invoke;
  v3[3] = &unk_1E6BED038;
  v3[4] = self;
  [(ISObservable *)self performChanges:v3];
}

uint64_t __44__ISLivePhotoPlayer_activeBehaviorDidChange__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateScale];
  id v2 = *(void **)(a1 + 32);

  return [v2 _invalidateApertureMode];
}

- (double)videoWillPlayToPhotoInterval
{
  [(ISLivePhotoPlayer *)self _photoTransitionDuration];
  double v4 = v3;
  uint64_t v5 = [(ISBasePlayer *)self playerItem];
  uint64_t v6 = [v5 playerContent];

  id v7 = [v6 variationIdentifier];
  if ([v7 integerValue] == 3)
  {
    int v8 = +[ISPlayerSettings sharedInstance];
    int v9 = [v8 longExposureVitality];

    if (v9) {
      double v4 = 0.25;
    }
  }
  else
  {
  }
  return v4;
}

- (void)statusDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ISLivePhotoPlayer;
  [(ISBasePlayer *)&v3 statusDidChange];
  [(ISLivePhotoPlayer *)self _configurePlaybackFilters];
  [(ISLivePhotoPlayer *)self _prepareForVitalityIfNeeded];
  [(ISLivePhotoPlayer *)self _playIfNeeded];
}

- (void)playerItemDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)ISLivePhotoPlayer;
  [(ISBasePlayer *)&v8 playerItemDidChange];
  objc_super v3 = [(ISLivePhotoPlayer *)self vitalityFilter];
  uint64_t v4 = [v3 state];

  int64_t v5 = [(ISLivePhotoPlayer *)self _coalescedPlaybackFilterState];
  [(ISBasePlayer *)self setActiveBehavior:0];
  [(ISLivePhotoPlayer *)self _setCurrentPlaybackStyle:0];
  uint64_t v6 = [(ISBasePlayer *)self playerItem];

  if (v6)
  {
    if (v5 == 1) {
      return;
    }
    if (v5 == 2)
    {
      [(ISLivePhotoPlayer *)self startPlaybackWithStyle:1];
      return;
    }
    if (v4 == 2)
    {
      [(ISLivePhotoPlayer *)self playVitality];
      return;
    }
    if (v4 == 1)
    {
      [(ISLivePhotoPlayer *)self prepareForVitality];
      return;
    }
  }
  id v7 = objc_alloc_init(ISDefaultBehavior);
  [(ISBasePlayer *)self setActiveBehavior:v7];
}

- (void)configurePlayerItem
{
  v3.receiver = self;
  v3.super_class = (Class)ISLivePhotoPlayer;
  [(ISBasePlayer *)&v3 configurePlayerItem];
  [(ISLivePhotoPlayer *)self _updatePlayerItemLoadingTarget];
}

@end