@interface ATXLocationManager
+ (id)debugDescriptionForCLLocation:(id)a3;
+ (id)stringForLOIType:(int64_t)a3;
- (ATXLocationManager)initWithGPS:(id)a3 routine:(id)a4 stateStore:(id)a5 now:(id)a6 modeGlobals:(id)a7;
- (ATXLocationManager)initWithStateStore:(id)a3 modeGlobals:(id)a4;
- (BOOL)isAvailableLocationOfInterestType:(int64_t)a3;
- (BOOL)isLocationNearKnownTypeLocationOfInterest:(id)a3;
- (BOOL)isNearFrequentLocationOfInterest;
- (BOOL)isNearKnownTypeLocationOfInterest;
- (BOOL)isNearKnownTypeOrFrequentLocationOfInterest;
- (BOOL)isTourist;
- (BOOL)isTouristWithCurrentDate:(id)a3;
- (BOOL)locationEnabled;
- (BOOL)preciseLocationEnabled;
- (NSDate)now;
- (double)_distanceOfCurrentLocationFrom:(id)a3;
- (double)distanceFromGymOfCurrentLocationInMeters;
- (double)distanceFromHomeOfCurrentLocationInMeters;
- (double)distanceFromSchoolOfCurrentLocationInMeters;
- (double)distanceFromWorkOfCurrentLocationInMeters;
- (double)predictedExitDateTimeout;
- (double)predictedNextLOITimeout;
- (id)_currentLocationAndNeedsUpdate_RequestPreciseLocation:(BOOL)a3;
- (id)_updateLocationsOfInterestWithCurrentLocation:(id)a3;
- (id)cachedLocationOfInterestAtCurrentLocation;
- (id)getCurrentLocation;
- (id)getCurrentLocation_RequestPreciseLocation:(BOOL)a3;
- (id)getCurrentPreciseLocation;
- (id)getPredictedExitTimesFromLOIName:(id)a3 startDate:(id)a4;
- (id)getPredictedLocationsOfInterestFromLOIName:(id)a3 startDate:(id)a4;
- (id)locationOfInterestAtCurrentLocation;
- (id)predictedExitTimes;
- (id)predictedLocationsOfInterest;
- (id)previousLOIAndCurrentLOI;
- (int64_t)stateForRegion:(id)a3 withTimeout:(double)a4;
- (unint64_t)getCurrentRoutineModeWithCurrentDate:(id)a3;
- (void)_fetchLocationOfInterest:(int64_t)a3 inGroup:(id)a4;
- (void)_gotLocation:(id)a3 forLocationOfInterest:(int64_t)a4;
- (void)_handleRoutineError:(id)a3 forThing:(id)a4;
- (void)_updateCurrentLocationOfInterestIfTimeElapsedWithCompletionHandler:(id)a3;
- (void)_updatePredictedExitTimesIfTimeElapsed;
- (void)_updatePredictedLocationsOfInterestIfTimeElapsed;
- (void)beginMonitoringRegion:(id)a3;
- (void)clearLocationOfInterest;
- (void)didChangeLocationEnabled:(BOOL)a3;
- (void)fetchAllLocationsOfInterest:(id)a3;
- (void)fetchLOILocationOfType:(int64_t)a3 reply:(id)a4;
- (void)fetchLocationsOfInterestVisitedDuring:(id)a3 handler:(id)a4;
- (void)getCurrentLocationWithCompletionHandler:(id)a3;
- (void)gotState:(id)a3;
- (void)invalidateLocationOfInterestCache;
- (void)locationManagerGPS:(id)a3 didEnterRegionWithIdentifier:(id)a4;
- (void)locationManagerGPS:(id)a3 didExitRegionWithIdentifier:(id)a4;
- (void)locationOfInterestAtCurrentLocationWithCompletionHandler:(id)a3;
- (void)setNow:(id)a3;
- (void)setPredictedExitDateTimeout:(double)a3;
- (void)setPredictedNextLOITimeout:(double)a3;
- (void)stopMonitoringRegionWithIdentifier:(id)a3;
- (void)updateCurrentLocationOfInterest;
- (void)updateCurrentLocationOfInterestIfTimeElapsed;
- (void)updateCurrentLocationOfInterestWithCompletionHandler:(id)a3;
- (void)updatePredictedExitTimes;
- (void)updatePredictedLocationsOfInterest;
@end

@implementation ATXLocationManager

- (ATXLocationManager)initWithStateStore:(id)a3 modeGlobals:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[ATXLocationManagerGPSCoreLocation sharedInstance];
  v9 = objc_opt_new();
  v10 = [(ATXLocationManager *)self initWithGPS:v8 routine:v9 stateStore:v7 now:0 modeGlobals:v6];

  return v10;
}

- (ATXLocationManager)initWithGPS:(id)a3 routine:(id)a4 stateStore:(id)a5 now:(id)a6 modeGlobals:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v37 = a6;
  id v36 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
LABEL_8:
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"ATXLocationManager.m", 121, @"Invalid parameter not satisfying: %@", @"routine" object file lineNumber description];

    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"ATXLocationManager.m", 120, @"Invalid parameter not satisfying: %@", @"gps" object file lineNumber description];

  if (!v15) {
    goto LABEL_8;
  }
LABEL_3:
  if (v16) {
    goto LABEL_4;
  }
LABEL_9:
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"ATXLocationManager.m", 122, @"Invalid parameter not satisfying: %@", @"stateStore" object file lineNumber description];

LABEL_4:
  v42.receiver = self;
  v42.super_class = (Class)ATXLocationManager;
  v17 = [(ATXLocationManager *)&v42 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_modeGlobals, a7);
    __asm { FMOV            V0.2D, #3.0 }
    *(_OWORD *)&v18->_predictedNextLOITimeout = _Q0;
    objc_storeStrong((id *)&v18->_gps, a3);
    objc_storeStrong((id *)&v18->_routine, a4);
    objc_storeStrong((id *)&v18->_stateStore, a5);
    objc_storeStrong((id *)&v18->_now, a6);
    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create("ATXLocationManager_LOIUpdateQueue", v24);
    loiUpdateQueue = v18->_loiUpdateQueue;
    v18->_loiUpdateQueue = (OS_dispatch_queue *)v25;

    id v27 = objc_alloc(MEMORY[0x1E4F93B70]);
    v28 = objc_opt_new();
    uint64_t v29 = [v27 initWithGuardedData:v28];
    lock = v18->_lock;
    v18->_lock = (_PASLock *)v29;

    [v14 setDelegate:v18];
    objc_initWeak(&location, v18);
    v31 = v18->_lock;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __69__ATXLocationManager_initWithGPS_routine_stateStore_now_modeGlobals___block_invoke;
    v38[3] = &unk_1E6BE72E8;
    v39 = v18;
    objc_copyWeak(&v40, &location);
    [(_PASLock *)v31 runWithLockAcquired:v38];
    objc_destroyWeak(&v40);

    objc_destroyWeak(&location);
  }

  return v18;
}

