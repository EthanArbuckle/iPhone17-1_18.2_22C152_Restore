@interface NUApplicationAppActivityMonitorMacOS
- (BOOL)isBecomingActive;
- (BOOL)isWindowForeground;
- (NSHashTable)observers;
- (NSMutableSet)backgroundObserverBlocks;
- (NSMutableSet)foregroundObserverBlocks;
- (NSMutableSet)windowBackgroundObserverBlocks;
- (NSMutableSet)windowForegroundObserverBlocks;
- (NSNotificationCenter)notificationCenter;
- (NSString)windowBecameFrontmostNotificationName;
- (NSString)windowLostFrontmostNotificationName;
- (NUApplicationAppActivityMonitorMacOS)initWithNotificationCenter:(id)a3 windowBecameFrontmostNotificationName:(id)a4 windowLostFrontmostNotificationName:(id)a5;
- (int64_t)currentApplicationState;
- (void)_applicationWillTerminate;
- (void)_markWindowAsBackground;
- (void)_markWindowAsForeground;
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
- (void)setBecomingActive:(BOOL)a3;
- (void)setWindowIsForeground:(BOOL)a3;
@end

@implementation NUApplicationAppActivityMonitorMacOS

- (NUApplicationAppActivityMonitorMacOS)initWithNotificationCenter:(id)a3 windowBecameFrontmostNotificationName:(id)a4 windowLostFrontmostNotificationName:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NUApplicationAppActivityMonitorMacOS;
  v9 = [(NUApplicationAppActivityMonitorMacOS *)&v21 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    backgroundObserverBlocks = v9->_backgroundObserverBlocks;
    v9->_backgroundObserverBlocks = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    foregroundObserverBlocks = v9->_foregroundObserverBlocks;
    v9->_foregroundObserverBlocks = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    windowBackgroundObserverBlocks = v9->_windowBackgroundObserverBlocks;
    v9->_windowBackgroundObserverBlocks = v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    windowForegroundObserverBlocks = v9->_windowForegroundObserverBlocks;
    v9->_windowForegroundObserverBlocks = v18;

    [(NSNotificationCenter *)v9->_notificationCenter addObserver:v9 selector:sel__applicationWillTerminate name:*MEMORY[0x263F1D0E0] object:0];
    [(NSNotificationCenter *)v9->_notificationCenter addObserver:v9 selector:sel__markWindowAsForeground name:v7 object:0];
    [(NSNotificationCenter *)v9->_notificationCenter addObserver:v9 selector:sel__markWindowAsBackground name:v8 object:0];
  }

  return v9;
}

- (void)dealloc
{
  v3 = [(NUApplicationAppActivityMonitorMacOS *)self notificationCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NUApplicationAppActivityMonitorMacOS;
  [(NUApplicationAppActivityMonitorMacOS *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(NUApplicationAppActivityMonitorMacOS *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(NUApplicationAppActivityMonitorMacOS *)self observers];
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
  [(NUApplicationAppActivityMonitorMacOS *)self _markWindowAsBackground];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int64_t v3 = [(NUApplicationAppActivityMonitorMacOS *)self backgroundObserverBlocks];
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
  id v8 = [(NUApplicationAppActivityMonitorMacOS *)self observers];
  v9 = (void *)[v8 copy];

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
        v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
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
  [(NUApplicationAppActivityMonitorMacOS *)self _markWindowAsBackground];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [(NUApplicationAppActivityMonitorMacOS *)self backgroundObserverBlocks];
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
  uint64_t v10 = [(NUApplicationAppActivityMonitorMacOS *)self observers];
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
  long long v18 = self;
  uint64_t v11 = [(NUApplicationAppActivityMonitorMacOS *)self observers];
  uint64_t v12 = (void *)[v11 copy];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v17 activityObservingApplicationDidBecomeActiveWithURL:v8 sourceApplication:v9 sceneID:v10];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  if ([(NUApplicationAppActivityMonitorMacOS *)v18 isBecomingActive])
  {
    [(NUApplicationAppActivityMonitorMacOS *)v18 setBecomingActive:0];
    [(NUApplicationAppActivityMonitorMacOS *)v18 _markWindowAsForeground];
  }
}

- (void)sceneDidBecomeActive
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v3 = [(NUApplicationAppActivityMonitorMacOS *)self observers];
  id v4 = (void *)[v3 copy];

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
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
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

  if ([(NUApplicationAppActivityMonitorMacOS *)self isBecomingActive])
  {
    [(NUApplicationAppActivityMonitorMacOS *)self setBecomingActive:0];
    [(NUApplicationAppActivityMonitorMacOS *)self _markWindowAsForeground];
  }
}

- (void)sceneWillEnterForeground
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int64_t v3 = [(NUApplicationAppActivityMonitorMacOS *)self observers];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 activityObservingApplicationWillEnterForeground];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v10 = [(NUApplicationAppActivityMonitorMacOS *)self foregroundObserverBlocks];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v14++) + 16))();
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  [(NUApplicationAppActivityMonitorMacOS *)self setBecomingActive:1];
}

