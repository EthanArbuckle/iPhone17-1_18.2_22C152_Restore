@interface PUProgressIndicatorTileViewController
+ (CGSize)progressIndicatorIconSizeForSizeClass:(int64_t)a3;
+ (CGSize)progressIndicatorTileSizeForSizeClass:(int64_t)a3;
+ (UIEdgeInsets)progressIndicatorIconInsetsForSizeClass:(int64_t)a3;
+ (id)_loadErrorIconForSizeClass:(int64_t)a3;
- (BOOL)_didStartProgressLogging;
- (BOOL)_isProgressViewVisible;
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateProgressViewStyle;
- (BOOL)_needsUpdateSizeClass;
- (BOOL)_needsUpdateStatus;
- (BOOL)_needsUpdateStatusViews;
- (BOOL)isProgressViewAnimatingOut;
- (OS_os_log)_progressLog;
- (PLRoundProgressView)_progressView;
- (PUAssetSharedViewModel)assetSharedViewModel;
- (PUAssetViewModel)assetViewModel;
- (PUBrowsingViewModel)browsingViewModel;
- (PXOperationStatus)_status;
- (UIButton)_errorButton;
- (UILabel)_debugProgressLabel;
- (id)errorPresenter;
- (id)loadView;
- (id)view;
- (int64_t)_progressViewStyle;
- (int64_t)_sizeClass;
- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4;
- (void)_handleAssetViewModel:(id)a3 didChange:(id)a4;
- (void)_handleBrowsingViewModel:(id)a3 didChange:(id)a4;
- (void)_handleErrorButtonTap:(id)a3;
- (void)_invalidateProgressViewStyle;
- (void)_invalidateSizeClass;
- (void)_invalidateStatus;
- (void)_invalidateStatusViews;
- (void)_setDebugProgressLabel:(id)a3;
- (void)_setDidStartProgressLogging:(BOOL)a3;
- (void)_setErrorButton:(id)a3;
- (void)_setNeedsUpdateProgressViewStyle:(BOOL)a3;
- (void)_setNeedsUpdateSizeClass:(BOOL)a3;
- (void)_setNeedsUpdateStatus:(BOOL)a3;
- (void)_setNeedsUpdateStatusViews:(BOOL)a3;
- (void)_setProgressView:(id)a3;
- (void)_setProgressViewStyle:(int64_t)a3;
- (void)_setProgressViewVisible:(BOOL)a3;
- (void)_setProgressViewVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_setSizeClass:(int64_t)a3;
- (void)_setStatus:(id)a3;
- (void)_updateIfNeeded;
- (void)_updateProgressViewStyleIfNeeded;
- (void)_updateSizeClassIfNeeded;
- (void)_updateStatusIfNeeded;
- (void)_updateStatusViewsIfNeeded;
- (void)_updateSubviewOrdering;
- (void)applyLayoutInfo:(id)a3;
- (void)becomeReusable;
- (void)postReloadNotification;
- (void)setAssetSharedViewModel:(id)a3;
- (void)setAssetViewModel:(id)a3;
- (void)setBrowsingViewModel:(id)a3;
- (void)setErrorPresenter:(id)a3;
- (void)setIsProgressViewAnimatingOut:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
- (void)viewTraitCollectionDidChange:(id)a3;
@end

@implementation PUProgressIndicatorTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__debugProgressLabel, 0);
  objc_storeStrong((id *)&self->__errorButton, 0);
  objc_storeStrong((id *)&self->__progressView, 0);
  objc_storeStrong((id *)&self->__status, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong(&self->_errorPresenter, 0);
  objc_storeStrong((id *)&self->_assetSharedViewModel, 0);
}

- (void)setIsProgressViewAnimatingOut:(BOOL)a3
{
  self->_isProgressViewAnimatingOut = a3;
}

- (BOOL)isProgressViewAnimatingOut
{
  return self->_isProgressViewAnimatingOut;
}

