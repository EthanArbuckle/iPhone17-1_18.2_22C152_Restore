@interface W5Engine
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (W5Engine)init;
- (id)__localPeer;
- (id)__model;
- (id)_peerListeners;
- (void)__cancelCollectLogsWithUUID:(id)a3 reply:(id)a4;
- (void)__cancelDiagnosticsWithUUID:(id)a3 reply:(id)a4;
- (void)__cancelPeerDiscoveryWithUUID:(id)a3;
- (void)__cancelWiFiPerfLoggingWithUUID:(id)a3 reply:(id)a4;
- (void)__cancelWiFiSnifferWithUUID:(id)a3 peer:(id)a4 reply:(id)a5;
- (void)__cancelWiFiSnifferWithUUID:(id)a3 reply:(id)a4;
- (void)__collectLogItem:(id)a3 reply:(id)a4;
- (void)__collectLogs:(id)a3 configuration:(id)a4 additionalLog:(id)a5 filename:(id)a6 uid:(unsigned int)a7 gid:(unsigned int)a8 uuid:(id)a9 reply:(id)a10;
- (void)__collectLogsDiagnosticMode:(id)a3 outputName:(id)a4 uid:(unsigned int)a5 gid:(unsigned int)a6 uuid:(id)a7 reply:(id)a8;
- (void)__collectedLogItem:(id)a3;
- (void)__completedDiagnosticsTest:(id)a3;
- (void)__queryDatabaseAndReply:(id)a3 reply:(id)a4;
- (void)__queryDebugConfigurationAndReply:(id)a3;
- (void)__queryStatusAndReply:(id)a3;
- (void)__runDiagnostics:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)__runWiFiPerfLoggingWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)__runWiFiSnifferOnChannel:(id)a3 duration:(double)a4 uuid:(id)a5 tcpDump:(BOOL)a6 reply:(id)a7;
- (void)__runWiFiSnifferOnPeer:(id)a3 channels:(id)a4 duration:(double)a5 uuid:(id)a6 reply:(id)a7;
- (void)__setDebugConfiguration:(id)a3 reply:(id)a4;
- (void)__setupCallbacks;
- (void)__updateStatusMonitoring;
- (void)__updatedStatusWithEvent:(id)a3;
- (void)_scheduleRepeatingCleanupTasks;
- (void)dealloc;
- (void)run;
- (void)terminateAndNotify:(id)a3;
- (void)xpcConnection:(id)a3 cancelCollectLogsWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 cancelDiagnosticsWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 cancelWiFiPerformanceLoggingWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 cancelWiFiSnifferWithUUID:(id)a4 peer:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 cancelWiFiSnifferWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 collectLogs:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7;
- (void)xpcConnection:(id)a3 collectLogsDiagnosticMode:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 listFilesFromPeer:(id)a4 remoteDirPath:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 queryDatabaseForPeer:(id)a4 fetch:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 queryDebugConfigurationForPeer:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 queryDiagnosticsModeForPeer:(id)a4 info:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 queryFaultEventCacheForPeer:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 queryLocalPeerAndReply:(id)a4;
- (void)xpcConnection:(id)a3 queryRegisteredDiagnosticsPeersWithReply:(id)a4;
- (void)xpcConnection:(id)a3 queryStatusForPeer:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 registerRemoteDiagnosticEventsForPeer:(id)a4 configuration:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 requestFileFromPeer:(id)a4 remoteFilePath:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 runDiagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7;
- (void)xpcConnection:(id)a3 runDiagnosticsForPeer:(id)a4 diagnostics:(id)a5 configuration:(id)a6 uuid:(id)a7 reply:(id)a8;
- (void)xpcConnection:(id)a3 runWiFiPerformanceLoggingWithConfiguration:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 runWiFiSnifferOnChannels:(id)a4 duration:(double)a5 peer:(id)a6 uuid:(id)a7 reply:(id)a8;
- (void)xpcConnection:(id)a3 runWiFiSnifferWithTCPDumpOnChannels:(id)a4 duration:(double)a5 peer:(id)a6 uuid:(id)a7 reply:(id)a8;
- (void)xpcConnection:(id)a3 setDebugConfiguration:(id)a4 peer:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 startDiagnosticsModeWithConfiguration:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 startMonitoringEvents:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 startMonitoringFaultEventsForPeer:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 startPeerDiscoveryWithConfiguration:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 stopDiagnosticsModeWithUUID:(id)a4 info:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 stopMonitoringEvents:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 stopMonitoringFaultEventsForPeer:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 stopPeerDiscoveryWithUUID:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 submitFaultEvent:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 unregisterRemoteDiagnosticEventsForPeer:(id)a4 configuration:(id)a5 reply:(id)a6;
@end

@implementation W5Engine

