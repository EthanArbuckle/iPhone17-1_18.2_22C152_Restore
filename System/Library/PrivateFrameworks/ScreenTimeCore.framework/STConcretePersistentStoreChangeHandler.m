@interface STConcretePersistentStoreChangeHandler
- (NSMutableDictionary)lastPersistentHistoryTokenByStoreIdentifier;
- (NSPersistentContainer)persistentContainer;
- (STConcretePersistentStoreChangeHandler)initWithPersistentContainer:(id)a3;
- (id)persistentHistoryTokenForStore:(id)a3;
- (void)handlePersistentStoreCoordinatorStoresDidChange:(id)a3;
- (void)handleRemotePersistentStoreDidChange:(id)a3 inContext:(id)a4;
- (void)savePersistentHistoryToken:(id)a3 forStore:(id)a4;
@end

@implementation STConcretePersistentStoreChangeHandler

- (STConcretePersistentStoreChangeHandler)initWithPersistentContainer:(id)a3
{
  v4 = (NSPersistentContainer *)a3;
  v13.receiver = self;
  v13.super_class = (Class)STConcretePersistentStoreChangeHandler;
  v5 = [(STConcretePersistentStoreChangeHandler *)&v13 init];
  persistentContainer = v5->_persistentContainer;
  v5->_persistentContainer = v4;
  v7 = v4;

  uint64_t v8 = objc_opt_new();
  lastPersistentHistoryTokenByStoreIdentifier = v5->_lastPersistentHistoryTokenByStoreIdentifier;
  v5->_lastPersistentHistoryTokenByStoreIdentifier = (NSMutableDictionary *)v8;

  uint64_t v10 = objc_opt_new();
  lastPersistentHistoryTokenByStoreIdentifierLock = v5->_lastPersistentHistoryTokenByStoreIdentifierLock;
  v5->_lastPersistentHistoryTokenByStoreIdentifierLock = v10;

  return v5;
}

- (void)handleRemotePersistentStoreDidChange:(id)a3 inContext:(id)a4
{
  id v6 = a4;
  v7 = [a3 userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1BF90]];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__STConcretePersistentStoreChangeHandler_handleRemotePersistentStoreDidChange_inContext___block_invoke;
  v11[3] = &unk_1E6BC75C8;
  v11[4] = self;
  id v12 = v8;
  id v13 = v6;
  id v9 = v6;
  id v10 = v8;
  [v9 performBlockAndWait:v11];
}

void __89__STConcretePersistentStoreChangeHandler_handleRemotePersistentStoreDidChange_inContext___block_invoke(uint64_t a1)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistentContainer];
  v3 = [v2 persistentStoreCoordinator];
  v4 = [v3 persistentStoreForIdentifier:*(void *)(a1 + 40)];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) persistentHistoryTokenForStore:v4];
    id v6 = [MEMORY[0x1E4F1C160] fetchHistoryAfterToken:v5];
    v36[0] = v4;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    [v6 setAffectedStores:v7];

    [v6 setResultType:5];
    uint64_t v8 = *(void **)(a1 + 48);
    id v33 = 0;
    id v9 = [v8 executeRequest:v6 error:&v33];
    id v10 = v33;
    v11 = v10;
    if (v9)
    {
      id v22 = v10;
      v23 = v9;
      v24 = v6;
      v25 = v4;
      [v9 result];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v28)
      {
        uint64_t v27 = *(void *)v30;
        do
        {
          uint64_t v12 = 0;
          id v13 = v5;
          do
          {
            if (*(void *)v30 != v27) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
            v15 = (void *)MEMORY[0x1E01715C0]();
            v5 = [v14 token];

            v16 = (void *)MEMORY[0x1E4F1C110];
            v17 = [v14 objectIDNotification];
            v18 = [v17 userInfo];
            v19 = [*(id *)(a1 + 32) persistentContainer];
            v20 = [v19 viewContext];
            v34 = v20;
            v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
            [v16 mergeChangesFromRemoteContextSave:v18 intoContexts:v21];

            ++v12;
            id v13 = v5;
          }
          while (v28 != v12);
          uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
        }
        while (v28);
      }

      id v6 = v24;
      v4 = v25;
      v11 = v22;
      id v9 = v23;
    }
    [*(id *)(a1 + 32) savePersistentHistoryToken:v5 forStore:v4];
  }
}

- (void)handlePersistentStoreCoordinatorStoresDidChange:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  uint64_t v28 = [(STConcretePersistentStoreChangeHandler *)self persistentContainer];
  v4 = [v28 persistentStoreCoordinator];
  id obj = self->_lastPersistentHistoryTokenByStoreIdentifierLock;
  objc_sync_enter(obj);
  v5 = [(STConcretePersistentStoreChangeHandler *)self lastPersistentHistoryTokenByStoreIdentifier];
  long long v29 = [v27 userInfo];
  [v29 objectForKeyedSubscript:*MEMORY[0x1E4F1BD88]];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v35;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v6);
        }
        v39 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
        id v10 = v39;
        v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v39, 1, obj);
        uint64_t v12 = [v4 currentPersistentHistoryTokenFromStores:v11];

        id v13 = [v10 identifier];
        [v5 setObject:v12 forKeyedSubscript:v13];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v7);
  }

  [v29 objectForKeyedSubscript:*MEMORY[0x1E4F1BF40]];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v17), "identifier", obj);
        [v5 removeObjectForKey:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v15);
  }

  v19 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F1BF98]];
  if ((unint64_t)[v19 count] >= 2)
  {
    v20 = [v19 objectAtIndexedSubscript:0];
    v21 = [v19 objectAtIndexedSubscript:1];
    id v22 = [v20 identifier];
    v23 = [v5 objectForKeyedSubscript:v22];
    v24 = [v21 identifier];
    [v5 setObject:v23 forKeyedSubscript:v24];

    v25 = [v20 identifier];
    [v5 removeObjectForKey:v25];
  }
  objc_sync_exit(obj);
}

- (id)persistentHistoryTokenForStore:(id)a3
{
  id v4 = a3;
  v5 = self->_lastPersistentHistoryTokenByStoreIdentifierLock;
  objc_sync_enter(v5);
  id v6 = [(STConcretePersistentStoreChangeHandler *)self lastPersistentHistoryTokenByStoreIdentifier];
  uint64_t v7 = [v4 identifier];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  objc_sync_exit(v5);
  return v8;
}

- (void)savePersistentHistoryToken:(id)a3 forStore:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = self->_lastPersistentHistoryTokenByStoreIdentifierLock;
  objc_sync_enter(v7);
  uint64_t v8 = [(STConcretePersistentStoreChangeHandler *)self lastPersistentHistoryTokenByStoreIdentifier];
  uint64_t v9 = [v6 identifier];
  [v8 setObject:v10 forKeyedSubscript:v9];

  objc_sync_exit(v7);
}

- (NSPersistentContainer)persistentContainer
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)lastPersistentHistoryTokenByStoreIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPersistentHistoryTokenByStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_lastPersistentHistoryTokenByStoreIdentifierLock, 0);
}

@end