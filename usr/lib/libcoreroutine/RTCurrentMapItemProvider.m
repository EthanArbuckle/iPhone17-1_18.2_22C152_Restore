@interface RTCurrentMapItemProvider
+ (id)convertMapItemsToPredictedLocationsOfInterest:(id)a3;
+ (void)logMapItems:(id)a3 prestring:(id)a4;
+ (void)logPredictedLocationsOfInterest:(id)a3 prestring:(id)a4;
- (BOOL)registeredForNotifications;
- (NSMutableArray)futureAccessPoints;
- (NSMutableArray)futureLocations;
- (OS_dispatch_queue)queue;
- (RTCurrentMapItemProvider)init;
- (RTCurrentMapItemProvider)initWithFingerprintManager:(id)a3 locationManager:(id)a4 mapServiceManager:(id)a5 wifiManager:(id)a6;
- (RTFingerprintManager)fingerprintManager;
- (RTLocationManager)locationManager;
- (RTMapServiceManager)mapServiceManager;
- (RTWiFiManager)wifiManager;
- (id)_filterLocations:(id)a3;
- (id)_filterWiFiAccessPoints:(id)a3;
- (id)_pickMinimumHorizontalUncertainty:(id)a3;
- (void)_fetchCurrentMapItemsLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5;
- (void)_performBluePOIQueryLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5;
- (void)_shutdown;
- (void)fetchCurrentMapItemsLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5;
- (void)onLocationNotification:(id)a3;
- (void)onWiFiScanNotification:(id)a3;
- (void)performBluePOIQueryLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5;
- (void)setRegisteredForNotifications:(BOOL)a3;
- (void)shutdown;
@end

@implementation RTCurrentMapItemProvider

- (RTCurrentMapItemProvider)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithFingerprintManager_locationManager_mapServiceManager_wifiManager_);
}

- (RTCurrentMapItemProvider)initWithFingerprintManager:(id)a3 locationManager:(id)a4 mapServiceManager:(id)a5 wifiManager:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[RTCurrentMapItemProvider initWithFingerprintManager:locationManager:mapServiceManager:wifiManager:]";
      __int16 v32 = 1024;
      int v33 = 121;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fingerprintManager (in %s:%d)", buf, 0x12u);
    }

    if (v12)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_17:
      v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "-[RTCurrentMapItemProvider initWithFingerprintManager:locationManager:mapServiceManager:wifiManager:]";
        __int16 v32 = 1024;
        int v33 = 123;
        _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager (in %s:%d)", buf, 0x12u);
      }

      if (v14) {
        goto LABEL_5;
      }
      goto LABEL_20;
    }
  }
  v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[RTCurrentMapItemProvider initWithFingerprintManager:locationManager:mapServiceManager:wifiManager:]";
    __int16 v32 = 1024;
    int v33 = 122;
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager (in %s:%d)", buf, 0x12u);
  }

  if (!v13) {
    goto LABEL_17;
  }
LABEL_4:
  if (v14)
  {
LABEL_5:
    v15 = 0;
    if (v11 && v12 && v13)
    {
      v29.receiver = self;
      v29.super_class = (Class)RTCurrentMapItemProvider;
      v16 = [(RTCurrentMapItemProvider *)&v29 init];
      if (v16)
      {
        id v17 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v16];
        id v28 = a6;
        v18 = (const char *)[v17 UTF8String];
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v19 = id obj = a5;
        dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
        queue = v16->_queue;
        v16->_queue = (OS_dispatch_queue *)v20;

        objc_storeStrong((id *)&v16->_fingerprintManager, a3);
        objc_storeStrong((id *)&v16->_locationManager, a4);
        objc_storeStrong((id *)&v16->_mapServiceManager, obj);
        objc_storeStrong((id *)&v16->_wifiManager, v28);
      }
      self = v16;
      v15 = self;
    }
    goto LABEL_23;
  }
LABEL_20:
  v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[RTCurrentMapItemProvider initWithFingerprintManager:locationManager:mapServiceManager:wifiManager:]";
    __int16 v32 = 1024;
    int v33 = 124;
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: wifiManager (in %s:%d)", buf, 0x12u);
  }

  v15 = 0;
