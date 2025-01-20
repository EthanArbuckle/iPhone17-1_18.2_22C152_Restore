@interface PURenderIndicatorTileViewController
+ (BOOL)wantsRenderViewForTypeOfProcessingNeeded:(unsigned __int16)a3;
+ (CGSize)progressIndicatorTileSizeForSizeClass:(int64_t)a3;
+ (CGSize)renderIndicatorTileSizeForSizeClass:(int64_t)a3;
+ (id)_loadErrorIconForSizeClass:(int64_t)a3;
- (BOOL)_needsUpdate;
- (BOOL)isProgressViewVisible;
- (BOOL)needsUpdateSizeClass;
- (BOOL)needsUpdateStatus;
- (BOOL)needsUpdateStatusViews;
- (BOOL)willShowProgressAfterDelay;
- (CGRect)_expandedBackgroundViewFrame;
- (CGSize)progressIndicatorSize;
- (NSUndoManager)undoManager;
- (PLRoundProgressView)progressView;
- (PUAssetSharedViewModel)assetSharedViewModel;
- (PXOperationStatus)editActionStatus;
- (PXOperationStatus)status;
- (UIButton)errorButton;
- (UILabel)renderingLabel;
- (UIView)roundedBackgroundView;
- (double)renderLabelTextWidth;
- (int64_t)sizeClass;
- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4;
- (void)_invalidateSizeClass;
- (void)_invalidateStatus;
- (void)_invalidateStatusViews;
- (void)_updateIfNeeded;
- (void)_updateSizeClassIfNeeded;
- (void)_updateStatusIfNeeded;
- (void)_updateStatusViewsIfNeeded;
- (void)_updateSubviewOrdering;
- (void)_updateViewFramesForCollapseState:(BOOL)a3;
- (void)applyLayoutInfo:(id)a3;
- (void)becomeReusable;
- (void)loadingStatusManager:(id)a3 didUpdateLoadingStatus:(id)a4 forItemIdentifier:(id)a5;
- (void)setAssetSharedViewModel:(id)a3;
- (void)setEditActionStatus:(id)a3;
- (void)setErrorButton:(id)a3;
- (void)setIsProgressViewVisible:(BOOL)a3;
- (void)setNeedsUpdateSizeClass:(BOOL)a3;
- (void)setNeedsUpdateStatus:(BOOL)a3;
- (void)setNeedsUpdateStatusViews:(BOOL)a3;
- (void)setProgressIndicatorSize:(CGSize)a3;
- (void)setProgressView:(id)a3;
- (void)setProgressViewVisible:(BOOL)a3;
- (void)setProgressViewVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setProgressViewVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setRenderLabelTextWidth:(double)a3;
- (void)setRenderingLabel:(id)a3;
- (void)setRoundedBackgroundView:(id)a3;
- (void)setSizeClass:(int64_t)a3;
- (void)setStatus:(id)a3;
- (void)setUndoManager:(id)a3;
- (void)setWillShowProgressAfterDelay:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PURenderIndicatorTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_renderingLabel, 0);
  objc_storeStrong((id *)&self->_roundedBackgroundView, 0);
  objc_storeStrong((id *)&self->_editActionStatus, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_assetSharedViewModel, 0);
}

- (void)setWillShowProgressAfterDelay:(BOOL)a3
{
  self->_willShowProgressAfterDelay = a3;
}

- (BOOL)willShowProgressAfterDelay
{
  return self->_willShowProgressAfterDelay;
}

- (void)setRenderLabelTextWidth:(double)a3
{
  self->_renderLabelTextWidth = a3;
}

- (double)renderLabelTextWidth
{
  return self->_renderLabelTextWidth;
}

- (void)setErrorButton:(id)a3
{
}

- (UIButton)errorButton
{
  return self->_errorButton;
}

- (void)setIsProgressViewVisible:(BOOL)a3
{
  self->_isProgressViewVisible = a3;
}

- (BOOL)isProgressViewVisible
{
  return self->_isProgressViewVisible;
}

- (void)setProgressView:(id)a3
{
}

