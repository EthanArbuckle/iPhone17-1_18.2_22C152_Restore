@interface RTPredictedLocationOfInterestProviderMaps
- (BOOL)requiresRoutineEnablement;
- (OS_dispatch_queue)queue;
- (RTMapsSupportManager)mapsSupportManager;
- (RTPredictedLocationOfInterestProviderMaps)init;
- (RTPredictedLocationOfInterestProviderMaps)initWithMapsSupportManager:(id)a3;
- (id)_getNextPredictedLocationsOfInterestBackedByHistortyEntryPlaceDisplayFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 historyEntryPlaceDisplays:(id)a6;
- (id)_getNextPredictedLocationsOfInterestBackedByHistortyEntryRouteFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 historyEntryRoutes:(id)a6;
- (void)fetchNextPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4;
- (void)fetchPredictedExitDatesWithCriteria:(id)a3 handler:(id)a4;
- (void)fetchPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4;
@end

@implementation RTPredictedLocationOfInterestProviderMaps

- (BOOL)requiresRoutineEnablement
{
  return 0;
}

void __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  v6 = [v4 referenceLocation];
  uint64_t v7 = *(void *)(a1 + 48);
  [*(id *)(a1 + 40) windowDuration];
  uint64_t v8 = [v3 _getNextPredictedLocationsOfInterestBackedByHistortyEntryPlaceDisplayFromLocation:v6 startDate:v7 timeInterval:v5 historyEntryPlaceDisplays:];

  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  v11 = *(NSObject **)(a1 + 56);

  dispatch_group_leave(v11);
}

- (void)fetchNextPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = dispatch_group_create();
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__152;
    v41[4] = __Block_byref_object_dispose__152;
    id v42 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__152;
    v39[4] = __Block_byref_object_dispose__152;
    id v40 = 0;
    dispatch_group_enter(v8);
    uint64_t v9 = [v6 referenceDate];
    [v6 windowDuration];
    v11 = [v9 dateByAddingTimeInterval:v10 * -0.5];

    id v12 = objc_alloc(MEMORY[0x1E4F28C18]);
    [v6 windowDuration];
    v13 = [v11 dateByAddingTimeInterval:x0];
    v14 = (void *)[v12 initWithStartDate:v11 endDate:v13];

    v24 = [[RTMapsSupportOptions alloc] initWithDateInterval:v14];
    v15 = [(RTPredictedLocationOfInterestProviderMaps *)self mapsSupportManager];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke;
    v34[3] = &unk_1E6B9C2E8;
    v38 = v39;
    v34[4] = self;
    id v16 = v6;
    id v35 = v16;
    id v17 = v11;
    id v36 = v17;
    v18 = v8;
    v37 = v18;
    [v15 fetchHistoryEntryRoutesWithOptions:v24 handler:v34];

    dispatch_group_enter(v18);
    v19 = [[RTMapsSupportOptions alloc] initWithDateInterval:v14];
    v20 = [(RTPredictedLocationOfInterestProviderMaps *)self mapsSupportManager];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_2;
    v29[3] = &unk_1E6B9C2E8;
    v33 = v41;
    v29[4] = self;
    id v30 = v16;
    id v21 = v17;
    id v31 = v21;
    v22 = v18;
    v32 = v22;
    [v20 fetchHistoryEntryPlaceDisplaysWithOptions:v19 handler:v29];

    v23 = [(RTPredictedLocationOfInterestProviderMaps *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_3;
    block[3] = &unk_1E6B9C360;
    v27 = v39;
    v28 = v41;
    id v26 = v7;
    dispatch_group_notify(v22, v23, block);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v41, 8);
  }
}

- (RTMapsSupportManager)mapsSupportManager
{
  return self->_mapsSupportManager;
}

void __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 referenceLocation];
  uint64_t v7 = *(void *)(a1 + 48);
  [*(id *)(a1 + 40) windowDuration];
  uint64_t v8 = [v3 _getNextPredictedLocationsOfInterestBackedByHistortyEntryRouteFromLocation:v6 startDate:v7 timeInterval:v5 historyEntryRoutes:];

  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  v11 = *(NSObject **)(a1 + 56);

  dispatch_group_leave(v11);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_getNextPredictedLocationsOfInterestBackedByHistortyEntryRouteFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 historyEntryRoutes:(id)a6
{
  id v7 = a3;
  id v8 = a6;
  uint64_t v9 = objc_opt_new();
  double v10 = [MEMORY[0x1E4F1C9C8] date];
  v11 = objc_opt_new();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __162__RTPredictedLocationOfInterestProviderMaps__getNextPredictedLocationsOfInterestBackedByHistortyEntryRouteFromLocation_startDate_timeInterval_historyEntryRoutes___block_invoke;
  v19[3] = &unk_1E6B9C298;
  id v20 = v10;
  id v21 = v11;
  id v22 = v7;
  id v12 = v9;
  id v23 = v12;
  id v13 = v7;
  id v14 = v11;
  id v15 = v10;
  [v8 enumerateObjectsUsingBlock:v19];

  id v16 = v23;
  id v17 = v12;

  return v17;
}