void __69__ATXLocationManager_initWithGPS_routine_stateStore_now_modeGlobals___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = *(void **)(*(void *)(a1 + 32) + 24);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__ATXLocationManager_initWithGPS_routine_stateStore_now_modeGlobals___block_invoke_2;
  v28[3] = &unk_1E6BE72C0;
  objc_copyWeak(&v29, (id *)(a1 + 40));
  v5 = [v4 loadNowOrCallLater:v28];
  if (v5)
  {
    objc_storeStrong(v3 + 4, v5);
    id v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [v5 workLOI];
      [v27 coordinate];
      uint64_t v8 = v7;
      v26 = [v5 workLOI];
      [v26 coordinate];
      uint64_t v10 = v9;
      dispatch_queue_t v25 = [v5 workLOI];
      v11 = [v25 timestamp];
      [v11 timeIntervalSince1970];
      uint64_t v13 = v12;
      id v14 = [v5 homeLOI];
      [v14 coordinate];
      uint64_t v16 = v15;
      v17 = [v5 homeLOI];
      [v17 coordinate];
      uint64_t v19 = v18;
      v20 = [v5 homeLOI];
      v21 = [v20 timestamp];
      [v21 timeIntervalSince1970];
      *(_DWORD *)buf = 134546945;
      uint64_t v31 = v8;
      __int16 v32 = 2053;
      uint64_t v33 = v10;
      __int16 v34 = 2053;
      uint64_t v35 = v13;
      __int16 v36 = 2053;
      uint64_t v37 = v16;
      __int16 v38 = 2053;
      uint64_t v39 = v19;
      __int16 v40 = 2053;
      uint64_t v41 = v22;
      _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "loaded cache, cached work LOI: %{sensitive}f, %{sensitive}f, %{sensitive}f, cached home LOI: %{sensitive}f, %{sensitive}f, %{sensitive}f", buf, 0x3Eu);
    }
  }
  uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 8) location];
  id v24 = v3[1];
  v3[1] = (id)v23;

  objc_destroyWeak(&v29);
}

void __69__ATXLocationManager_initWithGPS_routine_stateStore_now_modeGlobals___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 4);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__ATXLocationManager_initWithGPS_routine_stateStore_now_modeGlobals___block_invoke_3;
    v7[3] = &unk_1E6BE7298;
    id v8 = v3;
    [v6 runWithLockAcquired:v7];
  }
}

void __69__ATXLocationManager_initWithGPS_routine_stateStore_now_modeGlobals___block_invoke_3(uint64_t a1, uint64_t a2)
{
}

- (NSDate)now
{
  now = self->_now;
  if (now) {
    id v3 = now;
  }
  else {
    id v3 = (NSDate *)objc_opt_new();
  }

  return v3;
}

- (void)setNow:(id)a3
{
}

- (BOOL)locationEnabled
{
  return [(ATXLocationManagerGPS *)self->_gps locationEnabled];
}

- (BOOL)preciseLocationEnabled
{
  return [(ATXLocationManagerGPS *)self->_gps preciseLocationEnabled];
}

- (id)_currentLocationAndNeedsUpdate_RequestPreciseLocation:(BOOL)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  __int16 v32 = __Block_byref_object_copy__12;
  uint64_t v33 = __Block_byref_object_dispose__12;
  id v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__12;
  uint64_t v23 = __Block_byref_object_dispose__12;
  id v24 = 0;
  lock = self->_lock;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__ATXLocationManager__currentLocationAndNeedsUpdate_RequestPreciseLocation___block_invoke;
  v17[3] = &unk_1E6BE7310;
  BOOL v18 = a3;
  v17[4] = self;
  v17[5] = &v29;
  v17[6] = &v25;
  v17[7] = &v19;
  [(_PASLock *)lock runWithLockAcquired:v17];
  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    int v8 = *((unsigned __int8 *)v26 + 24);
    uint64_t v9 = [(id)objc_opt_class() debugDescriptionForCLLocation:v30[5]];
    int v10 = *((unsigned __int8 *)v26 + 24);
    uint64_t v11 = v20[5];
    *(_DWORD *)buf = 138413315;
    id v36 = v7;
    __int16 v37 = 1024;
    int v38 = v8;
    __int16 v39 = 2117;
    __int16 v40 = v9;
    __int16 v41 = 1024;
    int v42 = v10;
    __int16 v43 = 2117;
    uint64_t v44 = v11;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "%@ - currentLocationAndNeedsUpdate:%u returning result: %{sensitive}@ and needsLocationUpdate: %u for reason: %{sensitive}@", buf, 0x2Cu);
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F93BB8];
  uint64_t v13 = v30[5];
  id v14 = [NSNumber numberWithBool:*((unsigned __int8 *)v26 + 24)];
  uint64_t v15 = [v12 tupleWithFirst:v13 second:v14];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

void __76__ATXLocationManager__currentLocationAndNeedsUpdate_RequestPreciseLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(*(void *)(a1 + 32) + 8) location];
  if (*(unsigned char *)(a1 + 64)
    || ([*(id *)(a1 + 32) now],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 timeIntervalSinceDate:v3[2]],
        double v7 = v6,
        double v8 = (double)(int)[*(id *)(*(void *)(a1 + 32) + 48) currentLocationUpdateInterval],
        v5,
        v7 >= v8))
  {
    if (!v4) {
      goto LABEL_12;
    }
    [v4 horizontalAccuracy];
    if (v15 <= 0.0) {
      goto LABEL_12;
    }
    uint64_t v16 = [v4 timestamp];
    v17 = [*(id *)(a1 + 32) now];
    [v16 timeIntervalSinceDate:v17];
    double v19 = -v18;
    double v20 = (double)(int)[*(id *)(*(void *)(a1 + 32) + 48) currentLocationUpdateInterval];

    if (v19 >= v20)
    {
LABEL_12:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      char v28 = @"location nil or horizontalAccuracy too large or timestamp too old";
      goto LABEL_13;
    }
    int v21 = *(unsigned __int8 *)(a1 + 64);
    [v4 horizontalAccuracy];
    if (v21)
    {
      if (v22 > 20.0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
        id v24 = *(void **)(v23 + 40);
        uint64_t v25 = @"horizontalAccuracy > kPreciseHorizontalAccuracyThreshold";
LABEL_18:
        *(void *)(v23 + 40) = v25;
      }
    }
    else if (v22 > 200.0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
      id v24 = *(void **)(v23 + 40);
      uint64_t v25 = @"horizontalAccuracy > kHorizontalAccuracyThreshold";
      goto LABEL_18;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      goto LABEL_14;
    }
    objc_storeStrong(v3 + 1, v4);
    uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v27 = *(void **)(v26 + 40);
    char v28 = @"location is valid, horizontal accuracy is valid, and last update was recent";
LABEL_13:
    *(void *)(v26 + 40) = v28;

LABEL_14:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3[1]);
    goto LABEL_15;
  }
  objc_storeStrong(v3 + 1, v4);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3[1]);
  uint64_t v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v13 = v3[2];
    id v14 = [(id)objc_opt_class() debugDescriptionForCLLocation:v3[1]];
    int v29 = 138413059;
    v30 = v11;
    __int16 v31 = 1024;
    int v32 = v12;
    __int16 v33 = 2112;
    id v34 = v13;
    __int16 v35 = 2117;
    id v36 = v14;
    _os_log_impl(&dword_1DAFF9000, v9, OS_LOG_TYPE_DEFAULT, "%@ - currentLocationAndNeedsUpdate:%u lastRequestLocationDate %@ was too recent, using cached location: %{sensitive}@", (uint8_t *)&v29, 0x26u);
  }
LABEL_15:
}

- (id)getCurrentLocation
{
  return [(ATXLocationManager *)self getCurrentLocation_RequestPreciseLocation:0];
}

- (id)getCurrentPreciseLocation
{
  return [(ATXLocationManager *)self getCurrentLocation_RequestPreciseLocation:1];
}

