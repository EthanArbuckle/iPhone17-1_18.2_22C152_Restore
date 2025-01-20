@interface SBBacklightPlatformProvider
+ (BOOL)deviceSupportsAlwaysOn;
- (BLSHBacklightEnvironmentSessionProviding)sessionProvider;
- (BLSHFlipbookSpecification)flipbookSpecification;
- (BLSHFlipbookTelemetry)flipbookTelemetryDelegate;
- (BOOL)isAlwaysOnEnabled;
- (BOOL)isShowingBlankingWindow;
- (BOOL)isUsingAlwaysOnBrightnessCurve;
- (BOOL)suppressionSupported;
- (SBAlwaysOnPolicyCoordinator)alwaysOnPolicyCoordinator;
- (SBBacklightPlatformProvider)init;
- (SBBacklightPlatformProvider)initWithBacklightEnvironmentSessionProvider:(id)a3;
- (SBBacklightSignificantUserInteractionMonitor)significantUserInteractionMonitor;
- (UIWindowScene)windowScene;
- (double)backlightDimmingDuration;
- (double)backlightFadeInDuration;
- (double)backlightFadeOutDuration;
- (float)backlightDimmedFactor;
- (void)_notifyObserversOfSignificantUserInteraction;
- (void)_setBlankingWindowVisible:(BOOL)a3 fadeDuration:(double)a4;
- (void)_updateAlwaysOnEnabled;
- (void)addObserver:(id)a3;
- (void)completeInitializationAfterBLSStartup;
- (void)removeObserver:(id)a3;
- (void)setSignificantUserInteractionMonitor:(id)a3;
- (void)setWindowScene:(id)a3;
- (void)showBlankingWindow:(BOOL)a3 withFadeDuration:(double)a4;
- (void)useAlwaysOnBrightnessCurve:(BOOL)a3 withRampDuration:(double)a4;
@end

@implementation SBBacklightPlatformProvider

- (SBBacklightPlatformProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithBacklightEnvironmentSessionProvider_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBBacklightPlatformProvider.m", 59, @"%s is unavailable; use %@ instead",
    "-[SBBacklightPlatformProvider init]",
    v5);

  return 0;
}

