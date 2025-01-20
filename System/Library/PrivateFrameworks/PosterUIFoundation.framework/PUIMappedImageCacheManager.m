@interface PUIMappedImageCacheManager
+ (BOOL)unregisterCacheManagerForURL:(id)a3;
+ (id)defaultCacheManager;
+ (id)registerCacheManager:(id)a3 cacheManager:(id)a4;
+ (void)cleanupOldCaches;
- (BOOL)_cacheLock_deleteCacheDirectoryForKey:(id)a3 error:(id *)a4;
- (BOOL)_cacheLock_removeCacheForKey:(id)a3;
- (BOOL)_cacheLock_teardownCacheForKey:(id)a3;
- (BOOL)removeImageCacheForKey:(id)a3;
- (BOOL)returnImageCache:(id)a3;
- (BOOL)returnImageCacheForKey:(id)a3;
- (BSPathProviding)pathProvider;
- (NSSet)activeCaches;
- (NSSet)knownCaches;
- (NSString)description;
- (PUIMappedImageCacheManager)initWithNumberOfManagedCaches:(unint64_t)a3 pathProvider:(id)a4;
- (id)_cacheLock_activeCaches;
- (id)_cacheLock_buildMappedImageCacheForKey:(id)a3;
- (id)_cacheLock_checkoutImageCache:(id)a3 didCreateNew:(BOOL *)a4 bumpDate:(id)a5;
- (id)_cacheLock_onDiskCaches;
- (id)checkoutImageCache:(id)a3;
- (id)checkoutImageCache:(id)a3 date:(id)a4;
- (unint64_t)numberOfManagedCaches;
- (void)_cacheLock_bumpManifestForImageCacheKey:(id)a3 bumpDate:(id)a4;
- (void)_cacheLock_onDiskCaches;
- (void)_cacheLock_truncateCaches:(BOOL)a3;
- (void)_cacheLock_writeManifest;
- (void)dealloc;
- (void)invalidate;
@end

@implementation PUIMappedImageCacheManager

+ (id)defaultCacheManager
{
  if (defaultCacheManager_onceToken != -1) {
    dispatch_once(&defaultCacheManager_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)defaultCacheManager_defaultCacheManager;
  return v2;
}

void __49__PUIMappedImageCacheManager_defaultCacheManager__block_invoke()
{
  v0 = [PUIMappedImageCacheManager alloc];
  v1 = [MEMORY[0x263F5F420] scopedSystemContainerForCurrentProcess];
  v2 = [v1 providerByAppendingPathComponent:@"PBUIMappedImageCacheManager-Default"];
  uint64_t v3 = [(PUIMappedImageCacheManager *)v0 initWithNumberOfManagedCaches:10 pathProvider:v2];
  v4 = (void *)defaultCacheManager_defaultCacheManager;
  defaultCacheManager_defaultCacheManager = v3;

  v5 = *(void **)(defaultCacheManager_defaultCacheManager + 48);
  *(void *)(defaultCacheManager_defaultCacheManager + 48) = @"PBUIMappedImageCacheManager-Default";

  v6 = dispatch_get_global_queue(9, 0);
  dispatch_async(v6, &__block_literal_global_4_0);
}

uint64_t __49__PUIMappedImageCacheManager_defaultCacheManager__block_invoke_2()
{
  return +[PUIMappedImageCacheManager cleanupOldCaches];
}

+ (void)cleanupOldCaches
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F5F420] scopedSystemContainerForCurrentProcess];
  uint64_t v3 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v16 = v2;
  v4 = [v2 cachesPath];
  v5 = [v3 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:1 error:0];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = [v10 lastPathComponent];
        int v12 = [v11 hasPrefix:@"PosterViewController"];

        if (v12)
        {
          id v17 = 0;
          char v13 = [v3 removeItemAtURL:v10 error:&v17];
          id v14 = v17;
          if ((v13 & 1) == 0)
          {
            v15 = PUILogCaching();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v23 = v10;
              __int16 v24 = 2114;
              id v25 = v14;
              _os_log_error_impl(&dword_25A0AF000, v15, OS_LOG_TYPE_ERROR, "Unable to remove old cache %@: %{public}@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }
}

+ (id)registerCacheManager:(id)a3 cacheManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_knownCacheDirectoryLock);
    if (registerCacheManager_cacheManager__onceToken != -1) {
      dispatch_once(&registerCacheManager_cacheManager__onceToken, &__block_literal_global_10_1);
    }
    uint64_t v8 = [(id)__knownCacheDirectories objectForKey:v5];
    if (!v8)
    {
      [(id)__knownCacheDirectories setObject:v7 forKey:v5];
      if (([v5 checkResourceIsReachableAndReturnError:0] & 1) == 0)
      {
        v9 = [MEMORY[0x263F08850] defaultManager];
        v10 = PFFileProtectionNoneAttributes();
        id v15 = 0;
        char v11 = [v9 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:v10 error:&v15];
        id v12 = v15;

        if ((v11 & 1) == 0)
        {
          char v13 = PUILogCaching();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            +[PUIMappedImageCacheManager registerCacheManager:cacheManager:]();
          }
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_knownCacheDirectoryLock);
  }

  return v8;
}

