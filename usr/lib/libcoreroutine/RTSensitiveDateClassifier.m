@interface RTSensitiveDateClassifier
- (BOOL)_accessPointsConditionsMet;
- (BOOL)_isNearSensitiveLocation:(id)a3;
- (BOOL)_sensitiveMotionSignalDetectedForMotion:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (BOOL)inWifiDenseArea;
- (NSArray)sensitiveLocations;
- (NSDate)nearSensitiveLocationDetectionDate;
- (NSDateInterval)latestWorkoutDateInterval;
- (NSMutableArray)accessPoints;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTHealthKitManager)healthKitManager;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLocationManager)locationManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTSensitiveDateClassifier)init;
- (RTSensitiveDateClassifier)initWithDefaultsManager:(id)a3 healthKitManager:(id)a4 learnedLocationStore:(id)a5 locationManager:(id)a6 motionActivityManager:(id)a7 timerManager:(id)a8 vehicleLocationProvider:(id)a9 wifiManager:(id)a10;
- (RTSensitiveDateClassifierMetrics)metrics;
- (RTTimer)wifiScanTimer;
- (RTTimerManager)timerManager;
- (RTVehicleLocationProvider)vehicleLocationProvider;
- (RTWiFiManager)wifiManager;
- (id)_compareWorkoutStartDateToLookbackWindowStartDate:(id)a3 motionLookbackWindowStartDate:(id)a4;
- (id)_getLastParkedCarDate;
- (id)_getLocationLookbackWindowStartDateWithDateInterval:(id)a3 currentLocation:(id)a4;
- (id)_getLookbackWindowStartDateWithLocation:(id)a3 error:(id *)a4;
- (id)_getMotionLookbackWindowStartDateWithDateInterval:(id)a3;
- (id)_locationsForOptions:(id)a3;
- (id)_motionsForDateInterval:(id)a3;
- (id)_sensitiveLocationsOfInterestWithError:(id *)a3;
- (id)wifiDenseHandler;
- (void)_fetchCurrentLocationWithHandler:(id)a3;
- (void)_fetchInWifiDenseAreaWithHandler:(id)a3;
- (void)_processRecentWorkoutSignal;
- (void)_processWifiScanResults;
- (void)_stopMonitoringWifiScans;
- (void)fetchLookbackWindowStartDateWithLocation:(id)a3 handler:(id)a4;
- (void)onWifiScanResultsNotification:(id)a3;
- (void)setAccessPoints:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setInWifiDenseArea:(BOOL)a3;
- (void)setLatestWorkoutDateInterval:(id)a3;
- (void)setNearSensitiveLocationDetectionDate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSensitiveLocations:(id)a3;
- (void)setWifiDenseHandler:(id)a3;
- (void)setWifiScanTimer:(id)a3;
@end

@implementation RTSensitiveDateClassifier

- (RTSensitiveDateClassifier)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_healthKitManager_learnedLocationStore_locationManager_motionActivityManager_timerManager_vehicleLocationProvider_wifiManager_);
}

- (RTSensitiveDateClassifier)initWithDefaultsManager:(id)a3 healthKitManager:(id)a4 learnedLocationStore:(id)a5 locationManager:(id)a6 motionActivityManager:(id)a7 timerManager:(id)a8 vehicleLocationProvider:(id)a9 wifiManager:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v49 = a5;
  id v52 = a6;
  id v51 = a7;
  id v47 = a8;
  id v50 = a9;
  id v18 = a10;
  id v48 = v16;
  if (!v16)
  {
    v32 = v18;
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v34 = 0;
    v35 = 0;
    v19 = v49;
    goto LABEL_26;
  }
  if (!v17)
  {
    v32 = v18;
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = v49;
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v37 = "Invalid parameter not satisfying: healthKitManager";
LABEL_24:
    _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, v37, buf, 2u);
    goto LABEL_25;
  }
  v19 = v49;
  if (!v49)
  {
    v32 = v18;
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v37 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_24;
  }
  if (!v52)
  {
    v32 = v18;
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v37 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_24;
  }
  if (!v51)
  {
    v32 = v18;
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v37 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_24;
  }
  if (!v50)
  {
    v32 = v18;
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v37 = "Invalid parameter not satisfying: vehicleLocationProvider";
      goto LABEL_24;
    }
LABEL_25:

    v34 = 0;
    v35 = v48;
LABEL_26:
    v39 = self;
    v38 = v47;
    goto LABEL_27;
  }
  id v45 = v18;
  if (v18)
  {
    v53.receiver = self;
    v53.super_class = (Class)RTSensitiveDateClassifier;
    v20 = [(RTSensitiveDateClassifier *)&v53 init];
    if (v20)
    {
      uint64_t v21 = objc_opt_new();
      accessPoints = v20->_accessPoints;
      v20->_accessPoints = (NSMutableArray *)v21;

      uint64_t v23 = objc_opt_new();
      distanceCalculator = v20->_distanceCalculator;
      v20->_distanceCalculator = (RTDistanceCalculator *)v23;

      objc_storeStrong((id *)&v20->_defaultsManager, a3);
      objc_storeStrong((id *)&v20->_healthKitManager, a4);
      v20->_inWifiDenseArea = 0;
      latestWorkoutDateInterval = v20->_latestWorkoutDateInterval;
      v20->_latestWorkoutDateInterval = 0;

      objc_storeStrong((id *)&v20->_learnedLocationStore, a5);
      objc_storeStrong((id *)&v20->_locationManager, a6);
      uint64_t v26 = objc_opt_new();
      metrics = v20->_metrics;
      v20->_metrics = (RTSensitiveDateClassifierMetrics *)v26;

      objc_storeStrong((id *)&v20->_motionActivityManager, a7);
      nearSensitiveLocationDetectionDate = v20->_nearSensitiveLocationDetectionDate;
      v20->_nearSensitiveLocationDetectionDate = 0;

      v29 = v20;
      v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v31 = (const char *)[(RTSensitiveDateClassifier *)v29 UTF8String];
      }
      else
      {
        id v42 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v29];
        v31 = (const char *)[v42 UTF8String];
      }
      dispatch_queue_t v43 = dispatch_queue_create(v31, v30);

      queue = v29->_queue;
      v29->_queue = (OS_dispatch_queue *)v43;

      objc_storeStrong((id *)&v29->_timerManager, a8);
      objc_storeStrong((id *)&v29->_vehicleLocationProvider, a9);
      objc_storeStrong((id *)&v29->_wifiManager, a10);
    }
    v39 = v20;
    v34 = v39;
    v32 = v45;
    v35 = v48;
    v19 = v49;
    v38 = v47;
  }
  else
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = v47;
    v35 = v48;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: wifiManager", buf, 2u);
    }

    v34 = 0;
    v32 = 0;
    v39 = self;
  }
LABEL_27:

  return v34;
}

