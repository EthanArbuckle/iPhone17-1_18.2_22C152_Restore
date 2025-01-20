@interface RTDeviceLocationPredictor
+ (int64_t)periodicPurgePolicy;
- (BOOL)encryptedDataAvailabilityNotificationNeeded;
- (BOOL)pendingNextPredictedLocationsOfInterestRequest;
- (BOOL)routineEnabled;
- (NSArray)nextPredictedLocationsOfInterest;
- (NSMutableArray)evalPredictedExitDates;
- (NSMutableArray)evalPredictedLocationsOfInterest;
- (NSSet)providers;
- (OS_dispatch_source)nextPredictedLocationsOfInterestPollLocationTimer;
- (RTAuthorizationManager)authorizationManager;
- (RTDefaultsManager)defaultsManager;
- (RTDeviceLocationPredictor)init;
- (RTDeviceLocationPredictor)initWithQueue:(id)a3 authorizationManager:(id)a4 defaultsManager:(id)a5 distanceCalculator:(id)a6 learnedLocationManager:(id)a7 locationManager:(id)a8 mapServiceManager:(id)a9 metricManager:(id)a10 platform:(id)a11 providers:(id)a12;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationManager)locationManager;
- (RTMapServiceManager)mapServiceManager;
- (RTMetricManager)metricManager;
- (RTNextPredictedLocationsOfInterestCache)nextPredictedLocationsOfInterestCache;
- (RTPlatform)platform;
- (double)nextPredictedLocationsOfInterestPollLocationInterval;
- (double)nextPredictedLocationsOfInterestProcessInterval;
- (id)_dedupePredictedLocationsOfInterest:(id)a3;
- (id)_mergePredictedLocationsOfInterest:(id)a3;
- (id)_mergedLocationOfInterest:(id)a3 otherLocationOfInterest:(id)a4;
- (id)_sortAndDedupePredictedLocationsOfInterest:(id)a3;
- (id)_sortPredictedLocationsOfInterest:(id)a3;
- (void)_clear;
- (void)_fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 clientIdentifier:(id)a6 handler:(id)a7;
- (void)_fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 withHandler:(id)a5;
- (void)_fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 clientIdentifier:(id)a5 withHandler:(id)a6;
- (void)_onAuthorizationNotification:(id)a3;
- (void)_onLearnedLocationManagerNotification:(id)a3;
- (void)_purgeWithReferenceDate:(id)a3;
- (void)_registerForNotifications;
- (void)_setup;
- (void)_setupEvalMode;
- (void)_shutdownWithHandler:(id)a3;
- (void)_unregisterForNotifications;
- (void)_updateEvalMode;
- (void)clear;
- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 clientIdentifier:(id)a6 handler:(id)a7;
- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 handler:(id)a6;
- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 withHandler:(id)a5;
- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 clientIdentifier:(id)a5 withHandler:(id)a6;
- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 clientIdentifier:(id)a4 withHandler:(id)a5;
- (void)onAuthorizationNotification:(id)a3;
- (void)onLearnedLocationManagerNotification:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)purgeWithReferenceDate:(id)a3;
- (void)setAuthorizationManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setEncryptedDataAvailabilityNotificationNeeded:(BOOL)a3;
- (void)setEvalPredictedExitDates:(id)a3;
- (void)setEvalPredictedLocationsOfInterest:(id)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setMetricManager:(id)a3;
- (void)setNextPredictedLocationsOfInterest:(id)a3;
- (void)setNextPredictedLocationsOfInterestCache:(id)a3;
- (void)setNextPredictedLocationsOfInterestPollLocationInterval:(double)a3;
- (void)setNextPredictedLocationsOfInterestPollLocationTimer:(id)a3;
- (void)setNextPredictedLocationsOfInterestProcessInterval:(double)a3;
- (void)setPendingNextPredictedLocationsOfInterestRequest:(BOOL)a3;
- (void)setPlatform:(id)a3;
- (void)setProviders:(id)a3;
- (void)setRoutineEnabled:(BOOL)a3;
@end

@implementation RTDeviceLocationPredictor

void __128__RTDeviceLocationPredictor__fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_63(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    [*(id *)(a1 + 40) timeIntervalSinceNow];
    int v6 = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    double v9 = -v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "all providers returned a total of %lu next PLOIs, latency, %.3f", (uint8_t *)&v6, 0x16u);
  }

  v5 = [*(id *)(a1 + 48) _sortAndDedupePredictedLocationsOfInterest:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_sortAndDedupePredictedLocationsOfInterest:(id)a3
{
  double v4 = [(RTDeviceLocationPredictor *)self _dedupePredictedLocationsOfInterest:a3];
  v5 = [(RTDeviceLocationPredictor *)self _sortPredictedLocationsOfInterest:v4];

  return v5;
}

- (id)_sortPredictedLocationsOfInterest:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 sortedArrayUsingComparator:&__block_literal_global_81];
  v48 = objc_opt_new();
  v51 = objc_opt_new();
  v46 = objc_opt_new();
  v50 = objc_opt_new();
  v47 = objc_opt_new();
  v45 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v3;
  uint64_t v53 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v53)
  {
    uint64_t v52 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v53; uint64_t i = v26 + 1)
      {
        if (*(void *)v61 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v54 = i;
        v5 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        int v6 = [[MEMORY[0x1E4F1CA60] dictionary] v45];
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        v55 = v5;
        uint64_t v7 = [v5 sources];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v57;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v57 != v10) {
                objc_enumerationMutation(v7);
              }
              objc_opt_class();
              if (((objc_opt_isKindOfClass() & 1) != 0
                 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                && (v12 = (objc_class *)objc_opt_class(),
                    NSStringFromClass(v12),
                    (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v14 = v13;
                v15 = NSNumber;
                v16 = [v6 objectForKeyedSubscript:v13];
                v17 = [v15 numberWithUnsignedInteger:[v16 unsignedIntegerValue] + 1];
                [v6 setObject:v17 forKeyedSubscript:v14];
              }
              else
              {
                v14 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
                if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
                {
                  v18 = (objc_class *)objc_opt_class();
                  v19 = NSStringFromClass(v18);
                  *(_DWORD *)buf = 138412546;
                  v65 = v55;
                  __int16 v66 = 2112;
                  v67 = v19;
                  _os_log_fault_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_FAULT, "unhandled PLOI source, ploi, %@, source, %@", buf, 0x16u);
                }
              }

              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v56 objects:v68 count:16];
          }
          while (v9);
        }

        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        v22 = [v6 objectForKeyedSubscript:v21];
        if ([v22 unsignedIntegerValue])
        {
          [v55 confidence];
          double v24 = v23;

          v25 = v50;
          uint64_t v26 = v54;
          if (v24 > 0.0) {
            goto LABEL_31;
          }
        }
        else
        {

          uint64_t v26 = v54;
        }
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        v29 = [v6 objectForKeyedSubscript:v28];
        uint64_t v30 = [v29 unsignedIntegerValue];

        v25 = v51;
        if (!v30)
        {
          v31 = (objc_class *)objc_opt_class();
          v32 = NSStringFromClass(v31);
          v33 = [v6 objectForKeyedSubscript:v32];
          uint64_t v34 = [v33 unsignedIntegerValue];

          v25 = v48;
          if (!v34)
          {
            v35 = (objc_class *)objc_opt_class();
            v36 = NSStringFromClass(v35);
            v37 = [v6 objectForKeyedSubscript:v36];
            uint64_t v38 = [v37 unsignedIntegerValue];

            v25 = v47;
            if (!v38)
            {
              v39 = (objc_class *)objc_opt_class();
              v40 = NSStringFromClass(v39);
              v41 = [v6 objectForKeyedSubscript:v40];
              uint64_t v42 = [v41 unsignedIntegerValue];

              if (v42) {
                v25 = v46;
              }
              else {
                v25 = v45;
              }
            }
          }
        }
