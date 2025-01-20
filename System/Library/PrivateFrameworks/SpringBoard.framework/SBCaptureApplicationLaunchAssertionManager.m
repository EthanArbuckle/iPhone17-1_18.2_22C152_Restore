@interface SBCaptureApplicationLaunchAssertionManager
+ (SBCaptureApplicationLaunchAssertionManager)sharedInstance;
- (NSHashTable)observers;
- (NSMutableDictionary)assertionTimersByBundleIdentifier;
- (NSMutableDictionary)launchAssertionsPerBundleIdentifier;
- (NSString)debugDescription;
- (SBCaptureApplicationLaunchAssertionManager)init;
- (id)acquireCaptureApplicationLaunchAssertionForBundleIdentifier:(id)a3 reason:(id)a4;
- (id)assertionForBundleIdentifier:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_clearAssertionTimerForBundleIdentifier:(id)a3;
- (void)_notifyObserversAssertionDidUpdateForBundleIdentifier:(id)a3;
- (void)_queue_addObserver:(id)a3;
- (void)_queue_removeObserver:(id)a3;
- (void)_startAssertionTimerForBundleIdentifier:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation SBCaptureApplicationLaunchAssertionManager

+ (SBCaptureApplicationLaunchAssertionManager)sharedInstance
{
  if (sharedInstance_onceToken_46 != -1) {
    dispatch_once(&sharedInstance_onceToken_46, &__block_literal_global_330);
  }
  v2 = (void *)sharedInstance___sharedInstance_24;
  return (SBCaptureApplicationLaunchAssertionManager *)v2;
}

void __60__SBCaptureApplicationLaunchAssertionManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedInstance_24;
  sharedInstance___sharedInstance_24 = v0;
}

- (SBCaptureApplicationLaunchAssertionManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBCaptureApplicationLaunchAssertionManager;
  v2 = [(SBCaptureApplicationLaunchAssertionManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    launchAssertionsPerBundleIdentifier = v2->_launchAssertionsPerBundleIdentifier;
    v2->_launchAssertionsPerBundleIdentifier = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    assertionTimersByBundleIdentifier = v2->_assertionTimersByBundleIdentifier;
    v2->_assertionTimersByBundleIdentifier = (NSMutableDictionary *)v5;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)Serial;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_assertionTimersByBundleIdentifier allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_assertionTimersByBundleIdentifier removeAllObjects];
  observerQueue = self->_observerQueue;
  self->_observerQueue = 0;

  v9.receiver = self;
  v9.super_class = (Class)SBCaptureApplicationLaunchAssertionManager;
  [(SBCaptureApplicationLaunchAssertionManager *)&v9 dealloc];
}

- (id)acquireCaptureApplicationLaunchAssertionForBundleIdentifier:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [MEMORY[0x1E4F29128] UUID];
  objc_super v9 = [SBCaptureApplicationLaunchAssertion alloc];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __113__SBCaptureApplicationLaunchAssertionManager_acquireCaptureApplicationLaunchAssertionForBundleIdentifier_reason___block_invoke;
  v16 = &unk_1E6B0A728;
  objc_copyWeak(&v17, &location);
  long long v10 = [(SBCaptureApplicationLaunchAssertion *)v9 initWithIdentifier:v8 bundleIdentifier:v6 reason:v7 invalidationHandler:&v13];
  long long v11 = [(SBCaptureApplicationLaunchAssertionManager *)self launchAssertionsPerBundleIdentifier];
  [v11 setObject:v10 forKey:v6];

  [(SBCaptureApplicationLaunchAssertionManager *)self _notifyObserversAssertionDidUpdateForBundleIdentifier:v6];
  [(SBCaptureApplicationLaunchAssertionManager *)self _startAssertionTimerForBundleIdentifier:v6];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
  return v10;
}

void __113__SBCaptureApplicationLaunchAssertionManager_acquireCaptureApplicationLaunchAssertionForBundleIdentifier_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = [v3 bundleIdentifier];
    id v6 = SBLogCaptureApplication();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      objc_super v9 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Capture application launch assertion for %@ is invalidated", (uint8_t *)&v8, 0xCu);
    }

    id v7 = [WeakRetained launchAssertionsPerBundleIdentifier];
    [v7 removeObjectForKey:v5];

    [WeakRetained _notifyObserversAssertionDidUpdateForBundleIdentifier:v5];
    [WeakRetained _clearAssertionTimerForBundleIdentifier:v5];
  }
}

- (id)assertionForBundleIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_launchAssertionsPerBundleIdentifier objectForKey:a3];
}

- (NSString)debugDescription
{
  return (NSString *)[(SBCaptureApplicationLaunchAssertionManager *)self descriptionWithMultilinePrefix:0];
}

- (void)_startAssertionTimerForBundleIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogCaptureApplication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling an assertion lifecycle timer for capture application launch (%@)", buf, 0xCu);
  }

  [(SBCaptureApplicationLaunchAssertionManager *)self _clearAssertionTimerForBundleIdentifier:v4];
  objc_initWeak((id *)buf, self);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:v4];
  [(NSMutableDictionary *)self->_assertionTimersByBundleIdentifier setObject:v6 forKey:v4];
  id v7 = +[SBCaptureApplicationCenter captureApplicationSettings];
  [v7 launchAssertionTimeOutDurationInSeconds];
  double v9 = v8;
  id v10 = MEMORY[0x1E4F14428];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__SBCaptureApplicationLaunchAssertionManager__startAssertionTimerForBundleIdentifier___block_invoke;
  v11[3] = &unk_1E6AF5838;
  objc_copyWeak(&v12, (id *)buf);
  [v6 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v11 queue:v9 handler:0.05];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __86__SBCaptureApplicationLaunchAssertionManager__startAssertionTimerForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = SBLogCaptureApplication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v3 identifier];
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Launch assertion timed out for capture application launch (%@), invalidating assertion", (uint8_t *)&v11, 0xCu);
  }
  id v7 = [v3 identifier];
  double v8 = [WeakRetained assertionForBundleIdentifier:v7];
  double v9 = v8;
  if (v8)
  {
    [v8 invalidate];
  }
  else
  {
    id v10 = SBLogCaptureApplication();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __86__SBCaptureApplicationLaunchAssertionManager__startAssertionTimerForBundleIdentifier___block_invoke_cold_1((uint64_t)v7, v10);
    }
  }
}

- (void)_clearAssertionTimerForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_assertionTimersByBundleIdentifier objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 invalidate];
    [(NSMutableDictionary *)self->_assertionTimersByBundleIdentifier removeObjectForKey:v4];
  }
  else
  {
    id v7 = SBLogCaptureApplication();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBCaptureApplicationLaunchAssertionManager _clearAssertionTimerForBundleIdentifier:]((uint64_t)v4, v7);
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SBCaptureApplicationLaunchAssertionManager_addObserver___block_invoke;
  block[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__SBCaptureApplicationLaunchAssertionManager_addObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_addObserver:", *(void *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SBCaptureApplicationLaunchAssertionManager_removeObserver___block_invoke;
  block[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__SBCaptureApplicationLaunchAssertionManager_removeObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_removeObserver:", *(void *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)_queue_addObserver:(id)a3
{
  id v8 = a3;
  BSDispatchQueueAssert();
  id v4 = v8;
  if (v8)
  {
    observers = self->_observers;
    if (!observers)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)_queue_removeObserver:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssert();
  id v4 = v7;
  if (v7)
  {
    NSUInteger v5 = [(NSHashTable *)self->_observers count];
    id v4 = v7;
    if (v5)
    {
      BOOL v6 = [(NSHashTable *)self->_observers containsObject:v7];
      id v4 = v7;
      if (v6)
      {
        [(NSHashTable *)self->_observers removeObject:v7];
        id v4 = v7;
      }
    }
  }
}

- (void)_notifyObserversAssertionDidUpdateForBundleIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  NSUInteger v5 = (void *)[(NSHashTable *)self->_observers copy];
  BOOL v6 = [v5 allObjects];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 captureApplicationLaunchAssertionManager:self didUpdateAssertionForBundleIdentifier:v4];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBCaptureApplicationLaunchAssertionManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  BOOL v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__SBCaptureApplicationLaunchAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  id v7 = v6;
  id v11 = v7;
  long long v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

void __84__SBCaptureApplicationLaunchAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) launchAssertionsPerBundleIdentifier];
  id v2 = (id)[v1 appendObject:v3 withName:@"launchAssertionsPerBundleIdentifier"];
}

- (id)succinctDescription
{
  id v2 = [(SBCaptureApplicationLaunchAssertionManager *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (NSMutableDictionary)launchAssertionsPerBundleIdentifier
{
  return self->_launchAssertionsPerBundleIdentifier;
}

- (NSMutableDictionary)assertionTimersByBundleIdentifier
{
  return self->_assertionTimersByBundleIdentifier;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_assertionTimersByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_launchAssertionsPerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
}

void __86__SBCaptureApplicationLaunchAssertionManager__startAssertionTimerForBundleIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Launch assertion for %@ can't be found to invalidate", (uint8_t *)&v2, 0xCu);
}

- (void)_clearAssertionTimerForBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Can't clear the launch assertion timer for %@, no timer found", (uint8_t *)&v2, 0xCu);
}

@end