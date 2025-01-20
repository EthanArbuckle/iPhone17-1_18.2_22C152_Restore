@interface IMMemoryCache
- (BOOL)_shouldRemoveIndex:(unint64_t)a3;
- (BOOL)evictsItemsWithDiscardedContent;
- (IMMemoryCache)init;
- (NSMutableArray)itemsArray;
- (NSMutableDictionary)items;
- (NSOperationQueue)queue;
- (NSString)name;
- (OS_dispatch_queue)accessQueue;
- (double)lastCheckTime;
- (id)allKeys;
- (id)delegate;
- (id)description;
- (id)objectForKey:(id)a3;
- (int64_t)numberOfCachedItems;
- (unint64_t)costForObjectWithKey:(id)a3;
- (unint64_t)count;
- (unint64_t)countLimit;
- (unint64_t)totalCost;
- (unint64_t)totalCostLimit;
- (void)_addItem:(id)a3 forKey:(id)a4;
- (void)_checkLimits;
- (void)_checkLimitsAndEvictObjects;
- (void)_removeObjectForKey:(id)a3;
- (void)checkLimitsAndEvictObjects;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeyWithPrefix:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setCountLimit:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEvictsItemsWithDiscardedContent:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setItemsArray:(id)a3;
- (void)setLastCheckTime:(double)a3;
- (void)setName:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5;
- (void)setQueue:(id)a3;
- (void)setTotalCost:(unint64_t)a3;
- (void)setTotalCostLimit:(unint64_t)a3;
@end

@implementation IMMemoryCache

- (void)setTotalCostLimit:(unint64_t)a3
{
  self->_totalCostLimit = a3;
}

- (void)setName:(id)a3
{
}

- (IMMemoryCache)init
{
  v14.receiver = self;
  v14.super_class = (Class)IMMemoryCache;
  v2 = [(IMMemoryCache *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    items = v2->_items;
    v2->_items = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    itemsArray = v2->_itemsArray;
    v2->_itemsArray = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    queue = v2->_queue;
    v2->_queue = (NSOperationQueue *)v7;

    [(NSOperationQueue *)v2->_queue setMaxConcurrentOperationCount:1];
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.itunesmobile.immemorycache", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v9;

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v2->_lastCheckTime = v11;
    v12 = v2;
  }

  return v2;
}

- (id)allKeys
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__IMMemoryCache_allKeys__block_invoke;
  v5[3] = &unk_1E6E1FD20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __24__IMMemoryCache_allKeys__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) items];
  v2 = [v6 allKeys];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    objc_super v14 = __Block_byref_object_copy__0;
    v15 = __Block_byref_object_dispose__0;
    id v16 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__IMMemoryCache_objectForKey___block_invoke;
    block[3] = &unk_1E6E1FD80;
    block[4] = self;
    id v9 = v4;
    v10 = &v11;
    dispatch_sync(accessQueue, block);
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __30__IMMemoryCache_objectForKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) items];
  id v13 = [v2 objectForKey:*(void *)(a1 + 40)];

  uint64_t v3 = v13;
  if (v13)
  {
    id v4 = [*(id *)(a1 + 32) itemsArray];
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v13, "timeStamp"));
    uint64_t v6 = objc_msgSend(v4, "pf_indexOfObjectWithValue:forKeyPath:", v5, @"timeStamp");

    if (v6 == 0x7FFFFFFFFFFFFFFFLL
      && (NSLog(&cfstr_SInitialObject.isa, "-[IMMemoryCache objectForKey:]_block_invoke"),
          [*(id *)(a1 + 32) itemsArray],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = [v7 indexOfObjectIdenticalTo:v13],
          v7,
          v6 == 0x7FFFFFFFFFFFFFFFLL))
    {
      NSLog(&cfstr_SCompleteObjec.isa, "-[IMMemoryCache objectForKey:]_block_invoke");
      uint64_t v8 = [*(id *)(a1 + 32) items];
      [v8 removeObjectForKey:*(void *)(a1 + 40)];
    }
    else
    {
      id v9 = [*(id *)(a1 + 32) itemsArray];
      [v9 removeObjectAtIndex:v6];

      v10 = [*(id *)(a1 + 32) itemsArray];
      [v10 addObject:v13];

      [v13 setTimeStamp:mach_absolute_time()];
      uint64_t v11 = [v13 item];
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }

    uint64_t v3 = v13;
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = +[_IMMemoryCacheItem cacheItemWithItem:a3 key:v6 cost:0];
  [(IMMemoryCache *)self _addItem:v7 forKey:v6];
}

- (void)setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5
{
  id v8 = a4;
  id v9 = +[_IMMemoryCacheItem cacheItemWithItem:a3 key:v8 cost:a5];
  [(IMMemoryCache *)self _addItem:v9 forKey:v8];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__IMMemoryCache_removeObjectForKey___block_invoke;
    v7[3] = &unk_1E6E1FB70;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(accessQueue, v7);
  }
}

