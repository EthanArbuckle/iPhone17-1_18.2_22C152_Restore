@interface FCOfflineModeMonitor
- (BOOL)isCloudKitReachable;
- (BOOL)isLowDataModeEnabled;
- (BOOL)isNetworkReachable;
- (BOOL)isNetworkReachableViaWiFi;
- (BOOL)isNetworkUsageInexpensive;
- (FCNetworkReachability)networkReachability;
- (FCNetworkTransitionMonitor)offlineTransitionMonitor;
- (FCNetworkTransitionMonitor)onlineTransitionMonitor;
- (FCOfflineModeMonitor)initWithAppActivationMonitor:(id)a3 configurationManager:(id)a4 networkBehaviorMonitor:(id)a5;
- (FCOfflineModeMonitor)initWithNetworkReachability:(id)a3 onlineTransitionMonitor:(id)a4 offlineTransitionMonitor:(id)a5;
- (FCOperationCanceling)offlineTransitionOperation;
- (FCOperationCanceling)onlineTransitionOperation;
- (NFStateMachine)stateMachine;
- (NSHashTable)observers;
- (int64_t)cellularRadioAccessTechnology;
- (int64_t)offlineReason;
- (void)_notifyNetworkReachabilityConnectivityDidChange;
- (void)_notifyNetworkReachabilityDidChange;
- (void)_transitionToOfflineReason:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)networkReachabilityDidChange:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setOfflineReason:(int64_t)a3;
- (void)setOfflineTransitionOperation:(id)a3;
- (void)setOnlineTransitionOperation:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)wifiReachabilityDidChange:(id)a3;
@end

@implementation FCOfflineModeMonitor

void __36__FCOfflineModeMonitor_addObserver___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__FCOfflineModeMonitor_addObserver___block_invoke_2;
    v6[3] = &unk_1E5B4BE70;
    v6[4] = self;
    id v7 = v4;
    FCPerformBlockOnMainThread(v6);
  }
}

- (FCOfflineModeMonitor)initWithAppActivationMonitor:(id)a3 configurationManager:(id)a4 networkBehaviorMonitor:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "appActivationMonitor");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCOfflineModeMonitor initWithAppActivationMonitor:configurationManager:networkBehaviorMonitor:]";
    __int16 v22 = 2080;
    v23 = "FCOfflineModeMonitor.m";
    __int16 v24 = 1024;
    int v25 = 69;
    __int16 v26 = 2114;
    v27 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "networkBehaviorMonitor");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCOfflineModeMonitor initWithAppActivationMonitor:configurationManager:networkBehaviorMonitor:]";
    __int16 v22 = 2080;
    v23 = "FCOfflineModeMonitor.m";
    __int16 v24 = 1024;
    int v25 = 70;
    __int16 v26 = 2114;
    v27 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  unint64_t v11 = FCCurrentContextEnvironment();
  v12 = FCOfflineModePingHostName(v11);
  v13 = [[FCPingBasedOnlineNetworkTransitionMonitor alloc] initWithConfigurationManager:v9 hostName:v12 port:443];
  v14 = [[FCTelemetryBasedOfflineNetworkTransitionMonitor alloc] initWithAppActivationMonitor:v8 configurationManager:v9 networkBehaviorMonitor:v10 onlineTransitionMonitor:v13];
  v15 = +[FCNetworkReachability sharedNetworkReachability];
  v16 = [(FCOfflineModeMonitor *)self initWithNetworkReachability:v15 onlineTransitionMonitor:v13 offlineTransitionMonitor:v14];

  return v16;
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "entering online state", buf, 2u);
  }
  id v8 = [v6 offlineTransitionOperation];

  if (v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"expected nil value for '%s'", "owner.offlineTransitionOperation");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    __int16 v17 = 2080;
    v18 = "FCOfflineModeMonitor.m";
    __int16 v19 = 1024;
    int v20 = 135;
    __int16 v21 = 2114;
    __int16 v22 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_60;
  v13[3] = &unk_1E5B4C018;
  id v14 = v5;
  id v10 = v5;
  unint64_t v11 = [v9 notifyWhenTransitionOccursOnQueue:MEMORY[0x1E4F14428] withBlock:v13];
  [v6 setOfflineTransitionOperation:v11];
}

- (void)setOfflineTransitionOperation:(id)a3
{
}

- (FCOperationCanceling)offlineTransitionOperation
{
  return self->_offlineTransitionOperation;
}

uint64_t __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _transitionToOfflineReason:0];
  v1 = (void *)MEMORY[0x1E4F81BF0];
  return [v1 asVoid];
}