- (PLRoundProgressView)progressView
{
  return self->_progressView;
}

- (void)setRenderingLabel:(id)a3
{
}

- (UILabel)renderingLabel
{
  return self->_renderingLabel;
}

- (void)setRoundedBackgroundView:(id)a3
{
}

- (UIView)roundedBackgroundView
{
  return self->_roundedBackgroundView;
}

- (void)setProgressIndicatorSize:(CGSize)a3
{
  self->_progressIndicatorSize = a3;
}

- (CGSize)progressIndicatorSize
{
  double width = self->_progressIndicatorSize.width;
  double height = self->_progressIndicatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)sizeClass
{
  return self->_sizeClass;
}

- (void)setEditActionStatus:(id)a3
{
}

- (PXOperationStatus)editActionStatus
{
  return self->_editActionStatus;
}

- (PXOperationStatus)status
{
  return self->_status;
}

- (void)setNeedsUpdateStatusViews:(BOOL)a3
{
  self->_needsUpdateStatusViews = a3;
}

- (BOOL)needsUpdateStatusViews
{
  return self->_needsUpdateStatusViews;
}

- (void)setNeedsUpdateSizeClass:(BOOL)a3
{
  self->_needsUpdateSizeClass = a3;
}

- (BOOL)needsUpdateSizeClass
{
  return self->_needsUpdateSizeClass;
}

- (void)setNeedsUpdateStatus:(BOOL)a3
{
  self->_needsUpdateStatus = a3;
}

- (BOOL)needsUpdateStatus
{
  return self->_needsUpdateStatus;
}

- (void)setUndoManager:(id)a3
{
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (PUAssetSharedViewModel)assetSharedViewModel
{
  return self->_assetSharedViewModel;
}

- (void)loadingStatusManager:(id)a3 didUpdateLoadingStatus:(id)a4 forItemIdentifier:(id)a5
{
  id v13 = a4;
  assetSharedViewModel = self->_assetSharedViewModel;
  id v9 = a5;
  v10 = [(PUAssetSharedViewModel *)assetSharedViewModel asset];
  v11 = [v10 uuid];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    objc_storeStrong((id *)&self->_editActionStatus, a4);
    [(PURenderIndicatorTileViewController *)self _invalidateStatusViews];
    [(PURenderIndicatorTileViewController *)self _updateIfNeeded];
  }
}

- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4
{
  id v5 = a4;
  if (([v5 deferredProcessingNeededChanged] & 1) != 0
    || [v5 needsDeferredProcessingChanged])
  {
    [(PURenderIndicatorTileViewController *)self _invalidateStatusViews];
    [(PURenderIndicatorTileViewController *)self _invalidateStatus];
  }
  if ([v5 loadingStatusChanged]) {
    [(PURenderIndicatorTileViewController *)self _invalidateStatus];
  }
  [(PURenderIndicatorTileViewController *)self _updateIfNeeded];
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(PURenderIndicatorTileViewController *)self assetSharedViewModel];

  if (v7 == v8) {
    [(PURenderIndicatorTileViewController *)self _handleAssetSharedViewModel:v8 didChange:v6];
  }
}

- (void)_updateSubviewOrdering
{
  id v5 = [(PUTileViewController *)self view];
  v3 = [(PURenderIndicatorTileViewController *)self errorButton];
  [v5 bringSubviewToFront:v3];

  v4 = [(PURenderIndicatorTileViewController *)self progressView];
  [v5 bringSubviewToFront:v4];
}

