@interface PULivePhotoVideoOverlayTileViewController
+ (OS_dispatch_queue)srlCompensationLoadingQueue;
- (BOOL)disappearanceAssertionsEnabled;
- (BOOL)isPresentedForSecondScreen;
- (BOOL)livePhotoView:(id)a3 canBeginPlaybackWithStyle:(int64_t)a4;
- (BOOL)willEndCurrentPlayback;
- (ISWrappedAVPlayer)videoPlayer;
- (NSArray)playbackGestureRecognizers;
- (PHLivePhotoView)livePhotoView;
- (PUAssetReference)playbackAssetReference;
- (PUBrowsingViewModel)browsingViewModel;
- (PULivePhotoVideoOverlayTileViewControllerDelegate)delegate;
- (PUMergedLivePhotosVideo)mergedVideo;
- (PUModelTileTransform)modelTileTransform;
- (PUOneUpMergedVideoProvider)mergedVideoProvider;
- (PXImageModulationManager)imageModulationManager;
- (PXLivePhotoViewModulator)livePhotoViewModulator;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (UIView)containerView;
- (double)livePhotoView:(id)a3 extraMinimumTouchDurationForTouch:(id)a4 withStyle:(int64_t)a5;
- (id)loadView;
- (id)videoPlayerTimeObserver;
- (void)_handleLoadedSRLCompensationAmount:(id)a3 forAsset:(id)a4;
- (void)_updateLivePhotoViewModulator;
- (void)_updateLivePhotoViewModulatorInput;
- (void)_updateLivePhotoViewPhoto;
- (void)_updateMergedVideo;
- (void)_updatePlaybackEnabled;
- (void)_updateSRLCompensation;
- (void)_videoCurrentTimeDidChange:(id *)a3;
- (void)becomeReusable;
- (void)dealloc;
- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4;
- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setBrowsingViewModel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageModulationManager:(id)a3;
- (void)setIsPresentedForSecondScreen:(BOOL)a3;
- (void)setLivePhotoViewModulator:(id)a3;
- (void)setMergedVideo:(id)a3;
- (void)setMergedVideoProvider:(id)a3;
- (void)setModelTileTransform:(id)a3;
- (void)setPlaybackAssetReference:(id)a3;
- (void)setVideoPlayer:(id)a3;
- (void)setVideoPlayerTimeObserver:(id)a3;
- (void)setWillEndCurrentPlayback:(BOOL)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PULivePhotoVideoOverlayTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackAssetReference, 0);
  objc_storeStrong((id *)&self->_livePhotoViewModulator, 0);
  objc_storeStrong((id *)&self->_modelTileTransform, 0);
  objc_storeStrong(&self->_videoPlayerTimeObserver, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_mergedVideo, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_playbackGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_imageModulationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mergedVideoProvider, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

- (void)setWillEndCurrentPlayback:(BOOL)a3
{
  self->_willEndCurrentPlayback = a3;
}

- (BOOL)willEndCurrentPlayback
{
  return self->_willEndCurrentPlayback;
}

- (PUAssetReference)playbackAssetReference
{
  return self->_playbackAssetReference;
}

- (PXLivePhotoViewModulator)livePhotoViewModulator
{
  return self->_livePhotoViewModulator;
}

- (void)setModelTileTransform:(id)a3
{
}

- (PUModelTileTransform)modelTileTransform
{
  return self->_modelTileTransform;
}

- (void)setVideoPlayerTimeObserver:(id)a3
{
}

- (id)videoPlayerTimeObserver
{
  return self->_videoPlayerTimeObserver;
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (PHLivePhotoView)livePhotoView
{
  return self->_livePhotoView;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (PUMergedLivePhotosVideo)mergedVideo
{
  return self->_mergedVideo;
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (NSArray)playbackGestureRecognizers
{
  return self->_playbackGestureRecognizers;
}

- (PXImageModulationManager)imageModulationManager
{
  return self->_imageModulationManager;
}

- (PULivePhotoVideoOverlayTileViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PULivePhotoVideoOverlayTileViewControllerDelegate *)WeakRetained;
}

- (void)setIsPresentedForSecondScreen:(BOOL)a3
{
  self->_isPresentedForSecondScreen = a3;
}

- (BOOL)isPresentedForSecondScreen
{
  return self->_isPresentedForSecondScreen;
}

- (PUOneUpMergedVideoProvider)mergedVideoProvider
{
  return self->_mergedVideoProvider;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (void)_handleLoadedSRLCompensationAmount:(id)a3 forAsset:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(PULivePhotoVideoOverlayTileViewController *)self mergedVideo];
  v8 = [v7 assets];
  id v9 = [v8 firstObject];

  if (v9 == v6)
  {
    v10 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoView];
    [v10 setOverrideSRLCompensationAmount:v11];
  }
}

- (void)_updateSRLCompensation
{
  v3 = +[PUOneUpSettings sharedInstance];
  if (![v3 livePhotoSRLCompensationEnabled]) {
    goto LABEL_5;
  }
  if (![v3 livePhotoSRLCompensationManualMode])
  {
    id v6 = [(PULivePhotoVideoOverlayTileViewController *)self mergedVideo];
    v7 = [v6 assets];
    v8 = [v7 firstObject];

    objc_initWeak(&location, self);
    id v9 = [(id)objc_opt_class() srlCompensationLoadingQueue];
    id v11 = v8;
    objc_copyWeak(&v12, &location);
    PXDispatchAsyncWithSignpost();

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = NSNumber;
  [v3 livePhotoSRLCompensationManualValue];
  v5 = objc_msgSend(v4, "numberWithDouble:");
LABEL_6:
  v10 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoView];
  [v10 setOverrideSRLCompensationAmount:v5];
}

void __67__PULivePhotoVideoOverlayTileViewController__updateSRLCompensation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) livePhotoSRLCompensationAmount];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PULivePhotoVideoOverlayTileViewController__updateSRLCompensation__block_invoke_2;
  block[3] = &unk_1E5F2D758;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  id v5 = v2;
  id v6 = *(id *)(a1 + 32);
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v7);
}