- (SBBacklightPlatformProvider)initWithBacklightEnvironmentSessionProvider:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SBBacklightPlatformProvider;
  v6 = [(SBBacklightPlatformProvider *)&v41 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x1E4FA6060] rootSettings];
    wakeAnimationSettings = v7->_wakeAnimationSettings;
    v7->_wakeAnimationSettings = (SBFWakeAnimationSettings *)v8;

    objc_storeStrong((id *)&v7->_sessionProvider, a3);
    v10 = +[SBDefaults localDefaults];
    uint64_t v11 = [v10 alwaysOnDefaults];
    alwaysOnDefaults = v7->_alwaysOnDefaults;
    v7->_alwaysOnDefaults = (SBAlwaysOnDefaults *)v11;

    if ([(SBAlwaysOnDefaults *)v7->_alwaysOnDefaults useAlwaysOnBrightnessCurve])
    {
      v13 = objc_alloc_init(SBAlwaysOnBrightnessCurveController);
      brightnessCurveController = v7->_brightnessCurveController;
      v7->_brightnessCurveController = v13;
    }
    [(SBBacklightPlatformProvider *)v7 _updateAlwaysOnEnabled];
    v15 = v7->_alwaysOnDefaults;
    v16 = [NSString stringWithUTF8String:"enableAlwaysOn"];
    v42[0] = v16;
    v17 = [NSString stringWithUTF8String:"forceAndromedaSupport"];
    v42[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    uint64_t v36 = MEMORY[0x1E4F143A8];
    uint64_t v37 = 3221225472;
    v38 = __75__SBBacklightPlatformProvider_initWithBacklightEnvironmentSessionProvider___block_invoke;
    v39 = &unk_1E6AF4AC0;
    v19 = v7;
    v40 = v19;
    id v20 = (id)[(SBAlwaysOnDefaults *)v15 observeDefaults:v18 onQueue:MEMORY[0x1E4F14428] withBlock:&v36];

    v21 = +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance];
    v22 = [v21 rootWindow];

    v23 = objc_alloc_init(SBAveragePixelLuminanceLimitController);
    aplLimitController = v19->_aplLimitController;
    v19->_aplLimitController = v23;

    [(SBAveragePixelLuminanceLimitController *)v19->_aplLimitController setGlobalFilter:1];
    [(SBAveragePixelLuminanceLimitController *)v19->_aplLimitController setTargetView:v22];
    if ([(id)objc_opt_class() deviceSupportsAlwaysOn]) {
      v25 = [[SBAlwaysOnTelemetryEmitter alloc] initWithBacklightEnvironmentSessionProvider:v7->_sessionProvider];
    }
    else {
      v25 = v19;
    }
    telemetryEmitter = v19->_telemetryEmitter;
    v19->_telemetryEmitter = (BLSHFlipbookTelemetry *)v25;

    int v27 = MGGetSInt32Answer();
    unint64_t v28 = (unint64_t)(v27 & ~(v27 >> 31)) << 20;
    v29 = [(SBAlwaysOnDefaults *)v7->_alwaysOnDefaults maximumRenderInterval];
    v30 = v29;
    if (v29)
    {
      [v29 doubleValue];
      double v32 = v31;
    }
    else
    {
      double v32 = 300.0;
    }
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F4F568]) initWithSoftMemoryLimit:v28 frameCapacity:120 framesPerSecond:120.0 minimumGapDuration:3.0 coaelscingEpsilon:0.028 minimumPrepareInterval:90.0 maximumRenderInterval:v32];
    flipbookSpecification = v19->_flipbookSpecification;
    v19->_flipbookSpecification = (BLSHFlipbookSpecification *)v33;
  }
  return v7;
}

uint64_t __75__SBBacklightPlatformProvider_initWithBacklightEnvironmentSessionProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAlwaysOnEnabled];
}

- (void)setSignificantUserInteractionMonitor:(id)a3
{
  id v5 = (SBBacklightSignificantUserInteractionMonitor *)a3;
  significantUserInteractionMonitor = self->_significantUserInteractionMonitor;
  if (significantUserInteractionMonitor != v5)
  {
    v7 = v5;
    [(SBBacklightSignificantUserInteractionMonitor *)significantUserInteractionMonitor removeObserver:self];
    objc_storeStrong((id *)&self->_significantUserInteractionMonitor, a3);
    [(SBBacklightSignificantUserInteractionMonitor *)self->_significantUserInteractionMonitor addObserver:self];
    id v5 = v7;
  }
}

- (void)completeInitializationAfterBLSStartup
{
  v3 = objc_alloc_init(SBAlwaysOnPolicyCoordinator);
  alwaysOnPolicyCoordinator = self->_alwaysOnPolicyCoordinator;
  self->_alwaysOnPolicyCoordinator = v3;

  [(SBAlwaysOnPolicyCoordinator *)self->_alwaysOnPolicyCoordinator activate];
  telemetryEmitter = self->_telemetryEmitter;
  uint64_t v6 = objc_opt_class();
  v7 = telemetryEmitter;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = v8;

  [(BLSHFlipbookTelemetry *)v9 setAlwaysOnPolicyCoordinator:self->_alwaysOnPolicyCoordinator];
  [(BLSHFlipbookTelemetry *)v9 completeIntializationAfterBLSStartup];
}

+ (BOOL)deviceSupportsAlwaysOn
{
  char v2 = MGGetBoolAnswer();
  int has_internal_content = os_variant_has_internal_content();
  if (!has_internal_content || (v2 & 1) != 0) {
    return has_internal_content | v2;
  }
  v4 = +[SBDefaults localDefaults];
  id v5 = [v4 alwaysOnDefaults];
  char v6 = [v5 forceAndromedaSupport];

  return v6;
}

