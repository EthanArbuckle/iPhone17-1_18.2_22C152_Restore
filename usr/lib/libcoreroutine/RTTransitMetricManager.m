@interface RTTransitMetricManager
- (BOOL)isOverlappedVisit:(id)a3 locationsOfInterest:(id)a4;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTTransitMetricManager)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationManager:(id)a5 learnedLocationStore:(id)a6;
- (double)decimateDoulbe:(double)a3;
- (int64_t)decimateInteger:(int64_t)a3;
- (void)_fetchLocationsOfInterestWithPlaceTypes:(id)a3 handler:(id)a4;
- (void)_performAnalyticsWitHomeLOIs:(id)a3 workLOIs:(id)a4 handler:(id)a5;
- (void)_sendMetricsWithDevices:(id)a3 counts:(id)a4 primaryDeviceJourneyCount:(int64_t)a5 metricDurationDays:(int64_t)a6;
- (void)dealloc;
- (void)performTransitAnalyticsWithHandler:(id)a3;
@end

@implementation RTTransitMetricManager

- (RTTransitMetricManager)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationManager:(id)a5 learnedLocationStore:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (!v11)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: defaultsManager";
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_17;
  }
  if (!v12)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_16;
  }
  if (!v13)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_16;
  }
  if (!v14)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v20 = "Invalid parameter not satisfying: learnedLocationStore";
      goto LABEL_16;
    }
LABEL_17:

    v21 = 0;
    goto LABEL_18;
  }
  v28.receiver = self;
  v28.super_class = (Class)RTTransitMetricManager;
  v16 = [(RTTransitMetricManager *)&v28 init];
  if (v16)
  {
    v27 = v16;
    v17 = v16;
    attr = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (const char *)[(RTTransitMetricManager *)v17 UTF8String];
    }
    else
    {
      id v24 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v17];
      v18 = (const char *)[v24 UTF8String];
    }
    dispatch_queue_t v25 = dispatch_queue_create(v18, attr);

    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v25;

    objc_storeStrong((id *)&v17->_defaultsManager, a3);
    objc_storeStrong((id *)&v17->_distanceCalculator, a4);
    objc_storeStrong((id *)&v17->_learnedLocationManager, a5);
    objc_storeStrong((id *)&v17->_learnedLocationStore, a6);
    v16 = v27;
  }
  self = v16;
  v21 = self;
LABEL_18:

  return v21;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RTTransitMetricManager;
  [(RTTransitMetricManager *)&v2 dealloc];
}

- (BOOL)isOverlappedVisit:(id)a3 locationsOfInterest:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = a4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        distanceCalculator = self->_distanceCalculator;
        id v12 = [v10 location];
        id v13 = [v12 location];
        id v14 = [v5 location];
        v15 = [v14 location];
        id v32 = 0;
        [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v13 toLocation:v15 error:&v32];
        double v17 = v16;
        id v18 = v32;

        v19 = [v10 location];

        v20 = [v19 location];
        [v20 horizontalUncertainty];
        double v22 = v21;
        v23 = [v5 location];
        id v24 = [v23 location];
        [v24 horizontalUncertainty];
        double v26 = v22 + v25;

        double v27 = 50.0;
        if (v26 >= 50.0) {
          double v27 = v26;
        }
        if (v17 < v27)
        {
          BOOL v28 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v28 = 0;
LABEL_13:

  return v28;
}

- (void)performTransitAnalyticsWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v2 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = 5;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "TransitMetrics, max reports, %lu", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke_27;
  v5[3] = &unk_1E6B9B8F0;
  v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 _fetchLocationsOfInterestWithPlaceTypes:&unk_1F34533D8 handler:v5];
}