- (void)_transitionToOfflineReason:(int64_t)a3
{
  int64_t v5 = [(FCOfflineModeMonitor *)self offlineReason];
  if (v5 != a3)
  {
    int64_t v6 = v5;
    [(FCOfflineModeMonitor *)self setOfflineReason:a3];
    [(FCOfflineModeMonitor *)self _notifyNetworkReachabilityDidChange];
    if (!a3 || !v6)
    {
      [(FCOfflineModeMonitor *)self _notifyNetworkReachabilityConnectivityDidChange];
    }
  }
}

- (BOOL)isLowDataModeEnabled
{
  id v2 = [(FCOfflineModeMonitor *)self networkReachability];
  char v3 = [v2 isLowDataModeEnabled];

  return v3;
}

- (BOOL)isCloudKitReachable
{
  if ([(FCOfflineModeMonitor *)self offlineReason]) {
    return 0;
  }
  id v4 = [(FCOfflineModeMonitor *)self networkReachability];
  char v5 = [v4 isCloudKitAccessAllowed];

  return v5;
}

- (FCNetworkReachability)networkReachability
{
  return self->_networkReachability;
}

- (BOOL)isNetworkReachable
{
  return [(FCOfflineModeMonitor *)self offlineReason] == 0;
}

- (int64_t)offlineReason
{
  return self->_offlineReason;
}

- (FCOfflineModeMonitor)initWithNetworkReachability:(id)a3 onlineTransitionMonitor:(id)a4 offlineTransitionMonitor:(id)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v51 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "networkReachability");
    *(_DWORD *)buf = 136315906;
    v75 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]";
    __int16 v76 = 2080;
    v77 = "FCOfflineModeMonitor.m";
    __int16 v78 = 1024;
    int v79 = 97;
    __int16 v80 = 2114;
    v81 = v51;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v52 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "onlineTransitionMonitor");
    *(_DWORD *)buf = 136315906;
    v75 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]";
    __int16 v76 = 2080;
    v77 = "FCOfflineModeMonitor.m";
    __int16 v78 = 1024;
    int v79 = 98;
    __int16 v80 = 2114;
    v81 = v52;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v53 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "offlineTransitionMonitor");
    *(_DWORD *)buf = 136315906;
    v75 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]";
    __int16 v76 = 2080;
    v77 = "FCOfflineModeMonitor.m";
    __int16 v78 = 1024;
    int v79 = 99;
    __int16 v80 = 2114;
    v81 = v53;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v73.receiver = self;
  v73.super_class = (Class)FCOfflineModeMonitor;
  v12 = [(FCOfflineModeMonitor *)&v73 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v13;

    objc_storeStrong((id *)&v12->_networkReachability, a3);
    [v9 addObserver:v12];
    objc_storeStrong((id *)&v12->_onlineTransitionMonitor, a4);
    objc_storeStrong((id *)&v12->_offlineTransitionMonitor, a5);
    v62 = (void *)[objc_alloc(MEMORY[0x1E4F81C10]) initWithName:@"initial"];
    v61 = (void *)[objc_alloc(MEMORY[0x1E4F81C10]) initWithName:@"inactiveOffline"];
    v15 = [v61 onWillEnter:&__block_literal_global_27];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_48;
    v71[3] = &unk_1E5B4F590;
    v16 = v12;
    v72 = v16;
    __int16 v17 = [v15 onDidEnter:v71];
    id v18 = (id)[v17 onWillExit:&__block_literal_global_58_1];

    __int16 v19 = (void *)[objc_alloc(MEMORY[0x1E4F81C10]) initWithName:@"online"];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_59;
    v69[3] = &unk_1E5B4F5B8;
    id v59 = v11;
    id v70 = v11;
    int v20 = [v19 onWillEnter:v69];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_2;
    v67[3] = &unk_1E5B4F590;
    __int16 v21 = v16;
    v68 = v21;
    __int16 v22 = [v20 onDidEnter:v67];
    id v23 = (id)[v22 onWillExit:&__block_literal_global_63];

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F81C10]) initWithName:@"activeOffline"];
    int v25 = v10;
    __int16 v26 = (void *)v24;
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_65;
    v65[3] = &unk_1E5B4F5B8;
    v60 = v25;
    id v66 = v25;
    v27 = [v26 onWillEnter:v65];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_2_67;
    v63[3] = &unk_1E5B4F590;
    v58 = v21;
    v64 = v58;
    uint64_t v28 = [v27 onDidEnter:v63];
    id v29 = (id)[v28 onWillExit:&__block_literal_global_70];

    uint64_t v30 = [v9 offlineReason];
    if (v30)
    {
      uint64_t v31 = v30;
      v32 = v61;
      id v33 = v61;
      v57 = [NSNumber numberWithInteger:v31];
    }
    else
    {
      id v33 = v19;
      v57 = 0;
      v32 = v61;
    }
    v56 = v33;
    id v34 = objc_alloc(MEMORY[0x1E4F81C08]);
    v35 = [MEMORY[0x1E4F1CAD0] setWithObject:v62];
    v55 = (void *)[v34 initWithName:@"transitionToFirstState" transitionFromStates:v35 toState:v33];

    id v36 = objc_alloc(MEMORY[0x1E4F81C08]);
    v37 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v19, v26, 0);
    v38 = v32;
    v54 = (void *)[v36 initWithName:@"reachabilityWentOffline" transitionFromStates:v37 toState:v32];

    id v39 = objc_alloc(MEMORY[0x1E4F81C08]);
    v40 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v32, 0);
    v41 = (void *)[v39 initWithName:@"reachabilityCameOnline" transitionFromStates:v40 toState:v26];

    id v42 = objc_alloc(MEMORY[0x1E4F81C08]);
    v43 = [MEMORY[0x1E4F1CAD0] setWithObject:v26];
    v44 = (void *)[v42 initWithName:@"onlineTransitionDetected" transitionFromStates:v43 toState:v19];

    id v45 = objc_alloc(MEMORY[0x1E4F81C08]);
    v46 = [MEMORY[0x1E4F1CAD0] setWithObject:v19];
    v47 = (void *)[v45 initWithName:@"offlineTransitionDetected" transitionFromStates:v46 toState:v26];

    v48 = (void *)[objc_alloc(MEMORY[0x1E4F81C00]) initWithState:v62 withOwner:v58];
    [v48 addState:v38];
    [v48 addState:v19];
    [v48 addState:v26];
    [v48 addEvent:v55];
    [v48 addEvent:v54];
    [v48 addEvent:v41];
    [v48 addEvent:v44];
    [v48 addEvent:v47];
    [v48 activate];
    objc_storeStrong(v58 + 3, v48);
    id v49 = (id)[v48 fireEventWithName:@"transitionToFirstState" withContext:v57];

    id v10 = v60;
    id v11 = v59;
  }

  return v12;
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  int64_t v6 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "entering inactive offline", buf, 2u);
  }
  id v7 = [v5 offlineTransitionOperation];

  if (v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"expected nil value for '%s'", "owner.offlineTransitionOperation");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    __int16 v13 = 2080;
    id v14 = "FCOfflineModeMonitor.m";
    __int16 v15 = 1024;
    int v16 = 116;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v8 = [v5 onlineTransitionOperation];

  if (v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"expected nil value for '%s'", "owner.onlineTransitionOperation");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    __int16 v13 = 2080;
    id v14 = "FCOfflineModeMonitor.m";
    __int16 v15 = 1024;
    int v16 = 117;
    __int16 v17 = 2114;
    id v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

