@interface MFWeakObjectCache
- (MFWeakObjectCache)initWithBlock:(id)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 shouldGenerate:(BOOL)a4 wasCached:(BOOL *)a5;
- (id)objectForKey:(id)a3 wasCached:(BOOL *)a4;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
@end

@implementation MFWeakObjectCache

- (id)objectForKey:(id)a3 wasCached:(BOOL *)a4
{
  v4 = [(MFWeakObjectCache *)self objectForKey:a3 shouldGenerate:1 wasCached:a4];
  return v4;
}

- (id)objectForKey:(id)a3 shouldGenerate:(BOOL)a4 wasCached:(BOOL *)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v10 = (void *)[v9 copyWithZone:0];

  [(NSLock *)self->_lock lock];
  v11 = [(NSMutableDictionary *)self->_dictionary objectForKeyedSubscript:v10];
  v12 = v11;
  if (v11)
  {
    v13 = [v11 reference];
    if (v13)
    {
      v14 = v12;
      if (!a5) {
        goto LABEL_17;
      }
      goto LABEL_13;
    }
    [(NSMutableDictionary *)self->_dictionary removeObjectForKey:v10];
  }
  if (!v6)
  {
    v14 = 0;
    v13 = 0;
    if (!a5) {
      goto LABEL_17;
    }
LABEL_13:
    BOOL v19 = 1;
LABEL_16:
    *a5 = v19;
    goto LABEL_17;
  }
  v13 = (*((void (**)(void))self->_block + 2))();
  if (!v13)
  {
    v14 = 0;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  v14 = [MEMORY[0x1E4F73598] weakReferenceWithObject:v13];
  if (!v14)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"MFWeakObjectCache.m", 106, @"couldn't create a weak reference for %@", v13 object file lineNumber description];
  }
  id v15 = v13;
  v16 = self;
  id v17 = v10;
  v18 = objc_alloc_init(_MFWeakObjectCacheRef);
  [(_MFWeakObjectCacheRef *)v18 setCache:v16];
  [(_MFWeakObjectCacheRef *)v18 setKey:v17];
  objc_setAssociatedObject(v15, v16, v18, (void *)1);

  [(NSMutableDictionary *)self->_dictionary setObject:v14 forKeyedSubscript:v17];
  if (a5)
  {
LABEL_15:
    BOOL v19 = 0;
    goto LABEL_16;
  }
LABEL_17:
  [(NSLock *)self->_lock unlock];

  return v13;
}

- (MFWeakObjectCache)initWithBlock:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MFWeakObjectCache;
  v5 = [(MFWeakObjectCache *)&v14 init];
  BOOL v6 = v5;
  if (v5)
  {
    if (v4)
    {
      uint64_t v7 = [v4 copy];
      id block = v6->_block;
      v6->_id block = (id)v7;

      id v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
      lock = v6->_lock;
      v6->_lock = v9;

      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      dictionary = v6->_dictionary;
      v6->_dictionary = v11;
    }
    else
    {
      dictionary = v5;
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (id)objectForKey:(id)a3
{
  v3 = [(MFWeakObjectCache *)self objectForKey:a3 shouldGenerate:1 wasCached:0];
  return v3;
}

- (void)removeObjectForKey:(id)a3
{
  id v7 = a3;
  [(NSLock *)self->_lock lock];
  id v4 = [(NSMutableDictionary *)self->_dictionary objectForKeyedSubscript:v7];
  v5 = [v4 reference];
  BOOL v6 = v5;
  if (v5) {
    _removeDestructionHandler(v5, self);
  }
  [(NSMutableDictionary *)self->_dictionary removeObjectForKey:v7];
  [(NSLock *)self->_lock unlock];
}

- (void)removeAllObjects
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(NSMutableDictionary *)self->_dictionary allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) reference];
        v8 = v7;
        if (v7) {
          _removeDestructionHandler(v7, self);
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  [(NSMutableDictionary *)self->_dictionary removeAllObjects];
  [(NSLock *)self->_lock unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong(&self->_block, 0);
}

@end