@interface PMObjectCache
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
- (PMObjectCache)initWithCacheSize:(unint64_t)a3;
- (id)copyObjectForKey:(id)a3 cost:(double *)a4;
- (id)copyObjectForKeyDontUpdateAccessTime:(id)a3 cost:(double *)a4;
- (id)copyObjectForKeyImpl:(id)a3 cost:(double *)a4 updateAccessTime:(BOOL)a5;
- (int)addObject:(id)a3 cacheKey:(id)a4 size:(unint64_t)a5 cost:(double)a6;
- (int)addObject:(id)a3 cacheKey:(id)a4 size:(unint64_t)a5 cost:(double)a6 retDidAddObject:(BOOL *)a7;
- (unint64_t)currentSize;
- (unint64_t)getCacheMemoryUsed;
- (unint64_t)getCacheSize;
- (unint64_t)reservedMemorySize;
- (void)clearCache;
- (void)dealloc;
- (void)removeObjectForKey:(id)a3;
- (void)reserveCacheMemory:(int64_t)a3;
- (void)setCacheSize:(unint64_t)a3;
@end

@implementation PMObjectCache

+ (id)sharedInstance
{
  id result = (id)s_sharedInstance;
  if (!s_sharedInstance)
  {
    id result = [[PMObjectCache alloc] initWithCacheSize:1024];
    s_sharedInstance = (uint64_t)result;
  }
  return result;
}

+ (void)releaseSharedInstance
{
  if (s_sharedInstance)
  {
    [(id)s_sharedInstance shutdownCache];

    s_sharedInstance = 0;
  }
}

- (PMObjectCache)initWithCacheSize:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PMObjectCache;
  v4 = [(PMObjectCache *)&v6 init];
  if (v4)
  {
    v4->_cacheLock = (NSRecursiveLock *)objc_opt_new();
    v4->_purgesInProgress = 0;
    v4->_mapTable = (NSMapTable *)(id)[MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0x10000 valueOptions:0];
    v4->_currentSize = 0;
    v4->_setSize = a3;
    v4->_maxSize = a3;
    v4->_reservedMemory = 0;
  }
  return v4;
}

- (void)dealloc
{
  if ((PMObjectCache *)s_sharedInstance == self) {
    s_sharedInstance = 0;
  }
  __dmb(0xBu);
  [(NSRecursiveLock *)self->_cacheLock lock];
  [(NSMapTable *)self->_mapTable removeAllObjects];

  self->_mapTable = 0;
  [(NSRecursiveLock *)self->_cacheLock unlock];

  v3.receiver = self;
  v3.super_class = (Class)PMObjectCache;
  [(PMObjectCache *)&v3 dealloc];
}

- (unint64_t)reservedMemorySize
{
  return self->_reservedMemory;
}

- (unint64_t)currentSize
{
  return self->_reservedMemory + self->_currentSize;
}

- (unint64_t)getCacheMemoryUsed
{
  [(NSRecursiveLock *)self->_cacheLock lock];
  unint64_t v3 = [(PMObjectCache *)self currentSize];
  [(NSRecursiveLock *)self->_cacheLock unlock];
  return v3;
}

- (unint64_t)getCacheSize
{
  [(NSRecursiveLock *)self->_cacheLock lock];
  unint64_t setSize = self->_setSize;
  [(NSRecursiveLock *)self->_cacheLock unlock];
  return setSize;
}

- (void)setCacheSize:(unint64_t)a3
{
  [(NSRecursiveLock *)self->_cacheLock lock];
  if (a3 <= 1) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = a3;
  }
  self->_unint64_t setSize = v5;
  self->_maxSize = v5;
  cacheLock = self->_cacheLock;

  [(NSRecursiveLock *)cacheLock unlock];
}

- (int)addObject:(id)a3 cacheKey:(id)a4 size:(unint64_t)a5 cost:(double)a6 retDidAddObject:(BOOL *)a7
{
  *a7 = 0;
  int result = -50;
  if (a3 && a4)
  {
    [(NSRecursiveLock *)self->_cacheLock lock];
    id v14 = [(NSMapTable *)self->_mapTable objectForKey:a4];
    if (v14)
    {
      [v14 setLastAccess:self->_numberOfCalls];
    }
    else
    {
      v15 = [[PMObjectCacheEntry alloc] initWithKey:a4 cacheItem:a3 size:a5 cost:self forCache:a6];
      [(PMObjectCacheEntry *)v15 setValue:self->_numberOfCalls cost:self->_setSize maxCacheSize:a6];
      *(float *)&double v16 = self->_responseRate;
      *(float *)&double v17 = self->_penalty;
      [(PMObjectCacheEntry *)v15 resetValue:self->_numberOfCalls responseRate:v16 penalty:v17];
      [(NSMapTable *)self->_mapTable setObject:v15 forKey:a4];
      self->_currentSize += a5;
      *a7 = 1;
    }
    ++self->_numberOfCalls;
    [(NSRecursiveLock *)self->_cacheLock unlock];
    return 0;
  }
  return result;
}

- (int)addObject:(id)a3 cacheKey:(id)a4 size:(unint64_t)a5 cost:(double)a6
{
  char v7 = 0;
  return [(PMObjectCache *)self addObject:a3 cacheKey:a4 size:a5 cost:&v7 retDidAddObject:a6];
}

- (id)copyObjectForKeyImpl:(id)a3 cost:(double *)a4 updateAccessTime:(BOOL)a5
{
  id v5 = a3;
  if (a3)
  {
    BOOL v6 = a5;
    [(NSRecursiveLock *)self->_cacheLock lock];
    id v9 = [(NSMapTable *)self->_mapTable objectForKey:v5];
    if (v9)
    {
      v10 = v9;
      id v5 = (id)[v9 getItem];
      if (a4)
      {
        [v10 cost];
        *(void *)a4 = v11;
      }
      if (v6) {
        [v10 setLastAccess:self->_numberOfCalls++];
      }
    }
    else
    {
      id v5 = 0;
    }
    [(NSRecursiveLock *)self->_cacheLock unlock];
  }
  return v5;
}

- (id)copyObjectForKey:(id)a3 cost:(double *)a4
{
  return [(PMObjectCache *)self copyObjectForKeyImpl:a3 cost:a4 updateAccessTime:1];
}

- (id)copyObjectForKeyDontUpdateAccessTime:(id)a3 cost:(double *)a4
{
  return [(PMObjectCache *)self copyObjectForKeyImpl:a3 cost:a4 updateAccessTime:0];
}

- (void)removeObjectForKey:(id)a3
{
  if (a3)
  {
    [(NSRecursiveLock *)self->_cacheLock lock];
    id v5 = [(NSMapTable *)self->_mapTable objectForKey:a3];
    if (v5)
    {
      self->_currentSize -= [v5 getSize];
      [(NSMapTable *)self->_mapTable removeObjectForKey:a3];
    }
    cacheLock = self->_cacheLock;
    [(NSRecursiveLock *)cacheLock unlock];
  }
}

- (void)clearCache
{
  [(NSRecursiveLock *)self->_cacheLock lock];
  [(NSMapTable *)self->_mapTable removeAllObjects];
  self->_currentSize = 0;
  cacheLock = self->_cacheLock;

  [(NSRecursiveLock *)cacheLock unlock];
}

- (void)reserveCacheMemory:(int64_t)a3
{
  [(NSRecursiveLock *)self->_cacheLock lock];
  self->_reservedMemory += a3;
  cacheLock = self->_cacheLock;

  [(NSRecursiveLock *)cacheLock unlock];
}

@end