- (id)getCurrentLocation_RequestPreciseLocation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(ATXLocationManagerGPS *)self->_gps locationEnabled])
  {
    v5 = [(ATXLocationManager *)self _currentLocationAndNeedsUpdate_RequestPreciseLocation:v3];
    id v6 = [v5 first];
    double v7 = [v5 second];
    if ([v7 BOOLValue])
    {
      double v8 = __atxlog_handle_default();
      uint64_t v9 = @"NO";
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        int v12 = (void *)v11;
        if (v3) {
          id v13 = @"YES";
        }
        else {
          id v13 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v26 = v11;
        __int16 v27 = 2112;
        char v28 = v13;
        _os_log_impl(&dword_1DAFF9000, v8, OS_LOG_TYPE_DEFAULT, "%@ getCurrentLocation_RequestPreciseLocation:%@ Updating location", buf, 0x16u);
      }
      double v14 = 5.0;
      if (v3) {
        double v14 = 30.0;
      }
      double v15 = [(ATXLocationManagerGPS *)self->_gps updateLocationWithTimeout:v3 requestPreciseLocation:v14];

      uint64_t v16 = __atxlog_handle_default();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        double v18 = NSStringFromClass(v17);
        if (v3) {
          uint64_t v9 = @"YES";
        }
        double v19 = [(id)objc_opt_class() debugDescriptionForCLLocation:v15];
        *(_DWORD *)buf = 138412803;
        uint64_t v26 = (uint64_t)v18;
        __int16 v27 = 2112;
        char v28 = v9;
        __int16 v29 = 2117;
        v30 = v19;
        _os_log_impl(&dword_1DAFF9000, v16, OS_LOG_TYPE_DEFAULT, "%@ getCurrentLocation_RequestPreciseLocation:%@ Updated location: %{sensitive}@", buf, 0x20u);
      }
      lock = self->_lock;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __64__ATXLocationManager_getCurrentLocation_RequestPreciseLocation___block_invoke;
      v22[3] = &unk_1E6BE7338;
      id v6 = v15;
      id v23 = v6;
      id v24 = self;
      [(_PASLock *)lock runWithLockAcquired:v22];
    }
  }
  else
  {
    [(ATXLocationManager *)self clearLocationOfInterest];
    id v6 = 0;
  }

  return v6;
}

void __64__ATXLocationManager_getCurrentLocation_RequestPreciseLocation___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = *(void **)(a1 + 32);
  if (v3) {
    objc_storeStrong(v6 + 1, v3);
  }
  uint64_t v4 = [*(id *)(a1 + 40) now];
  id v5 = v6[2];
  v6[2] = (id)v4;
}

- (void)getCurrentLocationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(ATXLocationManagerGPS *)self->_gps locationEnabled])
  {
    id v5 = [(ATXLocationManager *)self _currentLocationAndNeedsUpdate_RequestPreciseLocation:0];
    id v6 = [v5 first];
    double v7 = [v5 second];
    if ([v7 BOOLValue])
    {
      double v8 = __atxlog_handle_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[ATXLocationManager getCurrentLocationWithCompletionHandler:]();
      }

      gps = self->_gps;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __62__ATXLocationManager_getCurrentLocationWithCompletionHandler___block_invoke;
      v10[3] = &unk_1E6BE7360;
      v10[4] = self;
      id v11 = v4;
      [(ATXLocationManagerGPS *)gps updateLocationWithCompletionHandler:v10];
    }
    else
    {
      (*((void (**)(id, void *, void))v4 + 2))(v4, v6, 0);
    }
  }
  else
  {
    [(ATXLocationManager *)self clearLocationOfInterest];
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:13 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v5);
  }
}

void __62__ATXLocationManager_getCurrentLocationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __62__ATXLocationManager_getCurrentLocationWithCompletionHandler___block_invoke_cold_1(a1, (uint64_t)v5, v7);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__ATXLocationManager_getCurrentLocationWithCompletionHandler___block_invoke_57;
  v12[3] = &unk_1E6BE7338;
  id v13 = v5;
  uint64_t v14 = v8;
  id v10 = v5;
  [v9 runWithLockAcquired:v12];
  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10, v6, v11);
}

void __62__ATXLocationManager_getCurrentLocationWithCompletionHandler___block_invoke_57(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = *(void **)(a1 + 32);
  if (v3) {
    objc_storeStrong(v6 + 1, v3);
  }
  uint64_t v4 = [*(id *)(a1 + 40) now];
  id v5 = v6[2];
  v6[2] = (id)v4;
}

- (id)_updateLocationsOfInterestWithCurrentLocation:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  [v4 horizontalAccuracy];
  if (v6 <= 200.0)
  {
    dispatch_group_enter(v5);
    routine = self->_routine;
    double v9 = (double)(int)[(ATXLocationParameters *)self->_modeGlobals locationOfInterestSearchRadius];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    double v15 = __68__ATXLocationManager__updateLocationsOfInterestWithCurrentLocation___block_invoke;
    uint64_t v16 = &unk_1E6BE7388;
    v17 = self;
    id v10 = v5;
    double v18 = v10;
    [(ATXLocationManagerRoutine *)routine fetchClosestLOIWithinDistance:v4 ofLocation:&v13 reply:v9];
    -[ATXLocationManager _fetchLocationOfInterest:inGroup:](self, "_fetchLocationOfInterest:inGroup:", 0, v10, v13, v14, v15, v16, v17);
    [(ATXLocationManager *)self _fetchLocationOfInterest:1 inGroup:v10];
    [(ATXLocationManager *)self _fetchLocationOfInterest:2 inGroup:v10];
    [(ATXLocationManager *)self _fetchLocationOfInterest:3 inGroup:v10];
    uint64_t v11 = v18;
    double v7 = v10;
  }
  else
  {
    double v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DAFF9000, v7, OS_LOG_TYPE_DEFAULT, "_updateLocationsOfInterestWithCurrentLocation: Horizontal accuracy for current location is greater than the threshold so won't fetch closest LOI", buf, 2u);
    }
  }

  return v5;
}

void __68__ATXLocationManager__updateLocationsOfInterestWithCurrentLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) _handleRoutineError:a3 forThing:@"current"];
  }
  else
  {
    double v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __68__ATXLocationManager__updateLocationsOfInterestWithCurrentLocation___block_invoke_cold_1((uint64_t)v5, v6);
    }

    double v7 = objc_opt_new();
    [v7 setCurrentLOI:v5];
    uint64_t v8 = [*(id *)(a1 + 32) now];
    [v7 setLastUpdateDate:v8];

    [*(id *)(a1 + 32) gotState:v7];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)updateCurrentLocationOfInterest
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1DAFF9000, v0, v1, "LOI fetch timed out", v2, v3, v4, v5, v6);
}

- (void)updateCurrentLocationOfInterestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E6BE7360;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ATXLocationManager *)self getCurrentLocationWithCompletionHandler:v6];
}

void __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint8_t v6 = *(void **)(a1 + 32);
  if (a2 && !v5)
  {
    id v7 = [v6 _updateLocationsOfInterestWithCurrentLocation:a2];
    uint64_t v8 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E6BE73B0;
    double v9 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v13 = v9;
    dispatch_group_notify(v7, v8, block);

LABEL_7:
    goto LABEL_8;
  }
  id v10 = (void *)v6[4];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E6BE7298;
  v14[4] = v6;
  [v10 runWithLockAcquired:v14];
  uint64_t v11 = *(void *)(a1 + 40);
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:5 userInfo:0];
    (*(void (**)(uint64_t, NSObject *))(v11 + 16))(v11, v7);
    goto LABEL_7;
  }
  (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
LABEL_8:
}

void __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = a2;
  id v6 = [v2 now];
  uint64_t v4 = [v6 laterDate:v3[5]];
  id v5 = (void *)v3[5];
  v3[5] = v4;
}

uint64_t __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E6BE7298;
  v5[4] = v2;
  [v3 runWithLockAcquired:v5];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75__ATXLocationManager_updateCurrentLocationOfInterestWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = a2;
  id v6 = [v2 now];
  uint64_t v4 = [v6 laterDate:v3[5]];
  id v5 = (void *)v3[5];
  v3[5] = v4;
}

- (void)invalidateLocationOfInterestCache
{
}

void __55__ATXLocationManager_invalidateLocationOfInterestCache__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v3 = a2;
  uint64_t v4 = [v2 distantPast];
  id v5 = (id)v3[5];
  v3[5] = v4;
}

