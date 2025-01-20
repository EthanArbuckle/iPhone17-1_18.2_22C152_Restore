@interface RTPredictedLocationOfInterestProviderStateModel
- (BOOL)encryptedDataAvailabilityNotificationNeeded;
- (BOOL)requiresRoutineEnablement;
- (OS_dispatch_queue)queue;
- (RTDataProtectionManager)dataProtectionManager;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationManager)locationManager;
- (RTMetricManager)metricManager;
- (RTNextPredictedLocationsOfInterestCache)nextPredictedLocationsOfInterestCache;
- (RTPredictedLocationOfInterestProviderStateModel)init;
- (RTPredictedLocationOfInterestProviderStateModel)initWithDataProtectionManager:(id)a3 learnedLocationManager:(id)a4 locationManager:(id)a5 metricManager:(id)a6 cache:(id)a7;
- (int64_t)encryptedDataAvailability;
- (void)fetchNextPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4;
- (void)fetchPredictedExitDatesWithCriteria:(id)a3 handler:(id)a4;
- (void)fetchPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4;
- (void)onCacheEnabledDidChange:(BOOL)a3;
- (void)onDataProtectionNotification:(id)a3;
- (void)setEncryptedDataAvailability:(int64_t)a3;
- (void)setEncryptedDataAvailabilityNotificationNeeded:(BOOL)a3;
- (void)updateEncryptedDataAvailabilityNotificationNeeded;
@end

@implementation RTPredictedLocationOfInterestProviderStateModel

- (BOOL)requiresRoutineEnablement
{
  return 1;
}

- (void)fetchNextPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 referenceLocation];
  v9 = [v6 referenceDate];
  [v6 windowDuration];
  uint64_t v11 = v10;
  v12 = [(RTPredictedLocationOfInterestProviderStateModel *)self learnedLocationManager];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __109__RTPredictedLocationOfInterestProviderStateModel_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke;
  v17[3] = &unk_1E6B9B340;
  v17[4] = self;
  id v18 = v8;
  id v19 = v6;
  id v20 = v9;
  uint64_t v22 = v11;
  id v21 = v7;
  id v13 = v7;
  id v14 = v9;
  id v15 = v6;
  id v16 = v8;
  [v12 fetchRecentLocationsOfInterestWithHandler:v17];
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

void __109__RTPredictedLocationOfInterestProviderStateModel_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "fetch cached next PLOIs", buf, 2u);
    }

    v3 = [*(id *)(a1 + 40) nextPredictedLocationsOfInterestCache];
    v4 = [v3 getCachedNextPredictedLocationsOfInterest];

    if ([(RTStateModel *)v4 count])
    {
      v25 = [MEMORY[0x1E4F1CA48] array];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v24 = v4;
      v5 = v4;
      uint64_t v6 = [(RTStateModel *)v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v27 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            [*(id *)(a1 + 48) latitude];
            [*(id *)(a1 + 48) longitude];
            uint64_t v11 = [v10 locationOfInterest];
            v12 = [v11 location];
            [v12 latitude];
            id v13 = [v10 locationOfInterest];
            id v14 = [v13 location];
            [v14 longitude];
            RTCommonCalculateDistanceHighPrecision();
            double v16 = v15;

            [*(id *)(a1 + 56) minimumDistance];
            if (v16 <= v17)
            {
              id v18 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v31 = v10;
                _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "dropping ploi, %@, too close to current location", buf, 0xCu);
              }
            }
            else
            {
              [v25 addObject:v10];
            }
          }
          uint64_t v7 = [(RTStateModel *)v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v7);
      }

      id v19 = v25;
      v4 = v24;
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v20 = [RTStateModel alloc];
    uint64_t v21 = *(void *)(a1 + 64);
    uint64_t v22 = [*(id *)(a1 + 40) metricManager];
    v23 = [*(id *)(a1 + 40) queue];
    v4 = [(RTStateModel *)v20 initWithLearnedLocationsOfInterest:v21 metricManager:v22 queue:v23];

    id v19 = [(RTStateModel *)v4 getNextPredictedLocationsOfInterestFromLocation:*(void *)(a1 + 48) startDate:*(void *)(a1 + 72) timeInterval:*(double *)(a1 + 88)];
  }

  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

