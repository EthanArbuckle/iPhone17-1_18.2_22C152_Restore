@interface HDSHAccessibilityAssertionManager
- (BOOL)shouldBeObservingContentProtectionState;
- (HDAssertion)accessibilityAssertion;
- (HDSHAccessibilityAssertionManager)initWithProfile:(id)a3;
- (void)_queue_takeAccessibilityAssertion;
- (void)_restoreContentProtectionObservingState;
- (void)beginObservingContentProtectionState;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)dealloc;
- (void)invalidateAccessibilityAssertion;
- (void)profileDidBecomeReady:(id)a3;
- (void)setShouldBeObservingContentProtectionState:(BOOL)a3;
- (void)stopObservingContentProtectionState;
@end

@implementation HDSHAccessibilityAssertionManager

- (HDSHAccessibilityAssertionManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDSHAccessibilityAssertionManager;
  v5 = [(HDSHAccessibilityAssertionManager *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    [WeakRetained registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)uint64_t v7 = 138543362;
    *(void *)&v7[4] = objc_opt_class();
    id v6 = *(id *)&v7[4];
    _os_log_impl(&dword_226DD9000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] profileDidBecomeReady", v7, 0xCu);
  }
  [(HDSHAccessibilityAssertionManager *)self _restoreContentProtectionObservingState];
}

- (BOOL)shouldBeObservingContentProtectionState
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F43218]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = (void *)[v3 initWithCategory:0 domainName:@"SleepTracking" profile:WeakRetained];

  id v15 = 0;
  id v6 = [v5 dateForKey:@"SleepTrackingSessionStartDate" error:&v15];
  id v7 = v15;
  if (v7)
  {
    _HKInitializeLogging();
    uint64_t v8 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_ERROR))
    {
      objc_super v11 = v8;
      v12 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      __int16 v18 = 2114;
      id v19 = v7;
      id v13 = v12;
      _os_log_error_impl(&dword_226DD9000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] failed to read observing protection state key: %{public}@", buf, 0x16u);

      if (v6) {
        goto LABEL_4;
      }
LABEL_6:
      BOOL v10 = 0;
      goto LABEL_7;
    }
  }
  if (!v6) {
    goto LABEL_6;
  }
LABEL_4:
  [v6 timeIntervalSinceNow];
  BOOL v10 = v9 > -86400.0;
LABEL_7:

  return v10;
}

- (void)setShouldBeObservingContentProtectionState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc(MEMORY[0x263F43218]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v7 = (void *)[v5 initWithCategory:0 domainName:@"SleepTracking" profile:WeakRetained];

  if (v3)
  {
    uint64_t v8 = [MEMORY[0x263EFF910] date];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v15 = 0;
  char v9 = [v7 setDate:v8 forKey:@"SleepTrackingSessionStartDate" error:&v15];
  id v10 = v15;
  if (v3) {

  }
  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    objc_super v11 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      id v13 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      __int16 v18 = 2114;
      id v19 = v10;
      id v14 = v13;
      _os_log_error_impl(&dword_226DD9000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] failed to set observing protection state key: %{public}@", buf, 0x16u);
    }
  }
}

- (void)_restoreContentProtectionObservingState
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(HDSHAccessibilityAssertionManager *)self shouldBeObservingContentProtectionState])
  {
    _HKInitializeLogging();
    BOOL v3 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      int v9 = 138543362;
      id v10 = (id)objc_opt_class();
      id v5 = v10;
      _os_log_impl(&dword_226DD9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] should be observing content protection state", (uint8_t *)&v9, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v7 = [WeakRetained daemon];
    uint64_t v8 = [v7 contentProtectionManager];
    [v8 addContentProtectionObserver:self withQueue:self->_queue];
  }
}

