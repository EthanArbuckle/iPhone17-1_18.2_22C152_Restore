@interface RTWatchdogManager
- (NSMutableArray)records;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTHangsMetrics)metrics;
- (RTLifeCycleManager)lifecycleManager;
- (RTPlatform)platform;
- (RTTimer)watchdogHeartbeatTimer;
- (RTTimerManager)timerManager;
- (RTWatchdogManager)init;
- (RTWatchdogManager)initWithLifeCycleManager:(id)a3 defaultsManager:(id)a4 platform:(id)a5;
- (RTWatchdogManager)initWithTimerManager:(id)a3 lifeCycleManager:(id)a4 defaultsManager:(id)a5 platform:(id)a6;
- (double)fireInterval;
- (double)timeout;
- (id)_getRecordsWithCriteria:(BOOL)a3;
- (void)_addObject:(id)a3;
- (void)_checkInAllRecords;
- (void)_checkInAllStartedRecords:(id)a3;
- (void)_checkInAllStoppedRecords:(id)a3;
- (void)_removeObject:(id)a3;
- (void)_shutdownWithHandler:(id)a3;
- (void)_timeoutExceeded:(id)a3;
- (void)addObject:(id)a3;
- (void)removeObject:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setFireInterval:(double)a3;
- (void)setLifecycleManager:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setRecords:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutAndFireInterval;
- (void)setTimerManager:(id)a3;
- (void)setWatchdogHeartbeatTimer:(id)a3;
- (void)shutdownWithHandler:(id)a3;
@end

@implementation RTWatchdogManager

- (RTWatchdogManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithTimerManager_lifeCycleManager_defaultsManager_platform_);
}

- (RTWatchdogManager)initWithLifeCycleManager:(id)a3 defaultsManager:(id)a4 platform:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v12 = 0;
      goto LABEL_8;
    }
    __int16 v18 = 0;
    v14 = "Invalid parameter not satisfying: lifecycleManager";
    v15 = (uint8_t *)&v18;
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v14, v15, 2u);
    goto LABEL_7;
  }
  if (!v9)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v17 = 0;
    v14 = "Invalid parameter not satisfying: defaultsManager";
    v15 = (uint8_t *)&v17;
    goto LABEL_10;
  }
  v11 = objc_opt_new();
  self = [(RTWatchdogManager *)self initWithTimerManager:v11 lifeCycleManager:v8 defaultsManager:v9 platform:v10];

  v12 = self;
LABEL_8:

  return v12;
}

- (RTWatchdogManager)initWithTimerManager:(id)a3 lifeCycleManager:(id)a4 defaultsManager:(id)a5 platform:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v12)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: lifecycleManager";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_14;
  }
  if (!v11)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_13;
  }
  if (!v13)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Invalid parameter not satisfying: defaultsManager";
      goto LABEL_13;
    }
LABEL_14:

    v22 = 0;
    goto LABEL_18;
  }
  v38.receiver = self;
  v38.super_class = (Class)RTWatchdogManager;
  v15 = [(RTWatchdogManager *)&v38 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_lifecycleManager, a4);
    objc_storeStrong(p_isa + 2, a3);
    objc_storeStrong(p_isa + 6, a5);
    __int16 v17 = p_isa;
    __int16 v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (const char *)[v17 UTF8String];
    }
    else
    {
      id v23 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v17];
      v19 = (const char *)[v23 UTF8String];
    }
    dispatch_queue_t v24 = dispatch_queue_create(v19, v18);

    id v25 = v17[7];
    v17[7] = v24;

    uint64_t v26 = objc_opt_new();
    id v27 = v17[4];
    v17[4] = (id)v26;

    uint64_t v28 = objc_opt_new();
    id v29 = v17[5];
    v17[5] = (id)v28;

    objc_storeStrong(v17 + 8, a6);
    [v17 setTimeoutAndFireInterval];
    id v30 = p_isa[2];
    v31 = [v17 queue];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __84__RTWatchdogManager_initWithTimerManager_lifeCycleManager_defaultsManager_platform___block_invoke;
    v36[3] = &unk_1E6B90E70;
    v32 = v17;
    v37 = v32;
    uint64_t v33 = [v30 timerWithIdentifier:@"RTWatchdogHeartbeatTimer" queue:v31 handler:v36];
    id v34 = v32[1];
    v32[1] = (id)v33;

    [v32[1] fireWithInterval:*((double *)v32 + 9)];
    [v32[1] resume];
  }
  self = p_isa;
  v22 = self;
LABEL_18:

  return v22;
}

uint64_t __84__RTWatchdogManager_initWithTimerManager_lifeCycleManager_defaultsManager_platform___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onTimerExpiry];
}

- (void)setTimeoutAndFireInterval
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&self->_double fireInterval = xmmword_1DA0FFB10;
  if ([(RTPlatform *)self->_platform internalInstall])
  {
    v3 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWatchdogManagerFireIntervalKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      self->_double fireInterval = v4;
    }
    v5 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsWatchdogManagerTimeoutKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 doubleValue];
      self->_double timeout = v6;
    }
  }
  v7 = _rt_log_facility_get_os_log(RTLogFacilityDefaults);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double fireInterval = self->_fireInterval;
    double timeout = self->_timeout;
    int v10 = 134218240;
    double v11 = timeout;
    __int16 v12 = 2048;
    double v13 = fireInterval;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Setting RTWatchdogManager default timeout, %f, fireInterval, %f", (uint8_t *)&v10, 0x16u);
  }
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  v5 = [(RTWatchdogManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__RTWatchdogManager_addObject___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __31__RTWatchdogManager_addObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addObject:*(void *)(a1 + 40)];
}

