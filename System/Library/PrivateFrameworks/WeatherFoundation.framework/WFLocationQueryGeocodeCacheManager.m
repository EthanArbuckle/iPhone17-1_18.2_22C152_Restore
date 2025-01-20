@interface WFLocationQueryGeocodeCacheManager
+ (WFLocationQueryGeocodeCacheManager)sharedManager;
- (NSMutableDictionary)geocodeCache;
- (WFLocationQueryGeocodeCacheManager)init;
- (double)expirationTime;
- (id)_persistedInfoFromDisk;
- (id)_persistedInfoURL;
- (id)cachedLocationForKey:(id)a3;
- (os_unfair_lock_s)dataSynchronizationLock;
- (void)_discardExpiredLocations;
- (void)_persistInfoToDisk;
- (void)_persistedInfoFromDisk;
- (void)init;
- (void)updateCacheForKey:(id)a3 withLocation:(id)a4;
@end

@implementation WFLocationQueryGeocodeCacheManager

+ (WFLocationQueryGeocodeCacheManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_12);
  }
  v2 = (void *)sharedManager_geocodeCacheManager;
  return (WFLocationQueryGeocodeCacheManager *)v2;
}

uint64_t __51__WFLocationQueryGeocodeCacheManager_sharedManager__block_invoke()
{
  sharedManager_geocodeCacheManager = objc_alloc_init(WFLocationQueryGeocodeCacheManager);
  return MEMORY[0x270F9A758]();
}

- (WFLocationQueryGeocodeCacheManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)WFLocationQueryGeocodeCacheManager;
  v2 = [(WFLocationQueryGeocodeCacheManager *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_dataSynchronizationLock._os_unfair_lock_opaque = 0;
    v4 = [(WFLocationQueryGeocodeCacheManager *)v2 _persistedInfoFromDisk];
    uint64_t v5 = [v4 mutableCopy];
    geocodeCache = v3->_geocodeCache;
    v3->_geocodeCache = (NSMutableDictionary *)v5;

    v7 = +[WFSettingsManager sharedInstance];
    v8 = [v7 settings];
    [v8 cachedGeocodeLocationExpirationTimeInterval];
    v3->_expirationTime = v9;

    if (v3->_geocodeCache)
    {
      [(WFLocationQueryGeocodeCacheManager *)v3 _discardExpiredLocations];
    }
    else
    {
      v10 = WFLogForCategory(5uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[WFLocationQueryGeocodeCacheManager init](v10);
      }

      uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
      v12 = v3->_geocodeCache;
      v3->_geocodeCache = (NSMutableDictionary *)v11;
    }
  }
  return v3;
}

- (void)updateCacheForKey:(id)a3 withLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock_with_options();
    v8 = (void *)[v7 copy];
    double v9 = [(WFLocationQueryGeocodeCacheManager *)self geocodeCache];
    [v9 setObject:v8 forKeyedSubscript:v6];

    os_unfair_lock_unlock(&self->_dataSynchronizationLock);
    [(WFLocationQueryGeocodeCacheManager *)self _persistInfoToDisk];
  }
  else
  {
    v10 = WFLogForCategory(5uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[WFLocationQueryGeocodeCacheManager updateCacheForKey:withLocation:](v10);
    }
  }
}

- (id)cachedLocationForKey:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(WFLocationQueryGeocodeCacheManager *)self geocodeCache];
  id v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = (void *)[v6 copy];

  v8 = [MEMORY[0x263EFF910] date];
  double v9 = [v7 creationDate];
  [v8 timeIntervalSinceDate:v9];
  double v11 = v10;
  [(WFLocationQueryGeocodeCacheManager *)self expirationTime];
  double v13 = v12;

  if (v11 >= v13)
  {

    objc_super v14 = [(WFLocationQueryGeocodeCacheManager *)self geocodeCache];
    [v14 removeObjectForKey:v4];

    os_unfair_lock_unlock(&self->_dataSynchronizationLock);
    [(WFLocationQueryGeocodeCacheManager *)self _persistInfoToDisk];
    id v7 = 0;
  }
  else
  {
    os_unfair_lock_unlock(&self->_dataSynchronizationLock);
  }

  return v7;
}

