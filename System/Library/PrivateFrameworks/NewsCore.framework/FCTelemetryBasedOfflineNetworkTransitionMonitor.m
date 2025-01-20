@interface FCTelemetryBasedOfflineNetworkTransitionMonitor
- (FCAppActivationMonitorType)appActivationMonitor;
- (FCMultiNetworkBehaviorMonitor)networkBehaviorMonitor;
- (FCNetworkTransitionMonitor)onlineTransitionMonitor;
- (FCNewsAppConfigurationManager)configurationManager;
- (FCTelemetryBasedOfflineNetworkTransitionMonitor)init;
- (FCTelemetryBasedOfflineNetworkTransitionMonitor)initWithAppActivationMonitor:(id)a3 configurationManager:(id)a4 networkBehaviorMonitor:(id)a5 onlineTransitionMonitor:(id)a6;
- (NFUnfairLock)dateOfLastTransitionLock;
- (NSDate)dateOfLastTransition;
- (id)notifyWhenTransitionOccursOnQueue:(id)a3 withBlock:(id)a4;
- (void)setDateOfLastTransition:(id)a3;
@end

@implementation FCTelemetryBasedOfflineNetworkTransitionMonitor

- (FCTelemetryBasedOfflineNetworkTransitionMonitor)initWithAppActivationMonitor:(id)a3 configurationManager:(id)a4 networkBehaviorMonitor:(id)a5 onlineTransitionMonitor:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "appActivationMonitor");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCTelemetryBasedOfflineNetworkTransitionMonitor initWithAppActivationMonitor:configurationManager:networkBeh"
          "aviorMonitor:onlineTransitionMonitor:]";
    __int16 v27 = 2080;
    v28 = "FCTelemetryBasedOfflineNetworkTransitionMonitor.m";
    __int16 v29 = 1024;
    int v30 = 41;
    __int16 v31 = 2114;
    v32 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12) {
      goto LABEL_6;
    }
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "configurationManager");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCTelemetryBasedOfflineNetworkTransitionMonitor initWithAppActivationMonitor:configurationManager:networkBeh"
          "aviorMonitor:onlineTransitionMonitor:]";
    __int16 v27 = 2080;
    v28 = "FCTelemetryBasedOfflineNetworkTransitionMonitor.m";
    __int16 v29 = 1024;
    int v30 = 42;
    __int16 v31 = 2114;
    v32 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "networkBehaviorMonitor");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCTelemetryBasedOfflineNetworkTransitionMonitor initWithAppActivationMonitor:configurationManager:networkBeh"
          "aviorMonitor:onlineTransitionMonitor:]";
    __int16 v27 = 2080;
    v28 = "FCTelemetryBasedOfflineNetworkTransitionMonitor.m";
    __int16 v29 = 1024;
    int v30 = 43;
    __int16 v31 = 2114;
    v32 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v14) {
      goto LABEL_11;
    }
  }
  else if (v14)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "onlineTransitionMonitor");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCTelemetryBasedOfflineNetworkTransitionMonitor initWithAppActivationMonitor:configurationManager:networkBeh"
          "aviorMonitor:onlineTransitionMonitor:]";
    __int16 v27 = 2080;
    v28 = "FCTelemetryBasedOfflineNetworkTransitionMonitor.m";
    __int16 v29 = 1024;
    int v30 = 44;
    __int16 v31 = 2114;
    v32 = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_11:
  v24.receiver = self;
  v24.super_class = (Class)FCTelemetryBasedOfflineNetworkTransitionMonitor;
  v15 = [(FCTelemetryBasedOfflineNetworkTransitionMonitor *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appActivationMonitor, a3);
    objc_storeStrong((id *)&v16->_configurationManager, a4);
    objc_storeStrong((id *)&v16->_networkBehaviorMonitor, a5);
    objc_storeStrong((id *)&v16->_onlineTransitionMonitor, a6);
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    dateOfLastTransitionLock = v16->_dateOfLastTransitionLock;
    v16->_dateOfLastTransitionLock = (NFUnfairLock *)v17;
  }
  return v16;
}