- (void)_setDidStartProgressLogging:(BOOL)a3
{
  self->__didStartProgressLogging = a3;
}

- (BOOL)_didStartProgressLogging
{
  return self->__didStartProgressLogging;
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

- (int64_t)_sizeClass
{
  return self->__sizeClass;
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

- (void)_setNeedsUpdateSizeClass:(BOOL)a3
{
  self->__needsUpdateSizeClass = a3;
}

- (BOOL)_needsUpdateSizeClass
{
  return self->__needsUpdateSizeClass;
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

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (void)setErrorPresenter:(id)a3
{
}

- (id)errorPresenter
{
  return self->_errorPresenter;
}

- (PUAssetSharedViewModel)assetSharedViewModel
{
  return self->_assetSharedViewModel;
}

- (OS_os_log)_progressLog
{
  if (_progressLog_onceToken != -1) {
    dispatch_once(&_progressLog_onceToken, &__block_literal_global_73834);
  }
  v2 = (void *)_progressLog_progressLog;
  return (OS_os_log *)v2;
}

void __53__PUProgressIndicatorTileViewController__progressLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "OneUpDownloadLatency");
  v1 = (void *)_progressLog_progressLog;
  _progressLog_progressLog = (uint64_t)v0;
}

- (void)_handleBrowsingViewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "chromeVisibilityDidChange", a3))
  {
    [(PUProgressIndicatorTileViewController *)self _invalidateStatusViews];
    [(PUProgressIndicatorTileViewController *)self _updateIfNeeded];
  }
}

- (void)_handleAssetViewModel:(id)a3 didChange:(id)a4
{
  id v11 = a4;
  v5 = +[PUOneUpSettings sharedInstance];
  int v6 = [v5 allowsVisualIntelligenceV2];

  char v7 = [v11 accessoryViewVisibilityChanged];
  if (v6)
  {
    if ((v7 & 1) == 0
      && ([v11 visualImageAnalysisChanged] & 1) == 0
      && ([v11 isPresentedForPreviewChanged] & 1) == 0)
    {
      goto LABEL_10;
    }
LABEL_9:
    [(PUProgressIndicatorTileViewController *)self _invalidateStatusViews];
    goto LABEL_10;
  }
  if ((v7 & 1) != 0
    || ([v11 isPresentedForPreviewChanged] & 1) != 0
    || [v11 videoPlayerDidChange])
  {
    goto LABEL_9;
  }
LABEL_10:
  if (([v11 videoPlayerDidChange] & 1) == 0)
  {
    v8 = [v11 videoPlayerChange];
    if ([v8 desiredPlayStateDidChange])
    {
    }
    else
    {
      v9 = [v11 videoPlayerChange];
      int v10 = [v9 playStateDidChange];

      if (!v10) {
        goto LABEL_15;
      }
    }
  }
  [(PUProgressIndicatorTileViewController *)self _invalidateStatusViews];
LABEL_15:
  [(PUProgressIndicatorTileViewController *)self _updateIfNeeded];
}

- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "loadingStatusChanged", a3))
  {
    [(PUProgressIndicatorTileViewController *)self _invalidateStatus];
    [(PUProgressIndicatorTileViewController *)self _updateIfNeeded];
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(PUProgressIndicatorTileViewController *)self assetSharedViewModel];

  if (v7 == v10)
  {
    [(PUProgressIndicatorTileViewController *)self _handleAssetSharedViewModel:v10 didChange:v6];
  }
  else
  {
    id v8 = [(PUProgressIndicatorTileViewController *)self assetViewModel];

    if (v8 == v10)
    {
      [(PUProgressIndicatorTileViewController *)self _handleAssetViewModel:v10 didChange:v6];
    }
    else
    {
      id v9 = [(PUProgressIndicatorTileViewController *)self browsingViewModel];

      if (v9 == v10) {
        [(PUProgressIndicatorTileViewController *)self _handleBrowsingViewModel:v10 didChange:v6];
      }
    }
  }
}

