@interface SBWorkStore
- (NSArray)keysWithWork;
- (NSMutableArray)observers;
- (NSMutableDictionary)workItemsPerKey;
- (SBWorkStore)initWithMaximumNumberOfWorkItemsPerKey:(unint64_t)a3;
- (double)defaultWorkExpirationPeriod;
- (id)debugDescription;
- (id)dequeueWorkForKey:(id)a3;
- (id)description;
- (unint64_t)maxWorkPerKey;
- (void)_notifyObserversWorkDidChange;
- (void)_workQueue_expireWorkForKey:(id)a3;
- (void)addObserver:(id)a3;
- (void)addWorkItem:(id)a3 forKey:(id)a4;
- (void)purgeWorkForKey:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setDefaultWorkExpirationPeriod:(double)a3;
- (void)setWorkExpirationPeriod:(double)a3 forKey:(id)a4;
@end

@implementation SBWorkStore

- (SBWorkStore)initWithMaximumNumberOfWorkItemsPerKey:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SBWorkStore;
  v4 = [(SBWorkStore *)&v16 init];
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    workItemsPerKey = v4->_workItemsPerKey;
    v4->_workItemsPerKey = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    keysWithWork = v4->_keysWithWork;
    v4->_keysWithWork = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    workExpirationPeriods = v4->_workExpirationPeriods;
    v4->_workExpirationPeriods = v9;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)Serial;

    uint64_t v13 = BSDispatchQueueCreateSerial();
    observerQueue = v4->_observerQueue;
    v4->_observerQueue = (OS_dispatch_queue *)v13;

    v4->_maxWorkPerKey = a3;
  }
  return v4;
}

- (NSArray)keysWithWork
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__103;
  v10 = __Block_byref_object_dispose__103;
  id v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__SBWorkStore_keysWithWork__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __27__SBWorkStore_keysWithWork__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    observerQueue = self->_observerQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __27__SBWorkStore_addObserver___block_invoke;
    v7[3] = &unk_1E6AF5290;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(observerQueue, v7);
  }
}

uint64_t __27__SBWorkStore_addObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__SBWorkStore_removeObserver___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

uint64_t __30__SBWorkStore_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

- (void)addWorkItem:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__SBWorkStore_addWorkItem_forKey___block_invoke;
    block[3] = &unk_1E6AF4E00;
    id v11 = v7;
    v12 = self;
    id v13 = v6;
    dispatch_async(workQueue, block);
  }
}

void __34__SBWorkStore_addWorkItem_forKey___block_invoke(uint64_t a1)
{
  id v6 = (id)[*(id *)(a1 + 32) copy];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "objectForKey:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v2 forKey:v6];
  }
  objc_msgSend(*(id *)(a1 + 40), "_workQueue_expireWorkForKey:", *(void *)(a1 + 32));
  [v2 insertObject:*(void *)(a1 + 48) atIndex:0];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(v3 + 40))
  {
    unint64_t v4 = [v2 count];
    uint64_t v3 = *(void *)(a1 + 40);
    unint64_t v5 = *(void *)(v3 + 40);
    if (v4 > v5)
    {
      objc_msgSend(v2, "removeObjectsInRange:", v5, objc_msgSend(v2, "count") - *(void *)(*(void *)(a1 + 40) + 40));
      uint64_t v3 = *(void *)(a1 + 40);
    }
  }
  [*(id *)(v3 + 16) removeObject:v6];
  [*(id *)(*(void *)(a1 + 40) + 16) insertObject:v6 atIndex:0];
  [*(id *)(a1 + 40) _notifyObserversWorkDidChange];
}

- (id)dequeueWorkForKey:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  objc_super v16 = __Block_byref_object_copy__103;
  v17 = __Block_byref_object_dispose__103;
  id v18 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SBWorkStore_dequeueWorkForKey___block_invoke;
  block[3] = &unk_1E6AFA6F8;
  id v10 = v4;
  id v11 = self;
  v12 = &v13;
  id v6 = v4;
  dispatch_sync(workQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __33__SBWorkStore_dequeueWorkForKey___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "objectForKey:");

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "_workQueue_expireWorkForKey:", *(void *)(a1 + 32));
      uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:*(void *)(a1 + 32)];
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
      unint64_t v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;

      [*(id *)(*(void *)(a1 + 40) + 8) removeObjectForKey:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(a1 + 40) + 16) removeObject:*(void *)(a1 + 32)];
      id v6 = *(void **)(a1 + 40);
      [v6 _notifyObserversWorkDidChange];
    }
  }
}

