@interface NTKAVListingFaceBaseView
- (BOOL)_changeCurrentListing;
- (BOOL)_curtainViewVisible;
- (BOOL)_timeLabelUsesLegibility;
- (BOOL)isContentUnloadedForFaceSwiping;
- (BOOL)isHandlingScreenWake;
- (BOOL)paused;
- (BOOL)shouldChangeVariantForScreenWake;
- (BOOL)shouldPause;
- (NTKAVListing)currentListing;
- (NTKAVListingFaceBaseView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (id)_complicationFlickerWorkgroundAnimationWithDuration:(double)a3 applier:(id)a4;
- (id)_curtainView;
- (id)_nextListing;
- (id)_onDeckPosterImageView;
- (void)_activatePauseLockout;
- (void)_applyDataMode;
- (void)_applyFrozen;
- (void)_applySlow;
- (void)_cancelAllTasks;
- (void)_cancelDelayedPlayback;
- (void)_cancelPauseLockout;
- (void)_cleanupAfterOrb:(BOOL)a3;
- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_fadeFromCurtainViewWithDuration:(double)a3 completion:(id)a4;
- (void)_fadeToCurtainViewWithDuration:(double)a3 completion:(id)a4;
- (void)_handleScreenWake;
- (void)_hideCurtainView;
- (void)_loadSnapshotContentViews;
- (void)_loadVideoForListing;
- (void)_pauseImmediately;
- (void)_performPreloadVideoTask;
- (void)_playNextVideo;
- (void)_playNextVideoAfterDelay:(double)a3;
- (void)_playQueuedUpVideo;
- (void)_playVideo;
- (void)_playVideoForScreenWake:(id)a3;
- (void)_prepareForEditing;
- (void)_prepareForOrb;
- (void)_queuePreloadVideoTask;
- (void)_reset;
- (void)_resetVideoForListing;
- (void)_showCurtainView;
- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_transitionToPosterView:(id)a3;
- (void)_unloadSnapshotContentViews;
- (void)_unpauseFromSwitcher;
- (void)_updatePaused;
- (void)dealloc;
- (void)faultInFaceContentSkippedDuringSwiping;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)screenWillTurnOnAnimated:(BOOL)a3;
- (void)setContentUnloadedForFaceSwiping:(BOOL)a3;
- (void)setCurrentListing:(id)a3;
- (void)setHandlingScreenWake:(BOOL)a3;
- (void)setNormalComplicationDisplayWrapper:(id)a3 forSlot:(id)a4;
- (void)setShouldChangeVariantForScreenWake:(BOOL)a3;
@end

@implementation NTKAVListingFaceBaseView

- (NTKAVListingFaceBaseView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)NTKAVListingFaceBaseView;
  v5 = [(NTKAVFaceBaseView *)&v10 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  if (v5)
  {
    if (CLKIsClockFaceApp())
    {
      v6 = objc_alloc_init(NTKTaskScheduler);
      taskScheduler = v5->_taskScheduler;
      v5->_taskScheduler = v6;
    }
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v5 selector:sel__unpauseFromSwitcher name:@"NTKFaceLibraryDismissedNotification" object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(NTKDelayedBlock *)self->_playNextVideoDelayBlock cancel];
  [(NTKTaskScheduler *)self->_taskScheduler cancelAllTasks];
  [(NSTimer *)self->_playOnWakeTimeout invalidate];
  v4.receiver = self;
  v4.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKAVFaceBaseView *)&v4 dealloc];
}

- (BOOL)_changeCurrentListing
{
  self->_preLoadedVideoOnSleep = 0;
  kdebug_trace();
  v3 = [(NTKAVListingFaceBaseView *)self _nextListing];
  p_currentListing = &self->_currentListing;
  char v5 = [v3 isEqual:self->_currentListing];
  int v6 = 0;
  if ((v5 & 1) == 0)
  {
    int v6 = [v3 snapshotDiffers:*p_currentListing];
    objc_storeStrong((id *)&self->_currentListing, v3);
  }
  if (*p_currentListing)
  {
    v7 = [(NTKAVListing *)*p_currentListing video];

    if (v7)
    {
      if (v5)
      {
        [(NTKAVListingFaceBaseView *)self _resetVideoForListing];
        if (!v6) {
          goto LABEL_11;
        }
      }
      else
      {
        [(NTKAVListingFaceBaseView *)self _loadVideoForListing];
        if (!v6)
        {
LABEL_11:
          BOOL v8 = 1;
          goto LABEL_12;
        }
      }
      [(NTKAVListingFaceBaseView *)self _updateImageToBlur];
      goto LABEL_11;
    }
  }
  BOOL v8 = 0;
LABEL_12:

  return v8;
}

