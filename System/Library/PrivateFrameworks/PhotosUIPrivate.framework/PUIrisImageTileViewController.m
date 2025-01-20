@interface PUIrisImageTileViewController
+ (OS_dispatch_queue)srlCompensationLoadingQueue;
- (BOOL)isVitalityDisabledByTransformInset;
- (PHLivePhotoView)_livePhotoView;
- (PUBrowsingIrisPlayer)irisPlayer;
- (PUIrisImageTileViewControllerDelegate)delegate;
- (PXLivePhotoViewModulator)livePhotoViewModulator;
- (UIView)borderView;
- (id)generateAssetTransitionInfo;
- (id)loadView;
- (id)viewsForApplyingBorder;
- (id)viewsForApplyingCornerRadius;
- (void)_handleBrowsingIrisPlayer:(id)a3 didChange:(id)a4;
- (void)_handleLoadedSRLCompensationAmount:(id)a3 forAsset:(id)a4;
- (void)_updateIrisPlayer;
- (void)_updateLivePhotoViewPlayer;
- (void)_updateLivePhotoViewVitalityEnabled;
- (void)_updatePlaybackGestureRecognizer;
- (void)_updatePlayerViewInteractivePlaybackAllowed;
- (void)_updateSRLCompensation;
- (void)_updateVitalityTransform;
- (void)addToTilingView:(id)a3;
- (void)applyLayoutInfo:(id)a3;
- (void)assetDidChange;
- (void)assetViewModelDidChange:(id)a3;
- (void)displayedImageRequestResultDidChange;
- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4;
- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4;
- (void)livePhotoViewDidBeginHinting:(id)a3;
- (void)livePhotoViewDidEndPlayingVitality:(id)a3;
- (void)ppt_playLivePhotoWithCompletionHandler:(id)a3;
- (void)removeAllAnimations;
- (void)setBorderView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIrisPlayer:(id)a3;
- (void)setIsVitalityDisabledByTransformInset:(BOOL)a3;
- (void)setLivePhotoViewModulator:(id)a3;
- (void)updateModulator;
- (void)updateModulatorInputs;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUIrisImageTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irisPlayer, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_livePhotoViewModulator, 0);
  objc_storeStrong((id *)&self->__livePhotoView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_ppt_didEndPlayingHandler, 0);
}

- (PUBrowsingIrisPlayer)irisPlayer
{
  return self->_irisPlayer;
}

- (void)setBorderView:(id)a3
{
}

- (UIView)borderView
{
  return self->_borderView;
}

- (BOOL)isVitalityDisabledByTransformInset
{
  return self->_isVitalityDisabledByTransformInset;
}

- (void)setLivePhotoViewModulator:(id)a3
{
}

- (PXLivePhotoViewModulator)livePhotoViewModulator
{
  return self->_livePhotoViewModulator;
}

- (PHLivePhotoView)_livePhotoView
{
  return self->__livePhotoView;
}

- (PUIrisImageTileViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUIrisImageTileViewControllerDelegate *)WeakRetained;
}

- (void)livePhotoViewDidBeginHinting:(id)a3
{
  if (self->_delegateFlags.respondsToDidBeginHinting)
  {
    id v4 = [(PUIrisImageTileViewController *)self delegate];
    [v4 irisImageTileViewControllerDidBeginHinting:self];
  }
}

- (void)livePhotoViewDidEndPlayingVitality:(id)a3
{
  if (self->_delegateFlags.respondsToDidEndVitality)
  {
    id v4 = [(PUIrisImageTileViewController *)self delegate];
    [v4 irisImageTileViewControllerDidEndVitality:self];
  }
}

- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4
{
  id v8 = a3;
  if (self->_delegateFlags.respondsToDidEndPlaying)
  {
    v5 = [(PUIrisImageTileViewController *)self delegate];
    [v5 irisImageTileViewControllerDidEndPlaying:self];
  }
  ppt_didEndPlayingHandler = (void (**)(void))self->_ppt_didEndPlayingHandler;
  if (ppt_didEndPlayingHandler)
  {
    ppt_didEndPlayingHandler[2]();
    id v7 = self->_ppt_didEndPlayingHandler;
    self->_ppt_didEndPlayingHandler = 0;
  }
}

- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4
{
  if (self->_delegateFlags.respondsToDidBeginPlaying)
  {
    id v5 = [(PUIrisImageTileViewController *)self delegate];
    [v5 irisImageTileViewControllerDidBeginPlaying:self];
  }
}

- (void)setIsVitalityDisabledByTransformInset:(BOOL)a3
{
  if (self->_isVitalityDisabledByTransformInset != a3)
  {
    self->_isVitalityDisabledByTransformInset = a3;
    [(PUIrisImageTileViewController *)self _updateLivePhotoViewVitalityEnabled];
  }
}

- (void)_updateVitalityTransform
{
  v3 = [(PUImageTileViewController *)self assetViewModel];
  id v4 = [v3 irisPlayer];

  if (v4)
  {
    [v4 vitalityTransform];
    v5.i32[3] = 0;
    HIDWORD(v6) = 0;
    *(_OWORD *)v36 = v6;
    v7.i32[3] = 0;
    float32x4_t v34 = v5;
    float32x4_t v35 = v7;
    int v8 = objc_msgSend(v4, "allowLargeVitalityInset", *(void *)(MEMORY[0x1E4F14998] + 16), *(void *)(MEMORY[0x1E4F14998] + 24), *(void *)(MEMORY[0x1E4F14998] + 32), *(void *)(MEMORY[0x1E4F14998] + 40), *MEMORY[0x1E4F14998], *(void *)(MEMORY[0x1E4F14998] + 8));
  }
  else
  {
    float32x4_t v34 = *(float32x4_t *)MEMORY[0x1E4F14998];
    float32x4_t v35 = *(float32x4_t *)(MEMORY[0x1E4F14998] + 32);
    *(_OWORD *)v36 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
    int v8 = objc_msgSend(0, "allowLargeVitalityInset", *(void *)(MEMORY[0x1E4F14998] + 16), *(void *)(MEMORY[0x1E4F14998] + 24), *(void *)(MEMORY[0x1E4F14998] + 32), *(void *)(MEMORY[0x1E4F14998] + 40), *MEMORY[0x1E4F14998], *(void *)(MEMORY[0x1E4F14998] + 8));
  }
  uint32x4_t v9 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)v36, v31), (int8x16_t)vceqq_f32(v34, v33)), (int8x16_t)vceqq_f32(v35, v32));
  v9.i32[3] = v9.i32[2];
  unsigned int v10 = vminvq_u32(v9);
  double v11 = *(double *)v34.i64;
  double v12 = *(double *)v36;
  double v13 = *(double *)v35.i64;
  if (v8)
  {
    if ((v10 & 0x80000000) != 0) {
      goto LABEL_7;
    }
    v14 = [(PUIrisImageTileViewController *)self _livePhotoView];
    [v14 bounds];
    double v17 = PUPerspectiveTransformMaxInsetForDimensions(v34, *(float32x4_t *)v36, v35, v15, v16);

    v18 = +[PUOneUpSettings sharedInstance];
    [v18 vitalityMaxAllowedLargeInsetPoints];
    double v20 = v19;

    if (v17 > v20)
    {
LABEL_7:
      v37 = 0;
      uint64_t v21 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    if ((v10 & 0x80000000) != 0) {
      goto LABEL_10;
    }
    v22 = +[PUOneUpSettings sharedInstance];
    [v22 vitalityMaxAllowedInsetPoints];
    double v24 = v23;

    v25 = [(PUIrisImageTileViewController *)self _livePhotoView];
    [v25 bounds];
    double v28 = PUPerspectiveTransformMaxInsetForDimensions(v34, *(float32x4_t *)v36, v35, v26, v27);

    if (v28 > v24)
    {
LABEL_10:
      uint64_t v21 = 0;
      v37 = 0;
      goto LABEL_12;
    }
  }
  v37 = objc_msgSend(MEMORY[0x1E4F39C18], "pu_meshTransformApplyingNormalizedPerspectiveTransform:", *(double *)v34.i64, *(double *)v36, *(double *)v35.i64);
  uint64_t v21 = 0;
LABEL_12:
  v29 = [(PUIrisImageTileViewController *)self _livePhotoView];
  v30 = [v29 playerView];
  [v30 setVitalityTransform:v37];

  [(PUIrisImageTileViewController *)self setIsVitalityDisabledByTransformInset:v21];
}