- (BOOL)isAlwaysOnEnabled
{
  char v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (double)backlightFadeInDuration
{
  char v2 = +[SBBacklightController sharedInstanceIfExists];
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 lastBacklightChangeSource];
  }
  else {
    uint64_t v4 = 0;
  }
  +[SBScreenWakeAnimationController backlightFadeDurationForSource:v4 isWake:1];
  double v6 = v5;

  return v6;
}

- (double)backlightFadeOutDuration
{
  [(SBFWakeAnimationSettings *)self->_wakeAnimationSettings backlightFadeDuration];
  return result;
}

- (BLSHFlipbookSpecification)flipbookSpecification
{
  return self->_flipbookSpecification;
}

- (BLSHBacklightEnvironmentSessionProviding)sessionProvider
{
  return (BLSHBacklightEnvironmentSessionProviding *)self->_sessionProvider;
}

- (BOOL)suppressionSupported
{
  return 1;
}

- (BOOL)isShowingBlankingWindow
{
  char v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_showingBlankingWindow;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)showBlankingWindow:(BOOL)a3 withFadeDuration:(double)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_showingBlankingWindow = a3;
  os_unfair_lock_unlock(p_lock);
  BSDispatchMain();
}

uint64_t __67__SBBacklightPlatformProvider_showBlankingWindow_withFadeDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setBlankingWindowVisible:*(unsigned __int8 *)(a1 + 48) fadeDuration:*(double *)(a1 + 40)];
}

- (BOOL)isUsingAlwaysOnBrightnessCurve
{
  return [(SBAlwaysOnBrightnessCurveController *)self->_brightnessCurveController isUsingAlwaysOnBrightnessCurve];
}

- (void)useAlwaysOnBrightnessCurve:(BOOL)a3 withRampDuration:(double)a4
{
}

uint64_t __75__SBBacklightPlatformProvider_useAlwaysOnBrightnessCurve_withRampDuration___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__SBBacklightPlatformProvider_useAlwaysOnBrightnessCurve_withRampDuration___block_invoke_2;
  v3[3] = &unk_1E6AF5D38;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 48);
  return [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:v1];
}

uint64_t __75__SBBacklightPlatformProvider_useAlwaysOnBrightnessCurve_withRampDuration___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  char v2 = *(void **)(v1 + 64);
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = [*(id *)(v1 + 48) enforceOverallAPLLimit];
  }
  else {
    uint64_t v3 = 0;
  }
  return [v2 setAplLimitsEnabled:v3];
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_alwaysOnObservers = self->_lock_alwaysOnObservers;
  if (!lock_alwaysOnObservers)
  {
    double v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    double v6 = self->_lock_alwaysOnObservers;
    self->_lock_alwaysOnObservers = v5;

    lock_alwaysOnObservers = self->_lock_alwaysOnObservers;
  }
  [(NSHashTable *)lock_alwaysOnObservers addObject:v7];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_alwaysOnObservers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (float)backlightDimmedFactor
{
  return 0.05;
}

- (double)backlightDimmingDuration
{
  return 0.5;
}

- (BLSHFlipbookTelemetry)flipbookTelemetryDelegate
{
  return self->_telemetryEmitter;
}