void __109__RTPredictedLocationOfInterestProviderStateModel_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __109__RTPredictedLocationOfInterestProviderStateModel_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_2;
  v12[3] = &unk_1E6B9B318;
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v9;
  id v16 = *(id *)(a1 + 48);
  id v17 = v5;
  id v18 = *(id *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 72);
  id v19 = *(id *)(a1 + 64);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (RTPredictedLocationOfInterestProviderStateModel)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDataProtectionManager_learnedLocationManager_locationManager_metricManager_cache_);
}

- (RTPredictedLocationOfInterestProviderStateModel)initWithDataProtectionManager:(id)a3 learnedLocationManager:(id)a4 locationManager:(id)a5 metricManager:(id)a6 cache:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v36 = a4;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[RTPredictedLocationOfInterestProviderStateModel initWithDataProtectionManager:learnedLocationManager:locat"
            "ionManager:metricManager:cache:]";
      __int16 v40 = 1024;
      int v41 = 57;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataProtectionManager (in %s:%d)", buf, 0x12u);
    }

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[RTPredictedLocationOfInterestProviderStateModel initWithDataProtectionManager:learnedLocationManager:locatio"
          "nManager:metricManager:cache:]";
    __int16 v40 = 1024;
    int v41 = 58;
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationManager (in %s:%d)", buf, 0x12u);
  }

  if (v14)
  {
LABEL_4:
    if (v15) {
      goto LABEL_5;
    }
LABEL_22:
    long long v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[RTPredictedLocationOfInterestProviderStateModel initWithDataProtectionManager:learnedLocationManager:locat"
            "ionManager:metricManager:cache:]";
      __int16 v40 = 1024;
      int v41 = 60;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: metricManager (in %s:%d)", buf, 0x12u);
    }

    if (v16) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_19:
  v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[RTPredictedLocationOfInterestProviderStateModel initWithDataProtectionManager:learnedLocationManager:locatio"
          "nManager:metricManager:cache:]";
    __int16 v40 = 1024;
    int v41 = 59;
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager (in %s:%d)", buf, 0x12u);
  }

  if (!v15) {
    goto LABEL_22;
  }
LABEL_5:
  if (v16)
  {
LABEL_6:
    id v17 = 0;
    if (v12 && v13 && v14 && v15)
    {
      v37.receiver = self;
      v37.super_class = (Class)RTPredictedLocationOfInterestProviderStateModel;
      id v18 = [(RTPredictedLocationOfInterestProviderStateModel *)&v37 init];
      id v19 = v18;
      if (v18)
      {
        id v33 = a5;
        id v34 = a6;
        uint64_t v20 = v18;
        uint64_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v22 = (const char *)[(RTPredictedLocationOfInterestProviderStateModel *)v20 UTF8String];
        }
        else
        {
          [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v20];
          id v32 = a7;
          id v28 = objc_claimAutoreleasedReturnValue();
          uint64_t v22 = (const char *)[v28 UTF8String];

          a7 = v32;
        }
        dispatch_queue_t v29 = dispatch_queue_create(v22, v21);

        queue = v20->_queue;
        v20->_queue = (OS_dispatch_queue *)v29;

        objc_storeStrong((id *)&v20->_dataProtectionManager, a3);
        objc_storeStrong((id *)&v20->_learnedLocationManager, v36);
        objc_storeStrong((id *)&v20->_locationManager, v33);
        objc_storeStrong((id *)&v20->_metricManager, v34);
        objc_storeStrong((id *)&v20->_nextPredictedLocationsOfInterestCache, a7);
        [(RTNextPredictedLocationsOfInterestCache *)v20->_nextPredictedLocationsOfInterestCache setDelegate:v20];
      }
      self = v19;
      id v17 = self;
    }
    goto LABEL_31;
  }