- (void)fetchLookbackWindowStartDateWithLocation:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(RTSensitiveDateClassifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke;
    block[3] = &unk_1E6B92668;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(v8, block);
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] defaultsManager];
  v3 = [v2 objectForKey:@"RTDefaultsSensitiveDateClassifierOverrideLookbackWindow"];

  id v4 = a1[4];
  if (v3)
  {
    v5 = [v4 defaultsManager];
    id v6 = [v5 objectForKey:@"RTDefaultsSensitiveDateClassifierOverrideLookbackWindow"];

    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = [v6 stringFromDate];
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTSensitiveDateClassifier fetchLookbackWindowStartDateWithLocation:handler:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, user override lookback window with date, %@", buf, 0x16u);
    }
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    [v4 _processRecentWorkoutSignal];
    id v9 = a1[4];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_14;
    v10[3] = &unk_1E6B93B20;
    v10[4] = v9;
    id v12 = a1[6];
    id v11 = a1[5];
    [v9 _fetchInWifiDenseAreaWithHandler:v10];
  }
}

void __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_14(id *a1, char a2)
{
  id v4 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_2;
  v5[3] = &unk_1E6B93AF8;
  char v8 = a2;
  v5[4] = a1[4];
  id v7 = a1[6];
  id v6 = a1[5];
  dispatch_async(v4, v5);
}

void __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_3;
  }
  [*(id *)(a1 + 32) setInWifiDenseArea:1];
  uint64_t v2 = [*(id *)(a1 + 32) metrics];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [v2 processSignal:5 date:v3];

  id v4 = [*(id *)(a1 + 32) latestWorkoutDateInterval];

  if (!v4)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v21 = "-[RTSensitiveDateClassifier fetchLookbackWindowStartDateWithLocation:handler:]_block_invoke_2";
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, wifi dense area detected, returning current date", buf, 0xCu);
    }

    __int16 v15 = [MEMORY[0x1E4F1C9C8] now];
    id v16 = [*(id *)(a1 + 32) metrics];
    [v16 submitMetricsWithLookbackWindowDate:v15];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
LABEL_3:
    id v6 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      id v19 = 0;
      id v7 = [v6 _getLookbackWindowStartDateWithLocation:v5 error:&v19];
      id v8 = v19;
      id v9 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = [v7 stringFromDate];
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v21 = "-[RTSensitiveDateClassifier fetchLookbackWindowStartDateWithLocation:handler:]_block_invoke";
        __int16 v22 = 2112;
        uint64_t v23 = v10;
        __int16 v24 = 2112;
        uint64_t v25 = v11;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, Fetched lookbackWindowStartDate, %@, currentLocation provided, %@, error, %@", buf, 0x2Au);
      }
      id v12 = [*(id *)(a1 + 32) metrics];
      [v12 addCurrentLocation:*(void *)(a1 + 40) fromSource:2];

      v13 = [*(id *)(a1 + 32) metrics];
      [v13 submitMetricsWithLookbackWindowDate:v7];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_16;
      v17[3] = &unk_1E6B93AD0;
      v17[4] = v6;
      id v18 = *(id *)(a1 + 48);
      [v6 _fetchCurrentLocationWithHandler:v17];
    }
  }
}

void __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_2_17;
  v12[3] = &unk_1E6B91490;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __78__RTSensitiveDateClassifier_fetchLookbackWindowStartDateWithLocation_handler___block_invoke_2_17(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 32);
  id v4 = v11;
  id v5 = [v2 _getLookbackWindowStartDateWithLocation:v3 error:&v11];
  id v6 = v11;

  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v5 stringFromDate];
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    id v13 = "-[RTSensitiveDateClassifier fetchLookbackWindowStartDateWithLocation:handler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, Fetched lookbackWindowStartDate, %@, currentLocation, %@, error, %@", buf, 0x2Au);
  }
  id v10 = [*(id *)(a1 + 40) metrics];
  [v10 submitMetricsWithLookbackWindowDate:v5];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_getLookbackWindowStartDateWithLocation:(id)a3 error:(id *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v47 = 0;
    id v7 = [(RTSensitiveDateClassifier *)self _sensitiveLocationsOfInterestWithError:&v47];
    id v8 = v47;
    sensitiveLocations = self->_sensitiveLocations;
    self->_sensitiveLocations = v7;

    if (v8)
    {
      if (a4) {
        *a4 = v8;
      }
      goto LABEL_5;
    }
    id v13 = [(RTSensitiveDateClassifier *)self defaultsManager];
    __int16 v14 = [v13 objectForKey:@"RTDefaultsSensitiveDateClassifierBypassSensitiveLocationCheck"];
    if (v14)
    {
    }
    else
    {
      char v15 = _os_feature_enabled_impl();

      if ((v15 & 1) == 0)
      {
        if ([(RTSensitiveDateClassifier *)self _isNearSensitiveLocation:v6])
        {
LABEL_5:
          id v10 = [v6 timestamp];
LABEL_25:

          goto LABEL_26;
        }
LABEL_15:
        uint64_t v17 = [(RTSensitiveDateClassifier *)self _getLastParkedCarDate];
        id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
        id v19 = [v6 timestamp];
        uint64_t v20 = [v19 dateByAddingTimeInterval:-259200.0];
        uint64_t v21 = [v6 timestamp];
        uint64_t v22 = [v18 initWithStartDate:v20 endDate:v21];

        v46 = (void *)v22;
        uint64_t v23 = [(RTSensitiveDateClassifier *)self _getMotionLookbackWindowStartDateWithDateInterval:v22];
        id v24 = objc_alloc(MEMORY[0x1E4F28C18]);
        uint64_t v25 = [v6 timestamp];
        uint64_t v26 = [v24 initWithStartDate:v23 endDate:v25];

        id v45 = (void *)v26;
        id v27 = [(RTSensitiveDateClassifier *)self _getLocationLookbackWindowStartDateWithDateInterval:v26 currentLocation:v6];
        uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          [v23 stringFromDate];
          v29 = v44 = v17;
          v30 = [v27 stringFromDate];
          v31 = [v44 stringFromDate];
          v32 = [(NSDateInterval *)self->_latestWorkoutDateInterval startDate];
          [v32 stringFromDate];
          v33 = dispatch_queue_t v43 = v23;
          *(_DWORD *)buf = 136316162;
          id v49 = "-[RTSensitiveDateClassifier _getLookbackWindowStartDateWithLocation:error:]";
          __int16 v50 = 2112;
          id v51 = v29;
          __int16 v52 = 2112;
          objc_super v53 = v30;
          __int16 v54 = 2112;
          v55 = v31;
          __int16 v56 = 2112;
          v57 = v33;
          _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%s, motionLookbackWindowStart, %@, locationLookbackWindowStart, %@, parkedCarDate, %@, latestWorkoutStartDate, %@", buf, 0x34u);

          uint64_t v23 = v43;
          uint64_t v17 = v44;
        }

        v34 = [v27 earlierDate:v17];
        if ([v34 isEqualToDate:v17])
        {
          v35 = [(RTSensitiveDateClassifier *)self nearSensitiveLocationDetectionDate];
          v36 = [v17 earlierDate:v35];
          v37 = [(RTSensitiveDateClassifier *)self nearSensitiveLocationDetectionDate];
          if ([v36 isEqualToDate:v37])
          {
            [v27 timeIntervalSinceDate:v17];
            double v39 = v38;

            v40 = v17;
            if (v39 <= 600.0) {
              goto LABEL_24;
            }
            goto LABEL_23;
          }
        }
LABEL_23:
        v40 = v27;
LABEL_24:
        id v41 = v40;
        id v10 = [(RTSensitiveDateClassifier *)self _compareWorkoutStartDateToLookbackWindowStartDate:v41 motionLookbackWindowStartDate:v23];

        goto LABEL_25;
      }
    }
    __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v49 = "-[RTSensitiveDateClassifier _getLookbackWindowStartDateWithLocation:error:]";
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%s, bypassing sensitive location check for all location signal, via user defaults or feature flag", buf, 0xCu);
    }

    goto LABEL_15;
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = *a4;
    *(_DWORD *)buf = 136315394;
    id v49 = "-[RTSensitiveDateClassifier _getLookbackWindowStartDateWithLocation:error:]";
    __int16 v50 = 2112;
    id v51 = v12;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s, lookback window passed in nil location, error, %@", buf, 0x16u);
  }

  id v10 = [MEMORY[0x1E4F1C9C8] date];
