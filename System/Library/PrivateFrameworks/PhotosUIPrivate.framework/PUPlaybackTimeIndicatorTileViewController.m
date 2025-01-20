@interface PUPlaybackTimeIndicatorTileViewController
+ (CGSize)playbackTimeIndicatorTileSize;
- (BOOL)_isIndicatorVisible;
- (NSDate)forcedIndicatorVisibilityEndDate;
- (PUBrowsingVideoPlayer)videoPlayer;
- (PUBrowsingViewModel)viewModel;
- (PUPlaybackTimeIndicatorTileViewControllerDelegate)delegate;
- (PUPlaybackTimeLabel)_label;
- (int64_t)_indicatorFormat;
- (void)_cancelFlashTimeIndicator;
- (void)_flashTimeIndicator;
- (void)_handleVideoPlayer:(id)a3 change:(id)a4;
- (void)_handleViewModel:(id)a3 change:(id)a4;
- (void)_setIndicatorFormat:(int64_t)a3;
- (void)_setIndicatorFormat:(int64_t)a3 animated:(BOOL)a4;
- (void)_setIndicatorVisible:(BOOL)a3;
- (void)_setIndicatorVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateIndicatorDisplayStyle;
- (void)_updateIndicatorValueWithTime:(id *)a3;
- (void)becomeReusable;
- (void)setDelegate:(id)a3;
- (void)setForcedIndicatorVisibilityEndDate:(id)a3;
- (void)setVideoPlayer:(id)a3;
- (void)setViewModel:(id)a3;
- (void)videoPlayer:(id)a3 currentTimeDidChange:(id *)a4;
- (void)videoPlayer:(id)a3 desiredSeekTimeDidChange:(id *)a4;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUPlaybackTimeIndicatorTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcedIndicatorVisibilityEndDate, 0);
  objc_storeStrong((id *)&self->__label, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSDate)forcedIndicatorVisibilityEndDate
{
  return self->_forcedIndicatorVisibilityEndDate;
}

- (BOOL)_isIndicatorVisible
{
  return self->__isIndicatorVisible;
}

- (int64_t)_indicatorFormat
{
  return self->__indicatorFormat;
}

- (PUPlaybackTimeLabel)_label
{
  return self->__label;
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (PUBrowsingVideoPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (PUPlaybackTimeIndicatorTileViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPlaybackTimeIndicatorTileViewControllerDelegate *)WeakRetained;
}

- (void)_cancelFlashTimeIndicator
{
}

- (void)_flashTimeIndicator
{
  id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:2.0];
  [(PUPlaybackTimeIndicatorTileViewController *)self setForcedIndicatorVisibilityEndDate:v3];
}

- (void)_handleViewModel:(id)a3 change:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v6 isScrubbingDidChange]) {
    [(PUPlaybackTimeIndicatorTileViewController *)self _updateIndicatorDisplayStyle];
  }
  if ([v6 chromeVisibilityDidChange])
  {
    if ([v11 isChromeVisible])
    {
      if ([v11 lastChromeVisibilityChangeReason] == 1)
      {
        v7 = [(PUPlaybackTimeIndicatorTileViewController *)self videoPlayer];
        uint64_t v8 = [v7 desiredPlayState];

        if (v8 == 4)
        {
          if (!self->_delegateFlags.respondsToCanFlashIndicator
            || ([(PUPlaybackTimeIndicatorTileViewController *)self delegate],
                v9 = objc_claimAutoreleasedReturnValue(),
                int v10 = [v9 playbackTimeIndicatorTileViewControllerCanFlashIndicator:self],
                v9,
                v10))
          {
            [(PUPlaybackTimeIndicatorTileViewController *)self _flashTimeIndicator];
          }
        }
      }
    }
  }
}

- (void)_handleVideoPlayer:(id)a3 change:(id)a4
{
  id v5 = a4;
  if (([v5 isAtBeginningDidChange] & 1) != 0
    || [v5 desiredPlayStateDidChange])
  {
    [(PUPlaybackTimeIndicatorTileViewController *)self _updateIndicatorDisplayStyle];
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(PUPlaybackTimeIndicatorTileViewController *)self videoPlayer];

  if (v7 == v9)
  {
    [(PUPlaybackTimeIndicatorTileViewController *)self _handleVideoPlayer:v9 change:v6];
  }
  else
  {
    id v8 = [(PUPlaybackTimeIndicatorTileViewController *)self viewModel];

    if (v8 == v9) {
      [(PUPlaybackTimeIndicatorTileViewController *)self _handleViewModel:v9 change:v6];
    }
  }
}

- (void)videoPlayer:(id)a3 desiredSeekTimeDidChange:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a4;
  [(PUPlaybackTimeIndicatorTileViewController *)self _updateIndicatorValueWithTime:&v4];
}

