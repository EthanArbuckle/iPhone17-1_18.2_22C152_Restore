@interface RTElevationProvider
- (BOOL)hasAltimeter;
- (CMAltimeter)altimeter;
- (OS_dispatch_queue)queue;
- (RTElevationProvider)initWithAltimeter:(id)a3;
- (void)_fetchElevations:(id)a3 handler:(id)a4;
- (void)fetchElevations:(id)a3 handler:(id)a4;
- (void)setAltimeter:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation RTElevationProvider

- (RTElevationProvider)initWithAltimeter:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RTElevationProvider;
  v6 = [(RTElevationProvider *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (const char *)[(RTElevationProvider *)v8 UTF8String];
    }
    else
    {
      id v11 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v8];
      v10 = (const char *)[v11 UTF8String];
    }
    dispatch_queue_t v12 = dispatch_queue_create(v10, v9);

    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v8->_altimeter, a3);
  }

  return v7;
}

- (void)_fetchElevations:(id)a3 handler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(RTElevationProvider *)self hasAltimeter])
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v9 = [v6 batchSize];
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 100;
    }
    altimeter = self->_altimeter;
    dispatch_queue_t v12 = [v6 dateInterval];
    v13 = [v12 startDate];
    v14 = [v6 dateInterval];
    objc_super v15 = [v14 endDate];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __48__RTElevationProvider__fetchElevations_handler___block_invoke;
    v34[3] = &unk_1E6B91DC0;
    v34[4] = self;
    id v36 = v7;
    v16 = v8;
    v35 = v16;
    uint64_t v37 = v10;
    [(CMAltimeter *)altimeter queryElevationProfileFromDate:v13 toDate:v15 withBatchSize:v10 withHandler:v34];

    v17 = v16;
    v18 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v19 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v17, v19))
    {
      v33 = [MEMORY[0x1E4F1C9C8] now];
      [v33 timeIntervalSinceDate:v18];
      double v21 = v20;
      v22 = objc_opt_new();
      v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_11];
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 filteredArrayUsingPredicate:v23];
      v26 = [v25 firstObject];

      [v22 submitToCoreAnalytics:v26 type:1 duration:v21];
      v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F5CFE8];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v38 count:1];
      v31 = [v28 errorWithDomain:v29 code:15 userInfo:v30];

      if (v31) {
    }
      }
  }
  else
  {
    id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
    v17 = [v32 initWithDomain:*MEMORY[0x1E4F5CFE8] code:1 userInfo:0];
    (*((void (**)(id, void, NSObject *))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], v17);
  }
}

void __48__RTElevationProvider__fetchElevations_handler___block_invoke(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      *(_DWORD *)buf = 138412546;
      v44 = v34;
      __int16 v45 = 2112;
      uint64_t v46 = (uint64_t)v8;
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@: received error from queryElevationProfileFromDate: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    v35 = a3;
    uint64_t v38 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v7 count]];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v36 = v7;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v40;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_super v15 = *(void **)(*((void *)&v39 + 1) + 8 * v14);
          id v16 = objc_alloc(MEMORY[0x1E4F1C9C8]);
          [v15 timestamp];
          v17 = [v16 initWithTimeIntervalSinceReferenceDate:x0];
          v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v17 sinceDate:-2.56];
          dispatch_time_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v18 endDate:v17];
          id v20 = objc_alloc(MEMORY[0x1E4F5CDC0]);
          [v15 altitude];
          double v22 = v21;
          [v15 accuracy];
          v24 = (void *)[v20 initWithElevation:v19 dateInterval:0 elevationUncertainty:v22 estimationStatus:v23];
          if ([v24 isValid])
          {
            [v38 addObject:v24];
          }
          else
          {
            v25 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              v26 = (objc_class *)objc_opt_class();
              uint64_t v37 = NSStringFromClass(v26);
              *(_DWORD *)buf = 138412546;
              v44 = v37;
              __int16 v45 = 2112;
              uint64_t v46 = (uint64_t)v24;
              _os_log_debug_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEBUG, "%@: received invalid elevation, %@", buf, 0x16u);
            }
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v51 count:16];
      }
      while (v12);
    }

    v27 = _rt_log_facility_get_os_log(RTLogFacilityElevation);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = (objc_class *)objc_opt_class();
      uint64_t v29 = NSStringFromClass(v28);
      uint64_t v30 = [v38 count];
      uint64_t v31 = *(void *)(a1 + 56);
      uint64_t v32 = *v35;
      *(_DWORD *)buf = 138413058;
      v44 = v29;
      __int16 v45 = 2048;
      uint64_t v46 = v30;
      __int16 v47 = 2048;
      uint64_t v48 = v31;
      __int16 v49 = 2048;
      uint64_t v50 = v32;
      _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "%@: received elevations, %lu, batchSize: %lu, lastBatch, %lu", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v8 = 0;
    if (*v35) {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }

    id v7 = v36;
  }
}

- (void)fetchElevations:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTElevationProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTElevationProvider_fetchElevations_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __47__RTElevationProvider_fetchElevations_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchElevations:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (BOOL)hasAltimeter
{
  return self->_altimeter != 0;
}

- (CMAltimeter)altimeter
{
  return self->_altimeter;
}

- (void)setAltimeter:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_altimeter, 0);
}

@end