- (void)_updateStatusViewsIfNeeded
{
  v66[2] = *MEMORY[0x1E4F143B8];
  if (![(PURenderIndicatorTileViewController *)self needsUpdateStatusViews]) {
    return;
  }
  [(PURenderIndicatorTileViewController *)self setNeedsUpdateStatusViews:0];
  if (![(PUTileViewController *)self isViewLoaded]) {
    return;
  }
  v3 = [(PURenderIndicatorTileViewController *)self progressView];
  v4 = [(PURenderIndicatorTileViewController *)self roundedBackgroundView];
  id v5 = [(PURenderIndicatorTileViewController *)self status];
  id v6 = [(PURenderIndicatorTileViewController *)self assetSharedViewModel];
  uint64_t v7 = [v6 deferredProcessingNeeded];

  id v8 = [(PURenderIndicatorTileViewController *)self assetSharedViewModel];
  if (!v8)
  {
    [v5 progress];
    goto LABEL_7;
  }
  BOOL v9 = +[PURenderIndicatorTileViewController wantsRenderViewForTypeOfProcessingNeeded:v7];

  [v5 progress];
  if (!v9)
  {
LABEL_7:
    id v13 = [(PURenderIndicatorTileViewController *)self editActionStatus];
    BOOL v12 = [v13 state] == 1;
    [v13 progress];
    double v11 = v14;

    goto LABEL_8;
  }
  double v11 = v10;
  BOOL v12 = 1;
LABEL_8:
  v15 = +[PUOneUpSettings sharedInstance];
  if ([v15 alwaysShowRenderIndicator])
  {
    [v15 simulatedRenderProgress];
    double v11 = v16;
  }
  v17 = [(PUTileViewController *)self view];
  if (v12)
  {
    if (v4)
    {
      v18 = v3;
    }
    else
    {
      v58 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      id v19 = objc_alloc(MEMORY[0x1E4FB1930]);
      double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v53 = *MEMORY[0x1E4F1DB28];
      v60 = objc_msgSend(v19, "initWithFrame:");
      v23 = [(PURenderIndicatorTileViewController *)self assetSharedViewModel];
      v24 = [v23 asset];
      uint64_t v25 = [v24 mediaType];

      if (v25 == 2) {
        v26 = @"RENDERING_PROGRESS_LABEL_VIDEO";
      }
      else {
        v26 = @"RENDERING_PROGRESS_LABEL_PHOTO";
      }
      v56 = PULocalizedString(v26);
      v57 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0 weight:*MEMORY[0x1E4FB09E0]];
      uint64_t v27 = *MEMORY[0x1E4FB0700];
      v65[0] = *MEMORY[0x1E4FB06F8];
      v65[1] = v27;
      v66[0] = v57;
      v66[1] = v58;
      v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
      v28 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v56 attributes:v55];
      [v60 setAttributedText:v28];

      [v60 setAlpha:0.0];
      [v60 setAutoresizingMask:2];
      [(PURenderIndicatorTileViewController *)self setRenderingLabel:v60];
      [v60 intrinsicContentSize];
      [(PURenderIndicatorTileViewController *)self setRenderLabelTextWidth:ceil(v29)];
      [(PURenderIndicatorTileViewController *)self _expandedBackgroundViewFrame];
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1F00]), "initWithFrame:", v30, v32, v34, v36);
      v38 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
      [v59 setEffect:v38];

      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v31, v33, v35, v37);
      [v4 addSubview:v59];
      [v4 setClipsToBounds:1];
      [v4 bounds];
      [v59 _setCornerRadius:1 continuous:15 maskedCorners:CGRectGetHeight(v67) * 0.5];
      [v59 setAutoresizingMask:2];
      v54 = [v4 layer];
      id v39 = [MEMORY[0x1E4FB1618] clearColor];
      objc_msgSend(v54, "setBackgroundColor:", objc_msgSend(v39, "CGColor"));

      [v4 setAlpha:0.0];
      [v17 addSubview:v4];
      [(PURenderIndicatorTileViewController *)self setRoundedBackgroundView:v4];
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8A5E8]), "initWithFrame:style:", 0, v53, v20, v21, v22);

      [v18 setAutoresizingMask:20];
      [v18 setManualColor:v58];
      [v18 setSkipResetOnRelayout:1];
      [v18 setAllowFake25PercentProgress:0];
      [(PURenderIndicatorTileViewController *)self setProgressView:v18];
      [v4 addSubview:v18];
      [v4 addSubview:v60];
      [(PURenderIndicatorTileViewController *)self _updateViewFramesForCollapseState:1];
      v40 = [(PUTileViewController *)self view];
      [v40 frame];
      v41 = [(PURenderIndicatorTileViewController *)self roundedBackgroundView];
      [v41 frame];
      PXRectWithOriginAndSize();
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      double v49 = v48;
      v50 = [(PUTileViewController *)self view];
      objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);

      [(PURenderIndicatorTileViewController *)self _updateSubviewOrdering];
    }
    [v18 progress];
    if (v11 < v51) {
      [v18 resetProgress];
    }
    [v18 setProgress:v11];
    if (![(PURenderIndicatorTileViewController *)self isProgressViewVisible]
      && ![(PURenderIndicatorTileViewController *)self willShowProgressAfterDelay])
    {
      [(PURenderIndicatorTileViewController *)self setWillShowProgressAfterDelay:1];
      dispatch_time_t v52 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__PURenderIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke;
      block[3] = &unk_1E5F2ED10;
      block[4] = self;
      dispatch_after(v52, MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    [v3 setProgress:1.0];
    objc_initWeak(&location, self);
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __65__PURenderIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke_2;
    v61[3] = &unk_1E5F2D898;
    objc_copyWeak(&v62, &location);
    [(PURenderIndicatorTileViewController *)self setProgressViewVisible:0 animated:1 completion:v61];
    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);
    v18 = v3;
  }
  [v17 setUserInteractionEnabled:v12];
}