LABEL_25:
  long long v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[RTPredictedLocationOfInterestProviderStateModel initWithDataProtectionManager:learnedLocationManager:locatio"
          "nManager:metricManager:cache:]";
    __int16 v40 = 1024;
    int v41 = 61;
    _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cache (in %s:%d)", buf, 0x12u);
  }

  id v17 = 0;
LABEL_31:

  return v17;
}

- (void)updateEncryptedDataAvailabilityNotificationNeeded
{
  v3 = [(RTPredictedLocationOfInterestProviderStateModel *)self nextPredictedLocationsOfInterestCache];
  uint64_t v4 = [v3 enabled];

  [(RTPredictedLocationOfInterestProviderStateModel *)self setEncryptedDataAvailabilityNotificationNeeded:v4];
}

- (void)setEncryptedDataAvailabilityNotificationNeeded:(BOOL)a3
{
  if (self->_encryptedDataAvailabilityNotificationNeeded != a3)
  {
    self->_encryptedDataAvailabilityNotificationNeeded = a3;
    if (a3)
    {
      id v5 = [(RTPredictedLocationOfInterestProviderStateModel *)self dataProtectionManager];
      uint64_t v4 = +[RTNotification notificationName];
      [v5 addObserver:self selector:sel_onDataProtectionNotification_ name:v4];
    }
    else
    {
      [(RTPredictedLocationOfInterestProviderStateModel *)self setEncryptedDataAvailability:1];
      id v5 = [(RTPredictedLocationOfInterestProviderStateModel *)self dataProtectionManager];
      uint64_t v4 = +[RTNotification notificationName];
      [v5 removeObserver:self fromNotification:v4];
    }
  }
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  if (self->_encryptedDataAvailability != a3)
  {
    self->_encryptedDataAvailability = a3;
    if (a3 == 3)
    {
      uint64_t v4 = [(RTPredictedLocationOfInterestProviderStateModel *)self nextPredictedLocationsOfInterestCache];
      int v5 = [v4 enabled];

      if (v5)
      {
        id v6 = [(RTPredictedLocationOfInterestProviderStateModel *)self locationManager];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke;
        v8[3] = &unk_1E6B96E38;
        v8[4] = self;
        [v6 fetchCurrentLocationWithHandler:v8];
      }
    }
    else if (a3 == 2)
    {
      id v7 = [(RTPredictedLocationOfInterestProviderStateModel *)self nextPredictedLocationsOfInterestCache];
      [v7 clear];
    }
  }
}

void __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke_2;
  v7[3] = &unk_1E6B90BF0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) learnedLocationManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke_3;
  v5[3] = &unk_1E6B94E10;
  v5[4] = *(void *)(a1 + 40);
  id v6 = v2;
  id v4 = v2;
  [v3 fetchRecentLocationsOfInterestWithHandler:v5];
}

void __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke_4;
  block[3] = &unk_1E6B92F80;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __80__RTPredictedLocationOfInterestProviderStateModel_setEncryptedDataAvailability___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [RTStateModel alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) metricManager];
  uint64_t v5 = [*(id *)(a1 + 40) queue];
  uint64_t v10 = [(RTStateModel *)v2 initWithLearnedLocationsOfInterest:v3 metricManager:v4 queue:v5];

  if ([*(id *)(a1 + 40) encryptedDataAvailability] == 3)
  {
    id v6 = [*(id *)(a1 + 40) nextPredictedLocationsOfInterestCache];
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = [(RTStateModel *)v10 getNextPredictedLocationsOfInterestFromLocation:v7 startDate:v8 timeInterval:14400.0];
    [v6 cacheNextPredictedLocationsOfInterest:v9];
  }
}

