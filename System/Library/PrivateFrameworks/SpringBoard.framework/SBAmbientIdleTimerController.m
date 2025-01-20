@interface SBAmbientIdleTimerController
- (BOOL)_isIdleTimerAllowedForAssertions;
- (BOOL)_isIdleTimerAllowedForAssertionsForSleepFocus;
- (BOOL)_isIdleTimerAllowedForSuppression;
- (BOOL)isAmbientSuppressed;
- (BOOL)isUserSleepPredicted;
- (BOOL)suppressForSleep;
- (SBAmbientIdleTimerController)initWithWindowScene:(id)a3;
- (SBWindowScene)_windowScene;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (unint64_t)_sourcesForMonitoredEvents;
- (void)_notifyObserversIdleTimerBehaviorDidChange;
- (void)_notifyObserversSuppressionDidEnd;
- (void)_notifyObserversUserSleepPredictedDidChange;
- (void)_setActiveSuppressionReasons:(unint64_t)a3;
- (void)_setAmbientSuppressed:(BOOL)a3;
- (void)_setIdleTimerAllowedForAssertions:(BOOL)a3;
- (void)_setIdleTimerAllowedForAssertions:(BOOL)a3 forSleepFocus:(BOOL)a4;
- (void)_setIdleTimerAllowedForAssertionsForSleepFocus:(BOOL)a3;
- (void)_setIdleTimerAllowedForSuppression:(BOOL)a3;
- (void)_setSuppressionEnabled:(BOOL)a3;
- (void)_setUserSleepPredicted:(BOOL)a3;
- (void)_setWindowScene:(id)a3;
- (void)_updateAmbientSuppressed;
- (void)_updateSuppressionManager;
- (void)_updateUserSleepPredicted;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setSuppressForSleep:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation SBAmbientIdleTimerController

- (SBAmbientIdleTimerController)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBAmbientIdleTimerController;
  v5 = [(SBAmbientIdleTimerController *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    uint64_t v9 = +[SBAmbientDomain rootSettings];
    ambientSettings = v6->_ambientSettings;
    v6->_ambientSettings = (SBAmbientSettings *)v9;

    v11 = (void *)_allAmbientIdleTimerControllers;
    if (!_allAmbientIdleTimerControllers)
    {
      uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v13 = (void *)_allAmbientIdleTimerControllers;
      _allAmbientIdleTimerControllers = v12;

      v14 = [(id)SBApp blshService];
      v15 = [v14 localAssertionService];

      id v16 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:v15];
      v11 = (void *)_allAmbientIdleTimerControllers;
    }
    [v11 addObject:v6];
    v6->_suppressForSleep = 0;
    v6->_monitoredSuppressionReasons = 2;
    v6->_suppressionEnabled = [(SBAmbientSettings *)v6->_ambientSettings enableSuppression];
    [(SBAmbientIdleTimerController *)v6 _updateSuppressionManager];
  }

  return v6;
}

