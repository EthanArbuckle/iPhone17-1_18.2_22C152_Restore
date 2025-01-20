@interface W5DiagnosticsModeManager
- (BOOL)_isFaultSupported:(int64_t)a3;
- (BOOL)_shouldShowNotification:(int64_t)a3;
- (BOOL)registerPeer:(id)a3 role:(int64_t)a4 configuration:(id)a5 error:(id *)a6;
- (BOOL)unregisterPeer:(id)a3 role:(int64_t)a4 error:(id *)a5;
- (NSArray)activeDiagnostics;
- (NSArray)allDiagnostics;
- (NSArray)registeredPeers;
- (NSMutableArray)processors;
- (NSMutableDictionary)lastNotificationTimestamp;
- (NSUUID)stopNotificationUUID;
- (W5DiagnosticsModeLocalStore)localStore;
- (W5DiagnosticsModeManager)initWithNetUsageManager:(id)a3 peerManager:(id)a4 userNotificationManager:(id)a5 snifferManager:(id)a6 statusManager:(id)a7 logManager:(id)a8;
- (W5DiagnosticsModePeer)controller;
- (W5DiagnosticsModeStore)store;
- (W5FaultEventManager)faultEventManager;
- (W5LogManager)logManager;
- (W5NetUsageManager)netUsageManager;
- (W5Peer)localPeer;
- (W5PeerManager)peerManager;
- (W5WiFiSniffManager)snifferManager;
- (id)_actionHandler;
- (id)finishedDiagnostics;
- (int64_t)registeredRoleForPeer:(id)a3;
- (int64_t)role;
- (int64_t)state;
- (void)__collectNetUsageFiles:(id)a3 uuid:(id)a4;
- (void)__waitForLogRequestToComplete:(id)a3 maxWait:(unint64_t)a4;
- (void)__writeDiagnosticModeToFile:(id)a3 file:(id)a4;
- (void)__writePeerStatusToFile:(id)a3;
- (void)_archiveAndCollectLogs:(id)a3 logCollectionPath:(id)a4 outputDirectory:(id)a5 maxWait:(unint64_t)a6;
- (void)_collectAnalyticsCSVsForDiagnosticMode:(id)a3;
- (void)_collectNetworkInfoForDiagnosticMode:(id)a3;
- (void)_collectSystemLogsForDiagnosticMode:(id)a3;
- (void)_finishedProcessingDiagnosticMode:(id)a3;
- (void)_notifyPeers:(id)a3 info:(id)a4;
- (void)_queryDebugConfigurationForPeer:(id)a3 reply:(id)a4;
- (void)_runDiagnosticsForDiagnosticMode:(id)a3;
- (void)_showSuggestedStartNotificationForEvent:(id)a3;
- (void)_showSuggestedStopNotificationForEvent:(id)a3;
- (void)_startDiagnosticsModeWithConfiguration:(id)a3 currentPeer:(id)a4 reply:(id)a5;
- (void)_stopDiagnosticsMode:(id)a3 currentPeer:(id)a4 info:(id)a5 reply:(id)a6;
- (void)_storeSnifferInfo:(id)a3 peer:(id)a4 uuid:(id)a5 path:(id)a6;
- (void)_updateDiagnosticsMode:(id)a3 incomingMode:(id)a4 currentPeer:(id)a5 reply:(id)a6;
- (void)collectLogsDiagnosticMode:(id)a3 outputName:(id)a4 reply:(id)a5;
- (void)handlePeerFaultEvent:(id)a3;
- (void)setController:(id)a3;
- (void)setFaultEventManager:(id)a3;
- (void)setLastNotificationTimestamp:(id)a3;
- (void)setLocalPeer:(id)a3;
- (void)setLocalStore:(id)a3;
- (void)setLogManager:(id)a3;
- (void)setNetUsageManager:(id)a3;
- (void)setPeerManager:(id)a3;
- (void)setProcessors:(id)a3;
- (void)setRegisteredPeers:(id)a3;
- (void)setSnifferManager:(id)a3;
- (void)setStopNotificationUUID:(id)a3;
- (void)setStore:(id)a3;
- (void)startDiagnosticsModeWithConfiguration:(id)a3 reply:(id)a4;
- (void)stopDiagnosticsModeWithUUID:(id)a3 info:(id)a4 reply:(id)a5;
- (void)updateDiagnosticsMode:(id)a3 reply:(id)a4;
@end

@implementation W5DiagnosticsModeManager

- (W5DiagnosticsModeManager)initWithNetUsageManager:(id)a3 peerManager:(id)a4 userNotificationManager:(id)a5 snifferManager:(id)a6 statusManager:(id)a7 logManager:(id)a8
{
  id v31 = a3;
  id v15 = a4;
  id v30 = a5;
  id v16 = a6;
  id v29 = a7;
  id v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)W5DiagnosticsModeManager;
  v18 = [(W5DiagnosticsModeManager *)&v32 init];
  objc_storeStrong((id *)&v18->_netUsageManager, a3);
  if (v15
    && (objc_storeStrong((id *)&v18->_peerManager, a4), v16)
    && (objc_storeStrong((id *)&v18->_snifferManager, a6), v17))
  {
    objc_storeStrong((id *)&v18->_logManager, a8);
    objc_storeStrong((id *)&v18->_userNotificationManager, a5);
    objc_storeStrong((id *)&v18->_statusManager, a7);
    v19 = objc_alloc_init(W5DiagnosticsModeStore);
    store = v18->_store;
    v18->_store = v19;

    v21 = objc_alloc_init(W5DiagnosticsModeLocalStore);
    localStore = v18->_localStore;
    v18->_localStore = v21;

    uint64_t v23 = +[NSMutableArray array];
    processors = v18->_processors;
    v18->_processors = (NSMutableArray *)v23;

    uint64_t v25 = +[NSMutableDictionary dictionary];
    lastNotificationTimestamp = v18->_lastNotificationTimestamp;
    v18->_lastNotificationTimestamp = (NSMutableDictionary *)v25;

    faultEventManager = v18->_faultEventManager;
    v18->_faultEventManager = 0;
  }
  else
  {
    faultEventManager = v18;
    v18 = 0;
  }

  return v18;
}

- (void)startDiagnosticsModeWithConfiguration:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = sub_10009756C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315906;
    uint64_t v23 = "-[W5DiagnosticsModeManager startDiagnosticsModeWithConfiguration:reply:]";
    __int16 v24 = 2080;
    uint64_t v25 = "W5DiagnosticsModeManager.m";
    __int16 v26 = 1024;
    int v27 = 148;
    __int16 v28 = 2114;
    id v29 = v6;
    _os_log_send_and_compose_impl();
  }

  v9 = [v6 objectForKeyedSubscript:@"Peers"];
  if (v9)
  {
    v10 = [(W5DiagnosticsModeManager *)self localPeer];
    v11 = [v10 peerID];
    v12 = sub_100090E50(v9, v11);

    if (v12)
    {
      [(W5DiagnosticsModeManager *)self _startDiagnosticsModeWithConfiguration:v6 currentPeer:v12 reply:v7];
    }
    else
    {
      id v15 = sub_10009756C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315906;
        uint64_t v23 = "-[W5DiagnosticsModeManager startDiagnosticsModeWithConfiguration:reply:]";
        __int16 v24 = 2080;
        uint64_t v25 = "W5DiagnosticsModeManager.m";
        __int16 v26 = 1024;
        int v27 = 159;
        __int16 v28 = 2114;
        id v29 = v9;
        _os_log_send_and_compose_impl();
      }

      NSErrorUserInfoKey v18 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v19 = @"W5ParamErr";
      id v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v17 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v16];
      v7[2](v7, 0, v17);

      v12 = 0;
    }
  }
  else
  {
    v13 = sub_10009756C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315906;
      uint64_t v23 = "-[W5DiagnosticsModeManager startDiagnosticsModeWithConfiguration:reply:]";
      __int16 v24 = 2080;
      uint64_t v25 = "W5DiagnosticsModeManager.m";
      __int16 v26 = 1024;
      int v27 = 152;
      __int16 v28 = 2114;
      id v29 = v6;
      _os_log_send_and_compose_impl();
    }

    NSErrorUserInfoKey v20 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v21 = @"W5ParamErr";
    v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v14 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v12];
    v7[2](v7, 0, v14);
  }
}

- (void)_startDiagnosticsModeWithConfiguration:(id)a3 currentPeer:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_10009756C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int16 v24 = 136315394;
    *(void *)&v24[4] = "-[W5DiagnosticsModeManager _startDiagnosticsModeWithConfiguration:currentPeer:reply:]";
    *(_WORD *)&v24[12] = 2114;
    *(void *)&v24[14] = v8;
    _os_log_send_and_compose_impl();
  }

  v12 = [[W5DiagnosticsModeProcessor alloc] initWithCurrentPeer:v9];
  if (v12)
  {
    [(NSMutableArray *)self->_processors addObject:v12];
    *(void *)__int16 v24 = 0;
    *(void *)&v24[8] = v24;
    *(void *)&v24[16] = 0x3032000000;
    uint64_t v25 = sub_100002B54;
    __int16 v26 = sub_100002B64;
    v13 = (void *)os_transaction_create();
    v14 = +[W5ActivityManager sharedActivityManager];
    [v14 osTransactionCreate:"_startDiagnosticsModeWithConfiguration" transaction:v13];

    id v27 = v13;
    id v15 = [(W5DiagnosticsModeManager *)self _actionHandler];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100002B6C;
    v18[3] = &unk_1000DCFC0;
    id v22 = v10;
    id v19 = v9;
    NSErrorUserInfoKey v20 = self;
    CFStringRef v21 = v12;
    uint64_t v23 = v24;
    [(W5DiagnosticsModeProcessor *)v21 performStartOperationsWithConfiguration:v8 handler:v15 completion:v18];

    _Block_object_dispose(v24, 8);
  }
  else
  {
    NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v29 = @"W5InternalErr";
    id v16 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v17 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:9 userInfo:v16];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v17);
  }
}

