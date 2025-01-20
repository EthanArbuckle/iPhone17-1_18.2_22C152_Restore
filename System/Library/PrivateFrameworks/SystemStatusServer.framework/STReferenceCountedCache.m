@interface STReferenceCountedCache
- (STReferenceCountedCache)init;
- (id)cachedObjectForKey:(id)a3;
- (uint64_t)_referenceCountForKey:(uint64_t)result;
- (void)cacheObject:(id)a3 forKey:(id)a4;
- (void)clearObjectForKey:(id)a3;
- (void)decrementReferenceCountForKey:(id)a3;
- (void)incrementReferenceCountForKey:(id)a3;
@end

@implementation STReferenceCountedCache

- (void)decrementReferenceCountForKey:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  v4 = -[STReferenceCountedCache cachedObjectForKey:](self, "cachedObjectForKey:");

  if (v4)
  {
    uint64_t v5 = -[STReferenceCountedCache _referenceCountForKey:]((uint64_t)self, (uint64_t)v19);
    if (v5 < 2)
    {
      v11 = self ? self->_referenceCounts : 0;
      [(NSMutableDictionary *)v11 removeObjectForKey:v19];
    }
    else
    {
      uint64_t v6 = v5 - 1;
      v7 = self ? self->_referenceCounts : 0;
      v8 = (void *)MEMORY[0x1E4F28ED0];
      v9 = v7;
      v10 = [v8 numberWithInteger:v6];
      [(NSMutableDictionary *)v9 setObject:v10 forKey:v19];
    }
    if (self)
    {
      v12 = self->_cache;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v13 = [(NSMutableDictionary *)v12 allKeys];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            if (!-[STReferenceCountedCache _referenceCountForKey:]((uint64_t)self, v18)) {
              [(NSMutableDictionary *)v12 removeObjectForKey:v18];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v15);
      }
    }
  }
}

- (uint64_t)_referenceCountForKey:(uint64_t)result
{
  if (result)
  {
    v2 = [*(id *)(result + 16) objectForKey:a2];
    uint64_t v3 = [v2 integerValue];

    return v3;
  }
  return result;
}

- (void)incrementReferenceCountForKey:(id)a3
{
  id v10 = a3;
  v4 = -[STReferenceCountedCache cachedObjectForKey:](self, "cachedObjectForKey:");

  if (v4)
  {
    uint64_t v5 = -[STReferenceCountedCache _referenceCountForKey:]((uint64_t)self, (uint64_t)v10) + 1;
    if (self) {
      referenceCounts = self->_referenceCounts;
    }
    else {
      referenceCounts = 0;
    }
    v7 = (void *)MEMORY[0x1E4F28ED0];
    v8 = referenceCounts;
    v9 = [v7 numberWithInteger:v5];
    [(NSMutableDictionary *)v8 setObject:v9 forKey:v10];
  }
}

- (id)cachedObjectForKey:(id)a3
{
  if (self) {
    self = (STReferenceCountedCache *)self->_cache;
  }
  return (id)[(STReferenceCountedCache *)self objectForKey:a3];
}

- (void)cacheObject:(id)a3 forKey:(id)a4
{
  if (self) {
    self = (STReferenceCountedCache *)self->_cache;
  }
  [(STReferenceCountedCache *)self setObject:a3 forKey:a4];
}

- (STReferenceCountedCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)STReferenceCountedCache;
  v2 = [(STReferenceCountedCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    referenceCounts = v2->_referenceCounts;
    v2->_referenceCounts = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)clearObjectForKey:(id)a3
{
  if (self)
  {
    [(NSMutableDictionary *)self->_cache removeObjectForKey:a3];
    referenceCounts = self->_referenceCounts;
  }
  else
  {
    [0 removeObjectForKey:a3];
    referenceCounts = 0;
  }
  [(NSMutableDictionary *)referenceCounts removeObjectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceCounts, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end