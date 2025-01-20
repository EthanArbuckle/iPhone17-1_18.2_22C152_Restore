@interface SBIdleTimerGlobalCoordinator
+ (SBIdleTimerGlobalCoordinator)sharedInstance;
+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3;
+ (id)sharedInstanceIfExists;
- (BOOL)_areIdleTimerDisableAssertionsPrevented;
- (BOOL)_hasIdleTimerDisableAssertions;
- (BOOL)_updateIdleTimerForReason:(id)a3;
- (BOOL)isIdleTimerDisabled;
- (NSMutableDictionary)_idleTimerDisableAssertions;
- (SBIdleTimer)idleTimer;
- (SBIdleTimerGlobalCoordinator)init;
- (SBIdleTimerGlobalCoordinatorDelegate)delegate;
- (SBIdleTimerProviding)_idleTimerProvider;
- (id)_activeIdleTimerProvider;
- (id)_stateCaptureDescription;
- (id)_updateIdleTimerForProvider:(id)a3 behavior:(id)a4 descriptor:(id)a5 forReason:(id)a6;
- (id)_updateIdleTimerForProvider:(id)a3 behavior:(id)a4 forReason:(id)a5;
- (id)acquireIdleTimerDisableAssertionForReason:(id)a3;
- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5;
- (void)_addStateCaptureHandlers;
- (void)_applyActiveIdleTimerDescriptorForReason:(id)a3;
- (void)_idleTimerPrefsChanged;
- (void)_logEffectiveLockTimeout;
- (void)_logTelemetryForIdleTimerUpdatedFromTimer:(id)a3 toTimer:(id)a4 withReason:(id)a5;
- (void)_registerClientDisableAssertionsTestRecipe;
- (void)_registerInternalDisableAssertionsTestRecipe;
- (void)_registerTestRecipes;
- (void)_setIdleTimerDisableAssertions:(id)a3;
- (void)_setIdleTimerProvider:(id)a3;
- (void)_setIdleTimerSourceEnabled:(BOOL)a3 forReason:(id)a4;
- (void)_setIdleTimerWithDescriptor:(id)a3 forReason:(id)a4;
- (void)_unregisterTestRecipes;
- (void)_updateGlobalStateDisableAssertions;
- (void)dealloc;
- (void)idleTimerDidRefresh:(id)a3;
- (void)idleTimerDidResetForUserAttention:(id)a3;
- (void)idleTimerGlobalStateMonitor:(id)a3 changedForReason:(id)a4;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)resetIdleTimerForReason:(id)a3;
- (void)resetIdleTimerIfCurrentIdealDurationAtLeast:(int64_t)a3 forReason:(id)a4;
- (void)resetIdleTimerIfNonConsecutiveSource:(id)a3 forReason:(id)a4;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation SBIdleTimerGlobalCoordinator

- (id)_activeIdleTimerProvider
{
  if (+[SBAssistantController isVisible])
  {
    v2 = SBAssistantController;
LABEL_7:
    v7 = [(__objc2_class *)v2 sharedInstance];
    goto LABEL_8;
  }
  v3 = +[SBSyncController sharedInstance];
  int v4 = [v3 isInUse];

  if (v4)
  {
    v2 = SBSyncController;
    goto LABEL_7;
  }
  v5 = +[SBControlCenterController sharedInstanceIfExists];
  int v6 = [v5 isVisible];

  if (v6)
  {
    v2 = SBControlCenterController;
    goto LABEL_7;
  }
  v7 = +[SBWorkspace mainWorkspace];
LABEL_8:
  return v7;
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"-[SBIdleTimerGlobalCoordinator idleTimerProvider:didProposeBehavior:forReason:]"];
    [v16 handleFailureInFunction:v17 file:@"SBIdleTimerGlobalCoordinator.m" lineNumber:249 description:@"this call must be made on the main thread"];
  }
  id v11 = [(SBIdleTimerGlobalCoordinator *)self _activeIdleTimerProvider];
  if (v11 == v8)
  {
    v14 = +[SBIdleTimerBehavior behaviorForBehaviorProvider:v9];
    v13 = [(SBIdleTimerGlobalCoordinator *)self _updateIdleTimerForProvider:v8 behavior:v14 forReason:v10];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerProvider);

    if (v11 != WeakRetained) {
      [(SBIdleTimerGlobalCoordinator *)self _updateIdleTimerForReason:@"ActiveProviderChanged"];
    }
    v13 = [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper updateProvider:v8 behavior:v9 reason:v10];
  }

  return v13;
}

- (id)_updateIdleTimerForProvider:(id)a3 behavior:(id)a4 forReason:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F29060];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if (([v8 isMainThread] & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"-[SBIdleTimerGlobalCoordinator _updateIdleTimerForProvider:behavior:forReason:]"];
    [v15 handleFailureInFunction:v16 file:@"SBIdleTimerGlobalCoordinator.m" lineNumber:399 description:@"this call must be made on the main thread"];
  }
  v12 = [(SBIdleTimerDescriptorFactory *)self->_idleTimerDescriptorFactory idleTimerDescriptorForBehavior:v10];
  v13 = [(SBIdleTimerGlobalCoordinator *)self _updateIdleTimerForProvider:v11 behavior:v10 descriptor:v12 forReason:v9];

  return v13;
}