- (W5Engine)init
{
  v26.receiver = self;
  v26.super_class = (Class)W5Engine;
  v2 = [(W5Engine *)&v26 init];
  if (!v2) {
    goto LABEL_72;
  }
  v3 = dispatch_queue_create("com.apple.wifivelocity.engine", 0);
  v2->_queue = (OS_dispatch_queue *)v3;
  if (!v3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "nil disaptch_queue";
LABEL_71:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] %s", buf, 0xCu);
    goto LABEL_72;
  }
  dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0);
  v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v2->_xpcConnections = v4;
  if (!v4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "nil XPC Connections List";
    goto LABEL_71;
  }
  v5 = objc_alloc_init(W5StatusManager);
  v2->_status = v5;
  if (!v5)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "nil W5StatusManager";
    goto LABEL_71;
  }
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    v6 = [[W5PeerDiagnosticsManager alloc] initWithStatusManager:v2->_status];
    v2->_peerDiagnostics = v6;
    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "nil W5StatusManager";
        goto LABEL_71;
      }
      goto LABEL_72;
    }
  }
  else
  {
    v23 = sub_10009756C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "-[W5Engine init]";
      __int16 v29 = 2080;
      v30 = "W5Engine.m";
      __int16 v31 = 1024;
      int v32 = 134;
      LODWORD(v25) = 28;
      v24 = buf;
      _os_log_send_and_compose_impl();
    }
  }
  v7 = [[W5DiagnosticsManager alloc] initWithStatusManager:v2->_status peerDiagnosticsManager:v2->_peerDiagnostics];
  v2->_diagnostics = v7;
  if (!v7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "nil W5DiagnosticsManager";
    goto LABEL_71;
  }
  v8 = objc_alloc_init(W5UserNotificationManager);
  v2->_notificationManager = v8;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "nil W5UserNotificationManager";
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] %s", buf, 0xCu);
  }
  if (+[W5FeatureAvailability diagnosticsModeEnabled])
  {
    v9 = objc_alloc_init(W5BGTaskManager);
    v2->_bgTaskManager = v9;
    if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "nil W5BGTaskManager";
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] %s", buf, 0xCu);
    }
  }
  v10 = [[W5WiFiSniffManager alloc] initWithStatusManager:v2->_status andUserNotificationManager:v2->_notificationManager];
  v2->_sniff = v10;
  if (!v10)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "nil W5StatusManager";
    goto LABEL_71;
  }
  v11 = objc_alloc_init(W5FileTransferManager);
  v2->_transferManager = v11;
  if (!v11)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "nil W5FileTransferManager";
    goto LABEL_71;
  }
  v12 = objc_alloc_init(W5NetUsageManager);
  v2->_netUsageManager = v12;
  if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "nil W5NetUsageManager";
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] %s", buf, 0xCu);
  }
  v13 = objc_alloc_init(W5PeerManager);
  v2->_peerManager = v13;
  if (!v13)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "nil W5PeerManager";
    goto LABEL_71;
  }
  v14 = [[W5LogManager alloc] initWithStatusManager:v2->_status diagnosticsManager:v2->_diagnostics peerDiagnosticsManager:v2->_peerDiagnostics];
  v2->_log = v14;
  if (!v14)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "nil W5LogManager";
    goto LABEL_71;
  }
  v15 = [[W5DiagnosticsModeManager alloc] initWithNetUsageManager:v2->_netUsageManager peerManager:v2->_peerManager userNotificationManager:v2->_notificationManager snifferManager:v2->_sniff statusManager:v2->_status logManager:v2->_log];
  v2->_diagnosticsModeManager = v15;
  if (!v15)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "nil W5DiagnosticsModeManager";
    goto LABEL_71;
  }
  v16 = [[W5DebugManager alloc] initWithDiagnosticsModeManager:v2->_diagnosticsModeManager statusManager:v2->_status];
  v2->_debug = v16;
  if (!v16)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "nil W5DebugManager";
    goto LABEL_71;
  }
  v17 = [[W5WiFiConnectionMonitor alloc] initWithStatusManager:v2->_status diagnosticsManager:v2->_diagnostics];
  v2->_monitor = v17;
  if (!v17)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "nil W5WiFiConnectionMonitor";
    goto LABEL_71;
  }
  v18 = [[W5WiFiPerfLoggingManager alloc] initWithStatusManager:v2->_status];
  v2->_wifiperf = v18;
  if (!v18)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "nil W5WiFiPerfLoggingManager";
    goto LABEL_71;
  }
  v19 = [[W5FaultEventManager alloc] initWithPeerManager:v2->_peerManager diagnosticsModeManager:v2->_diagnosticsModeManager];
  v2->_faultEventManager = v19;
  if (!v19)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "nil W5FaultEventManager";
    goto LABEL_71;
  }
  [(W5FaultEventManager *)v2->_faultEventManager setLocalPeer:[(W5Engine *)v2 __localPeer]];
  [(W5DiagnosticsModeManager *)v2->_diagnosticsModeManager setLocalPeer:[(W5Engine *)v2 __localPeer]];
  [(W5DiagnosticsModeManager *)v2->_diagnosticsModeManager setFaultEventManager:v2->_faultEventManager];
  [(W5StatusManager *)v2->_status setDiagnosticsModeManager:v2->_diagnosticsModeManager];
  if (+[W5FeatureAvailability diagnosticsModeEnabled])
  {
    v20 = +[W5DatabaseManager sharedObject];
    v2->_databaseManager = v20;
    if (!v20)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "nil _databaseManager";
        goto LABEL_71;
      }
      goto LABEL_72;
    }
  }
  v21 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.wifivelocityd"];
  v2->_listener = v21;
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "nil NSXPCListener";
      goto LABEL_71;
    }
LABEL_72:

    return 0;
  }
  if (![(W5PeerManager *)v2->_peerManager registerPeerListeners:[(W5Engine *)v2 _peerListeners]]&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "Failed to register peer listeners";
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] %s", buf, 0xCu);
  }
  [(NSXPCListener *)v2->_listener setDelegate:v2];
  if (v2->_bgTaskManager) {
    [(W5Engine *)v2 _scheduleRepeatingCleanupTasks];
  }
  return v2;
}

- (void)dealloc
{
  notificationManager = self->_notificationManager;
  if (notificationManager) {

  }
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  isMonitoringTransaction = self->_isMonitoringTransaction;
  if (isMonitoringTransaction)
  {

    self->_isMonitoringTransaction = 0;
  }
  isMonitoringConnectionTransaction = self->_isMonitoringConnectionTransaction;
  if (isMonitoringConnectionTransaction)
  {

    self->_isMonitoringConnectionTransaction = 0;
  }

  bgTaskManager = self->_bgTaskManager;
  if (bgTaskManager) {

  }
  v8.receiver = self;
  v8.super_class = (Class)W5Engine;
  [(W5Engine *)&v8 dealloc];
}

- (void)run
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028AA4;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
  [+[NSRunLoop currentRunLoop] run];
}

- (void)terminateAndNotify:(id)a3
{
  v5 = dispatch_semaphore_create(0);
  sniff = self->_sniff;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100028D80;
  v14[3] = &unk_1000DDC80;
  v14[4] = v5;
  [(W5WiFiSniffManager *)sniff teardownAndNotify:v14];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  log = self->_log;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100028D88;
  v13[3] = &unk_1000DDC80;
  v13[4] = v5;
  [(W5LogManager *)log teardownAndNotify:v13];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  [(W5LogManager *)self->_log setCollectedItemCallback:0];
  [(W5LogManager *)self->_log setPingCallback:0];
  diagnostics = self->_diagnostics;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100028D90;
  v12[3] = &unk_1000DDC80;
  v12[4] = v5;
  [(W5DiagnosticsManager *)diagnostics teardownAndNotify:v12];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  [(W5DiagnosticsManager *)self->_diagnostics setPingCallback:0];
  [(W5DiagnosticsManager *)self->_diagnostics setCompletedTestCallback:0];
  wifiperf = self->_wifiperf;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100028D98;
  v11[3] = &unk_1000DDC80;
  v11[4] = v5;
  [(W5WiFiPerfLoggingManager *)wifiperf teardownAndNotify:v11];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  [(W5StatusManager *)self->_status stopEventMonitoring];
  [(W5StatusManager *)self->_status setUpdatedWiFiCallback:0];
  [(W5StatusManager *)self->_status setUpdatedBluetoothCallback:0];
  [(W5StatusManager *)self->_status setUpdatedAWDLStatusCallback:0];
  [(W5StatusManager *)self->_status setUpdatedWiFiStatusCallback:0];
  [(W5StatusManager *)self->_status setUpdatedBluetoothStatusCallback:0];
  [(W5StatusManager *)self->_status setUpdatedPowerSourceCallback:0];
  [(W5StatusManager *)self->_status setUpdatedNetworkStatusCallback:0];
  [(W5StatusManager *)self->_status setUpdatedPowerManagementCallback:0];
  [(W5StatusManager *)self->_status setUpdatedPowerStatusCallback:0];
  [(W5StatusManager *)self->_status setLowBatteryCallback:0];
  [(W5WiFiConnectionMonitor *)self->_monitor stopMonitoring];
  [(W5WiFiConnectionMonitor *)self->_monitor setDroppedWiFiConnectionCallback:0];
  [(W5FaultEventManager *)self->_faultEventManager invalidate];
  bgTaskManager = self->_bgTaskManager;
  if (bgTaskManager) {
    [(W5BGTaskManager *)bgTaskManager stopAllRepeatingTasks];
  }
  if (v5) {
    dispatch_release(v5);
  }
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)__model
{
  CFDictionaryRef v2 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (!MatchingService) {
    return 0;
  }
  io_object_t v4 = MatchingService;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"model", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFDataRef v6 = CFProperty;
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"%@", +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", CFDataGetBytePtr(CFProperty), 4)];
    CFRelease(v6);
  }
  else
  {
    id v7 = 0;
  }
  IOObjectRelease(v4);
  return v7;
}

