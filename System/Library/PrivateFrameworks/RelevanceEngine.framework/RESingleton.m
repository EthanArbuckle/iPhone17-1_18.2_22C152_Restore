@interface RESingleton
+ (id)_classKey;
+ (id)sharedInstance;
+ (void)_decrementSingletonCache;
+ (void)_incrementSingletonCache;
- (id)_init;
@end

@implementation RESingleton

+ (id)sharedInstance
{
  v2 = [a1 _classKey];
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = [(id)SingletonCache objectForKeyedSubscript:v2];
  v4 = (void *)v3;
  if (SingletonCache) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    v4 = (void *)[objc_alloc((Class)objc_opt_class()) _init];
    [(id)SingletonCache setObject:v4 forKeyedSubscript:v2];
  }
  os_unfair_recursive_lock_unlock();

  return v4;
}

+ (id)_classKey
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)RESingleton;
  return [(RESingleton *)&v3 init];
}

+ (void)_incrementSingletonCache
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v2 = SingletonCacheUsageCount;
  if (!SingletonCacheUsageCount)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    v4 = (void *)SingletonCache;
    SingletonCache = v3;

    uint64_t v2 = SingletonCacheUsageCount;
  }
  SingletonCacheUsageCount = v2 + 1;
  os_unfair_recursive_lock_unlock();
}

+ (void)_decrementSingletonCache
{
  os_unfair_recursive_lock_lock_with_options();
  if (!--SingletonCacheUsageCount)
  {
    uint64_t v2 = (void *)SingletonCache;
    SingletonCache = 0;
  }
  os_unfair_recursive_lock_unlock();
}

@end