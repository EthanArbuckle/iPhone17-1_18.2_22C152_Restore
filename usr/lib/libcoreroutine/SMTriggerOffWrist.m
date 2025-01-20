@interface SMTriggerOffWrist
- (OS_dispatch_queue)queue;
- (RTDataProtectionManager)dataProtectionManager;
- (RTDefaultsManager)defaultsManager;
- (RTWatchWristStateManager)wristStateManager;
- (RTXPCTimerAlarm)offWristThresholdTimerAlarm;
- (SMSessionStore)sessionStore;
- (SMTriggerManagerProtocol)sessionMonitorDelegate;
- (SMTriggerOffWrist)initWithQueue:(id)a3 defaultsManager:(id)a4 dataProtectionManager:(id)a5 sessionStore:(id)a6 wristStateManager:(id)a7;
- (void)_onWristStateChangedNotification:(id)a3;
- (void)_setup;
- (void)_startMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)_stopMonitoringWithHandler:(id)a3;
- (void)onWristStateChangedNotification:(id)a3;
- (void)setDataProtectionManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setOffWristThresholdTimerAlarm:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSessionMonitorDelegate:(id)a3;
- (void)setSessionStore:(id)a3;
- (void)setWristStateManager:(id)a3;
- (void)setup;
- (void)startMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)stopMonitoringWithHandler:(id)a3;
@end

@implementation SMTriggerOffWrist

- (SMTriggerOffWrist)initWithQueue:(id)a3 defaultsManager:(id)a4 dataProtectionManager:(id)a5 sessionStore:(id)a6 wristStateManager:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v32 = a4;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v33 = a7;
  if (!v12)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[SMTriggerOffWrist initWithQueue:defaultsManager:dataProtectionManager:sessionStore:wristStateManager:]";
      __int16 v38 = 1024;
      LODWORD(v39) = 46;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }
  }
  v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    id v19 = v15;
    id v20 = a5;
    id v21 = v12;
    id v22 = a6;
    id v23 = v14;
    id v24 = a7;
    id v25 = v13;
    v26 = (char *)objc_claimAutoreleasedReturnValue();
    v27 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v37 = v26;
    __int16 v38 = 2112;
    v39 = v27;
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, %@, initializing triggerOffWrist", buf, 0x16u);

    id v13 = v25;
    a7 = v24;
    id v14 = v23;
    a6 = v22;
    id v12 = v21;
    a5 = v20;
    id v15 = v19;
  }

  v35.receiver = self;
  v35.super_class = (Class)SMTriggerOffWrist;
  v28 = [(SMTriggerOffWrist *)&v35 init];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_queue, a3);
    objc_storeStrong((id *)&v29->_defaultsManager, v32);
    objc_storeStrong((id *)&v29->_dataProtectionManager, a5);
    objc_storeStrong((id *)&v29->_sessionStore, a6);
    objc_storeStrong((id *)&v29->_wristStateManager, a7);
    [(SMTriggerOffWrist *)v29 setup];
  }

  return v29;
}

- (void)setup
{
  v3 = [(SMTriggerOffWrist *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SMTriggerOffWrist_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __26__SMTriggerOffWrist_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_setup
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    v4 = "-[SMTriggerOffWrist _setup]";
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SMTriggerOffWrist *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SMTriggerOffWrist_startMonitoringWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __62__SMTriggerOffWrist_startMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startMonitoringWithConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, void))a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      id v13 = NSStringFromSelector(a2);
      int v19 = 138412546;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, start monitoring wrist state notifications", (uint8_t *)&v19, 0x16u);
    }
    id v14 = [(SMTriggerOffWrist *)self wristStateManager];
    id v15 = +[RTNotification notificationName];
    [v14 addObserver:self selector:sel_onWristStateChangedNotification_ name:v15];

    if (v8) {
      v8[2](v8, 0);
    }
  }
  else
  {
    if (v10)
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      v18 = NSStringFromSelector(a2);
      int v19 = 138412546;
      id v20 = v17;
      __int16 v21 = 2112;
      id v22 = v18;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, configuration is nil, monitoring cannot be started without valid configuration", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)stopMonitoringWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMTriggerOffWrist *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SMTriggerOffWrist_stopMonitoringWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __47__SMTriggerOffWrist_stopMonitoringWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopMonitoringWithHandler:*(void *)(a1 + 40)];
}

