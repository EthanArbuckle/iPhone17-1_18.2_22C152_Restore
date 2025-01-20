@interface MFAppStateMonitor
+ (MFAppStateMonitor)sharedInstance;
- (BOOL)isVisible;
- (EFObservable)appIsVisibleObservable;
- (MFAppStateMonitor)initWithBundleId:(id)a3;
- (void)_monitorDidUpdate:(void *)a3 process:(void *)a4 update:;
- (void)dealloc;
@end

@implementation MFAppStateMonitor

- (EFObservable)appIsVisibleObservable
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (self) {
    observable = self->_observable;
  }
  else {
    observable = 0;
  }
  v4 = observable;
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MFAppStateMonitor isVisible](self, "isVisible"));
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7 = [(EFObserver *)v4 startWith:v6];

  return (EFObservable *)v7;
}

- (BOOL)isVisible
{
  return atomic_load_explicit((atomic_uchar *volatile)&self->_isVisible, memory_order_acquire) & 1;
}

+ (MFAppStateMonitor)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MFAppStateMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_instance;
  return (MFAppStateMonitor *)v2;
}

void __35__MFAppStateMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  uint64_t v2 = [v1 initWithBundleId:*MEMORY[0x1E4F77E48]];
  v3 = (void *)sharedInstance_instance;
  sharedInstance_instance = v2;
}

void __38__MFAppStateMonitor_initWithBundleId___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  -[MFAppStateMonitor _monitorDidUpdate:process:update:]((uint64_t)WeakRetained, v9, v8, v7);
}

- (void)_monitorDidUpdate:(void *)a3 process:(void *)a4 update:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (a1)
  {
    v11 = [v9 state];
    int v12 = [v11 taskState];

    v13 = [v10 state];
    v14 = [v13 endowmentNamespaces];
    uint64_t v15 = [v14 containsObject:@"com.apple.frontboard.visibility"];

    int v16 = v15 ^ 1;
    atomic_compare_exchange_strong((atomic_uchar *volatile)(a1 + 8), (unsigned __int8 *)&v16, v15);
    if (v16 == (v15 ^ 1))
    {
      v17 = MFLogGeneral();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 67109632;
        int v21 = v15;
        __int16 v22 = 1024;
        int v23 = v12;
        __int16 v24 = 1024;
        int v25 = [v8 pid];
        _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEFAULT, "[RBSProcessMonitor] Is visible: %{BOOL}d, state: %d, pid = %d", (uint8_t *)&v20, 0x14u);
      }

      v18 = *(id *)(a1 + 24);
      v19 = [MEMORY[0x1E4F28ED0] numberWithBool:v15];
      [v18 observerDidReceiveResult:v19];
    }
    else
    {
      v18 = MFLogGeneral();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v20 = 67109632;
        int v21 = v15;
        __int16 v22 = 1024;
        int v23 = v12;
        __int16 v24 = 1024;
        int v25 = [v8 pid];
        _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_INFO, "[RBSProcessMonitor] Is visible: %{BOOL}d, state: %d, pid = %d -- (no app visibility change)", (uint8_t *)&v20, 0x14u);
      }
    }
  }
}

- (MFAppStateMonitor)initWithBundleId:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_11;
  }
  v28.receiver = self;
  v28.super_class = (Class)MFAppStateMonitor;
  self = [(MFAppStateMonitor *)&v28 init];
  if (self)
  {
    v5 = [MEMORY[0x1E4F60DD8] observableObserver];
    observable = self->_observable;
    self->_observable = v5;

    id v7 = (void *)MEMORY[0x1E4F963E8];
    id v8 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:v4];
    id v27 = 0;
    id v9 = [v7 handleForPredicate:v8 error:&v27];
    id v10 = v27;

    v11 = [v9 currentState];
    int v12 = [v11 endowmentNamespaces];
    uint64_t v13 = [v12 containsObject:@"com.apple.frontboard.visibility"];
    v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v13;
      _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "[RBSProcessMonitor] Is visible: %{BOOL}d (initial)", buf, 8u);
    }

    atomic_store(v13, (unsigned __int8 *)&self->_isVisible);
    uint64_t v15 = self->_observable;
    int v16 = [MEMORY[0x1E4F28ED0] numberWithBool:v13];
    [(EFObserver *)v15 observerDidReceiveResult:v16];

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v17 = (void *)MEMORY[0x1E4F96418];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __38__MFAppStateMonitor_initWithBundleId___block_invoke;
    v24[3] = &unk_1E5D3DB80;
    id v18 = v4;
    id v25 = v18;
    objc_copyWeak(&v26, (id *)buf);
    v19 = [v17 monitorWithConfiguration:v24];
    underlyingMonitor = self->_underlyingMonitor;
    self->_underlyingMonitor = v19;

    if (self->_underlyingMonitor)
    {
      objc_destroyWeak(&v26);

      objc_destroyWeak((id *)buf);
      goto LABEL_7;
    }
    __int16 v22 = MFLogGeneral();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      [(MFAppStateMonitor *)(uint64_t)v18 initWithBundleId:v22];
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);

LABEL_11:
    int v21 = 0;
    goto LABEL_12;
  }
LABEL_7:
  self = self;
  int v21 = self;
LABEL_12:

  return v21;
}

void __38__MFAppStateMonitor_initWithBundleId___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F96448] descriptor];
  [v4 setValues:1];
  v11[0] = @"com.apple.frontboard.visibility";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v4 setEndowmentNamespaces:v5];

  [v3 setStateDescriptor:v4];
  v6 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:*(void *)(a1 + 32)];
  id v10 = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [v3 setPredicates:v7];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__MFAppStateMonitor_initWithBundleId___block_invoke_2;
  v8[3] = &unk_1E5D3DB58;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  [v3 setUpdateHandler:v8];
  objc_destroyWeak(&v9);
}

- (void)dealloc
{
  uint64_t v2 = self;
  if (self) {
    self = (MFAppStateMonitor *)self->_underlyingMonitor;
  }
  [(MFAppStateMonitor *)self invalidate];
  v3.receiver = v2;
  v3.super_class = (Class)MFAppStateMonitor;
  [(MFAppStateMonitor *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_underlyingMonitor, 0);
}

- (void)initWithBundleId:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_FAULT, "Unable to create RBSProcessMonitor for %{public}@: %@", (uint8_t *)&v3, 0x16u);
}

@end