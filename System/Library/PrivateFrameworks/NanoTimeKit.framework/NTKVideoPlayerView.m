@interface NTKVideoPlayerView
- (BOOL)_shouldChangeVideoOnTap;
- (BOOL)_shouldChangeVideoOnWake;
- (BOOL)_shouldPause;
- (BOOL)_shouldPlayVideoOnTap;
- (BOOL)isPausedViewEnabled;
- (BOOL)shouldApplyVideoInsetToPosterImage;
- (NTKVideoPlayerDataSource)dataSource;
- (NTKVideoPlayerView)initWithFrame:(CGRect)a3;
- (NTKVideoPlayerViewFaceDelegate)delegate;
- (double)fadeAnimationDuration;
- (id)videoPlayerView;
- (unint64_t)playerBehavior;
- (void)_advanceListingForEvent:(unint64_t)a3;
- (void)_cancelScheduledPreroll;
- (void)_createCurtainView;
- (void)_createPosterImageView;
- (void)_fadeFromCurtainViewIfVisible;
- (void)_fadeFromPosterImageAndCurtainViewIfVisible;
- (void)_fadeFromPosterImageIfVisible:(id)a3;
- (void)_fadeToCurtainView:(id)a3;
- (void)_fadeToPosterImage;
- (void)_hideCurtainView;
- (void)_hidePosterImageView;
- (void)_loadCurrentListing;
- (void)_loadVideoPlayerView;
- (void)_mediaServicesWereReset:(id)a3;
- (void)_pause;
- (void)_play;
- (void)_playIfNotPaused;
- (void)_playNextVideoForEvent:(unint64_t)a3 animated:(BOOL)a4;
- (void)_prerollVideo;
- (void)_queueSubsequentListingIfSupported;
- (void)_removeCurrentVideo;
- (void)_resetVideoPlayer;
- (void)_rewindLoadedVideoToBeginning;
- (void)_schedulePreroll;
- (void)_showCurtainView;
- (void)_showPosterImageView;
- (void)_unloadVideoPlayerView;
- (void)_updatePauseState;
- (void)applyDataMode:(int64_t)a3 comingFromDataMode:(int64_t)a4;
- (void)applyFrozen:(BOOL)a3;
- (void)applyOrbing:(BOOL)a3;
- (void)applySlow:(BOOL)a3;
- (void)dealloc;
- (void)didAddSubview:(id)a3;
- (void)handleScreenOff;
- (void)handleStyleDidChange;
- (void)layoutSubviews;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFadeAnimationDuration:(double)a3;
- (void)setPausedViewEnabled:(BOOL)a3;
- (void)setPlayerBehavior:(unint64_t)a3;
- (void)setPosterImage:(id)a3;
- (void)setShouldApplyVideoInsetToPosterImage:(BOOL)a3;
- (void)setVideoPlayerInset:(UIEdgeInsets)a3;
- (void)setVideoPlayerResizeGravity:(int64_t)a3;
- (void)setVideoPlayerTransform:(CGAffineTransform *)a3;
- (void)transitionToEditing;
- (void)videoPlayerView:(id)a3 didFinishPrerolling:(BOOL)a4;
- (void)videoPlayerViewDidBeginPlaying:(id)a3;
- (void)videoPlayerViewDidBeginPlayingQueuedVideo:(id)a3;
- (void)videoPlayerViewDidPauseAfterPlayingVideoToEnd:(id)a3;
- (void)videoPlayerViewWasTapped;
@end

@implementation NTKVideoPlayerView

- (NTKVideoPlayerView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKVideoPlayerView;
  v3 = -[NTKVideoPlayerView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NTKVideoPlayerView *)v3 _createPosterImageView];
    [(NTKVideoPlayerView *)v4 _createCurtainView];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__mediaServicesWereReset_ name:*MEMORY[0x1E4F15048] object:0];

    if (CLKIsClockFaceApp())
    {
      v6 = objc_alloc_init(NTKTaskScheduler);
      taskScheduler = v4->_taskScheduler;
      v4->_taskScheduler = v6;
    }
    v4->_currentDataMode = 0;
    v4->_fadeAnimationDuration = 0.4;
    v4->_pausedViewEnabled = 1;
    v4->_playerBehavior = 3;
    v4->_prerollState = 0;
    v4->_videoPlayerInViewHierarchy = 0;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&v4->_videoPlayerEdgeInsets.top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&v4->_videoPlayerEdgeInsets.bottom = v8;
    v4->_shouldApplyVideoInsetToPosterImage = 0;
    v4->_isHandlingTapGesture = 0;
    v4->_paused = 1;
    v4->_frozen = 0;
    v4->_slow = 0;
    v4->_orbing = 0;
  }
  return v4;
}