- (id)__localPeer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028F28;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  if (qword_1001036A0 != -1) {
    dispatch_once(&qword_1001036A0, block);
  }
  return [(W5Peer *)self->_localPeer copy];
}

- (void)__updateStatusMonitoring
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  xpcConnections = self->_xpcConnections;
  id v4 = [(NSMutableArray *)xpcConnections countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    char v7 = 0;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(xpcConnections);
      }
      v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      v7 |= [[[v10 eventIDs] count] != 0];
      v6 |= [objc_msgSend(objc_msgSend(v10, "eventIDs")) containsObject:&off_1000EADC8];
      if (v7 & 1) != 0 && (v6) {
        break;
      }
      if (v5 == (id)++v9)
      {
        id v5 = [(NSMutableArray *)xpcConnections countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v5) {
          goto LABEL_3;
        }
        p_isMonitoring = &self->_isMonitoring;
        if (self->_isMonitoring != (v7 & 1))
        {
          if ((v7 & 1) == 0) {
            goto LABEL_18;
          }
          goto LABEL_21;
        }
        goto LABEL_23;
      }
    }
    p_isMonitoring = &self->_isMonitoring;
    if (!self->_isMonitoring)
    {
      LOBYTE(v6) = 1;
LABEL_21:
      [(W5StatusManager *)self->_status startEventMonitoring];
      v14 = (OS_os_transaction *)os_transaction_create();
      [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager")] osTransactionCreate:@"com.apple.wifivelocity.monitoring" transaction:v14];
      self->_isMonitoringTransaction = v14;
      LOBYTE(isMonitoringTransaction) = 1;
      goto LABEL_22;
    }
    p_isMonitoringWiFiConnection = &self->_isMonitoringWiFiConnection;
    if (self->_isMonitoringWiFiConnection) {
      return;
    }
    goto LABEL_25;
  }
  p_isMonitoring = &self->_isMonitoring;
  if (!self->_isMonitoring)
  {
    p_isMonitoringWiFiConnection = &self->_isMonitoringWiFiConnection;
    if (!self->_isMonitoringWiFiConnection) {
      return;
    }
    goto LABEL_27;
  }
  LOBYTE(v6) = 0;
LABEL_18:
  [(W5StatusManager *)self->_status stopEventMonitoring];
  isMonitoringTransaction = self->_isMonitoringTransaction;
  if (isMonitoringTransaction)
  {
    [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionComplete:self->_isMonitoringTransaction];

    LOBYTE(isMonitoringTransaction) = 0;
    self->_isMonitoringTransaction = 0;
  }
LABEL_22:
  BOOL *p_isMonitoring = (char)isMonitoringTransaction;
LABEL_23:
  p_isMonitoringWiFiConnection = &self->_isMonitoringWiFiConnection;
  if (self->_isMonitoringWiFiConnection != (v6 & 1))
  {
    if (v6)
    {
LABEL_25:
      [(W5WiFiConnectionMonitor *)self->_monitor startMonitoring];
      v15 = (OS_os_transaction *)os_transaction_create();
      [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionCreate:@"com.apple.wifivelocity.monitoring_connection" transaction:v15];
      self->_isMonitoringConnectionTransaction = v15;
      LOBYTE(isMonitoringConnectionTransaction) = 1;
LABEL_29:
      BOOL *p_isMonitoringWiFiConnection = (char)isMonitoringConnectionTransaction;
      return;
    }
LABEL_27:
    [(W5WiFiConnectionMonitor *)self->_monitor stopMonitoring];
    isMonitoringConnectionTransaction = self->_isMonitoringConnectionTransaction;
    if (isMonitoringConnectionTransaction)
    {
      [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionComplete:self->_isMonitoringConnectionTransaction];

      LOBYTE(isMonitoringConnectionTransaction) = 0;
      self->_isMonitoringConnectionTransaction = 0;
    }
    goto LABEL_29;
  }
}

- (void)__queryStatusAndReply:(id)a3
{
}

- (void)__queryDebugConfigurationAndReply:(id)a3
{
}

- (void)__setDebugConfiguration:(id)a3 reply:(id)a4
{
}

- (void)__runDiagnostics:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  v11 = objc_alloc_init(W5DiagnosticsTestRequestInternal);
  [(W5DiagnosticsTestRequestInternal *)v11 setUuid:a5];
  [(W5DiagnosticsTestRequestInternal *)v11 setTestRequests:a3];
  [(W5DiagnosticsTestRequestInternal *)v11 setConfiguration:a4];
  -[W5DiagnosticsTestRequestInternal setIncludeEvents:](v11, "setIncludeEvents:", [objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"IncludeEvents"), "BOOLValue") boolValue]);
  [(W5DiagnosticsTestRequestInternal *)v11 setReply:a6];
  diagnostics = self->_diagnostics;

  [(W5DiagnosticsManager *)diagnostics addRequest:v11];
}

- (void)__cancelDiagnosticsWithUUID:(id)a3 reply:(id)a4
{
}

