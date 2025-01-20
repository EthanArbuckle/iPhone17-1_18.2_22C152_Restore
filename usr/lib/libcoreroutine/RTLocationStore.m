@interface RTLocationStore
- (NSMutableArray)locations;
- (RTLocationStore)init;
- (RTLocationStore)initWithPersistenceManager:(id)a3;
- (RTLocationStore)initWithPersistenceManager:(id)a3 timerManager:(id)a4;
- (RTTimer)flushTimer;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (id)fetchRequestFromStoredLocationOptions:(id)a3;
- (void)_fetchLastLocationWithHandler:(id)a3;
- (void)_fetchMetricsWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7;
- (void)_fetchStoredLocationsWithContext:(id)a3 handler:(id)a4;
- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4;
- (void)_flushCachedLocationsWithHandler:(id)a3;
- (void)_invalidateFlushTimer;
- (void)_removeLocationsPredating:(id)a3 handler:(id)a4;
- (void)_shutdownWithHandler:(id)a3;
- (void)_startFlushTimer;
- (void)_storeLocations:(id)a3 handler:(id)a4;
- (void)enumerateStoredLocationsWithContext:(id)a3 usingBlock:(id)a4;
- (void)fetchLastLocationWithHandler:(id)a3;
- (void)fetchMetricsWithOptions:(id)a3 handler:(id)a4;
- (void)fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7;
- (void)fetchStoredLocationsWithContext:(id)a3 handler:(id)a4;
- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4;
- (void)removeLocationsPredating:(id)a3 handler:(id)a4;
- (void)storeLocations:(id)a3 handler:(id)a4;
@end

@implementation RTLocationStore

uint64_t __42__RTLocationStore_storeLocations_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeLocations:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)storeLocations:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__RTLocationStore_storeLocations_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_storeLocations:(id)a3 handler:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, void))a4;
  if ([(RTService *)self isShuttingDown])
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = [v7 count];
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "Ignoring %lu locations for storage, shutdown in progress", buf, 0xCu);
    }

LABEL_15:
    if (v8) {
      v8[2](v8, 0);
    }
    goto LABEL_17;
  }
  if ([v7 count])
  {
    [(NSMutableArray *)self->_locations addObjectsFromArray:v7];
    if ([(NSMutableArray *)self->_locations count] && !self->_flushTransaction)
    {
      id v10 = NSString;
      v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      id v13 = NSStringFromSelector(a2);
      id v14 = [v10 stringWithFormat:@"%@-%@", v12, v13];
      [v14 UTF8String];
      v15 = (OS_os_transaction *)os_transaction_create();
      flushTransaction = self->_flushTransaction;
      self->_flushTransaction = v15;

      v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        v29 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        uint64_t v31 = (uint64_t)v28;
        __int16 v32 = 2112;
        v33 = v29;
        _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
      }
    }
    v18 = _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = [v7 count];
      v24 = [v7 firstObject];
      v25 = [v7 lastObject];
      uint64_t v26 = [(NSMutableArray *)self->_locations count];
      *(_DWORD *)buf = 134218754;
      uint64_t v31 = v23;
      __int16 v32 = 2112;
      v33 = v24;
      __int16 v34 = 2112;
      v35 = v25;
      __int16 v36 = 2048;
      uint64_t v37 = v26;
      _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "added %lu locations to cache, first, %@, last, %@, total, %lu", buf, 0x2Au);
    }
    [(RTLocationStore *)self _startFlushTimer];
    if ((unint64_t)[(NSMutableArray *)self->_locations count] >= 0x97) {
      [(RTLocationStore *)self _flushCachedLocationsWithHandler:&__block_literal_global_32_0];
    }
    goto LABEL_15;
  }
  if (v8)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F5CFE8];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    v39[0] = @"requires valid locations.";
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    v22 = [v19 errorWithDomain:v20 code:7 userInfo:v21];
    ((void (**)(id, void *))v8)[2](v8, v22);
  }
LABEL_17:
}

