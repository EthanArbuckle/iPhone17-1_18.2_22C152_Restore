@interface PinnedTabsManager
- (NSArray)pinnedTabs;
- (NSArray)privatePinnedTabs;
- (PinnedTabsManager)initWithBrowserState:(id)a3 tabCollection:(id)a4;
- (WBCollectionConfiguration)collectionConfiguration;
- (WBTabCollection)tabCollection;
- (id)_tabWithUUID:(id)a3 inContainer:(id)a4;
- (id)_tabsByUUIDInContainer:(id)a3;
- (id)_tabsInContainer:(id)a3;
- (id)containerForTabWithUUID:(id)a3;
- (id)pinnedTabsInContainer:(id)a3;
- (id)tabWithUUID:(id)a3;
- (int)_pinnedTabsFolderIDForContainer:(id)a3;
- (void)_cacheTab:(id)a3 inContainer:(id)a4;
- (void)_clearPinnedTabsForProfileWithIdentifier:(id)a3;
- (void)_loadPinnedTabsForProfileWithIdentifier:(id)a3;
- (void)_notifyObserversAfterUpdatesIfNeeded;
- (void)_updateCache;
- (void)addPinnedTabsObserver:(id)a3;
- (void)appendTab:(id)a3 inContainer:(id)a4;
- (void)didDeselectProfileWithIdentifier:(id)a3;
- (void)moveTab:(id)a3 toTabGroup:(id)a4 afterTab:(id)a5;
- (void)notifyObserversOfUpdatedPinnedTabsInContainer:(id)a3;
- (void)notifyObserversOfUpdatedPinnedTabsInProfileWithIdentifier:(id)a3;
- (void)notifyObserversOfUpdatedPinnedTabsIsPrivate:(BOOL)a3;
- (void)performUpdatesUsingBlock:(id)a3;
- (void)removePinnedTabsObserver:(id)a3;
- (void)removeTabWithUUID:(id)a3 persist:(BOOL)a4;
- (void)updatePinnedTabWithUUID:(id)a3 inContainer:(id)a4 usingBlock:(id)a5;
- (void)updatePinnedTabsInContainer:(id)a3 usingBlock:(id)a4;
- (void)willSelectProfileWithIdentifier:(id)a3;
@end

@implementation PinnedTabsManager

- (id)pinnedTabsInContainer:(id)a3
{
  v3 = [(PinnedTabsManager *)self _tabsInContainer:a3];
  if (v3) {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v3 copyItems:1];
  }
  else {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (id)_tabsInContainer:(id)a3
{
  id v4 = a3;
  if ([v4 isPrivateBrowsingEnabled])
  {
    privatePinnedTabs = self->_privatePinnedTabs;
LABEL_5:
    v6 = privatePinnedTabs;
    goto LABEL_7;
  }
  if ([v4 isInDefaultProfile])
  {
    privatePinnedTabs = self->_pinnedTabs;
    goto LABEL_5;
  }
  pinnedTabsByProfileIdentifier = self->_pinnedTabsByProfileIdentifier;
  v8 = [v4 activeProfileIdentifier];
  v6 = [(NSMutableDictionary *)pinnedTabsByProfileIdentifier objectForKeyedSubscript:v8];

LABEL_7:
  return v6;
}

- (PinnedTabsManager)initWithBrowserState:(id)a3 tabCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PinnedTabsManager;
  v8 = [(PinnedTabsManager *)&v37 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    v11 = [v6 pinnedTabs];
    v12 = objc_msgSend(v11, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_29);
    v13 = (void *)[v12 mutableCopy];
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA48] array];
    }
    pinnedTabs = v8->_pinnedTabs;
    v8->_pinnedTabs = v15;

    v17 = [v6 privatePinnedTabs];
    v18 = objc_msgSend(v17, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_3);
    v19 = (void *)[v18 mutableCopy];
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA48] array];
    }
    privatePinnedTabs = v8->_privatePinnedTabs;
    v8->_privatePinnedTabs = v21;

    objc_storeStrong((id *)&v8->_tabCollection, a4);
    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    pinnedTabsByUUID = v8->_pinnedTabsByUUID;
    v8->_pinnedTabsByUUID = (NSMutableDictionary *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
    privatePinnedTabsByUUID = v8->_privatePinnedTabsByUUID;
    v8->_privatePinnedTabsByUUID = (NSMutableDictionary *)v25;

    uint64_t v27 = [MEMORY[0x1E4F28BD0] set];
    activeProfileIdentifiers = v8->_activeProfileIdentifiers;
    v8->_activeProfileIdentifiers = (NSCountedSet *)v27;

    uint64_t v29 = [MEMORY[0x1E4F1CA80] set];
    pendingUpdatedProfileIdentifiers = v8->_pendingUpdatedProfileIdentifiers;
    v8->_pendingUpdatedProfileIdentifiers = (NSMutableSet *)v29;

    uint64_t v31 = [MEMORY[0x1E4F1CA60] dictionary];
    pinnedTabsByProfileIdentifier = v8->_pinnedTabsByProfileIdentifier;
    v8->_pinnedTabsByProfileIdentifier = (NSMutableDictionary *)v31;

    uint64_t v33 = [MEMORY[0x1E4F1CA60] dictionary];
    pinnedTabsByUUIDAndProfileIdentifier = v8->_pinnedTabsByUUIDAndProfileIdentifier;
    v8->_pinnedTabsByUUIDAndProfileIdentifier = (NSMutableDictionary *)v33;

    [(PinnedTabsManager *)v8 _updateCache];
    v35 = v8;
  }

  return v8;
}

