@interface PUWallpaperPosterController
+ (id)_nonBlockingLoadQueue;
- (AVPlayerItem)observedPlayerItem;
- (BOOL)_animateShuffleTransitionToSleep;
- (BOOL)_shouldAnimateShuffleTransitionToSleep;
- (BOOL)blurredSettlingEffect;
- (BOOL)loopingSettlingEffectForGallery;
- (BOOL)needsFirstLockSignificantEvent;
- (BOOL)needsUpgrade;
- (BOOL)triggerPosterUpgradeIfNecessary;
- (BOOL)wantsLowLuminanceContent;
- (CGAffineTransform)_inactiveTransform;
- (NSDate)lastUpgradeCheckTime;
- (PFPosterConfiguration)posterConfiguration;
- (PFPosterDescriptor)posterDescriptor;
- (PFPosterMedia)currentPosterMedia;
- (PHPhotoLibrary)photoLibrary;
- (PUParallaxLayerStackViewModel)viewModel;
- (PUWallpaperPosterController)initWithRenderer:(id)a3 photoLibrary:(id)a4;
- (PXInvalidatable)renderSessionExtension;
- (PXPosterRenderer)renderer;
- (PXPosterRenderingEnvironment)environment;
- (UIActivityIndicatorView)progressIndicator;
- (UIImageView)posterMediaImageView;
- (UILabel)debugHUDLabel;
- (UIViewPropertyAnimator)alphaAnimator;
- (UIViewPropertyAnimator)transformAnimator;
- (double)nextUpgradeCheckDelay;
- (id)_createViewModelWithLayerStack:(id)a3 style:(id)a4;
- (id)_nameForBacklightLuminance:(int64_t)a3;
- (id)_nextPosterMedia;
- (id)_timelinesForDateInterval:(id)a3;
- (id)posterUpgradeService;
- (int64_t)backlightLuminance;
- (unint64_t)significantEventsCounter;
- (void)_beginExtendedRenderSession;
- (void)_endExtendedRenderSession;
- (void)_handleLowPowerModeChanged;
- (void)_handlePlayerItemDidFinish;
- (void)_handleSegmentationResponse:(id)a3;
- (void)_hidePosterMediaImage;
- (void)_hideProgressIndicator;
- (void)_invalidateCurrentPosterMedia;
- (void)_loadAssetFromWallpaperURL:(id)a3 async:(BOOL)a4 completion:(id)a5;
- (void)_loadAssetWithUUID:(id)a3 usePreviewLayers:(BOOL)a4;
- (void)_loadContentForCurrentPosterMedia:(BOOL)a3;
- (void)_loadContentsFromEnvironment;
- (void)_lowPowerModeChanged:(id)a3;
- (void)_observeCurrentPlayerItem;
- (void)_playInitialSettlingEffect;
- (void)_playSettlingEffect;
- (void)_playerItemDidFinish:(id)a3;
- (void)_registerForNotificationsFromRenderer:(id)a3;
- (void)_removeExistingViews;
- (void)_renderPreviewLayerStackFromWallpaperURL:(id)a3;
- (void)_showPosterMediaImage:(id)a3;
- (void)_showProgressIndicator;
- (void)_startLoopingSettlingEffectForGallery;
- (void)_transitionToBacklightLuminance:(int64_t)a3 previousBacklightLuminance:(int64_t)a4 animated:(BOOL)a5 interruptSettlingEffectPlayback:(BOOL)a6;
- (void)_unregisterForNotificationsFromRenderer:(id)a3;
- (void)_updateBacklightLuminance;
- (void)_updateContainerFrame;
- (void)_updateCurrentPosterMedia;
- (void)_updateDebugHUD;
- (void)_updateDeviceOrientation;
- (void)_updatePreferences;
- (void)_updateSignificantEvents;
- (void)_updateViewHierarchy;
- (void)_updateWithFrameSpecifier:(id)a3;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
- (void)setAlphaAnimator:(id)a3;
- (void)setBacklightLuminance:(int64_t)a3;
- (void)setCurrentPosterMedia:(id)a3;
- (void)setDebugHUDLabel:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setLastUpgradeCheckTime:(id)a3;
- (void)setLoopingSettlingEffectForGallery:(BOOL)a3;
- (void)setNeedsFirstLockSignificantEvent:(BOOL)a3;
- (void)setNeedsUpgrade:(BOOL)a3;
- (void)setNextUpgradeCheckDelay:(double)a3;
- (void)setObservedPlayerItem:(id)a3;
- (void)setPosterConfiguration:(id)a3;
- (void)setPosterDescriptor:(id)a3;
- (void)setPosterMediaImageView:(id)a3;
- (void)setProgressIndicator:(id)a3;
- (void)setRenderSessionExtension:(id)a3;
- (void)setSignificantEventsCounter:(unint64_t)a3;
- (void)setTransformAnimator:(id)a3;
- (void)setViewModel:(id)a3;
- (void)triggerPosterUpgrade;
@end

@implementation PUWallpaperPosterController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderSessionExtension, 0);
  objc_storeStrong((id *)&self->_observedPlayerItem, 0);
  objc_storeStrong((id *)&self->_debugHUDLabel, 0);
  objc_storeStrong((id *)&self->_lastUpgradeCheckTime, 0);
  objc_storeStrong((id *)&self->_alphaAnimator, 0);
  objc_storeStrong((id *)&self->_transformAnimator, 0);
  objc_storeStrong((id *)&self->_posterMediaImageView, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_currentPosterMedia, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_posterDescriptor, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_wallpaperService, 0);
}

- (void)setLoopingSettlingEffectForGallery:(BOOL)a3
{
  self->_loopingSettlingEffectForGallery = a3;
}

- (BOOL)loopingSettlingEffectForGallery
{
  return self->_loopingSettlingEffectForGallery;
}

- (void)setRenderSessionExtension:(id)a3
{
}

- (PXInvalidatable)renderSessionExtension
{
  return self->_renderSessionExtension;
}

- (void)setObservedPlayerItem:(id)a3
{
}

- (AVPlayerItem)observedPlayerItem
{
  return self->_observedPlayerItem;
}

- (void)setDebugHUDLabel:(id)a3
{
}

- (UILabel)debugHUDLabel
{
  return self->_debugHUDLabel;
}

- (void)setNextUpgradeCheckDelay:(double)a3
{
  self->_nextUpgradeCheckDelay = a3;
}

- (double)nextUpgradeCheckDelay
{
  return self->_nextUpgradeCheckDelay;
}

- (void)setLastUpgradeCheckTime:(id)a3
{
}

- (NSDate)lastUpgradeCheckTime
{
  return self->_lastUpgradeCheckTime;
}

- (void)setNeedsUpgrade:(BOOL)a3
{
  self->_needsUpgrade = a3;
}

- (BOOL)needsUpgrade
{
  return self->_needsUpgrade;
}

- (void)setAlphaAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)alphaAnimator
{
  return self->_alphaAnimator;
}

- (void)setTransformAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)transformAnimator
{
  return self->_transformAnimator;
}

- (int64_t)backlightLuminance
{
  return self->_backlightLuminance;
}

- (void)setPosterMediaImageView:(id)a3
{
}

- (UIImageView)posterMediaImageView
{
  return self->_posterMediaImageView;
}

- (void)setProgressIndicator:(id)a3
{
}

- (UIActivityIndicatorView)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setNeedsFirstLockSignificantEvent:(BOOL)a3
{
  self->_needsFirstLockSignificantEvent = a3;
}

- (BOOL)needsFirstLockSignificantEvent
{
  return self->_needsFirstLockSignificantEvent;
}

- (PFPosterMedia)currentPosterMedia
{
  return self->_currentPosterMedia;
}

- (PFPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (PFPosterDescriptor)posterDescriptor
{
  return self->_posterDescriptor;
}

- (PXPosterRenderingEnvironment)environment
{
  return self->_environment;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXPosterRenderer)renderer
{
  return self->_renderer;
}

- (PUParallaxLayerStackViewModel)viewModel
{
  return self->_viewModel;
}

- (void)_updateDebugHUD
{
  v22[3] = *MEMORY[0x1E4F143B8];
  v3 = [(PUWallpaperPosterController *)self posterConfiguration];
  uint64_t v4 = [v3 posterType];

  if (v4 == 2)
  {
    v5 = [(PUWallpaperPosterController *)self posterConfiguration];
    v6 = [v5 media];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v8 = [(PUWallpaperPosterController *)self significantEventsCounter];
    if (v8 < [(PUWallpaperPosterController *)self significantEventsCounter] + 30)
    {
      uint64_t v9 = 0;
      do
      {
        v10 = [NSString stringWithFormat:@"%ld, ", +[PUPosterUtilities mediaIndexWithSeed:mediaCount:](PUPosterUtilities, "mediaIndexWithSeed:mediaCount:", v8, objc_msgSend(v6, "count"))];
        [v7 addObject:v10];

        if (v9 == [v6 count])
        {
          [v7 addObject:@"\n"];
          uint64_t v9 = 0;
        }
        ++v9;
        ++v8;
      }
      while (v8 < [(PUWallpaperPosterController *)self significantEventsCounter] + 30);
    }
    int64_t v11 = +[PUPosterUtilities mediaIndexWithSeed:mediaCount:](PUPosterUtilities, "mediaIndexWithSeed:mediaCount:", -[PUWallpaperPosterController significantEventsCounter](self, "significantEventsCounter"), [v6 count]);
    v20 = [(PUWallpaperPosterController *)self viewModel];
    v12 = [v20 viewManager];
    v13 = [v12 debugInfoView];
    v21[0] = @"Signif. event counter";
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PUWallpaperPosterController significantEventsCounter](self, "significantEventsCounter"));
    v15 = [v14 description];
    v22[0] = v15;
    v21[1] = @"Media index";
    v16 = [NSNumber numberWithInteger:v11];
    v17 = [v16 description];
    v22[1] = v17;
    v21[2] = @"Media queue";
    v18 = [v7 componentsJoinedByString:&stru_1F06BE7B8];
    v22[2] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    [v13 displayAdditionalDebugInfo:v19];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(PUWallpaperPosterController *)self observedPlayerItem];
  v14 = (void *)v13;
  if ((void *)BackgroundViewObservationContext_46628 == a6)
  {
    [(PUWallpaperPosterController *)self _updateContainerFrame];
  }
  else if ((void *)PlayerItemObservationContext_46629 == a6)
  {
    if ((id)v13 == v11)
    {
      uint64_t v15 = [v11 status];
      if (v15 == 1)
      {
        v18 = [MEMORY[0x1E4F8A2C0] globalSettings];
        int v19 = [v18 disableMADForSettlingEffect];

        if (v19)
        {
          if (v11) {
            [v11 duration];
          }
          else {
            memset(&time, 0, sizeof(time));
          }
          CMTimeMultiplyByFloat64(&v23, &time, 0.5);
          CMTime v21 = v23;
          [v11 setForwardPlaybackEndTime:&v21];
        }
        [(PUWallpaperPosterController *)self _startLoopingSettlingEffectForGallery];
      }
      else if (v15 == 2)
      {
        v16 = PLWallpaperGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = [v11 error];
          *(_DWORD *)buf = 138412290;
          v25 = v17;
          _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_ERROR, "Settling effect video failed to load: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)PUWallpaperPosterController;
    [(PUWallpaperPosterController *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v9 = a3;
  if (a5 == "ViewModelObservationContext")
  {
    id v17 = v9;
    id v10 = v9;
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_4;
      }
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v15 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v15);
      v16 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
      [v12 handleFailureInMethod:a2, self, @"PUWallpaperPosterController.m", 1907, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v14, v16 object file lineNumber description];
    }
    else
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      [v12 handleFailureInMethod:a2, self, @"PUWallpaperPosterController.m", 1907, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v14 object file lineNumber description];
    }

LABEL_4:
    char v11 = [v10 currentLayerStackPropertiesChange];
    if ((*(void *)&v6 & 0x80002) != 0)
    {
      [(PUWallpaperPosterController *)self _removeExistingViews];
      [(PUWallpaperPosterController *)self _updateViewHierarchy];
    }
    if (v6 & 0x1000 | (unint64_t)(v11 & 5))
    {
      [(PUWallpaperPosterController *)self _updateViewHierarchy];
      if ((v6 & 0x80) == 0)
      {
LABEL_8:
        if ((v6 & 0x200000) == 0)
        {
LABEL_10:

          id v9 = v17;
          goto LABEL_11;
        }
LABEL_9:
        [(PUWallpaperPosterController *)self _startLoopingSettlingEffectForGallery];
        goto LABEL_10;
      }
    }
    else if ((v6 & 0x80) == 0)
    {
      goto LABEL_8;
    }
    [(PUWallpaperPosterController *)self _updateBacklightLuminance];
    if ((v6 & 0x200000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_11:
}

- (void)_unregisterForNotificationsFromRenderer:(id)a3
{
  id v4 = a3;
  v5 = [v4 backgroundView];
  [v5 removeObserver:self forKeyPath:@"layer.bounds" context:&BackgroundViewObservationContext_46628];

  int v6 = [v4 backgroundView];

  id v7 = [v6 window];
  unint64_t v8 = [v7 windowScene];
  id v9 = [v8 _alwaysOnEnvironment];
  [v9 removeObserver:self];

  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:self name:*MEMORY[0x1E4FB2708] object:0];
}

- (void)_registerForNotificationsFromRenderer:(id)a3
{
  id v4 = a3;
  v5 = [v4 backgroundView];
  [v5 addObserver:self forKeyPath:@"layer.bounds" options:0 context:&BackgroundViewObservationContext_46628];

  int v6 = [v4 backgroundView];

  id v7 = [v6 window];
  unint64_t v8 = [v7 windowScene];
  id v9 = [v8 _alwaysOnEnvironment];
  [v9 addObserver:self];

  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel__updateSignificantEvents name:*MEMORY[0x1E4FB2708] object:0];
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = PLWallpaperGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_INFO, "renderer invalidate", v6, 2u);
  }

  [(PUWallpaperPosterController *)self _unregisterForNotificationsFromRenderer:v4];
  PFSharedFigDecodeSessionDiscardCachedBuffers();
  [(PUWallpaperPosterController *)self setEnvironment:0];
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
}

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = PLWallpaperGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)char v11 = 0;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_INFO, "renderer initialize", v11, 2u);
  }

  [(PUWallpaperPosterController *)self _registerForNotificationsFromRenderer:v7];
  [(PUWallpaperPosterController *)self setEnvironment:v6];
  id v9 = [(PUWallpaperPosterController *)self viewModel];
  int v10 = [v9 settlingEffectEnabled];

  if (v10 && (objc_msgSend(v6, "px_isSnapshot") & 1) == 0 && (objc_msgSend(v6, "px_isPreview") & 1) == 0) {
    [(PUWallpaperPosterController *)self _playInitialSettlingEffect];
  }
}

- (void)_endExtendedRenderSession
{
  v3 = [(PUWallpaperPosterController *)self renderSessionExtension];

  if (v3)
  {
    id v4 = PLWallpaperGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_INFO, "Ending extended render session", v6, 2u);
    }
  }
  v5 = [(PUWallpaperPosterController *)self renderSessionExtension];
  objc_msgSend(v5, "px_invalidate");

  [(PUWallpaperPosterController *)self setRenderSessionExtension:0];
}

