@interface SMTriggerDuration
- (BOOL)_startMonitoringWithConfig:(id)a3 error:(id *)a4;
- (BOOL)_stopMonitoring;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTXPCTimerAlarm)xpcTimerAlarm;
- (SMSessionStore)sessionStore;
- (SMTriggerDuration)initWithQueue:(id)a3 defaultsManager:(id)a4 sessionStore:(id)a5;
- (SMTriggerManagerProtocol)sessionMonitorDelegate;
- (void)_initializeTimers;
- (void)modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)setDefaultsManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSessionMonitorDelegate:(id)a3;
- (void)setSessionStore:(id)a3;
- (void)setXpcTimerAlarm:(id)a3;
- (void)setup;
- (void)startMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)stopMonitoringWithHandler:(id)a3;
@end

@implementation SMTriggerDuration

- (SMTriggerDuration)initWithQueue:(id)a3 defaultsManager:(id)a4 sessionStore:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SMTriggerDuration initWithQueue:defaultsManager:sessionStore:]";
      __int16 v24 = 1024;
      LODWORD(v25) = 39;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }
  }
  v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v23 = v16;
    __int16 v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, initializing", buf, 0x16u);
  }
  v21.receiver = self;
  v21.super_class = (Class)SMTriggerDuration;
  v18 = [(SMTriggerDuration *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v19->_defaultsManager, a4);
    objc_storeStrong((id *)&v19->_sessionStore, a5);
    [(SMTriggerDuration *)v19 setup];
  }

  return v19;
}

- (void)setup
{
  v3 = [(SMTriggerDuration *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SMTriggerDuration_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __26__SMTriggerDuration_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_initializeTimers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [RTXPCTimerAlarm alloc];
  v4 = [(SMTriggerDuration *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__SMTriggerDuration__initializeTimers__block_invoke;
  v9[3] = &unk_1E6B90E70;
  v9[4] = self;
  v5 = [(RTXPCTimerAlarm *)v3 initWithIdentifier:@"com.apple.routined.triggerDuration" queue:v4 handler:v9];
  [(SMTriggerDuration *)self setXpcTimerAlarm:v5];

  v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [(SMTriggerDuration *)self xpcTimerAlarm];
    v8 = [v7 identifier];
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SMTriggerDuration _initializeTimers]";
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, initialized xpcTimerAlarm, %@", buf, 0x16u);
  }
}

void __38__SMTriggerDuration__initializeTimers__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SMTriggerDuration__initializeTimers__block_invoke_2;
  block[3] = &unk_1E6B90E70;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __38__SMTriggerDuration__initializeTimers__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = [*(id *)(a1 + 32) xpcTimerAlarm];
    v4 = [v3 identifier];
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "timer %@ expired", (uint8_t *)&v9, 0xCu);
  }
  v5 = [SMTriggerNotification alloc];
  v6 = [MEMORY[0x1E4F1C9C8] now];
  v7 = [(SMTriggerNotification *)v5 initWithTriggerCategory:7 SOSState:1 triggerName:@"DurationTrigger" date:v6 details:MEMORY[0x1E4F1CC08]];

  v8 = [*(id *)(a1 + 32) sessionMonitorDelegate];
  [v8 onTriggerNotification:v7];
}

- (void)startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [v7 time];
  id v10 = [v9 timeBound];

  if (v10)
  {
    uint64_t v11 = [(SMTriggerDuration *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SMTriggerDuration_startMonitoringWithConfiguration_handler___block_invoke;
    block[3] = &unk_1E6B90C40;
    block[4] = self;
    id v17 = v7;
    SEL v19 = a2;
    id v18 = v8;
    dispatch_async(v11, block);
  }
  else if (v8)
  {
    __int16 v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"endDate is nil";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v15 = [v12 errorWithDomain:v13 code:7 userInfo:v14];

    (*((void (**)(id, void *))v8 + 2))(v8, v15);
  }
}

void __62__SMTriggerDuration_startMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) time];
  v4 = [v3 timeBound];
  id v14 = 0;
  [v2 _startMonitoringWithConfig:v4 error:&v14];
  id v5 = v14;

  v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    int v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v10 = [*(id *)(a1 + 40) time];
    uint64_t v11 = [v10 timeBound];
    __int16 v12 = [v11 stringFromDate];
    *(_DWORD *)buf = 138413058;
    v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, endDate, %@, error, %@", buf, 0x2Au);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v5);
  }
}

- (BOOL)_startMonitoringWithConfig:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v8 = [(SMTriggerDuration *)self xpcTimerAlarm];

    if (!v8) {
      [(SMTriggerDuration *)self _initializeTimers];
    }
    int v9 = [(SMTriggerDuration *)self xpcTimerAlarm];
    id v19 = 0;
    [v9 fireWithDate:v7 error:&v19];
    id v10 = v19;

    if (a4) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    BOOL v12 = v11;
    if (!v11)
    {
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        __int16 v17 = NSStringFromClass(v16);
        id v18 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        __int16 v21 = v17;
        __int16 v22 = 2112;
        uint64_t v23 = v18;
        __int16 v24 = 2112;
        id v25 = v10;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      *a4 = v10;
    }
  }
  else
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"endDate");
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (void)stopMonitoringWithHandler:(id)a3
{
  id v5 = a3;
  v6 = [(SMTriggerDuration *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SMTriggerDuration_stopMonitoringWithHandler___block_invoke;
  block[3] = &unk_1E6B921E0;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __47__SMTriggerDuration_stopMonitoringWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _stopMonitoring];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    SEL v10 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (BOOL)_stopMonitoring
{
  v3 = [(SMTriggerDuration *)self xpcTimerAlarm];
  [v3 invalidate];

  [(SMTriggerDuration *)self setXpcTimerAlarm:0];
  return 1;
}

- (void)modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = [(SMTriggerDuration *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__SMTriggerDuration_modifyMonitoringWithConfiguration_handler___block_invoke;
  v12[3] = &unk_1E6B927F8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

uint64_t __63__SMTriggerDuration_modifyMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) xpcTimerAlarm];

  if (!v2 && *(void *)(a1 + 48))
  {
    v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F5CFE8];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"Can not modify a duration trigger that has not been initialized yet";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v6 = [v3 errorWithDomain:v4 code:7 userInfo:v5];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  [*(id *)(a1 + 32) stopMonitoringWithHandler:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) startMonitoringWithConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    __int16 v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 2112;
    SEL v15 = v10;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (SMTriggerManagerProtocol)sessionMonitorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->sessionMonitorDelegate);

  return (SMTriggerManagerProtocol *)WeakRetained;
}

- (void)setSessionMonitorDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTXPCTimerAlarm)xpcTimerAlarm
{
  return self->_xpcTimerAlarm;
}

- (void)setXpcTimerAlarm:(id)a3
{
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_xpcTimerAlarm, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->sessionMonitorDelegate);
}

@end