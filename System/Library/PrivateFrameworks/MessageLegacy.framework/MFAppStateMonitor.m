@interface MFAppStateMonitor
+ (id)sharedInstance;
- (BOOL)isForeground;
- (EFObservable)appStateObservable;
- (MFAppStateMonitor)init;
- (void)_updateApplicationState:(id)a3 observer:(id)a4;
- (void)dealloc;
@end

@implementation MFAppStateMonitor

+ (id)sharedInstance
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
  return v2;
}

uint64_t __35__MFAppStateMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  [(BKSApplicationStateMonitor *)self->_appStateMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MFAppStateMonitor;
  [(MFAppStateMonitor *)&v3 dealloc];
}

- (MFAppStateMonitor)init
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)MFAppStateMonitor;
  v2 = [(MFAppStateMonitor *)&v18 init];
  if (v2)
  {
    objc_super v3 = [MEMORY[0x1E4F60DD8] observableObserver];
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.message.applicationStateMonitor", MEMORY[0x1E4F14430]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_storeStrong((id *)&v2->_observable, v3);
    v6 = [MEMORY[0x1E4F28B50] mainBundle];
    v7 = [v6 bundleIdentifier];

    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F4E278]);
      v19[0] = v7;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      uint64_t v10 = [v8 initWithBundleIDs:v9 states:*MEMORY[0x1E4F4E220]];
      appStateMonitor = v2->_appStateMonitor;
      v2->_appStateMonitor = (BKSApplicationStateMonitor *)v10;

      v2->_appState = [(BKSApplicationStateMonitor *)v2->_appStateMonitor applicationStateForApplication:v7];
      objc_initWeak(&location, v2);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __25__MFAppStateMonitor_init__block_invoke;
      v13[3] = &unk_1E6866DA8;
      objc_copyWeak(&v16, &location);
      id v14 = v7;
      id v15 = v3;
      [(BKSApplicationStateMonitor *)v2->_appStateMonitor setHandler:v13];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

void __25__MFAppStateMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_queue_t v4 = *(void **)(a1 + 32);
  v5 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F4E230]];
  LODWORD(v4) = [v4 isEqualToString:v5];

  if (v4)
  {
    v6 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F4E248]];
    [WeakRetained _updateApplicationState:v6 observer:*(void *)(a1 + 40)];
  }
}

- (EFObservable)appStateObservable
{
  objc_super v3 = [(EFObserver *)self->_observable distinctUntilChanged];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__MFAppStateMonitor_appStateObservable__block_invoke;
  v6[3] = &unk_1E6866DD0;
  v6[4] = self;
  dispatch_queue_t v4 = [v3 map:v6];

  return (EFObservable *)v4;
}

id __39__MFAppStateMonitor_appStateObservable__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)isForeground
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__MFAppStateMonitor_isForeground__block_invoke;
  v5[3] = &unk_1E6866DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__MFAppStateMonitor_isForeground__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 8) == 8;
  return result;
}

- (void)_updateApplicationState:(id)a3 observer:(id)a4
{
  id v6 = a3;
  queue = self->_queue;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __54__MFAppStateMonitor__updateApplicationState_observer___block_invoke;
  v13 = &unk_1E6866E20;
  id v14 = v6;
  id v15 = self;
  id v8 = v6;
  id v9 = a4;
  dispatch_barrier_sync(queue, &v10);
  objc_msgSend(v9, "observerDidReceiveResult:", v8, v10, v11, v12, v13);
}

void __54__MFAppStateMonitor__updateApplicationState_observer___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) unsignedIntValue];
  char v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_t v4 = _BKSApplicationStateGetDescription(*(_DWORD *)(*(void *)(a1 + 40) + 8));
    v5 = _BKSApplicationStateGetDescription(v2);
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_1CFCFE000, v3, OS_LOG_TYPE_INFO, "transitioning from %@ to %@", (uint8_t *)&v6, 0x16u);
  }
  *(_DWORD *)(*(void *)(a1 + 40) + 8) = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
}

@end