- (void)_updateSubviewOrdering
{
  id v5 = [(PUProgressIndicatorTileViewController *)self view];
  v3 = [(PUProgressIndicatorTileViewController *)self _debugProgressLabel];
  [v5 bringSubviewToFront:v3];

  v4 = [(PUProgressIndicatorTileViewController *)self _errorButton];
  [v5 bringSubviewToFront:v4];
}

- (void)viewTraitCollectionDidChange:(id)a3
{
  [(PUProgressIndicatorTileViewController *)self _invalidateStatusViews];
  [(PUProgressIndicatorTileViewController *)self _updateIfNeeded];
}

- (void)_updateStatusViewsIfNeeded
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if ([(PUProgressIndicatorTileViewController *)self _needsUpdateStatusViews])
  {
    [(PUProgressIndicatorTileViewController *)self _setNeedsUpdateStatusViews:0];
    if ([(PUTileViewController *)self isViewLoaded])
    {
      v3 = [(PUProgressIndicatorTileViewController *)self _status];
      uint64_t v4 = [v3 state];
      int64_t v57 = [(PUProgressIndicatorTileViewController *)self _sizeClass];
      id v5 = [(PUProgressIndicatorTileViewController *)self assetViewModel];
      id v6 = [v5 videoPlayer];

      id v7 = [(PUProgressIndicatorTileViewController *)self _progressView];
      int64_t v8 = [(PUProgressIndicatorTileViewController *)self _progressViewStyle];
      if (v7 && [v7 style] != v8)
      {
        [v7 removeFromSuperview];
        [(PUProgressIndicatorTileViewController *)self _setProgressView:0];

        id v7 = 0;
      }
      char v9 = [v6 isPlaybackDesired];
      id v10 = [(PUProgressIndicatorTileViewController *)self assetSharedViewModel];
      char v11 = [v10 needsDeferredProcessing];

      v12 = [(PUProgressIndicatorTileViewController *)self view];
      if (unint64_t)(v4 - 3) < 0xFFFFFFFFFFFFFFFELL || (v11 & 1) != 0 || (v9)
      {
        [(PUProgressIndicatorTileViewController *)self _setProgressViewVisible:0];
        if (!v7) {
          goto LABEL_22;
        }
        [v7 removeFromSuperview];
        [(PUProgressIndicatorTileViewController *)self _setProgressView:0];
      }
      else
      {
        if (!v7)
        {
          [(id)objc_opt_class() progressIndicatorTileSizeForSizeClass:v57];
          CGFloat v14 = v13;
          CGFloat v16 = v15;
          [(id)objc_opt_class() progressIndicatorIconSizeForSizeClass:v57];
          double v18 = v17;
          double v20 = v19;
          v63.origin.x = 0.0;
          v63.origin.y = 0.0;
          v63.size.width = v14;
          v63.size.height = v16;
          CGFloat v21 = (CGRectGetWidth(v63) - v18) * 0.5;
          v64.origin.x = 0.0;
          v64.origin.y = 0.0;
          v64.size.width = v14;
          v64.size.height = v16;
          CGFloat v22 = (CGRectGetHeight(v64) - v20) * 0.5;
          v65.origin.x = 0.0;
          v65.origin.y = 0.0;
          v65.size.width = v14;
          v65.size.height = v16;
          CGRect v66 = CGRectInset(v65, v21, v22);
          id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8A5E8]), "initWithFrame:style:", v8, v66.origin.x, v66.origin.y, v66.size.width, v66.size.height);
          [v7 setAlpha:0.0];
          [v12 addSubview:v7];
          [(PUProgressIndicatorTileViewController *)self _setProgressView:v7];
          [(PUProgressIndicatorTileViewController *)self _updateSubviewOrdering];
          v23 = [(PUProgressIndicatorTileViewController *)self assetSharedViewModel];
          v24 = [v23 asset];

          uint64_t v25 = [v24 playbackStyle];
          v26 = [(PUProgressIndicatorTileViewController *)self _progressLog];
          if (os_signpost_enabled(v26))
          {
            *(_DWORD *)buf = 134349056;
            uint64_t v61 = v25;
            _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "OneUpDownloadLatency", " enableTelemetry=YES playbackStyle=%{public}ld", buf, 0xCu);
          }

          [(PUProgressIndicatorTileViewController *)self _setDidStartProgressLogging:1];
        }
        BOOL v27 = v4 != 2;
        [v3 progress];
        BOOL v29 = v28 < 1.0;
        BOOL v30 = v27 && v29;
        if (v27 && v29) {
          double v31 = v28;
        }
        else {
          double v31 = 1.0;
        }
        [v7 progress];
        if (v31 < v32) {
          [v7 resetProgress];
        }
        [v7 setProgress:v31];
        [(PUProgressIndicatorTileViewController *)self _setProgressViewVisible:v30 animated:1];
      }

