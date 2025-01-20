@interface ATXLocationManagerGPSCoreLocation
+ (id)sharedInstance;
- (ATXLocationManagerGPSDelegate)delegate;
- (BOOL)locationEnabled;
- (BOOL)preciseLocationEnabled;
- (CLLocation)location;
- (id)_existingRegionWithIdentifierOnCLQueue:(id)a3;
- (id)_init;
- (id)updateLocationWithTimeout:(double)a3 requestPreciseLocation:(BOOL)a4;
- (int64_t)stateForRegion:(id)a3 withTimeout:(double)a4;
- (void)_requestStateIfNeededForRegion:(id)a3;
- (void)_startUpdateIfNeededWithPreciseLocation:(BOOL)a3;
- (void)_updateConditionAndInvokeLocationBlocks:(id)a3 error:(id)a4;
- (void)beginMonitoringRegion:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stopMonitoringRegionWithIdentifier:(id)a3;
- (void)updateLocationWithCompletionHandler:(id)a3;
@end

@implementation ATXLocationManagerGPSCoreLocation

- (id)_init
{
  v14.receiver = self;
  v14.super_class = (Class)ATXLocationManagerGPSCoreLocation;
  v2 = [(ATXLocationManagerGPSCoreLocation *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    updateCondition = v2->_updateCondition;
    v2->_updateCondition = (NSCondition *)v3;

    uint64_t v5 = objc_opt_new();
    requestStateCondition = v2->_requestStateCondition;
    v2->_requestStateCondition = (NSCondition *)v5;

    v2->_state = 0;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("_clCallbackQueue", v7);
    clQueue = v2->_clQueue;
    v2->_clQueue = (OS_dispatch_queue *)v8;

    v10 = v2->_clQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__ATXLocationManagerGPSCoreLocation__init__block_invoke;
    block[3] = &unk_1E6BE74E8;
    v13 = v2;
    dispatch_sync(v10, block);
  }
  return v2;
}

uint64_t __42__ATXLocationManagerGPSCoreLocation__init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1E600]) initWithEffectiveBundlePath:@"/System/Library/PrivateFrameworks/CoreParsec.framework" delegate:*(void *)(a1 + 32) onQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(*(void *)(a1 + 32) + 8) setDesiredAccuracy:*MEMORY[0x1E4F1E6E8]];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = [*(id *)(*(void *)(a1 + 32) + 8) authorizationStatus] == 3;
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) accuracyAuthorization];
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = result == 0;
  return result;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ATXLocationManagerGPSCoreLocation_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, block);
  }
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult;

  return v2;
}

void __51__ATXLocationManagerGPSCoreLocation_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E0187360]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v4 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v3;
}

- (void)dealloc
{
  clQueue = self->_clQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ATXLocationManagerGPSCoreLocation_dealloc__block_invoke;
  block[3] = &unk_1E6BE74E8;
  void block[4] = self;
  dispatch_async(clQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)ATXLocationManagerGPSCoreLocation;
  [(ATXLocationManagerGPSCoreLocation *)&v4 dealloc];
}

id __44__ATXLocationManagerGPSCoreLocation_dealloc__block_invoke()
{
  return self;
}

- (BOOL)locationEnabled
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL locationEnabled = v2->_locationEnabled;
  objc_sync_exit(v2);

  return locationEnabled;
}

- (BOOL)preciseLocationEnabled
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL preciseLocationEnabled = v2->_preciseLocationEnabled;
  objc_sync_exit(v2);

  return preciseLocationEnabled;
}

- (CLLocation)location
{
  return [(CLLocationManager *)self->_locationManager location];
}

- (void)_startUpdateIfNeededWithPreciseLocation:(BOOL)a3
{
  if (!self->_updatePending)
  {
    self->_updatePending = 1;
    clQueue = self->_clQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __77__ATXLocationManagerGPSCoreLocation__startUpdateIfNeededWithPreciseLocation___block_invoke;
    v4[3] = &unk_1E6BE7730;
    v4[4] = self;
    BOOL v5 = a3;
    dispatch_async(clQueue, v4);
  }
}

