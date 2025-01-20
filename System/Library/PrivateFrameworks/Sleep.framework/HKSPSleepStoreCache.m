@interface HKSPSleepStoreCache
+ (id)strongCache;
+ (id)weakCache;
- (HKSPSleepStoreCache)init;
- (HKSPSleepStoreCache)initWithSleepStoreProvider:(id)a3;
- (HKSPSleepStoreCache)initWithSleepStoreProvider:(id)a3 useWeakReferences:(BOOL)a4;
- (id)sleepStoreForIdentifier:(id)a3;
- (id)sleepStoreForIdentifier:(id)a3 healthStore:(id)a4;
@end

@implementation HKSPSleepStoreCache

- (id)sleepStoreForIdentifier:(id)a3 healthStore:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKSPSleepStoreCache.m", 58, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  if (v8) {
    [NSString stringWithFormat:@"%@ - %p", v7, v8];
  }
  else {
  v9 = [NSString stringWithFormat:@"%@", v7, v14];
  }
  os_unfair_lock_lock(&self->_lock);
  v10 = [(NSMapTable *)self->_sleepStoresByIdentifier objectForKey:v9];
  if (!v10)
  {
    v11 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      __int16 v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1A7E74000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ caching a new sleep store with identifier %@", buf, 0x16u);
    }

    v10 = (*((void (**)(void))self->_sleepStoreProvider + 2))();
    [(NSMapTable *)self->_sleepStoresByIdentifier setObject:v10 forKey:v9];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v10;
}

HKSPSleepStore *__32__HKSPSleepStoreCache_weakCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [[HKSPSleepStore alloc] initWithIdentifier:v5 healthStore:v4];

  return v6;
}

+ (id)weakCache
{
  v2 = (void *)[objc_alloc((Class)a1) initWithSleepStoreProvider:&__block_literal_global useWeakReferences:1];
  return v2;
}

- (HKSPSleepStoreCache)initWithSleepStoreProvider:(id)a3 useWeakReferences:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSPSleepStoreCache;
  id v7 = [(HKSPSleepStoreCache *)&v14 init];
  if (v7)
  {
    id v8 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    if (a4) {
      [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    }
    else {
    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    }
    sleepStoresByIdentifier = v7->_sleepStoresByIdentifier;
    v7->_sleepStoresByIdentifier = (NSMapTable *)v9;

    uint64_t v11 = [v6 copy];
    id sleepStoreProvider = v7->_sleepStoreProvider;
    v7->_id sleepStoreProvider = (id)v11;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

+ (id)strongCache
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (HKSPSleepStoreCache)init
{
  return [(HKSPSleepStoreCache *)self initWithSleepStoreProvider:&__block_literal_global_279];
}

HKSPSleepStore *__27__HKSPSleepStoreCache_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[HKSPSleepStore alloc] initWithIdentifier:v5 healthStore:v4];

  return v6;
}

- (HKSPSleepStoreCache)initWithSleepStoreProvider:(id)a3
{
  return [(HKSPSleepStoreCache *)self initWithSleepStoreProvider:a3 useWeakReferences:0];
}

- (id)sleepStoreForIdentifier:(id)a3
{
  return [(HKSPSleepStoreCache *)self sleepStoreForIdentifier:a3 healthStore:0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sleepStoreProvider, 0);
  objc_storeStrong((id *)&self->_sleepStoresByIdentifier, 0);
}

@end