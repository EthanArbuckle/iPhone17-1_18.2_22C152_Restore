@interface SBApplicationShortcutStoreManager
+ (id)sharedManager;
- (SBApplicationShortcutStoreManager)init;
- (id)_stateLock_storeForBundleIdentifier:(id)a3;
- (id)applicationShortcutItemsForBundleIdentifier:(id)a3 withVersion:(unint64_t)a4;
- (void)_installedAppsDidChange:(id)a3;
- (void)dealloc;
- (void)invalidateCache;
- (void)saveSynchronously;
- (void)setApplicationShortcutItems:(id)a3 forBundleIdentifier:(id)a4 withVersion:(unint64_t)a5;
@end

@implementation SBApplicationShortcutStoreManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_394);
  }
  v2 = (void *)sharedManager___sharedManager;
  return v2;
}

- (void)setApplicationShortcutItems:(id)a3 forBundleIdentifier:(id)a4 withVersion:(unint64_t)a5
{
  if (a4)
  {
    v8 = (void *)MEMORY[0x1E4F1CA20];
    id v9 = a4;
    id v10 = a3;
    id v12 = [v8 preferredLanguages];
    [(NSLock *)self->_stateLock lock];
    v11 = [(SBApplicationShortcutStoreManager *)self _stateLock_storeForBundleIdentifier:v9];

    [v11 setApplicationShortcutItems:v10 withLanguages:v12 version:a5];
    [(NSLock *)self->_stateLock unlock];
  }
}

- (id)applicationShortcutItemsForBundleIdentifier:(id)a3 withVersion:(unint64_t)a4
{
  if (!a3)
  {
    v13 = 0;
    goto LABEL_9;
  }
  v6 = (void *)MEMORY[0x1E4F1CA20];
  id v7 = a3;
  v8 = [v6 preferredLanguages];
  [(NSLock *)self->_stateLock lock];
  id v9 = [(SBApplicationShortcutStoreManager *)self _stateLock_storeForBundleIdentifier:v7];

  id v10 = [v9 languages];
  if (![v10 isEqualToArray:v8])
  {

    goto LABEL_7;
  }
  uint64_t v11 = [v9 version];

  if (v11 != a4)
  {
LABEL_7:
    [v9 invalidateCache];
    v13 = 0;
    goto LABEL_8;
  }
  id v12 = [v9 applicationShortcutItems];
  v13 = (void *)[v12 copy];

LABEL_8:
  [(NSLock *)self->_stateLock unlock];

LABEL_9:
  return v13;
}

- (id)_stateLock_storeForBundleIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_storesKeyedByBundleIdentifier objectForKeyedSubscript:v4];
  if (!v5)
  {
    v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412546;
      id v9 = self;
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "%@: Creating store for bundle identifier: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    v5 = [[SBApplicationShortcutStore alloc] initWithBundleIdentifier:v4];
    [(NSMutableDictionary *)self->_storesKeyedByBundleIdentifier setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

void __50__SBApplicationShortcutStoreManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(SBApplicationShortcutStoreManager);
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;
}

- (SBApplicationShortcutStoreManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBApplicationShortcutStoreManager;
  v2 = [(SBApplicationShortcutStoreManager *)&v9 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    stateLock = v2->_stateLock;
    v2->_stateLock = v3;

    [(NSLock *)v2->_stateLock setName:@"com.apple.springboard.sbapplicationshortcutstoremanager"];
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    storesKeyedByBundleIdentifier = v2->_storesKeyedByBundleIdentifier;
    v2->_storesKeyedByBundleIdentifier = v5;

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__installedAppsDidChange_ name:@"SBInstalledApplicationsDidChangeNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBApplicationShortcutStoreManager;
  [(SBApplicationShortcutStoreManager *)&v4 dealloc];
}

- (void)invalidateCache
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    storesKeyedByBundleIdentifier = self->_storesKeyedByBundleIdentifier;
    *(_DWORD *)buf = 138412546;
    v16 = self;
    __int16 v17 = 2112;
    v18 = storesKeyedByBundleIdentifier;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "%@: Request to invalidate all stores immediately: %@", buf, 0x16u);
  }

  [(NSLock *)self->_stateLock lock];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = [(NSMutableDictionary *)self->_storesKeyedByBundleIdentifier allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) invalidateCache];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  +[SBApplicationShortcutStore clearStore];
  [(NSLock *)self->_stateLock unlock];
}

- (void)saveSynchronously
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    storesKeyedByBundleIdentifier = self->_storesKeyedByBundleIdentifier;
    *(_DWORD *)buf = 138412546;
    v16 = self;
    __int16 v17 = 2112;
    v18 = storesKeyedByBundleIdentifier;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "%@: Request to save all stores immediately: %@", buf, 0x16u);
  }

  [(NSLock *)self->_stateLock lock];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = [(NSMutableDictionary *)self->_storesKeyedByBundleIdentifier allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) saveSynchronously];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NSLock *)self->_stateLock unlock];
}

- (void)_installedAppsDidChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [a3 userInfo];
  v5 = [v4 objectForKey:@"SBInstalledApplicationsRemovedBundleIDs"];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v12 = SBLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v18 = self;
          __int16 v19 = 2114;
          uint64_t v20 = v11;
          _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "%@: Removing shortcut items for %{public}@ because it was uninstalled", buf, 0x16u);
        }

        [(SBApplicationShortcutStoreManager *)self setApplicationShortcutItems:0 forBundleIdentifier:v11 withVersion:0];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storesKeyedByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end