uint64_t __65__PURenderIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProgressViewVisible:1 animated:1];
}

void __65__PURenderIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained isProgressViewVisible] & 1) == 0)
  {
    v1 = [WeakRetained roundedBackgroundView];

    if (v1)
    {
      v2 = [WeakRetained roundedBackgroundView];
      [v2 removeFromSuperview];

      [WeakRetained setRoundedBackgroundView:0];
    }
    v3 = [WeakRetained progressView];

    if (v3)
    {
      v4 = [WeakRetained progressView];
      [v4 removeFromSuperview];

      [WeakRetained setProgressView:0];
    }
    id v5 = [WeakRetained renderingLabel];

    if (v5)
    {
      id v6 = [WeakRetained renderingLabel];
      [v6 removeFromSuperview];

      [WeakRetained setRenderingLabel:0];
    }
  }
}

- (void)_invalidateStatusViews
{
  [(PURenderIndicatorTileViewController *)self setNeedsUpdateStatusViews:1];
  [(PURenderIndicatorTileViewController *)self _setNeedsUpdate];
}

- (void)_updateSizeClassIfNeeded
{
  if ([(PURenderIndicatorTileViewController *)self needsUpdateSizeClass])
  {
    [(PURenderIndicatorTileViewController *)self setNeedsUpdateSizeClass:0];
    if ([(PUTileViewController *)self isViewLoaded])
    {
      v3 = [(PUTileViewController *)self view];
      [v3 bounds];
      double v5 = v4;
      double v7 = v6;

      if (v5 >= v7) {
        double v5 = v7;
      }
      [(id)objc_opt_class() renderIndicatorTileSizeForSizeClass:1];
      if (v8 >= v9) {
        double v8 = v9;
      }
      if (v5 <= v8) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 2;
      }
      [(PURenderIndicatorTileViewController *)self setSizeClass:v10];
    }
  }
}

- (void)_invalidateSizeClass
{
  [(PURenderIndicatorTileViewController *)self setNeedsUpdateSizeClass:1];
  [(PURenderIndicatorTileViewController *)self _setNeedsUpdate];
}

- (void)_updateStatusIfNeeded
{
  if ([(PURenderIndicatorTileViewController *)self needsUpdateStatus])
  {
    [(PURenderIndicatorTileViewController *)self setNeedsUpdateStatus:0];
    v3 = [(PURenderIndicatorTileViewController *)self assetSharedViewModel];
    id v4 = [v3 loadingStatus];

    [(PURenderIndicatorTileViewController *)self setStatus:v4];
  }
}