uint64_t __64__PUIMappedImageCacheManager_registerCacheManager_cacheManager___block_invoke()
{
  __knownCacheDirectories = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  return MEMORY[0x270F9A758]();
}

+ (BOOL)unregisterCacheManagerForURL:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_knownCacheDirectoryLock);
  v4 = [(id)__knownCacheDirectories objectForKey:v3];
  BOOL v5 = v4 != 0;

  [(id)__knownCacheDirectories removeObjectForKey:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&_knownCacheDirectoryLock);
  return v5;
}

- (PUIMappedImageCacheManager)initWithNumberOfManagedCaches:(unint64_t)a3 pathProvider:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pathProvider"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIMappedImageCacheManager initWithNumberOfManagedCaches:pathProvider:](a2);
    }
LABEL_26:
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0FC6A8);
  }
  uint64_t v8 = v7;
  v9 = [v7 cachesPath];
  v10 = [v9 URLByStandardizingPath];

  if (([v10 isFileURL] & 1) == 0)
  {
    v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[cacheURL isFileURL]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIMappedImageCacheManager initWithNumberOfManagedCaches:pathProvider:](a2);
    }
    goto LABEL_26;
  }
  char v11 = [(id)objc_opt_class() registerCacheManager:v10 cacheManager:self];
  id v12 = v11;
  if (!v11 || v11 == self)
  {
    v39.receiver = self;
    v39.super_class = (Class)PUIMappedImageCacheManager;
    id v14 = [(PUIMappedImageCacheManager *)&v39 init];
    id v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_cacheURL, v10);
      uint64_t v16 = [objc_alloc(MEMORY[0x263F29BD0]) initWithFlag:0];
      invalidationFlag = v15->_invalidationFlag;
      v15->_invalidationFlag = (BSAtomicFlag *)v16;

      uint64_t v18 = [(NSURL *)v15->_cacheURL URLByAppendingPathComponent:@".CacheManagerManifest.plist" isDirectory:0];
      manifestURL = v15->_manifestURL;
      v15->_manifestURL = (NSURL *)v18;

      v15->_numberOfManagedCaches = a3;
      uint64_t v20 = [MEMORY[0x263F5F420] providerFromProvider:v8];
      pathProvider = v15->_pathProvider;
      v15->_pathProvider = (PFPathProvider *)v20;

      v15->_cacheLock._os_unfair_lock_opaque = 0;
      uint64_t v22 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
      cacheLock_cacheKeyToWeakCache = v15->_cacheLock_cacheKeyToWeakCache;
      v15->_cacheLock_cacheKeyToWeakCache = (NSMapTable *)v22;

      __int16 v24 = v15->_manifestURL;
      id v38 = 0;
      id v25 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v24 options:1 error:&v38];
      id v26 = v38;
      if (v26)
      {
        uint64_t v27 = PUILogCaching();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[PUIMappedImageCacheManager initWithNumberOfManagedCaches:pathProvider:]();
        }
      }
      if ([v25 length])
      {
        v28 = [MEMORY[0x263F08AC0] propertyListWithData:v25 options:0 format:0 error:0];
        v29 = (void *)[v28 mutableCopy];
        v30 = v29;
        if (v29) {
          v31 = v29;
        }
        else {
          v31 = (NSMutableDictionary *)objc_opt_new();
        }
        cacheLock_manifest = v15->_cacheLock_manifest;
        v15->_cacheLock_manifest = v31;

        if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
          [(PUIMappedImageCacheManager *)v15 _cacheLock_truncateCaches:1];
        }
      }
      else
      {
        uint64_t v32 = objc_opt_new();
        v33 = v15->_cacheLock_manifest;
        v15->_cacheLock_manifest = (NSMutableDictionary *)v32;
      }
    }
    char v13 = v15;
    self = v13;
  }
  else
  {
    char v13 = v11;
  }
  v35 = v13;

  return v35;
}