- (void)_updatePlaybackGestureRecognizer
{
  v3 = [(PUIrisImageTileViewController *)self _livePhotoView];
  id v4 = [v3 playbackGestureRecognizer];
  if (self->_delegateFlags.respondsToDelegateForGestureRecognizer)
  {
    float32x4_t v5 = [(PUIrisImageTileViewController *)self delegate];
    long long v6 = [v5 irisImageTileViewController:self delegateForGestureRecognizer:v4];
  }
  else
  {
    long long v6 = 0;
  }
  [v4 setDelegate:v6];
  id v9 = v3;
  float32x4_t v7 = v9;
  if (self->_delegateFlags.respondsToViewHostingGestureRecognizers)
  {
    int v8 = [(PUIrisImageTileViewController *)self delegate];
    float32x4_t v7 = [v8 irisImageTileViewControllerViewHostingGestureRecognizers:self];
  }
  [v7 addGestureRecognizer:v4];
}

- (void)_handleBrowsingIrisPlayer:(id)a3 didChange:(id)a4
{
  id v5 = a4;
  if ([v5 playerDidChange]) {
    [(PUIrisImageTileViewController *)self _updateLivePhotoViewPlayer];
  }
  if ([v5 activatedDidChange]) {
    [(PUIrisImageTileViewController *)self _updatePlayerViewInteractivePlaybackAllowed];
  }
  if ([v5 vitalityTransformDidChange]) {
    [(PUIrisImageTileViewController *)self _updateVitalityTransform];
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PUIrisImageTileViewController;
  [(PUImageTileViewController *)&v30 viewModel:v7 didChange:v8];
  id v9 = [(PUImageTileViewController *)self assetViewModel];

  if (v9 == v7)
  {
    if ([v8 focusValueChanged]) {
      [(PUIrisImageTileViewController *)self _assetFocusValueDidChange];
    }
    if ([v8 revealsGainMapImageChanged])
    {
      v18 = [(PUIrisImageTileViewController *)self livePhotoViewModulator];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __53__PUIrisImageTileViewController_viewModel_didChange___block_invoke;
      v29[3] = &unk_1E5F28DE8;
      v29[4] = self;
      [v18 performChanges:v29];
    }
    if ([v8 irisPlayerChanged]) {
      [(PUIrisImageTileViewController *)self _updateIrisPlayer];
    }
    goto LABEL_22;
  }
  id v10 = [(PUIrisImageTileViewController *)self irisPlayer];

  if (v10 == v7)
  {
    id v12 = v7;
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_20:
        [(PUIrisImageTileViewController *)self _handleBrowsingIrisPlayer:v12 didChange:v8];
LABEL_21:

        goto LABEL_22;
      }
      double v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v22 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v22);
      double v23 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v19 handleFailureInMethod:a2, self, @"PUIrisImageTileViewController.m", 338, @"%@ should be an instance inheriting from %@, but it is %@", @"viewModel", v21, v23 object file lineNumber description];
    }
    else
    {
      double v19 = [MEMORY[0x1E4F28B00] currentHandler];
      double v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      [v19 handleFailureInMethod:a2, self, @"PUIrisImageTileViewController.m", 338, @"%@ should be an instance inheriting from %@, but it is nil", @"viewModel", v21 object file lineNumber description];
    }

    goto LABEL_20;
  }
  id v11 = [(PUImageTileViewController *)self browsingViewModel];

  if (v11 == v7)
  {
    id v12 = v8;
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_6:
        if ([v12 isScrubbingActivationDidChange]) {
          [(PUIrisImageTileViewController *)self _updatePlaybackGestureRecognizer];
        }
        if ([v12 livePhotoShouldPlayDidChange])
        {
          double v13 = [(PUIrisImageTileViewController *)self _livePhotoView];
          v14 = [v13 playbackGestureRecognizer];
          int v15 = [v14 isEnabled];

          if (v15)
          {
            double v16 = [v13 playerView];
            double v17 = [(PUImageTileViewController *)self browsingViewModel];
            objc_msgSend(v16, "setPlaybackFilterTouchActive:", objc_msgSend(v17, "livePhotoShouldPlay"));
          }
        }
        goto LABEL_21;
      }
      double v24 = [MEMORY[0x1E4F28B00] currentHandler];
      double v27 = (objc_class *)objc_opt_class();
      double v26 = NSStringFromClass(v27);
      double v28 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v24 handleFailureInMethod:a2, self, @"PUIrisImageTileViewController.m", 342, @"%@ should be an instance inheriting from %@, but it is %@", @"change", v26, v28 object file lineNumber description];
    }
    else
    {
      double v24 = [MEMORY[0x1E4F28B00] currentHandler];
      v25 = (objc_class *)objc_opt_class();
      double v26 = NSStringFromClass(v25);
      [v24 handleFailureInMethod:a2, self, @"PUIrisImageTileViewController.m", 342, @"%@ should be an instance inheriting from %@, but it is nil", @"change", v26 object file lineNumber description];
    }

    goto LABEL_6;
  }