LABEL_23:

  return v15;
}

+ (id)convertMapItemsToPredictedLocationsOfInterest:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v29 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v9 = [RTLearnedPlace alloc];
        v10 = [MEMORY[0x1E4F29128] UUID];
        id v11 = [MEMORY[0x1E4F1C9C8] date];
        id v12 = [MEMORY[0x1E4F1C9C8] date];
        id v13 = [(RTLearnedPlace *)v9 initWithIdentifier:v10 type:0 typeSource:0 mapItem:v8 customLabel:0 creationDate:v11 expirationDate:v12];

        id v14 = objc_alloc(MEMORY[0x1E4F5CE00]);
        v15 = [v8 location];
        [v15 latitude];
        double v17 = v16;
        v18 = [v8 location];
        [v18 longitude];
        dispatch_queue_t v20 = (void *)[v14 initWithLatitude:0 longitude:v17 horizontalUncertainty:v19 date:100.0];

        v21 = [[RTLearnedLocation alloc] initWithLocation:v20 dataPointCount:0 type:2];
        v22 = [RTLearnedLocationOfInterest alloc];
        v23 = [MEMORY[0x1E4F29128] UUID];
        v24 = [(RTLearnedLocationOfInterest *)v22 initWithIdentifier:v23 location:v21 place:v13 visits:0 transitions:0];

        v25 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithLearnedLocationOfInterest:v24];
        v26 = (void *)[objc_alloc(MEMORY[0x1E4F5CEA0]) initWithLocationOfInterest:v25 confidence:0 nextEntryTime:0 modeOfTransportation:0 sources:0.0];
        [v29 addObject:v26];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v5);
  }

  return v29;
}

+ (void)logMapItems:(id)a3 prestring:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v6;
      __int16 v25 = 2048;
      uint64_t v26 = [v5 count];
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@ %lu RTMapItems", buf, 0x16u);
    }
    id v16 = v6;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v15 = _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            ++v11;
            *(_DWORD *)buf = 134218242;
            id v24 = v11;
            __int16 v25 = 2112;
            uint64_t v26 = v14;
            _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "RTMapItem %lu, %@", buf, 0x16u);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v6 = v16;
    id v5 = v17;
  }
}

+ (void)logPredictedLocationsOfInterest:(id)a3 prestring:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v6;
      __int16 v25 = 2048;
      uint64_t v26 = [v5 count];
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@ %lu RTPredictedLocationsOfInterest", buf, 0x16u);
    }
    id v16 = v6;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v15 = _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            ++v11;
            *(_DWORD *)buf = 134218242;
            id v24 = v11;
            __int16 v25 = 2112;
            uint64_t v26 = v14;
            _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "RTPredictedLocationOfInterest %lu, %@", buf, 0x16u);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v6 = v16;
    id v5 = v17;
  }
}

- (void)setRegisteredForNotifications:(BOOL)a3
{
  if (self->_registeredForNotifications != a3)
  {
    self->_registeredForNotifications = a3;
    locationManager = self->_locationManager;
    if (a3)
    {
      id v5 = +[RTNotification notificationName];
      [(RTNotifier *)locationManager addObserver:self selector:sel_onLocationNotification_ name:v5];

      wifiManager = self->_wifiManager;
      id v9 = +[RTNotification notificationName];
      -[RTNotifier addObserver:selector:name:](wifiManager, "addObserver:selector:name:", self, sel_onWiFiScanNotification_);
    }
    else
    {
      v7 = +[RTNotification notificationName];
      [(RTNotifier *)locationManager removeObserver:self fromNotification:v7];

      id v8 = self->_wifiManager;
      id v9 = +[RTNotification notificationName];
      -[RTNotifier removeObserver:fromNotification:](v8, "removeObserver:fromNotification:", self);
    }
  }
}