- (void)dealloc
{
  [(id)_allAmbientIdleTimerControllers removeObject:self];
  v3.receiver = self;
  v3.super_class = (Class)SBAmbientIdleTimerController;
  [(SBAmbientIdleTimerController *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)setSuppressForSleep:(BOOL)a3
{
  if (self->_suppressForSleep != a3)
  {
    self->_suppressForSleep = a3;
    [(SBAmbientIdleTimerController *)self _updateSuppressionManager];
    [(SBAmbientIdleTimerController *)self _updateAmbientSuppressed];
  }
}

- (int64_t)idleTimerMode
{
  if ([(SBAmbientIdleTimerController *)self idleTimerDuration] == 14) {
    return 3;
  }
  else {
    return 1;
  }
}

- (int64_t)idleTimerDuration
{
  BOOL v3 = [(SBAmbientIdleTimerController *)self isAmbientSuppressed];
  ambientSettings = self->_ambientSettings;
  if (v3) {
    uint64_t v5 = [(SBAmbientSettings *)ambientSettings suppressedIdleTimerDuration];
  }
  else {
    uint64_t v5 = [(SBAmbientSettings *)ambientSettings idleTimerDuration];
  }
  int64_t v6 = v5;
  if (([MEMORY[0x1E4F42738] isRunningInStoreDemoMode] & (v5 != 14)) != 0) {
    return 8;
  }
  else {
    return v6;
  }
}

- (int64_t)idleWarnMode
{
  BOOL v3 = [(SBAmbientIdleTimerController *)self isAmbientSuppressed];
  ambientSettings = self->_ambientSettings;
  if (v3)
  {
    return [(SBAmbientSettings *)ambientSettings suppressedIdleTimerWarnMode];
  }
  else
  {
    return [(SBAmbientSettings *)ambientSettings idleTimerWarnMode];
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_ambientSettings == a3)
  {
    id v5 = a4;
    [(SBAmbientIdleTimerController *)self _notifyObserversIdleTimerBehaviorDidChange];
    int v6 = [v5 isEqualToString:@"enableSuppression"];

    if (v6)
    {
      BOOL v7 = [(SBAmbientSettings *)self->_ambientSettings enableSuppression];
      [(SBAmbientIdleTimerController *)self _setSuppressionEnabled:v7];
    }
  }
}

- (void)_setSuppressionEnabled:(BOOL)a3
{
  if (a3) {
    int v4 = [MEMORY[0x1E4F22298] isAvailable];
  }
  else {
    int v4 = 0;
  }
  if (self->_suppressionEnabled != v4)
  {
    self->_suppressionEnabled = v4;
    [(SBAmbientIdleTimerController *)self _updateSuppressionManager];
    [(SBAmbientIdleTimerController *)self _updateUserSleepPredicted];
  }
}

- (void)_updateSuppressionManager
{
  if (self->_suppressionEnabled && !self->_suppressionManager)
  {
    BOOL v3 = (CMSuppressionManager *)[objc_alloc(MEMORY[0x1E4F22298]) initWithClientType:2];
    suppressionManager = self->_suppressionManager;
    self->_suppressionManager = v3;
  }
  if (self->_suppressionManager)
  {
    if (self->_suppressForSleep)
    {
      if (!self->_suppressionServiceStarted)
      {
        objc_initWeak(location, self);
        id v5 = SBLogAmbientIdleTimer();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Starting suppression monitoring", buf, 2u);
        }

        unint64_t v6 = [(SBAmbientIdleTimerController *)self _sourcesForMonitoredEvents];
        [(CMSuppressionManager *)self->_suppressionManager startService];
        BOOL v7 = self->_suppressionManager;
        v8 = [MEMORY[0x1E4F28F08] mainQueue];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __57__SBAmbientIdleTimerController__updateSuppressionManager__block_invoke;
        v11[3] = &unk_1E6B0BA40;
        objc_copyWeak(&v12, location);
        [(CMSuppressionManager *)v7 startSuppressionUpdatesToQueue:v8 withOptions:v6 withHandler:v11];

        self->_suppressionServiceStarted = 1;
        objc_destroyWeak(&v12);
        objc_destroyWeak(location);
      }
    }
    else if (self->_suppressionServiceStarted)
    {
      uint64_t v9 = SBLogAmbientIdleTimer();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Stopping suppression monitoring", (uint8_t *)location, 2u);
      }

      [(SBAmbientIdleTimerController *)self _setActiveSuppressionReasons:0];
      [(CMSuppressionManager *)self->_suppressionManager stopSuppressionUpdates];
      [(CMSuppressionManager *)self->_suppressionManager stopService];
      self->_suppressionServiceStarted = 0;
    }
  }
  if (!self->_suppressionEnabled)
  {
    if (self->_suppressionManager)
    {
      [(SBAmbientIdleTimerController *)self _setActiveSuppressionReasons:0];
      [(CMSuppressionManager *)self->_suppressionManager stopSuppressionUpdates];
      [(CMSuppressionManager *)self->_suppressionManager stopService];
      v10 = self->_suppressionManager;
      self->_suppressionManager = 0;

      self->_suppressionServiceStarted = 0;
    }
  }
}