- (id)_getNextPredictedLocationsOfInterestBackedByHistortyEntryPlaceDisplayFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 historyEntryPlaceDisplays:(id)a6
{
  id v7 = a3;
  id v8 = a6;
  uint64_t v9 = objc_opt_new();
  double v10 = [MEMORY[0x1E4F1C9C8] date];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __176__RTPredictedLocationOfInterestProviderMaps__getNextPredictedLocationsOfInterestBackedByHistortyEntryPlaceDisplayFromLocation_startDate_timeInterval_historyEntryPlaceDisplays___block_invoke;
  v17[3] = &unk_1E6B9C2C0;
  id v18 = v10;
  id v19 = v7;
  id v11 = v9;
  id v20 = v11;
  id v12 = v7;
  id v13 = v10;
  [v8 enumerateObjectsUsingBlock:v17];

  id v14 = v20;
  id v15 = v11;

  return v15;
}

void __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_3(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_4;
  v9[3] = &unk_1E6B9C338;
  v9[4] = a1[5];
  v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:v9];
  uint64_t v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) filteredArrayUsingPredicate:v2];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [MEMORY[0x1E4F1CA48] array];
  [v6 addObjectsFromArray:*(void *)(*(void *)(a1[5] + 8) + 40)];
  [v6 addObjectsFromArray:*(void *)(*(void *)(a1[6] + 8) + 40)];
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [v6 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = v8;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%lu next predicted locations of interest", buf, 0xCu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (RTPredictedLocationOfInterestProviderMaps)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMapsSupportManager_);
}

- (RTPredictedLocationOfInterestProviderMaps)initWithMapsSupportManager:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTPredictedLocationOfInterestProviderMaps;
    id v6 = [(RTPredictedLocationOfInterestProviderMaps *)&v17 init];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v10 = (const char *)[(RTPredictedLocationOfInterestProviderMaps *)v8 UTF8String];
      }
      else
      {
        id v13 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v8];
        double v10 = (const char *)[v13 UTF8String];
      }
      dispatch_queue_t v14 = dispatch_queue_create(v10, v9);

      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v14;

      objc_storeStrong((id *)&v8->_mapsSupportManager, a3);
    }
    self = v7;
    uint64_t v12 = self;
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[RTPredictedLocationOfInterestProviderMaps initWithMapsSupportManager:]";
      __int16 v20 = 1024;
      int v21 = 146;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapsSupportManager (in %s:%d)", buf, 0x12u);
    }

    uint64_t v12 = 0;
  }

  return v12;
}

void __162__RTPredictedLocationOfInterestProviderMaps__getNextPredictedLocationsOfInterestBackedByHistortyEntryRouteFromLocation_startDate_timeInterval_historyEntryRoutes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v6 usageDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 >= 7200.0)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v32 = 0x40BC200000000000;
      _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "historyEntryRoute, %@, used %.2f seconds ago. exceeds max time interval since used threshold, %.2f", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v11 = [v6 destinationLocation];
    uint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    id v30 = 0;
    [v12 distanceFromLocation:v13 toLocation:v11 error:&v30];
    double v15 = v14;
    id v16 = v30;
    if (v16)
    {
      objc_super v17 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v16;
        _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
      }
    }
    if (v15 <= 100.0 || v15 >= 288000.0)
    {
      id v19 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v24 = [*(id *)(a1 + 48) coordinateToString];
        *(_DWORD *)buf = 138413570;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v32 = *(void *)&v15;
        __int16 v33 = 2112;
        v34 = v24;
        __int16 v35 = 2048;
        uint64_t v36 = 0x4059000000000000;
        __int16 v37 = 2048;
        uint64_t v38 = 0x4111940000000000;
        _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "historyEntryRoute, %@, location, %@, %.2fm from location, %@. not within min/max distance threshold, %.2f/%.2f", buf, 0x3Eu);
      }
    }
    else
    {
      id v18 = [objc_alloc(MEMORY[0x1E4F5CEA0]) initWithHistoryEntryRoute:v6];
      id v19 = v18;
      if (v18)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v32) = 1;
        __int16 v20 = [v18 sources];
        int v21 = [v20 firstObject];
        int v22 = [v21 navigationWasInterrupted];

        if (v22)
        {
          id v23 = *(void **)(a1 + 56);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __162__RTPredictedLocationOfInterestProviderMaps__getNextPredictedLocationsOfInterestBackedByHistortyEntryRouteFromLocation_startDate_timeInterval_historyEntryRoutes___block_invoke_12;
          v25[3] = &unk_1E6B9C270;
          id v26 = v23;
          v28 = buf;
          uint64_t v29 = a4;
          v27 = v19;
          [v26 enumerateObjectsUsingBlock:v25];
        }
        if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
          [*(id *)(a1 + 56) addObject:v19];
        }
        _Block_object_dispose(buf, 8);
      }
    }
  }
}