void __67__PULivePhotoVideoOverlayTileViewController__updateSRLCompensation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleLoadedSRLCompensationAmount:*(void *)(a1 + 32) forAsset:*(void *)(a1 + 40)];
}

- (void)_updatePlaybackEnabled
{
  id v3 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoView];
  v4 = [v3 player];
  uint64_t v5 = [v4 currentPlaybackStyle];

  if (!v5)
  {
    id v17 = [(PULivePhotoVideoOverlayTileViewController *)self browsingViewModel];
    id v6 = [v17 currentAssetReference];
    id v7 = [v17 assetViewModelForAssetReference:v6];
    v8 = [v6 asset];
    uint64_t v9 = [v8 playbackStyle];

    if (v9 == 3
      && ([v17 currentAssetTransitionProgress], PXFloatEqualToFloatWithTolerance())
      && ([v7 isAccessoryViewVisible] & 1) == 0
      && ([v7 irisPlayer],
          v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 isActivated],
          v10,
          (v11 & 1) == 0))
    {
      v16 = [v7 asset];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
    v13 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoView];
    v14 = [v13 playbackGestureRecognizer];
    [v14 setEnabled:isKindOfClass & 1];

    v15 = [(PULivePhotoVideoOverlayTileViewController *)self containerView];
    [v15 setHidden:(isKindOfClass & 1) == 0];
  }
}

- (void)_videoCurrentTimeDidChange:(id *)a3
{
  id v15 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoView];
  uint64_t v5 = [v15 player];
  if ([v5 currentPlaybackStyle] == 1
    && ![(PULivePhotoVideoOverlayTileViewController *)self isPresentedForSecondScreen])
  {
    BOOL v6 = [(PULivePhotoVideoOverlayTileViewController *)self willEndCurrentPlayback];

    if (!v6)
    {
      double v22 = NAN;
      id v7 = [(PULivePhotoVideoOverlayTileViewController *)self mergedVideo];
      long long v20 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      v8 = [v7 assetAtTime:&v20 progress:&v22];

      if (v8)
      {
        uint64_t v9 = [(PULivePhotoVideoOverlayTileViewController *)self browsingViewModel];
        v10 = [[PUAssetReference alloc] initWithAsset:v8 assetCollection:0 indexPath:0 dataSourceIdentifier:0];
        char v11 = [v9 assetsDataSource];
        id v12 = [v11 assetReferenceForAssetReference:v10];

        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __72__PULivePhotoVideoOverlayTileViewController__videoCurrentTimeDidChange___block_invoke;
        v16[3] = &unk_1E5F2D2C8;
        id v17 = v9;
        id v18 = v12;
        double v19 = v22;
        id v13 = v12;
        id v14 = v9;
        [v14 performChanges:v16];
      }
    }
  }
  else
  {
  }
}

