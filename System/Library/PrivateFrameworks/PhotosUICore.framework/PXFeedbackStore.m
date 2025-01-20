@interface PXFeedbackStore
- (BOOL)_loadStore;
- (BOOL)_saveStore;
- (NSDictionary)store;
- (PXFeedbackStore)init;
- (id)_storePath;
- (id)longDescription;
- (unint64_t)sentFeedbackCount;
- (unint64_t)unsentFeedbackCount;
- (void)_cleanupStore;
- (void)addFeedbackEntry:(id)a3;
- (void)removeFeedbackEntry:(id)a3;
@end

@implementation PXFeedbackStore

- (void).cxx_destruct
{
}

- (NSDictionary)store
{
  return &self->_store->super;
}

- (id)longDescription
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p>]\n", v5, self];

  v7 = objc_msgSend(v6, "stringByAppendingFormat:", @"   - sent feedback count    : %ld\n", -[PXFeedbackStore sentFeedbackCount](self, "sentFeedbackCount"));

  v8 = objc_msgSend(v7, "stringByAppendingFormat:", @"   - unsent feedback count  : %ld\n", -[PXFeedbackStore unsentFeedbackCount](self, "unsentFeedbackCount"));

  v9 = [v8 stringByAppendingFormat:@"   - stored feedback entries:\n"];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = [(PXFeedbackStore *)self store];
  v11 = [v10 allKeys];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      v16 = v9;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v9 = [v16 stringByAppendingFormat:@"      - key: %@\n", *(void *)(*((void *)&v18 + 1) + 8 * v15)];

        ++v15;
        v16 = v9;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v9;
}

- (BOOL)_loadStore
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C9B8];
  v4 = [(PXFeedbackStore *)self _storePath];
  v5 = [v3 dataWithContentsOfFile:v4];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F28DC0];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    id v18 = 0;
    v11 = [v6 unarchivedObjectOfClasses:v10 fromData:v5 error:&v18];
    id v12 = v18;

    if (v11)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
      store = self->_store;
      self->_store = v13;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v12;
      _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to unarchive savedStore, error: %@", buf, 0xCu);
    }
  }
  uint64_t v15 = [(PXFeedbackStore *)self store];
  BOOL v16 = v15 != 0;

  return v16;
}

- (BOOL)_saveStore
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(PXFeedbackStore *)self _storePath];
  v4 = (void *)MEMORY[0x1E4F28DB0];
  v5 = [(PXFeedbackStore *)self store];
  id v10 = 0;
  v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v10];
  id v7 = v10;

  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to archive savedStore, error: %@", buf, 0xCu);
  }
  char v8 = [v6 writeToFile:v3 atomically:1];

  return v8;
}

- (void)_cleanupStore
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  store = self->_store;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__PXFeedbackStore__cleanupStore__block_invoke;
  v6[3] = &unk_1E5DCA5E8;
  id v7 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)store enumerateKeysAndObjectsUsingBlock:v6];
  [(NSMutableDictionary *)self->_store removeObjectsForKeys:v5];
}

void __32__PXFeedbackStore__cleanupStore__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 alreadyCollected]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (id)_storePath
{
  v2 = NSTemporaryDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"PGFeedbackStore"];

  return v3;
}

- (unint64_t)unsentFeedbackCount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(PXFeedbackStore *)self store];
  v3 = [v2 objectEnumerator];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) alreadyCollected] ^ 1;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)sentFeedbackCount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(PXFeedbackStore *)self store];
  v3 = [v2 objectEnumerator];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) alreadyCollected];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)removeFeedbackEntry:(id)a3
{
  store = self->_store;
  uint64_t v5 = [a3 uniqueID];
  [(NSMutableDictionary *)store removeObjectForKey:v5];

  [(PXFeedbackStore *)self _saveStore];
}

- (void)addFeedbackEntry:(id)a3
{
  id v4 = a3;
  [v4 setAlreadyCollected:0];
  uint64_t v5 = [(PXFeedbackStore *)self store];
  unint64_t v6 = [v4 uniqueID];
  [v5 setValue:v4 forKey:v6];

  [(PXFeedbackStore *)self _saveStore];
}

- (PXFeedbackStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXFeedbackStore;
  v2 = [(PXFeedbackStore *)&v7 init];
  v3 = v2;
  if (v2 && ![(PXFeedbackStore *)v2 _loadStore])
  {
    uint64_t v4 = objc_opt_new();
    store = v3->_store;
    v3->_store = (NSMutableDictionary *)v4;
  }
  return v3;
}

@end