LABEL_26:

  return v10;
}

- (void)_fetchInWifiDenseAreaWithHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(RTSensitiveDateClassifier *)self defaultsManager];
  id v6 = [v5 objectForKey:@"RTDefaultsSensitiveDateClassifierBypassWifiAccessPointsCheck"];
  if (v6)
  {

LABEL_4:
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v23 = "-[RTSensitiveDateClassifier _fetchInWifiDenseAreaWithHandler:]";
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, bypassing wifi access points check via user defaults or feature flag", buf, 0xCu);
    }

    v4[2](v4, 1);
    goto LABEL_7;
  }
  char v7 = _os_feature_enabled_impl();

  if (v7) {
    goto LABEL_4;
  }
  objc_initWeak(&location, self);
  uint64_t v9 = [(RTSensitiveDateClassifier *)self timerManager];
  id v10 = [(RTSensitiveDateClassifier *)self queue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__RTSensitiveDateClassifier__fetchInWifiDenseAreaWithHandler___block_invoke;
  v19[3] = &unk_1E6B92EA0;
  v19[4] = self;
  objc_copyWeak(&v20, &location);
  id v11 = [v9 timerWithIdentifier:@"RTSensitiveDateClassifierWifiScanTimer" queue:v10 handler:v19];
  [(RTSensitiveDateClassifier *)self setWifiScanTimer:v11];

  [(RTSensitiveDateClassifier *)self setWifiDenseHandler:v4];
  id v12 = [(RTSensitiveDateClassifier *)self accessPoints];
  [v12 removeAllObjects];

  id v13 = [(RTSensitiveDateClassifier *)self wifiManager];
  __int16 v14 = +[RTNotification notificationName];
  [v13 addObserver:self selector:sel_onWifiScanResultsNotification_ name:v14];

  char v15 = [(RTSensitiveDateClassifier *)self wifiManager];
  [v15 scheduleScanWithChannels:&unk_1F3452A78];

  __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v23 = "-[RTSensitiveDateClassifier _fetchInWifiDenseAreaWithHandler:]";
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%s, start monitoring for wifi scan results", buf, 0xCu);
  }

  uint64_t v17 = [(RTSensitiveDateClassifier *)self wifiScanTimer];
  [v17 fireAfterDelay:1.0];

  id v18 = [(RTSensitiveDateClassifier *)self wifiScanTimer];
  [v18 resume];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
LABEL_7:
}