- (void)dealloc
{
  [(PUIMappedImageCacheManager *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PUIMappedImageCacheManager;
  [(PUIMappedImageCacheManager *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v4 = (id)[v3 appendString:@"invalidated"];
  }
  else
  {
    BOOL v5 = [(PUIMappedImageCacheManager *)self activeCaches];
    id v6 = (id)[v3 appendObject:v5 withName:@"activeCaches" skipIfNil:1];
  }
  id v7 = [v3 build];

  return (NSString *)v7;
}

- (id)checkoutImageCache:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [v4 date];
  id v7 = [(PUIMappedImageCacheManager *)self checkoutImageCache:v5 date:v6];

  return v7;
}

- (id)checkoutImageCache:(id)a3 date:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    v9 = 0;
LABEL_5:

    return v9;
  }
  if ([v7 length])
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    v9 = [(PUIMappedImageCacheManager *)self _cacheLock_checkoutImageCache:v7 didCreateNew:0 bumpDate:v8];
    os_unfair_lock_unlock(p_cacheLock);
    goto LABEL_5;
  }
  id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[imageCacheKey length] > 0"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[PUIMappedImageCacheManager checkoutImageCache:date:](a2);
  }
  [v12 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)returnImageCacheForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length] && (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    BOOL v5 = [(PUIMappedImageCacheManager *)self _cacheLock_teardownCacheForKey:v4];
    os_unfair_lock_unlock(p_cacheLock);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)returnImageCache:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_msgSend(a3, "pui_cacheIdentifier");
  if (v4) {
    BOOL v5 = [(PUIMappedImageCacheManager *)self returnImageCacheForKey:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)removeImageCacheForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    BOOL v6 = [(PUIMappedImageCacheManager *)self _cacheLock_removeCacheForKey:v4];
    os_unfair_lock_unlock(p_cacheLock);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSSet)activeCaches
{
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    objc_super v3 = 0;
  }
  else
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    objc_super v3 = [(PUIMappedImageCacheManager *)self _cacheLock_activeCaches];
    os_unfair_lock_unlock(p_cacheLock);
  }
  return (NSSet *)v3;
}

- (id)_cacheLock_activeCaches
{
  objc_super v3 = objc_opt_new();
  id v4 = [(NSMapTable *)self->_cacheLock_cacheKeyToWeakCache keyEnumerator];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    do
    {
      [v3 addObject:v6];
      uint64_t v7 = [v4 nextObject];

      BOOL v6 = (void *)v7;
    }
    while (v7);
  }

  return v3;
}

- (NSSet)knownCaches
{
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    objc_super v3 = 0;
  }
  else
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    uint64_t v5 = (void *)MEMORY[0x263EFFA08];
    BOOL v6 = [(NSMutableDictionary *)self->_cacheLock_manifest allKeys];
    objc_super v3 = [v5 setWithArray:v6];

    os_unfair_lock_unlock(p_cacheLock);
  }
  return (NSSet *)v3;
}

- (void)invalidate
{
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    [(id)objc_opt_class() unregisterCacheManagerForURL:self->_cacheURL];
    os_unfair_lock_lock(&self->_cacheLock);
    [(NSMapTable *)self->_cacheLock_cacheKeyToWeakCache removeAllObjects];
    os_unfair_lock_unlock(&self->_cacheLock);
  }
}

