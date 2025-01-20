@interface PXImageModulationManager
+ ($5A0616AB7869379E861635CACF312FD6)optionsForAsset:(id)a3;
+ (double)HDRValueForAsset:(id)a3;
+ (double)_hdrGainForAsset:(id)a3;
+ (int64_t)_contentFormatForAsset:(id)a3;
- (BOOL)_needsUpdate;
- (BOOL)currentScreenSupportsHDR;
- (BOOL)enabledForTesting;
- (BOOL)isActive;
- (BOOL)isApplicationActive;
- (BOOL)isEnabled;
- (BOOL)isLowPowerModeEnabled;
- (BOOL)isMainScreen;
- (CAContext)coreAnimationContext;
- (NSHashTable)imageLayerModulators;
- (PXImageModulationManager)init;
- (PXImageModulationManager)initWithRootViewController:(id)a3 mainScreen:(BOOL)a4;
- (PXImageModulationSettings)settings;
- (PXRequestedEDRHeadroomFactorFilter)requestedEDRHeadroomFactorFilter;
- (UIViewController)rootViewController;
- (double)HDRFocus;
- (double)imageModulationIntensity;
- (double)requestedEDRHeadroomFactor;
- (id)_checkoutImageLayerModulatorWithOptions:(id)a3 contentType:(int64_t)a4;
- (id)checkoutImageLayerModulatorWithOptions:(id)a3;
- (id)checkoutLivePhotoViewModulatorWithOptions:(id)a3;
- (int64_t)requestedEDRHeadroomSignpost;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidResignActive:(id)a3;
- (void)_didEndRequestingEDRHeadroomFactor:(double)a3;
- (void)_didStartRequestingEDRHeadroomFactor:(double)a3;
- (void)_invalidateActive;
- (void)_invalidateCurrentScreenSupportsHDR;
- (void)_invalidateDesiredDynamicRange;
- (void)_invalidateEnabled;
- (void)_invalidateFinalRequestedEDRHeadroomFactor;
- (void)_invalidateHDRFocus;
- (void)_invalidateImageLayerModulators;
- (void)_invalidateImageModulationIntensity;
- (void)_invalidateLowPowerModeEnabled;
- (void)_invalidateRequestedEDRHeadroomFactor;
- (void)_processInfoPowerStateDidChange:(id)a3;
- (void)_setNeedsUpdate;
- (void)_updateActiveIfNeeded;
- (void)_updateCoreAnimationContext;
- (void)_updateCurrentScreenSupportsHDRIfNeeded;
- (void)_updateDesiredDynamicRangeIfNeeded;
- (void)_updateEnabledIfNeeded;
- (void)_updateFinalRequestedEDRHeadroomFactorIfNeeded;
- (void)_updateHDRFocusIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateImageLayerModulator:(id)a3;
- (void)_updateImageLayerModulatorsIfNeeded;
- (void)_updateImageModulationIntensityIfNeeded;
- (void)_updateLowPowerModeEnabledIfNeeded;
- (void)_updateRequestedEDRHeadroomFactorIfNeeded;
- (void)checkInImageLayerModulator:(id)a3;
- (void)checkInLivePhotoViewModulator:(id)a3;
- (void)dealloc;
- (void)didPerformChanges;
- (void)enableForTesting;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)preferencesDidChange;
- (void)setActive:(BOOL)a3;
- (void)setApplicationActive:(BOOL)a3;
- (void)setCoreAnimationContext:(id)a3;
- (void)setCurrentScreenSupportsHDR:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabledForTesting:(BOOL)a3;
- (void)setHDRFocus:(double)a3;
- (void)setImageModulationIntensity:(double)a3;
- (void)setLowPowerModeEnabled:(BOOL)a3;
- (void)setNeedsEnabledUpdate;
- (void)setNeedsHDRFocusUpdate;
- (void)setNeedsImageModulationIntensityUpdate;
- (void)setRequestedEDRHeadroomFactor:(double)a3;
- (void)setRequestedEDRHeadroomSignpost:(int64_t)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PXImageModulationManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rootViewController);
  objc_storeStrong((id *)&self->_coreAnimationContext, 0);
  objc_storeStrong((id *)&self->_requestedEDRHeadroomFactorFilter, 0);
  objc_storeStrong((id *)&self->_imageLayerModulators, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (double)requestedEDRHeadroomFactor
{
  return self->_requestedEDRHeadroomFactor;
}

- (double)imageModulationIntensity
{
  return self->_imageModulationIntensity;
}

- (double)HDRFocus
{
  return self->_HDRFocus;
}

- (BOOL)currentScreenSupportsHDR
{
  return self->_currentScreenSupportsHDR;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isMainScreen
{
  return self->_mainScreen;
}

- (UIViewController)rootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootViewController);
  return (UIViewController *)WeakRetained;
}