void __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v29 = [v5 description];
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = (uint64_t)v29;
      _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "TransitMetrics, error, home/work are not fetched, error, %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = [v34 allKeys];
      uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
      if (v35)
      {
        uint64_t v33 = *(void *)v46;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v46 != v33) {
              objc_enumerationMutation(obj);
            }
            uint64_t v36 = v7;
            uint64_t v8 = *(void **)(*((void *)&v45 + 1) + 8 * v7);
            uint64_t v9 = [v34 objectForKey:v8];
            v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v18 = [v8 unsignedIntegerValue];
              uint64_t v19 = [v9 count];
              *(_DWORD *)buf = 134218240;
              uint64_t v53 = v18;
              __int16 v54 = 2048;
              uint64_t v55 = v19;
              _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "TransitMetrics, type, %lu, lois.size, %lu", buf, 0x16u);
            }

            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            id v11 = v9;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v42;
              do
              {
                for (uint64_t i = 0; i != v13; ++i)
                {
                  if (*(void *)v42 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v16 = *(void *)(*((void *)&v41 + 1) + 8 * i);
                  double v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v53 = v16;
                    _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "TransitMetrics, loi, %@", buf, 0xCu);
                  }
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
              }
              while (v13);
            }

            uint64_t v7 = v36 + 1;
          }
          while (v36 + 1 != v35);
          uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
        }
        while (v35);
      }
    }
    v20 = [v34 objectForKey:&unk_1F34523A0];
    double v21 = [v34 objectForKey:&unk_1F34523B8];
    if ([v20 count] && objc_msgSend(v21, "count"))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      v23 = *(NSObject **)(v22 + 40);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke_32;
      block[3] = &unk_1E6B91490;
      block[4] = v22;
      id v38 = v20;
      id v39 = v21;
      id v40 = *(id *)(a1 + 40);
      dispatch_async(v23, block);
    }
    else
    {
      id v24 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = [v20 count];
        uint64_t v31 = [v21 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v53 = v30;
        __int16 v54 = 2048;
        uint64_t v55 = v31;
        _os_log_debug_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEBUG, "TransitMetrics, Home/Work LOI are not learned, Home count, %lu, Work count, %lu", buf, 0x16u);
      }

      double v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F5CFE8];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      v50 = @"Home/Work LOI are not learned.";
      double v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      BOOL v28 = [v25 errorWithDomain:v26 code:14 userInfo:v27];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke_32(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke_2;
  v4[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _performAnalyticsWitHomeLOIs:v2 workLOIs:v3 handler:v4];
}

void __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [v3 description];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "TransitMetrics, done, error, %@", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchLocationsOfInterestWithPlaceTypes:(id)a3 handler:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void, void))v7;
  double v21 = v6;
  if (!v6)
  {
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeTypes", buf, 2u);
    }
    goto LABEL_14;
  }
  if (!v7)
  {
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
LABEL_14:

    goto LABEL_19;
  }
  if ([v6 count])
  {
    v20 = v8;
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    *(void *)buf = 0;
    v37 = buf;
    uint64_t v38 = 0x3032000000;
    id v39 = __Block_byref_object_copy__144;
    id v40 = __Block_byref_object_dispose__144;
    id v41 = 0;
    v10 = dispatch_group_create();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v6;
    uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v15 = [v14 unsignedIntegerValue];
          dispatch_group_enter(v10);
          learnedLocationManager = self->_learnedLocationManager;
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __74__RTTransitMetricManager__fetchLocationsOfInterestWithPlaceTypes_handler___block_invoke;
          v27[3] = &unk_1E6B90750;
          uint64_t v31 = buf;
          id v28 = v9;
          v29 = v14;
          uint64_t v30 = v10;
          [(RTLearnedLocationManager *)learnedLocationManager fetchLocationsOfInterestWithPlaceType:v15 handler:v27];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v11);
    }

    double v17 = [(RTTransitMetricManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__RTTransitMetricManager__fetchLocationsOfInterestWithPlaceTypes_handler___block_invoke_2;
    block[3] = &unk_1E6B9B918;
    uint64_t v26 = buf;
    id v24 = v9;
    id v25 = v20;
    id v18 = v9;
    dispatch_group_notify(v10, v17, block);

    _Block_object_dispose(buf, 8);
    uint64_t v8 = (void (**)(void, void, void))v20;
  }
  else
  {
    v8[2](v8, MEMORY[0x1E4F1CC08], 0);
  }
LABEL_19:
}