- (void)sceneWillConnect
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NUApplicationAppActivityMonitorMacOS *)self observers];
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

- (void)sceneWillResignActiveWithSceneID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(NUApplicationAppActivityMonitorMacOS *)self observers];
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
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
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
    id v6 = [(NUApplicationAppActivityMonitorMacOS *)self foregroundObserverBlocks];
    uint64_t v5 = (void *)[v4 copy];

    [v6 addObject:v5];
  }
}

- (void)performOnApplicationDidEnterBackground:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(NUApplicationAppActivityMonitorMacOS *)self backgroundObserverBlocks];
    uint64_t v5 = (void *)[v4 copy];

    [v6 addObject:v5];
  }
}

- (void)performOnApplicationWindowDidBecomeBackground:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(NUApplicationAppActivityMonitorMacOS *)self windowBackgroundObserverBlocks];
    uint64_t v5 = (void *)MEMORY[0x223C968A0](v4);

    [v6 addObject:v5];
  }
}

- (void)performOnApplicationWindowDidBecomeForeground:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(NUApplicationAppActivityMonitorMacOS *)self windowForegroundObserverBlocks];
    uint64_t v5 = (void *)MEMORY[0x223C968A0](v4);

    [v6 addObject:v5];
  }
}

- (void)_markWindowAsForeground
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (![(NUApplicationAppActivityMonitorMacOS *)self isWindowForeground]
    && ![(NUApplicationAppActivityMonitorMacOS *)self isBecomingActive])
  {
    [(NUApplicationAppActivityMonitorMacOS *)self setWindowIsForeground:1];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    int64_t v3 = [(NUApplicationAppActivityMonitorMacOS *)self observers];
    id v4 = (void *)[v3 copy];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v32;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v32 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 activityObservingApplicationWindowWillBecomeForeground];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v6);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v10 = [(NUApplicationAppActivityMonitorMacOS *)self observers];
    long long v11 = (void *)[v10 copy];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            [v16 activityObservingApplicationWindowDidBecomeForeground];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v13);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v17 = [(NUApplicationAppActivityMonitorMacOS *)self windowForegroundObserverBlocks];
    long long v18 = (void *)[v17 copy];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v18);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v23 + 1) + 8 * v22++) + 16))();
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v20);
    }
  }
}

- (void)_markWindowAsBackground
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(NUApplicationAppActivityMonitorMacOS *)self isWindowForeground])
  {
    [(NUApplicationAppActivityMonitorMacOS *)self setWindowIsForeground:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int64_t v3 = [(NUApplicationAppActivityMonitorMacOS *)self observers];
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
    uint64_t v10 = [(NUApplicationAppActivityMonitorMacOS *)self windowBackgroundObserverBlocks];
    long long v11 = (void *)[v10 copy];

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
}

- (void)_applicationWillTerminate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NUApplicationAppActivityMonitorMacOS *)self observers];
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

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSString)windowBecameFrontmostNotificationName
{
  return self->_windowBecameFrontmostNotificationName;
}

- (NSString)windowLostFrontmostNotificationName
{
  return self->_windowLostFrontmostNotificationName;
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

- (BOOL)isWindowForeground
{
  return self->_windowIsForeground;
}

- (void)setWindowIsForeground:(BOOL)a3
{
  self->_windowIsForeground = a3;
}

- (BOOL)isBecomingActive
{
  return self->_becomingActive;
}

- (void)setBecomingActive:(BOOL)a3
{
  self->_becomingActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowBackgroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_windowForegroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_backgroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_foregroundObserverBlocks, 0);
  objc_storeStrong((id *)&self->_windowLostFrontmostNotificationName, 0);
  objc_storeStrong((id *)&self->_windowBecameFrontmostNotificationName, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end