LABEL_22:
      v33 = [(PUProgressIndicatorTileViewController *)self _errorButton];
      if (v6)
      {
        v34 = [v3 error];
        v35 = [v34 domain];
        int v36 = [v35 isEqualToString:*MEMORY[0x1E4F39800]];

        if (v4 == 3 && (!v36 || [v34 code] != 3306 && objc_msgSend(v34, "code") != 3170))
        {

          if (v33) {
            goto LABEL_33;
          }
          goto LABEL_55;
        }
        if ([v6 playState] == 5 && objc_msgSend(v6, "desiredPlayState") == 4)
        {
          v37 = [(PUProgressIndicatorTileViewController *)self assetViewModel];
          char v38 = [v37 isPresentedForPreview];

          if (v38) {
            goto LABEL_35;
          }
LABEL_32:
          if (v33)
          {
LABEL_33:
            v39 = [(id)objc_opt_class() _loadErrorIconForSizeClass:v57];
            [v33 setImage:v39 forState:0];

            int v40 = 1;
            goto LABEL_37;
          }
LABEL_55:
          v33 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
          [v12 bounds];
          objc_msgSend(v33, "setFrame:");
          [v33 setAutoresizingMask:18];
          [v33 addTarget:self action:sel__handleErrorButtonTap_ forControlEvents:64];
          [v12 addSubview:v33];
          [(PUProgressIndicatorTileViewController *)self _setErrorButton:v33];
          [(PUProgressIndicatorTileViewController *)self _updateSubviewOrdering];
          goto LABEL_33;
        }
      }
      else if (v4 == 3)
      {
        goto LABEL_32;
      }
LABEL_35:
      if (!v33)
      {
        int v40 = 0;
LABEL_39:
        v41 = [(PUProgressIndicatorTileViewController *)self _debugProgressLabel];
        v42 = +[PUOneUpSettings sharedInstance];
        int v43 = [v42 useDebuggingProgressLabel];

        if (v43)
        {
          if (!v41)
          {
            [v12 bounds];
            v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v44 + -150.0, v46, v45 + 150.0, v47);
            [v41 setAutoresizingMask:18];
            v48 = [MEMORY[0x1E4FB08E0] systemFontOfSize:10.0];
            [v41 setFont:v48];

            [v41 setTextAlignment:1];
            v49 = [MEMORY[0x1E4FB1618] orangeColor];
            [v41 setTextColor:v49];

            v50 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.100000001];
            [v41 setBackgroundColor:v50];

            [v12 addSubview:v41];
            [(PUProgressIndicatorTileViewController *)self _setDebugProgressLabel:v41];
            [(PUProgressIndicatorTileViewController *)self _updateSubviewOrdering];
          }
          v51 = [v3 description];
          [v41 setText:v51];
        }
        else
        {
          if (!v41)
          {
LABEL_46:
            v52 = [(PUProgressIndicatorTileViewController *)self assetViewModel];
            if ([(PUProgressIndicatorTileViewController *)self _isProgressViewVisible]
              || (v40 | [(PUProgressIndicatorTileViewController *)self isProgressViewAnimatingOut] | v43) == 1)
            {
              v53 = v59;
              v59[0] = MEMORY[0x1E4F143A8];
              v59[1] = 3221225472;
              uint64_t v54 = 1;
              v55 = __67__PUProgressIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke;
            }
            else
            {
              if ([v52 statusCornerState] != 1)
              {
                uint64_t v54 = 0;
                goto LABEL_50;
              }
              uint64_t v54 = 0;
              v53 = v58;
              v58[0] = MEMORY[0x1E4F143A8];
              v58[1] = 3221225472;
              v55 = __67__PUProgressIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke_2;
            }
            v53[2] = v55;
            v53[3] = &unk_1E5F2ED10;
            id v56 = v52;
            v53[4] = v56;
            [v56 performChanges:v53];

LABEL_50:
            [v12 setShowingErrorProgressView:v54];

            return;
          }
          [v41 removeFromSuperview];
          [(PUProgressIndicatorTileViewController *)self _setDebugProgressLabel:0];
        }

        goto LABEL_46;
      }
      [v33 removeFromSuperview];
      [(PUProgressIndicatorTileViewController *)self _setErrorButton:0];
      int v40 = 0;