- (id)_cacheLock_checkoutImageCache:(id)a3 didCreateNew:(BOOL *)a4 bumpDate:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = PUILogCaching();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    cacheName = self->_cacheName;
    int v19 = 138544130;
    uint64_t v20 = cacheName;
    __int16 v21 = 2048;
    uint64_t v22 = self;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_25A0AF000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] checkoutImageCache:%@ bumpDate:%@", (uint8_t *)&v19, 0x2Au);
  }

  uint64_t v12 = [(NSMapTable *)self->_cacheLock_cacheKeyToWeakCache objectForKey:v8];
  char v13 = PUILogCaching();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      id v15 = self->_cacheName;
      int v19 = 138543874;
      uint64_t v20 = v15;
      __int16 v21 = 2048;
      uint64_t v22 = self;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl(&dword_25A0AF000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] checkoutImageCache found cache for %@", (uint8_t *)&v19, 0x20u);
    }

    uint64_t v16 = (void *)v12;
    if (a4) {
LABEL_7:
    }
      *a4 = v12 == 0;
  }
  else
  {
    if (v14)
    {
      uint64_t v18 = self->_cacheName;
      int v19 = 138543874;
      uint64_t v20 = v18;
      __int16 v21 = 2048;
      uint64_t v22 = self;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl(&dword_25A0AF000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] checkoutImageCache faulting in cache for %@", (uint8_t *)&v19, 0x20u);
    }

    uint64_t v16 = [(PUIMappedImageCacheManager *)self _cacheLock_buildMappedImageCacheForKey:v8];
    if (a4) {
      goto LABEL_7;
    }
  }
  [(PUIMappedImageCacheManager *)self _cacheLock_bumpManifestForImageCacheKey:v8 bumpDate:v9];

  return v16;
}

- (id)_cacheLock_buildMappedImageCacheForKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PUILogCaching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    cacheName = self->_cacheName;
    int v12 = 138543874;
    char v13 = cacheName;
    __int16 v14 = 2048;
    id v15 = self;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_25A0AF000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] building mapped image cache for key %@", (uint8_t *)&v12, 0x20u);
  }

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F5F420]) initFromProvider:self->_pathProvider];
  id v8 = [v7 providerByAppendingPathComponent:v4];

  id v9 = [MEMORY[0x263F29D48] optionsWithContainerPathProvider:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x263F29D40]) initWithUniqueIdentifier:v4 options:v9];
  objc_msgSend(v10, "pbui_setCacheManager:cacheIdentifier:", self, v4);
  [(NSMapTable *)self->_cacheLock_cacheKeyToWeakCache setObject:v10 forKey:v4];

  return v10;
}

- (BOOL)_cacheLock_teardownCacheForKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PUILogCaching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    cacheName = self->_cacheName;
    int v16 = 138543874;
    id v17 = cacheName;
    __int16 v18 = 2048;
    int v19 = self;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_25A0AF000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] teardownCacheForKey key %@", (uint8_t *)&v16, 0x20u);
  }

  uint64_t v7 = [(NSMapTable *)self->_cacheLock_cacheKeyToWeakCache objectForKey:v4];

  if (v7)
  {
    id v8 = PUILogCaching();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_12;
    }
    id v9 = self->_cacheName;
    int v16 = 138543874;
    id v17 = v9;
    __int16 v18 = 2048;
    int v19 = self;
    __int16 v20 = 2112;
    id v21 = v4;
    v10 = "[%{public}@/%p] teardownCacheForKey key %@ aborted; cache still alive somewhere";
LABEL_6:
    _os_log_impl(&dword_25A0AF000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, 0x20u);
    goto LABEL_7;
  }
  char v11 = [(NSMutableDictionary *)self->_cacheLock_manifest objectForKey:v4];

  id v8 = PUILogCaching();
  BOOL v12 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (!v12) {
      goto LABEL_7;
    }
    id v15 = self->_cacheName;
    int v16 = 138543874;
    id v17 = v15;
    __int16 v18 = 2048;
    int v19 = self;
    __int16 v20 = 2112;
    id v21 = v4;
    v10 = "[%{public}@/%p] teardownCacheForKey key %@ ignored - already cleaned up";
    goto LABEL_6;
  }
  if (v12)
  {
    char v13 = self->_cacheName;
    int v16 = 138543874;
    id v17 = v13;
    __int16 v18 = 2048;
    int v19 = self;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_25A0AF000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] teardownCacheForKey key %@ finished", (uint8_t *)&v16, 0x20u);
  }

  [(PUIMappedImageCacheManager *)self _cacheLock_truncateCaches:0];