- (void)_startFlushTimer
{
  if (!self->_flushTimer)
  {
    objc_initWeak(&location, self);
    timerManager = self->_timerManager;
    v4 = [(RTNotifier *)self queue];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __35__RTLocationStore__startFlushTimer__block_invoke;
    id v10 = &unk_1E6B91900;
    objc_copyWeak(&v11, &location);
    v5 = [(RTTimerManager *)timerManager timerWithIdentifier:@"com.apple.routined.locationStore.flushTimer" queue:v4 handler:&v7];
    flushTimer = self->_flushTimer;
    self->_flushTimer = v5;

    -[RTTimer fireAfterDelay:interval:leeway:](self->_flushTimer, "fireAfterDelay:interval:leeway:", 75.0, 75.0, 15.0, v7, v8, v9, v10);
    [(RTTimer *)self->_flushTimer resume];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __35__RTLocationStore__startFlushTimer__block_invoke(uint64_t a1)
{
  v2 = _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "flushTimer timer expiry", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _flushCachedLocationsWithHandler:&__block_literal_global_65];
}

- (void)_invalidateFlushTimer
{
  [(RTTimer *)self->_flushTimer invalidate];
  flushTimer = self->_flushTimer;
  self->_flushTimer = 0;
}

- (void)_flushCachedLocationsWithHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(NSMutableArray *)self->_locations count])
  {
    id v6 = (void *)[(NSMutableArray *)self->_locations copy];
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v6 count];
      id v9 = [v6 firstObject];
      id v10 = [v6 lastObject];
      *(_DWORD *)buf = 134218498;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      v17 = v9;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "flushing %lu locations to cache, first, %@, last, %@", buf, 0x20u);
    }
    [(NSMutableArray *)self->_locations removeAllObjects];
    [(RTLocationStore *)self _invalidateFlushTimer];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__RTLocationStore__flushCachedLocationsWithHandler___block_invoke;
    v11[3] = &unk_1E6B916B8;
    v11[4] = self;
    SEL v13 = a2;
    id v12 = v5;
    [(RTStore *)self storeWritableObjects:v6 handler:v11];
  }
  else if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

- (RTLocationStore)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPersistenceManager_timerManager_);
}

- (RTLocationStore)initWithPersistenceManager:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(RTLocationStore *)self initWithPersistenceManager:v4 timerManager:v5];

  return v6;
}

- (RTLocationStore)initWithPersistenceManager:(id)a3 timerManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      SEL v13 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    uint64_t v15 = "Invalid parameter not satisfying: persistenceManager";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    uint64_t v15 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_12;
  }
  v17.receiver = self;
  v17.super_class = (Class)RTLocationStore;
  id v9 = [(RTStore *)&v17 initWithPersistenceManager:v6];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timerManager, a4);
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    locations = v10->_locations;
    v10->_locations = (NSMutableArray *)v11;
  }
  self = v10;
  SEL v13 = self;
LABEL_10:

  return v13;
}

- (void)_shutdownWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__RTLocationStore__shutdownWithHandler___block_invoke;
  v6[3] = &unk_1E6B90C18;
  id v7 = v4;
  id v5 = v4;
  [(RTLocationStore *)self _flushCachedLocationsWithHandler:v6];
}

uint64_t __40__RTLocationStore__shutdownWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __35__RTLocationStore__startFlushTimer__block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "flushed cached locations, error, %@", (uint8_t *)&v4, 0xCu);
  }
}

void __52__RTLocationStore__flushCachedLocationsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = 0;

  if (v3)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@, error, %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void __43__RTLocationStore__storeLocations_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "flushed cached locations, error, %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_11:
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[RTLocationStore _fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:]";
      __int16 v47 = 1024;
      int v48 = 235;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toDate (in %s:%d)", buf, 0x12u);
    }

    if (v15) {
      goto LABEL_4;
    }
LABEL_14:
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[RTLocationStore _fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:]";
      __int16 v47 = 1024;
      int v48 = 236;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_19;
  }
  v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[RTLocationStore _fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:]";
    __int16 v47 = 1024;
    int v48 = 234;
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromDate (in %s:%d)", buf, 0x12u);
  }

  if (!v14) {
    goto LABEL_11;
  }
LABEL_3:
  if (!v15) {
    goto LABEL_14;
  }
LABEL_4:
  if (v13 && v14)
  {
    if ([v13 compare:v14] != 1)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke;
      v34[3] = &unk_1E6B978C8;
      v35 = v13;
      id v36 = v14;
      double v38 = a5;
      unint64_t v39 = a6;
      SEL v40 = a2;
      id v28 = v15;
      id v37 = v28;
      v29 = (void *)MEMORY[0x1E016DB00](v34);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke_58;
      v31[3] = &unk_1E6B978F0;
      v31[4] = self;
      id v32 = v29;
      id v33 = v28;
      id v30 = v29;
      [(RTLocationStore *)self _flushCachedLocationsWithHandler:v31];

      v19 = v35;
      goto LABEL_19;
    }
    __int16 v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F5CFE8];
    uint64_t v41 = *MEMORY[0x1E4F28568];
    __int16 v18 = NSString;
    v19 = [v13 stringFromDate];
    uint64_t v20 = [v14 stringFromDate];
    v21 = [v18 stringWithFormat:@"fromDate, %@, postdates toDate, %@", v19, v20];
    v42 = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    uint64_t v23 = [v16 errorWithDomain:v17 code:7 userInfo:v22];
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v23);
  }
  else
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F5CFE8];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    v44 = @"requires valid dates.";
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    uint64_t v20 = [v26 errorWithDomain:v27 code:7 userInfo:v19];
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v20);
  }

