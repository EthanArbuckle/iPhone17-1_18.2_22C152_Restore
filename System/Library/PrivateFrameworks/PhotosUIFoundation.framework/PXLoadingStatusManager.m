@interface PXLoadingStatusManager
+ (PXLoadingStatusManager)defaultManager;
- (BOOL)_isUpdateScheduled;
- (BOOL)_needsUpdate;
- (NSMapTable)_loadOperationTrackingIDsByItemIdentifier;
- (NSMapTable)_loadingStatusByItemIdentifier;
- (NSMutableDictionary)_itemIdentifierByLoadOperationTrackingID;
- (NSMutableDictionary)_loadingStatusByLoadOperationTrackingID;
- (NSMutableSet)_invalidLoadingStatusItemIdentifiers;
- (PXLoadingStatusManager)init;
- (id)loadingStatusForItemIdentifier:(id)a3;
- (id)willBeginLoadOperationWithItemIdentifier:(id)a3;
- (void)_didUpdateLoadOperationWithTrackingID:(id)a3 withProgress:(double)a4 indeterminate:(BOOL)a5;
- (void)_invalidateLoadingStatusForItemIdentifier:(id)a3;
- (void)_resetLoadingStatusForItemIdentifierIfAppropriate:(id)a3;
- (void)_setLoadingStatus:(id)a3 forItemIdentifier:(id)a4;
- (void)_setLoadingStatus:(id)a3 forLoadOperationTrackingID:(id)a4;
- (void)_setNeedsUpdate;
- (void)_setUpdateScheduled:(BOOL)a3;
- (void)_updateIfNeeded;
- (void)_updateLoadingStatusForItemIdentifier:(id)a3;
- (void)_updateLoadingStatusForItemIdentifierIfNeeded:(id)a3;
- (void)_updateLoadingStatusForItemIdentifiersIfNeeded;
- (void)_updateNowIfNeeded;
- (void)didCancelLoadOperationWithTrackingID:(id)a3;
- (void)didCompleteLoadOperationWithTrackingID:(id)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)didUpdateLoadOperationWithIndeterminateProgressWithTrackingID:(id)a3;
- (void)didUpdateLoadOperationWithTrackingID:(id)a3 withProgress:(double)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation PXLoadingStatusManager

- (void)didCompleteLoadOperationWithTrackingID:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v17 = a3;
  id v9 = a5;
  if (!v17)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXLoadingStatusManager.m", 115, @"Invalid parameter not satisfying: %@", @"loadOperationTrackingID" object file lineNumber description];
  }
  v10 = [(PXLoadingStatusManager *)self _loadingStatusByLoadOperationTrackingID];
  v11 = [v10 objectForKeyedSubscript:v17];

  if (v11)
  {
    v12 = [PXOperationStatus alloc];
    if (v6)
    {
      uint64_t v13 = 2;
      id v14 = 0;
    }
    else
    {
      uint64_t v13 = 3;
      id v14 = v9;
    }
    v15 = [(PXOperationStatus *)v12 initWithState:v13 progress:v14 error:1.0];

    [(PXLoadingStatusManager *)self _setLoadingStatus:v15 forLoadOperationTrackingID:v17];
  }
}

- (void)_didUpdateLoadOperationWithTrackingID:(id)a3 withProgress:(double)a4 indeterminate:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  if (!v15)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXLoadingStatusManager.m", 100, @"Invalid parameter not satisfying: %@", @"loadOperationTrackingID" object file lineNumber description];
  }
  id v9 = [(PXLoadingStatusManager *)self _itemIdentifierByLoadOperationTrackingID];
  v10 = [v9 objectForKeyedSubscript:v15];

  [(PXLoadingStatusManager *)self _resetLoadingStatusForItemIdentifierIfAppropriate:v10];
  v11 = [PXOperationStatus alloc];
  if (v5) {
    uint64_t v12 = [(PXOperationStatus *)v11 initWithState:1 error:0];
  }
  else {
    uint64_t v12 = [(PXOperationStatus *)v11 initWithState:1 progress:0 error:a4];
  }
  uint64_t v13 = (void *)v12;
  [(PXLoadingStatusManager *)self _setLoadingStatus:v12 forLoadOperationTrackingID:v15];
}

