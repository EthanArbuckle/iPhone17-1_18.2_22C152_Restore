@interface WBSPasswordWarningStore
+ (WBSPasswordWarningStore)sharedStore;
- (id).cxx_construct;
- (id)_initWithBackingStoreURL:(id)a3;
- (id)_initWithDefaultBackingStore;
- (void)_addPersistentIdentifier:(id)a3 withLastWarningDate:(id)a4;
- (void)_loadStoreIfNecessary;
- (void)_saveStoreNow;
- (void)_saveStoreSoon;
- (void)addPersistentIdentifier:(id)a3;
- (void)clearStoreSynchronously;
- (void)getContainsPersistentIdentifier:(id)a3 completionHandler:(id)a4;
- (void)saveStoreSynchronously;
- (void)synchronousyClearIdentifiersAddedAfterDate:(id)a3;
@end

@implementation WBSPasswordWarningStore

- (id)_initWithBackingStoreURL:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSPasswordWarningStore;
  v5 = [(WBSPasswordWarningStore *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    backingStoreURL = v5->_backingStoreURL;
    v5->_backingStoreURL = (NSURL *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SafariShared.WBSPasswordWarningStoreQueue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)_initWithDefaultBackingStore
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = objc_msgSend(v3, "safari_settingsDirectoryURL");
  v5 = [v4 URLByAppendingPathComponent:@"PasswordAuditing.plist" isDirectory:0];

  id v6 = [(WBSPasswordWarningStore *)self _initWithBackingStoreURL:v5];
  return v6;
}

+ (WBSPasswordWarningStore)sharedStore
{
  if (+[WBSPasswordWarningStore sharedStore]::onceToken != -1) {
    dispatch_once(&+[WBSPasswordWarningStore sharedStore]::onceToken, &__block_literal_global_49);
  }
  v2 = (void *)+[WBSPasswordWarningStore sharedStore]::sharedStore;
  return (WBSPasswordWarningStore *)v2;
}

void __38__WBSPasswordWarningStore_sharedStore__block_invoke()
{
  id v0 = [[WBSPasswordWarningStore alloc] _initWithDefaultBackingStore];
  v1 = (void *)+[WBSPasswordWarningStore sharedStore]::sharedStore;
  +[WBSPasswordWarningStore sharedStore]::sharedStore = (uint64_t)v0;
}

- (void)_loadStoreIfNecessary
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self->_lastWarningDatesByPersistentIdentifier)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lastWarningDatesByPersistentIdentifier = self->_lastWarningDatesByPersistentIdentifier;
    self->_lastWarningDatesByPersistentIdentifier = v3;

    v20 = self;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:self->_backingStoreURL];
    id v19 = v5;
    if (v5)
    {
      v18 = objc_msgSend(v5, "safari_arrayForKey:", @"PasswordAuditWarnings");
      if (v18)
      {
        id v6 = [MEMORY[0x1E4F1C9C8] date];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v7 = v18;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v8)
        {
          char v9 = 0;
          uint64_t v10 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v7);
              }
              objc_super v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              v13 = objc_msgSend(v12, "safari_dataForKey:", @"PersistentIdentifier");
              uint64_t v14 = objc_msgSend(v12, "safari_dateForKey:", @"LastWarningDate");
              v15 = (void *)v14;
              if (v13) {
                BOOL v16 = v14 == 0;
              }
              else {
                BOOL v16 = 1;
              }
              if (v16 || ([v6 timeIntervalSinceDate:v14], v17 > 7776000.0)) {
                char v9 = 1;
              }
              else {
                [(NSMutableDictionary *)v20->_lastWarningDatesByPersistentIdentifier setObject:v15 forKeyedSubscript:v13];
              }
            }
            uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v8);

          if (v9) {
            [(WBSPasswordWarningStore *)v20 _saveStoreSoon];
          }
        }
        else
        {
        }
      }

      v5 = v19;
    }
  }
}

- (void)_saveStoreSoon
{
  if (self->_backingStoreURL)
  {
    if (!self->_hasPendingChanges)
    {
      self->_hasPendingChanges = 1;
      operator new();
    }
  }
}

uint64_t __41__WBSPasswordWarningStore__saveStoreSoon__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveStoreNow];
}

- (void)_saveStoreNow
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Failed to save PasswordWarning store: %{public}@", buf, 0xCu);
}

void __40__WBSPasswordWarningStore__saveStoreNow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v8[0] = @"PersistentIdentifier";
  v8[1] = @"LastWarningDate";
  v9[0] = v5;
  v9[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  [*(id *)(a1 + 32) addObject:v7];
}

- (void)saveStoreSynchronously
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__WBSPasswordWarningStore_saveStoreSynchronously__block_invoke;
  block[3] = &unk_1E6159820;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __49__WBSPasswordWarningStore_saveStoreSynchronously__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveStoreNow];
}

- (void)getContainsPersistentIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WBSPasswordWarningStore_getContainsPersistentIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E615C960;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __77__WBSPasswordWarningStore_getContainsPersistentIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "pm_defaults");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  int v2 = [v5 BOOLForKey:@"EnablePasswordManagerDemoMode"];

  if (v2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    [*(id *)(a1 + 32) _loadStoreIfNecessary];
    id v6 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (v6)
    {
      id v4 = [MEMORY[0x1E4F1C9C8] date];
      [v4 timeIntervalSinceDate:v6];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_addPersistentIdentifier:(id)a3 withLastWarningDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WBSPasswordWarningStore__addPersistentIdentifier_withLastWarningDate___block_invoke;
  block[3] = &unk_1E6159A30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __72__WBSPasswordWarningStore__addPersistentIdentifier_withLastWarningDate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadStoreIfNecessary];
  [*(id *)(*(void *)(a1 + 32) + 40) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
  int v2 = *(void **)(a1 + 32);
  return [v2 _saveStoreSoon];
}

- (void)addPersistentIdentifier:(id)a3
{
  id v5 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [(WBSPasswordWarningStore *)self _addPersistentIdentifier:v5 withLastWarningDate:v4];
}

- (void)clearStoreSynchronously
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WBSPasswordWarningStore_clearStoreSynchronously__block_invoke;
  block[3] = &unk_1E6159820;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __50__WBSPasswordWarningStore_clearStoreSynchronously__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  id v5 = *(void **)(a1 + 32);
  return [v5 _saveStoreNow];
}

- (void)synchronousyClearIdentifiersAddedAfterDate:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] distantPast];

  if (v5 == v4)
  {
    [(WBSPasswordWarningStore *)self clearStoreSynchronously];
  }
  else
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__WBSPasswordWarningStore_synchronousyClearIdentifiersAddedAfterDate___block_invoke;
    v7[3] = &unk_1E6159900;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

void __70__WBSPasswordWarningStore_synchronousyClearIdentifiersAddedAfterDate___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __70__WBSPasswordWarningStore_synchronousyClearIdentifiersAddedAfterDate___block_invoke_2;
  id v8 = &unk_1E615C988;
  id v9 = *(id *)(a1 + 40);
  id v4 = v2;
  id v10 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:&v5];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObjectsForKeys:", v4, v5, v6, v7, v8);
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  [*(id *)(a1 + 32) _saveStoreNow];
}

void __70__WBSPasswordWarningStore_synchronousyClearIdentifiersAddedAfterDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 compare:*(void *)(a1 + 32)] == 1) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastWarningDatesByPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_backingStoreURL, 0);
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_suddenTerminationDisabler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end