void __62__RTSensitiveDateClassifier__fetchInWifiDenseAreaWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) wifiDenseHandler];

  WeakRetained = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  BOOL v4 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      int v5 = 136315138;
      id v6 = "-[RTSensitiveDateClassifier _fetchInWifiDenseAreaWithHandler:]_block_invoke";
      _os_log_impl(&dword_1D9BFA000, WeakRetained, OS_LOG_TYPE_INFO, "%s, wifi timer expiry: no early exit, proceeding to process wifi access points", (uint8_t *)&v5, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _processWifiScanResults];
  }
  else if (v4)
  {
    int v5 = 136315138;
    id v6 = "-[RTSensitiveDateClassifier _fetchInWifiDenseAreaWithHandler:]_block_invoke";
    _os_log_impl(&dword_1D9BFA000, WeakRetained, OS_LOG_TYPE_INFO, "%s, wifi timer expiry: handler already returned. Exiting now.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_fetchCurrentLocationWithHandler:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void (**)(id, void, id))a3;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000;
  id v49 = __Block_byref_object_copy__32;
  __int16 v50 = __Block_byref_object_dispose__32;
  id v51 = 0;
  uint64_t v40 = 0;
  id v41 = (id *)&v40;
  uint64_t v42 = 0x3032000000;
  dispatch_queue_t v43 = __Block_byref_object_copy__32;
  v44 = __Block_byref_object_dispose__32;
  id v45 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v33 = [MEMORY[0x1E4F1C9C8] date];
  int v5 = [[RTLocationRequestOptions alloc] initWithDesiredAccuracy:1 horizontalAccuracy:1 maxAge:100.0 yieldLastLocation:100.0 timeout:10.0 fallback:1.0 fallbackHorizontalAccuracy:200.0 fallbackMaxAge:240.0];
  id v6 = [(RTSensitiveDateClassifier *)self locationManager];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __62__RTSensitiveDateClassifier__fetchCurrentLocationWithHandler___block_invoke;
  v36[3] = &unk_1E6B93B48;
  double v38 = &v46;
  double v39 = &v40;
  uint64_t v7 = v4;
  v37 = v7;
  [v6 fetchCurrentLocationWithOptions:v5 handler:v36];

  id v8 = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10)) {
    goto LABEL_6;
  }
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  __int16 v14 = objc_opt_new();
  char v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_26];
  __int16 v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v17 = [v16 filteredArrayUsingPredicate:v15];
  id v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v52 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v52 count:1];
  uint64_t v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

  if (v22)
  {
    id v23 = v22;

    char v24 = 0;
  }
  else
  {
LABEL_6:
    id v23 = 0;
    char v24 = 1;
  }

  id v25 = v23;
  if ((v24 & 1) == 0) {
    objc_storeStrong(v41 + 5, v23);
  }
  uint64_t v26 = [[(id)v47[5] timestamp:v33];
  id v27 = [v26 earlierDate:v34];
  uint64_t v28 = [(id)v47[5] timestamp];
  int v29 = [v27 isEqualToDate:v28];

  v30 = [(RTSensitiveDateClassifier *)self metrics];
  v31 = v30;
  if (v29) {
    uint64_t v32 = 3;
  }
  else {
    uint64_t v32 = 4;
  }
  [v30 addCurrentLocation:v47[5] fromSource:v32];

  v3[2](v3, v47[5], v41[5]);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

void __62__RTSensitiveDateClassifier__fetchCurrentLocationWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getLastParkedCarDate
{
  v51[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RTSensitiveDateClassifier *)self defaultsManager];
  dispatch_semaphore_t v4 = [v3 objectForKey:@"RTDefaultsSensitiveDateClassifierBypassParkedCarEventCheck"];
  if (v4)
  {

LABEL_4:
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[RTSensitiveDateClassifier _getLastParkedCarDate]";
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, bypassing parked car signal check via user defaults or feature flag, returning distant past date for parked car signal", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantPast];
    goto LABEL_7;
  }
  char v5 = _os_feature_enabled_impl();

  if (v5) {
    goto LABEL_4;
  }
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__32;
  id v49 = __Block_byref_object_dispose__32;
  id v50 = 0;
  dispatch_time_t v10 = [(RTSensitiveDateClassifier *)self vehicleLocationProvider];
  uint64_t v37 = MEMORY[0x1E4F143A8];
  uint64_t v38 = 3221225472;
  double v39 = __50__RTSensitiveDateClassifier__getLastParkedCarDate__block_invoke;
  uint64_t v40 = &unk_1E6B90700;
  p_long long buf = &buf;
  id v11 = v9;
  id v41 = v11;
  [v10 fetchLastVehicleEventsWithHandler:&v37];

  id v12 = v11;
  double v13 = [[MEMORY[0x1E4F1C9C8] now:v37, v38, v39, v40];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14)) {
    goto LABEL_15;
  }
  char v15 = [MEMORY[0x1E4F1C9C8] now];
  [v15 timeIntervalSinceDate:v13];
  double v17 = v16;
  id v18 = objc_opt_new();
  id v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_26];
  id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v21 = [v20 filteredArrayUsingPredicate:v19];
  uint64_t v22 = [v21 firstObject];

  [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
  id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)dispatch_queue_t v43 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v43, 2u);
  }

  char v24 = (void *)MEMORY[0x1E4F28C58];
  v51[0] = *MEMORY[0x1E4F28568];
  *(void *)dispatch_queue_t v43 = @"semaphore wait timeout";
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v51 count:1];
  uint64_t v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

  if (v26)
  {
    id v27 = v26;

    char v28 = 0;
  }
  else
  {
LABEL_15:
    id v27 = 0;
    char v28 = 1;
  }

  id v29 = v27;
  if ((v28 & 1) == 0)
  {
    v30 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)dispatch_queue_t v43 = 136315138;
      *(void *)&v43[4] = "-[RTSensitiveDateClassifier _getLastParkedCarDate]";
      _os_log_debug_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_DEBUG, "%s, Vehicle Event fetch timed out", v43, 0xCu);
    }
  }
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    v31 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)dispatch_queue_t v43 = 136315394;
      *(void *)&v43[4] = "-[RTSensitiveDateClassifier _getLastParkedCarDate]";
      __int16 v44 = 2112;
      uint64_t v45 = v32;
      _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, "%s, Vehicle Event found, %@", v43, 0x16u);
    }

    uint64_t v33 = [(RTSensitiveDateClassifier *)self metrics];
    v34 = [*(id *)(*((void *)&buf + 1) + 40) date];
    [v33 processSignal:4 date:v34];

    uint64_t v35 = [*(id *)(*((void *)&buf + 1) + 40) date];
  }
  else
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)dispatch_queue_t v43 = 136315138;
      *(void *)&v43[4] = "-[RTSensitiveDateClassifier _getLastParkedCarDate]";
      _os_log_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_INFO, "%s, Vehicle Event not found, returning distant past", v43, 0xCu);
    }

    uint64_t v35 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  uint64_t v7 = (void *)v35;

  _Block_object_dispose(&buf, 8);
LABEL_7:

  return v7;
}

intptr_t __50__RTSensitiveDateClassifier__getLastParkedCarDate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

- (id)_getLocationLookbackWindowStartDateWithDateInterval:(id)a3 currentLocation:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v44 = a4;
  dispatch_queue_t v43 = v6;
  uint64_t v7 = [v6 endDate];
  id v8 = [v6 startDate];
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  objc_super v53 = __Block_byref_object_copy__32;
  uint64_t v54 = __Block_byref_object_dispose__32;
  id v42 = v7;
  id v55 = v42;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  id v9 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [v44 coordinate];
  double v11 = v10;
  double v13 = v12;
  [v44 altitude];
  double v15 = v14;
  [v44 verticalAccuracy];
  double v17 = v16;
  id v18 = [v44 timestamp];
  id v19 = [v9 initWithCoordinate:v18 altitude:v11 horizontalAccuracy:v13 verticalAccuracy:v15 timestamp:250000.0];

  id v20 = [(RTSensitiveDateClassifier *)self defaultsManager];
  uint64_t v21 = [v20 objectForKey:@"RTDefaultsSensitiveDateClassifierBypassCurrentLocationCheck"];
  if (v21)
  {
  }
  else
  {
    char v22 = _os_feature_enabled_impl();

    if ((v22 & 1) == 0) {
      goto LABEL_7;
    }
  }
  id v23 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v57 = "-[RTSensitiveDateClassifier _getLocationLookbackWindowStartDateWithDateInterval:currentLocation:]";
    _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "%s, bypassing current location distance fetch via user defaults or feature flags", buf, 0xCu);
  }

  id v19 = 0;
LABEL_7:
  char v24 = [(RTSensitiveDateClassifier *)self defaultsManager];
  id v25 = [v24 objectForKey:@"RTDefaultsSensitiveDateClassifierBypassSensitiveLocationCheck"];
  if (v25)
  {

LABEL_10:
    id v27 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v57 = "-[RTSensitiveDateClassifier _getLocationLookbackWindowStartDateWithDateInterval:currentLocation:]";
      _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "%s, bypassing sensitive location check for all location signal, via user defaults or feature flag", buf, 0xCu);
    }

    id v28 = 0;
    i = v42;
    goto LABEL_13;
  }
  char v26 = _os_feature_enabled_impl();

  if (v26) {
    goto LABEL_10;
  }
  id v28 = 0;
  for (i = v42; ; i = v28)
  {
    uint64_t v32 = [i timeIntervalSinceDate:v8];
    if (v33 <= 0.0 || *((unsigned char *)v47 + 24)) {
      break;
    }
    v34 = (void *)MEMORY[0x1E016D870](v32);
    uint64_t v35 = [i dateByAddingTimeInterval:-3600.0];
    v36 = [v35 laterDate:v8];

    uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v36 endDate:i];
    uint64_t v38 = [(RTSensitiveDateClassifier *)self defaultsManager];
    double v39 = [v38 objectForKey:@"RTDefaultsSensitiveDateClassifierBypassCurrentLocationCheck"];

    if (v39)
    {

      id v19 = 0;
    }
    uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F5CF40]) initWithDateInterval:v37 horizontalAccuracy:3600 batchSize:v19 boundingBoxLocation:250.0];
    id v41 = [(RTSensitiveDateClassifier *)self _locationsForOptions:v40];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __97__RTSensitiveDateClassifier__getLocationLookbackWindowStartDateWithDateInterval_currentLocation___block_invoke;
    v45[3] = &unk_1E6B93B70;
    v45[4] = self;
    v45[5] = &v46;
    v45[6] = &v50;
    [v41 enumerateObjectsWithOptions:2 usingBlock:v45];
    id v28 = v36;
  }