- (void)_resetLoadingStatusForItemIdentifierIfAppropriate:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(PXLoadingStatusManager *)self _loadOperationTrackingIDsByItemIdentifier];
  BOOL v6 = [v5 objectForKey:v4];

  v7 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v6, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v14 = [(PXLoadingStatusManager *)self _loadingStatusByLoadOperationTrackingID];
        id v15 = [v14 objectForKeyedSubscript:v13];

        if ([v15 state] == 1)
        {
          [v7 removeAllObjects];

          goto LABEL_13;
        }
        if (v15) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  if ([v7 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * j);
          v22 = [(PXLoadingStatusManager *)self _loadingStatusByLoadOperationTrackingID];
          [v22 removeObjectForKey:v21];

          v23 = [(PXLoadingStatusManager *)self _itemIdentifierByLoadOperationTrackingID];
          [v23 removeObjectForKey:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v18);
    }

    [v8 minusSet:v16];
    [(PXLoadingStatusManager *)self _invalidateLoadingStatusForItemIdentifier:v4];
  }
}

- (void)_updateLoadingStatusForItemIdentifiersIfNeeded
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(PXLoadingStatusManager *)self _invalidLoadingStatusItemIdentifiers];
  id v4 = (void *)[v3 copy];
  [v3 removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
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
        -[PXLoadingStatusManager _updateLoadingStatusForItemIdentifier:](self, "_updateLoadingStatusForItemIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_updateLoadingStatusForItemIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PXLoadingStatusManager *)self _loadOperationTrackingIDsByItemIdentifier];
  uint64_t v6 = [v5 objectForKey:v4];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    long long v10 = 0;
    uint64_t v11 = *(void *)v19;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v15 = [(PXLoadingStatusManager *)self _loadingStatusByLoadOperationTrackingID];
        id v16 = [v15 objectForKeyedSubscript:v14];

        if (v16)
        {
          if (v12 == 0.0)
          {
            id v17 = v16;

            double v12 = v12 + 1.0;
          }
          else
          {
            double v12 = v12 + 1.0;
            id v17 = [v10 operationStatusByMixingOperationStatus:v16 withMixFactor:1.0 / v12];
          }
          long long v10 = v17;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  else
  {
    long long v10 = 0;
  }

  [(PXLoadingStatusManager *)self _setLoadingStatus:v10 forItemIdentifier:v4];
}

- (void)_setLoadingStatus:(id)a3 forItemIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PXLoadingStatusManager *)self _loadingStatusByItemIdentifier];
  id v9 = [v8 objectForKey:v7];
  if (v9 != v6 && ([v6 isEqual:v9] & 1) == 0)
  {
    if (v6) {
      [v8 setObject:v6 forKey:v7];
    }
    else {
      [v8 removeObjectForKey:v7];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v10 = self->_observers;
    uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "loadingStatusManager:didUpdateLoadingStatus:forItemIdentifier:", self, v6, v7, (void)v15);
        }
        uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (id)willBeginLoadOperationWithItemIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXLoadingStatusManager.m", 69, @"Invalid parameter not satisfying: %@", @"itemIdentifier" object file lineNumber description];
  }
  id v6 = [(PXLoadingStatusManager *)self _loadingStatusByItemIdentifier];
  id v7 = [v6 objectForKey:v5];

  if ([v7 state] == 3) {
    [(PXLoadingStatusManager *)self _resetLoadingStatusForItemIdentifierIfAppropriate:v5];
  }
  uint64_t v8 = [MEMORY[0x263F08C38] UUID];
  id v9 = [v8 UUIDString];

  long long v10 = [(PXLoadingStatusManager *)self _loadOperationTrackingIDsByItemIdentifier];
  uint64_t v11 = [v10 objectForKey:v5];

  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    uint64_t v12 = [(PXLoadingStatusManager *)self _loadOperationTrackingIDsByItemIdentifier];
    [v12 setObject:v11 forKey:v5];
  }
  [v11 addObject:v9];
  uint64_t v13 = [(PXLoadingStatusManager *)self _itemIdentifierByLoadOperationTrackingID];
  [v13 setObject:v5 forKeyedSubscript:v9];

  return v9;
}