- (BOOL)enabledForTesting
{
  return self->_enabledForTesting;
}

- (BOOL)isApplicationActive
{
  return self->_applicationActive;
}

- (BOOL)isLowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (CAContext)coreAnimationContext
{
  return self->_coreAnimationContext;
}

- (void)setRequestedEDRHeadroomSignpost:(int64_t)a3
{
  self->_requestedEDRHeadroomSignpost = a3;
}

- (int64_t)requestedEDRHeadroomSignpost
{
  return self->_requestedEDRHeadroomSignpost;
}

- (PXRequestedEDRHeadroomFactorFilter)requestedEDRHeadroomFactorFilter
{
  return self->_requestedEDRHeadroomFactorFilter;
}

- (NSHashTable)imageLayerModulators
{
  return self->_imageLayerModulators;
}

- (PXImageModulationSettings)settings
{
  return self->_settings;
}

- (void)preferencesDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__PXImageModulationManager_preferencesDidChange__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXImageModulationManager *)self performChanges:v2];
}

uint64_t __48__PXImageModulationManager_preferencesDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateActive];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PXImageModulationManager_settings_changedValueForKey___block_invoke;
  v7[3] = &unk_1E5DD0328;
  id v8 = v5;
  v9 = self;
  id v6 = v5;
  [(PXImageModulationManager *)self performChanges:v7];
}

uint64_t __56__PXImageModulationManager_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"enabled"]) {
    [*(id *)(a1 + 40) _invalidateEnabled];
  }
  if (([*(id *)(a1 + 32) isEqualToString:@"EDRHeadroomRequestScheme"] & 1) != 0
    || ([*(id *)(a1 + 32) isEqualToString:@"manualEDRHeadroomRequestStops"] & 1) != 0
    || (uint64_t result = [*(id *)(a1 + 32) isEqualToString:@"EDRHeadroomRequestHDRThreshold"],
        result))
  {
    v3 = *(void **)(a1 + 40);
    return [v3 _invalidateRequestedEDRHeadroomFactor];
  }
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXRequestedEDRHeadroomFactorFilterObservationContext != a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXImageModulationManager.m" lineNumber:835 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  if ((v6 & 2) != 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__PXImageModulationManager_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5DD0FA8;
    v12[4] = self;
    [(PXImageModulationManager *)self performChanges:v12];
  }
}

uint64_t __57__PXImageModulationManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateFinalRequestedEDRHeadroomFactor];
}

- (void)_updateCurrentScreenSupportsHDRIfNeeded
{
  if (self->_needsUpdateFlags.currentScreenSupportsHDR) {
    self->_needsUpdateFlags.currentScreenSupportsHDR = 0;
  }
}

- (void)_invalidateCurrentScreenSupportsHDR
{
  self->_needsUpdateFlags.currentScreenSupportsHDR = 1;
  [(PXImageModulationManager *)self _setNeedsUpdate];
}

- (void)_updateImageLayerModulatorsIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdateFlags.imageLayerModulators)
  {
    self->_needsUpdateFlags.imageLayerModulators = 0;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = [(PXImageModulationManager *)self imageLayerModulators];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [(PXImageModulationManager *)self _updateImageLayerModulator:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)_invalidateImageLayerModulators
{
  self->_needsUpdateFlags.imageLayerModulators = 1;
  [(PXImageModulationManager *)self _setNeedsUpdate];
}

- (void)_updateDesiredDynamicRangeIfNeeded
{
  if (self->_needsUpdateFlags.desiredDynamicRange)
  {
    self->_needsUpdateFlags.desiredDynamicRange = 0;
    BOOL v3 = [(PXImageModulationManager *)self enabledForTesting];
    if (v3)
    {
      id v8 = +[PXImageModulationSettings sharedInstance];
      [v8 deviceMaximumEDRHeadroomStops];
    }
    else
    {
      [(PXImageModulationManager *)self requestedEDRHeadroomFactor];
    }
    float v5 = v4;
    uint64_t v6 = [(PXImageModulationManager *)self coreAnimationContext];
    *(float *)&double v7 = v5;
    [v6 setDesiredDynamicRange:v7];

    if (v3)
    {
    }
  }
}

- (void)_invalidateDesiredDynamicRange
{
  self->_needsUpdateFlags.desiredDynamicRange = 1;
  [(PXImageModulationManager *)self _setNeedsUpdate];
}

- (void)_updateFinalRequestedEDRHeadroomFactorIfNeeded
{
  if (self->_needsUpdateFlags.finalRequestedEDRHeadroomFactor)
  {
    self->_needsUpdateFlags.finalRequestedEDRHeadroomFactor = 0;
    id v3 = [(PXImageModulationManager *)self requestedEDRHeadroomFactorFilter];
    [v3 output];
    -[PXImageModulationManager setRequestedEDRHeadroomFactor:](self, "setRequestedEDRHeadroomFactor:");
  }
}

- (void)_invalidateFinalRequestedEDRHeadroomFactor
{
  self->_needsUpdateFlags.finalRequestedEDRHeadroomFactor = 1;
  [(PXImageModulationManager *)self _setNeedsUpdate];
}

- (void)_updateRequestedEDRHeadroomFactorIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_needsUpdateFlags.requestedEDRHeadroomFactor) {
    return;
  }
  self->_needsUpdateFlags.requestedEDRHeadroomFactor = 0;
  double v3 = 0.0;
  if ([(PXImageModulationManager *)self isEnabled]
    && [(PXImageModulationManager *)self isApplicationActive])
  {
    double v4 = [(PXImageModulationManager *)self settings];
    uint64_t v5 = [v4 EDRHeadroomRequestScheme];
    if (v5 == 2)
    {
      [(PXImageModulationManager *)self imageModulationIntensity];
      if (v7 > 0.0) {
        goto LABEL_11;
      }
    }
    else
    {
      if (v5 != 1)
      {
        if (v5)
        {
LABEL_13:
          [v4 deviceMaximumEDRHeadroomStops];
          double v3 = fmin(v3, v11);

          goto LABEL_14;
        }
        [v4 manualEDRHeadroomRequestStops];
LABEL_12:
        double v3 = v6;
        goto LABEL_13;
      }
      [(PXImageModulationManager *)self HDRFocus];
      double v9 = v8;
      [v4 EDRHeadroomRequestHDRThreshold];
      if (v9 >= v10)
      {
LABEL_11:
        [v4 highEDRRequestedHeadroomStops];
        goto LABEL_12;
      }
    }
    [v4 lowEDRRequestedHeadroomStops];
    goto LABEL_12;
  }
LABEL_14:
  long double v12 = pow(2.0, v3);
  uint64_t v13 = PLUIGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    long double v17 = log2(v12);
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEBUG, "[ImageModulation] unfiltered requestedEDRHeadroomFactor: %f", buf, 0xCu);
  }

  v14 = [(PXImageModulationManager *)self requestedEDRHeadroomFactorFilter];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__PXImageModulationManager__updateRequestedEDRHeadroomFactorIfNeeded__block_invoke;
  v15[3] = &__block_descriptor_40_e33_v16__0___PXMutableNumberFilter__8l;
  *(long double *)&v15[4] = v12;
  [v14 performChanges:v15];
}

uint64_t __69__PXImageModulationManager__updateRequestedEDRHeadroomFactorIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInput:*(double *)(a1 + 32)];
}

- (void)_invalidateRequestedEDRHeadroomFactor
{
  self->_needsUpdateFlags.requestedEDRHeadroomFactor = 1;
  [(PXImageModulationManager *)self _setNeedsUpdate];
}

- (void)_updateImageModulationIntensityIfNeeded
{
  if (self->_needsUpdateFlags.imageModulationIntensity)
  {
    self->_needsUpdateFlags.imageModulationIntensity = 0;
    double v3 = [(PXImageModulationManager *)self rootViewController];
    objc_msgSend(v3, "px_effectiveImageModulationIntensity");
    double v5 = v4;

    if (v5 != -1.79769313e308)
    {
      [(PXImageModulationManager *)self setImageModulationIntensity:v5];
    }
  }
}

- (void)_invalidateImageModulationIntensity
{
  self->_needsUpdateFlags.imageModulationIntensity = 1;
  [(PXImageModulationManager *)self _setNeedsUpdate];
}

- (void)_updateHDRFocusIfNeeded
{
  if (self->_needsUpdateFlags.HDRFocus)
  {
    self->_needsUpdateFlags.HDRFocus = 0;
    double v3 = 0.0;
    if ([(PXImageModulationManager *)self isActive])
    {
      double v4 = [(PXImageModulationManager *)self rootViewController];
      objc_msgSend(v4, "px_effectiveHDRFocus");
      double v3 = v5;
    }
    [(PXImageModulationManager *)self setHDRFocus:v3];
  }
}

