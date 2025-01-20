@interface SBReachabilityManager
+ (BOOL)reachabilitySupported;
+ (id)sharedInstance;
- (BOOL)canActivateReachability;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)reachabilityEnabled;
- (BOOL)reachabilityModeActive;
- (SBReachabilityGestureRecognizer)reachabilityGestureRecognizer;
- (SBReachabilityManager)init;
- (SBScreenEdgePanGestureRecognizer)dismissEdgeGestureRecognizer;
- (SBWindowScene)windowScene;
- (UIPanGestureRecognizer)dismissPanGestureRecognizer;
- (double)effectiveReachabilityYOffset;
- (double)reachabilityYOffset;
- (id)_sceneForWindow:(id)a3;
- (id)ignoredWindows;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (void)_activateReachability:(id)a3;
- (void)_handleSignificantTimeChanged;
- (void)_invalidateJindoReason;
- (void)_modifyDefaultPresentationContextHostTransformForWindow:(id)a3 fromTransform:(id)a4 toTransform:(id)a5;
- (void)_notifyObserversDidEndReachabilityAnimation;
- (void)_notifyObserversReachabilityModeActive:(BOOL)a3;
- (void)_notifyObserversReachabilityYOffsetDidChange;
- (void)_notifyObserversWillBeginReachabilityAnimation;
- (void)_panToDeactivateReachability:(id)a3;
- (void)_pingKeepAliveWithDuration:(double)a3 interactedBeforePing:(BOOL)a4 initialKeepAliveTime:(double)a5;
- (void)_screenDidDim;
- (void)_setKeepAliveTimer;
- (void)_setupGestureRecognizers;
- (void)_setupReachabilityWindowIfNecessary;
- (void)_tapToDeactivateReachability:(id)a3;
- (void)_tearDownReachabilityWindow;
- (void)_toggleReachabilityMode;
- (void)_transitionWithTransformer:(id)a3 fromTransform:(id)a4 toTransform:(id)a5;
- (void)_updateReachabilityModeActive:(BOOL)a3;
- (void)_updateReachabilityModeActive:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateReachabilityWindowForYOffset:(double)a3 mode:(int64_t)a4 completion:(id)a5;
- (void)addObserver:(id)a3;
- (void)deactivateReachability;
- (void)dealloc;
- (void)ignoreWindowForReachability:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setReachabilityEnabled:(BOOL)a3;
- (void)setReachabilityTemporarilyDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setReachabilityTemporarilyEnabled:(BOOL)a3 forReason:(id)a4;
- (void)setWindowScene:(id)a3;
- (void)toggleReachability;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBReachabilityManager

- (BOOL)reachabilityModeActive
{
  return self->_reachabilityModeActive;
}

+ (id)sharedInstance
{
  if (sharedInstance_token != -1) {
    dispatch_once(&sharedInstance_token, &__block_literal_global_41);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

- (void)deactivateReachability
{
}

- (void)_updateReachabilityModeActive:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_reachabilityModeActive != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    ++self->_reachabilityExtensionGenerationCount;
    self->_reachabilityModeActive = a3;
    v7 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64__SBReachabilityManager__updateReachabilityModeActive_animated___block_invoke;
    v24[3] = &__block_descriptor_33_e5__8__0l;
    BOOL v25 = v5;
    [v7 logBlock:v24];

    v8 = SBLogCommon();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "reachability activated", buf, 2u);
      }

      ADClientAddValueForScalarKey();
      [(SBReachabilityManager *)self _setKeepAliveTimer];
      v10 = [(SBWindowScene *)self->_windowScene zStackResolver];
      v11 = [v10 acquireParticipantWithIdentifier:26 delegate:self];
      zStackParticipant = self->_zStackParticipant;
      self->_zStackParticipant = v11;

      uint64_t v13 = 6;
    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "reachability deactivated", buf, 2u);
      }

      [(SBFZStackParticipant *)self->_zStackParticipant invalidate];
      v10 = self->_zStackParticipant;
      self->_zStackParticipant = 0;
      uint64_t v13 = 7;
    }

    [(SBReachabilityManager *)self _setupReachabilityWindowIfNecessary];
    v14 = [MEMORY[0x1E4FA5E78] sharedInstance];
    [v14 emitEvent:v13];

    uint64_t v15 = 0;
    if (v5) {
      [(SBReachabilityManager *)self reachabilityYOffset];
    }
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __64__SBReachabilityManager__updateReachabilityModeActive_animated___block_invoke_70;
    v20 = &unk_1E6AF50E8;
    if (v4) {
      uint64_t v16 = 3;
    }
    else {
      uint64_t v16 = 2;
    }
    v21 = self;
    uint64_t v22 = v15;
    -[SBReachabilityManager _updateReachabilityWindowForYOffset:mode:completion:](self, "_updateReachabilityWindowForYOffset:mode:completion:", v16, &v17);
    -[SBReachabilityManager _notifyObserversReachabilityModeActive:](self, "_notifyObserversReachabilityModeActive:", self->_reachabilityModeActive, v17, v18, v19, v20);
  }
}

- (void)_updateReachabilityModeActive:(BOOL)a3
{
}

- (id)ignoredWindows
{
  return [(NSHashTable *)self->_ignoredWindows allObjects];
}

- (double)effectiveReachabilityYOffset
{
  return self->_effectiveReachabilityYOffset;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (self->_reachabilityGestureRecognizer != a3) {
    return 0;
  }
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  v7 = SBSafeCast(v6, v5);

  BOOL v4 = !v7 || [v7 edges] != 1;
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v6 = (SBScreenEdgePanGestureRecognizer *)a3;
  id v7 = a4;
  if ((SBScreenEdgePanGestureRecognizer *)self->_dismissPanGestureRecognizer == v6
    || (SBScreenEdgePanGestureRecognizer *)self->_dismissTapGestureRecognizer == v6)
  {
    BOOL v9 = [(SBScreenEdgePanGestureRecognizer *)v6 view];
    [v7 locationInView:v9];
    double v11 = v10;

    BOOL v8 = self->_reachabilityModeActive && v11 < self->_effectiveReachabilityYOffset;
  }
  else
  {
    BOOL v8 = self->_dismissEdgeGestureRecognizer != v6 || self->_reachabilityModeActive;
  }

  return v8;
}

- (void)setReachabilityTemporarilyDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v4)
  {
    id v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Adding temporary reason for disabling reachability: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [(NSMutableSet *)self->_temporaryDisabledReasons addObject:v6];
  }
  else if ([(NSMutableSet *)self->_temporaryDisabledReasons containsObject:v6])
  {
    BOOL v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Removing temporary reason for disabling reachability: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [(NSMutableSet *)self->_temporaryDisabledReasons removeObject:v6];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

+ (BOOL)reachabilitySupported
{
  if (reachabilitySupported_token != -1) {
    dispatch_once(&reachabilitySupported_token, &__block_literal_global_5);
  }
  int v3 = reachabilitySupported_useReachability;
  if (!reachabilitySupported_useReachability)
  {
    v2 = +[SBReachabilityDomain rootSettings];
    if (![v2 allowOnAllDevices])
    {
      LOBYTE(v6) = 0;
LABEL_8:

      return v6;
    }
  }
  id v4 = +[SBDefaults localDefaults];
  id v5 = [v4 accessibilityDefaults];
  int v6 = [v5 reallyDisableReachability] ^ 1;

  if (!v3) {
    goto LABEL_8;
  }
  return v6;
}

void __46__SBReachabilityManager_reachabilitySupported__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    reachabilitySupported_useReachability = [v0 BOOLValue];
    CFRelease(v1);
  }
}

uint64_t __39__SBReachabilityManager_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBReachabilityManager);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

  return kdebug_trace();
}

- (SBReachabilityManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)SBReachabilityManager;
  v2 = [(SBReachabilityManager *)&v11 init];
  if (v2 && [(id)objc_opt_class() reachabilitySupported])
  {
    int v3 = +[SBDefaults localDefaults];
    id v4 = [v3 accessibilityDefaults];
    v2->_reachabilityModeEnabled = [v4 allowReachability];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__handleSignificantTimeChanged name:@"SBSignificantTimeChangedNotification" object:0];
    [v5 addObserver:v2 selector:sel__screenDidDim name:*MEMORY[0x1E4FA7A10] object:0];
    int v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    temporaryDisabledReasons = v2->_temporaryDisabledReasons;
    v2->_temporaryDisabledReasons = v6;

    v2->_effectiveReachabilityYOffset = 0.0;
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    ignoredWindows = v2->_ignoredWindows;
    v2->_ignoredWindows = (NSHashTable *)v8;

    [(SBReachabilityManager *)v2 _setupGestureRecognizers];
  }
  return v2;
}

- (void)dealloc
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[SBSystemGestureManager mainDisplayManager];
  [v4 removeGestureRecognizer:self->_reachabilityGestureRecognizer];

  id v5 = +[SBSystemGestureManager mainDisplayManager];
  [v5 removeGestureRecognizer:self->_dismissEdgeGestureRecognizer];

  int v6 = +[SBSystemGestureManager mainDisplayManager];
  [v6 removeGestureRecognizer:self->_dismissPanGestureRecognizer];

  id v7 = +[SBSystemGestureManager mainDisplayManager];
  [v7 removeGestureRecognizer:self->_dismissTapGestureRecognizer];

  v8.receiver = self;
  v8.super_class = (Class)SBReachabilityManager;
  [(SBReachabilityManager *)&v8 dealloc];
}

- (BOOL)reachabilityEnabled
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableSet *)self->_temporaryEnabledReasons count]) {
    return self->_reachabilityModeEnabled;
  }
  int v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    temporaryEnabledReasons = self->_temporaryEnabledReasons;
    int v6 = 138543362;
    id v7 = temporaryEnabledReasons;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Allowing entering reachability mode temporarily for reasons: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  return 1;
}

- (void)setReachabilityEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (+[SBReachabilityManager reachabilitySupported])
  {
    ADClientSetValueForScalarKey();
    if (v3)
    {
      if (self->_reachabilityModeEnabled) {
        return;
      }
      self->_reachabilityModeEnabled = 1;
      id v10 = +[SBDefaults localDefaults];
      id v5 = [v10 accessibilityDefaults];
      int v6 = v5;
      uint64_t v7 = 1;
    }
    else
    {
      if (!self->_reachabilityModeEnabled) {
        return;
      }
      [(SBReachabilityManager *)self deactivateReachability];
      self->_reachabilityModeEnabled = 0;
      id v10 = +[SBDefaults localDefaults];
      id v5 = [v10 accessibilityDefaults];
      int v6 = v5;
      uint64_t v7 = 0;
    }
    [v5 setAllowReachability:v7];
  }
  else
  {
    uint64_t v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = @"disable";
      if (v3) {
        int v9 = @"enable";
      }
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Can't %{public}@ reachability on an unsupported device!", buf, 0xCu);
    }
  }
}

- (double)reachabilityYOffset
{
  v2 = +[SBReachabilityDomain rootSettings];
  [v2 yOffset];
  double v4 = v3;

  return v4;
}

- (void)setReachabilityTemporarilyEnabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v4)
  {
    uint64_t v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Adding temporary reason for enabling reachability: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    temporaryEnabledReasons = self->_temporaryEnabledReasons;
    if (!temporaryEnabledReasons)
    {
      int v9 = [MEMORY[0x1E4F1CA80] set];
      id v10 = self->_temporaryEnabledReasons;
      self->_temporaryEnabledReasons = v9;

      temporaryEnabledReasons = self->_temporaryEnabledReasons;
    }
    [(NSMutableSet *)temporaryEnabledReasons addObject:v6];
  }
  else if ([(NSMutableSet *)self->_temporaryEnabledReasons containsObject:v6])
  {
    objc_super v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "Removing temporary reason for enabling reachability: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    [(NSMutableSet *)self->_temporaryEnabledReasons removeObject:v6];
  }
}