LABEL_12:

  return v7 == 0;
}

- (BOOL)_cacheLock_removeCacheForKey:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PUILogCaching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    cacheName = self->_cacheName;
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = cacheName;
    __int16 v23 = 2048;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_25A0AF000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] removeCacheForKey %@", buf, 0x20u);
  }

  uint64_t v7 = [(NSMapTable *)self->_cacheLock_cacheKeyToWeakCache objectForKey:v4];

  if (v7)
  {
    id v8 = PUILogCaching();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      BOOL v11 = 0;
      goto LABEL_16;
    }
    id v9 = self->_cacheName;
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v4;
    v10 = "[%{public}@/%p] removeCacheForKey %@ aborted; cache is live";
LABEL_6:
    _os_log_impl(&dword_25A0AF000, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0x20u);
    goto LABEL_7;
  }
  BOOL v12 = [(NSMutableDictionary *)self->_cacheLock_manifest objectForKey:v4];

  if (!v12)
  {
    id v8 = PUILogCaching();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    __int16 v18 = self->_cacheName;
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v18;
    __int16 v23 = 2048;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v4;
    v10 = "[%{public}@/%p] removeCacheForKey %@ aborted; not currently in manifest";
    goto LABEL_6;
  }
  id v20 = 0;
  BOOL v13 = [(PUIMappedImageCacheManager *)self _cacheLock_deleteCacheDirectoryForKey:v4 error:&v20];
  id v8 = v20;
  if (!v13)
  {
    __int16 v14 = PUILogCaching();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v19 = self->_cacheName;
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = v19;
      __int16 v23 = 2048;
      id v24 = self;
      __int16 v25 = 2112;
      id v26 = v4;
      __int16 v27 = 2114;
      v28 = v8;
      _os_log_error_impl(&dword_25A0AF000, v14, OS_LOG_TYPE_ERROR, "[%{public}@/%p] removeCacheForKey; failed to cleanup cache key %@: %{public}@",
        buf,
        0x2Au);
    }
  }
  id v15 = PUILogCaching();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = self->_cacheName;
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v16;
    __int16 v23 = 2048;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_25A0AF000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] removeCacheForKey %@ completed; cache destroyed",
      buf,
      0x20u);
  }

  BOOL v11 = 1;
LABEL_16:

  return v11;
}

- (void)_cacheLock_bumpManifestForImageCacheKey:(id)a3 bumpDate:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = PUILogCaching();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    cacheName = self->_cacheName;
    int v12 = 138544130;
    BOOL v13 = cacheName;
    __int16 v14 = 2048;
    id v15 = self;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_25A0AF000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] bumpManifestForImageCacheKey %@ ; bumping to %{public}@",
      (uint8_t *)&v12,
      0x2Au);
  }

  cacheLock_manifest = self->_cacheLock_manifest;
  if (v7)
  {
    [(NSMutableDictionary *)self->_cacheLock_manifest setObject:v7 forKey:v6];
  }
  else
  {
    BOOL v11 = [MEMORY[0x263EFF910] date];
    [(NSMutableDictionary *)cacheLock_manifest setObject:v11 forKey:v6];
  }
  [(PUIMappedImageCacheManager *)self _cacheLock_writeManifest];
}

- (void)_cacheLock_writeManifest
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_2(&dword_25A0AF000, v0, v1, "[%{public}@/%p] writeManifest failed: %{public}@");
}

- (void)_cacheLock_truncateCaches:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v89 = *MEMORY[0x263EF8340];
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    uint64_t v5 = PUILogCaching();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      cacheName = self->_cacheName;
      *(_DWORD *)buf = 138543874;
      v81 = cacheName;
      __int16 v82 = 2048;
      v83 = self;
      __int16 v84 = 1024;
      LODWORD(v85) = v3;
      _os_log_impl(&dword_25A0AF000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; truncate on disk caches? %{BOOL}u",
        buf,
        0x1Cu);
    }

    unint64_t v7 = [(PUIMappedImageCacheManager *)self numberOfManagedCaches];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = PUILogCaching();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = self->_cacheName;
        *(_DWORD *)buf = 138543618;
        v81 = v9;
        __int16 v82 = 2048;
        v83 = self;
        _os_log_impl(&dword_25A0AF000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches bailing;  number of managed caches is NSNotFound",
          buf,
          0x16u);
      }