- (void)_updateCache
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_pinnedTabsByUUID removeAllObjects];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v3 = self->_pinnedTabs;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        pinnedTabsByUUID = self->_pinnedTabsByUUID;
        v10 = [v8 uuid];
        [(NSMutableDictionary *)pinnedTabsByUUID setObject:v8 forKeyedSubscript:v10];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_privatePinnedTabsByUUID removeAllObjects];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v11 = self->_privatePinnedTabs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        privatePinnedTabsByUUID = self->_privatePinnedTabsByUUID;
        v18 = [v16 uuid];
        [(NSMutableDictionary *)privatePinnedTabsByUUID setObject:v16 forKeyedSubscript:v18];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v13);
  }

  [(NSMutableDictionary *)self->_pinnedTabsByUUIDAndProfileIdentifier removeAllObjects];
  pinnedTabsByProfileIdentifier = self->_pinnedTabsByProfileIdentifier;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __33__PinnedTabsManager__updateCache__block_invoke;
  v20[3] = &unk_1E6D7B450;
  v20[4] = self;
  [(NSMutableDictionary *)pinnedTabsByProfileIdentifier enumerateKeysAndObjectsUsingBlock:v20];
}

id __56__PinnedTabsManager_initWithBrowserState_tabCollection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  return v2;
}

id __56__PinnedTabsManager_initWithBrowserState_tabCollection___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  return v2;
}

- (NSArray)pinnedTabs
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_pinnedTabs copyItems:1];
  return (NSArray *)v2;
}

- (NSArray)privatePinnedTabs
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_privatePinnedTabs copyItems:1];
  return (NSArray *)v2;
}

- (void)_cacheTab:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v8 = [(PinnedTabsManager *)self _tabsByUUIDInContainer:a4];
  id v7 = [v6 uuid];
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (int)_pinnedTabsFolderIDForContainer:(id)a3
{
  id v4 = a3;
  if ([v4 isPrivateBrowsingEnabled])
  {
    int v5 = [(WBTabCollection *)self->_tabCollection privatePinnedTabsFolderID];
  }
  else
  {
    int v6 = [v4 isInDefaultProfile];
    tabCollection = self->_tabCollection;
    if (!v6)
    {
      uint64_t v9 = [v4 activeProfileIdentifier];
      int v8 = [(WBTabCollection *)tabCollection pinnedTabsFolderIDForProfileWithIdentifier:v9];

      goto LABEL_7;
    }
    int v5 = [(WBTabCollection *)tabCollection pinnedTabsFolderID];
  }
  int v8 = v5;
LABEL_7:

  return v8;
}