- (void)_beginExtendedRenderSession
{
  [(PUWallpaperPosterController *)self _endExtendedRenderSession];
  v3 = PLWallpaperGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_INFO, "Beginning extended render session", v6, 2u);
  }

  id v4 = [(PUWallpaperPosterController *)self renderer];
  v5 = objc_msgSend(v4, "px_extendRenderSessionForReason:", @"PhotosSettlingEffect");
  [(PUWallpaperPosterController *)self setRenderSessionExtension:v5];
}

- (void)_observeCurrentPlayerItem
{
  id v11 = [(PUWallpaperPosterController *)self observedPlayerItem];
  v3 = [(PUWallpaperPosterController *)self viewModel];
  id v4 = [v3 viewManager];
  v5 = [v4 videoLayerView];
  id v6 = [v5 player];
  id v7 = [v6 currentItem];

  if (v11 != v7)
  {
    unint64_t v8 = (void *)MEMORY[0x1E4F16020];
    if (v11)
    {
      id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 removeObserver:self name:*v8 object:v11];

      [v11 removeObserver:self forKeyPath:@"status" context:&PlayerItemObservationContext_46629];
    }
    if (v7)
    {
      int v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:self selector:sel__playerItemDidFinish_ name:*v8 object:v7];

      [v7 addObserver:self forKeyPath:@"status" options:0 context:&PlayerItemObservationContext_46629];
    }
    [(PUWallpaperPosterController *)self setObservedPlayerItem:v7];
  }
}

- (void)_handlePlayerItemDidFinish
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = PLWallpaperGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(PUWallpaperPosterController *)self _nameForBacklightLuminance:[(PUWallpaperPosterController *)self backlightLuminance]];
    *(_DWORD *)buf = 138412290;
    v44 = v4;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_INFO, "Finished playing settling effect with backlight luminance: %@", buf, 0xCu);
  }
  if ([(PUWallpaperPosterController *)self backlightLuminance] == 2)
  {
    v5 = [(PUWallpaperPosterController *)self renderer];
    id v6 = [v5 backgroundView];
    id v7 = [(PUWallpaperPosterController *)self viewModel];
    unint64_t v8 = [v7 viewManager];
    v29 = v7;
    id v9 = [v7 currentLayerStack];
    int v10 = [v9 backgroundLayer];
    id v11 = [v8 viewForLayer:v10];

    v28 = v9;
    id v12 = [v9 foregroundLayer];
    uint64_t v13 = [v8 viewForLayer:v12];

    v14 = [v8 videoLayerView];
    uint64_t v15 = [v14 player];
    if ([(PUWallpaperPosterController *)self loopingSettlingEffectForGallery])
    {
      [v15 pause];
      v16 = [v14 snapshotViewAfterScreenUpdates:0];
      [v14 bounds];
      objc_msgSend(v16, "setBounds:");
      [v14 center];
      objc_msgSend(v16, "setCenter:");
      if (v14)
      {
        [v14 transform];
      }
      else
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v40 = 0u;
      }
      v39[0] = v40;
      v39[1] = v41;
      v39[2] = v42;
      [v16 setTransform:v39];
      [v6 addSubview:v16];
      CMTime v23 = v6;
      dispatch_time_t v25 = dispatch_time(0, 50000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke;
      block[3] = &unk_1E5F2ECC8;
      v37 = v15;
      id v38 = v16;
      id v19 = v15;
      id v18 = v16;
      dispatch_after(v25, MEMORY[0x1E4F14428], block);

      v22 = v37;
    }
    else
    {
      id v17 = [(PUWallpaperPosterController *)self renderer];
      id v18 = [v17 backgroundView];

      [v18 insertSubview:v14 belowSubview:v11];
      id v19 = (id)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:0];
      uint64_t v26 = v6;
      id v20 = objc_alloc(MEMORY[0x1E4FB1ED8]);
      [(PUWallpaperPosterController *)self renderer];
      CMTime v21 = v27 = v5;
      objc_msgSend(v21, "px_lowLuminanceAlphaAnimationDuration");
      v22 = objc_msgSend(v20, "initWithDuration:timingParameters:", v19);

      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_4;
      v33[3] = &unk_1E5F2ECC8;
      id v34 = v11;
      id v35 = v13;
      [v22 addAnimations:v33];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_5;
      v30[3] = &unk_1E5F27BC8;
      id v31 = v15;
      v32 = self;
      CMTime v23 = v26;
      id v24 = v15;
      [v22 addCompletion:v30];
      [v22 startAnimation];

      v5 = v27;
    }
  }
}

void __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v9 = *MEMORY[0x1E4F1FA48];
  uint64_t v10 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v2 seekToTime:&v9];
  v3 = (void *)MEMORY[0x1E4FB1EB0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_2;
  v7[3] = &unk_1E5F2ED10;
  id v8 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_3;
  v4[3] = &unk_1E5F2E1C0;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  [v3 animateWithDuration:v7 animations:v4 completion:0.3];
}

uint64_t __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

uint64_t __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    v3 = *(void **)(a1 + 32);
    long long v5 = *MEMORY[0x1E4F1FA48];
    uint64_t v6 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [v3 seekToTime:&v5];
    [*(id *)(a1 + 32) pause];
  }
  return [*(id *)(a1 + 40) _endExtendedRenderSession];
}

uint64_t __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(void **)(a1 + 40);
  return [v2 play];
}

- (void)_playerItemDidFinish:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__PUWallpaperPosterController__playerItemDidFinish___block_invoke;
  v3[3] = &unk_1E5F2E530;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __52__PUWallpaperPosterController__playerItemDidFinish___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePlayerItemDidFinish];
}

- (void)_handleLowPowerModeChanged
{
  id v4 = [(PUWallpaperPosterController *)self viewModel];
  if ([v4 settlingEffectEnabled])
  {
    if ([v4 canCreateSettlingEffectLayerView])
    {
      [(PUWallpaperPosterController *)self _updateViewHierarchy];
    }
    else
    {
      v3 = [v4 viewManager];
      [v3 releaseVideoLayerView];

      [(PUWallpaperPosterController *)self _observeCurrentPlayerItem];
    }
  }
}

- (void)_lowPowerModeChanged:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__PUWallpaperPosterController__lowPowerModeChanged___block_invoke;
  v3[3] = &unk_1E5F2E530;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __52__PUWallpaperPosterController__lowPowerModeChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleLowPowerModeChanged];
}

- (void)_startLoopingSettlingEffectForGallery
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [(PUWallpaperPosterController *)self viewModel];
  int v4 = [v3 shouldLoopSettlingEffectForGallery];

  if (v4)
  {
    long long v5 = [(PUWallpaperPosterController *)self viewModel];
    uint64_t v6 = [v5 viewManager];
    id v7 = [v5 currentLayerStack];
    id v8 = [v7 foregroundLayer];
    long long v9 = [v6 viewForLayer:v8];

    uint64_t v10 = [v7 backgroundLayer];
    id v11 = [v6 viewForLayer:v10];

    id v12 = [v6 videoLayerView];
    uint64_t v13 = [v6 videoLayerView];
    v14 = [v13 player];

    if (v12)
    {
      [(PUWallpaperPosterController *)self _observeCurrentPlayerItem];
      uint64_t v15 = [v14 status];
      if (v15 == 1
        && ![(PUWallpaperPosterController *)self loopingSettlingEffectForGallery])
      {
        dispatch_time_t v25 = v9;
        CMTime v21 = PLWallpaperGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_INFO, "Started looping settling effect in gallery", buf, 2u);
        }

        [(PUWallpaperPosterController *)self setLoopingSettlingEffectForGallery:1];
        [(PUWallpaperPosterController *)self _updateViewHierarchy];
        [v14 pause];
        *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
        *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        [v14 seekToTime:buf];
        v16 = [objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:0];
        id v22 = objc_alloc(MEMORY[0x1E4FB1ED8]);
        CMTime v23 = [(PUWallpaperPosterController *)self renderer];
        objc_msgSend(v23, "px_lowLuminanceAlphaAnimationDuration");
        id v24 = objc_msgSend(v22, "initWithDuration:timingParameters:", v16);

        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __68__PUWallpaperPosterController__startLoopingSettlingEffectForGallery__block_invoke;
        v28[3] = &unk_1E5F2ECC8;
        id v29 = v11;
        long long v9 = v25;
        id v30 = v25;
        [v24 addAnimations:v28];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __68__PUWallpaperPosterController__startLoopingSettlingEffectForGallery__block_invoke_2;
        v26[3] = &unk_1E5F27BA0;
        id v27 = v14;
        [v24 addCompletion:v26];
        [v24 startAnimation];

        goto LABEL_13;
      }
      v16 = PLWallpaperGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v15;
        id v17 = "Looping settling effect in gallery failed with invalid player status: %ld";
        id v18 = v16;
        os_log_type_t v19 = OS_LOG_TYPE_INFO;
        uint32_t v20 = 12;
LABEL_9:
        _os_log_impl(&dword_1AE9F8000, v18, v19, v17, buf, v20);
      }
    }
    else
    {
      v16 = PLWallpaperGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v7;
        id v17 = "Failed to start looping settling effect in gallery: video layer: %@, layer stack: %@";
        id v18 = v16;
        os_log_type_t v19 = OS_LOG_TYPE_ERROR;
        uint32_t v20 = 22;
        goto LABEL_9;
      }
    }
LABEL_13:
  }
}

uint64_t __68__PUWallpaperPosterController__startLoopingSettlingEffectForGallery__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __68__PUWallpaperPosterController__startLoopingSettlingEffectForGallery__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) play];
}

- (void)_playInitialSettlingEffect
{
  v3 = [(PUWallpaperPosterController *)self viewModel];
  int v4 = [v3 viewManager];
  long long v5 = [v4 videoLayerView];
  uint64_t v6 = [(PUWallpaperPosterController *)self renderer];
  id v7 = [v6 backgroundView];

  [v7 bringSubviewToFront:v5];
  [v5 setAlpha:0.0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:0];
  long long v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:v8 timingParameters:0.2];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PUWallpaperPosterController__playInitialSettlingEffect__block_invoke;
  v12[3] = &unk_1E5F2ED10;
  id v13 = v5;
  id v10 = v5;
  [v9 addAnimations:v12];
  [v9 startAnimation];
  [(PUWallpaperPosterController *)self _observeCurrentPlayerItem];
  [(PUWallpaperPosterController *)self _beginExtendedRenderSession];
  id v11 = [v10 player];
  [v11 play];
}

uint64_t __57__PUWallpaperPosterController__playInitialSettlingEffect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_playSettlingEffect
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(PUWallpaperPosterController *)self viewModel];
  int v4 = [v3 viewManager];
  long long v5 = [v3 currentLayerStack];
  uint64_t v6 = [v5 backgroundLayer];
  id v7 = [v4 viewForLayer:v6];

  id v8 = [v5 foregroundLayer];
  long long v9 = [v4 viewForLayer:v8];

  id v10 = [v4 videoLayerView];
  if (v10)
  {
    [(PUWallpaperPosterController *)self _observeCurrentPlayerItem];
    [(PUWallpaperPosterController *)self _beginExtendedRenderSession];
    id v11 = PLWallpaperGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [(PUWallpaperPosterController *)self _nameForBacklightLuminance:[(PUWallpaperPosterController *)self backlightLuminance]];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_INFO, "Beginning settling effect with backlight luminance: %@", buf, 0xCu);
    }
    [v7 setAlpha:0.0];
    [v9 setAlpha:0.0];
    if ([(PUWallpaperPosterController *)self blurredSettlingEffect])
    {
      [v10 setAlpha:1.0];
      id v13 = [v10 player];
      *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
      *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      [v13 seekToTime:buf];

      v14 = [v10 player];
      [v14 play];
    }
    else
    {
      uint64_t v15 = [v10 player];
      [v15 pause];

      v16 = [v10 player];
      *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
      *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      [v16 seekToTime:buf];

      id v17 = [(PUWallpaperPosterController *)self alphaAnimator];
      [v17 stopAnimation:1];

      v14 = [objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:0];
      id v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:v14 timingParameters:0.2];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __50__PUWallpaperPosterController__playSettlingEffect__block_invoke;
      v25[3] = &unk_1E5F2ED10;
      id v19 = v10;
      id v26 = v19;
      [v18 addAnimations:v25];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      id v22 = __50__PUWallpaperPosterController__playSettlingEffect__block_invoke_2;
      CMTime v23 = &unk_1E5F27BA0;
      id v24 = v19;
      [v18 addCompletion:&v20];
      objc_msgSend(v18, "startAnimation", v20, v21, v22, v23);
      [(PUWallpaperPosterController *)self setAlphaAnimator:v18];
    }
  }
  else
  {
    v14 = PLWallpaperGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_ERROR, "Unable to play settling effect: video layer: %@, layer stack: %@", buf, 0x16u);
    }
  }
}

uint64_t __50__PUWallpaperPosterController__playSettlingEffect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __50__PUWallpaperPosterController__playSettlingEffect__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) player];
  [v1 play];
}

- (BOOL)blurredSettlingEffect
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PU_UNBLURRED_SETTLING_EFFECT"];

  return v3 ^ 1;
}

- (void)_updatePreferences
{
  char v3 = [(PUWallpaperPosterController *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PUWallpaperPosterController__updatePreferences__block_invoke;
  v4[3] = &unk_1E5F2E420;
  void v4[4] = self;
  [v3 performChanges:v4];
}

void __49__PUWallpaperPosterController__updatePreferences__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  char v3 = [*(id *)(a1 + 32) environment];
  if (objc_msgSend(v3, "px_isSnapshot")) {
    uint64_t Bool = 0;
  }
  else {
    uint64_t Bool = PXPreferencesGetBool();
  }
  [v5 setShowsDebugHUD:Bool];
}

- (id)_nameForBacklightLuminance:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 3) {
    return @"Full";
  }
  else {
    return off_1E5F27BE8[a3 + 1];
  }
}

- (void)_hidePosterMediaImage
{
  id v4 = [(PUWallpaperPosterController *)self posterMediaImageView];
  [(PUWallpaperPosterController *)self setPosterMediaImageView:0];
  char v3 = v4;
  if (v4)
  {
    [v4 removeFromSuperview];
    char v3 = v4;
  }
}

- (void)_showPosterMediaImage:(id)a3
{
  id v10 = a3;
  id v4 = [(PUWallpaperPosterController *)self posterMediaImageView];
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [v4 setContentMode:2];
    id v5 = [(PUWallpaperPosterController *)self renderer];
    uint64_t v6 = [v5 backgroundView];

    [v6 bounds];
    objc_msgSend(v4, "setFrame:");
    [v4 setAutoresizingMask:18];
    [v6 addSubview:v4];
    [(PUWallpaperPosterController *)self setPosterMediaImageView:v4];
  }
  id v7 = (void *)MEMORY[0x1E4FB1818];
  id v8 = [v10 imageName];
  long long v9 = [v7 imageNamed:v8];

  [v4 setImage:v9];
}