uint64_t __77__ATXLocationManagerGPSCoreLocation__startUpdateIfNeededWithPreciseLocation___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    BOOL v5 = (void *)v4;
    v6 = @"YES";
    if (!*(unsigned char *)(a1 + 40)) {
      v6 = @"NO";
    }
    int v9 = 138412546;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1DAFF9000, v2, OS_LOG_TYPE_DEFAULT, "%@ - Querying GPS location now, requesting with precise location: %@", (uint8_t *)&v9, 0x16u);
  }
  v7 = (double *)MEMORY[0x1E4F1E6D8];
  if (!*(unsigned char *)(a1 + 40)) {
    v7 = (double *)MEMORY[0x1E4F1E6E8];
  }
  [*(id *)(*(void *)(a1 + 32) + 8) setDesiredAccuracy:*v7];
  return [*(id *)(*(void *)(a1 + 32) + 8) requestLocation];
}

- (id)updateLocationWithTimeout:(double)a3 requestPreciseLocation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0.0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"ATXLocationManagerGPS.m", 126, @"Invalid parameter not satisfying: %@", @"timeout > 0" object file lineNumber description];
  }
  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
  BOOL v8 = [(ATXLocationManagerGPSCoreLocation *)self preciseLocationEnabled];
  [(NSCondition *)self->_updateCondition lock];
  [(ATXLocationManagerGPSCoreLocation *)self _startUpdateIfNeededWithPreciseLocation:v8 & v4];
  while (self->_updatePending)
  {
    if (![(NSCondition *)self->_updateCondition waitUntilDate:v7])
    {
      int v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = (objc_class *)objc_opt_class();
        __int16 v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl(&dword_1DAFF9000, v9, OS_LOG_TYPE_DEFAULT, "%@ - Timeout waiting for location update", buf, 0xCu);
      }
      break;
    }
  }
  [(NSCondition *)self->_updateCondition unlock];
  v12 = [(ATXLocationManagerGPSCoreLocation *)self location];

  return v12;
}

- (void)updateLocationWithCompletionHandler:(id)a3
{
  id v8 = a3;
  [(NSCondition *)self->_updateCondition lock];
  locationBlocksToInvoke = self->_locationBlocksToInvoke;
  if (!locationBlocksToInvoke)
  {
    BOOL v5 = [MEMORY[0x1E4F1CA80] set];
    v6 = self->_locationBlocksToInvoke;
    self->_locationBlocksToInvoke = v5;

    locationBlocksToInvoke = self->_locationBlocksToInvoke;
  }
  v7 = (void *)MEMORY[0x1E0187570](v8);
  [(NSMutableSet *)locationBlocksToInvoke addObject:v7];

  [(ATXLocationManagerGPSCoreLocation *)self _startUpdateIfNeededWithPreciseLocation:0];
  [(NSCondition *)self->_updateCondition unlock];
}

- (void)beginMonitoringRegion:(id)a3
{
  id v4 = a3;
  clQueue = self->_clQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ATXLocationManagerGPSCoreLocation_beginMonitoringRegion___block_invoke;
  v7[3] = &unk_1E6BE7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clQueue, v7);
}

uint64_t __59__ATXLocationManagerGPSCoreLocation_beginMonitoringRegion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) startMonitoringForRegion:*(void *)(a1 + 40)];
}

- (int64_t)stateForRegion:(id)a3 withTimeout:(double)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a4 <= 0.0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ATXLocationManagerGPS.m", 169, @"Invalid parameter not satisfying: %@", @"timeout > 0" object file lineNumber description];
  }
  id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a4];
  [(NSCondition *)self->_requestStateCondition lock];
  [(ATXLocationManagerGPSCoreLocation *)self _requestStateIfNeededForRegion:v7];
  while (self->_regionRequested)
  {
    if (![(NSCondition *)self->_requestStateCondition waitUntilDate:v8])
    {
      int v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DAFF9000, v9, OS_LOG_TYPE_DEFAULT, "Timeout waiting for region state update", buf, 2u);
      }

      regionRequested = self->_regionRequested;
      self->_regionRequested = 0;
      self->_int64_t state = 0;

      break;
    }
  }
  [(NSCondition *)self->_requestStateCondition unlock];
  __int16 v11 = __atxlog_handle_default();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v7 identifier];
    int64_t state = self->_state;
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "-[ATXLocationManagerGPSCoreLocation stateForRegion:withTimeout:]";
    __int16 v19 = 2112;
    v20 = v12;
    __int16 v21 = 2048;
    int64_t v22 = state;
    _os_log_impl(&dword_1DAFF9000, v11, OS_LOG_TYPE_DEFAULT, "%s: region: %@, state: %ld", buf, 0x20u);
  }
  int64_t v14 = self->_state;

  return v14;
}