- (id)_tabsByUUIDInContainer:(id)a3
{
  id v4 = a3;
  if ([v4 isPrivateBrowsingEnabled])
  {
    privatePinnedTabsByUUID = self->_privatePinnedTabsByUUID;
LABEL_5:
    int v6 = privatePinnedTabsByUUID;
    goto LABEL_7;
  }
  if ([v4 isInDefaultProfile])
  {
    privatePinnedTabsByUUID = self->_pinnedTabsByUUID;
    goto LABEL_5;
  }
  pinnedTabsByUUIDAndProfileIdentifier = self->_pinnedTabsByUUIDAndProfileIdentifier;
  int v8 = [v4 activeProfileIdentifier];
  int v6 = [(NSMutableDictionary *)pinnedTabsByUUIDAndProfileIdentifier objectForKeyedSubscript:v8];

LABEL_7:
  return v6;
}

- (id)_tabWithUUID:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = [(PinnedTabsManager *)self _tabsByUUIDInContainer:a4];
  int v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

void __33__PinnedTabsManager__updateCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "uuid", (void)v15);
        [v7 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [*(id *)(*(void *)(a1 + 32) + 96) setObject:v7 forKeyedSubscript:v5];
}

- (id)containerForTabWithUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_pinnedTabsByUUID objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = 0;
LABEL_5:
    id v8 = +[PinnedTabsContainer containerWithPrivateBrowsing:v6];
    goto LABEL_6;
  }
  id v7 = [(NSMutableDictionary *)self->_privatePinnedTabsByUUID objectForKeyedSubscript:v4];

  if (v7)
  {
    uint64_t v6 = 1;
    goto LABEL_5;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [(NSMutableDictionary *)self->_pinnedTabsByUUIDAndProfileIdentifier allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v16 = [(NSMutableDictionary *)self->_pinnedTabsByUUIDAndProfileIdentifier objectForKeyedSubscript:v15];
        long long v17 = [v16 objectForKeyedSubscript:v4];

        if (v17)
        {
          id v8 = +[PinnedTabsContainer containerWithActiveProfileIdentifier:v15];

          goto LABEL_6;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v8 = 0;
LABEL_6:

  return v8;
}

- (id)tabWithUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_pinnedTabsByUUID objectForKeyedSubscript:v4];
  if (v5
    || ([(NSMutableDictionary *)self->_privatePinnedTabsByUUID objectForKeyedSubscript:v4],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = (void *)[v5 copy];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(NSMutableDictionary *)self->_pinnedTabsByUUIDAndProfileIdentifier allValues];
    uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) objectForKeyedSubscript:v4];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v6 = (void *)[v10 copy];

            id v5 = v11;
            goto LABEL_4;
          }
        }
        uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
LABEL_4:

  return v6;
}

- (void)updatePinnedTabWithUUID:(id)a3 inContainer:(id)a4 usingBlock:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  uint64_t v11 = [(PinnedTabsManager *)self _tabWithUUID:v8 inContainer:v9];
  if (v11)
  {
    v10[2](v10, v11);
    [(WBTabCollection *)self->_tabCollection saveItem:v11 completionHandler:0];
    [(PinnedTabsManager *)self notifyObserversOfUpdatedPinnedTabsInContainer:v9];
  }
  else
  {
    long long v12 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      id v14 = v8;
      _os_log_impl(&dword_1E102C000, v12, OS_LOG_TYPE_INFO, "Not updating pinned tab with uuid %{public}@ because it does not exist.", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)updatePinnedTabsInContainer:(id)a3 usingBlock:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(PinnedTabsManager *)self _tabsByUUIDInContainer:v6];
  id v9 = v7[2](v7, v8);

  uint64_t v10 = [(PinnedTabsManager *)self _tabsInContainer:v6];
  if (([v9 isEqualToArray:v10] & 1) == 0)
  {
    long long v20 = v7;
    [v10 removeAllObjects];
    long long v19 = v9;
    [v10 addObjectsFromArray:v9];
    unsigned int v18 = [(PinnedTabsManager *)self _pinnedTabsFolderIDForContainer:v6];
    uint64_t v11 = [v6 isPrivateBrowsingEnabled];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          [v17 setSyncable:0];
          [v17 didRemoveFromTabGroup];
          [v17 setInUnnamedTabGroup:v11 ^ 1];
          [v17 setPrivateBrowsing:v11];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    id v9 = v19;
    [(WBTabCollection *)self->_tabCollection updateItems:v19 inParentWithID:v18 completionHandler:0];
    [(PinnedTabsManager *)self notifyObserversOfUpdatedPinnedTabsInContainer:v6];
    [(PinnedTabsManager *)self _updateCache];
    id v7 = v20;
  }
}