LABEL_22:
}

void __53__PUIrisImageTileViewController_viewModel_didChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 assetViewModel];
  objc_msgSend(v3, "setRevealsGainMapImage:", objc_msgSend(v4, "revealsGainMapImage"));
}

- (id)generateAssetTransitionInfo
{
  id v3 = [(PUIrisImageTileViewController *)self _livePhotoView];
  if (([v3 isDisplayingPhoto] & 1) != 0
    || (([(PUTileViewController *)self visibleRect], v5 == *MEMORY[0x1E4F1DB30])
      ? (BOOL v6 = v4 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      : (BOOL v6 = 0),
        v6))
  {
    v18.receiver = self;
    v18.super_class = (Class)PUIrisImageTileViewController;
    id v9 = [(PUImageTileViewController *)&v18 generateAssetTransitionInfo];
  }
  else
  {
    id v7 = [v3 generateSnapshotImage];
    long long v16 = 0uLL;
    uint64_t v17 = 0;
    if (v3) {
      [v3 seekTime];
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PUIrisImageTileViewController_generateAssetTransitionInfo__block_invoke;
    v11[3] = &unk_1E5F26600;
    long long v14 = v16;
    uint64_t v15 = v17;
    id v12 = v7;
    double v13 = self;
    id v8 = v7;
    id v9 = +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:v11];
  }
  return v9;
}

void __60__PUIrisImageTileViewController_generateAssetTransitionInfo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setImage:v3];
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  [v4 setSeekTime:&v6];
  double v5 = [*(id *)(a1 + 40) asset];
  [v4 setAsset:v5];
}

- (void)ppt_playLivePhotoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = _Block_copy(self->_ppt_didEndPlayingHandler);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __72__PUIrisImageTileViewController_ppt_playLivePhotoWithCompletionHandler___block_invoke;
    double v13 = &unk_1E5F2D9B8;
    id v14 = v5;
    id v15 = v4;
    id v6 = v5;
    uint64_t v7 = _Block_copy(&v10);
    id ppt_didEndPlayingHandler = self->_ppt_didEndPlayingHandler;
    self->_id ppt_didEndPlayingHandler = v7;
  }
  id v9 = [(PUIrisImageTileViewController *)self _livePhotoView];
  [v9 startPlaybackWithStyle:1];
}

uint64_t __72__PUIrisImageTileViewController_ppt_playLivePhotoWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)_updatePlayerViewInteractivePlaybackAllowed
{
  id v18 = [(PUImageTileViewController *)self assetViewModel];
  [v18 focusValue];
  double v4 = v3;
  double v5 = +[PUOneUpSettings sharedInstance];
  [v5 livePhotoInteractionThreshold];
  double v7 = v6;
  double v8 = fabs(v4);
  id v9 = [v18 irisPlayer];
  char v10 = [v9 isActivated];

  uint64_t v11 = +[PUOneUpSettings sharedInstance];
  if ([v11 shouldMergeOverlappingLivePhotos])
  {
    id v12 = [(PUImageTileViewController *)self assetViewModel];
    double v13 = [v12 asset];
    objc_opt_class();
    int v14 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    LOBYTE(v14) = 1;
  }

  id v15 = [(PUIrisImageTileViewController *)self _livePhotoView];
  long long v16 = [v15 playbackGestureRecognizer];

  if (v8 <= v7) {
    char v17 = v10 | v14;
  }
  else {
    char v17 = 0;
  }
  [v16 setEnabled:v17 & 1];
}