- (void)_loadVideoForListing
{
  id v4 = [(NTKAVFaceBaseView *)self videoPlayerView];
  v3 = [(NTKAVListing *)self->_currentListing video];
  [v4 loadVideo:v3];
}

- (void)_resetVideoForListing
{
  v2 = [(NTKAVFaceBaseView *)self videoPlayerView];
  long long v3 = *MEMORY[0x1E4F1FA48];
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v2 seekToTime:&v3];
}

- (id)_nextListing
{
  return 0;
}

- (id)_onDeckPosterImageView
{
  return 0;
}

- (void)_performPreloadVideoTask
{
  kdebug_trace();
  self->_shouldChangeVariantForScreenWake = 1;
  self->_preLoadingVideoOnSleep = 1;
  [(NTKAVListingFaceBaseView *)self _changeCurrentListing];
  long long v3 = [(NTKAVFaceBaseView *)self videoPlayerView];
  [v3 preroll];

  self->_preLoadingVideoOnSleep = 0;
  self->_preLoadedVideoOnSleep = 1;
}

- (void)_queuePreloadVideoTask
{
  self->_preLoadedVideoOnSleep = 0;
  objc_initWeak(&location, self);
  taskScheduler = self->_taskScheduler;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__NTKAVListingFaceBaseView__queuePreloadVideoTask__block_invoke;
  v5[3] = &unk_1E62C0820;
  objc_copyWeak(&v6, &location);
  id v4 = [(NTKTaskScheduler *)taskScheduler scheduleTask:v5 identifier:@"com.apple.ntk.NTKAVListingFaceBaseView"];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __50__NTKAVListingFaceBaseView__queuePreloadVideoTask__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[1105])
  {
    [WeakRetained _performPreloadVideoTask];
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKFaceView *)&v5 screenDidTurnOffAnimated:a3];
  [(NTKAVListingFaceBaseView *)self setHandlingScreenWake:0];
  if ((unint64_t)([(NTKFaceView *)self dataMode] - 1) <= 1
    && ![(NTKAVListingFaceBaseView *)self isContentUnloadedForFaceSwiping])
  {
    self->_shouldChangeVariantForScreenWake = 1;
    id v4 = [(NTKAVFaceBaseView *)self videoPlayerView];
    [v4 pause];

    [(NTKAVListingFaceBaseView *)self _showCurtainView];
  }
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKFaceView *)&v4 screenWillTurnOnAnimated:a3];
  [(NTKAVListingFaceBaseView *)self _handleScreenWake];
}

- (void)_handleScreenWake
{
  if ([(NTKAVListingFaceBaseView *)self isContentUnloadedForFaceSwiping]
    && ![(NTKAVListingFaceBaseView *)self isHandlingScreenWake])
  {
    [(NTKAVListingFaceBaseView *)self setHandlingScreenWake:1];
    kdebug_trace();
    [(NTKAVListingFaceBaseView *)self setContentUnloadedForFaceSwiping:0];
    [(NTKAVListingFaceBaseView *)self _cancelAllTasks];
    [(NTKAVListingFaceBaseView *)self _playVideoForScreenWake:0];
    [(NTKAVListingFaceBaseView *)self setHandlingScreenWake:0];
  }
}

- (void)_showCurtainView
{
  if (!self->_blackView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    objc_super v4 = [(NTKAVFaceBaseView *)self videoPlayerView];
    [v4 bounds];
    objc_super v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    blackView = self->_blackView;
    self->_blackView = v5;

    v7 = self->_blackView;
    BOOL v8 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v7 setBackgroundColor:v8];
  }
  id v9 = [(NTKFaceView *)self contentView];
  [v9 addSubview:self->_blackView];
}

- (void)_hideCurtainView
{
  [(UIView *)self->_blackView removeFromSuperview];
  blackView = self->_blackView;
  self->_blackView = 0;
}