- (void)removeObserver:(id)a3
{
}

- (void)toggleReachability
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (self->_reachabilityModeActive)
  {
    ADClientAddValueForScalarKey();
    uint64_t v7 = *MEMORY[0x1E4FA75F8];
    v8[0] = &unk_1F3349038;
    double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    BOOL v4 = (void *)MEMORY[0x1E4FA5E78];
    id v5 = v3;
    id v6 = [v4 sharedInstance];
    [v6 emitEvent:8 withPayload:v5];
  }
  if ([(SBReachabilityManager *)self canActivateReachability]) {
    [(SBReachabilityManager *)self _toggleReachabilityMode];
  }
}

- (void)ignoreWindowForReachability:(id)a3
{
  id v5 = a3;
  if (!-[NSHashTable containsObject:](self->_ignoredWindows, "containsObject:"))
  {
    [(NSHashTable *)self->_ignoredWindows addObject:v5];
    inverseReachabilityTransform = self->_inverseReachabilityTransform;
    if (inverseReachabilityTransform) {
      [(SBReachabilityManager *)self _modifyDefaultPresentationContextHostTransformForWindow:v5 fromTransform:inverseReachabilityTransform toTransform:self->_inverseReachabilityTransform];
    }
  }
}

id __64__SBReachabilityManager__updateReachabilityModeActive_animated___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"[SBReachabilityManager _updateReachabilityModeActive:]";
  id v5 = @"active";
  v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  id v6 = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v8[0] = v2;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v3;
}

unsigned char *__64__SBReachabilityManager__updateReachabilityModeActive_animated___block_invoke_70(uint64_t a1)
{
  result = (unsigned char *)BSFloatEqualToFloat();
  if (result)
  {
    result = *(unsigned char **)(a1 + 32);
    if (!result[16])
    {
      return (unsigned char *)[result _tearDownReachabilityWindow];
    }
  }
  return result;
}

- (void)_setKeepAliveTimer
{
  ++self->_reachabilityExtensionGenerationCount;
  double v3 = +[SBReachabilityDomain rootSettings];
  [v3 reachabilityInteractiveKeepAlive];
  double v5 = v4;

  double v6 = CACurrentMediaTime();
  [(SBReachabilityManager *)self _pingKeepAliveWithDuration:0 interactedBeforePing:v5 initialKeepAliveTime:v6];
}

- (void)_pingKeepAliveWithDuration:(double)a3 interactedBeforePing:(BOOL)a4 initialKeepAliveTime:(double)a5
{
  int v9 = +[SBReachabilityDomain rootSettings];
  [v9 reachabilityDefaultKeepAlive];
  uint64_t v11 = v10;
  [v9 reachabilityInteractiveKeepAlive];
  uint64_t v13 = v12;
  unint64_t reachabilityExtensionGenerationCount = self->_reachabilityExtensionGenerationCount;
  CFTimeInterval v15 = CACurrentMediaTime();
  dispatch_time_t v16 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  uint64_t v17 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__SBReachabilityManager__pingKeepAliveWithDuration_interactedBeforePing_initialKeepAliveTime___block_invoke;
  block[3] = &unk_1E6AF5138;
  block[4] = self;
  block[5] = reachabilityExtensionGenerationCount;
  *(CFTimeInterval *)&block[6] = v15;
  *(double *)&block[7] = a5;
  BOOL v19 = a4;
  block[8] = v13;
  block[9] = v11;
  dispatch_after(v16, v17, block);
}

void __94__SBReachabilityManager__pingKeepAliveWithDuration_interactedBeforePing_initialKeepAliveTime___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 24))
  {
    BKSHIDServicesLastUserEventTime();
    BOOL v3 = *(double *)(a1 + 48) < v2;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __94__SBReachabilityManager__pingKeepAliveWithDuration_interactedBeforePing_initialKeepAliveTime___block_invoke_2;
    v6[3] = &unk_1E6AF5110;
    char v4 = v3;
    uint64_t v5 = *(void *)(a1 + 56);
    v6[4] = *(void *)(a1 + 32);
    char v8 = v4;
    char v9 = *(unsigned char *)(a1 + 80);
    v6[5] = v5;
    *(double *)&v6[6] = v2;
    long long v7 = *(_OWORD *)(a1 + 64);
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __94__SBReachabilityManager__pingKeepAliveWithDuration_interactedBeforePing_initialKeepAliveTime___block_invoke_2(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  double v2 = CACurrentMediaTime() - *(double *)(a1 + 40);
  BOOL v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    char v4 = objc_opt_class();
    id v5 = v4;
    double v6 = NSStringFromBOOL();
    long long v7 = NSStringFromBOOL();
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544642;
    v28 = v4;
    __int16 v29 = 2114;
    v30 = v6;
    __int16 v31 = 2114;
    v32 = v7;
    __int16 v33 = 2048;
    uint64_t v34 = v8;
    __int16 v35 = 2048;
    double v36 = v2;
    __int16 v37 = 2048;
    uint64_t v38 = v9;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "%{public}@ interactedSinceScheduling: %{public}@, interactedBeforePing: %{public}@, lastUserEventTime: %g, timeSinceStart: %g, initialKeepAliveTime: %g", buf, 0x3Eu);
  }
  if (!*(unsigned char *)(a1 + 73))
  {
    if (!*(unsigned char *)(a1 + 72))
    {
      double v18 = *(double *)(a1 + 64);
      if (v2 > v18)
      {
        ADClientAddValueForScalarKey();
        uint64_t v23 = *MEMORY[0x1E4FA75F8];
        v24 = &unk_1F3349050;
        uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v11 = &v24;
        uint64_t v12 = &v23;
        goto LABEL_11;
      }
      uint64_t v13 = *(void **)(a1 + 32);
      double v14 = v18 - v2;
      if (*(double *)(a1 + 56) < v14) {
        double v14 = *(double *)(a1 + 56);
      }
      double v15 = *(double *)(a1 + 40);
      uint64_t v16 = 0;
      return [v13 _pingKeepAliveWithDuration:v16 interactedBeforePing:v14 initialKeepAliveTime:v15];
    }
LABEL_7:
    uint64_t v13 = *(void **)(a1 + 32);
    double v14 = *(double *)(a1 + 56);
    double v15 = *(double *)(a1 + 40);
    uint64_t v16 = 1;
    return [v13 _pingKeepAliveWithDuration:v16 interactedBeforePing:v14 initialKeepAliveTime:v15];
  }
  if (*(unsigned char *)(a1 + 72)) {
    goto LABEL_7;
  }
  ADClientAddValueForScalarKey();
  uint64_t v25 = *MEMORY[0x1E4FA75F8];
  v26 = &unk_1F3349050;
  uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v11 = &v26;
  uint64_t v12 = &v25;
