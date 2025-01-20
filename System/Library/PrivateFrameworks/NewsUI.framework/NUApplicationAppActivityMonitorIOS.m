@interface NUApplicationAppActivityMonitorIOS
- (NSHashTable)observers;
- (NSMutableSet)backgroundObserverBlocks;
- (NSMutableSet)foregroundObserverBlocks;
- (NSMutableSet)windowBackgroundObserverBlocks;
- (NSMutableSet)windowForegroundObserverBlocks;
- (NUApplicationAppActivityMonitorIOS)init;
- (int64_t)currentApplicationState;
- (void)_applicationWillTerminate;
- (void)_windowDidBecomeBackground;
- (void)_windowDidBecomeForeground;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)performOnApplicationDidEnterBackground:(id)a3;
- (void)performOnApplicationWillEnterForeground:(id)a3;
- (void)performOnApplicationWindowDidBecomeBackground:(id)a3;
- (void)performOnApplicationWindowDidBecomeForeground:(id)a3;
- (void)removeObserver:(id)a3;
- (void)sceneDidBecomeActive;
- (void)sceneDidBecomeActiveWithURL:(id)a3 sourceApplication:(id)a4 sceneID:(id)a5;
- (void)sceneDidEnterBackground;
- (void)sceneDidEnterBackgroundWithSceneID:(id)a3;
- (void)sceneWillConnect;
- (void)sceneWillEnterForeground;
- (void)sceneWillResignActiveWithSceneID:(id)a3;
@end

@implementation NUApplicationAppActivityMonitorIOS

- (NUApplicationAppActivityMonitorIOS)init
{
  v15.receiver = self;
  v15.super_class = (Class)NUApplicationAppActivityMonitorIOS;
  v2 = [(NUApplicationAppActivityMonitorIOS *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    backgroundObserverBlocks = v2->_backgroundObserverBlocks;
    v2->_backgroundObserverBlocks = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    foregroundObserverBlocks = v2->_foregroundObserverBlocks;
    v2->_foregroundObserverBlocks = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    windowBackgroundObserverBlocks = v2->_windowBackgroundObserverBlocks;
    v2->_windowBackgroundObserverBlocks = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    windowForegroundObserverBlocks = v2->_windowForegroundObserverBlocks;
    v2->_windowForegroundObserverBlocks = v11;

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v2 selector:sel__applicationWillTerminate name:*MEMORY[0x263F1D0E0] object:0];
  }
  return v2;
}

- (void)sceneWillConnect
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NUApplicationAppActivityMonitorIOS *)self observers];
  uint64_t v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 activityObservingApplicationDidFinishLaunching];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)sceneDidBecomeActive
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(NUApplicationAppActivityMonitorIOS *)self observers];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 activityObservingApplicationDidBecomeActive];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(NUApplicationAppActivityMonitorIOS *)self _windowDidBecomeForeground];
}

- (void)sceneDidBecomeActiveWithURL:(id)a3 sourceApplication:(id)a4 sceneID:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v18 = self;
  long long v11 = [(NUApplicationAppActivityMonitorIOS *)self observers];
  long long v12 = (void *)[v11 copy];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector()) {
          [v17 activityObservingApplicationDidBecomeActiveWithURL:v8 sourceApplication:v9 sceneID:v10];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  [(NUApplicationAppActivityMonitorIOS *)v18 _windowDidBecomeForeground];
}

- (void)sceneWillEnterForeground
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v3 = [(NUApplicationAppActivityMonitorIOS *)self observers];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 activityObservingApplicationWillEnterForeground];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v6);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = [(NUApplicationAppActivityMonitorIOS *)self foregroundObserverBlocks];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v26 + 1) + 8 * v14++) + 16))();
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v12);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v15 = [(NUApplicationAppActivityMonitorIOS *)self observers];
  uint64_t v16 = (void *)[v15 copy];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v22 + 1) + 8 * v20);
        if (objc_opt_respondsToSelector()) {
          [v21 activityObservingApplicationWindowWillBecomeForeground];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v18);
  }
}