- (id)_updateIdleTimerForProvider:(id)a3 behavior:(id)a4 descriptor:(id)a5 forReason:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    v25 = [NSString stringWithUTF8String:"-[SBIdleTimerGlobalCoordinator _updateIdleTimerForProvider:behavior:descriptor:forReason:]"];
    [v24 handleFailureInFunction:v25 file:@"SBIdleTimerGlobalCoordinator.m" lineNumber:371 description:@"this call must be made on the main thread"];
  }
  [(SBIdleTimerGlobalCoordinator *)self _setIdleTimerProvider:v10];
  uint64_t v14 = [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper idleTimerProxyForProvider:v10];
  if (v14)
  {
    v15 = (SBIdleTimerProxy *)v14;
    id v16 = [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper updateProvider:v10 behavior:v11 reason:v13];
  }
  else
  {
    v15 = [[SBIdleTimerProxy alloc] initWithIdleTimerSource:0];
    [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper bindProvider:v10 toSourceTimer:v15 behavior:v11 forReason:v13];
  }
  [(SBIdleTimerProxy *)self->_enabledIdleTimerProxy setSourceTimer:0];
  objc_storeStrong((id *)&self->_enabledIdleTimerProxy, v15);
  p_enabledIdleTimerDescriptor = &self->_enabledIdleTimerDescriptor;
  objc_storeStrong((id *)&self->_enabledIdleTimerDescriptor, a5);
  BOOL idleTimerSourceEnabled = self->_idleTimerSourceEnabled;
  v19 = SBLogIdleTimer();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (idleTimerSourceEnabled)
  {
    if (v20)
    {
      v21 = *p_enabledIdleTimerDescriptor;
      int v26 = 138543618;
      v27 = v21;
      __int16 v28 = 2114;
      id v29 = v13;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "applying updated idle timer descriptor: %{public}@ reason:%{public}@", (uint8_t *)&v26, 0x16u);
    }

    [(SBIdleTimerGlobalCoordinator *)self _applyActiveIdleTimerDescriptorForReason:v13];
  }
  else
  {
    if (v20)
    {
      v22 = *p_enabledIdleTimerDescriptor;
      int v26 = 138543618;
      v27 = v22;
      __int16 v28 = 2114;
      id v29 = v13;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "not applying updated idle timer descriptor: %{public}@ reason:%{public}@", (uint8_t *)&v26, 0x16u);
    }
  }
  return v15;
}

- (BOOL)_updateIdleTimerForReason:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = [NSString stringWithUTF8String:"-[SBIdleTimerGlobalCoordinator _updateIdleTimerForReason:]"];
    [v17 handleFailureInFunction:v18 file:@"SBIdleTimerGlobalCoordinator.m" lineNumber:320 description:@"this call must be made on the main thread"];
  }
  v5 = SBLogIdleTimer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v19 = 138543618;
    BOOL v20 = v7;
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - updateIdleTimerForReason:\"%{public}@\"]", (uint8_t *)&v19, 0x16u);
  }
  [(SBIdleTimerGlobalCoordinator *)self _updateGlobalStateDisableAssertions];
  id v8 = [(SBIdleTimerGlobalCoordinator *)self _activeIdleTimerProvider];
  if (v8)
  {
    id v9 = [(SBIdleTimerGlobalCoordinator *)self _idleTimerProvider];

    if (v8 != v9) {
      [(SBIdleTimerGlobalCoordinator *)self _setIdleTimerProvider:v8];
    }
    id v10 = [v8 coordinatorRequestedIdleTimerBehavior:self];
    id v11 = +[SBIdleTimerBehavior behaviorForBehaviorProvider:v10];
    id v12 = [(SBIdleTimerDescriptorFactory *)self->_idleTimerDescriptorFactory idleTimerDescriptorForBehavior:v11];
    id v13 = v12;
    if (v8 == v9 && ([v12 isEqual:self->_enabledIdleTimerDescriptor] & 1) != 0)
    {
      BOOL v14 = 0;
    }
    else
    {
      id v15 = [(SBIdleTimerGlobalCoordinator *)self _updateIdleTimerForProvider:v8 behavior:v11 descriptor:v13 forReason:v4];
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __81__SBIdleTimerGlobalCoordinator_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _activeIdleTimerProvider];
  if (v2)
  {
    id v7 = v2;
    v3 = [v2 coordinatorRequestedIdleTimerBehavior:*(void *)(a1 + 32)];
    id v4 = +[SBIdleTimerBehavior behaviorForBehaviorProvider:v3];
    v5 = [*(id *)(*(void *)(a1 + 32) + 8) idleTimerDescriptorForBehavior:v4];
    if (([v5 isEqual:*(void *)(*(void *)(a1 + 32) + 40)] & 1) == 0)
    {
      [*(id *)(a1 + 32) _setIdleTimerProvider:v7];
      id v6 = (id)[*(id *)(a1 + 32) _updateIdleTimerForProvider:v7 behavior:v4 descriptor:v5 forReason:@"LayoutMonitorDidUpdateDisplayLayout"];
    }

    v2 = v7;
  }
}

