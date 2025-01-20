@interface WBSPersistentPropertyListStore
- (WBSPersistentPropertyListStore)initWithBackingStoreURL:(id)a3;
- (WBSPersistentPropertyListStore)initWithBackingStoreURL:(id)a3 fileResourceValues:(id)a4;
- (id)_dataRepresentation;
- (id)_existingSavedData;
- (id)_objectForKey:(id)a3 ofClass:(Class)a4;
- (id)allKeys;
- (id)arrayForKey:(id)a3;
- (id)createEmptyStoreHandler;
- (id)dataForKey:(id)a3;
- (id)dateForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)numberForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (id)validateLoadedStoreHandler;
- (void)_dataRepresentation;
- (void)_existingSavedData;
- (void)_loadDataIfNecessary;
- (void)_prepareEmptyStore;
- (void)clearStoreSynchronously;
- (void)saveAndCloseStoreSynchronously;
- (void)saveStoreSynchronously;
- (void)setCreateEmptyStoreHandler:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setValidateLoadedStoreHandler:(id)a3;
@end

@implementation WBSPersistentPropertyListStore

- (WBSPersistentPropertyListStore)initWithBackingStoreURL:(id)a3 fileResourceValues:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WBSPersistentPropertyListStore;
  v8 = [(WBSPersistentPropertyListStore *)&v22 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.SafariShared.WBSPersistentPropertyListStore", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    if (v6)
    {
      objc_initWeak(&location, v8);
      uint64_t v11 = [v6 copy];
      backingStoreURL = v8->_backingStoreURL;
      v8->_backingStoreURL = (NSURL *)v11;

      v13 = [WBSCoalescedAsynchronousWriter alloc];
      v14 = v8->_queue;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __77__WBSPersistentPropertyListStore_initWithBackingStoreURL_fileResourceValues___block_invoke;
      v19[3] = &unk_1E615CA88;
      objc_copyWeak(&v20, &location);
      uint64_t v15 = [(WBSCoalescedAsynchronousWriter *)v13 initWithName:@"WBSPersistentPropertyListStore" fileURL:v6 dataSourceQueue:v14 dataSourceBlock:v19 fileResourceValues:v7];
      writer = v8->_writer;
      v8->_writer = (WBSCoalescedAsynchronousWriter *)v15;

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    v17 = v8;
  }

  return v8;
}

- (void)setCreateEmptyStoreHandler:(id)a3
{
}

- (WBSPersistentPropertyListStore)initWithBackingStoreURL:(id)a3
{
  return [(WBSPersistentPropertyListStore *)self initWithBackingStoreURL:a3 fileResourceValues:0];
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  v5 = [(WBSPersistentPropertyListStore *)self _objectForKey:v4 ofClass:objc_opt_class()];

  return v5;
}

- (id)_objectForKey:(id)a3 ofClass:(Class)a4
{
  id v4 = [(WBSPersistentPropertyListStore *)self objectForKey:a3];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__WBSPersistentPropertyListStore_objectForKey___block_invoke;
  block[3] = &unk_1E615BBE0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__WBSPersistentPropertyListStore_allKeys__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadDataIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __47__WBSPersistentPropertyListStore_objectForKey___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadDataIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_loadDataIfNecessary
{
  if (!self->_store)
  {
    uint64_t v3 = [(WBSPersistentPropertyListStore *)self _existingSavedData];
    store = self->_store;
    self->_store = v3;

    if (!self->_store) {
      goto LABEL_8;
    }
    validateLoadedStoreHandler = (void (**)(void))self->_validateLoadedStoreHandler;
    if (validateLoadedStoreHandler)
    {
      id v6 = validateLoadedStoreHandler[2]();
      if (([v6 isEqual:self->_store] & 1) == 0)
      {
        id v7 = (NSMutableDictionary *)[v6 mutableCopy];
        v8 = self->_store;
        self->_store = v7;

        [(WBSCoalescedAsynchronousWriter *)self->_writer scheduleWrite];
      }

      if (!self->_store)
      {
LABEL_8:
        [(WBSPersistentPropertyListStore *)self _prepareEmptyStore];
      }
    }
  }
}

- (id)_existingSavedData
{
  if (self->_backingStoreURL)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    backingStoreURL = self->_backingStoreURL;
    id v15 = 0;
    id v5 = (void *)[v3 initWithContentsOfURL:backingStoreURL options:0 error:&v15];
    id v6 = v15;
    id v7 = v6;
    if (v5)
    {
      id v14 = 0;
      v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v14];
      id v9 = v14;

      if (v8)
      {
        id v10 = (void *)[v8 mutableCopy];
      }
      else
      {
        uint64_t v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          [(WBSPersistentPropertyListStore *)v12 _existingSavedData];
        }
        id v10 = 0;
      }
    }
    else
    {
      if ((objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E4F281F8], 260) & 1) == 0)
      {
        uint64_t v11 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          [(WBSPersistentPropertyListStore *)v11 _existingSavedData];
        }
      }
      id v10 = 0;
      id v9 = v7;
    }
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)allKeys
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__12;
  id v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__WBSPersistentPropertyListStore_allKeys__block_invoke;
  v5[3] = &unk_1E615AE78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