- (void)dealloc
{
  curtainView = self->_curtainView;
  self->_curtainView = 0;

  posterImageView = self->_posterImageView;
  self->_posterImageView = 0;

  posterContainerView = self->_posterContainerView;
  self->_posterContainerView = 0;

  videoPlayerView = self->_videoPlayerView;
  self->_videoPlayerView = 0;

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self];

  [(NTKVideoPlayerView *)self _cancelScheduledPreroll];
  v8.receiver = self;
  v8.super_class = (Class)NTKVideoPlayerView;
  [(NTKVideoPlayerView *)&v8 dealloc];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)NTKVideoPlayerView;
  [(NTKVideoPlayerView *)&v20 layoutSubviews];
  [(NTKVideoPlayerView *)self bounds];
  double top = self->_videoPlayerEdgeInsets.top;
  double left = self->_videoPlayerEdgeInsets.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_videoPlayerEdgeInsets.right);
  double v12 = v11 - (top + self->_videoPlayerEdgeInsets.bottom);
  -[CLKVideoPlayerView ntk_setBoundsAndPositionFromFrame:](self->_videoPlayerView, "ntk_setBoundsAndPositionFromFrame:", v5 + left, v7 + top, v10, v12);
  curtainView = self->_curtainView;
  [(NTKVideoPlayerView *)self bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](curtainView, "ntk_setBoundsAndPositionFromFrame:");
  posterContainerView = self->_posterContainerView;
  [(NTKVideoPlayerView *)self bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](posterContainerView, "ntk_setBoundsAndPositionFromFrame:");
  posterImageView = self->_posterImageView;
  if (!self->_shouldApplyVideoInsetToPosterImage)
  {
    [(NTKVideoPlayerView *)self bounds];
    double v6 = v16;
    double v8 = v17;
    double v10 = v18;
    double v12 = v19;
  }
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](posterImageView, "ntk_setBoundsAndPositionFromFrame:", v6, v8, v10, v12);
}

- (void)didAddSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKVideoPlayerView;
  [(NTKVideoPlayerView *)&v4 didAddSubview:a3];
  if (self->_videoPlayerView) {
    -[NTKVideoPlayerView sendSubviewToBack:](self, "sendSubviewToBack:");
  }
  if (self->_curtainView) {
    -[NTKVideoPlayerView bringSubviewToFront:](self, "bringSubviewToFront:");
  }
  if (self->_posterContainerView) {
    -[NTKVideoPlayerView bringSubviewToFront:](self, "bringSubviewToFront:");
  }
}

- (void)handleScreenOff
{
  self->_isHandlingTapGesture = 0;
  if (self->_videoPlayerInViewHierarchy)
  {
    if ([(NTKVideoPlayerView *)self _shouldChangeVideoOnWake]) {
      [(NTKVideoPlayerView *)self _advanceListingForEvent:1];
    }
    [(NTKVideoPlayerView *)self _pause];
    [(NTKVideoPlayerView *)self _showCurtainView];
    v3 = [(NTKVideoPlayerView *)self videoPlayerView];
    [v3 expectPreroll];

    [(NTKVideoPlayerView *)self _schedulePreroll];
  }
}

- (void)handleStyleDidChange
{
  if (self->_currentDataMode == 1)
  {
    [(NTKVideoPlayerView *)self _playNextVideoForEvent:0 animated:0];
  }
  else
  {
    [(NTKVideoPlayerView *)self _unloadVideoPlayerView];
    [(NTKVideoPlayerView *)self _advanceListingForEvent:0];
    [(NTKVideoPlayerView *)self _loadCurrentListing];
    [(NTKVideoPlayerView *)self _showPosterImageView];
  }
}

