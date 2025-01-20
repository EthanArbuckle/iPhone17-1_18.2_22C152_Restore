@interface STFileProviderMonitor
+ (id)sharedMonitor;
- (NSArray)fpDomains;
- (id)fpContext;
- (void)_postNotify:(id)a3;
- (void)postNotify;
- (void)setFpContext:(id)a3;
- (void)setFpDomains:(id)a3;
- (void)startMonitor;
- (void)stopMonitor;
- (void)sync;
@end

@implementation STFileProviderMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken_2 != -1) {
    dispatch_once(&sharedMonitor_onceToken_2, &__block_literal_global_11);
  }
  v2 = (void *)sharedMonitor__gMonitor;

  return v2;
}

uint64_t __38__STFileProviderMonitor_sharedMonitor__block_invoke()
{
  sharedMonitor__gMonitor = objc_alloc_init(STFileProviderMonitor);

  return MEMORY[0x270F9A758]();
}

- (void)startMonitor
{
  v3 = [(STFileProviderMonitor *)self fpContext];

  if (!v3)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __37__STFileProviderMonitor_startMonitor__block_invoke;
    v5[3] = &unk_264305730;
    v5[4] = self;
    v4 = [MEMORY[0x263F054C8] beginMonitoringProviderDomainChangesWithHandler:v5];
    [(STFileProviderMonitor *)self setFpContext:v4];
  }
}

void __37__STFileProviderMonitor_startMonitor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [a2 allValues];
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEnabled", (void)v11)
          && [v10 supportsEnumeration]
          && [v10 isAvailableSystemWide]
          && ([v10 isHidden] & 1) == 0)
        {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) setFpDomains:v4];
  [*(id *)(a1 + 32) postNotify];
}

- (void)stopMonitor
{
  id v4 = [(STFileProviderMonitor *)self fpContext];
  [(STFileProviderMonitor *)self setFpContext:0];
  v3 = v4;
  if (v4)
  {
    [MEMORY[0x263F054C8] endMonitoringProviderDomainChanges:v4];
    v3 = v4;
  }
}

- (void)_postNotify:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 postNotificationName:v4 object:0];
}

- (void)postNotify
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __35__STFileProviderMonitor_postNotify__block_invoke;
  v2[3] = &unk_2643050C0;
  v2[4] = self;
  v3 = @"com.apple.storage.fp_domains";
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __35__STFileProviderMonitor_postNotify__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel__postNotify_ object:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 performSelector:sel__postNotify_ withObject:v3 afterDelay:0.1];
}

- (void)sync
{
  uint64_t v3 = (void *)MEMORY[0x21D463BC0](self, a2);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = (void *)MEMORY[0x263F054C8];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __29__STFileProviderMonitor_sync__block_invoke;
  long long v11 = &unk_264305758;
  long long v12 = self;
  dispatch_semaphore_t v13 = v4;
  uint64_t v6 = v4;
  uint64_t v7 = [v5 beginMonitoringProviderDomainChangesWithHandler:&v8];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x263F054C8], "endMonitoringProviderDomainChanges:", v7, v8, v9, v10, v11, v12);
}

void __29__STFileProviderMonitor_sync__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 allValues];
  dispatch_semaphore_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEnabled", (void)v11)
          && [v10 supportsEnumeration]
          && [v10 isAvailableSystemWide]
          && ([v10 isHidden] & 1) == 0)
        {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) setFpDomains:v4];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (NSArray)fpDomains
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFpDomains:(id)a3
{
}

- (id)fpContext
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setFpContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fpContext, 0);

  objc_storeStrong((id *)&self->_fpDomains, 0);
}

@end