LABEL_13:
  id v30 = (id)v51[5];

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  return v30;
}

void __97__RTSensitiveDateClassifier__getLocationLookbackWindowStartDateWithDateInterval_currentLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isNearSensitiveLocation:"))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    uint64_t v6 = [v9 timestamp];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (id)_getMotionLookbackWindowStartDateWithDateInterval:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 endDate];
  uint64_t v6 = [v4 startDate];
  id v22 = v5;
  uint64_t v7 = [(RTSensitiveDateClassifier *)self defaultsManager];
  id v8 = [v7 objectForKey:@"RTDefaultsSensitiveDateClassifierBypassMotionCheck"];
  if (v8)
  {
  }
  else
  {
    char v9 = _os_feature_enabled_impl();

    if ((v9 & 1) == 0)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__32;
      uint64_t v37 = __Block_byref_object_dispose__32;
      id v12 = v22;
      id v14 = 0;
      id v38 = v12;
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x3032000000;
      v32[3] = __Block_byref_object_copy__32;
      v32[4] = __Block_byref_object_dispose__32;
      id v33 = 0;
      uint64_t v28 = 0;
      id v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 0;
      while (1)
      {
        uint64_t v15 = [v12 timeIntervalSinceDate:v6];
        if (v16 <= 0.0 || *((unsigned char *)v29 + 24)) {
          break;
        }
        double v17 = (void *)MEMORY[0x1E016D870](v15);
        id v18 = [v12 dateByAddingTimeInterval:-3600.0];
        id v19 = [v18 laterDate:v6];

        id v20 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v19 endDate:v12];
        uint64_t v21 = [(RTSensitiveDateClassifier *)self _motionsForDateInterval:v20];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __79__RTSensitiveDateClassifier__getMotionLookbackWindowStartDateWithDateInterval___block_invoke;
        v23[3] = &unk_1E6B93B98;
        v23[4] = self;
        p_long long buf = &buf;
        char v26 = &v28;
        id v27 = v32;
        id v24 = v6;
        [v21 enumerateObjectsWithOptions:2 usingBlock:v23];
        id v14 = v19;

        id v12 = v14;
      }
      id v11 = *(id *)(*((void *)&buf + 1) + 40);
      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(v32, 8);

      _Block_object_dispose(&buf, 8);
      goto LABEL_7;
    }
  }
  double v10 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[RTSensitiveDateClassifier _getMotionLookbackWindowStartDateWithDateInterval:]";
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, bypassing motion check via user defaults or feature flag", (uint8_t *)&buf, 0xCu);
  }

  id v11 = v6;
  id v12 = v22;
LABEL_7:

  return v11;
}

void __79__RTSensitiveDateClassifier__getMotionLookbackWindowStartDateWithDateInterval___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  char v9 = [v7 startDate];
  LODWORD(v8) = [v8 _sensitiveMotionSignalDetectedForMotion:v7 startDate:v9 endDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  if (v8)
  {
    double v10 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v7 startDate];
      id v12 = [v11 stringFromDate];
      int v20 = 136315394;
      uint64_t v21 = "-[RTSensitiveDateClassifier _getMotionLookbackWindowStartDateWithDateInterval:]_block_invoke";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, driving motion detected, driving motion activity start date, %@", (uint8_t *)&v20, 0x16u);
    }
    double v13 = [*(id *)(a1 + 32) metrics];
    [v13 processSignal:1 date:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    uint64_t v14 = [v7 type];
    if (v14 != [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) type]
      || (uint64_t v15 = [v7 confidence],
          v15 != [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) confidence]))
    {
      double v16 = [v7 startDate];
      uint64_t v17 = [v16 laterDate:*(void *)(a1 + 40)];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      id v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  }
}

- (void)_processRecentWorkoutSignal
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [v3 dateByAddingTimeInterval:-3600.0];

  char v5 = [(RTSensitiveDateClassifier *)self healthKitManager];
  uint64_t v7 = 0;
  uint64_t v6 = [v5 getLatestWorkoutDateIntervalWithStartDate:v4 error:&v7];
  [(RTSensitiveDateClassifier *)self setLatestWorkoutDateInterval:v6];
}

- (BOOL)_isNearSensitiveLocation:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(RTSensitiveDateClassifier *)self defaultsManager];
  uint64_t v6 = [v5 objectForKey:@"RTDefaultsSensitiveDateClassifierBypassSensitiveLocationCheck"];
  if (v6)
  {

LABEL_4:
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_7:
      BOOL v10 = 0;
      goto LABEL_8;
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[RTSensitiveDateClassifier _isNearSensitiveLocation:]";
    char v9 = "%s, bypassing sensitive location check for LOI and signal environment, via user defaults or feature flag";
LABEL_6:
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, v9, buf, 0xCu);
    goto LABEL_7;
  }
  char v7 = _os_feature_enabled_impl();

  if (v7) {
    goto LABEL_4;
  }
  id v12 = [(RTSensitiveDateClassifier *)self defaultsManager];
  double v13 = [v12 objectForKey:@"RTDefaultsSensitiveDateClassifierBypassSignalEnvironmentCheck"];
  if (v13)
  {

LABEL_12:
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[RTSensitiveDateClassifier _isNearSensitiveLocation:]";
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%s, bypassing signal environment check via user defaults or feature flag", buf, 0xCu);
    }

    goto LABEL_15;
  }
  char v14 = _os_feature_enabled_impl();

  if (v14) {
    goto LABEL_12;
  }
  if ([v4 signalEnvironmentType] == 3
    || [v4 signalEnvironmentType] == 4)
  {
    id v19 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTSensitiveDateClassifier _isNearSensitiveLocation:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%s, sensitive signal environment detected for location, %@", buf, 0x16u);
    }

    id v8 = [(RTSensitiveDateClassifier *)self metrics];
    int v20 = [v4 timestamp];
    [v8 processSignal:3 date:v20];

    BOOL v10 = 1;
    goto LABEL_8;
  }