void __57__SBAmbientIdleTimerController__updateSuppressionManager__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (!v5 || v6)
  {
    v13 = SBLogAmbientIdleTimer();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __57__SBAmbientIdleTimerController__updateSuppressionManager__block_invoke_cold_1((uint64_t)v5, v6, v13);
    }
  }
  else if (WeakRetained)
  {
    uint64_t v9 = SBLogAmbientIdleTimer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Received suppression event %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v10 = [v5 type];
    if (v10 == 2)
    {
      id v12 = v8;
      uint64_t v11 = 0;
      goto LABEL_13;
    }
    if (v10 == 1)
    {
      uint64_t v11 = [v5 reason];
      id v12 = v8;
LABEL_13:
      [v12 _setActiveSuppressionReasons:v11];
    }
  }
}

- (void)_notifyObserversIdleTimerBehaviorDidChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 ambientIdleTimerController:self didChangeIdleTimerBehavior:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversSuppressionDidEnd
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 ambientIdleTimerControllerSuppressionDidEnd:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversUserSleepPredictedDidChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 ambientIdleTimerController:self didUpdateUserSleepPredicted:self->_userSleepPredicted];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_setAmbientSuppressed:(BOOL)a3
{
  if (self->_ambientSuppressed != a3)
  {
    self->_ambientSuppressed = a3;
    [(SBAmbientIdleTimerController *)self _notifyObserversIdleTimerBehaviorDidChange];
  }
}

- (void)_updateAmbientSuppressed
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBAmbientIdleTimerController *)self isAmbientSuppressed];
  BOOL v4 = self->_idleTimerAllowedForAssertions
    || self->_idleTimerAllowedForAssertionsForSleepFocus && self->_suppressForSleep
    || self->_idleTimerAllowedForSuppression;
  [(SBAmbientIdleTimerController *)self _setAmbientSuppressed:v4];
  uint64_t v5 = SBLogAmbientIdleTimer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL idleTimerAllowedForAssertions = self->_idleTimerAllowedForAssertions;
    BOOL idleTimerAllowedForAssertionsForSleepFocus = self->_idleTimerAllowedForAssertionsForSleepFocus;
    BOOL suppressForSleep = self->_suppressForSleep;
    BOOL idleTimerAllowedForSuppression = self->_idleTimerAllowedForSuppression;
    v12[0] = 67110400;
    v12[1] = v3;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    __int16 v15 = 1024;
    BOOL v16 = idleTimerAllowedForAssertions;
    __int16 v17 = 1024;
    BOOL v18 = idleTimerAllowedForAssertionsForSleepFocus;
    __int16 v19 = 1024;
    BOOL v20 = suppressForSleep;
    __int16 v21 = 1024;
    BOOL v22 = idleTimerAllowedForSuppression;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Ambient supression state updated. wasAmbientSuppressed = %{BOOL}u  isAmbientSuppressed = %{BOOL}u  [ _BOOL idleTimerAllowedForAssertions = %{BOOL}u _idleTimerAllowedForAssertionsForSleepFocus = %{BOOL}u _suppressForSleep = %{BOOL}u _idleTimerAllowedForSuppression = %{BOOL}u ]", (uint8_t *)v12, 0x26u);
  }

  if (v3 || !v4)
  {
    if (!v4 && v3)
    {
      long long v10 = SBLogAmbientIdleTimer();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12[0]) = 0;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Suppression ended", (uint8_t *)v12, 2u);
      }

      [(SBAmbientIdleTimerController *)self _notifyObserversSuppressionDidEnd];
    }
  }
  else
  {
    long long v11 = SBLogAmbientIdleTimer();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Suppression began", (uint8_t *)v12, 2u);
    }
  }
}

- (void)_setIdleTimerAllowedForAssertions:(BOOL)a3
{
  if (self->_idleTimerAllowedForAssertions != a3)
  {
    self->_BOOL idleTimerAllowedForAssertions = a3;
    [(SBAmbientIdleTimerController *)self _updateAmbientSuppressed];
  }
}

- (void)_setIdleTimerAllowedForAssertionsForSleepFocus:(BOOL)a3
{
  if (self->_idleTimerAllowedForAssertionsForSleepFocus != a3)
  {
    self->_BOOL idleTimerAllowedForAssertionsForSleepFocus = a3;
    [(SBAmbientIdleTimerController *)self _updateAmbientSuppressed];
  }
}