- (void)_fadeToCurtainViewWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__NTKAVListingFaceBaseView__fadeToCurtainViewWithDuration_completion___block_invoke;
  aBlock[3] = &unk_1E62C0848;
  id v7 = v6;
  id v11 = v7;
  BOOL v8 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  [(NTKAVListingFaceBaseView *)self _showCurtainView];
  if (a3 >= 0.00000011920929)
  {
    [(UIView *)self->_blackView setAlpha:0.0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__NTKAVListingFaceBaseView__fadeToCurtainViewWithDuration_completion___block_invoke_2;
    v9[3] = &unk_1E62BFF20;
    v9[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v9 animations:v8 completion:a3];
  }
  else
  {
    v8[2](v8, 1);
  }
}

uint64_t __70__NTKAVListingFaceBaseView__fadeToCurtainViewWithDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __70__NTKAVListingFaceBaseView__fadeToCurtainViewWithDuration_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1136) setAlpha:1.0];
}

- (void)_fadeFromCurtainViewWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__NTKAVListingFaceBaseView__fadeFromCurtainViewWithDuration_completion___block_invoke;
  aBlock[3] = &unk_1E62C0870;
  void aBlock[4] = self;
  id v7 = v6;
  id v13 = v7;
  BOOL v8 = _Block_copy(aBlock);
  id v9 = v8;
  if (a3 < 0.00000011920929 || self->_blackView == 0)
  {
    (*((void (**)(void *, uint64_t))v8 + 2))(v8, 1);
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__NTKAVListingFaceBaseView__fadeFromCurtainViewWithDuration_completion___block_invoke_2;
    v11[3] = &unk_1E62BFF20;
    v11[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v11 animations:v8 completion:a3];
  }
}

uint64_t __72__NTKAVListingFaceBaseView__fadeFromCurtainViewWithDuration_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _hideCurtainView];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __72__NTKAVListingFaceBaseView__fadeFromCurtainViewWithDuration_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1136) setAlpha:0.0];
}

- (BOOL)_curtainViewVisible
{
  v2 = [(UIView *)self->_blackView superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_curtainView
{
  return self->_blackView;
}

- (void)_prepareForOrb
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKFaceView *)&v3 _prepareForOrb];
  [(NTKAVListingFaceBaseView *)self _updatePaused];
}

- (void)_cleanupAfterOrb:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKFaceView *)&v4 _cleanupAfterOrb:a3];
  [(NTKAVListingFaceBaseView *)self _updatePaused];
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKAVFaceBaseView *)&v3 _loadSnapshotContentViews];
  [(NTKAVListingFaceBaseView *)self _updateImageToBlur];
}

- (void)setNormalComplicationDisplayWrapper:(id)a3 forSlot:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKFaceView *)&v4 setNormalComplicationDisplayWrapper:a3 forSlot:a4];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKAVFaceBaseView *)&v3 _unloadSnapshotContentViews];
  [(NTKAVListingFaceBaseView *)self _cancelDelayedPlayback];
  [(NTKAVListingFaceBaseView *)self _cancelPauseLockout];
  self->_updateWhenUnpausing = 0;
}