- (void)stopDiagnosticsModeWithUUID:(id)a3 info:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  uint64_t v11 = [v9 objectForKeyedSubscript:@"Peer"];
  v12 = [(W5DiagnosticsModeManager *)self store];
  uint64_t v13 = [v12 diagnosticsModeMatchingUUID:v8];

  if (!(v13 | v11))
  {
    NSErrorUserInfoKey v20 = sub_10009756C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 136315394;
      v33 = "-[W5DiagnosticsModeManager stopDiagnosticsModeWithUUID:info:reply:]";
      __int16 v34 = 2114;
      id v35 = v8;
      _os_log_send_and_compose_impl();
    }

    NSErrorUserInfoKey v30 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v31 = @"W5ParamErr";
    id v17 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    CFStringRef v21 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v17];
    v10[2](v10, v21);

    goto LABEL_11;
  }
  if (v13)
  {
    v14 = [(id)v13 peers];
    id v15 = [(W5DiagnosticsModeManager *)self localPeer];
    id v16 = [v15 peerID];
    id v17 = sub_100090E50(v14, v16);

    id v18 = objc_alloc((Class)W5DiagnosticsModePeer);
    if (v17) {
      uint64_t v19 = (uint64_t)[v17 role];
    }
    else {
      uint64_t v19 = 8;
    }
    id v22 = [(W5DiagnosticsModeManager *)self localPeer];
    id v23 = [v18 initWithRole:v19 peer:v22];

    [(W5DiagnosticsModeManager *)self _stopDiagnosticsMode:v13 currentPeer:v23 info:v9 reply:v10];
LABEL_11:

    goto LABEL_12;
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000311C;
  v24[3] = &unk_1000DCFE8;
  id v25 = v8;
  __int16 v26 = self;
  id v27 = v9;
  CFStringRef v29 = v10;
  id v28 = (id)v11;
  [(W5DiagnosticsModeManager *)self _queryDebugConfigurationForPeer:v28 reply:v24];

LABEL_12:
}

- (void)_stopDiagnosticsMode:(id)a3 currentPeer:(id)a4 info:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = sub_10009756C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v27 = 136315394;
    *(void *)&v27[4] = "-[W5DiagnosticsModeManager _stopDiagnosticsMode:currentPeer:info:reply:]";
    *(_WORD *)&v27[12] = 2114;
    *(void *)&v27[14] = v10;
    _os_log_send_and_compose_impl();
  }

  id v15 = [[W5DiagnosticsModeProcessor alloc] initWithCurrentPeer:v11];
  if (v15)
  {
    [(NSMutableArray *)self->_processors addObject:v15];
    *(void *)id v27 = 0;
    *(void *)&v27[8] = v27;
    *(void *)&v27[16] = 0x3032000000;
    id v28 = sub_100002B54;
    CFStringRef v29 = sub_100002B64;
    id v16 = (void *)os_transaction_create();
    id v17 = +[W5ActivityManager sharedActivityManager];
    [v17 osTransactionCreate:"_stopDiagnosticsMode" transaction:v16];

    id v30 = v16;
    id v18 = [(W5DiagnosticsModeManager *)self _actionHandler];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000384C;
    v21[3] = &unk_1000DCFC0;
    id v25 = v13;
    id v22 = v11;
    id v23 = self;
    __int16 v24 = v15;
    __int16 v26 = v27;
    [(W5DiagnosticsModeProcessor *)v24 performStopOperationsForMode:v10 handler:v18 completion:v21];

    _Block_object_dispose(v27, 8);
  }
  else
  {
    NSErrorUserInfoKey v31 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v32 = @"W5InternalErr";
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    NSErrorUserInfoKey v20 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:9 userInfo:v19];
    (*((void (**)(id, void *))v13 + 2))(v13, v20);
  }
}

- (void)_queryDebugConfigurationForPeer:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [W5PeerDebugConfigurationRequest alloc];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003C04;
  v13[3] = &unk_1000DD010;
  id v9 = v6;
  id v14 = v9;
  id v10 = [(W5PeerDebugConfigurationRequest *)v8 initWithPeer:v7 type:1 debugConfiguration:0 reply:v13];

  uint64_t v11 = [(W5PeerManager *)self->_peerManager sendDebugConfigurationForPeerWithRequest:v10];
  id v12 = (void *)v11;
  if (v9 && v11) {
    (*((void (**)(id, void, uint64_t))v9 + 2))(v9, 0, v11);
  }
}

- (void)updateDiagnosticsMode:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = sub_10009756C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v56 = 136316162;
    v57 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
    __int16 v58 = 2080;
    v59 = "W5DiagnosticsModeManager.m";
    __int16 v60 = 1024;
    int v61 = 310;
    __int16 v62 = 2080;
    v63 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
    __int16 v64 = 2114;
    id v65 = v6;
    LODWORD(v44) = 48;
    v43 = &v56;
    _os_log_send_and_compose_impl();
  }

  if (v6)
  {
    id v9 = [v6 peers];
    id v10 = [(W5DiagnosticsModeManager *)self localPeer];
    uint64_t v11 = [v10 peerID];
    id v12 = sub_100090E50(v9, v11);

    if (!v12)
    {
      __int16 v34 = sub_10009756C();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = [v6 peers];
        int v56 = 136315906;
        v57 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
        __int16 v58 = 2080;
        v59 = "W5DiagnosticsModeManager.m";
        __int16 v60 = 1024;
        int v61 = 320;
        __int16 v62 = 2114;
        v63 = v35;
        _os_log_send_and_compose_impl();
      }
      NSErrorUserInfoKey v69 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v70 = @"W5ParamErr";
      id v22 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      id v23 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v22];
      v7[2](v7, v23);
      goto LABEL_36;
    }
    v46 = v7;
    v47 = v6;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v45 = self;
    id v13 = [(W5DiagnosticsModeManager *)self activeDiagnostics];
    id v14 = [v13 countByEnumeratingWithState:&v50 objects:v68 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v51;
LABEL_7:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v51 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v50 + 1) + 8 * v17);
        uint64_t v19 = [v18 peers:v43, v44];
        NSErrorUserInfoKey v20 = [v12 peer];
        CFStringRef v21 = [v20 peerID];
        id v22 = sub_100090E50(v19, v21);

        if (v22)
        {
          if (([v22 role] & 1) != 0 || (objc_msgSend(v22, "role") & 2) != 0) {
            break;
          }
        }

        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v50 objects:v68 count:16];
          if (v15) {
            goto LABEL_7;
          }
          goto LABEL_15;
        }
      }
      id v23 = v18;

      id v25 = [v23 uuid];
      id v6 = v47;
      __int16 v26 = [v47 uuid];
      unsigned __int8 v27 = [v25 isEqual:v26];

      if (v27) {
        goto LABEL_20;
      }
      v36 = sub_10009756C();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        int v56 = 136316418;
        v57 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
        __int16 v58 = 2080;
        v59 = "W5DiagnosticsModeManager.m";
        __int16 v60 = 1024;
        int v61 = 342;
        __int16 v62 = 2080;
        v63 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
        __int16 v64 = 2114;
        id v65 = v22;
        __int16 v66 = 2114;
        id v67 = v23;
        _os_log_send_and_compose_impl();
      }

      v37 = [v22 peer];
      v38 = [v37 name];
      v39 = [v22 peer];
      v40 = [v39 peerID];
      v41 = [v23 uuid];
      id v30 = +[NSString stringWithFormat:@"Device ('%@ - %@') is already in active diagnostics (UUID='%@')", v38, v40, v41];

      NSErrorUserInfoKey v54 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v55 = @"W5NotPermittedErr";
      CFStringRef v32 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      v42 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:5 userInfo:v32];
      v46[2](v46, v42);

      id v7 = v46;
      goto LABEL_35;
    }
LABEL_15:

    id v22 = 0;
    id v23 = 0;
    id v6 = v47;
LABEL_20:
    id v28 = [(W5DiagnosticsModeManager *)v45 store];
    CFStringRef v29 = [v6 uuid];
    id v30 = [v28 diagnosticsModeMatchingUUID:v29];

    if (v30)
    {
      id v31 = [v30 state];
      CFStringRef v32 = sub_10009756C();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (v31 == (id)10)
      {
        if (v33)
        {
          int v56 = 136315650;
          v57 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
          __int16 v58 = 2080;
          v59 = "W5DiagnosticsModeManager.m";
          __int16 v60 = 1024;
          int v61 = 351;
          _os_log_send_and_compose_impl();
        }
        id v7 = v46;
        goto LABEL_35;
      }
      if (v33)
      {
        int v56 = 136315906;
        v57 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
        __int16 v58 = 2080;
        v59 = "W5DiagnosticsModeManager.m";
        __int16 v60 = 1024;
        int v61 = 355;
        __int16 v62 = 2112;
        v63 = (const char *)v30;
        _os_log_send_and_compose_impl();
      }
    }
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100004578;
    v48[3] = &unk_1000DD038;
    id v7 = v46;
    v49 = v46;
    [(W5DiagnosticsModeManager *)v45 _updateDiagnosticsMode:v30 incomingMode:v6 currentPeer:v12 reply:v48];
    CFStringRef v32 = v49;
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }
  __int16 v24 = sub_10009756C();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v56 = 136315650;
    v57 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
    __int16 v58 = 2080;
    v59 = "W5DiagnosticsModeManager.m";
    __int16 v60 = 1024;
    int v61 = 312;
    _os_log_send_and_compose_impl();
  }

  NSErrorUserInfoKey v71 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v72 = @"W5ParamErr";
  id v12 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  id v22 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v12];
  v7[2](v7, v22);