- (void)_updateGlobalStateDisableAssertions
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"-[SBIdleTimerGlobalCoordinator _updateGlobalStateDisableAssertions]"];
    [v7 handleFailureInFunction:v8 file:@"SBIdleTimerGlobalCoordinator.m" lineNumber:518 description:@"this call must be made on the main thread"];
  }
  BOOL v3 = [(SBIdleTimerGlobalStateMonitor *)self->_globalStateMonitor isAutoDimDisabled];
  disableAutoDimAssertion = self->_disableAutoDimAssertion;
  if (disableAutoDimAssertion && !v3)
  {
    [(BSInvalidatable *)disableAutoDimAssertion invalidate];
    v5 = 0;
LABEL_10:
    id v6 = self->_disableAutoDimAssertion;
    self->_disableAutoDimAssertion = v5;

    return;
  }
  if (disableAutoDimAssertion) {
    BOOL v3 = 0;
  }
  if (v3)
  {
    v5 = [(SBIdleTimerGlobalCoordinator *)self acquireIdleTimerDisableAssertionForReason:@"SBDisableAutoDim user default."];
    goto LABEL_10;
  }
}

- (SBIdleTimerProviding)_idleTimerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerProvider);
  return (SBIdleTimerProviding *)WeakRetained;
}

- (void)_setIdleTimerProvider:(id)a3
{
  id obj = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"-[SBIdleTimerGlobalCoordinator _setIdleTimerProvider:]"];
    [v7 handleFailureInFunction:v8 file:@"SBIdleTimerGlobalCoordinator.m" lineNumber:363 description:@"this call must be made on the main thread"];
  }
  p_idleTimerProvider = &self->_idleTimerProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_idleTimerProvider);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_idleTimerProvider, obj);
    id v6 = obj;
  }
}

- (void)resetIdleTimerForReason:(id)a3
{
  id v9 = a3;
  if (![v9 length])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBIdleTimerGlobalCoordinator.m", 172, @"Invalid parameter not satisfying: %@", @"[reason length] > 0" object file lineNumber description];
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"-[SBIdleTimerGlobalCoordinator resetIdleTimerForReason:]"];
    [v7 handleFailureInFunction:v8 file:@"SBIdleTimerGlobalCoordinator.m" lineNumber:173 description:@"this call must be made on the main thread"];
  }
  if (![(SBIdleTimerGlobalCoordinator *)self _updateIdleTimerForReason:v9])
  {
    v5 = [(SBIdleTimerGlobalCoordinator *)self idleTimer];
    [v5 reset];
  }
}

- (SBIdleTimer)idleTimer
{
  return [(SBIdleTimerProxy *)self->_idleTimerProxy sourceTimer];
}

+ (SBIdleTimerGlobalCoordinator)sharedInstance
{
  return (SBIdleTimerGlobalCoordinator *)[a1 _sharedInstanceCreateIfNeeded:1];
}

+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3
{
  if (a3 && _sharedInstanceCreateIfNeeded__onceToken != -1) {
    dispatch_once(&_sharedInstanceCreateIfNeeded__onceToken, &__block_literal_global_194);
  }
  BOOL v3 = (void *)_sharedInstanceCreateIfNeeded__coordinator;
  return v3;
}

void __37__SBIdleTimerGlobalCoordinator_start__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained layoutMonitor:v11 didUpdateDisplayLayout:v7 withContext:v8];
  }
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = SBLogIdleTimer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "%{public}@ - layoutMonitor:didUpdateDisplayLayout]", buf, 0xCu);
  }
  BSDispatchMain();
}

void __62__SBIdleTimerGlobalCoordinator__sharedInstanceCreateIfNeeded___block_invoke()
{
  v0 = objc_alloc_init(SBIdleTimerGlobalCoordinator);
  v1 = (void *)_sharedInstanceCreateIfNeeded__coordinator;
  _sharedInstanceCreateIfNeeded__coordinator = (uint64_t)v0;
}

+ (id)sharedInstanceIfExists
{
  return (id)[a1 _sharedInstanceCreateIfNeeded:0];
}