void __162__RTPredictedLocationOfInterestProviderMaps__getNextPredictedLocationsOfInterestBackedByHistortyEntryRouteFromLocation_startDate_timeInterval_historyEntryRoutes___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 sources];
  id v5 = [v4 firstObject];
  int v6 = [v5 navigationWasInterrupted];

  if (v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v16 = 138412546;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      id v19 = v3;
      double v9 = "ignoring prediction for interrupted HistoryEntryRoute, %@. another interrupted HistoryEntryRoute is already b"
           "eing predicted, %@";
LABEL_7:
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v16, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  double v10 = [*(id *)(a1 + 40) locationOfInterest];
  uint64_t v11 = [v10 mapItem];
  uint64_t v12 = [v3 locationOfInterest];
  uint64_t v13 = [v12 mapItem];
  int v14 = [v11 isEqualToMapItem:v13];

  if (v14)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138412546;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      id v19 = v3;
      double v9 = "ignoring prediction for interrupted HistoryEntryRoute, %@. another HistoryEntryRoute is already being predict"
           "ed to the same destination, %@";
      goto LABEL_7;
    }
LABEL_8:

    **(unsigned char **)(a1 + 56) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __176__RTPredictedLocationOfInterestProviderMaps__getNextPredictedLocationsOfInterestBackedByHistortyEntryPlaceDisplayFromLocation_startDate_timeInterval_historyEntryPlaceDisplays___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 usageDate];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 >= 3600.0)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = v3;
      __int16 v20 = 2048;
      double v21 = v7;
      __int16 v22 = 2048;
      uint64_t v23 = 0x40AC200000000000;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "historyEntryPlaceDisplay, %@, used %.2f seconds ago. exceeds max time interval since used threshold, %.2f", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v8 = [v3 location];
    double v9 = objc_opt_new();
    uint64_t v10 = *(void *)(a1 + 40);
    id v17 = 0;
    [v9 distanceFromLocation:v10 toLocation:v8 error:&v17];
    double v12 = v11;
    id v13 = v17;
    if (v13)
    {
      int v14 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v13;
        _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
      }
    }
    if (v12 <= 100.0 || v12 >= 288000.0)
    {
      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v16 = [*(id *)(a1 + 40) coordinateToString];
        *(_DWORD *)buf = 138413570;
        id v19 = v3;
        __int16 v20 = 2112;
        double v21 = *(double *)&v8;
        __int16 v22 = 2048;
        uint64_t v23 = *(void *)&v12;
        __int16 v24 = 2112;
        v25 = v16;
        __int16 v26 = 2048;
        uint64_t v27 = 0x4059000000000000;
        __int16 v28 = 2048;
        uint64_t v29 = 0x4111940000000000;
        _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "historyEntryPlaceDisplay, %@, location, %@, %.2fm from location, %@. not within min/max distance threshold, %.2f/%.2f", buf, 0x3Eu);
      }
    }
    else
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F5CEA0]) initWithHistoryEntryPlaceDisplay:v3];
      if (v15) {
        [*(id *)(a1 + 48) addObject:v15];
      }
    }
  }
}

uint64_t __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  double v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_5;
  v11[3] = &unk_1E6B9C310;
  id v8 = v5;
  id v12 = v8;
  id v13 = &v14;
  [v7 enumerateObjectsUsingBlock:v11];
  uint64_t v9 = *((unsigned __int8 *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  double v7 = [*(id *)(a1 + 32) locationOfInterest];
  id v8 = [v7 mapItem];
  uint64_t v9 = [v6 locationOfInterest];
  uint64_t v10 = [v9 mapItem];
  int v11 = [v8 isEqualToMapItem:v10];

  if (v11)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "dropping PLOI backed by historyEntryPlaceDisplay, %@, because it is also predicted by PLOI backed by historyEntryRoute, %@", (uint8_t *)&v14, 0x16u);
    }

    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)fetchPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
}

- (void)fetchPredictedExitDatesWithCriteria:(id)a3 handler:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsSupportManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end