- (void)__collectLogs:(id)a3 configuration:(id)a4 additionalLog:(id)a5 filename:(id)a6 uid:(unsigned int)a7 gid:(unsigned int)a8 uuid:(id)a9 reply:(id)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v11 = *(void *)&a7;
  id v17 = [a4 mutableCopy];
  if ([[self->_debug queryDebugConfigurationAndReturnError:0] megaWiFiProfile] == (id)1)[v17 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseMegaWiFiProfileLimits"]; {
  long long v18 = objc_alloc_init(W5LogItemRequestInternal);
  }
  [(W5LogItemRequestInternal *)v18 setUuid:a9];
  [(W5LogItemRequestInternal *)v18 setItemRequests:a3];
  [(W5LogItemRequestInternal *)v18 setConfiguration:v17];
  [(W5LogItemRequestInternal *)v18 setFilename:a6];
  [(W5LogItemRequestInternal *)v18 setAdditionalLog:a5];
  [(W5LogItemRequestInternal *)v18 setUid:v11];
  [(W5LogItemRequestInternal *)v18 setGid:v10];
  -[W5LogItemRequestInternal setIncludeEvents:](v18, "setIncludeEvents:", [objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"IncludeEvents"), "BOOLValue")]);
  [(W5LogItemRequestInternal *)v18 setAddedAt:+[NSDate date]];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000295A8;
  v19[3] = &unk_1000DDD58;
  v19[5] = self;
  v19[6] = a10;
  v19[4] = a4;
  [(W5LogItemRequestInternal *)v18 setReply:v19];
  [(W5LogManager *)self->_log addRequest:v18];
}

- (void)__collectLogsDiagnosticMode:(id)a3 outputName:(id)a4 uid:(unsigned int)a5 gid:(unsigned int)a6 uuid:(id)a7 reply:(id)a8
{
  id v12 = [a3 mutableCopy];
  if ([[self->_debug queryDebugConfigurationAndReturnError:0] megaWiFiProfile] == (id)1)[[v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseMegaWiFiProfileLimits"];
  diagnosticsModeManager = self->_diagnosticsModeManager;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100029970;
  v14[3] = &unk_1000DDD80;
  v14[4] = a8;
  [(W5DiagnosticsModeManager *)diagnosticsModeManager collectLogsDiagnosticMode:a3 outputName:a4 reply:v14];
}

- (void)__cancelCollectLogsWithUUID:(id)a3 reply:(id)a4
{
}

- (void)__runWiFiSnifferOnPeer:(id)a3 channels:(id)a4 duration:(double)a5 uuid:(id)a6 reply:(id)a7
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100029A80;
  v9[3] = &unk_1000DDDA8;
  v9[4] = a7;
  id v8 = [(W5PeerManager *)self->_peerManager runSnifferAtPeerWithRequest:[[W5PeerSnifferRequest alloc] initWithPeer:a3 requestType:1 duration:0 uuid:a4 channels:0 config:v9 reply:a5]];
  if (a7)
  {
    if (v8) {
      (*((void (**)(id, id, void, void, void))a7 + 2))(a7, v8, 0, 0, 0);
    }
  }
}

- (void)__runWiFiSnifferOnChannel:(id)a3 duration:(double)a4 uuid:(id)a5 tcpDump:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  id v13 = objc_alloc_init((Class)NSDateFormatter);
  [v13 setDateFormat:@"yyyy-MM-dd_HH.mm.ss.SSS"];
  v14 = [[+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/var/run/com.apple.wifivelocity") URLByAppendingPathComponent:][NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_ch%li_%@.pcap", objc_msgSend(-[W5Engine __localPeer](self, "__localPeer"), "name"), objc_msgSend(a3, "channel"), objc_msgSend(v13, "stringFromDate:", +[NSDate date](NSDate, "date")));
  v15 = objc_alloc_init(W5WiFiSnifferRequest);
  [(W5WiFiSnifferRequest *)v15 setUuid:a5];
  [(W5WiFiSnifferRequest *)v15 setChannel:a3];
  [(W5WiFiSnifferRequest *)v15 setDuration:a4];
  [(W5WiFiSnifferRequest *)v15 setOutputFile:v14];
  [(W5WiFiSnifferRequest *)v15 setMonitorMode:a3 != 0];
  [(W5WiFiSnifferRequest *)v15 setTcpDump:v8];
  [(W5WiFiSnifferRequest *)v15 setNoAutoStop:0];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100029D04;
  v17[3] = &unk_1000DDDD0;
  v17[4] = v14;
  v17[5] = a7;
  [(W5WiFiSnifferRequest *)v15 setReply:v17];
  [(W5WiFiSniffManager *)self->_sniff addRequest:v15];
  v16 = sub_10009756C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138544130;
    id v19 = a5;
    __int16 v20 = 2114;
    id v21 = a3;
    __int16 v22 = 2048;
    uint64_t v23 = (uint64_t)a4;
    __int16 v24 = 2114;
    uint64_t v25 = v14;
    _os_log_send_and_compose_impl();
  }
}

- (void)__cancelWiFiSnifferWithUUID:(id)a3 reply:(id)a4
{
}

- (void)__cancelWiFiSnifferWithUUID:(id)a3 peer:(id)a4 reply:(id)a5
{
  if (a4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100029E44;
    v7[3] = &unk_1000DDDA8;
    v7[4] = a5;
    id v6 = [(W5PeerManager *)self->_peerManager runSnifferAtPeerWithRequest:[[W5PeerSnifferRequest alloc] initWithPeer:a4 requestType:2 duration:a3 uuid:0 channels:0 config:v7 reply:0.0]];
    if (a5)
    {
      if (v6) {
        (*((void (**)(id, id))a5 + 2))(a5, v6);
      }
    }
  }
  else
  {
    [(W5Engine *)self __cancelWiFiSnifferWithUUID:a3 reply:a5];
  }
}

- (void)__runWiFiPerfLoggingWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5
{
  uint64_t v9 = objc_alloc_init(W5WiFiPerfLoggingRequest);
  [(W5WiFiPerfLoggingRequest *)v9 setUuid:a4];
  [(W5WiFiPerfLoggingRequest *)v9 setConfiguration:a3];
  [(W5WiFiPerfLoggingRequest *)v9 setReply:a5];
  wifiperf = self->_wifiperf;

  [(W5WiFiPerfLoggingManager *)wifiperf addRequest:v9];
}

- (void)__cancelWiFiPerfLoggingWithUUID:(id)a3 reply:(id)a4
{
}

- (void)__queryDatabaseAndReply:(id)a3 reply:(id)a4
{
}