- (void)_requestStateIfNeededForRegion:(id)a3
{
  id v5 = a3;
  if (!self->_regionRequested)
  {
    objc_storeStrong((id *)&self->_regionRequested, a3);
    self->_int64_t state = 0;
    clQueue = self->_clQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__ATXLocationManagerGPSCoreLocation__requestStateIfNeededForRegion___block_invoke;
    v7[3] = &unk_1E6BE7758;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(clQueue, v7);
  }
}

uint64_t __68__ATXLocationManagerGPSCoreLocation__requestStateIfNeededForRegion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) requestStateForRegion:*(void *)(a1 + 40)];
}

- (id)_existingRegionWithIdentifierOnCLQueue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clQueue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CLLocationManager *)self->_locationManager monitoredRegions];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)stopMonitoringRegionWithIdentifier:(id)a3
{
  id v4 = a3;
  clQueue = self->_clQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ATXLocationManagerGPSCoreLocation_stopMonitoringRegionWithIdentifier___block_invoke;
  v7[3] = &unk_1E6BE7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clQueue, v7);
}

uint64_t __72__ATXLocationManagerGPSCoreLocation_stopMonitoringRegionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _existingRegionWithIdentifierOnCLQueue:*(void *)(a1 + 40)];
  if (v2) {
    [*(id *)(*(void *)(a1 + 32) + 8) stopMonitoringForRegion:v2];
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_updateConditionAndInvokeLocationBlocks:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(NSCondition *)self->_updateCondition lock];
  self->_updatePending = 0;
  [(NSCondition *)self->_updateCondition broadcast];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = self->_locationBlocksToInvoke;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  locationBlocksToInvoke = self->_locationBlocksToInvoke;
  self->_locationBlocksToInvoke = 0;

  [(NSCondition *)self->_updateCondition unlock];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a4, "lastObject", a3);
  id v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    [v5 coordinate];
    uint64_t v10 = v9;
    [v5 coordinate];
    int v12 = 138412803;
    long long v13 = v8;
    __int16 v14 = 2053;
    uint64_t v15 = v10;
    __int16 v16 = 2053;
    uint64_t v17 = v11;
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "%@ - Got location update: %{sensitive}f, %{sensitive}f", (uint8_t *)&v12, 0x20u);
  }
  [(ATXLocationManagerGPSCoreLocation *)self _updateConditionAndInvokeLocationBlocks:v5 error:0];
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "Started monitoring region: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = __atxlog_handle_default();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[ATXLocationManagerGPSCoreLocation locationManager:monitoringDidFailForRegion:withError:](v6, (uint64_t)v7, v8);
  }
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 identifier];
      [v6 center];
      uint64_t v10 = v9;
      [v6 center];
      uint64_t v12 = v11;
      [v6 radius];
      *(_DWORD *)buf = 138413058;
      uint64_t v19 = v8;
      __int16 v20 = 2048;
      uint64_t v21 = v10;
      __int16 v22 = 2048;
      uint64_t v23 = v12;
      __int16 v24 = 2048;
      uint64_t v25 = v13;
      _os_log_impl(&dword_1DAFF9000, v7, OS_LOG_TYPE_DEFAULT, "did enter region: %@, region center: (%f, %f), region radius: %f", buf, 0x2Au);
    }
    goto LABEL_6;
  }
  id v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 identifier];
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = objc_opt_class();
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "did enter region: %@, class: %@", buf, 0x16u);
LABEL_6:
  }
  __int16 v14 = dispatch_get_global_queue(9, 0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__ATXLocationManagerGPSCoreLocation_locationManager_didEnterRegion___block_invoke;
  v16[3] = &unk_1E6BE7758;
  v16[4] = self;
  id v17 = v5;
  id v15 = v5;
  dispatch_async(v14, v16);
}

