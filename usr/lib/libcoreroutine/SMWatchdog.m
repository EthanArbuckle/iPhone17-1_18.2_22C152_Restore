@interface SMWatchdog
- (NSDate)watchdogTimerFireDate;
- (NSMutableArray)records;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTTimer)watchdogTimer;
- (RTTimerManager)timerManager;
- (SMWatchdog)initWithDefaultsManager:(id)a3 handler:(id)a4;
- (SMWatchdogRecord)mostRecentRecord;
- (double)_fetchTimeoutValueForState:(unint64_t)a3;
- (double)heartbeatInterval;
- (id)_createRecord:(id)a3 timeoutLimit:(double)a4;
- (id)handler;
- (void)_addRecord:(id)a3;
- (void)_addStateToWatchdog:(id)a3;
- (void)_checkInAllRecords;
- (void)_removeRecord:(id)a3;
- (void)_setUpWatchdogTimerToFireWithDate:(id)a3;
- (void)_shutdownWithHandler:(id)a3;
- (void)_updateTimerBasedOnRecords;
- (void)_updateTimerIfNeeded:(id)a3;
- (void)addRecord:(id)a3;
- (void)handleStateChange:(id)a3 forActiveDevice:(BOOL)a4;
- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4;
- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4;
- (void)receiveHeartbeatForSessionID:(id)a3 handler:(id)a4;
- (void)removeRecord:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setHandler:(id)a3;
- (void)setHeartbeatInterval:(double)a3;
- (void)setMostRecentRecord:(id)a3;
- (void)setRecords:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setWatchdogTimer:(id)a3;
- (void)setWatchdogTimerFireDate:(id)a3;
- (void)shutdownWithHandler:(id)a3;
@end

@implementation SMWatchdog

- (SMWatchdog)initWithDefaultsManager:(id)a3 handler:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v35.receiver = self;
    v35.super_class = (Class)SMWatchdog;
    v9 = [(SMWatchdog *)&v35 init];
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (const char *)[(SMWatchdog *)v11 UTF8String];
      }
      else
      {
        id v16 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v11];
        v13 = (const char *)[v16 UTF8String];
      }
      dispatch_queue_t v17 = dispatch_queue_create(v13, v12);

      queue = v11->_queue;
      v11->_queue = (OS_dispatch_queue *)v17;

      uint64_t v19 = MEMORY[0x1E016DB00](v8);
      id handler = v11->_handler;
      v11->_id handler = (id)v19;

      objc_storeStrong((id *)&v11->_defaultsManager, a3);
      uint64_t v21 = objc_opt_new();
      timerManager = v11->_timerManager;
      v11->_timerManager = (RTTimerManager *)v21;

      uint64_t v23 = objc_opt_new();
      records = v11->_records;
      v11->_records = (NSMutableArray *)v23;

      watchdogTimer = v11->_watchdogTimer;
      v11->_watchdogTimer = 0;

      watchdogTimerFireDate = v11->_watchdogTimerFireDate;
      v11->_watchdogTimerFireDate = 0;

      defaultsManager = v11->_defaultsManager;
      double v28 = *MEMORY[0x1E4F99A80];
      v29 = [NSNumber numberWithDouble:*MEMORY[0x1E4F99A80]];
      v30 = [(RTDefaultsManager *)defaultsManager objectForKey:@"RTDefaultsSMHeartbeatInterval" value:v29];
      [v30 doubleValue];
      v11->_double heartbeatInterval = v31;

      if (v11->_heartbeatInterval != v28)
      {
        v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          double heartbeatInterval = v11->_heartbeatInterval;
          *(_DWORD *)buf = 136316162;
          v37 = "-[SMWatchdog initWithDefaultsManager:handler:]";
          __int16 v38 = 2080;
          v39 = "overriding safety monitor heartbeat interval";
          __int16 v40 = 2048;
          double v41 = v28;
          __int16 v42 = 2048;
          double v43 = heartbeatInterval;
          __int16 v44 = 2112;
          v45 = @"RTDefaultsSMHeartbeatInterval";
          _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
        }
      }
    }
    self = v10;
    v15 = self;
  }
  else
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

    v15 = 0;
  }

  return v15;
}

- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    v9 = "-[SMWatchdog onSessionResumedWithState:forActiveDevice:]";
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, state, %@, activeDevice, %d", (uint8_t *)&v8, 0x1Cu);
  }

  [(SMWatchdog *)self handleStateChange:v6 forActiveDevice:v4];
}

- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    v9 = "-[SMWatchdog onSessionStateChanged:forActiveDevice:]";
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, state, %@, activeDevice, %d", (uint8_t *)&v8, 0x1Cu);
  }

  [(SMWatchdog *)self handleStateChange:v6 forActiveDevice:v4];
}

- (void)handleStateChange:(id)a3 forActiveDevice:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    if ([v6 sessionState] == 1 || !objc_msgSend(v7, "sessionState"))
    {
      [(SMWatchdog *)self shutdownWithHandler:&__block_literal_global_64];
      goto LABEL_10;
    }
    int v8 = [(SMWatchdog *)self mostRecentRecord];
    v9 = [v8 state];
    int v10 = [v7 isEqual:v9];

    if (!v10)
    {
      BOOL v13 = [(SMWatchdog *)self queue];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __48__SMWatchdog_handleStateChange_forActiveDevice___block_invoke_11;
      v14[3] = &unk_1E6B90BF0;
      v14[4] = self;
      id v15 = v7;
      dispatch_async(v13, v14);

      goto LABEL_10;
    }
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      dispatch_queue_t v17 = "-[SMWatchdog handleStateChange:forActiveDevice:]";
      __int16 v12 = "%s, received duplicate state change ";
LABEL_13:
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
    }
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      dispatch_queue_t v17 = "-[SMWatchdog handleStateChange:forActiveDevice:]";
      __int16 v12 = "%s, received state change for non-active device";
      goto LABEL_13;
    }
  }

LABEL_10:
}

void __48__SMWatchdog_handleStateChange_forActiveDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    v5 = "-[SMWatchdog handleStateChange:forActiveDevice:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, shutdown watchdog with error, %@", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t __48__SMWatchdog_handleStateChange_forActiveDevice___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addStateToWatchdog:*(void *)(a1 + 40)];
}

- (void)_updateTimerBasedOnRecords
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_records count])
  {
    v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v4 = [(SMWatchdog *)self records];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        uint64_t v8 = 0;
        v9 = v3;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          int v10 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
          id v11 = [v10 startDate];
          [v10 timeout];
          __int16 v12 = [v11 dateByAddingTimeInterval:];

          v3 = [v9 earlierDate:v12];

          ++v8;
          v9 = v3;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v6);
    }

    BOOL v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [v3 stringFromDate];
      *(_DWORD *)buf = 136315394;
      v20 = "-[SMWatchdog _updateTimerBasedOnRecords]";
      __int16 v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, Updating earliest fire date, %@", buf, 0x16u);
    }
    [(SMWatchdog *)self _updateTimerIfNeeded:v3];
  }
  else
  {
    [(SMWatchdog *)self _shutdownWithHandler:&__block_literal_global_14];
  }
}