LABEL_31:
        [v25 addObject:v55];
      }
      uint64_t v53 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v53);
  }

  v43 = objc_opt_new();
  [v43 addObjectsFromArray:v50];
  [v43 addObjectsFromArray:v51];
  [v43 addObjectsFromArray:v48];
  [v43 addObjectsFromArray:v47];
  [v43 addObjectsFromArray:v46];
  [v43 addObjectsFromArray:v45];

  return v43;
}

- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 clientIdentifier:(id)a6 handler:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (v16)
  {
    v17 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __127__RTDeviceLocationPredictor_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke;
    block[3] = &unk_1E6B99738;
    block[4] = self;
    SEL v24 = a2;
    id v23 = v16;
    id v20 = v13;
    id v21 = v14;
    double v25 = a5;
    id v22 = v15;
    dispatch_async(v17, block);
  }
  else
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[RTDeviceLocationPredictor fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:clientI"
            "dentifier:handler:]";
      __int16 v28 = 1024;
      int v29 = 621;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

- (void)_fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 clientIdentifier:(id)a6 handler:(id)a7
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, void, void *))a7;
  if (v15)
  {
    if (v12)
    {
      [v12 horizontalUncertainty];
      if (v16 > 250.0)
      {
        v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = *MEMORY[0x1E4F5CFE8];
        uint64_t v77 = *MEMORY[0x1E4F28568];
        v19 = NSString;
        [v12 horizontalUncertainty];
        p_super = [v19 stringWithFormat:@"Horizontal Uncertainity, %.2f, is greater than the Threshold, %.2f,", v20, 0x406F400000000000];
        v78 = p_super;
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        id v23 = [v17 errorWithDomain:v18 code:7 userInfo:v22];
        v15[2](v15, 0, v23);

        goto LABEL_31;
      }
      if (v13)
      {
        if (a5 > 0.0)
        {
          v49 = v15;
          int v29 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            uint64_t v30 = [v13 stringFromDate];
            *(_DWORD *)buf = 138412802;
            v68 = (const char *)v12;
            __int16 v69 = 2112;
            uint64_t v70 = v30;
            __int16 v71 = 2048;
            double v72 = a5 / 3600.0;
            _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "Predict device location wrt location, %@, startDate, %@, timeInterval, %.2f hrs", buf, 0x20u);
          }
          v48 = [MEMORY[0x1E4F1C9C8] date];
          v31 = [[RTPredictedLocationsOfInterestCriteria alloc] initWithDistanceCalculator:self->_distanceCalculator];
          [(RTPredictedLocationsOfInterestCriteria *)v31 setReferenceDate:v13];
          id v51 = v12;
          [(RTPredictedLocationsOfInterestCriteria *)v31 setReferenceLocation:v12];
          [(RTPredictedLocationsOfInterestCriteria *)v31 setWindowDuration:a5];
          double v32 = a5 * 20.0;
          if (a5 <= 0.0) {
            double v32 = 72000.0;
          }
          [(RTPredictedLocationsOfInterestCriteria *)v31 setMaximumDistance:v32];
          [(RTPredictedLocationsOfInterestCriteria *)v31 setMinimumDistance:700.0];
          id v50 = v14;
          [(RTPredictedLocationsOfInterestCriteria *)v31 setClientIdentifier:v14];
          v33 = dispatch_group_create();
          uint64_t v34 = [MEMORY[0x1E4F1CA48] array];
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          v35 = self->_providers;
          uint64_t v36 = [(NSSet *)v35 countByEnumeratingWithState:&v62 objects:v66 count:16];
          uint64_t v52 = v31;
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v63;
            do
            {
              for (uint64_t i = 0; i != v37; ++i)
              {
                if (*(void *)v63 != v38) {
                  objc_enumerationMutation(v35);
                }
                v40 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                if ([v40 requiresRoutineEnablement]
                  && ![(RTDeviceLocationPredictor *)self routineEnabled])
                {
                  uint64_t v42 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v43 = objc_opt_class();
                    *(_DWORD *)buf = 138412290;
                    v68 = (const char *)v43;
                    _os_log_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_INFO, "skipping provider %@ due to routine disablement", buf, 0xCu);
                  }

                  v31 = v52;
                }
                else
                {
                  dispatch_group_enter(v33);
                  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
                  v58[0] = MEMORY[0x1E4F143A8];
                  v58[1] = 3221225472;
                  v58[2] = __128__RTDeviceLocationPredictor__fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke;
                  v58[3] = &unk_1E6B99710;
                  v58[4] = self;
                  v58[5] = v40;
                  uint64_t v61 = v41;
                  id v59 = v34;
                  long long v60 = v33;
                  [v40 fetchNextPredictedLocationsOfInterestWithCriteria:v31 handler:v58];
                }
              }
              uint64_t v37 = [(NSSet *)v35 countByEnumeratingWithState:&v62 objects:v66 count:16];
            }
            while (v37);
          }

          v44 = [(RTNotifier *)self queue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __128__RTDeviceLocationPredictor__fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_63;
          block[3] = &unk_1E6B91490;
          id v15 = v49;
          id v54 = v34;
          id v55 = v48;
          long long v56 = self;
          long long v57 = v49;
          id v45 = v48;
          id v46 = v34;
          dispatch_group_notify(v33, v44, block);

          p_super = &v52->super;
          id v12 = v51;
          id v14 = v50;
          goto LABEL_31;
        }
        SEL v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v25 = *MEMORY[0x1E4F5CFE8];
        uint64_t v73 = *MEMORY[0x1E4F28568];
        v74 = @"requires a valid interval.";
        uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
        v27 = &v74;
        __int16 v28 = &v73;
      }
      else
      {
        SEL v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v25 = *MEMORY[0x1E4F5CFE8];
        uint64_t v75 = *MEMORY[0x1E4F28568];
        v76 = @"requires a valid date.";
        uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
        v27 = &v76;
        __int16 v28 = &v75;
      }
    }
    else
    {
      SEL v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F5CFE8];
      uint64_t v79 = *MEMORY[0x1E4F28568];
      v80[0] = @"requires a valid location.";
      uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
      v27 = (__CFString **)v80;
      __int16 v28 = &v79;
    }
    p_super = [v26 dictionaryWithObjects:v27 forKeys:v28 count:1];
    v47 = [v24 errorWithDomain:v25 code:7 userInfo:p_super];
    v15[2](v15, 0, v47);

    goto LABEL_31;
  }
  p_super = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v68 = "-[RTDeviceLocationPredictor _fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:clientId"
          "entifier:handler:]";
    __int16 v69 = 1024;
    LODWORD(v70) = 511;
    _os_log_error_impl(&dword_1D9BFA000, p_super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_31:
}