- (void)_applyDataMode
{
  v16.receiver = self;
  v16.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKFaceView *)&v16 _applyDataMode];
  int64_t v3 = [(NTKFaceView *)self dataMode];
  if (v3 != self->_previousDataMode)
  {
    int64_t v4 = v3;
    switch(v3)
    {
      case 1:
        if (![(NTKAVListingFaceBaseView *)self isContentUnloadedForFaceSwiping])
        {
          objc_super v5 = [(NTKAVFaceBaseView *)self posterImageView];

          if (v5) {
            [(NTKAVListingFaceBaseView *)self _showCurtainView];
          }
          id v6 = [(NTKAVFaceBaseView *)self posterImageView];
          [v6 removeFromSuperview];

          [(NTKAVFaceBaseView *)self setPosterImageView:0];
          id v7 = [(NTKFaceView *)self contentView];
          BOOL v8 = [(NTKAVFaceBaseView *)self videoPlayerView];
          [v7 addSubview:v8];

          id v9 = [(NTKAVFaceBaseView *)self videoPlayerView];
          objc_super v10 = [v9 superview];
          id v11 = [(NTKAVFaceBaseView *)self videoPlayerView];
          [v10 sendSubviewToBack:v11];

          if (self->_previousDataMode != 3) {
            goto LABEL_15;
          }
          self->_updateWhenUnpausing = 1;
        }
        goto LABEL_16;
      case 2:
        [(NTKAVListingFaceBaseView *)self faultInFaceContentSkippedDuringSwiping];
        [(NTKAVListingFaceBaseView *)self _cancelAllTasks];
        [(NTKAVListingFaceBaseView *)self _queuePreloadVideoTask];
        goto LABEL_15;
      case 3:
        if (self->_isPauseLockedout) {
          goto LABEL_16;
        }
        [(NTKAVListingFaceBaseView *)self _hideCurtainView];
LABEL_15:
        [(NTKAVListingFaceBaseView *)self _updatePaused];
LABEL_16:
        self->_previousDataMode = v4;
        [(NTKAVListingFaceBaseView *)self setNeedsLayout];
        break;
      case 4:
        [(NTKAVListingFaceBaseView *)self setContentUnloadedForFaceSwiping:1];
        if ((unint64_t)(self->_previousDataMode - 1) <= 2)
        {
          [(NTKAVListingFaceBaseView *)self _cancelAllTasks];
          v12 = [(NTKAVFaceBaseView *)self videoPlayerView];
          [v12 removeFromSuperview];
        }
        id v13 = [(NTKAVListingFaceBaseView *)self _onDeckPosterImageView];
        v14 = [(NTKAVFaceBaseView *)self posterImageView];
        [v14 removeFromSuperview];

        [(NTKAVFaceBaseView *)self setPosterImageView:v13];
        v15 = [(NTKFaceView *)self contentView];
        [v15 addSubview:v13];

        [(NTKAVListingFaceBaseView *)self _hideCurtainView];
        [(NTKAVListingFaceBaseView *)self _updatePaused];
        [(NTKAVListingFaceBaseView *)self _selectDefaultListing];

        goto LABEL_16;
      case 5:
        [(NTKAVListingFaceBaseView *)self setContentUnloadedForFaceSwiping:1];
        goto LABEL_15;
      default:
        goto LABEL_16;
    }
  }
}

- (void)faultInFaceContentSkippedDuringSwiping
{
  if ([(NTKAVListingFaceBaseView *)self isContentUnloadedForFaceSwiping])
  {
    [(NTKAVListingFaceBaseView *)self setContentUnloadedForFaceSwiping:0];
    [(NTKAVListingFaceBaseView *)self _updatePaused];
    int64_t v3 = [(NTKFaceView *)self contentView];
    int64_t v4 = [(NTKAVFaceBaseView *)self videoPlayerView];
    [v3 addSubview:v4];

    id v7 = [(NTKAVFaceBaseView *)self videoPlayerView];
    objc_super v5 = [v7 superview];
    id v6 = [(NTKAVFaceBaseView *)self videoPlayerView];
    [v5 sendSubviewToBack:v6];
  }
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKFaceView *)&v3 _applyFrozen];
  [(NTKAVListingFaceBaseView *)self _updatePaused];
}

- (void)_applySlow
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKFaceView *)&v3 _applySlow];
  [(NTKAVListingFaceBaseView *)self _updatePaused];
}

- (void)_prepareForEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKAVFaceBaseView *)&v3 _prepareForEditing];
  [(NTKAVListingFaceBaseView *)self _pauseImmediately];
  [(NTKAVListingFaceBaseView *)self _hideCurtainView];
}

- (BOOL)_timeLabelUsesLegibility
{
  return 1;
}

- (void)_updatePaused
{
  BOOL v3 = [(NTKFaceView *)self isFrozen]
    || [(NTKFaceView *)self orbing]
    || [(NTKFaceView *)self isSlow]
    || [(NTKFaceView *)self dataMode] != 1
    || [(NTKAVListingFaceBaseView *)self isContentUnloadedForFaceSwiping]
    || [(NTKFaceView *)self timeScrubbing];
  self->_shouldPause = v3;
  if (!self->_isPauseLockedout && self->_isPaused != v3)
  {
    self->_isPaused = v3;
    kdebug_trace();
    if (self->_isPaused) {
      [(NTKAVListingFaceBaseView *)self _pauseImmediately];
    }
    [(NTKAVListingFaceBaseView *)self setNeedsLayout];
    self->_updateWhenUnpausing = 0;
  }
}

