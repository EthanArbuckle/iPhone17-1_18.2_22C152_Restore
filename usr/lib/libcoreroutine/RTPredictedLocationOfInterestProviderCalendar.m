@interface RTPredictedLocationOfInterestProviderCalendar
+ (BOOL)reasonableDistanceBetweenEventLocation:(id)a3 andLocation:(id)a4;
- (BOOL)requiresRoutineEnablement;
- (OS_dispatch_queue)queue;
- (RTEventManager)eventManager;
- (RTEventModelProvider)eventModelProvider;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTMapServiceManager)mapServiceManager;
- (RTPredictedLocationOfInterestProviderCalendar)init;
- (RTPredictedLocationOfInterestProviderCalendar)initWithEventManager:(id)a3 eventModelProvider:(id)a4 learnedLocationManager:(id)a5 mapServiceManager:(id)a6;
- (void)_fetchLocationOfInterestForEvent:(id)a3 clientIdentifier:(id)a4 handler:(id)a5;
- (void)_fetchPredictedLocationOfInterestAtEvent:(id)a3 clientIdentifier:(id)a4 handler:(id)a5;
- (void)_fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 clientIdentifier:(id)a5 handler:(id)a6;
- (void)_fetchPredictedLocationsOfInterestOnDate:(id)a3 clientIdentifier:(id)a4 handler:(id)a5;
- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 clientIdentifier:(id)a6 handler:(id)a7;
- (void)fetchNextPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4;
- (void)fetchPredictedExitDatesWithCriteria:(id)a3 handler:(id)a4;
- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 clientIdentifier:(id)a5 handler:(id)a6;
- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 clientIdentifier:(id)a4 handler:(id)a5;
- (void)fetchPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4;
- (void)setEventManager:(id)a3;
- (void)setEventModelProvider:(id)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation RTPredictedLocationOfInterestProviderCalendar

void __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)requiresRoutineEnablement
{
  return 0;
}

- (void)fetchNextPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [v7 referenceLocation];
  v8 = [v7 referenceDate];
  [v7 windowDuration];
  double v10 = v9;
  id v11 = [v7 clientIdentifier];

  [(RTPredictedLocationOfInterestProviderCalendar *)self fetchNextPredictedLocationsOfInterestFromLocation:v12 startDate:v8 timeInterval:v11 clientIdentifier:v6 handler:v10];
}

- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 clientIdentifier:(id)a6 handler:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    v16 = [(RTPredictedLocationOfInterestProviderCalendar *)self queue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke;
    v18[3] = &unk_1E6B90C68;
    double v24 = a5;
    v19 = v13;
    v20 = self;
    id v23 = v15;
    id v21 = v14;
    id v22 = v12;
    dispatch_async(v16, v18);

    v17 = v19;
  }
  else
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTPredictedLocationOfInterestProviderCalendar fetchNextPredictedLocationsOfInterestFromLocation:startDate:"
            "timeInterval:clientIdentifier:handler:]";
      __int16 v27 = 1024;
      int v28 = 158;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v2 = [*(id *)(a1 + 32) dateByAddingTimeInterval:*(double *)(a1 + 72)];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__136;
  v57 = __Block_byref_object_dispose__136;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__136;
  v51 = __Block_byref_object_dispose__136;
  id v52 = 0;
  if (!*(void *)(*(void *)(a1 + 40) + 16)) {
    goto LABEL_9;
  }
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(*(void *)(a1 + 40) + 16);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_24;
  v43[3] = &unk_1E6B905F0;
  v45 = &v47;
  v46 = &v53;
  id v6 = v3;
  v44 = v6;
  [v5 fetchEventsBetweenStartDate:v4 andEndDate:v2 includeSuggestions:0 withHandler:v43];
  id v7 = v6;
  v8 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v9 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v7, v9))
  {
    double v10 = [MEMORY[0x1E4F1C9C8] now];
    [v10 timeIntervalSinceDate:v8];
    double v12 = v11;
    id v13 = objc_opt_new();
    id v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_105];
    id v15 = [MEMORY[0x1E4F29060] callStackSymbols];
    v16 = [v15 filteredArrayUsingPredicate:v14];
    v17 = [v16 firstObject];

    [v13 submitToCoreAnalytics:v17 type:1 duration:v12];
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v19 = (void *)MEMORY[0x1E4F28C58];
    v64[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v64 count:1];
    id v21 = [v19 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v20];

    if (v21) {
  }
    }

  if (v54[5])
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
LABEL_9:
    dispatch_group_t v22 = dispatch_group_create();
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [(id)v48[5] count];
      id v25 = [*(id *)(a1 + 32) stringFromDate];
      v26 = [v2 stringFromDate];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v24;
      __int16 v60 = 2112;
      id v61 = v25;
      __int16 v62 = 2112;
      v63 = v26;
      _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "found %lu events between %@ and %@", buf, 0x20u);
    }
    __int16 v27 = (void *)v48[5];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_26;
    v37[3] = &unk_1E6B9B180;
    int v28 = v22;
    uint64_t v29 = *(void *)(a1 + 40);
    v30 = *(void **)(a1 + 48);
    v38 = v28;
    uint64_t v39 = v29;
    id v40 = v30;
    id v41 = *(id *)(a1 + 56);
    id v31 = v33;
    id v42 = v31;
    [v27 enumerateObjectsUsingBlock:v37];
    v32 = [*(id *)(a1 + 40) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_33;
    block[3] = &unk_1E6B90CE0;
    id v35 = v31;
    id v36 = *(id *)(a1 + 64);
    dispatch_group_notify(v28, v32, block);
  }
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

uint64_t __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_33(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  dispatch_semaphore_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"nextEntryTime" ascending:1];
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v2 sortUsingDescriptors:v4];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (RTPredictedLocationOfInterestProviderCalendar)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithEventManager_eventModelProvider_learnedLocationManager_mapServiceManager_);
}

- (RTPredictedLocationOfInterestProviderCalendar)initWithEventManager:(id)a3 eventModelProvider:(id)a4 learnedLocationManager:(id)a5 mapServiceManager:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
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
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v33 = "-[RTPredictedLocationOfInterestProviderCalendar initWithEventManager:eventModelProvider:learnedLocationManag"
            "er:mapServiceManager:]";
      __int16 v34 = 1024;
      int v35 = 114;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventManager (in %s:%d)", buf, 0x12u);
    }

    if (v12)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_17:
      dispatch_group_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v33 = "-[RTPredictedLocationOfInterestProviderCalendar initWithEventManager:eventModelProvider:learnedLocationMan"
              "ager:mapServiceManager:]";
        __int16 v34 = 1024;
        int v35 = 116;
        _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationManager (in %s:%d)", buf, 0x12u);
      }

      if (v14) {
        goto LABEL_5;
      }
      goto LABEL_20;
    }
  }
  id v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v33 = "-[RTPredictedLocationOfInterestProviderCalendar initWithEventManager:eventModelProvider:learnedLocationManager"
          ":mapServiceManager:]";
    __int16 v34 = 1024;
    int v35 = 115;
    _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventModelProvider (in %s:%d)", buf, 0x12u);
  }

  if (!v13) {
    goto LABEL_17;
  }