void __128__RTDeviceLocationPredictor__fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
  double v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "provider %@, encountered error, %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = [*(id *)(a1 + 48) count];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v8 = v7 - *(double *)(a1 + 72);
      int v11 = 138412802;
      uint64_t v12 = v5;
      __int16 v13 = 2048;
      uint64_t v14 = v6;
      __int16 v15 = 2048;
      double v16 = v8;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "provider %@, returned %lu next PLOIs, latency, %.3f", (uint8_t *)&v11, 0x20u);
    }

    if ([*(id *)(a1 + 48) count]) {
      [*(id *)(a1 + 56) addObjectsFromArray:*(void *)(a1 + 48)];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (id)_dedupePredictedLocationsOfInterest:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v28 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[v3 count]];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v29 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        double v8 = [v7 locationOfInterest];
        uint64_t v9 = [v8 mapItem];
        if (v9)
        {
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v10 = v28;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v34;
LABEL_9:
            uint64_t v14 = 0;
            while (1)
            {
              if (*(void *)v34 != v13) {
                objc_enumerationMutation(v10);
              }
              __int16 v15 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
              if ([v9 isEqualToMapItem:v15]) {
                break;
              }
              if (v12 == ++v14)
              {
                uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v41 count:16];
                if (v12) {
                  goto LABEL_9;
                }
                goto LABEL_15;
              }
            }
            double v16 = v15;

            if (!v16) {
              goto LABEL_18;
            }
            uint64_t v17 = [v10 objectForKeyedSubscript:v16];
            [v17 addObject:v7];
          }
          else
          {
LABEL_15:

LABEL_18:
            uint64_t v18 = objc_opt_new();
            [v10 setObject:v18 forKeyedSubscript:v9];

            double v16 = [v10 objectForKeyedSubscript:v9];
            [v16 addObject:v7];
          }
        }
        else
        {
          v19 = [v8 identifier];

          if (v19)
          {
            double v16 = [v8 identifier];
            [v26 setObject:v7 forKeyedSubscript:v16];
          }
          else
          {
            double v16 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v43 = v8;
              _os_log_fault_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_FAULT, "locationOfInterest %@, has nil identifier.", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v5);
  }

  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __65__RTDeviceLocationPredictor__dedupePredictedLocationsOfInterest___block_invoke;
  v30[3] = &unk_1E6B996E8;
  id v21 = v20;
  id v31 = v21;
  double v32 = self;
  [v28 enumerateKeysAndObjectsUsingBlock:v30];
  id v22 = [v26 allValues];
  [v21 addObjectsFromArray:v22];

  id v23 = v21;
  return v23;
}

void __128__RTDeviceLocationPredictor__fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __128__RTDeviceLocationPredictor__fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_2;
  v12[3] = &unk_1E6B91E58;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  uint64_t v18 = *(void *)(a1 + 64);
  id v16 = v9;
  id v17 = *(id *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __127__RTDeviceLocationPredictor_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) evalPredictedLocationsOfInterest];

  if (v2)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "~~~ %@, EVAL MODE ~~~", (uint8_t *)&v15, 0xCu);
    }
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = @"Eval";
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "mobile$ defaults delete com.apple.routined %@", (uint8_t *)&v15, 0xCu);
    }

    id v6 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = @"Eval";
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "root$ notifyutil -p %@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = [*(id *)(a1 + 32) evalPredictedLocationsOfInterest];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    double v11 = *(double *)(a1 + 80);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 64);
    [v9 _fetchNextPredictedLocationsOfInterestFromLocation:v10 startDate:v12 timeInterval:v13 clientIdentifier:v14 handler:v11];
  }
}

- (NSMutableArray)evalPredictedLocationsOfInterest
{
  return self->_evalPredictedLocationsOfInterest;
}

- (RTDeviceLocationPredictor)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_learnedLocationManager_locationManager_mapServiceManager_metricManager_platform_providers_);
}

- (RTDeviceLocationPredictor)initWithQueue:(id)a3 authorizationManager:(id)a4 defaultsManager:(id)a5 distanceCalculator:(id)a6 learnedLocationManager:(id)a7 locationManager:(id)a8 mapServiceManager:(id)a9 metricManager:(id)a10 platform:(id)a11 providers:(id)a12
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v44 = a5;
  id v19 = a5;
  id v45 = a6;
  id v20 = a6;
  id v47 = a7;
  id v21 = a7;
  id v46 = a8;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v49 = a12;
  id v50 = v18;
  if (!v18)
  {
    uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLoc"
            "ationManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
      __int16 v54 = 1024;
      int v55 = 116;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager (in %s:%d)", buf, 0x12u);
    }
  }
  v27 = v21;
  __int16 v28 = self;
  if (v19)
  {
    if (v20) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLoc"
            "ationManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
      __int16 v54 = 1024;
      int v55 = 117;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
    }

    if (v20)
    {
LABEL_7:
      if (v27) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
  }
  uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocat"
          "ionManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
    __int16 v54 = 1024;
    int v55 = 118;
    _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator (in %s:%d)", buf, 0x12u);
  }

  if (v27)
  {
LABEL_8:
    if (v22) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_20:
  id v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocat"
          "ionManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
    __int16 v54 = 1024;
    int v55 = 119;
    _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationManager (in %s:%d)", buf, 0x12u);
  }

  if (v22)
  {
LABEL_9:
    if (v23) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_23:
  double v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocat"
          "ionManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
    __int16 v54 = 1024;
    int v55 = 120;
    _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager (in %s:%d)", buf, 0x12u);
  }

  if (v23)
  {
LABEL_10:
    if (v24) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_26:
  long long v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocat"
          "ionManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
    __int16 v54 = 1024;
    int v55 = 121;
    _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager (in %s:%d)", buf, 0x12u);
  }

  if (v24)
  {
LABEL_11:
    if (v25) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_29:
  long long v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocat"
          "ionManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
    __int16 v54 = 1024;
    int v55 = 122;
    _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: metricManager (in %s:%d)", buf, 0x12u);
  }

  if (v25)
  {
LABEL_12:
    if (v17) {
      goto LABEL_38;
    }
    goto LABEL_35;
  }
LABEL_32:
  long long v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocat"
          "ionManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
    __int16 v54 = 1024;
    int v55 = 123;
    _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: platform (in %s:%d)", buf, 0x12u);
  }

  if (!v17)
  {
LABEL_35:
    long long v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v53 = "-[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLoc"
            "ationManager:locationManager:mapServiceManager:metricManager:platform:providers:]";
      __int16 v54 = 1024;
      int v55 = 124;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_38:
  long long v37 = 0;
  if (v17 && v50 && v19 && v20 && v27 && v22 && v23 && v24 && v25)
  {
    v51.receiver = self;
    v51.super_class = (Class)RTDeviceLocationPredictor;
    long long v38 = [(RTNotifier *)&v51 initWithQueue:v17];
    long long v39 = v38;
    if (v38)
    {
      objc_storeStrong((id *)&v38->_authorizationManager, obj);
      objc_storeStrong((id *)&v39->_defaultsManager, v44);
      objc_storeStrong((id *)&v39->_distanceCalculator, v45);
      objc_storeStrong((id *)&v39->_locationManager, v46);
      objc_storeStrong((id *)&v39->_learnedLocationManager, v47);
      objc_storeStrong((id *)&v39->_mapServiceManager, a9);
      objc_storeStrong((id *)&v39->_metricManager, a10);
      objc_storeStrong((id *)&v39->_platform, a11);
      uint64_t v40 = [v49 copy];
      providers = v39->_providers;
      v39->_providers = (NSSet *)v40;

      [(RTService *)v39 setup];
    }
    __int16 v28 = v39;
    long long v37 = v28;
  }

  return v37;
}

- (void)_registerForNotifications
{
  id v3 = [(RTDeviceLocationPredictor *)self authorizationManager];
  uint64_t v4 = +[RTNotification notificationName];
  [v3 addObserver:self selector:sel_onAuthorizationNotification_ name:v4];

  id v6 = [(RTDeviceLocationPredictor *)self learnedLocationManager];
  id v5 = +[RTNotification notificationName];
  [v6 addObserver:self selector:sel_onLearnedLocationManagerNotification_ name:v5];
}

- (void)_unregisterForNotifications
{
  id v3 = [(RTDeviceLocationPredictor *)self authorizationManager];
  [v3 removeObserver:self];

  uint64_t v4 = [(RTDeviceLocationPredictor *)self learnedLocationManager];
  [v4 removeObserver:self];

  id v5 = [(RTDeviceLocationPredictor *)self locationManager];
  [v5 removeObserver:self];
}

