@interface PUPlayButtonTileViewController
+ (CGSize)playButtonTileSize;
- (BOOL)_shouldShowPlayButton;
- (BOOL)canShowPauseButton;
- (BOOL)hasAssetBecomeFullyFocusedSinceBeingOutOfFocus;
- (BOOL)isAwaitingAutoPlay;
- (BOOL)showPlayButtonWhileActivated;
- (PUAssetViewModel)assetViewModel;
- (PUBrowsingVideoPlayer)_browsingVideoPlayer;
- (PUBrowsingViewModel)browsingViewModel;
- (PUPlayButtonTileView)playButton;
- (PUPlayButtonTileViewControllerDelegate)delegate;
- (id)loadView;
- (void)_playButtonTapped:(id)a3;
- (void)_setBrowsingVideoPlayer:(id)a3;
- (void)_setShouldShowPlayButton:(BOOL)a3;
- (void)_setShouldShowPlayButton:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateButtonAnimated:(BOOL)a3;
- (void)_updateHasAssetBecomeFullyFocusedSinceBeingOutOfFocus;
- (void)becomeReusable;
- (void)dealloc;
- (void)setAssetViewModel:(id)a3;
- (void)setBrowsingViewModel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasAssetBecomeFullyFocusedSinceBeingOutOfFocus:(BOOL)a3;
- (void)setIsAwaitingAutoPlay:(BOOL)a3;
- (void)setPlayButton:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUPlayButtonTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->__browsingVideoPlayer, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setIsAwaitingAutoPlay:(BOOL)a3
{
  self->_isAwaitingAutoPlay = a3;
}

- (BOOL)isAwaitingAutoPlay
{
  return self->_isAwaitingAutoPlay;
}

- (BOOL)hasAssetBecomeFullyFocusedSinceBeingOutOfFocus
{
  return self->_hasAssetBecomeFullyFocusedSinceBeingOutOfFocus;
}

- (void)setPlayButton:(id)a3
{
}

- (PUPlayButtonTileView)playButton
{
  return self->_playButton;
}

- (BOOL)_shouldShowPlayButton
{
  return self->__shouldShowPlayButton;
}