- (void)applyFrozen:(BOOL)a3
{
  self->_frozen = a3;
  [(NTKVideoPlayerView *)self _updatePauseState];
}

- (void)applySlow:(BOOL)a3
{
  self->_slow = a3;
  [(NTKVideoPlayerView *)self _updatePauseState];
}

- (void)applyOrbing:(BOOL)a3
{
  self->_orbing = a3;
  [(NTKVideoPlayerView *)self _updatePauseState];
}

- (void)videoPlayerViewWasTapped
{
  if (!self->_isHandlingTapGesture)
  {
    if ([(NTKVideoPlayerView *)self _shouldChangeVideoOnTap])
    {
      self->_isHandlingTapGesture = 1;
      [(NTKVideoPlayerView *)self _playNextVideoForEvent:2 animated:1];
    }
    else if ([(NTKVideoPlayerView *)self _shouldPlayVideoOnTap])
    {
      self->_isHandlingTapGesture = 1;
      [(NTKVideoPlayerView *)self _rewindLoadedVideoToBeginning];
      [(NTKVideoPlayerView *)self _play];
    }
  }
}

- (void)transitionToEditing
{
  [(NTKVideoPlayerView *)self _updatePauseState];
  if ([(UIView *)self->_posterContainerView isHidden])
  {
    [(NTKVideoPlayerView *)self _fadeToPosterImage];
  }
}

- (void)applyDataMode:(int64_t)a3 comingFromDataMode:(int64_t)a4
{
  if (self->_currentDataMode != a3)
  {
    self->_currentDataMode = a3;
    self->_isHandlingTapGesture = 0;
    switch(self->_currentDataMode)
    {
      case 0:
        goto LABEL_14;
      case 1:
        if (self->_videoPlayerInViewHierarchy)
        {
          if (self->_prerollState == 3
            && ([(NTKVideoPlayerView *)self videoPlayerView],
                double v5 = objc_claimAutoreleasedReturnValue(),
                int v6 = [v5 isPlaybackReady],
                v5,
                v6))
          {
            if (![(UIView *)self->_posterContainerView isHidden]) {
              [(NTKVideoPlayerView *)self _fadeFromPosterImageIfVisible:0];
            }
            [(NTKVideoPlayerView *)self _hideCurtainView];
            [(NTKVideoPlayerView *)self _play];
          }
          else
          {
            [(NTKVideoPlayerView *)self _cancelScheduledPreroll];
            if (self->_prerollState)
            {
              [(NTKVideoPlayerView *)self _loadCurrentListing];
              [(NTKVideoPlayerView *)self _play];
            }
            else
            {
              [(NTKVideoPlayerView *)self _updatePauseState];
            }
            [(NTKVideoPlayerView *)self _fadeFromPosterImageIfVisible:0];
          }
          self->_prerollState = 0;
        }
        else
        {
          [(NTKVideoPlayerView *)self _playNextVideoForEvent:0 animated:1];
        }
        return;
      case 2:
        if (self->_videoPlayerInViewHierarchy) {
          [(NTKVideoPlayerView *)self _hidePosterImageView];
        }
        else {
          [(NTKVideoPlayerView *)self _loadVideoPlayerView];
        }
        goto LABEL_24;
      case 3:
        if (a4 == 1) {
          goto LABEL_24;
        }
        goto LABEL_14;
      case 4:
        [(NTKVideoPlayerView *)self _unloadVideoPlayerView];
LABEL_14:
        [(NTKVideoPlayerView *)self _showPosterImageView];
        break;
      case 5:
        [(NTKVideoPlayerView *)self _showPosterImageView];
LABEL_24:
        [(NTKVideoPlayerView *)self _updatePauseState];
        break;
      default:
        return;
    }
  }
}

- (id)videoPlayerView
{
  [(NTKVideoPlayerView *)self _createVideoPlayerViewIfNeeded];
  videoPlayerView = self->_videoPlayerView;
  return videoPlayerView;
}