LABEL_11:
  BOOL v19 = objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1, v23, v24, v25, v26);
  v20 = (void *)MEMORY[0x1E4FA5E78];
  id v21 = v19;
  uint64_t v22 = [v20 sharedInstance];
  [v22 emitEvent:8 withPayload:v21];

  return [*(id *)(a1 + 32) _updateReachabilityModeActive:0];
}

- (void)_toggleReachabilityMode
{
}

- (void)_notifyObserversReachabilityModeActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v4 = (void *)[(NSHashTable *)self->_observers copy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = SBLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = (objc_class *)objc_opt_class();
          uint64_t v13 = NSStringFromClass(v12);
          *(_DWORD *)buf = 138543362;
          BOOL v19 = v13;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "notifying observer of reachability state change: %{public}@", buf, 0xCu);
        }
        if (v3)
        {
          if (objc_opt_respondsToSelector()) {
            [v10 handleReachabilityModeActivated];
          }
        }
        else if (objc_opt_respondsToSelector())
        {
          [v10 handleReachabilityModeDeactivated];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversReachabilityYOffsetDidChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v2 = (void *)[(NSHashTable *)self->_observers copy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = SBLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = (objc_class *)objc_opt_class();
          uint64_t v11 = NSStringFromClass(v10);
          *(_DWORD *)buf = 138543362;
          long long v17 = v11;
          _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "notifying observer of reachability yOffset change: %{public}@", buf, 0xCu);
        }
        if (objc_opt_respondsToSelector()) {
          [v8 handleReachabilityYOffsetDidChange];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversWillBeginReachabilityAnimation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v2 = (void *)[(NSHashTable *)self->_observers copy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = SBLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = (objc_class *)objc_opt_class();
          uint64_t v11 = NSStringFromClass(v10);
          *(_DWORD *)buf = 138543362;
          long long v17 = v11;
          _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "notifying observer of will begin reachability animation: %{public}@", buf, 0xCu);
        }
        if (objc_opt_respondsToSelector()) {
          [v8 handleWillBeginReachabilityAnimation];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversDidEndReachabilityAnimation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v2 = (void *)[(NSHashTable *)self->_observers copy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = SBLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = (objc_class *)objc_opt_class();
          uint64_t v11 = NSStringFromClass(v10);
          *(_DWORD *)buf = 138543362;
          long long v17 = v11;
          _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "notifying observer of did end reachability animation: %{public}@", buf, 0xCu);
        }
        if (objc_opt_respondsToSelector()) {
          [v8 handleDidEndReachabilityAnimation];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)_invalidateJindoReason
{
  jindoInertAssertion = self->_jindoInertAssertion;
  if (jindoInertAssertion)
  {
    [(SAInvalidatable *)jindoInertAssertion invalidateWithReason:@"Reachability Complete"];
    uint64_t v4 = self->_jindoInertAssertion;
    self->_jindoInertAssertion = 0;
  }
  jindoInertTimer = self->_jindoInertTimer;
  if (jindoInertTimer)
  {
    [(BSContinuousMachTimer *)jindoInertTimer invalidate];
    uint64_t v6 = self->_jindoInertTimer;
    self->_jindoInertTimer = 0;
  }
}

- (void)_screenDidDim
{
}

- (void)_handleSignificantTimeChanged
{
  double v2 = +[SBDefaults localDefaults];
  id v3 = [v2 accessibilityDefaults];
  [v3 allowReachability];

  ADClientSetValueForScalarKey();
}

- (BOOL)canActivateReachability
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(SBReachabilityManager *)self reachabilityEnabled])
  {
    uint64_t v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Can't enter reachability mode since it is disabled.", buf, 2u);
    }

    uint64_t v7 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    uint64_t v8 = v7;
    uint64_t v9 = &__block_literal_global_88;
    goto LABEL_13;
  }
  if ([(id)SBApp activeInterfaceOrientation] != 1)
  {
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "Can't enter reachability mode in a non-portrait orientation", buf, 2u);
    }

    uint64_t v7 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    uint64_t v8 = v7;
    uint64_t v9 = &__block_literal_global_111;
LABEL_13:
    [v7 logBlock:v9];

    return 0;
  }
  if ([(NSMutableSet *)self->_temporaryDisabledReasons count])
  {
    id v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      temporaryDisabledReasons = self->_temporaryDisabledReasons;
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = temporaryDisabledReasons;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Can't enter reachability mode temporarily for these reasons: %{public}@", buf, 0xCu);
    }

    uint64_t v5 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __48__SBReachabilityManager_canActivateReachability__block_invoke_123;
    v19[3] = &unk_1E6AF5180;
    v19[4] = self;
    [v5 logBlock:v19];

    return 0;
  }
  long long v13 = SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  long long v14 = [v13 anyObject];

  long long v15 = [v14 application];
  if (v15 && ([v14 isReachabilitySupported] & 1) == 0)
  {
    long long v17 = SBLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_INFO, "Can't enter reachability mode because the app doesn't support reachability.", buf, 2u);
    }

    double v18 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    [v18 logBlock:&__block_literal_global_132];

    BOOL v11 = 0;
  }
  else
  {
    long long v16 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    [v16 logBlock:&__block_literal_global_145];

    BOOL v11 = 1;
  }

  return v11;
}