uint64_t __72__PULivePhotoVideoOverlayTileViewController__videoCurrentTimeDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentAssetReference:*(void *)(a1 + 40) transitionProgress:@"LivePhotoOverlay" transitionDriverIdentifier:0 animated:*(double *)(a1 + 48)];
}

- (void)_updateMergedVideo
{
  id v3 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoView];
  id v6 = [v3 player];

  if (![v6 currentPlaybackStyle])
  {
    v4 = [(PULivePhotoVideoOverlayTileViewController *)self mergedVideoProvider];
    uint64_t v5 = [v4 mergedVideo];
    [(PULivePhotoVideoOverlayTileViewController *)self setMergedVideo:v5];
  }
}

- (void)_updateLivePhotoViewModulatorInput
{
  id v3 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoViewModulator];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__PULivePhotoVideoOverlayTileViewController__updateLivePhotoViewModulatorInput__block_invoke;
  v4[3] = &unk_1E5F28DE8;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __79__PULivePhotoVideoOverlayTileViewController__updateLivePhotoViewModulatorInput__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 livePhotoView];
  v4 = [v5 playerView];
  [v3 setLivePhotoView:v4];
}

- (void)setLivePhotoViewModulator:(id)a3
{
  id v5 = (PXLivePhotoViewModulator *)a3;
  if (self->_livePhotoViewModulator != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_livePhotoViewModulator, a3);
    [(PULivePhotoVideoOverlayTileViewController *)self _updateLivePhotoViewModulatorInput];
    id v5 = v6;
  }
}

- (void)_updateLivePhotoViewModulator
{
  id v10 = [(PULivePhotoVideoOverlayTileViewController *)self imageModulationManager];
  id v3 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoViewModulator];
  [v10 checkInLivePhotoViewModulator:v3];

  v4 = [(PULivePhotoVideoOverlayTileViewController *)self mergedVideo];
  id v5 = [v4 assets];
  id v6 = [v5 firstObject];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F902A0] optionsForAsset:v6];
    uint64_t v9 = objc_msgSend(v10, "checkoutLivePhotoViewModulatorWithOptions:", v7, v8);
    [(PULivePhotoVideoOverlayTileViewController *)self setLivePhotoViewModulator:v9];
  }
  else
  {
    [(PULivePhotoVideoOverlayTileViewController *)self setLivePhotoViewModulator:0];
  }
}

- (void)setImageModulationManager:(id)a3
{
  id v5 = (PXImageModulationManager *)a3;
  if (self->_imageModulationManager != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_imageModulationManager, a3);
    [(PULivePhotoVideoOverlayTileViewController *)self _updateLivePhotoViewModulator];
    id v5 = v6;
  }
}

- (void)setVideoPlayer:(id)a3
{
  id v5 = (ISWrappedAVPlayer *)a3;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    uint64_t v7 = [(PULivePhotoVideoOverlayTileViewController *)self videoPlayerTimeObserver];
    [(ISWrappedAVPlayer *)videoPlayer removeTimeObserver:v7];

    objc_storeStrong((id *)&self->_videoPlayer, a3);
    objc_initWeak(&location, self);
    CMTimeMake(&v13, 1, 60);
    uint64_t v8 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PULivePhotoVideoOverlayTileViewController_setVideoPlayer___block_invoke;
    v11[3] = &unk_1E5F2B040;
    objc_copyWeak(&v12, &location);
    id v10 = [(ISWrappedAVPlayer *)v5 addPeriodicTimeObserverForInterval:&v13 queue:v8 usingBlock:v11];
    [(PULivePhotoVideoOverlayTileViewController *)self setVideoPlayerTimeObserver:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __60__PULivePhotoVideoOverlayTileViewController_setVideoPlayer___block_invoke(uint64_t a1, long long *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v4 = *a2;
  uint64_t v5 = *((void *)a2 + 2);
  [WeakRetained _videoCurrentTimeDidChange:&v4];
}

- (void)_updateLivePhotoViewPhoto
{
  id v3 = [(PULivePhotoVideoOverlayTileViewController *)self delegate];
  long long v4 = [v3 livePhotoVideoPlaybackTileViewControllerCurrentImage:self];

  id v5 = v4;
  uint64_t v6 = [v5 CGImage];
  uint64_t v7 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoView];
  [v7 setOverridePhoto:v6];

  char v14 = 0;
  int v13 = 0;
  uint64_t v8 = [(PULivePhotoVideoOverlayTileViewController *)self delegate];
  uint64_t v9 = [v8 livePhotoVideoPlaybackTileViewControllerCurrentGainMapImage:self outGainMapAvailable:&v14 outGainMapValue:&v13];

  if (v14)
  {
    id v10 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoViewModulator];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__PULivePhotoVideoOverlayTileViewController__updateLivePhotoViewPhoto__block_invoke;
    v11[3] = &__block_descriptor_52_e43_v16__0___PXMutableLivePhotoViewModulator__8l;
    void v11[4] = v6;
    v11[5] = v9;
    int v12 = v13;
    [v10 performChanges:v11];
  }
}