- (PUBrowsingVideoPlayer)_browsingVideoPlayer
{
  return self->__browsingVideoPlayer;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUPlayButtonTileViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPlayButtonTileViewControllerDelegate *)WeakRetained;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(PUPlayButtonTileViewController *)self _browsingVideoPlayer];

  if (v7 == v15)
  {
    id v11 = v6;
    if (([v11 desiredPlayStateDidChange] & 1) == 0
      && ([v11 isAtBeginningDidChange] & 1) == 0
      && ([v11 isAtEndDidChange] & 1) == 0
      && ([v11 isActivatedDidChange] & 1) == 0
      && ![v11 playStateDidChange])
    {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  id v8 = [(PUPlayButtonTileViewController *)self assetViewModel];

  if (v8 == v15)
  {
    id v12 = v6;
    if (([v12 isUserTransformingTileDidChange] & 1) != 0
      || [v12 assetChanged])
    {
      [(PUPlayButtonTileViewController *)self _updateButtonAnimated:1];
    }
    if ([v12 videoPlayerDidChange])
    {
      v13 = [(PUPlayButtonTileViewController *)self assetViewModel];
      v14 = [v13 videoPlayer];
      [(PUPlayButtonTileViewController *)self _setBrowsingVideoPlayer:v14];
    }
    if ([v12 focusValueChanged]) {
      [(PUPlayButtonTileViewController *)self _updateHasAssetBecomeFullyFocusedSinceBeingOutOfFocus];
    }
    goto LABEL_14;
  }
  id v9 = [(PUPlayButtonTileViewController *)self browsingViewModel];

  if (v9 != v15) {
    goto LABEL_15;
  }
  id v10 = v6;
  if (([v10 isScrubbingDidChange] & 1) != 0
    || ([v10 chromeVisibilityDidChange] & 1) != 0
    || [v10 reviewScreenBarsModelDidChange])
  {
LABEL_13:
    [(PUPlayButtonTileViewController *)self _updateButtonAnimated:1];
  }
LABEL_14:

LABEL_15:
}

- (void)_setShouldShowPlayButton:(BOOL)a3 animated:(BOOL)a4
{
  if (self->__shouldShowPlayButton != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->__shouldShowPlayButton = a3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PUPlayButtonTileViewController__setShouldShowPlayButton_animated___block_invoke;
    aBlock[3] = &unk_1E5F2E120;
    aBlock[4] = self;
    BOOL v16 = a3;
    id v7 = _Block_copy(aBlock);
    id v8 = v7;
    if (v4)
    {
      if (self->_delegateFlags.respondsToDelayForButtonAnimation)
      {
        id v9 = [(PUPlayButtonTileViewController *)self delegate];
        [v9 playButtonTileViewController:self delayForButtonAnimation:v5];
        double v11 = v10;
      }
      else
      {
        double v11 = 0.0;
      }
      id v12 = (void *)MEMORY[0x1E4FB1EB0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __68__PUPlayButtonTileViewController__setShouldShowPlayButton_animated___block_invoke_2;
      v13[3] = &unk_1E5F2EBA0;
      id v14 = v8;
      [v12 _animateUsingDefaultDampedSpringWithDelay:6 initialSpringVelocity:v13 options:0 animations:v11 completion:0.0];
    }
    else
    {
      (*((void (**)(void *))v7 + 2))(v7);
    }
  }
}

void __68__PUPlayButtonTileViewController__setShouldShowPlayButton_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v2 = (double)*(unint64_t *)&a2;
  id v3 = [*(id *)(a1 + 32) playButton];
  [v3 setAlpha:v2];
}

uint64_t __68__PUPlayButtonTileViewController__setShouldShowPlayButton_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setShouldShowPlayButton:(BOOL)a3
{
}

- (void)_updateButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PUPlayButtonTileViewController *)self canShowPauseButton];
  id v27 = [(PUPlayButtonTileViewController *)self _browsingVideoPlayer];
  uint64_t v6 = [v27 playState];
  unsigned int v7 = [v27 isPlaybackDesired];
  if (v6 == 5) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = v7;
  }
  BOOL v9 = v8 == 1 && !v5;
  BOOL v26 = v3;
  if (v9)
  {
    int v11 = 0;
  }
  else
  {
    double v10 = [(PUPlayButtonTileViewController *)self assetViewModel];
    int v11 = [v10 isUserTransformingTile] ^ 1;
  }
  id v12 = +[PUOneUpSettings sharedInstance];
  int v13 = [v12 allowPlayButtonInBars];

  id v14 = +[PUOneUpSettings sharedInstance];
  id v15 = [(PUPlayButtonTileViewController *)self assetViewModel];
  BOOL v16 = [v15 asset];
  int v17 = [v14 allowAutoplayVideoForAsset:v16];

  if (v13 && v17 && v6 != 5) {
    goto LABEL_13;
  }
  if (![v27 isActivated])
  {
    if (v11) {
      goto LABEL_21;
    }
LABEL_13:
    uint64_t v18 = 0;
    BOOL v19 = v26;
    goto LABEL_25;
  }
  v20 = [(PUPlayButtonTileViewController *)self browsingViewModel];
  v21 = v20;
  if (!v11 || ([v20 isScrubbing] & 1) != 0 || !objc_msgSend(v21, "isChromeVisible"))
  {
    uint64_t v18 = 0;
    goto LABEL_24;
  }
  BOOL v22 = [(PUPlayButtonTileViewController *)self showPlayButtonWhileActivated];

  if (!v22) {
    goto LABEL_13;
  }