- (id)_filterLocations:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)_filterWiFiAccessPoints:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)_pickMinimumHorizontalUncertainty:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v9 horizontalUncertainty];
        if (v10 > 0.0)
        {
          if (v6)
          {
            [v9 horizontalUncertainty];
            double v12 = v11;
            [v6 horizontalUncertainty];
            if (v12 < v13)
            {
              id v14 = v9;

              id v6 = v14;
            }
          }
          else
          {
            id v6 = v9;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_fetchCurrentMapItemsLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__RTCurrentMapItemProvider__fetchCurrentMapItemsLookingBack_lookingAhead_handler___block_invoke;
  v11[3] = &unk_1E6B970A8;
  id v12 = v8;
  id v9 = v8;
  double v10 = (void *)MEMORY[0x1E016DB00](v11);
  [(RTCurrentMapItemProvider *)self _performBluePOIQueryLookingBack:v10 lookingAhead:a3 handler:a4];
}

uint64_t __82__RTCurrentMapItemProvider__fetchCurrentMapItemsLookingBack_lookingAhead_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCurrentMapItemsLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (v8)
  {
    id v9 = [(RTCurrentMapItemProvider *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__RTCurrentMapItemProvider_fetchCurrentMapItemsLookingBack_lookingAhead_handler___block_invoke;
    v11[3] = &unk_1E6B925A0;
    void v11[4] = self;
    double v13 = a3;
    double v14 = a4;
    id v12 = v8;
    dispatch_async(v9, v11);
  }
  else
  {
    double v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v16 = "-[RTCurrentMapItemProvider fetchCurrentMapItemsLookingBack:lookingAhead:handler:]";
      __int16 v17 = 1024;
      int v18 = 315;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __81__RTCurrentMapItemProvider_fetchCurrentMapItemsLookingBack_lookingAhead_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCurrentMapItemsLookingBack:*(void *)(a1 + 40) lookingAhead:*(double *)(a1 + 48) handler:*(double *)(a1 + 56)];
}

- (void)_performBluePOIQueryLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (v8)
  {
    if (a3 < 0.0 || a4 < 0.0)
    {
      double v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v58 = *MEMORY[0x1E4F28568];
      v15 = [NSString stringWithFormat:@"Requires nonnegative numbers for backwardsSeconds and forwardsSeconds"];
      v59[0] = v15;
      long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&v58 count:1];
      __int16 v17 = [v14 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v16];
      (*((void (**)(id, void, void, void, void *))v8 + 2))(v8, 0, 0, 0, v17);
    }
    else if ([(RTCurrentMapItemProvider *)self registeredForNotifications])
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      double v10 = [NSString stringWithFormat:@"%@ is busy", self];
      v57 = v10;
      double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      id v12 = [v9 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v11];
      (*((void (**)(id, void, void, void, void *))v8 + 2))(v8, 0, 0, 0, v12);
    }
    else
    {
      int v18 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v19 = [v18 dateByAddingTimeInterval:-a3];
      long long v20 = [MEMORY[0x1E4F1CA48] array];
      futureLocations = self->_futureLocations;
      self->_futureLocations = v20;

      v22 = [MEMORY[0x1E4F1CA48] array];
      futureAccessPoints = self->_futureAccessPoints;
      self->_futureAccessPoints = v22;

      [(RTCurrentMapItemProvider *)self setRegisteredForNotifications:1];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v53 = __Block_byref_object_copy__74;
      v54 = __Block_byref_object_dispose__74;
      id v55 = 0;
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x3032000000;
      v50[3] = __Block_byref_object_copy__74;
      v50[4] = __Block_byref_object_dispose__74;
      id v51 = 0;
      id v24 = dispatch_group_create();
      dispatch_group_enter(v24);
      __int16 v25 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v19 endDate:v18];
      uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F5CF40]) initWithDateInterval:v25 horizontalAccuracy:199 batchSize:0 boundingBoxLocation:199.0];
      locationManager = self->_locationManager;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke;
      v47[3] = &unk_1E6B91290;
      v47[4] = self;
      v49 = buf;
      id v28 = v24;
      v48 = v28;
      [(RTLocationManager *)locationManager fetchStoredLocationsWithOptions:v26 handler:v47];
      dispatch_group_enter(v28);
      fingerprintManager = self->_fingerprintManager;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_3;
      v44[3] = &unk_1E6B91290;
      v44[4] = self;
      v46 = v50;
      long long v30 = v28;
      v45 = v30;
      [(RTFingerprintManager *)fingerprintManager fetchFingerprintsBetweenStartDate:v19 endDate:v18 filteredBySettledState:2 handler:v44];
      dispatch_time_t v31 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      long long v32 = [(RTCurrentMapItemProvider *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_5;
      block[3] = &unk_1E6B97170;
      v37 = v30;
      v38 = self;
      v42 = buf;
      v43 = v50;
      id v39 = v19;
      id v40 = v18;
      id v41 = v8;
      id v33 = v18;
      id v34 = v19;
      uint64_t v35 = v30;
      dispatch_after(v31, v32, block);

      _Block_object_dispose(v50, 8);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTCurrentMapItemProvider _performBluePOIQueryLookingBack:lookingAhead:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 338;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_2;
  block[3] = &unk_1E6B970D0;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[*(id *)(a1 + 32) count]];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        double v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        id v12 = objc_alloc(MEMORY[0x1E4F5CE00]);
        double v13 = [v12 initWithCLLocation:v10];
        [v11 addObject:v13];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_4;
  block[3] = &unk_1E6B970D0;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        double v11 = [[*(id *)(*((void *)&v12 + 1) + 8 * v9) accessPoints:v12];
        [v10 addObjectsFromArray:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_6;
  v5[3] = &unk_1E6B97148;
  uint64_t v4 = *(void **)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 72);
  id v6 = v4;
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  dispatch_group_notify(v2, v3, v5);
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_6(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) setRegisteredForNotifications:0];
  id v3 = *(id *)(*((void *)v2[4] + 1) + 40);
  id v4 = *(id *)(*((void *)v2[5] + 1) + 40);
  [v3 addObjectsFromArray:*((void *)*v2 + 7)];
  [v4 addObjectsFromArray:*((void *)*v2 + 8)];
  id v5 = (void *)*((void *)*v2 + 7);
  *((void *)*v2 + 7) = 0;

  id v6 = (void *)*((void *)*v2 + 8);
  *((void *)*v2 + 8) = 0;

  id v29 = v3;
  id v7 = [*v2 _filterLocations:v3];
  id v8 = [*v2 _filterWiFiAccessPoints:v4];
  id v9 = v4;
  id v10 = v7;
  id v11 = v8;
  logArrayRTLocations(@"Preprocessed Locations", v29);
  logArrayRTWiFiAccessPoints(@"Preprocessed Access Points", v9);
  id v28 = v9;

  logArrayRTLocations(@"Processed Locations", v10);
  logArrayRTWiFiAccessPoints(@"Processed Access Points", v11);

  id v12 = [*v2 _pickMinimumHorizontalUncertainty:v10];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    long long v13 = _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = @"Reference Location:";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@: %@", buf, 0x16u);
    }
  }
  if (v12)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v14 addObject:v12];
    [v14 addObjectsFromArray:v10];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__74;
    v46 = __Block_byref_object_dispose__74;
    id v47 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__74;
    v40[4] = __Block_byref_object_dispose__74;
    id v41 = 0;
    long long v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_7;
    v36[3] = &unk_1E6B928A8;
    v36[4] = *(void *)(a1 + 32);
    v38 = buf;
    id v39 = v40;
    long long v16 = v15;
    v37 = v16;
    uint64_t v17 = (void *)MEMORY[0x1E016DB00](v36);
    id v18 = objc_alloc(MEMORY[0x1E4F5CE48]);
    uint64_t v19 = (objc_class *)objc_opt_class();
    long long v20 = NSStringFromClass(v19);
    uint64_t v21 = (void *)[v18 initWithUseBackgroundTraits:1 analyticsIdentifier:v20];

    [*(id *)(*(void *)(a1 + 32) + 40) fetchMapItemsFromLocations:v14 accessPoints:v11 startDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) options:v21 handler:v17];
    v22 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_9;
    block[3] = &unk_1E6B97120;
    id v31 = v14;
    id v33 = *(id *)(a1 + 56);
    id v32 = v11;
    id v34 = buf;
    uint64_t v35 = v40;
    id v23 = v14;
    dispatch_group_notify(v16, v22, block);

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 56);
    __int16 v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28568];
    v43 = @"Nil reference location.";
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    uint64_t v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v26];
    (*(void (**)(uint64_t, void, void, void, void *))(v24 + 16))(v24, 0, 0, 0, v27);
  }
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_8;
  block[3] = &unk_1E6B970F8;
  uint64_t v16 = *(void *)(a1 + 56);
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_8(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
  uint64_t v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

void __81__RTCurrentMapItemProvider__performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke_9(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        id v9 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        id v10 = [v9 initWithRTLocation:v8, v11];
        [v2 addObject:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)performBluePOIQueryLookingBack:(double)a3 lookingAhead:(double)a4 handler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (v8)
  {
    id v9 = [(RTCurrentMapItemProvider *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__RTCurrentMapItemProvider_performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke;
    v11[3] = &unk_1E6B925A0;
    void v11[4] = self;
    double v13 = a3;
    double v14 = a4;
    id v12 = v8;
    dispatch_async(v9, v11);
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[RTCurrentMapItemProvider performBluePOIQueryLookingBack:lookingAhead:handler:]";
      __int16 v17 = 1024;
      int v18 = 479;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __80__RTCurrentMapItemProvider_performBluePOIQueryLookingBack_lookingAhead_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performBluePOIQueryLookingBack:*(void *)(a1 + 40) lookingAhead:*(double *)(a1 + 48) handler:*(double *)(a1 + 56)];
}

- (void)onLocationNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTCurrentMapItemProvider *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__RTCurrentMapItemProvider_onLocationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__RTCurrentMapItemProvider_onLocationNotification___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) name];
  id v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqual:v3];

  if (v4)
  {
    uint64_t v5 = *(id *)(a1 + 32);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = [v5 locations];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*(void *)(a1 + 40) + 56);
          id v12 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:*(void *)(*((void *)&v14 + 1) + 8 * v10)];
          [v11 addObject:v12];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      double v13 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unhandled notification, %@", buf, 0xCu);
    }
  }
}