- (NSMapTable)_loadOperationTrackingIDsByItemIdentifier
{
  return self->__loadOperationTrackingIDsByItemIdentifier;
}

- (NSMapTable)_loadingStatusByItemIdentifier
{
  return self->__loadingStatusByItemIdentifier;
}

- (void)_setLoadingStatus:(id)a3 forLoadOperationTrackingID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(PXLoadingStatusManager *)self _loadingStatusByLoadOperationTrackingID];
  id v8 = [v7 objectForKeyedSubscript:v6];
  if (v8 != v11 && ([v11 isEqual:v8] & 1) == 0)
  {
    if (v11) {
      [v7 setObject:v11 forKeyedSubscript:v6];
    }
    else {
      [v7 removeObjectForKey:v6];
    }
    id v9 = [(PXLoadingStatusManager *)self _itemIdentifierByLoadOperationTrackingID];
    long long v10 = [v9 objectForKeyedSubscript:v6];

    [(PXLoadingStatusManager *)self _invalidateLoadingStatusForItemIdentifier:v10];
  }
}

- (NSMutableDictionary)_loadingStatusByLoadOperationTrackingID
{
  return self->__loadingStatusByLoadOperationTrackingID;
}

- (NSMutableDictionary)_itemIdentifierByLoadOperationTrackingID
{
  return self->__itemIdentifierByLoadOperationTrackingID;
}

- (void)_setNeedsUpdate
{
  v4[1] = *MEMORY[0x263EF8340];
  if (![(PXLoadingStatusManager *)self _isUpdateScheduled])
  {
    [(PXLoadingStatusManager *)self _setUpdateScheduled:1];
    v4[0] = *MEMORY[0x263EFF588];
    v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
    [(PXLoadingStatusManager *)self performSelector:sel__updateNowIfNeeded withObject:0 afterDelay:v3 inModes:0.0];
  }
}

- (BOOL)_isUpdateScheduled
{
  return self->__isUpdateScheduled;
}

- (BOOL)_needsUpdate
{
  v2 = [(PXLoadingStatusManager *)self _invalidLoadingStatusItemIdentifiers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_invalidateLoadingStatusForItemIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PXLoadingStatusManager *)self _invalidLoadingStatusItemIdentifiers];
    [v5 addObject:v4];

    [(PXLoadingStatusManager *)self _setNeedsUpdate];
  }
}

- (NSMutableSet)_invalidLoadingStatusItemIdentifiers
{
  return self->__invalidLoadingStatusItemIdentifiers;
}

- (void)_setUpdateScheduled:(BOOL)a3
{
  self->__isUpdateScheduled = a3;
}

- (void)didUpdateLoadOperationWithTrackingID:(id)a3 withProgress:(double)a4
{
}

- (PXLoadingStatusManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)PXLoadingStatusManager;
  v2 = [(PXLoadingStatusManager *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    loadOperationTrackingIDsByItemIdentifier = v2->__loadOperationTrackingIDsByItemIdentifier;
    v2->__loadOperationTrackingIDsByItemIdentifier = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    loadingStatusByItemIdentifier = v2->__loadingStatusByItemIdentifier;
    v2->__loadingStatusByItemIdentifier = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    itemIdentifierByLoadOperationTrackingID = v2->__itemIdentifierByLoadOperationTrackingID;
    v2->__itemIdentifierByLoadOperationTrackingID = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    loadingStatusByLoadOperationTrackingID = v2->__loadingStatusByLoadOperationTrackingID;
    v2->__loadingStatusByLoadOperationTrackingID = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    invalidLoadingStatusItemIdentifiers = v2->__invalidLoadingStatusItemIdentifiers;
    v2->__invalidLoadingStatusItemIdentifiers = (NSMutableSet *)v11;

    uint64_t v13 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v13;
  }
  return v2;
}