LABEL_37:
}

- (void)_updateDiagnosticsMode:(id)a3 incomingMode:(id)a4 currentPeer:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_10009756C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v25 = 136315394;
    *(void *)&v25[4] = "-[W5DiagnosticsModeManager _updateDiagnosticsMode:incomingMode:currentPeer:reply:]";
    *(_WORD *)&v25[12] = 2114;
    *(void *)&v25[14] = v11;
    _os_log_send_and_compose_impl();
  }

  id v15 = [[W5DiagnosticsModeProcessor alloc] initWithCurrentPeer:v12];
  if (v15)
  {
    [(NSMutableArray *)self->_processors addObject:v15];
    *(void *)id v25 = 0;
    *(void *)&v25[8] = v25;
    *(void *)&v25[16] = 0x3032000000;
    __int16 v26 = sub_100002B54;
    unsigned __int8 v27 = sub_100002B64;
    uint64_t v16 = (void *)os_transaction_create();
    uint64_t v17 = +[W5ActivityManager sharedActivityManager];
    [v17 osTransactionCreate:"_updateDiagnosticsMode" transaction:v16];

    id v28 = v16;
    id v18 = [(W5DiagnosticsModeManager *)self _actionHandler];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000048A8;
    v21[3] = &unk_1000DD088;
    id v23 = v13;
    void v21[4] = self;
    id v22 = v15;
    __int16 v24 = v25;
    [(W5DiagnosticsModeProcessor *)v22 performUpdateOperationsForMode:v10 incomingMode:v11 handler:v18 completion:v21];

    _Block_object_dispose(v25, 8);
  }
  else
  {
    NSErrorUserInfoKey v29 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v30 = @"W5InternalErr";
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    NSErrorUserInfoKey v20 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:9 userInfo:v19];
    (*((void (**)(id, void *))v13 + 2))(v13, v20);
  }
}

- (id)_actionHandler
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004B9C;
  v5[3] = &unk_1000DD208;
  v5[4] = self;
  v2 = objc_retainBlock(v5);
  v3 = objc_retainBlock(v2);

  return v3;
}

- (void)_storeSnifferInfo:(id)a3 peer:(id)a4 uuid:(id)a5 path:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v12 info];
  [v14 setObject:v11 forKey:@"UUID"];

  id v15 = [v12 info];

  [v15 setObject:v10 forKey:@"path"];
  uint64_t v16 = [(W5DiagnosticsModeManager *)self localStore];
  v18[0] = @"UUID";
  v18[1] = @"path";
  v19[0] = v11;
  v19[1] = v10;
  uint64_t v17 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  [v16 addToStore:v13 newInfo:v17];
}

- (void)collectLogsDiagnosticMode:(id)a3 outputName:(id)a4 reply:(id)a5
{
  id v8 = (NSError *)a3;
  id v9 = a4;
  id v10 = (void (**)(id, NSError *, void, void *))a5;
  id v11 = sub_10009756C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v77 = 136315906;
    v78 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
    __int16 v79 = 2080;
    v80 = "W5DiagnosticsModeManager.m";
    __int16 v81 = 1024;
    int v82 = 805;
    __int16 v83 = 2112;
    v84 = v8;
    LODWORD(v71) = 38;
    NSErrorUserInfoKey v69 = &v77;
    _os_log_send_and_compose_impl();
  }

  id v12 = objc_alloc((Class)NSUUID);
  id v13 = [(NSError *)v8 objectForKey:@"DiagnosticsModeUUID"];
  id v14 = [v12 initWithUUIDString:v13];

  id v15 = [(W5DiagnosticsModeManager *)self store];
  uint64_t v16 = v15;
  if (v14)
  {
    uint64_t v17 = [v15 diagnosticsModeMatchingUUID:v14];
LABEL_7:
    uint64_t v19 = (NSError *)v17;
    goto LABEL_8;
  }
  id v18 = [v15 diagnosticsModeWithState:10];

  uint64_t v16 = [v18 sortedArrayUsingSelector:"compareCollectionTimeLatestFirst:"];

  if ([v16 count])
  {
    uint64_t v17 = [v16 firstObject];
    goto LABEL_7;
  }
  uint64_t v19 = 0;
LABEL_8:

  NSErrorUserInfoKey v20 = sub_10009756C();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      int v77 = 136315906;
      v78 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
      __int16 v79 = 2080;
      v80 = "W5DiagnosticsModeManager.m";
      __int16 v81 = 1024;
      int v82 = 830;
      __int16 v83 = 2114;
      v84 = v19;
      LODWORD(v71) = 38;
      NSErrorUserInfoKey v69 = &v77;
      _os_log_send_and_compose_impl();
    }

    id v22 = [(NSError *)v19 peers];
    id v23 = [(W5DiagnosticsModeManager *)self localPeer];
    __int16 v24 = [v23 peerID];
    id v25 = sub_100090E50(v22, v24);

    if (v25)
    {
      id v73 = v14;
      unsigned __int8 v26 = [v25 role];
      unsigned __int8 v27 = +[NSURL fileURLWithPath:@"/var/run/com.apple.wifivelocity"];
      id v75 = v9;
      id v28 = [v27 URLByAppendingPathComponent:v9];

      NSErrorUserInfoKey v29 = [(NSError *)v8 objectForKeyedSubscript:@"Compress"];
      unsigned int v30 = [v29 BOOLValue];

      HIDWORD(v71) = v30;
      if (v30)
      {
        uint64_t v31 = [(NSError *)v28 URLByDeletingPathExtension];

        id v28 = (NSError *)v31;
      }
      v74 = v8;
      CFStringRef v32 = +[NSFileManager defaultManager];
      BOOL v33 = [(NSError *)v28 path];
      [v32 createDirectoryAtPath:v33 withIntermediateDirectories:1 attributes:0 error:0];

      __int16 v34 = [(NSError *)v28 URLByAppendingPathComponent:@"status.txt"];
      [(W5DiagnosticsModeManager *)self __writePeerStatusToFile:v34];

      id v35 = [(NSError *)v28 URLByAppendingPathComponent:@"diagnostic_mode.txt"];
      [(W5DiagnosticsModeManager *)self __writeDiagnosticModeToFile:v19 file:v35];

      if ((v26 & 4) == 0 && self->_netUsageManager)
      {
        v36 = [(NSError *)v19 uuid];
        v37 = +[NSString stringWithFormat:@"DiagnosticsMode-%@-NetworkUsage", v36];
        v38 = [(NSError *)v28 URLByAppendingPathComponent:v37];

        v39 = [(NSError *)v19 uuid];
        [(W5DiagnosticsModeManager *)self __collectNetUsageFiles:v38 uuid:v39];
      }
      v40 = [(W5DiagnosticsModeManager *)self localStore];
      v41 = [v40 infoMatchingDiagnosticMode:v19];

      if (v41)
      {
        if ((v26 & 4) != 0)
        {
          v42 = sub_10009756C();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            int v77 = 136315650;
            v78 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
            __int16 v79 = 2080;
            v80 = "W5DiagnosticsModeManager.m";
            __int16 v81 = 1024;
            int v82 = 870;
            LODWORD(v72) = 28;
            CFStringRef v70 = &v77;
            _os_log_send_and_compose_impl();
          }

          v43 = [(NSError *)v41 objectForKey:@"path"];
          [(W5DiagnosticsModeManager *)self _archiveAndCollectLogs:0 logCollectionPath:v43 outputDirectory:v28 maxWait:0];
        }
        uint64_t v44 = sub_10009756C();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          int v77 = 136315650;
          v78 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v79 = 2080;
          v80 = "W5DiagnosticsModeManager.m";
          __int16 v81 = 1024;
          int v82 = 877;
          LODWORD(v72) = 28;
          CFStringRef v70 = &v77;
          _os_log_send_and_compose_impl();
        }

        v45 = [(NSError *)v41 objectForKey:@"diagnosticTestsRequestUUID"];
        v46 = [(NSError *)v41 objectForKey:@"TestOutputDirectory"];
        [(W5DiagnosticsModeManager *)self _archiveAndCollectLogs:v45 logCollectionPath:v46 outputDirectory:v28 maxWait:240];

        v47 = sub_10009756C();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          int v77 = 136315650;
          v78 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v79 = 2080;
          v80 = "W5DiagnosticsModeManager.m";
          __int16 v81 = 1024;
          int v82 = 883;
          LODWORD(v72) = 28;
          CFStringRef v70 = &v77;
          _os_log_send_and_compose_impl();
        }

        v48 = [(NSError *)v41 objectForKey:@"analyticsCSVsRequestUUID"];
        v49 = [(NSError *)v41 objectForKey:@"analyticsCSVsOutputPath"];
        [(W5DiagnosticsModeManager *)self _archiveAndCollectLogs:v48 logCollectionPath:v49 outputDirectory:v28 maxWait:240];

        long long v50 = sub_10009756C();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          int v77 = 136315650;
          v78 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v79 = 2080;
          v80 = "W5DiagnosticsModeManager.m";
          __int16 v81 = 1024;
          int v82 = 889;
          LODWORD(v72) = 28;
          CFStringRef v70 = &v77;
          _os_log_send_and_compose_impl();
        }

        long long v51 = [(NSError *)v41 objectForKey:@"systemLogsRequestUUID"];
        long long v52 = [(NSError *)v41 objectForKey:@"systemLogsOutputPath"];
        [(W5DiagnosticsModeManager *)self _archiveAndCollectLogs:v51 logCollectionPath:v52 outputDirectory:v28 maxWait:240];

        long long v53 = sub_10009756C();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          int v77 = 136315650;
          v78 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v79 = 2080;
          v80 = "W5DiagnosticsModeManager.m";
          __int16 v81 = 1024;
          int v82 = 895;
          LODWORD(v72) = 28;
          CFStringRef v70 = &v77;
          _os_log_send_and_compose_impl();
        }

        NSErrorUserInfoKey v54 = [(NSError *)v41 objectForKey:@"networkInfoGenUUID"];
        [(W5DiagnosticsModeManager *)self __waitForLogRequestToComplete:v54 maxWait:100];

        CFStringRef v55 = [(NSError *)v41 objectForKey:@"networkInfoCollectUUID"];
        int v56 = [(NSError *)v41 objectForKey:@"networkInfoOutputPath"];
        [(W5DiagnosticsModeManager *)self _archiveAndCollectLogs:v55 logCollectionPath:v56 outputDirectory:v28 maxWait:180];

        v57 = sub_10009756C();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          int v77 = 136315650;
          v78 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v79 = 2080;
          v80 = "W5DiagnosticsModeManager.m";
          __int16 v81 = 1024;
          int v82 = 902;
          LODWORD(v72) = 28;
          CFStringRef v70 = &v77;
          _os_log_send_and_compose_impl();
        }

        __int16 v58 = [(NSError *)v41 objectForKey:@"tcpdumpOutputPath"];
        [(W5DiagnosticsModeManager *)self _archiveAndCollectLogs:0 logCollectionPath:v58 outputDirectory:v28 maxWait:0];
      }
      else
      {
        __int16 v58 = sub_10009756C();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          int v77 = 136315906;
          v78 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v79 = 2080;
          v80 = "W5DiagnosticsModeManager.m";
          __int16 v81 = 1024;
          int v82 = 909;
          __int16 v83 = 2112;
          v84 = v19;
          LODWORD(v72) = 38;
          CFStringRef v70 = &v77;
          _os_log_send_and_compose_impl();
        }
      }

      if (HIDWORD(v72))
      {
        __int16 v62 = +[NSURL fileURLWithPath:@"/var/run/com.apple.wifivelocity"];
        v63 = [v62 URLByAppendingPathComponent:v75];

        v76 = 0;
        int v64 = sub_1000975B0(v28, v63, &v76);
        id v65 = v76;
        __int16 v66 = sub_10009756C();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          int v77 = 136316674;
          v78 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v79 = 2080;
          v80 = "W5DiagnosticsModeManager.m";
          __int16 v81 = 1024;
          int v82 = 918;
          __int16 v83 = 2112;
          v84 = v28;
          __int16 v85 = 2112;
          v86 = v63;
          __int16 v87 = 1024;
          int v88 = v64;
          __int16 v89 = 2112;
          v90 = v65;
          LODWORD(v72) = 64;
          CFStringRef v70 = &v77;
          _os_log_send_and_compose_impl();
        }

        id v67 = v63;
      }
      else
      {
        id v65 = 0;
        id v67 = 0;
        v63 = v28;
      }
      -[NSError setState:](v19, "setState:", 11, v70, v72);
      v68 = [(W5DiagnosticsModeManager *)self store];
      [v68 updateStoreWithDiagnosticsMode:v19];

      if (v10) {
        v10[2](v10, v65, 0, v63);
      }

      id v14 = v73;
    }
    else
    {
      v59 = sub_10009756C();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v60 = [(W5DiagnosticsModeManager *)self localPeer];
        int v61 = [(NSError *)v19 peers];
        v78 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
        __int16 v79 = 2080;
        int v77 = 136316162;
        v80 = "W5DiagnosticsModeManager.m";
        __int16 v81 = 1024;
        int v82 = 835;
        __int16 v83 = 2112;
        v84 = v60;
        __int16 v85 = 2114;
        v86 = v61;
        _os_log_send_and_compose_impl();
      }
      if (!v10)
      {
        id v25 = 0;
        goto LABEL_53;
      }
      v74 = v8;
      id v75 = v9;
      NSErrorUserInfoKey v91 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v92 = @"W5NotPermittedErr";
      id v28 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
      v41 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:5 userInfo:v28];
      v10[2](v10, v41, 0, 0);
    }

    id v8 = v74;