- (void)_pauseImmediately
{
  self->_isPaused = 1;
  [(NTKAVFaceBaseView *)self pauseVideoPlayerViewIfItExists];
  [(NTKAVListingFaceBaseView *)self _cancelDelayedPlayback];
  self->_shouldPlayOnWake = 0;
}

- (void)_playVideo
{
  if (![(NTKAVListingFaceBaseView *)self isContentUnloadedForFaceSwiping])
  {
    if (self->_preLoadedVideoOnSleep)
    {
      [(NTKAVListingFaceBaseView *)self _playQueuedUpVideo];
      self->_preLoadedVideoOnSleep = 0;
    }
    else
    {
      BOOL v3 = [(NTKAVFaceBaseView *)self videoPlayerView];
      char v4 = [v3 playing];

      if (v4)
      {
        [(NTKAVListingFaceBaseView *)self _hideCurtainView];
      }
      else if (self->_currentListing {
             && ![(NTKAVListingFaceBaseView *)self shouldChangeVariantForScreenWake])
      }
      {
        [(NTKAVListingFaceBaseView *)self _playQueuedUpVideo];
      }
      else
      {
        [(NTKAVListingFaceBaseView *)self _playNextVideo];
      }
    }
  }
}

- (void)_playVideoForScreenWake:(id)a3
{
  if (![(NTKAVListingFaceBaseView *)self isContentUnloadedForFaceSwiping])
  {
    [(NSTimer *)self->_playOnWakeTimeout invalidate];
    if (self->_shouldPlayOnWake && !self->_preLoadingVideoOnSleep)
    {
      self->_shouldPlayOnWake = 0;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__NTKAVListingFaceBaseView__playVideoForScreenWake___block_invoke;
      block[3] = &unk_1E62BFF20;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __52__NTKAVListingFaceBaseView__playVideoForScreenWake___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playVideo];
}

- (void)_unpauseFromSwitcher
{
  if (self->_updateWhenUnpausing)
  {
    [(NTKAVListingFaceBaseView *)self _updatePaused];
    [(NTKAVListingFaceBaseView *)self _activatePauseLockout];
    self->_updateWhenUnpausing = 0;
  }
}

- (id)_complicationFlickerWorkgroundAnimationWithDuration:(double)a3 applier:(id)a4
{
  return 0;
}

- (void)_cancelAllTasks
{
  [(NTKTaskScheduler *)self->_taskScheduler cancelAllTasks];
  id v3 = [(NTKAVFaceBaseView *)self videoPlayerView];
  [v3 resetRequestState];
}

- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(NTKAVListingFaceBaseView *)self _pauseImmediately];
  v7.receiver = self;
  v7.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKBackgroundImageFaceView *)&v7 _startScrubbingAnimated:v4 withCompletion:v6];
}

- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__NTKAVListingFaceBaseView__endScrubbingAnimated_withCompletion___block_invoke;
  v9[3] = &unk_1E62C0898;
  id v7 = v6;
  id v10 = v7;
  objc_copyWeak(&v11, &location);
  v8.receiver = self;
  v8.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKBackgroundImageFaceView *)&v8 _endScrubbingAnimated:v4 withCompletion:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __65__NTKAVListingFaceBaseView__endScrubbingAnimated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updatePaused];
}

- (void)_transitionToPosterView:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NTKAVFaceBaseView *)self posterImageView];

  if (!v5)
  {
    currentListing = self->_currentListing;
    self->_currentListing = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKAVFaceBaseView *)&v7 _transitionToPosterView:v4];
}

- (void)_playQueuedUpVideo
{
  if (![(NTKAVListingFaceBaseView *)self isContentUnloadedForFaceSwiping]
    && !self->_isPaused)
  {
    id v3 = [(NTKAVFaceBaseView *)self videoPlayerView];
    [v3 play];
  }
}

- (void)_playNextVideo
{
  if (![(NTKAVListingFaceBaseView *)self isContentUnloadedForFaceSwiping]
    && [(NTKAVListingFaceBaseView *)self _changeCurrentListing]
    && !self->_isPaused)
  {
    id v3 = [(NTKAVFaceBaseView *)self videoPlayerView];
    [v3 play];
  }
}