void *__48__SBReachabilityManager_canActivateReachability__block_invoke()
{
  return &unk_1F334B880;
}

void *__48__SBReachabilityManager_canActivateReachability__block_invoke_109()
{
  return &unk_1F334B8D0;
}

id __48__SBReachabilityManager_canActivateReachability__block_invoke_123(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = @"[SBReachabilityManager canActivateReachability:]";
  v4[0] = @"result";
  v4[1] = @"reason";
  v5[0] = &unk_1F3349068;
  v5[1] = @"NoReachabilityTempDisabled";
  v4[2] = @"tempReasons";
  v5[2] = *(void *)(*(void *)(a1 + 32) + 48);
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  v7[0] = v1;
  double v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v2;
}

void *__48__SBReachabilityManager_canActivateReachability__block_invoke_130()
{
  return &unk_1F334B920;
}

void *__48__SBReachabilityManager_canActivateReachability__block_invoke_2()
{
  return &unk_1F334B970;
}

- (void)_setupGestureRecognizers
{
  if (SBFEffectiveHomeButtonType() == 2)
  {
    id v3 = [[SBReachabilityGestureRecognizer alloc] initWithTarget:self action:sel__activateReachability_];
    reachabilityGestureRecognizer = self->_reachabilityGestureRecognizer;
    self->_reachabilityGestureRecognizer = v3;

    [(SBReachabilityGestureRecognizer *)self->_reachabilityGestureRecognizer setDelegate:self];
    [(SBReachabilityGestureRecognizer *)self->_reachabilityGestureRecognizer setAllowedTouchTypes:&unk_1F3347538];
    uint64_t v5 = +[SBSystemGestureManager mainDisplayManager];
    [v5 addGestureRecognizer:self->_reachabilityGestureRecognizer withType:61];
  }
  uint64_t v6 = [[SBScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:sel__panToDeactivateReachability_];
  dismissEdgeGestureRecognizer = self->_dismissEdgeGestureRecognizer;
  self->_dismissEdgeGestureRecognizer = v6;

  [(UIScreenEdgePanGestureRecognizer *)self->_dismissEdgeGestureRecognizer setEdges:4];
  [(SBScreenEdgePanGestureRecognizer *)self->_dismissEdgeGestureRecognizer setDelegate:self];
  [(SBScreenEdgePanGestureRecognizer *)self->_dismissEdgeGestureRecognizer setAllowedTouchTypes:&unk_1F3347550];
  if ((_SBF_Private_IsD16() & 1) != 0
    || (_SBF_Private_IsD17() & 1) != 0
    || (_SBF_Private_IsD63() & 1) != 0
    || _SBF_Private_IsD64())
  {
    uint64_t v8 = [MEMORY[0x1E4F5E408] rootSettings];
    uint64_t v9 = [v8 coverSheetDismissGestureSettings];

    uint64_t v10 = self->_dismissEdgeGestureRecognizer;
    [v9 edgeRegionSize];
    -[UIScreenEdgePanGestureRecognizer _setEdgeRegionSize:](v10, "_setEdgeRegionSize:");
    BOOL v11 = self->_dismissEdgeGestureRecognizer;
    [v9 edgeRegionSize];
    -[UIScreenEdgePanGestureRecognizer _setBottomEdgeRegionSize:](v11, "_setBottomEdgeRegionSize:");
  }
  long long v12 = +[SBSystemGestureManager mainDisplayManager];
  [v12 addGestureRecognizer:self->_dismissEdgeGestureRecognizer withType:62];

  long long v13 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__tapToDeactivateReachability_];
  dismissTapGestureRecognizer = self->_dismissTapGestureRecognizer;
  self->_dismissTapGestureRecognizer = v13;

  [(UITapGestureRecognizer *)self->_dismissTapGestureRecognizer _setRequiresSystemGesturesToFail:0];
  [(UITapGestureRecognizer *)self->_dismissTapGestureRecognizer setDelegate:self];
  [(UITapGestureRecognizer *)self->_dismissTapGestureRecognizer setAllowedTouchTypes:&unk_1F3347568];
  long long v15 = +[SBSystemGestureManager mainDisplayManager];
  [v15 addGestureRecognizer:self->_dismissTapGestureRecognizer withType:64];

  long long v16 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel__panToDeactivateReachability_];
  dismissPanGestureRecognizer = self->_dismissPanGestureRecognizer;
  self->_dismissPanGestureRecognizer = v16;

  [(UIPanGestureRecognizer *)self->_dismissPanGestureRecognizer setDelegate:self];
  [(UIPanGestureRecognizer *)self->_dismissPanGestureRecognizer setAllowedTouchTypes:&unk_1F3347580];
  double v18 = +[SBSystemGestureManager mainDisplayManager];
  [v18 addGestureRecognizer:self->_dismissPanGestureRecognizer withType:63];

  [(SBScreenEdgePanGestureRecognizer *)self->_dismissEdgeGestureRecognizer setEnabled:0];
  [(UITapGestureRecognizer *)self->_dismissTapGestureRecognizer setEnabled:0];
  uint64_t v19 = self->_dismissPanGestureRecognizer;
  [(UIPanGestureRecognizer *)v19 setEnabled:0];
}