LABEL_4:
  if (v14)
  {
LABEL_5:
    id v15 = 0;
    if (v11 && v12 && v13)
    {
      v31.receiver = self;
      v31.super_class = (Class)RTPredictedLocationOfInterestProviderCalendar;
      v16 = [(RTPredictedLocationOfInterestProviderCalendar *)&v31 init];
      v17 = v16;
      if (v16)
      {
        id v30 = a5;
        v18 = v16;
        attr = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v19 = (const char *)[(RTPredictedLocationOfInterestProviderCalendar *)v18 UTF8String];
        }
        else
        {
          [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v18];
          id v28 = a6;
          id v24 = objc_claimAutoreleasedReturnValue();
          v19 = (const char *)[v24 UTF8String];

          a6 = v28;
        }
        dispatch_queue_t v25 = dispatch_queue_create(v19, attr);

        queue = v18->_queue;
        v18->_queue = (OS_dispatch_queue *)v25;

        objc_storeStrong((id *)&v18->_eventManager, a3);
        objc_storeStrong((id *)&v18->_eventModelProvider, a4);
        objc_storeStrong((id *)&v18->_learnedLocationManager, v30);
        objc_storeStrong((id *)&v18->_mapServiceManager, a6);
      }
      self = v17;
      id v15 = self;
    }
    goto LABEL_26;
  }
LABEL_20:
  id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v33 = "-[RTPredictedLocationOfInterestProviderCalendar initWithEventManager:eventModelProvider:learnedLocationManager"
          ":mapServiceManager:]";
    __int16 v34 = 1024;
    int v35 = 117;
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager (in %s:%d)", buf, 0x12u);
  }

  id v15 = 0;
LABEL_26:

  return v15;
}

+ (BOOL)reasonableDistanceBetweenEventLocation:(id)a3 andLocation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 latitude];
  [v6 longitude];

  [v5 latitude];
  [v5 longitude];

  RTCommonCalculateDistance();
  return v7 < 321868.0 && v7 > 700.0;
}

void __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_26(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = a3 + 1;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "event %lu, %@", buf, 0x16u);
  }

  uint64_t v7 = [v5 participationStatus];
  if (v7 == 4 || v7 == 2)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_27;
    v10[3] = &unk_1E6B9B158;
    v10[4] = v8;
    id v11 = *(id *)(a1 + 56);
    uint64_t v15 = a3;
    id v12 = v5;
    id v13 = *(id *)(a1 + 64);
    id v14 = *(id *)(a1 + 32);
    [v8 _fetchLocationOfInterestForEvent:v12 clientIdentifier:v9 handler:v10];
  }
}

void __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5CE00]);
    id v5 = [v3 location];
    [v5 latitude];
    double v7 = v6;
    v8 = [v3 location];
    [v8 longitude];
    double v10 = v9;
    id v11 = [v3 location];
    [v11 horizontalUncertainty];
    double v13 = v12;
    id v14 = [v3 location];
    [v14 altitude];
    double v16 = v15;
    uint64_t v17 = [v3 location];
    [v17 verticalUncertainty];
    id v19 = [v4 initWithLatitude:0 longitude:0 horizontalUncertainty:v7 altitude:v10 verticalUncertainty:v13 date:v16 referenceFrame:v18 speed:0.0];

    LODWORD(v8) = [(id)objc_opt_class() reasonableDistanceBetweenEventLocation:v19 andLocation:*(void *)(a1 + 40)];
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v21)
      {
        uint64_t v22 = *(void *)(a1 + 72) + 1;
        uint64_t v23 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134218498;
        uint64_t v34 = v22;
        __int16 v35 = 2112;
        uint64_t v36 = v23;
        __int16 v37 = 2112;
        id v38 = v3;
        _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "event %lu, %@, at locationOfInterest, %@", buf, 0x20u);
      }

      id v24 = objc_alloc(MEMORY[0x1E4F5CEA0]);
      dispatch_queue_t v25 = [*(id *)(a1 + 48) startDate];
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F5CEF8]) initWithEvent:*(void *)(a1 + 48)];
      v32 = v26;
      __int16 v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      uint64_t v20 = [v24 initWithLocationOfInterest:v3 confidence:v25 nextEntryTime:0 modeOfTransportation:v27 sources:1.0];

      [*(id *)(a1 + 56) addObject:v20];
    }
    else if (v21)
    {
      uint64_t v30 = *(void *)(a1 + 72) + 1;
      uint64_t v31 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      uint64_t v34 = v30;
      __int16 v35 = 2112;
      uint64_t v36 = v31;
      __int16 v37 = 2112;
      id v38 = v3;
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "event %lu, %@, at locationOfInterest, %@, is not a reasonable distance from the current location to suggest", buf, 0x20u);
    }
  }
  else
  {
    id v19 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = *(void *)(a1 + 72) + 1;
      uint64_t v29 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      uint64_t v34 = v28;
      __int16 v35 = 2112;
      uint64_t v36 = v29;
      __int16 v37 = 2112;
      id v38 = 0;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "event %lu, %@, locationOfInterest, %@", buf, 0x20u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (void)_fetchPredictedLocationsOfInterestOnDate:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [v10 dateByAddingTimeInterval:-7200.0];
  id v11 = [v10 dateByAddingTimeInterval:7200.0];

  [(RTPredictedLocationOfInterestProviderCalendar *)self _fetchPredictedLocationsOfInterestBetweenStartDate:v12 endDate:v11 clientIdentifier:v9 handler:v8];
}

- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [(RTPredictedLocationOfInterestProviderCalendar *)self queue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __114__RTPredictedLocationOfInterestProviderCalendar_fetchPredictedLocationsOfInterestOnDate_clientIdentifier_handler___block_invoke;
    v13[3] = &unk_1E6B91490;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(v11, v13);
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v18 = "-[RTPredictedLocationOfInterestProviderCalendar fetchPredictedLocationsOfInterestOnDate:clientIdentifier:handler:]";
      __int16 v19 = 1024;
      int v20 = 282;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __114__RTPredictedLocationOfInterestProviderCalendar_fetchPredictedLocationsOfInterestOnDate_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPredictedLocationsOfInterestOnDate:*(void *)(a1 + 40) clientIdentifier:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_fetchLocationOfInterestForEvent:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    goto LABEL_15;
  }
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__136;
  v58[4] = __Block_byref_object_dispose__136;
  id v59 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__136;
  v56[4] = __Block_byref_object_dispose__136;
  id v57 = 0;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__136;
  v54[4] = __Block_byref_object_dispose__136;
  id v55 = 0;
  id v11 = dispatch_group_create();
  id v12 = [v8 structuredLocation];
  double v13 = [v12 geoLocation];

  if (!v13)
  {
    if (self->_eventModelProvider)
    {
      dispatch_group_enter(v11);
      eventModelProvider = self->_eventModelProvider;
      int v20 = [v8 title];
      uint64_t v21 = [v8 location];
      uint64_t v22 = [v8 calendar];
      uint64_t v23 = [v22 calendarIdentifier];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_41;
      v45[3] = &unk_1E6B94A68;
      v48 = v58;
      v46 = v8;
      uint64_t v47 = v11;
      [(RTEventModelProvider *)eventModelProvider fetchLocationsOfInterestAssociatedToTitle:v20 location:v21 calendarIdentifier:v23 withHandler:v45];

      uint64_t v17 = v46;
      goto LABEL_12;
    }
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    id v24 = "Event model provider unavailable";
LABEL_11:
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, v24, buf, 2u);
    goto LABEL_12;
  }
  if (!self->_learnedLocationManager)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    id v24 = "Device location predictor unavailable";
    goto LABEL_11;
  }
  dispatch_group_enter(v11);
  id v14 = objc_alloc(MEMORY[0x1E4F5CE00]);
  id v15 = [v8 structuredLocation];
  id v16 = [v15 geoLocation];
  uint64_t v17 = [v14 initWithCLLocation:v16];

  learnedLocationManager = self->_learnedLocationManager;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke;
  v50[3] = &unk_1E6B9B1A8;
  uint64_t v53 = v58;
  id v51 = v8;
  id v52 = v11;
  [(RTLearnedLocationManager *)learnedLocationManager fetchLocationOfInterestAtLocation:v17 handler:v50];

