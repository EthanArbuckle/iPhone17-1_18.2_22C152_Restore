@interface SiriUICardLoadingMonitor
+ (id)sharedInstance;
- (BOOL)isTrackingObserver:(id)a3;
- (SiriUICardLoadingMonitor)init;
- (void)addObserver:(id)a3;
- (void)broadcastCardSnippet:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation SiriUICardLoadingMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sCardLoadingMonitor;
  return v2;
}

uint64_t __42__SiriUICardLoadingMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SiriUICardLoadingMonitor);
  uint64_t v1 = sharedInstance_sCardLoadingMonitor;
  sharedInstance_sCardLoadingMonitor = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SiriUICardLoadingMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)SiriUICardLoadingMonitor;
  v2 = [(SiriUICardLoadingMonitor *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    observers = v2->_observers;
    v2->_observers = v3;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (!-[SiriUICardLoadingMonitor isTrackingObserver:](self, "isTrackingObserver:")) {
    [(NSMutableArray *)self->_observers addObject:v4];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (-[SiriUICardLoadingMonitor isTrackingObserver:](self, "isTrackingObserver:")) {
    [(NSMutableArray *)self->_observers removeObject:v4];
  }
}

- (BOOL)isTrackingObserver:(id)a3
{
  return [(NSMutableArray *)self->_observers containsObject:a3];
}

- (void)broadcastCardSnippet:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_observers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "cardLoadingMonitor:didReceiveCardSnippet:", self, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end