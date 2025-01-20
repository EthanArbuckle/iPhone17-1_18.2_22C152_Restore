@interface SMTriggerSOS
- (NSArray)SOSNotifications;
- (NSMutableDictionary)sosEvents;
- (OS_dispatch_queue)queue;
- (RTDarwinNotificationHelper)darwinSOSNotificationHelper;
- (SMSessionStore)sessionStore;
- (SMTriggerManagerProtocol)sessionMonitorDelegate;
- (SMTriggerSOS)initWithQueue:(id)a3 sessionStore:(id)a4;
- (void)_handleSOSNotificationForReason:(id)a3;
- (void)_notifySOSTriggerWithCategory:(unint64_t)a3;
- (void)_startMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)_stopMonitoringWithHandler:(id)a3;
- (void)handleSOSNotificationForReason:(id)a3;
- (void)onRemoteEmergencyContactsNotified:(unint64_t)a3;
- (void)setDarwinSOSNotificationHelper:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSOSNotifications:(id)a3;
- (void)setSessionMonitorDelegate:(id)a3;
- (void)setSessionStore:(id)a3;
- (void)setSosEvents:(id)a3;
- (void)startMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)stopMonitoringWithHandler:(id)a3;
@end

@implementation SMTriggerSOS

- (SMTriggerSOS)initWithQueue:(id)a3 sessionStore:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[SMTriggerSOS initWithQueue:sessionStore:]";
      __int16 v33 = 1024;
      LODWORD(v34) = 28;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }
  }
  v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v32 = v13;
    __int16 v33 = 2112;
    v34 = v14;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, initializing triggerSOS", buf, 0x16u);
  }
  v29.receiver = self;
  v29.super_class = (Class)SMTriggerSOS;
  v15 = [(SMTriggerSOS *)&v29 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_sessionStore, a4);
    uint64_t v17 = objc_opt_new();
    sosEvents = v16->_sosEvents;
    v16->_sosEvents = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    darwinSOSNotificationHelper = v16->_darwinSOSNotificationHelper;
    v16->_darwinSOSNotificationHelper = (RTDarwinNotificationHelper *)v19;

    v21 = [NSString stringWithUTF8String:*MEMORY[0x1E4F97BA0]];
    v30[0] = v21;
    v22 = [NSString stringWithUTF8String:*MEMORY[0x1E4F97BB0]];
    v30[1] = v22;
    v23 = [NSString stringWithUTF8String:*MEMORY[0x1E4F97BB8]];
    v30[2] = v23;
    v24 = [NSString stringWithUTF8String:*MEMORY[0x1E4F97BA8]];
    v30[3] = v24;
    v25 = [NSString stringWithUTF8String:*MEMORY[0x1E4F97B98]];
    v30[4] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
    SOSNotifications = v16->_SOSNotifications;
    v16->_SOSNotifications = (NSArray *)v26;
  }
  return v16;
}

- (void)startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SMTriggerSOS *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SMTriggerSOS_startMonitoringWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __57__SMTriggerSOS_startMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startMonitoringWithConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(SMTriggerSOS *)self SOSNotifications];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        id v13 = [(SMTriggerSOS *)self darwinSOSNotificationHelper];
        [v13 addObserver:self center:CFNotificationCenterGetDarwinNotifyCenter() key:v12 callback:onSOSNotification info:0 suspensionBehavior:1];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v9);
  }

  v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    uint64_t v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v23 = v16;
    __int16 v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, start monitoring SOS darwin notifications", buf, 0x16u);
  }
  if (v6) {
    v6[2](v6, 0);
  }
}

- (void)stopMonitoringWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SMTriggerSOS *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SMTriggerSOS_stopMonitoringWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __42__SMTriggerSOS_stopMonitoringWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopMonitoringWithHandler:*(void *)(a1 + 40)];
}