LABEL_37:

      goto LABEL_39;
    }
  }
}

uint64_t __67__PUProgressIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStatusCornerState:1];
}

uint64_t __67__PUProgressIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStatusCornerState:0];
}

- (void)_invalidateStatusViews
{
  [(PUProgressIndicatorTileViewController *)self _setNeedsUpdateStatusViews:1];
  [(PUProgressIndicatorTileViewController *)self _setNeedsUpdate];
}

- (void)_updateSizeClassIfNeeded
{
  if ([(PUProgressIndicatorTileViewController *)self _needsUpdateSizeClass])
  {
    [(PUProgressIndicatorTileViewController *)self _setNeedsUpdateSizeClass:0];
    if ([(PUTileViewController *)self isViewLoaded])
    {
      v3 = [(PUProgressIndicatorTileViewController *)self view];
      id v5 = [v3 traitCollection];

      if ([v5 horizontalSizeClass] == 2)
      {
        if ([v5 verticalSizeClass] == 2) {
          uint64_t v4 = 2;
        }
        else {
          uint64_t v4 = 1;
        }
      }
      else
      {
        uint64_t v4 = 1;
      }
      [(PUProgressIndicatorTileViewController *)self _setSizeClass:v4];
    }
  }
}

- (void)_invalidateSizeClass
{
  [(PUProgressIndicatorTileViewController *)self _setNeedsUpdateSizeClass:1];
  [(PUProgressIndicatorTileViewController *)self _setNeedsUpdate];
}

- (void)_updateStatusIfNeeded
{
  if ([(PUProgressIndicatorTileViewController *)self _needsUpdateStatus])
  {
    [(PUProgressIndicatorTileViewController *)self _setNeedsUpdateStatus:0];
    v3 = [(PUProgressIndicatorTileViewController *)self assetSharedViewModel];
    id v4 = [v3 loadingStatus];

    [(PUProgressIndicatorTileViewController *)self _setStatus:v4];
  }
}

- (void)_invalidateStatus
{
  [(PUProgressIndicatorTileViewController *)self _setNeedsUpdateStatus:1];
  [(PUProgressIndicatorTileViewController *)self _setNeedsUpdate];
}

- (void)_updateProgressViewStyleIfNeeded
{
  if ([(PUProgressIndicatorTileViewController *)self _needsUpdateProgressViewStyle])
  {
    [(PUProgressIndicatorTileViewController *)self _setNeedsUpdateProgressViewStyle:0];
    v3 = [(PUProgressIndicatorTileViewController *)self assetSharedViewModel];
    id v5 = [v3 asset];

    if ([v5 canPlayPhotoIris]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 0;
    }
    [(PUProgressIndicatorTileViewController *)self _setProgressViewStyle:v4];
  }
}