- (void)_invalidateHDRFocus
{
  self->_needsUpdateFlags.HDRFocus = 1;
  [(PXImageModulationManager *)self _setNeedsUpdate];
}

- (void)_updateActiveIfNeeded
{
  if (self->_needsUpdateFlags.active)
  {
    self->_needsUpdateFlags.active = 0;
    BOOL v3 = [(PXImageModulationManager *)self isEnabled];
    uint64_t v4 = 0;
    if (v3)
    {
      if ([(PXImageModulationManager *)self isLowPowerModeEnabled])
      {
        uint64_t v4 = 0;
      }
      else
      {
        Boolean keyExistsAndHasValidFormat = 0;
        int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"shouldModulateImages", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
        if (keyExistsAndHasValidFormat) {
          BOOL v6 = AppBooleanValue == 0;
        }
        else {
          BOOL v6 = 0;
        }
        uint64_t v4 = !v6;
      }
    }
    [(PXImageModulationManager *)self setActive:v4];
  }
}

- (void)_invalidateActive
{
  self->_needsUpdateFlags.active = 1;
  [(PXImageModulationManager *)self _setNeedsUpdate];
}

- (void)_updateLowPowerModeEnabledIfNeeded
{
  if (self->_needsUpdateFlags.lowPowerModeEnabled)
  {
    self->_needsUpdateFlags.lowPowerModeEnabled = 0;
    id v3 = [MEMORY[0x1E4F28F80] processInfo];
    -[PXImageModulationManager setLowPowerModeEnabled:](self, "setLowPowerModeEnabled:", [v3 isLowPowerModeEnabled]);
  }
}

- (void)_invalidateLowPowerModeEnabled
{
  self->_needsUpdateFlags.lowPowerModeEnabled = 1;
  [(PXImageModulationManager *)self _setNeedsUpdate];
}

- (void)_updateEnabledIfNeeded
{
  if (self->_needsUpdateFlags.enabled)
  {
    self->_needsUpdateFlags.enabled = 0;
    if ([(PXImageModulationManager *)self isMainScreen])
    {
      id v3 = [(PXImageModulationManager *)self settings];
      -[PXImageModulationManager setEnabled:](self, "setEnabled:", [v3 isEnabled]);
    }
    else
    {
      [(PXImageModulationManager *)self setEnabled:0];
    }
  }
}

- (void)_invalidateEnabled
{
  self->_needsUpdateFlags.enabled = 1;
  [(PXImageModulationManager *)self _setNeedsUpdate];
}

- (void)_setNeedsUpdate
{
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.enabled
      || self->_needsUpdateFlags.lowPowerModeEnabled
      || self->_needsUpdateFlags.active
      || self->_needsUpdateFlags.HDRFocus
      || self->_needsUpdateFlags.imageModulationIntensity
      || self->_needsUpdateFlags.requestedEDRHeadroomFactor
      || self->_needsUpdateFlags.finalRequestedEDRHeadroomFactor
      || self->_needsUpdateFlags.desiredDynamicRange
      || self->_needsUpdateFlags.imageLayerModulators
      || self->_needsUpdateFlags.currentScreenSupportsHDR;
}

- (void)_updateIfNeeded
{
  if ([(PXImageModulationManager *)self _needsUpdate])
  {
    [(PXImageModulationManager *)self _updateEnabledIfNeeded];
    [(PXImageModulationManager *)self _updateLowPowerModeEnabledIfNeeded];
    [(PXImageModulationManager *)self _updateCurrentScreenSupportsHDRIfNeeded];
    [(PXImageModulationManager *)self _updateActiveIfNeeded];
    [(PXImageModulationManager *)self _updateHDRFocusIfNeeded];
    [(PXImageModulationManager *)self _updateImageModulationIntensityIfNeeded];
    [(PXImageModulationManager *)self _updateRequestedEDRHeadroomFactorIfNeeded];
    [(PXImageModulationManager *)self _updateFinalRequestedEDRHeadroomFactorIfNeeded];
    [(PXImageModulationManager *)self _updateDesiredDynamicRangeIfNeeded];
    [(PXImageModulationManager *)self _updateImageLayerModulatorsIfNeeded];
  }
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXImageModulationManager;
  [(PXImageModulationManager *)&v3 didPerformChanges];
  [(PXImageModulationManager *)self _updateIfNeeded];
}

- (void)_applicationDidBecomeActive:(id)a3
{
}

- (void)_applicationDidResignActive:(id)a3
{
}

- (void)_processInfoPowerStateDidChange:(id)a3
{
}