- (void)_setup
{
  [(RTDeviceLocationPredictor *)self _registerForNotifications];

  [(RTDeviceLocationPredictor *)self _setupEvalMode];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v8 = a3;
  [(RTDeviceLocationPredictor *)self _unregisterForNotifications];
  uint64_t v4 = [(RTDeviceLocationPredictor *)self nextPredictedLocationsOfInterestCache];
  [v4 setDelegate:0];

  [(RTDeviceLocationPredictor *)self setNextPredictedLocationsOfInterestCache:0];
  id v5 = [(RTDeviceLocationPredictor *)self nextPredictedLocationsOfInterestPollLocationTimer];

  if (v5)
  {
    id v6 = [(RTDeviceLocationPredictor *)self nextPredictedLocationsOfInterestPollLocationTimer];
    dispatch_source_cancel(v6);

    [(RTDeviceLocationPredictor *)self setNextPredictedLocationsOfInterestPollLocationTimer:0];
  }
  uint64_t v7 = v8;
  if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
    uint64_t v7 = v8;
  }
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__RTDeviceLocationPredictor_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __73__RTDeviceLocationPredictor_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == 1)
  {
    [*(id *)(a1 + 32) _clear];
  }
  else if (!v2)
  {
    [*(id *)(a1 + 32) _purgeWithReferenceDate:*(void *)(a1 + 40)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

- (void)_clear
{
  id v2 = [(RTDeviceLocationPredictor *)self nextPredictedLocationsOfInterestCache];
  [v2 clear];
}

- (void)clear
{
  id v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__RTDeviceLocationPredictor_clear__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __34__RTDeviceLocationPredictor_clear__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clear];
}

+ (int64_t)periodicPurgePolicy
{
  return 3;
}

- (void)_purgeWithReferenceDate:(id)a3
{
  id v4 = a3;
  id v5 = [(RTDeviceLocationPredictor *)self nextPredictedLocationsOfInterestCache];
  [v5 purgeWithReferenceDate:v4];
}

- (void)purgeWithReferenceDate:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__RTDeviceLocationPredictor_purgeWithReferenceDate___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __52__RTDeviceLocationPredictor_purgeWithReferenceDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeWithReferenceDate:*(void *)(a1 + 40)];
}