- (void)_invalidateProgressViewStyle
{
  [(PUProgressIndicatorTileViewController *)self _setNeedsUpdateProgressViewStyle:1];
  [(PUProgressIndicatorTileViewController *)self _setNeedsUpdate];
}

- (BOOL)_needsUpdate
{
  if ([(PUProgressIndicatorTileViewController *)self _needsUpdateProgressViewStyle]
    || [(PUProgressIndicatorTileViewController *)self _needsUpdateStatus]
    || [(PUProgressIndicatorTileViewController *)self _needsUpdateSizeClass])
  {
    return 1;
  }
  return [(PUProgressIndicatorTileViewController *)self _needsUpdateStatusViews];
}

- (void)_updateIfNeeded
{
  if ([(PUProgressIndicatorTileViewController *)self _needsUpdate])
  {
    if ([(PUTileViewController *)self isViewLoaded])
    {
      [(PUProgressIndicatorTileViewController *)self _updateProgressViewStyleIfNeeded];
      [(PUProgressIndicatorTileViewController *)self _updateStatusIfNeeded];
      [(PUProgressIndicatorTileViewController *)self _updateSizeClassIfNeeded];
      [(PUProgressIndicatorTileViewController *)self _updateStatusViewsIfNeeded];
      if ([(PUProgressIndicatorTileViewController *)self _needsUpdate])
      {
        id v4 = [MEMORY[0x1E4F28B00] currentHandler];
        [v4 handleFailureInMethod:a2 object:self file:@"PUProgressIndicatorTileViewController.m" lineNumber:353 description:@"updates still needed after an update cycle"];
      }
    }
  }
}

- (void)postReloadNotification
{
  v2 = [(PUProgressIndicatorTileViewController *)self assetSharedViewModel];
  id v4 = [v2 asset];

  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"PUShouldReloadAssetMediaNotification" object:v4];
}

- (void)_handleErrorButtonTap:(id)a3
{
  id v4 = [(PUProgressIndicatorTileViewController *)self errorPresenter];

  if (v4)
  {
    id v5 = [(PUProgressIndicatorTileViewController *)self _status];
    id v9 = [v5 error];

    if (!v9)
    {
      id v6 = [(PUProgressIndicatorTileViewController *)self assetViewModel];
      id v7 = [v6 videoPlayer];
      id v9 = [v7 error];
    }
    int64_t v8 = [(PUProgressIndicatorTileViewController *)self errorPresenter];
    ((void (**)(void, id))v8)[2](v8, v9);
  }
}

- (void)_setProgressViewVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->__isProgressViewVisible != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->__isProgressViewVisible = a3;
    id v7 = [(PUProgressIndicatorTileViewController *)self _progressView];
    int64_t v8 = v7;
    if (v5)
    {
      [v7 startProgressTimer];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__PUProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke;
      aBlock[3] = &unk_1E5F2ED10;
      id v9 = &v22;
      id v22 = v8;
      id v10 = (void (**)(void))_Block_copy(aBlock);
      char v11 = v10;
      if (v4) {
        [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v10 options:0 animations:0.2 completion:1.0];
      }
      else {
        v10[2](v10);
      }
    }
    else
    {
      if ([(PUProgressIndicatorTileViewController *)self _didStartProgressLogging])
      {
        v12 = [(PUProgressIndicatorTileViewController *)self _progressLog];
        if (os_signpost_enabled(v12))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "OneUpDownloadLatency", " enableTelemetry=YES ", buf, 2u);
        }

        [(PUProgressIndicatorTileViewController *)self _setDidStartProgressLogging:0];
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __74__PUProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_240;
      v18[3] = &unk_1E5F2ED10;
      id v9 = &v19;
      id v13 = v8;
      id v19 = v13;
      char v11 = (void (**)(void))_Block_copy(v18);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __74__PUProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_2;
      v15[3] = &unk_1E5F2E1C0;
      id v16 = v13;
      double v17 = self;
      CGFloat v14 = (void (**)(void *, uint64_t))_Block_copy(v15);
      if (v4)
      {
        [(PUProgressIndicatorTileViewController *)self setIsProgressViewAnimatingOut:1];
        [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v11 options:v14 animations:0.2 completion:0.3];
      }
      else
      {
        v11[2](v11);
        v14[2](v14, 1);
      }
    }
  }
}