void __40__SMWatchdog__updateTimerBasedOnRecords__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    id v2 = "-[SMWatchdog _updateTimerBasedOnRecords]_block_invoke";
    _os_log_impl(&dword_1D9BFA000, v0, OS_LOG_TYPE_INFO, "%s, Removing timer as there are no records left", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_updateTimerIfNeeded:(id)a3
{
  id v4 = a3;
  watchdogTimerFireDate = self->_watchdogTimerFireDate;
  id v6 = v4;
  if (!watchdogTimerFireDate || ![(NSDate *)watchdogTimerFireDate isEqualToDate:v4]) {
    [(SMWatchdog *)self _setUpWatchdogTimerToFireWithDate:v6];
  }

  MEMORY[0x1F41817F8]();
}

- (void)_setUpWatchdogTimerToFireWithDate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 stringFromDate];
    *(_DWORD *)buf = 136315394;
    v20 = "-[SMWatchdog _setUpWatchdogTimerToFireWithDate:]";
    __int16 v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, Set up watchdog timer with date, %@", buf, 0x16u);
  }
  if (v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
    char v8 = [v4 isEqualToDate:v7];

    if ((v8 & 1) == 0)
    {
      [(RTTimer *)self->_watchdogTimer invalidate];
      objc_initWeak((id *)buf, self);
      timerManager = self->_timerManager;
      int v10 = [(SMWatchdog *)self queue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __48__SMWatchdog__setUpWatchdogTimerToFireWithDate___block_invoke;
      v17[3] = &unk_1E6B91900;
      objc_copyWeak(&v18, (id *)buf);
      id v11 = [(RTTimerManager *)timerManager timerWithIdentifier:@"SMWatchdogHeartbeatTimer" queue:v10 handler:v17];
      watchdogTimer = self->_watchdogTimer;
      self->_watchdogTimer = v11;

      [v4 timeIntervalSinceNow];
      BOOL v13 = self->_watchdogTimer;
      if (v14 <= 0.0)
      {
        [(RTTimer *)self->_watchdogTimer fireAfterDelay:0.0];
        long long v15 = [MEMORY[0x1E4F1C9C8] now];
      }
      else
      {
        [v4 timeIntervalSinceNow];
        -[RTTimer fireAfterDelay:](v13, "fireAfterDelay:");
        long long v15 = (NSDate *)v4;
      }
      watchdogTimerFireDate = self->_watchdogTimerFireDate;
      self->_watchdogTimerFireDate = v15;

      [(RTTimer *)self->_watchdogTimer resume];
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __48__SMWatchdog__setUpWatchdogTimerToFireWithDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v1 = [WeakRetained watchdogTimer];
  [v1 invalidate];

  [WeakRetained setWatchdogTimerFireDate:0];
  [WeakRetained _checkInAllRecords];
}

- (void)addRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMWatchdog *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __24__SMWatchdog_addRecord___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __24__SMWatchdog_addRecord___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addRecord:*(void *)(a1 + 40)];
}

- (void)_addRecord:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 description];
    int v8 = 136315394;
    v9 = "-[SMWatchdog _addRecord:]";
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, Adding record, %@", (uint8_t *)&v8, 0x16u);
  }
  if (v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
    [v4 setStartDate:v7];

    [(NSMutableArray *)self->_records addObject:v4];
    [(SMWatchdog *)self _updateTimerBasedOnRecords];
  }
}

- (void)removeRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(SMWatchdog *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __27__SMWatchdog_removeRecord___block_invoke;
    v6[3] = &unk_1E6B90BF0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __27__SMWatchdog_removeRecord___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeRecord:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 _updateTimerBasedOnRecords];
}

- (void)_removeRecord:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 description];
    id v7 = [(SMWatchdog *)self records];
    *(_DWORD *)buf = 136315650;
    long long v16 = "-[SMWatchdog _removeRecord:]";
    __int16 v17 = 2112;
    uint64_t v18 = (uint64_t)v6;
    __int16 v19 = 2048;
    uint64_t v20 = [v7 count];
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, Removing record, %@, Remaining records, %lu", buf, 0x20u);
  }
  if (v4)
  {
    int v8 = (void *)MEMORY[0x1E4F28F60];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __28__SMWatchdog__removeRecord___block_invoke;
    v13[3] = &unk_1E6B97838;
    id v14 = v4;
    v9 = [v8 predicateWithBlock:v13];
    [(NSMutableArray *)self->_records filterUsingPredicate:v9];
    __int16 v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [(SMWatchdog *)self records];
      uint64_t v12 = [v11 count];
      *(_DWORD *)buf = 136315394;
      long long v16 = "-[SMWatchdog _removeRecord:]";
      __int16 v17 = 2048;
      uint64_t v18 = v12;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, Remaining records, %lu", buf, 0x16u);
    }
  }
}

uint64_t __28__SMWatchdog__removeRecord___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

- (void)_checkInAllRecords
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(SMWatchdog *)self records];
    *(_DWORD *)buf = 136315394;
    double v31 = "-[SMWatchdog _checkInAllRecords]";
    __int16 v32 = 2048;
    uint64_t v33 = [v4 count];
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, Checking in all records, %lu", buf, 0x16u);
  }
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = [(SMWatchdog *)self records];
  int v8 = [v6 arrayWithArray:v7];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v27;
    *(void *)&long long v11 = 138412802;
    long long v25 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v16 = [v15 startDate:v25, v26];
        [v5 timeIntervalSinceDate:v16];
        double v18 = v17;

        __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v23 = [v15 description];
          [v15 timeout];
          *(_DWORD *)buf = v25;
          double v31 = v23;
          __int16 v32 = 2048;
          uint64_t v33 = v24;
          __int16 v34 = 2048;
          double v35 = v18;
          _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "Checking on record, %@, timeout, %f, time since check in started, %f", buf, 0x20u);
        }
        [v15 timeout];
        if (v18 >= v20)
        {
          uint64_t v21 = [(SMWatchdog *)self handler];
          v22 = [v15 state];
          ((void (**)(void, void *, void))v21)[2](v21, v22, 0);

          [(SMWatchdog *)self _removeRecord:v15];
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v12);
  }

  [(SMWatchdog *)self _updateTimerBasedOnRecords];
}

