@interface HDSPProcessStateManager
- (BOOL)isProcessSuspended:(int)a3;
- (HDSPProcessStateManager)init;
- (HDSPProcessStateManager)initWithProcessStateProvider:(id)a3;
- (HDSPProcessStateManagerDelegate)delegate;
- (void)_process:(id)a3 didUpdateFromState:(id)a4 toState:(id)a5;
- (void)_updateConfiguration;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startMonitoringProcessState:(int)a3;
- (void)stopMonitoringProcessState:(int)a3;
@end

@implementation HDSPProcessStateManager

uint64_t __47__HDSPProcessStateManager__updateConfiguration__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F645D8] predicateMatchingIdentifier:a2];
}

- (void)startMonitoringProcessState:(int)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F64580] identifierWithPid:*(void *)&a3];
  v5 = self->_processIdentifiers;
  objc_sync_enter(v5);
  if ([(NSMutableSet *)self->_processIdentifiers containsObject:v4])
  {
    objc_sync_exit(v5);
  }
  else
  {
    v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2114;
      v11 = v4;
      id v7 = v9;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_INFO, "[%{public}@] monitoring process: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [(NSMutableSet *)self->_processIdentifiers addObject:v4];
    objc_sync_exit(v5);

    [(HKSPThrottler *)self->_updateThrottler execute];
  }
}

void __47__HDSPProcessStateManager__updateConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "na_map:", &__block_literal_global_17);
  [v3 setPredicates:v4];
  id v5 = objc_alloc_init(MEMORY[0x263F645E8]);
  [v5 setValues:1];
  [v3 setStateDescriptor:v5];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__HDSPProcessStateManager__updateConfiguration__block_invoke_3;
  v6[3] = &unk_2645DA8C8;
  objc_copyWeak(&v7, &location);
  [v3 setUpdateHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __47__HDSPProcessStateManager__updateConfiguration__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  int v8 = [v6 previousState];
  id v9 = [v6 state];

  [WeakRetained _process:v7 didUpdateFromState:v8 toState:v9];
}

- (void)_process:(id)a3 didUpdateFromState:(id)a4 toState:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 taskState] == 3 && objc_msgSend(v10, "taskState") != 3)
  {
    v16 = HKSPLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = objc_opt_class();
      id v18 = v17;
      v19 = [v8 name];
      int v20 = 138543618;
      v21 = v17;
      __int16 v22 = 2114;
      v23 = v19;
      _os_log_impl(&dword_221A52000, v16, OS_LOG_TYPE_INFO, "[%{public}@] process %{public}@ no longer suspended", (uint8_t *)&v20, 0x16u);
    }
    v15 = [(HDSPProcessStateManager *)self delegate];
    objc_msgSend(v15, "processNoLongerSuspended:", objc_msgSend(v8, "pid"));
    goto LABEL_11;
  }
  if ([v9 taskState] != 3 && objc_msgSend(v10, "taskState") == 3)
  {
    v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = v12;
      v14 = [v8 name];
      int v20 = 138543618;
      v21 = v12;
      __int16 v22 = 2114;
      v23 = v14;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_INFO, "[%{public}@] process %{public}@ is suspended", (uint8_t *)&v20, 0x16u);
    }
    v15 = [(HDSPProcessStateManager *)self delegate];
    objc_msgSend(v15, "processDidBecomeSuspended:", objc_msgSend(v8, "pid"));
LABEL_11:
  }
}

void __56__HDSPProcessStateManager_initWithProcessStateProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateConfiguration];
}

