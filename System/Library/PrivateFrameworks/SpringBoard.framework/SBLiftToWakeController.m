@interface SBLiftToWakeController
+ (id)sharedController;
- (BOOL)_isObservingWakeGestureManager;
- (BOOL)isEnabled;
- (NSString)description;
- (SBIdleTimerDefaults)_idleTimerDefaults;
- (SBLiftToWakeController)init;
- (SBLiftToWakeController)initWithBacklightController:(id)a3 idleTimerDefaults:(id)a4;
- (id)acquireBumpToWakeEnableAssertionForReason:(id)a3;
- (void)_handleBacklightLevelChanged:(id)a3;
- (void)_ignoredTransition:(int64_t)a3;
- (void)_reconsiderEnablement;
- (void)_screenTurnedOff;
- (void)_screenTurnedOn;
- (void)_sendIgnoredTransitionToObservers:(int64_t)a3;
- (void)_sendTransitionToObservers:(int64_t)a3 deviceOrientation:(int64_t)a4;
- (void)_setIdleTimerDefaults:(id)a3;
- (void)_startObservingBumpsIfNecessary;
- (void)_startObservingIfNecessary;
- (void)_stopObservingBumpsIfNecessary;
- (void)_stopObservingIfNecessary;
- (void)addObserver:(id)a3;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)removeObserver:(id)a3;
- (void)wakeGestureManager:(id)a3 didUpdateWakeGestureEvent:(id)a4;
@end

@implementation SBLiftToWakeController

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_154);
  }
  v2 = (void *)sharedController_sController;
  return v2;
}

void __42__SBLiftToWakeController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(SBLiftToWakeController);
  v1 = (void *)sharedController_sController;
  sharedController_sController = (uint64_t)v0;
}

- (SBLiftToWakeController)init
{
  v3 = +[SBBacklightController sharedInstanceIfExists];
  v4 = +[SBDefaults localDefaults];
  v5 = [v4 idleTimerDefaults];
  v6 = [(SBLiftToWakeController *)self initWithBacklightController:v3 idleTimerDefaults:v5];

  return v6;
}

- (SBLiftToWakeController)initWithBacklightController:(id)a3 idleTimerDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SBLiftToWakeController;
  v8 = [(SBLiftToWakeController *)&v25 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v8 selector:sel__handleBacklightLevelChanged_ name:*MEMORY[0x1E4FA7A18] object:0];

    v10 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
    [v10 addObserver:v8];

    v8->_screenOn = [v6 screenIsOn];
    objc_initWeak(&location, v8);
    objc_storeStrong((id *)&v8->_idleTimerDefaults, a4);
    idleTimerDefaults = v8->_idleTimerDefaults;
    v12 = [NSString stringWithUTF8String:"supportLiftToWake"];
    uint64_t v13 = MEMORY[0x1E4F14428];
    id v14 = MEMORY[0x1E4F14428];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __72__SBLiftToWakeController_initWithBacklightController_idleTimerDefaults___block_invoke;
    v22 = &unk_1E6AF4B10;
    objc_copyWeak(&v23, &location);
    id v15 = (id)[(SBIdleTimerDefaults *)idleTimerDefaults observeDefault:v12 onQueue:v13 withBlock:&v19];

    [(SBLiftToWakeController *)v8 _reconsiderEnablement];
    v16 = objc_alloc_init(SBWakeDebounceFilter);
    bumpToWakeDebounceFilter = v8->_bumpToWakeDebounceFilter;
    v8->_bumpToWakeDebounceFilter = v16;

    [(SBWakeDebounceFilter *)v8->_bumpToWakeDebounceFilter setFilterInterval:300.0];
    [(SBWakeDebounceFilter *)v8->_bumpToWakeDebounceFilter setIntervalActivationLimit:10];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __72__SBLiftToWakeController_initWithBacklightController_idleTimerDefaults___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reconsiderEnablement];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendInt:LODWORD(self->_wakeGestureState) withName:@"wakeGestureState"];
  id v5 = (id)[v3 appendBool:self->_screenOn withName:@"screenOn"];
  id v6 = (id)[v3 appendBool:self->_isEnabled withName:@"enabled"];
  id v7 = (id)[v3 appendBool:self->_observingCMWakeGestureManager withName:@"observingCMWakeGestureManager"];
  id v8 = (id)[v3 appendObject:self->_observers withName:@"observers"];
  v9 = [v3 build];

  return (NSString *)v9;
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    id v5 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    id v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v7];
  if (self->_isEnabled) {
    [(SBLiftToWakeController *)self _startObservingIfNecessary];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  [(NSHashTable *)self->_observers removeObject:v4];

  if (![(NSHashTable *)self->_observers count])
  {
    [(SBLiftToWakeController *)self _stopObservingIfNecessary];
  }
}