- (void)purgeWorkForKey:(id)a3
{
  id v3 = [(SBWorkStore *)self dequeueWorkForKey:a3];
}

- (void)setWorkExpirationPeriod:(double)a3 forKey:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SBWorkStore_setWorkExpirationPeriod_forKey___block_invoke;
  block[3] = &unk_1E6AF6FC0;
  id v10 = v6;
  id v11 = self;
  double v12 = a3;
  id v8 = v6;
  dispatch_sync(workQueue, block);
}

void __46__SBWorkStore_setWorkExpirationPeriod_forKey___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void **)(*(void *)(a1 + 40) + 24);
    id v3 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    [v2 setObject:v3 forKey:*(void *)(a1 + 32)];
  }
}

- (void)_workQueue_expireWorkForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v19 = v4;
    unint64_t v5 = [(NSMutableDictionary *)self->_workItemsPerKey objectForKey:v4];
    uint64_t v6 = [v5 count];

    id v4 = v19;
    if (v6)
    {
      double defaultWorkExpirationPeriod = self->_defaultWorkExpirationPeriod;
      id v8 = [(NSMutableDictionary *)self->_workExpirationPeriods objectForKey:v19];
      v9 = v8;
      if (v8)
      {
        [v8 doubleValue];
        double defaultWorkExpirationPeriod = v10;
      }
      if (defaultWorkExpirationPeriod > 0.0)
      {
        id v11 = [(NSMutableDictionary *)self->_workItemsPerKey objectForKey:v19];
        double v12 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v13 = [v12 dateByAddingTimeInterval:-defaultWorkExpirationPeriod];

        if ([v11 count])
        {
          uint64_t v14 = 0;
          int v15 = 0;
          do
          {
            objc_super v16 = [v11 objectAtIndex:v14];
            v17 = [v16 creationDate];
            uint64_t v18 = [v17 compare:v13];

            if (v18 == -1)
            {
              [v11 removeObjectAtIndex:v14];
              --v15;
            }
            uint64_t v14 = ++v15;
          }
          while ([v11 count] > (unint64_t)v15);
        }
      }
      id v4 = v19;
    }
  }
}

- (void)_notifyObserversWorkDidChange
{
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SBWorkStore__notifyObserversWorkDidChange__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(observerQueue, block);
}

void __44__SBWorkStore__notifyObserversWorkDidChange__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "workDidChange:", *(void *)(a1 + 32), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@ %p; maxWork: %d>",
               objc_opt_class(),
               self,
               self->_maxWorkPerKey);
}

- (id)debugDescription
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  objc_super v16 = __Block_byref_object_copy__103;
  v17 = __Block_byref_object_dispose__103;
  id v18 = 0;
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__103;
  id v11 = __Block_byref_object_dispose__103;
  id v12 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SBWorkStore_debugDescription__block_invoke;
  block[3] = &unk_1E6B0B7B8;
  void block[4] = self;
  void block[5] = &v19;
  block[6] = &v13;
  block[7] = &v7;
  dispatch_sync(workQueue, block);
  objc_msgSend(NSString, "stringWithFormat:", @"<%@ %p; maxWork: %d \nkeysWithWork: %@ \nwork: %@>",
    objc_opt_class(),
    self,
    v20[3],
    v14[5],
  uint64_t v4 = v8[5]);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v4;
}

void __31__SBWorkStore_debugDescription__block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 40);
  uint64_t v2 = [*(id *)(a1[4] + 16) copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1[4] + 8) copy];
  uint64_t v6 = *(void *)(a1[7] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (double)defaultWorkExpirationPeriod
{
  return self->_defaultWorkExpirationPeriod;
}

- (void)setDefaultWorkExpirationPeriod:(double)a3
{
  self->_double defaultWorkExpirationPeriod = a3;
}

- (NSMutableDictionary)workItemsPerKey
{
  return self->_workItemsPerKey;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (unint64_t)maxWorkPerKey
{
  return self->_maxWorkPerKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_workExpirationPeriods, 0);
  objc_storeStrong((id *)&self->_keysWithWork, 0);
  objc_storeStrong((id *)&self->_workItemsPerKey, 0);
}

@end