- (id)_createViewModelWithLayerStack:(id)a3 style:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUWallpaperPosterController *)self posterConfiguration];
  if ([v8 configurationType] == 1)
  {
    long long v9 = [v8 shuffleConfiguration];
    uint64_t v10 = [v9 shuffleType];

    if (v10 != 1)
    {
      id v11 = [v8 editConfiguration];
      uint64_t v12 = objc_msgSend(v6, "compoundLayerStackByUpdatingPortraitDepthEnabled:landscapeDepthEnabled:", objc_msgSend(v11, "isDepthEnabled"), objc_msgSend(v11, "isLandscapeDepthEnabled"));

      id v6 = (id)v12;
    }
  }
  uint64_t v13 = [(PXPosterRenderingEnvironment *)self->_environment px_boundingShape];
  if ([(PXPosterRenderingEnvironment *)self->_environment px_isCallServices]
    && v13 == 2)
  {
    v14 = [v6 layout];
    uint64_t v15 = [v14 portraitLayout];

    v16 = [v8 userInfo];
    [v15 visibleFrame];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    [v15 imageSize];
    double v26 = v25;
    [v15 imageSize];
    +[PUWallpaperPosterFaceCropUtilities getSquareCropForVisibleFrame:layerStack:userInfo:originalImage:](PUWallpaperPosterFaceCropUtilities, "getSquareCropForVisibleFrame:layerStack:userInfo:originalImage:", v6, v16, v18, v20, v22, v24, 0.0, 0.0, v26, v27);
    uint64_t v28 = objc_msgSend(v15, "layoutByUpdatingVisibleFrame:");

    id v29 = [v28 layoutByUpdatingClockLayerOrder:*MEMORY[0x1E4F8D098]];

    id v30 = [v6 portraitLayerStack];
    id v31 = [v30 layerStackByUpdatingLayout:v29];

    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F8CE50]) initWithPortraitLayerStack:v31 landscapeLayerStack:0];
    id v6 = (id)v32;
  }
  else
  {
    if ([(PXPosterRenderingEnvironment *)self->_environment px_isCallServices])
    {
      [(PXPosterRenderingEnvironment *)self->_environment px_titleBoundsForLayout:0];
      v33 = objc_msgSend(MEMORY[0x1E4F8CE48], "deviceCallServicesConfigurationWithTitleBounds:");
      id v34 = [v33 portraitConfiguration];

      id v35 = [v6 layout];
      v36 = [v35 portraitLayout];

      v37 = [v36 configuration];
      if (([v37 isEqualToLayoutConfiguration:v34] & 1) == 0)
      {
        uint64_t v38 = [v36 layoutByConformingGenericConfigurationToDevice:v34];

        v39 = [v6 portraitLayerStack];
        long long v40 = [v39 layerStackByUpdatingLayout:v38];

        uint64_t v41 = [objc_alloc(MEMORY[0x1E4F8CE50]) initWithPortraitLayerStack:v40 landscapeLayerStack:0];
        v36 = (void *)v38;
        id v6 = (id)v41;
      }
    }
    else
    {
      id v34 = [MEMORY[0x1E4F8CCB0] deviceConfigurationForOrientation:1];
      long long v42 = [v6 layout];
      v43 = [v42 portraitLayout];

      v44 = [v43 configuration];
      if (([v44 isEqualToLayoutConfiguration:v34] & 1) == 0)
      {
        v60 = v44;
        uint64_t v45 = PLWallpaperGetLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE9F8000, v45, OS_LOG_TYPE_DEFAULT, "Layout configuration mismatch detected, updating layout for current device", buf, 2u);
        }

        uint64_t v46 = [v43 layoutByUpdatingConfiguration:v34];

        v59 = [MEMORY[0x1E4F8CCB0] deviceConfigurationForOrientation:2];
        v47 = [v6 layout];
        v48 = [v47 landscapeLayout];
        v49 = [v48 layoutByUpdatingConfiguration:v59];

        v50 = [v6 portraitLayerStack];
        v51 = [v50 layerStackByUpdatingLayout:v46];

        v52 = [v6 landscapeLayerStack];
        v53 = [v52 layerStackByUpdatingLayout:v49];

        uint64_t v54 = [objc_alloc(MEMORY[0x1E4F8CE50]) initWithPortraitLayerStack:v51 landscapeLayerStack:v53];
        v43 = (void *)v46;
        id v6 = (id)v54;
        v44 = v60;
      }
    }
  }
  v55 = [PUParallaxLayerStackViewModel alloc];
  v56 = [(PUWallpaperPosterController *)self environment];
  v57 = -[PUParallaxLayerStackViewModel initWithCompoundLayerStack:style:deviceOrientation:](v55, "initWithCompoundLayerStack:style:deviceOrientation:", v6, v7, objc_msgSend(v56, "px_deviceOrientation"));

  return v57;
}

- (void)_handleSegmentationResponse:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  id v4 = [a3 result:&v13];
  id v5 = v13;
  if (!v4)
  {
    long long v9 = PLWallpaperGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Failed to obtain segmentation result, error: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  id v6 = [v4 compoundLayerStack];
  id v7 = [(PUWallpaperPosterController *)self _createViewModelWithLayerStack:v6 style:0];
  [(PUWallpaperPosterController *)self setViewModel:v7];

  id v8 = [(PUWallpaperPosterController *)self viewModel];
  LODWORD(v7) = [v8 settlingEffectEnabled];

  if (v7)
  {
    long long v9 = [(PUWallpaperPosterController *)self environment];
    if (([v9 px_isPlayground] & 1) == 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    uint64_t v10 = [(PUWallpaperPosterController *)self environment];
    if (objc_msgSend(v10, "px_isSnapshot"))
    {

      goto LABEL_8;
    }
    id v11 = [(PUWallpaperPosterController *)self environment];
    char v12 = objc_msgSend(v11, "px_isPreview");

    if ((v12 & 1) == 0) {
      [(PUWallpaperPosterController *)self _playInitialSettlingEffect];
    }
  }
LABEL_9:
  [(PUWallpaperPosterController *)self _hideProgressIndicator];
}

- (void)_loadAssetWithUUID:(id)a3 usePreviewLayers:(BOOL)a4
{
  BOOL v4 = a4;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(PUWallpaperPosterController *)self wantsLowLuminanceContent];
  uint64_t v8 = 8;
  if (v4) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = 65;
  }
  if (v4)
  {
    uint64_t v10 = 128;
  }
  else
  {
    uint64_t v8 = 69;
    uint64_t v10 = 32;
  }
  if (v7) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = v9;
  }
  if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration]) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = (void *)MEMORY[0x1E4F38EB8];
  v34[0] = v6;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  id v15 = [(PUWallpaperPosterController *)self photoLibrary];
  uint64_t v16 = [v15 librarySpecificFetchOptions];
  double v17 = [v13 fetchAssetsWithUUIDs:v14 options:v16];
  double v18 = [v17 firstObject];

  if (v18)
  {
    double v19 = (void *)[objc_alloc(MEMORY[0x1E4F39358]) initWithPhotoAsset:v18];
    double v20 = dispatch_group_create();
    dispatch_group_enter(v20);
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy__46698;
    uint64_t v32 = __Block_byref_object_dispose__46699;
    id v33 = 0;
    double v21 = (void *)[objc_alloc(MEMORY[0x1E4F8A390]) initWithParallaxAsset:v19];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __67__PUWallpaperPosterController__loadAssetWithUUID_usePreviewLayers___block_invoke;
    v24[3] = &unk_1E5F27B70;
    double v26 = &v28;
    uint64_t v27 = v12 | v11;
    double v22 = v20;
    double v25 = v22;
    [v21 loadSegmentationItemWithCompletion:v24];
    dispatch_time_t v23 = dispatch_time(0, 15000000000);
    dispatch_group_wait(v22, v23);
    [(PUWallpaperPosterController *)self _handleSegmentationResponse:v29[5]];

    _Block_object_dispose(&v28, 8);
  }
}

void __67__PUWallpaperPosterController__loadAssetWithUUID_usePreviewLayers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    BOOL v7 = [objc_alloc(MEMORY[0x1E4F8A318]) initWithSegmentationItem:v5];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:0];
    [v7 setPriority:v8];

    [v7 setLayerStackOptions:*(void *)(a1 + 48)];
    -[NSObject setSettlingEffectEnabled:](v7, "setSettlingEffectEnabled:", [v5 isSettlingEffectAvailable]);
    if ([v7 isSettlingEffectEnabled]) {
      [v7 setLayerStackOptions:[v7 layerStackOptions] | 0x40];
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__PUWallpaperPosterController__loadAssetWithUUID_usePreviewLayers___block_invoke_2;
    v11[3] = &unk_1E5F2B268;
    long long v10 = *(_OWORD *)(a1 + 32);
    id v9 = (id)v10;
    long long v12 = v10;
    [v7 submit:v11];
  }
  else
  {
    BOOL v7 = PLWallpaperGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Failed to load PHAsset, error: %@", buf, 0xCu);
    }
  }
}

void __67__PUWallpaperPosterController__loadAssetWithUUID_usePreviewLayers___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_loadAssetFromWallpaperURL:(id)a3 async:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v10 = PLWallpaperGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v8;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_INFO, "Attempt to load wallpaper from poster url: %{public}@", buf, 0xCu);
  }

  if ([(PXPosterRenderingEnvironment *)self->_environment px_isPreview])
  {
    if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration]) {
      uint64_t v11 = 136;
    }
    else {
      uint64_t v11 = 8;
    }
    if (![(PXPosterRenderingEnvironment *)self->_environment px_isSnapshot]) {
      v11 |= 0x40uLL;
    }
  }
  else
  {
    if ([(PUWallpaperPosterController *)self wantsLowLuminanceContent]) {
      uint64_t v12 = 5;
    }
    else {
      uint64_t v12 = 1;
    }
    if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration]) {
      uint64_t v13 = v12 | 0x22;
    }
    else {
      uint64_t v13 = v12;
    }
    id v14 = [(PUWallpaperPosterController *)self posterConfiguration];
    uint64_t v15 = [v14 editConfiguration];
    int v16 = [v15 isSettlingEffectEnabled];

    if (v16) {
      uint64_t v11 = v13 | 0x40;
    }
    else {
      uint64_t v11 = v13;
    }
  }
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PUWallpaperPosterController__loadAssetFromWallpaperURL_async_completion___block_invoke;
  aBlock[3] = &unk_1E5F27B48;
  id v17 = v8;
  id v23 = v17;
  v25[1] = (id)v11;
  objc_copyWeak(v25, (id *)buf);
  id v18 = v9;
  id v24 = v18;
  BOOL v26 = v6;
  double v19 = _Block_copy(aBlock);
  double v20 = v19;
  if (v6)
  {
    double v21 = [(id)objc_opt_class() _nonBlockingLoadQueue];
    dispatch_async(v21, v20);
  }
  else
  {
    (*((void (**)(void *))v19 + 2))(v19);
  }

  objc_destroyWeak(v25);
  objc_destroyWeak((id *)buf);
}

void __75__PUWallpaperPosterController__loadAssetFromWallpaperURL_async_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  id v18 = 0;
  id v4 = [MEMORY[0x1E4F8A390] loadCompoundLayerStackFromWallpaperURL:v2 options:v3 error:&v18];
  id v5 = v18;
  BOOL v6 = [MEMORY[0x1E4F8A390] loadStyleFromWallpaperURL:*(void *)(a1 + 32) error:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PUWallpaperPosterController__loadAssetFromWallpaperURL_async_completion___block_invoke_2;
  v12[3] = &unk_1E5F27B20;
  id v7 = v4;
  id v13 = v7;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v8 = v6;
  id v14 = v8;
  id v16 = *(id *)(a1 + 40);
  id v9 = v5;
  id v15 = v9;
  long long v10 = (void (**)(void))_Block_copy(v12);
  uint64_t v11 = v10;
  if (*(unsigned char *)(a1 + 64)) {
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
  else {
    v10[2](v10);
  }

  objc_destroyWeak(&v17);
}

void __75__PUWallpaperPosterController__loadAssetFromWallpaperURL_async_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v4 = [WeakRetained _createViewModelWithLayerStack:*(void *)(a1 + 32) style:*(void *)(a1 + 40)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

- (void)_renderPreviewLayerStackFromWallpaperURL:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__46698;
  v63 = __Block_byref_object_dispose__46699;
  id v64 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__46698;
  v57 = __Block_byref_object_dispose__46699;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__46698;
  v51 = __Block_byref_object_dispose__46699;
  id v52 = 0;
  uint64_t v41 = 0;
  long long v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__46698;
  uint64_t v45 = __Block_byref_object_dispose__46699;
  id v46 = 0;
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  BOOL v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  id v7 = (void *)MEMORY[0x1E4F8A390];
  id v8 = [(PUWallpaperPosterController *)self posterDescriptor];
  id v9 = [v8 styleCategory];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __72__PUWallpaperPosterController__renderPreviewLayerStackFromWallpaperURL___block_invoke;
  v35[3] = &unk_1E5F27AF8;
  v37 = &v41;
  uint64_t v38 = &v53;
  v39 = &v59;
  long long v40 = &v47;
  long long v10 = v6;
  v36 = v10;
  [v7 renderPreviewLayerStackFromWallpaperURL:v4 styleCategory:v9 completion:v35];

  dispatch_time_t v11 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v10, v11);
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
  if (!v60[5])
  {
    if (v42[5])
    {
      id v23 = PLWallpaperGetLog();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      uint64_t v29 = v42[5];
      *(_DWORD *)buf = 138543618;
      id v66 = v4;
      __int16 v67 = 2112;
      v68 = v29;
      uint64_t v30 = "Failed to render layer stack from wallpaper url: %{public}@, error: %@";
    }
    else
    {
      id v23 = PLWallpaperGetLog();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      [v12 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138543618;
      id v66 = v4;
      __int16 v67 = 2048;
      v68 = v33;
      uint64_t v30 = "Timed out waiting for layer stack to render from wallpaper url: %{public}@ after %0.1fs";
    }
    id v31 = v23;
    uint32_t v32 = 22;
    goto LABEL_20;
  }
  id v13 = PLWallpaperGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    [v12 timeIntervalSinceDate:v5];
    *(_DWORD *)buf = 138543618;
    id v66 = v4;
    __int16 v67 = 2048;
    v68 = v14;
    _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_INFO, "Generated cold start preview layer stack from wallpaper url: %{public}@ in %0.1fs", buf, 0x16u);
  }

  id v15 = [(PUWallpaperPosterController *)self _createViewModelWithLayerStack:v60[5] style:v54[5]];
  [(PUWallpaperPosterController *)self setViewModel:v15];

  if (v48[5])
  {
    id v16 = PUWallpaperCacheDirectoryURL();
    id v17 = [v4 lastPathComponent];
    id v18 = [v16 URLByAppendingPathComponent:v17];

    double v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v19 removeItemAtURL:v18 error:0];

    uint64_t v20 = v48[5];
    uint64_t v21 = v60[5];
    uint64_t v22 = v54[5];
    id v34 = 0;
    LODWORD(v17) = [MEMORY[0x1E4F8A390] saveSegmentationItem:v20 compoundLayerStack:v21 style:v22 toWallpaperURL:v18 error:&v34];
    id v23 = v34;
    if (v17)
    {
      id v24 = PLWallpaperGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v66 = v18;
        double v25 = "Successfully cached cold start wallpaper to url: %{public}@";
        BOOL v26 = v24;
        os_log_type_t v27 = OS_LOG_TYPE_INFO;
        uint32_t v28 = 12;
LABEL_15:
        _os_log_impl(&dword_1AE9F8000, v26, v27, v25, buf, v28);
      }
    }
    else
    {
      id v24 = PLWallpaperGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v66 = v18;
        __int16 v67 = 2114;
        v68 = v23;
        double v25 = "Failed to cache cold start wallpaper to url: %{public}@, error: %{public}@";
        BOOL v26 = v24;
        os_log_type_t v27 = OS_LOG_TYPE_ERROR;
        uint32_t v28 = 22;
        goto LABEL_15;
      }
    }

    goto LABEL_21;
  }
  id v23 = PLWallpaperGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v66 = v4;
    uint64_t v30 = "Failed to reload segmentation item from wallpaper url: %{public}@";
    id v31 = v23;
    uint32_t v32 = 12;