uint64_t __60__PXImageModulationManager__processInfoPowerStateDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__PXImageModulationManager__processInfoPowerStateDidChange___block_invoke_2;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

uint64_t __60__PXImageModulationManager__processInfoPowerStateDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateLowPowerModeEnabled];
}

- (void)setCurrentScreenSupportsHDR:(BOOL)a3
{
  if (self->_currentScreenSupportsHDR != a3)
  {
    self->_currentScreenSupportsHDR = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__PXImageModulationManager_setCurrentScreenSupportsHDR___block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXImageModulationManager *)self performChanges:v3];
  }
}

uint64_t __56__PXImageModulationManager_setCurrentScreenSupportsHDR___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateActive];
}

- (void)setApplicationActive:(BOOL)a3
{
  if (self->_applicationActive != a3)
  {
    self->_applicationActive = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __49__PXImageModulationManager_setApplicationActive___block_invoke;
    v3[3] = &unk_1E5DCEB78;
    BOOL v4 = a3;
    v3[4] = self;
    [(PXImageModulationManager *)self performChanges:v3];
  }
}

uint64_t __49__PXImageModulationManager_setApplicationActive___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _updateCoreAnimationContext];
  }
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateRequestedEDRHeadroomFactor];
}

- (void)setCoreAnimationContext:(id)a3
{
  BOOL v4 = (CAContext *)a3;
  coreAnimationContext = self->_coreAnimationContext;
  if (coreAnimationContext != v4)
  {
    double v10 = v4;
    BOOL v6 = v4;
    double v7 = self->_coreAnimationContext;
    self->_coreAnimationContext = v6;
    double v8 = coreAnimationContext;

    LODWORD(v9) = 1.0;
    [(CAContext *)v8 setDesiredDynamicRange:v9];

    [(PXImageModulationManager *)self _invalidateDesiredDynamicRange];
    BOOL v4 = v10;
  }
}

- (void)_updateCoreAnimationContext
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXImageModulationManager *)self rootViewController];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    while (1)
    {
      double v5 = [v4 viewIfLoaded];
      BOOL v6 = [v5 layer];
      double v7 = [v6 context];

      if (v7) {
        break;
      }
      uint64_t v8 = [v4 presentedViewController];

      BOOL v4 = (void *)v8;
      if (!v8) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v9 = [(PXImageModulationManager *)self coreAnimationContext];
    if (v9)
    {
      double v7 = (void *)v9;
      BOOL v4 = 0;
    }
    else
    {
      double v10 = PLUIGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        double v11 = [(PXImageModulationManager *)self rootViewController];
        int v12 = 138412290;
        uint64_t v13 = v11;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "[ImageModulation] context missing for %@", (uint8_t *)&v12, 0xCu);
      }
      BOOL v4 = 0;
      double v7 = 0;
    }
  }
  [(PXImageModulationManager *)self setCoreAnimationContext:v7];
}

- (void)_didEndRequestingEDRHeadroomFactor:(double)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  double v4 = log2(a3);
  id v5 = [NSString alloc];
  BOOL v6 = [MEMORY[0x1E4F56658] bucketNameForDouble:&unk_1F02D48A0 bucketLimits:0 numberFormatter:v4];
  double v7 = (void *)[v5 initWithFormat:@"com.apple.photos.CPAnalytics.EDRHeadroomRequested%@", v6];

  uint64_t v8 = (void *)MEMORY[0x1E4F56658];
  int64_t v9 = [(PXImageModulationManager *)self requestedEDRHeadroomSignpost];
  uint64_t v10 = *MEMORY[0x1E4F56440];
  uint64_t v12 = *MEMORY[0x1E4F56580];
  v13[0] = v7;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v8 endSignpost:v9 forEventName:v10 withPayload:v11];

  [(PXImageModulationManager *)self setRequestedEDRHeadroomSignpost:0];
}

- (void)_didStartRequestingEDRHeadroomFactor:(double)a3
{
  if ([(PXImageModulationManager *)self requestedEDRHeadroomSignpost]) {
    PXAssertGetLog();
  }
  -[PXImageModulationManager setRequestedEDRHeadroomSignpost:](self, "setRequestedEDRHeadroomSignpost:", [MEMORY[0x1E4F56658] startSignpost]);
}

