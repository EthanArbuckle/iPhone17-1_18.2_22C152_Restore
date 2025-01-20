@interface SRUIFCardLoadingMonitor
+ (id)sharedInstance;
- (BOOL)isTrackingObserver:(id)a3;
- (SRUIFCardLoadingMonitor)init;
- (void)addObserver:(id)a3;
- (void)broadcastCardSnippet:(id)a3;
- (void)broadcastVisualResponseSnippet:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation SRUIFCardLoadingMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_sCardLoadingMonitor;
  return v2;
}

uint64_t __41__SRUIFCardLoadingMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sCardLoadingMonitor = objc_alloc_init(SRUIFCardLoadingMonitor);
  return MEMORY[0x270F9A758]();
}

- (SRUIFCardLoadingMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRUIFCardLoadingMonitor;
  v2 = [(SRUIFCardLoadingMonitor *)&v6 init];
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
  if (!-[SRUIFCardLoadingMonitor isTrackingObserver:](self, "isTrackingObserver:")) {
    [(NSMutableArray *)self->_observers addObject:v4];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (-[SRUIFCardLoadingMonitor isTrackingObserver:](self, "isTrackingObserver:")) {
    [(NSMutableArray *)self->_observers removeObject:v4];
  }
}

- (BOOL)isTrackingObserver:(id)a3
{
  return [(NSMutableArray *)self->_observers containsObject:a3];
}

- (void)broadcastCardSnippet:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_observers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "cardLoadingMonitor:didReceiveCardSnippet:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)broadcastVisualResponseSnippet:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_observers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "cardLoadingMonitor:didReceiveVisualResponseSnippet:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end