uint64_t __74__PUProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __74__PUProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_240(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __74__PUProgressIndicatorTileViewController__setProgressViewVisible_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) alpha];
  if (v2 == 0.0) {
    [*(id *)(a1 + 32) resetProgress];
  }
  [*(id *)(a1 + 40) setIsProgressViewAnimatingOut:0];
  [*(id *)(a1 + 40) _invalidateStatusViews];
  v3 = *(void **)(a1 + 40);
  return [v3 _updateIfNeeded];
}

- (void)_setProgressViewVisible:(BOOL)a3
{
}

- (void)_setSizeClass:(int64_t)a3
{
  if (self->__sizeClass != a3)
  {
    self->__sizeClass = a3;
    [(PUProgressIndicatorTileViewController *)self _invalidateStatusViews];
  }
}

- (void)_setStatus:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (PXOperationStatus *)a3;
  id v6 = v5;
  p_status = &self->__status;
  if (self->__status == v5 || (-[PXOperationStatus isEqual:](v5, "isEqual:") & 1) != 0) {
    goto LABEL_17;
  }
  uint64_t v8 = [(PXOperationStatus *)*p_status state];
  if (v8 == [(PXOperationStatus *)v6 state])
  {
    if ([(PXOperationStatus *)v6 state] != 1) {
      goto LABEL_11;
    }
    id v9 = PLOneUpGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)CGFloat v14 = 138543362;
      *(void *)&v14[4] = v6;
      id v10 = v9;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
LABEL_9:
      _os_log_impl(&dword_1AE9F8000, v10, v11, "1up Progress Indicator: Updating status to %{public}@", v14, 0xCu);
    }
  }
  else
  {
    id v9 = PLOneUpGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGFloat v14 = 138543362;
      *(void *)&v14[4] = v6;
      id v10 = v9;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_9;
    }
  }

LABEL_11:
  objc_storeStrong((id *)&self->__status, a3);
  if ([(PXOperationStatus *)*p_status state] == 3)
  {
    v12 = [(PXOperationStatus *)*p_status error];

    if (!v12)
    {
      id v13 = PLOneUpGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CGFloat v14 = 0;
        _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_DEFAULT, "1up Progress Indicator: Status is failed, but has no error", v14, 2u);
      }
    }
  }
  [(PUProgressIndicatorTileViewController *)self _invalidateStatusViews];
LABEL_17:
}

- (void)_setProgressViewStyle:(int64_t)a3
{
  if (self->__progressViewStyle != a3)
  {
    self->__progressViewStyle = a3;
    [(PUProgressIndicatorTileViewController *)self _invalidateStatusViews];
  }
}

- (void)applyLayoutInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUProgressIndicatorTileViewController;
  [(PUTileViewController *)&v4 applyLayoutInfo:a3];
  [(PUProgressIndicatorTileViewController *)self _invalidateSizeClass];
  [(PUProgressIndicatorTileViewController *)self _updateIfNeeded];
}

- (void)setBrowsingViewModel:(id)a3
{
  BOOL v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    id v7 = v5;
    [(PUBrowsingViewModel *)browsingViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    [(PUBrowsingViewModel *)self->_browsingViewModel registerChangeObserver:self];
    [(PUProgressIndicatorTileViewController *)self _invalidateStatusViews];
    [(PUProgressIndicatorTileViewController *)self _updateIfNeeded];
    BOOL v5 = v7;
  }
}