LABEL_19:
}

void __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke(uint64_t a1, void *a2)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = +[RTCLLocationMO fetchRequest];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"timestamp" ascending:1];
  v29[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  [v4 setSortDescriptors:v6];

  uint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ <= %K", *(void *)(a1 + 32), @"timestamp"];
  v28[0] = v8;
  int v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", @"timestamp", *(void *)(a1 + 40)];
  v28[1] = v9;
  id v10 = (void *)MEMORY[0x1E4F28F60];
  __int16 v11 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  id v12 = [v10 predicateWithFormat:@"%K <= %@", @"horizontalAccuracy", v11];
  v28[2] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  id v14 = [v7 andPredicateWithSubpredicates:v13];
  [v4 setPredicate:v14];

  [v4 setFetchBatchSize:3600];
  [v4 setFetchLimit:*(void *)(a1 + 64)];
  id v19 = 0;
  uint64_t v15 = [v3 countForFetchRequest:v4 error:&v19];

  id v16 = v19;
  uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    __int16 v18 = NSStringFromSelector(*(SEL *)(a1 + 72));
    *(_DWORD *)buf = 138413058;
    v21 = v18;
    __int16 v22 = 2112;
    uint64_t v23 = v4;
    __int16 v24 = 2048;
    uint64_t v25 = v15;
    __int16 v26 = 2112;
    id v27 = v16;
    _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke_58(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke_2;
  block[3] = &unk_1E6B943D8;
  id v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke_3;
  v3[3] = &unk_1E6B90C18;
  id v4 = *(id *)(a1 + 48);
  [v1 _performBlock:v2 contextType:1 errorHandler:v3];
}

uint64_t __87__RTLocationStore__fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v15 = [(RTNotifier *)self queue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__RTLocationStore_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke;
  v19[3] = &unk_1E6B91418;
  v19[4] = self;
  id v20 = v12;
  double v23 = a5;
  unint64_t v24 = a6;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(v15, v19);
}

uint64_t __86__RTLocationStore_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredLocationsCountFromDate:*(void *)(a1 + 40) toDate:*(void *)(a1 + 48) uncertainty:*(void *)(a1 + 72) limit:*(void *)(a1 + 56) handler:*(double *)(a1 + 64)];
}

- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      __int16 v11 = "-[RTLocationStore _fetchStoredLocationsWithOptions:handler:]";
      __int16 v12 = 1024;
      int v13 = 321;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }
  }
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F5CF38]) initWithEnumerationOptions:v6];
  [(RTLocationStore *)self _fetchStoredLocationsWithContext:v9 handler:v7];
}

- (void)fetchLastLocationWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__RTLocationStore_fetchLastLocationWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__RTLocationStore_fetchLastLocationWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLastLocationWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchLastLocationWithHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke;
    v17[3] = &unk_1E6B96630;
    SEL v19 = a2;
    id v7 = v5;
    id v18 = v7;
    id v8 = (void *)MEMORY[0x1E016DB00](v17);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke_64;
    v14[3] = &unk_1E6B97918;
    v14[4] = self;
    id v15 = v7;
    id v16 = v8;
    id v9 = v8;
    [(RTLocationStore *)self _flushCachedLocationsWithHandler:v14];

    int v10 = v18;
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v23 = "-[RTLocationStore _fetchLastLocationWithHandler:]";
      __int16 v24 = 1024;
      int v25 = 338;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v20 = *MEMORY[0x1E4F28568];
    id v21 = @"A handler is a required parameter.";
    int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    __int16 v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v10];
    int v13 = _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v23 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "A handler is a required parameter, %@", buf, 0xCu);
    }
  }
}

