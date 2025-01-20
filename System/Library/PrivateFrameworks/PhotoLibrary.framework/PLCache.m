@interface PLCache
- (PLCache)initWithCountLimit:(int64_t)a3 totalCostLimit:(int64_t)a4;
- (id)objectForKey:(id)a3;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 cost:(int64_t)a5;
@end

@implementation PLCache

- (void)removeAllObjects
{
  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  [(NSMutableDictionary *)v2->_cacheEntries removeAllObjects];
  v2->_lru.tqh_first = 0;
  v2 = (PLCache *)((char *)v2 + 112);
  v2->_cacheEntries = (NSMutableDictionary *)v2;
  v2[-1]._currentCost = 0;
  *(void *)v2[-1]._lock.__opaque = 0;
  pthread_mutex_unlock(p_lock);
}

- (void)removeObjectForKey:(id)a3
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v6 = (void *)[(NSMutableDictionary *)self->_cacheEntries objectForKey:a3];
  if (v6)
  {
    v7 = (void *)[v6 lruListEntry];
    v8 = (lruEntry *)v7[2];
    v9 = (lruEntry **)v7[3];
    if (v8)
    {
      v8->var2.var1 = v9;
      v9 = (lruEntry **)v7[3];
    }
    else
    {
      self->_lru.tqh_last = v9;
    }
    *v9 = v8;
    --self->_currentCount;
    self->_currentCost -= v7[1];
    [(NSMutableDictionary *)self->_cacheEntries removeObjectForKey:a3];
  }
  pthread_mutex_unlock(p_lock);
}

- (void)setObject:(id)a3 forKey:(id)a4 cost:(int64_t)a5
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v10 = (PLCacheEntry *)[(NSMutableDictionary *)self->_cacheEntries objectForKey:a4];
  if (v10)
  {
    v11 = v10;
    uint64_t v12 = [(PLCacheEntry *)v10 lruListEntry];
    uint64_t v13 = v12;
    v14 = *(lruEntry **)(v12 + 16);
    v15 = *(lruEntry ***)(v12 + 24);
    if (v14)
    {
      v14->var2.var1 = v15;
      v15 = *(lruEntry ***)(v12 + 24);
    }
    else
    {
      self->_lru.tqh_last = v15;
    }
    *v15 = v14;
  }
  else
  {
    v11 = objc_alloc_init(PLCacheEntry);
    [(NSMutableDictionary *)self->_cacheEntries setObject:v11 forKey:a4];

    ++self->_currentCount;
    uint64_t v13 = [(PLCacheEntry *)v11 lruListEntry];
    *(void *)uint64_t v13 = a4;
  }
  [(PLCacheEntry *)v11 setObject:a3];
  self->_currentCost += a5 - *(void *)(v13 + 8);
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 8) = a5;
  tqh_last = self->_lru.tqh_last;
  *(void *)(v13 + 24) = tqh_last;
  *tqh_last = (lruEntry *)v13;
  self->_lru.tqh_last = (lruEntry **)(v13 + 16);
  tqh_first = self->_lru.tqh_first;
  if (tqh_first)
  {
    do
    {
      var0 = tqh_first->var2.var0;
      int64_t currentCount = self->_currentCount;
      if (currentCount <= self->_countLimit && self->_currentCost <= self->_totalCostLimit) {
        break;
      }
      var1 = tqh_first->var2.var1;
      if (var0)
      {
        var0->var2.var1 = var1;
        var1 = tqh_first->var2.var1;
      }
      else
      {
        self->_lru.tqh_last = var1;
      }
      *var1 = var0;
      self->_int64_t currentCount = currentCount - 1;
      id v21 = tqh_first->var0;
      self->_currentCost -= tqh_first->var1;
      [(NSMutableDictionary *)self->_cacheEntries removeObjectForKey:v21];
      tqh_first = var0;
    }
    while (var0);
  }
  pthread_mutex_unlock(p_lock);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (id)objectForKey:(id)a3
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v6 = (void *)[(NSMutableDictionary *)self->_cacheEntries objectForKey:a3];
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = [v6 lruListEntry];
    v9 = *(lruEntry **)(v8 + 16);
    v10 = *(lruEntry ***)(v8 + 24);
    if (v9)
    {
      v9->var2.var1 = v10;
      v10 = *(lruEntry ***)(v8 + 24);
    }
    else
    {
      self->_lru.tqh_last = v10;
    }
    PLCacheEntry *v10 = v9;
    tqh_last = self->_lru.tqh_last;
    *(void *)(v8 + 16) = 0;
    *(void *)(v8 + 24) = tqh_last;
    *tqh_last = (lruEntry *)v8;
    self->_lru.tqh_last = (lruEntry **)(v8 + 16);
    v11 = (void *)[v7 object];
    id v13 = v11;
  }
  else
  {
    v11 = 0;
  }
  pthread_mutex_unlock(p_lock);
  return v11;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)PLCache;
  [(PLCache *)&v3 dealloc];
}

- (PLCache)initWithCountLimit:(int64_t)a3 totalCostLimit:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PLCache;
  v6 = [(PLCache *)&v8 init];
  if (v6)
  {
    v6->_cacheEntries = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    v6->_countLimit = a3;
    v6->_totalCostLimit = a4;
    pthread_mutex_init(&v6->_lock, 0);
    v6->_lru.tqh_first = 0;
    v6->_lru.tqh_last = &v6->_lru.tqh_first;
  }
  return v6;
}

@end