- (void)_stopMonitoringWithHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void))a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, stop monitoring for wrist state notifications", (uint8_t *)&v11, 0x16u);
  }
  BOOL v10 = [(SMTriggerOffWrist *)self wristStateManager];
  [v10 removeObserver:self];

  if (v5) {
    v5[2](v5, 0);
  }
}

- (void)onWristStateChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMTriggerOffWrist *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SMTriggerOffWrist_onWristStateChangedNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__SMTriggerOffWrist_onWristStateChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onWristStateChangedNotification:*(void *)(a1 + 40)];
}

- (void)_onWristStateChangedNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SMTriggerOffWrist *)self defaultsManager];
    id v6 = [v5 objectForKey:@"RTDefaultsSMTriggerOffWristSuppressNotifications"];
    int v7 = [v6 BOOLValue];

    if (v7)
    {
      id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = +[RTNotification notificationName];
        *(_DWORD *)buf = 136315394;
        v27 = "-[SMTriggerOffWrist _onWristStateChangedNotification:]";
        __int16 v28 = 2112;
        v29 = v9;
        _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, device configured to suppress %@", buf, 0x16u);
      }
    }
    else
    {
      id v8 = v4;
      if ([v8 wristState] == 1)
      {
        BOOL v10 = [(SMTriggerOffWrist *)self offWristThresholdTimerAlarm];

        if (!v10)
        {
          objc_initWeak(&location, self);
          int v11 = [RTXPCTimerAlarm alloc];
          id v12 = [(SMTriggerOffWrist *)self queue];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __54__SMTriggerOffWrist__onWristStateChangedNotification___block_invoke;
          v23[3] = &unk_1E6B92EA0;
          v23[4] = self;
          objc_copyWeak(&v24, &location);
          __int16 v13 = [(RTXPCTimerAlarm *)v11 initWithIdentifier:@"com.apple.routined.safetyMonitor.triggerOffWrist.offWristThresholdTimerAlarm" queue:v12 handler:v23];
          [(SMTriggerOffWrist *)self setOffWristThresholdTimerAlarm:v13];

          id v14 = [(SMTriggerOffWrist *)self offWristThresholdTimerAlarm];
          uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
          v16 = [v15 dateByAddingTimeInterval:30.0];
          id v22 = 0;
          [v14 fireWithDate:v16 error:&v22];
          id v17 = v22;

          if (v17)
          {
            v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              __int16 v21 = [v17 description];
              *(_DWORD *)buf = 136315394;
              v27 = "-[SMTriggerOffWrist _onWristStateChangedNotification:]";
              __int16 v28 = 2112;
              v29 = v21;
              _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "%s watch separation buffer timer setup failed with error, %@", buf, 0x16u);
            }
          }

          objc_destroyWeak(&v24);
          objc_destroyWeak(&location);
        }
      }
      else if ([v8 wristState] == 2)
      {
        int v19 = [(SMTriggerOffWrist *)self offWristThresholdTimerAlarm];

        if (v19)
        {
          id v20 = [(SMTriggerOffWrist *)self offWristThresholdTimerAlarm];
          [v20 invalidate];

          [(SMTriggerOffWrist *)self setOffWristThresholdTimerAlarm:0];
        }
      }
    }
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [notification isKindOfClass:[RTWatchWristStateManagerWristStateChangedNotification class]]", buf, 2u);
    }
  }
}

void __54__SMTriggerOffWrist__onWristStateChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = [*(id *)(a1 + 32) offWristThresholdTimerAlarm];
    id v4 = [v3 identifier];
    int v11 = 136315394;
    id v12 = "-[SMTriggerOffWrist _onWristStateChangedNotification:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, %@ expired", (uint8_t *)&v11, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained offWristThresholdTimerAlarm];
  [v6 invalidate];

  int v7 = [SMTriggerNotification alloc];
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [(SMTriggerNotification *)v7 initWithTriggerCategory:19 SOSState:1 triggerName:@"SMTriggerOffWrist" date:v8 details:MEMORY[0x1E4F1CC08]];

  BOOL v10 = [WeakRetained sessionMonitorDelegate];
  [v10 onTriggerNotification:v9];
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

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (void)setDataProtectionManager:(id)a3
{
}

- (RTWatchWristStateManager)wristStateManager
{
  return self->_wristStateManager;
}

- (void)setWristStateManager:(id)a3
{
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
}

- (RTXPCTimerAlarm)offWristThresholdTimerAlarm
{
  return self->_offWristThresholdTimerAlarm;
}

- (void)setOffWristThresholdTimerAlarm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offWristThresholdTimerAlarm, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_wristStateManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->sessionMonitorDelegate);
}

@end