void __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTCLLocationMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"timestamp" ascending:0];
  v23[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v4 setSortDescriptors:v6];

  [v4 setFetchLimit:1];
  id v14 = 0;
  id v7 = [v3 executeFetchRequest:v4 error:&v14];

  id v8 = v14;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __int16 v12 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v13 = [v7 count];
    *(_DWORD *)buf = 138413058;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2048;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v8)
  {
    int v10 = 0;
  }
  else
  {
    __int16 v11 = [v7 firstObject];
    int v10 = [MEMORY[0x1E4F1E5F0] createWithManagedObject:v11];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke_64(id *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (void (*)(void))*((void *)a1[5] + 2);
    v3();
  }
  else
  {
    id v4 = [a1[4] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke_2;
    block[3] = &unk_1E6B943D8;
    block[4] = a1[4];
    id v6 = a1[6];
    id v7 = a1[5];
    dispatch_async(v4, block);
  }
}

void __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke_3;
  v3[3] = &unk_1E6B90C18;
  id v4 = *(id *)(a1 + 48);
  [v1 _performBlock:v2 contextType:1 errorHandler:v3];
}

uint64_t __49__RTLocationStore__fetchLastLocationWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTLocationStore_fetchStoredLocationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __59__RTLocationStore_fetchStoredLocationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredLocationsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke;
    v19[3] = &unk_1E6B91018;
    id v20 = v7;
    __int16 v21 = self;
    SEL v23 = a2;
    id v9 = v8;
    id v22 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v19);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_65;
    v16[3] = &unk_1E6B97918;
    v16[4] = self;
    id v17 = v9;
    id v18 = v10;
    id v11 = v10;
    [(RTLocationStore *)self _flushCachedLocationsWithHandler:v16];

    id v12 = v20;
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v27 = "-[RTLocationStore _fetchStoredLocationsWithContext:handler:]";
      __int16 v28 = 1024;
      int v29 = 406;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    uint64_t v24 = *MEMORY[0x1E4F28568];
    int v25 = @"A handler is a required parameter.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v12];
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "A handler is a required parameter, %@", buf, 0xCu);
    }
  }
}

void __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  id v6 = v5;
  id v7 = *(void **)(a1 + 40);
  id v8 = [v5 options];
  id v9 = [v7 fetchRequestFromStoredLocationOptions:v8];

  [v9 setFetchOffset:[*(id *)(a1 + 32) offset]];
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v35 = [v9 fetchLimit];
    __int16 v36 = 2048;
    uint64_t v37 = [v9 fetchOffset];
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "using options fetch limit, %lu, fetch offset, %lu", buf, 0x16u);
  }

  id v32 = 0;
  id v11 = [v3 executeFetchRequest:v9 error:&v32];
  id v12 = v32;
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    SEL v23 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v24 = [v11 count];
    *(_DWORD *)buf = 138413058;
    uint64_t v35 = (uint64_t)v23;
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v9;
    __int16 v38 = 2048;
    uint64_t v39 = v24;
    __int16 v40 = 2112;
    id v41 = v12;
    _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  id v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:objc_msgSend(v9, "fetchLimit")];
  if (!v12)
  {
    uint64_t v25 = a1;
    uint64_t v26 = v6;
    id v27 = v3;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          __int16 v21 = (void *)MEMORY[0x1E016D870]();
          id v22 = [MEMORY[0x1E4F1E5F0] createWithManagedObject:v20];
          if (v22) {
            [v14 addObject:v22];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v17);
    }

    id v6 = v26;
    id v3 = v27;
    a1 = v25;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_65(id *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (void (*)(void))*((void *)a1[5] + 2);
    v3();
  }
  else
  {
    id v4 = [a1[4] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_2;
    block[3] = &unk_1E6B943D8;
    block[4] = a1[4];
    id v6 = a1[6];
    id v7 = a1[5];
    dispatch_async(v4, block);
  }
}

void __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_3;
  v3[3] = &unk_1E6B90C18;
  id v4 = *(id *)(a1 + 48);
  [v1 _performBlock:v2 contextType:1 errorHandler:v3];
}