LABEL_20:
    _os_log_impl(&dword_1AE9F8000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
  }
LABEL_21:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);
}

void __72__PUWallpaperPosterController__renderPreviewLayerStackFromWallpaperURL___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a5);
  id v21 = a5;
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v10;
  id v14 = v10;

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
  id v17 = v9;

  uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
  double v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v11;
  id v20 = v11;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_loadContentForCurrentPosterMedia:(BOOL)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PUWallpaperPosterController__loadContentForCurrentPosterMedia___block_invoke;
  aBlock[3] = &unk_1E5F2D918;
  objc_copyWeak(&v35, &location);
  BOOL v36 = a3;
  BOOL v6 = (void (**)(void))_Block_copy(aBlock);
  id v7 = [(PUWallpaperPosterController *)self currentPosterMedia];
  if (v7)
  {
    id v8 = [(PUWallpaperPosterController *)self environment];
    if (objc_msgSend(v8, "px_isPlayground")) {
      [(PUWallpaperPosterController *)self _showProgressIndicator];
    }
    if ([v7 mediaType] == 3)
    {
      id v9 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v21 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v22 = (objc_class *)objc_opt_class();
        id v23 = NSStringFromClass(v22);
        id v24 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
        [v21 handleFailureInMethod:a2, self, @"PUWallpaperPosterController.m", 1261, @"%@ should be an instance inheriting from %@, but it is %@", @"currentPosterMedia", v23, v24 object file lineNumber description];
      }
      [(PUWallpaperPosterController *)self _showPosterMediaImage:v9];
LABEL_27:

      goto LABEL_28;
    }
    [(PUWallpaperPosterController *)self _hidePosterMediaImage];
    objc_msgSend(v8, "px_assetDirectory");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    os_log_type_t v27 = [v7 subpath];
    BOOL v26 = [(PUWallpaperPosterController *)self renderer];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = objc_msgSend(v26, "px_blockingLoadPolicy");
      if (!v9)
      {
LABEL_14:
        if (v10 != 2)
        {
          id v13 = [(PUWallpaperPosterController *)self viewModel];
          BOOL v14 = v13 == 0;

          if (v14)
          {
            double v25 = [v7 assetUUID];
            uint64_t v15 = [(PUWallpaperPosterController *)self environment];
            if (objc_msgSend(v15, "px_isCallServices"))
            {
              id v16 = [(PUWallpaperPosterController *)self environment];
              uint64_t v17 = objc_msgSend(v16, "px_isSnapshot");
            }
            else
            {
              uint64_t v17 = 0;
            }

            uint64_t v18 = [(PUWallpaperPosterController *)self environment];
            int v19 = objc_msgSend(v18, "px_isPlayground");

            if (v25 && v19 | v17)
            {
              [(PUWallpaperPosterController *)self _loadAssetWithUUID:v25 usePreviewLayers:v17];
            }
            else
            {
              id v20 = PLWallpaperGetLog();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v39 = v25;
                _os_log_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_ERROR, "Invalid wallpaper directory for asset: %{public}@", buf, 0xCu);
              }
            }
            v6[2](v6);
          }
        }

        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v10 = 0;
      if (!v9) {
        goto LABEL_14;
      }
    }
    if (v27)
    {
      id v11 = [v9 URLByAppendingPathComponent:v27];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __65__PUWallpaperPosterController__loadContentForCurrentPosterMedia___block_invoke_2;
      v28[3] = &unk_1E5F27AD0;
      objc_copyWeak(&v32, &location);
      id v31 = v6;
      id v29 = v8;
      id v12 = v11;
      id v30 = v12;
      BOOL v33 = v10 == 2;
      [(PUWallpaperPosterController *)self _loadAssetFromWallpaperURL:v12 async:v10 == 2 completion:v28];

      objc_destroyWeak(&v32);
    }
    goto LABEL_14;
  }
LABEL_28:

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __65__PUWallpaperPosterController__loadContentForCurrentPosterMedia___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideProgressIndicator];

  if (*(unsigned char *)(a1 + 40))
  {
    id v5 = objc_loadWeakRetained(v2);
    id v4 = [v5 renderer];
    objc_msgSend(v4, "px_noteContentSignificantlyChanged");
  }
}

void __65__PUWallpaperPosterController__loadContentForCurrentPosterMedia___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained setViewModel:v5];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v8 = objc_msgSend(*(id *)(a1 + 32), "px_isPreview");
    id v9 = PLWallpaperGetLog();
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v11;
        __int16 v27 = 2114;
        id v28 = v6;
        _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_INFO, "Failed to load cold-start wallpaper from poster url (will try cache): %{public}@, error: %{public}@", buf, 0x16u);
      }

      id v12 = PUWallpaperCacheDirectoryURL();
      id v13 = (id *)(a1 + 40);
      BOOL v14 = [*(id *)(a1 + 40) lastPathComponent];
      uint64_t v15 = [v12 URLByAppendingPathComponent:v14];

      id v16 = objc_loadWeakRetained((id *)(a1 + 56));
      BOOL v17 = *(unsigned char *)(a1 + 64) != 0;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __65__PUWallpaperPosterController__loadContentForCurrentPosterMedia___block_invoke_144;
      v20[3] = &unk_1E5F27AA8;
      objc_copyWeak(&v24, (id *)(a1 + 56));
      id v23 = *(id *)(a1 + 48);
      id v18 = v15;
      id v21 = v18;
      id v22 = *v13;
      [v16 _loadAssetFromWallpaperURL:v18 async:v17 completion:v20];

      objc_destroyWeak(&v24);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v19;
        __int16 v27 = 2114;
        id v28 = v6;
        _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_ERROR, "Failed to load wallpaper from url: %{public}@, error: %{public}@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __65__PUWallpaperPosterController__loadContentForCurrentPosterMedia___block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained setViewModel:v5];
  }
  else
  {
    int v8 = PLWallpaperGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_INFO, "Failed to load cold-start wallpaper from cache url (will regenerate): %{public}@, error: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _renderPreviewLayerStackFromWallpaperURL:*(void *)(a1 + 40)];
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setCurrentPosterMedia:(id)a3
{
  uint64_t v9 = (PFPosterMedia *)a3;
  id v5 = self->_currentPosterMedia;
  if (v5 == v9)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(PFPosterMedia *)v5 isEqual:v9];

    if ((v7 & 1) == 0)
    {
      currentPosterMedia = self->_currentPosterMedia;
      objc_storeStrong((id *)&self->_currentPosterMedia, a3);
      [(PUWallpaperPosterController *)self _loadContentForCurrentPosterMedia:currentPosterMedia != 0];
    }
  }
}

- (void)_invalidateCurrentPosterMedia
{
  [(PUWallpaperPosterController *)self setCurrentPosterMedia:0];
  [(PUWallpaperPosterController *)self setViewModel:0];
  [(PUWallpaperPosterController *)self setNeedsFirstLockSignificantEvent:0];
}

- (void)_updateCurrentPosterMedia
{
  id v3 = [(PUWallpaperPosterController *)self _nextPosterMedia];
  [(PUWallpaperPosterController *)self setCurrentPosterMedia:v3];
}

- (id)_nextPosterMedia
{
  id v3 = [(PUWallpaperPosterController *)self posterConfiguration];
  id v4 = [(PUWallpaperPosterController *)self posterDescriptor];
  id v5 = [v4 media];
  if ([v5 count]) {
    [(PUWallpaperPosterController *)self posterDescriptor];
  }
  else {
  id v6 = [(PUWallpaperPosterController *)self posterConfiguration];
  }
  char v7 = [v6 media];

  if ([v3 configurationType] != 1
    || ([(PUWallpaperPosterController *)self environment],
        int v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_msgSend(v8, "px_isPreview"),
        v8,
        (v9 & 1) != 0))
  {
    uint64_t v10 = [v7 firstObject];
LABEL_7:
    uint64_t v11 = (void *)v10;
    goto LABEL_8;
  }
  unint64_t v13 = +[PUPosterUtilities mediaIndexWithSeed:mediaCount:](PUPosterUtilities, "mediaIndexWithSeed:mediaCount:", -[PUWallpaperPosterController significantEventsCounter](self, "significantEventsCounter"), [v7 count]);
  if (v13 < [v7 count])
  {
    uint64_t v10 = [v7 objectAtIndexedSubscript:v13];
    goto LABEL_7;
  }
  uint64_t v14 = PLWallpaperGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_ERROR, "Failed to get a next index that is in bounds of available media", v15, 2u);
  }

  uint64_t v11 = 0;
LABEL_8:

  return v11;
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v7 = [a3 entrySpecifierForTimelineIdentifier:@"shuffle-update"];
  id v4 = [v7 previousTimelineEntry];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 userObject];
    -[PUWallpaperPosterController setSignificantEventsCounter:](self, "setSignificantEventsCounter:", [v6 integerValue] + 1);
  }
}

- (id)_timelinesForDateInterval:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [getBLSAlwaysOnTimelineClass() emptyTimelineWithIdentifier:@"no-shuffle"];
  v19[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

  id v7 = [(PUWallpaperPosterController *)self posterConfiguration];
  if ([v7 configurationType] == 1)
  {
    int v8 = [v7 shuffleConfiguration];
    uint64_t v9 = [v8 shuffleFrequency];

    if ((unint64_t)(v9 - 3) <= 1)
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v11 = PUPosterShuffleNextSignificantEventDateForDate(v10, v9);

      if ([v4 containsDate:v11])
      {
        double v12 = dbl_1AEFF7BE0[v9 == 3];
        id BLSAlwaysOnTimelineClass = getBLSAlwaysOnTimelineClass();
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __57__PUWallpaperPosterController__timelinesForDateInterval___block_invoke;
        v17[3] = &unk_1E5F27A80;
        v17[4] = self;
        uint64_t v14 = [BLSAlwaysOnTimelineClass timelineWithUpdateInterval:v11 startDate:@"shuffle-update" identifier:v17 configure:v12];
        id v18 = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];

        id v6 = (void *)v15;
      }
    }
  }

  return v6;
}

void __57__PUWallpaperPosterController__timelinesForDateInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "significantEventsCounter"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setUserObject:v5];
}

- (void)_updateSignificantEvents
{
  id v3 = [(PUWallpaperPosterController *)self posterConfiguration];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  if ([v3 configurationType] == 1)
  {
    id v5 = [v3 shuffleConfiguration];
    uint64_t v6 = [v5 shuffleFrequency];

    if ((unint64_t)(v6 - 3) < 2)
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v11 = PUPosterShuffleNextSignificantEventDateForDate(v10, v6);

      [v11 timeIntervalSinceDate:v4];
      int64_t v9 = (uint64_t)(v12 * 1000000000.0);

      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v7 = 2;
      if (v6 != 1) {
        uint64_t v7 = 0;
      }
      if (v6 == 2) {
        uint64_t v8 = 4;
      }
      else {
        uint64_t v8 = v7;
      }
      int64_t v9 = 0;
    }
    dispatch_time_t v13 = dispatch_time(0xFFFFFFFFFFFFFFFELL, v9);
    uint64_t v14 = [(PUWallpaperPosterController *)self renderer];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__PUWallpaperPosterController__updateSignificantEvents__block_invoke;
    v15[3] = &__block_descriptor_48_e63_v24__0___PXPosterMutablePreferences__8___PXPosterTransition__16l;
    v15[4] = v13;
    v15[5] = v8;
    objc_msgSend(v14, "px_updatePreferences:", v15);
  }
}

void __55__PUWallpaperPosterController__updateSignificantEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSignificantEventTime:v3];
  [v4 setSignificantEventOptions:*(void *)(a1 + 40)];
}

- (unint64_t)significantEventsCounter
{
  return self->_significantEventsCounter
       + [(PUWallpaperPosterController *)self needsFirstLockSignificantEvent];
}

- (void)setSignificantEventsCounter:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_significantEventsCounter != a3)
  {
    self->_significantEventsCounter = a3;
    [(PUWallpaperPosterController *)self _updateSignificantEvents];
    BOOL v5 = [(PUWallpaperPosterController *)self _shouldAnimateShuffleTransitionToSleep];
    uint64_t v6 = PLWallpaperGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = [(PUWallpaperPosterController *)self needsFirstLockSignificantEvent];
      uint64_t v8 = @"NO";
      if (v7) {
        int64_t v9 = @"YES";
      }
      else {
        int64_t v9 = @"NO";
      }
      *(_DWORD *)uint64_t v10 = 134218498;
      *(void *)&v10[4] = a3;
      *(_WORD *)&v10[12] = 2112;
      *(void *)&v10[14] = v9;
      if (!v5) {
        uint64_t v8 = @"YES";
      }
      *(_WORD *)&v10[22] = 2112;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_INFO, "setSignificantEventsCounter:%ld simulatingFirstLockEvent:%@ updateCurrentPosterMedia:%@", v10, 0x20u);
    }

    if (!v5) {
      [(PUWallpaperPosterController *)self _updateCurrentPosterMedia];
    }
    [(PUWallpaperPosterController *)self _invalidateDebugHUD];
  }
}

- (id)posterUpgradeService
{
  wallpaperService = self->_wallpaperService;
  if (!wallpaperService)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F8AA38]);
    BOOL v5 = [(PUWallpaperPosterController *)self photoLibrary];
    uint64_t v6 = [v5 photoAnalysisClient];
    BOOL v7 = (PLPhotoAnalysisWallpaperService *)[v4 initWithServiceProvider:v6];
    uint64_t v8 = self->_wallpaperService;
    self->_wallpaperService = v7;

    wallpaperService = self->_wallpaperService;
    if (!wallpaperService)
    {
      int64_t v9 = PLWallpaperGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Failed to obtain PAD migration service client!", v11, 2u);
      }

      wallpaperService = self->_wallpaperService;
    }
  }
  return wallpaperService;
}