- (void)beginObservingContentProtectionState
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  BOOL v3 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)int v9 = 138543362;
    *(void *)&v9[4] = objc_opt_class();
    id v5 = *(id *)&v9[4];
    _os_log_impl(&dword_226DD9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] beginObservingContentProtectionState", v9, 0xCu);
  }
  -[HDSHAccessibilityAssertionManager setShouldBeObservingContentProtectionState:](self, "setShouldBeObservingContentProtectionState:", 1, *(_OWORD *)v9);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v7 = [WeakRetained daemon];
  uint64_t v8 = [v7 contentProtectionManager];
  [v8 addContentProtectionObserver:self withQueue:self->_queue];
}

- (void)stopObservingContentProtectionState
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  BOOL v3 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)int v9 = 138543362;
    *(void *)&v9[4] = objc_opt_class();
    id v5 = *(id *)&v9[4];
    _os_log_impl(&dword_226DD9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopObservingContentProtectionState", v9, 0xCu);
  }
  -[HDSHAccessibilityAssertionManager setShouldBeObservingContentProtectionState:](self, "setShouldBeObservingContentProtectionState:", 0, *(_OWORD *)v9);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v7 = [WeakRetained daemon];
  uint64_t v8 = [v7 contentProtectionManager];
  [v8 removeContentProtectionObserver:self];
}

- (void)invalidateAccessibilityAssertion
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  BOOL v3 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl(&dword_226DD9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidateAccessibilityAssertion", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HDSHAccessibilityAssertionManager_invalidateAccessibilityAssertion__block_invoke;
  block[3] = &unk_2647E7250;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __69__HDSHAccessibilityAssertionManager_invalidateAccessibilityAssertion__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (HDAssertion)accessibilityAssertion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__HDSHAccessibilityAssertionManager_accessibilityAssertion__block_invoke;
  v5[3] = &unk_2647E7278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HDAssertion *)v3;
}

void __59__HDSHAccessibilityAssertionManager_accessibilityAssertion__block_invoke(uint64_t a1)
{
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 == 3
    && [(HDSHAccessibilityAssertionManager *)self shouldBeObservingContentProtectionState])
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      *(_DWORD *)id v9 = 138543362;
      *(void *)&v9[4] = objc_opt_class();
      id v8 = *(id *)&v9[4];
      _os_log_impl(&dword_226DD9000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] database is locking, taking assertion", v9, 0xCu);
    }
    [(HDSHAccessibilityAssertionManager *)self _queue_takeAccessibilityAssertion];
  }
}

- (void)_queue_takeAccessibilityAssertion
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F09958];
  if (self->_accessibilityAssertion)
  {
    _HKInitializeLogging();
    os_log_t v4 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      *(_DWORD *)buf = 138543362;
      id v20 = (id)objc_opt_class();
      id v6 = v20;
      _os_log_impl(&dword_226DD9000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidating existing assertion", buf, 0xCu);
    }
    [(HDAssertion *)self->_accessibilityAssertion invalidate];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained database];
  id v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  id v18 = 0;
  id v11 = [v8 takeAccessibilityAssertionWithOwnerIdentifier:v10 timeout:&v18 error:600.0];
  id v12 = v18;
  accessibilityAssertion = self->_accessibilityAssertion;
  self->_accessibilityAssertion = v11;

  if (!self->_accessibilityAssertion)
  {
    _HKInitializeLogging();
    os_log_t v14 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      id v15 = v14;
      v16 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v20 = v16;
      __int16 v21 = 2114;
      id v22 = v12;
      id v17 = v16;
      _os_log_error_impl(&dword_226DD9000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] failed to take assertion with error: %{public}@", buf, 0x16u);
    }
  }
}

- (void)dealloc
{
  [(HDAssertion *)self->_accessibilityAssertion invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  os_log_t v4 = [WeakRetained daemon];
  id v5 = [v4 contentProtectionManager];
  [v5 removeContentProtectionObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)HDSHAccessibilityAssertionManager;
  [(HDSHAccessibilityAssertionManager *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
}

@end