uint64_t __60__RTLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTLocationStore_fetchStoredLocationsWithContext_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __59__RTLocationStore_fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStoredLocationsWithContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)enumerateStoredLocationsWithContext:(id)a3 usingBlock:(id)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    char v46 = 0;
    if (v7)
    {
      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      id v10 = [(RTNotifier *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__RTLocationStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke;
      block[3] = &unk_1E6B91220;
      block[4] = self;
      SEL v45 = a2;
      id v11 = v9;
      v44 = v11;
      dispatch_async(v10, block);

      id v12 = v11;
      id v13 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v14 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v12, v14))
      {
        uint64_t v39 = [MEMORY[0x1E4F1C9C8] now];
        __int16 v40 = v13;
        [v39 timeIntervalSinceDate:v13];
        double v16 = v15;
        uint64_t v17 = objc_opt_new();
        uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_208];
        __int16 v19 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v20 = [v19 filteredArrayUsingPredicate:v18];
        __int16 v21 = [v20 firstObject];

        __int16 v38 = v17;
        [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
        id v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        SEL v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v24 = *MEMORY[0x1E4F5CFE8];
        v52[0] = *MEMORY[0x1E4F28568];
        *(void *)buf = @"semaphore wait timeout";
        char v25 = 1;
        uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v52 count:1];
        id v27 = [v23 errorWithDomain:v24 code:15 userInfo:v26];

        if (v27)
        {
          id v28 = v27;

          char v25 = 0;
        }
        else
        {
          id v28 = 0;
        }
        id v13 = v40;
      }
      else
      {
        id v28 = 0;
        char v25 = 1;
      }

      id v33 = v28;
      if (v25)
      {
        __int16 v34 = [v7 options];
        uint64_t v35 = [(RTLocationStore *)self fetchRequestFromStoredLocationOptions:v34];

        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __66__RTLocationStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_69;
        v41[3] = &unk_1E6B97940;
        id v42 = v8;
        __int16 v36 = (void *)MEMORY[0x1E016DB00](v41);
        [(RTStore *)self enumerateType:objc_opt_class() fetchRequest:v35 enumerationBlock:v36];
      }
      else
      {
        (*((void (**)(id, void, id, char *))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], v33, &v46);
      }
    }
    else
    {
      long long v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F5CFE8];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      v51 = @"requires non-nil options.";
      long long v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      id v12 = [v29 errorWithDomain:v30 code:7 userInfo:v31];

      id v32 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v37;
        __int16 v48 = 2112;
        uint64_t v49 = v12;
        _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      (*((void (**)(id, void, NSObject *, char *))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], v12, &v46);
    }
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock", buf, 2u);
    }
  }
}

void __66__RTLocationStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__RTLocationStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_2;
  v4[3] = &unk_1E6B90CB8;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 _flushCachedLocationsWithHandler:v4];
}

void __66__RTLocationStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      long long v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v6 = 138412546;
      id v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, error, %@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __66__RTLocationStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_69(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (a3 || ![v7 count]) {
    *a4 = 1;
  }
}

- (void)_removeLocationsPredating:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F28F60];
    id v8 = a4;
    id v9 = [v7 predicateWithFormat:@"%K < %@", @"timestamp", v6];
    [(NSMutableArray *)self->_locations filterUsingPredicate:v9];
    uint64_t v17 = @"timestamp";
    uint64_t v16 = objc_opt_class();
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    uint64_t v18 = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];

    [(RTStore *)self purgePredating:v6 predicateMappings:v11 purgeLimit:43200 handler:v8];
  }
  else
  {
    id v12 = (void (**)(id, void *))a4;
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = "-[RTLocationStore _removeLocationsPredating:handler:]";
      __int16 v23 = 1024;
      int v24 = 538;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }

    dispatch_time_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5CFE8];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v20 = @"requires a valid date.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v11 = [v14 errorWithDomain:v15 code:7 userInfo:v9];
    v12[2](v12, v11);
  }
}