LABEL_12:
  dispatch_queue_t v25 = [v8 structuredLocation];
  v26 = [v25 mapKitHandle];

  if (v26)
  {
    dispatch_group_enter(v11);
    id v27 = objc_alloc(MEMORY[0x1E4F5CE48]);
    uint64_t v28 = (objc_class *)objc_opt_class();
    uint64_t v29 = NSStringFromClass(v28);
    uint64_t v30 = (void *)[v27 initWithUseBackgroundTraits:1 analyticsIdentifier:v29 clientIdentifier:v9];

    mapServiceManager = self->_mapServiceManager;
    v32 = [v8 structuredLocation];
    id v33 = [v32 mapKitHandle];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_44;
    v40[3] = &unk_1E6B9B1F8;
    id v41 = v8;
    v43 = v56;
    v44 = v54;
    id v42 = v11;
    [(RTMapServiceManager *)mapServiceManager fetchMapItemFromHandle:v33 options:v30 handler:v40];
  }
  uint64_t v34 = [(RTPredictedLocationOfInterestProviderCalendar *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_46;
  block[3] = &unk_1E6B9B220;
  id v36 = v8;
  id v38 = v58;
  uint64_t v39 = v56;
  id v37 = v10;
  dispatch_group_notify(v11, v34, block);

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(v56, 8);

  _Block_object_dispose(v58, 8);
LABEL_15:
}

void __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F5CE10];
    id v4 = a2;
    uint64_t v5 = [[v3 alloc] initWithLearnedLocationOfInterest:v4];

    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    double v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "found loi, %@, at location of event, %@", (uint8_t *)&v11, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_2;
  v6[3] = &unk_1E6B9B1D0;
  v6[4] = *(void *)(a1 + 48);
  [a2 enumerateObjectsUsingBlock:v6];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "inferred loi, %@, for event, %@", buf, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v4 = [v8 visits];
  unint64_t v5 = [v4 count];
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) visits];
  unint64_t v7 = [v6 count];

  if (v5 > v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = [v5 address];
    int v16 = 138413058;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    __int16 v19 = v9;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "resolved mapItem from event, %@, to address, \"%@\", error, %@, resolvedMapItem, %@", (uint8_t *)&v16, 0x2Au);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
  id v15 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_46(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) structuredLocation];
  id v3 = [v2 geoLocation];
  if (v3)
  {
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

    if (!v4)
    {
      id v46 = 0;
      goto LABEL_33;
    }
  }
  id v5 = [*(id *)(a1 + 32) structuredLocation];
  id v6 = [v5 geoLocation];
  if (v6)
  {
    unint64_t v7 = [*(id *)(a1 + 32) structuredLocation];
    uint64_t v8 = [v7 geoLocation];
    [v8 coordinate];
    double v10 = v9;
  }
  else
  {
    unint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) location];
    [v7 latitude];
    double v10 = v11;
  }

  id v12 = [*(id *)(a1 + 32) structuredLocation];
  uint64_t v13 = [v12 geoLocation];
  if (v13)
  {
    uint64_t v14 = [*(id *)(a1 + 32) structuredLocation];
    id v15 = [v14 geoLocation];
    [v15 coordinate];
    double v17 = v16;
  }
  else
  {
    uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) location];
    [v14 longitude];
    double v17 = v18;
  }

  __int16 v19 = [*(id *)(a1 + 32) structuredLocation];
  __int16 v20 = [v19 geoLocation];
  if (v20)
  {
    id v21 = [*(id *)(a1 + 32) structuredLocation];
    __int16 v22 = [v21 geoLocation];
    [v22 horizontalAccuracy];
    double v24 = v23;
  }
  else
  {
    id v21 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) location];
    [v21 horizontalUncertainty];
    double v24 = v25;
  }

  v26 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v26)
  {
    id v27 = v26;
  }
  else
  {
    id v27 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) mapItem];
  }
  uint64_t v28 = v27;
  uint64_t v29 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier];
  uint64_t v30 = v29;
  if (v29)
  {
    id v31 = v29;
  }
  else
  {
    id v32 = objc_alloc(MEMORY[0x1E4F29128]);
    id v33 = [*(id *)(a1 + 32) UUID];
    uint64_t v34 = (void *)[v32 initWithUUIDString:v33];
    __int16 v35 = v34;
    if (v34)
    {
      id v36 = v34;
    }
    else
    {
      id v36 = [MEMORY[0x1E4F29128] UUID];
    }
    id v31 = v36;
  }
  id v37 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v37)
  {
    id v42 = 0;
    uint64_t v40 = 0;
    v44 = 0;
    uint64_t v38 = -1;
    goto LABEL_32;
  }
  uint64_t v38 = [v37 type];
  uint64_t v39 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v39)
  {
    id v42 = 0;
    uint64_t v40 = 0;
    goto LABEL_31;
  }
  uint64_t v40 = [v39 typeSource];
  id v41 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v41)
  {
    id v42 = 0;
    goto LABEL_31;
  }
  id v42 = [v41 visits];
  v43 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v43)
  {
LABEL_31:
    v44 = 0;
    goto LABEL_32;
  }
  v44 = [v43 customLabel];