- (void)_updateNowIfNeeded
{
  [(PXLoadingStatusManager *)self _setUpdateScheduled:0];

  [(PXLoadingStatusManager *)self _updateIfNeeded];
}

- (void)_updateIfNeeded
{
  if ([(PXLoadingStatusManager *)self _needsUpdate])
  {
    [(PXLoadingStatusManager *)self _updateLoadingStatusForItemIdentifiersIfNeeded];
    if ([(PXLoadingStatusManager *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x263F08690] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PXLoadingStatusManager.m" lineNumber:201 description:@"updates still needed after an update cycle"];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loadingStatusByLoadOperationTrackingID, 0);
  objc_storeStrong((id *)&self->__itemIdentifierByLoadOperationTrackingID, 0);
  objc_storeStrong((id *)&self->__loadingStatusByItemIdentifier, 0);
  objc_storeStrong((id *)&self->__loadOperationTrackingIDsByItemIdentifier, 0);
  objc_storeStrong((id *)&self->__invalidLoadingStatusItemIdentifiers, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_updateLoadingStatusForItemIdentifierIfNeeded:(id)a3
{
  id v5 = a3;
  id v4 = [(PXLoadingStatusManager *)self _invalidLoadingStatusItemIdentifiers];
  if ([v4 containsObject:v5])
  {
    [v4 removeObject:v5];
    [(PXLoadingStatusManager *)self _updateLoadingStatusForItemIdentifier:v5];
  }
}

- (void)didCancelLoadOperationWithTrackingID:(id)a3
{
  id v13 = a3;
  if (!v13)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXLoadingStatusManager.m", 128, @"Invalid parameter not satisfying: %@", @"loadOperationTrackingID" object file lineNumber description];
  }
  id v5 = [(PXLoadingStatusManager *)self _loadingStatusByLoadOperationTrackingID];
  id v6 = [v5 objectForKeyedSubscript:v13];

  if (v6)
  {
    uint64_t v7 = [PXOperationStatus alloc];
    [v6 progress];
    double v9 = v8;
    long long v10 = [v6 error];
    uint64_t v11 = [(PXOperationStatus *)v7 initWithState:4 progress:v10 error:v9];

    [(PXLoadingStatusManager *)self _setLoadingStatus:v11 forLoadOperationTrackingID:v13];
  }
}

- (void)didUpdateLoadOperationWithIndeterminateProgressWithTrackingID:(id)a3
{
}

- (id)loadingStatusForItemIdentifier:(id)a3
{
  id v4 = a3;
  [(PXLoadingStatusManager *)self _updateLoadingStatusForItemIdentifierIfNeeded:v4];
  id v5 = [(PXLoadingStatusManager *)self _loadingStatusByItemIdentifier];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)unregisterObserver:(id)a3
{
}

- (void)registerObserver:(id)a3
{
}

+ (PXLoadingStatusManager)defaultManager
{
  if (defaultManager_onceToken_3707[0] != -1) {
    dispatch_once(defaultManager_onceToken_3707, &__block_literal_global_3708);
  }
  v2 = (void *)defaultManager_manager;

  return (PXLoadingStatusManager *)v2;
}

uint64_t __40__PXLoadingStatusManager_defaultManager__block_invoke()
{
  v0 = objc_alloc_init(PXLoadingStatusManager);
  uint64_t v1 = defaultManager_manager;
  defaultManager_manager = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end