LABEL_15:
  double v16 = [(RTSensitiveDateClassifier *)self defaultsManager];
  uint64_t v17 = [v16 objectForKey:@"RTDefaultsSensitiveDateClassifierBypassSensitiveLOICheck"];
  if (v17)
  {

LABEL_18:
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[RTSensitiveDateClassifier _isNearSensitiveLocation:]";
    char v9 = "%s, bypassing sensitive LOI check via user defaults or feature flag";
    goto LABEL_6;
  }
  char v18 = _os_feature_enabled_impl();

  if (v18) {
    goto LABEL_18;
  }
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v4];
  uint64_t v42 = 0;
  dispatch_queue_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  objc_super v53 = __Block_byref_object_copy__32;
  uint64_t v54 = __Block_byref_object_dispose__32;
  id v55 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__32;
  uint64_t v40 = __Block_byref_object_dispose__32;
  id v41 = 0;
  sensitiveLocations = self->_sensitiveLocations;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __54__RTSensitiveDateClassifier__isNearSensitiveLocation___block_invoke;
  id v29 = &unk_1E6B93BC0;
  uint64_t v30 = self;
  id v8 = v21;
  char v31 = v8;
  id v33 = &v36;
  v34 = &v42;
  uint64_t v35 = buf;
  id v23 = v4;
  id v32 = v23;
  [(NSArray *)sensitiveLocations enumerateObjectsUsingBlock:&v26];
  if (*(void *)(*(void *)&buf[8] + 40)) {
    -[RTSensitiveDateClassifier setNearSensitiveLocationDetectionDate:](self, "setNearSensitiveLocationDetectionDate:", v26, v27, v28, v29, v30, v31);
  }
  if (v37[5])
  {
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = v37[5];
      *(_DWORD *)uint64_t v46 = 136315650;
      uint64_t v47 = "-[RTSensitiveDateClassifier _isNearSensitiveLocation:]";
      __int16 v48 = 2112;
      uint64_t v49 = v25;
      __int16 v50 = 2112;
      id v51 = v23;
      _os_log_debug_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEBUG, "%s, error for near sensitive location check: error, %@, location, %@", v46, 0x20u);
    }

    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = *((unsigned char *)v43 + 24) != 0;
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v42, 8);
LABEL_8:

  return v10;
}

void __54__RTSensitiveDateClassifier__isNearSensitiveLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(*(void *)(a1 + 32) + 16);
  char v9 = [v6 location];
  BOOL v10 = [v9 location];
  id v24 = 0;
  [v8 distanceFromLocation:v7 toLocation:v10 error:&v24];
  double v12 = v11;
  id v13 = v24;
  id v14 = v24;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v13);
  if (v12 <= 1000.0)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = [v6 location];
      char v18 = [v17 location];
      *(_DWORD *)long long buf = 136315906;
      uint64_t v26 = "-[RTSensitiveDateClassifier _isNearSensitiveLocation:]_block_invoke";
      __int16 v27 = 2112;
      uint64_t v28 = v16;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      __int16 v31 = 2048;
      double v32 = v12;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%s, near sensitive location detected, currentLocation, %@, sensitiveLocation, %@, distance, %.2f", buf, 0x2Au);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    uint64_t v19 = [*(id *)(a1 + 40) date];
    uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    *a4 = 1;
    __int16 v22 = [*(id *)(a1 + 32) metrics];
    id v23 = [*(id *)(a1 + 48) timestamp];
    [v22 processSignal:2 date:v23];
  }
}

- (id)_locationsForOptions:(id)a3
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v47 = 0;
  __int16 v48 = (id *)&v47;
  uint64_t v49 = 0x3032000000;
  __int16 v50 = __Block_byref_object_copy__32;
  id v51 = __Block_byref_object_dispose__32;
  id v52 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__32;
  char v45 = __Block_byref_object_dispose__32;
  id v46 = (id)objc_opt_new();
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  locationManager = self->_locationManager;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __50__RTSensitiveDateClassifier__locationsForOptions___block_invoke;
  v37[3] = &unk_1E6B905F0;
  uint64_t v39 = &v47;
  uint64_t v40 = &v41;
  uint64_t v7 = v5;
  uint64_t v38 = v7;
  [(RTLocationManager *)locationManager fetchStoredLocationsWithOptions:v4 handler:v37];
  id v8 = v7;
  char v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10)) {
    goto LABEL_6;
  }
  double v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  id v14 = objc_opt_new();
  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_26];
  uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v17 = [v16 filteredArrayUsingPredicate:v15];
  char v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
  v62[0] = *MEMORY[0x1E4F28568];
  *(void *)long long buf = @"semaphore wait timeout";
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v62 count:1];
  __int16 v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

  if (v22)
  {
    id v23 = v22;

    char v24 = 0;
  }
  else
  {
LABEL_6:
    id v23 = 0;
    char v24 = 1;
  }

  id v25 = v23;
  if ((v24 & 1) == 0) {
    objc_storeStrong(v48 + 5, v23);
  }
  uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v36 = [(id)v42[5] count];
    __int16 v29 = [v4 dateInterval];
    uint64_t v30 = [v29 startDate];
    id v31 = [v30 stringFromDate];
    double v32 = [v4 dateInterval];
    uint64_t v33 = [v32 endDate];
    v34 = [v33 stringFromDate];
    id v35 = v48[5];
    *(_DWORD *)long long buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[RTSensitiveDateClassifier _locationsForOptions:]";
    __int16 v54 = 2048;
    uint64_t v55 = v36;
    __int16 v56 = 2112;
    id v57 = v31;
    __int16 v58 = 2112;
    v59 = v34;
    __int16 v60 = 2112;
    id v61 = v35;
    _os_log_debug_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_DEBUG, "%s, Fetched %lu locations, batch from, %@, to, %@, error, %@", buf, 0x34u);
  }
  if (v48[5]) {
    id v27 = 0;
  }
  else {
    id v27 = (id)v42[5];
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v27;
}

void __50__RTSensitiveDateClassifier__locationsForOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_motionsForDateInterval:(id)a3
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v47 = 0;
  __int16 v48 = (id *)&v47;
  uint64_t v49 = 0x3032000000;
  __int16 v50 = __Block_byref_object_copy__32;
  id v51 = __Block_byref_object_dispose__32;
  id v52 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__32;
  char v45 = __Block_byref_object_dispose__32;
  id v46 = (id)objc_opt_new();
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  motionActivityManager = self->_motionActivityManager;
  uint64_t v7 = [v4 startDate];
  id v8 = [v4 endDate];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __53__RTSensitiveDateClassifier__motionsForDateInterval___block_invoke;
  v37[3] = &unk_1E6B905F0;
  uint64_t v39 = &v41;
  uint64_t v40 = &v47;
  id v9 = v5;
  uint64_t v38 = v9;
  [(RTMotionActivityManager *)motionActivityManager fetchMotionActivitiesFromStartDate:v7 endDate:v8 handler:v37];

  dispatch_time_t v10 = v9;
  double v11 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12)) {
    goto LABEL_6;
  }
  double v13 = [MEMORY[0x1E4F1C9C8] now];
  [v13 timeIntervalSinceDate:v11];
  double v15 = v14;
  uint64_t v16 = objc_opt_new();
  uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_26];
  char v18 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v19 = [v18 filteredArrayUsingPredicate:v17];
  uint64_t v20 = [v19 firstObject];

  [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
  uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  __int16 v22 = (void *)MEMORY[0x1E4F28C58];
  v62[0] = *MEMORY[0x1E4F28568];
  *(void *)long long buf = @"semaphore wait timeout";
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v62 count:1];
  char v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

  if (v24)
  {
    id v25 = v24;

    char v26 = 0;
  }
  else
  {
LABEL_6:
    id v25 = 0;
    char v26 = 1;
  }

  id v27 = v25;
  if ((v26 & 1) == 0) {
    objc_storeStrong(v48 + 5, v25);
  }
  uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = [(id)v42[5] count];
    double v32 = [v4 startDate];
    id v33 = [v32 stringFromDate];
    v34 = [v4 endDate];
    id v35 = [v34 stringFromDate];
    id v36 = v48[5];
    *(_DWORD *)long long buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[RTSensitiveDateClassifier _motionsForDateInterval:]";
    __int16 v54 = 2048;
    uint64_t v55 = v31;
    __int16 v56 = 2112;
    id v57 = v33;
    __int16 v58 = 2112;
    v59 = v35;
    __int16 v60 = 2112;
    id v61 = v36;
    _os_log_debug_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_DEBUG, "%s, Fetched %lu motion activities, batch from, %@, to, %@, error, %@", buf, 0x34u);
  }
  if (v48[5]) {
    id v29 = 0;
  }
  else {
    id v29 = (id)v42[5];
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v29;
}