- (void)_discardExpiredLocations
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(NSMutableDictionary *)self->_geocodeCache count];
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  geocodeCache = self->_geocodeCache;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __62__WFLocationQueryGeocodeCacheManager__discardExpiredLocations__block_invoke;
  v16 = &unk_2644318C0;
  id v7 = v5;
  id v17 = v7;
  v18 = self;
  v8 = [(NSMutableDictionary *)geocodeCache wf_filter:&v13];
  double v9 = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy", v13, v14, v15, v16);
  double v10 = self->_geocodeCache;
  self->_geocodeCache = v9;

  uint64_t v11 = [(NSMutableDictionary *)self->_geocodeCache count];
  os_unfair_lock_unlock(p_dataSynchronizationLock);
  double v12 = WFLogForCategory(5uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = v4 - v11;
    _os_log_impl(&dword_21C988000, v12, OS_LOG_TYPE_DEFAULT, "Purged %ld expired locations from the cache", buf, 0xCu);
  }

  [(WFLocationQueryGeocodeCacheManager *)self _persistInfoToDisk];
}

BOOL __62__WFLocationQueryGeocodeCacheManager__discardExpiredLocations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [a3 creationDate];
  [v4 timeIntervalSinceDate:v5];
  BOOL v7 = v6 < *(double *)(*(void *)(a1 + 40) + 24);

  return v7;
}

- (void)_persistInfoToDisk
{
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  id v4 = objc_alloc(NSDictionary);
  uint64_t v5 = [(WFLocationQueryGeocodeCacheManager *)self geocodeCache];
  id v9 = (id)[v4 initWithDictionary:v5 copyItems:1];

  os_unfair_lock_unlock(p_dataSynchronizationLock);
  double v6 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
  [v6 encodeObject:v9 forKey:@"geocodeCache"];
  [v6 finishEncoding];
  BOOL v7 = [v6 encodedData];
  v8 = [(WFLocationQueryGeocodeCacheManager *)self _persistedInfoURL];
  [v7 writeToURL:v8 atomically:1];
}

- (id)_persistedInfoURL
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [v2 URLForDirectory:9 inDomain:1 appropriateForURL:0 create:1 error:0];

  id v4 = [v3 URLByAppendingPathComponent:@"locationQueryGeocodeCacheFolder" isDirectory:0];

  return v4;
}

- (id)_persistedInfoFromDisk
{
  v3 = (void *)MEMORY[0x263EFF8F8];
  id v4 = [(WFLocationQueryGeocodeCacheManager *)self _persistedInfoURL];
  uint64_t v5 = [v3 dataWithContentsOfURL:v4];

  if (v5)
  {
    id v17 = 0;
    double v6 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v5 error:&v17];
    id v7 = v17;
    if (v6)
    {
      v8 = (void *)MEMORY[0x263EFFA08];
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
      id v16 = v7;
      double v12 = [v6 decodeTopLevelObjectOfClasses:v11 forKey:@"geocodeCache" error:&v16];
      id v13 = v16;

      if (!v12)
      {
        uint64_t v14 = WFLogForCategory(5uLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          [(WFLocationQueryGeocodeCacheManager *)self _persistedInfoFromDisk];
        }
      }
    }
    else
    {
      uint64_t v11 = WFLogForCategory(5uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        [(WFLocationQueryGeocodeCacheManager *)self _persistedInfoFromDisk];
      }
      double v12 = 0;
      id v13 = v7;
    }
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
}

- (NSMutableDictionary)geocodeCache
{
  return self->_geocodeCache;
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void).cxx_destruct
{
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21C988000, log, OS_LOG_TYPE_DEBUG, "Couldn't find a geocode cache ... creating a new one", v1, 2u);
}

- (void)updateCacheForKey:(os_log_t)log withLocation:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21C988000, log, OS_LOG_TYPE_FAULT, "Cannot cache a nil location", v1, 2u);
}

- (void)_persistedInfoFromDisk
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = [a1 _persistedInfoURL];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_21C988000, a3, OS_LOG_TYPE_ERROR, "Failed to read geocode cache: %{public}@ -- %{public}@", v5, 0x16u);
}

@end