- (void)__updatedStatusWithEvent:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  xpcConnections = self->_xpcConnections;
  id v5 = [(NSMutableArray *)xpcConnections countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(xpcConnections);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([objc_msgSend(objc_msgSend(v9, "eventIDs"), "containsObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "eventID")))])[objc_msgSend(objc_msgSend(v9, "connection"), "remoteObjectProxy") receivedEvent:a3]; {
      }
        }
      id v6 = [(NSMutableArray *)xpcConnections countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)__completedDiagnosticsTest:(id)a3
{
  id v4 = [[objc_msgSend(a3, "info") objectForKeyedSubscript:@"UUID"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  xpcConnections = self->_xpcConnections;
  id v6 = [(NSMutableArray *)xpcConnections countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v24;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(xpcConnections);
        }
        if (v8)
        {
LABEL_17:
          char v8 = 1;
        }
        else
        {
          long long v11 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v10);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v12 = [v11 activeRequests];
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v20;
            while (2)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "uuid"), "isEqual:", v4))
                {
                  [objc_msgSend(objc_msgSend(objc_msgSend(v11, "connection"), "remoteObjectProxy"), "receivedEvent:", a3];
                  goto LABEL_17;
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
              char v8 = 0;
              if (v14) {
                continue;
              }
              break;
            }
          }
          else
          {
            char v8 = 0;
          }
        }
        long long v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      id v17 = [(NSMutableArray *)xpcConnections countByEnumeratingWithState:&v23 objects:v28 count:16];
      id v7 = v17;
    }
    while (v17);
  }
}

- (void)__collectedLogItem:(id)a3
{
  id v4 = [[objc_msgSend(a3, "info") objectForKeyedSubscript:@"UUID"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  xpcConnections = self->_xpcConnections;
  id v6 = [(NSMutableArray *)xpcConnections countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v24;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(xpcConnections);
        }
        if (v8)
        {
LABEL_17:
          char v8 = 1;
        }
        else
        {
          long long v11 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v10);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v12 = [v11 activeRequests];
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v20;
            while (2)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "uuid"), "isEqual:", v4))
                {
                  [objc_msgSend(objc_msgSend(objc_msgSend(v11, "connection"), "remoteObjectProxy"), "receivedEvent:", a3];
                  goto LABEL_17;
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
              char v8 = 0;
              if (v14) {
                continue;
              }
              break;
            }
          }
          else
          {
            char v8 = 0;
          }
        }
        long long v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      id v17 = [(NSMutableArray *)xpcConnections countByEnumeratingWithState:&v23 objects:v28 count:16];
      id v7 = v17;
    }
    while (v17);
  }
}

- (void)__collectLogItem:(id)a3 reply:(id)a4
{
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A46C;
  v7[3] = &unk_1000DDC08;
  v7[4] = a3;
  void v7[5] = a4;
  dispatch_async(global_queue, v7);
}