LABEL_52:

    id v9 = v75;
LABEL_53:

    goto LABEL_54;
  }
  if (v21)
  {
    int v77 = 136315650;
    v78 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
    __int16 v79 = 2080;
    v80 = "W5DiagnosticsModeManager.m";
    __int16 v81 = 1024;
    int v82 = 825;
    _os_log_send_and_compose_impl();
  }

  if (v10)
  {
    id v75 = v9;
    NSErrorUserInfoKey v93 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v94 = @"W5NotPermittedErr";
    id v25 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
    id v28 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:5 userInfo:v25];
    v10[2](v10, v28, 0, 0);
    goto LABEL_52;
  }
LABEL_54:
}

- (void)_archiveAndCollectLogs:(id)a3 logCollectionPath:(id)a4 outputDirectory:(id)a5 maxWait:(unint64_t)a6
{
  id v10 = (NSError *)a3;
  id v11 = (NSError *)a4;
  id v12 = a5;
  id v13 = sub_10009756C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136316418;
    id v28 = "-[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]";
    __int16 v29 = 2080;
    unsigned int v30 = "W5DiagnosticsModeManager.m";
    __int16 v31 = 1024;
    int v32 = 930;
    __int16 v33 = 2112;
    __int16 v34 = v10;
    __int16 v35 = 2112;
    v36 = v11;
    __int16 v37 = 2112;
    v38[0] = v12;
    _os_log_send_and_compose_impl();
  }

  if (v10) {
    [(W5DiagnosticsModeManager *)self __waitForLogRequestToComplete:v10 maxWait:a6];
  }
  if (v11)
  {
    id v14 = [(NSError *)v11 lastPathComponent];
    id v15 = +[NSString stringWithFormat:@"%@.tgz", v14];

    uint64_t v16 = +[NSURL fileURLWithPath:@"/var/run/com.apple.wifivelocity"];
    uint64_t v17 = [v16 URLByAppendingPathComponent:v15];

    unsigned __int8 v26 = 0;
    sub_1000975B0(v11, v17, &v26);
    id v18 = v26;
    if (v18)
    {
      uint64_t v19 = sub_10009756C();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 136316162;
        id v28 = "-[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]";
        __int16 v29 = 2080;
        unsigned int v30 = "W5DiagnosticsModeManager.m";
        __int16 v31 = 1024;
        int v32 = 941;
        __int16 v33 = 2112;
        __int16 v34 = v11;
        __int16 v35 = 2112;
        v36 = v18;
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
      NSErrorUserInfoKey v20 = +[NSFileManager defaultManager];
      BOOL v21 = [v12 URLByAppendingPathComponent:v15];
      id v25 = 0;
      unsigned int v22 = [v20 moveItemAtURL:v17 toURL:v21 error:&v25];
      uint64_t v19 = v25;

      id v23 = sub_10009756C();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = [v12 URLByAppendingPathComponent:v15];
        int v27 = 136316674;
        id v28 = "-[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]";
        __int16 v29 = 2080;
        unsigned int v30 = "W5DiagnosticsModeManager.m";
        __int16 v31 = 1024;
        int v32 = 946;
        __int16 v33 = 2112;
        __int16 v34 = v17;
        __int16 v35 = 2112;
        v36 = v24;
        __int16 v37 = 1024;
        LODWORD(v38[0]) = v22;
        WORD2(v38[0]) = 2112;
        *(void *)((char *)v38 + 6) = v19;
        _os_log_send_and_compose_impl();
      }
    }
  }
}

- (BOOL)registerPeer:(id)a3 role:(int64_t)a4 configuration:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a3;
  id v11 = sub_10009756C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = +[W5CloudStore sharedStore];
    id v18 = [v12 registeredPeers];
    _os_log_send_and_compose_impl();
  }
  id v13 = [objc_alloc((Class)W5DiagnosticsModePeer) initWithRole:a4 peer:v10];

  id v14 = sub_10009756C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  id v15 = +[W5CloudStore sharedStore];
  unsigned __int8 v16 = [v15 registerDiagnosticModePeer:v13 configuration:v9 error:a6];

  return v16;
}

- (BOOL)unregisterPeer:(id)a3 role:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = sub_10009756C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[W5CloudStore sharedStore];
    id v15 = [v9 registeredPeers];
    _os_log_send_and_compose_impl();
  }
  id v10 = [objc_alloc((Class)W5DiagnosticsModePeer) initWithRole:a4 peer:v7];

  id v11 = sub_10009756C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  id v12 = +[W5CloudStore sharedStore];
  unsigned __int8 v13 = [v12 unregisterDiagnosticModePeer:v10 error:a5];

  return v13;
}