- (void)onWiFiScanNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTCurrentMapItemProvider *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__RTCurrentMapItemProvider_onWiFiScanNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__RTCurrentMapItemProvider_onWiFiScanNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) name];
  id v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqual:v3];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = *(void **)(*(void *)(a1 + 40) + 64);
    id v7 = v5;
    id v10 = [v7 scanResults];
    [v6 addObjectsFromArray:];
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityCurrentMapItem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138412290;
      id v12 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "unhandled notification, %@", buf, 0xCu);
    }
  }
}

- (void)shutdown
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__74;
  v15[4] = __Block_byref_object_dispose__74;
  int v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  id v8 = [v4 stringWithFormat:@"%@-%@", v6, v7];
  [v8 UTF8String];
  id v16 = (id)os_transaction_create();

  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    long long v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v18 = v12;
    __int16 v19 = 2112;
    long long v20 = v13;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  id v10 = [(RTCurrentMapItemProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__RTCurrentMapItemProvider_shutdown__block_invoke;
  block[3] = &unk_1E6B90E98;
  void block[4] = self;
  block[5] = v15;
  dispatch_async(v10, block);

  _Block_object_dispose(v15, 8);
}

void __36__RTCurrentMapItemProvider_shutdown__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _shutdown];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)_shutdown
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTFingerprintManager)fingerprintManager
{
  return self->_fingerprintManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (NSMutableArray)futureLocations
{
  return self->_futureLocations;
}

- (NSMutableArray)futureAccessPoints
{
  return self->_futureAccessPoints;
}

- (BOOL)registeredForNotifications
{
  return self->_registeredForNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_futureAccessPoints, 0);
  objc_storeStrong((id *)&self->_futureLocations, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_fingerprintManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end