- (void)_resetVideoPlayer
{
  self->_prerollState = 0;
  self->_isHandlingTapGesture = 0;
  v3 = [(NTKVideoPlayerView *)self videoPlayerView];
  [v3 setDelegate:0];

  [(NTKVideoPlayerView *)self _unloadVideoPlayerView];
  videoPlayerView = self->_videoPlayerView;
  self->_videoPlayerView = 0;

  [(NTKVideoPlayerView *)self _loadVideoPlayerView];
}

- (void)_loadVideoPlayerView
{
  [(NTKVideoPlayerView *)self _createVideoPlayerViewIfNeeded];
  v3 = [(NTKVideoPlayerView *)self videoPlayerView];
  [(NTKVideoPlayerView *)self addSubview:v3];

  self->_videoPlayerInViewHierarchy = 1;
}

- (void)_unloadVideoPlayerView
{
  [(NTKVideoPlayerView *)self _cancelScheduledPreroll];
  self->_prerollState = 0;
  [(NTKVideoPlayerView *)self _updatePauseState];
  [(NTKVideoPlayerView *)self _rewindLoadedVideoToBeginning];
  v3 = [(NTKVideoPlayerView *)self videoPlayerView];
  [v3 removeFromSuperview];

  self->_videoPlayerInViewHierarchy = 0;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
  [(NTKVideoPlayerView *)self _cancelScheduledPreroll];
  self->_prerollState = 0;
  [(NTKVideoPlayerView *)self _pause];
  [(NTKVideoPlayerView *)self _unloadVideoPlayerView];
}

- (void)_cancelScheduledPreroll
{
}

- (void)_schedulePreroll
{
  v3 = _NTKLoggingObjectForDomain(32, (uint64_t)"NTKLoggingDomainAnalogVideo");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Scheduling preroll", (uint8_t *)buf, 2u);
  }

  if (self->_prerollState == 1)
  {
    [(NTKVideoPlayerView *)self _cancelScheduledPreroll];
    self->_prerollState = 0;
  }
  self->_prerollState = 1;
  objc_initWeak(buf, self);
  taskScheduler = self->_taskScheduler;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__NTKVideoPlayerView__schedulePreroll__block_invoke;
  v6[3] = &unk_1E62C0820;
  objc_copyWeak(&v7, buf);
  id v5 = [(NTKTaskScheduler *)taskScheduler scheduleTask:v6 identifier:@"com.apple.ntk.NTKVideoPlayerView"];
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

uint64_t __38__NTKVideoPlayerView__schedulePreroll__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_10:
    char v1 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = WeakRetained[61];
  if ((unint64_t)(v4 - 2) < 2 || v4 == 0)
  {
    int v6 = _NTKLoggingObjectForDomain(32, (uint64_t)"NTKLoggingDomainAnalogVideo");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v3[61];
      int v9 = 134217984;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Not prerolling video because _prerollState == %lu", (uint8_t *)&v9, 0xCu);
    }

    goto LABEL_10;
  }
  if (v4 == 1)
  {
    [WeakRetained _prerollVideo];
    char v1 = 1;
  }
LABEL_11:

  return v1 & 1;
}

- (void)_prerollVideo
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = _NTKLoggingObjectForDomain(32, (uint64_t)"NTKLoggingDomainAnalogVideo");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(NTKVideoPlayerView *)self dataSource];
    id v5 = [v4 currentListing];
    int v6 = [v5 description];
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Prerolling video: %@", (uint8_t *)&v8, 0xCu);
  }
  self->_prerollState = 2;
  [(NTKVideoPlayerView *)self _loadCurrentListing];
  uint64_t v7 = [(NTKVideoPlayerView *)self videoPlayerView];
  [v7 preroll];
}

- (void)videoPlayerView:(id)a3 didFinishPrerolling:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t prerollState = self->_prerollState;
  if (prerollState < 2 || prerollState == 3)
  {
    int v9 = _NTKLoggingObjectForDomain(32, (uint64_t)"NTKLoggingDomainAnalogVideo");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(NTKVideoPlayerView *)self dataSource];
      uint64_t v11 = [v10 currentListing];
      double v12 = [v11 description];
      int v20 = 138412546;
      v21 = v12;
      __int16 v22 = 1024;
      BOOL v23 = v4;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "Finished prerolling video while _prerollState != inProgress: %@ successful: %d", (uint8_t *)&v20, 0x12u);
    }
    goto LABEL_8;
  }
  if (prerollState != 2) {
    goto LABEL_14;
  }
  int v9 = _NTKLoggingObjectForDomain(32, (uint64_t)"NTKLoggingDomainAnalogVideo");
  BOOL v13 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v13)
    {
      double v17 = [(NTKVideoPlayerView *)self dataSource];
      double v18 = [v17 currentListing];
      double v19 = [v18 description];
      int v20 = 138412290;
      v21 = v19;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "Unsuccessfully prerolled video: %@", (uint8_t *)&v20, 0xCu);
    }