- (id)acquireBumpToWakeEnableAssertionForReason:(id)a3
{
  id v4 = a3;
  bumpToWakeAssertions = self->_bumpToWakeAssertions;
  if (!bumpToWakeAssertions)
  {
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4F4F6E8];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __68__SBLiftToWakeController_acquireBumpToWakeEnableAssertionForReason___block_invoke;
    id v14 = &unk_1E6AF92D8;
    objc_copyWeak(&v15, &location);
    id v7 = [v6 assertionWithIdentifier:@"SBLiftToWakeController bump-to-wake" stateDidChangeHandler:&v11];
    id v8 = self->_bumpToWakeAssertions;
    self->_bumpToWakeAssertions = v7;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    bumpToWakeAssertions = self->_bumpToWakeAssertions;
  }
  v9 = -[BSCompoundAssertion acquireForReason:](bumpToWakeAssertions, "acquireForReason:", v4, v11, v12, v13, v14);

  return v9;
}

void __68__SBLiftToWakeController_acquireBumpToWakeEnableAssertionForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reconsiderEnablement];
}

- (void)_ignoredTransition:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogLiftToWake();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 3) {
      id v6 = @"<unknown>";
    }
    else {
      id v6 = off_1E6B01850[a3 - 1];
    }
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBLiftToWakeController: intentionally ignored transition: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [(SBLiftToWakeController *)self _sendIgnoredTransitionToObservers:a3];
}

- (void)_screenTurnedOff
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "SBLiftToWakeController: screen turned off", v1, 2u);
}

- (void)_screenTurnedOn
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "SBLiftToWakeController: screen turned on", v1, 2u);
}

- (BOOL)_isObservingWakeGestureManager
{
  return self->_observingCMWakeGestureManager;
}

- (void)_reconsiderEnablement
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  int v3 = [MEMORY[0x1E4F222C8] isWakeGestureAvailable];
  if (v3)
  {
    if ([(SBIdleTimerDefaults *)self->_idleTimerDefaults supportLiftToWake]) {
      int v3 = 1;
    }
    else {
      int v3 = [(BSCompoundAssertion *)self->_bumpToWakeAssertions isActive];
    }
  }
  if (self->_isEnabled == v3)
  {
    if ([(BSCompoundAssertion *)self->_bumpToWakeAssertions isActive])
    {
      [(SBLiftToWakeController *)self _startObservingBumpsIfNecessary];
    }
    else
    {
      [(SBLiftToWakeController *)self _stopObservingBumpsIfNecessary];
    }
  }
  else
  {
    self->_isEnabled = v3;
    id v4 = SBLogLiftToWake();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSStringFromBOOL();
      [MEMORY[0x1E4F222C8] isWakeGestureAvailable];
      id v6 = NSStringFromBOOL();
      [(SBIdleTimerDefaults *)self->_idleTimerDefaults supportLiftToWake];
      int v7 = NSStringFromBOOL();
      int v8 = [(BSCompoundAssertion *)self->_bumpToWakeAssertions isActive];
      *(_DWORD *)buf = 138544130;
      v21 = v5;
      __int16 v22 = 2114;
      id v23 = v6;
      __int16 v24 = 2114;
      objc_super v25 = v7;
      __int16 v26 = 1024;
      int v27 = v8;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Lift to wake enablement changed to: %{public}@ (Available: %{public}@, UserPref: %{public}@, Bump: %{BOOL}u)", buf, 0x26u);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v14 liftToWakeControllerEnablementDidChange:self];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    if (self->_isEnabled)
    {
      if ([(NSHashTable *)self->_observers count]) {
        [(SBLiftToWakeController *)self _startObservingIfNecessary];
      }
    }
    else
    {
      [(SBLiftToWakeController *)self _stopObservingIfNecessary];
    }
  }
}