- (void)_setupReachabilityWindowIfNecessary
{
  if (self->_reachabilityModeActive)
  {
    id v3 = +[SBCoverSheetPresentationManager sharedInstance];
    uint64_t v4 = [v3 uiLockStateProvider];
    if ([v4 isUILocked]) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = [v3 isDismissGestureActive] ^ 1;
    }

    reachabilityWindow = self->_reachabilityWindow;
    if (!reachabilityWindow)
    {
      uint64_t v7 = [[SBReachabilityWindow alloc] initWithWallpaperVariant:v5 windowScene:self->_windowScene];
      uint64_t v8 = self->_reachabilityWindow;
      self->_reachabilityWindow = v7;

      [(SBWindow *)self->_reachabilityWindow setHidden:0];
      uint64_t v9 = [(SBReachabilityManager *)self _sceneForWindow:self->_reachabilityWindow];
      uint64_t v10 = [v9 uiPresentationManager];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __60__SBReachabilityManager__setupReachabilityWindowIfNecessary__block_invoke;
      v13[3] = &unk_1E6AF51C8;
      v13[4] = self;
      [v10 modifyDefaultPresentationContext:v13];

      reachabilityWindow = self->_reachabilityWindow;
    }
    BOOL v11 = [(SBReachabilityWindow *)reachabilityWindow view];
    [v11 setWallpaperVariant:v5];

    long long v12 = +[SBOrientationLockManager sharedInstance];
    [v12 setLockOverrideEnabled:1 forReason:@"Reachability"];

    [(SBScreenEdgePanGestureRecognizer *)self->_dismissEdgeGestureRecognizer setEnabled:1];
    [(UITapGestureRecognizer *)self->_dismissTapGestureRecognizer setEnabled:1];
    [(UIPanGestureRecognizer *)self->_dismissPanGestureRecognizer setEnabled:1];
  }
}

void __60__SBReachabilityManager__setupReachabilityWindowIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  double v2 = (void *)MEMORY[0x1E4F42D70];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56);
  id v4 = a2;
  id v5 = [v2 targetForUIWindow:v3];
  [v4 modifyLayerPresentationOverrideContextForLayerTarget:v5 block:&__block_literal_global_185];
}

uint64_t __60__SBReachabilityManager__setupReachabilityWindowIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setClippingDisabled:1];
}

- (void)_tearDownReachabilityWindow
{
  uint64_t v3 = +[SBOrientationLockManager sharedInstance];
  [v3 setLockOverrideEnabled:0 forReason:@"Reachability"];

  [(SBScreenEdgePanGestureRecognizer *)self->_dismissEdgeGestureRecognizer setEnabled:0];
  [(UITapGestureRecognizer *)self->_dismissTapGestureRecognizer setEnabled:0];
  [(UIPanGestureRecognizer *)self->_dismissPanGestureRecognizer setEnabled:0];
  id v4 = [(SBReachabilityManager *)self _sceneForWindow:self->_reachabilityWindow];
  id v5 = [v4 uiPresentationManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __52__SBReachabilityManager__tearDownReachabilityWindow__block_invoke;
  v7[3] = &unk_1E6AF51C8;
  v7[4] = self;
  [v5 modifyDefaultPresentationContext:v7];

  [(SBWindow *)self->_reachabilityWindow setHidden:1];
  reachabilityWindow = self->_reachabilityWindow;
  self->_reachabilityWindow = 0;
}

void __52__SBReachabilityManager__tearDownReachabilityWindow__block_invoke(uint64_t a1, void *a2)
{
  double v2 = (void *)MEMORY[0x1E4F42D70];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56);
  id v4 = a2;
  id v5 = [v2 targetForUIWindow:v3];
  [v4 removeLayerPresentationOverrideForLayerTarget:v5];
}

- (void)_modifyDefaultPresentationContextHostTransformForWindow:(id)a3 fromTransform:(id)a4 toTransform:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(SBReachabilityManager *)self _sceneForWindow:v8];
  long long v12 = [v11 uiPresentationManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __107__SBReachabilityManager__modifyDefaultPresentationContextHostTransformForWindow_fromTransform_toTransform___block_invoke;
  v16[3] = &unk_1E6AF5218;
  id v17 = v8;
  id v18 = v10;
  uint64_t v19 = self;
  id v20 = v9;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  [v12 modifyDefaultPresentationContext:v16];
}

void __107__SBReachabilityManager__modifyDefaultPresentationContextHostTransformForWindow_fromTransform_toTransform___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F42D70];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v3 targetForUIWindow:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __107__SBReachabilityManager__modifyDefaultPresentationContextHostTransformForWindow_fromTransform_toTransform___block_invoke_2;
  v10[3] = &unk_1E6AF51F0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = *(void **)(a1 + 56);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v9;
  [v5 modifyLayerPresentationOverrideContextForLayerTarget:v6 block:v10];
}

void __107__SBReachabilityManager__modifyDefaultPresentationContextHostTransformForWindow_fromTransform_toTransform___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 transformer];
  id v8 = (id)[v4 mutableCopy];

  id v5 = v8;
  if (!v8)
  {
    if (*(void *)(a1 + 32)) {
      id v5 = objc_alloc_init(MEMORY[0x1E4F42BE0]);
    }
    else {
      id v5 = 0;
    }
  }
  id v9 = v5;
  [*(id *)(a1 + 40) _transitionWithTransformer:v5 fromTransform:*(void *)(a1 + 48) toTransform:*(void *)(a1 + 32)];
  uint64_t v6 = [v9 transforms];
  if ([v6 count]) {
    id v7 = v9;
  }
  else {
    id v7 = 0;
  }
  [v3 setTransformer:v7];
}

- (void)_transitionWithTransformer:(id)a3 fromTransform:(id)a4 toTransform:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v7) {
    [v9 removeTransform:v7];
  }
  if (v8) {
    [v9 addTransform:v8 reason:@"reachability"];
  }
}