- (void)__setupCallbacks
{
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3052000000;
  v29[3] = sub_100029730;
  v29[4] = sub_100029740;
  v29[5] = self;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3052000000;
  v28[3] = sub_100029730;
  queue = self->_queue;
  status = self->_status;
  v28[4] = sub_100029740;
  v28[5] = queue;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3052000000;
  v27[3] = sub_100029730;
  v27[4] = sub_100029740;
  v27[5] = status;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3052000000;
  v26[3] = sub_100029730;
  monitor = self->_monitor;
  v26[4] = sub_100029740;
  v26[5] = monitor;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002AD50;
  v25[3] = &unk_1000DDDF8;
  v25[4] = v28;
  v25[5] = v29;
  [(W5StatusManager *)status setUpdatedWiFiStatusCallback:v25];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002AE1C;
  v24[3] = &unk_1000DDDF8;
  v24[4] = v28;
  v24[5] = v29;
  [(W5StatusManager *)self->_status setUpdatedAWDLStatusCallback:v24];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002AEE8;
  v23[3] = &unk_1000DDDF8;
  v23[4] = v28;
  v23[5] = v29;
  [(W5StatusManager *)self->_status setUpdatedBluetoothStatusCallback:v23];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002AFB4;
  v22[3] = &unk_1000DDDF8;
  v22[4] = v28;
  v22[5] = v29;
  [(W5StatusManager *)self->_status setUpdatedNetworkStatusCallback:v22];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002B080;
  v21[3] = &unk_1000DDDF8;
  v21[4] = v28;
  v21[5] = v29;
  [(W5StatusManager *)self->_status setUpdatedPowerStatusCallback:v21];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002B14C;
  v20[3] = &unk_1000DDE20;
  v20[4] = v28;
  v20[5] = v27;
  v20[6] = v26;
  v20[7] = v29;
  [(W5StatusManager *)self->_status setUpdatedWiFiCallback:v20];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002B29C;
  v19[3] = &unk_1000DDDF8;
  v19[4] = v28;
  v19[5] = v29;
  [(W5StatusManager *)self->_status setUpdatedBluetoothCallback:v19];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002B368;
  v18[3] = &unk_1000DDE20;
  v18[4] = v28;
  v18[5] = v27;
  v18[6] = v26;
  v18[7] = v29;
  [(W5StatusManager *)self->_status setUpdatedPowerManagementCallback:v18];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002B4A8;
  v17[3] = &unk_1000DDDF8;
  v17[4] = v28;
  v17[5] = v29;
  [(W5StatusManager *)self->_status setUpdatedPowerSourceCallback:v17];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002B574;
  v16[3] = &unk_1000DDDF8;
  v16[4] = v28;
  v16[5] = v29;
  [(W5StatusManager *)self->_status setLowBatteryCallback:v16];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002B640;
  v15[3] = &unk_1000DDDF8;
  v15[4] = v28;
  v15[5] = v29;
  [(W5StatusManager *)self->_status setUpdatedFaultsCallback:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002B70C;
  v14[3] = &unk_1000DDDF8;
  v14[4] = v28;
  void v14[5] = v29;
  [(W5StatusManager *)self->_status setUpdatedLinkTestsCallback:v14];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002B7D8;
  v13[3] = &unk_1000DDDF8;
  v13[4] = v28;
  void v13[5] = v29;
  [(W5StatusManager *)self->_status setUpdatedRecoveriesCallback:v13];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002B8A4;
  v12[3] = &unk_1000DDE70;
  v12[4] = v28;
  void v12[5] = v29;
  [(W5DiagnosticsManager *)self->_diagnostics setCompletedTestCallback:v12];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002BA2C;
  v11[3] = &unk_1000DDEC0;
  v11[4] = v28;
  void v11[5] = v27;
  v11[6] = v29;
  [(W5DiagnosticsManager *)self->_diagnostics setPingCallback:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002BB10;
  v10[3] = &unk_1000DDEE8;
  v10[4] = v28;
  v10[5] = v29;
  [(W5LogManager *)self->_log setCollectedItemCallback:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002BC98;
  v9[3] = &unk_1000DDF38;
  v9[4] = v28;
  void v9[5] = v29;
  [(W5LogManager *)self->_log setCollectLogItemCallback:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002BD6C;
  v8[3] = &unk_1000DDEC0;
  v8[4] = v28;
  v8[5] = v27;
  v8[6] = v29;
  [(W5LogManager *)self->_log setPingCallback:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002BE50;
  v7[3] = &unk_1000DDEC0;
  v7[4] = v28;
  void v7[5] = v27;
  void v7[6] = v29;
  [(W5WiFiConnectionMonitor *)self->_monitor setDroppedWiFiConnectionCallback:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002BF34;
  v6[3] = &unk_1000DDF60;
  v6[4] = self;
  v6[5] = v28;
  [(W5FaultEventManager *)self->_faultEventManager setFaultEventHandler:v6];
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);
}

- (void)xpcConnection:(id)a3 startMonitoringEvents:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002C16C;
  v6[3] = &unk_1000DDC08;
  v6[4] = self;
  v6[5] = a5;
  dispatch_async(queue, v6);
}

- (void)xpcConnection:(id)a3 stopMonitoringEvents:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002C23C;
  v6[3] = &unk_1000DDC08;
  v6[4] = self;
  v6[5] = a5;
  dispatch_async(queue, v6);
}

- (void)xpcConnection:(id)a3 queryLocalPeerAndReply:(id)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002C30C;
  v5[3] = &unk_1000DDC08;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)xpcConnection:(id)a3 queryStatusForPeer:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C41C;
  block[3] = &unk_1000DE0A0;
  void block[5] = self;
  block[6] = a5;
  block[4] = a4;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 queryDatabaseForPeer:(id)a4 fetch:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C6C8;
  v7[3] = &unk_1000DE050;
  v7[4] = a4;
  void v7[5] = self;
  void v7[6] = a5;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 requestFileFromPeer:(id)a4 remoteFilePath:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002CAF4;
  v7[3] = &unk_1000DE050;
  v7[4] = a4;
  void v7[5] = a5;
  void v7[6] = self;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 listFilesFromPeer:(id)a4 remoteDirPath:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002CCBC;
  v7[3] = &unk_1000DE050;
  v7[4] = a4;
  void v7[5] = a5;
  void v7[6] = self;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 queryDebugConfigurationForPeer:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CE3C;
  block[3] = &unk_1000DE0A0;
  void block[5] = self;
  block[6] = a5;
  block[4] = a4;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 setDebugConfiguration:(id)a4 peer:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002D0F0;
  v7[3] = &unk_1000DE118;
  v7[4] = a5;
  void v7[5] = a4;
  void v7[6] = self;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 runDiagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7
{
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002D3A0;
  v8[3] = &unk_1000DE168;
  v8[4] = a6;
  v8[5] = a3;
  v8[6] = a5;
  void v8[7] = a4;
  v8[8] = self;
  v8[9] = a7;
  dispatch_async(queue, v8);
}

- (void)xpcConnection:(id)a3 runDiagnosticsForPeer:(id)a4 diagnostics:(id)a5 configuration:(id)a6 uuid:(id)a7 reply:(id)a8
{
  long long v11 = sub_10009756C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = 136316674;
    v36 = "-[W5Engine xpcConnection:runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:]";
    __int16 v37 = 2080;
    v38 = "W5Engine.m";
    __int16 v39 = 1024;
    int v40 = 1202;
    __int16 v41 = 2114;
    id v42 = [[[a7 UUIDString] substringToIndex:5];
    __int16 v43 = 2114;
    id v44 = [a3 processName];
    __int16 v45 = 1024;
    unsigned int v46 = [[a3 connection] processIdentifier];
    __int16 v47 = 2114;
    id v48 = a6;
    LODWORD(v23) = 64;
    long long v22 = &v35;
    _os_log_send_and_compose_impl();
  }
  id v25 = a6;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = [a5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(a5);
        }
        v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v17 = sub_10009756C();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          [v16 testID];
          uint64_t v18 = W5DescriptionForDiagnosticsTestID();
          id v19 = [v16 testID];
          int v35 = 136316162;
          v36 = "-[W5Engine xpcConnection:runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:]";
          __int16 v37 = 2080;
          v38 = "W5Engine.m";
          __int16 v39 = 1024;
          int v40 = 1204;
          __int16 v41 = 2114;
          id v42 = (id)v18;
          __int16 v43 = 2048;
          id v44 = v19;
          _os_log_send_and_compose_impl();
        }
      }
      id v13 = [a5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v13);
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10002DC58;
  v29[3] = &unk_1000DE000;
  v29[4] = a8;
  long long v20 = [[W5PeerDiagnosticsRequest alloc] initWithPeer:a4 diagnostics:a5 configuration:v25 uuid:a7 reply:v29];
  id v21 = [(W5PeerManager *)self->_peerManager runDiagnosticsOnPeerWithRequest:v20];
  if (a8 && v21) {
    (*((void (**)(id, id, void))a8 + 2))(a8, v21, 0);
  }
  if (v20) {
    CFRelease(v20);
  }
}

- (void)xpcConnection:(id)a3 registerRemoteDiagnosticEventsForPeer:(id)a4 configuration:(id)a5 reply:(id)a6
{
  uint64_t v9 = 0;
  if (![(W5DiagnosticsModeManager *)self->_diagnosticsModeManager registerPeer:a4 role:16 configuration:a5 error:&v9])
  {
    char v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316162;
      long long v11 = "-[W5Engine xpcConnection:registerRemoteDiagnosticEventsForPeer:configuration:reply:]";
      __int16 v12 = 2080;
      id v13 = "W5Engine.m";
      __int16 v14 = 1024;
      int v15 = 1224;
      __int16 v16 = 2114;
      id v17 = a4;
      __int16 v18 = 2114;
      uint64_t v19 = v9;
      _os_log_send_and_compose_impl();
    }
  }
  if (a6) {
    (*((void (**)(id, uint64_t))a6 + 2))(a6, v9);
  }
}

- (void)xpcConnection:(id)a3 unregisterRemoteDiagnosticEventsForPeer:(id)a4 configuration:(id)a5 reply:(id)a6
{
  uint64_t v9 = 0;
  if (![(W5DiagnosticsModeManager *)self->_diagnosticsModeManager unregisterPeer:a4 role:16 error:&v9])
  {
    char v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316162;
      long long v11 = "-[W5Engine xpcConnection:unregisterRemoteDiagnosticEventsForPeer:configuration:reply:]";
      __int16 v12 = 2080;
      id v13 = "W5Engine.m";
      __int16 v14 = 1024;
      int v15 = 1234;
      __int16 v16 = 2114;
      id v17 = a4;
      __int16 v18 = 2114;
      uint64_t v19 = v9;
      _os_log_send_and_compose_impl();
    }
  }
  if (a6) {
    (*((void (**)(id, uint64_t))a6 + 2))(a6, v9);
  }
}