- (void)_windowDidBecomeForeground
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(NUApplicationAppActivityMonitorIOS *)self observers];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 activityObservingApplicationWindowDidBecomeForeground];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = [(NUApplicationAppActivityMonitorIOS *)self windowForegroundObserverBlocks];
  uint64_t v11 = (void *)[v10 copy];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (NSMutableSet)windowForegroundObserverBlocks
{
  return self->_windowForegroundObserverBlocks;
}

- (NSMutableSet)foregroundObserverBlocks
{
  return self->_foregroundObserverBlocks;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(NUApplicationAppActivityMonitorIOS *)self observers];
  [v5 addObject:v4];
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NUApplicationAppActivityMonitorIOS;
  [(NUApplicationAppActivityMonitorIOS *)&v4 dealloc];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(NUApplicationAppActivityMonitorIOS *)self observers];
  [v5 removeObject:v4];
}

- (int64_t)currentApplicationState
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  int64_t v3 = [v2 applicationState];

  return v3;
}

- (void)sceneDidEnterBackground
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  [(NUApplicationAppActivityMonitorIOS *)self _windowDidBecomeBackground];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int64_t v3 = [(NUApplicationAppActivityMonitorIOS *)self backgroundObserverBlocks];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(NUApplicationAppActivityMonitorIOS *)self observers];
  id v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 activityObservingApplicationDidEnterBackground];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void)sceneDidEnterBackgroundWithSceneID:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NUApplicationAppActivityMonitorIOS *)self _windowDidBecomeBackground];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [(NUApplicationAppActivityMonitorIOS *)self backgroundObserverBlocks];
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
        (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * v9++) + 16))();
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
  uint64_t v10 = [(NUApplicationAppActivityMonitorIOS *)self observers];
  uint64_t v11 = (void *)[v10 copy];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 activityObservingApplicationDidEnterBackgroundWithSceneID:v4];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

- (void)sceneWillResignActiveWithSceneID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(NUApplicationAppActivityMonitorIOS *)self observers];
  uint64_t v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 activityObservingApplicationWillResignActiveWithSceneID:v4];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)performOnApplicationWillEnterForeground:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(NUApplicationAppActivityMonitorIOS *)self foregroundObserverBlocks];
    uint64_t v5 = (void *)[v4 copy];

    [v6 addObject:v5];
  }
}

- (void)performOnApplicationDidEnterBackground:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(NUApplicationAppActivityMonitorIOS *)self backgroundObserverBlocks];
    uint64_t v5 = (void *)[v4 copy];

    [v6 addObject:v5];
  }
}

- (void)performOnApplicationWindowDidBecomeBackground:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(NUApplicationAppActivityMonitorIOS *)self windowBackgroundObserverBlocks];
    uint64_t v5 = (void *)MEMORY[0x223C968A0](v4);

    [v6 addObject:v5];
  }
}

- (void)performOnApplicationWindowDidBecomeForeground:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(NUApplicationAppActivityMonitorIOS *)self windowForegroundObserverBlocks];
    uint64_t v5 = (void *)MEMORY[0x223C968A0](v4);

    [v6 addObject:v5];
  }
}

- (void)_windowDidBecomeBackground
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int64_t v3 = [(NUApplicationAppActivityMonitorIOS *)self observers];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 activityObservingApplicationWindowDidBecomeBackground];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [(NUApplicationAppActivityMonitorIOS *)self windowBackgroundObserverBlocks];
  uint64_t v11 = (void *)[v10 copy];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)_applicationWillTerminate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NUApplicationAppActivityMonitorIOS *)self observers];
  int64_t v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 activityObservingApplicationWillTerminate];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (NSMutableSet)backgroundObserverBlocks
{
  return self->_backgroundObserverBlocks;
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
}

@end