- (SBIdleTimerGlobalCoordinator)init
{
  v17.receiver = self;
  v17.super_class = (Class)SBIdleTimerGlobalCoordinator;
  v2 = [(SBIdleTimerGlobalCoordinator *)&v17 init];
  if (v2)
  {
    uint64_t v3 = +[SBIdleTimerGlobalStateMonitor sharedInstance];
    globalStateMonitor = v2->_globalStateMonitor;
    v2->_globalStateMonitor = (SBIdleTimerGlobalStateMonitor *)v3;

    v5 = [[SBIdleTimerDescriptorFactory alloc] initWithGlobalStateMonitor:v2->_globalStateMonitor];
    idleTimerDescriptorFactory = v2->_idleTimerDescriptorFactory;
    v2->_idleTimerDescriptorFactory = v5;

    objc_storeWeak((id *)&v2->_idleTimerProvider, 0);
    id v7 = [[SBIdleTimerCoordinatorHelper alloc] initWithSourceProvider:0];
    idleTimerCoordinatorHelper = v2->_idleTimerCoordinatorHelper;
    v2->_idleTimerCoordinatorHelper = v7;

    v2->_BOOL idleTimerSourceEnabled = 1;
    id v9 = [[SBIdleTimerProxy alloc] initWithIdleTimerSource:0];
    idleTimerProxy = v2->_idleTimerProxy;
    v2->_idleTimerProxy = v9;

    [(SBIdleTimerBase *)v2->_idleTimerProxy addIdleTimerObserver:v2];
    id v11 = objc_alloc_init(SBIdleTimerTelemetryEmitter);
    idleTimerTelemetryEmitter = v2->_idleTimerTelemetryEmitter;
    v2->_idleTimerTelemetryEmitter = v11;

    currentDisablingClientBundleIdentifier = v2->_currentDisablingClientBundleIdentifier;
    v2->_currentDisablingClientBundleIdentifier = 0;

    BOOL v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    idleTimerDisableAssertions = v2->_idleTimerDisableAssertions;
    v2->_idleTimerDisableAssertions = v14;

    [(SBIdleTimerGlobalCoordinator *)v2 _addStateCaptureHandlers];
    [(SBIdleTimerGlobalCoordinator *)v2 _registerTestRecipes];
  }
  return v2;
}

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  stateCaptureAssertion = self->_stateCaptureAssertion;
  if (stateCaptureAssertion)
  {
    [(BSInvalidatable *)stateCaptureAssertion invalidate];
    id v4 = self->_stateCaptureAssertion;
    self->_stateCaptureAssertion = 0;
  }
  [(SBIdleTimerGlobalCoordinator *)self _unregisterTestRecipes];
  v5.receiver = self;
  v5.super_class = (Class)SBIdleTimerGlobalCoordinator;
  [(SBIdleTimerGlobalCoordinator *)&v5 dealloc];
}

- (BOOL)isIdleTimerDisabled
{
  v2 = [(SBIdleTimerGlobalCoordinator *)self idleTimer];
  char v3 = [v2 isDisabled];

  return v3;
}

- (void)start
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = [NSString stringWithUTF8String:"-[SBIdleTimerGlobalCoordinator start]"];
    [v11 handleFailureInFunction:v12 file:@"SBIdleTimerGlobalCoordinator.m" lineNumber:143 description:@"this call must be made on the main thread"];
  }
  if (self->_started)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBIdleTimerGlobalCoordinator.m" lineNumber:145 description:@"Cannot start if already started."];
  }
  self->_started = 1;
  [(SBIdleTimerGlobalStateMonitor *)self->_globalStateMonitor addObserver:self];
  [(SBIdleTimerGlobalCoordinator *)self _updateGlobalStateDisableAssertions];
  id v4 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
  objc_initWeak(&location, self);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __37__SBIdleTimerGlobalCoordinator_start__block_invoke;
  objc_super v17 = &unk_1E6AF9A38;
  objc_copyWeak(&v18, &location);
  [v4 setTransitionHandler:&v14];
  objc_msgSend(MEMORY[0x1E4F62940], "monitorWithConfiguration:", v4, v14, v15, v16, v17);
  objc_super v5 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = v5;

  id v7 = [(SBIdleTimerGlobalCoordinator *)self _activeIdleTimerProvider];
  id v8 = [v7 coordinatorRequestedIdleTimerBehavior:self];
  id v9 = +[SBIdleTimerBehavior behaviorForBehaviorProvider:v8];

  id v10 = [(SBIdleTimerGlobalCoordinator *)self _updateIdleTimerForProvider:v7 behavior:v9 forReason:@"Startup"];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)resetIdleTimerIfNonConsecutiveSource:(id)a3 forReason:(id)a4
{
  id v11 = (SBIdleTimerResetSource *)a3;
  id v8 = a4;
  id v9 = v11;
  if (!v11)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBIdleTimerGlobalCoordinator.m", 182, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];

    id v9 = 0;
  }
  if (self->_lastResetSource != v9)
  {
    [(SBIdleTimerGlobalCoordinator *)self resetIdleTimerForReason:v8];
    objc_storeStrong((id *)&self->_lastResetSource, a3);
  }
}

- (void)resetIdleTimerIfCurrentIdealDurationAtLeast:(int64_t)a3 forReason:(id)a4
{
  id v9 = a4;
  id v6 = [(SBIdleTimerGlobalCoordinator *)self _activeIdleTimerProvider];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 coordinatorRequestedIdleTimerBehavior:self];
    if ([v8 idleTimerDuration] >= a3) {
      [(SBIdleTimerGlobalCoordinator *)self resetIdleTimerForReason:v9];
    }
  }
}