- (void)_invalidateStatus
{
  [(PURenderIndicatorTileViewController *)self setNeedsUpdateStatus:1];
  v3 = +[PUOneUpSettings sharedInstance];
  int v4 = [v3 alwaysShowRenderIndicator];

  if (v4) {
    [(PURenderIndicatorTileViewController *)self _invalidateStatusViews];
  }
  [(PURenderIndicatorTileViewController *)self _setNeedsUpdate];
}

- (BOOL)_needsUpdate
{
  if ([(PURenderIndicatorTileViewController *)self needsUpdateStatus]
    || [(PURenderIndicatorTileViewController *)self needsUpdateSizeClass])
  {
    return 1;
  }
  return [(PURenderIndicatorTileViewController *)self needsUpdateStatusViews];
}

- (void)_updateIfNeeded
{
  if ([(PURenderIndicatorTileViewController *)self _needsUpdate])
  {
    if ([(PUTileViewController *)self isViewLoaded])
    {
      [(PURenderIndicatorTileViewController *)self _updateStatusIfNeeded];
      [(PURenderIndicatorTileViewController *)self _updateSizeClassIfNeeded];
      [(PURenderIndicatorTileViewController *)self _updateStatusViewsIfNeeded];
      if ([(PURenderIndicatorTileViewController *)self _needsUpdate])
      {
        id v4 = [MEMORY[0x1E4F28B00] currentHandler];
        [v4 handleFailureInMethod:a2 object:self file:@"PURenderIndicatorTileViewController.m" lineNumber:299 description:@"updates still needed after an update cycle"];
      }
    }
  }
}

- (void)setProgressViewVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (!v6 || [(PURenderIndicatorTileViewController *)self willShowProgressAfterDelay])
  {
    [(PURenderIndicatorTileViewController *)self setWillShowProgressAfterDelay:0];
    if (self->_isProgressViewVisible != v6)
    {
      self->_isProgressViewVisible = v6;
      double v9 = [(PURenderIndicatorTileViewController *)self roundedBackgroundView];
      if (v6)
      {
        uint64_t v10 = [(PURenderIndicatorTileViewController *)self progressView];
        [v10 startProgressTimer];

        [(PURenderIndicatorTileViewController *)self _updateViewFramesForCollapseState:1];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke;
        aBlock[3] = &unk_1E5F2ED10;
        double v11 = &v30;
        id v30 = v9;
        BOOL v12 = (void (**)(void))_Block_copy(aBlock);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_2;
        v28[3] = &unk_1E5F2ED10;
        v28[4] = self;
        id v13 = (void (**)(void))_Block_copy(v28);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_3;
        v26[3] = &unk_1E5F2D990;
        id v27 = v8;
        double v14 = (void (**)(void *, uint64_t))_Block_copy(v26);
        if (v5)
        {
          [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v12 options:0 animations:0.2 completion:0.0];
          [MEMORY[0x1E4FB1EB0] animateWithDuration:128 delay:v13 options:v14 animations:0.8 completion:0.0];
        }
        else
        {
          v12[2](v12);
          v13[2](v13);
          v14[2](v14, 1);
        }
      }
      else
      {
        [(PURenderIndicatorTileViewController *)self _updateViewFramesForCollapseState:0];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_4;
        v24[3] = &unk_1E5F2ECC8;
        double v11 = (id *)v25;
        id v15 = v9;
        v25[0] = v15;
        v25[1] = self;
        BOOL v12 = (void (**)(void))_Block_copy(v24);
        uint64_t v17 = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        id v19 = __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_5;
        double v20 = &unk_1E5F2AFC8;
        id v21 = v15;
        double v22 = self;
        id v23 = v8;
        double v16 = (void (**)(void *, uint64_t))_Block_copy(&v17);
        if (v5)
        {
          objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:delay:options:animations:completion:", 4, v12, v16, 0.8, 0.3, v17, v18, v19, v20, v21, v22);
        }
        else
        {
          v12[2](v12);
          v16[2](v16, 1);
        }
      }
    }
  }
}

uint64_t __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateViewFramesForCollapseState:0];
  id v2 = [*(id *)(a1 + 32) renderingLabel];
  [v2 setAlpha:1.0];
}

