@interface PVInputBitmapCache
- (PVInputBitmapCache)init;
- (id)objectForKey:(id)a3;
- (void)dealloc;
- (void)didRecieveMemoryWarning:(id)a3;
- (void)purge:(BOOL)a3;
- (void)setCountLimit:(unint64_t)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation PVInputBitmapCache

- (PVInputBitmapCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)PVInputBitmapCache;
  v2 = [(PVInputBitmapCache *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cache = v2->_cache;
    v2->_cache = v3;

    v2->_countLimit = 3;
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_didRecieveMemoryWarning_ name:*MEMORY[0x1E4F43670] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43670] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PVInputBitmapCache;
  [(PVInputBitmapCache *)&v4 dealloc];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  [(NSMutableDictionary *)self->_cache setObject:a3 forKey:a4];

  [(PVInputBitmapCache *)self purge:0];
}

- (id)objectForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_cache objectForKey:a3];

  return v3;
}

- (void)setCountLimit:(unint64_t)a3
{
  self->_countLimit = a3;
  [(PVInputBitmapCache *)self purge:0];
}

- (void)purge:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  p_cache = &self->_cache;
  v6 = [(NSMutableDictionary *)self->_cache keysSortedByValueUsingComparator:&__block_literal_global_7];
  if ([(NSMutableDictionary *)*p_cache count] > self->_countLimit || v3)
  {
    cache = self->_cache;
    if (v3)
    {
      unint64_t v9 = [(NSMutableDictionary *)cache count];
      if (!v9) {
        goto LABEL_11;
      }
    }
    else
    {
      unint64_t v9 = [(NSMutableDictionary *)cache count] - self->_countLimit;
      if (!v9) {
        goto LABEL_11;
      }
    }
    for (uint64_t i = 0; i != v9; ++i)
    {
      v11 = self->_cache;
      v12 = [v6 objectAtIndexedSubscript:i];
      [(NSMutableDictionary *)v11 removeObjectForKey:v12];
    }
  }
LABEL_11:
  v13 = [MEMORY[0x1E4F1C9C8] date];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        v19 = -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v18, (void)v24);
        v20 = v19;
        if (v19)
        {
          v21 = [v19 lastUsedTime];
          [v13 timeIntervalSinceDate:v21];
          double v23 = v22;

          if (v23 <= 1.0)
          {

            goto LABEL_23;
          }
          [(NSMutableDictionary *)self->_cache removeObjectForKey:v18];
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_23:
}

uint64_t __28__PVInputBitmapCache_purge___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 lastUsedTime];
  v6 = [v4 lastUsedTime];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

- (void)didRecieveMemoryWarning:(id)a3
{
  objc_msgSend((id)sInputBitmapCacheLock, "lock", a3);
  [(PVInputBitmapCache *)self purge:1];
  id v4 = (void *)sInputBitmapCacheLock;

  [v4 unlock];
}

- (void).cxx_destruct
{
}

@end