LABEL_21:
  v23 = [(PUPlayButtonTileViewController *)self assetViewModel];
  v24 = [v23 asset];
  char v25 = [v24 isTemporaryPlaceholder];

  if (v25) {
    goto LABEL_13;
  }
  v21 = [(PUPlayButtonTileViewController *)self playButton];
  [v21 setShowAsPause:v5 & v8];
  uint64_t v18 = 1;
LABEL_24:
  BOOL v19 = v26;

LABEL_25:
  [(PUPlayButtonTileViewController *)self _setShouldShowPlayButton:v18 animated:v19];
}

- (void)setHasAssetBecomeFullyFocusedSinceBeingOutOfFocus:(BOOL)a3
{
  if (self->_hasAssetBecomeFullyFocusedSinceBeingOutOfFocus != a3)
  {
    self->_hasAssetBecomeFullyFocusedSinceBeingOutOfFocus = a3;
    [(PUPlayButtonTileViewController *)self _updateButtonAnimated:1];
  }
}

- (void)_updateHasAssetBecomeFullyFocusedSinceBeingOutOfFocus
{
  uint64_t v3 = [(PUPlayButtonTileViewController *)self assetViewModel];
  if (v3
    && (BOOL v4 = (void *)v3,
        [(PUPlayButtonTileViewController *)self assetViewModel],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        [v5 focusValue],
        double v7 = fabs(v6),
        v5,
        v4,
        v7 < 1.0))
  {
    unsigned int v8 = [(PUPlayButtonTileViewController *)self assetViewModel];
    [v8 focusValue];
    int v9 = PXFloatApproximatelyEqualToFloat();

    if (!v9) {
      return;
    }
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }
  [(PUPlayButtonTileViewController *)self setHasAssetBecomeFullyFocusedSinceBeingOutOfFocus:v10];
}

- (void)_playButtonTapped:(id)a3
{
  if (self->_delegateFlags.respondsToDidTapButton)
  {
    BOOL v4 = [(PUPlayButtonTileViewController *)self delegate];
    [v4 playButtonTileViewControllerDidTapButton:self];
  }
  [(PUPlayButtonTileViewController *)self _updateButtonAnimated:1];
}

- (BOOL)showPlayButtonWhileActivated
{
  if (!self->_delegateFlags.respondsToShouldShowPlayButtonWhileActivated) {
    return 0;
  }
  double v2 = self;
  uint64_t v3 = [(PUPlayButtonTileViewController *)self delegate];
  LOBYTE(v2) = [v3 playButtonTileViewControllerShouldShowPlayButtonWhileActivated:v2];

  return (char)v2;
}

- (BOOL)canShowPauseButton
{
  if (!self->_delegateFlags.respondsToDidTapButton) {
    return 0;
  }
  double v2 = self;
  uint64_t v3 = [(PUPlayButtonTileViewController *)self delegate];
  LOBYTE(v2) = [v3 playButtonTileViewControllerShouldShowPauseButton:v2];

  return (char)v2;
}

- (void)_setBrowsingVideoPlayer:(id)a3
{
  BOOL v5 = (PUBrowsingVideoPlayer *)a3;
  browsingVideoPlayer = self->__browsingVideoPlayer;
  if (browsingVideoPlayer != v5)
  {
    double v7 = v5;
    [(PUBrowsingVideoPlayer *)browsingVideoPlayer unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->__browsingVideoPlayer, a3);
    [(PUBrowsingVideoPlayer *)self->__browsingVideoPlayer registerChangeObserver:self];
    [(PUPlayButtonTileViewController *)self _updateButtonAnimated:0];
    BOOL v5 = v7;
  }
}