- (void)_setIdleTimerAllowedForAssertions:(BOOL)a3 forSleepFocus:(BOOL)a4
{
  if (a4) {
    [(SBAmbientIdleTimerController *)self _setIdleTimerAllowedForAssertionsForSleepFocus:a3];
  }
  else {
    [(SBAmbientIdleTimerController *)self _setIdleTimerAllowedForAssertions:a3];
  }
}

- (void)_setIdleTimerAllowedForSuppression:(BOOL)a3
{
  if (self->_idleTimerAllowedForSuppression != a3)
  {
    self->_BOOL idleTimerAllowedForSuppression = a3;
    [(SBAmbientIdleTimerController *)self _updateAmbientSuppressed];
    [(SBAmbientIdleTimerController *)self _updateUserSleepPredicted];
  }
}

- (void)_setActiveSuppressionReasons:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogAmbientIdleTimer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Active suppression reasons: 0x%lx", (uint8_t *)&v6, 0xCu);
  }

  [(SBAmbientIdleTimerController *)self _setIdleTimerAllowedForSuppression:(self->_monitoredSuppressionReasons & a3) != 0];
}

- (void)_updateUserSleepPredicted
{
  BOOL v2 = self->_suppressionEnabled && self->_idleTimerAllowedForSuppression;
  [(SBAmbientIdleTimerController *)self _setUserSleepPredicted:v2];
}

- (void)_setUserSleepPredicted:(BOOL)a3
{
  if (self->_userSleepPredicted != a3)
  {
    self->_userSleepPredicted = a3;
    [(SBAmbientIdleTimerController *)self _notifyObserversUserSleepPredictedDidChange];
  }
}

- (unint64_t)_sourcesForMonitoredEvents
{
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  unint64_t monitoredSuppressionReasons = self->_monitoredSuppressionReasons;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  long long v10 = __58__SBAmbientIdleTimerController__sourcesForMonitoredEvents__block_invoke;
  long long v11 = &unk_1E6AFCE00;
  long long v12 = &v13;
  BOOL v3 = v9;
  if (monitoredSuppressionReasons)
  {
    char v17 = 0;
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)monitoredSuppressionReasons);
    v4.i16[0] = vaddlv_u8(v4);
    int v5 = v4.i32[0];
    if (v4.i32[0])
    {
      unint64_t v6 = 0;
      do
      {
        if (((1 << v6) & monitoredSuppressionReasons) != 0)
        {
          ((void (*)(void *))v10)(v3);
          if (v17) {
            break;
          }
          --v5;
        }
        if (v6 > 0x3E) {
          break;
        }
        ++v6;
      }
      while (v5 > 0);
    }
  }

  unint64_t v7 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __58__SBAmbientIdleTimerController__sourcesForMonitoredEvents__block_invoke(uint64_t result, unint64_t a2)
{
  if (a2 <= 4 && ((1 << a2) & 0x16) != 0) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) |= a2;
  }
  return result;
}

- (BOOL)suppressForSleep
{
  return self->_suppressForSleep;
}

- (BOOL)isUserSleepPredicted
{
  return self->_userSleepPredicted;
}

- (BOOL)isAmbientSuppressed
{
  return self->_ambientSuppressed;
}

- (BOOL)_isIdleTimerAllowedForAssertions
{
  return self->_idleTimerAllowedForAssertions;
}

- (BOOL)_isIdleTimerAllowedForAssertionsForSleepFocus
{
  return self->_idleTimerAllowedForAssertionsForSleepFocus;
}

- (BOOL)_isIdleTimerAllowedForSuppression
{
  return self->_idleTimerAllowedForSuppression;
}

- (SBWindowScene)_windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)_setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_ambientSettings, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __57__SBAmbientIdleTimerController__updateSuppressionManager__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = [a2 localizedDescription];
  unint64_t v7 = [a2 localizedFailureReason];
  int v8 = 138543874;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  long long v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  _os_log_fault_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_FAULT, "Suppression event error - event:%{public}@ error:%{public}@ reason:%{public}@", (uint8_t *)&v8, 0x20u);
}

@end