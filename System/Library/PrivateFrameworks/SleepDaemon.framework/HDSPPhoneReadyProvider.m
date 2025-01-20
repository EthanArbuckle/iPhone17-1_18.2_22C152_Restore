@interface HDSPPhoneReadyProvider
- (BOOL)isSystemReady;
- (HDSPEnvironment)environment;
- (HDSPPhoneReadyProvider)initWithEnvironment:(id)a3;
- (HDSPSpringboardMonitor)springboardMonitor;
- (HDSPSystemReadyDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)springboardDidStart;
@end

@implementation HDSPPhoneReadyProvider

- (HDSPPhoneReadyProvider)initWithEnvironment:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDSPPhoneReadyProvider;
  v5 = [(HDSPPhoneReadyProvider *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = [HDSPSpringboardMonitor alloc];
    v8 = [v4 defaultCallbackScheduler];
    uint64_t v9 = [(HDSPSpringboardMonitor *)v7 initWithCallbackScheduler:v8 isAppleWatch:0];
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

- (BOOL)isSystemReady
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HDSPSpringboardMonitor *)self->_springboardMonitor isSpringboardStarted];
  if (v3)
  {
    id v4 = HKSPLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = (id)objc_opt_class();
      id v5 = v8;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] System is ready", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    [(HDSPSpringboardMonitor *)self->_springboardMonitor addObserver:self];
  }
  return v3;
}

- (void)springboardDidStart
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Springboard started", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained systemDidBecomeReady];

  [(HDSPSpringboardMonitor *)self->_springboardMonitor removeObserver:self];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springboardMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_environment);
}

@end