- (void)_updateLivePhotoViewPlayer
{
  id v5 = [(PUIrisImageTileViewController *)self irisPlayer];
  double v3 = [v5 player];
  double v4 = [(PUIrisImageTileViewController *)self _livePhotoView];
  [v4 setPlayer:v3];
}

- (void)setIrisPlayer:(id)a3
{
  id v5 = (PUBrowsingIrisPlayer *)a3;
  irisPlayer = self->_irisPlayer;
  if (irisPlayer != v5)
  {
    double v7 = v5;
    [(PUBrowsingIrisPlayer *)irisPlayer unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_irisPlayer, a3);
    [(PUBrowsingIrisPlayer *)self->_irisPlayer registerChangeObserver:self];
    [(PUIrisImageTileViewController *)self _updateLivePhotoViewPlayer];
    id v5 = v7;
  }
}

- (void)_updateIrisPlayer
{
  id v4 = [(PUImageTileViewController *)self assetViewModel];
  double v3 = [v4 irisPlayer];
  [(PUIrisImageTileViewController *)self setIrisPlayer:v3];
}

- (void)_handleLoadedSRLCompensationAmount:(id)a3 forAsset:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(PUImageTileViewController *)self asset];

  if (v7 == v6)
  {
    double v8 = [(PUIrisImageTileViewController *)self _livePhotoView];
    [v8 setOverrideSRLCompensationAmount:v9];
  }
}

- (void)_updateSRLCompensation
{
  double v3 = +[PUOneUpSettings sharedInstance];
  if (![v3 livePhotoSRLCompensationEnabled])
  {
LABEL_6:
    id v5 = 0;
    goto LABEL_7;
  }
  if (![v3 livePhotoSRLCompensationManualMode])
  {
    id v6 = [(PUImageTileViewController *)self asset];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v8 = [(PUImageTileViewController *)self asset];
      objc_initWeak(&location, self);
      id v9 = [(id)objc_opt_class() srlCompensationLoadingQueue];
      id v11 = v8;
      objc_copyWeak(&v12, &location);
      PXDispatchAsyncWithSignpost();

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    goto LABEL_6;
  }
  id v4 = NSNumber;
  [v3 livePhotoSRLCompensationManualValue];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
LABEL_7:
  char v10 = [(PUIrisImageTileViewController *)self _livePhotoView];
  [v10 setOverrideSRLCompensationAmount:v5];
}

void __55__PUIrisImageTileViewController__updateSRLCompensation__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) livePhotoSRLCompensationAmount];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PUIrisImageTileViewController__updateSRLCompensation__block_invoke_2;
  block[3] = &unk_1E5F2D758;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  id v5 = v2;
  id v6 = *(id *)(a1 + 32);
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v7);
}

void __55__PUIrisImageTileViewController__updateSRLCompensation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleLoadedSRLCompensationAmount:*(void *)(a1 + 32) forAsset:*(void *)(a1 + 40)];
}

- (void)_updateLivePhotoViewVitalityEnabled
{
  id v3 = +[PUIrisSettings sharedInstance];
  int v4 = [v3 isVitalityAllowed];

  if (v4
    && ([(PUImageTileViewController *)self assetViewModel],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 irisPlayer],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    BOOL v7 = [(PUIrisImageTileViewController *)self isVitalityDisabledByTransformInset];
    id v12 = [(PUIrisImageTileViewController *)self _livePhotoView];
    if (!v7)
    {
      double v8 = [(PUTileController *)self tilingView];
      id v9 = objc_msgSend(v8, "is_vitalityControllerCreateIfNeeded:", 1);

      char v10 = [v12 playerView];
      [v9 addPlayerView:v10];
      goto LABEL_7;
    }
  }
  else
  {
    id v12 = [(PUIrisImageTileViewController *)self _livePhotoView];
  }
  id v11 = [(PUTileController *)self tilingView];
  id v9 = objc_msgSend(v11, "is_vitalityControllerCreateIfNeeded:", 0);

  char v10 = [v12 playerView];
  [v9 removePlayerView:v10];
LABEL_7:
}

