@interface SBApplicationShortcutStore
+ (void)clearStore;
- (BOOL)_stateLock_truncateIfNeeded:(id)a3;
- (NSArray)applicationShortcutItems;
- (NSArray)languages;
- (NSString)bundleIdentifier;
- (SBApplicationShortcutStore)initWithBundleIdentifier:(id)a3;
- (id)_applicationShortcutItemsFromPlistArray:(id)a3;
- (id)_plistArrayFromApplicationShortcutItems:(id)a3;
- (id)description;
- (unint64_t)version;
- (void)_saveQueue_save;
- (void)_stateLock_loadFromStoreIfNeeded;
- (void)_stateLock_markDirty;
- (void)invalidateCache;
- (void)saveSynchronously;
- (void)setApplicationShortcutItems:(id)a3 withLanguages:(id)a4 version:(unint64_t)a5;
- (void)truncateIfNecessary;
@end

@implementation SBApplicationShortcutStore

uint64_t __50__SBApplicationShortcutStore__stateLock_markDirty__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveQueue_save");
}

- (void)setApplicationShortcutItems:(id)a3 withLanguages:(id)a4 version:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  [(NSLock *)self->_stateLock lock];
  [(SBApplicationShortcutStore *)self _stateLock_loadFromStoreIfNeeded];
  if (self->_isLoaded) {
    goto LABEL_7;
  }
  v11 = SBLogAppShortcuts();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[SBApplicationShortcutStore setApplicationShortcutItems:withLanguages:version:](self);
  }

  if (self->_isLoaded)
  {
LABEL_7:
    if (![v9 isEqualToArray:self->_cachedApplicationShortcutItems]
      || ![v10 isEqualToArray:self->_cachedLanguages]
      || self->_cachedVersion != a5)
    {
      objc_storeStrong((id *)&self->_cachedApplicationShortcutItems, a3);
      objc_storeStrong((id *)&self->_cachedLanguages, a4);
      self->_cachedVersion = a5;
      v12 = SBLogAppShortcuts();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(SBApplicationShortcutStore *)self bundleIdentifier];
        int v14 = 138543362;
        v15 = v13;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating app shortcut store...", (uint8_t *)&v14, 0xCu);
      }
      [(SBApplicationShortcutStore *)self _stateLock_markDirty];
    }
  }
  [(NSLock *)self->_stateLock unlock];
}

- (unint64_t)version
{
  [(NSLock *)self->_stateLock lock];
  [(SBApplicationShortcutStore *)self _stateLock_loadFromStoreIfNeeded];
  unint64_t cachedVersion = self->_cachedVersion;
  [(NSLock *)self->_stateLock unlock];
  return cachedVersion;
}

- (NSArray)languages
{
  [(NSLock *)self->_stateLock lock];
  [(SBApplicationShortcutStore *)self _stateLock_loadFromStoreIfNeeded];
  v3 = (void *)[(NSArray *)self->_cachedLanguages copy];
  [(NSLock *)self->_stateLock unlock];
  return (NSArray *)v3;
}

- (NSArray)applicationShortcutItems
{
  [(NSLock *)self->_stateLock lock];
  [(SBApplicationShortcutStore *)self _stateLock_loadFromStoreIfNeeded];
  v3 = (void *)[(NSArray *)self->_cachedApplicationShortcutItems copy];
  [(NSLock *)self->_stateLock unlock];
  return (NSArray *)v3;
}

- (void)_stateLock_loadFromStoreIfNeeded
{
  v1 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%{public}@: Unexpected data from store: %@", v4, v5, v6, v7, v8);
}

- (void)_stateLock_markDirty
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_isDirty)
  {
    self->_isDirty = 1;
    uint64_t v3 = SBLogAppShortcuts();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = [(SBApplicationShortcutStore *)self bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      uint8_t v8 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "%{public}@: Marking as dirty...", buf, 0xCu);
    }
    saveQueue = self->_saveQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__SBApplicationShortcutStore__stateLock_markDirty__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(saveQueue, block);
  }
}