- (void)videoPlayer:(id)a3 currentTimeDidChange:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a4;
  [(PUPlaybackTimeIndicatorTileViewController *)self _updateIndicatorValueWithTime:&v4];
}

- (void)_updateIndicatorDisplayStyle
{
  id v11 = [(PUPlaybackTimeIndicatorTileViewController *)self videoPlayer];
  id v3 = [(PUPlaybackTimeIndicatorTileViewController *)self viewModel];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = +[PUScrubberSettings sharedInstance];
  if ([v11 desiredPlayState] == 3) {
    goto LABEL_2;
  }
  if ([v3 isScrubbing])
  {
    uint64_t v5 = [v4 scrubbingPlaybackIndicator];
  }
  else if ([v11 isAtBeginning] && objc_msgSend(v11, "isActivated"))
  {
    uint64_t v5 = [v4 initialPlaybackIndicator];
  }
  else
  {
    id v6 = [(PUPlaybackTimeIndicatorTileViewController *)self forcedIndicatorVisibilityEndDate];
    [v6 timeIntervalSinceNow];
    double v8 = v7;

    if (v8 <= 0.0)
    {
      if ([v11 desiredPlayState] != 4)
      {
LABEL_2:
        uint64_t v5 = [v4 defaultPlaybackIndicator];
        goto LABEL_12;
      }
      uint64_t v5 = [v4 playingPlaybackIndicator];
    }
    else
    {
      uint64_t v5 = [v4 chromeShownPlaybackIndicator];
    }
  }
LABEL_12:
  if (v11) {
    BOOL v9 = v3 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v10 = !v9;
  [(PUPlaybackTimeIndicatorTileViewController *)self _setIndicatorFormat:v5 animated:v10];
}

- (void)_updateIndicatorValueWithTime:(id *)a3
{
  uint64_t v5 = [(PUPlaybackTimeIndicatorTileViewController *)self videoPlayer];
  id v6 = v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  memset(&v8[1], 0, sizeof($3CC8671D27C23BF42ADDB32F2B5E48AE));
  if (v5) {
    [v5 duration];
  }
  double v7 = [(PUPlaybackTimeIndicatorTileViewController *)self _label];
  v8[0] = v9;
  [v7 setCurrentPlaybackTime:v8];
  v8[0] = v8[1];
  [v7 setPlaybackDuration:v8];
}

- (void)setForcedIndicatorVisibilityEndDate:(id)a3
{
  uint64_t v5 = (NSDate *)a3;
  id v6 = self->_forcedIndicatorVisibilityEndDate;
  if (v6 == v5)
  {
  }
  else
  {
    double v7 = v6;
    char v8 = [(NSDate *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_forcedIndicatorVisibilityEndDate, a3);
      [(PUPlaybackTimeIndicatorTileViewController *)self _updateIndicatorDisplayStyle];
      if (v5)
      {
        [(NSDate *)v5 timeIntervalSinceNow];
        double v10 = v9 + 0.05;
        objc_initWeak(&location, self);
        dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __81__PUPlaybackTimeIndicatorTileViewController_setForcedIndicatorVisibilityEndDate___block_invoke;
        v12[3] = &unk_1E5F2E530;
        objc_copyWeak(&v13, &location);
        dispatch_after(v11, MEMORY[0x1E4F14428], v12);
        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __81__PUPlaybackTimeIndicatorTileViewController_setForcedIndicatorVisibilityEndDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateIndicatorDisplayStyle];
}

- (void)_setIndicatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->__isIndicatorVisible != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->__isIndicatorVisible = a3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__PUPlaybackTimeIndicatorTileViewController__setIndicatorVisible_animated___block_invoke;
    aBlock[3] = &unk_1E5F2E120;
    aBlock[4] = self;
    BOOL v14 = a3;
    id v6 = (void (**)(void))_Block_copy(aBlock);
    double v7 = v6;
    if (v4)
    {
      if (v5) {
        double v8 = 0.1;
      }
      else {
        double v8 = 0.3;
      }
      if (v5) {
        double v9 = 0.0;
      }
      else {
        double v9 = 0.5;
      }
      double v10 = (void *)MEMORY[0x1E4FB1EB0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __75__PUPlaybackTimeIndicatorTileViewController__setIndicatorVisible_animated___block_invoke_2;
      v11[3] = &unk_1E5F2EBA0;
      v12 = v6;
      [v10 animateWithDuration:4 delay:v11 options:0 animations:v8 completion:v9];
    }
    else
    {
      v6[2](v6);
    }
  }
}

void __75__PUPlaybackTimeIndicatorTileViewController__setIndicatorVisible_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _label];
  id v4 = v2;
  double v3 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 0.0;
  }
  [v2 setAlpha:v3];
}

uint64_t __75__PUPlaybackTimeIndicatorTileViewController__setIndicatorVisible_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setIndicatorVisible:(BOOL)a3
{
}

