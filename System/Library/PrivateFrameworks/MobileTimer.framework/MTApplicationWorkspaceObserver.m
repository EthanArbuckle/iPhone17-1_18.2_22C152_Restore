@interface MTApplicationWorkspaceObserver
+ (MTApplicationWorkspaceObserver)sharedWorkspaceObserver;
- (BOOL)isApplicationInstalledForBundleIdentifier:(id)a3;
- (BOOL)isApplicationInstalledForBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4;
- (BOOL)isObserving;
- (LSApplicationWorkspace)applicationWorkspace;
- (MTApplicationWorkspaceObserver)init;
- (NSMutableDictionary)observersForBundleID;
- (OS_dispatch_queue)observerQueue;
- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setApplicationWorkspace:(id)a3;
- (void)setObserverQueue:(id)a3;
- (void)setObserversForBundleID:(id)a3;
- (void)setObserving:(BOOL)a3;
@end

@implementation MTApplicationWorkspaceObserver

void __66__MTApplicationWorkspaceObserver_addObserver_forBundleIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observersForBundleID];
  id v5 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  v3 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v4 = [*(id *)(a1 + 32) observersForBundleID];
    [v4 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];

    v3 = v6;
  }
  id v7 = v3;
  [v3 addObject:*(void *)(a1 + 48)];
  if (([*(id *)(a1 + 32) isObserving] & 1) == 0)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "addObserver:");
    [*(id *)(a1 + 32) setObserving:1];
  }
}

- (NSMutableDictionary)observersForBundleID
{
  return self->_observersForBundleID;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (BOOL)isObserving
{
  return self->_observing;
}

uint64_t __57__MTApplicationWorkspaceObserver_sharedWorkspaceObserver__block_invoke()
{
  sharedWorkspaceObserver_instance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (MTApplicationWorkspaceObserver)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTApplicationWorkspaceObserver;
  v2 = [(MTApplicationWorkspaceObserver *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MobileTimer.MTApplicationWorkspaceObserverQueue", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersForBundleID = v2->_observersForBundleID;
    v2->_observersForBundleID = v5;

    uint64_t v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    applicationWorkspace = v2->_applicationWorkspace;
    v2->_applicationWorkspace = (LSApplicationWorkspace *)v7;
  }
  return v2;
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTApplicationWorkspaceObserver *)self observerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MTApplicationWorkspaceObserver_addObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E5915078;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

+ (MTApplicationWorkspaceObserver)sharedWorkspaceObserver
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MTApplicationWorkspaceObserver_sharedWorkspaceObserver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedWorkspaceObserver_onceToken != -1) {
    dispatch_once(&sharedWorkspaceObserver_onceToken, block);
  }
  v2 = (void *)sharedWorkspaceObserver_instance;
  return (MTApplicationWorkspaceObserver *)v2;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(MTApplicationWorkspaceObserver *)self observerQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__MTApplicationWorkspaceObserver_removeObserver___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __49__MTApplicationWorkspaceObserver_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  dispatch_queue_t v3 = [*(id *)(a1 + 32) observersForBundleID];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__MTApplicationWorkspaceObserver_removeObserver___block_invoke_2;
  v18[3] = &unk_1E5917E60;
  id v19 = *(id *)(a1 + 40);
  id v4 = v2;
  id v20 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v18];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        v11 = objc_msgSend(*(id *)(a1 + 32), "observersForBundleID", (void)v14);
        [v11 removeObjectForKey:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v21 count:16];
    }
    while (v7);
  }

  id v12 = [*(id *)(a1 + 32) observersForBundleID];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObserver:");
    [*(id *)(a1 + 32) setObserving:0];
  }
}

void __49__MTApplicationWorkspaceObserver_removeObserver___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  [v6 removeObject:v5];
  uint64_t v7 = [v6 count];

  if (!v7) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (BOOL)isApplicationInstalledForBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v18 = 0;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:v4 error:&v18];
  id v8 = v18;
  uint64_t v9 = v8;
  if (v7)
  {
    uint64_t v10 = [v7 applicationState];
    if ([v10 isValid])
    {
      v11 = [v7 applicationState];
      char v12 = [v11 isInstalled];
      char v13 = v4 | v12;
      if (v4 && (v12 & 1) == 0)
      {
        long long v14 = [v7 applicationState];
        char v13 = [v14 isPlaceholder];
      }
      goto LABEL_14;
    }
LABEL_13:
    char v13 = 0;
LABEL_14:

    goto LABEL_15;
  }
  if (v8)
  {
    if ([v8 code] != -10814
      || ([v9 domain],
          long long v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 isEqualToString:*MEMORY[0x1E4F28760]],
          v15,
          (v16 & 1) == 0))
    {
      uint64_t v10 = MTLogForCategory(4);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v20 = self;
        __int16 v21 = 2114;
        id v22 = v6;
        __int16 v23 = 2114;
        v24 = v9;
        _os_log_error_impl(&dword_19CC95000, v10, OS_LOG_TYPE_ERROR, "%{public}@ unexpected error getting bundle identifier for %{public}@: %{public}@", buf, 0x20u);
      }
      goto LABEL_13;
    }
  }
  char v13 = 0;
LABEL_15:

  return v13;
}

- (BOOL)isApplicationInstalledForBundleIdentifier:(id)a3
{
  return [(MTApplicationWorkspaceObserver *)self isApplicationInstalledForBundleIdentifier:a3 allowPlaceholder:1];
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTApplicationWorkspaceObserver *)self observerQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__MTApplicationWorkspaceObserver_applicationsDidInstall___block_invoke;
  v7[3] = &unk_1E5915000;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__MTApplicationWorkspaceObserver_applicationsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v14)
  {
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v1 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(obj);
        }
        v2 = [*(id *)(*((void *)&v19 + 1) + 8 * v1) bundleIdentifier];
        dispatch_queue_t v3 = [*(id *)(a1 + 40) observersForBundleID];
        id v4 = [v3 objectForKeyedSubscript:v2];

        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v5 = [v4 objectEnumerator];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v16;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
              if (objc_opt_respondsToSelector()) {
                [v10 observedApplicationDidInstallForBundleIdentifier:v2];
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v7);
        }

        ++v1;
      }
      while (v1 != v14);
      uint64_t v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTApplicationWorkspaceObserver *)self observerQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__MTApplicationWorkspaceObserver_applicationsDidUninstall___block_invoke;
  v7[3] = &unk_1E5915000;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__MTApplicationWorkspaceObserver_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v14)
  {
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v1 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(obj);
        }
        v2 = [*(id *)(*((void *)&v19 + 1) + 8 * v1) bundleIdentifier];
        dispatch_queue_t v3 = [*(id *)(a1 + 40) observersForBundleID];
        id v4 = [v3 objectForKeyedSubscript:v2];

        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v5 = [v4 objectEnumerator];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v16;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
              if (objc_opt_respondsToSelector()) {
                [v10 observedApplicationDidUninstallForBundleIdentifier:v2];
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v7);
        }

        ++v1;
      }
      while (v1 != v14);
      uint64_t v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }
}

- (void)setObserverQueue:(id)a3
{
}

- (LSApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (void)setApplicationWorkspace:(id)a3
{
}

- (void)setObserversForBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersForBundleID, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
}

@end