id __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_48(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [a2 context];
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "context");
    *(_DWORD *)buf = 136315906;
    id v10 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    __int16 v11 = 2080;
    v12 = "FCOfflineModeMonitor.m";
    __int16 v13 = 1024;
    int v14 = 121;
    __int16 v15 = 2114;
    int v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v4 = (objc_class *)objc_opt_class();
  id v5 = FCCheckedDynamicCast(v4, (uint64_t)v3);
  objc_msgSend(*(id *)(a1 + 32), "_transitionToOfflineReason:", objc_msgSend(v5, "integerValue"));
  int64_t v6 = [MEMORY[0x1E4F81BF0] asVoid];

  return v6;
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_56()
{
  v0 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A460D000, v0, OS_LOG_TYPE_DEFAULT, "exiting inactive offline", v1, 2u);
  }
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_60(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMachine];
  id v1 = (id)[v2 fireEventWithName:@"offlineTransitionDetected" withContext:0];
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  int64_t v6 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "exiting online state", buf, 2u);
  }
  id v7 = [v5 offlineTransitionOperation];
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "offlineTransitionOperation");
    *(_DWORD *)buf = 136315906;
    id v10 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    __int16 v11 = 2080;
    v12 = "FCOfflineModeMonitor.m";
    __int16 v13 = 1024;
    int v14 = 145;
    __int16 v15 = 2114;
    int v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  [v7 cancel];
  [v5 setOfflineTransitionOperation:0];
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "entering active offline state", buf, 2u);
  }
  id v8 = [v6 onlineTransitionOperation];

  if (v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"expected nil value for '%s'", "owner.onlineTransitionOperation");
    *(_DWORD *)buf = 136315906;
    int v16 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    __int16 v17 = 2080;
    id v18 = "FCOfflineModeMonitor.m";
    __int16 v19 = 1024;
    int v20 = 154;
    __int16 v21 = 2114;
    __int16 v22 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_66;
  v13[3] = &unk_1E5B4C018;
  id v14 = v5;
  id v10 = v5;
  __int16 v11 = [v9 notifyWhenTransitionOccursOnQueue:MEMORY[0x1E4F14428] withBlock:v13];
  [v6 setOnlineTransitionOperation:v11];
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_66(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMachine];
  id v1 = (id)[v2 fireEventWithName:@"onlineTransitionDetected" withContext:0];
}