- (void)xpcConnection:(id)a3 queryRegisteredDiagnosticsPeersWithReply:(id)a4
{
  if (a4)
  {
    id v5 = [(W5DiagnosticsModeManager *)self->_diagnosticsModeManager registeredPeersForFaultType:0x7FFFFFFFFFFFFFFFLL];
    id v6 = (void (*)(id, void, id))*((void *)a4 + 2);
    v6(a4, 0, v5);
  }
}

- (void)xpcConnection:(id)a3 startDiagnosticsModeWithConfiguration:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002DFB0;
  v6[3] = &unk_1000DE050;
  v6[4] = a3;
  v6[5] = a4;
  void v6[6] = self;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)xpcConnection:(id)a3 stopDiagnosticsModeWithUUID:(id)a4 info:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E2B8;
  block[3] = &unk_1000DE1B8;
  block[4] = a4;
  void block[5] = a3;
  block[6] = a5;
  void block[7] = self;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 queryDiagnosticsModeForPeer:(id)a4 info:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E5BC;
  block[3] = &unk_1000DE1B8;
  block[4] = a3;
  void block[5] = a5;
  block[6] = a4;
  void block[7] = self;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 collectLogs:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7
{
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002E9D4;
  v8[3] = &unk_1000DE168;
  v8[4] = a6;
  v8[5] = a3;
  v8[6] = a5;
  void v8[7] = a4;
  v8[8] = self;
  v8[9] = a7;
  dispatch_async(queue, v8);
}

- (void)xpcConnection:(id)a3 collectLogsDiagnosticMode:(id)a4 uuid:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F0FC;
  block[3] = &unk_1000DE1B8;
  block[4] = a5;
  void block[5] = a3;
  block[6] = a4;
  void block[7] = self;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 runWiFiSnifferOnChannels:(id)a4 duration:(double)a5 peer:(id)a6 uuid:(id)a7 reply:(id)a8
{
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002F790;
  v9[3] = &unk_1000DE320;
  v9[4] = a6;
  void v9[5] = self;
  *(double *)&v9[9] = a5;
  v9[7] = a7;
  v9[8] = a8;
  void v9[6] = a4;
  dispatch_async(queue, v9);
}

- (void)xpcConnection:(id)a3 runWiFiSnifferWithTCPDumpOnChannels:(id)a4 duration:(double)a5 peer:(id)a6 uuid:(id)a7 reply:(id)a8
{
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002FCA4;
  v9[3] = &unk_1000DE320;
  v9[4] = a6;
  void v9[5] = self;
  *(double *)&v9[9] = a5;
  v9[7] = a7;
  v9[8] = a8;
  void v9[6] = a4;
  dispatch_async(queue, v9);
}

- (void)xpcConnection:(id)a3 startPeerDiscoveryWithConfiguration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030054;
  block[3] = &unk_1000DE1B8;
  block[4] = a4;
  void block[5] = a5;
  block[6] = a3;
  void block[7] = self;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 stopPeerDiscoveryWithUUID:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000302FC;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)__cancelPeerDiscoveryWithUUID:(id)a3
{
  if (-[W5PeerManager stopPeerDiscoveryWithRequestUUID:](self->_peerManager, "stopPeerDiscoveryWithRequestUUID:"))
  {
    v3 = sub_10009756C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
  }
}

- (void)xpcConnection:(id)a3 runWiFiPerformanceLoggingWithConfiguration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000304C8;
  v7[3] = &unk_1000DE050;
  v7[4] = self;
  void v7[5] = a4;
  void v7[6] = a5;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 cancelDiagnosticsWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000306A0;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  void block[5] = a4;
  block[6] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 cancelCollectLogsWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030878;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  void block[5] = a4;
  block[6] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 cancelWiFiSnifferWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030A50;
  v7[3] = &unk_1000DE050;
  v7[4] = a5;
  void v7[5] = self;
  void v7[6] = a4;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 cancelWiFiSnifferWithUUID:(id)a4 peer:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030D98;
  v7[3] = &unk_1000DE050;
  v7[4] = a5;
  void v7[5] = self;
  void v7[6] = a4;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 cancelWiFiPerformanceLoggingWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000310A0;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  void block[5] = a4;
  block[6] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 startMonitoringFaultEventsForPeer:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031278;
  block[3] = &unk_1000DDC58;
  block[4] = a4;
  void block[5] = self;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 stopMonitoringFaultEventsForPeer:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003135C;
  block[3] = &unk_1000DDC58;
  block[4] = a4;
  void block[5] = self;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 submitFaultEvent:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031440;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 queryFaultEventCacheForPeer:(id)a4 reply:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031518;
  block[3] = &unk_1000DDC58;
  block[4] = a4;
  void block[5] = self;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3052000000;
  v39[3] = sub_100029730;
  v39[4] = sub_100029740;
  v39[5] = a4;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3052000000;
  v36 = sub_100029730;
  __int16 v37 = sub_100029740;
  uint64_t v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3052000000;
  long long v30 = sub_100029730;
  long long v31 = sub_100029740;
  uint64_t v32 = 0;
  id v6 = [[W5XPCConnection alloc] initWithXPCConnection:a4];
  id v7 = v6;
  if (!v6)
  {
    id v17 = sub_10009756C();
    BOOL v15 = 0;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    unsigned int v18 = [a4 processIdentifier];
    int v40 = 136315906;
    __int16 v41 = "-[W5Engine listener:shouldAcceptNewConnection:]";
    __int16 v42 = 2080;
    __int16 v43 = "W5Engine.m";
    __int16 v44 = 1024;
    int v45 = 1712;
    __int16 v46 = 1024;
    LODWORD(v47) = v18;
LABEL_12:
    _os_log_send_and_compose_impl();
    BOOL v15 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(-[NSXPCConnection valueForEntitlement:](-[W5XPCConnection connection](v6, "connection"), "valueForEntitlement:", @"com.apple.private.wifivelocity"), "BOOLValue") & 1) == 0&& (objc_msgSend(-[NSXPCConnection valueForEntitlement:](-[W5XPCConnection connection](v7, "connection"), "valueForEntitlement:", @"com.apple.private.network-performance-tester"), "BOOLValue") & 1) == 0&& (objc_msgSend(-[NSXPCConnection valueForEntitlement:](-[W5XPCConnection connection](v7, "connection"), "valueForEntitlement:", @"com.apple.wifivelocity"), "BOOLValue") & 1) == 0&& (objc_msgSend(-[NSXPCConnection valueForEntitlement:](
                          [(W5XPCConnection *)v7 connection],
                          "valueForEntitlement:",
                          @"com.apple.wireless-diagnostics"),
                        "BOOLValue") & 1) == 0)
  {
    uint64_t v19 = sub_10009756C();
    BOOL v15 = 0;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    long long v20 = [(W5XPCConnection *)v7 processName];
    unsigned int v21 = [(NSXPCConnection *)[(W5XPCConnection *)v7 connection] processIdentifier];
    int v40 = 136316418;
    __int16 v41 = "-[W5Engine listener:shouldAcceptNewConnection:]";
    __int16 v42 = 2080;
    __int16 v43 = "W5Engine.m";
    __int16 v44 = 1024;
    int v45 = 1719;
    __int16 v46 = 2114;
    __int16 v47 = v20;
    __int16 v48 = 1024;
    unsigned int v49 = v21;
    __int16 v50 = 2114;
    *(void *)v51 = @"com.apple.private.wifivelocity";
    goto LABEL_12;
  }
  [(W5XPCConnection *)v7 setDelegate:self];
  [a4 setExportedInterface:sub_100033748()];
  [a4 setExportedObject:v7];
  [a4 setRemoteObjectInterface:sub_100035464()];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031B9C;
  block[3] = &unk_1000DDC30;
  block[4] = self;
  void block[5] = v7;
  dispatch_sync(queue, block);
  [(NSString *)[(W5XPCConnection *)v7 processName] utf8ValueSafe];
  uint64_t v9 = os_transaction_create();
  [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionCreate:transaction:-[NSString utf8ValueSafe](-[W5XPCConnection processName](v7, "processName"), "utf8ValueSafe"), v9];
  v28[5] = v9;
  v34[5] = (uint64_t)v7;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100031BE4;
  v25[3] = &unk_1000DE398;
  v25[4] = &v33;
  v25[5] = v39;
  [a4 setInterruptionHandler:v25];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100031D48;
  v24[3] = &unk_1000DE3C0;
  v24[4] = self;
  v24[5] = &v33;
  void v24[6] = v39;
  v24[7] = &v27;
  [a4 setInvalidationHandler:v24];
  int v10 = sub_10009756C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = [(W5XPCConnection *)v7 processName];
    unsigned int v12 = [a4 processIdentifier];
    unsigned int v13 = [a4 effectiveUserIdentifier];
    unsigned int v14 = [a4 effectiveGroupIdentifier];
    int v40 = 136316674;
    __int16 v41 = "-[W5Engine listener:shouldAcceptNewConnection:]";
    __int16 v42 = 2080;
    __int16 v43 = "W5Engine.m";
    __int16 v44 = 1024;
    int v45 = 1823;
    __int16 v46 = 2114;
    __int16 v47 = v11;
    __int16 v48 = 1024;
    unsigned int v49 = v12;
    __int16 v50 = 1024;
    *(_DWORD *)v51 = v13;
    *(_WORD *)&v51[4] = 1024;
    *(_DWORD *)&v51[6] = v14;
    LODWORD(v23) = 56;
    long long v22 = &v40;
    _os_log_send_and_compose_impl();
  }
  [a4 resume:v22, v23];
  BOOL v15 = 1;