- (void)setRequestedEDRHeadroomFactor:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_requestedEDRHeadroomFactor != a3)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v6 = v5;
    if (self->_requestedEDRHeadroomFactor > 1.0) {
      -[PXImageModulationManager _didEndRequestingEDRHeadroomFactor:](self, "_didEndRequestingEDRHeadroomFactor:");
    }
    self->_requestedEDRHeadroomFactor = a3;
    if (a3 > 1.0) {
      [(PXImageModulationManager *)self _didStartRequestingEDRHeadroomFactor:a3];
    }
    self->_lastRequestedEDRHeadroomChangeTime = v6;
    [(PXImageModulationManager *)self signalChange:4];
    double v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134217984;
      long double v9 = log2(a3);
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "[ImageModulation] requestedEDRHeadroom: %f", (uint8_t *)&v8, 0xCu);
    }

    [(PXImageModulationManager *)self _updateCoreAnimationContext];
    [(PXImageModulationManager *)self _invalidateDesiredDynamicRange];
  }
}

- (void)setImageModulationIntensity:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_imageModulationIntensity != a3)
  {
    self->_imageModulationIntensity = a3;
    double v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 134217984;
      double v7 = a3;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "[ImageModulation] Intensity: %0.6f", (uint8_t *)&v6, 0xCu);
    }

    [(PXImageModulationManager *)self signalChange:2];
    [(PXImageModulationManager *)self _invalidateRequestedEDRHeadroomFactor];
    [(PXImageModulationManager *)self _invalidateImageLayerModulators];
  }
}

- (void)setHDRFocus:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_HDRFocus != a3)
  {
    self->_HDRFocus = a3;
    double v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 134217984;
      double v7 = a3;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "[ImageModulation] HDR Focus: %0.6f", (uint8_t *)&v6, 0xCu);
    }

    [(PXImageModulationManager *)self signalChange:1];
    [(PXImageModulationManager *)self _invalidateRequestedEDRHeadroomFactor];
  }
}

- (void)setNeedsEnabledUpdate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__PXImageModulationManager_setNeedsEnabledUpdate__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXImageModulationManager *)self performChanges:v2];
}

uint64_t __49__PXImageModulationManager_setNeedsEnabledUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateEnabled];
}

- (void)setNeedsImageModulationIntensityUpdate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__PXImageModulationManager_setNeedsImageModulationIntensityUpdate__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXImageModulationManager *)self performChanges:v2];
}

uint64_t __66__PXImageModulationManager_setNeedsImageModulationIntensityUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateImageModulationIntensity];
}

- (void)setNeedsHDRFocusUpdate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__PXImageModulationManager_setNeedsHDRFocusUpdate__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXImageModulationManager *)self performChanges:v2];
}

uint64_t __50__PXImageModulationManager_setNeedsHDRFocusUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateHDRFocus];
}

- (void)_updateImageLayerModulator:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXImageModulationManager *)self isActive];
  [(PXImageModulationManager *)self imageModulationIntensity];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PXImageModulationManager__updateImageLayerModulator___block_invoke;
  v7[3] = &__block_descriptor_41_e48_v16__0___PXMutableImageLayerModulator_Private__8l;
  BOOL v8 = v5;
  void v7[4] = v6;
  objc_msgSend(v4, "performChanges_Private:", v7);
}

void __55__PXImageModulationManager__updateImageLayerModulator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  [v4 setEnabled:v3];
  [v4 setIntensity:*(double *)(a1 + 32)];
}

- (void)checkInLivePhotoViewModulator:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "performChanges_Private:", &__block_literal_global_24_148956);
  BOOL v5 = [v4 imageModulator];
  [(PXImageModulationManager *)self checkInImageLayerModulator:v5];

  id v6 = [v4 videoModulator];

  [(PXImageModulationManager *)self checkInImageLayerModulator:v6];
}

uint64_t __58__PXImageModulationManager_checkInLivePhotoViewModulator___block_invoke(uint64_t a1, void *a2)
{
  return [a2 prepareForReuse];
}

- (id)checkoutLivePhotoViewModulatorWithOptions:(id)a3
{
  uint64_t v3 = *(void *)&a3.var1;
  int64_t var0 = a3.var0;
  id v6 = -[PXImageModulationManager _checkoutImageLayerModulatorWithOptions:contentType:](self, "_checkoutImageLayerModulatorWithOptions:contentType:", a3.var0, *(void *)&a3.var1, 0);
  double v7 = -[PXImageModulationManager _checkoutImageLayerModulatorWithOptions:contentType:](self, "_checkoutImageLayerModulatorWithOptions:contentType:", var0, v3, 1);
  BOOL v8 = [[PXLivePhotoViewModulator alloc] initWithImageModulator:v6 videoModulator:v7];

  return v8;
}

- (void)checkInImageLayerModulator:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "performChanges_Private:", &__block_literal_global_148960);
  id v5 = [(PXImageModulationManager *)self imageLayerModulators];
  [v5 removeObject:v4];
}