- (void)onCacheEnabledDidChange:(BOOL)a3
{
  uint64_t v5 = [(RTPredictedLocationOfInterestProviderStateModel *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__RTPredictedLocationOfInterestProviderStateModel_onCacheEnabledDidChange___block_invoke;
  v6[3] = &unk_1E6B90F08;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __75__RTPredictedLocationOfInterestProviderStateModel_onCacheEnabledDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onCacheEnabledDidChange:*(unsigned __int8 *)(a1 + 40)];
}

- (void)onDataProtectionNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTPredictedLocationOfInterestProviderStateModel *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__RTPredictedLocationOfInterestProviderStateModel_onDataProtectionNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __80__RTPredictedLocationOfInterestProviderStateModel_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) name];
  uint64_t v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) availability];
    id v6 = *(void **)(a1 + 40);
    [v6 setEncryptedDataAvailability:v5];
  }
  else
  {
    BOOL v7 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [*(id *)(a1 + 32) name];
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "unhandled RTDataProtectionManager notification, %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)fetchPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [(RTPredictedLocationOfInterestProviderStateModel *)self learnedLocationManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __105__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedLocationsOfInterestWithCriteria_handler___block_invoke;
  v12[3] = &unk_1E6B91A68;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  [v9 fetchRecentLocationsOfInterestWithHandler:v12];
}

void __105__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedLocationsOfInterestWithCriteria_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedLocationsOfInterestWithCriteria_handler___block_invoke_2;
  block[3] = &unk_1E6B90FA8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v5;
  id v13 = v6;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v9;
  long long v14 = v9;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __105__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedLocationsOfInterestWithCriteria_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [RTStateModel alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) metricManager];
  uint64_t v5 = [*(id *)(a1 + 40) queue];
  id v6 = [(RTStateModel *)v2 initWithLearnedLocationsOfInterest:v3 metricManager:v4 queue:v5];

  id v7 = [(RTStateModel *)v6 getPredictedLocationsOfInterestWithCriteria:*(void *)(a1 + 48)];
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    long long v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v10 = 138412546;
    id v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = [v7 count];
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@ found %lu PLOIs from state model", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchPredictedExitDatesWithCriteria:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTPredictedLocationOfInterestProviderStateModel *)self learnedLocationManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedExitDatesWithCriteria_handler___block_invoke;
  v11[3] = &unk_1E6B9B368;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 fetchRecentLocationsOfInterestWithHandler:v11];
}

void __95__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedExitDatesWithCriteria_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedExitDatesWithCriteria_handler___block_invoke_2;
  block[3] = &unk_1E6B926B8;
  id v13 = v6;
  id v17 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v14 = v5;
  uint64_t v15 = v8;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void __95__RTPredictedLocationOfInterestProviderStateModel_fetchPredictedExitDatesWithCriteria_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = [RTStateModel alloc];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) metricManager];
    id v6 = [*(id *)(a1 + 48) queue];
    id v7 = [(RTStateModel *)v3 initWithLearnedLocationsOfInterest:v4 metricManager:v5 queue:v6];

    uint64_t v8 = [*(id *)(a1 + 56) referenceLocation];
    id v9 = [*(id *)(a1 + 56) referenceDate];
    id v10 = [(RTStateModel *)v7 getPredictedExitDatesFromLocation:v8 onDate:v9];

    id v11 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      uint64_t v13 = [v10 count];
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "found %lu predicted exit dates", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTNextPredictedLocationsOfInterestCache)nextPredictedLocationsOfInterestCache
{
  return self->_nextPredictedLocationsOfInterestCache;
}

- (int64_t)encryptedDataAvailability
{
  return self->_encryptedDataAvailability;
}

- (BOOL)encryptedDataAvailabilityNotificationNeeded
{
  return self->_encryptedDataAvailabilityNotificationNeeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextPredictedLocationsOfInterestCache, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end