- (void)triggerPosterUpgrade
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUWallpaperPosterController *)self environment];
  id v4 = objc_msgSend(v3, "px_assetDirectory");

  BOOL v5 = PLWallpaperGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 path];
    *(_DWORD *)buf = 138543362;
    id v22 = v6;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Triggering update of current poster configuration with asset directory: %{public}@", buf, 0xCu);
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = [MEMORY[0x1E4F8CE48] deviceConfiguration];
  int64_t v9 = [v8 dictionaryRepresentation];
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F8A510]];

  if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration]) {
    uint64_t v10 = 35;
  }
  else {
    uint64_t v10 = 1;
  }
  uint64_t v11 = [(PUWallpaperPosterController *)self posterConfiguration];
  uint64_t v12 = [v11 editConfiguration];
  int v13 = [v12 isSettlingEffectEnabled];

  if (v13) {
    uint64_t v14 = v10 | 0x40;
  }
  else {
    uint64_t v14 = v10;
  }
  if ([(PUWallpaperPosterController *)self wantsLowLuminanceContent]) {
    uint64_t v15 = v14 | 4;
  }
  else {
    uint64_t v15 = v14;
  }
  id v16 = [NSNumber numberWithUnsignedInteger:v15];
  [v7 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F8A508]];

  BOOL v17 = [(PUWallpaperPosterController *)self posterUpgradeService];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __51__PUWallpaperPosterController_triggerPosterUpgrade__block_invoke;
  v19[3] = &unk_1E5F2E3B8;
  id v20 = v4;
  id v18 = v4;
  [v17 upgradePosterConfigurationWithAssetDirectory:v18 options:v7 reply:v19];
}

void __51__PUWallpaperPosterController_triggerPosterUpgrade__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLWallpaperGetLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) path];
      int v13 = 138543362;
      uint64_t v14 = v8;
      int64_t v9 = "Successfully upgraded poster configuration with asset directory: %{public}@";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1AE9F8000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = [*(id *)(a1 + 32) path];
    int v13 = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    id v16 = v5;
    int64_t v9 = "Failed to upgrade poster configuration with asset directory: %{public}@, error: %{public}@";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

- (BOOL)triggerPosterUpgradeIfNecessary
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (([(PXPosterRenderingEnvironment *)self->_environment px_isSnapshot] & 1) == 0
    && ([(PXPosterRenderingEnvironment *)self->_environment px_isPlayground] & 1) == 0
    && ![(PXPosterRenderingEnvironment *)self->_environment px_isCallServices])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v3 = [v6 objectForKey:@"PI_PARALLAX_ENABLE_MIGRATION"];

    if (v3 && ([v3 BOOLValue] & 1) == 0)
    {
      id v7 = PLWallpaperGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Not triggering poster upgrade: disabled", buf, 2u);
      }
      BOOL v4 = 0;
      goto LABEL_51;
    }
    id v7 = [(PFPosterConfiguration *)self->_posterConfiguration layoutConfiguration];
    uint64_t v8 = [MEMORY[0x1E4F8CE48] deviceConfiguration];
    int64_t v9 = [v8 landscapeConfiguration];

    if (v9)
    {
      if ([v7 isEqualToLayoutConfiguration:v8])
      {
LABEL_12:
        char v10 = 0;
        goto LABEL_24;
      }
    }
    else
    {
      os_log_type_t v11 = [v7 portraitConfiguration];
      uint32_t v12 = [v8 portraitConfiguration];
      char v13 = [v11 isEqualToLayoutConfiguration:v12];

      if (v13) {
        goto LABEL_12;
      }
    }
    uint64_t v14 = PLWallpaperGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "Poster layout config mismatch, needs upgrade", buf, 2u);
    }

    __int16 v15 = PLWallpaperGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v7;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEFAULT, "layoutConfig: %{public}@", buf, 0xCu);
    }

    id v16 = PLWallpaperGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v8;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "deviceConfig: %{public}@", buf, 0xCu);
    }

    char v10 = 1;
LABEL_24:
    if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration])
    {
      uint64_t v17 = [v7 landscapeConfiguration];
      BOOL v18 = v17 == 0;
    }
    else
    {
      BOOL v18 = 0;
    }
    char v19 = v10 | v18;
    if ([(PUWallpaperPosterController *)self wantsLowLuminanceContent]
      && ([(PFPosterConfiguration *)self->_posterConfiguration options] & 4) == 0)
    {
      id v20 = PLWallpaperGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_DEFAULT, "Poster inactive contents mismatch, needs upgrade", buf, 2u);
      }

      char v19 = 1;
    }
    id v21 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v22 = [v21 BOOLForKey:@"PI_PARALLAX_FORCE_MIGRATION"];

    if (v22)
    {
      uint64_t v23 = PLWallpaperGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v23, OS_LOG_TYPE_DEFAULT, "Triggering poster upgrade: forced", buf, 2u);
      }
    }
    else if ((v19 & 1) == 0)
    {
      id v28 = PLWallpaperGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v28, OS_LOG_TYPE_DEFAULT, "Not triggering poster upgrade: not needed", buf, 2u);
      }

      BOOL v4 = 0;
      goto LABEL_50;
    }
    if ([MEMORY[0x1E4F8AA78] systemPhotoLibraryIsObtainable])
    {
      [(PUWallpaperPosterController *)self triggerPosterUpgrade];
    }
    else
    {
      id v24 = PLWallpaperGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v24, OS_LOG_TYPE_DEFAULT, "Device has not been unlocked since boot, delaying poster upgrade", buf, 2u);
      }

      int out_token = -1;
      objc_initWeak((id *)buf, self);
      id v25 = MEMORY[0x1E4F14428];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __62__PUWallpaperPosterController_triggerPosterUpgradeIfNecessary__block_invoke;
      v29[3] = &unk_1E5F2B608;
      objc_copyWeak(&v30, (id *)buf);
      uint32_t v26 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, MEMORY[0x1E4F14428], v29);

      if (v26)
      {
        __int16 v27 = PLWallpaperGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v32 = 67109120;
          uint32_t v33 = v26;
          _os_log_impl(&dword_1AE9F8000, v27, OS_LOG_TYPE_ERROR, "Could not register for first unlock notification. Status = %d", v32, 8u);
        }
      }
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
    BOOL v4 = 1;
LABEL_50:

LABEL_51:
    goto LABEL_7;
  }
  uint64_t v3 = PLWallpaperGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "Not triggering poster upgrade: not on lockscreen", buf, 2u);
  }
  BOOL v4 = 0;
LABEL_7:

  return v4;
}

void __62__PUWallpaperPosterController_triggerPosterUpgradeIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = PLWallpaperGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    id v4 = WeakRetained;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "Received first unlock notification; attempting to update poster (%p)",
      (uint8_t *)&v3,
      0xCu);
  }

  [WeakRetained triggerPosterUpgrade];
}

- (void)setPosterConfiguration:(id)a3
{
  int64_t v9 = (PFPosterConfiguration *)a3;
  uint64_t v5 = self->_posterConfiguration;
  if (v5 == v9)
  {
  }
  else
  {
    uint64_t v6 = v5;
    char v7 = [(PFPosterConfiguration *)v5 isEqual:v9];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_posterConfiguration, a3);
      [(PUWallpaperPosterController *)self _invalidateCurrentPosterMedia];
      [(PUWallpaperPosterController *)self _updateCurrentPosterMedia];
      [(PUWallpaperPosterController *)self _updateSignificantEvents];
      [(PUWallpaperPosterController *)self setNeedsUpgrade:[(PUWallpaperPosterController *)self triggerPosterUpgradeIfNecessary]];
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
      [(PUWallpaperPosterController *)self setLastUpgradeCheckTime:v8];

      [(PUWallpaperPosterController *)self setNextUpgradeCheckDelay:900.0];
    }
  }
}

- (void)setPosterDescriptor:(id)a3
{
  uint64_t v8 = (PFPosterDescriptor *)a3;
  uint64_t v5 = self->_posterDescriptor;
  if (v5 == v8)
  {
  }
  else
  {
    uint64_t v6 = v5;
    char v7 = [(PFPosterDescriptor *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_posterDescriptor, a3);
      [(PUWallpaperPosterController *)self _invalidateCurrentPosterMedia];
      [(PUWallpaperPosterController *)self _updateCurrentPosterMedia];
    }
  }
}

- (void)_loadContentsFromEnvironment
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = [(PUWallpaperPosterController *)self environment];
  uint64_t v5 = objc_msgSend(v4, "px_assetDirectory");

  uint64_t v6 = [(PUWallpaperPosterController *)self environment];
  uint64_t v7 = objc_msgSend(v6, "px_contentsType");

  switch(v7)
  {
    case 1:
      int64_t v9 = PLWallpaperGetLog();
      char v10 = v9;
      os_signpost_id_t signpost = self->_signpost;
      if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PUWallpaperPoster.LoadPosterDescriptor", "", buf, 2u);
      }

      uint32_t v12 = PLWallpaperGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = v5;
        _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_INFO, "Loading poster descriptor from url %{public}@", buf, 0xCu);
      }

      id v33 = 0;
      char v13 = [MEMORY[0x1E4F8CD00] loadFromURL:v5 error:&v33];
      id v14 = v33;
      if (v13)
      {
        [(PUWallpaperPosterController *)self setPosterDescriptor:v13];
        __int16 v15 = PLWallpaperGetLog();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 138543362;
        id v35 = v5;
        id v16 = "Loading of poster descriptor from url %{public}@ finished successfully";
        uint64_t v17 = v15;
        uint32_t v18 = 12;
      }
      else
      {
        __int16 v15 = PLWallpaperGetLog();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 138543618;
        id v35 = v5;
        __int16 v36 = 2114;
        id v37 = v14;
        id v16 = "Loading of poster descriptor from url %{public}@ failed with error %{public}@";
        uint64_t v17 = v15;
        uint32_t v18 = 22;
      }
      _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
LABEL_24:

      __int16 v27 = PLWallpaperGetLog();
      id v28 = v27;
      os_signpost_id_t v29 = self->_signpost;
      if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v27)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      id v30 = "PUWallpaperPoster.LoadPosterDescriptor";
      goto LABEL_33;
    case 2:
      char v19 = PLWallpaperGetLog();
      id v20 = v19;
      os_signpost_id_t v21 = self->_signpost;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PUWallpaperPoster.LoadPosterConfiguration", "", buf, 2u);
      }

      int v22 = PLWallpaperGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = v5;
        _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_INFO, "Loading poster configuration from url %{public}@", buf, 0xCu);
      }

      id v32 = 0;
      char v13 = [MEMORY[0x1E4F8CCF8] loadFromURL:v5 error:&v32];
      id v14 = v32;
      if (v13)
      {
        [(PUWallpaperPosterController *)self setPosterConfiguration:v13];
        uint64_t v23 = PLWallpaperGetLog();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 138543362;
        id v35 = v5;
        id v24 = "Loading of poster configuration from url %{public}@ finished successfully";
        id v25 = v23;
        uint32_t v26 = 12;
      }
      else
      {
        uint64_t v23 = PLWallpaperGetLog();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 138543618;
        id v35 = v5;
        __int16 v36 = 2114;
        id v37 = v14;
        id v24 = "Loading of poster configuration from url %{public}@ failed with error %{public}@";
        id v25 = v23;
        uint32_t v26 = 22;
      }
      _os_log_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_INFO, v24, buf, v26);
LABEL_30:

      id v31 = PLWallpaperGetLog();
      id v28 = v31;
      os_signpost_id_t v29 = self->_signpost;
      if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v31)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      id v30 = "PUWallpaperPoster.LoadPosterConfiguration";
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v29, v30, "", buf, 2u);
LABEL_34:

      break;
    case 0:
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"PUWallpaperPosterController.m", 922, @"Unknown contents type for environment contents: %@", v5 object file lineNumber description];

      abort();
  }
}

- (CGAffineTransform)_inactiveTransform
{
  id v4 = [(PUWallpaperPosterController *)self viewModel];
  [v4 inactiveFrame];
  if (CGRectIsEmpty(v16))
  {
    uint64_t v5 = PLWallpaperGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_INFO, "inactiveFrame is empty, falling back to the identity transform", buf, 2u);
    }

    uint64_t v6 = MEMORY[0x1E4F1DAB8];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v6 + 32);
  }
  else
  {
    [v4 containerFrame];
    CGFloat x = v17.origin.x;
    CGFloat y = v17.origin.y;
    CGFloat width = v17.size.width;
    CGFloat height = v17.size.height;
    dCGFloat x = -CGRectGetMidX(v17);
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGFloat v12 = -CGRectGetMidY(v18);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGRectOffset(v19, dx, v12);
    [v4 visibleFrame];
    PXRectNormalize();
    PXRectDenormalize();
    PXAffineTransformMakeFromRects();
  }

  return result;
}