- (void)_saveQueue_save
{
  v24[2] = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_stateLock lock];
  uint64_t v4 = SBLogAppShortcuts();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(SBApplicationShortcutStore *)self bundleIdentifier];
    int v17 = 138543362;
    v18 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving...", (uint8_t *)&v17, 0xCu);
  }
  if (self->_isDirty && self->_isLoaded)
  {
    uint64_t v6 = NSStringFromSelector(a2);
    [(SBApplicationShortcutStore *)self _stateLock_truncateIfNeeded:v6];

    uint64_t v7 = [(SBApplicationShortcutStore *)self _plistArrayFromApplicationShortcutItems:self->_cachedApplicationShortcutItems];
    if ([v7 count])
    {
      v23[1] = @"version";
      v24[0] = v7;
      v23[0] = @"applicationShortcutItems";
      uint8_t v8 = [NSNumber numberWithUnsignedInteger:self->_cachedVersion];
      v24[1] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

      cachedLanguages = self->_cachedLanguages;
      if (cachedLanguages)
      {
        v21 = @"languages";
        v22 = cachedLanguages;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        uint64_t v12 = objc_msgSend(v9, "bs_dictionaryByAddingEntriesFromDictionary:", v11);

        uint64_t v9 = (void *)v12;
      }
      v13 = SBLogAppShortcuts();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = [(SBApplicationShortcutStore *)self bundleIdentifier];
        NSUInteger v15 = [(NSArray *)self->_cachedApplicationShortcutItems count];
        int v17 = 138543618;
        v18 = v14;
        __int16 v19 = 2048;
        NSUInteger v20 = v15;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_INFO, "%{public}@: Committing app shortcut store w/ %lu shortcuts", (uint8_t *)&v17, 0x16u);
      }
      [(FBSApplicationDataStore *)self->_dataStore setArchivedObject:v9 forKey:@"SBApplicationShortcutItems"];
      [MEMORY[0x1E4F628D8] synchronize];
    }
    self->_isDirty = 0;
  }
  else
  {
    uint64_t v7 = SBLogAppShortcuts();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(SBApplicationShortcutStore *)self bundleIdentifier];
      int v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring save request because not dirty", (uint8_t *)&v17, 0xCu);
    }
  }

  [(NSLock *)self->_stateLock unlock];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)_stateLock_truncateIfNeeded:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_isLoaded)
  {
    p_super = SBLogAppShortcuts();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(SBApplicationShortcutStore *)self bundleIdentifier];
      int v19 = 138543362;
      NSUInteger v20 = v10;
      _os_log_impl(&dword_1D85BA000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@: SBApplicationShortcutStore cannot truncate; data isn't loaded.",
        (uint8_t *)&v19,
        0xCu);
    }
    goto LABEL_15;
  }
  unint64_t v5 = [(NSArray *)self->_cachedApplicationShortcutItems count];
  p_super = SBLogAppShortcuts();
  BOOL v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (v5 <= 0xA)
  {
    if (v7)
    {
      uint8_t v8 = [(SBApplicationShortcutStore *)self bundleIdentifier];
      NSUInteger v9 = [(NSArray *)self->_cachedApplicationShortcutItems count];
      int v19 = 138543874;
      NSUInteger v20 = v8;
      __int16 v21 = 2112;
      id v22 = v4;
      __int16 v23 = 2048;
      NSUInteger v24 = v9;
      _os_log_impl(&dword_1D85BA000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@: SBApplicationShortcutStore doesn't need truncation (truncation reason: %@); there are %ld applicatio"
        "n shortcut items.",
        (uint8_t *)&v19,
        0x20u);
    }
LABEL_15:
    BOOL v15 = 0;
    goto LABEL_19;
  }
  if (v7)
  {
    v11 = [(SBApplicationShortcutStore *)self bundleIdentifier];
    NSUInteger v12 = [(NSArray *)self->_cachedApplicationShortcutItems count];
    int v19 = 138543874;
    NSUInteger v20 = v11;
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2048;
    NSUInteger v24 = v12;
    _os_log_impl(&dword_1D85BA000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@: SBApplicationShortcutStore needs truncation (truncation reason: %@); there are %ld application shortcut items.",
      (uint8_t *)&v19,
      0x20u);
  }
  if (_stateLock_truncateIfNeeded__onceToken != -1) {
    dispatch_once(&_stateLock_truncateIfNeeded__onceToken, &__block_literal_global_359);
  }
  if (_stateLock_truncateIfNeeded__isInternalInstall)
  {
    v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v14 = [v13 BOOLForKey:@"SBSuppressAppShortcutTruncation"];

    if (v14)
    {
      p_super = SBLogAppShortcuts();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
        -[SBApplicationShortcutStore _stateLock_truncateIfNeeded:](self, p_super);
      }
      goto LABEL_15;
    }
  }
  uint64_t v16 = SBLogAppShortcuts();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    [(SBApplicationShortcutStore *)self _stateLock_truncateIfNeeded:v16];
  }

  -[NSArray subarrayWithRange:](self->_cachedApplicationShortcutItems, "subarrayWithRange:", 0, 10);
  int v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  p_super = &self->_cachedApplicationShortcutItems->super;
  self->_cachedApplicationShortcutItems = v17;
  BOOL v15 = 1;