uint64_t __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_2_67(uint64_t a1)
{
  [*(id *)(a1 + 32) _transitionToOfflineReason:2];
  id v1 = (void *)MEMORY[0x1E4F81BF0];
  return [v1 asVoid];
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_3_68(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "leaving active offline state", buf, 2u);
  }
  id v7 = [v5 onlineTransitionOperation];
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "onlineTransitionOperation");
    *(_DWORD *)buf = 136315906;
    id v10 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    __int16 v11 = 2080;
    v12 = "FCOfflineModeMonitor.m";
    __int16 v13 = 1024;
    int v14 = 164;
    __int16 v15 = 2114;
    int v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  [v7 cancel];
  [v5 setOnlineTransitionOperation:0];
}

- (BOOL)isNetworkUsageInexpensive
{
  id v2 = [(FCOfflineModeMonitor *)self networkReachability];
  char v3 = [v2 isNetworkUsageExpensive];

  return v3;
}

- (BOOL)isNetworkReachableViaWiFi
{
  BOOL v3 = [(FCOfflineModeMonitor *)self isNetworkReachable];
  if (v3)
  {
    id v4 = [(FCOfflineModeMonitor *)self networkReachability];
    char v5 = [v4 isNetworkReachableViaWiFi];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (int64_t)cellularRadioAccessTechnology
{
  id v2 = [(FCOfflineModeMonitor *)self networkReachability];
  int64_t v3 = [v2 cellularRadioAccessTechnology];

  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__FCOfflineModeMonitor_removeObserver___block_invoke_2;
    v6[3] = &unk_1E5B4BE70;
    v6[4] = self;
    id v7 = v4;
    FCPerformBlockOnMainThread(v6);
  }
}

void __39__FCOfflineModeMonitor_removeObserver___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) observers];
  char v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    char v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p is not an observer", *(void *)(a1 + 40));
    *(_DWORD *)buf = 136315906;
    id v7 = "-[FCOfflineModeMonitor removeObserver:]_block_invoke_2";
    __int16 v8 = 2080;
    id v9 = "FCOfflineModeMonitor.m";
    __int16 v10 = 1024;
    int v11 = 270;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v4 = [*(id *)(a1 + 32) observers];
  [v4 removeObject:*(void *)(a1 + 40)];
}

- (void)networkReachabilityDidChange:(id)a3
{
  uint64_t v4 = [a3 offlineReason];
  if (v4)
  {
    id v8 = [NSNumber numberWithInteger:v4];
    char v5 = @"reachabilityWentOffline";
  }
  else
  {
    id v8 = 0;
    char v5 = @"reachabilityCameOnline";
  }
  id v6 = [(FCOfflineModeMonitor *)self stateMachine];
  id v7 = (id)[v6 fireEventWithName:v5 withContext:v8];
}

- (void)wifiReachabilityDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(FCOfflineModeMonitor *)self observers];
  char v5 = (void *)[v4 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "wifiReachabilityDidChange:", self, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_notifyNetworkReachabilityDidChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v3 = [(FCOfflineModeMonitor *)self observers];
  uint64_t v4 = (void *)[v3 copy];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "networkReachabilityDidChange:", self, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyNetworkReachabilityConnectivityDidChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v3 = [(FCOfflineModeMonitor *)self observers];
  uint64_t v4 = (void *)[v3 copy];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "networkReachabilityConnectivityDidChange:", self, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setOfflineReason:(int64_t)a3
{
  self->_offlineReason = a3;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (FCNetworkTransitionMonitor)onlineTransitionMonitor
{
  return self->_onlineTransitionMonitor;
}

- (FCNetworkTransitionMonitor)offlineTransitionMonitor
{
  return self->_offlineTransitionMonitor;
}

- (FCOperationCanceling)onlineTransitionOperation
{
  return self->_onlineTransitionOperation;
}

- (void)setOnlineTransitionOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onlineTransitionOperation, 0);
  objc_storeStrong((id *)&self->_offlineTransitionOperation, 0);
  objc_storeStrong((id *)&self->_offlineTransitionMonitor, 0);
  objc_storeStrong((id *)&self->_onlineTransitionMonitor, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

@end