- (void)appendTab:(id)a3 inContainer:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PinnedTabsManager *)self _tabsInContainer:v6];
  uint64_t v9 = [v6 isPrivateBrowsingEnabled];
  uint64_t v10 = [v8 lastObject];
  [v8 addObject:v7];
  [v7 setSyncable:0];
  [v7 didRemoveFromTabGroup];
  [v7 setInUnnamedTabGroup:v9 ^ 1];
  [v7 setPrivateBrowsing:v9];
  uint64_t v11 = [(PinnedTabsManager *)self _pinnedTabsFolderIDForContainer:v6];
  tabCollection = self->_tabCollection;
  v14[0] = v7;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [(WBTabCollection *)tabCollection insertItems:v13 inParentWithID:v11 afterItem:v10];

  [(PinnedTabsManager *)self _cacheTab:v7 inContainer:v6];
  [(PinnedTabsManager *)self notifyObserversOfUpdatedPinnedTabsInContainer:v6];
}

- (void)moveTab:(id)a3 toTabGroup:(id)a4 afterTab:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 uuid];
  [(PinnedTabsManager *)self removeTabWithUUID:v11 persist:0];

  v13[0] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  [v9 insertTabs:v12 afterTab:v8];
}

- (void)removeTabWithUUID:(id)a3 persist:(BOOL)a4
{
  BOOL v4 = a4;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  pinnedTabs = self->_pinnedTabs;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke;
  v30[3] = &unk_1E6D7B478;
  id v8 = v6;
  id v31 = v8;
  id v9 = [(NSMutableArray *)pinnedTabs safari_firstObjectPassingTest:v30];
  id v10 = v9;
  if (v9)
  {
    pinnedTabsByUUID = self->_pinnedTabsByUUID;
    id v12 = [v9 uuid];
    [(NSMutableDictionary *)pinnedTabsByUUID removeObjectForKey:v12];

    [(NSMutableArray *)self->_pinnedTabs removeObject:v10];
    if (v4)
    {
      tabCollection = self->_tabCollection;
      v33[0] = v10;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
      [(WBTabCollection *)tabCollection deleteItems:v14 leaveTombstones:0];
    }
    [(PinnedTabsManager *)self notifyObserversOfUpdatedPinnedTabsIsPrivate:0];
  }
  else
  {
    privatePinnedTabs = self->_privatePinnedTabs;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke_2;
    v28[3] = &unk_1E6D7B478;
    id v16 = v8;
    id v29 = v16;
    uint64_t v17 = [(NSMutableArray *)privatePinnedTabs safari_firstObjectPassingTest:v28];
    unsigned int v18 = v17;
    if (v17)
    {
      privatePinnedTabsByUUID = self->_privatePinnedTabsByUUID;
      long long v20 = [v17 uuid];
      [(NSMutableDictionary *)privatePinnedTabsByUUID removeObjectForKey:v20];

      [(NSMutableArray *)self->_privatePinnedTabs removeObject:v18];
      if (v4)
      {
        long long v21 = self->_tabCollection;
        v32 = v18;
        long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
        [(WBTabCollection *)v21 deleteItems:v22 leaveTombstones:0];
      }
      [(PinnedTabsManager *)self notifyObserversOfUpdatedPinnedTabsIsPrivate:1];
    }
    pinnedTabsByProfileIdentifier = self->_pinnedTabsByProfileIdentifier;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke_3;
    v24[3] = &unk_1E6D7B4A0;
    id v25 = v16;
    uint64_t v26 = self;
    BOOL v27 = v4;
    [(NSMutableDictionary *)pinnedTabsByProfileIdentifier enumerateKeysAndObjectsUsingBlock:v24];
  }
}