- (id)acquireIdleTimerDisableAssertionForReason:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    __int16 v21 = [MEMORY[0x1E4F28B00] currentHandler];
    id v22 = [NSString stringWithUTF8String:"-[SBIdleTimerGlobalCoordinator acquireIdleTimerDisableAssertionForReason:]"];
    [v21 handleFailureInFunction:v22 file:@"SBIdleTimerGlobalCoordinator.m" lineNumber:201 description:@"this call must be made on the main thread"];
  }
  idleTimerDisableAssertions = self->_idleTimerDisableAssertions;
  if (!idleTimerDisableAssertions
    || ([(NSMutableDictionary *)idleTimerDisableAssertions objectForKey:v4],
        (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_initWeak(&location, self);
    id v8 = objc_alloc(MEMORY[0x1E4F4F838]);
    id v9 = MEMORY[0x1E4F14428];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __74__SBIdleTimerGlobalCoordinator_acquireIdleTimerDisableAssertionForReason___block_invoke;
    v23[3] = &unk_1E6AFA6D0;
    objc_copyWeak(&v24, &location);
    v23[4] = self;
    id v6 = (void *)[v8 initWithIdentifier:@"DisableIdleTimer" forReason:v4 queue:MEMORY[0x1E4F14428] invalidationBlock:v23];

    id v10 = [(SBIdleTimerGlobalCoordinator *)self _idleTimerDisableAssertions];
    uint64_t v11 = [v10 count];
    [v10 setObject:v6 forKey:v4];
    if (v11)
    {
      id v12 = SBLogIdleTimer();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138543618;
        v27 = v14;
        __int16 v28 = 2114;
        id v29 = v4;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - Idle timer disable assertion: Added a new idle timer disable assertion for reason: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (![(SBIdleTimerGlobalCoordinator *)self _areIdleTimerDisableAssertionsPrevented])
      {
        id v18 = SBLogIdleTimer();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = (objc_class *)objc_opt_class();
          BOOL v20 = NSStringFromClass(v19);
          *(_DWORD *)buf = 138543618;
          v27 = v20;
          __int16 v28 = 2114;
          id v29 = v4;
          _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - Idle timer disable assertion: Disabling idle timer for reason: %{public}@", buf, 0x16u);
        }
        [(SBIdleTimerGlobalCoordinator *)self _setIdleTimerSourceEnabled:0 forReason:v4];
        goto LABEL_15;
      }
      id v12 = SBLogIdleTimer();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = (objc_class *)objc_opt_class();
        id v16 = NSStringFromClass(v15);
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        __int16 v28 = 2114;
        id v29 = v4;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - Idle timer disable assertion: Added a new idle timer disable assertion for reason: %{public}@ but disable is prevented.", buf, 0x16u);
      }
    }

LABEL_15:
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    goto LABEL_16;
  }
  id v7 = SBLogIdleTimer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    [(SBIdleTimerGlobalCoordinator *)(uint64_t)self acquireIdleTimerDisableAssertionForReason:v7];
  }

LABEL_16:
  return v6;
}

void __74__SBIdleTimerGlobalCoordinator_acquireIdleTimerDisableAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_super v5 = [v3 reason];
    id v6 = [WeakRetained _idleTimerDisableAssertions];
    [v6 removeObjectForKey:v5];
    uint64_t v7 = [v6 count];
    id v8 = SBLogIdleTimer();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        id v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        int v14 = 138543618;
        uint64_t v15 = v11;
        __int16 v16 = 2114;
        objc_super v17 = v5;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Idle timer disable assertion: Removed an idle timer disable assertion for reason: %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      if (v9)
      {
        id v12 = (objc_class *)objc_opt_class();
        id v13 = NSStringFromClass(v12);
        int v14 = 138543618;
        uint64_t v15 = v13;
        __int16 v16 = 2114;
        objc_super v17 = v5;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Idle timer disable assertion: Reenabling idle timer as last disable assertion removed for reason: %{public}@", (uint8_t *)&v14, 0x16u);
      }
      [WeakRetained _setIdleTimerSourceEnabled:1 forReason:v5];
    }
  }
}

- (void)_logEffectiveLockTimeout
{
  if (![(SBIdleTimerGlobalCoordinator *)self isIdleTimerDisabled])
  {
    enabledIdleTimerDescriptor = self->_enabledIdleTimerDescriptor;
    if (enabledIdleTimerDescriptor) {
      [(SBIdleTimerDescriptor *)enabledIdleTimerDescriptor totalInterval];
    }
  }
  AnalyticsSendEventLazy();
}

