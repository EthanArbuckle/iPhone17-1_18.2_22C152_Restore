@interface OSADiagnosticMonitorClient
+ (OSADiagnosticMonitorClient)sharedClient;
- (OSADiagnosticMonitorClient)init;
- (id)q_shimWrappingObserver:(id)a3 creatingIfAbsent:(BOOL)a4 removingIfPresent:(BOOL)a5;
- (void)addObserver:(id)a3 forTypes:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation OSADiagnosticMonitorClient

+ (OSADiagnosticMonitorClient)sharedClient
{
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedClient__sharedInstance;
  return (OSADiagnosticMonitorClient *)v2;
}

uint64_t __42__OSADiagnosticMonitorClient_sharedClient__block_invoke()
{
  sharedClient__sharedInstance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (OSADiagnosticMonitorClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)OSADiagnosticMonitorClient;
  v2 = [(OSADiagnosticMonitorClient *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.osanalytics.diagnosticsmonitorclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)addObserver:(id)a3 forTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__OSADiagnosticMonitorClient_addObserver_forTypes___block_invoke;
  block[3] = &unk_1E60C45C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __51__OSADiagnosticMonitorClient_addObserver_forTypes___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_shimWrappingObserver:creatingIfAbsent:removingIfPresent:", *(void *)(a1 + 40), 1, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[OSADiagnosticMonitor sharedMonitor];
  [v2 addEventObserver:v4 forTypes:*(void *)(a1 + 48)];

  dispatch_queue_t v3 = +[OSADiagnosticMonitor sharedMonitor];
  [v3 addWriteObserver:v4 forTypes:*(void *)(a1 + 48)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__OSADiagnosticMonitorClient_removeObserver___block_invoke;
  v7[3] = &unk_1E60C4580;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __45__OSADiagnosticMonitorClient_removeObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_shimWrappingObserver:creatingIfAbsent:removingIfPresent:", *(void *)(a1 + 40), 0, 1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v1 = +[OSADiagnosticMonitor sharedMonitor];
    [v1 removeEventObserver:v3];

    v2 = +[OSADiagnosticMonitor sharedMonitor];
    [v2 removeWriteObserver:v3];
  }
}

- (id)q_shimWrappingObserver:(id)a3 creatingIfAbsent:(BOOL)a4 removingIfPresent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  observers = self->_observers;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__OSADiagnosticMonitorClient_q_shimWrappingObserver_creatingIfAbsent_removingIfPresent___block_invoke;
  v15[3] = &unk_1E60C4690;
  id v10 = v8;
  id v16 = v10;
  uint64_t v11 = [(NSMutableArray *)observers indexOfObjectPassingTest:v15];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6)
    {
      id v12 = [[ObserverShim alloc] initWithObserver:v10];
      [(NSMutableArray *)self->_observers addObject:v12];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    uint64_t v13 = v11;
    id v12 = [(NSMutableArray *)self->_observers objectAtIndexedSubscript:v11];
    if (v5) {
      [(NSMutableArray *)self->_observers removeObjectAtIndex:v13];
    }
  }

  return v12;
}

uint64_t __88__OSADiagnosticMonitorClient_q_shimWrappingObserver_creatingIfAbsent_removingIfPresent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matches:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end