void __74__RTTransitMetricManager__fetchLocationsOfInterestWithPlaceTypes_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(void *)(v7 + 40))
  {
    id v8 = v5;
    uint64_t v9 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    uint64_t v9 = _RTSafeArray();
    uint64_t v10 = _RTMultiErrorCreate();
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  if ([v13 count]) {
    [*(id *)(a1 + 32) setObject:v13 forKey:*(void *)(a1 + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __74__RTTransitMetricManager__fetchLocationsOfInterestWithPlaceTypes_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = a1 + 40;
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(*(void *)(*(void *)(v3 + 8) + 8) + 40)) {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }
}

- (void)_performAnalyticsWitHomeLOIs:(id)a3 workLOIs:(id)a4 handler:(id)a5
{
  v235[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v162 = (void (**)(void))a5;
  v179 = v8;
  v174 = v9;
  if (!v8)
  {
    long long v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: homeLois", buf, 2u);
    }
    goto LABEL_32;
  }
  if (!v9)
  {
    long long v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workLois", buf, 2u);
    }
    goto LABEL_32;
  }
  if (![v8 count])
  {
    long long v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: homeLois.count>0", buf, 2u);
    }
    goto LABEL_32;
  }
  if (![v9 count])
  {
    long long v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workLois.count>0", buf, 2u);
    }
    goto LABEL_32;
  }
  if (!v162)
  {
    long long v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
LABEL_32:

    goto LABEL_109;
  }
  uint64_t v216 = 0;
  v217 = &v216;
  uint64_t v218 = 0x3032000000;
  v219 = __Block_byref_object_copy__144;
  v220 = __Block_byref_object_dispose__144;
  id v221 = 0;
  uint64_t v210 = 0;
  v211 = (id *)&v210;
  uint64_t v212 = 0x3032000000;
  v213 = __Block_byref_object_copy__144;
  v214 = __Block_byref_object_dispose__144;
  id v215 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v153 = [(RTLearnedLocationStore *)self->_learnedLocationStore predicateForObjectsFromCurrentDevice];
  v152 = [(RTLearnedLocationStore *)self->_learnedLocationStore predicateForCompleteVisits];
  v155 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  v180 = self;
  id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v166 = (void *)[v11 initWithStartDate:v155 endDate:v12];

  learnedLocationStore = self->_learnedLocationStore;
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v151 = [(RTLearnedLocationStore *)learnedLocationStore predicateForVisitsFromEntryDate:v155 exitDate:v14];

  uint64_t v15 = (void *)MEMORY[0x1E4F28BA0];
  v234[0] = v153;
  v234[1] = v152;
  v234[2] = v151;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v234 count:3];
  v150 = [v15 andPredicateWithSubpredicates:v16];

  double v17 = self->_learnedLocationStore;
  v206[0] = MEMORY[0x1E4F143A8];
  v206[1] = 3221225472;
  v206[2] = __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke;
  v206[3] = &unk_1E6B905F0;
  v208 = &v216;
  v209 = &v210;
  id v18 = v10;
  v207 = v18;
  [(RTLearnedLocationStore *)v17 fetchVisitsWithPredicate:v150 handler:v206];
  dsema = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v20 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v20)) {
    goto LABEL_23;
  }
  double v21 = [MEMORY[0x1E4F1C9C8] now];
  [v21 timeIntervalSinceDate:v19];
  double v23 = v22;
  id v24 = objc_opt_new();
  id v25 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_112];
  uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
  double v27 = [v26 filteredArrayUsingPredicate:v25];
  id v28 = [v27 firstObject];

  [v24 submitToCoreAnalytics:v28 type:1 duration:v23];
  v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
  *(void *)v223 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v223 count:1];
  long long v32 = [v30 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v31];

  if (v32)
  {
    id v33 = v32;

    char v34 = 0;
  }
  else
  {
LABEL_23:
    id v33 = 0;
    char v34 = 1;
  }

  id v149 = v33;
  if ((v34 & 1) == 0) {
    objc_storeStrong(v211 + 5, v33);
  }
  uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    uint64_t v37 = [(id)v217[5] count];
    id v38 = v211[5];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v37;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v38;
    _os_log_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_INFO, "TransitMetrics, %lu visits on current device, error, %@", buf, 0x16u);
  }

  if (v211[5])
  {
    v162[2]();
    goto LABEL_108;
  }
  id v39 = [(id)v217[5] lastObject];
  id v40 = [v39 exitDate];
  id v41 = [(id)v217[5] firstObject];
  long long v42 = [v41 entryDate];
  [v40 timeIntervalSinceDate:v42];
  double v44 = v43;

  long long v45 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  uint64_t v148 = (uint64_t)(v44 / 86400.0);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v140 = [(id)v217[5] count];
    v141 = [(id)v217[5] firstObject];
    v142 = [v141 entryDate];
    id v143 = [v142 stringFromDate];
    v144 = [(id)v217[5] lastObject];
    v145 = [v144 exitDate];
    v146 = [v145 stringFromDate];
    v147 = [v155 stringFromDate];
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v140;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v143;
    *(_WORD *)&buf[22] = 2112;
    v227 = v146;
    *(_WORD *)v228 = 2048;
    *(void *)&v228[2] = (uint64_t)(v44 / 86400.0);
    *(_WORD *)&v228[10] = 2112;
    *(void *)&v228[12] = v147;
    _os_log_debug_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_DEBUG, "TransitMetrics, visits, %lu, startDate, %@, endDate, %@, duration, %lu, stats.startDate, %@", buf, 0x34u);
  }
  v163 = objc_opt_new();
  long long v204 = 0u;
  long long v205 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  id obj = (id)v217[5];
  uint64_t v46 = [obj countByEnumeratingWithState:&v202 objects:v233 count:16];
  long long v47 = v180;
  if (!v46)
  {
    v181 = 0;
    v182 = 0;
    v184 = 0;
    goto LABEL_77;
  }
  uint64_t v48 = 0;
  v181 = 0;
  v182 = 0;
  v184 = 0;
  uint64_t v175 = *(void *)v203;
  do
  {
    uint64_t v177 = v46;
    for (uint64_t i = 0; i != v177; ++i)
    {
      if (*(void *)v203 != v175) {
        objc_enumerationMutation(obj);
      }
      v50 = *(void **)(*((void *)&v202 + 1) + 8 * i);
      if ([(RTTransitMetricManager *)v47 isOverlappedVisit:v50 locationsOfInterest:v179])
      {
        if (v48 == 2)
        {
          v51 = [v50 entryDate];
          [v51 timeIntervalSinceDate:v181];
          if (v52 >= 900.0)
          {
            v60 = [v181 dateByAddingTimeInterval:300.0];
            if (v60)
            {
              v61 = [v181 dateByAddingTimeInterval:300.0];
              v171 = [v61 earlierDate:v184];
            }
            else
            {
              v171 = v184;
            }

            v66 = [v51 dateByAddingTimeInterval:-300.0];
            if (v66)
            {
              v67 = [v51 dateByAddingTimeInterval:-300.0];
              id v169 = [v67 laterDate:v182];
            }
            else
            {
              id v169 = v182;
            }

            v68 = [v50 entryDate];
            v69 = [v68 dateByAddingTimeInterval:300.0];
            if (v69)
            {
              v70 = [v50 entryDate];
              v71 = [v70 dateByAddingTimeInterval:300.0];
              v72 = [v50 exitDate];
              v73 = [v72 dateByAddingTimeInterval:-300.0];
              v167 = [v71 earlierDate:v73];
            }
            else
            {
              v70 = [v50 exitDate];
              v167 = [v70 dateByAddingTimeInterval:-300.0];
            }

            v74 = [v50 entryDate];
            v75 = [v74 dateByAddingTimeInterval:300.0];
            if (v75)
            {
              v76 = [v50 entryDate];
              v77 = [v76 dateByAddingTimeInterval:300.0];
              v78 = [v50 exitDate];
              v79 = [v78 dateByAddingTimeInterval:-300.0];
              v80 = [v77 laterDate:v79];
            }
            else
            {
              v76 = [v50 exitDate];
              v80 = [v76 dateByAddingTimeInterval:-300.0];
            }

            v81 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v171 endDate:v169];
            v82 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v167 endDate:v80];
            v83 = [[RTTransitMetricPeriod alloc] initWithJourneyPeriod:v81 homeStayPeriod:v82];
            [v163 addObject:v83];

            v84 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
            {
              id v86 = [v171 stringFromDate];
              id v164 = [v169 stringFromDate];
              v160 = [v167 stringFromDate];
              id v158 = [v80 stringFromDate];
              v87 = [v50 entryDate];
              id v157 = [v87 stringFromDate];
              v156 = [v50 exitDate];
              id v88 = [v156 stringFromDate];
              uint64_t v89 = [v181 stringFromDate];
              *(_DWORD *)buf = 138413826;
              *(void *)&uint8_t buf[4] = v86;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v164;
              *(_WORD *)&buf[22] = 2112;
              v227 = v160;
              *(_WORD *)v228 = 2112;
              *(void *)&v228[2] = v158;
              *(_WORD *)&v228[10] = 2112;
              *(void *)&v228[12] = v157;
              __int16 v229 = 2112;
              id v230 = v88;
              __int16 v231 = 2112;
              v154 = (void *)v89;
              uint64_t v232 = v89;
              _os_log_debug_impl(&dword_1D9BFA000, v84, OS_LOG_TYPE_DEBUG, "TransitMetrics, create journey, startDate, %@, endDate, %@, home.entryDate.adjusted, %@, home.exitDate.adjusted, %@, home.entryDate, %@, home.exitDate, %@, home.prevExitDate, %@", buf, 0x48u);
            }
            uint64_t v53 = v171;
          }
          else
          {
            uint64_t v53 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              id v54 = [v181 stringFromDate];
              id v55 = [v51 stringFromDate];
              [v51 timeIntervalSinceDate:v181];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v54;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v55;
              *(_WORD *)&buf[22] = 2048;
              v227 = v56;
              _os_log_debug_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_DEBUG, "TransitMetrics, pass journey, startDate, %@, endDate, %@, interval, %f", buf, 0x20u);
            }
          }
        }
        uint64_t v85 = [v50 exitDate];
        uint64_t v63 = 0;
        uint64_t v59 = 0;
        v64 = v181;
        uint64_t v48 = 1;
        v181 = (void *)v85;
        goto LABEL_71;
      }
      if (![(RTTransitMetricManager *)v47 isOverlappedVisit:v50 locationsOfInterest:v174])continue; {
      if (v48 == 1)
      }
        uint64_t v48 = 2;
      uint64_t v57 = [v50 entryDate];
      if (v57)
      {
        v58 = [v50 entryDate];
        uint64_t v59 = [v58 earlierDate:v184];
      }
      else
      {
        uint64_t v59 = (uint64_t)v184;
      }

      uint64_t v62 = [v50 exitDate];
      if (v62)
      {
        v184 = [v50 exitDate];
        uint64_t v63 = [v184 laterDate:v182];
        v64 = v182;
        v182 = (void *)v62;
LABEL_71:

        v65 = v182;
        v182 = (void *)v63;
        goto LABEL_72;
      }
      v65 = 0;