- (void)_handleBacklightLevelChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4FA7A28]];
  [v6 floatValue];
  float v8 = v7;

  uint64_t v9 = [v5 objectForKey:*MEMORY[0x1E4FA7A20]];
  [v9 floatValue];
  float v11 = v10;

  uint64_t v12 = [v5 objectForKey:*MEMORY[0x1E4FA7A08]];
  int v13 = [v12 intValue];

  id v14 = SBLogLiftToWake();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[SBLiftToWakeController _handleBacklightLevelChanged:]((uint64_t)v4, v14);
  }

  BOOL v15 = v11 > 0.0 && v8 <= 0.0;
  if (v13 != 13)
  {
    if (v8 <= 0.0 || v11 > 0.0)
    {
      if (v15) {
        [(SBLiftToWakeController *)self _screenTurnedOn];
      }
    }
    else
    {
      [(SBLiftToWakeController *)self _screenTurnedOff];
    }
  }
}

- (void)_startObservingIfNecessary
{
  if (!self->_observingCMWakeGestureManager && self->_isEnabled && [(NSHashTable *)self->_observers count])
  {
    self->_wakeGestureState = 0;
    int v3 = SBLogLiftToWake();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Starting to observe the CMWakeGestureManager.", v6, 2u);
    }

    self->_observingCMWakeGestureManager = 1;
    id v4 = [MEMORY[0x1E4F222C8] sharedManager];
    wakeGestureManager = self->_wakeGestureManager;
    self->_wakeGestureManager = v4;

    [(CMWakeGestureManager *)self->_wakeGestureManager setDelegate:self];
    [(CMWakeGestureManager *)self->_wakeGestureManager startWakeGestureUpdates];
  }
  [(SBLiftToWakeController *)self _startObservingBumpsIfNecessary];
}

- (void)_stopObservingIfNecessary
{
  [(SBLiftToWakeController *)self _stopObservingBumpsIfNecessary];
  if (self->_observingCMWakeGestureManager)
  {
    self->_observingCMWakeGestureManager = 0;
    [(CMWakeGestureManager *)self->_wakeGestureManager stopWakeGestureUpdates];
    wakeGestureManager = self->_wakeGestureManager;
    self->_wakeGestureManager = 0;

    id v4 = SBLogLiftToWake();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Stopped observing the CMWakeGestureManager.", v5, 2u);
    }
  }
}

- (void)_startObservingBumpsIfNecessary
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_observingCMWakeGestureManager)
  {
    uint64_t v3 = [(BSCompoundAssertion *)self->_bumpToWakeAssertions isActive];
    id v4 = SBLogLiftToWake();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Setting nightStandWakeEnabled to %{BOOL}u.", (uint8_t *)v5, 8u);
    }

    [(CMWakeGestureManager *)self->_wakeGestureManager setNightStandWakeEnabled:v3 withConfiguration:2];
  }
}

- (void)_stopObservingBumpsIfNecessary
{
  uint64_t v3 = SBLogLiftToWake();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Setting nightStandWakeEnabled to NO", v4, 2u);
  }

  [(CMWakeGestureManager *)self->_wakeGestureManager setNightStandWakeEnabled:0 withConfiguration:2];
}

- (void)_sendTransitionToObservers:(int64_t)a3 deviceOrientation:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  float v7 = SBLogLiftToWake();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 3) {
      float v8 = @"<unknown>";
    }
    else {
      float v8 = off_1E6B01850[a3 - 1];
    }
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "SBLiftToWakeController: sending to observers: %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = (void *)[(NSHashTable *)self->_observers copy];
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
        id v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 liftToWakeController:self didObserveTransition:a3 deviceOrientation:a4];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)_sendIgnoredTransitionToObservers:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  id v5 = SBLogLiftToWake();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 3) {
      uint64_t v6 = @"<unknown>";
    }
    else {
      uint64_t v6 = off_1E6B01850[a3 - 1];
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBLiftToWakeController: sending ignored transition to observers: %@", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  float v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          [v12 liftToWakeController:self didIgnoreTransition:a3];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  if ((unint64_t)a4 > 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_1D8FD16A0[a4];
  }
  [(CMWakeGestureManager *)self->_wakeGestureManager setBacklightState:v5];
}