- (id)_mergedLocationOfInterest:(id)a3 otherLocationOfInterest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 identifier];
  if (!v7
    || (id v8 = (void *)v7,
        [v6 identifier],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        uint64_t v10 = v5,
        v9))
  {
    uint64_t v11 = [v6 identifier];
    if (!v11
      || (id v12 = (void *)v11,
          [v5 identifier],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          uint64_t v10 = v6,
          v13))
    {
      uint64_t v14 = [v5 customLabel];
      if (!v14
        || (id v15 = (void *)v14,
            [v6 customLabel],
            int64_t v16 = objc_claimAutoreleasedReturnValue(),
            v16,
            v15,
            uint64_t v10 = v5,
            v16))
      {
        uint64_t v17 = [v6 customLabel];
        if (!v17
          || (id v18 = (void *)v17,
              [v5 customLabel],
              id v19 = objc_claimAutoreleasedReturnValue(),
              v19,
              v18,
              uint64_t v10 = v6,
              v19))
        {
          if ([v5 type] == -1 || (v20 = objc_msgSend(v6, "type"), uint64_t v10 = v5, v20 != -1))
          {
            if ([v6 type] == -1 || (v21 = objc_msgSend(v5, "type"), uint64_t v10 = v6, v21 != -1))
            {
              id v22 = [v5 visits];
              unint64_t v23 = [v22 count];
              id v24 = [v6 visits];
              unint64_t v25 = [v24 count];

              uint64_t v10 = v5;
              if (v23 <= v25)
              {
                uint64_t v26 = [v6 visits];
                unint64_t v27 = [v26 count];
                __int16 v28 = [v5 visits];
                unint64_t v29 = [v28 count];

                uint64_t v10 = v6;
                if (v27 <= v29)
                {
                  [v5 confidence];
                  double v31 = v30;
                  [v6 confidence];
                  uint64_t v10 = v5;
                  if (v31 <= v32)
                  {
                    [v6 confidence];
                    double v34 = v33;
                    [v5 confidence];
                    if (v34 <= v35) {
                      uint64_t v10 = v5;
                    }
                    else {
                      uint64_t v10 = v6;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  id v36 = v10;
  long long v37 = [v36 visits];
  objc_super v51 = v6;
  if (![v37 count])
  {
    long long v38 = v6;
    if (v36 == v5 || (long long v38 = v5, v36 == v6))
    {
      uint64_t v39 = [v38 visits];

      long long v37 = (void *)v39;
    }
  }
  id v40 = objc_alloc(MEMORY[0x1E4F5CE10]);
  uint64_t v41 = [v36 location];
  [v36 confidence];
  double v43 = v42;
  id v44 = [v36 identifier];
  uint64_t v45 = [v36 type];
  uint64_t v46 = [v36 typeSource];
  id v47 = [v36 customLabel];
  v48 = [v36 mapItem];
  id v49 = (void *)[v40 initWithLocation:v41 confidence:v44 identifier:v45 type:v46 typeSource:v37 visits:v47 customLabel:v43 mapItem:v48];

  return v49;
}

- (id)_mergePredictedLocationsOfInterest:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if ([v4 count] == 1)
    {
      id v5 = [v4 firstObject];
    }
    else
    {
      uint64_t v33 = 0;
      double v34 = &v33;
      uint64_t v35 = 0x3032000000;
      id v36 = __Block_byref_object_copy__103;
      long long v37 = __Block_byref_object_dispose__103;
      id v6 = [v4 firstObject];
      id v38 = [v6 locationOfInterest];

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __64__RTDeviceLocationPredictor__mergePredictedLocationsOfInterest___block_invoke;
      v32[3] = &unk_1E6B99698;
      v32[4] = self;
      v32[5] = &v33;
      [v4 enumerateObjectsUsingBlock:v32];
      uint64_t v7 = [v4 valueForKeyPath:@"@max.confidence"];
      [v7 doubleValue];
      double v9 = v8;

      uint64_t v10 = [v4 valueForKeyPath:@"@min.nextEntryTime"];
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __64__RTDeviceLocationPredictor__mergePredictedLocationsOfInterest___block_invoke_2;
      v30[3] = &unk_1E6B996C0;
      id v12 = v11;
      id v31 = v12;
      [v4 enumerateObjectsUsingBlock:v30];
      uint64_t v13 = [v12 objectForKeyedSubscript:&unk_1F3451A28];
      uint64_t v14 = [v13 integerValue];

      if (v14 <= 0)
      {
        int64_t v16 = [v12 objectForKeyedSubscript:&unk_1F3451A40];
        uint64_t v17 = [v16 integerValue];

        if (v17 <= 0)
        {
          id v18 = [v12 objectForKeyedSubscript:&unk_1F3451A58];
          uint64_t v15 = [v18 integerValue] > 0;
        }
        else
        {
          uint64_t v15 = 3;
        }
      }
      else
      {
        uint64_t v15 = 2;
      }
      id v19 = objc_opt_new();
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      unint64_t v27 = __64__RTDeviceLocationPredictor__mergePredictedLocationsOfInterest___block_invoke_37;
      __int16 v28 = &unk_1E6B996C0;
      id v20 = v19;
      id v29 = v20;
      [v4 enumerateObjectsUsingBlock:&v25];
      id v21 = objc_alloc(MEMORY[0x1E4F5CEA0]);
      uint64_t v22 = v34[5];
      if (objc_msgSend(v20, "count", v25, v26, v27, v28)) {
        id v23 = v20;
      }
      else {
        id v23 = 0;
      }
      id v5 = (void *)[v21 initWithLocationOfInterest:v22 confidence:v10 nextEntryTime:v15 modeOfTransportation:v23 sources:v9];

      _Block_object_dispose(&v33, 8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __64__RTDeviceLocationPredictor__mergePredictedLocationsOfInterest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v9 = [a2 locationOfInterest];
    uint64_t v6 = [v4 _mergedLocationOfInterest:v5 otherLocationOfInterest:v9];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    double v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void __64__RTDeviceLocationPredictor__mergePredictedLocationsOfInterest___block_invoke_2(uint64_t a1, void *a2)
{
  [NSNumber numberWithInteger:[a2 modeOfTransportation]];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = NSNumber;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  uint64_t v5 = [v3 numberWithInteger:[v4 integerValue] + 1];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

void __64__RTDeviceLocationPredictor__mergePredictedLocationsOfInterest___block_invoke_37(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 sources];
  [v2 addObjectsFromArray:v3];
}

void __65__RTDeviceLocationPredictor__dedupePredictedLocationsOfInterest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 count] == 1)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    double v8 = [v6 firstObject];
    [v7 addObject:v8];
  }
  else
  {
    if ((unint64_t)[v6 count] < 2)
    {
      uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_fault_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_FAULT, "unexpected count of LOIs assocaited to mapItem, %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = [*(id *)(a1 + 40) _mergePredictedLocationsOfInterest:v6];
      [v9 addObject:v10];
    }
  }
}

uint64_t __63__RTDeviceLocationPredictor__sortPredictedLocationsOfInterest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a2;
  [a3 confidence];
  id v6 = [v4 numberWithDouble:];
  uint64_t v7 = NSNumber;
  [v5 confidence];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 handler:(id)a6
{
}

- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 clientIdentifier:(id)a4 withHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [v8 dateByAddingTimeInterval:-7200.0];
    id v12 = [v8 dateByAddingTimeInterval:7200.0];
    [(RTDeviceLocationPredictor *)self fetchPredictedLocationsOfInterestBetweenStartDate:v11 endDate:v12 clientIdentifier:v9 withHandler:v10];
  }
  else
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      uint64_t v15 = "-[RTDeviceLocationPredictor fetchPredictedLocationsOfInterestOnDate:clientIdentifier:withHandler:]";
      __int16 v16 = 1024;
      int v17 = 653;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }
  }
}

- (void)_fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 withHandler:(id)a5
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void, void *))a5;
  if (v11)
  {
    if (v9)
    {
      [v9 horizontalUncertainty];
      if (v12 > 250.0)
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = *MEMORY[0x1E4F5CFE8];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        uint64_t v15 = NSString;
        [v9 horizontalUncertainty];
        int v17 = [v15 stringWithFormat:@"Horizontal Uncertainity, %.2f, is greater than the Threshold, %.2f,", v16, 0x406F400000000000];
        v68 = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        id v19 = [v13 errorWithDomain:v14 code:7 userInfo:v18];
        v11[2](v11, 0, v19);

        goto LABEL_21;
      }
      if (v10)
      {
        uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = [v9 coordinateToString];
          [v10 stringFromDate];
          __int16 v28 = v27 = v10;
          *(_DWORD *)buf = 138412546;
          long long v62 = v26;
          __int16 v63 = 2112;
          long long v64 = v28;
          _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "Predict exit dates from location, %@, onDate, %@", buf, 0x16u);

          id v10 = v27;
        }

        id v29 = [(RTDeviceLocationPredictor *)self evalPredictedExitDates];

        if (v29)
        {
          double v30 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            id v31 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            long long v62 = v31;
            _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "~~~ %@, EVAL MODE ~~~", buf, 0xCu);
          }
          double v32 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            long long v62 = (const char *)@"Eval";
            _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "mobile$ defaults delete com.apple.routined %@", buf, 0xCu);
          }

          uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            long long v62 = (const char *)@"Eval";
            _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "root$ notifyutil -p %@", buf, 0xCu);
          }

          int v17 = [(RTDeviceLocationPredictor *)self evalPredictedExitDates];
          ((void (**)(id, NSObject *, void *))v11)[2](v11, v17, 0);
        }
        else
        {
          uint64_t v35 = objc_opt_new();
          id v47 = v10;
          [v35 setReferenceDate:v10];
          id v48 = v9;
          [v35 setReferenceLocation:v9];
          int v17 = v35;
          [v35 setWindowDuration:INFINITY];
          id v36 = dispatch_group_create();
          long long v37 = [MEMORY[0x1E4F1CA48] array];
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v38 = self->_providers;
          uint64_t v39 = [(NSSet *)v38 countByEnumeratingWithState:&v56 objects:v60 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v57;
            do
            {
              for (uint64_t i = 0; i != v40; ++i)
              {
                if (*(void *)v57 != v41) {
                  objc_enumerationMutation(v38);
                }
                double v43 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                if (![v43 requiresRoutineEnablement]
                  || [(RTDeviceLocationPredictor *)self routineEnabled])
                {
                  dispatch_group_enter(v36);
                  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
                  v52[0] = MEMORY[0x1E4F143A8];
                  v52[1] = 3221225472;
                  v52[2] = __85__RTDeviceLocationPredictor__fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke;
                  v52[3] = &unk_1E6B99710;
                  v52[4] = self;
                  v52[5] = v43;
                  uint64_t v55 = v44;
                  id v53 = v37;
                  __int16 v54 = v36;
                  [v43 fetchPredictedExitDatesWithCriteria:v17 handler:v52];
                }
              }
              uint64_t v40 = [(NSSet *)v38 countByEnumeratingWithState:&v56 objects:v60 count:16];
            }
            while (v40);
          }

          uint64_t v45 = [(RTNotifier *)self queue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __85__RTDeviceLocationPredictor__fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_68;
          block[3] = &unk_1E6B90D08;
          id v50 = v37;
          objc_super v51 = v11;
          id v46 = v37;
          dispatch_group_notify(v36, v45, block);

          id v10 = v47;
          id v9 = v48;
        }
        goto LABEL_21;
      }
      id v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F5CFE8];
      uint64_t v65 = *MEMORY[0x1E4F28568];
      __int16 v66 = @"requires a valid date.";
      uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
      id v23 = &v66;
      id v24 = &v65;
    }
    else
    {
      id v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F5CFE8];
      uint64_t v69 = *MEMORY[0x1E4F28568];
      v70[0] = @"requires a valid location.";
      uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
      id v23 = (__CFString **)v70;
      id v24 = &v69;
    }
    int v17 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    double v34 = [v20 errorWithDomain:v21 code:7 userInfo:v17];
    v11[2](v11, 0, v34);

    goto LABEL_21;
  }
  int v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    long long v62 = "-[RTDeviceLocationPredictor _fetchPredictedExitDatesFromLocation:onDate:withHandler:]";
    __int16 v63 = 1024;
    LODWORD(v64) = 672;
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_21:
}

void __85__RTDeviceLocationPredictor__fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__RTDeviceLocationPredictor__fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_2;
  v12[3] = &unk_1E6B91E58;
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  uint64_t v18 = *(void *)(a1 + 64);
  id v16 = v9;
  id v17 = *(id *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __85__RTDeviceLocationPredictor__fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "provider %@, encountered error, %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = [*(id *)(a1 + 48) count];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v8 = v7 - *(double *)(a1 + 72);
      int v11 = 138412802;
      uint64_t v12 = v5;
      __int16 v13 = 2048;
      uint64_t v14 = v6;
      __int16 v15 = 2048;
      double v16 = v8;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "provider %@, returned %lu predicted exit dates, latency, %.3f", (uint8_t *)&v11, 0x20u);
    }

    if ([*(id *)(a1 + 48) count]) {
      [*(id *)(a1 + 56) addObjectsFromArray:*(void *)(a1 + 48)];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t __85__RTDeviceLocationPredictor__fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 withHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    int v11 = [(RTNotifier *)self queue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__RTDeviceLocationPredictor_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke;
    v13[3] = &unk_1E6B91490;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(v11, v13);
  }
  else
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[RTDeviceLocationPredictor fetchPredictedExitDatesFromLocation:onDate:withHandler:]";
      __int16 v19 = 1024;
      int v20 = 761;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __84__RTDeviceLocationPredictor_fetchPredictedExitDatesFromLocation_onDate_withHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPredictedExitDatesFromLocation:*(void *)(a1 + 40) onDate:*(void *)(a1 + 48) withHandler:*(void *)(a1 + 56)];
}