- (void)_updateReachabilityWindowForYOffset:(double)a3 mode:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (self->_effectiveReachabilityYOffset == a3)
  {
    if (v8) {
      (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
    }
  }
  else
  {
    id v10 = [(SBReachabilityWindow *)self->_reachabilityWindow view];
    id v11 = (void *)MEMORY[0x1E4F42FF0];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke;
    v57[3] = &unk_1E6AF4AC0;
    id v12 = v10;
    id v58 = v12;
    [v11 performWithoutAnimation:v57];
    int64_t animationsInFlight = self->_animationsInFlight;
    if (!animationsInFlight)
    {
      [(SBReachabilityManager *)self _notifyObserversWillBeginReachabilityAnimation];
      int64_t animationsInFlight = self->_animationsInFlight;
    }
    self->_int64_t animationsInFlight = animationsInFlight + 1;
    self->_effectiveReachabilityYOffset = a3;
    id v14 = self->_inverseReachabilityTransform;
    if (BSFloatIsZero())
    {
      id v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F42FD0], "translation:", 0.0, -a3);
      id v15 = (UITransform *)objc_claimAutoreleasedReturnValue();
    }
    inverseReachabilityTransform = self->_inverseReachabilityTransform;
    self->_inverseReachabilityTransform = v15;

    id v17 = self->_reachabilityTransform;
    if (BSFloatIsZero())
    {
      id v18 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F42FD0], "translation:", 0.0, a3);
      id v18 = (UITransform *)objc_claimAutoreleasedReturnValue();
    }
    v43 = v9;
    reachabilityTransform = self->_reachabilityTransform;
    self->_reachabilityTransform = v18;

    id v20 = +[SBReachabilityDomain rootSettings];
    uint64_t v21 = [v20 animationSettings];
    unsigned int v42 = [MEMORY[0x1E4F42FF0] areAnimationsEnabled];
    [MEMORY[0x1E4F42FF0] setAnimationsEnabled:1];
    if (!self->_jindoInertAssertion)
    {
      [(id)SBApp systemApertureControllerForMainDisplay];
      v23 = id v22 = v12;
      v24 = [v23 restrictSystemApertureToInertWithReason:@"Reachability"];
      jindoInertAssertion = self->_jindoInertAssertion;
      self->_jindoInertAssertion = v24;

      id v12 = v22;
      if (a4 != 5 && !self->_jindoInertTimer)
      {
        v26 = (BSContinuousMachTimer *)[objc_alloc(MEMORY[0x1E4F4F6F0]) initWithIdentifier:@"com.apple.SBReachabilityManager.SystemApertureInertTimer"];
        jindoInertTimer = self->_jindoInertTimer;
        self->_jindoInertTimer = v26;

        objc_initWeak(&location, self);
        [v21 settlingDuration];
        double v29 = v28;
        [v20 jindoInertDisableOffset];
        double v31 = (double)((int)(v29 - v30) & ~((int)(v29 - v30) >> 31));
        v32 = self->_jindoInertTimer;
        id v33 = MEMORY[0x1E4F14428];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_2;
        v54[3] = &unk_1E6AF4990;
        objc_copyWeak(&v55, &location);
        [(BSContinuousMachTimer *)v32 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v54 queue:v31 handler:0.0];

        objc_destroyWeak(&v55);
        objc_destroyWeak(&location);
        id v12 = v22;
      }
    }
    uint64_t v34 = (void *)MEMORY[0x1E4F42FF0];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_3;
    v49[3] = &unk_1E6AF5240;
    v49[4] = self;
    v50 = v17;
    v51 = v14;
    id v35 = v12;
    id v52 = v35;
    double v53 = a3;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_4;
    v46[3] = &unk_1E6AF5268;
    v46[4] = self;
    int64_t v48 = a4;
    id v9 = v43;
    id v47 = v43;
    double v36 = v14;
    __int16 v37 = v17;
    objc_msgSend(v34, "sb_animateWithSettings:mode:animations:completion:", v21, a4, v49, v46);
    double v38 = 0.0;
    if (self->_reachabilityModeActive) {
      double v38 = 0.1;
    }
    uint64_t v39 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.15 delay:v38];
    v40 = (void *)MEMORY[0x1E4F4F898];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_5;
    v44[3] = &unk_1E6AF5290;
    v44[4] = self;
    id v45 = v35;
    id v41 = v35;
    [v40 animateWithSettings:v39 actions:v44];
    [MEMORY[0x1E4F42FF0] setAnimationsEnabled:v42];
  }
}

uint64_t __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  double v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

void __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _invalidateJindoReason];
    id WeakRetained = v2;
  }
}

void __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance];
  id v3 = [v2 rootWindow];
  uint64_t v4 = [v3 sceneTransformer];

  [*(id *)(a1 + 32) _transitionWithTransformer:v4 fromTransform:*(void *)(a1 + 40) toTransform:*(void *)(*(void *)(a1 + 32) + 64)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "ignoredWindows", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) _modifyDefaultPresentationContextHostTransformForWindow:*(void *)(*((void *)&v13 + 1) + 8 * v9++) fromTransform:*(void *)(a1 + 48) toTransform:*(void *)(*(void *)(a1 + 32) + 72)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 56) setContainerViewYOffset:*(double *)(a1 + 64)];
  uint64_t v10 = *(void *)(a1 + 32);
  double v11 = 0.0;
  if (*(unsigned char *)(v10 + 16))
  {
    if ((unint64_t)([*(id *)(v10 + 144) state] - 1) <= 1)
    {
      [*(id *)(a1 + 32) reachabilityYOffset];
      BSUIConstrainValueWithRubberBand();
      double v11 = v12;
      if (v12 < -*(double *)(a1 + 64)) {
        double v11 = -*(double *)(a1 + 64);
      }
    }
  }
  [*(id *)(a1 + 56) setHomeGrabberAdditionalOffset:v11];
  [*(id *)(a1 + 32) _notifyObserversReachabilityYOffsetDidChange];
}

void *__77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) reachabilityModeActive]) {
    [*(id *)(a1 + 32) reachabilityYOffset];
  }
  int v6 = BSFloatEqualToFloat();
  if (*(void *)(a1 + 48) != 5 && v6 != 0) {
    [*(id *)(a1 + 32) _invalidateJindoReason];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, a2, a3);
  }
  --*(void *)(*(void *)(a1 + 32) + 104);
  result = *(void **)(a1 + 32);
  if (!result[13])
  {
    return (void *)[result _notifyObserversDidEndReachabilityAnimation];
  }
  return result;
}