- (void)_addStateToWatchdog:(id)a3
{
  id v8 = a3;
  -[SMWatchdog _fetchTimeoutValueForState:](self, "_fetchTimeoutValueForState:", [v8 sessionState]);
  if (v4 > 0.0)
  {
    uint64_t v5 = -[SMWatchdog _createRecord:timeoutLimit:](self, "_createRecord:timeoutLimit:", v8);
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(SMWatchdog *)self mostRecentRecord];
      [(SMWatchdog *)self _removeRecord:v7];

      [(SMWatchdog *)self _updateTimerBasedOnRecords];
      [(SMWatchdog *)self _addRecord:v6];
      [(SMWatchdog *)self setMostRecentRecord:v6];
    }
  }
}

- (double)_fetchTimeoutValueForState:(unint64_t)a3
{
  double result = 0.0;
  switch(a3)
  {
    case 2uLL:
      uint64_t v5 = [(SMWatchdog *)self defaultsManager];
      id v6 = [v5 objectForKey:@"RTDefaultsSMWatchdogMonitoringStateTimeout"];

      if (v6)
      {
        id v7 = [(SMWatchdog *)self defaultsManager];
        id v8 = v7;
        id v9 = @"RTDefaultsSMWatchdogMonitoringStateTimeout";
        goto LABEL_20;
      }
      long long v29 = (double *)MEMORY[0x1E4F99BE0];
      return *v29;
    case 4uLL:
      uint64_t v10 = [(SMWatchdog *)self defaultsManager];
      long long v11 = [v10 objectForKey:@"RTDefaultsSMWatchdogCacheReleaseStateTimeout"];

      if (v11)
      {
        id v7 = [(SMWatchdog *)self defaultsManager];
        id v8 = v7;
        id v9 = @"RTDefaultsSMWatchdogCacheReleaseStateTimeout";
        goto LABEL_20;
      }
      long long v29 = (double *)MEMORY[0x1E4F99BC0];
      return *v29;
    case 7uLL:
      uint64_t v12 = [(SMWatchdog *)self defaultsManager];
      uint64_t v13 = [v12 objectForKey:@"RTDefaultsSMWatchdogDestinationAnomalyStateTimeout"];

      if (v13)
      {
        id v7 = [(SMWatchdog *)self defaultsManager];
        id v8 = v7;
        id v9 = @"RTDefaultsSMWatchdogDestinationAnomalyStateTimeout";
        goto LABEL_20;
      }
      long long v29 = (double *)MEMORY[0x1E4F99BC8];
      return *v29;
    case 8uLL:
      id v14 = [(SMWatchdog *)self defaultsManager];
      long long v15 = [v14 objectForKey:@"RTDefaultsSMWatchdogRoundTripAnomalyStateTimeout"];

      if (v15)
      {
        id v7 = [(SMWatchdog *)self defaultsManager];
        id v8 = v7;
        id v9 = @"RTDefaultsSMWatchdogRoundTripAnomalyStateTimeout";
        goto LABEL_20;
      }
      long long v29 = (double *)MEMORY[0x1E4F99BF0];
      return *v29;
    case 9uLL:
      long long v16 = [(SMWatchdog *)self defaultsManager];
      double v17 = [v16 objectForKey:@"RTDefaultsSMWatchdogTimerEndedPromptStateTimeout"];

      if (v17)
      {
        id v7 = [(SMWatchdog *)self defaultsManager];
        id v8 = v7;
        id v9 = @"RTDefaultsSMWatchdogTimerEndedPromptStateTimeout";
        goto LABEL_20;
      }
      long long v29 = (double *)MEMORY[0x1E4F99BF8];
      return *v29;
    case 0xAuLL:
      double v18 = [(SMWatchdog *)self defaultsManager];
      __int16 v19 = [v18 objectForKey:@"RTDefaultsSMWatchdogInitializingStateTimeout"];

      if (v19)
      {
        id v7 = [(SMWatchdog *)self defaultsManager];
        id v8 = v7;
        id v9 = @"RTDefaultsSMWatchdogInitializingStateTimeout";
        goto LABEL_20;
      }
      long long v29 = (double *)MEMORY[0x1E4F99BD8];
      return *v29;
    case 0xBuLL:
      double v20 = [(SMWatchdog *)self defaultsManager];
      uint64_t v21 = [v20 objectForKey:@"RTDefaultsSMWatchdogReadyStateTimeout"];

      if (v21)
      {
        id v7 = [(SMWatchdog *)self defaultsManager];
        id v8 = v7;
        id v9 = @"RTDefaultsSMWatchdogReadyStateTimeout";
        goto LABEL_20;
      }
      long long v29 = (double *)MEMORY[0x1E4F99BE8];
      return *v29;
    case 0xCuLL:
      v22 = [(SMWatchdog *)self defaultsManager];
      uint64_t v23 = [v22 objectForKey:@"RTDefaultsSMWatchdogEndAwarenessStateTimeout"];

      if (v23)
      {
        id v7 = [(SMWatchdog *)self defaultsManager];
        id v8 = v7;
        id v9 = @"RTDefaultsSMWatchdogEndAwarenessStateTimeout";
        goto LABEL_20;
      }
      long long v29 = (double *)MEMORY[0x1E4F99BD0];
      return *v29;
    case 0xEuLL:
      uint64_t v24 = [(SMWatchdog *)self defaultsManager];
      long long v25 = [v24 objectForKey:@"RTDefaultsSMWatchdogWorkoutAnomalyStateTimeoutKey"];

      if (v25)
      {
        id v7 = [(SMWatchdog *)self defaultsManager];
        id v8 = v7;
        id v9 = @"RTDefaultsSMWatchdogWorkoutAnomalyStateTimeoutKey";
LABEL_20:
        long long v26 = [v7 objectForKey:v9];
        [v26 doubleValue];
        double v28 = v27;

        return v28;
      }
      else
      {
        long long v29 = (double *)MEMORY[0x1E4F99C00];
        return *v29;
      }
    default:
      return result;
  }
}