LABEL_8:

    goto LABEL_14;
  }
  if (v13)
  {
    v14 = [(NTKVideoPlayerView *)self dataSource];
    v15 = [v14 currentListing];
    double v16 = [v15 description];
    int v20 = 138412290;
    v21 = v16;
    _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "Successfully prerolled video: %@", (uint8_t *)&v20, 0xCu);
  }
  self->_unint64_t prerollState = 3;
LABEL_14:
}

- (BOOL)_shouldPause
{
  return self->_frozen
      || self->_slow
      || self->_orbing
      || self->_currentDataMode != 1
      || !self->_videoPlayerInViewHierarchy;
}

- (void)_playIfNotPaused
{
  if (![(NTKVideoPlayerView *)self _shouldPause])
  {
    [(NTKVideoPlayerView *)self _play];
  }
}

- (void)_updatePauseState
{
  BOOL v3 = [(NTKVideoPlayerView *)self _shouldPause];
  if (v3 && self->_paused != v3)
  {
    [(NTKVideoPlayerView *)self _pause];
  }
}

- (void)_play
{
  BOOL v3 = [(NTKVideoPlayerView *)self videoPlayerView];
  [v3 play];

  self->_paused = 0;
}

- (void)_pause
{
  BOOL v3 = [(NTKVideoPlayerView *)self videoPlayerView];
  [v3 pause];

  self->_paused = 1;
}

- (void)_rewindLoadedVideoToBeginning
{
  v2 = [(NTKVideoPlayerView *)self videoPlayerView];
  long long v3 = *MEMORY[0x1E4F1FA48];
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v2 seekToTime:&v3];
}

- (void)_playNextVideoForEvent:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (!self->_videoPlayerInViewHierarchy) {
    [(NTKVideoPlayerView *)self _loadVideoPlayerView];
  }
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __54__NTKVideoPlayerView__playNextVideoForEvent_animated___block_invoke;
  uint64_t v11 = &unk_1E62C87D8;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  BOOL v13 = v4;
  uint64_t v7 = (void (**)(void))_Block_copy(&v8);
  [(NTKVideoPlayerView *)self _pause];
  if (v4) {
    [(NTKVideoPlayerView *)self _fadeToCurtainView:v7];
  }
  else {
    v7[2](v7);
  }

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __54__NTKVideoPlayerView__playNextVideoForEvent_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _advanceListingForEvent:*(void *)(a1 + 40)];
    [v3 _loadCurrentListing];
    if (*(unsigned char *)(a1 + 48))
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __54__NTKVideoPlayerView__playNextVideoForEvent_animated___block_invoke_2;
      v4[3] = &unk_1E62BFF20;
      v4[4] = v3;
      [v3 _fadeFromPosterImageIfVisible:v4];
    }
    else
    {
      [v3 _hidePosterImageView];
      [v3 _playIfNotPaused];
    }
  }
}

uint64_t __54__NTKVideoPlayerView__playNextVideoForEvent_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playIfNotPaused];
}

- (void)_loadCurrentListing
{
  long long v3 = [(NTKVideoPlayerView *)self dataSource];
  id v6 = [v3 currentListing];

  if (v6)
  {
    BOOL v4 = [(NTKVideoPlayerView *)self videoPlayerView];
    id v5 = [v6 video];
    [v4 loadVideo:v5];
  }
}

- (void)_advanceListingForEvent:(unint64_t)a3
{
  id v5 = [(NTKVideoPlayerView *)self dataSource];
  [v5 advanceToNextListing:a3];

  id v8 = [(NTKVideoPlayerView *)self delegate];
  id v6 = [(NTKVideoPlayerView *)self dataSource];
  uint64_t v7 = [v6 currentListing];
  [v8 customizeFaceViewForListing:v7 changeEvent:a3 animated:a3 != 1];
}