- (void)displayedImageRequestResultDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)PUIrisImageTileViewController;
  [(PUOneUpImageTileViewController *)&v5 displayedImageRequestResultDidChange];
  id v3 = [(PUIrisImageTileViewController *)self _livePhotoView];
  int v4 = [v3 debugOverlayView];
  [v4 update];
}

- (void)assetDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PUIrisImageTileViewController;
  [(PUImageTileViewController *)&v3 assetDidChange];
  [(PUIrisImageTileViewController *)self _updatePlayerViewInteractivePlaybackAllowed];
  [(PUIrisImageTileViewController *)self _updateSRLCompensation];
}

- (void)assetViewModelDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIrisImageTileViewController;
  [(PUOneUpImageTileViewController *)&v4 assetViewModelDidChange:a3];
  [(PUIrisImageTileViewController *)self _updateIrisPlayer];
  [(PUIrisImageTileViewController *)self _updateLivePhotoViewVitalityEnabled];
  [(PUIrisImageTileViewController *)self _updatePlayerViewInteractivePlaybackAllowed];
  [(PUIrisImageTileViewController *)self _assetFocusValueDidChange];
  [(PUIrisImageTileViewController *)self _updateVitalityTransform];
}

- (id)viewsForApplyingBorder
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(PUTileViewController *)self isViewLoaded])
  {
    objc_super v3 = [(PUIrisImageTileViewController *)self borderView];
    v6[0] = v3;
    objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    objc_super v4 = 0;
  }
  return v4;
}

- (id)viewsForApplyingCornerRadius
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if ([(PUTileViewController *)self isViewLoaded])
  {
    objc_super v3 = [(PUIrisImageTileViewController *)self _livePhotoView];
    v7[0] = v3;
    objc_super v4 = [(PUIrisImageTileViewController *)self borderView];
    v7[1] = v4;
    objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (void)applyLayoutInfo:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PUIrisImageTileViewController;
  id v4 = a3;
  [(PUOneUpImageTileViewController *)&v16 applyLayoutInfo:v4];
  objc_msgSend(v4, "contentsRect", v16.receiver, v16.super_class);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = [(PUIrisImageTileViewController *)self _livePhotoView];
  int v14 = [v13 playerView];
  objc_msgSend(v14, "setContentsRect:", v6, v8, v10, v12);

  id v15 = [(PUTileViewController *)self view];
  [v15 layoutIfNeeded];

  [(PUIrisImageTileViewController *)self _updateVitalityTransform];
}

- (void)addToTilingView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIrisImageTileViewController;
  [(PUTileViewController *)&v4 addToTilingView:a3];
  [(PUIrisImageTileViewController *)self _updateLivePhotoViewVitalityEnabled];
}

- (void)removeAllAnimations
{
  v4.receiver = self;
  v4.super_class = (Class)PUIrisImageTileViewController;
  [(PUTileViewController *)&v4 removeAllAnimations];
  objc_super v3 = [(PUIrisImageTileViewController *)self _livePhotoView];
  objc_msgSend(v3, "pu_removeAllGeometryAnimationsRecursively:", 1);
}

- (void)updateModulatorInputs
{
  objc_super v3 = [(PUIrisImageTileViewController *)self livePhotoViewModulator];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PUIrisImageTileViewController_updateModulatorInputs__block_invoke;
  v4[3] = &unk_1E5F28DE8;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __54__PUIrisImageTileViewController_updateModulatorInputs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) gainMapImageIsAvailable])
  {
    objc_msgSend(v3, "setGainMapImage:animated:", objc_msgSend(*(id *)(a1 + 32), "gainMapImage"), 1);
    [*(id *)(a1 + 32) gainMapValue];
    objc_msgSend(v3, "setGainMapValue:");
  }
}