void __70__PULivePhotoVideoOverlayTileViewController__updateLivePhotoViewPhoto__block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  id v5 = a2;
  [v5 setGainMapImage:v3];
  LODWORD(v4) = *(_DWORD *)(a1 + 48);
  [v5 setGainMapValue:v4];
}

- (void)setPlaybackAssetReference:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = (PUAssetReference *)a3;
  if (self->_playbackAssetReference != v5)
  {
    objc_storeStrong((id *)&self->_playbackAssetReference, a3);
    if (v5)
    {
      uint64_t v6 = [(PUTileController *)self tilingView];
      v14[0] = self;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      [v6 detachTileControllers:v7];

      uint64_t v8 = [(PUTileViewController *)self view];
      uint64_t v9 = [(PUTileController *)self tilingView];
      id v10 = [v9 superview];
      objc_msgSend(v8, "px_transferToSuperview:", v10);
    }
    else
    {
      char v11 = [(PUTileViewController *)self view];
      int v12 = [(PUTileController *)self tilingView];
      objc_msgSend(v11, "px_transferToSuperview:", v12);

      uint64_t v8 = [(PUTileController *)self tilingView];
      int v13 = self;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
      [v8 reattachTileControllers:v9 withContext:0];
    }
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PULivePhotoVideoOverlayTileViewController *)self browsingViewModel];

  if (v8 != v6)
  {
    uint64_t v9 = PXAssertGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      browsingViewModel = self->_browsingViewModel;
      *(_DWORD *)buf = 138412802;
      v36 = self;
      __int16 v37 = 2112;
      v38 = browsingViewModel;
      __int16 v39 = 2112;
      id v40 = v6;
      _os_log_fault_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_FAULT, "Unexpected browsing view model sent a change to %@. Expected %@, but got %@.", buf, 0x20u);
    }
  }
  int v10 = [v7 isScrubbingActivationDidChange];
  int v11 = [v7 currentAssetTransitionProgressDidChange];
  int v12 = [v7 currentAssetDidChange] | v11 | v10;
  int v13 = [v6 currentAssetReference];
  if (v13 && (v12 & 1) == 0)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    char v14 = [v7 assetViewModelChangesByAssetReference];
    id v15 = [v14 objectForKeyedSubscript:v13];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      v29 = self;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v21 = [v20 irisPlayerChange];
          char v22 = [v21 activatedDidChange];

          if (v22 & 1) != 0 || ([v20 accessoryViewVisibilityChanged])
          {
            int v12 = 1;
            self = v29;
            goto LABEL_19;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
        int v12 = 0;
        self = v29;
        if (v17) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v12 = 0;
    }