- (void)_fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 clientIdentifier:(id)a5 withHandler:(id)a6
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = (void (**)(id, void, void *))a6;
  if (v13)
  {
    if (!v10)
    {
      uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v61 = "-[RTDeviceLocationPredictor _fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:withHandler:]";
        __int16 v62 = 1024;
        LODWORD(v63) = 786;
        _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
      }

      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v68 = *MEMORY[0x1E4F28568];
      v69[0] = @"requires a valid startDate.";
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v18 = (__CFString **)v69;
      __int16 v19 = &v68;
      goto LABEL_14;
    }
    if (!v11)
    {
      uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v61 = "-[RTDeviceLocationPredictor _fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:withHandler:]";
        __int16 v62 = 1024;
        LODWORD(v63) = 795;
        _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate (in %s:%d)", buf, 0x12u);
      }

      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v66 = *MEMORY[0x1E4F28568];
      uint64_t v67 = @"requires a valid endDate.";
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v18 = &v67;
      __int16 v19 = &v66;
      goto LABEL_14;
    }
    [v11 timeIntervalSinceDate:v10];
    if (v14 < 0.0)
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v64 = *MEMORY[0x1E4F28568];
      uint64_t v65 = @"requires a valid startDate and endDate.";
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v18 = &v65;
      __int16 v19 = &v64;
LABEL_14:
      p_super = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
      id v23 = [v15 errorWithDomain:v16 code:7 userInfo:p_super];
      v13[2](v13, 0, v23);

      goto LABEL_15;
    }
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = [v10 stringFromDate];
      uint64_t v26 = [v11 stringFromDate];
      *(_DWORD *)buf = 138412546;
      uint64_t v61 = v25;
      __int16 v62 = 2112;
      __int16 v63 = v26;
      _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "Predicting LOIs the device may travel to between startDate, %@, endDate, %@", buf, 0x16u);
    }
    uint64_t v44 = v11;
    [v11 timeIntervalSinceDate:v10];
    double v28 = v27;
    id v29 = [[RTPredictedLocationsOfInterestCriteria alloc] initWithDistanceCalculator:self->_distanceCalculator];
    uint64_t v45 = v10;
    [(RTPredictedLocationsOfInterestCriteria *)v29 setReferenceDate:v10];
    [(RTPredictedLocationsOfInterestCriteria *)v29 setReferenceLocation:0];
    [(RTPredictedLocationsOfInterestCriteria *)v29 setWindowDuration:v28];
    double v30 = v28 * 20.0;
    if (v28 <= 0.0) {
      double v30 = 72000.0;
    }
    -[RTPredictedLocationsOfInterestCriteria setMaximumDistance:](v29, "setMaximumDistance:", v30, v13);
    [(RTPredictedLocationsOfInterestCriteria *)v29 setMinimumDistance:700.0];
    p_super = &v29->super;
    id v43 = v12;
    [(RTPredictedLocationsOfInterestCriteria *)v29 setClientIdentifier:v12];
    id v31 = dispatch_group_create();
    double v32 = [MEMORY[0x1E4F1CA48] array];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v33 = self->_providers;
    uint64_t v34 = [(NSSet *)v33 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v56 != v36) {
            objc_enumerationMutation(v33);
          }
          id v38 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          if (![v38 requiresRoutineEnablement]
            || [(RTDeviceLocationPredictor *)self routineEnabled])
          {
            dispatch_group_enter(v31);
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            v51[0] = MEMORY[0x1E4F143A8];
            v51[1] = 3221225472;
            v51[2] = __117__RTDeviceLocationPredictor__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke;
            v51[3] = &unk_1E6B99710;
            v51[4] = self;
            v51[5] = v38;
            uint64_t v54 = v39;
            id v52 = v32;
            id v53 = v31;
            [v38 fetchPredictedLocationsOfInterestWithCriteria:p_super handler:v51];
          }
        }
        uint64_t v35 = [(NSSet *)v33 countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v35);
    }

    uint64_t v40 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__RTDeviceLocationPredictor__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke_78;
    block[3] = &unk_1E6B914E0;
    void block[4] = self;
    id v47 = v32;
    id v10 = v45;
    id v48 = v45;
    id v11 = v44;
    id v49 = v44;
    __int16 v13 = v42;
    id v50 = v42;
    id v41 = v32;
    dispatch_group_notify(v31, v40, block);

    id v12 = v43;
  }
  else
  {
    p_super = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v61 = "-[RTDeviceLocationPredictor _fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:withHandler:]";
      __int16 v62 = 1024;
      LODWORD(v63) = 781;
      _os_log_error_impl(&dword_1D9BFA000, p_super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_15:
}

void __117__RTDeviceLocationPredictor__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __117__RTDeviceLocationPredictor__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke_2;
  v12[3] = &unk_1E6B91E58;
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  uint64_t v18 = *(void *)(a1 + 64);
  id v16 = v9;
  id v17 = *(id *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __117__RTDeviceLocationPredictor__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "provider %@, encountered error, %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = [*(id *)(a1 + 48) count];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v8 = v7 - *(double *)(a1 + 72);
      int v11 = 138412802;
      uint64_t v12 = v5;
      __int16 v13 = 2048;
      uint64_t v14 = v6;
      __int16 v15 = 2048;
      double v16 = v8;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "provider %@, returned %lu PLOIs, latency, %.3f", (uint8_t *)&v11, 0x20u);
    }

    if ([*(id *)(a1 + 48) count]) {
      [*(id *)(a1 + 56) addObjectsFromArray:*(void *)(a1 + 48)];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __117__RTDeviceLocationPredictor__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke_78(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _sortAndDedupePredictedLocationsOfInterest:*(void *)(a1 + 40)];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [v2 count];
    uint64_t v5 = [*(id *)(a1 + 48) stringFromDate];
    uint64_t v6 = [*(id *)(a1 + 56) stringFromDate];
    int v7 = 134218498;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "in total, found %lu predicted LOIs the device may travel to from all data sources between start date, %@, end date, %@", (uint8_t *)&v7, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 clientIdentifier:(id)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__RTDeviceLocationPredictor_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke;
  block[3] = &unk_1E6B914E0;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __116__RTDeviceLocationPredictor_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_withHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPredictedLocationsOfInterestBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) clientIdentifier:*(void *)(a1 + 56) withHandler:*(void *)(a1 + 64)];
}

- (void)_setupEvalMode
{
  id v3 = [(RTDeviceLocationPredictor *)self platform];
  int v4 = [v3 internalInstall];

  if (v4)
  {
    int out_token = 0;
    uint64_t v5 = (const char *)[@"Eval" UTF8String];
    uint64_t v6 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__RTDeviceLocationPredictor__setupEvalMode__block_invoke;
    v7[3] = &unk_1E6B99760;
    v7[4] = self;
    notify_register_dispatch(v5, &out_token, v6, v7);

    [(RTDeviceLocationPredictor *)self _updateEvalMode];
  }
}

uint64_t __43__RTDeviceLocationPredictor__setupEvalMode__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEvalMode];
}

- (void)_updateEvalMode
{
  [(RTDeviceLocationPredictor *)self setEvalPredictedLocationsOfInterest:0];
  [(RTDeviceLocationPredictor *)self setEvalPredictedExitDates:0];
  id v3 = [(RTDeviceLocationPredictor *)self platform];
  int v4 = [v3 internalInstall];

  if (v4)
  {
    uint64_t v5 = [(RTDeviceLocationPredictor *)self defaultsManager];
    uint64_t v6 = [v5 objectForKey:@"Eval"];

    int v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v8 = [v7 fileExistsAtPath:v6];

    if (v8)
    {
      __int16 v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
      if ([v9 count])
      {
        id v10 = [v9 objectForKey:@"RTPredictedLocationsOfInterest"];
        if (v10)
        {
          id v11 = [MEMORY[0x1E4F1CA48] array];
          [(RTDeviceLocationPredictor *)self setEvalPredictedLocationsOfInterest:v11];
        }
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __44__RTDeviceLocationPredictor__updateEvalMode__block_invoke;
        v15[3] = &unk_1E6B99788;
        v15[4] = self;
        [v10 enumerateObjectsUsingBlock:v15];
        id v12 = [v9 objectForKey:@"RTPredictedExitDates"];
        if (v12)
        {
          id v13 = objc_opt_new();
          [(RTDeviceLocationPredictor *)self setEvalPredictedExitDates:v13];
        }
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __44__RTDeviceLocationPredictor__updateEvalMode__block_invoke_159;
        v14[3] = &unk_1E6B99788;
        v14[4] = self;
        [v12 enumerateObjectsUsingBlock:v14];
      }
    }
  }
}