- (void)videoPlayerViewDidBeginPlaying:(id)a3
{
  self->_isHandlingTapGesture = 0;
  [(NTKVideoPlayerView *)self _fadeFromPosterImageAndCurtainViewIfVisible];
  BOOL v4 = [(NTKVideoPlayerView *)self delegate];
  id v5 = [(NTKVideoPlayerView *)self dataSource];
  id v6 = [v5 currentListing];
  [v4 customizeFaceViewForListing:v6 changeEvent:3 animated:1];

  [(NTKVideoPlayerView *)self _queueSubsequentListingIfSupported];
  id v7 = [(NTKVideoPlayerView *)self delegate];
  [v7 videoDidBeginPlayingQueuedVideo];
}

- (void)videoPlayerViewDidPauseAfterPlayingVideoToEnd:(id)a3
{
  BOOL v4 = [(NTKVideoPlayerView *)self delegate];
  [v4 videoDidFinishPlayingToEnd];

  if (!self->_paused)
  {
    id v5 = [(NTKVideoPlayerView *)self dataSource];
    id v6 = [v5 currentListing];
    uint64_t v7 = [v6 endBehavior];

    switch(v7)
    {
      case 0:
        [(NTKVideoPlayerView *)self _playNextVideoForEvent:4 animated:1];
        break;
      case 1:
        [(NTKVideoPlayerView *)self _pause];
        [(NTKVideoPlayerView *)self _fadeToCurtainView:0];
        break;
      case 2:
        [(NTKVideoPlayerView *)self _rewindLoadedVideoToBeginning];
        [(NTKVideoPlayerView *)self _play];
        break;
      case 3:
        [(NTKVideoPlayerView *)self _pause];
        break;
      default:
        return;
    }
  }
}

- (void)videoPlayerViewDidBeginPlayingQueuedVideo:(id)a3
{
  BOOL v4 = [(NTKVideoPlayerView *)self delegate];
  [v4 videoDidFinishPlayingToEnd];

  id v5 = [(NTKVideoPlayerView *)self delegate];
  id v6 = [(NTKVideoPlayerView *)self dataSource];
  uint64_t v7 = [v6 currentListing];
  [v5 customizeFaceViewForListing:v7 changeEvent:3 animated:1];

  [(NTKVideoPlayerView *)self _queueSubsequentListingIfSupported];
}

- (void)_queueSubsequentListingIfSupported
{
  long long v3 = [(NTKVideoPlayerView *)self dataSource];
  id v6 = [v3 listingToQueueOncePlaybackStarts];

  if (v6)
  {
    BOOL v4 = [(NTKVideoPlayerView *)self videoPlayerView];
    id v5 = [v6 video];
    [v4 queueVideo:v5];
  }
}

- (void)setPosterImage:(id)a3
{
  id v4 = a3;
  [(NTKVideoPlayerView *)self _createPosterImageView];
  [(UIImageView *)self->_posterImageView setImage:v4];
}

- (void)_createPosterImageView
{
  if (!self->_posterContainerView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKVideoPlayerView *)self bounds];
    id v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    posterContainerView = self->_posterContainerView;
    self->_posterContainerView = v4;

    id v6 = self->_posterContainerView;
    uint64_t v7 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v6 setBackgroundColor:v7];

    [(UIView *)self->_posterContainerView setHidden:1];
    [(NTKVideoPlayerView *)self addSubview:self->_posterContainerView];
    id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(NTKVideoPlayerView *)self bounds];
    uint64_t v9 = (UIImageView *)objc_msgSend(v8, "initWithFrame:");
    posterImageView = self->_posterImageView;
    self->_posterImageView = v9;

    [(UIImageView *)self->_posterImageView setContentMode:1];
    uint64_t v11 = self->_posterContainerView;
    double v12 = self->_posterImageView;
    [(UIView *)v11 addSubview:v12];
  }
}

- (void)_showPosterImageView
{
  [(UIView *)self->_posterContainerView setAlpha:1.0];
  posterContainerView = self->_posterContainerView;
  [(UIView *)posterContainerView setHidden:0];
}