- (void)__waitForLogRequestToComplete:(id)a3 maxWait:(unint64_t)a4
{
  id v6 = a3;
  if ([(W5LogManager *)self->_logManager isRequestActiveOrPending:v6])
  {
    unint64_t v7 = (unint64_t)(double)(a4 / 0xA);
    if (v7)
    {
      unint64_t v8 = 1;
      uint64_t v9 = 10;
      while (1)
      {
        dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
        id v11 = sub_10009756C();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v23 = (uint64_t)"-[W5DiagnosticsModeManager __waitForLogRequestToComplete:maxWait:]";
          __int16 v24 = 2080;
          id v25 = "W5DiagnosticsModeManager.m";
          __int16 v26 = 1024;
          int v27 = 975;
          __int16 v28 = 2048;
          uint64_t v29 = 10;
          __int16 v30 = 2112;
          uint64_t v31 = (uint64_t)v6;
          __int16 v32 = 2048;
          unint64_t v33 = v8;
          LODWORD(v19) = 58;
          id v18 = buf;
          _os_log_send_and_compose_impl();
        }

        dispatch_time_t v12 = dispatch_time(0, 10000000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100009DA4;
        block[3] = &unk_1000DD230;
        unsigned __int8 v13 = v10;
        BOOL v21 = v13;
        dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);
        dispatch_time_t v14 = dispatch_time(0, 80000000000);
        if (dispatch_semaphore_wait(v13, v14) >= 1
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          uint64_t v23 = 0x4054000000000000;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
        }
        unsigned __int8 v15 = -[W5LogManager isRequestActiveOrPending:](self->_logManager, "isRequestActiveOrPending:", v6, v18, v19);
        unsigned __int8 v16 = sub_10009756C();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        if ((v15 & 1) == 0) {
          break;
        }
        if (v17)
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v23 = (uint64_t)"-[W5DiagnosticsModeManager __waitForLogRequestToComplete:maxWait:]";
          __int16 v24 = 2080;
          id v25 = "W5DiagnosticsModeManager.m";
          __int16 v26 = 1024;
          int v27 = 986;
          __int16 v28 = 2112;
          uint64_t v29 = (uint64_t)v6;
          __int16 v30 = 2048;
          uint64_t v31 = v9;
          LODWORD(v19) = 48;
          id v18 = buf;
          _os_log_send_and_compose_impl();
        }

        ++v8;
        v9 += 10;
        if (v8 > v7) {
          goto LABEL_17;
        }
      }
      if (v17)
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v23 = (uint64_t)"-[W5DiagnosticsModeManager __waitForLogRequestToComplete:maxWait:]";
        __int16 v24 = 2080;
        id v25 = "W5DiagnosticsModeManager.m";
        __int16 v26 = 1024;
        int v27 = 983;
        __int16 v28 = 2112;
        uint64_t v29 = (uint64_t)v6;
        __int16 v30 = 2048;
        uint64_t v31 = v9;
        _os_log_send_and_compose_impl();
      }
    }
  }
LABEL_17:
}

- (void)__writePeerStatusToFile:(id)a3
{
  id v4 = a3;
  statusManager = self->_statusManager;
  if (statusManager)
  {
    id v6 = [(W5StatusManager *)statusManager status];
    if (!v6)
    {
      dispatch_time_t v12 = sub_10009756C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
LABEL_8:
      }
        _os_log_send_and_compose_impl();
LABEL_9:

      goto LABEL_10;
    }
    unint64_t v7 = +[NSFileManager defaultManager];
    unint64_t v8 = [v4 path];
    uint64_t v9 = [v6 description];
    dispatch_semaphore_t v10 = [v9 dataUsingEncoding:4];
    unsigned int v11 = [v7 createFileAtPath:v8 contents:v10 attributes:0];

    if (v11)
    {
      dispatch_time_t v12 = sub_10009756C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      goto LABEL_9;
    }
  }
  else
  {
    id v6 = 0;
  }
LABEL_10:
}

- (void)__writeDiagnosticModeToFile:(id)a3 file:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    dispatch_time_t v12 = sub_10009756C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
LABEL_6:
    }
      _os_log_send_and_compose_impl();
LABEL_7:

    goto LABEL_8;
  }
  unint64_t v7 = +[NSFileManager defaultManager];
  unint64_t v8 = [v6 path];
  uint64_t v9 = [v5 description];
  dispatch_semaphore_t v10 = [v9 dataUsingEncoding:4];
  unsigned int v11 = [v7 createFileAtPath:v8 contents:v10 attributes:0];

  if (v11)
  {
    dispatch_time_t v12 = sub_10009756C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (void)__collectNetUsageFiles:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = +[NSFileManager defaultManager];
  id v24 = 0;
  unsigned int v9 = [v8 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v24];
  dispatch_semaphore_t v10 = (NSError *)v24;

  unsigned int v11 = sub_10009756C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136316418;
    __int16 v26 = "-[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:]";
    __int16 v27 = 2080;
    __int16 v28 = "W5DiagnosticsModeManager.m";
    __int16 v29 = 1024;
    int v30 = 1029;
    __int16 v31 = 2112;
    id v32 = v6;
    __int16 v33 = 1024;
    *(_DWORD *)__int16 v34 = v9;
    *(_WORD *)&v34[4] = 2112;
    *(void *)&v34[6] = v10;
    _os_log_send_and_compose_impl();
  }

  if (v9)
  {
    dispatch_time_t v12 = [(W5NetUsageManager *)self->_netUsageManager calculateUsageDelta:v7];
    unsigned __int8 v13 = sub_10009756C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315650;
      __int16 v26 = "-[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:]";
      __int16 v27 = 2080;
      __int16 v28 = "W5DiagnosticsModeManager.m";
      __int16 v29 = 1024;
      int v30 = 1033;
      _os_log_send_and_compose_impl();
    }

    dispatch_time_t v14 = [v6 URLByAppendingPathComponent:@"netusage_delta.csv"];
    +[W5NetUsageManager writeProcNetUsage:v12 ToFile:v14];

    unsigned __int8 v15 = sub_10009756C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315650;
      __int16 v26 = "-[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:]";
      __int16 v27 = 2080;
      __int16 v28 = "W5DiagnosticsModeManager.m";
      __int16 v29 = 1024;
      int v30 = 1036;
      _os_log_send_and_compose_impl();
    }

    +[W5NetUsageManager copyPeriodicNetUsageToDir:v6 uuid:v7];
    unsigned __int8 v16 = +[NSString stringWithFormat:@"%@.tgz", v6];
    BOOL v17 = +[NSURL URLWithString:v16];

    uint64_t v23 = v10;
    int v18 = sub_1000975B0(v6, v17, &v23);
    uint64_t v19 = v23;

    NSErrorUserInfoKey v20 = sub_10009756C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136316674;
      __int16 v26 = "-[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:]";
      __int16 v27 = 2080;
      __int16 v28 = "W5DiagnosticsModeManager.m";
      __int16 v29 = 1024;
      int v30 = 1041;
      __int16 v31 = 2112;
      id v32 = v6;
      __int16 v33 = 2112;
      *(void *)__int16 v34 = v17;
      *(_WORD *)&v34[8] = 1024;
      *(_DWORD *)&v34[10] = v18;
      __int16 v35 = 2112;
      v36 = v19;
      _os_log_send_and_compose_impl();
    }

    if (v18)
    {
      BOOL v21 = +[NSFileManager defaultManager];
      unsigned int v22 = [v6 path];
      [v21 removeItemAtPath:v22 error:0];
    }
  }
  else
  {
    uint64_t v19 = v10;
  }
}