- (void)_addObject:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double timeout = self->_timeout;
  if (objc_opt_respondsToSelector())
  {
    [v4 timeout];
    double timeout = v6;
  }
  v7 = [[RTWatchdogRecord alloc] initWithObject:v4 timeout:timeout];
  [(NSMutableArray *)self->_records addObject:v7];
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityWatchdog);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    int v10 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Adding record, %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)removeObject:(id)a3
{
  id v4 = a3;
  v5 = [(RTWatchdogManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__RTWatchdogManager_removeObject___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __34__RTWatchdogManager_removeObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObject:*(void *)(a1 + 40)];
}

- (void)_removeObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F28F60];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__RTWatchdogManager__removeObject___block_invoke;
  v8[3] = &unk_1E6B984E0;
  id v9 = v4;
  id v6 = v4;
  v7 = [v5 predicateWithBlock:v8];
  [(NSMutableArray *)self->_records filterUsingPredicate:v7];
}

uint64_t __35__RTWatchdogManager__removeObject___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 object];
  LODWORD(a1) = [v3 isEqual:*(void *)(a1 + 32)];

  return a1 ^ 1;
}

- (id)_getRecordsWithCriteria:(BOOL)a3
{
  int v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(RTWatchdogManager *)self records];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 isPendingCheckIn] == v3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_checkInAllStartedRecords:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] now];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v8 = 138412546;
    long long v18 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        __int16 v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v13 = [v12 checkInStartDate:v18];
        [v5 timeIntervalSinceDate:v13];
        double v15 = v14;

        [v12 timeout];
        if (v15 >= v16)
        {
          [(RTWatchdogManager *)self _timeoutExceeded:v12];
        }
        else
        {
          __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityWatchdog);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v18;
            dispatch_queue_t v24 = v12;
            __int16 v25 = 2048;
            double v26 = v15;
            _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "Pending check-in from record, %@, time since check in started, %f", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v9);
  }
}

- (void)_timeoutExceeded:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _rt_log_facility_get_os_log(RTLogFacilityWatchdog);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_fault_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_FAULT, "Hung record, %@, exiting", (uint8_t *)&v11, 0xCu);
  }

  id v6 = [(RTWatchdogManager *)self metrics];
  uint64_t v7 = [v4 object];
  long long v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  [v4 getLatency];
  [v6 submitToCoreAnalytics:v9 type:2];

  uint64_t v10 = [(RTWatchdogManager *)self lifecycleManager];
  [v10 exit];
}

- (void)_checkInAllStoppedRecords:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        long long v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
        [v8 setCheckInStartDate:v9];

        [v8 setCheckInStopDate:0];
        uint64_t v10 = [v8 object];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __47__RTWatchdogManager__checkInAllStoppedRecords___block_invoke;
        v12[3] = &unk_1E6B93748;
        v12[4] = self;
        v12[5] = v8;
        [v10 checkInWithHandler:v12];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

void __47__RTWatchdogManager__checkInAllStoppedRecords___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTWatchdogManager__checkInAllStoppedRecords___block_invoke_2;
  block[3] = &unk_1E6B90E70;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(v2, block);
}

void __47__RTWatchdogManager__checkInAllStoppedRecords___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] now];
  [*(id *)(a1 + 32) setCheckInStopDate:v2];

  int v3 = _rt_log_facility_get_os_log(RTLogFacilityWatchdog);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "Checked in record, %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_checkInAllRecords
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = [(RTWatchdogManager *)self _getRecordsWithCriteria:1];
  uint64_t v4 = [(RTWatchdogManager *)self _getRecordsWithCriteria:0];
  int v5 = _rt_log_facility_get_os_log(RTLogFacilityWatchdog);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218240;
    uint64_t v7 = [v3 count];
    __int16 v8 = 2048;
    uint64_t v9 = [v4 count];
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "Checking in all records, %lu started, %lu stopped", (uint8_t *)&v6, 0x16u);
  }

  [(RTWatchdogManager *)self _checkInAllStartedRecords:v3];
  [(RTWatchdogManager *)self _checkInAllStoppedRecords:v4];
}

- (void)shutdownWithHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(RTWatchdogManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__RTWatchdogManager_shutdownWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __41__RTWatchdogManager_shutdownWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shutdownWithHandler:*(void *)(a1 + 40)];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v6 = a3;
  [(RTTimer *)self->_watchdogHeartbeatTimer invalidate];
  watchdogHeartbeatTimer = self->_watchdogHeartbeatTimer;
  self->_watchdogHeartbeatTimer = 0;

  [(NSMutableArray *)self->_records removeAllObjects];
  int v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    int v5 = v6;
  }
}

- (RTTimer)watchdogHeartbeatTimer
{
  return self->_watchdogHeartbeatTimer;
}

- (void)setWatchdogHeartbeatTimer:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (RTLifeCycleManager)lifecycleManager
{
  return self->_lifecycleManager;
}

- (void)setLifecycleManager:(id)a3
{
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (RTHangsMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (double)fireInterval
{
  return self->_fireInterval;
}

- (void)setFireInterval:(double)a3
{
  self->_double fireInterval = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_double timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_lifecycleManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);

  objc_storeStrong((id *)&self->_watchdogHeartbeatTimer, 0);
}

@end