- (void)removeLocationsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__RTLocationStore_removeLocationsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __52__RTLocationStore_removeLocationsPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeLocationsPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchMetricsWithOptions:(id)a3 handler:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [v7 dateInterval];

    if (v9)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke;
      v20[3] = &unk_1E6B91060;
      __int16 v21 = v7;
      SEL v23 = a2;
      id v10 = v8;
      id v22 = v10;
      id v11 = (void *)MEMORY[0x1E016DB00](v20);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke_95;
      v17[3] = &unk_1E6B978F0;
      void v17[4] = self;
      id v18 = v11;
      id v19 = v10;
      id v12 = v11;
      [(RTLocationStore *)self _flushCachedLocationsWithHandler:v17];

      id v13 = v21;
    }
    else
    {
      dispatch_time_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F5CFE8];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = @"requires valid dateInterval.";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      uint64_t v16 = [v14 errorWithDomain:v15 code:7 userInfo:v13];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v16);
    }
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  v104[1] = *MEMORY[0x1E4F143B8];
  id v77 = a2;
  id v3 = objc_opt_new();
  v81 = objc_opt_new();
  v74 = +[RTCLLocationMO fetchRequest];
  id v4 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:x0 ascending:x1];
  v104[0] = v4;
  long long v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:1];
  [v74 setSortDescriptors:v5];

  v78 = (void *)MEMORY[0x1E4F28BA0];
  id v6 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v7 = a1;
  v83 = [*(id *)(a1 + 32) dateInterval];
  id obja = [v83 startDate];
  id v8 = [v6 predicateWithFormat:@"%@ <= %K", obja, @"timestamp"];
  v103[0] = v8;
  id v9 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v82 = v7;
  id v10 = [*(id *)(v7 + 32) dateInterval];
  id v11 = [v10 endDate];
  id v12 = [v9 predicateWithFormat:@"%K <= %@", @"timestamp", v11];
  v103[1] = v12;
  id v13 = (void *)MEMORY[0x1E4F28F60];
  dispatch_time_t v14 = NSNumber;
  [*(id *)(v7 + 32) uncertaintyThreshold];
  uint64_t v15 = [v14 numberWithDouble:];
  uint64_t v16 = [v13 predicateWithFormat:@"%K <= %@", @"horizontalAccuracy", v15];
  v103[2] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:3];
  id v18 = [v78 andPredicateWithSubpredicates:v17];
  id v19 = v74;
  [v74 setPredicate:v18];

  [v74 setIncludesPendingChanges:0];
  uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:@"latitude", @"longitude", @"timestamp", 0];
  if ([*(id *)(v82 + 32) includeFixMetrics])
  {
    [v20 addObject:@"type"];
    [v20 addObject:@"horizontalAccuracy"];
  }
  if ([*(id *)(v82 + 32) includeSignalEnvironment]) {
    [v20 addObject:@"signalEnvironmentType"];
  }
  v73 = v20;
  [v74 setPropertiesToFetch:v20];
  [v74 setResultType:2];
  [v74 setFetchLimit:3600];
  uint64_t v21 = [v74 setFetchOffset:0];
  id v22 = 0;
  SEL v23 = 0;
  id obj = 0;
  id v24 = 0;
  double v25 = 1.79769313e308;
  double v26 = -1.79769313e308;
  double v27 = -1.79769313e308;
  double v28 = 1.79769313e308;
  do
  {
    context = (void *)MEMORY[0x1E016D870](v21);
    id v91 = 0;
    long long v29 = [v77 executeFetchRequest:v19 error:&v91];
    id v76 = v91;

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id obj = v29;
    uint64_t v30 = [obj countByEnumeratingWithState:&v87 objects:v102 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      char v32 = 0;
      uint64_t v84 = *(void *)v88;
      do
      {
        uint64_t v33 = 0;
        do
        {
          __int16 v34 = v24;
          uint64_t v35 = v22;
          if (*(void *)v88 != v84) {
            objc_enumerationMutation(obj);
          }
          __int16 v36 = *(void **)(*((void *)&v87 + 1) + 8 * v33);
          if (!(([v3 count] != 0) | v32 & 1))
          {
            if ([*(id *)(v82 + 32) includeFixMetrics])
            {
              uint64_t v37 = [v36 objectForKeyedSubscript:@"type"];
              [v3 setFirstFixType:[v37 unsignedIntValue]];

              __int16 v38 = [v36 objectForKeyedSubscript:@"horizontalAccuracy"];
              [v38 doubleValue];
              [v3 setFirstFixHorizontalUncertainty:];

              uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                uint64_t v40 = [v3 firstFixType];
                [v3 firstFixHorizontalUncertainty];
                *(_DWORD *)buf = 134218240;
                v93 = (const char *)v40;
                __int16 v94 = 2048;
                v95 = v41;
                _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "type, %lu, uncertainty %f", buf, 0x16u);
              }
            }
            if ([*(id *)(v82 + 32) includeSignalEnvironment])
            {
              id v42 = [v36 objectForKeyedSubscript:@"signalEnvironmentType"];
              [v3 setSignalEnvironment:[v42 unsignedIntValue]];
            }
            char v32 = 1;
          }
          uint64_t v43 = [v36 objectForKeyedSubscript:@"timestamp"];
          if (v43)
          {
            if (!v34) {
              goto LABEL_24;
            }
LABEL_21:
            [v43 timeIntervalSinceDate:v34];
            double v45 = v44;
            [v3 maxIntervalBetweenLocations];
            if (v45 >= v46) {
              double v46 = v45;
            }
            [v3 setMaxIntervalBetweenLocations:v46];
            goto LABEL_24;
          }
          v60 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v93 = "-[RTLocationStore _fetchMetricsWithOptions:handler:]_block_invoke";
            __int16 v94 = 1024;
            LODWORD(v95) = 655;
            _os_log_error_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: timestamp (in %s:%d)", buf, 0x12u);
          }

          if (v34) {
            goto LABEL_21;
          }
LABEL_24:
          id v24 = v43;

          __int16 v47 = [v36 objectForKeyedSubscript:@"latitude"];
          [v47 doubleValue];
          double v49 = v48;

          uint64_t v50 = [v36 objectForKeyedSubscript:@"longitude"];
          [v50 doubleValue];
          double v52 = v51;

          if (v49 == 0.0)
          {
            v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v93 = "-[RTLocationStore _fetchMetricsWithOptions:handler:]_block_invoke";
              __int16 v94 = 1024;
              LODWORD(v95) = 666;
              _os_log_error_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: latitude (in %s:%d)", buf, 0x12u);
            }
          }
          if (v52 == 0.0)
          {
            v54 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v93 = "-[RTLocationStore _fetchMetricsWithOptions:handler:]_block_invoke";
              __int16 v94 = 1024;
              LODWORD(v95) = 667;
              _os_log_error_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: longitude (in %s:%d)", buf, 0x12u);
            }
          }
          if (v49 < v28) {
            double v28 = v49;
          }
          if (v49 > v27) {
            double v27 = v49;
          }
          if (v52 < v25) {
            double v25 = v52;
          }
          if (v52 > v26) {
            double v26 = v52;
          }
          id v22 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithLatitude:0 longitude:v49 horizontalUncertainty:v52 date:0.0];
          if (v35)
          {
            v86 = v23;
            [v81 distanceFromLocation:v35 toLocation:v22 error:&v86];
            double v56 = v55;
            v57 = v86;

            [v3 distanceTraveled];
            [v3 setDistanceTraveled:v56 + v58];
            if (v57)
            {
              v59 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v93 = v57;
                _os_log_debug_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
              }

              SEL v23 = (char *)v57;
            }
            else
            {
              SEL v23 = 0;
            }
          }

          ++v33;
        }
        while (v31 != v33);
        uint64_t v31 = [obj countByEnumeratingWithState:&v87 objects:v102 count:16];
      }
      while (v31);
    }

    [v3 setCount:[v3 count] + [obj count]];
    id v19 = v74;
    [v74 setFetchOffset:[v3 count]];
    [v77 reset];
    uint64_t v21 = [obj count];
  }
  while (v21 && !v76);
  if (v28 == 1.79769313e308 || v25 == 1.79769313e308 || v27 == -2.22507386e-308 || v26 == -2.22507386e-308)
  {
    v65 = v23;
  }
  else
  {
    v61 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithLatitude:0 longitude:v28 horizontalUncertainty:v25 date:0.0];
    v62 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithLatitude:0 longitude:v27 horizontalUncertainty:v26 date:0.0];
    v85 = v23;
    [v81 distanceFromLocation:v61 toLocation:v62 error:&v85];
    double v64 = v63;
    v65 = v85;

    [v3 setSpread:v64 * 0.5];
    if (v65)
    {
      v66 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v93 = v65;
        _os_log_debug_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
      }

      id v19 = v74;
    }
  }
  v67 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(v82 + 48));
    v71 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v72 = [v19 fetchOffset];
    *(_DWORD *)buf = 138413314;
    v93 = v71;
    __int16 v94 = 2112;
    v95 = v19;
    __int16 v96 = 2048;
    uint64_t v97 = v72;
    __int16 v98 = 2112;
    v99 = v3;
    __int16 v100 = 2112;
    id v101 = v76;
    _os_log_debug_impl(&dword_1D9BFA000, v67, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, metrics, %@, error, %@", buf, 0x34u);
  }
  uint64_t v68 = *(void *)(v82 + 40);
  v69 = _RTSafeArray();
  v70 = _RTMultiErrorCreate();
  (*(void (**)(uint64_t, void *, void *))(v68 + 16))(v68, v3, v70);
}