- (void)fetchLOILocationOfType:(int64_t)a3 reply:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = +[ATXLocationManager stringForLOIType:a3];
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x3032000000;
  double v22 = __Block_byref_object_copy__12;
  id v23 = __Block_byref_object_dispose__12;
  id v24 = 0;
  if ([v7 length])
  {
    lock = self->_lock;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__ATXLocationManager_fetchLOILocationOfType_reply___block_invoke;
    v16[3] = &unk_1E6BE73F8;
    v16[4] = self;
    double v18 = &v19;
    id v17 = v7;
    [(_PASLock *)lock runWithLockAcquired:v16];
  }
  if (v20[5])
  {
    double v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v7;
      _os_log_impl(&dword_1DAFF9000, v9, OS_LOG_TYPE_DEFAULT, "Using cached %@ LOI", buf, 0xCu);
    }

    v6[2](v6, v20[5], 0);
  }
  else
  {
    id v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v7;
      _os_log_impl(&dword_1DAFF9000, v10, OS_LOG_TYPE_DEFAULT, "Fetching %@ LOI", buf, 0xCu);
    }

    routine = self->_routine;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__ATXLocationManager_fetchLOILocationOfType_reply___block_invoke_67;
    v12[3] = &unk_1E6BE7448;
    void v12[4] = self;
    id v13 = v7;
    uint64_t v14 = v6;
    int64_t v15 = a3;
    [(ATXLocationManagerRoutine *)routine fetchLOILocationOfType:a3 reply:v12];
  }
  _Block_object_dispose(&v19, 8);
}

void __51__ATXLocationManager_fetchLOILocationOfType_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)*((void *)v3 + 5);
  id v5 = [*(id *)(a1 + 32) now];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  uint64_t v8 = __atxlog_handle_default();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    double v14 = -v7;
    _os_log_impl(&dword_1DAFF9000, v8, OS_LOG_TYPE_DEFAULT, "Checking cache with age: %f", (uint8_t *)&v13, 0xCu);
  }

  if (v7 > -900.0)
  {
    double v9 = [*((id *)v3 + 4) locationsOfInterest];
    uint64_t v10 = [v9 valueForKey:*(void *)(a1 + 40)];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

void __51__ATXLocationManager_fetchLOILocationOfType_reply___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 _handleRoutineError:v6 forThing:*(void *)(a1 + 40)];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    double v18 = __Block_byref_object_copy__12;
    uint64_t v19 = __Block_byref_object_dispose__12;
    id v20 = 0;
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__ATXLocationManager_fetchLOILocationOfType_reply___block_invoke_2;
    v14[3] = &unk_1E6BE7420;
    uint64_t v16 = buf;
    id v15 = *(id *)(a1 + 40);
    [v8 runWithLockAcquired:v14];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      double v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v13 = 0;
        _os_log_impl(&dword_1DAFF9000, v9, OS_LOG_TYPE_DEFAULT, "Falling back to cache because Core Routine failed", v13, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      _Block_object_dispose(buf, 8);

      goto LABEL_11;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    [v7 _gotLocation:v5 forLocationOfInterest:*(void *)(a1 + 56)];
  }
  uint64_t v10 = __atxlog_handle_default();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = [(id)objc_opt_class() debugDescriptionForCLLocation:v5];
    *(_DWORD *)buf = 138412547;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2117;
    *(void *)&buf[14] = v12;
    _os_log_impl(&dword_1DAFF9000, v10, OS_LOG_TYPE_INFO, "%@ LOI: %{sensitive}@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_11:
}

void __51__ATXLocationManager_fetchLOILocationOfType_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a2 + 32) locationsOfInterest];
  uint64_t v3 = [v6 valueForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_fetchLocationOfInterest:(int64_t)a3 inGroup:(id)a4
{
  id v6 = a4;
  dispatch_group_enter(v6);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ATXLocationManager__fetchLocationOfInterest_inGroup___block_invoke;
  v8[3] = &unk_1E6BE7470;
  double v9 = v6;
  double v7 = v6;
  [(ATXLocationManager *)self fetchLOILocationOfType:a3 reply:v8];
}

void __55__ATXLocationManager__fetchLocationOfInterest_inGroup___block_invoke(uint64_t a1)
{
}

- (void)_gotLocation:(id)a3 forLocationOfInterest:(int64_t)a4
{
  id v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ATXLocationManager__gotLocation_forLocationOfInterest___block_invoke;
  v9[3] = &unk_1E6BE7498;
  uint64_t v11 = self;
  int64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
}

uint64_t __57__ATXLocationManager__gotLocation_forLocationOfInterest___block_invoke(void *a1, void *a2)
{
  uint64_t v4 = (void *)a2[4];
  id v5 = a2;
  id v6 = [v4 locationsOfInterest];
  uint64_t v7 = a1[4];
  id v8 = +[ATXLocationManager stringForLOIType:a1[6]];
  [v6 setValue:v7 forKey:v8];

  double v9 = *(void **)(a1[5] + 24);
  uint64_t v10 = a2[4];

  return [v9 write:v10];
}

- (void)gotState:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__ATXLocationManager_gotState___block_invoke;
  v7[3] = &unk_1E6BE7338;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __31__ATXLocationManager_gotState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = a2;
  id v3 = v10[4];
  if (v3)
  {
    id v4 = +[ATXLocationManagerState merge:v3 with:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = *(id *)(a1 + 32);
  }
  id v5 = v10[4];
  v10[4] = v4;

  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  double v7 = (double)-(int)[*(id *)(*(void *)(a1 + 40) + 48) previousLOIExpirationTime];
  id v8 = [*(id *)(a1 + 40) now];
  double v9 = [v6 dateWithTimeInterval:v8 sinceDate:v7];

  [v10[4] expirePreviousLOIBefore:v9];
  [*(id *)(*(void *)(a1 + 40) + 24) write:v10[4]];
}

- (void)_handleRoutineError:(id)a3 forThing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 domain];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F5CFE8]];

  if (v9)
  {
    lock = self->_lock;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__ATXLocationManager__handleRoutineError_forThing___block_invoke;
    v12[3] = &unk_1E6BE74C0;
    int v13 = v6;
    id v14 = v7;
    id v15 = self;
    [(_PASLock *)lock runWithLockAcquired:v12];

    uint64_t v11 = v13;
  }
  else
  {
    uint64_t v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXLocationManager _handleRoutineError:forThing:]((uint64_t)v7, (uint64_t)v6, v11);
    }
  }
}

void __51__ATXLocationManager__handleRoutineError_forThing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) code];
  if (v4 > 7) {
    goto LABEL_10;
  }
  if (((1 << v4) & 0x98) != 0)
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __51__ATXLocationManager__handleRoutineError_forThing___block_invoke_cold_3();
    }

    id v6 = (void *)MEMORY[0x1E4F1C9C8];
    id v7 = [*(id *)(a1 + 48) now];
    double v8 = 10.0;
LABEL_13:
    uint64_t v12 = [v6 dateWithTimeInterval:v7 sinceDate:v8];
    int v13 = (void *)v3[5];
    v3[5] = v12;

    goto LABEL_14;
  }
  if (((1 << v4) & 6) == 0)
  {
LABEL_10:
    uint64_t v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __51__ATXLocationManager__handleRoutineError_forThing___block_invoke_cold_1();
    }

    id v6 = (void *)MEMORY[0x1E4F1C9C8];
    id v7 = [*(id *)(a1 + 48) now];
    double v8 = 60.0;
    goto LABEL_13;
  }
  int v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __51__ATXLocationManager__handleRoutineError_forThing___block_invoke_cold_2();
  }

  uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v7 = (void *)v3[5];
  v3[5] = v10;
LABEL_14:
}