- (void)_hidePosterImageView
{
}

- (void)_fadeToPosterImage
{
  [(UIView *)self->_curtainView setAlpha:0.0];
  [(UIView *)self->_curtainView setHidden:0];
  [(UIView *)self->_posterContainerView setAlpha:0.0];
  [(UIView *)self->_posterContainerView setHidden:0];
  double fadeAnimationDuration = self->_fadeAnimationDuration;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__NTKVideoPlayerView__fadeToPosterImage__block_invoke;
  v5[3] = &unk_1E62BFF20;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__NTKVideoPlayerView__fadeToPosterImage__block_invoke_2;
  v4[3] = &unk_1E62C2648;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:v4 completion:fadeAnimationDuration];
}

uint64_t __40__NTKVideoPlayerView__fadeToPosterImage__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v2 setAlpha:1.0];
}

uint64_t __40__NTKVideoPlayerView__fadeToPosterImage__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _rewindLoadedVideoToBeginning];
  }
  return result;
}

- (void)_fadeFromPosterImageIfVisible:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(UIView *)self->_posterContainerView isHidden])
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4FB1EB0];
    double fadeAnimationDuration = self->_fadeAnimationDuration;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__NTKVideoPlayerView__fadeFromPosterImageIfVisible___block_invoke;
    v9[3] = &unk_1E62BFF20;
    v9[4] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__NTKVideoPlayerView__fadeFromPosterImageIfVisible___block_invoke_2;
    v7[3] = &unk_1E62C0870;
    v7[4] = self;
    id v8 = v4;
    [v5 animateWithDuration:v9 animations:v7 completion:fadeAnimationDuration];
  }
}

uint64_t __52__NTKVideoPlayerView__fadeFromPosterImageIfVisible___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v2 setAlpha:0.0];
}

uint64_t __52__NTKVideoPlayerView__fadeFromPosterImageIfVisible___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) _hidePosterImageView];
    [*(id *)(v2 + 32) _hideCurtainView];
    result = *(void *)(v2 + 40);
    if (result)
    {
      id v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  return result;
}

- (void)_createCurtainView
{
  if (!self->_curtainView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    id v4 = [(NTKVideoPlayerView *)self videoPlayerView];
    [v4 bounds];
    id v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    curtainView = self->_curtainView;
    self->_curtainView = v5;

    uint64_t v7 = self->_curtainView;
    id v8 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v7 setBackgroundColor:v8];

    [(UIView *)self->_curtainView setHidden:1];
    uint64_t v9 = self->_curtainView;
    [(NTKVideoPlayerView *)self addSubview:v9];
  }
}

- (void)_showCurtainView
{
  [(UIView *)self->_curtainView setAlpha:1.0];
  curtainView = self->_curtainView;
  [(UIView *)curtainView setHidden:0];
}

- (void)_hideCurtainView
{
}

- (void)_fadeToCurtainView:(id)a3
{
  id v4 = a3;
  [(UIView *)self->_curtainView setAlpha:0.0];
  [(UIView *)self->_curtainView setHidden:0];
  id v5 = (void *)MEMORY[0x1E4FB1EB0];
  double fadeAnimationDuration = self->_fadeAnimationDuration;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__NTKVideoPlayerView__fadeToCurtainView___block_invoke;
  v10[3] = &unk_1E62BFF20;
  v10[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__NTKVideoPlayerView__fadeToCurtainView___block_invoke_2;
  v8[3] = &unk_1E62C0848;
  id v9 = v4;
  id v7 = v4;
  [v5 animateWithDuration:v10 animations:v8 completion:fadeAnimationDuration];
}

uint64_t __41__NTKVideoPlayerView__fadeToCurtainView___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
}

uint64_t __41__NTKVideoPlayerView__fadeToCurtainView___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)_fadeFromCurtainViewIfVisible
{
  if (![(UIView *)self->_curtainView isHidden])
  {
    double fadeAnimationDuration = self->_fadeAnimationDuration;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__NTKVideoPlayerView__fadeFromCurtainViewIfVisible__block_invoke;
    v5[3] = &unk_1E62BFF20;
    v5[4] = self;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__NTKVideoPlayerView__fadeFromCurtainViewIfVisible__block_invoke_2;
    v4[3] = &unk_1E62C2648;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:v4 completion:fadeAnimationDuration];
  }
}

