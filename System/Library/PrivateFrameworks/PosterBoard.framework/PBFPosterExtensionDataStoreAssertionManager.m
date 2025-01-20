@interface PBFPosterExtensionDataStoreAssertionManager
- (BOOL)_notifyObserversOfNewAssertions:(id)a3 newlyNotInUseAssertions:(id)a4;
- (BOOL)_notifyObserversOfUpdatedController:(id)a3;
- (BOOL)executeTransaction:(id)a3;
- (PBFPosterExtensionDataStoreAssertionManager)init;
- (id)inUsePosterPathIdentitiesForReason:(id)a3;
- (int64_t)numberOfAssertionsForReason:(id)a3;
- (void)addObserver:(id)a3;
- (void)enumerateObservers:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
@end

@implementation PBFPosterExtensionDataStoreAssertionManager

- (PBFPosterExtensionDataStoreAssertionManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)PBFPosterExtensionDataStoreAssertionManager;
  v2 = [(PBFPosterExtensionDataStoreAssertionManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    invalidationFlag = v2->_invalidationFlag;
    v2->_invalidationFlag = (BSAtomicFlag *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    txFlag = v2->_txFlag;
    v2->_txFlag = (BSAtomicFlag *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v7;

    v9 = objc_alloc_init(_PBFPosterExtensionDataStoreAssertionController);
    controller = v2->_controller;
    v2->_controller = v9;
  }
  return v2;
}

- (BOOL)executeTransaction:(id)a3
{
  v4 = (uint64_t (**)(id, _PBFPosterExtensionDataStoreAssertionController *))a3;
  if (v4 && [(BSAtomicFlag *)self->_txFlag setFlag:1])
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    v6 = [[_PBFPosterExtensionDataStoreAssertionController alloc] initWithController:v5->_controller];
    int v7 = v4[2](v4, v6);
    if (v7) {
      [(PBFPosterExtensionDataStoreAssertionManager *)v5 _notifyObserversOfUpdatedController:v6];
    }
    [(BSAtomicFlag *)self->_txFlag setFlag:0];

    objc_sync_exit(v5);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    v4 = self->_observers;
    objc_sync_enter(v4);
    [(NSHashTable *)self->_observers addObject:v5];
    objc_sync_exit(v4);
  }
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    v4 = self->_observers;
    objc_sync_enter(v4);
    [(NSHashTable *)self->_observers removeObject:v5];
    objc_sync_exit(v4);
  }
}

- (void)enumerateObservers:(id)a3
{
  id v4 = a3;
  char v5 = [(BSAtomicFlag *)self->_invalidationFlag getFlag];
  if (v4 && (v5 & 1) == 0)
  {
    v6 = self->_observers;
    objc_sync_enter(v6);
    int v7 = [(NSHashTable *)self->_observers allObjects];
    v8 = (void *)[v7 copy];

    objc_sync_exit(v6);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__PBFPosterExtensionDataStoreAssertionManager_enumerateObservers___block_invoke;
    v9[3] = &unk_1E6983950;
    id v10 = v4;
    [v8 enumerateObjectsUsingBlock:v9];
  }
}

uint64_t __66__PBFPosterExtensionDataStoreAssertionManager_enumerateObservers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_notifyObserversOfUpdatedController:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    BOOL v6 = 0;
  }
  else
  {
    int v7 = self;
    objc_sync_enter(v7);
    obuint64_t j = v7;
    v8 = [(_PBFPosterExtensionDataStoreAssertionController *)v7->_controller inUseAssertionsByIdentity];
    v9 = [v5 inUseAssertionsByIdentity];
    id v26 = v5;
    v30 = objc_opt_new();
    id v10 = objc_opt_new();
    p_controller = (id *)&v7->_controller;
    id v28 = a3;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v11 = [v8 keyEnumerator];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          v16 = [v9 objectForKey:v15];
          BOOL v17 = [v16 count] == 0;

          if (v17) {
            [v10 addObject:v15];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v12);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v18 = [v9 keyEnumerator];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v31 + 1) + 8 * j);
          v23 = [v8 objectForKey:v22];
          BOOL v24 = [v23 count] == 0;

          if (v24) {
            [v30 addObject:v22];
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v19);
    }

    objc_storeStrong(p_controller, v28);
    BOOL v6 = [(PBFPosterExtensionDataStoreAssertionManager *)obj _notifyObserversOfNewAssertions:v30 newlyNotInUseAssertions:v10];

    objc_sync_exit(obj);
    id v5 = v26;
  }

  return v6;
}

- (BOOL)_notifyObserversOfNewAssertions:(id)a3 newlyNotInUseAssertions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __103__PBFPosterExtensionDataStoreAssertionManager__notifyObserversOfNewAssertions_newlyNotInUseAssertions___block_invoke;
    v10[3] = &unk_1E6983978;
    id v11 = v6;
    uint64_t v12 = self;
    id v13 = v7;
    [(PBFPosterExtensionDataStoreAssertionManager *)self enumerateObservers:v10];

    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __103__PBFPosterExtensionDataStoreAssertionManager__notifyObserversOfNewAssertions_newlyNotInUseAssertions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 assertionManager:*(void *)(a1 + 40) identityIsNowMarkedAsInUse:*(void *)(*((void *)&v18 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v3, "assertionManager:identityIsNowMarkedAsNOTInUse:", *(void *)(a1 + 40), *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)invalidate
{
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    [(_PBFPosterExtensionDataStoreAssertionController *)self->_controller invalidate];
    controller = self->_controller;
    self->_controller = 0;
  }
}

- (id)inUsePosterPathIdentitiesForReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(_PBFPosterExtensionDataStoreAssertionController *)v5->_controller inUsePosterPathIdentitiesForReason:v4];
  objc_sync_exit(v5);

  return v6;
}

- (int64_t)numberOfAssertionsForReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  int64_t v6 = [(_PBFPosterExtensionDataStoreAssertionController *)v5->_controller numberOfAssertionsForReason:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_txFlag, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end