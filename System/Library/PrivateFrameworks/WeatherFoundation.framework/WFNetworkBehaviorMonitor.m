@interface WFNetworkBehaviorMonitor
+ (id)sharedInstance;
- (NSHashTable)observers;
- (WFNetworkBehaviorMonitor)init;
- (void)addObserver:(id)a3;
- (void)logNetworkEvent:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation WFNetworkBehaviorMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_s_sharedInstance;
  return v2;
}

uint64_t __42__WFNetworkBehaviorMonitor_sharedInstance__block_invoke()
{
  sharedInstance_s_sharedInstance = objc_alloc_init(WFNetworkBehaviorMonitor);
  return MEMORY[0x270F9A758]();
}

- (WFNetworkBehaviorMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFNetworkBehaviorMonitor;
  v2 = [(WFNetworkBehaviorMonitor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;
  }
  return v2;
}

- (void)logNetworkEvent:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__WFNetworkBehaviorMonitor_logNetworkEvent___block_invoke;
  v6[3] = &unk_264431680;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __44__WFNetworkBehaviorMonitor_logNetworkEvent___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) networkEventMonitor:*(void *)(a1 + 32) loggedEvent:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkBehaviorMonitor *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkBehaviorMonitor *)self observers];
  [v5 removeObject:v4];
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

@end