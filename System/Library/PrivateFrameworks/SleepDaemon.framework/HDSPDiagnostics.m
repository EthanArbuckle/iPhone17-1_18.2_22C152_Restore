@interface HDSPDiagnostics
- (HDSPDiagnostics)initWithEnvironment:(id)a3;
- (HDSPEnvironment)environment;
- (HKSPDiagnostics)diagnostics;
- (HKSPObserverSet)providers;
- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4;
- (void)_logDiagnostics:(id)a3;
- (void)addProvider:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)removeProvider:(id)a3;
@end

@implementation HDSPDiagnostics

- (HDSPDiagnostics)initWithEnvironment:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDSPDiagnostics;
  v5 = [(HDSPDiagnostics *)&v17 init];
  if (v5)
  {
    v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v19 = v7;
      __int16 v20 = 2048;
      v21 = v5;
      id v8 = v7;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    objc_storeWeak((id *)&v5->_environment, v4);
    id v9 = objc_alloc(MEMORY[0x263F75E20]);
    v10 = [MEMORY[0x263F581B8] immediateScheduler];
    uint64_t v11 = [v9 initWithCallbackScheduler:v10];
    providers = v5->_providers;
    v5->_providers = (HKSPObserverSet *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F75DC8]) initWithLabel:@"com.apple.sleepd"];
    diagnostics = v5->_diagnostics;
    v5->_diagnostics = (HKSPDiagnostics *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4 = [a3 notificationListener];
  [v4 addObserver:self];
}

- (void)addProvider:(id)a3
{
  if (a3)
  {
    providers = self->_providers;
    id v5 = a3;
    [(HKSPObserverSet *)providers addObserver:v5];
    [(HKSPDiagnostics *)self->_diagnostics addProvider:v5];
  }
}

- (void)removeProvider:(id)a3
{
  if (a3)
  {
    providers = self->_providers;
    id v5 = a3;
    [(HKSPObserverSet *)providers removeObserver:v5];
    [(HKSPDiagnostics *)self->_diagnostics removeProvider:v5];
  }
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 isEqualToString:@"com.apple.sleepd.diagnostics"])
  {
    v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v5;
      id v7 = v16;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", buf, 0x16u);
    }
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    providers = self->_providers;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__HDSPDiagnostics_notificationListener_didReceiveNotificationWithName___block_invoke;
    v13[3] = &unk_2645D95E0;
    id v14 = v8;
    id v10 = v8;
    [(HKSPObserverSet *)providers enumerateObserversWithBlock:v13];
    [(HDSPDiagnostics *)self _logDiagnostics:v10];
    uint64_t v11 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v11;
}

void __71__HDSPDiagnostics_notificationListener_didReceiveNotificationWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 diagnosticDescription];
  id v9 = (id)v4;
  if (v4) {
    id v5 = (__CFString *)v4;
  }
  else {
    id v5 = @"<none>";
  }
  v6 = *(void **)(a1 + 32);
  id v7 = (objc_class *)objc_opt_class();

  id v8 = NSStringFromClass(v7);
  [v6 setObject:v5 forKeyedSubscript:v8];
}

- (void)_logDiagnostics:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
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
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = HKSPLogForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v17 = v8;
          _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "----------------------------%{public}@----------------------------", buf, 0xCu);
        }

        id v10 = HKSPLogForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [v3 objectForKeyedSubscript:v8];
          *(_DWORD *)buf = 138543362;
          __int16 v17 = v11;
          _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]", buf, 0xCu);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HKSPObserverSet)providers
{
  return self->_providers;
}

- (HKSPDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_providers, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end