uint64_t __36__IMMemoryCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)removeAllObjects
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__IMMemoryCache_removeAllObjects__block_invoke;
  block[3] = &unk_1E6E1FAA8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

void __33__IMMemoryCache_removeAllObjects__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCount:0];
  [*(id *)(a1 + 32) setTotalCost:0];
  v2 = [*(id *)(a1 + 32) items];
  [v2 removeAllObjects];

  id v3 = [*(id *)(a1 + 32) itemsArray];
  [v3 removeAllObjects];
}

- (void)removeObjectsForKeyWithPrefix:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    accessQueue = self->_accessQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__IMMemoryCache_removeObjectsForKeyWithPrefix___block_invoke;
    v6[3] = &unk_1E6E1FB70;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(accessQueue, v6);
  }
}

void __47__IMMemoryCache_removeObjectsForKeyWithPrefix___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) items];
  id v3 = [v2 allKeys];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasPrefix:", *(void *)(a1 + 40), (void)v10)) {
          [*(id *)(a1 + 32) _removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)_shouldRemoveIndex:(unint64_t)a3
{
  id v4 = [(NSMutableArray *)self->_itemsArray objectAtIndex:a3];
  if (![v4 conformsToProtocol]) {
    goto LABEL_3;
  }
  uint64_t v5 = [v4 item];
  [v5 discardContentIfPossible];

  uint64_t v6 = [v4 item];
  int v7 = [v6 isContentDiscarded];

  if (!v7)
  {
    BOOL v18 = 0;
  }
  else
  {
LABEL_3:
    id v8 = [(IMMemoryCache *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      long long v10 = [(IMMemoryCache *)self delegate];
      long long v11 = [v4 item];
      [v10 cache:self willEvictObject:v11];
    }
    uint64_t v12 = [v4 cost];
    int64x2_t v13 = *(int64x2_t *)&self->_totalCost;
    v14.i64[0] = -1;
    v14.i64[1] = -1;
    v15.i64[1] = -1;
    v15.i64[0] = v12;
    v15.i64[0] = vsubq_s64(v13, v15).u64[0];
    v15.i64[1] = vaddq_s64(v13, v14).i64[1];
    *(int64x2_t *)&self->_totalCost = v15;
    items = self->_items;
    v17 = [v4 key];
    [(NSMutableDictionary *)items removeObjectForKey:v17];

    BOOL v18 = 1;
  }

  return v18;
}

- (void)checkLimitsAndEvictObjects
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__IMMemoryCache_checkLimitsAndEvictObjects__block_invoke;
  block[3] = &unk_1E6E1FAA8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

uint64_t __43__IMMemoryCache_checkLimitsAndEvictObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkLimitsAndEvictObjects];
}

- (void)_checkLimitsAndEvictObjects
{
  unint64_t totalCostLimit = self->_totalCostLimit;
  if (totalCostLimit && self->_totalCost > totalCostLimit)
  {
    unint64_t count = self->_count;
    uint64_t v5 = [MEMORY[0x1E4F28E60] indexSet];
    if (count)
    {
      uint64_t v6 = 0;
      unint64_t v7 = count - 1;
      do
      {
        if ([(IMMemoryCache *)self _shouldRemoveIndex:v6]) {
          [v5 addIndex:v6];
        }
      }
      while (self->_totalCost > self->_totalCostLimit && v7 != v6++);
    }
    [(NSMutableArray *)self->_itemsArray removeObjectsAtIndexes:v5];
  }
  unint64_t countLimit = self->_countLimit;
  if (countLimit)
  {
    unint64_t v10 = self->_count;
    if (v10 > countLimit)
    {
      id v14 = [MEMORY[0x1E4F28E60] indexSet];
      uint64_t v11 = 0;
      unint64_t v12 = v10 - 1;
      do
      {
        if ([(IMMemoryCache *)self _shouldRemoveIndex:v11]) {
          [v14 addIndex:v11];
        }
      }
      while (self->_count > self->_countLimit && v12 != v11++);
      [(NSMutableArray *)self->_itemsArray removeObjectsAtIndexes:v14];
    }
  }
}

- (void)_checkLimits
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if (v3 - self->_lastCheckTime > 0.1
    && ((unint64_t countLimit = self->_countLimit) != 0 && self->_count > countLimit
     || (unint64_t totalCostLimit = self->_totalCostLimit) != 0 && self->_totalCost > totalCostLimit))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_lastCheckTime = v6;
    [(IMMemoryCache *)self _checkLimitsAndEvictObjects];
  }
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)totalCost
{
  return self->_totalCost;
}

