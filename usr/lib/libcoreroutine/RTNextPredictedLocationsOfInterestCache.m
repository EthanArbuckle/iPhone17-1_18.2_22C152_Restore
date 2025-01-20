@interface RTNextPredictedLocationsOfInterestCache
+ (id)cachePath;
- (BOOL)enabled;
- (NSArray)nextPredictedLocationsOfInterest;
- (OS_dispatch_queue)queue;
- (RTDataProtectionManager)dataProtectionManager;
- (RTNextPredictedLocationsOfInterestCache)init;
- (RTNextPredictedLocationsOfInterestCache)initWithQueue:(id)a3 dataProtectionManager:(id)a4 starkManager:(id)a5;
- (RTNextPredictedLocationsOfInterestCacheDelegate)delegate;
- (RTStarkManager)starkManager;
- (void)cacheNextPredictedLocationsOfInterest:(id)a3;
- (void)clear;
- (void)dealloc;
- (void)handleUnlockedSinceBoot:(BOOL)a3;
- (void)onDataProtectionNotification:(id)a3;
- (void)onStarkNotification:(id)a3;
- (void)purgeWithReferenceDate:(id)a3;
- (void)setDataProtectionManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setNextPredictedLocationsOfInterest:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStarkManager:(id)a3;
@end

@implementation RTNextPredictedLocationsOfInterestCache

+ (id)cachePath
{
  return (id)[MEMORY[0x1E4F28CB8] pathInCacheDirectory:@"nextPloi.archive"];
}

- (RTNextPredictedLocationsOfInterestCache)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_dataProtectionManager_starkManager_);
}

- (RTNextPredictedLocationsOfInterestCache)initWithQueue:(id)a3 dataProtectionManager:(id)a4 starkManager:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)RTNextPredictedLocationsOfInterestCache;
  v12 = [(RTNextPredictedLocationsOfInterestCache *)&v33 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong((id *)&v13->_dataProtectionManager, a4);
    objc_storeStrong((id *)&v13->_starkManager, a5);
    v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    v15 = +[RTNextPredictedLocationsOfInterestCache cachePath];
    int v16 = [v14 fileExistsAtPath:v15];

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E4F1C9B8];
      v18 = +[RTNextPredictedLocationsOfInterestCache cachePath];
      v19 = [v17 dataWithContentsOfFile:v18];

      v20 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = objc_opt_class();
      v24 = [v20 setWithObjects:v21, v22, v23, objc_opt_class(), 0];
      id v32 = 0;
      uint64_t v25 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v24 fromData:v19 error:&v32];
      id v26 = v32;
      nextPredictedLocationsOfInterest = v13->_nextPredictedLocationsOfInterest;
      v13->_nextPredictedLocationsOfInterest = (NSArray *)v25;

      if (v26)
      {
        v28 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v26;
          _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "error while decoding NPLOI archive, %@", buf, 0xCu);
        }
      }
    }
    dataProtectionManager = v13->_dataProtectionManager;
    v30 = +[RTNotification notificationName];
    [(RTNotifier *)dataProtectionManager addObserver:v13 selector:sel_onDataProtectionNotification_ name:v30];
  }
  return v13;
}

- (void)dealloc
{
  [(RTNotifier *)self->_dataProtectionManager removeObserver:self];
  [(RTNotifier *)self->_starkManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)RTNextPredictedLocationsOfInterestCache;
  [(RTNextPredictedLocationsOfInterestCache *)&v3 dealloc];
}

- (void)cacheNextPredictedLocationsOfInterest:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = [v4 firstObject];
    v7 = [v5 arrayWithObject:v6];
    [(RTNextPredictedLocationsOfInterestCache *)self setNextPredictedLocationsOfInterest:v7];

    v8 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = +[RTNextPredictedLocationsOfInterestCache cachePath];
      id v10 = [(RTNextPredictedLocationsOfInterestCache *)self nextPredictedLocationsOfInterest];
      id v11 = [v10 firstObject];
      *(_DWORD *)buf = 138412546;
      v24 = v9;
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "caching next predicted location of interest, %@, at, %@", buf, 0x16u);
    }
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    v13 = [(RTNextPredictedLocationsOfInterestCache *)self nextPredictedLocationsOfInterest];
    [v12 encodeObject:v13 forKey:*MEMORY[0x1E4F284E8]];

    [v12 finishEncoding];
    uint64_t v21 = *MEMORY[0x1E4F28370];
    uint64_t v22 = *MEMORY[0x1E4F28358];
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v16 = +[RTNextPredictedLocationsOfInterestCache cachePath];
    v17 = [v12 encodedData];
    char v18 = [v15 createFileAtPath:v16 contents:v17 attributes:v14];

    if ((v18 & 1) == 0)
    {
      v19 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = +[RTNextPredictedLocationsOfInterestCache cachePath];
        *(_DWORD *)buf = 138412290;
        v24 = v20;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "failed to create file at %@", buf, 0xCu);
      }
      [(RTNextPredictedLocationsOfInterestCache *)self clear];
    }
  }
  else
  {
    [(RTNextPredictedLocationsOfInterestCache *)self clear];
  }
}