void __44__RTDeviceLocationPredictor__updateEvalMode__block_invoke(uint64_t a1, void *a2)
{
  v124[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 objectForKey:@"RTLocationOfInterest"];

  if (!v3) {
    goto LABEL_32;
  }
  int v4 = [v2 objectForKey:@"RTLocationOfInterest"];
  uint64_t v5 = [v4 objectForKey:@"Latitude"];
  [v5 doubleValue];
  double v7 = v6;

  int v8 = [v2 objectForKey:@"RTLocationOfInterest"];
  __int16 v9 = [v8 objectForKey:@"Longitude"];
  [v9 doubleValue];
  double v11 = v10;

  id v12 = [v2 objectForKey:@"RTLocationOfInterest"];
  id v13 = [v12 objectForKey:@"Uncertainty"];
  [v13 doubleValue];
  double v15 = v14;

  id v16 = [v2 objectForKey:@"RTLocationOfInterest"];
  id v17 = [v16 objectForKey:@"Confidence"];
  [v17 doubleValue];
  double v19 = v18;

  id v20 = [v2 objectForKey:@"RTLocationOfInterest"];
  id v21 = [v20 objectForKey:@"Type"];
  uint64_t v22 = [v21 integerValue];

  id v23 = [v2 objectForKey:@"RTLocationOfInterest"];
  id v24 = [v23 objectForKey:@"TypeSource"];
  uint64_t v98 = [v24 integerValue];

  uint64_t v25 = [v2 objectForKey:@"RTLocationOfInterest"];
  v101 = [v25 objectForKey:@"MapItemAddress"];

  uint64_t v114 = 0;
  v115 = (id *)&v114;
  uint64_t v116 = 0x3032000000;
  v117 = __Block_byref_object_copy__103;
  v118 = __Block_byref_object_dispose__103;
  id v119 = 0;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__103;
  v112 = __Block_byref_object_dispose__103;
  id v113 = 0;
  dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
  id v27 = objc_alloc(MEMORY[0x1E4F5CE48]);
  double v28 = (objc_class *)objc_opt_class();
  id v29 = NSStringFromClass(v28);
  v102 = (void *)[v27 initWithUseBackgroundTraits:1 analyticsIdentifier:v29];

  double v30 = *(void **)(*(void *)(a1 + 32) + 80);
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __44__RTDeviceLocationPredictor__updateEvalMode__block_invoke_2;
  v104[3] = &unk_1E6B905F0;
  v106 = &v114;
  v107 = &v108;
  id v31 = v26;
  v105 = v31;
  [v30 fetchMapItemsFromAddressString:v101 options:v102 handler:v104];
  double v32 = v31;
  uint64_t v33 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v34 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v32, v34)) {
    goto LABEL_7;
  }
  uint64_t v35 = [MEMORY[0x1E4F1C9C8] now];
  [v35 timeIntervalSinceDate:v33];
  double v37 = v36;
  id v38 = objc_opt_new();
  uint64_t v39 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_373];
  uint64_t v40 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v41 = [v40 filteredArrayUsingPredicate:v39];
  double v42 = [v41 firstObject];

  [v38 submitToCoreAnalytics:v42 type:1 duration:v37];
  id v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v44 = (void *)MEMORY[0x1E4F28C58];
  v124[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v124 count:1];
  id v46 = [v44 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v45];

  if (v46)
  {
    id v47 = v46;

    char v48 = 0;
  }
  else
  {
LABEL_7:
    id v47 = 0;
    char v48 = 1;
  }

  id v97 = v47;
  if ((v48 & 1) == 0) {
    objc_storeStrong(v115 + 5, v47);
  }
  if (v115[5])
  {
    id v49 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      uint64_t v50 = [(id)v109[5] count];
      id v51 = v115[5];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v50;
      __int16 v122 = 2112;
      id v123 = v51;
      _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_INFO, "error geocoding eval mapItems, %lu, error, %@", buf, 0x16u);
    }
  }
  id v52 = [v2 objectForKey:@"RTLocationOfInterest"];
  v100 = [v52 objectForKey:@"CustomLabel"];

  id v53 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithLatitude:0 longitude:v7 horizontalUncertainty:v11 date:v15];
  id v54 = objc_alloc(MEMORY[0x1E4F5CE10]);
  long long v55 = [MEMORY[0x1E4F29128] UUID];
  long long v56 = [(id)v109[5] firstObject];
  long long v57 = (void *)[v54 initWithLocation:v53 confidence:v55 identifier:v22 type:v98 typeSource:0 visits:v100 customLabel:v19 mapItem:v56];

  long long v58 = [v2 objectForKey:@"RTSourceCoreRoutineLearnedLocation"];

  if (v58) {
    goto LABEL_15;
  }
  long long v60 = [v2 objectForKey:@"RTSourceCoreRoutineVehicleEvent"];

  if (v60)
  {
    id v61 = objc_alloc(MEMORY[0x1E4F5CE00]);
    __int16 v62 = [MEMORY[0x1E4F1C9C8] date];
    __int16 v63 = [v61 initWithLatitude:v62 longitude:v7 horizontalUncertainty:v11 date:v15];

    id v64 = objc_alloc(MEMORY[0x1E4F5CFC0]);
    uint64_t v65 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v66 = [MEMORY[0x1E4F29128] UUID];
    LOBYTE(v95) = 1;
    uint64_t v67 = (void *)[v64 initWithDate:v65 location:v63 vehicleIdentifier:@"el camino" userSetLocation:0 notes:@"You got a fast car. Is it fast enough so we can fly away?" identifier:v66 photo:0 mapItem:0 confirmed:v95];

    long long v59 = (void *)[objc_alloc(MEMORY[0x1E4F5CEF0]) initWithVehicleEvent:v67];
    goto LABEL_20;
  }
  uint64_t v68 = [v2 objectForKey:@"RTSourceEventKit"];

  if (v68)
  {
    uint64_t v69 = [v2 objectForKey:@"RTSourceEventKit"];
    __int16 v63 = [v69 objectForKey:@"EventTitle"];

    uint64_t v70 = [v2 objectForKey:@"RTSourceEventKit"];
    __int16 v71 = [v70 objectForKey:@"EventLocation"];

    id v96 = objc_alloc(MEMORY[0x1E4F5CEF8]);
    v99 = [MEMORY[0x1E4F29128] UUID];
    double v72 = [v99 UUIDString];
    uint64_t v73 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:3600.0];
    v74 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:7200.0];
    long long v59 = (void *)[v96 initWithEventIdentifier:v72 startDate:v73 endDate:v74 title:v63 location:v71 allDay:0 sharingStatus:0];

    goto LABEL_20;
  }
  v86 = [v2 objectForKey:@"RTSourceMapsSupportFavoritePlace"];

  if (!v86)
  {
    v87 = [v2 objectForKey:@"RTSourceMapsSupportHistoryEntryRoute"];

    if (v87)
    {
      v88 = [v2 objectForKey:@"RTSourceMapsSupportHistoryEntryRoute"];
      v89 = [v88 objectForKey:@"NavigationWasInterrupted"];
      uint64_t v90 = [v89 BOOLValue];

      id v91 = objc_alloc(MEMORY[0x1E4F5CF18]);
      __int16 v63 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:900.0];
      uint64_t v92 = [v91 initWithUsageDate:v63 navigationWasInterrupted:v90];
    }
    else
    {
      v93 = [v2 objectForKey:@"RTSourceMapsSupportHistoryEntryPlaceDisplay"];

      if (!v93)
      {
        __int16 v63 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v2;
          _os_log_error_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_ERROR, "unsupported eval ploi, %@", buf, 0xCu);
        }
        long long v59 = 0;
        goto LABEL_20;
      }
      id v94 = objc_alloc(MEMORY[0x1E4F5CF10]);
      __int16 v63 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-900.0];
      uint64_t v92 = [v94 initWithUsageDate:v63];
    }
    long long v59 = (void *)v92;