- (unint64_t)costForObjectWithKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    int64x2_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__IMMemoryCache_costForObjectWithKey___block_invoke;
    block[3] = &unk_1E6E1FD80;
    block[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    dispatch_sync(accessQueue, block);
    unint64_t v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

uint64_t __38__IMMemoryCache_costForObjectWithKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) items];
  uint64_t v5 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v5) {
    uint64_t v3 = [v5 cost];
  }
  else {
    uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;

  return MEMORY[0x1F41817F8]();
}

- (int64_t)numberOfCachedItems
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__IMMemoryCache_numberOfCachedItems__block_invoke;
  v5[3] = &unk_1E6E1FD20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __36__IMMemoryCache_numberOfCachedItems__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) itemsArray];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (id)description
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__IMMemoryCache_description__block_invoke;
  v5[3] = &unk_1E6E1FD20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__IMMemoryCache_description__block_invoke(uint64_t a1)
{
  id v15 = [NSString alloc];
  uint64_t v14 = objc_opt_class();
  id v2 = *(void **)(a1 + 32);
  id v16 = [v2 items];
  uint64_t v3 = [v16 count];
  id v4 = [*(id *)(a1 + 32) itemsArray];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [*(id *)(a1 + 32) count];
  uint64_t v7 = [*(id *)(a1 + 32) countLimit];
  uint64_t v8 = [*(id *)(a1 + 32) totalCost];
  uint64_t v9 = [*(id *)(a1 + 32) totalCostLimit];
  id v10 = [*(id *)(a1 + 32) items];
  uint64_t v11 = objc_msgSend(v15, "initWithFormat:", @"<%@: %p>; Item Dictionary Count: %d; Item Array Count: %d; Internal Count: %d; Count Limit: %d; Current Cost: %d; Cost Limit: %d; Items: %@",
          v14,
          v2,
          v3,
          v5,
          v6,
          v7,
          v8,
          v9,
          v10);
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  int64x2_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (void)_addItem:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__IMMemoryCache__addItem_forKey___block_invoke;
    block[3] = &unk_1E6E1FCA8;
    block[4] = self;
    id v10 = v7;
    id v11 = v6;
    dispatch_sync(accessQueue, block);
  }
}

uint64_t __33__IMMemoryCache__addItem_forKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) items];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3) {
    [*(id *)(a1 + 32) _removeObjectForKey:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 48) setTimeStamp:mach_absolute_time()];
  id v4 = [*(id *)(a1 + 32) items];
  [v4 setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];

  uint64_t v5 = [*(id *)(a1 + 32) itemsArray];
  [v5 addObject:*(void *)(a1 + 48)];

  objc_msgSend(*(id *)(a1 + 32), "setCount:", objc_msgSend(*(id *)(a1 + 32), "count") + 1);
  if ([*(id *)(a1 + 48) cost]) {
    objc_msgSend(*(id *)(a1 + 32), "setTotalCost:", objc_msgSend(*(id *)(a1 + 32), "totalCost") + objc_msgSend(*(id *)(a1 + 48), "cost"));
  }
  id v6 = *(void **)(a1 + 32);

  return [v6 _checkLimits];
}

- (void)_removeObjectForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    uint64_t v5 = [(NSMutableDictionary *)self->_items objectForKey:v4];
    id v6 = v5;
    if (v5)
    {
      --self->_count;
      uint64_t v7 = [v5 cost];
      items = self->_items;
      self->_totalCost -= v7;
      [(NSMutableDictionary *)items removeObjectForKey:v12];
      itemsArray = self->_itemsArray;
      id v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "timeStamp"));
      uint64_t v11 = [(NSMutableArray *)itemsArray pf_indexOfObjectWithValue:v10 forKeyPath:@"timeStamp"];

      if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
        [(NSMutableArray *)self->_itemsArray removeObjectAtIndex:v11];
      }
    }
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)name
{
  return self->_name;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (BOOL)evictsItemsWithDiscardedContent
{
  return self->_evictsItemsWithDiscardedContent;
}

- (void)setEvictsItemsWithDiscardedContent:(BOOL)a3
{
  self->_evictsItemsWithDiscardedContent = a3;
}

- (unint64_t)totalCostLimit
{
  return self->_totalCostLimit;
}

- (unint64_t)countLimit
{
  return self->_countLimit;
}

- (void)setCountLimit:(unint64_t)a3
{
  self->_unint64_t countLimit = a3;
}

- (NSMutableArray)itemsArray
{
  return self->_itemsArray;
}

- (void)setItemsArray:(id)a3
{
}

- (NSMutableDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void)setTotalCost:(unint64_t)a3
{
  self->_totalCost = a3;
}

- (void)setCount:(unint64_t)a3
{
  self->_unint64_t count = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (double)lastCheckTime
{
  return self->_lastCheckTime;
}

- (void)setLastCheckTime:(double)a3
{
  self->_lastCheckTime = a3;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_itemsArray, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end