- (void)updateCurrentLocationOfInterestIfTimeElapsed
{
  loiUpdateQueue = self->_loiUpdateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ATXLocationManager_updateCurrentLocationOfInterestIfTimeElapsed__block_invoke;
  block[3] = &unk_1E6BE74E8;
  block[4] = self;
  dispatch_sync(loiUpdateQueue, block);
}

void __66__ATXLocationManager_updateCurrentLocationOfInterestIfTimeElapsed__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__ATXLocationManager_updateCurrentLocationOfInterestIfTimeElapsed__block_invoke_2;
  v10[3] = &unk_1E6BE7420;
  v10[4] = v2;
  void v10[5] = &v11;
  [v3 runWithLockAcquired:v10];
  double v4 = v12[3];
  if (v4 > (double)(int)[*(id *)(*(void *)(a1 + 32) + 48) locationOfInterestUpdateInterval])
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *((void *)v12 + 3);
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to update location of interest since update age is %lf", buf, 0xCu);
    }

    [*(id *)(a1 + 32) updateCurrentLocationOfInterest];
    uint64_t v7 = *(void *)(a1 + 32);
    double v8 = *(void **)(v7 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__ATXLocationManager_updateCurrentLocationOfInterestIfTimeElapsed__block_invoke_68;
    v9[3] = &unk_1E6BE7298;
    void v9[4] = v7;
    [v8 runWithLockAcquired:v9];
  }
  _Block_object_dispose(&v11, 8);
}

void __66__ATXLocationManager_updateCurrentLocationOfInterestIfTimeElapsed__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a2 + 40);
  id v5 = [*(id *)(a1 + 32) now];
  [v3 timeIntervalSinceDate:v5];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -v4;
}

void __66__ATXLocationManager_updateCurrentLocationOfInterestIfTimeElapsed__block_invoke_68(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 now];
  uint64_t v4 = [v6 laterDate:v3[5]];
  id v5 = (void *)v3[5];
  v3[5] = v4;
}

- (void)_updateCurrentLocationOfInterestIfTimeElapsedWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  uint64_t v10 = 0;
  uint64_t v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__ATXLocationManager__updateCurrentLocationOfInterestIfTimeElapsedWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E6BE7420;
  void v9[4] = self;
  void v9[5] = &v10;
  [(_PASLock *)lock runWithLockAcquired:v9];
  double v6 = v11[3];
  if (v6 <= (double)(int)[(ATXLocationParameters *)self->_modeGlobals locationOfInterestUpdateInterval])
  {
    v4[2](v4, 0);
  }
  else
  {
    uint64_t v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *((void *)v11 + 3);
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1DAFF9000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to update location of interest since update age is %lf", buf, 0xCu);
    }

    [(ATXLocationManager *)self updateCurrentLocationOfInterestWithCompletionHandler:v4];
  }
  _Block_object_dispose(&v10, 8);
}

void __89__ATXLocationManager__updateCurrentLocationOfInterestIfTimeElapsedWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a2 + 40);
  id v5 = [*(id *)(a1 + 32) now];
  [v3 timeIntervalSinceDate:v5];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -v4;
}

- (id)cachedLocationOfInterestAtCurrentLocation
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__ATXLocationManager_cachedLocationOfInterestAtCurrentLocation__block_invoke;
  v5[3] = &unk_1E6BE7510;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __63__ATXLocationManager_cachedLocationOfInterestAtCurrentLocation__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 32) currentLOI];

  return MEMORY[0x1F41817F8]();
}

- (id)locationOfInterestAtCurrentLocation
{
  [(ATXLocationManager *)self updateCurrentLocationOfInterestIfTimeElapsed];

  return [(ATXLocationManager *)self cachedLocationOfInterestAtCurrentLocation];
}

- (void)locationOfInterestAtCurrentLocationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__ATXLocationManager_locationOfInterestAtCurrentLocationWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E6BE7538;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ATXLocationManager *)self _updateCurrentLocationOfInterestIfTimeElapsedWithCompletionHandler:v6];
}

void __79__ATXLocationManager_locationOfInterestAtCurrentLocationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3032000000;
    v6[3] = __Block_byref_object_copy__12;
    v6[4] = __Block_byref_object_dispose__12;
    id v7 = 0;
    id v4 = *(void **)(*(void *)(a1 + 32) + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __79__ATXLocationManager_locationOfInterestAtCurrentLocationWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_1E6BE7510;
    v5[4] = v6;
    [v4 runWithLockAcquired:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    _Block_object_dispose(v6, 8);
  }
}

uint64_t __79__ATXLocationManager_locationOfInterestAtCurrentLocationWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 32) currentLOI];

  return MEMORY[0x1F41817F8]();
}

- (id)previousLOIAndCurrentLOI
{
  [(ATXLocationManager *)self updateCurrentLocationOfInterestIfTimeElapsed];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__12;
  id v11 = __Block_byref_object_dispose__12;
  id v12 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__ATXLocationManager_previousLOIAndCurrentLOI__block_invoke;
  v6[3] = &unk_1E6BE7560;
  v6[4] = self;
  void v6[5] = &v7;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__ATXLocationManager_previousLOIAndCurrentLOI__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  id v5 = a2;
  double v6 = (double)-(int)[v4 previousLOIExpirationTime];
  uint64_t v7 = [*(id *)(a1 + 32) now];
  id v15 = [v3 dateWithTimeInterval:v7 sinceDate:v6];

  [v5[4] expirePreviousLOIBefore:v15];
  uint64_t v8 = (void *)MEMORY[0x1E4F93BB8];
  uint64_t v9 = [v5[4] previousLOI];
  id v10 = v5[4];

  id v11 = [v10 currentLOI];
  uint64_t v12 = [v8 tupleWithFirst:v9 second:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (id)getPredictedLocationsOfInterestFromLOIName:(id)a3 startDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ATXLocationManager *)self updateCurrentLocationOfInterestIfTimeElapsed];
  uint64_t v37 = 0;
  int v38 = &v37;
  uint64_t v39 = 0x3032000000;
  __int16 v40 = __Block_byref_object_copy__12;
  __int16 v41 = __Block_byref_object_dispose__12;
  id v42 = 0;
  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__12;
  __int16 v35 = __Block_byref_object_dispose__12;
  id v36 = 0;
  lock = self->_lock;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __75__ATXLocationManager_getPredictedLocationsOfInterestFromLOIName_startDate___block_invoke;
  v28[3] = &unk_1E6BE7420;
  v30 = &v37;
  id v9 = v6;
  id v29 = v9;
  [(_PASLock *)lock runWithLockAcquired:v28];
  id v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  id v11 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [(id)v38[5] coordinate];
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v17 = objc_msgSend(v11, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v16, v13, v15, 0.0, 5.0, 0.0);
  double v18 = (void *)v38[5];
  v38[5] = v17;

  routine = self->_routine;
  uint64_t v20 = v38[5];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__ATXLocationManager_getPredictedLocationsOfInterestFromLOIName_startDate___block_invoke_2;
  v25[3] = &unk_1E6BE7588;
  v25[4] = self;
  uint64_t v27 = &v31;
  uint64_t v21 = v10;
  uint64_t v26 = v21;
  [(ATXLocationManagerRoutine *)routine fetchNextPredictedLOIFromLocation:v20 startDate:v7 timeInterval:1 requireHighConfidence:v25 reply:7200.0];
  if ([MEMORY[0x1E4F93B18] waitForGroup:v21 timeoutSeconds:self->_predictedNextLOITimeout] == 1)
  {
    double v22 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ATXLocationManager getPredictedLocationsOfInterestFromLOIName:startDate:]();
    }

    id v23 = 0;
  }
  else
  {
    id v23 = (id)v32[5];
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

void __75__ATXLocationManager_getPredictedLocationsOfInterestFromLOIName_startDate___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a2 + 32) locationsOfInterest];
  uint64_t v3 = [v6 valueForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __75__ATXLocationManager_getPredictedLocationsOfInterestFromLOIName_startDate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) _handleRoutineError:a3 forThing:@"predictedLOIs"];
  }
  else
  {
    id v7 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1DAFF9000, v7, OS_LOG_TYPE_INFO, "Next Predicted LOIs: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)getPredictedExitTimesFromLOIName:(id)a3 startDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ATXLocationManager *)self updateCurrentLocationOfInterestIfTimeElapsed];
  uint64_t v37 = 0;
  int v38 = &v37;
  uint64_t v39 = 0x3032000000;
  __int16 v40 = __Block_byref_object_copy__12;
  __int16 v41 = __Block_byref_object_dispose__12;
  id v42 = 0;
  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__12;
  __int16 v35 = __Block_byref_object_dispose__12;
  id v36 = 0;
  lock = self->_lock;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __65__ATXLocationManager_getPredictedExitTimesFromLOIName_startDate___block_invoke;
  v28[3] = &unk_1E6BE7420;
  v30 = &v37;
  id v9 = v6;
  id v29 = v9;
  [(_PASLock *)lock runWithLockAcquired:v28];
  uint64_t v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  id v11 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [(id)v38[5] coordinate];
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v17 = objc_msgSend(v11, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v16, v13, v15, 0.0, 5.0, 0.0);
  double v18 = (void *)v38[5];
  v38[5] = v17;

  routine = self->_routine;
  uint64_t v20 = v38[5];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__ATXLocationManager_getPredictedExitTimesFromLOIName_startDate___block_invoke_2;
  v25[3] = &unk_1E6BE7588;
  v25[4] = self;
  uint64_t v27 = &v31;
  uint64_t v21 = v10;
  uint64_t v26 = v21;
  [(ATXLocationManagerRoutine *)routine fetchPredictedExitDatesFromLocation:v20 onDate:v7 requireHighConfidence:0 reply:v25];
  if ([MEMORY[0x1E4F93B18] waitForGroup:v21 timeoutSeconds:self->_predictedExitDateTimeout] == 1)
  {
    double v22 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ATXLocationManager getPredictedExitTimesFromLOIName:startDate:]();
    }
  }
  id v23 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

