@interface HDSPWatchReadyProvider
- (BOOL)_isInRootRobot;
- (BOOL)_waitForInitialSync;
- (BOOL)isInRootRobotOrDemoMode;
- (BOOL)isSystemReady;
- (BOOL)observingRestore;
- (HDSPEnvironment)environment;
- (HDSPSpringboardMonitor)springboardMonitor;
- (HDSPSystemReadyDelegate)delegate;
- (HDSPWatchReadyProvider)initWithEnvironment:(id)a3;
- (os_unfair_lock_s)lock;
- (void)_withLock:(id)a3;
- (void)restoreDidFinish;
- (void)setDelegate:(id)a3;
- (void)springboardDidStart;
@end

@implementation HDSPWatchReadyProvider

- (HDSPWatchReadyProvider)initWithEnvironment:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDSPWatchReadyProvider;
  v5 = [(HDSPWatchReadyProvider *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = [HDSPSpringboardMonitor alloc];
    v8 = [v4 defaultCallbackScheduler];
    uint64_t v9 = [(HDSPSpringboardMonitor *)v7 initWithCallbackScheduler:v8 isAppleWatch:1];
    springboardMonitor = v6->_springboardMonitor;
    v6->_springboardMonitor = (HDSPSpringboardMonitor *)v9;

    v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      v13 = v6->_springboardMonitor;
      *(_DWORD *)buf = 138543618;
      v19 = v12;
      __int16 v20 = 2114;
      v21 = v13;
      id v14 = v12;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] initializing with %{public}@", buf, 0x16u);
    }
    v15 = v6;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isSystemReady
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HDSPSpringboardMonitor *)self->_springboardMonitor isSpringboardStarted];
  id v4 = HKSPLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138543362;
      id v10 = (id)objc_opt_class();
      id v6 = v10;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Carousel is started.", (uint8_t *)&v9, 0xCu);
    }
    if ([(HDSPWatchReadyProvider *)self _waitForInitialSync]) {
      return 1;
    }
  }
  else
  {
    if (v5)
    {
      int v9 = 138543362;
      id v10 = (id)objc_opt_class();
      id v8 = v10;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Waiting for Carousel to start.", (uint8_t *)&v9, 0xCu);
    }
    [(HDSPSpringboardMonitor *)self->_springboardMonitor addObserver:self];
  }
  return 0;
}

- (BOOL)_waitForInitialSync
{
  return 0;
}

- (BOOL)isInRootRobotOrDemoMode
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v4 = [WeakRetained isDemoEnvironment];

  if (v4)
  {
    BOOL v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = (id)objc_opt_class();
      id v6 = v9;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] we're in demo environment", (uint8_t *)&v8, 0xCu);
    }
    return 1;
  }
  else
  {
    return [(HDSPWatchReadyProvider *)self _isInRootRobot];
  }
}

- (BOOL)_isInRootRobot
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__HDSPWatchReadyProvider__isInRootRobot__block_invoke;
  block[3] = &unk_2645D90C0;
  block[4] = self;
  if (qword_26AB790B0 != -1) {
    dispatch_once(&qword_26AB790B0, block);
  }
  return _MergedGlobals_13;
}

void __40__HDSPWatchReadyProvider__isInRootRobot__block_invoke()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v0 = HKSPLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v1 = v8;
    _os_log_impl(&dword_221A52000, v0, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking if we are in root robot.", (uint8_t *)&v7, 0xCu);
  }
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.rootrobot"];
  BOOL v3 = [v2 stringForKey:@"configuration"];
  _MergedGlobals_13 = [@"minimal" isEqualToString:v3];
  int v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = objc_opt_class();
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 1024;
    int v10 = _MergedGlobals_13;
    id v6 = v5;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Running in root robot %d", (uint8_t *)&v7, 0x12u);
  }
}

- (void)springboardDidStart
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v4 = *(id *)&v6[4];
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Carousel has started", v6, 0xCu);
  }
  if ([(HDSPWatchReadyProvider *)self _waitForInitialSync])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained systemDidBecomeReady];

    [(HDSPWatchReadyProvider *)self _finishWaitingForInitialSync];
  }
  -[HDSPSpringboardMonitor removeObserver:](self->_springboardMonitor, "removeObserver:", self, *(_OWORD *)v6);
}

- (void)restoreDidFinish
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] restore finished", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained systemDidBecomeReady];

  [(HDSPWatchReadyProvider *)self _finishWaitingForInitialSync];
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HDSPSystemReadyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSPSystemReadyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HDSPSpringboardMonitor)springboardMonitor
{
  return self->_springboardMonitor;
}

- (BOOL)observingRestore
{
  return self->_observingRestore;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springboardMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_environment);
}

@end