@interface SBRecentDisplayItemsDataStore
- (NSOrderedSet)displayItems;
- (SBRecentDisplayItemsDataStore)init;
- (SBRecentDisplayItemsDataStore)initWithRecentLayouts:(id)a3 fallbackToRecentAppLayouts:(BOOL)a4;
- (SBRecentDisplayItemsPersistenceDelegate)persistenceDelegate;
- (id)_displayItemsFromRecentAppLayouts:(id)a3;
- (void)setDisplayItems:(id)a3;
- (void)setPersistenceDelegate:(id)a3;
@end

@implementation SBRecentDisplayItemsDataStore

- (SBRecentDisplayItemsDataStore)init
{
  v3 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  v4 = [v3 recentAppLayouts];
  v5 = [(SBRecentDisplayItemsDataStore *)self initWithRecentLayouts:v4 fallbackToRecentAppLayouts:1];

  return v5;
}

- (SBRecentDisplayItemsDataStore)initWithRecentLayouts:(id)a3 fallbackToRecentAppLayouts:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBRecentDisplayItemsDataStore;
  v8 = [(SBRecentDisplayItemsDataStore *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recentLayouts, a3);
    v9->_shouldFallbackToRecentAppLayouts = a4;
  }

  return v9;
}

- (void)setDisplayItems:(id)a3
{
  p_persistenceDelegate = &self->_persistenceDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_persistenceDelegate);
  [WeakRetained dataStore:self persistDisplayItems:v5];
}

- (NSOrderedSet)displayItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistenceDelegate);
  v4 = [WeakRetained persistedDisplayItemsForDataStore:self];
  if (!v4)
  {
    if (self->_shouldFallbackToRecentAppLayouts)
    {
      v4 = [(SBRecentDisplayItemsDataStore *)self _displayItemsFromRecentAppLayouts:self->_recentLayouts];
      [(SBRecentDisplayItemsDataStore *)self setDisplayItems:v4];
    }
    else
    {
      v4 = 0;
    }
  }
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        if (objc_msgSend(WeakRetained, "dataStore:shouldRestorePersistedDisplayItem:", self, v11, (void)v13))objc_msgSend(v5, "addObject:", v11); {
      }
        }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return (NSOrderedSet *)v5;
}

- (id)_displayItemsFromRecentAppLayouts:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = [NSNumber numberWithInteger:1];
  v32[0] = v6;
  uint64_t v7 = [NSNumber numberWithInteger:2];
  v32[1] = v7;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3;
  uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v10 = v20;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = objc_msgSend(v9, "itemForLayoutRole:", objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "integerValue"));
              long long v16 = [v15 bundleIdentifier];
              if (v15 && ([v5 containsObject:v16] & 1) == 0)
              {
                [v4 addObject:v15];
                [v5 addObject:v16];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v12);
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }

  return v4;
}

- (SBRecentDisplayItemsPersistenceDelegate)persistenceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistenceDelegate);
  return (SBRecentDisplayItemsPersistenceDelegate *)WeakRetained;
}

- (void)setPersistenceDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_persistenceDelegate);
  objc_storeStrong((id *)&self->_recentLayouts, 0);
}

@end