- (BOOL)_shouldAnimateShuffleTransitionToSleep
{
  int v3 = [(PUWallpaperPosterController *)self posterConfiguration];
  id v4 = [v3 shuffleConfiguration];
  uint64_t v5 = [v4 shuffleFrequency];

  BOOL v6 = [(PUWallpaperPosterController *)self backlightLuminance] == 1
    && [(PUWallpaperPosterController *)self wantsLowLuminanceContent];
  long long v7 = [(PUWallpaperPosterController *)self _nextPosterMedia];
  if (v7)
  {
    uint64_t v8 = [(PUWallpaperPosterController *)self currentPosterMedia];
    int64_t v9 = v8;
    if (v8 == v7) {
      LOBYTE(v10) = 0;
    }
    else {
      int v10 = [v8 isEqual:v7] ^ 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  BOOL v11 = v5 == 2 && v6;
  BOOL v12 = v11 & v10;

  return v12;
}

- (BOOL)_animateShuffleTransitionToSleep
{
  id v3 = [(PUWallpaperPosterController *)self _nextPosterMedia];
  if (v3)
  {
    id v4 = [(PUWallpaperPosterController *)self currentPosterMedia];
    if (v4 == v3)
    {
    }
    else
    {
      uint64_t v5 = v4;
      char v6 = [v4 isEqual:v3];

      if ((v6 & 1) == 0)
      {
        long long v7 = [(PUWallpaperPosterController *)self viewModel];
        uint64_t v8 = [v7 viewManager];
        int64_t v9 = [v7 currentLayerStack];
        int v10 = [v9 backgroundLayer];
        BOOL v11 = [v8 viewForLayer:v10];

        BOOL v12 = [v9 foregroundLayer];
        v57 = [v8 viewForLayer:v12];

        char v13 = [v9 inactiveForegroundLayer];
        uint64_t v59 = [v8 viewForLayer:v13];

        uint64_t v55 = v9;
        id v14 = [v9 inactiveBackgroundLayer];
        id v58 = [v8 viewForLayer:v14];

        int v15 = [v7 clockAppearsAboveForeground];
        long long v82 = 0u;
        long long v83 = 0u;
        long long buf = 0u;
        [(PUWallpaperPosterController *)self _inactiveTransform];
        [(PUWallpaperPosterController *)self _updateCurrentPosterMedia];
        CGRect v16 = [(PUWallpaperPosterController *)self viewModel];
        CGRect v17 = [v16 viewManager];
        id v52 = [v16 currentLayerStack];
        CGRect v18 = [v52 inactiveForegroundLayer];
        uint64_t v53 = v17;
        CGRect v19 = [v17 viewForLayer:v18];

        uint64_t v54 = v16;
        BOOL v20 = v7 != v16;
        v56 = v11;
        v51 = v19;
        if (v7 == v16)
        {
          v44 = v58;
          uint64_t v43 = v59;
          id v34 = v57;
          [(PUWallpaperPosterController *)self _transitionToBacklightLuminance:2 previousBacklightLuminance:-1 animated:0 interruptSettlingEffectPlayback:1];
          uint64_t v23 = PLWallpaperGetLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v80 = 0;
            _os_log_impl(&dword_1AE9F8000, v23, OS_LOG_TYPE_INFO, "_animateShuffleTransitionToSleep new views are not new", v80, 2u);
          }
          long long v42 = v56;
          uint64_t v41 = v51;
        }
        else
        {
          v50 = v8;
          os_signpost_id_t v21 = [v57 layer];
          [v21 setCompositingFilter:0];

          int v22 = [v11 layer];
          [v22 setCompositingFilter:0];

          [v19 setAlpha:0.0];
          uint64_t v23 = [(PUWallpaperPosterController *)self renderer];
          id v24 = [v23 backgroundView];
          uint64_t v25 = [v23 foregroundView];
          uint64_t v26 = [v23 floatingView];
          [v24 addSubview:v58];
          uint64_t v49 = v24;
          [v24 addSubview:v11];
          uint64_t v47 = (void *)v26;
          v48 = (void *)v25;
          if (v15) {
            __int16 v27 = (void *)v25;
          }
          else {
            __int16 v27 = (void *)v26;
          }
          [v27 addSubview:v59];
          [v27 addSubview:v57];
          if (!UIAccessibilityIsReduceMotionEnabled())
          {
            id v28 = (void *)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:0];
            id v29 = objc_alloc(MEMORY[0x1E4FB1ED8]);
            [v23 px_shuffleSleepTransformOutAnimationDuration];
            id v30 = objc_msgSend(v29, "initWithDuration:timingParameters:", v28);
            v72[0] = MEMORY[0x1E4F143A8];
            v72[1] = 3221225472;
            v72[2] = __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke;
            v72[3] = &unk_1E5F27A10;
            id v73 = v11;
            long long v77 = buf;
            long long v78 = v82;
            long long v79 = v83;
            id v74 = v57;
            id v75 = v59;
            id v76 = v58;
            [v30 addAnimations:v72];
            [v30 startAnimation];
          }
          id v46 = (void *)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:0];
          id v31 = objc_alloc(MEMORY[0x1E4FB1ED8]);
          [v23 px_shuffleSleepFadeOutAnimationDuration];
          id v32 = objc_msgSend(v31, "initWithDuration:timingParameters:", v46);
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke_2;
          v67[3] = &unk_1E5F2D098;
          id v33 = v11;
          id v68 = v33;
          id v34 = v57;
          id v35 = v57;
          id v69 = v35;
          id v36 = v59;
          id v70 = v36;
          id v37 = v58;
          id v71 = v37;
          [v32 addAnimations:v67];
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke_3;
          v62[3] = &unk_1E5F27A38;
          id v63 = v33;
          id v64 = v35;
          id v65 = v36;
          id v66 = v37;
          [v32 addCompletion:v62];
          [v32 startAnimation];
          uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C58]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 21.4208, 9.2565, 0.0, 0.0);
          id v39 = objc_alloc(MEMORY[0x1E4FB1ED8]);
          [v23 px_shuffleSleepFadeInAnimationDuration];
          uint64_t v40 = objc_msgSend(v39, "initWithDuration:timingParameters:", v38);
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke_4;
          v60[3] = &unk_1E5F2ED10;
          uint64_t v41 = v51;
          id v61 = v51;
          [v40 addAnimations:v60];
          [v40 startAnimation];

          long long v42 = v56;
          uint64_t v8 = v50;
          v44 = v58;
          uint64_t v43 = v59;
        }

        goto LABEL_15;
      }
    }
  }
  long long v7 = PLWallpaperGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_INFO, "_animateShuffleTransitionToSleep called when next media wasn't available", (uint8_t *)&buf, 2u);
  }
  BOOL v20 = 0;
LABEL_15:

  return v20;
}

uint64_t __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 80);
  v10[0] = *(_OWORD *)(a1 + 64);
  v10[1] = v2;
  v10[2] = *(_OWORD *)(a1 + 96);
  [*(id *)(a1 + 32) setTransform:v10];
  long long v3 = *(_OWORD *)(a1 + 80);
  v9[0] = *(_OWORD *)(a1 + 64);
  v9[1] = v3;
  v9[2] = *(_OWORD *)(a1 + 96);
  [*(id *)(a1 + 40) setTransform:v9];
  long long v4 = *(_OWORD *)(a1 + 80);
  v8[0] = *(_OWORD *)(a1 + 64);
  v8[1] = v4;
  v8[2] = *(_OWORD *)(a1 + 96);
  [*(id *)(a1 + 48) setTransform:v8];
  long long v5 = *(_OWORD *)(a1 + 80);
  v7[0] = *(_OWORD *)(a1 + 64);
  v7[1] = v5;
  v7[2] = *(_OWORD *)(a1 + 96);
  return [*(id *)(a1 + 56) setTransform:v7];
}

uint64_t __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 40) setAlpha:0.0];
  [*(id *)(a1 + 48) setAlpha:0.0];
  long long v2 = *(void **)(a1 + 56);
  return [v2 setAlpha:0.0];
}

uint64_t __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke_3(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v3 = result;
    [*(id *)(result + 32) removeFromSuperview];
    [*(id *)(v3 + 40) removeFromSuperview];
    [*(id *)(v3 + 48) removeFromSuperview];
    long long v4 = *(void **)(v3 + 56);
    return [v4 removeFromSuperview];
  }
  return result;
}

uint64_t __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_transitionToBacklightLuminance:(int64_t)a3 previousBacklightLuminance:(int64_t)a4 animated:(BOOL)a5 interruptSettlingEffectPlayback:(BOOL)a6
{
  BOOL v135 = a6;
  BOOL v149 = a5;
  uint64_t v217 = *MEMORY[0x1E4F143B8];
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  long long v7 = [MEMORY[0x1E4F28F80] processInfo];
  int v143 = [v7 isLowPowerModeEnabled];

  v148 = [(PUWallpaperPosterController *)self renderer];
  uint64_t v8 = [(PUWallpaperPosterController *)self viewModel];
  int64_t v9 = [v8 viewManager];
  v151 = v8;
  int v10 = [v8 currentLayerStack];
  BOOL v11 = [v10 backgroundLayer];
  BOOL v12 = [v9 viewForLayer:v11];

  char v13 = [v10 foregroundLayer];
  id v14 = [v9 viewForLayer:v13];

  int v15 = [v10 inactiveForegroundLayer];
  CGRect v16 = [v9 viewForLayer:v15];

  CGRect v17 = [v10 inactiveBackgroundLayer];
  CGRect v18 = [v9 viewForLayer:v17];

  v142 = v9;
  CGRect v19 = [v9 videoLayerView];
  v156 = [v19 player];
  v157 = self;
  BOOL v20 = [(PUWallpaperPosterController *)self wantsLowLuminanceContent];
  os_signpost_id_t v21 = PLWallpaperGetLog();
  v145 = v12;
  v147 = v14;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    BOOL v131 = v18 == 0;
    if (v8) {
      BOOL v22 = v20;
    }
    else {
      BOOL v22 = 0;
    }
    if (v8) {
      uint64_t v23 = @"YES";
    }
    else {
      uint64_t v23 = @"NO";
    }
    v132 = v23;
    v139 = v18;
    id v24 = v16;
    if (v16) {
      BOOL v25 = 0;
    }
    else {
      BOOL v25 = v22;
    }
    uint64_t v26 = [(PUWallpaperPosterController *)v157 _nameForBacklightLuminance:a3];
    __int16 v27 = [(PUWallpaperPosterController *)v157 _nameForBacklightLuminance:a4];
    if (v149) {
      id v28 = @"YES";
    }
    else {
      id v28 = @"NO";
    }
    *(_DWORD *)long long buf = 138414082;
    if ([v10 settlingEffectEnabled]) {
      id v29 = @"YES";
    }
    else {
      id v29 = @"NO";
    }
    BOOL v39 = !v25 || !v131;
    CGRect v16 = v24;
    CGRect v18 = v139;
    *(void *)&uint8_t buf[4] = v26;
    if (v39) {
      id v30 = @"NO";
    }
    else {
      id v30 = @"YES";
    }
    if (IsReduceMotionEnabled) {
      id v31 = @"YES";
    }
    else {
      id v31 = @"NO";
    }
    if (v143) {
      id v32 = @"YES";
    }
    else {
      id v32 = @"NO";
    }
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v28;
    *(_WORD *)v215 = 2112;
    *(void *)&v215[2] = v29;
    *(_WORD *)&v215[10] = 2112;
    *(void *)&v215[12] = v30;
    *(_WORD *)&v215[20] = 2112;
    *(void *)&v215[22] = v31;
    *(_WORD *)&v215[30] = 2112;
    *(void *)v216 = v32;
    *(_WORD *)&v216[8] = 2112;
    *(void *)&v216[10] = v132;
    _os_log_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_INFO, "_transitionToBacklightLuminance:%@ previousBacklightLuminance:%@ animated:%@ isSettlingEffectEnabled:%@ missingInactiveViews:%@ isReduceMotionEnabled:%@ isLowPowerModeEnabled:%@ viewModelNonNil: %@", buf, 0x52u);

    id v14 = v147;
  }

  if (!v12)
  {
    id v35 = PLWallpaperGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AE9F8000, v35, OS_LOG_TYPE_ERROR, "backgroundLayerView is nil", buf, 2u);
    }
    id v33 = v157;
    int64_t v34 = a3;
    goto LABEL_34;
  }
  [v12 frame];
  id v33 = v157;
  int64_t v34 = a3;
  if (CGRectIsEmpty(v218))
  {
    id v35 = PLWallpaperGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AE9F8000, v35, OS_LOG_TYPE_ERROR, "backgroundLayerView has zero size", buf, 2u);
    }