- (void)_playNextVideoAfterDelay:(double)a3
{
  objc_initWeak(&location, self);
  objc_super v5 = [NTKDelayedBlock alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__NTKAVListingFaceBaseView__playNextVideoAfterDelay___block_invoke;
  v8[3] = &unk_1E62C08C0;
  objc_copyWeak(&v9, &location);
  id v6 = [(NTKDelayedBlock *)v5 initWithDelay:v8 action:a3];
  playNextVideoDelayBlock = self->_playNextVideoDelayBlock;
  self->_playNextVideoDelayBlock = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__NTKAVListingFaceBaseView__playNextVideoAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _playNextVideo];
}

- (void)_cancelDelayedPlayback
{
  [(NTKDelayedBlock *)self->_playNextVideoDelayBlock cancel];
  playNextVideoDelayBlock = self->_playNextVideoDelayBlock;
  self->_playNextVideoDelayBlock = 0;
}

- (void)_activatePauseLockout
{
  if (!self->_isPaused)
  {
    self->_isPauseLockedout = 1;
    [(NTKDelayedBlock *)self->_pauseLockoutBlock cancel];
    objc_initWeak(&location, self);
    id v3 = [NTKDelayedBlock alloc];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__NTKAVListingFaceBaseView__activatePauseLockout__block_invoke;
    v6[3] = &unk_1E62C08C0;
    objc_copyWeak(&v7, &location);
    id v4 = [(NTKDelayedBlock *)v3 initWithDelay:v6 action:1.5];
    pauseLockoutBlock = self->_pauseLockoutBlock;
    self->_pauseLockoutBlock = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __49__NTKAVListingFaceBaseView__activatePauseLockout__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelPauseLockout];
  [WeakRetained _updatePaused];
}

- (void)_cancelPauseLockout
{
  self->_isPauseLockedout = 0;
  [(NTKDelayedBlock *)self->_pauseLockoutBlock cancel];
  pauseLockoutBlock = self->_pauseLockoutBlock;
  self->_pauseLockoutBlock = 0;
}

- (void)_reset
{
  [(NTKAVListingFaceBaseView *)self _cancelDelayedPlayback];
  self->_updateWhenUnpausing = 0;
  currentListing = self->_currentListing;
  self->_currentListing = 0;

  self->_preLoadedVideoOnSleep = 0;
  v10.receiver = self;
  v10.super_class = (Class)NTKAVListingFaceBaseView;
  [(NTKAVFaceBaseView *)&v10 _reset];
  if ([(NTKFaceView *)self dataMode] == 1)
  {
    objc_initWeak(&location, self);
    id v4 = [NTKDelayedBlock alloc];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__NTKAVListingFaceBaseView__reset__block_invoke;
    v7[3] = &unk_1E62C08C0;
    objc_copyWeak(&v8, &location);
    objc_super v5 = [(NTKDelayedBlock *)v4 initWithDelay:v7 action:3.0];
    playNextVideoDelayBlock = self->_playNextVideoDelayBlock;
    self->_playNextVideoDelayBlock = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __34__NTKAVListingFaceBaseView__reset__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _playNextVideo];
}

- (BOOL)paused
{
  return self->_isPaused;
}

- (BOOL)shouldPause
{
  return self->_shouldPause;
}

- (NTKAVListing)currentListing
{
  return self->_currentListing;
}

- (void)setCurrentListing:(id)a3
{
}

- (BOOL)shouldChangeVariantForScreenWake
{
  return self->_shouldChangeVariantForScreenWake;
}

- (void)setShouldChangeVariantForScreenWake:(BOOL)a3
{
  self->_shouldChangeVariantForScreenWake = a3;
}

- (BOOL)isContentUnloadedForFaceSwiping
{
  return self->_contentUnloadedForFaceSwiping;
}

- (void)setContentUnloadedForFaceSwiping:(BOOL)a3
{
  self->_contentUnloadedForFaceSwiping = a3;
}

- (BOOL)isHandlingScreenWake
{
  return self->_handlingScreenWake;
}

- (void)setHandlingScreenWake:(BOOL)a3
{
  self->_handlingScreenWake = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentListing, 0);
  objc_storeStrong((id *)&self->_blackView, 0);
  objc_storeStrong((id *)&self->_pauseLockoutBlock, 0);
  objc_storeStrong((id *)&self->_playNextVideoDelayBlock, 0);
  objc_storeStrong((id *)&self->_playOnWakeTimeout, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
}

@end