id __56__SBIdleTimerGlobalCoordinator__logEffectiveLockTimeout__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"lockTimeout";
  v1 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (BOOL)_hasIdleTimerDisableAssertions
{
  v2 = [(SBIdleTimerGlobalCoordinator *)self _idleTimerDisableAssertions];
  id v3 = v2;
  if (v2) {
    BOOL v4 = [v2 count] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_areIdleTimerDisableAssertionsPrevented
{
  v2 = [(SBIdleTimerGlobalStateMonitor *)self->_globalStateMonitor aggregateClientConfiguration];
  id v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 maxExpirationTimeoutSettings];
    objc_super v5 = v4;
    if (v4) {
      BOOL v6 = (unint64_t)[v4 highestPrecedence] > 1;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_setIdleTimerSourceEnabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[SBIdleTimerGlobalCoordinator _setIdleTimerSourceEnabled:forReason:]"];
    [v6 handleFailureInFunction:v7 file:@"SBIdleTimerGlobalCoordinator.m" lineNumber:407 description:@"this call must be made on the main thread"];
  }
  if (self->_idleTimerSourceEnabled != v4)
  {
    self->_BOOL idleTimerSourceEnabled = v4;
    [(SBIdleTimerGlobalCoordinator *)self _applyActiveIdleTimerDescriptorForReason:v8];
  }
}

- (void)_applyActiveIdleTimerDescriptorForReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[SBIdleTimerGlobalCoordinator _applyActiveIdleTimerDescriptorForReason:]"];
    [v9 handleFailureInFunction:v10 file:@"SBIdleTimerGlobalCoordinator.m" lineNumber:416 description:@"this call must be made on the main thread"];
  }
  BOOL idleTimerSourceEnabled = self->_idleTimerSourceEnabled;
  BOOL v6 = SBLogIdleTimer();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (idleTimerSourceEnabled)
  {
    if (v7)
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "_applyActiveIdleTimerDescriptorForReason:\"%{public}@\" enabled", (uint8_t *)&v11, 0xCu);
    }

    [(SBIdleTimerGlobalCoordinator *)self _setIdleTimerWithDescriptor:self->_enabledIdleTimerDescriptor forReason:v4];
    [(SBIdleTimerProxy *)self->_enabledIdleTimerProxy setSourceTimer:self->_idleTimerProxy];
  }
  else
  {
    if (v7)
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "_applyActiveIdleTimerDescriptorForReason:\"%{public}@\" disabled", (uint8_t *)&v11, 0xCu);
    }

    [(SBIdleTimerProxy *)self->_enabledIdleTimerProxy setSourceTimer:0];
    id v8 = +[SBIdleTimerDescriptorFactory disabledIdleTimerDescriptor];
    [(SBIdleTimerGlobalCoordinator *)self _setIdleTimerWithDescriptor:v8 forReason:v4];
  }
}

- (void)_setIdleTimerWithDescriptor:(id)a3 forReason:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[SBIdleTimerGlobalCoordinator _setIdleTimerWithDescriptor:forReason:]"];
    [v14 handleFailureInFunction:v15 file:@"SBIdleTimerGlobalCoordinator.m" lineNumber:429 description:@"this call must be made on the main thread"];
  }
  id v8 = SBLogIdleTimer();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "_setIdleTimerWithDescriptor:%{public}@ reason:\"%{public}@\"]", (uint8_t *)&v16, 0x16u);
  }

  BOOL v9 = [(SBIdleTimerGlobalCoordinator *)self _activeIdleTimerProvider];
  [(SBIdleTimerGlobalCoordinator *)self _setIdleTimerProvider:v9];

  id v10 = [(SBIdleTimerGlobalCoordinator *)self idleTimer];
  LOBYTE(v16) = 0;
  int v11 = +[SBIdleTimerFactory idleTimerForDescriptor:v6 didLogDescriptor:&v16];
  if (v11 == v10)
  {
    uint64_t v13 = SBLogIdleTimer();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SBIdleTimerGlobalCoordinator _setIdleTimerWithDescriptor:forReason:]((uint64_t)self, (uint64_t)v10, v13);
    }
  }
  else
  {
    if (!(_BYTE)v16)
    {
      id v12 = SBLogIdleTimer();
      [v6 logAuditReasons:v12];
    }
    if (objc_opt_respondsToSelector()) {
      [v10 setActivated:0];
    }
    [(SBIdleTimerProxy *)self->_idleTimerProxy setSourceTimer:v11];
    if (objc_opt_respondsToSelector()) {
      [v11 setActivated:1];
    }
    uint64_t v13 = [(SBIdleTimerGlobalCoordinator *)self delegate];
    [v13 idleTimerGlobalCoordinator:self didActivateIdleTimer:v11];
  }

  [(SBIdleTimerGlobalCoordinator *)self _logTelemetryForIdleTimerUpdatedFromTimer:v10 toTimer:v11 withReason:v7];
  [v11 reset];
}

- (void)_addStateCaptureHandlers
{
  objc_super v5 = self;
  v2 = v5;
  uint64_t v3 = BSLogAddStateCaptureBlockWithTitle();
  stateCaptureAssertion = v2->_stateCaptureAssertion;
  v2->_stateCaptureAssertion = (BSInvalidatable *)v3;
}

__CFString *__56__SBIdleTimerGlobalCoordinator__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v2 = [v1 _stateCaptureDescription];
  }
  else
  {
    v2 = &stru_1F3084718;
  }
  return v2;
}

- (id)_stateCaptureDescription
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  BOOL v9 = __56__SBIdleTimerGlobalCoordinator__stateCaptureDescription__block_invoke;
  id v10 = &unk_1E6AF5290;
  int v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendBodySectionWithName:0 multilinePrefix:0 block:&v7];
  objc_super v5 = objc_msgSend(v4, "build", v7, v8, v9, v10, v11);

  return v5;
}

