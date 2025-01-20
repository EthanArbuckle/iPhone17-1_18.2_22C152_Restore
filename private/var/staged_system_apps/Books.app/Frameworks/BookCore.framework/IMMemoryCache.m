@interface IMMemoryCache
- (BOOL)_removeItemFromItemsDictionaryIfReady:(unint64_t)a3;
- (BOOL)evictsItemsWithDiscardedContent;
- (BOOL)hasObjectForKey:(id)a3;
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
- (void)_willEvict:(id)a3;
- (void)checkLimitsAndEvictObjects;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeyWithPrefix:(id)a3;
- (void)removeObjectsForKeyWithPrefix:(id)a3 andSuffix:(id)a4;
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

    +[NSDate timeIntervalSinceReferenceDate];
    v2->_lastCheckTime = v11;
    v12 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(IMMemoryCache *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)IMMemoryCache;
  [(IMMemoryCache *)&v3 dealloc];
}

- (id)allKeys
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = sub_18A48C;
  v10 = sub_18A49C;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_18A4A4;
  v5[3] = &unk_2C39F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)hasObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  objc_super v14 = sub_18A48C;
  v15 = sub_18A49C;
  id v16 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_18A60C;
  block[3] = &unk_2C3AD0;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = v12[5] != 0;

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_18A48C;
  id v16 = sub_18A49C;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_18A76C;
  block[3] = &unk_2C4720;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
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
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_18AA80;
    v7[3] = &unk_2C3AF8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(accessQueue, v7);
  }
}

- (void)removeAllObjects
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_18AB00;
  block[3] = &unk_2C3C50;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)removeObjectsForKeyWithPrefix:(id)a3 andSuffix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_18AC20;
    block[3] = &unk_2C48E0;
    block[4] = self;
    id v11 = v6;
    id v12 = v8;
    dispatch_sync(accessQueue, block);
  }
}

- (void)removeObjectsForKeyWithPrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_18ADF0;
    v7[3] = &unk_2C3AF8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(accessQueue, v7);
  }
}

- (BOOL)_removeItemFromItemsDictionaryIfReady:(unint64_t)a3
{
  id v4 = [(NSMutableArray *)self->_itemsArray objectAtIndex:a3];
  if (![v4 conformsToProtocol]) {
    goto LABEL_3;
  }
  uint64_t v5 = [v4 item];
  [v5 discardContentIfPossible];

  id v6 = [v4 item];
  unsigned int v7 = [v6 isContentDiscarded];

  if (!v7)
  {
    BOOL v11 = 0;
  }
  else
  {
LABEL_3:
    [(IMMemoryCache *)self _willEvict:v4];
    unint64_t v8 = self->_totalCost - (void)[v4 cost];
    --self->_count;
    self->_totalCost = v8;
    items = self->_items;
    id v10 = [v4 key];
    [(NSMutableDictionary *)items removeObjectForKey:v10];

    BOOL v11 = 1;
  }

  return v11;
}

- (void)_willEvict:(id)a3
{
  id v6 = a3;
  id v4 = [(IMMemoryCache *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v6 item];
    [v4 cache:self willEvictObject:v5];
  }
}

- (void)checkLimitsAndEvictObjects
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_18B0E4;
  block[3] = &unk_2C3C50;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)_checkLimitsAndEvictObjects
{
  unint64_t totalCostLimit = self->_totalCostLimit;
  if (totalCostLimit && self->_totalCost > totalCostLimit)
  {
    unint64_t count = self->_count;
    uint64_t v5 = +[NSMutableIndexSet indexSet];
    if (count)
    {
      uint64_t v6 = 0;
      unint64_t v7 = count - 1;
      do
      {
        if ([(IMMemoryCache *)self _removeItemFromItemsDictionaryIfReady:v6]) {
          [v5 addIndex:v6];
        }
      }
      while (self->_totalCost > self->_totalCostLimit && v7 != v6++);
    }
    [(NSMutableArray *)self->_itemsArray removeObjectsAtIndexes:v5];
    uint64_t v9 = 20;
    do
    {
      if (self->_totalCost <= self->_totalCostLimit) {
        break;
      }
      if (![(NSMutableArray *)self->_itemsArray count]) {
        break;
      }
      id v10 = [(NSMutableArray *)self->_itemsArray objectAtIndex:0];
      [(IMMemoryCache *)self _willEvict:v10];
      BOOL v11 = [v10 key];
      [(IMMemoryCache *)self _removeObjectForKey:v11];

      --v9;
    }
    while (v9);
  }
  unint64_t countLimit = self->_countLimit;
  if (countLimit)
  {
    unint64_t v13 = self->_count;
    if (v13 > countLimit)
    {
      id v17 = +[NSMutableIndexSet indexSet];
      uint64_t v14 = 0;
      unint64_t v15 = v13 - 1;
      do
      {
        if ([(IMMemoryCache *)self _removeItemFromItemsDictionaryIfReady:v14])
        {
          [v17 addIndex:v14];
        }
      }
      while (self->_count > self->_countLimit && v15 != v14++);
      [(NSMutableArray *)self->_itemsArray removeObjectsAtIndexes:v17];
    }
  }
}

- (void)_checkLimits
{
  +[NSDate timeIntervalSinceReferenceDate];
  if (v3 - self->_lastCheckTime > 0.4
    && ((unint64_t countLimit = self->_countLimit) != 0 && self->_count > countLimit
     || (unint64_t totalCostLimit = self->_totalCostLimit) != 0 && self->_totalCost > totalCostLimit))
  {
    +[NSDate timeIntervalSinceReferenceDate];
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
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_18B41C;
  block[3] = &unk_2C4720;
  block[4] = self;
  id v10 = v4;
  BOOL v11 = &v12;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (int64_t)numberOfCachedItems
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_18B53C;
  v5[3] = &unk_2C39F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)description
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_18A48C;
  id v10 = sub_18A49C;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_18B664;
  v5[3] = &unk_2C39F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_addItem:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_18B7F0;
  block[3] = &unk_2C48E0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(accessQueue, block);
}

- (void)_removeObjectForKey:(id)a3
{
  id v9 = a3;
  id v4 = -[NSMutableDictionary objectForKey:](self->_items, "objectForKey:");
  uint64_t v5 = v4;
  if (v4)
  {
    --self->_count;
    self->_totalCost -= (unint64_t)[v4 cost];
    [(NSMutableDictionary *)self->_items removeObjectForKey:v9];
    itemsArray = self->_itemsArray;
    id v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 timeStamp]);
    id v8 = [(NSMutableArray *)itemsArray bu_indexOfObjectWithValue:v7 forKeyPath:@"timeStamp"];

    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_itemsArray removeObjectAtIndex:v8];
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
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

- (void)setTotalCostLimit:(unint64_t)a3
{
  self->_unint64_t totalCostLimit = a3;
}

- (unint64_t)countLimit
{
  return self->_countLimit;
}

- (void)setCountLimit:(unint64_t)a3
{
  self->_unint64_t countLimit = a3;
}

- (NSMutableDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSMutableArray)itemsArray
{
  return self->_itemsArray;
}

- (void)setItemsArray:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
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

- (void)setCount:(unint64_t)a3
{
  self->_unint64_t count = a3;
}

- (void)setTotalCost:(unint64_t)a3
{
  self->_totalCost = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_itemsArray, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak(&self->_delegate);

  objc_storeStrong((id *)&self->_name, 0);
}

@end