- (void)updateModulator
{
  id v3 = [(PUTileController *)self tilingView];
  int v4 = [v3 shouldDisplayHDR];

  if (v4)
  {
    double v5 = [(PUImageTileViewController *)self imageModulationManager];
    double v6 = (void *)MEMORY[0x1E4F902A0];
    double v7 = [(PUImageTileViewController *)self asset];
    uint64_t v8 = [v6 optionsForAsset:v7];
    uint64_t v10 = v9;

    double v11 = [(PUIrisImageTileViewController *)self livePhotoViewModulator];
    [v5 checkInLivePhotoViewModulator:v11];

    double v12 = objc_msgSend(v5, "checkoutLivePhotoViewModulatorWithOptions:", v8, v10);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__PUIrisImageTileViewController_updateModulator__block_invoke;
    v13[3] = &unk_1E5F28DE8;
    v13[4] = self;
    [v12 performChanges:v13];
    [(PUIrisImageTileViewController *)self setLivePhotoViewModulator:v12];
  }
}

void __48__PUIrisImageTileViewController_updateModulator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 _livePhotoView];
  int v4 = [v5 playerView];
  [v3 setLivePhotoView:v4];
}

- (id)loadView
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PUIrisImageTileViewController;
  id v3 = [(PUImageTileViewController *)&v15 loadView];
  id v4 = objc_alloc_init(MEMORY[0x1E4F39928]);
  objc_storeStrong((id *)&self->__livePhotoView, v4);
  [v4 setShouldApplyTargetReadiness:0];
  id v5 = +[PUIrisSettings sharedInstance];
  objc_msgSend(v4, "setShowsStatusBorder:", objc_msgSend(v5, "showStatusBorder"));

  [v4 setDelegate:self];
  [v4 setContentMode:2];
  double v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setBackgroundColor:v6];

  [v4 setClipsToBounds:1];
  [v4 setPhotoView:v3];
  if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled])
  {
    double v7 = PLLivePhotoPlaybackGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(PUImageTileViewController *)self assetViewModel];
      uint64_t v9 = [v8 asset];
      *(_DWORD *)buf = 138543618;
      char v17 = self;
      __int16 v18 = 2114;
      double v19 = v9;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Muting the live photo displayed by %{public}@ (asset %{public}@) because audible playback should only occur via the overlay tile.", buf, 0x16u);
    }
    [v4 setMuted:1];
  }
  id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v4 bounds];
  double v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
  [(UIView *)v11 setAutoresizingMask:18];
  [(UIView *)v11 setUserInteractionEnabled:0];
  double v12 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIView *)v11 setBackgroundColor:v12];

  [(UIView *)v11 setClipsToBounds:1];
  [v4 addSubview:v11];
  borderView = self->_borderView;
  self->_borderView = v11;

  [(PUIrisImageTileViewController *)self _updatePlaybackGestureRecognizer];
  [(PUIrisImageTileViewController *)self _updateLivePhotoViewVitalityEnabled];

  return v4;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToDidBeginPlaying = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToWillEndPlaying = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidEndPlaying = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidEndVitality = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToViewHostingGestureRecognizers = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDelegateForGestureRecognizer = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidBeginHinting = objc_opt_respondsToSelector() & 1;
    [(PUIrisImageTileViewController *)self _updatePlaybackGestureRecognizer];
  }
}

+ (OS_dispatch_queue)srlCompensationLoadingQueue
{
  if (srlCompensationLoadingQueue_onceToken_39030 != -1) {
    dispatch_once(&srlCompensationLoadingQueue_onceToken_39030, &__block_literal_global_39031);
  }
  uint64_t v2 = (void *)srlCompensationLoadingQueue_queue_39032;
  return (OS_dispatch_queue *)v2;
}

void __60__PUIrisImageTileViewController_srlCompensationLoadingQueue__block_invoke()
{
  uint64_t v0 = px_dispatch_queue_create_serial();
  v1 = (void *)srlCompensationLoadingQueue_queue_39032;
  srlCompensationLoadingQueue_queue_39032 = v0;
}

@end