- (id)_createRecord:(id)a3 timeoutLimit:(double)a4
{
  id v6 = a3;
  id v7 = [v6 sessionStateTransitionDate];
  [v7 timeIntervalSinceNow];
  double v9 = v8;

  double v10 = v9 + a4;
  long long v11 = [(SMWatchdog *)self mostRecentRecord];

  if (!v11)
  {
    if ([v6 sessionState] == 10 || objc_msgSend(v6, "sessionState") == 11)
    {
      [(SMWatchdog *)self heartbeatInterval];
      if (v10 < v12 + v12)
      {
        [(SMWatchdog *)self heartbeatInterval];
        double v10 = v13 + v13;
      }
    }
    if ([v6 isPromptState])
    {
      [(SMWatchdog *)self heartbeatInterval];
      if (v10 < v14)
      {
        [(SMWatchdog *)self heartbeatInterval];
        double v10 = v15;
      }
    }
  }
  long long v16 = [[SMWatchdogRecord alloc] initWithState:v6 timeout:v10];

  return v16;
}

- (void)receiveHeartbeatForSessionID:(id)a3 handler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v16 = "-[SMWatchdog receiveHeartbeatForSessionID:handler:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, sessionID, %@", buf, 0x16u);
  }

  double v9 = [(SMWatchdog *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SMWatchdog_receiveHeartbeatForSessionID_handler___block_invoke;
  block[3] = &unk_1E6B92668;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __51__SMWatchdog_receiveHeartbeatForSessionID_handler___block_invoke(uint64_t a1)
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) watchdogTimerFireDate];

  if (!v2)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v13 = *MEMORY[0x1E4F99A48];
    uint64_t v49 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"Watchdog is not active"];
    v50[0] = v14;
    double v15 = (void *)MEMORY[0x1E4F1C9E8];
    long long v16 = (void **)v50;
    __int16 v17 = &v49;
LABEL_12:
    uint64_t v21 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    v22 = v12;
    uint64_t v23 = v13;
    uint64_t v24 = 11;