void __65__ATXLocationManager_getPredictedExitTimesFromLOIName_startDate___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a2 + 32) locationsOfInterest];
  uint64_t v3 = [v6 valueForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __65__ATXLocationManager_getPredictedExitTimesFromLOIName_startDate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) _handleRoutineError:a3 forThing:@"predictedExitTimes"];
  }
  else
  {
    id v7 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1DAFF9000, v7, OS_LOG_TYPE_INFO, "Predicted Exit Times: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)predictedLocationsOfInterest
{
  [(ATXLocationManager *)self _updatePredictedLocationsOfInterestIfTimeElapsed];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  double v12 = __Block_byref_object_copy__12;
  double v13 = __Block_byref_object_dispose__12;
  id v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__ATXLocationManager_predictedLocationsOfInterest__block_invoke;
  v8[3] = &unk_1E6BE7510;
  void v8[4] = &v9;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v5;

  return v6;
}

uint64_t __50__ATXLocationManager_predictedLocationsOfInterest__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 32) predictedNextLOIs];

  return MEMORY[0x1F41817F8]();
}

- (id)predictedExitTimes
{
  [(ATXLocationManager *)self _updatePredictedExitTimesIfTimeElapsed];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  double v12 = __Block_byref_object_copy__12;
  double v13 = __Block_byref_object_dispose__12;
  id v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__ATXLocationManager_predictedExitTimes__block_invoke;
  v8[3] = &unk_1E6BE7510;
  void v8[4] = &v9;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v5;

  return v6;
}

uint64_t __40__ATXLocationManager_predictedExitTimes__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 32) predictedExitTimes];

  return MEMORY[0x1F41817F8]();
}

- (void)_updatePredictedLocationsOfInterestIfTimeElapsed
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__ATXLocationManager__updatePredictedLocationsOfInterestIfTimeElapsed__block_invoke;
  v7[3] = &unk_1E6BE7420;
  void v7[4] = self;
  v7[5] = &v8;
  [(_PASLock *)lock runWithLockAcquired:v7];
  double v4 = v9[3];
  if (v4 > (double)(int)[(ATXLocationParameters *)self->_modeGlobals predictedLocationsOfInterestUpdateInterval])
  {
    id v5 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_INFO, "Updating predicted next lois in ATXLocationManager", v6, 2u);
    }

    [(ATXLocationManager *)self updatePredictedLocationsOfInterest];
  }
  _Block_object_dispose(&v8, 8);
}

void __70__ATXLocationManager__updatePredictedLocationsOfInterestIfTimeElapsed__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 56);
  id v5 = [*(id *)(a1 + 32) now];
  [v3 timeIntervalSinceDate:v5];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -v4;
}

- (void)_updatePredictedExitTimesIfTimeElapsed
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__ATXLocationManager__updatePredictedExitTimesIfTimeElapsed__block_invoke;
  v7[3] = &unk_1E6BE7420;
  void v7[4] = self;
  v7[5] = &v8;
  [(_PASLock *)lock runWithLockAcquired:v7];
  double v4 = v9[3];
  if (v4 > (double)(int)[(ATXLocationParameters *)self->_modeGlobals predictedExitTimesUpdateInterval])
  {
    id v5 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_INFO, "Updating predicted exit times in ATXLocationManager", v6, 2u);
    }

    [(ATXLocationManager *)self updatePredictedExitTimes];
  }
  _Block_object_dispose(&v8, 8);
}

void __60__ATXLocationManager__updatePredictedExitTimesIfTimeElapsed__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 64);
  id v5 = [*(id *)(a1 + 32) now];
  [v3 timeIntervalSinceDate:v5];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -v4;
}

- (void)updatePredictedLocationsOfInterest
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1DAFF9000, v0, v1, "Next Predicted LOIs no current location", v2, v3, v4, v5, v6);
}

void __56__ATXLocationManager_updatePredictedLocationsOfInterest__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) _handleRoutineError:a3 forThing:@"predictedLOIs"];
  }
  else
  {
    uint8_t v6 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_INFO, "Next Predicted LOIs: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPredictedNextLOIs:v5];
    uint64_t v10 = [*(id *)(a1 + 32) now];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setLastUpdateDate:v10];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __56__ATXLocationManager_updatePredictedLocationsOfInterest__block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = a2;
  id v6 = [v2 now];
  uint64_t v4 = [v6 laterDate:v3[7]];
  id v5 = (void *)v3[7];
  v3[7] = v4;
}

- (void)updatePredictedExitTimes
{
  uint64_t v3 = [(ATXLocationManager *)self getCurrentLocation];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 horizontalAccuracy];
    if (v5 <= 200.0)
    {
      uint64_t v7 = dispatch_group_create();
      dispatch_group_enter(v7);
      *(void *)buf = 0;
      uint64_t v19 = buf;
      uint64_t v20 = 0x3032000000;
      uint64_t v21 = __Block_byref_object_copy__12;
      double v22 = __Block_byref_object_dispose__12;
      id v23 = 0;
      routine = self->_routine;
      uint64_t v9 = [(ATXLocationManager *)self now];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __46__ATXLocationManager_updatePredictedExitTimes__block_invoke;
      v15[3] = &unk_1E6BE7588;
      v15[4] = self;
      uint64_t v17 = buf;
      id v6 = v7;
      uint64_t v16 = v6;
      [(ATXLocationManagerRoutine *)routine fetchPredictedExitDatesFromLocation:v4 onDate:v9 requireHighConfidence:0 reply:v15];

      if ([MEMORY[0x1E4F93B18] waitForGroup:v6 timeoutSeconds:self->_predictedExitDateTimeout] == 1)
      {
        uint64_t v10 = __atxlog_handle_dailyroutines();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[ATXLocationManager getPredictedExitTimesFromLOIName:startDate:]();
        }

        int v11 = objc_opt_new();
        [v11 setPredictedExitTimes:MEMORY[0x1E4F1CBF0]];
        id v12 = [(ATXLocationManager *)self now];
        [v11 setLastUpdateDate:v12];

        [(ATXLocationManager *)self gotState:v11];
      }
      else if (*((void *)v19 + 5))
      {
        -[ATXLocationManager gotState:](self, "gotState:");
      }
      lock = self->_lock;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__ATXLocationManager_updatePredictedExitTimes__block_invoke_79;
      v14[3] = &unk_1E6BE7298;
      void v14[4] = self;
      [(_PASLock *)lock runWithLockAcquired:v14];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v6 = __atxlog_handle_dailyroutines();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "updatePredictedExitTimes: Returned because horizontal accuracy is greater than threshold", buf, 2u);
      }
    }
  }
}