- (void)handlePeerFaultEvent:(id)a3
{
  id v4 = a3;
  id v5 = sub_10009756C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v85 = 136315906;
    v86 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
    __int16 v87 = 2080;
    int v88 = "W5DiagnosticsModeManager.m";
    __int16 v89 = 1024;
    int v90 = 1048;
    __int16 v91 = 2114;
    id v92 = v4;
    LODWORD(v69) = 38;
    v68 = &v85;
    _os_log_send_and_compose_impl();
  }

  id v6 = [v4 info];
  id v7 = [v6 objectForKeyedSubscript:@"RemoteListener"];

  unint64_t v8 = [v4 peer];
  unsigned int v9 = [v8 peerID];

  if (v9)
  {
    dispatch_semaphore_t v10 = [(W5DiagnosticsModeManager *)self localPeer];
    unsigned int v11 = [v10 peerID];
    unsigned int v12 = [v9 isEqualToString:v11];

    if (!v12)
    {
      int v30 = [v4 info];
      BOOL v17 = [v30 objectForKey:@"DiagnosticMode"];

      if (v17)
      {
        __int16 v31 = sub_10009756C();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [v4 peer];
          v86 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          __int16 v87 = 2080;
          int v85 = 136316162;
          int v88 = "W5DiagnosticsModeManager.m";
          __int16 v89 = 1024;
          int v90 = 1104;
          __int16 v91 = 2112;
          id v92 = v17;
          __int16 v93 = 2114;
          id v94 = v32;
          LODWORD(v69) = 48;
          v68 = &v85;
          _os_log_send_and_compose_impl();
        }
        id v33 = objc_alloc((Class)W5DiagnosticsModePeer);
        __int16 v34 = [(W5DiagnosticsModeManager *)self localPeer];
        id v35 = [v33 initWithRole:8 peer:v34];

        v36 = [v17 peers];
        __int16 v37 = sub_100090CA4(v36, v35, 8);

        if (!v37)
        {
LABEL_60:

          goto LABEL_68;
        }
        CFStringRef v70 = v35;
        uint64_t v71 = v7;
        v38 = [v4 info];
        v39 = [v38 objectForKeyedSubscript:@"FaultType"];
        id v40 = [v39 integerValue];

        v41 = [v17 info];
        v42 = [v41 objectForKeyedSubscript:@"Faults"];

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v43 = v42;
        id v44 = [v43 countByEnumeratingWithState:&v72 objects:v83 count:16];
        if (v44)
        {
          id v45 = v44;
          uint64_t v46 = *(void *)v73;
          while (2)
          {
            for (i = 0; i != v45; i = (char *)i + 1)
            {
              if (*(void *)v73 != v46) {
                objc_enumerationMutation(v43);
              }
              if (objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * i), "integerValue", v68, v69) == v40)
              {

                id v65 = sub_10009756C();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  int v85 = 136315650;
                  v86 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
                  __int16 v87 = 2080;
                  int v88 = "W5DiagnosticsModeManager.m";
                  __int16 v89 = 1024;
                  int v90 = 1132;
                  _os_log_send_and_compose_impl();
                }

                id v35 = v70;
                if (self->_userNotificationManager)
                {
                  [(W5DiagnosticsModeManager *)self _showSuggestedStopNotificationForEvent:v4];
                  id v7 = v71;
                }
                else
                {
                  __int16 v66 = sub_10009756C();
                  id v7 = v71;
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                  {
                    int v85 = 136315650;
                    v86 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
                    __int16 v87 = 2080;
                    int v88 = "W5DiagnosticsModeManager.m";
                    __int16 v89 = 1024;
                    int v90 = 1139;
                    _os_log_send_and_compose_impl();
                  }
                }
                goto LABEL_60;
              }
            }
            id v45 = [v43 countByEnumeratingWithState:&v72 objects:v83 count:16];
            if (v45) {
              continue;
            }
            break;
          }
        }

        v48 = sub_10009756C();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v86 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          __int16 v87 = 2080;
          int v85 = 136316162;
          int v88 = "W5DiagnosticsModeManager.m";
          __int16 v89 = 1024;
          int v90 = 1128;
          __int16 v91 = 2048;
          id v92 = v40;
          __int16 v93 = 2114;
          id v94 = v43;
          _os_log_send_and_compose_impl();
        }

        goto LABEL_48;
      }
      long long v53 = [(W5DiagnosticsModeManager *)self localPeer];
      NSErrorUserInfoKey v54 = [v53 peerID];
      unsigned int v55 = [v7 isEqualToString:v54];

      int v56 = sub_10009756C();
      BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
      if (!v55)
      {
        if (v57)
        {
          int v85 = 136315906;
          v86 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          __int16 v87 = 2080;
          int v88 = "W5DiagnosticsModeManager.m";
          __int16 v89 = 1024;
          int v90 = 1159;
          __int16 v91 = 2114;
          id v92 = v4;
          _os_log_send_and_compose_impl();
        }

        goto LABEL_67;
      }
      if (v57)
      {
        int v85 = 136315650;
        v86 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
        __int16 v87 = 2080;
        int v88 = "W5DiagnosticsModeManager.m";
        __int16 v89 = 1024;
        int v90 = 1146;
        _os_log_send_and_compose_impl();
      }

      if (self->_userNotificationManager)
      {
        __int16 v58 = [v4 info];
        v59 = [v58 objectForKeyedSubscript:@"FaultType"];
        unsigned int v60 = -[W5DiagnosticsModeManager _isFaultSupported:](self, "_isFaultSupported:", [v59 integerValue]);

        if (v60)
        {
          [(W5DiagnosticsModeManager *)self _showSuggestedStartNotificationForEvent:v4];
LABEL_67:
          BOOL v17 = 0;
          goto LABEL_68;
        }
        id v67 = sub_10009756C();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          int v85 = 136315906;
          v86 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          __int16 v87 = 2080;
          int v88 = "W5DiagnosticsModeManager.m";
          __int16 v89 = 1024;
          int v90 = 1150;
          __int16 v91 = 2114;
          id v92 = v4;
          goto LABEL_65;
        }
      }
      else
      {
        id v67 = sub_10009756C();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          int v85 = 136315650;
          v86 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          __int16 v87 = 2080;
          int v88 = "W5DiagnosticsModeManager.m";
          __int16 v89 = 1024;
          int v90 = 1154;
LABEL_65:
          _os_log_send_and_compose_impl();
        }
      }

      goto LABEL_67;
    }
  }
  unsigned __int8 v13 = sub_10009756C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v85 = 136315650;
    v86 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
    __int16 v87 = 2080;
    int v88 = "W5DiagnosticsModeManager.m";
    __int16 v89 = 1024;
    int v90 = 1054;
    LODWORD(v69) = 28;
    v68 = &v85;
    _os_log_send_and_compose_impl();
  }

  dispatch_time_t v14 = [(W5DiagnosticsModeManager *)self store];
  unsigned __int8 v15 = [(W5DiagnosticsModeManager *)self localPeer];
  unsigned __int8 v16 = [v15 peerID];
  BOOL v17 = [v14 diagnosticsModeMatchingPeerID:v16 state:3 role:1];

  if ([v17 count])
  {
    uint64_t v71 = v7;
    int v18 = [v17 firstObject];
    uint64_t v19 = [v4 info];
    NSErrorUserInfoKey v20 = [v19 objectForKeyedSubscript:@"FaultType"];
    id v21 = [v20 integerValue];

    unsigned int v22 = [v18 info];
    uint64_t v23 = [v22 objectForKeyedSubscript:@"Faults"];

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v24 = v23;
    id v25 = [v24 countByEnumeratingWithState:&v79 objects:v95 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v80;
      while (2)
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v80 != v27) {
            objc_enumerationMutation(v24);
          }
          if (objc_msgSend(*(id *)(*((void *)&v79 + 1) + 8 * (void)j), "integerValue", v68, v69) == v21)
          {

            [v18 setState:4];
            v49 = [v18 info];
            if (v49)
            {
              long long v50 = [v18 info];
              id v51 = [v50 mutableCopy];
            }
            else
            {
              id v51 = +[NSMutableDictionary dictionary];
            }

            int v61 = +[NSNumber numberWithInteger:v21];
            v84 = v61;
            __int16 v62 = +[NSArray arrayWithObjects:&v84 count:1];
            [v51 setObject:v62 forKeyedSubscript:@"DetectedFaults"];

            [v18 setInfo:v51];
            v63 = [(W5DiagnosticsModeManager *)self store];
            [v63 updateStoreWithDiagnosticsMode:v18];

            int v64 = [v18 uuid];
            v76[0] = _NSConcreteStackBlock;
            v76[1] = 3221225472;
            v76[2] = sub_10000B3F0;
            v76[3] = &unk_1000DD258;
            v76[4] = self;
            id v77 = v4;
            id v78 = v18;
            [(W5DiagnosticsModeManager *)self stopDiagnosticsModeWithUUID:v64 info:&__NSDictionary0__struct reply:v76];

            goto LABEL_47;
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v79 objects:v95 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    __int16 v29 = sub_10009756C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v86 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
      __int16 v87 = 2080;
      int v85 = 136316162;
      int v88 = "W5DiagnosticsModeManager.m";
      __int16 v89 = 1024;
      int v90 = 1074;
      __int16 v91 = 2048;
      id v92 = v21;
      __int16 v93 = 2114;
      id v94 = v24;
      _os_log_send_and_compose_impl();
    }

    [(W5DiagnosticsModeManager *)self _notifyPeers:v4 info:0];
LABEL_47:

LABEL_48:
    id v7 = v71;
    goto LABEL_68;
  }
  long long v52 = sub_10009756C();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    int v85 = 136315650;
    v86 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
    __int16 v87 = 2080;
    int v88 = "W5DiagnosticsModeManager.m";
    __int16 v89 = 1024;
    int v90 = 1094;
    _os_log_send_and_compose_impl();
  }

  [(W5DiagnosticsModeManager *)self _notifyPeers:v4 info:0];
LABEL_68:
}

- (BOOL)_isFaultSupported:(int64_t)a3
{
  id v4 = [&off_1000EF348 objectAtIndex:0];
  id v5 = [v4 integerValue];

  if (v5 == (id)a3) {
    return 1;
  }
  unint64_t v7 = 0;
  do
  {
    unint64_t v8 = v7;
    if (v7 == 3) {
      break;
    }
    ++v7;
    unsigned int v9 = [&off_1000EF348 objectAtIndex:v8 + 1];
    id v10 = [v9 integerValue];
  }
  while (v10 != (id)a3);
  return v8 < 3;
}

- (void)_notifyPeers:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  faultEventManager = self->_faultEventManager;
  unsigned int v9 = sub_10009756C();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (faultEventManager)
  {
    if (v10) {
      _os_log_send_and_compose_impl();
    }

    [(W5FaultEventManager *)self->_faultEventManager notifyPeersWithFaultEvent:v6 info:v7];
  }
  else
  {
    if (v10) {
      _os_log_send_and_compose_impl();
    }
  }
}

- (void)_showSuggestedStartNotificationForEvent:(id)a3
{
  id v20 = a3;
  if ([(W5DiagnosticsModeManager *)self _shouldShowNotification:2])
  {
    id v4 = +[NSUUID UUID];
    [(W5DiagnosticsModeManager *)self setStopNotificationUUID:v4];

    id v5 = [v20 info];
    id v6 = [v5 objectForKeyedSubscript:@"FaultType"];
    [v6 integerValue];

    id v7 = W5DescriptionForDiagnosticsFaultType();
    unint64_t v8 = +[NSString stringWithFormat:@"%@ Issue Detected", v7];

    unsigned int v9 = [v20 peer];
    BOOL v10 = [v9 name];
    if (v10)
    {
      unsigned int v11 = [v20 peer];
      unsigned int v12 = [v11 name];
    }
    else
    {
      unsigned int v12 = @"Your device";
    }

    unsigned __int8 v13 = [v20 peer];
    dispatch_time_t v14 = [v13 peerID];
    unsigned __int8 v15 = +[NSString stringWithFormat:@"wifiapp://startDiagnostics?peerID=%@", v14];
    unsigned __int8 v16 = +[NSURL URLWithString:v15];

    userNotificationManager = self->_userNotificationManager;
    int v18 = +[NSString stringWithFormat:@"%@ has detected an issue. Tap here to help diagnose the issue.", v12];
    uint64_t v19 = [(W5DiagnosticsModeManager *)self stopNotificationUUID];
    [(W5UserNotificationManager *)userNotificationManager dispatchNotificationWithTitle:v8 subtitle:0 body:v18 type:3 UUID:v19 actionURL:v16];
  }
}