void __53__RTSensitiveDateClassifier__motionsForDateInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_sensitiveLocationsOfInterestWithError:(id *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  double v32 = [MEMORY[0x1E4F1CA48] array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v3 = [&unk_1F3452A90 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v3)
  {
    uint64_t v35 = *(void *)v55;
    uint64_t v33 = *MEMORY[0x1E4F5CFE8];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    while (2)
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v55 != v35) {
          objc_enumerationMutation(&unk_1F3452A90);
        }
        id v5 = *(void **)(*((void *)&v54 + 1) + 8 * v4);
        uint64_t v48 = 0;
        uint64_t v49 = (id *)&v48;
        uint64_t v50 = 0x3032000000;
        id v51 = __Block_byref_object_copy__32;
        id v52 = __Block_byref_object_dispose__32;
        id v53 = 0;
        uint64_t v42 = 0;
        uint64_t v43 = &v42;
        uint64_t v44 = 0x3032000000;
        char v45 = __Block_byref_object_copy__32;
        id v46 = __Block_byref_object_dispose__32;
        id v47 = 0;
        dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
        learnedLocationStore = self->_learnedLocationStore;
        uint64_t v8 = [v5 unsignedIntegerValue];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __68__RTSensitiveDateClassifier__sensitiveLocationsOfInterestWithError___block_invoke;
        v38[3] = &unk_1E6B928A8;
        v38[4] = v5;
        uint64_t v40 = &v48;
        uint64_t v41 = &v42;
        uint64_t v9 = v6;
        uint64_t v39 = v9;
        [(RTLearnedLocationStore *)learnedLocationStore fetchLocationsOfInterestWithPlaceType:v8 handler:v38];
        dispatch_time_t v10 = v9;
        id v11 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v12 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v10, v12)) {
          goto LABEL_11;
        }
        double v13 = [MEMORY[0x1E4F1C9C8] now];
        [v13 timeIntervalSinceDate:v11];
        double v15 = v14;
        uint64_t v16 = objc_opt_new();
        uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_26];
        char v18 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v19 = [v18 filteredArrayUsingPredicate:v17];
        uint64_t v20 = [v19 firstObject];

        [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
        uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        __int16 v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v59 = v34;
        *(void *)long long buf = @"semaphore wait timeout";
        id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v59 count:1];
        char v24 = [v22 errorWithDomain:v33 code:15 userInfo:v23];

        if (v24)
        {
          id v25 = v24;

          char v26 = 0;
        }
        else
        {
LABEL_11:
          id v25 = 0;
          char v26 = 1;
        }

        id v27 = v25;
        if ((v26 & 1) == 0) {
          objc_storeStrong(v49 + 5, v25);
        }
        id v28 = v49[5];
        if (v28)
        {
          if (a3) {
            *a3 = v28;
          }
        }
        else if (v43[5])
        {
          [v32 addObjectsFromArray:];
        }

        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v48, 8);

        if (v28)
        {
          id v30 = 0;
          id v29 = v32;
          goto LABEL_24;
        }
        ++v4;
      }
      while (v3 != v4);
      uint64_t v3 = [&unk_1F3452A90 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  id v29 = v32;
  id v30 = v32;
LABEL_24:

  return v30;
}

void __68__RTSensitiveDateClassifier__sensitiveLocationsOfInterestWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v5 count];
    uint64_t v9 = [*(id *)(a1 + 32) unsignedIntegerValue];
    int v16 = 136315650;
    uint64_t v17 = "-[RTSensitiveDateClassifier _sensitiveLocationsOfInterestWithError:]_block_invoke";
    __int16 v18 = 2048;
    uint64_t v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = v9;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, fetched %lu learned location of interest from learned location store, of placeType, %lu", (uint8_t *)&v16, 0x20u);
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  double v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
  id v15 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_sensitiveMotionSignalDetectedForMotion:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 type] != 4) {
    goto LABEL_6;
  }
  [v9 timeIntervalSinceDate:v8];
  double v11 = v10;
  if (v10 >= 180.0 && [v7 confidence] == 3)
  {
LABEL_12:
    BOOL v12 = 1;
    goto LABEL_13;
  }
  if (v11 >= 240.0)
  {
    uint64_t v13 = [v7 confidence];
    if (v11 < 300.0 && v13 != 2) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
  if (v11 >= 300.0) {
    goto LABEL_12;
  }
LABEL_6:
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (id)_compareWorkoutStartDateToLookbackWindowStartDate:(id)a3 motionLookbackWindowStartDate:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTSensitiveDateClassifier *)self latestWorkoutDateInterval];
  id v9 = [v8 startDate];

  double v10 = [(RTSensitiveDateClassifier *)self latestWorkoutDateInterval];
  double v11 = [v10 endDate];

  BOOL v12 = [(RTSensitiveDateClassifier *)self nearSensitiveLocationDetectionDate];
  if (v12)
  {
    uint64_t v13 = [(RTSensitiveDateClassifier *)self nearSensitiveLocationDetectionDate];
    id v14 = [v13 laterDate:v7];
  }
  else
  {
    id v14 = v7;
  }

  id v15 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = [v9 stringFromDate];
    [v11 stringFromDate];
    id v34 = v6;
    uint64_t v17 = v35 = v9;
    __int16 v18 = [(RTSensitiveDateClassifier *)self nearSensitiveLocationDetectionDate];
    uint64_t v19 = [v18 stringFromDate];
    [v7 stringFromDate];
    __int16 v20 = v33 = v11;
    [v14 stringFromDate];
    id v21 = v14;
    id v23 = v22 = v7;
    *(_DWORD *)long long buf = 136316418;
    uint64_t v37 = "-[RTSensitiveDateClassifier _compareWorkoutStartDateToLookbackWindowStartDate:motionLookbackWindowStartDate:]";
    __int16 v38 = 2112;
    uint64_t v39 = v16;
    __int16 v40 = 2112;
    uint64_t v41 = v17;
    __int16 v42 = 2112;
    uint64_t v43 = v19;
    __int16 v44 = 2112;
    char v45 = v20;
    __int16 v46 = 2112;
    id v47 = v23;
    _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%s, workoutStartDate, %@, workoutEndDate, %@, nearSensitiveLocationDetectionDate, %@, motionLookbackWindowStartDate, %@, gatingSignalStartDate, %@", buf, 0x3Eu);

    id v7 = v22;
    id v14 = v21;

    double v11 = v33;
    id v6 = v34;
    id v9 = v35;
  }
  uint64_t v24 = [(RTSensitiveDateClassifier *)self latestWorkoutDateInterval];
  if (!v24) {
    goto LABEL_18;
  }
  id v25 = (void *)v24;
  uint64_t v26 = [v6 compare:v9];

  if (v26 == -1) {
    goto LABEL_18;
  }
  if (!v11 || [v11 compare:v14] != -1)
  {
    id v27 = [v9 laterDate:v14];
    goto LABEL_19;
  }
  BOOL v28 = [(RTSensitiveDateClassifier *)self inWifiDenseArea];
  id v29 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
  if (!v28)
  {
    if (v30)
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v37 = "-[RTSensitiveDateClassifier _compareWorkoutStartDateToLookbackWindowStartDate:motionLookbackWindowStartDate:]";
      _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%s, workout end date precedes sensitive LOI or driving motion, lookbackWindowStartDate not altered", buf, 0xCu);
    }