- (id)notifyWhenTransitionOccursOnQueue:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FCTelemetryBasedOfflineNetworkTransitionMonitor *)self configurationManager];
  v9 = [v8 possiblyUnfetchedAppConfiguration];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = [v9 offlineModeDetectionIgnoredHosts];
  id v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = MEMORY[0x1E4F1CBF0];
  }
  id v14 = [v10 setWithArray:v13];

  v15 = [FCTelemetryBasedOfflineNetworkTransitionOperation alloc];
  v16 = [(FCTelemetryBasedOfflineNetworkTransitionMonitor *)self appActivationMonitor];
  uint64_t v17 = [(FCTelemetryBasedOfflineNetworkTransitionMonitor *)self networkBehaviorMonitor];
  v18 = [(FCTelemetryBasedOfflineNetworkTransitionOperation *)v15 initWithAppActivationMonitor:v16 ignoredHosts:v14 networkBehaviorMonitor:v17];

  v19 = [(FCTelemetryBasedOfflineNetworkTransitionMonitor *)self onlineTransitionMonitor];
  v20 = [v19 dateOfLastTransition];
  [(FCTelemetryBasedOfflineNetworkTransitionOperation *)v18 setDateOfLastSuccess:v20];

  [v9 offlineModeMinimumSecondsSinceSuccessToOffline];
  -[FCTelemetryBasedOfflineNetworkTransitionOperation setMinimumSecondsSinceSuccessToOffline:](v18, "setMinimumSecondsSinceSuccessToOffline:");
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __95__FCTelemetryBasedOfflineNetworkTransitionMonitor_notifyWhenTransitionOccursOnQueue_withBlock___block_invoke;
  v24[3] = &unk_1E5B4EFB8;
  v26 = self;
  id v27 = v7;
  id v25 = v6;
  id v21 = v7;
  id v22 = v6;
  [(FCTelemetryBasedOfflineNetworkTransitionOperation *)v18 setTransitionBlock:v24];
  [(FCOperation *)v18 start];

  return v18;
}

- (FCNetworkTransitionMonitor)onlineTransitionMonitor
{
  return self->_onlineTransitionMonitor;
}

- (FCMultiNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (FCNewsAppConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (FCAppActivationMonitorType)appActivationMonitor
{
  return self->_appActivationMonitor;
}

- (FCTelemetryBasedOfflineNetworkTransitionMonitor)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTelemetryBasedOfflineNetworkTransitionMonitor init]";
    __int16 v9 = 2080;
    v10 = "FCTelemetryBasedOfflineNetworkTransitionMonitor.m";
    __int16 v11 = 1024;
    int v12 = 33;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTelemetryBasedOfflineNetworkTransitionMonitor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

void __95__FCTelemetryBasedOfflineNetworkTransitionMonitor_notifyWhenTransitionOccursOnQueue_withBlock___block_invoke(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 48));
  v2 = [*(id *)(a1 + 40) dateOfLastTransitionLock];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __95__FCTelemetryBasedOfflineNetworkTransitionMonitor_notifyWhenTransitionOccursOnQueue_withBlock___block_invoke_2;
  v3[3] = &unk_1E5B4C018;
  v3[4] = *(void *)(a1 + 40);
  [v2 performWithLockSync:v3];
}

void __95__FCTelemetryBasedOfflineNetworkTransitionMonitor_notifyWhenTransitionOccursOnQueue_withBlock___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = [*(id *)(a1 + 32) dateOfLastTransition];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = objc_msgSend(v2, "fc_laterDateAllowingNilWithDate:andDate:", v5, v3);
  [*(id *)(a1 + 32) setDateOfLastTransition:v4];
}

- (NSDate)dateOfLastTransition
{
  return self->_dateOfLastTransition;
}

- (void)setDateOfLastTransition:(id)a3
{
}

- (NFUnfairLock)dateOfLastTransitionLock
{
  return self->_dateOfLastTransitionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastTransitionLock, 0);
  objc_storeStrong((id *)&self->_onlineTransitionMonitor, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_appActivationMonitor, 0);
  objc_storeStrong((id *)&self->_dateOfLastTransition, 0);
}

@end