LABEL_13:
    long long v25 = (void *)[v22 initWithDomain:v23 code:v24 userInfo:v21];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  uint64_t v3 = [*(id *)(a1 + 32) mostRecentRecord];

  if (!v3)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v13 = *MEMORY[0x1E4F99A48];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"No Watchdog record to modify"];
    v48 = v14;
    double v15 = (void *)MEMORY[0x1E4F1C9E8];
    long long v16 = &v48;
    __int16 v17 = &v47;
    goto LABEL_12;
  }
  double v4 = *(void **)(a1 + 40);
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v5 = [*(id *)(a1 + 32) mostRecentRecord];
  id v6 = [v5 state];
  id v7 = [v6 configuration];
  double v8 = [v7 sessionID];
  char v9 = [v4 isEqual:v8];

  if ((v9 & 1) == 0)
  {
LABEL_8:
    id v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = *(void *)(a1 + 40);
      double v35 = [*(id *)(a1 + 32) mostRecentRecord];
      v36 = [v35 state];
      uint64_t v37 = [v36 configuration];
      __int16 v38 = [v37 sessionID];
      *(_DWORD *)buf = 136315650;
      __int16 v42 = "-[SMWatchdog receiveHeartbeatForSessionID:handler:]_block_invoke";
      __int16 v43 = 2112;
      uint64_t v44 = v34;
      __int16 v45 = 2112;
      uint64_t v46 = v38;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "%s, invalid session ID %@, current sessionID, %@", buf, 0x20u);
    }
    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F99A48];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"%s cannot be completed since sessionID passed in does not match current sessionID", "-[SMWatchdog receiveHeartbeatForSessionID:handler:]_block_invoke"];
    __int16 v40 = v14;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v22 = v19;
    uint64_t v23 = v20;
    uint64_t v24 = 7;
    goto LABEL_13;
  }
  id v10 = [*(id *)(a1 + 32) mostRecentRecord];
  id v11 = [v10 state];
  if ([v11 sessionState] == 10)
  {

LABEL_15:
    long long v29 = [*(id *)(a1 + 32) mostRecentRecord];
    v30 = [v29 state];
    double v31 = (void *)[v30 mutableCopy];

    __int16 v32 = [MEMORY[0x1E4F1C9C8] now];
    [v31 setSessionStateTransitionDate:v32];

    [*(id *)(a1 + 32) _addStateToWatchdog:v31];
    goto LABEL_16;
  }
  long long v26 = [*(id *)(a1 + 32) mostRecentRecord];
  double v27 = [v26 state];
  uint64_t v28 = [v27 sessionState];

  if (v28 == 11) {
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v33 = *(void (**)(void))(*(void *)(a1 + 48) + 16);

  v33();
}

- (void)shutdownWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMWatchdog *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__SMWatchdog_shutdownWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __34__SMWatchdog_shutdownWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shutdownWithHandler:*(void *)(a1 + 40)];
}

- (void)_shutdownWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(SMWatchdog *)self records];
    int v9 = 136315394;
    id v10 = "-[SMWatchdog _shutdownWithHandler:]";
    __int16 v11 = 2048;
    uint64_t v12 = [v6 count];
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, records count, %lu", (uint8_t *)&v9, 0x16u);
  }
  [(SMWatchdog *)self setMostRecentRecord:0];
  [(RTTimer *)self->_watchdogTimer invalidate];
  watchdogTimer = self->_watchdogTimer;
  self->_watchdogTimer = 0;

  watchdogTimerFireDate = self->_watchdogTimerFireDate;
  self->_watchdogTimerFireDate = 0;

  [(NSMutableArray *)self->_records removeAllObjects];
  if (v4) {
    v4[2](v4, 0);
  }
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
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

- (SMWatchdogRecord)mostRecentRecord
{
  return self->_mostRecentRecord;
}

- (void)setMostRecentRecord:(id)a3
{
}

- (double)heartbeatInterval
{
  return self->_heartbeatInterval;
}

- (void)setHeartbeatInterval:(double)a3
{
  self->_double heartbeatInterval = a3;
}

- (RTTimer)watchdogTimer
{
  return self->_watchdogTimer;
}

- (void)setWatchdogTimer:(id)a3
{
}

- (NSDate)watchdogTimerFireDate
{
  return self->_watchdogTimerFireDate;
}

- (void)setWatchdogTimerFireDate:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_watchdogTimerFireDate, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_mostRecentRecord, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end