uint64_t __51__NTKVideoPlayerView__fadeFromCurtainViewIfVisible__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
}

uint64_t __51__NTKVideoPlayerView__fadeFromCurtainViewIfVisible__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _hideCurtainView];
  }
  return result;
}

- (void)_fadeFromPosterImageAndCurtainViewIfVisible
{
  [(NTKVideoPlayerView *)self _fadeFromCurtainViewIfVisible];
  [(NTKVideoPlayerView *)self _fadeFromPosterImageIfVisible:0];
}

- (void)setVideoPlayerTransform:(CGAffineTransform *)a3
{
  videoPlayerView = self->_videoPlayerView;
  long long v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  [(CLKVideoPlayerView *)videoPlayerView setTransform:v5];
}

- (void)setVideoPlayerInset:(UIEdgeInsets)a3
{
  if (self->_videoPlayerEdgeInsets.left != a3.left
    || self->_videoPlayerEdgeInsets.top != a3.top
    || self->_videoPlayerEdgeInsets.right != a3.right
    || self->_videoPlayerEdgeInsets.bottom != a3.bottom)
  {
    self->_videoPlayerEdgeInsets = a3;
    [(NTKVideoPlayerView *)self setNeedsLayout];
  }
}

- (void)setVideoPlayerResizeGravity:(int64_t)a3
{
}

- (void)setShouldApplyVideoInsetToPosterImage:(BOOL)a3
{
  if (self->_shouldApplyVideoInsetToPosterImage != a3)
  {
    self->_shouldApplyVideoInsetToPosterImage = a3;
    [(NTKVideoPlayerView *)self setNeedsLayout];
  }
}

- (void)_removeCurrentVideo
{
  id v2 = [(CLKVideoPlayerView *)self->_videoPlayerView player];
  [v2 removeAllItems];
}

- (BOOL)_shouldChangeVideoOnTap
{
  return (LOBYTE(self->_playerBehavior) >> 1) & 1;
}

- (BOOL)_shouldPlayVideoOnTap
{
  id v3 = [(NTKVideoPlayerView *)self videoPlayerView];
  if ([v3 playing]) {
    LOBYTE(v4) = 0;
  }
  else {
    BOOL v4 = (LOBYTE(self->_playerBehavior) >> 2) & 1;
  }

  return v4;
}

- (BOOL)_shouldChangeVideoOnWake
{
  return self->_playerBehavior & 1;
}

- (void)setPausedViewEnabled:(BOOL)a3
{
  self->_pausedViewEnabled = a3;
  id v4 = [(NTKVideoPlayerView *)self videoPlayerView];
  [v4 setPausedViewEnabled:self->_pausedViewEnabled];
}

- (void)_mediaServicesWereReset:(id)a3
{
  kdebug_trace();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NTKVideoPlayerView__mediaServicesWereReset___block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __46__NTKVideoPlayerView__mediaServicesWereReset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetVideoPlayer];
}

- (NTKVideoPlayerViewFaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKVideoPlayerViewFaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NTKVideoPlayerDataSource)dataSource
{
  return self->_dataSource;
}

- (unint64_t)playerBehavior
{
  return self->_playerBehavior;
}

- (void)setPlayerBehavior:(unint64_t)a3
{
  self->_playerBehavior = a3;
}

- (double)fadeAnimationDuration
{
  return self->_fadeAnimationDuration;
}

- (void)setFadeAnimationDuration:(double)a3
{
  self->_double fadeAnimationDuration = a3;
}

- (BOOL)shouldApplyVideoInsetToPosterImage
{
  return self->_shouldApplyVideoInsetToPosterImage;
}

- (BOOL)isPausedViewEnabled
{
  return self->_pausedViewEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_videoPlayerView, 0);
  objc_storeStrong((id *)&self->_posterImageView, 0);
  objc_storeStrong((id *)&self->_posterContainerView, 0);
  objc_storeStrong((id *)&self->_curtainView, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
}

@end