uint64_t __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 uuid];
  uint64_t v3 = WBSIsEqual();

  return v3;
}

uint64_t __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 uuid];
  uint64_t v3 = WBSIsEqual();

  return v3;
}

void __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke_4;
  v14[3] = &unk_1E6D7B478;
  id v15 = *(id *)(a1 + 32);
  id v9 = objc_msgSend(v8, "safari_firstObjectPassingTest:", v14);
  if (v9)
  {
    id v10 = [*(id *)(*(void *)(a1 + 40) + 96) objectForKeyedSubscript:v7];
    uint64_t v11 = [v9 uuid];
    [v10 removeObjectForKey:v11];

    [v8 removeObject:v9];
    if (*(unsigned char *)(a1 + 48))
    {
      id v12 = *(void **)(*(void *)(a1 + 40) + 16);
      v16[0] = v9;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      [v12 deleteItems:v13 leaveTombstones:0];
    }
    [*(id *)(a1 + 40) notifyObserversOfUpdatedPinnedTabsInProfileWithIdentifier:v7];
    *a4 = 1;
  }
}

uint64_t __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 uuid];
  uint64_t v3 = WBSIsEqual();

  return v3;
}

- (void)willSelectProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  if ((-[NSCountedSet containsObject:](self->_activeProfileIdentifiers, "containsObject:") & 1) == 0) {
    [(PinnedTabsManager *)self _loadPinnedTabsForProfileWithIdentifier:v4];
  }
  [(NSCountedSet *)self->_activeProfileIdentifiers addObject:v4];
}

- (void)didDeselectProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  [(NSCountedSet *)self->_activeProfileIdentifiers removeObject:v4];
  if (([(NSCountedSet *)self->_activeProfileIdentifiers containsObject:v4] & 1) == 0) {
    [(PinnedTabsManager *)self _clearPinnedTabsForProfileWithIdentifier:v4];
  }
}

- (void)_loadPinnedTabsForProfileWithIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WBTabCollection *)self->_tabCollection pinnedTabsForProfileWithIdentifier:v4];
  id v6 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_12);
  id v7 = (void *)[v6 mutableCopy];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
  }
  id v10 = v9;

  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v10;
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
        uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unsigned int v18 = objc_msgSend(v17, "uuid", (void)v19);
        [v11 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  [(NSMutableDictionary *)self->_pinnedTabsByProfileIdentifier setObject:v12 forKeyedSubscript:v4];
  [(NSMutableDictionary *)self->_pinnedTabsByUUIDAndProfileIdentifier setObject:v11 forKeyedSubscript:v4];
}

id __61__PinnedTabsManager__loadPinnedTabsForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  return v2;
}

- (void)_clearPinnedTabsForProfileWithIdentifier:(id)a3
{
  pinnedTabsByProfileIdentifier = self->_pinnedTabsByProfileIdentifier;
  id v5 = a3;
  [(NSMutableDictionary *)pinnedTabsByProfileIdentifier setObject:0 forKeyedSubscript:v5];
  [(NSMutableDictionary *)self->_pinnedTabsByUUIDAndProfileIdentifier setObject:0 forKeyedSubscript:v5];
}

- (void)performUpdatesUsingBlock:(id)a3
{
  ++self->_updateSuppressionCount;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  --self->_updateSuppressionCount;
  [(PinnedTabsManager *)self _notifyObserversAfterUpdatesIfNeeded];
}

- (void)addPinnedTabsObserver:(id)a3
{
  id v4 = a3;
  [(NSHashTable *)self->_observers addObject:v4];
  if (objc_opt_respondsToSelector())
  {
    [v4 pinnedTabsManager:self didUpdatePinnedTabs:self->_pinnedTabs isPrivate:0];
    [v4 pinnedTabsManager:self didUpdatePinnedTabs:self->_privatePinnedTabs isPrivate:1];
  }
  if (objc_opt_respondsToSelector())
  {
    pinnedTabsByProfileIdentifier = self->_pinnedTabsByProfileIdentifier;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__PinnedTabsManager_addPinnedTabsObserver___block_invoke;
    v6[3] = &unk_1E6D7B4C8;
    id v7 = v4;
    id v8 = self;
    [(NSMutableDictionary *)pinnedTabsByProfileIdentifier enumerateKeysAndObjectsUsingBlock:v6];
  }
}