LABEL_72:

      v184 = (void *)v59;
      long long v47 = v180;
    }
    uint64_t v46 = [obj countByEnumeratingWithState:&v202 objects:v233 count:16];
  }
  while (v46);
LABEL_77:

  v90 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
  {
    uint64_t v91 = [v163 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v91;
    _os_log_impl(&dword_1D9BFA000, v90, OS_LOG_TYPE_INFO, "TransitMetrics, journeys, %lu", buf, 0xCu);
  }

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v227 = __Block_byref_object_copy__144;
  *(void *)v228 = __Block_byref_object_dispose__144;
  *(void *)&v228[8] = 0;
  dispatch_semaphore_t v92 = dispatch_semaphore_create(0);

  v93 = v180->_learnedLocationStore;
  v198[0] = MEMORY[0x1E4F143A8];
  v198[1] = 3221225472;
  v198[2] = __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke_44;
  v198[3] = &unk_1E6B905F0;
  v200 = buf;
  v201 = &v210;
  v94 = v92;
  v199 = v94;
  [(RTLearnedLocationStore *)v93 fetchDevicesNotFromCurrentDeviceWithHandler:v198];
  dsema = v94;
  v95 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v96 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v96)) {
    goto LABEL_84;
  }
  v97 = [MEMORY[0x1E4F1C9C8] now];
  [v97 timeIntervalSinceDate:v95];
  double v99 = v98;
  v100 = objc_opt_new();
  v101 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_112];
  v102 = [MEMORY[0x1E4F29060] callStackSymbols];
  v103 = [v102 filteredArrayUsingPredicate:v101];
  v104 = [v103 firstObject];

  [v100 submitToCoreAnalytics:v104 type:1 duration:v99];
  v105 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v223 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v105, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v223, 2u);
  }

  v106 = (void *)MEMORY[0x1E4F28C58];
  v235[0] = *MEMORY[0x1E4F28568];
  *(void *)v223 = @"semaphore wait timeout";
  v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v223 forKeys:v235 count:1];
  v108 = [v106 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v107];

  if (v108)
  {
    id v109 = v108;

    char v110 = 0;
  }
  else
  {
LABEL_84:
    char v110 = 1;
    id v109 = v149;
  }

  id v111 = v109;
  if ((v110 & 1) == 0) {
    objc_storeStrong(v211 + 5, v109);
  }
  v112 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    uint64_t v113 = [*(id *)(*(void *)&buf[8] + 40) count];
    id v114 = v211[5];
    *(_DWORD *)v223 = 134218242;
    *(void *)&v223[4] = v113;
    __int16 v224 = 2112;
    id v225 = v114;
    _os_log_impl(&dword_1D9BFA000, v112, OS_LOG_TYPE_INFO, "TransitMetrics, devices, %lu, error, %@", v223, 0x16u);
  }

  if (v211[5])
  {
    v162[2]();
  }
  else
  {
    v115 = [MEMORY[0x1E4F28BD0] set];
    v192[0] = MEMORY[0x1E4F143A8];
    v192[1] = 3221225472;
    v192[2] = __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke_46;
    v192[3] = &unk_1E6B9B940;
    id v159 = v163;
    id v193 = v159;
    v194 = v180;
    id v195 = v174;
    id v196 = v179;
    id v161 = v115;
    id v197 = v161;
    v176 = (void *)MEMORY[0x1E016DB00](v192);
    long long v190 = 0u;
    long long v191 = 0u;
    long long v188 = 0u;
    long long v189 = 0u;
    id v165 = *(id *)(*(void *)&buf[8] + 40);
    uint64_t v116 = [v165 countByEnumeratingWithState:&v188 objects:v222 count:16];
    if (v116)
    {
      id obja = *(id *)v189;
      uint64_t v168 = *MEMORY[0x1E4F5CFE8];
      uint64_t v170 = *MEMORY[0x1E4F28568];
      do
      {
        uint64_t v178 = v116;
        uint64_t v117 = 0;
        v118 = v111;
        do
        {
          if (*(id *)v189 != obja) {
            objc_enumerationMutation(v165);
          }
          uint64_t v119 = *(void *)(*((void *)&v188 + 1) + 8 * v117);
          v120 = (void *)MEMORY[0x1E016D870]();
          dispatch_semaphore_t v121 = dispatch_semaphore_create(0);

          v122 = v180->_learnedLocationStore;
          v185[0] = MEMORY[0x1E4F143A8];
          v185[1] = 3221225472;
          v185[2] = __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke_48;
          v185[3] = &unk_1E6B9B368;
          v185[4] = v119;
          id v187 = v176;
          v123 = v121;
          v186 = v123;
          [(RTLearnedLocationStore *)v122 fetchVisitsWithDevice:v119 dateInterval:v166 handler:v185];
          dsema = v123;
          v124 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v125 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(dsema, v125)) {
            goto LABEL_101;
          }
          v126 = [MEMORY[0x1E4F1C9C8] now];
          [v126 timeIntervalSinceDate:v124];
          double v128 = v127;
          v129 = objc_opt_new();
          v130 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_112];
          v131 = [MEMORY[0x1E4F29060] callStackSymbols];
          v132 = [v131 filteredArrayUsingPredicate:v130];
          v133 = [v132 firstObject];

          [v129 submitToCoreAnalytics:v133 type:1 duration:v128];
          v134 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v134, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v223 = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v134, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v223, 2u);
          }

          v135 = (void *)MEMORY[0x1E4F28C58];
          v235[0] = v170;
          *(void *)v223 = @"semaphore wait timeout";
          v136 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v223 forKeys:v235 count:1];
          v137 = [v135 errorWithDomain:v168 code:15 userInfo:v136];

          if (v137)
          {
            id v138 = v137;

            char v139 = 0;
          }
          else
          {
LABEL_101:
            char v139 = 1;
            id v138 = v118;
          }

          id v111 = v138;
          if ((v139 & 1) == 0) {
            objc_storeStrong(v211 + 5, v138);
          }

          ++v117;
          v118 = v111;
        }
        while (v178 != v117);
        uint64_t v116 = [v165 countByEnumeratingWithState:&v188 objects:v222 count:16];
      }
      while (v116);
    }

    -[RTTransitMetricManager _sendMetricsWithDevices:counts:primaryDeviceJourneyCount:metricDurationDays:](v180, "_sendMetricsWithDevices:counts:primaryDeviceJourneyCount:metricDurationDays:", *(void *)(*(void *)&buf[8] + 40), v161, [v159 count], v148);
    ((void (*)(void (**)(void), void))v162[2])(v162, 0);
  }
  _Block_object_dispose(buf, 8);

  id v149 = v111;