LABEL_18:
    id v27 = v6;
    goto LABEL_19;
  }
  if (v30)
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v37 = "-[RTSensitiveDateClassifier _compareWorkoutStartDateToLookbackWindowStartDate:motionLookbackWindowStartDate:]";
    _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%s, workout end date precedes sensitive LOI or driving motion, returning current date due to wifi dense area detection", buf, 0xCu);
  }

  id v27 = [MEMORY[0x1E4F1C9C8] date];
LABEL_19:
  uint64_t v31 = v27;

  return v31;
}

- (BOOL)_accessPointsConditionsMet
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RTSensitiveDateClassifier *)self accessPoints];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(RTSensitiveDateClassifier *)self accessPoints],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [(RTSensitiveDateClassifier *)self accessPoints];
      uint64_t v9 = [v8 count];
      double v10 = [(RTSensitiveDateClassifier *)self accessPoints];
      *(_DWORD *)long long buf = 136315650;
      uint64_t v26 = "-[RTSensitiveDateClassifier _accessPointsConditionsMet]";
      __int16 v27 = 2048;
      uint64_t v28 = v9;
      __int16 v29 = 2112;
      BOOL v30 = v10;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, wifi access points count, %lu, accessPoints, %@", buf, 0x20u);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    double v11 = [(RTSensitiveDateClassifier *)self accessPoints];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      unint64_t v14 = 0;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v11);
          }
          if ([*(id *)(*((void *)&v20 + 1) + 8 * i) rssi] > -96) {
            ++v14;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }
    else
    {
      unint64_t v14 = 0;
    }

    uint64_t v19 = [(RTSensitiveDateClassifier *)self metrics];
    [v19 updateWifiAccessPointCount:v14];

    return v14 > 7;
  }
  else
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v26 = "-[RTSensitiveDateClassifier _accessPointsConditionsMet]";
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%s, no wifi access points received", buf, 0xCu);
    }

    return 0;
  }
}

- (void)_processWifiScanResults
{
  uint64_t v3 = [(RTSensitiveDateClassifier *)self wifiDenseHandler];

  if (v3)
  {
    [(RTSensitiveDateClassifier *)self _stopMonitoringWifiScans];
    uint64_t v4 = [(RTSensitiveDateClassifier *)self wifiDenseHandler];
    ((void (**)(void, BOOL))v4)[2](v4, [(RTSensitiveDateClassifier *)self _accessPointsConditionsMet]);

    [(RTSensitiveDateClassifier *)self setWifiDenseHandler:0];
  }
}

- (void)_stopMonitoringWifiScans
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RTSensitiveDateClassifier *)self wifiManager];
  [v3 cancelScan];

  uint64_t v4 = [(RTSensitiveDateClassifier *)self wifiManager];
  id v5 = +[RTNotification notificationName];
  [v4 removeObserver:self fromNotification:v5];

  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySensitiveDate);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[RTSensitiveDateClassifier _stopMonitoringWifiScans]";
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, stop monitoring for wifi scan results", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(RTSensitiveDateClassifier *)self wifiScanTimer];
  [v7 invalidate];

  [(RTSensitiveDateClassifier *)self setWifiScanTimer:0];
}

- (void)onWifiScanResultsNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTSensitiveDateClassifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__RTSensitiveDateClassifier_onWifiScanResultsNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__RTSensitiveDateClassifier_onWifiScanResultsNotification___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [*(id *)(a1 + 32) scanResults];
    uint64_t v2 = [*(id *)(a1 + 40) accessPoints];
    [v2 addObjectsFromArray:v3];

    [*(id *)(a1 + 40) _processWifiScanResults];
  }
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTSensitiveDateClassifierMetrics)metrics
{
  return self->_metrics;
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)inWifiDenseArea
{
  return self->_inWifiDenseArea;
}

- (void)setInWifiDenseArea:(BOOL)a3
{
  self->_inWifiDenseArea = a3;
}

- (NSDateInterval)latestWorkoutDateInterval
{
  return self->_latestWorkoutDateInterval;
}

- (void)setLatestWorkoutDateInterval:(id)a3
{
}

- (NSArray)sensitiveLocations
{
  return self->_sensitiveLocations;
}

- (void)setSensitiveLocations:(id)a3
{
}

- (NSDate)nearSensitiveLocationDetectionDate
{
  return self->_nearSensitiveLocationDetectionDate;
}

- (void)setNearSensitiveLocationDetectionDate:(id)a3
{
}

- (NSMutableArray)accessPoints
{
  return self->_accessPoints;
}

- (void)setAccessPoints:(id)a3
{
}

- (RTTimer)wifiScanTimer
{
  return self->_wifiScanTimer;
}

- (void)setWifiScanTimer:(id)a3
{
}

- (id)wifiDenseHandler
{
  return self->_wifiDenseHandler;
}

- (void)setWifiDenseHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wifiDenseHandler, 0);
  objc_storeStrong((id *)&self->_wifiScanTimer, 0);
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_nearSensitiveLocationDetectionDate, 0);
  objc_storeStrong((id *)&self->_sensitiveLocations, 0);
  objc_storeStrong((id *)&self->_latestWorkoutDateInterval, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);

  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end