uint64_t __55__PXImageModulationManager_checkInImageLayerModulator___block_invoke(uint64_t a1, void *a2)
{
  return [a2 prepareForReuse];
}

- (id)_checkoutImageLayerModulatorWithOptions:(id)a3 contentType:(int64_t)a4
{
  float var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![(PXImageModulationManager *)self isEnabled]) {
    int64_t var0 = 0;
  }
  uint64_t v8 = 0;
  uint64_t v9 = var0;
  switch(var0)
  {
    case 0:
      uint64_t v10 = [(PXImageModulationManager *)self settings];
      [v10 SDRModulationIntensity];
      double v12 = v11;

      if (v12 <= 0.0) {
        goto LABEL_7;
      }
      goto LABEL_5;
    case 1:
LABEL_5:
      uint64_t v13 = [(PXImageModulationManager *)self settings];
      uint64_t v9 = [v13 filterType];

      if (!v9) {
        goto LABEL_7;
      }
      uint64_t v8 = 0;
LABEL_12:
      *(void *)&long long v18 = var0;
      *((void *)&v18 + 1) = v9;
      float v19 = var1;
      int v20 = 0;
      uint64_t v21 = v8;
      uint64_t v22 = 0;
      uint64_t v14 = [[PXImageLayerModulator alloc] initWithOptions:&v18];
      [(PXImageModulationManager *)self _updateImageLayerModulator:v14];
      v15 = [(PXImageModulationManager *)self imageLayerModulators];
      [v15 addObject:v14];

      break;
    case 2:
      if (a4) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = 3;
      }
      uint64_t v8 = 1;
      goto LABEL_12;
    case 3:
      goto LABEL_12;
    default:
LABEL_7:
      uint64_t v14 = 0;
      break;
  }
  v16 = PLUIGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v18) = 138412290;
    *(void *)((char *)&v18 + 4) = v14;
    _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEBUG, "[ImageModulation] created image layer modulator %@", (uint8_t *)&v18, 0xCu);
  }

  return v14;
}

- (id)checkoutImageLayerModulatorWithOptions:(id)a3
{
  return -[PXImageModulationManager _checkoutImageLayerModulatorWithOptions:contentType:](self, "_checkoutImageLayerModulatorWithOptions:contentType:", a3.var0, *(void *)&a3.var1, 0);
}

- (void)setEnabledForTesting:(BOOL)a3
{
  if (self->_enabledForTesting != a3)
  {
    self->_enabledForTesting = a3;
    [(PXImageModulationManager *)self _invalidateDesiredDynamicRange];
  }
}

- (void)enableForTesting
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__PXImageModulationManager_enableForTesting__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXImageModulationManager *)self performChanges:v2];
}

uint64_t __44__PXImageModulationManager_enableForTesting__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEnabledForTesting:1];
}

- (void)setActive:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "[ImageModulation] Active: %i", (uint8_t *)v6, 8u);
    }

    [(PXImageModulationManager *)self _invalidateHDRFocus];
    [(PXImageModulationManager *)self _invalidateImageLayerModulators];
  }
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_lowPowerModeEnabled != a3)
  {
    BOOL v3 = a3;
    self->_lowPowerModeEnabled = a3;
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "[ImageModulation] Low power mode: %i", (uint8_t *)v6, 8u);
    }

    [(PXImageModulationManager *)self _invalidateActive];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __39__PXImageModulationManager_setEnabled___block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXImageModulationManager *)self performChanges:v3];
  }
}

uint64_t __39__PXImageModulationManager_setEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateRequestedEDRHeadroomFactor];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateImageLayerModulators];
}

- (void)dealloc
{
  LODWORD(v2) = 1.0;
  [(CAContext *)self->_coreAnimationContext setDesiredDynamicRange:v2];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  PXUnregisterPreferencesObserver(self);
  v5.receiver = self;
  v5.super_class = (Class)PXImageModulationManager;
  [(PXImageModulationManager *)&v5 dealloc];
}