- (void)_updateAlwaysOnEnabled
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() deviceSupportsAlwaysOn]) {
    int v3 = _os_feature_enabled_impl();
  }
  else {
    int v3 = 0;
  }
  uint64_t v4 = [(SBAlwaysOnDefaults *)self->_alwaysOnDefaults enableAlwaysOn] & v3;
  os_unfair_lock_lock(&self->_lock);
  int lock_alwaysOnEnabled = self->_lock_alwaysOnEnabled;
  self->_int lock_alwaysOnEnabled = v4;
  double v6 = [(NSHashTable *)self->_lock_alwaysOnObservers allObjects];
  id v7 = (void *)[v6 copy];

  os_unfair_lock_unlock(&self->_lock);
  if (lock_alwaysOnEnabled != v4)
  {
    uint64_t v8 = SBLogBacklight();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = v4;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "isAlwaysOnEnabled updated to new value:%{BOOL}u", buf, 8u);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v14, "platformProvider:didChangeAlwaysOnSetting:", self, v4, (void)v15);
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)_notifyObserversOfSignificantUserInteraction
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSHashTable *)self->_lock_alwaysOnObservers allObjects];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  double v6 = SBLogBacklight();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "SBBacklightPlatformProvider sending significant user interaction notice", buf, 2u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "platformProviderDidDetectSignificantUserInteraction:", self, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_setBlankingWindowVisible:(BOOL)a3 fadeDuration:(double)a4
{
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = [(SBBacklightPlatformProvider *)self windowScene];
  uint64_t v8 = SBLogBacklight();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    BOOL v18 = v5;
    __int16 v19 = 2048;
    double v20 = a4;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "making blanking window visible: %{BOOL}u duration: %f", buf, 0x12u);
  }

  if (v5 && !self->_blankingWindow)
  {
    uint64_t v9 = [[SBBacklightBlankingWindow alloc] initWithWindowScene:v7];
    [(SBBacklightBlankingWindow *)v9 setWindowLevel:*MEMORY[0x1E4F43958] + 801.0];
    uint64_t v10 = [MEMORY[0x1E4F428B8] blackColor];
    [(SBBacklightBlankingWindow *)v9 setBackgroundColor:v10];

    [(SBBacklightBlankingWindow *)v9 setAlpha:0.0];
    [(SBFWindow *)v9 setHidden:0];
    blankingWindow = self->_blankingWindow;
    self->_blankingWindow = v9;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__SBBacklightPlatformProvider__setBlankingWindowVisible_fadeDuration___block_invoke;
  v15[3] = &unk_1E6AF5D38;
  BOOL v16 = v5;
  v15[4] = self;
  uint64_t v12 = (void (**)(void))MEMORY[0x1D948C7A0](v15);
  if (BSFloatIsZero())
  {
    v12[2](v12);
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__SBBacklightPlatformProvider__setBlankingWindowVisible_fadeDuration___block_invoke_2;
    v13[3] = &unk_1E6AFAC80;
    BOOL v14 = v5;
    v13[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v12 animations:v13 completion:a4];
  }
  [v7 _synchronizeDrawing];
}

uint64_t __70__SBBacklightPlatformProvider__setBlankingWindowVisible_fadeDuration___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  char v2 = *(void **)(*(void *)(a1 + 32) + 32);
  double v3 = 1.0;
  if (!v1) {
    double v3 = 0.0;
  }
  return [v2 setAlpha:v3];
}

void __70__SBBacklightPlatformProvider__setBlankingWindowVisible_fadeDuration___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v2 = SBLogBacklight();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "blanking window animation to visible %{BOOL}u completed", (uint8_t *)v6, 8u);
  }

  if (!*(unsigned char *)(a1 + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 32) setHidden:1];
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;
  }
}

- (SBBacklightSignificantUserInteractionMonitor)significantUserInteractionMonitor
{
  return self->_significantUserInteractionMonitor;
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (UIWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (SBAlwaysOnPolicyCoordinator)alwaysOnPolicyCoordinator
{
  return self->_alwaysOnPolicyCoordinator;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_significantUserInteractionMonitor, 0);
  objc_storeStrong((id *)&self->_lock_alwaysOnObservers, 0);
  objc_storeStrong((id *)&self->_alwaysOnPolicyCoordinator, 0);
  objc_storeStrong((id *)&self->_telemetryEmitter, 0);
  objc_storeStrong((id *)&self->_flipbookSpecification, 0);
  objc_storeStrong((id *)&self->_aplLimitController, 0);
  objc_storeStrong((id *)&self->_brightnessCurveController, 0);
  objc_storeStrong((id *)&self->_alwaysOnDefaults, 0);
  objc_storeStrong((id *)&self->_blankingWindow, 0);
  objc_storeStrong((id *)&self->_sessionProvider, 0);
  objc_storeStrong((id *)&self->_wakeAnimationSettings, 0);
}

@end