uint64_t __77__SBReachabilityManager__updateReachabilityWindowForYOffset_mode_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = 0.0;
  if (*(unsigned char *)(v2 + 16)) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  if ([*(id *)(v2 + 152) state] != 1
    && [*(id *)(*(void *)(a1 + 32) + 152) state] != 2)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 144) state] == 1
      || [*(id *)(*(void *)(a1 + 32) + 144) state] == 2)
    {
      double v3 = v4;
      double v4 = 0.0;
    }
    else
    {
      double v3 = v4;
    }
  }
  [*(id *)(a1 + 40) setHomeGrabberAlpha:v3];
  id v5 = *(void **)(a1 + 40);
  return [v5 setChevronAlpha:v4];
}

- (id)_sceneForWindow:(id)a3
{
  double v3 = [a3 _scene];
  double v4 = [v3 identifier];

  id v5 = [MEMORY[0x1E4F62490] sharedInstance];
  int v6 = [v5 sceneWithIdentifier:v4];

  return v6;
}

- (void)_activateReachability:(id)a3
{
  if ([a3 state] == 3
    && [(SBReachabilityManager *)self canActivateReachability])
  {
    [(SBReachabilityManager *)self _updateReachabilityModeActive:1];
  }
}

- (void)_tapToDeactivateReachability:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([a3 state] == 3)
  {
    uint64_t v8 = *MEMORY[0x1E4FA75F8];
    v9[0] = &unk_1F33490B0;
    double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v5 = (void *)MEMORY[0x1E4FA5E78];
    id v6 = v4;
    uint64_t v7 = [v5 sharedInstance];
    [v7 emitEvent:8 withPayload:v6];

    [(SBReachabilityManager *)self deactivateReachability];
  }
}

- (void)_panToDeactivateReachability:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  double v4 = (UIPanGestureRecognizer *)a3;
  [(SBReachabilityManager *)self reachabilityYOffset];
  double v6 = v5;
  uint64_t v7 = [(UIPanGestureRecognizer *)v4 view];
  uint64_t v8 = [(UIPanGestureRecognizer *)v4 state];
  if ((unint64_t)(v8 - 1) > 1)
  {
    BOOL reachabilityModeActive = self->_reachabilityModeActive;
    if (v8 == 3)
    {
      [(UIPanGestureRecognizer *)v4 velocityInView:v7];
      double v14 = v13;
      [(UIPanGestureRecognizer *)v4 locationInView:v7];
      double v16 = v15 + v14 * 0.15;
      [(SBReachabilityWindow *)self->_reachabilityWindow bounds];
      double v18 = v17 + -100.0;
      if (self->_reachabilityModeActive)
      {
        double v19 = 0.0;
        if (self->_dismissPanGestureRecognizer == v4) {
          double v19 = v6;
        }
        double v18 = v18 - v19;
      }
      if (v16 < v18)
      {
        uint64_t v27 = *MEMORY[0x1E4FA75F8];
        v28[0] = &unk_1F33490C8;
        id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
        uint64_t v21 = (void *)MEMORY[0x1E4FA5E78];
        id v22 = v20;
        uint64_t v23 = [v21 sharedInstance];
        [v23 emitEvent:8 withPayload:v22];

        BOOL reachabilityModeActive = 0;
      }
    }
    if (!reachabilityModeActive) {
      double v6 = 0.0;
    }
    [(SBReachabilityManager *)self _updateReachabilityModeActive:reachabilityModeActive];
    v24 = self;
    double v10 = v6;
    uint64_t v25 = 3;
  }
  else
  {
    [(UIPanGestureRecognizer *)v4 translationInView:v7];
    double v10 = v6 + v9;
    if (v6 + v9 >= 0.0)
    {
      if (v10 > v6)
      {
        [(SBReachabilityWindow *)self->_reachabilityWindow bounds];
        BSUIConstrainValueWithRubberBand();
        double v10 = v6 + v26;
      }
    }
    else
    {
      [(SBReachabilityWindow *)self->_reachabilityWindow bounds];
      BSUIConstrainValueWithRubberBand();
      double v10 = -v11;
    }
    v24 = self;
    uint64_t v25 = 5;
  }
  [(SBReachabilityManager *)v24 _updateReachabilityWindowForYOffset:v25 mode:0 completion:v10];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = (SBScreenEdgePanGestureRecognizer *)a3;
  double v5 = v4;
  if ((SBScreenEdgePanGestureRecognizer *)self->_reachabilityGestureRecognizer == v4)
  {
    char v6 = !self->_reachabilityModeActive;
  }
  else if (self->_dismissEdgeGestureRecognizer == v4 && (zStackParticipant = self->_zStackParticipant) != 0)
  {
    char v6 = [(SBFZStackParticipant *)zStackParticipant ownsHomeGesture];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return 0;
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v4 = a4;
  [v4 setActivationPolicyForParticipantsBelow:0];
  [v4 setHomeGestureConsumption:1];
}

- (SBReachabilityGestureRecognizer)reachabilityGestureRecognizer
{
  return self->_reachabilityGestureRecognizer;
}

- (SBScreenEdgePanGestureRecognizer)dismissEdgeGestureRecognizer
{
  return self->_dismissEdgeGestureRecognizer;
}

- (UIPanGestureRecognizer)dismissPanGestureRecognizer
{
  return self->_dismissPanGestureRecognizer;
}

- (SBWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissEdgeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_reachabilityGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_jindoInertTimer, 0);
  objc_storeStrong((id *)&self->_jindoInertAssertion, 0);
  objc_storeStrong((id *)&self->_ignoredWindows, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_dismissTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_inverseReachabilityTransform, 0);
  objc_storeStrong((id *)&self->_reachabilityTransform, 0);
  objc_storeStrong((id *)&self->_reachabilityWindow, 0);
  objc_storeStrong((id *)&self->_temporaryDisabledReasons, 0);
  objc_storeStrong((id *)&self->_temporaryEnabledReasons, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end