void __56__SBIdleTimerGlobalCoordinator__stateCaptureDescription__block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(*(void *)(a1 + 32) + 152) allValues];
  [*(id *)(a1 + 40) appendArraySection:v10 withName:@"DisabledAssertions" skipIfEmpty:0];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) idleTimer];
  id v4 = [*(id *)(a1 + 40) activeMultilinePrefix];
  objc_super v5 = [v3 stateCaptureDescriptionWithMultilinePrefix:v4];
  id v6 = (id)[v2 appendObject:v5 withName:@"IdleTimer"];

  uint64_t v7 = *(void **)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  id v9 = (id)[v7 appendObject:WeakRetained withName:@"IdleTimerProvider"];
}

- (void)_logTelemetryForIdleTimerUpdatedFromTimer:(id)a3 toTimer:(id)a4 withReason:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 isDisabled])
  {
    if (([v9 hasPrefix:@"IdleTimerDisableChangedForMainDisplaySceneManager - client:"] & 1) != 0
      || [v9 hasPrefix:@"IdleTimerServiceTimeoutAssertionsDidChange - client:"])
    {
      if ([v9 hasPrefix:@"IdleTimerDisableChangedForMainDisplaySceneManager - client:"])
      {
        id v10 = [v9 substringFromIndex:objc_msgSend(@"IdleTimerDisableChangedForMainDisplaySceneManager - client:", "length")];
      }
      else
      {
        id v10 = 0;
      }
      if ([v9 hasPrefix:@"IdleTimerServiceTimeoutAssertionsDidChange - client:"])
      {
        uint64_t v11 = [v9 substringFromIndex:objc_msgSend(@"IdleTimerServiceTimeoutAssertionsDidChange - client:", "length")];

        id v10 = (__CFString *)v11;
      }
    }
    else
    {
      id v10 = @"com.apple.springboard";
    }
  }
  else
  {
    id v10 = 0;
  }
  int v12 = [v17 isDisabled];
  if (v12 != [v8 isDisabled]
    || !BSEqualStrings()
    || [v9 hasSuffix:@"AutoLockTimeout"])
  {
    idleTimerTelemetryEmitter = self->_idleTimerTelemetryEmitter;
    uint64_t v14 = [v8 isDisabled];
    uint64_t v15 = [(SBIdleTimerGlobalStateMonitor *)self->_globalStateMonitor autoLockTimeout];
    [(SBIdleTimerTelemetryEmitter *)idleTimerTelemetryEmitter logTelemetryForUpdatedIdleTimerState:v14 disablingClientBundleIdentifier:v10 autoLockTimeoutDuration:v15];
  }
  currentDisablingClientBundleIdentifier = self->_currentDisablingClientBundleIdentifier;
  self->_currentDisablingClientBundleIdentifier = &v10->isa;
}

- (void)_idleTimerPrefsChanged
{
}

uint64_t __54__SBIdleTimerGlobalCoordinator__idleTimerPrefsChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateIdleTimerForReason:@"IdleTimerPrefsChanged"];
}

- (void)idleTimerGlobalStateMonitor:(id)a3 changedForReason:(id)a4
{
  id v6 = a4;
  -[SBIdleTimerGlobalCoordinator _updateIdleTimerForReason:](self, "_updateIdleTimerForReason:");
  if ([(SBIdleTimerGlobalCoordinator *)self _hasIdleTimerDisableAssertions]) {
    BOOL v5 = [(SBIdleTimerGlobalCoordinator *)self _areIdleTimerDisableAssertionsPrevented];
  }
  else {
    BOOL v5 = 1;
  }
  if (self->_idleTimerSourceEnabled != v5) {
    -[SBIdleTimerGlobalCoordinator _setIdleTimerSourceEnabled:forReason:](self, "_setIdleTimerSourceEnabled:forReason:");
  }
}

- (void)idleTimerDidRefresh:(id)a3
{
  lastResetSource = self->_lastResetSource;
  self->_lastResetSource = 0;
}

- (void)idleTimerDidResetForUserAttention:(id)a3
{
  lastResetSource = self->_lastResetSource;
  self->_lastResetSource = 0;
}

- (void)_registerTestRecipes
{
  [(SBIdleTimerGlobalCoordinator *)self _registerClientDisableAssertionsTestRecipe];
  [(SBIdleTimerGlobalCoordinator *)self _registerInternalDisableAssertionsTestRecipe];
}

- (void)_unregisterTestRecipes
{
  clientDisableAssertionsTestRecipe = self->_clientDisableAssertionsTestRecipe;
  if (clientDisableAssertionsTestRecipe)
  {
    [(PTTestRecipe *)clientDisableAssertionsTestRecipe invalidate];
    id v4 = self->_clientDisableAssertionsTestRecipe;
    self->_clientDisableAssertionsTestRecipe = 0;
  }
  internalDisableAssertionsTestRecipe = self->_internalDisableAssertionsTestRecipe;
  if (internalDisableAssertionsTestRecipe)
  {
    [(PTTestRecipe *)internalDisableAssertionsTestRecipe invalidate];
    id v6 = self->_internalDisableAssertionsTestRecipe;
    self->_internalDisableAssertionsTestRecipe = 0;
  }
}