LABEL_32:
  v45 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithLatitude:0 longitude:v10 horizontalUncertainty:v17 date:v24];
  id v46 = (id)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithLocation:v45 confidence:v31 identifier:v38 type:v40 typeSource:v42 visits:v44 customLabel:1.0 mapItem:v28];

LABEL_33:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchPredictedLocationOfInterestAtEvent:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __115__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationOfInterestAtEvent_clientIdentifier_handler___block_invoke;
    v10[3] = &unk_1E6B9B248;
    id v11 = v8;
    id v12 = v9;
    [(RTPredictedLocationOfInterestProviderCalendar *)self _fetchLocationOfInterestForEvent:v11 clientIdentifier:a4 handler:v10];
  }
}

void __115__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationOfInterestAtEvent_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F5CEA0];
    id v7 = a2;
    id v8 = [v6 alloc];
    id v9 = [*(id *)(a1 + 32) startDate];
    double v10 = (void *)[objc_alloc(MEMORY[0x1E4F5CEF8]) initWithEvent:*(void *)(a1 + 32)];
    v13[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v12 = (void *)[v8 initWithLocationOfInterest:v7 confidence:v9 nextEntryTime:0 modeOfTransportation:v11 sources:1.0];
  }
  else
  {
    id v12 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 clientIdentifier:(id)a5 handler:(id)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v39 = a4;
  id v36 = a5;
  double v10 = (void (**)(id, void))a6;
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v61 = 0;
  __int16 v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__136;
  v65 = __Block_byref_object_dispose__136;
  id v66 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  id v58 = __Block_byref_object_copy__136;
  id v59 = __Block_byref_object_dispose__136;
  id v60 = 0;
  id v11 = &off_1DA0FE000;
  if (!self->_eventManager) {
    goto LABEL_10;
  }
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  eventManager = self->_eventManager;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke;
  v51[3] = &unk_1E6B905F0;
  uint64_t v53 = &v55;
  v54 = &v61;
  uint64_t v14 = v12;
  id v52 = v14;
  -[RTEventManager fetchEventsBetweenStartDate:andEndDate:withHandler:](eventManager, "fetchEventsBetweenStartDate:andEndDate:withHandler:", v38, v39, v51, v36, v37);
  id v15 = v14;
  double v16 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v17 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v15, v17))
  {
    double v18 = [MEMORY[0x1E4F1C9C8] now];
    [v18 timeIntervalSinceDate:v16];
    double v20 = v19;
    id v21 = objc_opt_new();
    __int16 v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_105];
    double v23 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v24 = [v23 filteredArrayUsingPredicate:v22];
    double v25 = [v24 firstObject];

    [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v67 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v67 count:1];
    uint64_t v29 = [v27 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v28];

    if (v29) {
  }
    }

  id v11 = &off_1DA0FE000;
  if (v62[5])
  {
    if (v10) {
      v10[2](v10, 0);
    }
  }
  else
  {
LABEL_10:
    dispatch_group_t v30 = dispatch_group_create();
    id v31 = (void *)v56[5];
    uint64_t v43 = MEMORY[0x1E4F143A8];
    uint64_t v44 = *((void *)v11 + 473);
    uint64_t v32 = v44;
    v45 = __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_2;
    id v46 = &unk_1E6B9A920;
    id v33 = v30;
    uint64_t v47 = v33;
    v48 = self;
    id v49 = v36;
    id v34 = v37;
    id v50 = v34;
    [v31 enumerateObjectsUsingBlock:&v43];
    __int16 v35 = [(RTPredictedLocationOfInterestProviderCalendar *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = v32;
    block[2] = __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_4;
    block[3] = &unk_1E6B90D08;
    id v42 = v10;
    id v41 = v34;
    dispatch_group_notify(v33, v35, block);
  }
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
}

void __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_3;
  v7[3] = &unk_1E6B9B270;
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 32);
  [v5 _fetchPredictedLocationOfInterestAtEvent:v4 clientIdentifier:v6 handler:v7];
}