void __68__ATXLocationManagerGPSCoreLocation_locationManager_didEnterRegion___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  [v4 locationManagerGPS:v2 didEnterRegionWithIdentifier:v3];
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 identifier];
      [v6 center];
      uint64_t v10 = v9;
      [v6 center];
      uint64_t v12 = v11;
      [v6 radius];
      *(_DWORD *)buf = 138413058;
      uint64_t v19 = v8;
      __int16 v20 = 2048;
      uint64_t v21 = v10;
      __int16 v22 = 2048;
      uint64_t v23 = v12;
      __int16 v24 = 2048;
      uint64_t v25 = v13;
      _os_log_impl(&dword_1DAFF9000, v7, OS_LOG_TYPE_DEFAULT, "did exit region: %@, region center: (%f, %f), region radius: %f", buf, 0x2Au);
    }
    goto LABEL_6;
  }
  id v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 identifier];
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = objc_opt_class();
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "did exit region: %@, class: %@", buf, 0x16u);
LABEL_6:
  }
  __int16 v14 = dispatch_get_global_queue(9, 0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__ATXLocationManagerGPSCoreLocation_locationManager_didExitRegion___block_invoke;
  v16[3] = &unk_1E6BE7758;
  v16[4] = self;
  id v17 = v5;
  id v15 = v5;
  dispatch_async(v14, v16);
}

void __67__ATXLocationManagerGPSCoreLocation_locationManager_didExitRegion___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  [v4 locationManagerGPS:v2 didExitRegionWithIdentifier:v3];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  int locationEnabled = v5->_locationEnabled;
  int v7 = [v4 authorizationStatus] == 3;
  v5->_int locationEnabled = v7;
  int preciseLocationEnabled = v5->_preciseLocationEnabled;
  int v9 = [v4 accuracyAuthorization] == 0;
  v5->_int preciseLocationEnabled = v9;
  objc_sync_exit(v5);

  if (locationEnabled != v7)
  {
    uint64_t v10 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__ATXLocationManagerGPSCoreLocation_locationManagerDidChangeAuthorization___block_invoke;
    block[3] = &unk_1E6BE7730;
    void block[4] = v5;
    char v15 = v7;
    dispatch_async(v10, block);
  }
  if (preciseLocationEnabled != v9)
  {
    uint64_t v11 = dispatch_get_global_queue(9, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__ATXLocationManagerGPSCoreLocation_locationManagerDidChangeAuthorization___block_invoke_2;
    v12[3] = &unk_1E6BE7730;
    v12[4] = v5;
    char v13 = v9;
    dispatch_async(v11, v12);
  }
}

void __75__ATXLocationManagerGPSCoreLocation_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didChangeLocationEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void __75__ATXLocationManagerGPSCoreLocation_locationManagerDidChangeAuthorization___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didChangePreciseLocationEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ATXLocationManagerGPSCoreLocation locationManager:didFailWithError:]((uint64_t)v5, v6);
  }

  [(ATXLocationManagerGPSCoreLocation *)self _updateConditionAndInvokeLocationBlocks:0 error:v5];
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = __atxlog_handle_default();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 identifier];
    int v12 = 136315650;
    char v13 = "-[ATXLocationManagerGPSCoreLocation locationManager:didDetermineState:forRegion:]";
    __int16 v14 = 2112;
    char v15 = v9;
    __int16 v16 = 2048;
    int64_t v17 = a4;
    _os_log_impl(&dword_1DAFF9000, v8, OS_LOG_TYPE_DEFAULT, "%s: region: %@, state: %ld", (uint8_t *)&v12, 0x20u);
  }
  [(NSCondition *)self->_requestStateCondition lock];
  regionRequested = self->_regionRequested;
  if (regionRequested && [(CLRegion *)regionRequested isEqual:v7])
  {
    uint64_t v11 = self->_regionRequested;
    self->_regionRequested = 0;

    self->_int64_t state = a4;
    [(NSCondition *)self->_requestStateCondition broadcast];
  }
  [(NSCondition *)self->_requestStateCondition unlock];
}

- (ATXLocationManagerGPSDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXLocationManagerGPSDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_regionRequested, 0);
  objc_storeStrong((id *)&self->_requestStateCondition, 0);
  objc_storeStrong((id *)&self->_locationBlocksToInvoke, 0);
  objc_storeStrong((id *)&self->_updateCondition, 0);
  objc_storeStrong((id *)&self->_clQueue, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (void)locationManager:(void *)a1 monitoringDidFailForRegion:(uint64_t)a2 withError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 identifier];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1DAFF9000, a3, OS_LOG_TYPE_ERROR, "Failed to start monitoring region: %@ error: %@", (uint8_t *)&v6, 0x16u);
}

- (void)locationManager:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_ERROR, "Location error %@", (uint8_t *)&v2, 0xCu);
}

@end