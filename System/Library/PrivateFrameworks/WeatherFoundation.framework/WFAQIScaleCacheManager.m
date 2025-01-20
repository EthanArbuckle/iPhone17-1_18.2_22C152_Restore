@interface WFAQIScaleCacheManager
+ (WFAQIScaleCacheManager)sharedManager;
- (NSMutableDictionary)aqiScaleCache;
- (WFAQIScale)defaultScale;
- (WFAQIScaleCacheManager)init;
- (id)_persistedInfoFromDisk;
- (id)_persistedInfoURL;
- (id)cachedScaleFromIdentifier:(id)a3;
- (os_unfair_lock_s)dataSynchronizationLock;
- (void)_persistInfoToDisk;
- (void)_persistedInfoFromDisk;
- (void)clearCache;
- (void)init;
- (void)updateCacheWithScale:(id)a3 identifier:(id)a4;
@end

@implementation WFAQIScaleCacheManager

+ (WFAQIScaleCacheManager)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_19);
  }
  v2 = (void *)sharedManager_aqiScaleCacheManager;
  return (WFAQIScaleCacheManager *)v2;
}

uint64_t __39__WFAQIScaleCacheManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WFAQIScaleCacheManager);
  uint64_t v1 = sharedManager_aqiScaleCacheManager;
  sharedManager_aqiScaleCacheManager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (WFAQIScaleCacheManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)WFAQIScaleCacheManager;
  v2 = [(WFAQIScaleCacheManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_dataSynchronizationLock._os_unfair_lock_opaque = 0;
    v4 = [(WFAQIScaleCacheManager *)v2 _persistedInfoFromDisk];
    uint64_t v5 = [v4 mutableCopy];
    aqiScaleCache = v3->_aqiScaleCache;
    v3->_aqiScaleCache = (NSMutableDictionary *)v5;

    if (!v3->_aqiScaleCache)
    {
      v7 = WFLogForCategory(5uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[WFAQIScaleCacheManager init]();
      }

      uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
      v9 = v3->_aqiScaleCache;
      v3->_aqiScaleCache = (NSMutableDictionary *)v8;
    }
  }
  return v3;
}

- (void)updateCacheWithScale:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    v10 = WFLogForCategory(5uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[WFAQIScaleCacheManager updateCacheWithScale:identifier:]();
    }
    goto LABEL_8;
  }
  if (!v7)
  {
    v10 = WFLogForCategory(5uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[WFAQIScaleCacheManager updateCacheWithScale:identifier:]();
    }
LABEL_8:

    goto LABEL_9;
  }
  os_unfair_lock_lock_with_options();
  v9 = [(WFAQIScaleCacheManager *)self aqiScaleCache];
  [v9 setObject:v6 forKeyedSubscript:v8];

  os_unfair_lock_unlock(&self->_dataSynchronizationLock);
  [(WFAQIScaleCacheManager *)self _persistInfoToDisk];
LABEL_9:
}

- (id)cachedScaleFromIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    os_unfair_lock_lock_with_options();
    id v6 = [(WFAQIScaleCacheManager *)self aqiScaleCache];
    id v7 = [v6 objectForKeyedSubscript:v4];

    os_unfair_lock_unlock(p_dataSynchronizationLock);
  }
  else
  {
    uint64_t v8 = WFLogForCategory(5uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[WFAQIScaleCacheManager updateCacheWithScale:identifier:]();
    }

    id v7 = 0;
  }

  return v7;
}

- (void)clearCache
{
  v3 = WeatherFoundationInternalUserDefaults();
  [v3 removeObjectForKey:@"aqiRemoteScales"];

  os_unfair_lock_lock_with_options();
  id v4 = [(WFAQIScaleCacheManager *)self aqiScaleCache];
  [v4 removeAllObjects];

  os_unfair_lock_unlock(&self->_dataSynchronizationLock);
  id v6 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = [(WFAQIScaleCacheManager *)self _persistedInfoURL];
  [v6 removeItemAtURL:v5 error:0];
}

- (void)_persistInfoToDisk
{
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  id v4 = objc_alloc(NSDictionary);
  uint64_t v5 = [(WFAQIScaleCacheManager *)self aqiScaleCache];
  id v9 = (id)[v4 initWithDictionary:v5 copyItems:1];

  os_unfair_lock_unlock(p_dataSynchronizationLock);
  id v6 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
  [v6 encodeObject:v9 forKey:@"scalesCache"];
  [v6 finishEncoding];
  id v7 = [v6 encodedData];
  uint64_t v8 = [(WFAQIScaleCacheManager *)self _persistedInfoURL];
  [v7 writeToURL:v8 atomically:1];
}

- (id)_persistedInfoURL
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [v2 URLForDirectory:9 inDomain:1 appropriateForURL:0 create:1 error:0];

  id v4 = [v3 URLByAppendingPathComponent:@"serverDrivenAQIScalesCacheFolder" isDirectory:0];

  return v4;
}

- (id)_persistedInfoFromDisk
{
  v3 = (void *)MEMORY[0x263EFF8F8];
  id v4 = [(WFAQIScaleCacheManager *)self _persistedInfoURL];
  uint64_t v5 = [v3 dataWithContentsOfURL:v4];

  if (v5)
  {
    id v17 = 0;
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v5 error:&v17];
    id v7 = v17;
    if (v6)
    {
      uint64_t v8 = (void *)MEMORY[0x263EFFA08];
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      objc_super v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
      id v16 = v7;
      v12 = [v6 decodeTopLevelObjectOfClasses:v11 forKey:@"scalesCache" error:&v16];
      id v13 = v16;

      if (!v12)
      {
        v14 = WFLogForCategory(5uLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          [(WFAQIScaleCacheManager *)self _persistedInfoFromDisk];
        }
      }
    }
    else
    {
      objc_super v11 = WFLogForCategory(5uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        [(WFLocationQueryGeocodeCacheManager *)self _persistedInfoFromDisk];
      }
      v12 = 0;
      id v13 = v7;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WFAQIScale)defaultScale
{
  return self->_defaultScale;
}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
}

- (NSMutableDictionary)aqiScaleCache
{
  return self->_aqiScaleCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aqiScaleCache, 0);
  objc_storeStrong((id *)&self->_defaultScale, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_21C988000, v0, OS_LOG_TYPE_DEBUG, "Couldn't find an aqi scale cache ... creating a new one", v1, 2u);
}

- (void)updateCacheWithScale:identifier:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2(&dword_21C988000, v0, v1, "Cannot cache a nil scale", v2, v3, v4, v5, v6);
}

- (void)updateCacheWithScale:identifier:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2(&dword_21C988000, v0, v1, "identifier is nil", v2, v3, v4, v5, v6);
}

- (void)_persistedInfoFromDisk
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 _persistedInfoURL];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_21C988000, a3, OS_LOG_TYPE_ERROR, "Failed to read: %{public}@ -- %{public}@", v5, 0x16u);
}

@end