void __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_5;
  v8[3] = &unk_1E6B94858;
  id v9 = v2;
  id v4 = v2;
  id v5 = [v3 predicateWithBlock:v8];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = [*(id *)(a1 + 32) filteredArrayUsingPredicate:v5];
  (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
}

uint64_t __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 locationOfInterest];
  id v5 = [v4 identifier];

  if (!v5)
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityEvent);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v3;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "LOI doesn't have an identifier, dropping LOI, %@", (uint8_t *)&v15, 0xCu);
    }

    goto LABEL_7;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v3 locationOfInterest];
  id v8 = [v7 identifier];
  LOBYTE(v6) = [v6 containsObject:v8];

  if (v6)
  {
LABEL_7:
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  id v9 = *(void **)(a1 + 32);
  double v10 = [v3 locationOfInterest];
  id v11 = [v10 identifier];
  [v9 addObject:v11];

  uint64_t v12 = 1;
LABEL_8:

  return v12;
}

- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 clientIdentifier:(id)a5 handler:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    uint64_t v14 = [(RTPredictedLocationOfInterestProviderCalendar *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __132__RTPredictedLocationOfInterestProviderCalendar_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke;
    block[3] = &unk_1E6B914E0;
    void block[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    dispatch_async(v14, block);
  }
  else
  {
    int v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[RTPredictedLocationOfInterestProviderCalendar fetchPredictedLocationsOfInterestBetweenStartDate:endDate:cl"
            "ientIdentifier:handler:]";
      __int16 v23 = 1024;
      int v24 = 514;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __132__RTPredictedLocationOfInterestProviderCalendar_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPredictedLocationsOfInterestBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) clientIdentifier:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)fetchPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [v7 referenceDate];
  [v7 windowDuration];
  id v8 = [v11 dateByAddingTimeInterval:];
  id v9 = [v7 referenceDate];
  id v10 = [v7 clientIdentifier];

  [(RTPredictedLocationOfInterestProviderCalendar *)self fetchPredictedLocationsOfInterestBetweenStartDate:v9 endDate:v8 clientIdentifier:v10 handler:v6];
}

- (void)fetchPredictedExitDatesWithCriteria:(id)a3 handler:(id)a4
{
}

- (void)setQueue:(id)a3
{
}

- (RTEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (RTEventModelProvider)eventModelProvider
{
  return self->_eventModelProvider;
}

- (void)setEventModelProvider:(id)a3
{
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_eventModelProvider, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end