id __77__WBSPersistentPropertyListStore_initWithBackingStoreURL_fileResourceValues___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _dataRepresentation];

  return v2;
}

- (void)_prepareEmptyStore
{
  createEmptyStoreHandler = (void (**)(id, SEL))self->_createEmptyStoreHandler;
  if (createEmptyStoreHandler)
  {
    id v4 = createEmptyStoreHandler[2](createEmptyStoreHandler, a2);
    id v5 = (NSMutableDictionary *)[v4 mutableCopy];
    store = self->_store;
    self->_store = v5;

    if ([(NSMutableDictionary *)self->_store count])
    {
      writer = self->_writer;
      [(WBSCoalescedAsynchronousWriter *)writer scheduleWrite];
    }
  }
  else
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = self->_store;
    self->_store = v8;
  }
}

- (id)_dataRepresentation
{
  store = self->_store;
  id v7 = 0;
  id v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:store format:200 options:0 error:&v7];
  id v4 = v7;
  if (!v3)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(WBSPersistentPropertyListStore *)v5 _dataRepresentation];
    }
  }

  return v3;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSPersistentPropertyListStore *)self _objectForKey:v4 ofClass:objc_opt_class()];

  return v5;
}

- (id)numberForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSPersistentPropertyListStore *)self _objectForKey:v4 ofClass:objc_opt_class()];

  return v5;
}

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSPersistentPropertyListStore *)self _objectForKey:v4 ofClass:objc_opt_class()];

  return v5;
}

- (id)dateForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSPersistentPropertyListStore *)self _objectForKey:v4 ofClass:objc_opt_class()];

  return v5;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSPersistentPropertyListStore *)self _objectForKey:v4 ofClass:objc_opt_class()];

  return v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__WBSPersistentPropertyListStore_setObject_forKey___block_invoke;
  block[3] = &unk_1E615B188;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __51__WBSPersistentPropertyListStore_setObject_forKey___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadDataIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  char v3 = [v2 isEqual:*(void *)(a1 + 48)];

  if ((v3 & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
    id v4 = *(void **)(*(void *)(a1 + 32) + 32);
    [v4 scheduleWrite];
  }
}

- (void)saveStoreSynchronously
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WBSPersistentPropertyListStore_saveStoreSynchronously__block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __56__WBSPersistentPropertyListStore_saveStoreSynchronously__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) scheduleWrite];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  return [v2 performScheduledWriteSynchronously];
}

- (void)clearStoreSynchronously
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__WBSPersistentPropertyListStore_clearStoreSynchronously__block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __57__WBSPersistentPropertyListStore_clearStoreSynchronously__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _prepareEmptyStore];
  [*(id *)(*(void *)(a1 + 32) + 32) scheduleWrite];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  return [v2 performScheduledWriteSynchronously];
}

- (void)saveAndCloseStoreSynchronously
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WBSPersistentPropertyListStore_saveAndCloseStoreSynchronously__block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __64__WBSPersistentPropertyListStore_saveAndCloseStoreSynchronously__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) completePendingWriteSynchronously];
}

- (id)createEmptyStoreHandler
{
  return self->_createEmptyStoreHandler;
}

- (id)validateLoadedStoreHandler
{
  return self->_validateLoadedStoreHandler;
}

- (void)setValidateLoadedStoreHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_validateLoadedStoreHandler, 0);
  objc_storeStrong(&self->_createEmptyStoreHandler, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_backingStoreURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_existingSavedData
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "Failed to decode backing store: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)_dataRepresentation
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "Failed to encode backing store: %{public}@", v7, v8, v9, v10, 2u);
}

@end