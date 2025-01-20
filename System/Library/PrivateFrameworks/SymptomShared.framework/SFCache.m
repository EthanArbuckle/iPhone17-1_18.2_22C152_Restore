@interface SFCache
- (SFCache)init;
- (SFCache)initWithPolicy:(unint64_t)a3;
- (SFCache)initWithPolicy:(unint64_t)a3 timeToLive:(double)a4 size:(unint64_t)a5;
- (id)_entryForKey:(id)a3;
- (id)entryForKey:(id)a3;
- (unint64_t)count;
- (void)_insertCacheEntry:(id)a3 forKey:(id)a4;
- (void)_removeCacheEntryWithKey:(id)a3;
- (void)addEntry:(id)a3 forKey:(id)a4;
@end

@implementation SFCache

- (SFCache)init
{
  v3 = [[SFCache alloc] initWithPolicy:0 timeToLive:10 size:0.0];

  return v3;
}

- (SFCache)initWithPolicy:(unint64_t)a3
{
  v4 = [[SFCache alloc] initWithPolicy:a3 timeToLive:10 size:0.0];

  return v4;
}

- (SFCache)initWithPolicy:(unint64_t)a3 timeToLive:(double)a4 size:(unint64_t)a5
{
  v5 = (SFCache *)a5;
  if (a5)
  {
    v13.receiver = self;
    v13.super_class = (Class)SFCache;
    v8 = [(SFCache *)&v13 init];
    v9 = v8;
    if (v8)
    {
      v8->_cachePolicy = a3;
      v8->_cacheSize = (unint64_t)v5;
      v8->_entryTimeToLive = a4;
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      cacheEntries = v9->_cacheEntries;
      v9->_cacheEntries = v10;
    }
    self = v9;
    v5 = self;
  }

  return v5;
}

- (id)_entryForKey:(id)a3
{
  id v4 = a3;
  v5 = self->_cacheEntries;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)self->_cacheEntries objectForKeyedSubscript:v4];
  v7 = v6;
  if (v6)
  {
    if (self->_entryTimeToLive == 0.0
      || ([v6 lastUsed],
          v8 = objc_claimAutoreleasedReturnValue(),
          [v8 timeIntervalSinceNow],
          double v10 = v9,
          double v11 = -self->_entryTimeToLive,
          v8,
          v10 > v11))
    {
      v12 = [MEMORY[0x263EFF910] date];
      [v7 setLastUsed:v12];
    }
    else
    {
      v12 = v7;
      v7 = 0;
    }
  }
  objc_sync_exit(v5);

  return v7;
}

- (void)_insertCacheEntry:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self->_cacheEntries;
  objc_sync_enter(v8);
  if ([(NSMutableDictionary *)self->_cacheEntries count] >= self->_cacheSize)
  {
    if (self->_entryTimeToLive == 0.0)
    {
      id v11 = 0;
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
      cacheEntries = self->_cacheEntries;
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __36__SFCache__insertCacheEntry_forKey___block_invoke;
      v17 = &unk_26552ACE8;
      v18 = self;
      id v11 = v9;
      id v19 = v11;
      [(NSMutableDictionary *)cacheEntries enumerateKeysAndObjectsUsingBlock:&v14];

      if (v11)
      {
        if (objc_msgSend(v11, "count", v14, v15, v16, v17, v18))
        {
          if ([v11 count]) {
            [(NSMutableDictionary *)self->_cacheEntries removeObjectsForKeys:v11];
          }
        }
        else
        {
          v12 = [(NSMutableDictionary *)self->_cacheEntries keysSortedByValueUsingComparator:&__block_literal_global];
          objc_super v13 = objc_msgSend(v12, "subarrayWithRange:", 0, self->_cacheSize >> 1);
          [(NSMutableDictionary *)self->_cacheEntries removeObjectsForKeys:v13];
        }
      }
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cacheEntries, "setObject:forKeyedSubscript:", v6, v7, v14, v15, v16, v17, v18);
  objc_sync_exit(v8);
}

void __36__SFCache__insertCacheEntry_forKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  v5 = [a3 lastUsed];
  [v5 timeIntervalSinceNow];
  double v7 = v6;
  double v8 = -*(double *)(*(void *)(a1 + 32) + 24);

  if (v7 <= v8) {
    [*(id *)(a1 + 40) addObject:v9];
  }
}

uint64_t __36__SFCache__insertCacheEntry_forKey___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 lastUsed];
  double v6 = [v4 lastUsed];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_removeCacheEntryWithKey:(id)a3
{
  id v5 = a3;
  id v4 = self->_cacheEntries;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)self->_cacheEntries setObject:0 forKeyedSubscript:v5];
  objc_sync_exit(v4);
}

- (unint64_t)count
{
  v3 = self->_cacheEntries;
  objc_sync_enter(v3);
  unint64_t v4 = [(NSMutableDictionary *)self->_cacheEntries count];
  objc_sync_exit(v3);

  return v4;
}

- (id)entryForKey:(id)a3
{
  v3 = [(SFCache *)self _entryForKey:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 item];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)addEntry:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(SFCache *)self _entryForKey:v6];
  double v8 = v7;
  if (v7)
  {
    id v9 = [v7 item];
    char v10 = [v12 isEqual:v9];

    if ((v10 & 1) == 0) {
      [(SFCache *)self _removeCacheEntryWithKey:v6];
    }
  }
  id v11 = [[SFCacheEntry alloc] initWithCacheItem:v12];
  [(SFCache *)self _insertCacheEntry:v11 forKey:v6];
}

- (void).cxx_destruct
{
}

@end