- (void)_setIndicatorFormat:(int64_t)a3 animated:(BOOL)a4
{
  if (self->__indicatorFormat != a3)
  {
    BOOL v4 = a4;
    self->__indicatorFormat = a3;
    if (a3)
    {
      double v7 = [(PUPlaybackTimeIndicatorTileViewController *)self _label];
      [v7 setFormat:a3];
    }
    [(PUPlaybackTimeIndicatorTileViewController *)self _setIndicatorVisible:a3 != 0 animated:v4];
  }
}

- (void)_setIndicatorFormat:(int64_t)a3
{
}

- (void)setViewModel:(id)a3
{
  BOOL v5 = (PUBrowsingViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v12 = v5;
    [(PUBrowsingViewModel *)viewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(PUBrowsingViewModel *)self->_viewModel registerChangeObserver:self];
    [(PUPlaybackTimeIndicatorTileViewController *)self _updateIndicatorDisplayStyle];
    if (![(PUBrowsingViewModel *)v12 isChromeVisible]) {
      goto LABEL_6;
    }
    uint64_t v7 = [(PUBrowsingViewModel *)v12 lastChromeVisibilityChangeDate];
    if (!v7) {
      goto LABEL_6;
    }
    double v8 = (void *)v7;
    double v9 = [(PUBrowsingViewModel *)v12 lastChromeVisibilityChangeDate];
    [v9 timeIntervalSinceNow];
    double v11 = v10;

    if (v11 > -2.0) {
      [(PUPlaybackTimeIndicatorTileViewController *)self _flashTimeIndicator];
    }
    else {
LABEL_6:
    }
      [(PUPlaybackTimeIndicatorTileViewController *)self _cancelFlashTimeIndicator];
    BOOL v5 = v12;
  }
}

- (void)setVideoPlayer:(id)a3
{
  BOOL v5 = (PUBrowsingVideoPlayer *)a3;
  p_videoPlayer = &self->_videoPlayer;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    [(PUBrowsingVideoPlayer *)videoPlayer unregisterTimeObserver:self];
    [(PUBrowsingVideoPlayer *)*p_videoPlayer unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    [(PUBrowsingVideoPlayer *)*p_videoPlayer registerTimeObserver:self];
    [(PUBrowsingVideoPlayer *)*p_videoPlayer registerChangeObserver:self];
    if (v5) {
      [(PUBrowsingVideoPlayer *)v5 currentTime];
    }
    else {
      memset(v8, 0, sizeof(v8));
    }
    [(PUPlaybackTimeIndicatorTileViewController *)self _updateIndicatorValueWithTime:v8];
  }
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUPlaybackTimeIndicatorTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUPlaybackTimeIndicatorTileViewController *)self setVideoPlayer:0];
  [(PUPlaybackTimeIndicatorTileViewController *)self setViewModel:0];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToCanFlashIndicator = objc_opt_respondsToSelector() & 1;
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PUPlaybackTimeIndicatorTileViewController;
  [(PUTileViewController *)&v7 viewDidLoad];
  objc_super v3 = [(PUTileViewController *)self view];
  BOOL v4 = [PUPlaybackTimeLabel alloc];
  [v3 bounds];
  BOOL v5 = -[PUPlaybackTimeLabel initWithFrame:](v4, "initWithFrame:");
  label = self->__label;
  self->__label = v5;

  [(PUPlaybackTimeLabel *)self->__label setAutoresizingMask:18];
  [(PUPlaybackTimeLabel *)self->__label setAlpha:0.0];
  [v3 addSubview:self->__label];
}

+ (CGSize)playbackTimeIndicatorTileSize
{
  if (playbackTimeIndicatorTileSize_onceToken != -1) {
    dispatch_once(&playbackTimeIndicatorTileSize_onceToken, &__block_literal_global_73195);
  }
  double v2 = *(double *)&playbackTimeIndicatorTileSize_playbackTimeIndicatorTileSize_0;
  double v3 = *(double *)&playbackTimeIndicatorTileSize_playbackTimeIndicatorTileSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __74__PUPlaybackTimeIndicatorTileViewController_playbackTimeIndicatorTileSize__block_invoke()
{
  v0 = objc_alloc_init(PUPlaybackTimeLabel);
  [(PUPlaybackTimeLabel *)v0 setFormat:2];
  CMTimeMakeWithSeconds(&v4, 360000.0, 1);
  [(PUPlaybackTimeLabel *)v0 setPlaybackDuration:&v4];
  -[PUPlaybackTimeLabel sizeThatFits:](v0, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  playbackTimeIndicatorTileSize_playbackTimeIndicatorTileSize_0 = v2;
  double v3 = 18.0;
  if (v1 >= 18.0) {
    double v3 = v1;
  }
  playbackTimeIndicatorTileSize_playbackTimeIndicatorTileSize_1 = *(void *)&v3;
}

@end