void __46__ATXLocationManager_updatePredictedExitTimes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) _handleRoutineError:a3 forThing:@"predictedExitTimes"];
  }
  else
  {
    id v6 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_INFO, "Predicted Exit Times: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPredictedExitTimes:v5];
    uint64_t v10 = [*(id *)(a1 + 32) now];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setLastUpdateDate:v10];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __46__ATXLocationManager_updatePredictedExitTimes__block_invoke_79(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = a2;
  id v6 = [v2 now];
  uint64_t v4 = [v6 laterDate:v3[8]];
  id v5 = (void *)v3[8];
  v3[8] = v4;
}

- (double)_distanceOfCurrentLocationFrom:(id)a3
{
  id v4 = a3;
  [(ATXLocationManager *)self updateCurrentLocationOfInterestIfTimeElapsed];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__12;
  uint64_t v26 = __Block_byref_object_dispose__12;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__12;
  uint64_t v20 = __Block_byref_object_dispose__12;
  id v21 = 0;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__ATXLocationManager__distanceOfCurrentLocationFrom___block_invoke;
  v12[3] = &unk_1E6BE75B0;
  id v14 = &v22;
  double v15 = &v16;
  id v6 = v4;
  id v13 = v6;
  [(_PASLock *)lock runWithLockAcquired:v12];
  uint64_t v7 = (void *)v23[5];
  double v8 = -1.0;
  if (v7 && v17[5])
  {
    objc_msgSend(v7, "distanceFromLocation:");
    double v8 = v9;
    uint64_t v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(ATXLocationManager *)(uint64_t)v6 _distanceOfCurrentLocationFrom:v8];
    }
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v8;
}

void __53__ATXLocationManager__distanceOfCurrentLocationFrom___block_invoke(void *a1, id *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2[1]);
  id v4 = a2;
  id v8 = [v4[4] locationsOfInterest];
  uint64_t v5 = [v8 valueForKey:a1[4]];
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (double)distanceFromHomeOfCurrentLocationInMeters
{
  [(ATXLocationManager *)self _distanceOfCurrentLocationFrom:@"Home"];
  return result;
}

- (double)distanceFromWorkOfCurrentLocationInMeters
{
  [(ATXLocationManager *)self _distanceOfCurrentLocationFrom:@"Work"];
  return result;
}

- (double)distanceFromSchoolOfCurrentLocationInMeters
{
  [(ATXLocationManager *)self _distanceOfCurrentLocationFrom:@"School"];
  return result;
}

- (double)distanceFromGymOfCurrentLocationInMeters
{
  [(ATXLocationManager *)self _distanceOfCurrentLocationFrom:@"Gym"];
  return result;
}

+ (id)debugDescriptionForCLLocation:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (objc_class *)NSString;
    id v4 = a3;
    id v5 = [v3 alloc];
    [v4 coordinate];
    uint64_t v7 = v6;
    [v4 coordinate];
    uint64_t v9 = v8;
    uint64_t v10 = [v4 timestamp];

    [v10 timeIntervalSinceReferenceDate];
    id v12 = (void *)[v5 initWithFormat:@"<CLLocation: lat: %f, long: %f, timestamp: %f>", v7, v9, v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)stringForLOIType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    id v4 = &stru_1F352D818;
  }
  else
  {
    id v4 = *off_1E6BE7620[a3];
  }
  return v4;
}

- (BOOL)isAvailableLocationOfInterestType:(int64_t)a3
{
  [(ATXLocationManager *)self updateCurrentLocationOfInterestIfTimeElapsed];
  id v5 = +[ATXLocationManager stringForLOIType:a3];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__ATXLocationManager_isAvailableLocationOfInterestType___block_invoke;
  v9[3] = &unk_1E6BE7560;
  id v7 = v5;
  id v10 = v7;
  uint64_t v11 = &v12;
  [(_PASLock *)lock runWithLockAcquired:v9];
  LOBYTE(lock) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)lock;
}

void __56__ATXLocationManager_isAvailableLocationOfInterestType___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a2 + 32) locationsOfInterest];
  id v4 = [v3 valueForKey:*(void *)(a1 + 32)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 != 0;
}

- (void)fetchAllLocationsOfInterest:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28C18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v8 = [(ATXLocationManager *)self now];
  uint64_t v9 = [v7 dateWithTimeInterval:v8 sinceDate:-4233600.0];
  id v10 = [(ATXLocationManager *)self now];
  id v11 = (id)[v6 initWithStartDate:v9 endDate:v10];

  [(ATXLocationManagerRoutine *)self->_routine fetchLOIVisitedDuring:v11 reply:v5];
}

- (void)fetchLocationsOfInterestVisitedDuring:(id)a3 handler:(id)a4
{
}

- (BOOL)isNearKnownTypeLocationOfInterest
{
  uint64_t v2 = [(ATXLocationManager *)self locationOfInterestAtCurrentLocation];
  uint64_t v3 = v2;
  if (v2) {
    BOOL v4 = [v2 type] != -1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isLocationNearKnownTypeLocationOfInterest:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__12;
  uint64_t v22 = __Block_byref_object_dispose__12;
  id v23 = 0;
  lock = self->_lock;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__ATXLocationManager_isLocationNearKnownTypeLocationOfInterest___block_invoke;
  v17[3] = &unk_1E6BE7510;
  v17[4] = &v18;
  [(_PASLock *)lock runWithLockAcquired:v17];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)v19[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        if (*(void *)(*((void *)&v13 + 1) + 8 * i))
        {
          [v4 distanceFromLocation:(void)v13];
          if (v10 <= (double)(int)[(ATXLocationParameters *)self->_modeGlobals locationOfInterestSearchRadius])
          {
            BOOL v11 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __64__ATXLocationManager_isLocationNearKnownTypeLocationOfInterest___block_invoke(uint64_t a1, void *a2)
{
  long long v15 = a2;
  uint64_t v3 = [v15[4] homeLOI];

  if (v3)
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v5 = [v15[4] homeLOI];
    [v4 addObject:v5];
  }
  id v6 = [v15[4] workLOI];

  if (v6)
  {
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = [v15[4] workLOI];
    [v7 addObject:v8];
  }
  uint64_t v9 = [v15[4] schoolLOI];

  if (v9)
  {
    double v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    BOOL v11 = [v15[4] schoolLOI];
    [v10 addObject:v11];
  }
  uint64_t v12 = [v15[4] gymLOI];

  if (v12)
  {
    long long v13 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    long long v14 = [v15[4] gymLOI];
    [v13 addObject:v14];
  }
}

- (BOOL)isNearFrequentLocationOfInterest
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ATXLocationManager *)self locationOfInterestAtCurrentLocation];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 visits];
    unint64_t v6 = [v5 count];
    BOOL v7 = v6 >= (int)[(ATXLocationParameters *)self->_modeGlobals frequentLOIMinimumVisits];
  }
  else
  {
    BOOL v7 = 0;
  }
  uint64_t v8 = __atxlog_handle_hero();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    double v10 = [v4 visits];
    int v12 = 136315650;
    long long v13 = "-[ATXLocationManager isNearFrequentLocationOfInterest]";
    __int16 v14 = 2112;
    long long v15 = v9;
    __int16 v16 = 2048;
    uint64_t v17 = [v10 count];
    _os_log_impl(&dword_1DAFF9000, v8, OS_LOG_TYPE_DEFAULT, "%s Location of interest is a frequently visited location: %@. Number of visits: %lu", (uint8_t *)&v12, 0x20u);
  }
  return v7;
}