void __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke_95(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke_2;
  block[3] = &unk_1E6B943D8;
  id v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke_3;
  v3[3] = &unk_1E6B90C18;
  id v4 = *(id *)(a1 + 48);
  [v1 _performBlock:v2 contextType:1 errorHandler:v3];
}

uint64_t __52__RTLocationStore__fetchMetricsWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchMetricsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__RTLocationStore_fetchMetricsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __51__RTLocationStore_fetchMetricsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchMetricsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (!a5)
  {
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_8;
  }
  if (v8)
  {
    uint64_t v10 = objc_opt_class();
    if (v10 != objc_opt_class())
    {
      id v11 = NSString;
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      dispatch_time_t v14 = [v11 stringWithFormat:@"error of type, %@, is not supported", v13];

      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = v14;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      id v18 = [v15 errorWithDomain:v16 code:7 userInfo:v17];

      id v19 = v18;
      *a5 = v19;

LABEL_8:
      uint64_t v21 = 0;
      goto LABEL_13;
    }
    uint64_t v21 = [(RTLocationStore *)self fetchRequestFromStoredLocationOptions:v9];
    [v21 setFetchOffset:a4];
  }
  else
  {
    id v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }

    _RTErrorInvalidParameterCreate(@"options");
    uint64_t v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v21;
}