LABEL_20:

    goto LABEL_21;
  }
LABEL_15:
  long long v59 = objc_opt_new();
LABEL_21:
  uint64_t v75 = [v2 objectForKey:@"Confidence"];
  [v75 doubleValue];
  double v77 = v76;

  v78 = [v2 objectForKey:@"NextEntryTime"];
  [v78 doubleValue];
  double v80 = v79;

  if (v80 <= 0.0)
  {
    v81 = 0;
  }
  else
  {
    v81 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v80];
  }
  id v82 = objc_alloc(MEMORY[0x1E4F5CEA0]);
  if (v59)
  {
    v120 = v59;
    v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
  }
  else
  {
    v83 = 0;
  }
  v84 = (void *)[v82 initWithLocationOfInterest:v57 confidence:v81 nextEntryTime:0 modeOfTransportation:v83 sources:v77];
  if (v59) {

  }
  if (v84)
  {
    v85 = [*(id *)(a1 + 32) evalPredictedLocationsOfInterest];
    [v85 addObject:v84];
  }
  _Block_object_dispose(&v108, 8);

  _Block_object_dispose(&v114, 8);
LABEL_32:
}

void __44__RTDeviceLocationPredictor__updateEvalMode__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __44__RTDeviceLocationPredictor__updateEvalMode__block_invoke_159(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 objectForKey:@"ExitDate"];
  [v4 doubleValue];
  double v6 = v5;

  if (v6 <= 0.0)
  {
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v6];
  }
  double v7 = [v3 objectForKey:@"Uncertainty"];
  [v7 doubleValue];
  double v9 = v8;

  double v10 = [v3 objectForKey:@"Confidence"];

  [v10 doubleValue];
  double v12 = v11;

  if (v16)
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F5CE98]) initWithDate:v16 uncertainty:v9 confidence:v12];
    if (v13)
    {
      double v14 = [*(id *)(a1 + 32) evalPredictedExitDates];
      [v14 addObject:v13];
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_onAuthorizationNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [v5 name];
  double v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    -[RTDeviceLocationPredictor setRoutineEnabled:](self, "setRoutineEnabled:", [v5 enabled]);
    double v9 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = [(RTDeviceLocationPredictor *)self routineEnabled];
      double v11 = @"NO";
      if (v10) {
        double v11 = @"YES";
      }
      int v14 = 138412290;
      double v15 = v11;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "Updated routine enabled %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    double v9 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      double v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v13 = [v5 name];
      int v14 = 138412546;
      double v15 = v12;
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)_onLearnedLocationManagerNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [v5 name];
  double v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    double v9 = [(RTDeviceLocationPredictor *)self learnedLocationManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__RTDeviceLocationPredictor__onLearnedLocationManagerNotification___block_invoke;
    v13[3] = &unk_1E6B94E10;
    v13[4] = self;
    id v14 = v5;
    [v9 fetchRecentLocationsOfInterestWithHandler:v13];
  }
  else
  {
    BOOL v10 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      double v11 = NSStringFromSelector(a2);
      double v12 = [v5 name];
      *(_DWORD *)buf = 138412546;
      __int16 v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", buf, 0x16u);
    }
  }
}

void __67__RTDeviceLocationPredictor__onLearnedLocationManagerNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__RTDeviceLocationPredictor__onLearnedLocationManagerNotification___block_invoke_2;
  block[3] = &unk_1E6B92F80;
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __67__RTDeviceLocationPredictor__onLearnedLocationManagerNotification___block_invoke_2(uint64_t a1)
{
  id v2 = [RTStateModel alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) metricManager];
  uint64_t v5 = [*(id *)(a1 + 40) queue];
  double v6 = [(RTStateModel *)v2 initWithLearnedLocationsOfInterest:v3 metricManager:v4 queue:v5];

  [*(id *)(a1 + 48) intervalSinceLastUpdate];
  -[RTStateModel collectMetricsWithIntervalSinceLastUpdate:](v6, "collectMetricsWithIntervalSinceLastUpdate:");
}

- (void)onAuthorizationNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__RTDeviceLocationPredictor_onAuthorizationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__RTDeviceLocationPredictor_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onAuthorizationNotification:*(void *)(a1 + 40)];
}

- (void)onLearnedLocationManagerNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__RTDeviceLocationPredictor_onLearnedLocationManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __66__RTDeviceLocationPredictor_onLearnedLocationManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLearnedLocationManagerNotification:*(void *)(a1 + 40)];
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (void)setRoutineEnabled:(BOOL)a3
{
  self->_routineEnabled = a3;
}

- (RTNextPredictedLocationsOfInterestCache)nextPredictedLocationsOfInterestCache
{
  return self->_nextPredictedLocationsOfInterestCache;
}

- (void)setNextPredictedLocationsOfInterestCache:(id)a3
{
}

- (BOOL)encryptedDataAvailabilityNotificationNeeded
{
  return self->_encryptedDataAvailabilityNotificationNeeded;
}

- (void)setEncryptedDataAvailabilityNotificationNeeded:(BOOL)a3
{
  self->_encryptedDataAvailabilityNotificationNeeded = a3;
}

- (BOOL)pendingNextPredictedLocationsOfInterestRequest
{
  return self->_pendingNextPredictedLocationsOfInterestRequest;
}

- (void)setPendingNextPredictedLocationsOfInterestRequest:(BOOL)a3
{
  self->_pendingNextPredictedLocationsOfInterestRequest = a3;
}

- (OS_dispatch_source)nextPredictedLocationsOfInterestPollLocationTimer
{
  return self->_nextPredictedLocationsOfInterestPollLocationTimer;
}

- (void)setNextPredictedLocationsOfInterestPollLocationTimer:(id)a3
{
}

- (NSArray)nextPredictedLocationsOfInterest
{
  return self->_nextPredictedLocationsOfInterest;
}

- (void)setNextPredictedLocationsOfInterest:(id)a3
{
}

- (double)nextPredictedLocationsOfInterestProcessInterval
{
  return self->_nextPredictedLocationsOfInterestProcessInterval;
}

- (void)setNextPredictedLocationsOfInterestProcessInterval:(double)a3
{
  self->_nextPredictedLocationsOfInterestProcessInterval = a3;
}

- (double)nextPredictedLocationsOfInterestPollLocationInterval
{
  return self->_nextPredictedLocationsOfInterestPollLocationInterval;
}

- (void)setNextPredictedLocationsOfInterestPollLocationInterval:(double)a3
{
  self->_nextPredictedLocationsOfInterestPollLocationInterval = a3;
}

- (void)setEvalPredictedLocationsOfInterest:(id)a3
{
}

- (NSMutableArray)evalPredictedExitDates
{
  return self->_evalPredictedExitDates;
}

- (void)setEvalPredictedExitDates:(id)a3
{
}

- (NSSet)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_evalPredictedExitDates, 0);
  objc_storeStrong((id *)&self->_evalPredictedLocationsOfInterest, 0);
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterest, 0);
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterestPollLocationTimer, 0);
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterestCache, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);

  objc_storeStrong((id *)&self->_authorizationManager, 0);
}

@end