- (void)setAssetViewModel:(id)a3
{
  BOOL v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  if (assetViewModel != v5)
  {
    id v7 = v5;
    [(PUAssetViewModel *)assetViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUAssetViewModel *)self->_assetViewModel registerChangeObserver:self];
    [(PUProgressIndicatorTileViewController *)self _invalidateStatusViews];
    [(PUProgressIndicatorTileViewController *)self _updateIfNeeded];
    BOOL v5 = v7;
  }
}

- (void)setAssetSharedViewModel:(id)a3
{
  BOOL v5 = (PUAssetSharedViewModel *)a3;
  assetSharedViewModel = self->_assetSharedViewModel;
  if (assetSharedViewModel != v5)
  {
    id v7 = v5;
    [(PUAssetSharedViewModel *)assetSharedViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetSharedViewModel, a3);
    [(PUAssetSharedViewModel *)self->_assetSharedViewModel registerChangeObserver:self];
    [(PUProgressIndicatorTileViewController *)self _invalidateProgressViewStyle];
    [(PUProgressIndicatorTileViewController *)self _invalidateStatus];
    [(PUProgressIndicatorTileViewController *)self _updateIfNeeded];
    BOOL v5 = v7;
  }
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUProgressIndicatorTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUProgressIndicatorTileViewController *)self setAssetViewModel:0];
  [(PUProgressIndicatorTileViewController *)self setBrowsingViewModel:0];
  [(PUProgressIndicatorTileViewController *)self setAssetSharedViewModel:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUProgressIndicatorTileViewController;
  [(PUTileViewController *)&v3 viewDidLoad];
  [(PUProgressIndicatorTileViewController *)self _invalidateSizeClass];
  [(PUProgressIndicatorTileViewController *)self _invalidateStatusViews];
  [(PUProgressIndicatorTileViewController *)self _updateIfNeeded];
}

- (id)loadView
{
  objc_super v3 = objc_alloc_init(_PUProgressIndicatorTileView);
  [(_PUProgressIndicatorTileView *)v3 setTraitCollectionDelegate:self];
  return v3;
}

- (id)view
{
  v4.receiver = self;
  v4.super_class = (Class)PUProgressIndicatorTileViewController;
  double v2 = [(PUTileViewController *)&v4 view];
  return v2;
}

+ (id)_loadErrorIconForSizeClass:(int64_t)a3
{
  id v6 = +[PUInterfaceManager currentTheme];
  id v7 = v6;
  switch(a3)
  {
    case 2:
      uint64_t v10 = [v6 regularLoadErrorIcon];
LABEL_8:
      id v9 = (void *)v10;
      goto LABEL_9;
    case 1:
      uint64_t v10 = [v6 compactLoadErrorIcon];
      goto LABEL_8;
    case 0:
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:a1 file:@"PUProgressIndicatorTileViewController.m" lineNumber:214 description:@"unspecified size class"];

      break;
  }
  id v9 = 0;
LABEL_9:

  return v9;
}

+ (UIEdgeInsets)progressIndicatorIconInsetsForSizeClass:(int64_t)a3
{
  [(id)objc_opt_class() progressIndicatorIconSizeForSizeClass:a3];
  double v5 = v4;
  double v7 = v6;
  [(id)objc_opt_class() progressIndicatorTileSizeForSizeClass:a3];
  double v9 = (v8 - v5) * 0.5;
  double v11 = (v10 - v7) * 0.5;
  double v12 = v9;
  double v13 = v11;
  result.right = v9;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

+ (CGSize)progressIndicatorTileSizeForSizeClass:(int64_t)a3
{
  [(id)objc_opt_class() progressIndicatorIconSizeForSizeClass:a3];
  double v4 = fmax(v3, 44.0);
  double v6 = fmax(v5, 44.0);
  result.height = v6;
  result.width = v4;
  return result;
}

+ (CGSize)progressIndicatorIconSizeForSizeClass:(int64_t)a3
{
  double v3 = [a1 _loadErrorIconForSizeClass:a3];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end