uint64_t __43__PinnedTabsManager_addPinnedTabsObserver___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) pinnedTabsManager:*(void *)(a1 + 40) didUpdatePinnedTabs:a3 inProfileWithIdentifier:a2];
}

- (void)removePinnedTabsObserver:(id)a3
{
}

- (void)notifyObserversOfUpdatedPinnedTabsInContainer:(id)a3
{
  id v7 = a3;
  if ([v7 isPrivateBrowsingEnabled])
  {
    id v4 = self;
    uint64_t v5 = 1;
LABEL_5:
    [(PinnedTabsManager *)v4 notifyObserversOfUpdatedPinnedTabsIsPrivate:v5];
    goto LABEL_7;
  }
  if ([v7 isInDefaultProfile])
  {
    id v4 = self;
    uint64_t v5 = 0;
    goto LABEL_5;
  }
  id v6 = [v7 activeProfileIdentifier];
  [(PinnedTabsManager *)self notifyObserversOfUpdatedPinnedTabsInProfileWithIdentifier:v6];

LABEL_7:
}

- (void)notifyObserversOfUpdatedPinnedTabsIsPrivate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_updateSuppressionCount)
  {
    uint64_t v5 = 1;
    if (a3) {
      uint64_t v5 = 2;
    }
    self->_updateFlags |= v5;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_observers;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      if (v3) {
        uint64_t v10 = 32;
      }
      else {
        uint64_t v10 = 24;
      }
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v12, "pinnedTabsManager:didUpdatePinnedTabs:isPrivate:", self, *(Class *)((char *)&self->super.isa + v10), v3, (void)v13);
          }
        }
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)notifyObserversOfUpdatedPinnedTabsInProfileWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_updateSuppressionCount)
  {
    [(NSMutableSet *)self->_pendingUpdatedProfileIdentifiers addObject:v4];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = self->_observers;
    uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pinnedTabsByProfileIdentifier, "objectForKeyedSubscript:", v4, (void)v12);
            [v10 pinnedTabsManager:self didUpdatePinnedTabs:v11 inProfileWithIdentifier:v4];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)_notifyObserversAfterUpdatesIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_updateSuppressionCount)
  {
    unint64_t updateFlags = self->_updateFlags;
    if (updateFlags)
    {
      [(PinnedTabsManager *)self notifyObserversOfUpdatedPinnedTabsIsPrivate:0];
      unint64_t updateFlags = self->_updateFlags;
    }
    if ((updateFlags & 2) != 0) {
      [(PinnedTabsManager *)self notifyObserversOfUpdatedPinnedTabsIsPrivate:1];
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = self->_pendingUpdatedProfileIdentifiers;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          -[PinnedTabsManager notifyObserversOfUpdatedPinnedTabsInProfileWithIdentifier:](self, "notifyObserversOfUpdatedPinnedTabsInProfileWithIdentifier:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    self->_unint64_t updateFlags = 0;
    [(NSMutableSet *)self->_pendingUpdatedProfileIdentifiers removeAllObjects];
  }
}

- (WBCollectionConfiguration)collectionConfiguration
{
  return self->_collectionConfiguration;
}

- (WBTabCollection)tabCollection
{
  return self->_tabCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionConfiguration, 0);
  objc_storeStrong((id *)&self->_pinnedTabsByUUIDAndProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_pinnedTabsByProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingUpdatedProfileIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeProfileIdentifiers, 0);
  objc_storeStrong((id *)&self->_privatePinnedTabsByUUID, 0);
  objc_storeStrong((id *)&self->_pinnedTabsByUUID, 0);
  objc_storeStrong((id *)&self->_privatePinnedTabs, 0);
  objc_storeStrong((id *)&self->_pinnedTabs, 0);
  objc_storeStrong((id *)&self->_tabCollection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end