- (void)clear
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(RTNextPredictedLocationsOfInterestCache *)self setNextPredictedLocationsOfInterest:0];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_super v3 = +[RTNextPredictedLocationsOfInterestCache cachePath];
  int v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = +[RTNextPredictedLocationsOfInterestCache cachePath];
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "clearing next predicted locations of interesting cache at %@", (uint8_t *)&v9, 0xCu);
    }
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    v8 = +[RTNextPredictedLocationsOfInterestCache cachePath];
    [v7 removeItemAtPath:v8 error:0];
  }
}

- (void)purgeWithReferenceDate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = +[RTNextPredictedLocationsOfInterestCache cachePath];
  int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v9 = +[RTNextPredictedLocationsOfInterestCache cachePath];
    id v10 = [v8 attributesOfItemAtPath:v9 error:0];

    uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v4 sinceDate:-86400.0];
    v12 = [v10 objectForKey:*MEMORY[0x1E4F282C0]];
    v13 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = [v11 stringFromDate];
      v15 = [v12 stringFromDate];
      int v18 = 138412546;
      v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "purge cache predating, %@, file date, %@", (uint8_t *)&v18, 0x16u);
    }
    int v16 = [v11 earlierDate:v12];
    int v17 = [v16 isEqualToDate:v12];

    if (v17) {
      [(RTNextPredictedLocationsOfInterestCache *)self clear];
    }
  }
}

- (void)onDataProtectionNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    v8 = [(RTNextPredictedLocationsOfInterestCache *)self queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__RTNextPredictedLocationsOfInterestCache_onDataProtectionNotification___block_invoke;
    v9[3] = &unk_1E6B90BF0;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(v8, v9);
  }
}

uint64_t __72__RTNextPredictedLocationsOfInterestCache_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) unlockedSinceBoot];

  return [v1 handleUnlockedSinceBoot:v2];
}

- (void)handleUnlockedSinceBoot:(BOOL)a3
{
  if (a3)
  {
    dataProtectionManager = self->_dataProtectionManager;
    v5 = +[RTNotification notificationName];
    [(RTNotifier *)dataProtectionManager removeObserver:self fromNotification:v5];

    starkManager = self->_starkManager;
    id v7 = +[RTNotification notificationName];
    [(RTNotifier *)starkManager addObserver:self selector:sel_onStarkNotification_ name:v7];
  }
}

- (void)onStarkNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    v8 = [(RTNextPredictedLocationsOfInterestCache *)self queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__RTNextPredictedLocationsOfInterestCache_onStarkNotification___block_invoke;
    v9[3] = &unk_1E6B90BF0;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(v8, v9);
  }
}

uint64_t __63__RTNextPredictedLocationsOfInterestCache_onStarkNotification___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) trustedConnectionEstablished];

  return [v1 handleStarkTrustedConnectionEstablished:v2];
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_enabled) {
        v5 = @"YES";
      }
      else {
        v5 = @"NO";
      }
      int v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "next predicted location of interest cache, enabled, %@", (uint8_t *)&v7, 0xCu);
    }

    v6 = [(RTNextPredictedLocationsOfInterestCache *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v6 onCacheEnabledDidChange:self->_enabled];
    }
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (RTNextPredictedLocationsOfInterestCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTNextPredictedLocationsOfInterestCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSArray)nextPredictedLocationsOfInterest
{
  return self->_nextPredictedLocationsOfInterest;
}

- (void)setNextPredictedLocationsOfInterest:(id)a3
{
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (void)setDataProtectionManager:(id)a3
{
}

- (RTStarkManager)starkManager
{
  return self->_starkManager;
}

- (void)setStarkManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starkManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterest, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end