LABEL_108:

  _Block_object_dispose(&v210, 8);
  _Block_object_dispose(&v216, 8);

LABEL_109:
}

void __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v24 = a2;
  id v27 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v36;
    *(void *)&long long v5 = 138412546;
    long long v23 = v5;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v8 = v27;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v43 count:16];
        if (!v9)
        {
LABEL_29:

          continue;
        }
        uint64_t v10 = v9;
        uint64_t v29 = i;
        uint64_t v30 = 0;
        uint64_t v11 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            if (*(void *)v32 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v31 + 1) + 8 * j);
            if (objc_msgSend(v7, "travelTogether:", v13, v23)
              && [*(id *)(a1 + 40) isOverlappedVisit:v13 locationsOfInterest:*(void *)(a1 + 48)])
            {
              uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v40 = v13;
                _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "TransitMetrics, traveled together, visit, %@", buf, 0xCu);
              }
              BYTE4(v30) = 1;
LABEL_21:

              continue;
            }
            if ([v7 stayAtHomeTogether:v13]
              && [*(id *)(a1 + 40) isOverlappedVisit:v13 locationsOfInterest:*(void *)(a1 + 56)])
            {
              uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v40 = v13;
                _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "TransitMetrics, stayed at home together, visit, %@", buf, 0xCu);
              }
              LOBYTE(v30) = 1;
              goto LABEL_21;
            }
            uint64_t v15 = [v13 entryDate];
            uint64_t v16 = [v7 homeStayPeriod];
            double v17 = [v16 endDate];
            char v18 = [v15 isAfterDate:v17];

            if (v18) {
              goto LABEL_25;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v43 count:16];
        }
        while (v10);