- (id)fetchRequestFromStoredLocationOptions:(id)a3
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = +[RTCLLocationMO fetchRequest];
    [v4 setReturnsObjectsAsFaults:0];
    id v5 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"timestamp" ascending:[v3 ascending]];
    v67[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
    id v63 = v4;
    [v4 setSortDescriptors:v6];

    id v7 = [v3 dateInterval];
    id v8 = [v7 startDate];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = v8;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    id v12 = v10;

    id v13 = [v3 dateInterval];
    dispatch_time_t v14 = [v13 endDate];
    uint64_t v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1C9C8] distantFuture];
    }
    id v17 = v16;

    [v3 horizontalAccuracy];
    if (v18 == 0.0)
    {
      double v20 = 1.79769313e308;
    }
    else
    {
      [v3 horizontalAccuracy];
      double v20 = v19;
    }
    if ([v3 batchSize])
    {
      unint64_t v21 = [v3 batchSize];
      uint64_t v22 = 3600;
      if (v21 < 0xE10) {
        uint64_t v22 = v21;
      }
    }
    else
    {
      uint64_t v22 = 3600;
    }
    uint64_t v60 = v22;
    unsigned int v59 = [v3 type];
    SEL v23 = [MEMORY[0x1E4F1CA48] array];
    id v24 = (void *)MEMORY[0x1E4F28BA0];
    v62 = v12;
    uint64_t v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ <= %K", v12, @"timestamp"];
    v66[0] = v25;
    v61 = v17;
    double v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", @"timestamp", v17];
    v66[1] = v26;
    double v27 = (void *)MEMORY[0x1E4F28F60];
    double v28 = [NSNumber numberWithDouble:v20];
    long long v29 = [v27 predicateWithFormat:@"%K <= %@", @"horizontalAccuracy", v28];
    v66[2] = v29;
    uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
    uint64_t v31 = [v24 andPredicateWithSubpredicates:v30];

    char v32 = v23;
    [v23 addObject:v31];
    uint64_t v33 = [v3 boundingBoxLocation];

    if (v33)
    {
      *(void *)buf = 0;
      __int16 v34 = [v3 boundingBoxLocation];
      [v34 coordinate];
      [v3 boundingBoxLocation];
      uint64_t v35 = v58 = v23;
      [v35 coordinate];
      __int16 v36 = [v3 boundingBoxLocation];
      [v36 horizontalAccuracy];
      RTCommonCalculateBoundingBox();

      double v55 = (void *)MEMORY[0x1E4F28BA0];
      uint64_t v37 = (void *)MEMORY[0x1E4F28F60];
      double v56 = [NSNumber numberWithDouble:0.0];
      v57 = v31;
      __int16 v38 = [v37 predicateWithFormat:@"%@ <= %K", v56, @"longitude"];
      v65[0] = v38;
      uint64_t v39 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v40 = [NSNumber numberWithDouble:0.0];
      id v41 = [v39 predicateWithFormat:@"%K <= %@", @"longitude", v40];
      v65[1] = v41;
      id v42 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v43 = [NSNumber numberWithDouble:0.0];
      double v44 = [v42 predicateWithFormat:@"%@ <= %K", v43, @"latitude"];
      v65[2] = v44;
      double v45 = (void *)MEMORY[0x1E4F28F60];
      double v46 = [NSNumber numberWithDouble:0.0];
      __int16 v47 = [v45 predicateWithFormat:@"%K <= %@", @"latitude", v46];
      v65[3] = v47;
      double v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:4];
      double v49 = [v55 andPredicateWithSubpredicates:v48];

      uint64_t v31 = v57;
      char v32 = v58;

      [v58 addObject:v49];
    }
    if (v59 <= 0xD)
    {
      uint64_t v50 = (void *)MEMORY[0x1E4F28F60];
      double v51 = [NSNumber numberWithUnsignedInt:];
      double v52 = [v50 predicateWithFormat:@"%K == %@", @"type", v51];

      [v32 addObject:v52];
    }
    v53 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v32];
    [v63 setPredicate:v53];

    [v63 setFetchBatchSize:100];
    [v63 setFetchLimit:v60];

    id v11 = v62;
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }
    id v63 = 0;
  }

  return v63;
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (RTTimer)flushTimer
{
  return self->_flushTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushTimer, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_flushTransaction, 0);

  objc_storeStrong((id *)&self->_timerManager, 0);
}

@end