- (void)_registerClientDisableAssertionsTestRecipe
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__63;
  v9[4] = __Block_byref_object_dispose__63;
  id v10 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke;
  v8[3] = &unk_1E6AF56B0;
  v8[4] = v9;
  v6[4] = v9;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_2;
  v7[3] = &unk_1E6AF6358;
  v7[4] = self;
  v7[5] = v9;
  v7[6] = a2;
  v5[4] = v9;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_106;
  v6[3] = &unk_1E6AF56B0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_2_107;
  v5[3] = &unk_1E6AF56B0;
  uint64_t v3 = [MEMORY[0x1E4F94128] recipeWithTitle:@"Client Disable IdleTimer Assertions" prepareBlock:v8 increaseAction:v7 decreaseAction:v6 cleanupBlock:v5];
  clientDisableAssertionsTestRecipe = self->_clientDisableAssertionsTestRecipe;
  self->_clientDisableAssertionsTestRecipe = v3;

  +[PTDomain registerTestRecipe:self->_clientDisableAssertionsTestRecipe];
  _Block_object_dispose(v9, 8);
}

void __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_2(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"ClientIdleTimerTestRecipe:%ld", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "count") + 1);
  uint64_t v3 = [MEMORY[0x1E4F6F2E8] sharedInstance];
  id v7 = 0;
  id v4 = (void *)[v3 newAssertionToDisableIdleTimerForReason:v2 error:&v7];
  id v5 = v7;

  if (v4)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];
  }
  else
  {
    id v6 = SBLogIdleTimer();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_2_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

void __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_106(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lastObject];
  if (v2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeLastObject];
    [v2 invalidate];
  }
}

void __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_2_107(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6++), "invalidate", (void)v9);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (void)_registerInternalDisableAssertionsTestRecipe
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__63;
  v9[4] = __Block_byref_object_dispose__63;
  id v10 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke;
  v8[3] = &unk_1E6AF56B0;
  v8[4] = v9;
  v6[4] = v9;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke_2;
  v7[3] = &unk_1E6AF56B0;
  v7[4] = v9;
  v5[4] = v9;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke_3;
  v6[3] = &unk_1E6AF56B0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke_4;
  v5[3] = &unk_1E6AF56B0;
  uint64_t v3 = [MEMORY[0x1E4F94128] recipeWithTitle:@"Internal Disable IdleTimer Assertions" prepareBlock:v8 increaseAction:v7 decreaseAction:v6 cleanupBlock:v5];
  internalDisableAssertionsTestRecipe = self->_internalDisableAssertionsTestRecipe;
  self->_internalDisableAssertionsTestRecipe = v3;

  +[PTDomain registerTestRecipe:self->_internalDisableAssertionsTestRecipe];
  _Block_object_dispose(v9, 8);
}

void __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke_2(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  objc_msgSend(NSString, "stringWithFormat:", @"InternalIdleTimerTestRecipe:%ld", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "count") + 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = +[SBIdleTimerGlobalCoordinator sharedInstance];
  uint64_t v3 = [v2 acquireIdleTimerDisableAssertionForReason:v4];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
}

void __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke_3(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lastObject];
  if (v2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeLastObject];
    [v2 invalidate];
  }
}

void __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke_4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6++), "invalidate", (void)v9);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (SBIdleTimerGlobalCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBIdleTimerGlobalCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)_idleTimerDisableAssertions
{
  return self->_idleTimerDisableAssertions;
}

- (void)_setIdleTimerDisableAssertions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerDisableAssertions, 0);
  objc_destroyWeak((id *)&self->_idleTimerProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internalDisableAssertionsTestRecipe, 0);
  objc_storeStrong((id *)&self->_clientDisableAssertionsTestRecipe, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_currentDisablingClientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_idleTimerTelemetryEmitter, 0);
  objc_storeStrong((id *)&self->_lastResetSource, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_disableAutoDimAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_enabledIdleTimerDescriptor, 0);
  objc_storeStrong((id *)&self->_enabledIdleTimerProxy, 0);
  objc_storeStrong((id *)&self->_idleTimerProxy, 0);
  objc_storeStrong((id *)&self->_globalStateMonitor, 0);
  objc_storeStrong((id *)&self->_idleTimerDescriptorFactory, 0);
}

- (void)acquireIdleTimerDisableAssertionForReason:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int v7 = 138543618;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "%{public}@ - Idle timer disable assertion: Requested again for an existing reason without first being invalidated: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_setIdleTimerWithDescriptor:(NSObject *)a3 forReason:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (objc_class *)objc_opt_class();
  int v7 = NSStringFromClass(v6);
  int v8 = 138543618;
  __int16 v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ - ignoring attempted set of same idle timer impl (%{public}@)", (uint8_t *)&v8, 0x16u);
}

void __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)objc_opt_class();
  int v7 = NSStringFromClass(v6);
  int v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
  int v9 = 138543874;
  __int16 v10 = v7;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  __int16 v13 = 2114;
  uint64_t v14 = a2;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "%{public}@ - %{public}@ failed to acquire assertion with error: %{public}@]", (uint8_t *)&v9, 0x20u);
}

@end