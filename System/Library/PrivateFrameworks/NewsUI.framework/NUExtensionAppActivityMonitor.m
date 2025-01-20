@interface NUExtensionAppActivityMonitor
- (NSHashTable)observers;
- (NSMutableSet)backgroundObserverBlocks;
- (NSMutableSet)foregroundObserverBlocks;
- (NSMutableSet)windowBackgroundObserverBlocks;
- (NSMutableSet)windowForegroundObserverBlocks;
- (NSNotificationCenter)notificationCenter;
- (NUExtensionAppActivityMonitor)initWithNotificationCenter:(id)a3;
- (int64_t)currentApplicationState;
- (void)addObserver:(id)a3;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)applicationWillEnterForegroundNotification:(id)a3;
- (void)dealloc;
- (void)performOnApplicationDidEnterBackground:(id)a3;
- (void)performOnApplicationWillEnterForeground:(id)a3;
- (void)performOnApplicationWindowDidBecomeBackground:(id)a3;
- (void)performOnApplicationWindowDidBecomeForeground:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NUExtensionAppActivityMonitor

- (NUExtensionAppActivityMonitor)initWithNotificationCenter:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NUExtensionAppActivityMonitor;
  v6 = [(NUExtensionAppActivityMonitor *)&v18 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    backgroundObserverBlocks = v6->_backgroundObserverBlocks;
    v6->_backgroundObserverBlocks = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    foregroundObserverBlocks = v6->_foregroundObserverBlocks;
    v6->_foregroundObserverBlocks = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    windowBackgroundObserverBlocks = v6->_windowBackgroundObserverBlocks;
    v6->_windowBackgroundObserverBlocks = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    windowForegroundObserverBlocks = v6->_windowForegroundObserverBlocks;
    v6->_windowForegroundObserverBlocks = v15;

    objc_storeStrong((id *)&v6->_notificationCenter, a3);
    [(NSNotificationCenter *)v6->_notificationCenter addObserver:v6 selector:sel_applicationWillEnterForegroundNotification_ name:*MEMORY[0x263F07FD0] object:0];
    [(NSNotificationCenter *)v6->_notificationCenter addObserver:v6 selector:sel_applicationDidEnterBackgroundNotification_ name:*MEMORY[0x263F07FC8] object:0];
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(NUExtensionAppActivityMonitor *)self notificationCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NUExtensionAppActivityMonitor;
  [(NUExtensionAppActivityMonitor *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(NUExtensionAppActivityMonitor *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(NUExtensionAppActivityMonitor *)self observers];
  [v5 removeObject:v4];
}

- (int64_t)currentApplicationState
{
  return 2;
}

- (void)performOnApplicationWillEnterForeground:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(NUExtensionAppActivityMonitor *)self foregroundObserverBlocks];
    id v5 = (void *)[v4 copy];

    [v6 addObject:v5];
  }
}

- (void)performOnApplicationDidEnterBackground:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(NUExtensionAppActivityMonitor *)self backgroundObserverBlocks];
    id v5 = (void *)[v4 copy];

    [v6 addObject:v5];
  }
}

- (void)performOnApplicationWindowDidBecomeBackground:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(NUExtensionAppActivityMonitor *)self windowBackgroundObserverBlocks];
    id v5 = (void *)MEMORY[0x223C968A0](v4);

    [v6 addObject:v5];
  }
}

- (void)performOnApplicationWindowDidBecomeForeground:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(NUExtensionAppActivityMonitor *)self windowForegroundObserverBlocks];
    id v5 = (void *)MEMORY[0x223C968A0](v4);

    [v6 addObject:v5];
  }
}

- (void)applicationWillEnterForegroundNotification:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v4 = [(NUExtensionAppActivityMonitor *)self observers];
  id v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v44;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v43 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 activityObservingApplicationDidBecomeActive];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v7);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v11 = [(NUExtensionAppActivityMonitor *)self observers];
  v12 = (void *)[v11 copy];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v39 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector()) {
          [v17 activityObservingApplicationWillEnterForeground];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v14);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  objc_super v18 = [(NUExtensionAppActivityMonitor *)self observers];
  v19 = (void *)[v18 copy];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v36;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v35 + 1) + 8 * v23);
        if (objc_opt_respondsToSelector()) {
          [v24 activityObservingApplicationWindowDidBecomeForeground];
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v21);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v25 = [(NUExtensionAppActivityMonitor *)self windowForegroundObserverBlocks];
  v26 = (void *)[v25 copy];

  uint64_t v27 = [v26 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v31 + 1) + 8 * v30++) + 16))();
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v47 count:16];
    }
    while (v28);
  }
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(NUExtensionAppActivityMonitor *)self observers];
  id v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 activityObservingApplicationDidEnterBackground];
        }
        if (objc_opt_respondsToSelector()) {
          [v10 activityObservingApplicationWindowDidBecomeBackground];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = [(NUExtensionAppActivityMonitor *)self windowBackgroundObserverBlocks];
  v12 = (void *)[v11 copy];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v16++) + 16))();
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSMutableSet)foregroundObserverBlocks
{
  return self->_foregroundObserverBlocks;
}

- (NSMutableSet)backgroundObserverBlocks
{
  return self->_backgroundObserverBlocks;
}

- (NSMutableSet)windowForegroundObserverBlocks
{
  return self->_windowForegroundObserverBlocks;
}

- (NSMutableSet)windowBackgroundObserverBlocks
{
  return self->_windowBackgroundObserverBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowBackgroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_windowForegroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_backgroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_foregroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end