- (void)_stopMonitoringWithHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void))a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(SMTriggerSOS *)self SOSNotifications];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        uint64_t v12 = [(SMTriggerSOS *)self darwinSOSNotificationHelper];
        [v12 removeObserver:self center:CFNotificationCenterGetDarwinNotifyCenter() key:v11 info:0];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v8);
  }

  id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v22 = v15;
    __int16 v23 = 2112;
    __int16 v24 = v16;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, %@, stop monitoring for SOS darwin notifications", buf, 0x16u);
  }
  if (v5) {
    v5[2](v5, 0);
  }
}

- (void)onRemoteEmergencyContactsNotified:(unint64_t)a3
{
  v5 = [(SMTriggerSOS *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SMTriggerSOS_onRemoteEmergencyContactsNotified___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __50__SMTriggerSOS_onRemoteEmergencyContactsNotified___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifySOSTriggerWithCategory:*(void *)(a1 + 40)];
}

- (void)handleSOSNotificationForReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v15 = v8;
    __int16 v16 = 2112;
    long long v17 = v9;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, handling SOS trigger notification for reason %@", buf, 0x20u);
  }
  uint64_t v10 = [(SMTriggerSOS *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__SMTriggerSOS_handleSOSNotificationForReason___block_invoke;
  v12[3] = &unk_1E6B90BF0;
  v12[4] = self;
  id v13 = v5;
  id v11 = v5;
  dispatch_async(v10, v12);
}

uint64_t __47__SMTriggerSOS_handleSOSNotificationForReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSOSNotificationForReason:*(void *)(a1 + 40)];
}

- (void)_handleSOSNotificationForReason:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [(SMTriggerSOS *)self SOSNotifications];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([v4 isEqualToString:*(void *)(*((void *)&v21 + 1) + 8 * i)])
        {
          uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
          id v11 = [(SMTriggerSOS *)self sosEvents];
          [v11 setObject:v10 forKeyedSubscript:v4];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [NSString stringWithUTF8String:*MEMORY[0x1E4F97BA0]];
  char v13 = [v4 isEqualToString:v12];

  if (v13)
  {
    uint64_t v14 = 11;
  }
  else
  {
    v15 = [NSString stringWithUTF8String:*MEMORY[0x1E4F97BB0]];
    char v16 = [v4 isEqualToString:v15];

    if (v16)
    {
      uint64_t v14 = 13;
    }
    else
    {
      long long v17 = [NSString stringWithUTF8String:*MEMORY[0x1E4F97BA8]];
      char v18 = [v4 isEqualToString:v17];

      if (v18)
      {
        uint64_t v14 = 12;
      }
      else
      {
        id v19 = [NSString stringWithUTF8String:*MEMORY[0x1E4F97B98]];
        int v20 = [v4 isEqualToString:v19];

        if (v20) {
          uint64_t v14 = 10;
        }
        else {
          uint64_t v14 = 14;
        }
      }
    }
  }
  [(SMTriggerSOS *)self _notifySOSTriggerWithCategory:v14];
}

- (void)_notifySOSTriggerWithCategory:(unint64_t)a3
{
  id v5 = [SMTriggerNotification alloc];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [(SMTriggerNotification *)v5 initWithTriggerCategory:a3 SOSState:2 triggerName:@"SMTriggerSOS" date:v6 details:MEMORY[0x1E4F1CC08]];

  uint64_t v7 = [(SMTriggerSOS *)self sessionMonitorDelegate];
  [v7 onTriggerNotification:v8];
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

- (NSMutableDictionary)sosEvents
{
  return self->_sosEvents;
}

- (void)setSosEvents:(id)a3
{
}

- (NSArray)SOSNotifications
{
  return self->_SOSNotifications;
}

- (void)setSOSNotifications:(id)a3
{
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
}

- (RTDarwinNotificationHelper)darwinSOSNotificationHelper
{
  return self->_darwinSOSNotificationHelper;
}

- (void)setDarwinSOSNotificationHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinSOSNotificationHelper, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_SOSNotifications, 0);
  objc_storeStrong((id *)&self->_sosEvents, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->sessionMonitorDelegate);
}

@end