LABEL_9:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(v39, 8);
  return v15;
}

- (id)_peerListeners
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [[W5PeerSensingListener alloc] initWithInterface:[(W5StatusManager *)self->_status corewifi]];
  if (!v4)
  {
    unsigned int v12 = sub_10009756C();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      return v3;
    }
LABEL_23:
    _os_log_send_and_compose_impl();
    return v3;
  }
  [v3 addObject:v4];
  id v5 = [[W5PeerStatusListener alloc] initWithInterface:[(W5StatusManager *)self->_status corewifi] statusManager:self->_status];
  if (!v5)
  {
    unsigned int v13 = sub_10009756C();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      return v3;
    }
    goto LABEL_23;
  }
  [v3 addObject:v5];
  id v6 = [[W5PeerSnifferListener alloc] initWithInterface:[(W5StatusManager *)self->_status corewifi] snifferManager:self->_sniff];
  if (!v6)
  {
    unsigned int v14 = sub_10009756C();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      return v3;
    }
    goto LABEL_23;
  }
  [v3 addObject:v6];
  id v7 = [[W5PeerDebugListener alloc] initWithDebugManager:self->_debug];
  if (!v7)
  {
    BOOL v15 = sub_10009756C();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      return v3;
    }
    goto LABEL_23;
  }
  [v3 addObject:v7];
  char v8 = [[W5PeerDiagnosticsListener alloc] initWithDiagnosticsManager:self->_diagnostics];
  if (!v8)
  {
    __int16 v16 = sub_10009756C();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      return v3;
    }
    goto LABEL_23;
  }
  [v3 addObject:v8];
  uint64_t v9 = [[W5PeerFileTransferListener alloc] initWithTransferManager:self->_transferManager];
  if (!v9)
  {
    id v17 = sub_10009756C();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      return v3;
    }
    goto LABEL_23;
  }
  [v3 addObject:v9];
  int v10 = [[W5PeerDatabaseListener alloc] initWithDatabaseAccessManager:self->_databaseManager];
  if (!v10)
  {
    unsigned int v18 = sub_10009756C();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      return v3;
    }
    goto LABEL_23;
  }
  [v3 addObject:v10];
  [v3 addObject:-[W5FaultEventManager listener](self->_faultEventManager, "listener")];
  return v3;
}

- (void)_scheduleRepeatingCleanupTasks
{
  if (![(W5BGTaskManager *)self->_bgTaskManager scheduleRepeatingTask:@"com.apple.wifivelocity.sniffer_cleanup" interval:&stru_1000DE400 repeatingTask:86400.0])
  {
    id v3 = sub_10009756C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      long long v11 = "-[W5Engine _scheduleRepeatingCleanupTasks]";
      __int16 v12 = 2080;
      unsigned int v13 = "W5Engine.m";
      __int16 v14 = 1024;
      int v15 = 1922;
      LODWORD(v8) = 28;
      _os_log_send_and_compose_impl();
    }
  }
  id v4 = +[NSPredicate predicateWithFormat:@"SELF.absoluteString CONTAINS %@", @"WiFiNetworkDiagnostics", v8];
  id v5 = +[NSPredicate predicateWithFormat:@"pathExtension='tgz'"];
  bgTaskManager = self->_bgTaskManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100032D34;
  v9[3] = &unk_1000DE428;
  v9[4] = v4;
  void v9[5] = v5;
  if (![(W5BGTaskManager *)bgTaskManager scheduleRepeatingTask:@"com.apple.wifivelocity.de_cleanup" interval:v9 repeatingTask:86400.0])
  {
    id v7 = sub_10009756C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      long long v11 = "-[W5Engine _scheduleRepeatingCleanupTasks]";
      __int16 v12 = 2080;
      unsigned int v13 = "W5Engine.m";
      __int16 v14 = 1024;
      int v15 = 1951;
      _os_log_send_and_compose_impl();
    }
  }
}

@end