LABEL_25:

        uint64_t i = v29;
        if (v30 & 0x100000000) != 0 && (v30)
        {
          uint64_t v19 = *(void **)(a1 + 64);
          dispatch_time_t v20 = [v24 identifier];
          [v19 addObject:v20];

          id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            double v21 = [v24 identifier];
            uint64_t v22 = [*(id *)(a1 + 64) count];
            *(_DWORD *)buf = v23;
            id v40 = v21;
            __int16 v41 = 2048;
            uint64_t v42 = v22;
            _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "TransitMetrics, carrying device, identifier, %@, all devices, %lu", buf, 0x16u);
          }
          goto LABEL_29;
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v28);
  }
}

void __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke_48(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [*(id *)(a1 + 32) identifier];
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = [v5 count];
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "TransitMetrics, device, %@, visits, %lu", (uint8_t *)&v8, 0x16u);
  }
  if (!a3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_sendMetricsWithDevices:(id)a3 counts:(id)a4 primaryDeviceJourneyCount:(int64_t)a5 metricDurationDays:(int64_t)a6
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    log = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    id v55 = "Invalid parameter not satisfying: devices";
LABEL_29:
    _os_log_error_impl(&dword_1D9BFA000, log, OS_LOG_TYPE_ERROR, v55, buf, 2u);
    goto LABEL_27;
  }
  if (!v8)
  {
    log = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    id v55 = "Invalid parameter not satisfying: counts";
    goto LABEL_29;
  }
  log = [MEMORY[0x1E4F1CA48] array];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v56 = v7;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v72 objects:v100 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v73 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        uint64_t v16 = [v15 identifier];
        uint64_t v17 = [v9 countForObject:v16];
        if (v17 >= 1)
        {
          v99[0] = v15;
          v98[0] = @"device";
          v98[1] = @"count";
          char v18 = [NSNumber numberWithInteger:v17];
          v99[1] = v18;
          uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:2];
          [log addObject:v19];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v72 objects:v100 count:16];
    }
    while (v12);
  }

  uint64_t v20 = [v9 count];
  int64_t v63 = [(RTTransitMetricManager *)self decimateInteger:a6];
  double v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"count" ascending:0];
  v97 = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
  long long v23 = [log sortedArrayUsingDescriptors:v22];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v23;
  uint64_t v61 = [obj countByEnumeratingWithState:&v68 objects:v96 count:16];
  if (v61)
  {
    uint64_t v62 = 0;
    uint64_t v60 = *(void *)v69;
    double v24 = (double)v20;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v69 != v60) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v62 + v25;
        uint64_t v66 = v25;
        id v27 = *(void **)(*((void *)&v68 + 1) + 8 * v25);
        uint64_t v28 = [v27 objectForKeyedSubscript:@"device"];
        uint64_t v29 = [v27 objectForKeyedSubscript:@"count"];
        uint64_t v30 = [v29 longValue];
        long long v31 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v50 = [v28 identifier];
          v51 = [v28 deviceName];
          double v52 = [v28 deviceClass];
          uint64_t v53 = [v28 deviceModel];
          uint64_t v54 = [v29 longValue];
          *(_DWORD *)buf = 134219778;
          int64_t v81 = a6;
          __int16 v82 = 2112;
          v83 = v50;
          __int16 v84 = 2112;
          uint64_t v85 = v51;
          __int16 v86 = 2112;
          v87 = v52;
          __int16 v88 = 2112;
          uint64_t v89 = v53;
          __int16 v90 = 2048;
          uint64_t v91 = v26;
          __int16 v92 = 2048;
          uint64_t v93 = v54;
          __int16 v94 = 2048;
          int64_t v95 = a5;
          _os_log_debug_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_DEBUG, "TransitMetrics, send metrics, duration, %lu, device, %@, deviceName, %@, deviceClass, %@, deviceModel, %@, idx, %lu, carrying count, %lu, journey count, %lu", buf, 0x52u);
        }
        v67 = v29;
        double v32 = (double)v30 / (double)a5;

        v78[0] = @"LOIType";
        v78[1] = @"ModelType";
        v79[0] = @"Work";
        v79[1] = @"Commute";
        v78[2] = @"DurationBinned";
        long long v33 = [NSNumber numberWithInteger:v63];
        v79[2] = v33;
        v78[3] = @"DeviceType";
        long long v34 = [v28 deviceClass];
        v79[3] = v34;
        v78[4] = @"Priority";
        long long v35 = NSNumber;
        [(RTTransitMetricManager *)self decimateDoulbe:(double)(v26 + 1) / v24];
        long long v36 = [v35 numberWithDouble:];
        v79[4] = v36;
        v78[5] = @"PriorityBinned";
        long long v37 = [NSNumber numberWithInteger:(uint64_t)((double)(v26 + 1) / v24 * 10.0)];
        v79[5] = v37;
        v78[6] = @"ParityRate";
        long long v38 = NSNumber;
        [(RTTransitMetricManager *)self decimateDoulbe:v32];
        [v38 numberWithDouble:];
        uint64_t v39 = v26;
        v41 = id v40 = v28;
        v79[6] = v41;
        v78[7] = @"TransitsBinned";
        uint64_t v42 = [NSNumber numberWithInteger:-[RTTransitMetricManager decimateInteger:](self, "decimateInteger:", a5)];
        v79[7] = v42;
        double v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:8];

        AnalyticsSendEvent();
        if (!v39)
        {
          v76[0] = @"LOIType";
          v76[1] = @"ModelType";
          v77[0] = @"Work";
          v77[1] = @"Commute";
          v76[2] = @"DurationBinned";
          double v44 = [NSNumber numberWithInteger:v63];
          v77[2] = v44;
          v76[3] = @"DeviceType";
          uint64_t v45 = [v40 deviceClass];
          v77[3] = v45;
          v76[4] = @"ParityRate";
          uint64_t v46 = NSNumber;
          [(RTTransitMetricManager *)self decimateDoulbe:v32];
          long long v47 = [v46 numberWithDouble:x0];
          v77[4] = v47;
          v76[5] = @"TransitsBinned";
          uint64_t v48 = [NSNumber numberWithInteger:-[RTTransitMetricManager decimateInteger:](self, "decimateInteger:", a5)];
          v77[5] = v48;
          uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:6];

          AnalyticsSendEvent();
        }

        uint64_t v25 = v66 + 1;
      }
      while (v61 != v66 + 1);
      uint64_t v61 = [obj countByEnumeratingWithState:&v68 objects:v96 count:16];
      v62 += v25;
    }
    while (v61);
  }

  id v7 = v56;
LABEL_27:
}

- (int64_t)decimateInteger:(int64_t)a3
{
  return 5 * (a3 / 5);
}

- (double)decimateDoulbe:(double)a3
{
  return (double)(uint64_t)(a3 * 100.0) / 100.0;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end