@interface NWStatsAppEventListener
- (NWAppStateEventListenerDelegate)appStateDelegate;
- (NWStatsAppEventListener)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (RBSProcessMonitor)appStateMonitor;
- (void)_applicationStateMonitorInit;
- (void)cleanupAppStateMonitor;
- (void)dealloc;
- (void)setAppStateDelegate:(id)a3;
- (void)setAppStateMonitor:(id)a3;
@end

@implementation NWStatsAppEventListener

void __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appStateDelegate];
  if (objc_opt_respondsToSelector()) {
    [v2 handleStateUpdate:*(void *)(a1 + 40) forProcess:*(void *)(a1 + 48)];
  }
}

- (NWAppStateEventListenerDelegate)appStateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appStateDelegate);
  return (NWAppStateEventListenerDelegate *)WeakRetained;
}

void __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = [WeakRetained queue];

    if (v10)
    {
      v11 = [v9 queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke_3;
      block[3] = &unk_264404E20;
      block[4] = v9;
      id v13 = v7;
      id v14 = v6;
      dispatch_async(v11, block);
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_applicationStateMonitorInit
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = dlopen("/System/Library/PrivateFrameworks/RunningBoardServices.framework/RunningBoardServices", 4);
  self->_runningBoradDylibHandle = v3;
  if (v3
    && (self->_Class RBSProcessMonitorClass = objc_getClass("RBSProcessMonitor"),
        self->_Class RBSProcessPredicateClass = objc_getClass("RBSProcessPredicate"),
        Class = objc_getClass("RBSProcessStateDescriptor"),
        self->_Class RBSProcessStateDescriptorClass = Class,
        self->_runningBoradDylibHandle)
    && (v5 = Class, (Class v6 = self->_RBSProcessMonitorClass) != 0)
    && self->_RBSProcessPredicateClass
    && v5)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke;
    v14[3] = &unk_264404E70;
    v14[4] = self;
    id v7 = [(objc_class *)v6 monitorWithConfiguration:v14];
    appStateMonitor = self->_appStateMonitor;
    self->_appStateMonitor = v7;
  }
  else
  {
    v9 = NStatGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      Class RBSProcessMonitorClass = self->_RBSProcessMonitorClass;
      Class RBSProcessPredicateClass = self->_RBSProcessPredicateClass;
      Class RBSProcessStateDescriptorClass = self->_RBSProcessStateDescriptorClass;
      runningBoradDylibHandle = self->_runningBoradDylibHandle;
      *(_DWORD *)buf = 134218752;
      v16 = runningBoradDylibHandle;
      __int16 v17 = 2048;
      Class v18 = RBSProcessMonitorClass;
      __int16 v19 = 2048;
      Class v20 = RBSProcessPredicateClass;
      __int16 v21 = 2048;
      Class v22 = RBSProcessStateDescriptorClass;
      _os_log_impl(&dword_21C4BC000, v9, OS_LOG_TYPE_FAULT, "RB Mapping dylib failure handle %p proc monitor %p predicate %p descriptor %p", buf, 0x2Au);
    }
  }
}

void __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke(id *a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (id *)a1[4];
  a1 += 4;
  v5 = [v4[4] descriptor];
  [v5 setValues:1];
  [v5 setEndowmentNamespaces:&unk_26CCB1D20];
  [v3 setStateDescriptor:v5];
  [v3 setEvents:1];
  v10[0] = [*((id *)*a1 + 3) performSelector:NSSelectorFromString(&cfstr_Predicateforsy.isa)];
  Class v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v3 setPredicates:v6];

  objc_initWeak(&location, *a1);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke_2;
  v7[3] = &unk_264404E48;
  objc_copyWeak(&v8, &location);
  [v3 setUpdateHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  [(NWStatsAppEventListener *)self cleanupAppStateMonitor];
  v3.receiver = self;
  v3.super_class = (Class)NWStatsAppEventListener;
  [(NWStatsAppEventListener *)&v3 dealloc];
}

- (void)cleanupAppStateMonitor
{
  appStateMonitor = self->_appStateMonitor;
  if (appStateMonitor)
  {
    [(RBSProcessMonitor *)appStateMonitor invalidate];
    v4 = self->_appStateMonitor;
    self->_appStateMonitor = 0;
  }
}

- (void)setAppStateDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appStateDelegate);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_appStateDelegate, obj);
    if (obj) {
      [(NWStatsAppEventListener *)self _applicationStateMonitorInit];
    }
    else {
      [(NWStatsAppEventListener *)self cleanupAppStateMonitor];
    }
  }
}

- (NWStatsAppEventListener)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NWStatsAppEventListener;
  Class v6 = [(NWStatsAppEventListener *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (RBSProcessMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (void)setAppStateMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_destroyWeak((id *)&self->_appStateDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end