uint64_t __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 40);
  return [v2 _updateViewFramesForCollapseState:1];
}

uint64_t __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) alpha];
  if (v2 == 0.0)
  {
    v3 = [*(id *)(a1 + 40) progressView];
    [v3 resetProgress];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)setProgressViewVisible:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setProgressViewVisible:(BOOL)a3
{
}

- (void)_updateViewFramesForCollapseState:(BOOL)a3
{
  BOOL v3 = a3;
  [(PURenderIndicatorTileViewController *)self progressIndicatorSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(PURenderIndicatorTileViewController *)self renderingLabel];
  [v9 intrinsicContentSize];
  double v11 = v10;
  double v13 = v12;

  double v14 = [(PUTileViewController *)self view];
  id v15 = [v14 traitCollection];
  uint64_t v16 = [v15 layoutDirection];

  double v17 = *MEMORY[0x1E4F1DB28];
  double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v28 = v6;
  double v18 = v6 + 3.0 + 5.0;
  if (v3)
  {
    if (v16 == 1)
    {
      [(PURenderIndicatorTileViewController *)self renderLabelTextWidth];
      double v17 = v19 + 6.0;
      double v20 = v11 + 5.0 + 6.0 - (v19 + 6.0);
      double v21 = 6.0 - (v19 + 6.0);
      goto LABEL_7;
    }
  }
  else
  {
    [(PURenderIndicatorTileViewController *)self renderLabelTextWidth];
    double v21 = 6.0;
    double v18 = v18 + v22 + 6.0;
    if (v16 == 1)
    {
      double v20 = v11 + 5.0 + 6.0;
      goto LABEL_7;
    }
  }
  [(PURenderIndicatorTileViewController *)self progressIndicatorSize];
  double v20 = 3.0;
  double v21 = v23 + 3.0 + 5.0;
LABEL_7:
  v24 = [(PURenderIndicatorTileViewController *)self roundedBackgroundView];
  objc_msgSend(v24, "setFrame:", v17, v27, v18, v8 + 4.0);

  uint64_t v25 = [(PURenderIndicatorTileViewController *)self progressView];
  objc_msgSend(v25, "setFrame:", v20, 2.0, v28, v8);

  v26 = [(PURenderIndicatorTileViewController *)self errorButton];
  objc_msgSend(v26, "setFrame:", v20, 2.0, v28, v8);

  id v29 = [(PURenderIndicatorTileViewController *)self renderingLabel];
  objc_msgSend(v29, "setFrame:", v21, (v8 + 4.0 - v13) * 0.5, v11, v13);
}

- (CGRect)_expandedBackgroundViewFrame
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [(PURenderIndicatorTileViewController *)self progressIndicatorSize];
  double v6 = v5 + 4.0;
  double v8 = v7 + 3.0 + 5.0;
  [(PURenderIndicatorTileViewController *)self renderLabelTextWidth];
  double v10 = v9 + v8 + 6.0;
  double v11 = v3;
  double v12 = v4;
  double v13 = v6;
  result.size.double height = v13;
  result.size.double width = v10;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setSizeClass:(int64_t)a3
{
  if (self->_sizeClass != a3)
  {
    self->_sizeClass = a3;
    p_progressIndicatorSize = &self->_progressIndicatorSize;
    [(id)objc_opt_class() progressIndicatorTileSizeForSizeClass:a3];
    p_progressIndicatorSize->double width = v5;
    p_progressIndicatorSize->double height = v6;
    [(PURenderIndicatorTileViewController *)self _invalidateStatusViews];
  }
}

- (void)setStatus:(id)a3
{
  CGFloat v5 = (PXOperationStatus *)a3;
  CGFloat v6 = v5;
  if (self->_status != v5)
  {
    double v8 = v5;
    char v7 = -[PXOperationStatus isEqual:](v5, "isEqual:");
    CGFloat v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_status, a3);
      [(PURenderIndicatorTileViewController *)self _invalidateStatusViews];
      CGFloat v6 = v8;
    }
  }
}

