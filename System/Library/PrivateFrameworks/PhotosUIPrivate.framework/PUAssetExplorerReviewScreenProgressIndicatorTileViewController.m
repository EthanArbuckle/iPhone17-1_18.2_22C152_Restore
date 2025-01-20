@interface PUAssetExplorerReviewScreenProgressIndicatorTileViewController
+ (CGSize)progressIndicatorTileSize;
+ (id)_loadErrorIcon;
- (BOOL)_isProgressViewVisible;
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateProgressViewStyle;
- (BOOL)_needsUpdateStatus;
- (BOOL)_needsUpdateStatusViews;
- (PLRoundProgressView)_progressView;
- (PUAssetSharedViewModel)assetSharedViewModel;
- (PUBrowsingVideoPlayer)videoPlayer;
- (PXOperationStatus)_status;
- (UIButton)_errorButton;
- (UILabel)_debugProgressLabel;
- (int64_t)_progressViewStyle;
- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4;
- (void)_handleErrorButtonTap:(id)a3;
- (void)_handleVideoPlayer:(id)a3 didChange:(id)a4;
- (void)_invalidateProgressViewStyle;
- (void)_invalidateStatus;
- (void)_invalidateStatusViews;
- (void)_setDebugProgressLabel:(id)a3;
- (void)_setErrorButton:(id)a3;
- (void)_setNeedsUpdateProgressViewStyle:(BOOL)a3;
- (void)_setNeedsUpdateStatus:(BOOL)a3;
- (void)_setNeedsUpdateStatusViews:(BOOL)a3;
- (void)_setProgressView:(id)a3;
- (void)_setProgressViewStyle:(int64_t)a3;
- (void)_setProgressViewVisible:(BOOL)a3;
- (void)_setProgressViewVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_setStatus:(id)a3;
- (void)_updateIfNeeded;
- (void)_updateProgressViewStyleIfNeeded;
- (void)_updateStatusIfNeeded;
- (void)_updateStatusViewsIfNeeded;
- (void)_updateSubviewOrdering;
- (void)applyLayoutInfo:(id)a3;
- (void)becomeReusable;
- (void)setAssetSharedViewModel:(id)a3;
- (void)setVideoPlayer:(id)a3;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUAssetExplorerReviewScreenProgressIndicatorTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__debugProgressLabel, 0);
  objc_storeStrong((id *)&self->__errorButton, 0);
  objc_storeStrong((id *)&self->__progressView, 0);
  objc_storeStrong((id *)&self->__status, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_assetSharedViewModel, 0);
}

- (void)_setDebugProgressLabel:(id)a3
{
}

- (UILabel)_debugProgressLabel
{
  return self->__debugProgressLabel;
}

- (void)_setErrorButton:(id)a3
{
}

- (UIButton)_errorButton
{
  return self->__errorButton;
}

- (BOOL)_isProgressViewVisible
{
  return self->__isProgressViewVisible;
}

- (void)_setProgressView:(id)a3
{
}

- (PLRoundProgressView)_progressView
{
  return self->__progressView;
}

- (PXOperationStatus)_status
{
  return self->__status;
}

- (int64_t)_progressViewStyle
{
  return self->__progressViewStyle;
}

- (void)_setNeedsUpdateStatusViews:(BOOL)a3
{
  self->__needsUpdateStatusViews = a3;
}

- (BOOL)_needsUpdateStatusViews
{
  return self->__needsUpdateStatusViews;
}

- (void)_setNeedsUpdateStatus:(BOOL)a3
{
  self->__needsUpdateStatus = a3;
}

- (BOOL)_needsUpdateStatus
{
  return self->__needsUpdateStatus;
}

- (void)_setNeedsUpdateProgressViewStyle:(BOOL)a3
{
  self->__needsUpdateProgressViewStyle = a3;
}

- (BOOL)_needsUpdateProgressViewStyle
{
  return self->__needsUpdateProgressViewStyle;
}

- (PUBrowsingVideoPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (PUAssetSharedViewModel)assetSharedViewModel
{
  return self->_assetSharedViewModel;
}

- (void)_handleVideoPlayer:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "desiredPlayStateDidChange", a3))
  {
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _invalidateStatusViews];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _updateIfNeeded];
  }
}

- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "loadingStatusChanged", a3))
  {
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _invalidateStatus];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _updateIfNeeded];
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self assetSharedViewModel];

  if (v7 == v9)
  {
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _handleAssetSharedViewModel:v9 didChange:v6];
  }
  else
  {
    id v8 = [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self videoPlayer];

    if (v8 == v9) {
      [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _handleVideoPlayer:v9 didChange:v6];
    }
  }
}

- (void)_updateSubviewOrdering
{
  id v5 = [(PUTileViewController *)self view];
  v3 = [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _debugProgressLabel];
  [v5 bringSubviewToFront:v3];

  v4 = [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _errorButton];
  [v5 bringSubviewToFront:v4];
}