LABEL_65:

      return;
    }
    unint64_t v10 = v7;
    id v8 = [(PUIMappedImageCacheManager *)self _cacheLock_activeCaches];
    BOOL v11 = (void *)MEMORY[0x263EFFA08];
    int v12 = [(NSMutableDictionary *)self->_cacheLock_manifest allKeys];
    BOOL v13 = [v11 setWithArray:v12];

    unint64_t v14 = [v13 count];
    id v15 = PUILogCaching();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14 <= v10)
    {
      if (v16)
      {
        v45 = self->_cacheName;
        *(_DWORD *)buf = 138543618;
        v81 = v45;
        __int16 v82 = 2048;
        v83 = self;
        _os_log_impl(&dword_25A0AF000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; known caches is less than max number of managed caches",
          buf,
          0x16u);
      }

      int v46 = 0;
      if (!v3) {
        goto LABEL_60;
      }
    }
    else
    {
      if (v16)
      {
        id v17 = self->_cacheName;
        *(_DWORD *)buf = 138543618;
        v81 = v17;
        __int16 v82 = 2048;
        v83 = self;
        _os_log_impl(&dword_25A0AF000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; will proceed",
          buf,
          0x16u);
      }

      id v18 = objc_alloc(MEMORY[0x263F29C70]);
      uint64_t v19 = [(NSMutableDictionary *)self->_cacheLock_manifest count];
      uint64_t v20 = [MEMORY[0x263F29C90] sortUsingComparator:&__block_literal_global_53];
      id v21 = (void *)[v18 initWithCapacity:v19 keyOrderingStrategy:v20];

      cacheLock_manifest = self->_cacheLock_manifest;
      v77[0] = MEMORY[0x263EF8330];
      v77[1] = 3221225472;
      v77[2] = __56__PUIMappedImageCacheManager__cacheLock_truncateCaches___block_invoke_2;
      v77[3] = &unk_265471E98;
      id v23 = v21;
      id v78 = v23;
      [(NSMutableDictionary *)cacheLock_manifest enumerateKeysAndObjectsUsingBlock:v77];
      uint64_t v24 = [v23 count] - v10;
      if (v24 < 1)
      {
        char v31 = 0;
      }
      else
      {
        __int16 v25 = PUILogCaching();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = self->_cacheName;
          *(_DWORD *)buf = 138543874;
          v81 = v26;
          __int16 v82 = 2048;
          v83 = self;
          __int16 v84 = 2048;
          uint64_t v85 = v24;
          _os_log_impl(&dword_25A0AF000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; will attempt to cleanup %lu caches",
            buf,
            0x20u);
        }
        BOOL v64 = v3;

        id v63 = v23;
        __int16 v27 = [v23 allValues];
        v28 = objc_msgSend(v27, "subarrayWithRange:", v10, v24);

        long long v76 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v73 = 0u;
        obuint64_t j = v28;
        uint64_t v29 = [obj countByEnumeratingWithState:&v73 objects:v88 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          char v31 = 0;
          uint64_t v32 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v74 != v32) {
                objc_enumerationMutation(obj);
              }
              uint64_t v34 = *(void *)(*((void *)&v73 + 1) + 8 * i);
              int v35 = [v8 containsObject:v34];
              v36 = PUILogCaching();
              BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
              if (v35)
              {
                if (v37)
                {
                  id v38 = self->_cacheName;
                  *(_DWORD *)buf = 138543874;
                  v81 = v38;
                  __int16 v82 = 2048;
                  v83 = self;
                  __int16 v84 = 2114;
                  uint64_t v85 = v34;
                  _os_log_impl(&dword_25A0AF000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; will not cleanup cache %{public}@ as it is still active",
                    buf,
                    0x20u);
                }
              }
              else
              {
                if (v37)
                {
                  objc_super v39 = self->_cacheName;
                  *(_DWORD *)buf = 138543874;
                  v81 = v39;
                  __int16 v82 = 2048;
                  v83 = self;
                  __int16 v84 = 2114;
                  uint64_t v85 = v34;
                  _os_log_impl(&dword_25A0AF000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; will cleanup cache %{public}@",
                    buf,
                    0x20u);
                }

                [(NSMutableDictionary *)self->_cacheLock_manifest removeObjectForKey:v34];
                id v72 = 0;
                BOOL v40 = [(PUIMappedImageCacheManager *)self _cacheLock_deleteCacheDirectoryForKey:v34 error:&v72];
                v36 = v72;
                if (!v40)
                {
                  v41 = PUILogCaching();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  {
                    v44 = self->_cacheName;
                    *(_DWORD *)buf = 138544130;
                    v81 = v44;
                    __int16 v82 = 2048;
                    v83 = self;
                    __int16 v84 = 2112;
                    uint64_t v85 = v34;
                    __int16 v86 = 2114;
                    v87 = v36;
                    _os_log_error_impl(&dword_25A0AF000, v41, OS_LOG_TYPE_ERROR, "[%{public}@/%p] truncateCaches; failed to cleanup cache key %@: %{public}@",
                      buf,
                      0x2Au);
                  }
                }
                v42 = PUILogCaching();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  v43 = self->_cacheName;
                  *(_DWORD *)buf = 138543874;
                  v81 = v43;
                  __int16 v82 = 2048;
                  v83 = self;
                  __int16 v84 = 2114;
                  uint64_t v85 = v34;
                  _os_log_impl(&dword_25A0AF000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; did cleanup cache %{public}@",
                    buf,
                    0x20u);
                }

                char v31 = 1;
              }
            }
            uint64_t v30 = [obj countByEnumeratingWithState:&v73 objects:v88 count:16];
          }
          while (v30);
        }
        else
        {
          char v31 = 0;
        }

        BOOL v3 = v64;
        id v23 = v63;
      }

      int v46 = v31 & 1;
      if (!v3) {
        goto LABEL_60;
      }
    }
    int v65 = v46;
    v47 = PUILogCaching();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = self->_cacheName;
      *(_DWORD *)buf = 138543618;
      v81 = v48;
      __int16 v82 = 2048;
      v83 = self;
      _os_log_impl(&dword_25A0AF000, v47, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; will truncate on disk caches",
        buf,
        0x16u);
    }

    v49 = [(PUIMappedImageCacheManager *)self _cacheLock_onDiskCaches];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v68 objects:v79 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v69 != v52) {
            objc_enumerationMutation(v49);
          }
          uint64_t v54 = *(void *)(*((void *)&v68 + 1) + 8 * j);
          if (([v13 containsObject:v54] & 1) == 0
            && ([v8 containsObject:v54] & 1) == 0)
          {
            v55 = PUILogCaching();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              v56 = self->_cacheName;
              *(_DWORD *)buf = 138543874;
              v81 = v56;
              __int16 v82 = 2048;
              v83 = self;
              __int16 v84 = 2114;
              uint64_t v85 = v54;
              _os_log_impl(&dword_25A0AF000, v55, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; truncating on disk cache %{public}@",
                buf,
                0x20u);
            }

            id v67 = 0;
            BOOL v57 = [(PUIMappedImageCacheManager *)self _cacheLock_deleteCacheDirectoryForKey:v54 error:&v67];
            v58 = v67;
            if (!v57)
            {
              v59 = PUILogCaching();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                v60 = self->_cacheName;
                *(_DWORD *)buf = 138544130;
                v81 = v60;
                __int16 v82 = 2048;
                v83 = self;
                __int16 v84 = 2112;
                uint64_t v85 = v54;
                __int16 v86 = 2114;
                v87 = v58;
                _os_log_error_impl(&dword_25A0AF000, v59, OS_LOG_TYPE_ERROR, "[%{public}@/%p] truncateOnDiskCaches; failed to cleanup on disk cache key %@: %{public}@",
                  buf,
                  0x2Au);
              }
            }
          }
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v68 objects:v79 count:16];
      }
      while (v51);
    }

    int v46 = v65;