- (void)applyLayoutInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PURenderIndicatorTileViewController;
  [(PUTileViewController *)&v4 applyLayoutInfo:a3];
  [(PURenderIndicatorTileViewController *)self _invalidateSizeClass];
  [(PURenderIndicatorTileViewController *)self _updateIfNeeded];
}

- (void)setAssetSharedViewModel:(id)a3
{
  CGFloat v5 = (PUAssetSharedViewModel *)a3;
  p_assetSharedViewModel = &self->_assetSharedViewModel;
  if (self->_assetSharedViewModel != v5)
  {
    double v8 = v5;
    char v7 = [MEMORY[0x1E4F91280] defaultManager];
    if (v8) {
      [v7 registerObserver:self];
    }
    else {
      [v7 unregisterObserver:self];
    }
    [(PUAssetSharedViewModel *)*p_assetSharedViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetSharedViewModel, a3);
    [(PUAssetSharedViewModel *)*p_assetSharedViewModel registerChangeObserver:self];
    [(PURenderIndicatorTileViewController *)self _invalidateStatus];
    [(PURenderIndicatorTileViewController *)self _updateIfNeeded];

    CGFloat v5 = v8;
  }
}

- (void)becomeReusable
{
  v4.receiver = self;
  v4.super_class = (Class)PURenderIndicatorTileViewController;
  [(PUTileViewController *)&v4 becomeReusable];
  [(PURenderIndicatorTileViewController *)self setAssetSharedViewModel:0];
  [(PURenderIndicatorTileViewController *)self setUndoManager:0];
  double v3 = [(PURenderIndicatorTileViewController *)self roundedBackgroundView];
  [v3 removeFromSuperview];

  [(PURenderIndicatorTileViewController *)self setRoundedBackgroundView:0];
  [(PURenderIndicatorTileViewController *)self setProgressView:0];
  [(PURenderIndicatorTileViewController *)self setRenderingLabel:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PURenderIndicatorTileViewController;
  [(PUTileViewController *)&v3 viewDidLoad];
  [(PURenderIndicatorTileViewController *)self _invalidateSizeClass];
  [(PURenderIndicatorTileViewController *)self _invalidateStatusViews];
  [(PURenderIndicatorTileViewController *)self _updateIfNeeded];
}

+ (BOOL)wantsRenderViewForTypeOfProcessingNeeded:(unsigned __int16)a3
{
  int v4 = a3;
  if (a3 == 7 || a3 == 2)
  {
    objc_super v3 = +[PUPhotoEditProtoSettings sharedInstance];
    char v5 = [v3 enableLiveVideoRender] ^ 1;
  }
  else
  {
    char v5 = 0;
  }
  if (v4 == 7 || v4 == 2) {

  }
  if (v5) {
    return 1;
  }
  char v7 = +[PUOneUpSettings sharedInstance];
  char v8 = [v7 alwaysShowRenderIndicator];

  return v8;
}

+ (id)_loadErrorIconForSizeClass:(int64_t)a3
{
  CGFloat v6 = +[PUInterfaceManager currentTheme];
  char v7 = v6;
  switch(a3)
  {
    case 2:
      uint64_t v10 = [v6 regularLoadErrorIcon];
LABEL_8:
      double v9 = (void *)v10;
      goto LABEL_9;
    case 1:
      uint64_t v10 = [v6 compactLoadErrorIcon];
      goto LABEL_8;
    case 0:
      char v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:a1 file:@"PURenderIndicatorTileViewController.m" lineNumber:124 description:@"unspecified size class"];

      break;
  }
  double v9 = 0;
LABEL_9:

  return v9;
}

+ (CGSize)renderIndicatorTileSizeForSizeClass:(int64_t)a3
{
  [a1 progressIndicatorTileSizeForSizeClass:a3];
  double v4 = v3 + 4.0;
  double v5 = 154.0;
  result.double height = v4;
  result.double width = v5;
  return result;
}

+ (CGSize)progressIndicatorTileSizeForSizeClass:(int64_t)a3
{
  double v3 = 20.0;
  double v4 = 20.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

@end