- (void)setAssetViewModel:(id)a3
{
  BOOL v5 = (PUAssetViewModel *)a3;
  p_assetViewModel = &self->_assetViewModel;
  if (self->_assetViewModel != v5)
  {
    id v12 = v5;
    [(PUPlayButtonTileViewController *)self setHasAssetBecomeFullyFocusedSinceBeingOutOfFocus:0];
    [(PUAssetViewModel *)*p_assetViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUAssetViewModel *)*p_assetViewModel registerChangeObserver:self];
    if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled])
    {
      double v7 = +[PUOneUpSettings sharedInstance];
      unsigned int v8 = [(PUAssetViewModel *)v12 asset];
      if ([v7 allowAutoplayVideoForAsset:v8])
      {
        int v9 = [(PUAssetViewModel *)v12 videoPlayer];
        char v10 = [v9 isPlaybackDesired];

        if ((v10 & 1) == 0) {
          [(PUPlayButtonTileViewController *)self setIsAwaitingAutoPlay:1];
        }
      }
      else
      {
      }
    }
    int v11 = [(PUAssetViewModel *)v12 videoPlayer];
    [(PUPlayButtonTileViewController *)self _setBrowsingVideoPlayer:v11];

    [(PUPlayButtonTileViewController *)self _updateHasAssetBecomeFullyFocusedSinceBeingOutOfFocus];
    [(PUPlayButtonTileViewController *)self _updateButtonAnimated:0];
    BOOL v5 = v12;
  }
}

- (void)setBrowsingViewModel:(id)a3
{
  BOOL v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    double v7 = v5;
    [(PUBrowsingViewModel *)browsingViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    [(PUBrowsingViewModel *)self->_browsingViewModel registerChangeObserver:self];
    [(PUPlayButtonTileViewController *)self _updateButtonAnimated:0];
    BOOL v5 = v7;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToShouldShowPauseButton = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowPlayButtonWhileActivated = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidTapButton = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDelayForButtonAnimation = objc_opt_respondsToSelector() & 1;
  }
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUPlayButtonTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUPlayButtonTileViewController *)self setBrowsingViewModel:0];
  [(PUPlayButtonTileViewController *)self setAssetViewModel:0];
}

- (void)dealloc
{
  [(PUAssetViewModel *)self->_assetViewModel unregisterChangeObserver:self];
  [(PUBrowsingVideoPlayer *)self->__browsingVideoPlayer unregisterChangeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PUPlayButtonTileViewController;
  [(PUTileViewController *)&v3 dealloc];
}

- (id)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  BOOL v4 = [PUPlayButtonTileView alloc];
  BOOL v5 = -[PUPlayButtonTileView initWithStyle:](v4, "initWithStyle:", [MEMORY[0x1E4F90300] isOneUpRefreshEnabled]);
  [(PUPlayButtonTileViewController *)self setPlayButton:v5];

  [v3 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(PUPlayButtonTileViewController *)self playButton];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  id v15 = [(PUPlayButtonTileViewController *)self playButton];
  [v15 setAutoresizingMask:18];

  BOOL v16 = [(PUPlayButtonTileViewController *)self playButton];
  [v16 setAlpha:0.0];

  int v17 = [(PUPlayButtonTileViewController *)self playButton];
  [v17 setTarget:self selector:sel__playButtonTapped_];

  [(PUPlayButtonTileViewController *)self _updateButtonAnimated:0];
  uint64_t v18 = [(PUPlayButtonTileViewController *)self playButton];
  [v3 addSubview:v18];

  return v3;
}

+ (CGSize)playButtonTileSize
{
  if (playButtonTileSize_onceToken != -1) {
    dispatch_once(&playButtonTileSize_onceToken, &__block_literal_global_72805);
  }
  double v2 = *(double *)&playButtonTileSize_playButtonTileSize_0;
  double v3 = *(double *)&playButtonTileSize_playButtonTileSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __52__PUPlayButtonTileViewController_playButtonTileSize__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4FB1EB0], "px_videoOverlayButtonWithStyle:", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  playButtonTileSize_playButtonTileSize_0 = v0;
  playButtonTileSize_playButtonTileSize_1 = v1;
}

@end