LABEL_60:
    if (v46)
    {
      v61 = PUILogCaching();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = self->_cacheName;
        *(_DWORD *)buf = 138543618;
        v81 = v62;
        __int16 v82 = 2048;
        v83 = self;
        _os_log_impl(&dword_25A0AF000, v61, OS_LOG_TYPE_DEFAULT, "[%{public}@/%p] truncateCaches; wrinting to manifest",
          buf,
          0x16u);
      }

      [(PUIMappedImageCacheManager *)self _cacheLock_writeManifest];
    }

    goto LABEL_65;
  }
}

uint64_t __56__PUIMappedImageCacheManager__cacheLock_truncateCaches___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __56__PUIMappedImageCacheManager__cacheLock_truncateCaches___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKey:a3];
}

- (BOOL)_cacheLock_deleteCacheDirectoryForKey:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x263F08850];
  id v7 = a3;
  id v8 = [v6 defaultManager];
  id v9 = [(NSURL *)self->_cacheURL URLByAppendingPathComponent:v7 isDirectory:1];

  LOBYTE(a4) = [v8 removeItemAtURL:v9 error:a4];
  return (char)a4;
}

- (id)_cacheLock_onDiskCaches
{
  v43[1] = *MEMORY[0x263EF8340];
  id v26 = objc_opt_new();
  BOOL v3 = [MEMORY[0x263F08850] defaultManager];
  __int16 v25 = self;
  cacheURL = self->_cacheURL;
  uint64_t v5 = *MEMORY[0x263EFF670];
  v43[0] = *MEMORY[0x263EFF670];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
  id v33 = 0;
  id v7 = [v3 contentsOfDirectoryAtURL:cacheURL includingPropertiesForKeys:v6 options:5 error:&v33];
  id v8 = v33;

  if (v8)
  {
    id v9 = PUILogCaching();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PUIMappedImageCacheManager _cacheLock_onDiskCaches]();
    }
  }
  uint64_t v24 = v8;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    uint64_t v14 = *MEMORY[0x263EFF668];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        BOOL v16 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
        id v27 = 0;
        id v28 = 0;
        [v16 getResourceValue:&v28 forKey:v5 error:&v27];
        id v17 = v28;
        id v18 = v27;
        if (v18)
        {
          uint64_t v19 = PUILogCaching();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            cacheName = v25->_cacheName;
            *(_DWORD *)buf = 138544130;
            int v35 = cacheName;
            __int16 v36 = 2048;
            BOOL v37 = v25;
            __int16 v38 = 2112;
            objc_super v39 = v16;
            __int16 v40 = 2114;
            id v41 = v18;
            _os_log_error_impl(&dword_25A0AF000, v19, OS_LOG_TYPE_ERROR, "[%{public}@/%p] onDiskCaches; failed to read resource type for URL %@: %{public}@",
              buf,
              0x2Au);
          }
        }
        if ([v17 isEqualToString:v14])
        {
          uint64_t v20 = [v16 lastPathComponent];
          [v26 addObject:v20];
        }
        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v12);
  }

  uint64_t v22 = (void *)[v26 copy];
  return v22;
}

- (unint64_t)numberOfManagedCaches
{
  return self->_numberOfManagedCaches;
}

- (BSPathProviding)pathProvider
{
  return (BSPathProviding *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_cacheName, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_pathProvider, 0);
  objc_storeStrong((id *)&self->_cacheLock_manifest, 0);
  objc_storeStrong((id *)&self->_cacheLock_cacheKeyToWeakCache, 0);
}

+ (void)registerCacheManager:cacheManager:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_25A0AF000, v0, v1, "Unable to create directory %@: %{public}@");
}

- (void)initWithNumberOfManagedCaches:(const char *)a1 pathProvider:.cold.1(const char *a1)
{
  os_log_t v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithNumberOfManagedCaches:pathProvider:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_25A0AF000, v0, v1, "[%p] failed to read manifest: %{public}@");
}

- (void)initWithNumberOfManagedCaches:(const char *)a1 pathProvider:.cold.3(const char *a1)
{
  os_log_t v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)checkoutImageCache:(const char *)a1 date:.cold.1(const char *a1)
{
  os_log_t v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_cacheLock_onDiskCaches
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_2(&dword_25A0AF000, v0, v1, "[%{public}@/%p] onDiskCaches; failed to read on disk caches: %{public}@");
}

@end