- (void)_showSuggestedStopNotificationForEvent:(id)a3
{
  id v24 = a3;
  if ([(W5DiagnosticsModeManager *)self _shouldShowNotification:3])
  {
    id v4 = +[NSUUID UUID];
    [(W5DiagnosticsModeManager *)self setStopNotificationUUID:v4];

    id v5 = [v24 info];
    id v6 = [v5 objectForKeyedSubscript:@"FaultType"];
    [v6 integerValue];

    id v7 = W5DescriptionForDiagnosticsFaultType();
    unint64_t v8 = +[NSString stringWithFormat:@"%@ Issue Diagnostics Complete", v7];

    unsigned int v9 = [v24 peer];
    BOOL v10 = [v9 name];
    if (v10)
    {
      unsigned int v11 = [v24 peer];
      unsigned int v12 = [v11 name];
    }
    else
    {
      unsigned int v12 = @"Your device";
    }

    unsigned __int8 v13 = [v24 info];
    dispatch_time_t v14 = [v13 objectForKeyedSubscript:@"DiagnosticMode"];
    unsigned __int8 v15 = [v14 uuid];

    unsigned __int8 v16 = [v24 peer];
    BOOL v17 = [v16 peerID];
    int v18 = [v15 UUIDString];
    uint64_t v19 = +[NSString stringWithFormat:@"wifiapp://endDiagnostics?peerID=%@&dmUUID=%@", v17, v18];
    id v20 = +[NSURL URLWithString:v19];

    userNotificationManager = self->_userNotificationManager;
    unsigned int v22 = +[NSString stringWithFormat:@"%@ has detected the issue again and has completed diagnostics. Tap here to file a radar.", v12];
    uint64_t v23 = [(W5DiagnosticsModeManager *)self stopNotificationUUID];
    [(W5UserNotificationManager *)userNotificationManager dispatchNotificationWithTitle:v8 subtitle:0 body:v22 type:3 UUID:v23 actionURL:v20];
  }
}

- (BOOL)_shouldShowNotification:(int64_t)a3
{
  id v5 = +[NSDate date];
  double v6 = 300.0;
  if (a3 != 3) {
    double v6 = 0.0;
  }
  if (a3 == 2) {
    double v7 = 900.0;
  }
  else {
    double v7 = v6;
  }
  unint64_t v8 = +[W5CloudStore sharedStore];
  unsigned int v9 = [(W5Peer *)self->_localPeer peerID];
  BOOL v10 = [v8 getMinNotificationInterval:v9 notificationType:a3];

  if (v10)
  {
    unsigned int v11 = sub_10009756C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315906;
      id v32 = "-[W5DiagnosticsModeManager _shouldShowNotification:]";
      __int16 v33 = 2080;
      __int16 v34 = "W5DiagnosticsModeManager.m";
      __int16 v35 = 1024;
      int v36 = 1240;
      __int16 v37 = 2112;
      v38 = v10;
      LODWORD(v29) = 38;
      uint64_t v27 = &v31;
      _os_log_send_and_compose_impl();
    }

    [v10 doubleValue];
    double v7 = v12;
  }
  unsigned __int8 v13 = +[NSUserDefaults standardUserDefaults];
  dispatch_time_t v14 = [v13 persistentDomainForName:@"com.apple.wifi.diagnosticsMode"];

  if (a3 == 2)
  {
    CFStringRef v15 = @"MinStartNotificationInterval";
  }
  else
  {
    if (a3 != 3)
    {
      unsigned __int8 v16 = 0;
      goto LABEL_19;
    }
    CFStringRef v15 = @"MinStopNotificationInterval";
  }
  unsigned __int8 v16 = [v14 objectForKey:v15];
  if (v16)
  {
    BOOL v17 = sub_10009756C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315906;
      id v32 = "-[W5DiagnosticsModeManager _shouldShowNotification:]";
      __int16 v33 = 2080;
      __int16 v34 = "W5DiagnosticsModeManager.m";
      __int16 v35 = 1024;
      int v36 = 1260;
      __int16 v37 = 2112;
      v38 = v16;
      LODWORD(v30) = 38;
      __int16 v28 = &v31;
      _os_log_send_and_compose_impl();
    }

    [v16 doubleValue];
    double v7 = v18;
  }
LABEL_19:
  uint64_t v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3, v28, v30);
  id v20 = [(W5DiagnosticsModeManager *)self lastNotificationTimestamp];
  id v21 = [v20 objectForKey:v19];

  if (v21)
  {
    [v5 timeIntervalSinceDate:v21];
    BOOL v23 = v22 > v7;
  }
  else
  {
    BOOL v23 = 1;
  }
  id v24 = sub_10009756C();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 136316674;
    id v32 = "-[W5DiagnosticsModeManager _shouldShowNotification:]";
    __int16 v33 = 2080;
    __int16 v34 = "W5DiagnosticsModeManager.m";
    __int16 v35 = 1024;
    int v36 = 1270;
    __int16 v37 = 2112;
    v38 = v19;
    __int16 v39 = 2112;
    id v40 = v21;
    __int16 v41 = 2048;
    double v42 = v7;
    __int16 v43 = 1024;
    BOOL v44 = v23;
    _os_log_send_and_compose_impl();
  }

  if (v23)
  {
    id v25 = [(W5DiagnosticsModeManager *)self lastNotificationTimestamp];
    [v25 setObject:v5 forKeyedSubscript:v19];
  }
  return v23;
}

- (void)_runDiagnosticsForDiagnosticMode:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuid];
  double v6 = [v5 UUIDString];
  double v7 = +[NSString stringWithFormat:@"DiagnosticsMode-%@-WiFiDETestsAtFault", v6];

  unint64_t v8 = +[NSUUID UUID];
  unsigned int v9 = objc_alloc_init(W5LogItemRequestInternal);
  [(W5LogItemRequestInternal *)v9 setUuid:v8];
  BOOL v10 = +[W5LogItemRequest requestWithItemID:55 configuration:0];
  uint64_t v30 = v10;
  unsigned int v11 = +[NSArray arrayWithObjects:&v30 count:1];
  [(W5LogItemRequestInternal *)v9 setItemRequests:v11];

  [(W5LogItemRequestInternal *)v9 setFilename:v7];
  double v12 = +[NSDate date];
  [(W5LogItemRequestInternal *)v9 setAddedAt:v12];

  unsigned __int8 v13 = [(W5DiagnosticsModeManager *)self logManager];
  [v13 addRequest:v9];

  dispatch_time_t v14 = sub_10009756C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315906;
    BOOL v23 = "-[W5DiagnosticsModeManager _runDiagnosticsForDiagnosticMode:]";
    __int16 v24 = 2080;
    id v25 = "W5DiagnosticsModeManager.m";
    __int16 v26 = 1024;
    int v27 = 1288;
    __int16 v28 = 2112;
    uint64_t v29 = v9;
    _os_log_send_and_compose_impl();
  }

  CFStringRef v15 = +[NSURL fileURLWithPath:@"/var/run/com.apple.wifivelocity"];
  unsigned __int8 v16 = [v15 URLByAppendingPathComponent:v7];

  BOOL v17 = sub_10009756C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315906;
    BOOL v23 = "-[W5DiagnosticsModeManager _runDiagnosticsForDiagnosticMode:]";
    __int16 v24 = 2080;
    id v25 = "W5DiagnosticsModeManager.m";
    __int16 v26 = 1024;
    int v27 = 1291;
    __int16 v28 = 2114;
    uint64_t v29 = v16;
    _os_log_send_and_compose_impl();
  }

  double v18 = [(W5DiagnosticsModeManager *)self localStore];
  v20[0] = @"diagnosticTestsRequestUUID";
  v20[1] = @"TestOutputDirectory";
  v21[0] = v8;
  v21[1] = v16;
  uint64_t v19 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v18 addToStore:v4 newInfo:v19];
}

- (void)_collectAnalyticsCSVsForDiagnosticMode:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuid];
  double v6 = [v5 UUIDString];
  double v7 = +[NSString stringWithFormat:@"DiagnosticsMode-%@-AnalyticsCSVs", v6];

  unint64_t v8 = +[NSUUID UUID];
  unsigned int v9 = objc_alloc_init(W5LogItemRequestInternal);
  [(W5LogItemRequestInternal *)v9 setUuid:v8];
  BOOL v10 = +[W5LogItemRequest requestWithItemID:85 configuration:&off_1000EDE80];
  v32[0] = v10;
  unsigned int v11 = +[W5LogItemRequest requestWithItemID:84 configuration:&off_1000EDEA8];
  v32[1] = v11;
  double v12 = +[W5LogItemRequest requestWithItemID:88 configuration:&off_1000EDED0];
  v32[2] = v12;
  unsigned __int8 v13 = +[NSArray arrayWithObjects:v32 count:3];
  [(W5LogItemRequestInternal *)v9 setItemRequests:v13];

  [(W5LogItemRequestInternal *)v9 setFilename:v7];
  dispatch_time_t v14 = +[NSDate date];
  [(W5LogItemRequestInternal *)v9 setAddedAt:v14];

  CFStringRef v15 = [(W5DiagnosticsModeManager *)self logManager];
  [v15 addRequest:v9];

  unsigned __int8 v16 = sub_10009756C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315906;
    id v25 = "-[W5DiagnosticsModeManager _collectAnalyticsCSVsForDiagnosticMode:]";
    __int16 v26 = 2080;
    int v27 = "W5DiagnosticsModeManager.m";
    __int16 v28 = 1024;
    int v29 = 1316;
    __int16 v30 = 2112;
    int v31 = v9;
    _os_log_send_and_compose_impl();
  }

  BOOL v17 = +[NSURL fileURLWithPath:@"/var/run/com.apple.wifivelocity"];
  double v18 = [v17 URLByAppendingPathComponent:v7];

  uint64_t v19 = sub_10009756C();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315906;
    id v25 = "-[W5DiagnosticsModeManager _collectAnalyticsCSVsForDiagnosticMode:]";
    __int16 v26 = 2080;
    int v27 = "W5DiagnosticsModeManager.m";
    __int16 v28 = 1024;
    int v29 = 1319;
    __int16 v30 = 2114;
    int v31 = v18;
    _os_log_send_and_compose_impl();
  }

  id v20 = [(W5DiagnosticsModeManager *)self localStore];
  v22[0] = @"analyticsCSVsRequestUUID";
  v22[1] = @"analyticsCSVsOutputPath";
  v23[0] = v8;
  v23[1] = v18;
  id v21 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v20 addToStore:v4 newInfo:v21];
}