- (void)wakeGestureManager:(id)a3 didUpdateWakeGestureEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = wakeGestureManager_didUpdateWakeGestureEvent__secondsToTicksScaleFactor;
  if (*(double *)&wakeGestureManager_didUpdateWakeGestureEvent__secondsToTicksScaleFactor == 0.0)
  {
    mach_timebase_info info = 0;
    if (!mach_timebase_info(&info))
    {
      LODWORD(v9) = info.numer;
      LODWORD(v8) = info.denom;
      *(double *)&unint64_t v8 = (double)v8 / (double)v9 * 1000000000.0;
      wakeGestureManager_didUpdateWakeGestureEvent__secondsToTicksScaleFactor = v8;
    }
  }
  int v10 = objc_msgSend(v7, "orientation", *(double *)&v8);
  uint64_t v11 = [v7 state];
  [v7 timestamp];
  if (v11 == 1)
  {
    unint64_t v13 = (unint64_t)(v12 * *(double *)&wakeGestureManager_didUpdateWakeGestureEvent__secondsToTicksScaleFactor);
    long long v14 = [MEMORY[0x1E4FA60D0] sharedInstance];
    [v14 wakeMayBegin:2 withTimestamp:v13];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SBLiftToWakeController_wakeGestureManager_didUpdateWakeGestureEvent___block_invoke;
  block[3] = &unk_1E6B01830;
  int v19 = v10;
  id v17 = v7;
  uint64_t v18 = v11;
  block[4] = self;
  id v15 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __71__SBLiftToWakeController_wakeGestureManager_didUpdateWakeGestureEvent___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  uint64_t v3 = SBLogLiftToWake();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = BSDeviceOrientationDescription();
    int v20 = 67109378;
    int v21 = v4;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "SBLiftToWakeController: updated wake gesture state received:%d %@", (uint8_t *)&v20, 0x12u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 16);
  *(void *)(v6 + 16) = *(void *)(a1 + 48);
  uint64_t v8 = [*(id *)(a1 + 40) type];
  uint64_t v9 = *(void *)(a1 + 32);
  if (v8 == 7)
  {
    if ([*(id *)(v9 + 48) isActive])
    {
      uint64_t v10 = *(void *)(a1 + 32);
      if (*(void *)(a1 + 48) != 1)
      {
LABEL_23:
        uint64_t v17 = 4;
LABEL_29:
        [(id)v10 _ignoredTransition:v17];
        return;
      }
      if ([*(id *)(v10 + 56) wakeEventOccurred])
      {
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = 4;
LABEL_13:
        [(id)v10 _sendTransitionToObservers:v11 deviceOrientation:v2];
        return;
      }
      long long v16 = SBLogLiftToWake();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "debounce filter rejected bump event", (uint8_t *)&v20, 2u);
      }
    }
    uint64_t v10 = *(void *)(a1 + 32);
    goto LABEL_23;
  }
  if (![*(id *)(v9 + 32) supportLiftToWake]) {
    goto LABEL_27;
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if ((unint64_t)(v12 - 2) < 2)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if ((v7 & 0xFFFFFFFFFFFFFFFELL) != 2 && *(unsigned char *)(v10 + 40))
    {
      uint64_t v11 = 3;
      goto LABEL_13;
    }
    goto LABEL_28;
  }
  if (v12 != 1)
  {
    uint64_t v18 = SBLogLiftToWake();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 48);
      int v20 = 67109120;
      int v21 = v19;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "SBLiftToWakeController: wake gesture state not handled -- were we supposed to receive %d ?", (uint8_t *)&v20, 8u);
    }

LABEL_27:
    uint64_t v10 = *(void *)(a1 + 32);
LABEL_28:
    uint64_t v17 = 0;
    goto LABEL_29;
  }
  unint64_t v13 = *(unsigned char **)(a1 + 32);
  if (v13[40]) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  [v13 _sendTransitionToObservers:v14 deviceOrientation:v2];
  id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 postNotificationName:*MEMORY[0x1E4FA7A68] object:*(void *)(a1 + 32)];
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (SBIdleTimerDefaults)_idleTimerDefaults
{
  return self->_idleTimerDefaults;
}

- (void)_setIdleTimerDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bumpToWakeDebounceFilter, 0);
  objc_storeStrong((id *)&self->_bumpToWakeAssertions, 0);
  objc_storeStrong((id *)&self->_idleTimerDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_wakeGestureManager, 0);
}

- (void)_handleBacklightLevelChanged:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "SBLiftToWakeController: backlight changed: %@", (uint8_t *)&v2, 0xCu);
}

@end