LABEL_19:
  }
  v23 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoView];
  if ([v7 livePhotoShouldPlayDidChange])
  {
    v24 = [v23 playbackGestureRecognizer];
    int v25 = [v24 isEnabled];

    if (v25)
    {
      v26 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoView];
      v27 = [v26 playerView];
      objc_msgSend(v27, "setPlaybackFilterTouchActive:", objc_msgSend(v6, "livePhotoShouldPlay"));
    }
  }
  if (v12) {
    [(PULivePhotoVideoOverlayTileViewController *)self _updatePlaybackEnabled];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)MergedVideoProviderContext_34611 == a5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((v6 & 2) == 0) {
        goto LABEL_16;
      }
    }
    else
    {
      int v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"PULivePhotoVideoOverlayTileViewController.m", 211, @"Invalid parameter not satisfying: %@", @"[observable isKindOfClass:PUOneUpMergedVideoProvider.class]" object file lineNumber description];

      if ((v6 & 2) == 0) {
        goto LABEL_16;
      }
    }
    int v11 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    int v12 = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke;
    goto LABEL_15;
  }
  if ((void *)VideoPlayerChangeContext != a5)
  {
    char v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PULivePhotoVideoOverlayTileViewController.m" lineNumber:255 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x40) != 0
    && ![(PULivePhotoVideoOverlayTileViewController *)self isPresentedForSecondScreen])
  {
    v15[10] = MEMORY[0x1E4F143A8];
    v15[11] = 3221225472;
    v15[12] = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_2;
    v15[13] = &unk_1E5F2ED10;
    v15[14] = self;
    px_dispatch_on_main_queue();
  }
  if (v6 < 0
    && ![(PULivePhotoVideoOverlayTileViewController *)self isPresentedForSecondScreen])
  {
    int v10 = [(PULivePhotoVideoOverlayTileViewController *)self playbackAssetReference];

    if (v10)
    {
      v15[5] = MEMORY[0x1E4F143A8];
      v15[6] = 3221225472;
      v15[7] = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_4;
      v15[8] = &unk_1E5F2ED10;
      v15[9] = self;
      px_dispatch_on_main_queue();
    }
  }
  if ((v6 & 4) != 0)
  {
    int v11 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    int v12 = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_7;
LABEL_15:
    v11[2] = v12;
    v11[3] = &unk_1E5F2ED10;
    void v11[4] = self;
    px_dispatch_on_main_queue();
  }
LABEL_16:
}

uint64_t __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMergedVideo];
}

void __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) browsingViewModel];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_3;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = *(void *)(a1 + 32);
  [v2 performChanges:v3];
}

void __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setWillEndCurrentPlayback:1];
  v2 = [*(id *)(a1 + 32) browsingViewModel];
  uint64_t v3 = [*(id *)(a1 + 32) modelTileTransform];
  double v4 = [*(id *)(a1 + 32) playbackAssetReference];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_5;
  v8[3] = &unk_1E5F2E908;
  id v9 = v2;
  id v10 = v4;
  id v11 = v3;
  id v5 = v3;
  id v6 = v4;
  id v7 = v2;
  [v7 performChanges:v8];
}

void __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_7(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) livePhotoView];
  v2 = [v4 player];
  uint64_t v3 = [v2 videoPlayer];
  [*(id *)(a1 + 32) setVideoPlayer:v3];
}

void __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) assetViewModelForAssetReference:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (*(void *)(a1 + 48))
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_6;
    id v9 = &unk_1E5F2ECC8;
    id v10 = v2;
    id v11 = *(id *)(a1 + 48);
    [v10 performChanges:&v6];
  }
  objc_msgSend(*(id *)(a1 + 32), "setVideoOverlayPlayState:", 0, v6, v7, v8, v9);
  id v4 = [*(id *)(a1 + 32) assetsDataSource];
  id v5 = [v4 assetReferenceForAssetReference:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setCurrentAssetReference:v5 transitionProgress:@"PUBrowsingViewModelTransitionDriverIdentifierLivePhotoOverlay" transitionDriverIdentifier:0 animated:0.0];
}

uint64_t __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setModelTileTransform:*(void *)(a1 + 40)];
}

void __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) mergedVideoProvider];
  v2 = [v5 livePhotoPlayer];
  uint64_t v3 = [v2 isAttemptingToPlayback];
  id v4 = [*(id *)(a1 + 32) browsingViewModel];
  [v4 setIsAttemptingToPlayVideoOverlay:v3];
}

- (double)livePhotoView:(id)a3 extraMinimumTouchDurationForTouch:(id)a4 withStyle:(int64_t)a5
{
  id v6 = a4;
  uint64_t v7 = [(PULivePhotoVideoOverlayTileViewController *)self delegate];
  [v7 livePhotoVideoPlaybackTileViewControllerExtraMinimumTouchDuration:self locationProvider:v6];
  double v9 = v8;

  return v9;
}

- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4
{
  id v5 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoView];
  [v5 setHidden:1];

  [(PULivePhotoVideoOverlayTileViewController *)self setPlaybackAssetReference:0];
  id v6 = [(PULivePhotoVideoOverlayTileViewController *)self delegate];
  [v6 livePhotoVideoPlaybackTileViewControllerDidEndPlaying:self];

  [(PULivePhotoVideoOverlayTileViewController *)self _updateMergedVideo];
}

- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4
{
  -[PULivePhotoVideoOverlayTileViewController setWillEndCurrentPlayback:](self, "setWillEndCurrentPlayback:", 0, a4);
  [(PULivePhotoVideoOverlayTileViewController *)self _updateLivePhotoViewPhoto];
  id v5 = [(PULivePhotoVideoOverlayTileViewController *)self browsingViewModel];
  id v6 = [v5 currentAssetReference];
  [(PULivePhotoVideoOverlayTileViewController *)self setPlaybackAssetReference:v6];
  uint64_t v7 = [(PULivePhotoVideoOverlayTileViewController *)self delegate];
  double v8 = [v7 livePhotoVideoPlaybackTileViewControllerDisplayTileTransform:self];

  double v9 = [v8 modelTileTransform];
  [(PULivePhotoVideoOverlayTileViewController *)self setModelTileTransform:v9];

  id v10 = [v8 modelTileTransform];
  char v11 = [v10 hasUserZoomedIn];

  int v12 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoView];
  [v12 setHidden:0];

  if (![(PULivePhotoVideoOverlayTileViewController *)self isPresentedForSecondScreen])
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __86__PULivePhotoVideoOverlayTileViewController_livePhotoView_willBeginPlaybackWithStyle___block_invoke;
    uint64_t v17 = &unk_1E5F2E120;
    id v18 = v5;
    char v19 = v11;
    [v18 performChanges:&v14];
  }
  int v13 = [(PULivePhotoVideoOverlayTileViewController *)self delegate];
  [v13 livePhotoVideoPlaybackTileViewControllerWillBeginPlaying:self];
}

uint64_t __86__PULivePhotoVideoOverlayTileViewController_livePhotoView_willBeginPlaybackWithStyle___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 1;
  }
  return [*(id *)(a1 + 32) setVideoOverlayPlayState:v1];
}

- (BOOL)livePhotoView:(id)a3 canBeginPlaybackWithStyle:(int64_t)a4
{
  id v4 = self;
  id v5 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoView];
  id v6 = [v5 playbackGestureRecognizer];

  uint64_t v7 = [(PULivePhotoVideoOverlayTileViewController *)v4 delegate];
  LOBYTE(v4) = [v7 livePhotoVideoPlaybackTileViewControllerCanBeginPlaying:v4 locationProvider:v6];

  return (char)v4;
}

- (BOOL)disappearanceAssertionsEnabled
{
  return 0;
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PULivePhotoVideoOverlayTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PULivePhotoVideoOverlayTileViewController *)self setBrowsingViewModel:0];
  [(PULivePhotoVideoOverlayTileViewController *)self setImageModulationManager:0];
  [(PULivePhotoVideoOverlayTileViewController *)self setMergedVideoProvider:0];
}