- (BOOL)isNearKnownTypeOrFrequentLocationOfInterest
{
  if ([(ATXLocationManager *)self isNearKnownTypeLocationOfInterest]) {
    return 1;
  }

  return [(ATXLocationManager *)self isNearFrequentLocationOfInterest];
}

- (void)clearLocationOfInterest
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__ATXLocationManager_clearLocationOfInterest__block_invoke;
  v3[3] = &unk_1E6BE7298;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

uint64_t __45__ATXLocationManager_clearLocationOfInterest__block_invoke(uint64_t a1, void *a2)
{
  [a2 clear];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v3 clear];
}

- (unint64_t)getCurrentRoutineModeWithCurrentDate:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__12;
  id v23 = __Block_byref_object_dispose__12;
  id v24 = 0;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__ATXLocationManager_getCurrentRoutineModeWithCurrentDate___block_invoke;
  v14[3] = &unk_1E6BE75D8;
  void v14[4] = &v19;
  void v14[5] = &v15;
  [(_PASLock *)lock runWithLockAcquired:v14];
  if (v20[5] && (objc_msgSend(v4, "timeIntervalSinceDate:"), v6 < 3600.0))
  {
    unint64_t v7 = v16[3];
  }
  else
  {
    uint64_t v8 = [(ATXLocationManager *)self getCurrentLocation];
    if (v8) {
      unint64_t v7 = [(ATXLocationManagerRoutine *)self->_routine fetchRoutineModeFromLocation:v8];
    }
    else {
      unint64_t v7 = 0;
    }
    uint64_t v9 = self->_lock;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__ATXLocationManager_getCurrentRoutineModeWithCurrentDate___block_invoke_2;
    v11[3] = &unk_1E6BE7600;
    id v12 = v4;
    unint64_t v13 = v7;
    [(_PASLock *)v9 runWithLockAcquired:v11];
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __59__ATXLocationManager_getCurrentRoutineModeWithCurrentDate___block_invoke(uint64_t a1, id *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2[6]);
  id v4 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4[3];
}

void __59__ATXLocationManager_getCurrentRoutineModeWithCurrentDate___block_invoke_2(uint64_t a1, id *a2)
{
  objc_storeStrong(a2 + 6, *(id *)(a1 + 32));
  id v4 = a2;
  v4[3] = *(id *)(a1 + 40);
}

- (BOOL)isTourist
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  LOBYTE(self) = [(ATXLocationManager *)self isTouristWithCurrentDate:v3];

  return (char)self;
}

- (BOOL)isTouristWithCurrentDate:(id)a3
{
  return [(ATXLocationManager *)self getCurrentRoutineModeWithCurrentDate:a3] == 1;
}

- (void)didChangeLocationEnabled:(BOOL)a3
{
  if (a3) {
    [(ATXLocationManager *)self updateCurrentLocationOfInterestIfTimeElapsed];
  }
  else {
    [(ATXLocationManager *)self clearLocationOfInterest];
  }
}

- (void)locationManagerGPS:(id)a3 didEnterRegionWithIdentifier:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(ATXLocationManager *)self updatePredictedLocationsOfInterest];
  id v6 = objc_alloc(MEMORY[0x1E4F28EA0]);
  double v10 = @"ATXLocationManagerRegionIdentifierUserInfoKey";
  v11[0] = v5;
  unint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = (void *)[v6 initWithName:@"ATXLocationManagerDidEnterRegionNotification" object:self userInfo:v7];

  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];

  [v9 postNotification:v8];
}

- (void)locationManagerGPS:(id)a3 didExitRegionWithIdentifier:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(ATXLocationManager *)self updatePredictedLocationsOfInterest];
  id v6 = objc_alloc(MEMORY[0x1E4F28EA0]);
  double v10 = @"ATXLocationManagerRegionIdentifierUserInfoKey";
  v11[0] = v5;
  unint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = (void *)[v6 initWithName:@"ATXLocationManagerDidExitRegionNotification" object:self userInfo:v7];

  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];

  [v9 postNotification:v8];
}

- (void)beginMonitoringRegion:(id)a3
{
}

- (void)stopMonitoringRegionWithIdentifier:(id)a3
{
}

- (int64_t)stateForRegion:(id)a3 withTimeout:(double)a4
{
  return [(ATXLocationManagerGPS *)self->_gps stateForRegion:a3 withTimeout:a4];
}

- (double)predictedNextLOITimeout
{
  return self->_predictedNextLOITimeout;
}

- (void)setPredictedNextLOITimeout:(double)a3
{
  self->_predictedNextLOITimeout = a3;
}

- (double)predictedExitDateTimeout
{
  return self->_predictedExitDateTimeout;
}

- (void)setPredictedExitDateTimeout:(double)a3
{
  self->_predictedExitDateTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_modeGlobals, 0);
  objc_storeStrong((id *)&self->_loiUpdateQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_stateStore, 0);
  objc_storeStrong((id *)&self->_routine, 0);

  objc_storeStrong((id *)&self->_gps, 0);
}

- (void)getCurrentLocationWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_1DAFF9000, v0, OS_LOG_TYPE_DEBUG, "Updating location", v1, 2u);
}

void __62__ATXLocationManager_getCurrentLocationWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = [(id)objc_opt_class() debugDescriptionForCLLocation:a2];
  int v5 = 138739971;
  id v6 = v4;
  _os_log_debug_impl(&dword_1DAFF9000, a3, OS_LOG_TYPE_DEBUG, "Updated location: %{sensitive}@", (uint8_t *)&v5, 0xCu);
}

void __68__ATXLocationManager__updateLocationsOfInterestWithCurrentLocation___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_DEBUG, "Current LOI at %@", (uint8_t *)&v2, 0xCu);
}

- (void)_handleRoutineError:(NSObject *)a3 forThing:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0(&dword_1DAFF9000, a2, a3, "Non-RT error fetching %{public}@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __51__ATXLocationManager__handleRoutineError_forThing___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0(&dword_1DAFF9000, v0, v1, "Error fetching %{public}@: %@");
}

void __51__ATXLocationManager__handleRoutineError_forThing___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0(&dword_1DAFF9000, v0, v1, "Disabling LOI updates due to error fetching %{public}@: %@");
}

void __51__ATXLocationManager__handleRoutineError_forThing___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_3();
  _os_log_fault_impl(&dword_1DAFF9000, v0, OS_LOG_TYPE_FAULT, "RT misuse fetching %{public}@: %@", v1, 0x16u);
}

- (void)getPredictedLocationsOfInterestFromLOIName:startDate:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1DAFF9000, v0, v1, "Next predicted LOIs fetch timed out", v2, v3, v4, v5, v6);
}

- (void)getPredictedExitTimesFromLOIName:startDate:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1DAFF9000, v0, v1, "Predicted exit times fetch timed out", v2, v3, v4, v5, v6);
}

- (void)_distanceOfCurrentLocationFrom:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_DEBUG, "Distance to %@ LOI: %f meters", (uint8_t *)&v3, 0x16u);
}

@end