- (void)_collectSystemLogsForDiagnosticMode:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuid];
  double v6 = [v5 UUIDString];
  double v7 = +[NSString stringWithFormat:@"DiagnosticsMode-%@-SystemLogs", v6];

  unint64_t v8 = +[NSUUID UUID];
  unsigned int v9 = objc_alloc_init(W5LogItemRequestInternal);
  [(W5LogItemRequestInternal *)v9 setUuid:v8];
  BOOL v10 = +[W5LogItemRequest requestWithItemID:31 configuration:&off_1000EDEF8];
  __int16 v30 = v10;
  unsigned int v11 = +[NSArray arrayWithObjects:&v30 count:1];
  [(W5LogItemRequestInternal *)v9 setItemRequests:v11];

  [(W5LogItemRequestInternal *)v9 setFilename:v7];
  double v12 = +[NSDate date];
  [(W5LogItemRequestInternal *)v9 setAddedAt:v12];

  unsigned __int8 v13 = [(W5DiagnosticsModeManager *)self logManager];
  [v13 addRequest:v9];

  dispatch_time_t v14 = sub_10009756C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315906;
    BOOL v23 = "-[W5DiagnosticsModeManager _collectSystemLogsForDiagnosticMode:]";
    __int16 v24 = 2080;
    id v25 = "W5DiagnosticsModeManager.m";
    __int16 v26 = 1024;
    int v27 = 1338;
    __int16 v28 = 2112;
    int v29 = v9;
    _os_log_send_and_compose_impl();
  }

  CFStringRef v15 = +[NSURL fileURLWithPath:@"/var/run/com.apple.wifivelocity"];
  unsigned __int8 v16 = [v15 URLByAppendingPathComponent:v7];

  BOOL v17 = sub_10009756C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315906;
    BOOL v23 = "-[W5DiagnosticsModeManager _collectSystemLogsForDiagnosticMode:]";
    __int16 v24 = 2080;
    id v25 = "W5DiagnosticsModeManager.m";
    __int16 v26 = 1024;
    int v27 = 1341;
    __int16 v28 = 2114;
    int v29 = v16;
    _os_log_send_and_compose_impl();
  }

  double v18 = [(W5DiagnosticsModeManager *)self localStore];
  v20[0] = @"systemLogsRequestUUID";
  v20[1] = @"systemLogsOutputPath";
  v21[0] = v8;
  v21[1] = v16;
  uint64_t v19 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v18 addToStore:v4 newInfo:v19];
}

- (void)_collectNetworkInfoForDiagnosticMode:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuid];
  double v6 = [v5 UUIDString];
  double v7 = +[NSString stringWithFormat:@"DiagnosticsMode-%@-NetworkInfo", v6];

  unint64_t v8 = +[NSURL fileURLWithPath:@"/var/run/com.apple.wifivelocity"];
  unsigned int v9 = [v8 URLByAppendingPathComponent:v7];

  BOOL v10 = +[NSFileManager defaultManager];
  unsigned int v11 = [(W5LogItemRequestInternal *)v9 path];
  unsigned int v12 = [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:0];

  if (v12)
  {
    unsigned __int8 v13 = +[NSUUID UUID];
    dispatch_time_t v14 = objc_alloc_init(W5LogItemRequestInternal);
    [(W5LogItemRequestInternal *)v14 setUuid:v13];
    CFStringRef v15 = +[W5LogItemRequest requestWithItemID:89 configuration:&off_1000EDF20];
    v39[0] = v15;
    unsigned __int8 v16 = +[W5LogItemRequest requestWithItemID:91 configuration:&off_1000EDF48];
    v39[1] = v16;
    BOOL v17 = +[W5LogItemRequest requestWithItemID:92 configuration:0];
    v39[2] = v17;
    double v18 = +[NSArray arrayWithObjects:v39 count:3];
    [(W5LogItemRequestInternal *)v14 setItemRequests:v18];

    [(W5LogItemRequestInternal *)v14 setFilename:v7];
    uint64_t v19 = +[NSDate date];
    [(W5LogItemRequestInternal *)v14 setAddedAt:v19];

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000CF1C;
    v25[3] = &unk_1000DD280;
    id v26 = v7;
    int v27 = self;
    id v20 = v4;
    id v28 = v20;
    [(W5LogItemRequestInternal *)v14 setReply:v25];
    id v21 = [(W5DiagnosticsModeManager *)self logManager];
    [v21 addRequest:v14];

    int v22 = sub_10009756C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315906;
      id v32 = "-[W5DiagnosticsModeManager _collectNetworkInfoForDiagnosticMode:]";
      __int16 v33 = 2080;
      __int16 v34 = "W5DiagnosticsModeManager.m";
      __int16 v35 = 1024;
      int v36 = 1386;
      __int16 v37 = 2112;
      v38 = v14;
      _os_log_send_and_compose_impl();
    }

    BOOL v23 = [(W5DiagnosticsModeManager *)self localStore];
    v29[0] = @"networkInfoGenUUID";
    v29[1] = @"networkInfoOutputPath";
    v30[0] = v13;
    v30[1] = v9;
    __int16 v24 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    [v23 addToStore:v20 newInfo:v24];
  }
  else
  {
    unsigned __int8 v13 = sub_10009756C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315906;
      id v32 = "-[W5DiagnosticsModeManager _collectNetworkInfoForDiagnosticMode:]";
      __int16 v33 = 2080;
      __int16 v34 = "W5DiagnosticsModeManager.m";
      __int16 v35 = 1024;
      int v36 = 1393;
      __int16 v37 = 2112;
      v38 = v9;
      _os_log_send_and_compose_impl();
    }
  }
}

- (NSArray)registeredPeers
{
  v2 = +[W5CloudStore sharedStore];
  v3 = [v2 registeredPeers];

  return (NSArray *)v3;
}

- (int64_t)registeredRoleForPeer:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(W5DiagnosticsModeManager *)self registeredPeers];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        unsigned int v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v10 = [v9 peer];
        unsigned int v11 = [v10 peerID];
        unsigned int v12 = [v4 peerID];
        unsigned int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          id v6 = [v9 role];
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (int64_t)v6;
}

- (NSArray)activeDiagnostics
{
  v2 = [(W5DiagnosticsModeManager *)self store];
  v3 = [v2 diagnosticsModeWithState:3];

  return (NSArray *)v3;
}

- (id)finishedDiagnostics
{
  v2 = [(W5DiagnosticsModeManager *)self store];
  v3 = [v2 diagnosticsModeWithState:11];

  return v3;
}

- (NSArray)allDiagnostics
{
  v2 = [(W5DiagnosticsModeManager *)self store];
  v3 = [v2 diagnostics];
  id v4 = [v3 allObjects];

  return (NSArray *)v4;
}

- (void)_finishedProcessingDiagnosticMode:(id)a3
{
  id v4 = a3;
  id v5 = [(W5DiagnosticsModeManager *)self store];
  [v5 updateStoreWithDiagnosticsMode:v4];
}

- (W5Peer)localPeer
{
  return self->_localPeer;
}

- (void)setLocalPeer:(id)a3
{
}

- (W5DiagnosticsModePeer)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (int64_t)role
{
  return self->_role;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setRegisteredPeers:(id)a3
{
}

- (W5FaultEventManager)faultEventManager
{
  return self->_faultEventManager;
}

- (void)setFaultEventManager:(id)a3
{
}

- (W5NetUsageManager)netUsageManager
{
  return self->_netUsageManager;
}

- (void)setNetUsageManager:(id)a3
{
}

- (W5PeerManager)peerManager
{
  return self->_peerManager;
}

- (void)setPeerManager:(id)a3
{
}

- (W5WiFiSniffManager)snifferManager
{
  return self->_snifferManager;
}

- (void)setSnifferManager:(id)a3
{
}

- (W5LogManager)logManager
{
  return self->_logManager;
}

- (void)setLogManager:(id)a3
{
}

- (NSUUID)stopNotificationUUID
{
  return self->_stopNotificationUUID;
}

- (void)setStopNotificationUUID:(id)a3
{
}

- (NSMutableDictionary)lastNotificationTimestamp
{
  return self->_lastNotificationTimestamp;
}

- (void)setLastNotificationTimestamp:(id)a3
{
}

- (W5DiagnosticsModeStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (W5DiagnosticsModeLocalStore)localStore
{
  return self->_localStore;
}

- (void)setLocalStore:(id)a3
{
}

- (NSMutableArray)processors
{
  return self->_processors;
}

- (void)setProcessors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processors, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_lastNotificationTimestamp, 0);
  objc_storeStrong((id *)&self->_stopNotificationUUID, 0);
  objc_storeStrong((id *)&self->_logManager, 0);
  objc_storeStrong((id *)&self->_snifferManager, 0);
  objc_storeStrong((id *)&self->_peerManager, 0);
  objc_storeStrong((id *)&self->_netUsageManager, 0);
  objc_storeStrong((id *)&self->_faultEventManager, 0);
  objc_storeStrong((id *)&self->_registeredPeers, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_localPeer, 0);
  objc_storeStrong((id *)&self->_statusManager, 0);

  objc_storeStrong((id *)&self->_userNotificationManager, 0);
}

@end