- (id)loadView
{
  v18[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  containerView = self->_containerView;
  self->_containerView = v3;

  [(UIView *)self->_containerView setUserInteractionEnabled:0];
  [(UIView *)self->_containerView setClipsToBounds:1];
  id v5 = (PHLivePhotoView *)objc_alloc_init(MEMORY[0x1E4F39928]);
  livePhotoView = self->_livePhotoView;
  self->_livePhotoView = v5;

  [(UIView *)self->_containerView bounds];
  -[PHLivePhotoView setFrame:](self->_livePhotoView, "setFrame:");
  [(PHLivePhotoView *)self->_livePhotoView setAutoresizingMask:18];
  [(PHLivePhotoView *)self->_livePhotoView setUserInteractionEnabled:0];
  [(PHLivePhotoView *)self->_livePhotoView setContentMode:2];
  [(PHLivePhotoView *)self->_livePhotoView setDelegate:self];
  [(PHLivePhotoView *)self->_livePhotoView setHidden:1];
  [(PHLivePhotoView *)self->_livePhotoView setClipsToBounds:1];
  [(PHLivePhotoView *)self->_livePhotoView setShouldApplyTargetReadiness:0];
  uint64_t v7 = [(PULivePhotoVideoOverlayTileViewController *)self mergedVideoProvider];
  double v8 = [v7 livePhotoPlayer];
  [(PHLivePhotoView *)self->_livePhotoView setPlayer:v8];

  double v9 = [(PHLivePhotoView *)self->_livePhotoView player];
  id v10 = [v9 videoPlayer];
  [(PULivePhotoVideoOverlayTileViewController *)self setVideoPlayer:v10];

  char v11 = [(PHLivePhotoView *)self->_livePhotoView player];
  [v11 registerChangeObserver:self context:VideoPlayerChangeContext];

  [(UIView *)self->_containerView addSubview:self->_livePhotoView];
  int v12 = [(PHLivePhotoView *)self->_livePhotoView playbackGestureRecognizer];
  v18[0] = v12;
  int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  playbackGestureRecognizers = self->_playbackGestureRecognizers;
  self->_playbackGestureRecognizers = v13;

  modelTileTransform = self->_modelTileTransform;
  self->_modelTileTransform = 0;

  [(PULivePhotoVideoOverlayTileViewController *)self _updateLivePhotoViewPhoto];
  [(PULivePhotoVideoOverlayTileViewController *)self _updateLivePhotoViewModulatorInput];
  uint64_t v16 = self->_containerView;
  return v16;
}

- (void)dealloc
{
  [(ISWrappedAVPlayer *)self->_videoPlayer removeTimeObserver:self->_videoPlayerTimeObserver];
  v3.receiver = self;
  v3.super_class = (Class)PULivePhotoVideoOverlayTileViewController;
  [(PUTileViewController *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(PULivePhotoVideoOverlayTileViewController *)self _updatePlaybackEnabled];
    id v5 = obj;
  }
}

- (void)setBrowsingViewModel:(id)a3
{
  id v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    uint64_t v7 = v5;
    [(PUBrowsingViewModel *)browsingViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    [(PUBrowsingViewModel *)self->_browsingViewModel registerChangeObserver:self];
    id v5 = v7;
  }
}

- (void)setMergedVideoProvider:(id)a3
{
  id v5 = (PUOneUpMergedVideoProvider *)a3;
  mergedVideoProvider = self->_mergedVideoProvider;
  int v12 = v5;
  if (mergedVideoProvider != v5)
  {
    [(PUOneUpMergedVideoProvider *)mergedVideoProvider unregisterChangeObserver:self context:MergedVideoProviderContext_34611];
    objc_storeStrong((id *)&self->_mergedVideoProvider, a3);
    [(PUOneUpMergedVideoProvider *)self->_mergedVideoProvider registerChangeObserver:self context:MergedVideoProviderContext_34611];
    uint64_t v7 = [(PUOneUpMergedVideoProvider *)v12 livePhotoPlayer];
    double v8 = [(PULivePhotoVideoOverlayTileViewController *)self livePhotoView];
    [v8 setPlayer:v7];

    double v9 = [(PHLivePhotoView *)self->_livePhotoView player];
    id v10 = [v9 videoPlayer];
    [(PULivePhotoVideoOverlayTileViewController *)self setVideoPlayer:v10];

    char v11 = [(PHLivePhotoView *)self->_livePhotoView player];
    [v11 registerChangeObserver:self context:VideoPlayerChangeContext];

    [(PULivePhotoVideoOverlayTileViewController *)self _updateMergedVideo];
  }
}

- (void)setMergedVideo:(id)a3
{
  id v5 = (PUMergedLivePhotosVideo *)a3;
  if (self->_mergedVideo != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_mergedVideo, a3);
    [(PULivePhotoVideoOverlayTileViewController *)self _updateLivePhotoViewModulator];
    [(PULivePhotoVideoOverlayTileViewController *)self _updateSRLCompensation];
    id v5 = v6;
  }
}

+ (OS_dispatch_queue)srlCompensationLoadingQueue
{
  if (srlCompensationLoadingQueue_onceToken != -1) {
    dispatch_once(&srlCompensationLoadingQueue_onceToken, &__block_literal_global_34636);
  }
  v2 = (void *)srlCompensationLoadingQueue_queue;
  return (OS_dispatch_queue *)v2;
}

void __72__PULivePhotoVideoOverlayTileViewController_srlCompensationLoadingQueue__block_invoke()
{
  uint64_t v0 = px_dispatch_queue_create_serial();
  uint64_t v1 = (void *)srlCompensationLoadingQueue_queue;
  srlCompensationLoadingQueue_queue = v0;
}

@end