- (void)_updateStatusViewsIfNeeded
{
  if (![(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _needsUpdateStatusViews])return; {
  [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setNeedsUpdateStatusViews:0];
  }
  if (![(PUTileViewController *)self isViewLoaded]) {
    return;
  }
  id v24 = [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _status];
  uint64_t v3 = [v24 state];
  v4 = [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _progressView];
  int64_t v5 = [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _progressViewStyle];
  if (v4 && [v4 style] != v5)
  {
    [v4 removeFromSuperview];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setProgressView:0];

    v4 = 0;
  }
  id v6 = [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self videoPlayer];
  uint64_t v7 = [v6 desiredPlayState];

  id v8 = [(PUTileViewController *)self view];
  if ((unint64_t)(v3 - 1) <= 1 && v7 != 4)
  {
    if (!v4)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F8A5E8]);
      [v8 bounds];
      v4 = objc_msgSend(v9, "initWithFrame:style:", v5);
      [v4 setAutoresizingMask:18];
      [v8 addSubview:v4];
      [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setProgressView:v4];
      [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _updateSubviewOrdering];
      [v4 setAlpha:0.0];
    }
    [v24 progress];
    if (v3 == 2) {
      double v11 = 1.0;
    }
    else {
      double v11 = v10;
    }
    [v4 progress];
    if (v11 < v12) {
      [v4 resetProgress];
    }
    [v4 setProgress:v11];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setProgressViewVisible:v3 != 2 animated:1];
    goto LABEL_19;
  }
  [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setProgressViewVisible:0];
  if (v4)
  {
    [v4 removeFromSuperview];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setProgressView:0];
LABEL_19:
  }
  v13 = [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _errorButton];
  v14 = v13;
  if (v3 != 3 || v7 == 4)
  {
    if (v13)
    {
      [v13 removeFromSuperview];
      [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setErrorButton:0];
    }
  }
  else if (!v13)
  {
    v15 = [(id)objc_opt_class() _loadErrorIcon];
    v14 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    [v14 setImage:v15 forState:0];
    [v8 bounds];
    objc_msgSend(v14, "setFrame:");
    [v14 setAutoresizingMask:18];
    [v14 addTarget:self action:sel__handleErrorButtonTap_ forControlEvents:64];
    [v8 addSubview:v14];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setErrorButton:v14];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _updateSubviewOrdering];
  }
  v16 = [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _debugProgressLabel];
  v17 = +[PUOneUpSettings sharedInstance];
  int v18 = [v17 useDebuggingProgressLabel];

  if (v18)
  {
    if (!v16)
    {
      id v19 = objc_alloc(MEMORY[0x1E4FB1930]);
      [v8 bounds];
      v16 = objc_msgSend(v19, "initWithFrame:");
      [v16 setAutoresizingMask:18];
      v20 = [MEMORY[0x1E4FB08E0] systemFontOfSize:10.0];
      [v16 setFont:v20];

      [v16 setTextAlignment:1];
      v21 = [MEMORY[0x1E4FB1618] orangeColor];
      [v16 setTextColor:v21];

      v22 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.100000001];
      [v16 setBackgroundColor:v22];

      [v8 addSubview:v16];
      [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setDebugProgressLabel:v16];
      [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _updateSubviewOrdering];
    }
    v23 = [v24 description];
    [v16 setText:v23];

    goto LABEL_32;
  }
  if (v16)
  {
    [v16 removeFromSuperview];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setDebugProgressLabel:0];
LABEL_32:
  }
}

- (void)_invalidateStatusViews
{
  [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setNeedsUpdateStatusViews:1];
  [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setNeedsUpdate];
}

- (void)_updateStatusIfNeeded
{
  if ([(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _needsUpdateStatus])
  {
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setNeedsUpdateStatus:0];
    uint64_t v3 = [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self assetSharedViewModel];
    id v4 = [v3 loadingStatus];

    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setStatus:v4];
  }
}

- (void)_invalidateStatus
{
  [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setNeedsUpdateStatus:1];
  [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setNeedsUpdate];
}

- (void)_updateProgressViewStyleIfNeeded
{
  if ([(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _needsUpdateProgressViewStyle])
  {
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setNeedsUpdateProgressViewStyle:0];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setProgressViewStyle:0];
  }
}

- (void)_invalidateProgressViewStyle
{
  [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setNeedsUpdateProgressViewStyle:1];
  [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _setNeedsUpdate];
}