- (PXImageModulationManager)initWithRootViewController:(id)a3 mainScreen:(BOOL)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXImageModulationManager;
  uint64_t v7 = [(PXImageModulationManager *)&v17 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7[105] = 1;
    *((_DWORD *)v7 + 24) = 16843009;
    *(_DWORD *)(v7 + 99) = 16843009;
    objc_storeWeak((id *)v7 + 21, v6);
    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v10 = (void *)*((void *)v8 + 17);
    *((void *)v8 + 17) = v9;

    v8[123] = a4;
    v8[121] = 1;
    *((void *)v8 + 24) = 0x3FF0000000000000;
    double v11 = [[PXRequestedEDRHeadroomFactorFilter alloc] initWithInput:*((double *)v8 + 24)];
    double v12 = (void *)*((void *)v8 + 18);
    *((void *)v8 + 18) = v11;

    [*((id *)v8 + 18) registerChangeObserver:v8 context:PXRequestedEDRHeadroomFactorFilterObservationContext];
    uint64_t v13 = +[PXImageModulationSettings sharedInstance];
    uint64_t v14 = (void *)*((void *)v8 + 16);
    *((void *)v8 + 16) = v13;

    [*((id *)v8 + 16) addKeyObserver:v8];
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v8 selector:sel__processInfoPowerStateDidChange_ name:*MEMORY[0x1E4F287E8] object:0];
    [v15 addObserver:v8 selector:sel__applicationDidResignActive_ name:*MEMORY[0x1E4FB2738] object:0];
    [v15 addObserver:v8 selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x1E4FB2628] object:0];
    PXRegisterPreferencesObserver(v8);
  }
  return (PXImageModulationManager *)v8;
}

- (PXImageModulationManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXImageModulationManager.m", 201, @"%s is not available as initializer", "-[PXImageModulationManager init]");

  abort();
}

+ (int64_t)_contentFormatForAsset:(id)a3
{
  id v3 = a3;
  id v4 = +[PXImageModulationSettings sharedInstance];
  uint64_t v5 = [v4 HDRConsideration];
  if (v5 == 2)
  {
    unsigned int v11 = [v3 isFavorite];
LABEL_9:
    unint64_t v10 = v11;
    goto LABEL_20;
  }
  if (v5 == 1)
  {
LABEL_7:
    unint64_t v10 = 1;
    goto LABEL_20;
  }
  if (v5 || ([v3 playbackStyle] & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
LABEL_19:
    unint64_t v10 = 0;
    goto LABEL_20;
  }
  unint64_t v6 = [v3 mediaSubtypes];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v3 hdrGain];
    [v7 floatValue];
    BOOL v9 = v8 <= 0.0;

    if ((v6 & 2) != 0) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v9 = 1;
    if ((v6 & 2) != 0) {
      goto LABEL_7;
    }
  }
  if ((v6 & 0x200) == 0)
  {
    if ((v6 >> 23) & 1 | v9)
    {
      unint64_t v10 = (v6 & 0x800000) >> 21;
      goto LABEL_20;
    }
    unsigned int v11 = [v4 gainBoostEnabled];
    goto LABEL_9;
  }
  int v12 = [v4 toneMapEnabled];
  if (v12) {
    unint64_t v10 = 4;
  }
  else {
    unint64_t v10 = 0;
  }
  if (((v12 | v9) & 1) == 0)
  {
    [v4 gainBoostEnabled];
    goto LABEL_19;
  }
LABEL_20:

  return v10;
}

+ (double)_hdrGainForAsset:(id)a3
{
  id v3 = a3;
  double v4 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v3 hdrGain];
    if (v5)
    {
      unint64_t v6 = v5;
      [v5 floatValue];
      double v4 = v7;
    }
  }

  return v4;
}

+ ($5A0616AB7869379E861635CACF312FD6)optionsForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _contentFormatForAsset:v4];
  if ((unint64_t)(v5 - 1) > 2)
  {
    uint64_t v7 = 0;
  }
  else
  {
    [a1 _hdrGainForAsset:v4];
    *(float *)&double v6 = v6;
    uint64_t v7 = LODWORD(v6);
  }

  int64_t v8 = v5;
  uint64_t v9 = v7;
  result.float var1 = *(float *)&v9;
  result.int64_t var0 = v8;
  return result;
}

+ (double)HDRValueForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _contentFormatForAsset:v4];
  if ((unint64_t)(v5 - 1) >= 4)
  {
    double v6 = 0.0;
    if (!v5)
    {
      uint64_t v7 = +[PXImageModulationSettings sharedInstance];
      [v7 SDRModulationIntensity];
      double v9 = v8;

      if (v9 > 0.0) {
        double v6 = 1.0;
      }
      else {
        double v6 = 0.0;
      }
    }
  }
  else
  {
    double v6 = 1.0;
  }
  unint64_t v10 = +[PXImageModulationSettings sharedInstance];
  if ([v10 useThresholdForVideos])
  {
    int v11 = [v4 mediaSubtypes];

    if ((*(void *)&v11 & 0x100000) != 0) {
      double v6 = 1.0;
    }
  }
  else
  {
  }
  return v6;
}

@end