LABEL_34:
  }
  if (v14)
  {
    [v14 frame];
    if (CGRectIsEmpty(v219))
    {
      id v36 = PLWallpaperGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1AE9F8000, v36, OS_LOG_TYPE_ERROR, "foregroundLayerView has zero size", buf, 2u);
      }
    }
  }
  if (v16)
  {
    [v16 frame];
    if (CGRectIsEmpty(v220))
    {
      id v37 = PLWallpaperGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1AE9F8000, v37, OS_LOG_TYPE_ERROR, "inactiveForegroundLayerView has zero size", buf, 2u);
      }
    }
  }
  if (v18)
  {
    [v18 frame];
    if (CGRectIsEmpty(v221))
    {
      uint64_t v38 = PLWallpaperGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1AE9F8000, v38, OS_LOG_TYPE_ERROR, "inactiveBackgroundLayerView has zero size", buf, 2u);
      }
    }
  }
  BOOL v39 = v34 == 2 || v34 == -1;
  int v40 = v39;
  if ([v10 settlingEffectEnabled])
  {
    v137 = v16;
    [v16 setAlpha:0.0];
    if ([(PUWallpaperPosterController *)v33 blurredSettlingEffect] && (v34 == 1 || a4 == 1))
    {
      int v133 = v40;
      v140 = v18;
      uint64_t v41 = [v12 layer];
      long long v42 = [v41 filters];
      uint64_t v43 = [v42 count];

      v44 = (_OWORD *)MEMORY[0x1E4F39AD8];
      if (!v43)
      {
        uint64_t v45 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
        [v45 setName:@"gaussianBlur"];
        [v45 setValue:@"default" forKey:*MEMORY[0x1E4F3A1D0]];
        [v45 setValue:&unk_1F078C440 forKey:*MEMORY[0x1E4F3A1D8]];
        id v46 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
        [v46 setName:@"colorMatrix"];
        long long v47 = v44[3];
        *(_OWORD *)v215 = v44[2];
        *(_OWORD *)&v215[16] = v47;
        *(_OWORD *)v216 = v44[4];
        long long v48 = v44[1];
        *(_OWORD *)long long buf = *v44;
        *(_OWORD *)&uint8_t buf[16] = v48;
        uint64_t v49 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:buf];
        [v46 setValue:v49 forKey:*MEMORY[0x1E4F3A168]];

        v213[0] = v45;
        v213[1] = v46;
        v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v213 count:2];
        v212 = v45;
        v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v212 count:1];
        id v52 = [v140 layer];
        [v52 setFilters:v51];

        BOOL v12 = v145;
        uint64_t v53 = [v19 layer];
        [v53 setFilters:v50];

        uint64_t v54 = [v145 layer];
        [v54 setFilters:v50];

        uint64_t v55 = [v147 layer];
        [v55 setFilters:v50];

        id v14 = v147;
      }
      *(_OWORD *)&v215[16] = 0u;
      *(_OWORD *)v216 = 0u;
      if (v133) {
        double v56 = 0.0;
      }
      else {
        double v56 = 10.0;
      }
      *(_OWORD *)v215 = 0uLL;
      memset(buf, 0, sizeof(buf));
      if (v34 == 2 || v34 == -1)
      {
        long long v57 = v44[3];
        *(_OWORD *)v215 = v44[2];
        *(_OWORD *)&v215[16] = v57;
        *(_OWORD *)v216 = v44[4];
        long long v58 = v44[1];
        *(_OWORD *)long long buf = *v44;
        *(_OWORD *)&uint8_t buf[16] = v58;
      }
      else
      {
        PUColorMatrixMakeInactive(buf);
      }
      v206[0] = MEMORY[0x1E4F143A8];
      v206[1] = 3221225472;
      long long v208 = *(_OWORD *)&buf[16];
      long long v209 = *(_OWORD *)v215;
      long long v210 = *(_OWORD *)&v215[16];
      long long v211 = *(_OWORD *)v216;
      v206[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke;
      v206[3] = &__block_descriptor_120_e16_v16__0__UIView_8l;
      *(double *)&v206[4] = v56;
      long long v207 = *(_OWORD *)buf;
      long long v77 = _Block_copy(v206);
      v199[0] = MEMORY[0x1E4F143A8];
      v199[1] = 3221225472;
      v199[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_2;
      v199[3] = &unk_1E5F2D048;
      CGRect v18 = v140;
      id v200 = v140;
      double v205 = v56;
      id v78 = v77;
      id v204 = v78;
      id v201 = v19;
      id v202 = v12;
      id v203 = v14;
      long long v79 = _Block_copy(v199);
      v80 = v79;
      if (v149)
      {
        v81 = (void *)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:0];
        id v82 = objc_alloc(MEMORY[0x1E4FB1ED8]);
        double v83 = 0.3;
        if (!v133) {
          double v83 = 0.5;
        }
        v84 = (void *)[v82 initWithDuration:v81 timingParameters:v83];
        [v84 addAnimations:v80];
        [v84 startAnimation];

        id v14 = v147;
      }
      else
      {
        (*((void (**)(void *))v79 + 2))(v79);
      }
      id v33 = v157;
    }
    v85 = [v156 currentItem];
    uint64_t v86 = [v85 status];

    if (v19) {
      BOOL v87 = v86 == 2;
    }
    else {
      BOOL v87 = 1;
    }
    char v88 = v143 ^ 1;
    if (v87) {
      char v88 = 0;
    }
    if (v34 != 2)
    {
      if (!v34)
      {
        [v12 setAlpha:0.0];
        [v14 setAlpha:0.0];
        [v19 setAlpha:1.0];
        *(_OWORD *)long long buf = *MEMORY[0x1E4F1FA48];
        *(void *)&uint8_t buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        [v156 seekToTime:buf];
        [v156 pause];
        goto LABEL_144;
      }
      CGRect v16 = v137;
      if (v34 != 1) {
        goto LABEL_141;
      }
      [v156 pause];
      if (v149)
      {
        [v12 alpha];
        if (v90 == 1.0) {
          [v19 setAlpha:0.0];
        }
        v91 = [(PUWallpaperPosterController *)v33 alphaAnimator];
        [v91 stopAnimation:1];

        v92 = (void *)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:0];
        id v93 = objc_alloc(MEMORY[0x1E4FB1ED8]);
        objc_msgSend(v148, "px_lowLuminanceAlphaAnimationDuration");
        v94 = objc_msgSend(v93, "initWithDuration:timingParameters:", v92);
        v192[0] = MEMORY[0x1E4F143A8];
        v192[1] = 3221225472;
        v192[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_2_104;
        v192[3] = &unk_1E5F2E908;
        id v193 = v12;
        id v194 = v14;
        id v195 = v19;
        [v94 addAnimations:v192];
        [v94 startAnimation];
        [(PUWallpaperPosterController *)v33 setAlphaAnimator:v94];

        CGRect v16 = v137;
        goto LABEL_118;
      }
      [v12 setAlpha:0.0];
      [v14 setAlpha:0.0];
      double v98 = 0.0;
      v99 = v19;
LABEL_117:
      [v99 setAlpha:v98];
LABEL_118:
      [(PUWallpaperPosterController *)v33 _endExtendedRenderSession];
      goto LABEL_141;
    }
    if (v149)
    {
      char v89 = v88 ^ 1;
      if (a4 == -1) {
        char v89 = 1;
      }
      CGRect v16 = v137;
      if ((v89 & 1) == 0)
      {
        [(PUWallpaperPosterController *)v33 _playSettlingEffect];
        goto LABEL_141;
      }
      if (v88) {
        goto LABEL_141;
      }
      [v19 setAlpha:0.0];
      v196[0] = MEMORY[0x1E4F143A8];
      v196[1] = 3221225472;
      v196[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_103;
      v196[3] = &unk_1E5F2ECC8;
      id v197 = v12;
      id v198 = v14;
      v100 = _Block_copy(v196);
      v101 = v100;
      if (a4 == 1)
      {
        v102 = [(PUWallpaperPosterController *)v33 alphaAnimator];
        [v102 stopAnimation:1];

        v103 = (void *)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:0];
        v104 = v33;
        id v105 = objc_alloc(MEMORY[0x1E4FB1ED8]);
        objc_msgSend(v148, "px_lowLuminanceAlphaAnimationDuration");
        v106 = objc_msgSend(v105, "initWithDuration:timingParameters:", v103);
        [v106 addAnimations:v101];
        [v106 startAnimation];
        [(PUWallpaperPosterController *)v104 setAlphaAnimator:v106];
      }
      else
      {
        (*((void (**)(void *))v100 + 2))(v100);
      }

LABEL_144:
      CGRect v16 = v137;
      goto LABEL_141;
    }
    [v156 rate];
    if (v95 != 0.0)
    {
      v96 = PLWallpaperGetLog();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
      {
        v97 = @"Ignoring";
        if (v135) {
          v97 = @"Honoring";
        }
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v97;
        _os_log_impl(&dword_1AE9F8000, v96, OS_LOG_TYPE_INFO, "%@ request to end settling effect to accommodate unanimated transition to full luminance", buf, 0xCu);
      }
    }
    CGRect v16 = v137;
    if (v135)
    {
      *(_OWORD *)long long buf = *MEMORY[0x1E4F1FA48];
      *(void *)&uint8_t buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      [v156 seekToTime:buf];
      [v156 pause];
      [v12 setAlpha:1.0];
      double v98 = 1.0;
      v99 = v14;
      goto LABEL_117;
    }
  }
  else
  {
    v144 = v10;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_3;
    aBlock[3] = &unk_1E5F279C0;
    int v134 = v40;
    char v190 = v40;
    BOOL v191 = IsReduceMotionEnabled;
    void aBlock[4] = v33;
    id v59 = v12;
    id v186 = v59;
    id v60 = v14;
    id v187 = v60;
    id v61 = v16;
    id v188 = v61;
    id v62 = v18;
    id v189 = v62;
    id v63 = _Block_copy(aBlock);
    id v64 = [(PUWallpaperPosterController *)v33 transformAnimator];
    [v64 stopAnimation:1];

    int v65 = !v149;
    v136 = v63;
    int v150 = !v149;
    if (!v34 || IsReduceMotionEnabled || v65)
    {
      (*((void (**)(void *))v63 + 2))(v63);
      id v71 = v157;
    }
    else
    {
      id v66 = (void *)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:0];
      __int16 v67 = v19;
      id v68 = v18;
      id v69 = objc_alloc(MEMORY[0x1E4FB1ED8]);
      objc_msgSend(v148, "px_backlightTransformAnimationDuration");
      id v70 = objc_msgSend(v69, "initWithDuration:timingParameters:", v66);
      [v70 addAnimations:v63];
      [v70 startAnimation];
      id v71 = v157;
      [(PUWallpaperPosterController *)v157 setTransformAnimator:v70];

      CGRect v18 = v68;
      CGRect v19 = v67;
      int64_t v34 = a3;
    }
    if ([(PUWallpaperPosterController *)v71 wantsLowLuminanceContent])
    {
      v72 = v71;
      char v73 = IsReduceMotionEnabled;
      v138 = v16;
      v141 = v18;
      if (IsReduceMotionEnabled)
      {
        char v73 = 0;
        int v74 = v134;
        if ((unint64_t)(v34 + 1) <= 3 && v34)
        {
          id v75 = [v59 currentLayoutInfo];
          id v76 = v75;
          if (v75) {
            [v75 additionalTransform];
          }
          else {
            memset(&t2, 0, sizeof(t2));
          }
          long long v107 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          long long v158 = *MEMORY[0x1E4F1DAB8];
          *(_OWORD *)long long buf = *MEMORY[0x1E4F1DAB8];
          *(_OWORD *)&uint8_t buf[16] = v107;
          long long v153 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
          long long v155 = v107;
          *(_OWORD *)v215 = v153;
          CGAffineTransformConcat(&v184, (CGAffineTransform *)buf, &t2);
          CGAffineTransform v182 = v184;
          [v59 setTransform:&v182];

          v108 = [v60 currentLayoutInfo];
          v109 = v108;
          if (v108) {
            [v108 additionalTransform];
          }
          else {
            memset(&v180, 0, sizeof(v180));
          }
          *(_OWORD *)long long buf = v158;
          *(_OWORD *)&uint8_t buf[16] = v155;
          *(_OWORD *)v215 = v153;
          CGAffineTransformConcat(&v181, (CGAffineTransform *)buf, &v180);
          CGAffineTransform v179 = v181;
          [v60 setTransform:&v179];

          [(PUWallpaperPosterController *)v72 _inactiveTransform];
          v178[0] = v178[3];
          v178[1] = v178[4];
          v178[2] = v178[5];
          [v62 setTransform:v178];
          [(PUWallpaperPosterController *)v72 _inactiveTransform];
          v177[0] = v177[3];
          v177[1] = v177[4];
          v177[2] = v177[5];
          [v61 setTransform:v177];
          char v73 = 1;
        }
      }
      else
      {
        int v74 = v134;
      }
      v170[0] = MEMORY[0x1E4F143A8];
      v170[1] = 3221225472;
      v170[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_4;
      v170[3] = &unk_1E5F279C0;
      char v175 = v73;
      char v176 = v74;
      v170[4] = v72;
      id v110 = v59;
      id v171 = v110;
      id v111 = v60;
      id v172 = v111;
      id v173 = v62;
      id v112 = v61;
      id v174 = v112;
      v113 = (void (**)(void))_Block_copy(v170);
      v168[0] = MEMORY[0x1E4F143A8];
      v168[1] = 3221225472;
      v168[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_5;
      v168[3] = &unk_1E5F2ED10;
      id v114 = v111;
      id v169 = v114;
      v115 = (void (**)(void))_Block_copy(v168);
      int v116 = v74;
      v117 = v115;
      if (v116) {
        double v118 = 1.0;
      }
      else {
        double v118 = 0.0;
      }
      if (v116) {
        double v119 = 0.0;
      }
      else {
        double v119 = 1.0;
      }
      v162[0] = MEMORY[0x1E4F143A8];
      v162[1] = 3221225472;
      v162[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_6;
      v162[3] = &unk_1E5F279E8;
      id v163 = v110;
      double v166 = v118;
      id v120 = v114;
      id v164 = v120;
      id v165 = v112;
      double v167 = v119;
      v121 = (void (**)(void))_Block_copy(v162);
      v122 = [(PUWallpaperPosterController *)v72 alphaAnimator];
      v123 = v122;
      if (a4) {
        int v124 = v150;
      }
      else {
        int v124 = 1;
      }
      if (!v34 || v124)
      {
        if ([v122 isRunning])
        {
          [v123 stopAnimation:1];
          v117[2](v117);
        }
        v121[2](v121);
        v113[2](v113);
      }
      else
      {
        [v122 stopAnimation:1];
        uint64_t v125 = *MEMORY[0x1E4F3A2E8];
        [v120 layer];
        v127 = v126 = v72;
        [v127 setCompositingFilter:v125];

        v128 = (void *)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:0];
        id v129 = objc_alloc(MEMORY[0x1E4FB1ED8]);
        objc_msgSend(v148, "px_lowLuminanceAlphaAnimationDuration");
        v130 = objc_msgSend(v129, "initWithDuration:timingParameters:", v128);
        [v130 addAnimations:v121];
        v159[0] = MEMORY[0x1E4F143A8];
        v159[1] = 3221225472;
        v159[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_7;
        v159[3] = &unk_1E5F285F0;
        v160 = v117;
        v161 = v113;
        [v130 addCompletion:v159];
        [v130 startAnimation];
        [(PUWallpaperPosterController *)v126 setAlphaAnimator:v130];
      }
      CGRect v18 = v141;

      CGRect v16 = v138;
    }

    int v10 = v144;
    BOOL v12 = v145;
    id v14 = v147;
  }
LABEL_141:
}

void __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [v3 layer];
  long long v5 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  [v4 setValue:v5 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  char v6 = [v3 layer];

  long long v7 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 88);
  v10[2] = *(_OWORD *)(a1 + 72);
  _OWORD v10[3] = v8;
  v10[4] = *(_OWORD *)(a1 + 104);
  v10[0] = *(_OWORD *)(a1 + 40);
  v10[1] = v7;
  int64_t v9 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v10];
  [v6 setValue:v9 forKeyPath:@"filters.colorMatrix.inputColorMatrix"];
}

uint64_t __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) layer];
  id v3 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  [v2 setValue:v3 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  long long v4 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v4();
}

uint64_t __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_103(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

uint64_t __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_2_104(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 40) setAlpha:0.0];
  uint64_t v2 = *(void **)(a1 + 48);
  return [v2 setAlpha:0.0];
}

void __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72) || (int v2 = *(unsigned __int8 *)(a1 + 73), memset(&v30, 0, sizeof(v30)), v2))
  {
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v30.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v30.c = v3;
    *(_OWORD *)&v30.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGRect v16 = *(void **)(a1 + 32);
    if (v16) {
      [v16 _inactiveTransform];
    }
  }
  long long v4 = [*(id *)(a1 + 40) currentLayoutInfo];
  long long v5 = v4;
  if (v4) {
    [v4 additionalTransform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransform t1 = v30;
  CGAffineTransformConcat(&v29, &t1, &t2);
  char v6 = *(void **)(a1 + 40);
  CGAffineTransform v26 = v29;
  [v6 setTransform:&v26];

  long long v7 = [*(id *)(a1 + 48) currentLayoutInfo];
  long long v8 = v7;
  if (v7) {
    [v7 additionalTransform];
  }
  else {
    memset(&v24, 0, sizeof(v24));
  }
  CGAffineTransform t1 = v30;
  CGAffineTransformConcat(&v25, &t1, &v24);
  int64_t v9 = *(void **)(a1 + 48);
  CGAffineTransform v23 = v25;
  [v9 setTransform:&v23];

  int v10 = [*(id *)(a1 + 56) currentLayoutInfo];
  BOOL v11 = v10;
  if (v10) {
    [v10 additionalTransform];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }
  CGAffineTransform t1 = v30;
  CGAffineTransformConcat(&v22, &t1, &v21);
  BOOL v12 = *(void **)(a1 + 56);
  CGAffineTransform v20 = v22;
  [v12 setTransform:&v20];

  char v13 = [*(id *)(a1 + 64) currentLayoutInfo];
  id v14 = v13;
  if (v13) {
    [v13 additionalTransform];
  }
  else {
    memset(&v18, 0, sizeof(v18));
  }
  CGAffineTransform t1 = v30;
  CGAffineTransformConcat(&v19, &t1, &v18);
  int v15 = *(void **)(a1 + 64);
  CGAffineTransform v17 = v19;
  [v15 setTransform:&v17];
}

void __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72) && *(unsigned char *)(a1 + 73))
  {
    int v2 = [*(id *)(a1 + 32) transformAnimator];
    [v2 stopAnimation:1];

    long long v3 = [*(id *)(a1 + 40) currentLayoutInfo];
    long long v4 = v3;
    if (v3) {
      [v3 additionalTransform];
    }
    else {
      memset(&t2, 0, sizeof(t2));
    }
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v17 = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&t1.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&t1.c = v16;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&t1.tCGFloat x = v15;
    CGAffineTransformConcat(&v30, &t1, &t2);
    long long v5 = *(void **)(a1 + 40);
    CGAffineTransform v27 = v30;
    [v5 setTransform:&v27];

    char v6 = [*(id *)(a1 + 48) currentLayoutInfo];
    long long v7 = v6;
    if (v6) {
      [v6 additionalTransform];
    }
    else {
      memset(&v25, 0, sizeof(v25));
    }
    *(_OWORD *)&t1.a = v17;
    *(_OWORD *)&t1.c = v16;
    *(_OWORD *)&t1.tCGFloat x = v15;
    CGAffineTransformConcat(&v26, &t1, &v25);
    long long v8 = *(void **)(a1 + 48);
    CGAffineTransform v24 = v26;
    [v8 setTransform:&v24];

    int64_t v9 = [*(id *)(a1 + 56) currentLayoutInfo];
    int v10 = v9;
    if (v9) {
      [v9 additionalTransform];
    }
    else {
      memset(&v22, 0, sizeof(v22));
    }
    *(_OWORD *)&t1.a = v17;
    *(_OWORD *)&t1.c = v16;
    *(_OWORD *)&t1.tCGFloat x = v15;
    CGAffineTransformConcat(&v23, &t1, &v22);
    BOOL v11 = *(void **)(a1 + 56);
    CGAffineTransform v21 = v23;
    [v11 setTransform:&v21];

    BOOL v12 = [*(id *)(a1 + 40) currentLayoutInfo];
    char v13 = v12;
    if (v12) {
      [v12 additionalTransform];
    }
    else {
      memset(&v19, 0, sizeof(v19));
    }
    *(_OWORD *)&t1.a = v17;
    *(_OWORD *)&t1.c = v16;
    *(_OWORD *)&t1.tCGFloat x = v15;
    CGAffineTransformConcat(&v20, &t1, &v19);
    id v14 = *(void **)(a1 + 64);
    CGAffineTransform v18 = v20;
    [v14 setTransform:&v18];
  }
}