- (BOOL)_needsUpdate
{
  if ([(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _needsUpdateProgressViewStyle]|| [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _needsUpdateStatus])
  {
    return 1;
  }
  return [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _needsUpdateStatusViews];
}

- (void)_updateIfNeeded
{
  if ([(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _needsUpdate])
  {
    if ([(PUTileViewController *)self isViewLoaded])
    {
      [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _updateProgressViewStyleIfNeeded];
      [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _updateStatusIfNeeded];
      [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _updateStatusViewsIfNeeded];
      if ([(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _needsUpdate])
      {
        id v4 = [MEMORY[0x1E4F28B00] currentHandler];
        [v4 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenProgressIndicatorTileViewController.m" lineNumber:181 description:@"updates still needed after an update cycle"];
      }
    }
  }
}

- (void)_handleErrorButtonTap:(id)a3
{
  uint64_t v3 = [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self assetSharedViewModel];
  id v5 = [v3 asset];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"PUShouldReloadAssetMediaNotification" object:v5];
}

- (void)_setProgressViewVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->__isProgressViewVisible != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->__isProgressViewVisible = a3;
    id v6 = [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _progressView];
    uint64_t v7 = v6;
    if (v5)
    {
      [v6 startProgressTimer];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __99__PUAssetExplorerReviewScreenProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke;
      aBlock[3] = &unk_1E5F2ED10;
      id v8 = &v18;
      id v18 = v7;
      id v9 = (void (**)(void))_Block_copy(aBlock);
      double v10 = v9;
      if (v4) {
        [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v9 options:0 animations:0.15 completion:0.0];
      }
      else {
        v9[2](v9);
      }
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __99__PUAssetExplorerReviewScreenProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_2;
      v15[3] = &unk_1E5F2ED10;
      id v8 = &v16;
      id v11 = v6;
      id v16 = v11;
      double v10 = (void (**)(void))_Block_copy(v15);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __99__PUAssetExplorerReviewScreenProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_3;
      v13[3] = &unk_1E5F2CEE8;
      id v14 = v11;
      double v12 = (void (**)(void *, uint64_t))_Block_copy(v13);
      if (v4)
      {
        [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v10 options:v12 animations:0.15 completion:0.0];
      }
      else
      {
        v10[2](v10);
        v12[2](v12, 1);
      }
    }
  }
}

uint64_t __99__PUAssetExplorerReviewScreenProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __99__PUAssetExplorerReviewScreenProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __99__PUAssetExplorerReviewScreenProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) alpha];
  if (v3 == 0.0)
  {
    BOOL v4 = *(void **)(a1 + 32);
    return [v4 resetProgress];
  }
  return result;
}

- (void)_setProgressViewVisible:(BOOL)a3
{
}

- (void)_setStatus:(id)a3
{
  BOOL v5 = (PXOperationStatus *)a3;
  id v6 = v5;
  if (self->__status != v5)
  {
    id v8 = v5;
    char v7 = -[PXOperationStatus isEqual:](v5, "isEqual:");
    id v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__status, a3);
      [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _invalidateStatusViews];
      id v6 = v8;
    }
  }
}

- (void)_setProgressViewStyle:(int64_t)a3
{
  if (self->__progressViewStyle != a3)
  {
    self->__progressViewStyle = a3;
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _invalidateStatusViews];
  }
}

- (void)applyLayoutInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUAssetExplorerReviewScreenProgressIndicatorTileViewController;
  [(PUTileViewController *)&v4 applyLayoutInfo:a3];
  [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _updateIfNeeded];
}

- (void)setVideoPlayer:(id)a3
{
  BOOL v5 = (PUBrowsingVideoPlayer *)a3;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    char v7 = v5;
    [(PUBrowsingVideoPlayer *)videoPlayer unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    [(PUBrowsingVideoPlayer *)self->_videoPlayer registerChangeObserver:self];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _invalidateStatusViews];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _updateIfNeeded];
    BOOL v5 = v7;
  }
}

- (void)setAssetSharedViewModel:(id)a3
{
  BOOL v5 = (PUAssetSharedViewModel *)a3;
  assetSharedViewModel = self->_assetSharedViewModel;
  if (assetSharedViewModel != v5)
  {
    char v7 = v5;
    [(PUAssetSharedViewModel *)assetSharedViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetSharedViewModel, a3);
    [(PUAssetSharedViewModel *)self->_assetSharedViewModel registerChangeObserver:self];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _invalidateProgressViewStyle];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _invalidateStatus];
    [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _updateIfNeeded];
    BOOL v5 = v7;
  }
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUAssetExplorerReviewScreenProgressIndicatorTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self setAssetSharedViewModel:0];
  [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self setVideoPlayer:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUAssetExplorerReviewScreenProgressIndicatorTileViewController;
  [(PUTileViewController *)&v3 viewDidLoad];
  [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _invalidateStatusViews];
  [(PUAssetExplorerReviewScreenProgressIndicatorTileViewController *)self _updateIfNeeded];
}

+ (id)_loadErrorIcon
{
  v2 = +[PUInterfaceManager currentTheme];
  objc_super v3 = [v2 compactLoadErrorIcon];

  return v3;
}

+ (CGSize)progressIndicatorTileSize
{
  double v2 = 25.0;
  double v3 = 25.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end