- (void)_updateConfiguration
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15;
  v16 = __Block_byref_object_dispose__15;
  id v17 = 0;
  id v3 = self->_processIdentifiers;
  objc_sync_enter(v3);
  uint64_t v4 = [(NSMutableSet *)self->_processIdentifiers allObjects];
  id v5 = (void *)v13[5];
  v13[5] = v4;

  objc_sync_exit(v3);
  id v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = objc_opt_class();
    uint64_t v8 = v13[5];
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    id v9 = v7;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_INFO, "[%{public}@] updating monitor configuration for processes: %{public}@", buf, 0x16u);
  }
  processStateMonitor = self->_processStateMonitor;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__HDSPProcessStateManager__updateConfiguration__block_invoke;
  v11[3] = &unk_2645DA8F0;
  v11[4] = self;
  v11[5] = &v12;
  [(RBSProcessMonitor *)processStateMonitor updateConfiguration:v11];
  _Block_object_dispose(&v12, 8);
}

- (HDSPProcessStateManager)init
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__HDSPProcessStateManager_init__block_invoke;
  v5[3] = &unk_2645DA880;
  objc_copyWeak(&v6, &location);
  id v3 = [(HDSPProcessStateManager *)self initWithProcessStateProvider:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __31__HDSPProcessStateManager_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [MEMORY[0x263F64580] identifierWithPid:a2];
  id v12 = 0;
  id v5 = [MEMORY[0x263F64570] handleForIdentifier:v4 error:&v12];
  id v6 = v12;
  if (!v5)
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v6;
      id v11 = v10;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to fetch handle with error: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v8 = [v5 currentState];

  return v8;
}

- (HDSPProcessStateManager)initWithProcessStateProvider:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HDSPProcessStateManager;
  id v5 = [(HDSPProcessStateManager *)&v20 init];
  if (v5)
  {
    id v6 = (RBSProcessMonitor *)objc_alloc_init(MEMORY[0x263F645C0]);
    processStateMonitor = v5->_processStateMonitor;
    v5->_processStateMonitor = v6;

    uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    processIdentifiers = v5->_processIdentifiers;
    v5->_processIdentifiers = v8;

    uint64_t v10 = [v4 copy];
    id processStateProvider = v5->_processStateProvider;
    v5->_id processStateProvider = (id)v10;

    objc_initWeak(&location, v5);
    id v12 = objc_alloc(MEMORY[0x263F75EC0]);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __56__HDSPProcessStateManager_initWithProcessStateProvider___block_invoke;
    v17[3] = &unk_2645DA138;
    objc_copyWeak(&v18, &location);
    uint64_t v13 = [v12 initWithInterval:v17 executeBlock:0.25];
    updateThrottler = v5->_updateThrottler;
    v5->_updateThrottler = (HKSPThrottler *)v13;

    __int16 v15 = v5;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (BOOL)isProcessSuspended:(int)a3
{
  id v3 = (*((void (**)(void))self->_processStateProvider + 2))();
  BOOL v4 = [v3 taskState] == 3;

  return v4;
}

- (void)stopMonitoringProcessState:(int)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v4 = [MEMORY[0x263F64580] identifierWithPid:*(void *)&a3];
  id v5 = self->_processIdentifiers;
  objc_sync_enter(v5);
  if ([(NSMutableSet *)self->_processIdentifiers containsObject:v4])
  {
    objc_sync_exit(v5);
  }
  else
  {
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2114;
      id v11 = v4;
      id v7 = v9;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_INFO, "[%{public}@] no longer monitoring process: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [(NSMutableSet *)self->_processIdentifiers removeObject:v4];
    objc_sync_exit(v5);

    [(HKSPThrottler *)self->_updateThrottler execute];
  }
}

- (void)dealloc
{
  [(RBSProcessMonitor *)self->_processStateMonitor invalidate];
  processStateMonitor = self->_processStateMonitor;
  self->_processStateMonitor = 0;

  v4.receiver = self;
  v4.super_class = (Class)HDSPProcessStateManager;
  [(HDSPProcessStateManager *)&v4 dealloc];
}

- (HDSPProcessStateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSPProcessStateManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateThrottler, 0);
  objc_storeStrong(&self->_processStateProvider, 0);
  objc_storeStrong((id *)&self->_processIdentifiers, 0);

  objc_storeStrong((id *)&self->_processStateMonitor, 0);
}

@end