LABEL_19:

  return v15;
}

- (id)_plistArrayFromApplicationShortcutItems:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

  unint64_t v5 = BSDeserializeCFValueFromXPCDictionaryWithKey();

  return v5;
}

+ (void)clearStore
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F628D8], "applicationsWithAvailableStores", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = [MEMORY[0x1E4F628D8] storeForApplication:*(void *)(*((void *)&v8 + 1) + 8 * v6)];
        [v7 removeObjectForKey:@"SBApplicationShortcutItems"];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (SBApplicationShortcutStore)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBApplicationShortcutStore;
  uint64_t v5 = [(SBApplicationShortcutStore *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x1E4F628D8] storeForApplication:v5->_bundleIdentifier];
    dataStore = v5->_dataStore;
    v5->_dataStore = (FBSApplicationDataStore *)v8;

    long long v10 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    stateLock = v5->_stateLock;
    v5->_stateLock = v10;

    [(NSLock *)v5->_stateLock setName:@"com.apple.springboard.sbapplicationshortcutstore"];
    uint64_t Serial = BSDispatchQueueCreateSerial();
    saveQueue = v5->_saveQueue;
    v5->_saveQueue = (OS_dispatch_queue *)Serial;
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(SBApplicationShortcutStore *)self bundleIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"bundleIdentifier"];

  if (self->_isLoaded)
  {
    id v6 = (id)[v3 appendObject:self->_cachedLanguages withName:@"languages"];
    id v7 = (id)[v3 appendObject:self->_cachedApplicationShortcutItems withName:@"applicationShortcutItems"];
    id v8 = (id)[v3 appendInteger:self->_cachedVersion withName:@"version"];
    id v9 = (id)[v3 appendBool:self->_isDirty withName:@"isDirty"];
  }
  long long v10 = [v3 build];

  return v10;
}

- (void)invalidateCache
{
  [(NSLock *)self->_stateLock lock];
  self->_isLoaded = 0;
  cachedApplicationShortcutItems = self->_cachedApplicationShortcutItems;
  self->_cachedApplicationShortcutItems = 0;

  cachedLanguages = self->_cachedLanguages;
  self->_cachedLanguages = 0;

  self->_unint64_t cachedVersion = 0;
  stateLock = self->_stateLock;
  [(NSLock *)stateLock unlock];
}

- (void)saveSynchronously
{
  saveQueue = self->_saveQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SBApplicationShortcutStore_saveSynchronously__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_sync(saveQueue, block);
}

uint64_t __47__SBApplicationShortcutStore_saveSynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveQueue_save");
}

- (void)truncateIfNecessary
{
  [(NSLock *)self->_stateLock lock];
  [(SBApplicationShortcutStore *)self _stateLock_loadFromStoreIfNeeded];
  if ([(SBApplicationShortcutStore *)self _stateLock_truncateIfNeeded:@"truncateIfNeeded"])
  {
    [(SBApplicationShortcutStore *)self _stateLock_markDirty];
  }
  stateLock = self->_stateLock;
  [(NSLock *)stateLock unlock];
}

- (id)_applicationShortcutItemsFromPlistArray:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  BSSerializeCFValueToXPCDictionaryWithKey();

  id v5 = BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

uint64_t __58__SBApplicationShortcutStore__stateLock_truncateIfNeeded___block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _stateLock_truncateIfNeeded__isInternalInstall = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_cachedLanguages, 0);
  objc_storeStrong((id *)&self->_cachedApplicationShortcutItems, 0);
  objc_storeStrong((id *)&self->_saveQueue, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

- (void)setApplicationShortcutItems:(void *)a1 withLanguages:version:.cold.1(void *a1)
{
  v1 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%{public}@: Ignoring request to save shortcut items because existing shortcuts could not be read from disk: %@", v4, v5, v6, v7, v8);
}

- (void)_stateLock_truncateIfNeeded:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 bundleIdentifier];
  int v6 = 138543874;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  __int16 v10 = 2048;
  uint64_t v11 = 10;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "%{public}@: SBApplicationShortcutStore has too many app shortcuts (%ld); discarding all shortcuts after first %ld.",
    (uint8_t *)&v6,
    0x20u);
}

- (void)_stateLock_truncateIfNeeded:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 bundleIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "%@: SBApplicationShortcutStore suppressing truncation for some reason.", (uint8_t *)&v4, 0xCu);
}

@end