void __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) layer];
  [v1 setCompositingFilter:0];
}

uint64_t __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 56)];
  [*(id *)(a1 + 40) setAlpha:*(double *)(a1 + 56)];
  double v2 = *(double *)(a1 + 64);
  long long v3 = *(void **)(a1 + 48);
  return [v3 setAlpha:v2];
}

uint64_t __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_7(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v3 = result;
    (*(void (**)(void))(*(void *)(result + 32) + 16))();
    long long v4 = *(uint64_t (**)(void))(*(void *)(v3 + 40) + 16);
    return v4();
  }
  return result;
}

- (void)setBacklightLuminance:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t backlightLuminance = self->_backlightLuminance;
  if (backlightLuminance != a3)
  {
    self->_int64_t backlightLuminance = a3;
    char v6 = [(PUWallpaperPosterController *)self posterConfiguration];
    long long v7 = [v6 shuffleConfiguration];
    uint64_t v8 = [v7 shuffleFrequency];

    if (a3 == 1)
    {
      BOOL v9 = [(PUWallpaperPosterController *)self wantsLowLuminanceContent];
      BOOL v10 = backlightLuminance != 2;
      if (backlightLuminance == 2 && v8 == 2 && v9)
      {
        if (![(PUWallpaperPosterController *)self significantEventsCounter]) {
          [(PUWallpaperPosterController *)self setNeedsFirstLockSignificantEvent:1];
        }
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = backlightLuminance != 2;
    }
    BOOL v11 = [(PUWallpaperPosterController *)self _shouldAnimateShuffleTransitionToSleep];
    if (v10 || !v11) {
      goto LABEL_15;
    }
    BOOL v12 = PLWallpaperGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      char v13 = [(PUWallpaperPosterController *)self _nameForBacklightLuminance:a3];
      int v14 = 138412290;
      long long v15 = v13;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_INFO, "setBacklightLuminance:%@ delegating transition to _animateShuffleTransitionToSleep", (uint8_t *)&v14, 0xCu);
    }
    if (![(PUWallpaperPosterController *)self _animateShuffleTransitionToSleep]) {
LABEL_15:
    }
      [(PUWallpaperPosterController *)self _transitionToBacklightLuminance:a3 previousBacklightLuminance:backlightLuminance animated:1 interruptSettlingEffectPlayback:1];
  }
}

- (void)_updateBacklightLuminance
{
  id v3 = [(PUWallpaperPosterController *)self viewModel];
  -[PUWallpaperPosterController setBacklightLuminance:](self, "setBacklightLuminance:", [v3 backlightLuminance]);
}

- (void)_hideProgressIndicator
{
  id v2 = [(PUWallpaperPosterController *)self progressIndicator];
  [v2 stopAnimating];
}

- (void)_showProgressIndicator
{
  id v2 = [(PUWallpaperPosterController *)self progressIndicator];
  [v2 startAnimating];
}

- (void)_updateViewHierarchy
{
  [(PUWallpaperPosterController *)self _transitionToBacklightLuminance:[(PUWallpaperPosterController *)self backlightLuminance] previousBacklightLuminance:-1 animated:0 interruptSettlingEffectPlayback:0];
  id v22 = [(PUWallpaperPosterController *)self viewModel];
  id v3 = [v22 viewManager];
  long long v4 = [v22 currentLayerStack];
  long long v5 = [v4 settlingEffectLayer];
  uint64_t v6 = [v3 viewForLayer:v5];

  long long v7 = [v4 inactiveBackgroundLayer];
  uint64_t v8 = [v3 viewForLayer:v7];

  BOOL v9 = [v4 backgroundLayer];
  CGAffineTransform v19 = [v3 viewForLayer:v9];

  BOOL v10 = [v4 inactiveForegroundLayer];
  CGAffineTransform v21 = [v3 viewForLayer:v10];

  BOOL v11 = [v4 foregroundLayer];
  BOOL v12 = [v3 viewForLayer:v11];

  char v13 = [(PUWallpaperPosterController *)self renderer];
  int v14 = [v13 backgroundView];
  long long v15 = [v13 foregroundView];
  uint64_t v16 = [v13 floatingView];
  [v14 addSubview:v8];
  if (v6) {
    [v14 addSubview:v6];
  }
  CGAffineTransform v20 = (void *)v6;
  [v14 addSubview:v19];
  if ([v22 clockAppearsAboveForeground]) {
    long long v17 = v15;
  }
  else {
    long long v17 = v16;
  }
  [v17 addSubview:v21];
  [v17 addSubview:v12];
  if ([v22 showsDebugHUD])
  {
    CGAffineTransform v18 = [v3 debugInfoView];
    [v16 addSubview:v18];
  }
  [(PUWallpaperPosterController *)self _invalidateDebugHUD];
}

- (void)_removeExistingViews
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(PUWallpaperPosterController *)self viewModel];
  id v3 = [v2 viewManager];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v4 = objc_msgSend(v3, "createdLayerViews", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) removeFromSuperview];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateDeviceOrientation
{
  if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration])
  {
    id v3 = [(PUWallpaperPosterController *)self environment];
    uint64_t v4 = objc_msgSend(v3, "px_deviceOrientation");

    uint64_t v5 = [(PUWallpaperPosterController *)self viewModel];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__PUWallpaperPosterController__updateDeviceOrientation__block_invoke;
    v6[3] = &__block_descriptor_40_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    v6[4] = v4;
    [v5 performChanges:v6];

    [(PUWallpaperPosterController *)self _invalidateDebugHUD];
  }
}

uint64_t __55__PUWallpaperPosterController__updateDeviceOrientation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeviceOrientation:*(void *)(a1 + 32)];
}

- (void)_updateContainerFrame
{
  id v3 = [(PUWallpaperPosterController *)self renderer];
  uint64_t v4 = [v3 backgroundView];
  [v4 bounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;

  long long v9 = [(PUWallpaperPosterController *)self viewModel];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PUWallpaperPosterController__updateContainerFrame__block_invoke;
  _OWORD v10[3] = &__block_descriptor_48_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
  v10[4] = v6;
  _OWORD v10[5] = v8;
  [v9 performChanges:v10];

  [(PUWallpaperPosterController *)self _invalidateDebugHUD];
}

void __52__PUWallpaperPosterController__updateContainerFrame__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  PXRectWithOriginAndSize();
  objc_msgSend(v2, "setContainerFrame:");
}

- (void)setViewModel:(id)a3
{
  uint64_t v8 = (PUParallaxLayerStackViewModel *)a3;
  uint64_t v5 = self->_viewModel;
  if (v5 == v8)
  {
  }
  else
  {
    uint64_t v6 = v5;
    char v7 = [(PUParallaxLayerStackViewModel *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      [(PUWallpaperPosterController *)self _removeExistingViews];
      [(PUParallaxLayerStackViewModel *)self->_viewModel unregisterChangeObserver:self context:"ViewModelObservationContext"];
      objc_storeStrong((id *)&self->_viewModel, a3);
      [(PUParallaxLayerStackViewModel *)v8 registerChangeObserver:self context:"ViewModelObservationContext"];
      if (v8)
      {
        [(PUWallpaperPosterController *)self _updateDeviceOrientation];
        [(PUWallpaperPosterController *)self _updateContainerFrame];
        [(PUWallpaperPosterController *)self _updatePreferences];
        [(PUWallpaperPosterController *)self _updateViewHierarchy];
        [(PUWallpaperPosterController *)self _observeCurrentPlayerItem];
      }
    }
  }
}

- (void)setEnvironment:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = self->_environment;
  objc_storeStrong((id *)&self->_environment, a3);
  if (v5)
  {
    if (objc_msgSend(v5, "px_isCallServices"))
    {
      char v7 = [MEMORY[0x1E4F8CCC0] standardAlphabeticTextParameters];
      [MEMORY[0x1E4F8CCC0] setSystemParameters:v7];
    }
    uint64_t v8 = [(PXPosterRenderingEnvironment *)v6 px_significantEventsCounter];
    if (v8 != objc_msgSend(v5, "px_significantEventsCounter")) {
      -[PUWallpaperPosterController setSignificantEventsCounter:](self, "setSignificantEventsCounter:", objc_msgSend(v5, "px_significantEventsCounter"));
    }
    id v9 = [(PXPosterRenderingEnvironment *)v6 px_assetDirectory];
    objc_msgSend(v5, "px_assetDirectory");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
    {
    }
    else
    {
      long long v11 = v10;
      char v12 = [v9 isEqual:v10];

      if ((v12 & 1) == 0) {
        [(PUWallpaperPosterController *)self _loadContentsFromEnvironment];
      }
    }
    uint64_t v13 = [(PXPosterRenderingEnvironment *)v6 px_backlightLuminance];
    if (v13 != objc_msgSend(v5, "px_backlightLuminance"))
    {
      uint64_t v14 = [(PUWallpaperPosterController *)self viewModel];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __46__PUWallpaperPosterController_setEnvironment___block_invoke;
      v31[3] = &unk_1E5F2E420;
      id v32 = v5;
      [v14 performChanges:v31];
    }
    uint64_t v15 = [(PXPosterRenderingEnvironment *)v6 px_deviceOrientation];
    if (v15 != objc_msgSend(v5, "px_deviceOrientation")) {
      [(PUWallpaperPosterController *)self _updateDeviceOrientation];
    }
    uint64_t v16 = [(PUWallpaperPosterController *)self viewModel];
    long long v17 = [v16 viewManager];
    CGAffineTransform v18 = [v17 videoLayerView];
    CGAffineTransform v19 = [v18 player];
    [v19 rate];
    float v21 = v20;

    if (objc_msgSend(v5, "px_isSnapshot") && v21 == 1.0) {
      [(PUWallpaperPosterController *)self _transitionToBacklightLuminance:2 previousBacklightLuminance:-1 animated:0 interruptSettlingEffectPlayback:1];
    }
    if ((objc_msgSend(v5, "px_isSnapshot") & 1) == 0
      && objc_msgSend(v5, "px_isPreview")
      && [v16 settlingEffectEnabled]
      && !UIAccessibilityIsReduceMotionEnabled())
    {
      id v22 = PLWallpaperGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_DEFAULT, "Settling effect is requested to playback live in the gallery", buf, 2u);
      }

      CGAffineTransform v23 = [(PUWallpaperPosterController *)self viewModel];
      [v23 performChanges:&__block_literal_global_62_46838];
    }
    if ([(PUWallpaperPosterController *)self needsUpgrade])
    {
      CGAffineTransform v24 = [MEMORY[0x1E4F1C9C8] now];
      CGAffineTransform v25 = [(PUWallpaperPosterController *)self lastUpgradeCheckTime];
      [v24 timeIntervalSinceDate:v25];
      double v27 = v26;

      [(PUWallpaperPosterController *)self nextUpgradeCheckDelay];
      if (v27 >= v28)
      {
        CGAffineTransform v29 = PLWallpaperGetLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          double v34 = v27 / 60.0;
          _os_log_impl(&dword_1AE9F8000, v29, OS_LOG_TYPE_DEFAULT, "Still needs upgrade after %0.0f minutes, checking again...", buf, 0xCu);
        }

        [(PUWallpaperPosterController *)self setNeedsUpgrade:[(PUWallpaperPosterController *)self triggerPosterUpgradeIfNecessary]];
        [(PUWallpaperPosterController *)self setLastUpgradeCheckTime:v24];
        [(PUWallpaperPosterController *)self nextUpgradeCheckDelay];
        [(PUWallpaperPosterController *)self setNextUpgradeCheckDelay:v30 + v30];
      }
    }
  }
  else
  {
    [(PUWallpaperPosterController *)self _invalidateCurrentPosterMedia];
  }
}

void __46__PUWallpaperPosterController_setEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setBacklightLuminance:", objc_msgSend(v2, "px_backlightLuminance"));
}

uint64_t __46__PUWallpaperPosterController_setEnvironment___block_invoke_60(uint64_t a1, void *a2)
{
  return [a2 setShouldLoopSettlingEffectForGallery:1];
}

- (BOOL)wantsLowLuminanceContent
{
  if (PFPosterWantsLowLuminanceContent())
  {
    id v3 = [(PUWallpaperPosterController *)self environment];
    int v4 = objc_msgSend(v3, "px_isCallServices") ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)dealloc
{
  id v3 = [(PUWallpaperPosterController *)self observedPlayerItem];
  [v3 removeObserver:self forKeyPath:@"status" context:&PlayerItemObservationContext_46629];

  [(PUWallpaperPosterController *)self _endExtendedRenderSession];
  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperPosterController;
  [(PUWallpaperPosterController *)&v4 dealloc];
}

- (PUWallpaperPosterController)initWithRenderer:(id)a3 photoLibrary:(id)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PUWallpaperPosterController;
  id v9 = [(PUWallpaperPosterController *)&v28 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_renderer, a3);
    objc_storeStrong((id *)&v10->_photoLibrary, a4);
    long long v11 = PLWallpaperGetLog();
    v10->_os_signpost_id_t signpost = os_signpost_id_make_with_pointer(v11, v10);

    v10->_int64_t backlightLuminance = -1;
    char v12 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x1E4FB1400]);
    uint64_t v13 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIActivityIndicatorView *)v12 setColor:v13];

    [(UIActivityIndicatorView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v27 = v8;
    progressIndicator = v10->_progressIndicator;
    v10->_progressIndicator = v12;
    uint64_t v15 = v12;

    uint64_t v16 = [v7 floatingView];
    [v16 addSubview:v15];
    CGAffineTransform v25 = (void *)MEMORY[0x1E4F28DC8];
    double v26 = [(UIActivityIndicatorView *)v15 centerYAnchor];
    long long v17 = [v16 centerYAnchor];
    CGAffineTransform v18 = [v26 constraintEqualToAnchor:v17];
    v29[0] = v18;
    CGAffineTransform v19 = [(UIActivityIndicatorView *)v15 centerXAnchor];
    float v20 = [v16 centerXAnchor];
    float v21 = [v19 constraintEqualToAnchor:v20];
    v29[1] = v21;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    [v25 activateConstraints:v22];

    [(PUWallpaperPosterController *)v10 _invalidateDebugHUD];
    CGAffineTransform v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v10 selector:sel__lowPowerModeChanged_ name:*MEMORY[0x1E4F287E8] object:0];

    id v8 = v27;
  }

  return v10;
}

+ (id)_nonBlockingLoadQueue
{
  if (_nonBlockingLoadQueue_onceToken != -1) {
    dispatch_once(&_nonBlockingLoadQueue_onceToken, &__block_literal_global_46851);
  }
  id v2 = (void *)_nonBlockingLoadQueue_nonBlockingLoadQueue;
  return v2;
}

void __52__PUWallpaperPosterController__nonBlockingLoadQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.wallpaperpostercontroller.nonblockingload", attr);
  id v2 = (void *)_nonBlockingLoadQueue_nonBlockingLoadQueue;
  _nonBlockingLoadQueue_nonBlockingLoadQueue = (uint64_t)v1;
}

@end