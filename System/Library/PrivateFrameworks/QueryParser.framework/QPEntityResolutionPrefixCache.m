@interface QPEntityResolutionPrefixCache
+ (id)sharedCache;
- (BOOL)hasPreviouslyGroundedPrefixOfToken:(id)a3;
- (QPEntityResolutionPrefixCache)initWithMaxCount:(int64_t)a3 minPrefixLength:(int64_t)a4;
- (void)cacheGroundedToken:(id)a3;
@end

@implementation QPEntityResolutionPrefixCache

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedCache_cache;
  return v2;
}

void __44__QPEntityResolutionPrefixCache_sharedCache__block_invoke()
{
  v0 = [[QPEntityResolutionPrefixCache alloc] initWithMaxCount:50 minPrefixLength:2];
  v1 = (void *)sharedCache_cache;
  sharedCache_cache = (uint64_t)v0;
}

- (QPEntityResolutionPrefixCache)initWithMaxCount:(int64_t)a3 minPrefixLength:(int64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)QPEntityResolutionPrefixCache;
  v6 = [(QPEntityResolutionPrefixCache *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    int64_t v8 = 2;
    if (a3 > 2) {
      int64_t v8 = a3;
    }
    v6->_maxCount = v8;
    v6->_minPrefixLength = a4;
    uint64_t v9 = [MEMORY[0x263EFF9B0] orderedSetWithCapacity:a3];
    cache = v7->_cache;
    v7->_cache = (NSMutableOrderedSet *)v9;
  }
  return v7;
}

- (BOOL)hasPreviouslyGroundedPrefixOfToken:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_minPrefixLength >= (int)[v4 length])
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    uint64_t v5 = -1;
    uint64_t v6 = 1;
    do
    {
      v7 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") + v5);
      int v8 = [(NSMutableOrderedSet *)self->_cache containsObject:v7];

      if (v8) {
        break;
      }
      ++v6;
      int64_t v9 = (int)[v4 length] - self->_minPrefixLength;
      if (v9 >= 2) {
        int64_t v9 = 2;
      }
      --v5;
    }
    while (v9 >= v6);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

- (void)cacheGroundedToken:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= self->_minPrefixLength)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    p_cache = &self->_cache;
    if (([(NSMutableOrderedSet *)self->_cache containsObject:v4] & 1) == 0)
    {
      unint64_t v7 = [(NSMutableOrderedSet *)self->_cache count];
      int64_t maxCount = self->_maxCount;
      if (v7 >= maxCount)
      {
        -[NSMutableOrderedSet removeObjectsInRange:](*p_cache, "removeObjectsInRange:", 0, maxCount / 2);
        if (entityResolutionPrefixCacheLogger_token != -1) {
          dispatch_once(&entityResolutionPrefixCacheLogger_token, &__block_literal_global_21);
        }
        int64_t v9 = (void *)entityResolutionPrefixCacheLogger_log;
        if (os_log_type_enabled((os_log_t)entityResolutionPrefixCacheLogger_log, OS_LOG_TYPE_DEBUG)) {
          -[QPEntityResolutionPrefixCache cacheGroundedToken:]((void **)p_cache, v9);
        }
      }
      [(NSMutableOrderedSet *)*p_cache addObject:v4];
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void).cxx_destruct
{
}

- (void)cacheGroundedToken:(void *)a1 .cold.1(void **a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *a1;
  v3 = a2;
  int v4 = 134217984;
  uint64_t v5 = [v2 count];
  _os_log_debug_impl(&dword_224D85000, v3, OS_LOG_TYPE_DEBUG, "Pruned old items in cache. Remaining: %lu", (uint8_t *)&v4, 0xCu);
}

@end