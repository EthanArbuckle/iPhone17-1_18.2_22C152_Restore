@interface W5LogManager
+ (id)__descriptionForNetwork:(id)a3;
+ (id)__logBTCProfile:(apple80211_btc_profile_osx *)a3;
+ (id)__logBluetoothStatus:(id)a3;
+ (id)__logNetworkStatus:(id)a3;
+ (id)__logScanResults:(id)a3;
+ (id)__logTxPower:(apple80211_per_chain_power_data_get *)a3;
+ (id)__logWiFiStatus:(id)a3;
+ (id)__temporaryDirectory;
+ (void)__parsePingOutput:(id)a3 result:(id)a4;
- (BOOL)__logItems:(id)a3 containsID:(int64_t)a4;
- (BOOL)__wlCLIWithArguments:(id)a3 outputFilePath:(id)a4 outputData:(id)a5;
- (BOOL)isRequestActiveOrPending:(id)a3;
- (BOOL)waDeviceAnalyticsClientExists;
- (W5LogManager)initWithStatusManager:(id)a3 diagnosticsManager:(id)a4 peerDiagnosticsManager:(id)a5;
- (id)__basicWiFiLogsWithFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4;
- (id)__browseBonjourInstancesWithServiceType:(id)a3 duration:(unint64_t)a4;
- (id)__collect3barsCache:(id)a3;
- (id)__collectAWDLStatus:(id)a3;
- (id)__collectAdditionalLog:(id)a3 url:(id)a4;
- (id)__collectAirPlayLogs:(id)a3;
- (id)__collectBluetoothLogs:(id)a3;
- (id)__collectBluetoothStatus:(id)a3;
- (id)__collectBonjourRecords:(id)a3;
- (id)__collectCoreCapture24:(id)a3;
- (id)__collectCoreCapture:(id)a3;
- (id)__collectCoreCaptureDump:(id)a3;
- (id)__collectCrashesAndSpins24:(id)a3;
- (id)__collectDatapathStats:(id)a3;
- (id)__collectDeviceAnalyticsDeploymentGraph:(id)a3;
- (id)__collectDeviceAnalyticsEntityCSVs:(id)a3;
- (id)__collectDeviceAnalyticsStore:(id)a3;
- (id)__collectDextCoreDump:(id)a3;
- (id)__collectDiagnostics:(id)a3;
- (id)__collectEAP8021XLogs:(id)a3;
- (id)__collectEventHistory:(id)a3;
- (id)__collectFileAtURL:(id)a3 outputDirectory:(id)a4 maxAge:(double)a5 maxSize:(unint64_t)a6 compress:(BOOL)a7 remainingSize:(unint64_t *)a8;
- (id)__collectFilesInDirectories:(id)a3 include:(id)a4 exclude:(id)a5 maxAge:(double)a6 maxCount:(unint64_t)a7 maxSize:(unint64_t)a8 outputDirectory:(id)a9 compress:(BOOL)a10 remainingSize:(unint64_t *)a11 contentFilter:(id)a12;
- (id)__collectFilteredWiFiManagerLogArchiveWithOutputURL:(id)a3 compress:(BOOL)a4 age:(unint64_t)a5;
- (id)__collectIPConfigurationLogs:(id)a3;
- (id)__collectIndividual:(id)a3 error:(id *)a4;
- (id)__collectLeakyAPStats:(id)a3;
- (id)__collectLogItem:(id)a3 error:(id *)a4;
- (id)__collectMultiple:(id)a3;
- (id)__collectNetworkPreferences:(id)a3;
- (id)__collectNetworkStatus:(id)a3;
- (id)__collectPeerDiagnostics:(id)a3;
- (id)__collectPerSSIDDiagnosticsHistory:(id)a3;
- (id)__collectPreviouslyCollected:(id)a3;
- (id)__collectSharingLogs:(id)a3;
- (id)__collectSystemConfiguration:(id)a3;
- (id)__collectSystemLogs24:(id)a3;
- (id)__collectSystemLogs:(id)a3;
- (id)__collectSystemProfiler:(id)a3;
- (id)__collectTCPDump_POST:(id)a3;
- (id)__collectTCPDump_PRE:(id)a3;
- (id)__collectWiFiDeviceConfig:(id)a3;
- (id)__collectWiFiLogs24:(id)a3;
- (id)__collectWiFiLogs:(id)a3;
- (id)__collectWiFiLogsDump:(id)a3;
- (id)__collectWiFiMemoryUsage:(id)a3;
- (id)__collectWiFiPerfLogs:(id)a3;
- (id)__collectWiFiPreferences:(id)a3;
- (id)__collectWiFiScanResults:(id)a3;
- (id)__collectWiFiStatsCLI:(id)a3;
- (id)__collectWiFiStatsPost:(id)a3;
- (id)__collectWiFiStatsPre:(id)a3;
- (id)__collectWiFiStatus:(id)a3;
- (id)__collectWiFiVelocityLog:(id)a3;
- (id)__collectWirelessProxLogs:(id)a3;
- (id)__collect_CFNetworkPing:(id)a3;
- (id)__collect_IMFoundationPing:(id)a3;
- (id)__collect_arp:(id)a3;
- (id)__collect_configd:(id)a3;
- (id)__collect_darwinup:(id)a3;
- (id)__collect_hosts:(id)a3;
- (id)__collect_ifconfig:(id)a3;
- (id)__collect_ioreg:(id)a3;
- (id)__collect_ipconfig:(id)a3;
- (id)__collect_kextstat:(id)a3;
- (id)__collect_mobilewifitool:(id)a3;
- (id)__collect_ndp:(id)a3;
- (id)__collect_netstat:(id)a3;
- (id)__collect_ping:(id)a3;
- (id)__collect_pmset:(id)a3;
- (id)__collect_spindump:(id)a3;
- (id)__collect_swvers:(id)a3;
- (id)__collect_sysdiagnose:(id)a3;
- (id)__collect_top:(id)a3;
- (id)__collect_traceroute:(id)a3;
- (id)__collect_wl_cca_get_stats:(id)a3;
- (id)__collect_wl_curpower:(id)a3;
- (id)__concurrentConnectivityDiagnosticsTest;
- (id)__configurationDiagnosticsLogItemWithTimeout:(double)a3;
- (id)__connectivityDiagnosticsLogItemWithTimeout:(double)a3;
- (id)__dnssdBrowseAll:(id)a3;
- (id)__dnssdCacheAndState:(id)a3;
- (id)__environmentDiagnosticsLogItemWithTimeout:(double)a3;
- (id)__expandLogItems:(id)a3 configuration:(id)a4;
- (id)__fastConnectivityDiagnosticsLogItemWithTimeout:(double)a3;
- (id)__logAWDLStatus:(id)a3;
- (id)__logDiagnosticsPingResults:(id)a3;
- (id)__logDiagnosticsTestResults:(id)a3;
- (id)__logItemsForABCWithReason:(id)a3 filteredContent:(BOOL)a4;
- (id)__logItemsForBTSysdiagnoseWithFilteredContent:(BOOL)a3 timeout:(int64_t)a4;
- (id)__logItemsForBackgroundEventWithReason:(id)a3 filteredContent:(BOOL)a4;
- (id)__logItemsForDatapathStallEventWithFilteredContent:(BOOL)a3;
- (id)__logItemsForDumpLogsEventWithReason:(id)a3 filteredContent:(BOOL)a4;
- (id)__logItemsForFeedbackAssistant;
- (id)__logItemsForInternalWiFiSettings;
- (id)__logItemsForSysdiagnoseWithFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4 timeout:(int64_t)a5;
- (id)__logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4;
- (id)__logItemsForTapToRadar;
- (id)__logItemsForWiFiDiagnosticsApp;
- (id)__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:(id)a3;
- (id)__model;
- (id)__mostRecentInDirectories:(id)a3 include:(id)a4 exclude:(id)a5 maxAge:(double)a6;
- (id)__mostRecentInDirectories:(id)a3 matchingPrefix:(id)a4 matchingSuffix:(id)a5 excludingPrefix:(id)a6 excludingSuffix:(id)a7 maxAge:(double)a8;
- (id)__pendingRequestWithUUID:(id)a3;
- (id)__ping6WithAddress:(id)a3 count:(int64_t)a4 wait:(double)a5 trafficClass:(id)a6 interfaceName:(id)a7 dataLength:(unint64_t)a8;
- (id)__pingBroadcast:(id)a3;
- (id)__pingSubnet:(id)a3;
- (id)__pingUsingCFNetworkWithAddress:(id)a3 count:(int64_t)a4 timeout:(int64_t)a5 trafficClass:(id)a6 networkServiceType:(id)a7;
- (id)__pingUsingIMFoundationWithAddress:(id)a3 timeout:(int64_t)a4;
- (id)__pingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 wait:(double)a6 interval:(double)a7 trafficClass:(id)a8 interfaceName:(id)a9 dataLength:(unint64_t)a10;
- (id)__possibleCoreCapturePathsWithComponent:(id)a3;
- (id)__possibleTempWiFiLogPaths;
- (id)__resolveBonjourInstance:(id)a3 serviceType:(id)a4 duration:(unint64_t)a5;
- (id)__runDiagnosticsTests:(id)a3 configuration:(id)a4 timeout:(int64_t)a5 error:(id *)a6;
- (id)collectLogItemCallback;
- (id)collectedItemCallback;
- (id)pingCallback;
- (unint64_t)__calculateSizeAtPath:(id)a3;
- (void)__dumpCoreCaptureLogsWithReason:(id)a3 component:(id)a4;
- (void)__dumpWiFiLogs;
- (void)__endWiFiStats;
- (void)__filterCoreCaptureContent:(id)a3;
- (void)__nextRequest;
- (void)__purgeFilesInDirectory:(id)a3 matching:(id)a4 maxAge:(unint64_t)a5 maxCount:(unint64_t)a6;
- (void)__replyWithCachedSysdiagnoseContentForRequest:(id)a3 temporaryURL:(id)a4;
- (void)__runRequest:(id)a3 reply:(id)a4;
- (void)__runToolWithOutputFileHandle:(id)a3 launchPath:(id)a4 arguments:(id)a5;
- (void)__runToolWithOutputFileHandle:(id)a3 readFromStandardError:(BOOL)a4 launchPath:(id)a5 arguments:(id)a6 addCommand:(BOOL)a7 addTimestamps:(BOOL)a8;
- (void)__setupWiFiStats;
- (void)__startWiFiStats;
- (void)__teardownWiFiStats;
- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4;
- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4 addCommand:(BOOL)a5 addTimestamps:(BOOL)a6;
- (void)addRequest:(id)a3;
- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)setCollectLogItemCallback:(id)a3;
- (void)setCollectedItemCallback:(id)a3;
- (void)setPingCallback:(id)a3;
- (void)teardownAndNotify:(id)a3;
@end

@implementation W5LogManager

- (W5LogManager)initWithStatusManager:(id)a3 diagnosticsManager:(id)a4 peerDiagnosticsManager:(id)a5
{
  v20.receiver = self;
  v20.super_class = (Class)W5LogManager;
  v8 = [(W5LogManager *)&v20 init];
  if (!v8) {
    goto LABEL_16;
  }
  v9 = dispatch_queue_create("com.apple.wifivelocity.collect-logs", 0);
  v8->_queue = (OS_dispatch_queue *)v9;
  if (!v9) {
    goto LABEL_16;
  }
  dispatch_queue_set_specific(v9, &v8->_queue, (void *)1, 0);
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.wifivelocity.debug-log", 0);
  v8->_debugLogQueue = (OS_dispatch_queue *)v10;
  if (!v10) {
    goto LABEL_16;
  }
  v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8->_debugLogMap = v11;
  if (!v11) {
    goto LABEL_16;
  }
  v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8->_missingLogItemMap = v12;
  if (!v12) {
    goto LABEL_16;
  }
  v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8->_taskUUIDMap = v13;
  if (!v13) {
    goto LABEL_16;
  }
  v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8->_urlUUIDMap = v14;
  if (!v14) {
    goto LABEL_16;
  }
  v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8->_leewayUUIDMap = v15;
  if (!v15) {
    goto LABEL_16;
  }
  v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8->_timestampUUIDMap = v16;
  if (!v16) {
    goto LABEL_16;
  }
  v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v8->_pendingRequests = v17;
  if (a3
    && v17
    && (v8->_status = (W5StatusManager *)a3, a4)
    && (v8->_diagnostics = (W5DiagnosticsManager *)a4,
        v8->_peerDiagnostics = (W5PeerDiagnosticsManager *)a5,
        v18 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter),
        (v8->_dateFormatter = v18) != 0))
  {
    [(NSDateFormatter *)v18 setDateFormat:@"HH:mm:ss.SSS"];
    v8->_model = (NSString *)[[-[W5LogManager __model](v8, "__model")] copy];
    v8->_ioReportSubscription = 0;
    v8->_waDeviceAnalyticsClient = 0;
    v8->_waDeviceAnalyticsClientNotSupported = 0;
    v8->_ioReportBase = 0;
    v8->_ioReportDelta = 0;
    v8->_ioReportChannels = 0;
  }
  else
  {
LABEL_16:

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  debugLogQueue = self->_debugLogQueue;
  if (debugLogQueue) {
    dispatch_release(debugLogQueue);
  }
  ioReportBase = self->_ioReportBase;
  if (ioReportBase) {
    CFRelease(ioReportBase);
  }
  ioReportDelta = self->_ioReportDelta;
  if (ioReportDelta) {
    CFRelease(ioReportDelta);
  }
  ioReportChannels = self->_ioReportChannels;
  if (ioReportChannels) {
    CFRelease(ioReportChannels);
  }
  ioReportSubscription = self->_ioReportSubscription;
  if (ioReportSubscription) {
    CFRelease(ioReportSubscription);
  }
  v9.receiver = self;
  v9.super_class = (Class)W5LogManager;
  [(W5LogManager *)&v9 dealloc];
}

- (BOOL)waDeviceAnalyticsClientExists
{
  if (!self->_waDeviceAnalyticsClient)
  {
    if (self->_waDeviceAnalyticsClientNotSupported) {
      return 0;
    }
    if (sub_10005B2C4() && (sub_10005B2C4(), objc_opt_class()))
    {
      int v5 = _os_feature_enabled_impl();
      v6 = sub_10009756C();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7) {
          _os_log_send_and_compose_impl();
        }
        v8 = (WADeviceAnalyticsClient *)[(id)sub_10005B2C4() sharedDeviceAnalyticsClientWithPersist];
      }
      else
      {
        if (v7) {
          _os_log_send_and_compose_impl();
        }
        v8 = (WADeviceAnalyticsClient *)objc_alloc_init((Class)sub_10005B2C4());
      }
      self->_waDeviceAnalyticsClient = v8;
      if (!v8) {
        return 0;
      }
    }
    else
    {
      objc_super v9 = sub_10009756C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        _os_log_send_and_compose_impl();
      }
      self->_waDeviceAnalyticsClientNotSupported = 1;
      if (!self->_waDeviceAnalyticsClient) {
        return 0;
      }
    }
    dispatch_queue_t v10 = sub_10009756C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v2 = 1;
      _os_log_send_and_compose_impl();
      return v2;
    }
  }
  return 1;
}

- (void)setCollectedItemCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_collectedItemCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005B458;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setPingCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_pingCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005B554;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setCollectLogItemCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_collectLogItemCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005B650;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)__replyWithCachedSysdiagnoseContentForRequest:(id)a3 temporaryURL:(id)a4
{
  unsigned int v6 = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] BOOLValue];
  if (a4)
  {
    unsigned int v7 = v6;
    v14 = 0;
    v8 = -[NSURL URLByAppendingPathComponent:](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/var/run/com.apple.wifivelocity"), "URLByAppendingPathComponent:", [a3 filename]);
    if (v7)
    {
      objc_super v9 = &Apple80211BindToInterface_ptr;
      sub_1000975B0(a4, v8, &v14);
    }
    else
    {
      sub_1000980A8(a4, v8, &v14);
      dispatch_queue_t v10 = +[NSFileManager defaultManager];
      v18[0] = &off_1000EB2A8;
      v17[0] = NSFilePosixPermissions;
      v17[1] = NSFileOwnerAccountID;
      v18[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [a3 uid]);
      v17[2] = NSFileGroupOwnerAccountID;
      v18[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [a3 gid]);
      objc_super v9 = &Apple80211BindToInterface_ptr;
      [(NSFileManager *)v10 setAttributes:+[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3] ofItemAtPath:[(NSURL *)v8 path] error:0];
    }
    if (objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Reason"))
    {
      v11 = -[NSURL URLByAppendingPathComponent:](-[NSURL URLByAppendingPathComponent:](-[NSFileManager containerURLForSecurityApplicationGroupIdentifier:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "containerURLForSecurityApplicationGroupIdentifier:", @"group.com.apple.wifi.logs"), "URLByAppendingPathComponent:", @"previous"), "URLByAppendingPathComponent:", [a3 filename]);
      sub_1000980A8(v8, v11, &v14);
      v12 = +[NSFileManager defaultManager];
      v16[0] = &off_1000EB2A8;
      v15[0] = NSFilePosixPermissions;
      v15[1] = NSFileOwnerAccountID;
      v16[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [a3 uid]);
      v15[2] = NSFileGroupOwnerAccountID;
      v16[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [a3 gid]);
      -[NSFileManager setAttributes:ofItemAtPath:error:](v12, "setAttributes:ofItemAtPath:error:", [v9[361] dictionaryWithObjects:v16 forKeys:v15 count:3], -[NSURL path](v11, "path"), 0);
    }
    if ([a3 reply])
    {
      v13 = (void (**)(id, NSError *, NSURL *, void))[a3 reply];
      v13[2](v13, v14, v8, 0);
    }
  }
}

- (BOOL)__logItems:(id)a3 containsID:(int64_t)a4
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      objc_super v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) itemID] == (id)a4)
        {
          LOBYTE(v6) = 1;
          return (char)v6;
        }
        objc_super v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return (char)v6;
}

- (void)addRequest:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005BB10;
  v4[3] = &unk_1000DDC30;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(queue, v4);
}

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CF34;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (BOOL)isRequestActiveOrPending:(id)a3
{
  return ([(NSUUID *)[(W5LogItemRequestInternal *)self->_activeRequest uuid] isEqual:a3] & 1) != 0|| [(W5LogManager *)self __pendingRequestWithUUID:a3] != 0;
}

- (void)teardownAndNotify:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005D26C;
  v4[3] = &unk_1000DDC08;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)__pendingRequestWithUUID:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  pendingRequests = self->_pendingRequests;
  id v5 = [(NSMutableArray *)pendingRequests countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(pendingRequests);
    }
    objc_super v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "uuid"), "isEqual:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableArray *)pendingRequests countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)__purgeFilesInDirectory:(id)a3 matching:(id)a4 maxAge:(unint64_t)a5 maxCount:(unint64_t)a6
{
  id v9 = +[NSMutableArray array];
  +[NSDate timeIntervalSinceReferenceDate];
  double v11 = v10;
  id v33 = +[NSMutableDictionary dictionary];
  long long v12 = [+[NSFileManager defaultManager] contentsOfDirectoryAtPath:a3 error:0];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v39;
    double v16 = (double)a5;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        -[NSDate timeIntervalSinceReferenceDate](-[NSDictionary fileCreationDate](-[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", [a3 stringByAppendingPathComponent:v18], 0), "fileCreationDate"), "timeIntervalSinceReferenceDate");
        double v20 = v19;
        if (!a4
          || objc_msgSend(a4, "numberOfMatchesInString:options:range:", v18, 0, 0, objc_msgSend(v18, "length")))
        {
          id v21 = [a3 stringByAppendingPathComponent:v18];
          if (v11 - v20 <= v16) {
            [v33 setObject:v21 forKeyedSubscript:[NSNumber numberWithDouble:v20]];
          }
          else {
            [v9 addObject:v21];
          }
        }
      }
      id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v14);
  }
  id v22 = [[objc_msgSend(v33, "allKeys") mutableCopy];
  [v22 sortUsingComparator:&stru_1000DEBD0];
  if ((unint64_t)[v22 count] > a6 && objc_msgSend(v22, "count") != (id)a6)
  {
    v23 = 0;
    do
      [v9 addObject:[v33 objectForKeyedSubscript:[v22 objectAtIndexedSubscript:v23++]]];
    while (v23 < (char *)[v22 count] - a6);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v24 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v35;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v9);
        }
        uint64_t v28 = *(void *)(*((void *)&v34 + 1) + 8 * (void)j);
        v29 = sub_10009756C();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          int v42 = 138543362;
          uint64_t v43 = v28;
          LODWORD(v31) = 12;
          v30 = &v42;
          _os_log_send_and_compose_impl();
        }
        [+[NSFileManager defaultManager] removeItemAtPath:v28 error:0];
      }
      id v25 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v25);
  }
}

- (void)__nextRequest
{
  if (!self->_activeRequest)
  {
    if ([(NSMutableArray *)self->_pendingRequests count])
    {
      id v3 = [[-[NSMutableArray firstObject](self->_pendingRequests) copy];
      self->_activeRequest = (W5LogItemRequestInternal *)[v3 copy];
      [(NSMutableArray *)self->_pendingRequests removeObjectAtIndex:0];
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x3052000000;
      v6[3] = sub_10005D9A4;
      v6[4] = sub_10005D9B4;
      uint64_t v7 = 0;
      uint64_t v4 = os_transaction_create();
      [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager")] osTransactionCreate:@"com.apple.wifivelocity.logs" transaction:v4];
      uint64_t v7 = v4;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10005D9C0;
      v5[3] = &unk_1000DEC48;
      v5[4] = v3;
      v5[5] = self;
      v5[6] = v6;
      [(W5LogManager *)self __runRequest:v3 reply:v5];
      _Block_object_dispose(v6, 8);
    }
  }
}

- (id)__logItemsForDumpLogsEventWithReason:(id)a3 filteredContent:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = +[NSMutableArray array];
  if (!a3)
  {
    a3 = [(NSString *)[+[NSUUID UUID] UUIDString] substringToIndex:5];
    CFStringRef v11 = @"Reason";
    long long v12 = +[NSString stringWithFormat:@"%@~dump[%@]", @"WiFiDebug", a3];
    [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)]];
  }
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:39, 0]];
  [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 45, &off_1000EE010)]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:46, &off_1000EE038]];
  [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 47, &off_1000EE060)]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:44, &off_1000EE088]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:48, 0]];
  [v7 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 7, 0)];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:16, 0]];
  [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 58, 0)]];
  [v7 addObject:-[W5LogManager __configurationDiagnosticsLogItemWithTimeout:](self, "__configurationDiagnosticsLogItemWithTimeout:", 0.0)];
  [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000EE0B0)]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:28, &off_1000EE0D8]];
  [v7 addObject:__environmentDiagnosticsLogItemWithTimeout:0.0];
  [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000EE100)]];
  [v7 addObject:-[W5LogManager __connectivityDiagnosticsLogItemWithTimeout:](self, "__connectivityDiagnosticsLogItemWithTimeout:", 0.0)];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:81, &off_1000EE128]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:3, 0]];
  [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 4, 0)]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:6, 0]];
  [v7 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 8, 0)];
  [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 37, &off_1000EE150)]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:40]];
  v9[0] = @"IncludeMatching";
  v10[0] = +[NSRegularExpression escapedPatternForString:a3];
  v10[1] = &off_1000EB308;
  v9[1] = @"MaxCount";
  v9[2] = @"FilterContent";
  v9[3] = @"Compress";
  v10[2] = +[NSNumber numberWithBool:v4];
  v10[3] = &__kCFBooleanTrue;
  [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4)]];
  return [v7 copy];
}

- (id)__logItemsForABCWithReason:(id)a3 filteredContent:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3) {
    CFStringRef v6 = +[NSString stringWithFormat:@"abc~%@", a3];
  }
  else {
    CFStringRef v6 = @"abc";
  }

  return [(W5LogManager *)self __logItemsForBackgroundEventWithReason:v6 filteredContent:v4];
}

- (id)__logItemsForBackgroundEventWithReason:(id)a3 filteredContent:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = +[NSMutableArray array];
  uint64_t v8 = [(NSString *)[+[NSUUID UUID] UUIDString] substringToIndex:5];
  if (a3) {
    id v9 = +[NSString stringWithFormat:@"%@~%@[%@]", @"WiFiDebug", a3, v8];
  }
  else {
    id v9 = +[NSString stringWithFormat:@"%@[%@]", @"WiFiDebug", v8, v11];
  }
  CFStringRef v14 = @"Reason";
  uint64_t v15 = v9;
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:21, [NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)]];
  [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 39, 0)]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:45]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:46]];
  [v7 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 47, 0)];
  [v7 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 44, 0)];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:81, 0]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:16, 0]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:18, 0]];
  [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 12, 0)]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:7, 0]];
  [v7 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 10, 0)];
  [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 11, 0)]];
  [v7 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 58, 0)];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:57]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:configuration:28, &off_1000EE178]];
  [v7 addObject:-[W5LogManager __environmentDiagnosticsLogItemWithTimeout:](self, "__environmentDiagnosticsLogItemWithTimeout:", 0.0)];
  [v7 addObject:-[W5LogManager __configurationDiagnosticsLogItemWithTimeout:](self, "__configurationDiagnosticsLogItemWithTimeout:", 0.0)];
  [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000EE1A0)]];
  [v7 addObject:[W5LogItemRequest requestWithItemID:37 configuration:&off_1000EE1C8]];
  [v7 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 40, 0)];
  v13[0] = &off_1000EB320;
  v12[0] = @"MaxAge";
  v12[1] = @"FilterContent";
  v12[2] = @"Compress";
  v13[1] = +[NSNumber numberWithBool:v4];
  v13[2] = &__kCFBooleanTrue;
  [v7 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 19, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3)]];
  return [v7 copy];
}

- (id)__logItemsForDatapathStallEventWithFilteredContent:(BOOL)a3
{
  BOOL v8 = a3;
  id v4 = +[NSMutableArray array];
  [v4 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 39, 0)];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 45, &off_1000EE1F0)];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:46, &off_1000EE218]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:47, &off_1000EE240]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:44, &off_1000EE268]];
  [v4 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 48, 0)];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:7, 0]];
  [v4 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 16, 0)];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:58]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:11, 0]];
  [v4 addObject:-[W5LogManager __configurationDiagnosticsLogItemWithTimeout:](self, "__configurationDiagnosticsLogItemWithTimeout:", 0.0)];
  id v5 = [+[NSUUID UUID] UUIDString];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 28, &off_1000EE290)]];
  [v4 addObject:-[W5LogManager __environmentDiagnosticsLogItemWithTimeout:](self, "__environmentDiagnosticsLogItemWithTimeout:", 0.0)];
  v17[0] = @"Reason";
  v17[1] = @"NameOverride";
  v18[0] = +[NSString stringWithFormat:@"%@~dps~PRE[%@]", @"WiFiDebug", [(NSString *)v5 substringToIndex:5]];
  v18[1] = +[NSString stringWithFormat:@"CoreCapture Dump (%@)", v18[0]];
  [v4 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2))];
  CFStringRef v6 = [+[NSUUID UUID] UUIDString];
  CFStringRef v15 = @"UUID";
  double v16 = v6;
  [v4 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 24, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1))];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, &off_1000EE2B8)]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:81, &off_1000EE2E0]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:61, &off_1000EE308]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 3, &off_1000EE330)];
  [v4 addObject:-[W5LogManager __connectivityDiagnosticsLogItemWithTimeout:](self, "__connectivityDiagnosticsLogItemWithTimeout:", 0.0)];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 61, &off_1000EE358)]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 3, &off_1000EE380)];
  [v4 addObject:[W5LogItemRequest requestWithItemID:81 configuration:&off_1000EE3A8]];
  CFStringRef v13 = @"UUID";
  CFStringRef v14 = v6;
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:25, [NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1)]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:69 configuration:&off_1000EE3D0]];
  v11[0] = @"Reason";
  v11[1] = @"NameOverride";
  v12[0] = +[NSString stringWithFormat:@"%@~dps~POST[%@]", @"WiFiDebug", [(NSString *)v5 substringToIndex:5]];
  v12[1] = +[NSString stringWithFormat:@"CoreCapture Dump (%@)", v12[0]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2)]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 4, 0)]];
  [v4 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 6, 0)];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:8, 0]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:69, &off_1000EE3F8]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 37, &off_1000EE420)]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:40, 0]];
  v9[0] = @"IncludeMatching";
  v10[0] = +[NSRegularExpression escapedPatternForString:[(NSString *)v5 substringToIndex:5]];
  v9[1] = @"FilterContent";
  v9[2] = @"Compress";
  v10[1] = +[NSNumber numberWithBool:v8];
  v10[2] = &__kCFBooleanTrue;
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:19, [NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3)]];
  return [v4 copy];
}

- (id)__logItemsForWiFiDiagnosticsApp
{
  BOOL v2 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [(W5LogManager *)self __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:+[NSString stringWithFormat:@"%@~wdapp", @"WiFiDebug"]]);
  [(NSMutableArray *)v2 addObject:+[W5LogItemRequest requestWithItemID:14 configuration:&off_1000EE448]];
  [(NSMutableArray *)v2 addObject:+[W5LogItemRequest requestWithItemID:52 configuration:0]];
  [(NSMutableArray *)v2 addObject:+[W5LogItemRequest requestWithItemID:50 configuration:0]];
  return v2;
}

- (id)__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:(id)a3
{
  id v4 = +[NSMutableArray array];
  unsigned int v18 = [+[NSFileManager defaultManager] isExecutableFileAtPath:@"/sbin/ping"];
  id v5 = [+[NSUUID UUID] UUIDString];
  CFStringRef v6 = +[NSString stringWithFormat:@"%@~PRE[%@]", a3, [(NSString *)v5 substringToIndex:5]];
  v46[0] = &off_1000EB308;
  v45[0] = @"MaxCount";
  v45[1] = @"IncludeMatching";
  v46[1] = +[NSRegularExpression escapedPatternForString:v6];
  v46[2] = &__kCFBooleanTrue;
  v45[2] = @"Compress";
  v45[3] = @"NameOverride";
  v46[3] = +[NSString stringWithFormat:@"CoreCapture Collect (%@)", v6];
  id v7 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:4];
  v42[1] = @"NameOverride";
  v43[0] = v6;
  v42[0] = @"Reason";
  v43[1] = +[NSString stringWithFormat:@"CoreCapture Dump (%@)", v6];
  v44[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2]);
  v44[1] = +[W5LogItemRequest requestWithItemID:69 configuration:&off_1000EE470];
  v44[2] = +[W5LogItemRequest requestWithItemID:19 configuration:v7];
  v40[0] = @"Requests";
  v40[1] = @"RunConcurrent";
  v41[0] = +[NSArray arrayWithObjects:v44 count:3];
  v41[1] = &__kCFBooleanFalse;
  v40[2] = @"NameOverride";
  v41[2] = @"CoreCapture (PRE)";
  v17 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3]);
  BOOL v8 = +[NSString stringWithFormat:@"%@~POST[%@]", a3, [(NSString *)v5 substringToIndex:5]];
  v38[0] = @"MaxAge";
  v38[1] = @"Compress";
  v39[0] = &off_1000EB368;
  v39[1] = &__kCFBooleanTrue;
  v39[2] = &off_1000EB350;
  v38[2] = @"Timeout";
  v38[3] = @"NameOverride";
  v39[3] = +[NSString stringWithFormat:@"CoreCapture Collect (24h + %@)", v8];
  id v9 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
  v35[1] = @"NameOverride";
  v36[0] = v8;
  v35[0] = @"Reason";
  v36[1] = +[NSString stringWithFormat:@"CoreCapture Dump (%@)", v8];
  v37[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2]);
  v37[1] = +[W5LogItemRequest requestWithItemID:69 configuration:&off_1000EE498];
  v37[2] = +[W5LogItemRequest requestWithItemID:19 configuration:v9];
  v33[0] = @"Requests";
  v33[1] = @"RunConcurrent";
  v34[0] = +[NSArray arrayWithObjects:v37 count:3];
  v34[1] = &__kCFBooleanFalse;
  v34[2] = @"CoreCapture (POST + 24h)";
  v33[2] = @"NameOverride";
  v33[3] = @"Timeout";
  v34[3] = &off_1000EB350;
  double v16 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4]);
  v32[0] = +[W5LogItemRequest requestWithItemID:39 configuration:0];
  v32[1] = +[W5LogItemRequest requestWithItemID:69 configuration:&off_1000EE4C0];
  v32[2] = +[W5LogItemRequest requestWithItemID:37 configuration:&off_1000EE4E8];
  v30[0] = @"Requests";
  v30[1] = @"RunConcurrent";
  v31[0] = +[NSArray arrayWithObjects:v32 count:3];
  v31[1] = &__kCFBooleanFalse;
  v30[2] = @"NameOverride";
  v30[3] = @"Timeout";
  v31[2] = @"Wi-Fi Logs (24h)";
  v31[3] = &off_1000EB350;
  CFStringRef v15 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4]);
  double v10 = [+[NSUUID UUID] UUIDString];
  CFStringRef v27 = @"UUID";
  uint64_t v28 = v10;
  v29[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 24, +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1]);
  v29[1] = +[W5LogItemRequest requestWithItemID:69 configuration:&off_1000EE510];
  v25[0] = @"Requests";
  v25[1] = @"RunConcurrent";
  v26[0] = +[NSArray arrayWithObjects:v29 count:2];
  v25[2] = @"NameOverride";
  v26[1] = &__kCFBooleanFalse;
  v26[2] = @"TCP Dump (Begin)";
  uint64_t v11 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3]);
  CFStringRef v22 = @"UUID";
  v23 = v10;
  v24[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 25, +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1]);
  v24[1] = +[W5LogItemRequest requestWithItemID:69 configuration:&off_1000EE538];
  v20[0] = @"Requests";
  v20[1] = @"RunConcurrent";
  v21[0] = +[NSArray arrayWithObjects:v24 count:2];
  v21[1] = &__kCFBooleanFalse;
  v20[2] = @"NameOverride";
  v21[2] = @"TCP Dump (POST)";
  long long v12 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3]);
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:28, &off_1000EE560]];
  [v4 addObject:v17];
  [v4 addObject:v11];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:81, &off_1000EE588]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 61, &off_1000EE5B0)]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:3, &off_1000EE5D8]];
  if (v18) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 43;
  }
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", v13, 0)]];
  [v4 addObject:-[W5LogManager __connectivityDiagnosticsLogItemWithTimeout:](self, "__connectivityDiagnosticsLogItemWithTimeout:", 0.0)];
  [v4 addObject:-[W5LogManager __configurationDiagnosticsLogItemWithTimeout:](self, "__configurationDiagnosticsLogItemWithTimeout:", 0.0)];
  [v4 addObject:__environmentDiagnosticsLogItemWithTimeout:0.0];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:3, &off_1000EE600]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:62, &off_1000EE628]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:81, &off_1000EE650]];
  [v4 addObject:v12];
  [v4 addObject:v16];
  [v4 addObject:v15];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 70, &off_1000EE678)]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 40, 0)]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:30, 0]];
  [v4 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 33, 0)];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:45, &off_1000EE6A0]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 46, &off_1000EE6C8)]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:44, &off_1000EE6F0]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:47, &off_1000EE718]];
  [v4 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 6, 0)];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:9, 0]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:4, 0]];
  if (os_variant_has_internal_diagnostics()) {
    [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:86]];
  }
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 7, 0)]];
  [v4 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 16, 0)];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:49]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 48, 0)]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:58, 0]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 57, 0)]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 5, &off_1000EE740)]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 51, 0)]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:18]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 74, 0)]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 78, &off_1000EE768)];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:80]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 85, &off_1000EE790)]];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 84, &off_1000EE7B8)];
  [v4 addObject:[W5LogItemRequest requestWithItemID:configuration:88, &off_1000EE7E0]];
  [v4 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 87, 0)]];
  return v4;
}

- (id)__logItemsForFeedbackAssistant
{
  id v3 = +[NSString stringWithFormat:@"%@~fba", @"WiFiDebug"];

  return [(W5LogManager *)self __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:v3];
}

- (id)__logItemsForTapToRadar
{
  id v3 = +[NSString stringWithFormat:@"%@~ttr", @"WiFiDebug"];

  return [(W5LogManager *)self __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:v3];
}

- (id)__logItemsForInternalWiFiSettings
{
  id v3 = +[NSString stringWithFormat:@"%@~settings", @"WiFiDebug"];

  return [(W5LogManager *)self __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:v3];
}

- (id)__concurrentConnectivityDiagnosticsTest
{
  id v2 = objc_alloc_init((Class)W5DiagnosticsTestRequest);
  [v2 setTestID:53];
  unsigned int v3 = [+[NSFileManager defaultManager] isExecutableFileAtPath:@"/sbin/ping"];
  unsigned int v4 = [+[NSFileManager defaultManager] isExecutableFileAtPath:@"/sbin/ping6"];
  if (v3) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 3;
  }
  if (v3) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 6;
  }
  id v7 = +[NSMutableArray array];
  [v7 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v5, &off_1000EE808)];
  [v7 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v5, &off_1000EE830)];
  [v7 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v5, &off_1000EE858)];
  [v7 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v5, &off_1000EE880)];
  [v7 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v6, &off_1000EE8A8)];
  [v7 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v6, &off_1000EE8D0)];
  if (v3)
  {
    [v7 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:1, &off_1000EE8F8]];
    [v7 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:1, &off_1000EE920]];
    [v7 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 1, &off_1000EE948)]];
    [v7 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 1, &off_1000EE970)]];
  }
  if (v4) {
    [v7 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 59, &off_1000EE998)];
  }
  [v7 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:7, 0]];
  [v7 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:9, 0]];
  if ([+[NSFileManager defaultManager] isExecutableFileAtPath:@"/usr/local/bin/curl"])
  {
    uint64_t v8 = 54;
  }
  else
  {
    uint64_t v8 = 11;
  }
  [v7 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v8, 0)]];
  v10[0] = @"ConcurrentRequests";
  v10[1] = @"NameOverride";
  v11[0] = v7;
  v11[1] = @"Connectivity (Concurrent)";
  [v2 setConfiguration:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2)];
  return v2;
}

- (id)__configurationDiagnosticsLogItemWithTimeout:(double)a3
{
  id v4 = +[NSMutableArray array];
  id v5 = +[NSMutableDictionary dictionary];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseCachedStatus"];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseCachedPNL"];
  [v4 addObject:+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, 52, v5)];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:12, v5]];
  [v4 addObject:+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 13, v5)];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:57, v5]];
  [v4 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 58, v5)]];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:14, v5]];
  [v4 addObject:+[W5DiagnosticsTestRequest requestWithTestID:configuration:](15, v5)];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:16, v5]];
  [v4 addObject:+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 17, v5)];
  [v4 addObject:+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 18, v5)];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:19 v5]];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:20, v5]];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:21, v5]];
  [v4 addObject:+[W5DiagnosticsTestRequest requestWithTestID:configuration:](22, v5)];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:51, v5]];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:32, v5]];
  [v4 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 34, v5)]];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:35, v5]];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:38, v5]];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:40, v5]];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:39, v5]];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:41, v5]];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:44, v5]];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:45, v5]];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:33, v5]];
  [v4 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 42, v5)]];
  [v4 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 46, v5)];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:43, v5]];
  v8[0] = v4;
  v7[0] = @"DiagnosticsTests";
  v7[1] = @"Timeout";
  v8[1] = +[NSNumber numberWithDouble:a3];
  v8[2] = @"WiFi Conf Diagnostics";
  v7[2] = @"NameOverride";
  v7[3] = @"FileNameOverride";
  v8[3] = @"diagnostics-configuration.txt";
  return +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 26, +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4]);
}

- (id)__environmentDiagnosticsLogItemWithTimeout:(double)a3
{
  id v4 = +[NSMutableArray array];
  id v5 = +[NSMutableDictionary dictionary];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseCachedStatus"];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseCachedPNL"];
  [v5 setObject:&off_1000EB518 forKeyedSubscript:@"MaxScanCacheAge"];
  [v4 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 24, v5)]];
  [v4 addObject:+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 27, v5)];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:28, v5]];
  [v4 addObject:+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 30, v5)];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:31, v5]];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:36, v5]];
  [v4 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 37, v5)]];
  v8[0] = v4;
  v7[0] = @"DiagnosticsTests";
  v7[1] = @"Timeout";
  v8[1] = +[NSNumber numberWithDouble:a3];
  v8[2] = @"WiFi Env Diagnostics";
  v7[2] = @"NameOverride";
  v7[3] = @"FileNameOverride";
  v8[3] = @"diagnostics-environment.txt";
  return +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 26, +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4]);
}

- (id)__connectivityDiagnosticsLogItemWithTimeout:(double)a3
{
  id v4 = +[NSMutableArray array];
  unsigned int v5 = [+[NSFileManager defaultManager] isExecutableFileAtPath:@"/sbin/ping"];
  unsigned int v6 = [+[NSFileManager defaultManager] isExecutableFileAtPath:@"/sbin/ping6"];
  if (v5) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 3;
  }
  if (v5) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 6;
  }
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v7, &off_1000EE9C0)];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v7, &off_1000EE9E8)];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v7, &off_1000EEA10)];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v7, &off_1000EEA38)];
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v8, &off_1000EEA60)];
  [v4 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v8, &off_1000EEA88)];
  if (v5)
  {
    [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:1, &off_1000EEAB0]];
    [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:1, &off_1000EEAD8]];
    [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:1, &off_1000EEB00]];
    [v4 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 1, &off_1000EEB28)]];
  }
  if (v6) {
    [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 59, &off_1000EEB50)];
  }
  [v4 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:7, 0]];
  [v4 addObject:+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 9, 0)];
  if ([+[NSFileManager defaultManager] isExecutableFileAtPath:@"/usr/local/bin/curl"])
  {
    uint64_t v9 = 54;
  }
  else
  {
    uint64_t v9 = 11;
  }
  [v4 addObject:+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v9, 0)];
  [v4 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 8, 0)]];
  [v4 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 49, 0)]];
  v12[0] = v4;
  v11[0] = @"DiagnosticsTests";
  v11[1] = @"Timeout";
  v12[1] = +[NSNumber numberWithDouble:a3];
  void v12[2] = @"WiFi Conn Diagnostics";
  void v11[2] = @"NameOverride";
  v11[3] = @"FileNameOverride";
  void v12[3] = @"diagnostics-connectivity.txt";
  return +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 26, +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4]);
}

- (id)__fastConnectivityDiagnosticsLogItemWithTimeout:(double)a3
{
  v6[0] = @"DiagnosticsTests";
  id v5 = [(W5LogManager *)self __concurrentConnectivityDiagnosticsTest];
  v7[0] = +[NSArray arrayWithObjects:&v5 count:1];
  v6[1] = @"Timeout";
  v7[1] = +[NSNumber numberWithDouble:a3];
  v7[2] = @"WiFi Conn Diagnostics";
  v6[2] = @"NameOverride";
  v6[3] = @"FileNameOverride";
  v7[3] = @"diagnostics-connectivity.txt";
  return +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 26, +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4]);
}

- (id)__logItemsForSysdiagnoseWithFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4 timeout:(int64_t)a5
{
  BOOL v42 = a3;
  id v40 = +[NSMutableArray array];
  uint64_t v43 = [+[NSUUID UUID] UUIDString];
  uint64_t v8 = 4000;
  if (a5 > 35999 && a4) {
    uint64_t v8 = 6000;
  }
  uint64_t v39 = v8;
  if (a5 > 35999 && a4) {
    unint64_t v9 = 24000;
  }
  else {
    unint64_t v9 = 7000;
  }
  uint64_t v10 = 2000;
  if (a5 > 35999 && a4) {
    uint64_t v10 = 3000;
  }
  uint64_t v33 = v10;
  +[NSDate timeIntervalSinceReferenceDate];
  double v12 = v11;
  long long v41 = self;
  [(NSDate *)[(W5LogItemRequestInternal *)self->_activeRequest addedAt] timeIntervalSinceReferenceDate];
  unint64_t v14 = (unint64_t)(v12 - v13);
  double v15 = (double)v9;
  if ((double)(uint64_t)(a5 - v14) * 0.4 >= (double)v9) {
    double v15 = (double)(uint64_t)(a5 - v14) * 0.4;
  }
  unint64_t v16 = (unint64_t)v15;
  if (v9 == (unint64_t)v15)
  {
    unint64_t v34 = v9;
  }
  else
  {
    v17 = sub_10009756C();
    unint64_t v34 = v16;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v94 = 134218752;
      unint64_t v95 = v9;
      __int16 v96 = 2048;
      unint64_t v97 = v16;
      __int16 v98 = 2048;
      int64_t v99 = a5;
      __int16 v100 = 2048;
      unint64_t v101 = v14;
      LODWORD(v30) = 42;
      v29 = &v94;
      _os_log_send_and_compose_impl();
    }
  }
  unsigned int v18 = [+[NSUUID UUID] UUIDString];
  v91[0] = @"Reason";
  v91[1] = @"NameOverride";
  v92[0] = +[NSString stringWithFormat:@"%@~sysdiag~PRE[%@]", @"WiFiDebug", [(NSString *)v18 substringToIndex:5]];
  uint64_t v37 = v92[0];
  v92[1] = +[NSString stringWithFormat:@"CoreCapture Dump (%@)", v92[0]];
  v93 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:2]);
  v89[0] = @"Requests";
  v89[1] = @"RunConcurrent";
  v90[0] = +[NSArray arrayWithObjects:&v93 count:1];
  v90[1] = &__kCFBooleanFalse;
  v89[2] = @"NameOverride";
  v90[2] = @"CoreCapture Dump (PRE)";
  v32 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:3]);
  CFStringRef v86 = @"UUID";
  long long v36 = [+[NSUUID UUID] UUIDString];
  v87 = v36;
  v88[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 24, +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1]);
  v88[1] = +[W5LogItemRequest requestWithItemID:69 configuration:&off_1000EEB78];
  v84[0] = @"Requests";
  v84[1] = @"RunConcurrent";
  v85[0] = +[NSArray arrayWithObjects:v88 count:2];
  v85[1] = &__kCFBooleanFalse;
  v84[2] = @"NameOverride";
  v85[2] = @"TCP Dump (PRE)";
  uint64_t v31 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:3]);
  v83[0] = +[W5LogItemRequest requestWithItemID:39 configuration:0];
  v83[1] = +[W5LogItemRequest requestWithItemID:57 configuration:0];
  v83[2] = +[W5LogItemRequest requestWithItemID:45 configuration:&off_1000EEBA0];
  v83[3] = +[W5LogItemRequest requestWithItemID:46 configuration:&off_1000EEBC8];
  v83[4] = [(W5LogManager *)v41 __configurationDiagnosticsLogItemWithTimeout:0.0];
  v83[5] = +[W5LogItemRequest requestWithItemID:48 configuration:0];
  v83[6] = +[W5LogItemRequest requestWithItemID:28 configuration:&off_1000EEBF0];
  v83[7] = +[W5LogItemRequest requestWithItemID:80 configuration:0];
  v83[8] = +[W5LogItemRequest requestWithItemID:85 configuration:&off_1000EEC18];
  v83[9] = +[W5LogItemRequest requestWithItemID:84 configuration:&off_1000EEC40];
  v83[10] = +[W5LogItemRequest requestWithItemID:88 configuration:&off_1000EEC68];
  v81[0] = @"Requests";
  v81[1] = @"RunConcurrent";
  v82[0] = +[NSArray arrayWithObjects:v83 count:11];
  v82[1] = &__kCFBooleanFalse;
  v81[2] = @"NameOverride";
  v82[2] = @"Wi-Fi Status / Scan";
  double v19 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:3]);
  if (a5 > 35999 && a4) {
    uint64_t v20 = 30000000;
  }
  else {
    uint64_t v20 = 4000000;
  }
  v80[0] = &off_1000EB368;
  v79[0] = @"MaxAge";
  v79[1] = @"MaxSize";
  v80[1] = +[NSNumber numberWithInteger:v20];
  v79[2] = @"FilterContent";
  v80[2] = +[NSNumber numberWithBool:v42];
  v80[3] = &__kCFBooleanTrue;
  v79[3] = @"Compress";
  v79[4] = @"ExcludeMatching";
  v79[5] = @"NameOverride";
  v80[4] = +[NSRegularExpression escapedPatternForString:[(NSString *)v18 substringToIndex:5]];
  v80[5] = @"CoreCapture Collect (24h)";
  id v21 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:6];
  v78[0] = v32;
  v78[1] = v19;
  v78[2] = +[W5LogItemRequest requestWithItemID:61 configuration:&off_1000EEC90];
  v78[3] = +[W5LogItemRequest requestWithItemID:4 configuration:0];
  v78[4] = +[W5LogItemRequest requestWithItemID:7 configuration:0];
  v78[5] = +[W5LogItemRequest requestWithItemID:33 configuration:0];
  v78[6] = +[W5LogItemRequest requestWithItemID:58 configuration:0];
  v78[7] = +[W5LogItemRequest requestWithItemID:47 configuration:&off_1000EECB8];
  v78[8] = +[W5LogItemRequest requestWithItemID:44 configuration:&off_1000EECE0];
  v78[9] = +[W5LogItemRequest requestWithItemID:19 configuration:v21];
  v78[10] = +[W5LogItemRequest requestWithItemID:70 configuration:&off_1000EED08];
  CFStringRef v22 = +[NSArray arrayWithObjects:v78 count:11];
  if (!v42) {
    CFStringRef v22 = [(NSArray *)v22 arrayByAddingObject:v31];
  }
  v76[0] = @"Requests";
  v76[1] = @"RunConcurrent";
  v77[0] = v22;
  v77[1] = &__kCFBooleanTrue;
  v77[2] = v43;
  v76[2] = @"AddLeewayUUID";
  v76[3] = @"Timeout";
  v76[4] = @"NameOverride";
  v77[3] = +[NSNumber numberWithUnsignedInteger:v33];
  v77[4] = @"Connectivity (PRE)";
  [v40 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v77, v76, 5))];
  v75[0] = +[W5LogItemRequest requestWithItemID:81 configuration:&off_1000EED30];
  v75[1] = +[W5LogItemRequest requestWithItemID:3 configuration:&off_1000EED58];
  v75[2] = [(W5LogManager *)v41 __fastConnectivityDiagnosticsLogItemWithTimeout:2000.0];
  v75[3] = +[W5LogItemRequest requestWithItemID:3 configuration:&off_1000EED80];
  v75[4] = +[W5LogItemRequest requestWithItemID:81 configuration:&off_1000EEDA8];
  v75[5] = +[W5LogItemRequest requestWithItemID:62 configuration:&off_1000EEDD0];
  v73[0] = @"Requests";
  v73[1] = @"RunConcurrent";
  v74[0] = +[NSArray arrayWithObjects:v75 count:6];
  v74[1] = &__kCFBooleanFalse;
  v74[2] = v43;
  v73[2] = @"AddLeewayUUID";
  v73[3] = @"Timeout";
  v73[4] = @"NameOverride";
  v74[3] = +[NSNumber numberWithUnsignedInteger:v34];
  v74[4] = @"Connectivity (DIAG)";
  [v40 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v74, v73, 5))];
  v23 = +[NSString stringWithFormat:@"%@~sysdiag~POST[%@]", @"WiFiDebug", [(NSString *)v18 substringToIndex:5]];
  v71[0] = @"IncludeMatching";
  v72[0] = +[NSRegularExpression escapedPatternForString:v23];
  v71[1] = @"FilterContent";
  v72[1] = +[NSNumber numberWithBool:v42];
  v72[2] = &__kCFBooleanTrue;
  v71[2] = @"Compress";
  v71[3] = @"NameOverride";
  v72[3] = +[NSString stringWithFormat:@"CoreCapture Collect (%@)", v23];
  id v24 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:4];
  v69[0] = v23;
  v68[0] = @"Reason";
  v68[1] = @"NameOverride";
  v69[1] = +[NSString stringWithFormat:@"CoreCapture Dump (%@)", v23];
  v70[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2]);
  CFStringRef v66 = @"Delay";
  v67 = +[NSNumber numberWithUnsignedInteger:v39 - 400];
  v70[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1]);
  v70[2] = +[W5LogItemRequest requestWithItemID:19 configuration:v24];
  v64[0] = @"Requests";
  v64[1] = @"RunConcurrent";
  v65[0] = +[NSArray arrayWithObjects:v70 count:3];
  v65[1] = &__kCFBooleanFalse;
  v64[2] = @"Timeout";
  v64[3] = @"NameOverride";
  v65[2] = +[NSNumber numberWithUnsignedInteger:v39];
  v65[3] = @"CoreCapture (POST)";
  long long v35 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:4]);
  v62[0] = @"IncludeMatching";
  v63[0] = +[NSRegularExpression escapedPatternForString:v37];
  v62[1] = @"FilterContent";
  v63[1] = +[NSNumber numberWithBool:v42];
  v63[2] = &__kCFBooleanTrue;
  v62[2] = @"Compress";
  v62[3] = @"NameOverride";
  v63[3] = +[NSString stringWithFormat:@"CoreCapture Collect (%@)", v37];
  id v25 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:4];
  v59[0] = @"Delay";
  v59[1] = @"UseLeewayUUID";
  v60[0] = &off_1000EB350;
  v60[1] = v43;
  v61[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2]);
  v61[1] = +[W5LogItemRequest requestWithItemID:19 configuration:v25];
  v57[0] = @"Requests";
  v57[1] = @"RunConcurrent";
  v58[0] = +[NSArray arrayWithObjects:v61 count:2];
  v58[1] = &__kCFBooleanFalse;
  v57[2] = @"Timeout";
  v57[3] = @"NameOverride";
  v58[2] = +[NSNumber numberWithUnsignedInteger:v39];
  v58[3] = @"CoreCapture (PRE)";
  uint64_t v26 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:4]);
  CFStringRef v54 = @"UUID";
  v55 = v36;
  v56[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 25, +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1]);
  v56[1] = +[W5LogItemRequest requestWithItemID:69 configuration:&off_1000EEDF8];
  v52[0] = @"Requests";
  v52[1] = @"RunConcurrent";
  v53[0] = +[NSArray arrayWithObjects:v56 count:2];
  v53[1] = &__kCFBooleanFalse;
  v52[2] = @"NameOverride";
  v53[2] = @"TCP Dump (POST)";
  long long v38 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:3]);
  v51[0] = +[W5LogItemRequest requestWithItemID:28 configuration:&off_1000EEE20];
  v51[1] = [(W5LogManager *)v41 __environmentDiagnosticsLogItemWithTimeout:0.0];
  v49[0] = @"Requests";
  v49[1] = @"RunConcurrent";
  v50[0] = +[NSArray arrayWithObjects:v51 count:2];
  v50[1] = &__kCFBooleanFalse;
  v49[2] = @"NameOverride";
  v50[2] = @"WiFi Env Diagnostics";
  v48[0] = v35;
  v48[1] = v26;
  v48[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3]);
  v48[3] = +[W5LogItemRequest requestWithItemID:37 configuration:&off_1000EEE48];
  v48[4] = +[W5LogItemRequest requestWithItemID:40 configuration:0];
  v46[0] = @"Delay";
  v46[1] = @"UseLeewayUUID";
  v47[0] = +[NSNumber numberWithUnsignedInteger:v39];
  v47[1] = v43;
  v48[5] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2]);
  CFStringRef v27 = +[NSArray arrayWithObjects:v48 count:6];
  if (!v42) {
    CFStringRef v27 = [(NSArray *)v27 arrayByAddingObject:v38];
  }
  v44[0] = @"Requests";
  v44[1] = @"RunConcurrent";
  v45[0] = v27;
  v45[1] = &__kCFBooleanTrue;
  v45[2] = v43;
  v44[2] = @"UseLeewayUUID";
  void v44[3] = @"Timeout";
  v44[4] = @"NameOverride";
  v45[3] = +[NSNumber numberWithUnsignedInteger:v39];
  void v45[4] = @"Connectivity (POST)";
  [v40 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 5))];
  return v40;
}

- (id)__logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v20 = [+[NSFileManager defaultManager] isExecutableFileAtPath:@"/sbin/ping"];
  unsigned int v6 = [+[NSUUID UUID] UUIDString];
  uint64_t v7 = +[NSString stringWithFormat:@"%@~sysdiag~PRE[%@]", @"WiFiDebug", [(NSString *)v6 substringToIndex:5]];
  v49[0] = &off_1000EB308;
  v48[0] = @"MaxCount";
  v48[1] = @"IncludeMatching";
  v49[1] = +[NSRegularExpression escapedPatternForString:v7];
  v48[2] = @"FilterContent";
  v49[2] = +[NSNumber numberWithBool:v5];
  void v49[3] = &__kCFBooleanTrue;
  v48[3] = @"Compress";
  v48[4] = @"NameOverride";
  v49[4] = +[NSString stringWithFormat:@"CoreCapture Collect (%@)", v7];
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:5];
  v45[1] = @"NameOverride";
  v46[0] = v7;
  v45[0] = @"Reason";
  v46[1] = +[NSString stringWithFormat:@"CoreCapture Dump (%@)", v7];
  v47[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2]);
  v47[1] = +[W5LogItemRequest requestWithItemID:69 configuration:&off_1000EEE70];
  void v47[2] = +[W5LogItemRequest requestWithItemID:19 configuration:v8];
  v43[0] = @"Requests";
  v43[1] = @"RunConcurrent";
  v44[0] = +[NSArray arrayWithObjects:v47 count:3];
  v44[1] = &__kCFBooleanFalse;
  void v43[2] = @"NameOverride";
  v44[2] = @"CoreCapture (PRE)";
  double v19 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3]);
  if (v4) {
    uint64_t v9 = 30000000;
  }
  else {
    uint64_t v9 = 4000000;
  }
  uint64_t v10 = +[NSString stringWithFormat:@"%@~sysdiag~POST[%@]", @"WiFiDebug", [(NSString *)v6 substringToIndex:5]];
  v42[0] = &off_1000EB368;
  v41[0] = @"MaxAge";
  v41[1] = @"MaxSize";
  v42[1] = +[NSNumber numberWithInteger:v9];
  v41[2] = @"FilterContent";
  void v42[2] = +[NSNumber numberWithBool:v5];
  v42[3] = &__kCFBooleanTrue;
  void v41[3] = @"Compress";
  v41[4] = @"NameOverride";
  v42[4] = +[NSString stringWithFormat:@"CoreCapture Collect (24h + %@)", v10];
  double v11 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:5];
  v39[0] = v10;
  v38[0] = @"Reason";
  v38[1] = @"NameOverride";
  v39[1] = +[NSString stringWithFormat:@"CoreCapture Dump (%@)", v10];
  v40[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2]);
  v40[1] = +[W5LogItemRequest requestWithItemID:69 configuration:&off_1000EEE98];
  v40[2] = +[W5LogItemRequest requestWithItemID:19 configuration:v11];
  v36[0] = @"Requests";
  v36[1] = @"RunConcurrent";
  v37[0] = +[NSArray arrayWithObjects:v40 count:3];
  v37[1] = &__kCFBooleanFalse;
  void v36[2] = @"NameOverride";
  v37[2] = @"CoreCapture (POST + 24h)";
  unsigned int v18 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3]);
  v35[0] = +[W5LogItemRequest requestWithItemID:39 configuration:0];
  v35[1] = +[W5LogItemRequest requestWithItemID:69 configuration:&off_1000EEEC0];
  void v35[2] = +[W5LogItemRequest requestWithItemID:37 configuration:&off_1000EEEE8];
  v33[0] = @"Requests";
  v33[1] = @"RunConcurrent";
  v34[0] = +[NSArray arrayWithObjects:v35 count:3];
  v34[1] = &__kCFBooleanFalse;
  v33[2] = @"NameOverride";
  v34[2] = @"Wi-Fi Logs (24h)";
  v17 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3]);
  double v12 = [+[NSUUID UUID] UUIDString];
  CFStringRef v30 = @"UUID";
  uint64_t v31 = v12;
  v32[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 24, +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1]);
  v32[1] = +[W5LogItemRequest requestWithItemID:69 configuration:&off_1000EEF10];
  v28[0] = @"Requests";
  v28[1] = @"RunConcurrent";
  v29[0] = +[NSArray arrayWithObjects:v32 count:2];
  v29[1] = &__kCFBooleanFalse;
  v28[2] = @"NameOverride";
  void v29[2] = @"TCP Dump (Begin)";
  double v13 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3]);
  CFStringRef v25 = @"UUID";
  uint64_t v26 = v12;
  v27[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 25, +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1]);
  v27[1] = +[W5LogItemRequest requestWithItemID:69 configuration:&off_1000EEF38];
  v23[0] = @"Requests";
  v23[1] = @"RunConcurrent";
  v24[0] = +[NSArray arrayWithObjects:v27 count:2];
  v24[1] = &__kCFBooleanFalse;
  v23[2] = @"NameOverride";
  void v24[2] = @"TCP Dump (POST)";
  unint64_t v14 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3]);
  v22[0] = +[W5LogItemRequest requestWithItemID:28 configuration:0];
  v22[1] = v19;
  v22[2] = v13;
  v22[3] = +[W5LogItemRequest requestWithItemID:81 configuration:&off_1000EEF60];
  v22[4] = +[W5LogItemRequest requestWithItemID:61 configuration:&off_1000EEF88];
  v22[5] = +[W5LogItemRequest requestWithItemID:3 configuration:&off_1000EEFB0];
  if (v20) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 43;
  }
  v22[6] = +[W5LogItemRequest requestWithItemID:v15 configuration:0];
  v22[7] = [(W5LogManager *)self __connectivityDiagnosticsLogItemWithTimeout:0.0];
  v22[8] = [(W5LogManager *)self __configurationDiagnosticsLogItemWithTimeout:0.0];
  v22[9] = [(W5LogManager *)self __environmentDiagnosticsLogItemWithTimeout:0.0];
  v22[10] = +[W5LogItemRequest requestWithItemID:3 configuration:&off_1000EEFD8];
  v22[11] = +[W5LogItemRequest requestWithItemID:62 configuration:&off_1000EF000];
  v22[12] = +[W5LogItemRequest requestWithItemID:81 configuration:&off_1000EF028];
  v22[13] = v14;
  v22[14] = v18;
  v22[15] = v17;
  v22[16] = +[W5LogItemRequest requestWithItemID:70 configuration:&off_1000EF050];
  v22[17] = +[W5LogItemRequest requestWithItemID:40 configuration:0];
  v22[18] = +[W5LogItemRequest requestWithItemID:30 configuration:0];
  v22[19] = +[W5LogItemRequest requestWithItemID:33 configuration:0];
  v22[20] = +[W5LogItemRequest requestWithItemID:45 configuration:&off_1000EF078];
  v22[21] = +[W5LogItemRequest requestWithItemID:46 configuration:&off_1000EF0A0];
  v22[22] = +[W5LogItemRequest requestWithItemID:44 configuration:&off_1000EF0C8];
  v22[23] = +[W5LogItemRequest requestWithItemID:47 configuration:&off_1000EF0F0];
  v22[24] = +[W5LogItemRequest requestWithItemID:6 configuration:0];
  v22[25] = +[W5LogItemRequest requestWithItemID:9 configuration:0];
  v22[26] = +[W5LogItemRequest requestWithItemID:4 configuration:0];
  v22[27] = +[W5LogItemRequest requestWithItemID:7 configuration:0];
  v22[28] = +[W5LogItemRequest requestWithItemID:16 configuration:0];
  v22[29] = +[W5LogItemRequest requestWithItemID:48 configuration:0];
  v22[30] = +[W5LogItemRequest requestWithItemID:58 configuration:0];
  v22[31] = +[W5LogItemRequest requestWithItemID:57 configuration:0];
  v22[32] = +[W5LogItemRequest requestWithItemID:74 configuration:0];
  v22[33] = +[W5LogItemRequest requestWithItemID:51 configuration:0];
  v22[34] = +[W5LogItemRequest requestWithItemID:78 configuration:&off_1000EF118];
  v22[35] = +[W5LogItemRequest requestWithItemID:80 configuration:0];
  v22[36] = +[W5LogItemRequest requestWithItemID:85 configuration:&off_1000EF140];
  v22[37] = +[W5LogItemRequest requestWithItemID:84 configuration:&off_1000EF168];
  v22[38] = +[W5LogItemRequest requestWithItemID:88 configuration:&off_1000EF190];
  return +[NSArray arrayWithObjects:v22 count:39];
}

- (id)__logItemsForBTSysdiagnoseWithFilteredContent:(BOOL)a3 timeout:(int64_t)a4
{
  BOOL v4 = a3;
  id v26 = +[NSMutableArray array];
  BOOL v5 = [+[NSUUID UUID] UUIDString];
  unsigned int v6 = +[NSString stringWithFormat:@"%@~sysdiag[%@]", @"BluetoothDebug", [(NSString *)v5 substringToIndex:5]];
  uint64_t v7 = +[NSString stringWithFormat:@"%@~AMFM~sysdiag[%@]", @"BluetoothDebug", [(NSString *)v5 substringToIndex:5]];
  v54[0] = &off_1000EB308;
  v53[0] = @"MaxCount";
  v53[1] = @"IncludeMatching";
  v54[1] = +[NSRegularExpression escapedPatternForString:v6];
  v53[2] = @"FilterContent";
  v54[2] = +[NSNumber numberWithBool:v4];
  v54[3] = @"BT";
  void v53[3] = @"Component";
  v53[4] = @"Compress";
  v54[4] = &__kCFBooleanTrue;
  v53[5] = @"NameOverride";
  v54[5] = +[NSString stringWithFormat:@"CoreCapture Collect (%@)", v6];
  CFStringRef v22 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:6];
  v52[0] = &off_1000EB308;
  v51[0] = @"MaxCount";
  v51[1] = @"IncludeMatching";
  v52[1] = +[NSRegularExpression escapedPatternForString:v7];
  void v51[2] = @"FilterContent";
  v52[2] = +[NSNumber numberWithBool:v4];
  void v52[3] = @"MultiFunctionManager";
  v51[3] = @"Component";
  v51[4] = @"Compress";
  v52[4] = &__kCFBooleanTrue;
  v51[5] = @"NameOverride";
  v52[5] = +[NSString stringWithFormat:@"CoreCapture Collect (%@)", v7];
  unsigned int v20 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:6];
  +[NSDate timeIntervalSinceReferenceDate];
  double v9 = v8;
  [(NSDate *)[(W5LogItemRequestInternal *)self->_activeRequest addedAt] timeIntervalSinceReferenceDate];
  unint64_t v11 = (unint64_t)(v9 - v10);
  double v12 = (double)(uint64_t)(a4 - v11) * 0.4;
  if (v12 <= 2000.0) {
    double v12 = 2000.0;
  }
  unint64_t v13 = (unint64_t)v12;
  if ((unint64_t)v12 != 2000)
  {
    unint64_t v14 = sub_10009756C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = 134218752;
      uint64_t v44 = 2000;
      __int16 v45 = 2048;
      unint64_t v46 = v13;
      __int16 v47 = 2048;
      int64_t v48 = a4;
      __int16 v49 = 2048;
      unint64_t v50 = v11;
      LODWORD(v18) = 42;
      _os_log_send_and_compose_impl();
    }
  }
  uint64_t v15 = 9000;
  if ((uint64_t)(a4 - v11) > 9000) {
    uint64_t v15 = a4 - v11;
  }
  uint64_t v25 = v15 - 2000;
  v40[0] = @"Reason";
  v40[1] = @"Component";
  v41[0] = v6;
  v41[1] = @"BT";
  v40[2] = @"NameOverride";
  v41[2] = +[NSString stringWithFormat:@"CoreCapture Dump (%@)", v6, v18];
  v42[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3]);
  v38[0] = @"Reason";
  v38[1] = @"Component";
  v39[0] = v7;
  v39[1] = @"MultiFunctionManager";
  void v38[2] = @"NameOverride";
  void v39[2] = +[NSString stringWithFormat:@"CoreCapture Dump (%@)", v7];
  v42[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3]);
  CFStringRef v36 = @"Delay";
  uint64_t v37 = +[NSNumber numberWithUnsignedInteger:v13];
  void v42[2] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1]);
  v42[3] = +[W5LogItemRequest requestWithItemID:19 configuration:v22];
  v42[4] = +[W5LogItemRequest requestWithItemID:19 configuration:v20];
  v34[0] = @"Requests";
  v34[1] = @"RunConcurrent";
  v35[0] = +[NSArray arrayWithObjects:v42 count:5];
  v35[1] = &__kCFBooleanFalse;
  v34[2] = @"NameOverride";
  void v35[2] = @"CoreCapture (Dump)";
  v23 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3]);
  v32[0] = @"MaxAge";
  v32[1] = @"MaxSize";
  v33[0] = &off_1000EB368;
  v33[1] = &off_1000EB560;
  void v32[2] = @"FilterContent";
  v33[2] = +[NSNumber numberWithBool:v4];
  void v33[3] = @"BT";
  void v32[3] = @"Component";
  v32[4] = @"Compress";
  v32[5] = @"NameOverride";
  void v33[4] = &__kCFBooleanTrue;
  v33[5] = @"CoreCapture Collect BT (24h)";
  id v21 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:6];
  v30[0] = @"MaxAge";
  v30[1] = @"MaxSize";
  v31[0] = &off_1000EB368;
  v31[1] = &off_1000EB578;
  v30[2] = @"FilterContent";
  v31[2] = +[NSNumber numberWithBool:v4];
  v31[3] = @"MultiFunctionManager";
  v30[3] = @"Component";
  void v30[4] = @"Compress";
  v30[5] = @"NameOverride";
  void v31[4] = &__kCFBooleanTrue;
  v31[5] = @"CoreCapture Collect AMFM (24h)";
  unint64_t v16 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];
  v29[0] = v23;
  v29[1] = +[W5LogItemRequest requestWithItemID:47 configuration:&off_1000EF1B8];
  void v29[2] = +[W5LogItemRequest requestWithItemID:30 configuration:0];
  void v29[3] = +[W5LogItemRequest requestWithItemID:19 configuration:v21];
  v29[4] = +[W5LogItemRequest requestWithItemID:19 configuration:v16];
  v27[0] = @"Requests";
  v27[1] = @"RunConcurrent";
  v28[0] = +[NSArray arrayWithObjects:v29 count:5];
  v28[1] = &__kCFBooleanTrue;
  void v27[2] = @"Timeout";
  v27[3] = @"NameOverride";
  v28[2] = +[NSNumber numberWithUnsignedInteger:v25];
  void v28[3] = @"Bluetooth Logs";
  [v26 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 4))];
  return v26;
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

- (id)__basicWiFiLogsWithFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v25 = a3;
  id v6 = +[NSMutableArray array];
  model = self->_model;
  if (!model) {
    goto LABEL_5;
  }
  if ([(NSString *)model rangeOfString:@"Watch1"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = 0;
    uint64_t v9 = 1;
    goto LABEL_11;
  }
  double v8 = self->_model;
  if (v8 && [(NSString *)v8 rangeOfString:@"Watch2"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = 1;
    uint64_t v9 = 2;
  }
  else
  {
LABEL_5:
    if (v4) {
      uint64_t v9 = 8;
    }
    else {
      uint64_t v9 = 4;
    }
    uint64_t v10 = 1;
  }
LABEL_11:
  unint64_t v11 = sub_10009756C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = self->_model;
    int v53 = 136316930;
    CFStringRef v54 = "-[W5LogManager __basicWiFiLogsWithFilteredContent:useMegaWiFiProfileLimits:]";
    __int16 v55 = 2080;
    v56 = "W5LogManager.m";
    __int16 v57 = 1024;
    int v58 = 2388;
    __int16 v59 = 2114;
    v60 = v12;
    __int16 v61 = 2048;
    uint64_t v62 = v9;
    __int16 v63 = 1024;
    int v64 = v10;
    __int16 v65 = 1024;
    BOOL v66 = v4;
    __int16 v67 = 1024;
    int v68 = v10;
    LODWORD(v21) = 66;
    unsigned int v20 = &v53;
    _os_log_send_and_compose_impl();
  }
  uint64_t v24 = v9;
  unint64_t v13 = [+[NSUUID UUID] UUIDString];
  unint64_t v14 = +[NSString stringWithFormat:@"%@~sysdiag", @"WiFiDebug"];
  CFStringRef v50 = @"TimestampUUID";
  v51 = [+[NSUUID UUID] UUIDString];
  v23 = v51;
  v52[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 39, +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1]);
  v52[1] = +[W5LogItemRequest requestWithItemID:45 configuration:&off_1000EF1E0];
  v52[2] = +[W5LogItemRequest requestWithItemID:46 configuration:&off_1000EF208];
  void v52[3] = +[W5LogItemRequest requestWithItemID:28 configuration:&off_1000EF230];
  v48[0] = @"Requests";
  v48[1] = @"RunConcurrent";
  v49[0] = +[NSArray arrayWithObjects:v52 count:4];
  v49[1] = &__kCFBooleanFalse;
  v48[2] = @"NameOverride";
  v49[2] = @"Wi-Fi Status / Scan";
  v47[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:3]);
  v45[0] = @"Reason";
  v45[1] = @"TimestampUUID";
  v46[0] = v14;
  CFStringRef v22 = v13;
  v46[1] = v13;
  v47[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 21, +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2]);
  void v47[2] = +[W5LogItemRequest requestWithItemID:70 configuration:&off_1000EF258];
  uint64_t v15 = +[NSArray arrayWithObjects:v47 count:3];
  if (v10)
  {
    id v16 = +[NSMutableArray array];
    [v16 addObject:[+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000EF280)]];
    [v16 addObject:__fastConnectivityDiagnosticsLogItemWithTimeout:0.0];
    [v16 addObject:[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 81, &off_1000EF2A8)];
    v43[0] = @"Requests";
    v43[1] = @"RunConcurrent";
    v44[0] = v16;
    v44[1] = &__kCFBooleanFalse;
    void v43[2] = @"NameOverride";
    v44[2] = @"Wi-Fi Diagnostics";
    uint64_t v15 = [(NSArray *)v15 arrayByAddingObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3])];
  }
  v41[0] = @"Requests";
  v41[1] = @"RunConcurrent";
  v42[0] = v15;
  v42[1] = &__kCFBooleanTrue;
  v41[2] = @"Timeout";
  void v41[3] = @"NameOverride";
  void v42[2] = &off_1000EB590;
  v42[3] = @"Wi-Fi Status / Diagnostics";
  [v6 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 4))];
  v39[0] = @"MaxCount";
  v40[0] = +[NSNumber numberWithUnsignedInteger:v24];
  v39[1] = @"FilterContent";
  v40[1] = +[NSNumber numberWithBool:v25];
  void v39[2] = @"Compress";
  v40[2] = +[NSNumber numberWithBool:v10];
  v17 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];
  v36[0] = @"Delay";
  v36[1] = @"TimestampUUID";
  v37[0] = &off_1000EB5A8;
  v37[1] = v22;
  v38[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2]);
  v38[1] = +[W5LogItemRequest requestWithItemID:19 configuration:v17];
  v34[0] = @"Requests";
  v34[1] = @"RunConcurrent";
  v35[0] = +[NSArray arrayWithObjects:v38 count:2];
  v34[2] = @"Timeout";
  void v34[3] = @"NameOverride";
  v35[1] = &__kCFBooleanFalse;
  void v35[2] = &off_1000EB350;
  void v35[3] = @"CoreCapture";
  uint64_t v18 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4]);
  v31[0] = @"Delay";
  v31[1] = @"TimestampUUID";
  v32[0] = &off_1000EB3B0;
  v32[1] = v23;
  v33[0] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 69, +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2]);
  v33[1] = +[W5LogItemRequest requestWithItemID:37 configuration:&off_1000EF2D0];
  v29[0] = @"Requests";
  v29[1] = @"RunConcurrent";
  v30[0] = +[NSArray arrayWithObjects:v33 count:2];
  v30[1] = &__kCFBooleanFalse;
  void v29[2] = @"Timeout";
  void v29[3] = @"NameOverride";
  v30[2] = &off_1000EB350;
  v30[3] = @"WiFi Logs";
  v28[0] = v18;
  v28[1] = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4]);
  v28[2] = +[W5LogItemRequest requestWithItemID:40 configuration:0];
  void v28[3] = +[W5LogItemRequest requestWithItemID:28 configuration:&off_1000EF2F8];
  v26[0] = @"Requests";
  v26[1] = @"RunConcurrent";
  v27[0] = +[NSArray arrayWithObjects:v28 count:4];
  v26[2] = @"Timeout";
  void v26[3] = @"NameOverride";
  v27[1] = &__kCFBooleanTrue;
  void v27[2] = &off_1000EB5C0;
  v27[3] = @"Collect WiFi / CoreCapture";
  [v6 addObject:+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 53, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4))];
  return v6;
}

- (id)__expandLogItems:(id)a3 configuration:(id)a4
{
  id v7 = +[NSMutableArray array];
  unsigned int v18 = [[a4 objectForKeyedSubscript:@"UseMegaWiFiProfileLimits"] boolValue];
  id v8 = [a4 objectForKeyedSubscript:@"FilterContent"];
  if (v8)
  {
    id v9 = [v8 BOOLValue];
  }
  else
  {
    os_variant_has_internal_diagnostics();
    id v9 = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(a3);
        }
        unint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        switch((unint64_t)[v14 itemID])
        {
          case '6':
          case 'M':
            id v15 = [(W5LogManager *)self __logItemsForWiFiDiagnosticsApp];
            goto LABEL_24;
          case '7':
            id v15 = [(W5LogManager *)self __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:+[NSString stringWithFormat:@"%@~wdext", @"WiFiDebug"]];
            goto LABEL_24;
          case '8':
            id v16 = [[a4 objectForKeyedSubscript:@"Timeout"] integerValue];
            if (v16) {
              id v15 = [(W5LogManager *)self __logItemsForSysdiagnoseWithFilteredContent:v9 useMegaWiFiProfileLimits:v18 timeout:v16];
            }
            else {
              id v15 = [(W5LogManager *)self __logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent:v9 useMegaWiFiProfileLimits:v18];
            }
            goto LABEL_24;
          case ';':
            id v15 = [(W5LogManager *)self __logItemsForFeedbackAssistant];
            goto LABEL_24;
          case '<':
            id v15 = [(W5LogManager *)self __logItemsForTapToRadar];
            goto LABEL_24;
          case 'C':
            id v15 = [(W5LogManager *)self __logItemsForInternalWiFiSettings];
            goto LABEL_24;
          case 'G':
            id v15 = [[-[W5LogManager __logItemsForDumpLogsEventWithReason:filteredContent:](self, "__logItemsForDumpLogsEventWithReason:filteredContent:", objc_msgSend(objc_msgSend(v14, "configuration"), "objectForKeyedSubscript:", @"Reason"), v9);
            goto LABEL_24;
          case 'H':
            id v15 = [(W5LogManager *)self __logItemsForDatapathStallEventWithFilteredContent:v9];
            goto LABEL_24;
          case 'O':
            id v15 = [[self __logItemsForBTSysdiagnoseWithFilteredContent:v9 timeout:[objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"Timeout"), "integerValue")]];
            goto LABEL_24;
          case 'R':
            id v15 = [[-[W5LogManager __logItemsForABCWithReason:filteredContent:](self, "__logItemsForABCWithReason:filteredContent:", [v14 configuration], [@"Reason" objectForKeyedSubscript:v9]);
            goto LABEL_24;
          case 'S':
            id v15 = [[-[W5LogManager __logItemsForBackgroundEventWithReason:filteredContent:](self, "__logItemsForBackgroundEventWithReason:filteredContent:", [v14 configuration], @"Reason"), v9];
LABEL_24:
            [v7 addObjectsFromArray:-[W5LogManager __expandLogItems:configuration:](self, "__expandLogItems:configuration:", v15, a4)];
            break;
          default:
            [v7 addObject:v14];
            break;
        }
      }
      id v11 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  id result = [v7 count];
  if (result) {
    return [v7 copy];
  }
  return result;
}

- (void)__runRequest:(id)a3 reply:(id)a4
{
  id v7 = [[self __expandLogItems:a3 itemRequests] configuration:[a3 configuration]];
  debugLogQueue = self->_debugLogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063840;
  block[3] = &unk_1000DD8E0;
  block[4] = self;
  block[5] = a3;
  block[6] = v7;
  dispatch_sync(debugLogQueue, block);
  id v9 = -[NSURL URLByAppendingPathComponent:](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/var/run/com.apple.wifivelocity"), "URLByAppendingPathComponent:", [a3 filename]);
  if ([objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Compress"), "BOOLValue"])id v9 = -[NSURL URLByDeletingPathExtension](v9, "URLByDeletingPathExtension"); {
  id v10 = +[NSURL fileURLWithPath:@"/var/mobile" isDirectory:1];
  }
  if (v9 && (id v11 = v10) != 0)
  {
    [+[NSFileManager defaultManager] createDirectoryAtPath:[(NSURL *)v9 path] withIntermediateDirectories:1 attributes:0 error:0];
    uint64_t v12 = [(W5StatusManager *)self->_status concurrentQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100063A94;
    void v13[3] = &unk_1000DE168;
    v13[4] = a3;
    v13[5] = v7;
    v13[6] = self;
    v13[7] = v9;
    v13[8] = v11;
    v13[9] = a4;
    [(NSOperationQueue *)v12 addOperationWithBlock:v13];
  }
  else if (a4)
  {
    NSErrorUserInfoKey v15 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v16 = @"W5ResourceErr";
    (*((void (**)(id, NSError *, void, void))a4 + 2))(a4, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 7, +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1]), 0, 0);
  }
}

- (id)__collectWiFiScanResults:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = [[[a3 configuration] objectForKeyedSubscript:@"UseScanCache"] BOOLValue];
  unsigned int v8 = [[[a3 configuration] objectForKeyedSubscript:@"Use6GHzFollowup"] BOOLValue];
  id v9 = [v6 path];
  if (v7) {
    CFStringRef v10 = @"wifi_scan_cache.txt";
  }
  else {
    CFStringRef v10 = @"wifi_scan.txt";
  }
  id v11 = [v9 stringByAppendingPathComponent:v10];
  id v12 = objc_alloc_init((Class)CWFScanParameters);
  [v12 setIncludeHiddenNetworks:1];
  [v12 setMergeScanResults:0];
  [v12 setCacheOnly:v7];
  if (v8) {
    uint64_t v13 = 768;
  }
  else {
    uint64_t v13 = 512;
  }
  [v12 setScanFlags:v13];
  [v12 setChannels:-[CWFInterface supportedChannelsWithCountryCode:](-[W5StatusManager corewifi](self->_status, "corewifi"), "supportedChannelsWithCountryCode:", 0)];
  [v12 setIncludeProperties:[NSSet setWithArray:off_1000EFFA8]];
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v11, objc_msgSend(+[W5LogManager __logScanResults:](W5LogManager, "__logScanResults:", -[CWFInterface performScanWithParameters:error:](-[W5StatusManager corewifi](self->_status, "corewifi"), "performScanWithParameters:error:", v12, 0)), "dataUsingEncoding:", 4), 0))
  {
    NSErrorUserInfoKey v15 = +[NSURL fileURLWithPath:v10];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectDiagnostics:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = +[NSMutableString string];
  id v7 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v8 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"DiagnosticsTests"];
  CFStringRef v9 = (const __CFString *)[a3 configuration][@"FileNameOverride"];
  uint64_t v16 = 0;
  id v10 = -[W5LogManager __runDiagnosticsTests:configuration:timeout:error:](self, "__runDiagnosticsTests:configuration:timeout:error:", v8, [a3 configuration], 0, &v16);
  [v6 appendString:@"# --- Diagnostics\n\n"];
  if (([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] powerOn] & 1) == 0) {
    [v6 appendString:@"!!! Wi-Fi is OFF\n\n"];
  }
  [v6 appendString:-[W5LogManager __logDiagnosticsTestResults:](self, "__logDiagnosticsTestResults:", v10)];
  id v11 = [(W5LogManager *)self __logDiagnosticsPingResults:v10];
  if ([v11 length])
  {
    [v6 appendString:@"\n\n\n# --- Ping Results\n\n"];
    [v6 appendString:v11];
  }
  [v6 appendString:@"\n\n"];
  id v12 = +[NSFileManager defaultManager];
  id v13 = [v7 path];
  if (v9) {
    CFStringRef v14 = v9;
  }
  else {
    CFStringRef v14 = @"diagnostics.txt";
  }
  if (-[NSFileManager createFileAtPath:contents:attributes:](v12, "createFileAtPath:contents:attributes:", [v13 stringByAppendingPathComponent:v14], objc_msgSend(v6, "dataUsingEncoding:", 4), 0))
  {
    long long v19 = +[NSURL fileURLWithPath:v14];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1)];
  }
  if (v10)
  {
    CFStringRef v17 = @"DiagnosticsResults";
    id v18 = v10;
    [v5 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectPerSSIDDiagnosticsHistory:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  CFStringRef v17 = v5;
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v18 = +[NSMutableArray array];
  id v7 = [(W5DiagnosticsManager *)self->_diagnostics diagnosticsHistory];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [v7 allKeys];
  id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v13 = [[[v7 objectForKeyedSubscript:v12] allValues] sortedArrayUsingComparator:&stru_1000DED28];
        id v14 = +[NSMutableString string];
        [v14 appendFormat:@"# --- Diagnostics (%@)\n\n", v12];
        [v14 appendString:-[W5LogManager __logDiagnosticsTestResults:](self, "__logDiagnosticsTestResults:", v13)];
        [v14 appendString:@"\n\n"];
        NSErrorUserInfoKey v15 = +[NSString stringWithFormat:@"%@-diagnostics.txt", v12];
        if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", v15), objc_msgSend(v14, "dataUsingEncoding:", 4), 0))
        {
          [v18 addObject:[NSURL fileURLWithPath:v15]];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  [v17 setRelativeURLs:v18];
  +[NSDate timeIntervalSinceReferenceDate];
  [v17 setCompletedAt:];
  return v17;
}

- (id)__collectPeerDiagnostics:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = +[NSMutableString string];
  id v8 = [(W5PeerDiagnosticsManager *)self->_peerDiagnostics gatherPeerDiagnostics];
  [v7 appendFormat:@"# --- Peer Diagnostics from %lu devices\n\n", [v8 count]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 appendFormat:@"%@\n", *(void *)(*((void *)&v14 + 1) + 8 * (void)v12)];
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }
  [v7 appendString:@"\n\n"];
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"peer_diagnostics.txt"), objc_msgSend(v7, "dataUsingEncoding:", 4), 0))
  {
    id v18 = +[NSURL fileURLWithPath:@"peer_diagnostics.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectLeakyAPStats:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = +[NSMutableString string];
  [v7 appendString:@"# --- Leaky AP Stats\n\n"];
  [(-[CWFInterface leakyAPStats](-[W5StatusManager corewifi](self->_status, "corewifi"), "leakyAPStats")) bytes];
  [v7 appendString:sub_10001D2BC()];
  [v7 appendString:@"\n\n"];
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"leaky_ap_stats.txt"), objc_msgSend(v7, "dataUsingEncoding:", 4), 0))
  {
    id v9 = +[NSURL fileURLWithPath:@"leaky_ap_stats.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__browseBonjourInstancesWithServiceType:(id)a3 duration:(unint64_t)a4
{
  id v6 = +[NSMutableArray array];
  id v7 = +[NSMutableData dataWithCapacity:0];
  v20[0] = @"-B";
  v20[1] = a3;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", @"/usr/bin/dns-sd", +[NSArray arrayWithObjects:v20 count:2], v7, 0, 0, 0, (double)a4, 0);
  if ([(NSMutableData *)v7 length])
  {
    id v8 = [[[objc_alloc((Class)NSString) initWithData:v7 encoding:4] componentsSeparatedByString:@"\n"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [[objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v12), "componentsSeparatedByCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")) mutableCopy];
          [v13 removeObject:&stru_1000E06F0];
          if ([v13 count] == (id)7) {
            [v6 addObject:[v13 objectAtIndexedSubscript:6]];
          }
          uint64_t v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  return [v6 copy];
}

- (id)__resolveBonjourInstance:(id)a3 serviceType:(id)a4 duration:(unint64_t)a5
{
  id v8 = +[NSMutableData dataWithCapacity:0];
  v10[0] = @"-L";
  v10[1] = a3;
  void v10[2] = a4;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", @"/usr/bin/dns-sd", +[NSArray arrayWithObjects:v10 count:3], v8, 0, 0, 0, (double)a5, 0);
  id result = [(NSMutableData *)v8 length];
  if (result) {
    return [objc_alloc((Class)NSString) initWithData:v8 encoding:4];
  }
  return result;
}

- (id)__collectBonjourRecords:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = +[NSMutableString string];
  [v7 appendString:@"# --- Bonjour Records\n\n"];
  id v8 = [(W5LogManager *)self __browseBonjourInstancesWithServiceType:@"_appletv-v2._tcp" duration:1];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v42;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 appendFormat:@"%@\n", -[W5LogManager __resolveBonjourInstance:serviceType:duration:](self, "__resolveBonjourInstance:serviceType:duration:", *(void *)(*((void *)&v41 + 1) + 8 * (void)v12), @"_appletv-v2._tcp", 1)];
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v10);
  }
  id v13 = [(W5LogManager *)self __browseBonjourInstancesWithServiceType:@"_airport._tcp" duration:1];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v38;
    do
    {
      long long v17 = 0;
      do
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v13);
        }
        [v7 appendFormat:@"%@\n", -[W5LogManager __resolveBonjourInstance:serviceType:duration:](self, "__resolveBonjourInstance:serviceType:duration:", *(void *)(*((void *)&v37 + 1) + 8 * (void)v17), @"_airport._tcp", 1)];
        long long v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v37 objects:v48 count:16];
    }
    while (v15);
  }
  id v18 = [(W5LogManager *)self __browseBonjourInstancesWithServiceType:@"_homekit._tcp" duration:1];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v19 = [v18 countByEnumeratingWithState:&v33 objects:v47 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      long long v22 = 0;
      do
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        [v7 appendFormat:@"%@\n", -[W5LogManager __resolveBonjourInstance:serviceType:duration:](self, "__resolveBonjourInstance:serviceType:duration:", *(void *)(*((void *)&v33 + 1) + 8 * (void)v22), @"_homekit._tcp", 1)];
        long long v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v33 objects:v47 count:16];
    }
    while (v20);
  }
  id v23 = [(W5LogManager *)self __browseBonjourInstancesWithServiceType:@"_hap._tcp" duration:1];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v24 = [v23 countByEnumeratingWithState:&v29 objects:v46 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v30;
    do
    {
      CFStringRef v27 = 0;
      do
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(v23);
        }
        [v7 appendFormat:@"%@\n", -[W5LogManager __resolveBonjourInstance:serviceType:duration:](self, "__resolveBonjourInstance:serviceType:duration:", *(void *)(*((void *)&v29 + 1) + 8 * (void)v27), @"_hap._tcp", 1)];
        CFStringRef v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v25 = [v23 countByEnumeratingWithState:&v29 objects:v46 count:16];
    }
    while (v25);
  }
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"bonjour_records.txt"), objc_msgSend(v7, "dataUsingEncoding:", 4), 0))
  {
    __int16 v45 = +[NSURL fileURLWithPath:@"bonjour_records.txt"];
    [v5 setRelativeURLs:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectAWDLStatus:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v8 = [[[a3 configuration] objectForKeyedSubscript:@"UseCachedStatus"] BOOLValue];
  status = self->_status;
  if (v8) {
    id v10 = [[-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v7) awdl];
  }
  else {
    id v10 = [(W5StatusManager *)status awdlStatus];
  }
  uint64_t v11 = v10;
  id v12 = +[NSMutableString string];
  [v12 appendString:@"# --- AWDL Status\n\n"];
  [v12 appendString:-[W5LogManager __logAWDLStatus:](self, "__logAWDLStatus:", v11)];
  [v12 appendString:@"\n\n"];
  id v13 = [[[v6 path] stringByAppendingPathComponent:@"awdl_status.txt"];
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v13, [v12 dataUsingEncoding:4], 0))
  {
    id v14 = [v11 interfaceName];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = +[NSFileHandle fileHandleForUpdatingAtPath:v13];
      [(NSFileHandle *)v16 seekToEndOfFile];
      v19[0] = v15;
      v19[1] = @"-dbg=print_sr";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v16 readFromStandardError:0 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v19 count:2] addCommand:1 addTimestamps:0];
      [(NSFileHandle *)v16 closeFile];
    }
    id v18 = +[NSURL fileURLWithPath:@"awdl_status.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectNetworkStatus:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v8 = [[[a3 configuration] objectForKeyedSubscript:@"UseCachedStatus"] BOOLValue];
  status = self->_status;
  if (v8) {
    id v10 = [[-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v7) network];
  }
  else {
    id v10 = [(W5StatusManager *)status networkStatus];
  }
  id v11 = v10;
  id v12 = +[NSMutableString string];
  [v12 appendString:@"# --- Network Status\n\n"];
  [v12 appendString:+[W5LogManager __logNetworkStatus:](W5LogManager, "__logNetworkStatus:", v11)];
  [v12 appendString:@"\n\n"];
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"network_status.txt"), objc_msgSend(v12, "dataUsingEncoding:", 4), 0))
  {
    id v14 = +[NSURL fileURLWithPath:@"network_status.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectWiFiStatus:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v8 = [[[a3 configuration] objectForKeyedSubscript:@"UseCachedStatus"] BOOLValue];
  status = self->_status;
  if (v8) {
    id v10 = [[-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v7) wifi];
  }
  else {
    id v10 = [(W5StatusManager *)status wifiStatus];
  }
  id v11 = v10;
  id v12 = +[NSMutableString string];
  [v12 appendString:@"# --- Wi-Fi Status\n\n"];
  [v12 appendString:+[W5LogManager __logWiFiStatus:](W5LogManager, "__logWiFiStatus:", v11)];
  [v12 appendString:@"\n\n"];
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"wifi_status.txt"), objc_msgSend(v12, "dataUsingEncoding:", 4), 0))
  {
    id v14 = +[NSURL fileURLWithPath:@"wifi_status.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectBluetoothStatus:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v8 = [[[a3 configuration] objectForKeyedSubscript:@"UseCachedStatus"] BOOLValue];
  status = self->_status;
  if (v8) {
    id v10 = [[-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v7) bluetooth];
  }
  else {
    id v10 = [(W5StatusManager *)status bluetoothStatus];
  }
  id v11 = v10;
  id v12 = +[NSMutableString string];
  [v12 appendString:@"# --- Bluetooth Status\n\n"];
  [v12 appendString:+[W5LogManager __logBluetoothStatus:](W5LogManager, "__logBluetoothStatus:", v11)];
  [v12 appendString:@"\n\n"];
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"bluetooth_status.txt"), objc_msgSend(v12, "dataUsingEncoding:", 4), 0))
  {
    id v14 = +[NSURL fileURLWithPath:@"bluetooth_status.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collect_swvers:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/bin/sw_vers", 0, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "path"), "stringByAppendingPathComponent:", @"sw_vers.txt"), 0))
  {
    id v6 = +[NSURL fileURLWithPath:@"sw_vers.txt"];
    [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collect_arp:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  unsigned int v7 = [[[a3 configuration] objectForKeyedSubscript:@"ResolveHostnames"] BOOLValue];
  id v8 = [[[v6 path] stringByAppendingPathComponent:@"arp.txt"];
  [+[NSFileManager defaultManager] removeItemAtPath:v8 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v8 contents:0 attributes:0];
  id v9 = +[NSFileHandle fileHandleForUpdatingAtPath:v8];
  if (v9)
  {
    id v10 = v9;
    if (v7) {
      id v11 = &off_1000EFFC0;
    }
    else {
      id v11 = &off_1000EFFD8;
    }
    [(W5LogManager *)self __runToolWithOutputFileHandle:v9 launchPath:@"/usr/sbin/arp" arguments:v11];
    [(NSFileHandle *)v10 closeFile];
    id v13 = +[NSURL fileURLWithPath:@"arp.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectSystemProfiler:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [[[objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory") URLByAppendingPathComponent:@"system_profiler.spx"];
  v9[0] = @"-detailLevel";
  v9[1] = @"full";
  v9[2] = @"-timeout";
  void v9[3] = +[NSString stringWithFormat:@"%.0f", 0x4034000000000000];
  void v9[4] = @"-xml";
  uint64_t v7 = 0;
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/sbin/system_profiler", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 5), [v5 path], &v7))
  {
    id v8 = +[NSURL fileURLWithPath:@"system_profiler.spx"];
    [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collect_IMFoundationPing:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v37 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v6 = +[NSMutableData data];
  id v7 = +[NSMutableString string];
  if (([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] powerOn] & 1) == 0) {
    [v7 appendString:@"!!! Wi-Fi is OFF\n\n"];
  }
  [v7 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v7 appendString:@"Ping localhost (loopback)\n"];
  [v7 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v8 = [(W5LogManager *)self __pingUsingIMFoundationWithAddress:@"localhost" timeout:1];
  [v8 packetLoss];
  if (v9 >= 100.0) {
    CFStringRef v10 = @"FAIL";
  }
  else {
    CFStringRef v10 = @"PASS";
  }
  [v8 min];
  [v7 appendFormat:@"%@ -- %.2f ms\n\n", v10, v11];
  [v6 appendData:[v7 dataUsingEncoding:4]];
  id v12 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv4RouterAddress];
  if (v12
    || (id v12 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv6RouterAddress]) != 0)
  {
    id v13 = +[NSMutableString string];
    [v13 appendString:@"————————————————————————————————————————————————————————————————————\n"];
    [v13 appendFormat:@"Ping LAN (%@)\n", v12];
    [v13 appendString:@"————————————————————————————————————————————————————————————————————\n"];
    id v14 = [(W5LogManager *)self __pingUsingIMFoundationWithAddress:v12 timeout:1];
    [v14 packetLoss];
    if (v15 >= 100.0) {
      CFStringRef v16 = @"FAIL";
    }
    else {
      CFStringRef v16 = @"PASS";
    }
    [v14 min];
    [v13 appendFormat:@"%@ -- %.2f ms\n\n", v16, v17];
    [v6 appendData:[v13 dataUsingEncoding:4]];
  }
  id v18 = +[NSMutableString string];
  [v18 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v18 appendFormat:@"Ping WAN\n"];
  [v18 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v19 = [[-[CWFInterface DNSServerAddresses](-[W5StatusManager corewifi](self->_status, "corewifi")) firstObject];
  id v20 = [(W5LogManager *)self __pingUsingIMFoundationWithAddress:v19 timeout:1];
  [v20 packetLoss];
  if (v21 >= 100.0) {
    CFStringRef v22 = @"FAIL";
  }
  else {
    CFStringRef v22 = @"PASS";
  }
  [v20 min];
  [v18 appendFormat:@"%@ -- %@ -- %.2f ms\n", v19, v22, v23];
  id v24 = sub_100096EE0();
  id v25 = [(W5LogManager *)self __pingUsingIMFoundationWithAddress:v24 timeout:1];
  [v25 packetLoss];
  if (v26 >= 100.0) {
    CFStringRef v27 = @"FAIL";
  }
  else {
    CFStringRef v27 = @"PASS";
  }
  [v25 min];
  [v18 appendFormat:@"%@ -- %@ -- %.2f ms\n\n", v24, v27, v28];
  [v6 appendData:[v18 dataUsingEncoding:4]];
  id v29 = +[NSMutableString string];
  [v29 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v29 appendFormat:@"Ping Performance (%@)\n", v12];
  [v29 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v30 = [(W5LogManager *)self __pingUsingIMFoundationWithAddress:v12 timeout:10];
  [v29 appendFormat:@"count=%ld\n", [v30 count]];
  [v30 min];
  [v29 appendFormat:@"min=%.2f ms\n", v31];
  [v30 max];
  [v29 appendFormat:@"max=%.2f ms\n", v32];
  [v30 avg];
  [v29 appendFormat:@"avg=%.2f ms\n", v33];
  [v30 stddev];
  [v29 appendFormat:@"stddev=%.2f ms\n", v34];
  [v30 packetLoss];
  [v29 appendFormat:@"loss=%.2f%%\n", v35];
  [v6 appendData:[v29 dataUsingEncoding:4]];
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v37, "path"), "stringByAppendingPathComponent:", @"ping-IMFoundation.txt"), v6, 0))
  {
    long long v38 = +[NSURL fileURLWithPath:@"ping-IMFoundation.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collect_ping:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v92 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v6 = +[NSMutableArray array];
  id v95 = +[NSMutableData data];
  id v7 = +[NSMutableString string];
  if (([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] powerOn] & 1) == 0) {
    [v7 appendString:@"!!! Wi-Fi is OFF\n\n"];
  }
  v93 = v5;
  [v7 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v7 appendString:@"Ping localhost (loopback)\n"];
  [v7 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v8 = [(W5LogManager *)self __pingWithAddress:@"localhost" count:1 timeout:0 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:10 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
  if (v8) {
    [v6 addObject:v8];
  }
  [v8 packetLoss];
  CFStringRef v9 = @"FAIL";
  if (v10 >= 100.0) {
    CFStringRef v11 = @"FAIL";
  }
  else {
    CFStringRef v11 = @"PASS";
  }
  [v8 min];
  [v7 appendFormat:@"%@ -- %.2f ms\n\n", v11, v12];
  [v95 appendData:[v7 dataUsingEncoding:4]];
  id v13 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv4RouterAddress];
  if (v13
    || (id v13 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv6RouterAddress]) != 0)
  {
    id v14 = +[NSMutableString string];
    [v14 appendString:@"————————————————————————————————————————————————————————————————————\n"];
    [v14 appendFormat:@"Ping LAN (%@)\n", v13];
    [v14 appendString:@"————————————————————————————————————————————————————————————————————\n"];
    id v15 = [(W5LogManager *)self __pingWithAddress:v13 count:1 timeout:0 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:11 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
    if (v15) {
      [v6 addObject:v15];
    }
    [v15 packetLoss];
    if (v16 >= 100.0) {
      CFStringRef v17 = @"FAIL";
    }
    else {
      CFStringRef v17 = @"PASS";
    }
    [v15 min];
    [v14 appendFormat:@"%@ -- %.2f ms\n\n", v17, v18];
    [v95 appendData:[v14 dataUsingEncoding:4]];
  }
  id v19 = +[NSMutableString string];
  [v19 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v19 appendString:@"Ping WAN\n"];
  [v19 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v20 = [[-[CWFInterface DNSServerAddresses](-[W5StatusManager corewifi](self->_status, "corewifi"), "DNSServerAddresses") firstObject];
  id v21 = [(W5LogManager *)self __pingWithAddress:v20 count:1 timeout:0 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:12 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
  if (v21) {
    [v6 addObject:v21];
  }
  [v21 packetLoss];
  if (v22 >= 100.0) {
    CFStringRef v23 = @"FAIL";
  }
  else {
    CFStringRef v23 = @"PASS";
  }
  [v21 min];
  [v19 appendFormat:@"%@ -- %@ -- %.2f ms\n", v20, v23, v24];
  id v25 = sub_100096EE0();
  id v26 = [(W5LogManager *)self __pingWithAddress:v25 count:1 timeout:0 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:13 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
  if (v26) {
    [v6 addObject:v26];
  }
  [v26 packetLoss];
  if (v27 >= 100.0) {
    CFStringRef v28 = @"FAIL";
  }
  else {
    CFStringRef v28 = @"PASS";
  }
  [v26 min];
  [v19 appendFormat:@"%@ -- %@ -- %.2f ms\n\n", v25, v28, v29];
  [v95 appendData:[v19 dataUsingEncoding:4]];
  id v30 = +[NSMutableString string];
  [v30 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v30 appendFormat:@"Ping QOS (%@)\n", v13];
  [v30 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v31 = [(W5LogManager *)self __pingWithAddress:v25 count:1 timeout:&off_1000EB3E0 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:14 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
  if (v31) {
    [v6 addObject:v31];
  }
  [v31 packetLoss];
  if (v32 >= 100.0) {
    CFStringRef v33 = @"FAIL";
  }
  else {
    CFStringRef v33 = @"PASS";
  }
  [v31 min];
  [v30 appendFormat:@"BE -- %@ -- %.2f ms\n", v33, v34];
  id v35 = [(W5LogManager *)self __pingWithAddress:v25 count:1 timeout:&off_1000EB878 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:15 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
  if (v35) {
    [v6 addObject:v35];
  }
  [v35 packetLoss];
  if (v36 >= 100.0) {
    CFStringRef v37 = @"FAIL";
  }
  else {
    CFStringRef v37 = @"PASS";
  }
  [v35 min];
  [v30 appendFormat:@"BK_SYS -- %@ -- %.2f ms\n", v37, v38];
  id v39 = [(W5LogManager *)self __pingWithAddress:v25 count:1 timeout:&off_1000EB3F8 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:16 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
  if (v39) {
    [v6 addObject:v39];
  }
  [v39 packetLoss];
  if (v40 >= 100.0) {
    CFStringRef v41 = @"FAIL";
  }
  else {
    CFStringRef v41 = @"PASS";
  }
  [v39 min];
  [v30 appendFormat:@"BK -- %@ -- %.2f ms\n", v41, v42];
  id v43 = [(W5LogManager *)self __pingWithAddress:v25 count:1 timeout:&off_1000EB890 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:17 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
  if (v43) {
    [v6 addObject:v43];
  }
  [v43 packetLoss];
  if (v44 >= 100.0) {
    CFStringRef v45 = @"FAIL";
  }
  else {
    CFStringRef v45 = @"PASS";
  }
  [v43 min];
  [v30 appendFormat:@"RD -- %@ -- %.2f ms\n", v45, v46];
  id v47 = [(W5LogManager *)self __pingWithAddress:v25 count:1 timeout:&off_1000EB8A8 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:18 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
  if (v47) {
    [v6 addObject:v47];
  }
  [v47 packetLoss];
  if (v48 >= 100.0) {
    CFStringRef v49 = @"FAIL";
  }
  else {
    CFStringRef v49 = @"PASS";
  }
  [v47 min];
  [v30 appendFormat:@"OAM -- %@ -- %.2f ms\n", v49, v50];
  id v51 = [(W5LogManager *)self __pingWithAddress:v25 count:1 timeout:&off_1000EB8C0 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:19 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
  if (v51) {
    [v6 addObject:v51];
  }
  [v51 packetLoss];
  if (v52 >= 100.0) {
    CFStringRef v53 = @"FAIL";
  }
  else {
    CFStringRef v53 = @"PASS";
  }
  [v51 min];
  [v30 appendFormat:@"AV -- %@ -- %.2f ms\n", v53, v54];
  id v55 = [(W5LogManager *)self __pingWithAddress:v25 count:1 timeout:&off_1000EB8D8 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:20 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
  if (v55) {
    [v6 addObject:v55];
  }
  [v55 packetLoss];
  if (v56 >= 100.0) {
    CFStringRef v57 = @"FAIL";
  }
  else {
    CFStringRef v57 = @"PASS";
  }
  [v55 min];
  [v30 appendFormat:@"RV -- %@ -- %.2f ms\n", v57, v58];
  id v59 = [(W5LogManager *)self __pingWithAddress:v25 count:1 timeout:&off_1000EB410 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:21 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
  if (v59) {
    [v6 addObject:v59];
  }
  [v59 packetLoss];
  if (v60 >= 100.0) {
    CFStringRef v61 = @"FAIL";
  }
  else {
    CFStringRef v61 = @"PASS";
  }
  [v59 min];
  [v30 appendFormat:@"VI -- %@ -- %.2f ms\n", v61, v62];
  id v63 = [(W5LogManager *)self __pingWithAddress:v25 count:1 timeout:&off_1000EB440 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:22 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
  if (v63) {
    [v6 addObject:v63];
  }
  [v63 packetLoss];
  if (v64 >= 100.0) {
    CFStringRef v65 = @"FAIL";
  }
  else {
    CFStringRef v65 = @"PASS";
  }
  [v63 min];
  [v30 appendFormat:@"VO -- %@ -- %.2f ms\n", v65, v66];
  id v67 = [(W5LogManager *)self __pingWithAddress:v25 count:1 timeout:&off_1000EB8F0 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:23 trafficClass:2.0 interfaceName:2.0 dataLength:0.1];
  if (v67) {
    [v6 addObject:v67];
  }
  [v67 packetLoss];
  if (v68 >= 100.0) {
    CFStringRef v69 = @"FAIL";
  }
  else {
    CFStringRef v69 = @"PASS";
  }
  [v67 min];
  [v30 appendFormat:@"CTL -- %@ -- %.2f ms\n\n", v69, v70];
  [v95 appendData:[v30 dataUsingEncoding:4]];
  id v71 = +[NSMutableString string];
  [v71 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v71 appendFormat:@"Ping Performance (%@)\n", v13];
  [v71 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v72 = [(W5LogManager *)self __pingWithAddress:v13 count:10 timeout:&off_1000EB3E0 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:24 trafficClass:21.0 interfaceName:2.0 dataLength:0.1];
  if (v72) {
    [v6 addObject:v72];
  }
  [v71 appendFormat:@"count=%ld\n", [v72 count]];
  [v72 min];
  [v71 appendFormat:@"min=%.2f ms\n", v73];
  [v72 max];
  [v71 appendFormat:@"max=%.2f ms\n", v74];
  [v72 avg];
  [v71 appendFormat:@"avg=%.2f ms\n", v75];
  [v72 stddev];
  [v71 appendFormat:@"stddev=%.2f ms\n", v76];
  [v72 packetLoss];
  [v71 appendFormat:@"loss=%.2f%%\n\n", v77];
  [v95 appendData:[v71 dataUsingEncoding:4]];
  id v78 = +[NSMutableString string];
  [v78 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v78 appendFormat:@"Ping6 AWDL (%@)\n", @"ff02::fb"];
  [v78 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  int v94 = self;
  id v79 = [(W5LogManager *)self __ping6WithAddress:@"ff02::fb" count:1 wait:0 trafficClass:[(W5WiFiInterface *)[(W5StatusManager *)self->_status awdl] interfaceName] interfaceName:25 dataLength:2.0];
  if (v79) {
    [v6 addObject:v79];
  }
  [v79 packetLoss];
  if (v80 < 100.0) {
    CFStringRef v9 = @"PASS";
  }
  [v79 min];
  [v78 appendFormat:@"%@ -- %.2f ms\n\n", v9, v81];
  [v95 appendData:[v78 dataUsingEncoding:4]];
  if ([v6 count])
  {
    [v95 appendData:[@"\n\n\n# --- Ping Results\n\n" dataUsingEncoding:4]];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v82 = [v6 countByEnumeratingWithState:&v96 objects:v101 count:16];
    if (v82)
    {
      id v83 = v82;
      uint64_t v84 = *(void *)v97;
      do
      {
        for (i = 0; i != v83; i = (char *)i + 1)
        {
          if (*(void *)v97 != v84) {
            objc_enumerationMutation(v6);
          }
          CFStringRef v86 = *(void **)(*((void *)&v96 + 1) + 8 * i);
          id v87 = +[NSMutableString string];
          [v87 appendString:@"————————————————————————————————————————————————————————————————————\n"];
          dateFormatter = v94->_dateFormatter;
          [v86 startedAt];
          v89 = [(NSDateFormatter *)dateFormatter stringFromDate:+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:")];
          v90 = v94->_dateFormatter;
          [v86 endedAt];
          [v87 appendFormat:@"[%@ - %@]\n", v89, -[NSDateFormatter stringFromDate:](v90, "stringFromDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"))];
          [v87 appendFormat:@"%@\n", [v86 command]];
          [v87 appendFormat:@"%@\n", [v86 output]];
          [v95 appendData:[v87 dataUsingEncoding:4]];
        }
        id v83 = [v6 countByEnumeratingWithState:&v96 objects:v101 count:16];
      }
      while (v83);
    }
  }
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v92, "path"), "stringByAppendingPathComponent:", @"ping.txt"), v95, 0))
  {
    __int16 v100 = +[NSURL fileURLWithPath:@"ping.txt"];
    [v93 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v100, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v93 setCompletedAt:];
  return v93;
}

- (id)__collect_CFNetworkPing:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v78 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v6 = +[NSMutableData data];
  id v7 = +[NSMutableString string];
  if (([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] powerOn] & 1) == 0) {
    [v7 appendString:@"!!! Wi-Fi is OFF\n\n"];
  }
  [v7 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v7 appendString:@"Ping localhost (loopback)\n"];
  [v7 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v8 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:@"localhost" count:1 timeout:1 trafficClass:0 networkServiceType:0];
  [v8 packetLoss];
  if (v9 >= 100.0) {
    CFStringRef v10 = @"FAIL";
  }
  else {
    CFStringRef v10 = @"PASS";
  }
  [v8 min];
  [v7 appendFormat:@"%@ -- %.2f ms\n\n", v10, v11];
  [v6 appendData:[v7 dataUsingEncoding:4]];
  id v12 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv4RouterAddress];
  id v79 = v5;
  if (v12
    || (id v12 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv6RouterAddress]) != 0)
  {
    id v13 = +[NSMutableString string];
    [v13 appendString:@"————————————————————————————————————————————————————————————————————\n"];
    [v13 appendFormat:@"Ping LAN (%@)\n", v12];
    [v13 appendString:@"————————————————————————————————————————————————————————————————————\n"];
    id v14 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v12 count:1 timeout:1 trafficClass:0 networkServiceType:0];
    [v14 packetLoss];
    if (v15 >= 100.0) {
      CFStringRef v16 = @"FAIL";
    }
    else {
      CFStringRef v16 = @"PASS";
    }
    [v14 min];
    [v13 appendFormat:@"%@ -- %.2f ms\n\n", v16, v17];
    [v6 appendData:[v13 dataUsingEncoding:4]];
  }
  id v18 = +[NSMutableString string];
  [v18 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v18 appendString:@"Ping WAN\n"];
  [v18 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v19 = [[-[CWFInterface DNSServerAddresses](-[W5StatusManager corewifi](self->_status, "corewifi")) firstObject];
  id v20 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v19 count:1 timeout:1 trafficClass:0 networkServiceType:0];
  [v20 packetLoss];
  if (v21 >= 100.0) {
    CFStringRef v22 = @"FAIL";
  }
  else {
    CFStringRef v22 = @"PASS";
  }
  [v20 min];
  [v18 appendFormat:@"%@ -- %@ -- %.2f ms\n", v19, v22, v23];
  id v24 = sub_100096EE0();
  id v25 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v24 count:1 timeout:1 trafficClass:0 networkServiceType:0];
  [v25 packetLoss];
  if (v26 >= 100.0) {
    CFStringRef v27 = @"FAIL";
  }
  else {
    CFStringRef v27 = @"PASS";
  }
  [v25 min];
  [v18 appendFormat:@"%@ -- %@ -- %.2f ms\n\n", v24, v27, v28];
  [v6 appendData:[v18 dataUsingEncoding:4]];
  id v29 = +[NSMutableString string];
  [v29 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v29 appendFormat:@"Ping QOS (%@)\n", v12];
  [v29 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v30 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v12 count:1 timeout:1 trafficClass:&off_1000EB3E0 networkServiceType:0];
  [v30 packetLoss];
  if (v31 >= 100.0) {
    CFStringRef v32 = @"FAIL";
  }
  else {
    CFStringRef v32 = @"PASS";
  }
  [v30 min];
  [v29 appendFormat:@"BE -- %@ -- %.2f ms\n", v32, v33];
  id v34 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v12 count:1 timeout:1 trafficClass:&off_1000EB878 networkServiceType:0];
  [v34 packetLoss];
  if (v35 >= 100.0) {
    CFStringRef v36 = @"FAIL";
  }
  else {
    CFStringRef v36 = @"PASS";
  }
  [v34 min];
  [v29 appendFormat:@"BK_SYS -- %@ -- %.2f ms\n", v36, v37];
  id v38 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v12 count:1 timeout:1 trafficClass:&off_1000EB3F8 networkServiceType:0];
  [v38 packetLoss];
  if (v39 >= 100.0) {
    CFStringRef v40 = @"FAIL";
  }
  else {
    CFStringRef v40 = @"PASS";
  }
  [v38 min];
  [v29 appendFormat:@"BK -- %@ -- %.2f ms\n", v40, v41];
  id v42 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v12 count:1 timeout:1 trafficClass:&off_1000EB890 networkServiceType:0];
  [v42 packetLoss];
  if (v43 >= 100.0) {
    CFStringRef v44 = @"FAIL";
  }
  else {
    CFStringRef v44 = @"PASS";
  }
  [v42 min];
  [v29 appendFormat:@"RD -- %@ -- %.2f ms\n", v44, v45];
  id v46 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v12 count:1 timeout:1 trafficClass:&off_1000EB8A8 networkServiceType:0];
  [v46 packetLoss];
  if (v47 >= 100.0) {
    CFStringRef v48 = @"FAIL";
  }
  else {
    CFStringRef v48 = @"PASS";
  }
  [v46 min];
  [v29 appendFormat:@"OAM -- %@ -- %.2f ms\n", v48, v49];
  id v50 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v12 count:1 timeout:1 trafficClass:&off_1000EB8C0 networkServiceType:0];
  [v50 packetLoss];
  if (v51 >= 100.0) {
    CFStringRef v52 = @"FAIL";
  }
  else {
    CFStringRef v52 = @"PASS";
  }
  [v50 min];
  [v29 appendFormat:@"AV -- %@ -- %.2f ms\n", v52, v53];
  id v54 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v12 count:1 timeout:1 trafficClass:&off_1000EB8D8 networkServiceType:0];
  [v54 packetLoss];
  if (v55 >= 100.0) {
    CFStringRef v56 = @"FAIL";
  }
  else {
    CFStringRef v56 = @"PASS";
  }
  [v54 min];
  [v29 appendFormat:@"RV -- %@ -- %.2f ms\n", v56, v57];
  id v58 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v12 count:1 timeout:1 trafficClass:&off_1000EB410 networkServiceType:0];
  [v58 packetLoss];
  if (v59 >= 100.0) {
    CFStringRef v60 = @"FAIL";
  }
  else {
    CFStringRef v60 = @"PASS";
  }
  [v58 min];
  [v29 appendFormat:@"VI -- %@ -- %.2f ms\n", v60, v61];
  id v62 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v12 count:1 timeout:1 trafficClass:&off_1000EB440 networkServiceType:0];
  [v62 packetLoss];
  if (v63 >= 100.0) {
    CFStringRef v64 = @"FAIL";
  }
  else {
    CFStringRef v64 = @"PASS";
  }
  [v62 min];
  [v29 appendFormat:@"VO -- %@ -- %.2f ms\n", v64, v65];
  id v66 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v12 count:1 timeout:1 trafficClass:&off_1000EB8F0 networkServiceType:0];
  [v66 packetLoss];
  if (v67 >= 100.0) {
    CFStringRef v68 = @"FAIL";
  }
  else {
    CFStringRef v68 = @"PASS";
  }
  [v66 min];
  [v29 appendFormat:@"CTL -- %@ -- %.2f ms\n\n", v68, v69];
  [v6 appendData:[v29 dataUsingEncoding:4]];
  id v70 = +[NSMutableString string];
  [v70 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v70 appendFormat:@"Ping Performance (%@)\n", v12];
  [v70 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v71 = [(W5LogManager *)self __pingUsingCFNetworkWithAddress:v12 count:10 timeout:1 trafficClass:&off_1000EB3E0 networkServiceType:0];
  [v70 appendFormat:@"count=%ld\n", [v71 count]];
  [v71 min];
  [v70 appendFormat:@"min=%.2f ms\n", v72];
  [v71 max];
  [v70 appendFormat:@"max=%.2f ms\n", v73];
  [v71 avg];
  [v70 appendFormat:@"avg=%.2f ms\n", v74];
  [v71 stddev];
  [v70 appendFormat:@"stddev=%.2f ms\n", v75];
  [v71 packetLoss];
  [v70 appendFormat:@"loss=%.2f%%\n", v76];
  [v6 appendData:[v70 dataUsingEncoding:4]];
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v78, "path"), "stringByAppendingPathComponent:", @"ping-CFNetwork.txt"), v6, 0))
  {
    double v80 = +[NSURL fileURLWithPath:@"ping-CFNetwork.txt"];
    [v79 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v80, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v79 setCompletedAt:];
  return v79;
}

- (id)__collect_ifconfig:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [[[objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "path"), "stringByAppendingPathComponent:", @"ifconfig.txt");
  [+[NSFileManager defaultManager] removeItemAtPath:v6 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v6 contents:0 attributes:0];
  id v7 = +[NSFileHandle fileHandleForUpdatingAtPath:v6];
  if (v7)
  {
    id v8 = v7;
    [(W5LogManager *)self __runToolWithOutputFileHandle:v7 launchPath:@"/sbin/ifconfig" arguments:&off_1000EFFF0];
    [(NSFileHandle *)v8 closeFile];
    CFStringRef v10 = +[NSURL fileURLWithPath:@"ifconfig.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collect_ipconfig:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  if (v7)
  {
    v10[0] = @"getpacket";
    v10[1] = v7;
    if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/sbin/ipconfig", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2), objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"ipconfig.txt"), 0))
    {
      double v9 = +[NSURL fileURLWithPath:@"ipconfig.txt"];
      [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1)];
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collect_traceroute:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  if (v7)
  {
    v10[0] = @"-n";
    v10[1] = @"-m";
    void v10[2] = @"6";
    void v10[3] = @"-i";
    void v10[4] = v7;
    v10[5] = @"-w";
    v10[6] = @"2";
    v10[7] = @"-q";
    v10[8] = @"1";
    v10[9] = @"captive.apple.com";
    if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/sbin/traceroute", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 10), objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"traceroute.txt"), 0))
    {
      double v9 = +[NSURL fileURLWithPath:@"traceroute.txt"];
      [v5 setRelativeURLs:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1)];
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collect_kextstat:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/sbin/kextstat", 0, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "path"), "stringByAppendingPathComponent:", @"kextstat.txt"), 0))
  {
    id v6 = +[NSURL fileURLWithPath:@"kextstat.txt"];
    [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collect_ioreg:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/sbin/ioreg", &off_1000F0008, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "path"), "stringByAppendingPathComponent:", @"ioreg.txt"), 0))
  {
    id v6 = +[NSURL fileURLWithPath:@"ioreg.txt"];
    [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collect_top:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/bin/top", &off_1000F0020, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "path"), "stringByAppendingPathComponent:", @"top.txt"), 0))
  {
    id v6 = +[NSURL fileURLWithPath:@"top.txt"];
    [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collect_netstat:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  CFStringRef v7 = (const __CFString *)[a3 configuration][@"FileNameOverride"];
  id v8 = [v6 path];
  if (!v7) {
    CFStringRef v7 = @"netstat.txt";
  }
  id v9 = [v8 stringByAppendingPathComponent:v7];
  [+[NSFileManager defaultManager] removeItemAtPath:v9 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v9 contents:0 attributes:0];
  CFStringRef v10 = +[NSFileHandle fileHandleForUpdatingAtPath:v9];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
    if (v12)
    {
      id v13 = v12;
      v18[0] = @"-n";
      v18[1] = @"-s";
      void v18[2] = @"-I";
      void v18[3] = v12;
      [(W5LogManager *)self __runToolWithOutputFileHandle:v11 launchPath:@"/usr/sbin/netstat" arguments:+[NSArray arrayWithObjects:v18 count:4]];
      v17[0] = @"-n";
      v17[1] = @"-I";
      void v17[2] = v13;
      [(W5LogManager *)self __runToolWithOutputFileHandle:v11 launchPath:@"/usr/sbin/netstat" arguments:+[NSArray arrayWithObjects:v17 count:3]];
      v16[0] = @"-qq";
      v16[1] = @"-I";
      v16[2] = v13;
      [(W5LogManager *)self __runToolWithOutputFileHandle:v11 launchPath:@"/usr/sbin/netstat" arguments:+[NSArray arrayWithObjects:v16 count:3]];
    }
    [(W5LogManager *)self __runToolWithOutputFileHandle:v11 launchPath:@"/usr/sbin/netstat" arguments:&off_1000F0038];
    [(W5LogManager *)self __runToolWithOutputFileHandle:v11 launchPath:@"/usr/sbin/netstat" arguments:&off_1000F0050];
    [(NSFileHandle *)v11 closeFile];
    double v15 = +[NSURL fileURLWithPath:v7];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectSystemConfiguration:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  if (sub_1000980A8(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/Library/Preferences/SystemConfiguration"), objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "URLByAppendingPathComponent:", @"SystemConfiguration"), 0))
  {
    id v6 = +[NSURL fileURLWithPath:@"SystemConfiguration"];
    [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collect_configd:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [[[a3 configuration] objectForKeyedSubscript:@"OutputDirectory"];
  if (+[NSTask runTaskWithLaunchPath:arguments:error:](NSTask, "runTaskWithLaunchPath:arguments:error:", @"/usr/sbin/scutil", &off_1000F0068, 0)&& sub_1000980A8(+[NSURL fileURLWithPath:@"/var/tmp/configd-store.plist"], v5, 0))
  {
    CFStringRef v7 = +[NSURL fileURLWithPath:@"configd-store.plist"];
    [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collect_wl_curpower:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  if (-[W5LogManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000F0080, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "path"), "stringByAppendingPathComponent:", @"wl_curpower.txt"), 0))
  {
    CFStringRef v7 = +[NSURL fileURLWithPath:@"wl_curpower.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collect_wl_cca_get_stats:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  if (-[W5LogManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000F0098, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "path"), "stringByAppendingPathComponent:", @"wl_cca_get_stats.txt"), 0))
  {
    CFStringRef v7 = +[NSURL fileURLWithPath:@"wl_cca_get_stats.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collect_spindump:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  uint64_t v10 = 0;
  if (+[NSTask runTaskWithLaunchPath:@"/usr/sbin/spindump" arguments:0 timeout:0 outputData:0 errorData:0 launchHandler:0 didLaunch:60.0 error:&v10])
  {
    id v7 = [[-[W5LogManager __mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:](self, "__mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:", &off_1000F00B0, @"spindump", 0, 0, 0, 300.0) firstObject];
    if (v7)
    {
      id v8 = v7;
      if (sub_1000980A8(+[NSURL fileURLWithPath:v7], v6, 0))
      {
        uint64_t v11 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [v8 lastPathComponent]);
        [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1)];
      }
      [+[NSFileManager defaultManager] removeItemAtPath:v8 error:0];
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collect_darwinup:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/local/bin/darwinup", &off_1000F00C8, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "path"), "stringByAppendingPathComponent:", @"darwinup_list.txt"), 0))
  {
    id v6 = +[NSURL fileURLWithPath:@"darwinup_list.txt"];
    [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collect_hosts:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  if (sub_1000980A8(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/etc/hosts"), objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "URLByAppendingPathComponent:", @"hosts"), 0))
  {
    id v6 = +[NSURL fileURLWithPath:@"hosts"];
    [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collect_sysdiagnose:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v14 = 0;
  *(void *)id v19 = 0;
  *(void *)&v19[8] = v19;
  *(void *)&v19[16] = 0x3052000000;
  *(void *)&long long v20 = sub_10005D9A4;
  *((void *)&v20 + 1) = sub_10005D9B4;
  id v6 = (void *)qword_100103708;
  uint64_t v21 = qword_100103708;
  if (!qword_100103708)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10007D830;
    void v15[3] = &unk_1000DD348;
    v15[4] = v19;
    sub_10007D830((uint64_t)v15);
    id v6 = *(void **)(*(void *)&v19[8] + 40);
  }
  _Block_object_dispose(v19, 8);
  id v7 = [v6 sysdiagnoseWithMetadata:&off_1000EF320 withError:&v14];
  if (v7)
  {
    if (sub_1000980A8(+[NSURL fileURLWithPath:v7], v5, 0))
    {
      id v8 = +[NSFileManager defaultManager];
      v17[0] = NSFilePosixPermissions;
      v17[1] = NSFileOwnerAccountID;
      v18[0] = &off_1000EB908;
      v18[1] = &off_1000EB350;
      void v17[2] = NSFileGroupOwnerAccountID;
      void v18[2] = &off_1000EB350;
      -[NSFileManager setAttributes:ofItemAtPath:error:](v8, "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3), [objc_msgSend(objc_msgSend(v5, "URLByAppendingPathComponent:", objc_msgSend(v7, "lastPathComponent")), "path"]), 0);
      CFStringRef v16 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [v7 lastPathComponent]);
      [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1)];
    }
    [+[NSFileManager defaultManager] removeItemAtPath:v7 error:0];
  }
  else
  {
    uint64_t v10 = sub_10009756C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v14 code];
      *(_DWORD *)id v19 = 136315906;
      *(void *)&v19[4] = "-[W5LogManager __collect_sysdiagnose:]";
      *(_WORD *)&v19[12] = 2080;
      *(void *)&v19[14] = "W5LogManager.m";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 4146;
      WORD2(v20) = 2048;
      *(void *)((char *)&v20 + 6) = v11;
      LODWORD(v13) = 38;
      id v12 = v19;
      _os_log_send_and_compose_impl();
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collect_ndp:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "path") stringByAppendingPathComponent:@"ndp.txt"]
  [+[NSFileManager defaultManager] removeItemAtPath:v6 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v6 contents:0 attributes:0];
  id v7 = +[NSFileHandle fileHandleForUpdatingAtPath:v6];
  if (v7)
  {
    id v8 = v7;
    [(W5LogManager *)self __runToolWithOutputFileHandle:v7 launchPath:@"/usr/sbin/ndp" arguments:&off_1000F00E0];
    [(W5LogManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/sbin/ndp" arguments:&off_1000F00F8];
    [(W5LogManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/sbin/ndp" arguments:&off_1000F0110];
    id v9 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
    if (v9)
    {
      v12[0] = @"-i";
      v12[1] = v9;
      [(W5LogManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/sbin/ndp" arguments:+[NSArray arrayWithObjects:v12 count:2]];
    }
    [(NSFileHandle *)v8 closeFile];
    id v11 = +[NSURL fileURLWithPath:@"ndp.txt"];
    [v5 setRelativeURLs:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectTCPDump_PRE:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"UUID"];
  id v8 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"Timeout"];
  if (v8) {
    uint64_t v9 = (uint64_t)[v8 unsignedIntegerValue];
  }
  else {
    uint64_t v9 = 60;
  }
  uint64_t v10 = dispatch_semaphore_create(0);
  id v11 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  if (v11)
  {
    id v12 = v11;
    id v13 = [[[v6 path] stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_tcpdump.pcap", v11)];
    v20[0] = @"-q";
    v20[1] = @"-n";
    void v20[2] = @"-i";
    void v20[3] = v12;
    v20[4] = @"-G";
    v20[5] = +[NSString stringWithFormat:@"%lu", v9];
    v20[6] = @"-W";
    v20[7] = @"1";
    v20[8] = @"-w";
    v20[9] = v13;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    void v17[2] = sub_10006A10C;
    void v17[3] = &unk_1000DED50;
    v17[4] = self;
    v17[5] = v7;
    v17[6] = v13;
    v17[7] = v5;
    v17[8] = v12;
    v17[9] = v10;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006A294;
    void v16[3] = &unk_1000DED78;
    v16[4] = self;
    v16[5] = v7;
    +[NSTask runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:](NSTask, "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:", @"/usr/sbin/tcpdump", +[NSArray arrayWithObjects:v20 count:10], v17, 0, v16, 0.0);
    dispatch_time_t v14 = dispatch_time(0, 600000000000);
    if (dispatch_semaphore_wait(v10, v14) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v19 = 0x4082C00000000000;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectTCPDump_POST:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  unsigned __int8 v7 = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] BOOLValue];
  id v8 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"UUID"];
  if (v8)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006A490;
    block[3] = &unk_1000DEDA0;
    block[4] = self;
    block[5] = v8;
    unsigned __int8 v12 = v7;
    block[6] = v6;
    void block[7] = v5;
    dispatch_async(queue, block);
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collect_pmset:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/bin/pmset", &off_1000F0128, objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "path"), "stringByAppendingPathComponent:", @"pmset_everything.txt"), 0))
  {
    id v6 = +[NSURL fileURLWithPath:@"pmset_everything.txt"];
    [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (unint64_t)__calculateSizeAtPath:(id)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  char v15 = 0;
  if ([+[NSFileManager defaultManager] fileExistsAtPath:a3 isDirectory:&v15])
  {
    if (v15)
    {
      id v5 = dispatch_queue_create(0, 0);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10006A804;
      void v9[3] = &unk_1000DEDF0;
      uint64_t v10 = [+[NSFileManager defaultManager] contentsOfDirectoryAtPath:a3 error:0];
      id v11 = self;
      id v12 = a3;
      id v13 = v5;
      dispatch_time_t v14 = &v16;
      dispatch_apply([(NSArray *)v10 count], 0, v9);
      if (v5) {
        dispatch_release(v5);
      }
    }
    else
    {
      unint64_t v6 = [(NSDictionary *)[+[NSFileManager defaultManager] attributesOfItemAtPath:a3 error:0] fileSize];
      v17[3] += v6;
    }
  }
  unint64_t v7 = v17[3];
  _Block_object_dispose(&v16, 8);
  return v7;
}

- (id)__collectFilesInDirectories:(id)a3 include:(id)a4 exclude:(id)a5 maxAge:(double)a6 maxCount:(unint64_t)a7 maxSize:(unint64_t)a8 outputDirectory:(id)a9 compress:(BOOL)a10 remainingSize:(unint64_t *)a11 contentFilter:(id)a12
{
  uint64_t v18 = a11;
  id v46 = +[NSMutableArray array];
  id v19 = [(W5LogManager *)self __mostRecentInDirectories:a3 include:a4 exclude:a5 maxAge:a6];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v20 = [v19 countByEnumeratingWithState:&v54 objects:v70 count:16];
  if (!v20)
  {
    unint64_t v50 = 0;
    if (a11) {
      goto LABEL_35;
    }
    return [v46 copy:v44, v45];
  }
  id v21 = v20;
  id v22 = 0;
  unint64_t v50 = 0;
  unint64_t v51 = 0;
  uint64_t v52 = *(void *)v55;
  while (2)
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v55 != v52) {
        objc_enumerationMutation(v19);
      }
      id v24 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", *(void *)(*((void *)&v54 + 1) + 8 * i), v44, v45);
      char v53 = 0;
      [+[NSFileManager defaultManager] fileExistsAtPath:[(NSURL *)v24 path] isDirectory:&v53];
      if (a12 && v53)
      {
        if (!v22) {
          id v22 = +[W5LogManager __temporaryDirectory];
        }
        id v25 = (NSURL *)[v22 URLByAppendingPathComponent:-[NSURL lastPathComponent](v24, "lastPathComponent")];
        sub_1000980A8(v24, v25, 0);
        (*((void (**)(id, NSURL *))a12 + 2))(a12, v25);
        id v24 = v25;
      }
      id v26 = [a9 URLByAppendingPathComponent:-[NSURL lastPathComponent](v24, "lastPathComponent")];
      id v27 = v26;
      if (a10)
      {
        id v27 = [v26 URLByAppendingPathExtension:@"tgz"];
        if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [v27 path])|| (sub_1000975B0(v24, v27, 0) & 1) == 0)
        {
          goto LABEL_25;
        }
      }
      else if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [v26 path])|| !sub_1000980A8(v24, v27, 0))
      {
LABEL_25:
        id v38 = sub_10009756C();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          id v39 = [v27 path];
          int v58 = 138543362;
          unint64_t v59 = (unint64_t)v39;
          LODWORD(v45) = 12;
          CFStringRef v44 = &v58;
          _os_log_send_and_compose_impl();
        }
        continue;
      }
      id v49 = v22;
      id v28 = a9;
      id v29 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", [v27 path], 0);
      unint64_t v30 = [(NSDictionary *)v29 fileSize];
      unint64_t v31 = v30 + v50;
      unint64_t v32 = ++v51;
      if (v29)
      {
        unint64_t v33 = v30;
        id v34 = sub_10009756C();
        BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        if (v31 > a8 || v32 > a7)
        {
          if (v35)
          {
            id v43 = [v27 path];
            int v58 = 134219266;
            unint64_t v59 = v31;
            __int16 v60 = 2048;
            unint64_t v61 = a8;
            __int16 v62 = 2048;
            unint64_t v63 = v33;
            __int16 v64 = 2048;
            unint64_t v65 = v32;
            __int16 v66 = 2048;
            unint64_t v67 = a7;
            __int16 v68 = 2114;
            id v69 = v43;
            LODWORD(v45) = 62;
            CFStringRef v44 = &v58;
            _os_log_send_and_compose_impl();
          }
          -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager", v44, v45), "removeItemAtPath:error:", [v27 path], 0);
          id v22 = v49;
          if (!v49) {
            goto LABEL_34;
          }
LABEL_33:
          [+[NSFileManager defaultManager] removeItemAtURL:v22 error:0];
          goto LABEL_34;
        }
        if (v35)
        {
          id v37 = [v27 path];
          int v58 = 134219266;
          unint64_t v59 = v31;
          __int16 v60 = 2048;
          unint64_t v61 = a8;
          __int16 v62 = 2048;
          unint64_t v63 = v33;
          __int16 v64 = 2048;
          unint64_t v65 = v51;
          __int16 v66 = 2048;
          unint64_t v67 = a7;
          __int16 v68 = 2114;
          id v69 = v37;
          LODWORD(v45) = 62;
          CFStringRef v44 = &v58;
          _os_log_send_and_compose_impl();
        }
        [v46 addObject:[NSURL fileURLWithPath:objc_msgSend(v27, "lastPathComponent", v44, v45)]];
      }
      else
      {
        CFStringRef v40 = sub_10009756C();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          id v41 = [v27 path];
          int v58 = 138543362;
          unint64_t v59 = (unint64_t)v41;
          LODWORD(v45) = 12;
          CFStringRef v44 = &v58;
          _os_log_send_and_compose_impl();
        }
      }
      unint64_t v50 = v31;
      a9 = v28;
      id v22 = v49;
    }
    id v21 = [v19 countByEnumeratingWithState:&v54 objects:v70 count:16];
    if (v21) {
      continue;
    }
    break;
  }
  if (v22) {
    goto LABEL_33;
  }
LABEL_34:
  uint64_t v18 = a11;
  if (a11) {
LABEL_35:
  }
    unint64_t *v18 = a8 - v50;
  return [v46 copy:v44, v45];
}

- (id)__collectFileAtURL:(id)a3 outputDirectory:(id)a4 maxAge:(double)a5 maxSize:(unint64_t)a6 compress:(BOOL)a7 remainingSize:(unint64_t *)a8
{
  BOOL v9 = a7;
  if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [a3 path]))return 0; {
  +[NSDate timeIntervalSinceReferenceDate];
  }
  double v15 = v14;
  id v16 = [a4 URLByAppendingPathComponent:[a3 lastPathComponent]];
  id v17 = v16;
  if (v9)
  {
    id v17 = [v16 URLByAppendingPathExtension:@"tgz"];
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [v17 path])|| (sub_1000975B0(a3, v17, 0) & 1) == 0)
    {
LABEL_19:
      id v29 = sub_10009756C();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 138543362;
        id v36 = [v17 path];
        _os_log_send_and_compose_impl();
      }
      return 0;
    }
  }
  else if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [v16 path])|| !sub_1000980A8(a3, v17, 0))
  {
    goto LABEL_19;
  }
  uint64_t v18 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", [v17 path], 0);
  if (v18)
  {
    id v19 = v18;
    [(NSDate *)[(NSDictionary *)v18 fileCreationDate] timeIntervalSinceReferenceDate];
    double v21 = v20;
    [(NSDate *)[(NSDictionary *)v19 fileModificationDate] timeIntervalSinceReferenceDate];
    double v23 = v22;
    id v24 = [(NSDictionary *)v19 fileSize];
    if (a6 < (unint64_t)v24
      || ((double v25 = v15 - v21, v26 = v15 - v23, v15 - v21 > a5) ? (v27 = v26 <= a5) : (v27 = 1), !v27))
    {
      unint64_t v30 = sub_10009756C();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 134219266;
        id v36 = (id)a6;
        __int16 v37 = 2048;
        id v38 = v24;
        __int16 v39 = 2048;
        unint64_t v40 = (unint64_t)a5;
        __int16 v41 = 2114;
        id v42 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v21];
        __int16 v43 = 2114;
        CFStringRef v44 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v23];
        __int16 v45 = 2114;
        id v46 = [v17 path];
        LODWORD(v34) = 62;
        unint64_t v33 = &v35;
        _os_log_send_and_compose_impl();
      }
      -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager", v33, v34), "removeItemAtPath:error:", [v17 path], 0);
      return 0;
    }
    if (a8)
    {
      id v28 = sub_10009756C();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 134219266;
        id v36 = (id)a6;
        __int16 v37 = 2048;
        id v38 = v24;
        __int16 v39 = 2048;
        unint64_t v40 = (unint64_t)a5;
        __int16 v41 = 2114;
        id v42 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v21];
        __int16 v43 = 2114;
        CFStringRef v44 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v23];
        __int16 v45 = 2114;
        id v46 = [v17 path];
        _os_log_send_and_compose_impl();
      }
      *a8 = a6 - (void)v24;
    }
  }
  else
  {
    unint64_t v31 = sub_10009756C();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 138543362;
      id v36 = [v17 path];
      _os_log_send_and_compose_impl();
    }
  }
  if (v17) {
    return [NSURL fileURLWithPath:objc_msgSend(v17, "lastPathComponent", v25, v26)];
  }
  return 0;
}

- (id)__mostRecentInDirectories:(id)a3 include:(id)a4 exclude:(id)a5 maxAge:(double)a6
{
  id v31 = +[NSMutableArray array];
  +[NSDate timeIntervalSinceReferenceDate];
  double v11 = v10;
  id v37 = +[NSMutableDictionary dictionary];
  id v38 = +[NSMutableSet set];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = a3;
  id v34 = [a3 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v44;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v12;
        id v13 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
        double v14 = [+[NSFileManager defaultManager] contentsOfDirectoryAtPath:v13 error:0];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v40;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v40 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              double v21 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", [v13 stringByAppendingPathComponent:v19], 0);
              [(NSDate *)[(NSDictionary *)v21 fileCreationDate] timeIntervalSinceReferenceDate];
              double v23 = v22;
              [(NSDate *)[(NSDictionary *)v21 fileModificationDate] timeIntervalSinceReferenceDate];
              double v25 = v24;
              double v26 = v11 - v23;
              double v27 = v11 - v25;
              BOOL v28 = v11 - v23 > a6 && v27 > a6;
              if (!v28
                && (!a4
                 || objc_msgSend(a4, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length", v26, v27)))&& (!a5|| !objc_msgSend(a5, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length", v26, v27)))&& (objc_msgSend(v38, "containsObject:", v19, v26, v27) & 1) == 0)
              {
                if (v23 <= v25) {
                  double v29 = v25;
                }
                else {
                  double v29 = v23;
                }
                [v37 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v29) forKeyedSubscript:objc_msgSend(v13, "stringByAppendingPathComponent:", v19)];
                [v38 addObject:v19];
              }
            }
            id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v16);
        }
        uint64_t v12 = v36 + 1;
      }
      while ((id)(v36 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v34);
  }
  [v31 addObjectsFromArray:[v37 keysSortedByValueUsingComparator:&stru_1000DEE10]];
  return [v31 copy];
}

- (id)__mostRecentInDirectories:(id)a3 matchingPrefix:(id)a4 matchingSuffix:(id)a5 excludingPrefix:(id)a6 excludingSuffix:(id)a7 maxAge:(double)a8
{
  id v32 = +[NSMutableArray array];
  +[NSDate timeIntervalSinceReferenceDate];
  double v12 = v11;
  id v38 = +[NSMutableDictionary dictionary];
  id v39 = +[NSMutableSet set];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = a3;
  id v35 = [a3 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v48;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v48 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v13;
        double v14 = *(void **)(*((void *)&v47 + 1) + 8 * v13);
        id v15 = [+[NSFileManager defaultManager] contentsOfDirectoryAtPath:v14 error:0];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v44;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v44 != v18) {
                objc_enumerationMutation(v15);
              }
              double v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              double v22 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", [v14 stringByAppendingPathComponent:v20], 0);
              [(NSDate *)[(NSDictionary *)v22 fileCreationDate] timeIntervalSinceReferenceDate];
              double v24 = v23;
              [(NSDate *)[(NSDictionary *)v22 fileModificationDate] timeIntervalSinceReferenceDate];
              double v26 = v25;
              double v27 = v12 - v24;
              double v28 = v12 - v26;
              BOOL v29 = v12 - v24 > a8 && v28 > a8;
              if (!v29
                && (!a4 || objc_msgSend(v20, "hasPrefix:", a4, v27, v28))
                && (!a5 || objc_msgSend(v20, "hasSuffix:", a5, v27, v28))
                && (!a6 || (objc_msgSend(v20, "hasPrefix:", a6, v27, v28) & 1) == 0)
                && (!a7 || (objc_msgSend(v20, "hasSuffix:", a7, v27, v28) & 1) == 0)
                && (objc_msgSend(v39, "containsObject:", v20, v27, v28) & 1) == 0)
              {
                if (v24 <= v26) {
                  double v30 = v26;
                }
                else {
                  double v30 = v24;
                }
                [v38 setObject:[NSNumber numberWithDouble:v30] forKeyedSubscript:[v14 stringByAppendingPathComponent:v20]];
                [v39 addObject:v20];
              }
            }
            id v17 = [(NSArray *)v15 countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v17);
        }
        uint64_t v13 = v37 + 1;
      }
      while ((id)(v37 + 1) != v35);
      id v35 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v35);
  }
  [v32 addObjectsFromArray:[v38 keysSortedByValueUsingComparator:&stru_1000DEE30]];
  return [v32 copy];
}

- (id)__possibleCoreCapturePathsWithComponent:(id)a3
{
  id v4 = +[NSMutableArray array];
  if (!a3) {
    a3 = @"WiFi";
  }
  [v4 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"/Library/Logs/CrashReporter/CoreCapture/%@", a3)];
  [v4 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"/Library/Logs/CoreCapture/%@", a3)];
  [v4 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"/var/mobile/Library/Logs/CrashReporter/CoreCapture/%@", a3)];
  id result = [v4 count];
  if (result)
  {
    id v6 = [v4 copy];
    return v6;
  }
  return result;
}

- (void)__filterCoreCaptureContent:(id)a3
{
  id v4 = +[NSMutableArray array];
  id v5 = +[NSRegularExpression regularExpressionWithPattern:@"\\.bin$|\\.pcapng\\.gz$" options:0 error:0];
  NSURLResourceKey v27 = NSURLNameKey;
  id v6 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") enumeratorAtURL:a3 includingPropertiesForKeys:+[NSArray arrayWithObjects:&v27 count:1] options:0 errorHandler:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [(NSDirectoryEnumerator *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v10);
        id v20 = 0;
        [v11 getResourceValue:&v20 forKey:NSURLNameKey error:0];
        if (-[NSRegularExpression firstMatchInString:options:range:](v5, "firstMatchInString:options:range:", v20, 0, 0, [v20 length]))
        {
          [v4 addObject:v11];
        }
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSDirectoryEnumerator *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = [v4 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v4);
        }
        [+[NSFileManager defaultManager] removeItemAtURL:*(void *)(*((void *)&v16 + 1) + 8 * (void)v15) error:0];
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v4 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v13);
  }
}

- (id)__collectCoreCaptureDump:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  CFStringRef v6 = (const __CFString *)[a3 configuration][@"Reason"];
  if (v6) {
    CFStringRef v7 = v6;
  }
  else {
    CFStringRef v7 = @"WiFiDebug";
  }
  CFStringRef v8 = (const __CFString *)[a3 configuration][@"Component"];
  if (v8) {
    CFStringRef v9 = v8;
  }
  else {
    CFStringRef v9 = @"WiFi";
  }
  [(W5LogManager *)self __dumpCoreCaptureLogsWithReason:v7 component:v9];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectCoreCapture:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"MaxAge"];
  if (v6)
  {
    [v6 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 1.79769313e308;
  }
  id v9 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"MaxCount"];
  if (v9) {
    uint64_t v27 = (uint64_t)[v9 unsignedIntegerValue];
  }
  else {
    uint64_t v27 = -1;
  }
  id v10 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"MaxSize"];
  if (v10) {
    uint64_t v26 = (uint64_t)[v10 unsignedIntegerValue];
  }
  else {
    uint64_t v26 = -1;
  }
  unsigned __int8 v25 = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] boolValue];
  unsigned int v11 = [[[a3 configuration] objectForKeyedSubscript:@"FilterContent"] BOOLValue];
  CFStringRef v12 = (const __CFString *)[a3 configuration][@"Component"];
  if (v12) {
    CFStringRef v13 = v12;
  }
  else {
    CFStringRef v13 = @"WiFi";
  }
  uint64_t v14 = (NSRegularExpression *)[((NSRegularExpression *)[a3 configuration]) objectForKeyedSubscript:@"IncludeMatching"];
  id v15 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"ExcludeMatching"];
  id v16 = +[NSMutableArray array];
  CFStringRef v17 = &stru_1000E06F0;
  if (v11) {
    CFStringRef v17 = @"-Filtered";
  }
  long long v18 = +[NSString stringWithFormat:@"CoreCapture%@", v17];
  long long v19 = v5;
  [+[NSFileManager defaultManager](NSFileManager, "defaultManager") createDirectoryAtPath:[objc_msgSend(objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", v18), "stringByAppendingPathComponent:", v13) stringByAppendingPathComponent:v13] withIntermediateDirectories:1 attributes:0 error:0];
  id v20 = 0;
  if (v11)
  {
    id v20 = v29;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    void v29[2] = sub_10006C1B0;
    void v29[3] = &unk_1000DEE58;
    void v29[4] = self;
  }
  if (v14) {
    uint64_t v14 = +[NSRegularExpression regularExpressionWithPattern:v14 options:0 error:0];
  }
  if (v15) {
    long long v21 = +[NSRegularExpression regularExpressionWithPattern:v15 options:0 error:0];
  }
  else {
    long long v21 = 0;
  }
  LOBYTE(v24) = v25;
  [-[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:](self, "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:", -[W5LogManager __possibleCoreCapturePathsWithComponent:](self, "__possibleCoreCapturePathsWithComponent:", v13), v14, v21, v27, v26, [[objc_msgSend(objc_msgSend(v19, "URLByAppendingPathComponent:", v18), "URLByAppendingPathComponent:", v13) stringByAppendingPathComponent:v13], v8, v24, 0, v20);
  [v16 addObject:[NSURL fileURLWithPath:v18]];
  id v22 = [(W5LogManager *)self __collectFileAtURL:+[NSURL fileURLWithPath:@"/var/log/corecaptured.log"] outputDirectory:v19 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:1 compress:0 remainingSize:1.79769313e308];
  if (v22) {
    [v16 addObject:v22];
  }
  [v4 setRelativeURLs:v16];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collectCoreCapture24:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  unsigned __int8 v18 = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] BOOLValue];
  unsigned int v6 = [[[a3 configuration] objectForKeyedSubscript:@"FilterContent"] BOOLValue];
  CFStringRef v7 = (const __CFString *)[a3 configuration][@"Component"];
  if (v7) {
    CFStringRef v8 = v7;
  }
  else {
    CFStringRef v8 = @"WiFi";
  }
  id v9 = (NSRegularExpression *)[objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"IncludeMatching")];
  id v10 = (NSRegularExpression *)[objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"ExcludeMatching")];
  id v11 = +[NSMutableArray array];
  CFStringRef v12 = &stru_1000E06F0;
  if (v6) {
    CFStringRef v12 = @"-Filtered";
  }
  CFStringRef v13 = +[NSString stringWithFormat:@"CoreCapture%@", v12];
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", [objc_msgSend(objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", v13), "stringByAppendingPathComponent:", v8), "stringByAppendingPathComponent:", v8], 1, 0, 0);
  uint64_t v14 = 0;
  if (v6)
  {
    uint64_t v14 = v20;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_10006C4D0;
    void v20[3] = &unk_1000DEE58;
    v20[4] = self;
  }
  if (v9) {
    id v9 = +[NSRegularExpression regularExpressionWithPattern:v9 options:0 error:0];
  }
  if (v10) {
    id v10 = +[NSRegularExpression regularExpressionWithPattern:v10 options:0 error:0];
  }
  LOBYTE(v17) = v18;
  -[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:](self, "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:", -[W5LogManager __possibleCoreCapturePathsWithComponent:](self, "__possibleCoreCapturePathsWithComponent:", v8), v9, v10, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, [objc_msgSend(objc_msgSend(v5, "URLByAppendingPathComponent:", v13), "URLByAppendingPathComponent:", v8), "stringByAppendingPathComponent:", v8], 86400.0, v17, 0, v14);
  [v11 addObject:[NSURL fileURLWithPath:v13]];
  id v15 = [(W5LogManager *)self __collectFileAtURL:+[NSURL fileURLWithPath:@"/var/log/corecaptured.log"] outputDirectory:v5 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:1 compress:0 remainingSize:1.79769313e308];
  if (v15) {
    [v11 addObject:v15];
  }
  [v4 setRelativeURLs:v11];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collectWiFiPreferences:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  unsigned int v7 = [[[a3 configuration] objectForKeyedSubscript:@"UseMegaWiFiProfileLimits"] BOOLValue];
  id v8 = +[NSMutableArray array];
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", @"/Library/Preferences/SystemConfiguration/com.apple.wifi.plist")&& sub_1000980A8(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/Library/Preferences/SystemConfiguration/com.apple.wifi.plist"), [v6 URLByAppendingPathComponent:@"com.apple.wifi.plist"], 0))
  {
    [v8 addObject:[NSURL fileURLWithPath:@"com.apple.wifi.plist"]];
  }
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", @"/Library/Preferences/SystemConfiguration/com.apple.wifi-networks.plist")&& sub_1000980A8(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/Library/Preferences/SystemConfiguration/com.apple.wifi-networks.plist"), [v6 URLByAppendingPathComponent:@"LEGACY_com.apple.wifi-networks.plist"], 0))
  {
    [v8 addObject:[NSURL fileURLWithPath:@"LEGACY_com.apple.wifi-networks.plist"]];
  }
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", @"/Library/Preferences/SystemConfiguration/com.apple.wifi-private-mac-networks.plist")&& sub_1000980A8(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/Library/Preferences/SystemConfiguration/com.apple.wifi-private-mac-networks.plist"), [v6 URLByAppendingPathComponent:@"com.apple.wifi-private-mac-networks.plist"], 0))
  {
    [v8 addObject:[NSURL fileURLWithPath:@"com.apple.wifi-private-mac-networks.plist"]];
  }
  if ((os_variant_has_internal_content() | v7) == 1)
  {
    id v9 = +[NSString stringWithFormat:@"%@.plist", CWFKnownNetworksStoreIdentifier];
    id v10 = +[NSString stringWithFormat:@"/Library/Preferences/%@", v9];
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v10)&& sub_1000980A8(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10), [v6 URLByAppendingPathComponent:v9], 0))
    {
      [v8 addObject:+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v9)];
    }
    id v11 = [+[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.wifi.logs"];
    CFStringRef v12 = [(NSString *)[(NSURL *)v11 path] stringByAppendingPathComponent:@"com.apple.wifi.syncable-networks.plist"];
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v12)&& sub_1000980A8(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v12), [v6 URLByAppendingPathComponent:@"com.apple.wifi.syncable-networks.plist"], 0))
    {
      [v8 addObject:[NSURL fileURLWithPath:@"com.apple.wifi.syncable-networks.plist"]];
    }
    CFStringRef v13 = [(NSString *)[(NSURL *)v11 path] stringByAppendingPathComponent:@"com.apple.wifi.syncable-networks.legacy.plist"];
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v13)&& sub_1000980A8(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13), [v6 URLByAppendingPathComponent:@"com.apple.wifi.syncable-networks.legacy.plist"], 0))
    {
      [v8 addObject:[NSURL fileURLWithPath:@"com.apple.wifi.syncable-networks.legacy.plist"]];
    }
    uint64_t v14 = [(NSString *)[(NSURL *)v11 path] stringByAppendingPathComponent:@"com.apple.wifi.recent-networks.json"];
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v14)&& sub_1000980A8(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v14), [v6 URLByAppendingPathComponent:@"com.apple.wifi.recent-networks.json"], 0))
    {
      [v8 addObject:[+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"com.apple.wifi.recent-networks.json")];
    }
  }
  else
  {
    debugLogQueue = self->_debugLogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006C9B4;
    block[3] = &unk_1000DDC30;
    block[4] = a3;
    block[5] = self;
    dispatch_async(debugLogQueue, block);
  }
  [v5 setRelativeURLs:v8];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectNetworkPreferences:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v6 = +[NSMutableArray array];
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", @"/Library/Preferences/SystemConfiguration/preferences.plist")&& sub_1000980A8(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/Library/Preferences/SystemConfiguration/preferences.plist"), [v5 URLByAppendingPathComponent:@"preferences.plist"], 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"preferences.plist"]];
  }
  [v4 setRelativeURLs:v6];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__possibleTempWiFiLogPaths
{
  return &off_1000F0140;
}

- (void)__dumpWiFiLogs
{
  CFDictionaryRef v2 = [(W5StatusManager *)self->_status concurrentQueue];

  [(NSOperationQueue *)v2 addOperationWithBlock:&stru_1000DEE78];
}

- (id)__collectFilteredWiFiManagerLogArchiveWithOutputURL:(id)a3 compress:(BOOL)a4 age:(unint64_t)a5
{
  BOOL v6 = a4;
  id v9 = [[objc_msgSend(a3, "path") stringByAppendingPathComponent:@"wifi_logarchive.log"];
  void v12[3] = +[NSString stringWithFormat:@"--last=%lus", a5, @"show", @"--debug", @"--signpost"];
  void v12[4] = @"--style=compact";
  v12[5] = @"--predicate=(subsystem CONTAINS \"com.apple.WiFiManager\") OR (subsystem CONTAINS \"wifi.analytics\") OR (senderImagePath CONTAINS \"IO80211Family\") OR (senderImagePath CONTAINS \"AppleBCMWLANCore\") OR (process CONTAINS \"wifid\")";
  id v10 = 0;
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/bin/log", +[NSArray arrayWithObjects:v12 count:6], v9, 0))
  {
    if (v6)
    {
      id v10 = [(W5LogManager *)self __collectFileAtURL:+[NSURL fileURLWithPath:v9] outputDirectory:a3 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:1 compress:0 remainingSize:1.79769313e308];
      [+[NSFileManager defaultManager] removeItemAtPath:v9 error:0];
    }
    else
    {
      return +[NSURL fileURLWithPath:@"wifi_logarchive.log"];
    }
  }
  return v10;
}

- (id)__collectWiFiLogs24:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] BOOLValue];
  id v8 = +[NSMutableArray array];
  id v9 = [(W5LogManager *)self __collectFileAtURL:+[NSURL fileURLWithPath:@"/Library/Logs/wifi.log"] outputDirectory:v6 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:v7 compress:0 remainingSize:86400.0];
  if (v9) {
    [v8 addObject:v9];
  }
  id v10 = [(W5LogManager *)self __collectFileAtURL:+[NSURL fileURLWithPath:@"/Library/Logs/wifimanager.log"] outputDirectory:v6 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:v7 compress:0 remainingSize:86400.0];
  if (v10) {
    [v8 addObject:v10];
  }
  id v11 = [(W5LogManager *)self __collectFileAtURL:+[NSURL fileURLWithPath:@"/Library/Logs/wifi_driver.log"] outputDirectory:v6 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:v7 compress:0 remainingSize:86400.0];
  if (v11) {
    [v8 addObject:v11];
  }
  id v12 = [(W5LogManager *)self __collectFileAtURL:+[NSURL fileURLWithPath:@"/private/var/logs/wifiFirmwareLoader.log"] outputDirectory:v6 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:v7 compress:0 remainingSize:86400.0];
  if (v12) {
    [v8 addObject:v12];
  }
  LOBYTE(v16) = (_BYTE)v7;
  id v13 = [(W5LogManager *)self __collectFilesInDirectories:[(W5LogManager *)self __possibleTempWiFiLogPaths] include:0 exclude:+[NSRegularExpression regularExpressionWithPattern:@"WiFiManager$|WiFiDebugInfo\\.tar\\.gz$" options:0 error:0] maxAge:0x7FFFFFFFFFFFFFFFLL maxCount:0x7FFFFFFFFFFFFFFFLL maxSize:v6 outputDirectory:86400.0 compress:v16 remainingSize:0 contentFilter:0];
  if (v13) {
    [v8 addObjectsFromArray:v13];
  }
  id v14 = [(W5LogManager *)self __collectFilteredWiFiManagerLogArchiveWithOutputURL:v6 compress:v7 age:600];
  if (v14) {
    [v8 addObject:v14];
  }
  [v5 setRelativeURLs:v8];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectWiFiLogs:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"MaxAge"];
  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
  }
  else
  {
    double v9 = 1.79769313e308;
  }
  id v10 = [[[a3 configuration] objectForKeyedSubscript:@"MaxCount"]
  if (v10) {
    uint64_t v11 = (uint64_t)[v10 unsignedIntegerValue];
  }
  else {
    uint64_t v11 = -1;
  }
  id v12 = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] BOOLValue];
  unsigned __int8 v13 = [[[a3 configuration] objectForKeyedSubscript:@"CollectTempWiFiLog"] BOOLValue];
  id v14 = +[NSMutableArray array];
  if (v13)
  {
    uint64_t v11 = 1;
  }
  else
  {
    id v15 = [(W5LogManager *)self __collectFileAtURL:+[NSURL fileURLWithPath:@"/Library/Logs/wifi.log"] outputDirectory:v6 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:v12 compress:0 remainingSize:1.79769313e308];
    if (v15) {
      [v14 addObject:v15];
    }
    id v16 = [(W5LogManager *)self __collectFileAtURL:+[NSURL fileURLWithPath:@"/Library/Logs/wifimanager.log"] outputDirectory:v6 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:v12 compress:0 remainingSize:1.79769313e308];
    if (v16) {
      [v14 addObject:v16];
    }
    id v17 = [(W5LogManager *)self __collectFileAtURL:+[NSURL fileURLWithPath:@"/Library/Logs/wifi_driver.log"] outputDirectory:v6 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:v12 compress:0 remainingSize:1.79769313e308];
    if (v17) {
      [v14 addObject:v17];
    }
    id v18 = [(W5LogManager *)self __collectFileAtURL:+[NSURL fileURLWithPath:@"/private/var/logs/wifiFirmwareLoader.log"] outputDirectory:v6 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:v12 compress:0 remainingSize:1.79769313e308];
    if (v18) {
      [v14 addObject:v18];
    }
  }
  LOBYTE(v22) = (_BYTE)v12;
  id v19 = [(W5LogManager *)self __collectFilesInDirectories:[(W5LogManager *)self __possibleTempWiFiLogPaths] include:0 exclude:+[NSRegularExpression regularExpressionWithPattern:@"WiFiManager$|WiFiDebugInfo\\.tar\\.gz$" options:0 error:0] maxAge:v11 maxCount:0x7FFFFFFFFFFFFFFFLL maxSize:v6 outputDirectory:v9 compress:v22 remainingSize:0 contentFilter:0];
  if (v19) {
    [v14 addObjectsFromArray:v19];
  }
  id v20 = [(W5LogManager *)self __collectFilteredWiFiManagerLogArchiveWithOutputURL:v6 compress:v12 age:600];
  if (v20) {
    [v14 addObject:v20];
  }
  [v5 setRelativeURLs:v14];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectWiFiLogsDump:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  [(W5LogManager *)self __dumpWiFiLogs];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectEAP8021XLogs:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = +[NSMutableArray array];
  if ([+[NSFileManager defaultManager](NSFileManager, "defaultManager") fileExistsAtPath:@"/Library/Preferences/SystemConfiguration/com.apple.network.eapolclient.configuration.plist"]&& sub_1000980A8(+[NSURL fileURLWithPath:@"/Library/Preferences/SystemConfiguration/com.apple.network.eapolclient.configuration.plist"], v6, 0))
  {
    [v7 addObject:[NSURL fileURLWithPath:@"com.apple.network.eapolclient.configuration.plist"]];
  }
  id v8 = [(W5LogManager *)self __mostRecentInDirectories:&off_1000F0158 matchingPrefix:@"com.apple.networking.eapol.log" matchingSuffix:0 excludingPrefix:0 excludingSuffix:0 maxAge:1.79769313e308];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (objc_msgSend(v8, "count", 0)) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = (uint64_t)[v8 count];
  }
  id v10 = [v8 subarrayWithRange:0, v9];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (sub_1000980A8([NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15), v6, 0))[v7 addObject:[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [v15 lastPathComponent])];
      }
        }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
  [v5 setRelativeURLs:v7];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectIPConfigurationLogs:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = +[NSMutableArray array];
  id v8 = [(W5LogManager *)self __mostRecentInDirectories:&off_1000F0170 matchingPrefix:@"com.apple.networking.IPConfiguration.log" matchingSuffix:0 excludingPrefix:0 excludingSuffix:0 maxAge:1.79769313e308];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (objc_msgSend(v8, "count", 0)) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = (uint64_t)[v8 count];
  }
  id v10 = [v8 subarrayWithRange:0, v9];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (sub_1000980A8([NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15), v6, 0))[v7 addObject:[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [v15 lastPathComponent])]; {
      }
        }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
  [v5 setRelativeURLs:v7];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectSystemLogs:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"MaxAge"];
  id v7 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"MaxSize"];
  unsigned int v8 = [[[a3 configuration] objectForKeyedSubscript:@"LimitTime"] BOOLValue];
  id v9 = +[NSMutableArray array];
  v18[0] = @"-B";
  v18[1] = @"-x";
  void v18[2] = [objc_msgSend(v5, "path") stringByAppendingPathComponent:@"syslog.asl"];
  if (+[NSTask runTaskWithLaunchPath:arguments:error:](NSTask, "runTaskWithLaunchPath:arguments:error:", @"/usr/bin/syslog", +[NSArray arrayWithObjects:v18 count:3], 0))
  {
    [v9 addObject:[NSURL fileURLWithPath:@"syslog.asl"]];
  }
  id v10 = +[NSMutableArray array];
  [v10 addObject:@"collect"];
  if (v6)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v12 = v11;
    [v6 doubleValue];
    double v14 = v12 - v13;
    id v15 = objc_alloc_init((Class)NSDateFormatter);
    [v15 setDateFormat:@"yyyy-MM-dd"];
    if (v8) {
      [v15 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    id v16 = [v15 stringFromDate:[NSDate dateWithTimeIntervalSinceReferenceDate:v14]];
    [v10 addObject:@"--start"];
    [v10 addObject:v16];
  }
  if (v7)
  {
    [v10 addObject:@"--size"];
    [v10 addObject:+[NSString stringWithFormat:](NSString, @"%lum", objc_msgSend(v7, "unsignedIntegerValue"))];
  }
  [v10 addObject:@"--output"];
  [v10 addObject:[objc_msgSend(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", @"system.logarchive", 0), "path"]];
  if (+[NSTask runTaskWithLaunchPath:@"/usr/bin/log" arguments:v10 error:0])
  {
    [v9 addObject:[NSURL fileURLWithPath:@"system.logarchive"]];
  }
  [v4 setRelativeURLs:v9];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collectWiFiVelocityLog:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  unsigned int v7 = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] BOOLValue];
  id v8 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"MaxAge"];
  if (v8) {
    uint64_t v9 = (uint64_t)[v8 unsignedIntegerValue];
  }
  else {
    uint64_t v9 = 300;
  }
  id v10 = [[[v6 path] stringByAppendingPathComponent:@"wifivelocity_logarchive.log"];
  v15[0] = @"show";
  v15[1] = @"--info";
  v15[2] = @"--debug";
  void v15[3] = @"--signpost";
  v15[4] = +[NSString stringWithFormat:@"--last=%lus", v9];
  void v15[5] = @"--style=syslog";
  v15[6] = @"--predicate=message BEGINSWITH \"[wifivelocity]\"";
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/bin/log", +[NSArray arrayWithObjects:v15 count:7], v10, 0))
  {
    if (v7)
    {
      id v11 = [(W5LogManager *)self __collectFileAtURL:+[NSURL fileURLWithPath:v10] outputDirectory:v6 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:1 compress:0 remainingSize:1.79769313e308];
      if (v11)
      {
        id v14 = v11;
        [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1)];
      }
      [+[NSFileManager defaultManager] removeItemAtPath:v10 error:0];
    }
    else
    {
      double v13 = +[NSURL fileURLWithPath:@"wifivelocity_logarchive.log"];
      [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1)];
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectSystemLogs24:(id)a3
{
  id v5 = [[objc_msgSend(a3, "configuration") mutableCopy];
  [v5 setObject:0 forKeyedSubscript:@"MaxSize"];
  [v5 setObject:&off_1000EB368 forKeyedSubscript:@"MaxAge"];
  [a3 setConfiguration:v5];

  return [(W5LogManager *)self __collectSystemLogs:a3];
}

- (id)__collectAirPlayLogs:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = +[NSMutableArray array];
  id v8 = [(W5LogManager *)self __mostRecentInDirectories:&off_1000F0188 matchingPrefix:@"AirPlay" matchingSuffix:0 excludingPrefix:0 excludingSuffix:0 maxAge:1.79769313e308];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (objc_msgSend(v8, "count", 0)) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = (uint64_t)[v8 count];
  }
  id v10 = [v8 subarrayWithRange:0, v9];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (sub_1000980A8([NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15), v6, 0))[v7 addObject:[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [v15 lastPathComponent])]; {
      }
        }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
  [v5 setRelativeURLs:v7];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectWirelessProxLogs:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  if ([+[NSFileManager defaultManager](NSFileManager, "defaultManager") fileExistsAtPath:@"/private/var/log/wirelessproxd.log"]&& sub_1000980A8(+[NSURL fileURLWithPath:@"/private/var/log/wirelessproxd.log"], v5, 0))
  {
    id v7 = +[NSURL fileURLWithPath:@"wirelessproxd.log"];
    [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collectSharingLogs:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v6 = [[[a3 configuration] objectForKeyedSubscript:@"HomeDirectory"];
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"/Library/Logs/com.apple.sharingd/sharingd.log"))&& sub_1000980A8(objc_msgSend(v6, "URLByAppendingPathComponent:", @"/Library/Logs/com.apple.sharingd/sharingd.log"), v5, 0))
  {
    id v8 = +[NSURL fileURLWithPath:@"sharingd.log"];
    [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collectBluetoothLogs:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v6 = +[NSMutableArray array];
  if ([+[NSFileManager defaultManager](NSFileManager, "defaultManager") fileExistsAtPath:@"/Library/Preferences/com.apple.Bluetooth.plist"]&& sub_1000980A8(+[NSURL fileURLWithPath:@"/Library/Preferences/com.apple.Bluetooth.plist"], v5, 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"com.apple.Bluetooth.plist"]];
  }
  if ([+[NSFileManager defaultManager](NSFileManager, "defaultManager") fileExistsAtPath:@"/private/var/log/blued.log"]&& sub_1000980A8(+[NSURL fileURLWithPath:@"/private/var/log/blued.log"], v5, 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"blued.log"]];
  }
  if ([+[NSFileManager defaultManager](NSFileManager, "defaultManager") fileExistsAtPath:@"/Library/Logs/Bluetooth/"]&& sub_1000980A8(+[NSURL fileURLWithPath:@"/Library/Logs/Bluetooth/"], v5, 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"blued.log"]];
  }
  if ([+[NSFileManager defaultManager](NSFileManager, "defaultManager") fileExistsAtPath:@"Library/Preferences/com.apple.BTServer.plist"]&& sub_1000980A8(+[NSURL fileURLWithPath:@"Library/Preferences/com.apple.BTServer.plist"], v5, 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"com.apple.BTServer.plist"]];
  }
  [v4 setRelativeURLs:v6];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collectDextCoreDump:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v25 = +[NSMutableArray array];
  id v6 = [NSURL fileURLWithPath:[objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"dext_coredumps")];
  id v7 = +[NSFileManager defaultManager];
  char v30 = 0;
  CFStringRef v8 = @"/private/var/dextcores";
  unsigned __int8 v9 = [(NSFileManager *)v7 fileExistsAtPath:@"/private/var/dextcores" isDirectory:&v30];
  if ((v9 & (v30 != 0)) == 0) {
    CFStringRef v8 = @"/private/var/cores";
  }
  id v10 = [(NSFileManager *)v7 contentsOfDirectoryAtPath:v8 error:0];
  if ([(NSArray *)v10 count])
  {
    if ([(NSFileManager *)v7 createDirectoryAtPath:[(NSURL *)v6 path] withIntermediateDirectories:0 attributes:0 error:0])
    {
      uint64_t v24 = v4;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v27;
        do
        {
          id v14 = 0;
          do
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v14);
            id v16 = [+[NSURL fileURLWithPath:v8] URLByAppendingPathComponent:v15];
            id v17 = [v15 stringByAppendingString:@".tgz"];
            long long v18 = [(NSURL *)v6 URLByAppendingPathComponent:v17];
            *(void *)id v32 = 0;
            if (sub_1000975B0(v16, v18, (NSError **)v32)) {
              [v25 addObject:[NSURL fileURLWithPath:objc_msgSend(v17, "lastPathComponent")]];
            }
            id v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v12);
      }
      id v4 = v24;
      [v24 setRelativeURLs:v25];
    }
    else
    {
      long long v20 = sub_10009756C();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        long long v21 = [(NSURL *)v6 path];
        *(_DWORD *)id v32 = 136316162;
        *(void *)&v32[4] = "-[W5LogManager __collectDextCoreDump:]";
        __int16 v33 = 2080;
        uint64_t v34 = "W5LogManager.m";
        __int16 v35 = 1024;
        int v36 = 5694;
        __int16 v37 = 2114;
        id v38 = v21;
        __int16 v39 = 2114;
        id v40 = a3;
        LODWORD(v23) = 48;
        uint64_t v22 = v32;
        _os_log_send_and_compose_impl();
      }
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collectCrashesAndSpins24:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v22 = v4;
  [v4 setStartedAt:];
  id v5 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v23 = +[NSMutableArray array];
  id v25 = v5;
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", [objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"crashes_and_spins")], 0, 0, 0);
  id v6 = [+[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Logs/CrashReporter" error:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    uint64_t v24 = *(void *)v27;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v10);
        id v12 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", [@"/Library/Logs/CrashReporter" stringByAppendingPathComponent:v11], 0);
        [(NSDate *)[(NSDictionary *)v12 fileCreationDate] timeIntervalSinceReferenceDate];
        double v14 = v13;
        if ([(NSString *)[(NSDictionary *)v12 fileType] isEqualToString:NSFileTypeRegular])
        {
          +[NSDate timeIntervalSinceReferenceDate];
          if (v15 - v14 < 86400.0)
          {
            if ([v11 hasSuffix:@"ips"])
            {
              id v16 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", [@"/Library/Logs/CrashReporter" stringByAppendingPathComponent:v11]);
              unint64_t v17 = (unint64_t)-[NSData rangeOfData:options:range:](v16, "rangeOfData:options:range:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", "\n", 1), 0, 0, [(NSData *)v16 length]);
              long long v18 = (char *)(v17 + 1);
              long long v19 = (char *)[(NSData *)v16 length] + ~v17;
              id v20 = [[[v11 stringByDeletingPathExtension] stringByAppendingPathExtension:@"crash"];
              uint64_t v9 = v24;
              if (-[NSData writeToFile:atomically:](-[NSData subdataWithRange:](v16, "subdataWithRange:", v18, v19), "writeToFile:atomically:", objc_msgSend(objc_msgSend(objc_msgSend(v25, "path"), "stringByAppendingPathComponent:", @"crashes_and_spins"), "stringByAppendingPathComponent:", v20), 0))
              {
                [v23 addObject:[NSURL fileURLWithPath:[v20 lastPathComponent]]];
              }
            }
          }
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v22 setCompletedAt:];
  return v22;
}

- (id)__collectEventHistory:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  id v6 = &Apple80211BindToInterface_ptr;
  +[NSDate timeIntervalSinceReferenceDate];
  id v92 = v5;
  [v5 setStartedAt:];
  id v91 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = [(W5StatusManager *)self->_status eventHistory];
  id v8 = +[NSMutableString string];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v97 = [v7 countByEnumeratingWithState:&v98 objects:v103 count:16];
  if (v97)
  {
    uint64_t v9 = *(void *)v99;
    v93 = self;
    id v94 = v8;
    id v95 = v7;
    uint64_t v96 = *(void *)v99;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v99 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v98 + 1) + 8 * (void)v10);
        switch((unint64_t)[v11 eventID])
        {
          case 4uLL:
            id v12 = [[[v11 info] objectForKeyedSubscript:@"NetworkStatus"];
            BOOL v13 = ([v12 isAppleReachable] & 2) != 0
               && ([v12 isAppleReachable] & 4) == 0;
            id v70 = [v12 primaryIPv4InterfaceName];
            id v71 = [[objc_msgSend(v12, "primaryIPv4Addresses") firstObject];
            id v72 = [v12 primaryIPv4Router];
            id v73 = [v12 primaryIPv6InterfaceName];
            id v74 = [[objc_msgSend(v12, "primaryIPv6Addresses") firstObject];
            id v75 = [v12 primaryIPv6Router];
            id v76 = [[objc_msgSend(v12, "primaryDNSAddresses") firstObject];
            uint64_t v77 = "no";
            if (v13) {
              uint64_t v77 = "yes";
            }
            unint64_t v67 = +[NSString stringWithFormat:@"Network Status: ipv4[if=%@ ip=%@ router=%@] ipv6[if=%@ ip=%@ router=%@] dns=%@ reach=%s", v70, v71, v72, v73, v74, v75, v76, v77];
            id v6 = &Apple80211BindToInterface_ptr;
            self = v93;
            id v8 = v94;
            id v7 = v95;
            uint64_t v9 = v96;
            if (v67) {
              goto LABEL_41;
            }
            goto LABEL_42;
          case 0xCuLL:
            CFStringRef v18 = @"BT Paging Start";
            goto LABEL_39;
          case 0xDuLL:
            CFStringRef v18 = @"BT Paging End";
            goto LABEL_39;
          case 0xEuLL:
            id v19 = [v11 info];
            id v20 = [v19 objectForKeyedSubscript:@"InterfaceName"];
            [objc_msgSend(v19, "objectForKeyedSubscript:", @"EAPControlMode") unsignedIntValue];
            [objc_msgSend(v19, "objectForKeyedSubscript:", @"EAPControlState") unsignedIntValue];
            [objc_msgSend(v19, "objectForKeyedSubscript:", @"EAPSupplicantState") unsignedIntValue];
            id v21 = [[objc_msgSend(v19, "objectForKeyedSubscript:", @"EAPClientStatus") intValue];
            uint64_t v22 = W5DescriptionForEAPOLControlState();
            uint64_t v23 = W5DescriptionForEAPOLControlMode();
            id v7 = v95;
            uint64_t v81 = v22;
            uint64_t v9 = v96;
            id v8 = v94;
            double v15 = +[NSString stringWithFormat:@"EAP8021X: %@ if=%@ mode=%@ supp=%@ status=%u", v81, v20, v23, W5DescriptionForEAPOLSupplicantState(), v21];
            break;
          case 0xFuLL:
            id v24 = [v11 info];
            [objc_msgSend(v24, "objectForKeyedSubscript:", @"PowerSourceType") integerValue];
            [objc_msgSend(v24, "objectForKeyedSubscript:", @"BatteryEstimatedTime") doubleValue];
            uint64_t v26 = v25;
            [objc_msgSend(v24, "objectForKeyedSubscript:", @"BatteryLevel") doubleValue];
            long long v28 = v27;
            [objc_msgSend(v24, "objectForKeyedSubscript:", @"BatteryWarningLevel") intValue];
            uint64_t v29 = W5DescriptionForPowerSourceType();
            double v88 = COERCE_DOUBLE(W5DescriptionForBatteryWarningLevel());
            uint64_t v84 = v26;
            id v86 = v28;
            id v80 = (id)v29;
            CFStringRef v18 = @"Power Source: ps=%@ est=%.3fs lvl=%.1f%% warn=%@";
            goto LABEL_29;
          case 0x10uLL:
            [objc_msgSend(objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"SystemPowerStateCaps"), "unsignedIntValue"]
            id v80 = (id)W5DescriptionForPowerStateCaps();
            CFStringRef v18 = @"Power State: %@";
            goto LABEL_39;
          case 0x11uLL:
            id v30 = [v11 info];
            [objc_msgSend(v30, "objectForKeyedSubscript:", @"PowerSourceType") integerValue];
            [objc_msgSend(v30, "objectForKeyedSubscript:", @"BatteryEstimatedTime") doubleValue];
            uint64_t v32 = v31;
            [objc_msgSend(v30, "objectForKeyedSubscript:", @"BatteryLevel") doubleValue];
            uint64_t v34 = v33;
            [objc_msgSend(v30, "objectForKeyedSubscript:", @"BatteryWarningLevel") intValue];
            uint64_t v35 = W5DescriptionForPowerSourceType();
            double v88 = COERCE_DOUBLE(W5DescriptionForBatteryWarningLevel());
            uint64_t v84 = v32;
            id v86 = v34;
            id v80 = (id)v35;
            CFStringRef v18 = @"Low Battery: ps=%@ est=%.3fs lvl=%.1f%% warn=%@";
            goto LABEL_29;
          case 0x12uLL:
            id v36 = [v11 info];
            id v37 = [v36 objectForKeyedSubscript:@"InterfaceName"];
            unsigned int v38 = [[objc_msgSend(v36, "objectForKeyedSubscript:", @"WiFiPowerOn") boolValue];
            __int16 v39 = "OFF";
            if (v38) {
              __int16 v39 = "ON";
            }
            double v15 = +[NSString stringWithFormat:@"Wi-Fi Power: if=%@ state=%s", v37, v39, v86, *(void *)&v88, v90];
            break;
          case 0x13uLL:
            id v40 = [v11 info];
            double v15 = +[NSString stringWithFormat:](NSString, @"Wi-Fi SSID: if=%@ ssid=%@", [v40 objectForKeyedSubscript:@"InterfaceName"], objc_msgSend(v40, "objectForKeyedSubscript:", @"WiFiSSIDString"), v86, *(void *)&v88, v90);
            break;
          case 0x14uLL:
            id v41 = [v11 info];
            double v15 = +[NSString stringWithFormat:](NSString, @"Wi-Fi BSSID: if=%@ bssid=%@", [v41 objectForKeyedSubscript:@"InterfaceName"], [v41 objectForKeyedSubscript:@"WiFiBSSID"], v86, *(void *)&v88, v90);
            break;
          case 0x15uLL:
            double v15 = [NSString stringWithFormat:@"Wi-Fi RSN Handshake: if=%@, %@, %@, %@", objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"), v84, v86, *(void *)&v88, v90];
            break;
          case 0x16uLL:
            id v42 = [v11 info];
            id v43 = [v42 objectForKeyedSubscript:@"InterfaceName"];
            unsigned int v44 = [[objc_msgSend(v42, "objectForKeyedSubscript:", @"WiFiLinkUp") BOOLValue];
            id v45 = [[objc_msgSend(v42, "objectForKeyedSubscript:", @"WiFiLinkChangeReason") integerValue];
            id v46 = [[objc_msgSend(v42, "objectForKeyedSubscript:", @"WiFiLinkChangeSubreason") integerValue];
            unsigned int v47 = [[objc_msgSend(v42, "objectForKeyedSubscript:", @"WiFiLinkChangeInvoluntary") boolValue];
            long long v48 = "DOWN";
            if (v44) {
              long long v48 = "UP";
            }
            id v89 = v46;
            id v87 = v45;
            uint64_t v9 = v96;
            id v82 = v43;
            id v8 = v94;
            id v7 = v95;
            double v15 = +[NSString stringWithFormat:@"Wi-Fi Link: if=%@ link=%s reason=%ld subreason=%ld involuntary=%d", v82, v48, v87, v89, v47];
            break;
          case 0x17uLL:
            id v49 = [v11 info];
            id v50 = [v49 objectForKeyedSubscript:@"InterfaceName"];
            [objc_msgSend(v49, "objectForKeyedSubscript:", @"WiFiMode") intValue];
            id v80 = v50;
            uint64_t v84 = W5DescriptionForOpMode();
            CFStringRef v18 = @"Wi-Fi Mode: if=%@ mode=%@";
            goto LABEL_39;
          case 0x18uLL:
            id v14 = [v11 info];
            double v15 = [NSString stringWithFormat:@"Wi-Fi Country Code: if=%@ cc=%@", [v14 objectForKeyedSubscript:@"InterfaceName"], [v14 objectForKeyedSubscript:@"WiFiCountryCode"], v86, *(void *)&v88, v90];
            break;
          case 0x19uLL:
            id v51 = [v11 info];
            id v52 = [v51 objectForKeyedSubscript:@"InterfaceName"];
            id v53 = [v51 objectForKeyedSubscript:@"WiFiLinkQualityUpdate"];
            id v54 = [v53 rssi];
            id v55 = [v53 txRate];
            [v53 cca];
            double v88 = v56;
            uint64_t v84 = (uint64_t)v54;
            id v86 = v55;
            id v8 = v94;
            id v7 = v95;
            id v80 = v52;
            CFStringRef v18 = @"Wi-Fi Link Quality: if=%@ rssi=%lddBm txrate=%ldMbps cca=%.1f%%";
LABEL_29:
            uint64_t v9 = v96;
            goto LABEL_39;
          case 0x1AuLL:
            double v15 = [NSString stringWithFormat:@"Wi-Fi Deauth: if=%@, bssid=%@, reason=%d, channel=%d, duration=%d", objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"), v84, v86, *(void *)&v88, v90];
            break;
          case 0x1BuLL:
            double v15 = +[NSString stringWithFormat:@"Wi-Fi Reset: if=%@ %f %f %f %f", objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"), v84, v86, *(void *)&v88, v90];
            break;
          case 0x1CuLL:
            double v15 = [NSString stringWithFormat:@"Wi-Fi Availabe: if=%@ %@ %f %@ %@", objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"), v84, v86, *(void *)&v88, v90];
            break;
          case 0x1DuLL:
            id v16 = [v11 info];
            id v17 = [v16 objectForKeyedSubscript:@"InterfaceName"];
            [v16 objectForKeyedSubscript:@"WiFiChannel"];
            id v80 = v17;
            uint64_t v84 = W5DescriptionForChannel();
            CFStringRef v18 = @"Wi-Fi Channel Switch: if=%@ ch=%@";
            goto LABEL_39;
          case 0x1EuLL:
            double v15 = +[NSString stringWithFormat:@"Wi-Fi Roam Start: if=%@ %f %f %f %f", objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"), v84, v86, *(void *)&v88, v90];
            break;
          case 0x1FuLL:
            id v80 = [[objc_msgSend(v11, "info") objectForKeyedSubscript:@"InterfaceName"];
            CFStringRef v18 = @"Wi-Fi Roam End: if=%@";
            goto LABEL_39;
          case 0x20uLL:
            double v15 = +[NSString stringWithFormat:@"AWDL RTM Start: if=%@ %f %f %f %f", objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"), v84, v86, *(void *)&v88, v90];
            break;
          case 0x21uLL:
            double v15 = +[NSString stringWithFormat:](NSString, @"AWDL RTM End: if=%@ %f %f %f %f", objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"), v84, v86, *(void *)&v88, v90);
            break;
          case 0x22uLL:
            id v57 = [[objc_msgSend(v11, "info") objectForKeyedSubscript:@"PingResult"];
            id v58 = [v57 interfaceName];
            id v59 = [v57 address];
            [v57 min];
            uint64_t v61 = v60;
            [v57 max];
            uint64_t v63 = v62;
            [v57 packetLoss];
            id v83 = v58;
            id v85 = v59;
            id v7 = v95;
            uint64_t v9 = v96;
            double v15 = +[NSString stringWithFormat:@"Ping: if=%@ addr=%@ min=%.2fms max=%.2fms loss=%.2f%%", v83, v85, v61, v63, v64];
            break;
          case 0x23uLL:
            id v65 = [v11 info];
            id v66 = [v65 objectForKeyedSubscript:@"InterfaceName"];
            [objc_msgSend(v65, "objectForKeyedSubscript:", @"WiFiDropReason") integerValue];
            id v80 = v66;
            uint64_t v84 = W5DescriptionForWiFiDropReason();
            CFStringRef v18 = @"Wi-Fi Drop: if=%@ reason=%@";
LABEL_39:
            double v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v80, v84, v86, *(void *)&v88, v90);
            break;
          default:
            double v15 = +[NSString stringWithFormat:@"Unhandled Event: event=%@", v11, v84, v86, *(void *)&v88, v90];
            break;
        }
        unint64_t v67 = v15;
        if (v15)
        {
LABEL_41:
          dateFormatter = self->_dateFormatter;
          id v69 = v6[359];
          [v11 timestamp];
          [v8 appendFormat:@"%@ %@\n", -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", [v69 dateWithTimeIntervalSinceReferenceDate:]), v67];
        }
LABEL_42:
        id v10 = (char *)v10 + 1;
      }
      while (v97 != v10);
      id v78 = [v7 countByEnumeratingWithState:&v98 objects:v103 count:16];
      id v97 = v78;
    }
    while (v78);
  }
  if (-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(v91, "path"), "stringByAppendingPathComponent:", @"event_history.txt"), objc_msgSend(v8, "dataUsingEncoding:", 4), 0))
  {
    v102 = +[NSURL fileURLWithPath:@"event_history.txt"];
    [v92 setRelativeURLs:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v102, 1)];
  }
  [v6[359] timeIntervalSinceReferenceDate];
  [v92 setCompletedAt:];
  return v92;
}

- (id)__collectAdditionalLog:(id)a3 url:(id)a4
{
  id v6 = objc_alloc_init((Class)W5LogItemReceipt);
  [v6 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v6 setStartedAt:];
  id v7 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [a4 path])&& sub_1000980A8(a4, objc_msgSend(v7, "URLByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"additional.log")), 0))
  {
    uint64_t v9 = +[NSURL fileURLWithPath:@"additional.log"];
    [v6 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v6 setCompletedAt:];
  return v6;
}

- (id)__collectMultiple:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v45 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v44 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"HomeDirectory"];
  id v43 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"InternalUUID"];
  unsigned __int8 v42 = [[[a3 configuration] objectForKeyedSubscript:@"IncludeEvents"] BOOLValue];
  unsigned __int8 v41 = [[[a3 configuration] objectForKeyedSubscript:@"UseMegaWiFiProfileLimits"] BOOLValue];
  id v5 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"UseLeewayUUID"];
  id v6 = [[[a3 configuration] objectForKeyedSubscript:@"AddLeewayUUID"];
  id v7 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"TimestampUUID"];
  unsigned int v8 = [[[a3 configuration] objectForKeyedSubscript:@"RunConcurrent"] BOOLValue];
  id obj = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"Requests"];
  id v9 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"Timeout"];
  if (v9) {
    uint64_t v10 = (uint64_t)[v9 unsignedIntegerValue];
  }
  else {
    uint64_t v10 = 10000;
  }
  if (v5)
  {
    *(void *)unint64_t v67 = 0;
    *(void *)&v67[8] = v67;
    *(void *)&v67[16] = 0x2020000000;
    uint64_t v68 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100070030;
    block[3] = &unk_1000DE6E8;
    block[5] = v5;
    void block[6] = v67;
    block[4] = self;
    dispatch_sync(queue, block);
    uint64_t v12 = *(void *)(*(void *)&v67[8] + 24);
    BOOL v13 = sub_10009756C();
    v10 += v12;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(*(void *)&v67[8] + 24);
      id v15 = [v5 substringToIndex:5];
      uint64_t v16 = v10 - *(void *)(*(void *)&v67[8] + 24);
      *(_DWORD *)uint64_t v63 = 134218754;
      *(void *)&void v63[4] = v14;
      *(_WORD *)&v63[12] = 2114;
      *(void *)&v63[14] = v15;
      *(_WORD *)&v63[22] = 2048;
      uint64_t v64 = v16;
      __int16 v65 = 2048;
      uint64_t v66 = v10;
      LODWORD(v36) = 42;
      uint64_t v34 = v63;
      _os_log_send_and_compose_impl();
    }
    _Block_object_dispose(v67, 8);
  }
  id v46 = +[NSMutableArray array];
  *(void *)uint64_t v63 = 0;
  *(void *)&v63[8] = v63;
  *(void *)&v63[16] = 0x2020000000;
  LOBYTE(v64) = 0;
  id v17 = dispatch_queue_create(0, 0);
  CFStringRef v18 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  [(NSOperationQueue *)v18 setMaxConcurrentOperationCount:1];
  if (v8) {
    CFStringRef v18 = [(W5StatusManager *)self->_status concurrentQueue];
  }
  uint64_t v39 = v10;
  id v19 = dispatch_group_create();
  uint64_t v38 = mach_absolute_time();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v20 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v56;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v56 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        dispatch_group_enter(v19);
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_100070088;
        void v52[3] = &unk_1000DEEA0;
        void v52[4] = v23;
        v52[5] = v45;
        void v52[6] = v44;
        v52[7] = v43;
        unsigned __int8 v53 = v42;
        unsigned __int8 v54 = v41;
        v52[8] = self;
        v52[9] = v17;
        v52[11] = v19;
        v52[12] = v63;
        v52[10] = v46;
        [(NSOperationQueue *)v18 addOperationWithBlock:v52];
      }
      id v20 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v20);
  }
  if (v39) {
    dispatch_time_t v24 = dispatch_time(0, 1000000 * v39);
  }
  else {
    dispatch_time_t v24 = -1;
  }
  intptr_t v25 = dispatch_group_wait(v19, v24);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  void v51[2] = sub_100070244;
  v51[3] = &unk_1000DD348;
  v51[4] = v63;
  dispatch_sync(v17, v51);
  if (v39 && !v25 && v6)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v26 = info.denom ? (mach_absolute_time() - v38) * info.numer / info.denom / 0xF4240 : 0;
    uint64_t v27 = v39 - v26;
    long long v28 = self->_queue;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100070288;
    void v49[3] = &unk_1000DE450;
    v49[4] = self;
    void v49[5] = v6;
    v49[6] = v39 - v26;
    dispatch_async(v28, v49);
    uint64_t v29 = sub_10009756C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [v6 substringToIndex:5];
      *(_DWORD *)unint64_t v67 = 134218242;
      *(void *)&v67[4] = v27;
      *(_WORD *)&v67[12] = 2114;
      *(void *)&v67[14] = v30;
      LODWORD(v37) = 22;
      uint64_t v35 = v67;
      _os_log_send_and_compose_impl();
    }
  }
  uint64_t v31 = mach_absolute_time();
  uint64_t v32 = self->_queue;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1000702E4;
  void v48[3] = &unk_1000DE450;
  v48[4] = v7;
  void v48[5] = self;
  void v48[6] = v31;
  dispatch_async(v32, v48);
  v60[0] = @"Receipts";
  v61[0] = [v46 copy];
  v60[1] = @"TimeoutOccurred";
  v61[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v25 != 0, v35, v37);
  [v4 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 2)];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  if (v19) {
    dispatch_release(v19);
  }
  if (v17) {
    dispatch_release(v17);
  }
  _Block_object_dispose(v63, 8);
  return v4;
}

- (id)__collect_mobilewifitool:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "path") stringByAppendingPathComponent:@"mobilewifitool.txt"];
  [+[NSFileManager defaultManager] removeItemAtPath:v6 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v6 contents:0 attributes:0];
  id v7 = +[NSFileHandle fileHandleForUpdatingAtPath:v6];
  if (v7)
  {
    unsigned int v8 = v7;
    [(W5LogManager *)self __runToolWithOutputFileHandle:v7 launchPath:@"/usr/local/bin/mobilewifitool" arguments:&off_1000F01A0];
    [(W5LogManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/mobilewifitool" arguments:&off_1000F01B8];
    [(NSFileHandle *)v8 closeFile];
    uint64_t v10 = +[NSURL fileURLWithPath:@"mobilewifitool.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (void)__endWiFiStats
{
  if (self->_ioReportSubscription && self->_ioReportBase)
  {
    if (self->_ioReportDelta) {
      CFRelease(self->_ioReportDelta);
    }
    Samples = (const void *)IOReportCreateSamples();
    self->_ioReportDelta = (__CFDictionary *)IOReportCreateSamplesDelta();
    self->_ioReportDeltaMachAbsoluteTime = mach_absolute_time();
    if (Samples)
    {
      CFRelease(Samples);
    }
  }
}

- (void)__startWiFiStats
{
  if (self->_ioReportSubscription)
  {
    if (self->_ioReportBase) {
      CFRelease(self->_ioReportBase);
    }
    self->_ioReportBase = (__CFDictionary *)IOReportCreateSamples();
    self->_ioReportBaseMachAbsoluteTime = mach_absolute_time();
  }
}

- (void)__teardownWiFiStats
{
  self->_ioReportBaseMachAbsoluteTime = 0;
  self->_ioReportDeltaMachAbsoluteTime = 0;
  ioReportBase = self->_ioReportBase;
  if (ioReportBase) {
    CFRelease(ioReportBase);
  }
  self->_ioReportBase = 0;
  ioReportDelta = self->_ioReportDelta;
  if (ioReportDelta) {
    CFRelease(ioReportDelta);
  }
  self->_ioReportDelta = 0;
  ioReportChannels = self->_ioReportChannels;
  if (ioReportChannels) {
    CFRelease(ioReportChannels);
  }
  self->_ioReportChannels = 0;
  ioReportSubscription = self->_ioReportSubscription;
  if (ioReportSubscription) {
    CFRelease(ioReportSubscription);
  }
  self->_ioReportSubscription = 0;
}

- (void)__setupWiFiStats
{
  *(void *)parent = 0;
  uint64_t Aggregate = IOReportCreateAggregate();
  if (Aggregate)
  {
    id v4 = (const void *)Aggregate;
    Apple80211GetIOReportingService();
    CFDictionaryRef v5 = IOServiceMatching("apcie");
    io_service_t MatchingService = IOServiceGetMatchingService(0, v5);
    parent[1] = MatchingService;
    if (MatchingService)
    {
      while (!IORegistryEntryGetChildEntry(MatchingService, "IOService", parent))
      {
        IOObjectRelease(parent[1]);
        io_service_t MatchingService = parent[0];
        parent[1] = parent[0];
        if (!parent[0]) {
          goto LABEL_18;
        }
      }
      if (parent[1])
      {
        uint64_t v7 = IOReportCopyChannelsForDriver();
        if (v7)
        {
          unsigned int v8 = (const void *)v7;
          if (IOReportGetChannelCount()) {
            IOReportMergeChannels();
          }
          CFRelease(v8);
        }
        if (!IORegistryEntryGetParentEntry(parent[1], "IOService", parent))
        {
          do
          {
            uint64_t v9 = IOReportCopyChannelsForDriver();
            if (v9)
            {
              uint64_t v10 = (const void *)v9;
              if (IOReportGetChannelCount()) {
                IOReportMergeChannels();
              }
              CFRelease(v10);
            }
            IOObjectRelease(parent[1]);
            parent[1] = parent[0];
          }
          while (!IORegistryEntryGetParentEntry(parent[0], "IOService", parent));
        }
        IOObjectRelease(parent[1]);
      }
    }
LABEL_18:
    uint64_t v11 = IOReportCopyChannelsInCategories();
    if (v11)
    {
      uint64_t v12 = (const void *)v11;
      if (IOReportGetChannelCount())
      {
        CFStringRef v19 = CFStringCreateWithCString(kCFAllocatorDefault, "Energy Model", 0);
        IOReportPrune();
        CFRelease(v19);
        IOReportMergeChannels();
      }
      CFRelease(v12);
    }
    uint64_t v13 = IOReportCopyChannelsInCategories();
    if (v13)
    {
      uint64_t v14 = (const void *)v13;
      if (IOReportGetChannelCount())
      {
        CFStringRef v18 = CFStringCreateWithCString(kCFAllocatorDefault, "CPU Stats", 0);
        IOReportPrune();
        CFRelease(v18);
        IOReportMergeChannels();
      }
      CFRelease(v14);
    }
    uint64_t v15 = IOReportCopyChannelsInCategories();
    if (v15)
    {
      uint64_t v16 = (const void *)v15;
      if (IOReportGetChannelCount())
      {
        CFStringRef v17 = CFStringCreateWithCString(kCFAllocatorDefault, "Voltage Domain Performance States", 0);
        IOReportPrune();
        CFRelease(v17);
        IOReportMergeChannels();
      }
      CFRelease(v16);
    }
    self->_ioReportSubscription = (__IOReportSubscriptionCF *)IOReportCreateSubscription();
    CFRelease(v4);
  }
}

- (id)__collectWiFiStatsPre:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  [(W5LogManager *)self __teardownWiFiStats];
  [(W5LogManager *)self __setupWiFiStats];
  [(W5LogManager *)self __startWiFiStats];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectWiFiStatsPost:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  unsigned int v7 = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] BOOLValue];
  [(W5LogManager *)self __endWiFiStats];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  v12[0] = @"MachBegin";
  v13[0] = +[NSNumber numberWithUnsignedLongLong:self->_ioReportBaseMachAbsoluteTime];
  v12[1] = @"MachEnd";
  v13[1] = +[NSNumber numberWithUnsignedLongLong:self->_ioReportDeltaMachAbsoluteTime];
  void v12[2] = @"Duration";
  v13[2] = +[NSNumber numberWithUnsignedLongLong:self->_ioReportDeltaMachAbsoluteTime - self->_ioReportBaseMachAbsoluteTime];
  [(__CFDictionary *)self->_ioReportDelta setObject:+[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3] forKey:@"DebugInfo"];
  id v8 = [[[v6 path] stringByAppendingPathComponent:@"wifi_stats.xml"];
  if ([+[NSFileManager defaultManager](NSFileManager, "defaultManager") createFileAtPath:v8 contents:+[NSPropertyListSerialization dataWithPropertyList:self->_ioReportDelta format:100 options:0 error:0] attributes:0])
  {
    if (v7)
    {
      if (sub_1000975B0(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8), [v6 URLByAppendingPathComponent:@"wifi_stats.xml.tgz"], 0))
      {
        uint64_t v11 = +[NSURL fileURLWithPath:@"wifi_stats.xml.tgz"];
        [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1)];
        [+[NSFileManager defaultManager] removeItemAtPath:v8 error:0];
      }
    }
    else
    {
      uint64_t v10 = +[NSURL fileURLWithPath:@"wifi_stats.xml"];
      [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1)];
    }
  }
  [(W5LogManager *)self __teardownWiFiStats];
  return v5;
}

- (id)__collectWiFiStatsCLI:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v6 = (__CFString *)[objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"FileNameOverride")];
  unsigned int v7 = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] BOOLValue];
  id v8 = [v5 path];
  if (!v6) {
    id v6 = @"wifistats.xml";
  }
  id v9 = [v8 stringByAppendingPathComponent:v6];
  if (v9)
  {
    id v10 = v9;
    v16[0] = @"-p";
    v16[1] = v9;
    if (+[NSTask runTaskWithLaunchPath:arguments:error:](NSTask, "runTaskWithLaunchPath:arguments:error:", @"/usr/local/bin/wifistats", +[NSArray arrayWithObjects:v16 count:2], 0))
    {
      if (!v7)
      {
        uint64_t v14 = +[NSURL fileURLWithPath:v6];
        uint64_t v12 = &v14;
        goto LABEL_9;
      }
      id v11 = [(__CFString *)v6 stringByAppendingPathExtension:@"tgz"];
      if (sub_1000975B0(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10), [v5 URLByAppendingPathComponent:v11], 0))
      {
        [+[NSFileManager defaultManager] removeItemAtPath:v10 error:0];
        uint64_t v15 = +[NSURL fileURLWithPath:v11];
        uint64_t v12 = &v15;
LABEL_9:
        [v4 setRelativeURLs:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 1)];
      }
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collectPreviouslyCollected:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"MaxAge"];
  if (v6)
  {
    [v6 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 1.79769313e308;
  }
  id v9 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"MaxCount"];
  if (v9) {
    uint64_t v10 = (uint64_t)[v9 unsignedIntegerValue];
  }
  else {
    uint64_t v10 = -1;
  }
  id v11 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"MaxSize"];
  if (v11) {
    uint64_t v12 = (uint64_t)[v11 unsignedIntegerValue];
  }
  else {
    uint64_t v12 = -1;
  }
  unsigned __int8 v13 = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] BOOLValue];
  uint64_t v14 = (NSRegularExpression *)[objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"IncludeMatching")];
  uint64_t v15 = (NSRegularExpression *)[objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"ExcludeMatching")];
  id v16 = +[NSMutableArray array];
  [+[NSFileManager defaultManager](NSFileManager, "defaultManager") createDirectoryAtPath:[objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"Previous")] withIntermediateDirectories:0 attributes:0 error:0];
  if (v14) {
    uint64_t v14 = +[NSRegularExpression regularExpressionWithPattern:v14 options:0 error:0];
  }
  if (v15) {
    uint64_t v15 = +[NSRegularExpression regularExpressionWithPattern:v15 options:0 error:0];
  }
  id v20 = [[(NSURL *)[+[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.wifi.logs"] URLByAppendingPathComponent:@"previous"] path];
  LOBYTE(v18) = v13;
  if (objc_msgSend(-[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:](self, "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1), v14, v15, v10, v12, objc_msgSend(v5, "URLByAppendingPathComponent:", @"Previous"), v8, v18, 0, 0), "count"))
  {
    [v16 addObject:[NSURL fileURLWithPath:@"Previous"]];
  }
  else
  {
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", [objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"Previous")], 0);
  }
  [v4 setRelativeURLs:v16];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collectWiFiMemoryUsage:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v6 = +[NSMutableArray array];
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/bin/footprint", &off_1000F01D0, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"footprint_wifid.txt"), 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"footprint_wifid.txt"]];
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/bin/vmmap", &off_1000F01E8, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"vmmap_wifid.txt"), 0))
  {
    [v6 addObject:+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"vmmap_wifid.txt")];
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/bin/heap", &off_1000F0200, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"heap_wifid.txt"), 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"heap_wifid.txt"]];
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:", @"/usr/local/bin/easyperf", &off_1000F0218, 0, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"easyperf_wifid.txt"), 0, 0, 10.0, 0, 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"easyperf_wifid.txt"]];
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/bin/footprint", &off_1000F0230, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"footprint_dext.txt"), 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"footprint_dext.txt"]];
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/bin/vmmap", &off_1000F0248, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"vmmap_dext.txt"), 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"vmmap_dext.txt"]];
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/bin/heap", &off_1000F0260, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"heap_dext.txt"), 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"heap_dext.txt"]];
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:", @"/usr/local/bin/easyperf", &off_1000F0278, 0, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"easyperf_dext.txt"), 0, 0, 10.0, 0, 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"easyperf_dext.txt"]];
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/bin/zprint", 0, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"zprint.txt"), 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"zprint.txt"]];
  }
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", @"/usr/local/bin/jetsam_priority", &off_1000F0290, objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"jetsam_priority.txt"), 0))
  {
    [v6 addObject:[NSURL fileURLWithPath:@"jetsam_priority.txt"]];
  }
  [v4 setRelativeURLs:v6];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__collectWiFiDeviceConfig:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  double v7 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  id v8 = [[objc_msgSend(v6, "path") stringByAppendingPathComponent:@"wifi_internal.txt"];
  [+[NSFileManager defaultManager] removeItemAtPath:v8 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v8 contents:0 attributes:0];
  id v9 = +[NSFileHandle fileHandleForUpdatingAtPath:v8];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = +[NSMutableData dataWithCapacity:0];
    v36[0] = v7;
    v36[1] = @"-cardcap";
    +[NSTask runTaskWithLaunchPath:arguments:outputData:error:](NSTask, "runTaskWithLaunchPath:arguments:outputData:error:", @"/usr/local/bin/apple80211", +[NSArray arrayWithObjects:v36 count:2], v11, 0);
    id v12 = [objc_msgSend(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v11, 4), "componentsSeparatedByString:", @"\n");
    [(NSMutableData *)v11 setLength:0];
    [(W5LogManager *)self __wlCLIWithArguments:&off_1000F02A8 outputFilePath:0 outputData:v11];
    id v13 = [[objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v11, 4) componentsSeparatedByString:@" "];
    if (v7)
    {
      uint64_t v14 = v13;
      v35[0] = v7;
      v35[1] = @"-driver_ver";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v35 count:2]];
      v34[0] = v7;
      v34[1] = @"-hardware_ver";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v34 count:2]];
      v33[0] = v7;
      v33[1] = @"-ssid";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v33 count:2]];
      v32[0] = v7;
      v32[1] = @"-bssid";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v32 count:2]];
      v31[0] = v7;
      v31[1] = @"-rssi";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v31 count:2]];
      v30[0] = v7;
      v30[1] = @"-noise";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v30 count:2]];
      v29[0] = v7;
      v29[1] = @"-channel";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v29 count:2]];
      v28[0] = v7;
      v28[1] = @"-authtype";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v28 count:2]];
      v27[0] = v7;
      v27[1] = @"-country_code";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v27 count:2]];
      v26[0] = v7;
      v26[1] = @"-rateset";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v26 count:2]];
      v25[0] = v7;
      v25[1] = @"-leaky_ap_stats_mode";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v25 count:2]];
      v24[0] = v7;
      v24[1] = @"-cardcap";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v24 count:2]];
      v23[0] = v7;
      v23[1] = @"-dbg=mimopsstatus";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v23 count:2]];
      if ([v12 containsObject:@"roam"])
      {
        v22[0] = v7;
        v22[1] = @"-dbg=print-roam";
        [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v22 count:2]];
      }
      if ([v12 containsObject:@"ocl"])
      {
        v21[0] = v7;
        v21[1] = @"-dbg=ocl_status";
        [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v21 count:2]];
        v20[0] = v7;
        v20[1] = @"-dbg=ocl_rssi_threshold";
        [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v20 count:2]];
      }
      if ([v12 containsObject:@"awdl"]) {
        [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:&off_1000F02C0];
      }
      if ([v12 containsObject:@"timesync"]) {
        [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:&off_1000F02D8];
      }
      v19[0] = v7;
      v19[1] = @"-dbg=bgscan-private-mac";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v19 count:2]];
      v18[0] = v7;
      v18[1] = @"-dbg=dtim";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v18 count:2]];
      v17[0] = v7;
      v17[1] = @"-dbg=private-mac";
      [(W5LogManager *)self __runToolWithOutputFileHandle:v10 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v17 count:2]];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F02F0 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0308 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0320 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0338 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0350 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0368 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0380 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0398 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F03B0 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F03C8 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F03E0 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F03F8 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0410 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0428 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0440 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0458 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0470 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0488 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F04A0 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F04B8 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F04D0 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F04E8 outputFileHandle:v10];
      if ([v14 containsObject:@"ampdu"]) {
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0500 outputFileHandle:v10];
      }
      if ([v14 containsObject:@"amsdu"]) {
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0518 outputFileHandle:v10];
      }
      if ([v14 containsObject:@"ocl"])
      {
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0530 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0548 outputFileHandle:v10];
      }
      if ([v14 containsObject:@"txcap"]) {
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0560 outputFileHandle:v10];
      }
      if ([v14 containsObject:@"mim_ps"])
      {
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0578 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0590 outputFileHandle:v10];
      }
      if ([v14 containsObject:@"ops"])
      {
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F05A8 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F05C0 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F05D8 outputFileHandle:v10];
      }
      if ([v14 containsObject:@"nap"])
      {
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F05F0 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0608 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0620 outputFileHandle:v10];
      }
      if ([v14 containsObject:@"bcntrim"])
      {
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0638 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0650 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0668 outputFileHandle:v10];
      }
      if ([v14 containsObject:@"rsdb"])
      {
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0680 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0698 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F06B0 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F06C8 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F06E0 outputFileHandle:v10];
        if ([v14 containsObject:@"tdmtx"])
        {
          [(W5LogManager *)self __wlCLIWithArguments:&off_1000F06F8 outputFileHandle:v10];
          [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0710 outputFileHandle:v10];
        }
      }
      if ([v14 containsObject:@"tvpm"])
      {
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0728 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0740 outputFileHandle:v10];
        [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0758 outputFileHandle:v10];
      }
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0770 outputFileHandle:v10];
      [(W5LogManager *)self __wlCLIWithArguments:&off_1000F0788 outputFileHandle:v10];
    }
    [(NSFileHandle *)v10 closeFile];
    id v16 = +[NSURL fileURLWithPath:@"wifi_internal.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectWiFiPerfLogs:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  unsigned __int8 v7 = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] boolValue];
  id v8 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"UUID"];
  if (v8)
  {
    id v15 = [@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:v8];
    id v9 = &v15;
  }
  else
  {
    id v10 = [(W5LogManager *)self __mostRecentInDirectories:&off_1000F07A0 matchingPrefix:0 matchingSuffix:0 excludingPrefix:0 excludingSuffix:0 maxAge:1.79769313e308];
    if (![v10 count]) {
      goto LABEL_7;
    }
    id v14 = [v10 firstObject];
    id v9 = &v14;
  }
  LOBYTE(v13) = v7;
  id v11 = [(W5LogManager *)self __collectFilesInDirectories:+[NSArray arrayWithObjects:v9 count:1] include:0 exclude:0 maxAge:-1 maxCount:-1 maxSize:v6 outputDirectory:1.79769313e308 compress:v13 remainingSize:0 contentFilter:0];
  if (v11) {
    [v5 setRelativeURLs:v11];
  }
LABEL_7:
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collect3barsCache:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "path") stringByAppendingPathComponent:@"3bars.txt"];
  [+[NSFileManager defaultManager] removeItemAtPath:v6 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v6 contents:0 attributes:0];
  unsigned __int8 v7 = +[NSFileHandle fileHandleForUpdatingAtPath:v6];
  if (v7)
  {
    id v8 = v7;
    [(W5LogManager *)self __runToolWithOutputFileHandle:v7 launchPath:@"/usr/local/bin/3bars" arguments:&off_1000F07B8];
    [(NSFileHandle *)v8 closeFile];
    id v10 = +[NSURL fileURLWithPath:@"3bars.txt"];
    [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectDeviceAnalyticsStore:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  HIDWORD(v24) = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] BOOLValue];
  unsigned int v7 = [[[a3 configuration] objectForKeyedSubscript:@"MaxAge"] unsignedIntValue];
  uint64_t v8 = [[[a3 configuration] objectForKeyedSubscript:@"BatchSize"] unsignedIntValue];
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v9 = +[NSMutableString string];
  id v10 = dispatch_semaphore_create(0);
  id v11 = sub_10009756C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136316418;
    long long v28 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
    __int16 v29 = 2080;
    id v30 = "W5LogManager.m";
    __int16 v31 = 1024;
    int v32 = 7033;
    __int16 v33 = 2048;
    *(void *)uint64_t v34 = v7;
    *(_WORD *)&v34[8] = 2048;
    *(void *)&v34[10] = v7 / 0x15180uLL;
    __int16 v35 = 2048;
    uint64_t v36 = v8;
    LODWORD(v24) = 58;
    uint64_t v23 = &v27;
    _os_log_send_and_compose_impl();
  }
  if (![(W5LogManager *)self waDeviceAnalyticsClientExists])
  {
    uint64_t v22 = sub_10009756C();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v27 = 136315906;
    long long v28 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
    __int16 v29 = 2080;
    id v30 = "W5LogManager.m";
    __int16 v31 = 1024;
    int v32 = 7035;
    __int16 v33 = 2080;
    *(void *)uint64_t v34 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
    goto LABEL_11;
  }
  waDeviceAnalyticsClient = self->_waDeviceAnalyticsClient;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  void v26[2] = sub_100072BC8;
  void v26[3] = &unk_1000DEEE8;
  void v26[4] = v9;
  v26[5] = v10;
  if (![(WADeviceAnalyticsClient *)waDeviceAnalyticsClient dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion:v26 batchSize:v8 maxAge:v7 / 0x15180uLL])
  {
LABEL_8:
    int v15 = 0;
    goto LABEL_9;
  }
  dispatch_time_t v13 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v10, v13))
  {
    id v14 = sub_10009756C();
    int v15 = 0;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v27 = 136315650;
    long long v28 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
    __int16 v29 = 2080;
    id v30 = "W5LogManager.m";
    __int16 v31 = 1024;
    int v32 = 7047;
    _os_log_send_and_compose_impl();
    goto LABEL_8;
  }
  if ([v9 length])
  {
    if ([+[NSFileManager defaultManager] isReadableFileAtPath:v9])
    {
      id v19 = +[NSMutableArray array];
      id v20 = [[[v6 path] stringByAppendingPathComponent:[v9 lastPathComponent]];
      [+[NSFileManager defaultManager] copyItemAtPath:v9 toPath:v20 error:0];
      [+[NSFileManager defaultManager] removeItemAtPath:v9 error:0];
      uint64_t v21 = +[NSURL fileURLWithPath:v20];
      if (v25)
      {
        uint64_t v21 = [(W5LogManager *)self __collectFileAtURL:v21 outputDirectory:v6 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:1 compress:0 remainingSize:1.79769313e308];
        [+[NSFileManager defaultManager] removeItemAtPath:v20 error:0];
      }
      if (v21)
      {
        [v19 addObject:v21];
        [v5 setRelativeURLs:v19];
      }
    }
    goto LABEL_12;
  }
  int v15 = 1;
LABEL_9:
  id v16 = sub_10009756C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v9 length];
    int v27 = 136316162;
    long long v28 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
    __int16 v29 = 2080;
    id v30 = "W5LogManager.m";
    __int16 v31 = 1024;
    int v32 = 7052;
    __int16 v33 = 1024;
    *(_DWORD *)uint64_t v34 = v15;
    *(_WORD *)&void v34[4] = 2048;
    *(void *)&v34[6] = v17;
LABEL_11:
    _os_log_send_and_compose_impl();
  }
LABEL_12:
  dispatch_release(v10);
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectDeviceAnalyticsDeploymentGraph:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  unsigned int v7 = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] BOOLValue];
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v8 = +[NSMutableString string];
  id v9 = dispatch_semaphore_create(0);
  if (![(W5LogManager *)self waDeviceAnalyticsClientExists])
  {
    id v20 = sub_10009756C();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v22 = 136315906;
    uint64_t v23 = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]";
    __int16 v24 = 2080;
    int v25 = "W5LogManager.m";
    __int16 v26 = 1024;
    int v27 = 7099;
    __int16 v28 = 2080;
    v29[0] = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]";
    goto LABEL_9;
  }
  waDeviceAnalyticsClient = self->_waDeviceAnalyticsClient;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_100073124;
  void v21[3] = &unk_1000DEEE8;
  v21[4] = v8;
  v21[5] = v9;
  if (![(WADeviceAnalyticsClient *)waDeviceAnalyticsClient dumpDeploymentGraphJSONFileWithCompletion:v21])
  {
LABEL_6:
    int v13 = 0;
    goto LABEL_7;
  }
  dispatch_time_t v11 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v9, v11))
  {
    id v12 = sub_10009756C();
    int v13 = 0;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v22 = 136315650;
    uint64_t v23 = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]";
    __int16 v24 = 2080;
    int v25 = "W5LogManager.m";
    __int16 v26 = 1024;
    int v27 = 7111;
    _os_log_send_and_compose_impl();
    goto LABEL_6;
  }
  if ([v8 length])
  {
    if ([+[NSFileManager defaultManager] isReadableFileAtPath:v8])
    {
      id v17 = +[NSMutableArray array];
      id v18 = [[[v6 path] stringByAppendingPathComponent:[v8 lastPathComponent]];
      [+[NSFileManager defaultManager] copyItemAtPath:v8 toPath:v18 error:0];
      [+[NSFileManager defaultManager] removeItemAtPath:v8 error:0];
      id v19 = +[NSURL fileURLWithPath:v18];
      if (v7)
      {
        id v19 = [(W5LogManager *)self __collectFileAtURL:v19 outputDirectory:v6 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:1 compress:0 remainingSize:1.79769313e308];
        [+[NSFileManager defaultManager] removeItemAtPath:v18 error:0];
      }
      if (v19)
      {
        [v17 addObject:v19];
        [v5 setRelativeURLs:v17];
      }
    }
    goto LABEL_10;
  }
  int v13 = 1;
LABEL_7:
  id v14 = sub_10009756C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v8 length];
    int v22 = 136316162;
    uint64_t v23 = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]";
    __int16 v24 = 2080;
    int v25 = "W5LogManager.m";
    __int16 v26 = 1024;
    int v27 = 7116;
    __int16 v28 = 1024;
    LODWORD(v29[0]) = v13;
    WORD2(v29[0]) = 2048;
    *(void *)((char *)v29 + 6) = v15;
LABEL_9:
    _os_log_send_and_compose_impl();
  }
LABEL_10:
  dispatch_release(v9);
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectDeviceAnalyticsEntityCSVs:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  id v6 = [[objc_msgSend(a3, "configuration") objectForKey:@"AnalyticsCSVOutputDir"];
  if (!v6) {
    id v6 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  }
  unsigned int v31 = [[[a3 configuration] objectForKeyedSubscript:@"Compress"] BOOLValue];
  unsigned int v7 = [[[a3 configuration] objectForKeyedSubscript:@"MaxAge"] unsignedIntValue];
  uint64_t v8 = [[[a3 configuration] objectForKeyedSubscript:@"BatchSize"] unsignedIntValue];
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v9 = +[NSMutableArray array];
  id v10 = dispatch_semaphore_create(0);
  dispatch_time_t v11 = sub_10009756C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 136316418;
    uint64_t v39 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
    __int16 v40 = 2080;
    unsigned __int8 v41 = "W5LogManager.m";
    __int16 v42 = 1024;
    int v43 = 7167;
    __int16 v44 = 2048;
    *(void *)id v45 = v7;
    *(_WORD *)&v45[8] = 2048;
    *(void *)&v45[10] = v7 / 0x15180uLL;
    __int16 v46 = 2048;
    uint64_t v47 = v8;
    LODWORD(v29) = 58;
    __int16 v28 = &v38;
    _os_log_send_and_compose_impl();
  }
  id v30 = v5;
  if (![(W5LogManager *)self waDeviceAnalyticsClientExists])
  {
    int v27 = sub_10009756C();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    int v38 = 136315906;
    uint64_t v39 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
    __int16 v40 = 2080;
    unsigned __int8 v41 = "W5LogManager.m";
    __int16 v42 = 1024;
    int v43 = 7169;
    __int16 v44 = 2080;
    *(void *)id v45 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
    goto LABEL_13;
  }
  waDeviceAnalyticsClient = self->_waDeviceAnalyticsClient;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  void v36[2] = sub_100073830;
  void v36[3] = &unk_1000DEF10;
  v36[4] = v9;
  v36[5] = v10;
  if (![(WADeviceAnalyticsClient *)waDeviceAnalyticsClient dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion:v36 batchSize:v8 maxAge:v7 / 0x15180uLL])
  {
LABEL_10:
    int v15 = 0;
    goto LABEL_11;
  }
  dispatch_time_t v13 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v10, v13))
  {
    id v14 = sub_10009756C();
    int v15 = 0;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v38 = 136315650;
    uint64_t v39 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
    __int16 v40 = 2080;
    unsigned __int8 v41 = "W5LogManager.m";
    __int16 v42 = 1024;
    int v43 = 7181;
    _os_log_send_and_compose_impl();
    goto LABEL_10;
  }
  if ([v9 count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v18 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v9);
          }
          int v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if ([+[NSFileManager defaultManager] isReadableFileAtPath:v22])
          {
            id v23 = +[NSMutableArray array];
            id v24 = [[objc_msgSend(v6, "path") stringByAppendingPathComponent:objc_msgSend(v22, "lastPathComponent")];
            [+[NSFileManager defaultManager] copyItemAtPath:v22 toPath:v24 error:0];
            [+[NSFileManager defaultManager] removeItemAtPath:v22 error:0];
            int v25 = +[NSURL fileURLWithPath:v24];
            if (v31)
            {
              int v25 = [(W5LogManager *)self __collectFileAtURL:v25 outputDirectory:v6 maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:1 compress:0 remainingSize:1.79769313e308];
              [+[NSFileManager defaultManager] removeItemAtPath:v24 error:0];
            }
            if (v25)
            {
              [v23 addObject:v25];
              [v30 setRelativeURLs:v23];
            }
          }
        }
        id v19 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v19);
    }
    goto LABEL_27;
  }
  int v15 = 1;
LABEL_11:
  id v16 = sub_10009756C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v9 count];
    int v38 = 136316162;
    uint64_t v39 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
    __int16 v40 = 2080;
    unsigned __int8 v41 = "W5LogManager.m";
    __int16 v42 = 1024;
    int v43 = 7186;
    __int16 v44 = 1024;
    *(_DWORD *)id v45 = v15;
    *(_WORD *)&void v45[4] = 2048;
    *(void *)&v45[6] = v17;
LABEL_13:
    _os_log_send_and_compose_impl();
  }
LABEL_27:
  dispatch_release(v10);
  +[NSDate timeIntervalSinceReferenceDate];
  [v30 setCompletedAt:];
  return v30;
}

- (id)__dnssdBrowseAll:(id)a3
{
  id v4 = objc_alloc_init((Class)W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setStartedAt:];
  id v5 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v6 = [[[a3 configuration] objectForKeyedSubscript:@"DoPing"] BOOLValue];
  id v7 = [[W5DNSSDBrowser alloc] init:v6];
  unsigned int v8 = [v7 startBrowsing];
  if (!v8)
  {
    id v9 = dispatch_semaphore_create(0);
    if (v6) {
      int64_t v10 = 30000000000;
    }
    else {
      int64_t v10 = 10000000000;
    }
    dispatch_time_t v11 = dispatch_time(0, v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100073DC4;
    block[3] = &unk_1000DDC80;
    block[4] = v9;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
    dispatch_time_t v12 = dispatch_time(0, 80000000000);
    if (dispatch_semaphore_wait(v9, v12) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v28 = 0x4054000000000000;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
    }
    [v7 stopBrowsing];
    uint64_t v24 = 0;
    dispatch_time_t v13 = +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", [v7 browseAllResults], 1, &v24);
    if (v24)
    {
      id v14 = sub_10009756C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v28 = (uint64_t)"-[W5LogManager __dnssdBrowseAll:]";
        __int16 v29 = 2080;
        id v30 = "W5LogManager.m";
        __int16 v31 = 1024;
        int v32 = 7256;
        LODWORD(v23) = 28;
        int v22 = buf;
LABEL_13:
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
      id v15 = [objc_alloc((Class)NSString) initWithData:v13 encoding:4];
      id v16 = [[objc_msgSend(v5, "path") stringByAppendingPathComponent:@"dnssd_browseAll.json"];
      unsigned int v17 = [v15 writeToFile:v16 atomically:1 encoding:4 error:&v24];
      id v18 = sub_10009756C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v28 = (uint64_t)"-[W5LogManager __dnssdBrowseAll:]";
        __int16 v29 = 2080;
        id v30 = "W5LogManager.m";
        __int16 v31 = 1024;
        int v32 = 7263;
        __int16 v33 = 2112;
        id v34 = v16;
        __int16 v35 = 1024;
        unsigned int v36 = v17;
        __int16 v37 = 2112;
        uint64_t v38 = v24;
        LODWORD(v23) = 54;
        int v22 = buf;
        goto LABEL_13;
      }
    }
    __int16 v26 = +[NSURL fileURLWithPath:@"dnssd_browseAll.json", v22, v23];
    [v4 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1)];
    goto LABEL_15;
  }
  unsigned int v20 = v8;
  uint64_t v21 = sub_10009756C();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v28 = (uint64_t)"-[W5LogManager __dnssdBrowseAll:]";
    __int16 v29 = 2080;
    id v30 = "W5LogManager.m";
    __int16 v31 = 1024;
    int v32 = 7238;
    __int16 v33 = 1024;
    LODWORD(v34) = v20;
    LODWORD(v23) = 34;
    int v22 = buf;
    _os_log_send_and_compose_impl();
  }
LABEL_15:
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setCompletedAt:];
  return v4;
}

- (id)__dnssdCacheAndState:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  id v7 = [[objc_msgSend(v6, "path") stringByAppendingPathComponent:@"dnssd_cachedLocalRecords.txt"];
  [+[NSFileManager defaultManager] removeItemAtPath:v7 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v7 contents:0 attributes:0];
  unsigned int v8 = +[NSFileHandle fileHandleForUpdatingAtPath:v7];
  if (v8)
  {
    id v9 = v8;
    [(W5LogManager *)self __runToolWithOutputFileHandle:v8 launchPath:@"/usr/local/bin/dnssdutil" arguments:&off_1000F07D0];
    [(NSFileHandle *)v9 closeFile];
    id v10 = [[objc_msgSend(v6, "path") stringByAppendingPathComponent:@"dnssd_state.txt"];
    [+[NSFileManager defaultManager] removeItemAtPath:v10 error:0];
    [+[NSFileManager defaultManager] createFileAtPath:v10 contents:0 attributes:0];
    dispatch_time_t v11 = +[NSFileHandle fileHandleForUpdatingAtPath:v10];
    if (v11)
    {
      dispatch_time_t v12 = v11;
      [(W5LogManager *)self __runToolWithOutputFileHandle:v11 launchPath:@"/usr/bin/dns-sd" arguments:&off_1000F07E8];
      [(NSFileHandle *)v12 closeFile];
      v14[0] = +[NSURL fileURLWithPath:@"dnssd_cachedLocalRecords.txt"];
      v14[1] = +[NSURL fileURLWithPath:@"dnssd_state.txt"];
      [v5 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2)];
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__pingSubnet:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  id v6 = [[-[W5StatusManager networkStatus](self->_status, "networkStatus") primaryIPv4Addresses] firstObject];
  id v7 = v6;
  if (!v6 || ![v6 length])
  {
    id v16 = sub_10009756C();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v24 = (uint64_t)"-[W5LogManager __pingSubnet:]";
    __int16 v25 = 2080;
    __int16 v26 = "W5LogManager.m";
    __int16 v27 = 1024;
    int v28 = 7325;
    __int16 v29 = 2112;
    id v30 = v7;
    LODWORD(v19) = 38;
    id v18 = buf;
LABEL_14:
    _os_log_send_and_compose_impl();
    goto LABEL_9;
  }
  id v8 = [v7 componentsSeparatedByString:@"."];
  if ([v8 count] != (id)4)
  {
    unsigned int v17 = sub_10009756C();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v24 = (uint64_t)"-[W5LogManager __pingSubnet:]";
    __int16 v25 = 2080;
    __int16 v26 = "W5LogManager.m";
    __int16 v27 = 1024;
    int v28 = 7328;
    __int16 v29 = 2112;
    id v30 = v7;
    LODWORD(v19) = 38;
    id v18 = buf;
    goto LABEL_14;
  }
  id v9 = [[objc_msgSend(v8, "subarrayWithRange:", 0, 3) componentsJoinedByString:@"."];
  id v10 = objc_opt_new();
  for (int i = 1; i != 255; ++i)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    void v21[2] = sub_100074398;
    void v21[3] = &unk_1000DEF38;
    v21[4] = self;
    v21[5] = v9;
    char v22 = i;
    [v10 addOperationWithBlock:v21];
  }
  dispatch_time_t v12 = dispatch_semaphore_create(0);
  dispatch_time_t v13 = dispatch_time(0, 60000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074430;
  block[3] = &unk_1000DDC30;
  block[4] = v10;
  void block[5] = v12;
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
  dispatch_time_t v14 = dispatch_time(0, 80000000000);
  if (dispatch_semaphore_wait(v12, v14) > 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v24 = 0x4054000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
LABEL_9:
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__pingBroadcast:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setStartedAt:];
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] powerOn])
  {
    id v6 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"), "path") stringByAppendingPathComponent:@"ping_broadcast.txt"];
    [+[NSFileManager defaultManager] removeItemAtPath:v6 error:0];
    [+[NSFileManager defaultManager] createFileAtPath:v6 contents:0 attributes:0];
    id v7 = +[NSFileHandle fileHandleForUpdatingAtPath:v6];
    if (v7)
    {
      [(W5LogManager *)self __runToolWithOutputFileHandle:v7 launchPath:@"/sbin/ping" arguments:&off_1000F0800];
      dispatch_time_t v12 = +[NSURL fileURLWithPath:@"ping_broadcast.txt"];
      [v5 setRelativeURLs:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1)];
    }
  }
  else
  {
    id v9 = sub_10009756C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      dispatch_time_t v14 = "-[W5LogManager __pingBroadcast:]";
      __int16 v15 = 2080;
      id v16 = "W5LogManager.m";
      __int16 v17 = 1024;
      int v18 = 7362;
      LODWORD(v11) = 28;
      id v10 = &v13;
      _os_log_send_and_compose_impl();
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setCompletedAt:];
  return v5;
}

- (id)__collectDatapathStats:(id)a3
{
  id v5 = objc_alloc_init((Class)W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  char v22 = v5;
  [v5 setStartedAt:];
  id v6 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"OutputDirectory"];
  CFStringRef v7 = (const __CFString *)[a3 configuration][@"FileNameOverride"];
  id v8 = [v6 path];
  if (v7) {
    CFStringRef v9 = v7;
  }
  else {
    CFStringRef v9 = @"wifi_datapath.txt";
  }
  id v10 = [v8 stringByAppendingPathComponent:v9];
  [+[NSFileManager defaultManager] removeItemAtPath:v10 error:0];
  [+[NSFileManager defaultManager] createFileAtPath:v10 contents:0 attributes:0];
  uint64_t v11 = +[NSFileHandle fileHandleForUpdatingAtPath:v10];
  if (v11)
  {
    dispatch_time_t v12 = v11;
    id v13 = +[NSMutableArray array];
    id v14 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] interfaceNames];
    id v15 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] virtualInterfaceNames];
    if (v14) {
      [v13 addObjectsFromArray:v14];
    }
    if (v15) {
      [v13 addObjectsFromArray:v15];
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v13;
    id v16 = [v13 countByEnumeratingWithState:&v24 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v25;
      do
      {
        for (int i = 0; i != v16; int i = (char *)i + 1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v20 = +[NSMutableString string];
          [v20 appendString:@"####################################################################\n"];
          [v20 appendFormat:@"INTERFACE: %@\n", v19];
          [v20 appendString:@"####################################################################\n\n"];
          -[NSFileHandle writeData:](v12, "writeData:", [v20 dataUsingEncoding:4]);
          v38[0] = v19;
          v38[1] = @"-dbg=m";
          [(W5LogManager *)self __runToolWithOutputFileHandle:v12 readFromStandardError:0 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v38 count:2] addCommand:1 addTimestamps:0];
          v37[0] = v19;
          v37[1] = @"-dbg=bgscan-private-mac";
          [(W5LogManager *)self __runToolWithOutputFileHandle:v12 readFromStandardError:0 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v37 count:2] addCommand:1 addTimestamps:0];
          v36[0] = v19;
          v36[1] = @"-dbg=proptx";
          [(W5LogManager *)self __runToolWithOutputFileHandle:v12 readFromStandardError:0 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v36 count:2] addCommand:1 addTimestamps:0];
          v35[0] = @"-i";
          v35[1] = v19;
          void v35[2] = @"wme_counters";
          [(W5LogManager *)self __wlCLIWithArguments:+[NSArray arrayWithObjects:v35 count:3] outputFileHandle:v12 addCommand:1 addTimestamps:0];
          v34[0] = @"-i";
          v34[1] = v19;
          void v34[2] = @"counters";
          [(W5LogManager *)self __wlCLIWithArguments:+[NSArray arrayWithObjects:v34 count:3] outputFileHandle:v12 addCommand:1 addTimestamps:0];
          v33[0] = @"-i";
          v33[1] = v19;
          void v33[2] = @"memuse";
          [(W5LogManager *)self __wlCLIWithArguments:+[NSArray arrayWithObjects:v33 count:3] outputFileHandle:v12 addCommand:1 addTimestamps:0];
          v32[0] = @"-i";
          v32[1] = v19;
          void v32[2] = @"-q";
          [(W5LogManager *)self __runToolWithOutputFileHandle:v12 readFromStandardError:0 launchPath:@"/usr/sbin/netstat" arguments:+[NSArray arrayWithObjects:v32 count:3] addCommand:1 addTimestamps:0];
          v31[0] = v19;
          v31[1] = @"-dbg=print_peers";
          [(W5LogManager *)self __runToolWithOutputFileHandle:v12 readFromStandardError:0 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v31 count:2] addCommand:1 addTimestamps:0];
          v30[0] = v19;
          v30[1] = @"-dbg=print_packets";
          [(W5LogManager *)self __runToolWithOutputFileHandle:v12 readFromStandardError:0 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v30 count:2] addCommand:1 addTimestamps:0];
          v29[0] = v19;
          v29[1] = @"-dbg=print_all_peers_verbose";
          [(W5LogManager *)self __runToolWithOutputFileHandle:v12 readFromStandardError:0 launchPath:@"/usr/local/bin/apple80211" arguments:+[NSArray arrayWithObjects:v29 count:2] addCommand:1 addTimestamps:0];
        }
        id v16 = [obj countByEnumeratingWithState:&v24 objects:v39 count:16];
      }
      while (v16);
    }
    [(NSFileHandle *)v12 closeFile];
    int v28 = +[NSURL fileURLWithPath:v9];
    [v22 setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v22 setCompletedAt:];
  return v22;
}

- (id)__collectLogItem:(id)a3 error:(id *)a4
{
  if ([a3 itemID] == (id)53)
  {
    debugLogQueue = self->_debugLogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000752A4;
    block[3] = &unk_1000DDC30;
    block[4] = a3;
    void block[5] = self;
    dispatch_sync(debugLogQueue, block);
    return [(W5LogManager *)self __collectMultiple:a3];
  }
  else
  {
    id v9 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"UseLeewayUUID"];
    id v10 = [[[a3 configuration] objectForKeyedSubscript:@"AddLeewayUUID"];
    id v37 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"TimestampUUID"];
    id v11 = [[[a3 configuration] objectForKeyedSubscript:@"Timeout"];
    if (v11) {
      uint64_t v12 = (uint64_t)[v11 unsignedIntegerValue];
    }
    else {
      uint64_t v12 = 10000;
    }
    if (v9)
    {
      uint64_t v44 = 0;
      id v45 = &v44;
      uint64_t v46 = 0x2020000000;
      uint64_t v47 = 0;
      queue = self->_queue;
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      void v43[2] = sub_100075418;
      void v43[3] = &unk_1000DE6E8;
      v43[5] = v9;
      v43[6] = &v44;
      v43[4] = self;
      dispatch_sync(queue, v43);
      uint64_t v14 = v45[3];
      id v15 = sub_10009756C();
      v12 += v14;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v45[3];
        id v17 = [v9 substringToIndex:5];
        int v18 = (void (*)(uint64_t, uint64_t))(v12 - v45[3]);
        *(_DWORD *)unsigned __int8 v53 = 134218754;
        *(void *)&v53[4] = v16;
        *(_WORD *)&v53[12] = 2114;
        *(void *)&v53[14] = v17;
        *(_WORD *)&v53[22] = 2048;
        unsigned __int8 v54 = v18;
        LOWORD(v55) = 2048;
        *(void *)((char *)&v55 + 2) = v12;
        LODWORD(v36) = 42;
        __int16 v35 = v53;
        _os_log_send_and_compose_impl();
      }
      _Block_object_dispose(&v44, 8);
    }
    +[NSDate timeIntervalSinceReferenceDate];
    uint64_t v20 = v19;
    uint64_t v44 = 0;
    id v45 = &v44;
    uint64_t v46 = 0x2020000000;
    LOBYTE(v47) = 0;
    *(void *)unsigned __int8 v53 = 0;
    *(void *)&v53[8] = v53;
    *(void *)&v53[16] = 0x3052000000;
    unsigned __int8 v54 = sub_10005D9A4;
    *(void *)&long long v55 = sub_10005D9B4;
    *((void *)&v55 + 1) = 0;
    uint64_t v21 = dispatch_queue_create(0, 0);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    void v42[2] = sub_100075470;
    v42[3] = &unk_1000DEF88;
    void v42[4] = self;
    void v42[5] = a3;
    v42[6] = v21;
    v42[7] = &v44;
    v42[8] = v53;
    v42[9] = a4;
    dispatch_block_t v22 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v42);
    uint64_t v23 = mach_absolute_time();
    [(NSOperationQueue *)[(W5StatusManager *)self->_status concurrentQueue] addOperationWithBlock:v22];
    if (v12) {
      dispatch_time_t v24 = dispatch_time(0, 1000000 * v12);
    }
    else {
      dispatch_time_t v24 = -1;
    }
    intptr_t v25 = dispatch_block_wait(v22, v24);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100075568;
    void v41[3] = &unk_1000DEFB0;
    v41[6] = v53;
    v41[7] = v25;
    void v41[4] = a3;
    void v41[5] = &v44;
    v41[8] = v20;
    dispatch_sync(v21, v41);
    if (!v25 && v10 && v12)
    {
      mach_timebase_info info = 0;
      mach_timebase_info(&info);
      if (info.denom) {
        uint64_t v26 = (mach_absolute_time() - v23) * info.numer / info.denom / 0xF4240;
      }
      else {
        uint64_t v26 = 0;
      }
      uint64_t v27 = v12 - v26;
      int v28 = self->_queue;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      void v39[2] = sub_1000756A4;
      void v39[3] = &unk_1000DE450;
      void v39[4] = self;
      v39[5] = v10;
      v39[6] = v27;
      dispatch_async(v28, v39);
      __int16 v29 = sub_10009756C();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [v10 substringToIndex:5];
        int v49 = 134218242;
        uint64_t v50 = v27;
        __int16 v51 = 2114;
        id v52 = v30;
        _os_log_send_and_compose_impl();
      }
    }
    uint64_t v31 = mach_absolute_time();
    int v32 = self->_queue;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    void v38[2] = sub_100075700;
    void v38[3] = &unk_1000DE450;
    void v38[4] = v37;
    v38[5] = self;
    v38[6] = v31;
    dispatch_async(v32, v38);
    id v8 = [*(id *)(*(void *)&v53[8] + 40) copy];
    id v33 = *(id *)(*(void *)&v53[8] + 40);
    dispatch_release(v21);
    _Block_release(v22);
    _Block_object_dispose(v53, 8);
    _Block_object_dispose(&v44, 8);
  }
  return v8;
}

- (id)__collectIndividual:(id)a3 error:(id *)a4
{
  [a3 itemID];
  uint64_t v7 = W5DescriptionForLogItemID();
  if (-[NSArray containsObject:](-[W5StatusManager bootArgs](self->_status, "bootArgs"), "containsObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@=%ld", @"wifivelocity-exclude-log", [a3 itemID]))|| -[NSArray containsObject:](-[W5StatusManager bootArgs](self->_status, "bootArgs"), "containsObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@='%@'", @"wifivelocity-exclude-log", v7)))
  {
    id v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)mach_timebase_info info = 138543618;
      *(void *)&info[4] = v7;
      *(_WORD *)&info[12] = 2048;
      *(void *)&info[14] = [a3 itemID];
      _os_log_send_and_compose_impl();
    }
    return 0;
  }
  else
  {
    [a3 itemID];
    id v10 = +[NSString stringWithFormat:@"com.apple.wifivelocity.log_item.%@", W5DescriptionForLogItemID()];
    [(NSString *)v10 UTF8String];
    id v11 = (void *)os_transaction_create();
    [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionCreate:-[NSString UTF8String](v10, "UTF8String"), v11];
    debugLogQueue = self->_debugLogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000765EC;
    block[3] = &unk_1000DD8E0;
    block[4] = a3;
    void block[5] = self;
    void block[6] = v7;
    dispatch_sync(debugLogQueue, block);
    switch((unint64_t)[a3 itemID])
    {
      case 1uLL:
        id v13 = [(W5LogManager *)self __collect_spindump:a3];
        goto LABEL_88;
      case 2uLL:
        id v13 = [(W5LogManager *)self __collect_ping:a3];
        goto LABEL_88;
      case 3uLL:
        id v13 = [(W5LogManager *)self __collect_netstat:a3];
        goto LABEL_88;
      case 4uLL:
        id v13 = [(W5LogManager *)self __collect_arp:a3];
        goto LABEL_88;
      case 6uLL:
        id v13 = [(W5LogManager *)self __collect_ndp:a3];
        goto LABEL_88;
      case 7uLL:
        id v13 = [(W5LogManager *)self __collect_ifconfig:a3];
        goto LABEL_88;
      case 8uLL:
        id v13 = [(W5LogManager *)self __collect_ipconfig:a3];
        goto LABEL_88;
      case 9uLL:
        id v13 = [(W5LogManager *)self __collect_traceroute:a3];
        goto LABEL_88;
      case 0xAuLL:
        id v13 = [(W5LogManager *)self __collect_ioreg:a3];
        goto LABEL_88;
      case 0xBuLL:
        id v13 = [(W5LogManager *)self __collect_kextstat:a3];
        goto LABEL_88;
      case 0xCuLL:
        id v13 = [(W5LogManager *)self __collect_darwinup:a3];
        goto LABEL_88;
      case 0xDuLL:
        id v13 = [(W5LogManager *)self __collect_hosts:a3];
        goto LABEL_88;
      case 0xEuLL:
        id v13 = [(W5LogManager *)self __collect_sysdiagnose:a3];
        goto LABEL_88;
      case 0xFuLL:
        id v13 = [(W5LogManager *)self __collect_pmset:a3];
        goto LABEL_88;
      case 0x10uLL:
        id v13 = [(W5LogManager *)self __collect_configd:a3];
        goto LABEL_88;
      case 0x11uLL:
        id v13 = [(W5LogManager *)self __collect_top:a3];
        goto LABEL_88;
      case 0x12uLL:
        id v13 = [(W5LogManager *)self __collect_swvers:a3];
        goto LABEL_88;
      case 0x13uLL:
        id v13 = [(W5LogManager *)self __collectCoreCapture:a3];
        goto LABEL_88;
      case 0x14uLL:
        id v13 = [(W5LogManager *)self __collectCoreCapture24:a3];
        goto LABEL_88;
      case 0x15uLL:
        id v13 = [(W5LogManager *)self __collectCoreCaptureDump:a3];
        goto LABEL_88;
      case 0x18uLL:
        id v13 = [(W5LogManager *)self __collectTCPDump_PRE:a3];
        goto LABEL_88;
      case 0x19uLL:
        id v13 = [(W5LogManager *)self __collectTCPDump_POST:a3];
        goto LABEL_88;
      case 0x1AuLL:
        id v13 = [(W5LogManager *)self __collectDiagnostics:a3];
        goto LABEL_88;
      case 0x1BuLL:
        id v13 = [(W5LogManager *)self __collectSystemConfiguration:a3];
        goto LABEL_88;
      case 0x1CuLL:
        id v13 = [(W5LogManager *)self __collectWiFiScanResults:a3];
        goto LABEL_88;
      case 0x1DuLL:
        id v13 = [(W5LogManager *)self __collectAirPlayLogs:a3];
        goto LABEL_88;
      case 0x1EuLL:
        id v13 = [(W5LogManager *)self __collectBluetoothLogs:a3];
        goto LABEL_88;
      case 0x1FuLL:
        id v13 = [(W5LogManager *)self __collectSystemLogs:a3];
        goto LABEL_88;
      case 0x20uLL:
        id v13 = [(W5LogManager *)self __collectSystemLogs24:a3];
        goto LABEL_88;
      case 0x21uLL:
        id v13 = [(W5LogManager *)self __collectEAP8021XLogs:a3];
        goto LABEL_88;
      case 0x22uLL:
        id v13 = [(W5LogManager *)self __collectIPConfigurationLogs:a3];
        goto LABEL_88;
      case 0x23uLL:
        id v13 = [(W5LogManager *)self __collectCrashesAndSpins24:a3];
        goto LABEL_88;
      case 0x24uLL:
        id v13 = [(W5LogManager *)self __collectSharingLogs:a3];
        goto LABEL_88;
      case 0x25uLL:
        id v13 = [(W5LogManager *)self __collectWiFiLogs:a3];
        goto LABEL_88;
      case 0x26uLL:
        id v13 = [(W5LogManager *)self __collectWiFiLogs24:a3];
        goto LABEL_88;
      case 0x27uLL:
        id v13 = [(W5LogManager *)self __collectWiFiLogsDump:a3];
        goto LABEL_88;
      case 0x28uLL:
        id v13 = [(W5LogManager *)self __collectWiFiPreferences:a3];
        goto LABEL_88;
      case 0x29uLL:
        id v13 = [(W5LogManager *)self __collectWirelessProxLogs:a3];
        goto LABEL_88;
      case 0x2AuLL:
        id v13 = [(W5LogManager *)self __collect_IMFoundationPing:a3];
        goto LABEL_88;
      case 0x2BuLL:
        id v13 = [(W5LogManager *)self __collect_CFNetworkPing:a3];
        goto LABEL_88;
      case 0x2CuLL:
        id v13 = [(W5LogManager *)self __collectNetworkStatus:a3];
        goto LABEL_88;
      case 0x2DuLL:
        id v13 = [(W5LogManager *)self __collectWiFiStatus:a3];
        goto LABEL_88;
      case 0x2EuLL:
        id v13 = [(W5LogManager *)self __collectAWDLStatus:a3];
        goto LABEL_88;
      case 0x2FuLL:
        id v13 = [(W5LogManager *)self __collectBluetoothStatus:a3];
        goto LABEL_88;
      case 0x30uLL:
        id v13 = [(W5LogManager *)self __collectLeakyAPStats:a3];
        goto LABEL_88;
      case 0x31uLL:
        id v13 = [(W5LogManager *)self __collectBonjourRecords:a3];
        goto LABEL_88;
      case 0x32uLL:
        id v13 = [(W5LogManager *)self __collectEventHistory:a3];
        goto LABEL_88;
      case 0x33uLL:
        id v13 = [(W5LogManager *)self __collectPerSSIDDiagnosticsHistory:a3];
        goto LABEL_88;
      case 0x34uLL:
        *(void *)mach_timebase_info info = 0;
        *(void *)&info[8] = info;
        *(void *)&info[16] = 0x3052000000;
        *(void *)unsigned __int8 v53 = sub_10005D9A4;
        *(void *)&v53[8] = sub_10005D9B4;
        *(void *)&v53[16] = 0;
        queue = self->_queue;
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_10007676C;
        void v48[3] = &unk_1000DD980;
        v48[4] = self;
        void v48[5] = info;
        dispatch_sync(queue, v48);
        id v15 = *(id *)(*(void *)&info[8] + 40);
        id v9 = [(W5LogManager *)self __collectAdditionalLog:a3 url:*(void *)(*(void *)&info[8] + 40)];
        uint64_t v16 = (uint64_t *)info;
        goto LABEL_104;
      case 0x39uLL:
        id v13 = [(W5LogManager *)self __collect_mobilewifitool:a3];
        goto LABEL_88;
      case 0x3DuLL:
      case 0x3EuLL:
        id v13 = [(W5LogManager *)self __collectWiFiStatsCLI:a3];
        goto LABEL_88;
      case 0x3FuLL:
        id v9 = objc_alloc_init((Class)W5LogItemReceipt);
        [v9 setRequest:a3];
        +[NSDate timeIntervalSinceReferenceDate];
        [v9 setStartedAt:];
        [(W5DiagnosticsManager *)self->_diagnostics beginWiFiDefaultRoute];
        +[NSDate timeIntervalSinceReferenceDate];
        [v9 setCompletedAt:];
        break;
      case 0x40uLL:
        id v9 = objc_alloc_init((Class)W5LogItemReceipt);
        [v9 setRequest:a3];
        +[NSDate timeIntervalSinceReferenceDate];
        [v9 setStartedAt:];
        [(W5DiagnosticsManager *)self->_diagnostics endWiFiDefaultRoute];
        +[NSDate timeIntervalSinceReferenceDate];
        [v9 setCompletedAt:];
        break;
      case 0x41uLL:
        id v13 = [(W5LogManager *)self __collect_wl_curpower:a3];
        goto LABEL_88;
      case 0x42uLL:
        id v13 = [(W5LogManager *)self __collect_wl_cca_get_stats:a3];
        goto LABEL_88;
      case 0x45uLL:
        id v9 = objc_alloc_init((Class)W5LogItemReceipt);
        [v9 setRequest:a3];
        +[NSDate timeIntervalSinceReferenceDate];
        [v9 setStartedAt:];
        id v17 = [objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"Delay"];
        if (v17)
        {
          unint64_t v37 = (unint64_t)[v17 unsignedIntegerValue];
        }
        else
        {
          dispatch_time_t v24 = sub_10009756C();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)mach_timebase_info info = 0;
            LODWORD(v35) = 2;
            id v34 = info;
            _os_log_send_and_compose_impl();
          }
          unint64_t v37 = 1000;
        }
        id v25 = [[objc_msgSend(a3, "configuration", v34, v35) objectForKeyedSubscript:@"UseLeewayUUID"];
        id v26 = [[objc_msgSend(a3, "configuration") objectForKeyedSubscript:@"TimestampUUID"];
        uint64_t v44 = 0;
        id v45 = &v44;
        uint64_t v46 = 0x2020000000;
        uint64_t v47 = 0;
        uint64_t v40 = 0;
        unsigned __int8 v41 = &v40;
        uint64_t v42 = 0x2020000000;
        uint64_t v43 = 0;
        uint64_t v27 = self->_queue;
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        void v39[2] = sub_1000767C4;
        void v39[3] = &unk_1000DEFD8;
        void v39[4] = v25;
        v39[5] = self;
        void v39[7] = &v44;
        v39[8] = &v40;
        v39[6] = v26;
        dispatch_sync(v27, v39);
        if (v41[3] && (*(void *)mach_timebase_info info = 0, mach_timebase_info((mach_timebase_info_t)info), *(_DWORD *)&info[4])) {
          uint64_t v28 = (mach_absolute_time() - v41[3]) * *(unsigned int *)info / *(unsigned int *)&info[4] / 0xF4240;
        }
        else {
          uint64_t v28 = 0;
        }
        uint64_t v36 = v28;
        if (v37 >= v28) {
          unint64_t v29 = v37 - v28;
        }
        else {
          unint64_t v29 = 0;
        }
        uint64_t v30 = v45[3];
        uint64_t v31 = sub_10009756C();
        uint64_t v32 = v30 + v29;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = v45[3];
          *(_DWORD *)mach_timebase_info info = 134218752;
          *(void *)&info[4] = v37;
          *(_WORD *)&info[12] = 2048;
          *(void *)&info[14] = v36;
          *(_WORD *)&info[22] = 2048;
          *(void *)unsigned __int8 v53 = v33;
          *(_WORD *)&v53[8] = 2048;
          *(void *)&v53[10] = v32;
          _os_log_send_and_compose_impl();
        }
        usleep(1000 * v32);
        +[NSDate timeIntervalSinceReferenceDate];
        [v9 setCompletedAt:];
        _Block_object_dispose(&v40, 8);
        uint64_t v16 = &v44;
LABEL_104:
        _Block_object_dispose(v16, 8);
        break;
      case 0x46uLL:
        id v13 = [(W5LogManager *)self __collectPreviouslyCollected:a3];
        goto LABEL_88;
      case 0x49uLL:
        id v13 = [(W5LogManager *)self __collectNetworkPreferences:a3];
        goto LABEL_88;
      case 0x4AuLL:
        id v13 = [(W5LogManager *)self __collectWiFiMemoryUsage:a3];
        goto LABEL_88;
      case 0x4BuLL:
        id v13 = [(W5LogManager *)self __collectWiFiDeviceConfig:a3];
        goto LABEL_88;
      case 0x4CuLL:
        id v13 = [(W5LogManager *)self __collectWiFiPerfLogs:a3];
        goto LABEL_88;
      case 0x4EuLL:
        id v13 = [(W5LogManager *)self __collectWiFiVelocityLog:a3];
        goto LABEL_88;
      case 0x50uLL:
        id v13 = [(W5LogManager *)self __collect3barsCache:a3];
        goto LABEL_88;
      case 0x51uLL:
        id v13 = [(W5LogManager *)self __collectDatapathStats:a3];
        goto LABEL_88;
      case 0x54uLL:
        id v13 = [(W5LogManager *)self __collectDeviceAnalyticsStore:a3];
        goto LABEL_88;
      case 0x55uLL:
        id v13 = [(W5LogManager *)self __collectDeviceAnalyticsDeploymentGraph:a3];
        goto LABEL_88;
      case 0x56uLL:
        id v13 = [(W5LogManager *)self __collectPeerDiagnostics:a3];
        goto LABEL_88;
      case 0x57uLL:
        id v13 = [(W5LogManager *)self __collectDextCoreDump:a3];
        goto LABEL_88;
      case 0x58uLL:
        if (!objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"BatchSize"))
        {
          int v18 = sub_10009756C();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [a3 configuration];
            *(_DWORD *)mach_timebase_info info = 138412290;
            *(void *)&info[4] = v19;
            LODWORD(v35) = 12;
            id v34 = info;
            _os_log_send_and_compose_impl();
          }
        }
        uint64_t v20 = sub_10009756C();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = [a3 configuration];
          *(_DWORD *)mach_timebase_info info = 136315906;
          *(void *)&info[4] = "-[W5LogManager __collectIndividual:error:]";
          *(_WORD *)&info[12] = 2080;
          *(void *)&info[14] = "W5LogManager.m";
          *(_WORD *)&info[22] = 1024;
          *(_DWORD *)unsigned __int8 v53 = 8104;
          *(_WORD *)&v53[4] = 2112;
          *(void *)&void v53[6] = v21;
          LODWORD(v35) = 38;
          id v34 = info;
          _os_log_send_and_compose_impl();
        }
        id v13 = -[W5LogManager __collectDeviceAnalyticsEntityCSVs:](self, "__collectDeviceAnalyticsEntityCSVs:", a3, v34, v35);
        goto LABEL_88;
      case 0x59uLL:
        id v13 = [(W5LogManager *)self __dnssdBrowseAll:a3];
        goto LABEL_88;
      case 0x5AuLL:
        id v13 = [(W5LogManager *)self __dnssdCacheAndState:a3];
        goto LABEL_88;
      case 0x5BuLL:
        id v13 = [(W5LogManager *)self __pingSubnet:a3];
        goto LABEL_88;
      case 0x5CuLL:
        id v13 = [(W5LogManager *)self __pingBroadcast:a3];
LABEL_88:
        id v9 = v13;
        break;
      default:
        id v9 = objc_alloc_init((Class)W5LogItemReceipt);
        [v9 setRequest:a3];
        +[NSDate timeIntervalSinceReferenceDate];
        [v9 setStartedAt:];
        [v9 startedAt];
        [v9 setCompletedAt:];
        if (a4)
        {
          NSErrorUserInfoKey v50 = NSLocalizedFailureReasonErrorKey;
          CFStringRef v51 = @"W5ParamErr";
          *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 1, +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1]);
        }
        break;
    }
    dispatch_block_t v22 = self->_debugLogQueue;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    void v38[2] = sub_100076858;
    void v38[3] = &unk_1000DD8E0;
    void v38[4] = a3;
    v38[5] = v9;
    v38[6] = self;
    dispatch_sync(v22, v38);
    [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager")] osTransactionComplete:v11];
  }
  return v9;
}

- (id)__runDiagnosticsTests:(id)a3 configuration:(id)a4 timeout:(int64_t)a5 error:(id *)a6
{
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3052000000;
  int v49 = sub_10005D9A4;
  NSErrorUserInfoKey v50 = sub_10005D9B4;
  uint64_t v51 = 0;
  uint64_t v40 = 0;
  unsigned __int8 v41 = &v40;
  uint64_t v42 = 0x3052000000;
  uint64_t v43 = sub_10005D9A4;
  uint64_t v44 = sub_10005D9B4;
  uint64_t v45 = 0;
  uint64_t v36 = 0;
  unint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  id v11 = objc_alloc_init((Class)NSLock);
  uint64_t v12 = dispatch_semaphore_create(0);
  id v13 = objc_alloc_init(W5DiagnosticsTestRequestInternal);
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3052000000;
  unint64_t v29 = sub_10005D9A4;
  uint64_t v30 = sub_10005D9B4;
  uint64_t v31 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076FE8;
  block[3] = &unk_1000DD980;
  block[4] = self;
  void block[5] = &v26;
  dispatch_sync(queue, block);
  id v15 = (id)v27[5];
  [(W5DiagnosticsTestRequestInternal *)v13 setUuid:v27[5]];
  [(W5DiagnosticsTestRequestInternal *)v13 setTestRequests:a3];
  -[W5DiagnosticsTestRequestInternal setIncludeEvents:](v13, "setIncludeEvents:", [objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"IncludeEvents"), "BOOLValue")]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  void v24[2] = sub_100077040;
  void v24[3] = &unk_1000DF000;
  v24[6] = &v36;
  v24[7] = &v32;
  v24[8] = &v40;
  v24[9] = &v46;
  v24[4] = v11;
  v24[5] = v12;
  [(W5DiagnosticsTestRequestInternal *)v13 setReply:v24];
  [(W5DiagnosticsManager *)self->_diagnostics addRequest:v13];
  if (a5)
  {
    dispatch_time_t v16 = dispatch_time(0, (uint64_t)((double)a5 / 1000.0 * 1000000000.0));
    if (dispatch_semaphore_wait(v12, v16))
    {
      [v11 lock];
      if (!*((unsigned char *)v33 + 24))
      {
        *((unsigned char *)v37 + 24) = 1;
        NSErrorUserInfoKey v54 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v55 = @"W5TimeoutErr";
        id v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 3, +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1]);
        void v41[5] = (uint64_t)v17;
      }
      [v11 unlock];
    }
  }
  else
  {
    dispatch_time_t v18 = dispatch_time(0, 600000000000);
    if (dispatch_semaphore_wait(v12, v18) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v53 = 0x4082C00000000000;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
    }
  }
  id v19 = (id)v41[5];
  id v20 = (id)v47[5];
  if (a6)
  {
    id v21 = (void *)v41[5];
    if (v21) {
      *a6 = [v21 copy];
    }
  }
  id v22 = [(id)v47[5] copy];
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  return v22;
}

+ (id)__descriptionForNetwork:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = +[NSMutableString string];
  id v5 = [a3 ssidString];
  if (v5) {
    [v4 appendFormat:@"'%@' %@, ", v5, [a3 ssid]];
  }
  else {
    [v4 appendFormat:@"<HIDDEN>, ", v15, v16];
  }
  [v4 appendFormat:@"bssid=%@, ", [a3 bssid]];
  [a3 channel];
  [v4 appendFormat:@"channel=[%@], ", W5DescriptionForChannel()];
  [v4 appendFormat:@"cc=%@, ", [a3 countryCode]];
  [a3 fastestSupportedPHYMode];
  [v4 appendFormat:@"type=%@, ", W5DescriptionForPHYMode()];
  [v4 appendFormat:@"rssi=%li, ", [a3 rssi]];
  [v4 appendFormat:@"rsn=%@, ", sub_10001CF78(a3)];
  [v4 appendFormat:@"wpa=%@, ", sub_10001CBE0(a3)];
  if (objc_msgSend(objc_msgSend(a3, "supportedSecurityTypes"), "containsObject:", &off_1000EB920)) {
    id v6 = "yes";
  }
  else {
    id v6 = "no";
  }
  [v4 appendFormat:@"wep=%s, ", v6];
  if (objc_msgSend(objc_msgSend(a3, "supportedSecurityTypes"), "containsObject:", &off_1000EB788))
  {
    uint64_t v7 = "cert";
  }
  else
  {
    unsigned int v8 = [[objc_msgSend(a3, "supportedSecurityTypes") containsObject:&off_1000EB938];
    uint64_t v7 = "psk";
    if (!v8) {
      uint64_t v7 = "no";
    }
  }
  [v4 appendFormat:@"wapi=%s, ", v7];
  if ([a3 isIBSS]) {
    id v9 = "yes";
  }
  else {
    id v9 = "no";
  }
  [v4 appendFormat:@"ibss=%s, ", v9];
  if ([a3 isPersonalHotspot]) {
    id v10 = "yes";
  }
  else {
    id v10 = "no";
  }
  [v4 appendFormat:@"ph=%s, ", v10];
  if ([a3 isAppleSWAP]) {
    id v11 = "yes";
  }
  else {
    id v11 = "no";
  }
  [v4 appendFormat:@"swap=%s, ", v11];
  if ([a3 isPasspoint]) {
    uint64_t v12 = "yes";
  }
  else {
    uint64_t v12 = "no";
  }
  [v4 appendFormat:@"hs20=%s, ", v12];
  id v13 = [a3 airPortBaseStationModelName];
  if (v13) {
    [v4 appendFormat:@"airport=[%@]", v13];
  }
  return v4;
}

+ (id)__logScanResults:(id)a3
{
  id v4 = +[NSMutableString string];
  v33[0] = +[NSSortDescriptor sortDescriptorWithKey:@"networkName" ascending:1 selector:"caseInsensitiveCompare:"];
  v33[1] = +[NSSortDescriptor sortDescriptorWithKey:@"BSSID" ascending:1];
  id v20 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [a3 sortedArrayUsingDescriptors:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2)];
  id v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v27 = *(void *)v29;
    do
    {
      for (int i = 0; i != v6; int i = (char *)i + 1)
      {
        if (*(void *)v29 != v27) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v14 = v4;
        [v4 appendFormat:@"%@\n\n", v13];
        unsigned int v15 = [[[v13 channel] is6GHz];
        id v16 = [v13 channel];
        if (v15)
        {
          if ([v16 is6GHzPSC]) {
            ++v25;
          }
          else {
            ++v23;
          }
        }
        else
        {
          unsigned int v17 = [v16 is5GHz];
          id v18 = [v13 channel];
          if (v17)
          {
            if ([v18 isDFS]) {
              ++v21;
            }
            else {
              ++v22;
            }
          }
          else
          {
            v24 += [v18 is2GHz];
          }
        }
        id v4 = v14;
        v7 += [v13 isIBSS];
        if (![v13 SSID]) {
          ++v9;
        }
        if ([v13 airPortBaseStationModel]) {
          ++v8;
        }
        v10 += [v13 isPasspoint];
        v11 += [v13 isPersonalHotspot];
      }
      id v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  [v4 insertString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"total=%lu, 6GHz(PSC)=%ld, 6GHz(NonPSC)=%ld, 5GHz(Active)=%ld, 5GHz(DFS)=%ld, 2GHz=%ld, ibss=%ld, hidden=%ld, passpoint=%ld, ph=%ld, airport=%ld\n\n\n", [v20 count], v25, v23, v22, v21, v24, v7, v9, v10, v11, v8), 0 atIndex];
  return v4;
}

- (id)__logDiagnosticsPingResults:(id)a3
{
  id v5 = +[NSMutableString string];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = a3;
  id v24 = [a3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * v6);
        id v8 = [v7 testID];
        id v9 = [v7 info];
        uint64_t v25 = v6;
        if (v8 == (id)53)
        {
          [v5 appendString:-[W5LogManager __logDiagnosticsPingResults:](self, "__logDiagnosticsPingResults:", [v9 objectForKeyedSubscript:@"ConcurrentResults"])];
        }
        else
        {
          id v10 = [v9 objectForKeyedSubscript:@"PingResult"];
          id v11 = [objc_msgSend(v7, "info") objectForKeyedSubscript:@"PingResults"];
          id v12 = +[NSMutableArray array];
          if ([v11 count]) {
            [v12 addObjectsFromArray:v11];
          }
          if (v10) {
            [v12 addObject:v10];
          }
          if ([v12 count])
          {
            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            id v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v13)
            {
              id v14 = v13;
              uint64_t v15 = *(void *)v27;
              do
              {
                for (int i = 0; i != v14; int i = (char *)i + 1)
                {
                  if (*(void *)v27 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  unsigned int v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                  [v5 appendString:@"————————————————————————————————————————————————————————————————————\n"];
                  dateFormatter = self->_dateFormatter;
                  [v17 startedAt];
                  id v19 = [(NSDateFormatter *)dateFormatter stringFromDate:+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:")];
                  id v20 = self->_dateFormatter;
                  [v17 endedAt];
                  [v5 appendFormat:@"[%@ - %@]\n", v19, -[NSDateFormatter stringFromDate:](v20, "stringFromDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"))];
                  [v5 appendFormat:@"%@\n", [v17 command]];
                  [v5 appendFormat:@"%@\n", [v17 output]];
                }
                id v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }
              while (v14);
            }
          }
        }
        uint64_t v6 = v25 + 1;
      }
      while ((id)(v25 + 1) != v24);
      id v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }
  return v5;
}

- (id)__logDiagnosticsTestResults:(id)a3
{
  id v4 = +[NSMutableString string];
  [v4 appendString:W5FormattedHeaderForDiagnosticsTestResults()];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (int i = 0; i != v6; int i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(a3);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v9 testID] == (id)53)
        {
          id v10 = [[objc_msgSend(v9, "info") objectForKeyedSubscript:@"ConcurrentResults"];
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v11 = (char *)[v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v17;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(void *)v17 != v13) {
                  objc_enumerationMutation(v10);
                }
                [v4 appendString:W5FormattedDescriptionForDiagnosticsTestResult()];
              }
              id v12 = (char *)[v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v12);
          }
        }
        else
        {
          [v4 appendString:W5FormattedDescriptionForDiagnosticsTestResult()];
        }
      }
      id v6 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
  return v4;
}

+ (id)__logBTCProfile:(apple80211_btc_profile_osx *)a3
{
  id v4 = +[NSMutableString stringWithCapacity:0];
  [(NSMutableString *)v4 appendFormat:@"      Mode                        : %@\n", W5DescriptionForBTCMode()];
  [(NSMutableString *)v4 appendFormat:@"      Desense                     : %@\n", W5DescriptionForDesenseFlags()];
  [(NSMutableString *)v4 appendFormat:@"      Desense Level               : %i\n", a3->var2];
  [(NSMutableString *)v4 appendFormat:@"      Desense Thresh              : [%i,%i]\n", a3->var4, a3->var3];
  [(NSMutableString *)v4 appendFormat:@"      Chain Ack                   : ["];
  if (a3->var5)
  {
    unint64_t v5 = 0;
    do
    {
      if (a3->var6[v5] == 1) {
        id v6 = "On";
      }
      else {
        id v6 = "Off";
      }
      [(NSMutableString *)v4 appendFormat:@"%s", v6];
      unsigned int var5 = a3->var5;
      if (v5 < var5 - 1)
      {
        [(NSMutableString *)v4 appendString:@","];
        unsigned int var5 = a3->var5;
      }
      ++v5;
    }
    while (v5 < var5);
  }
  [(NSMutableString *)v4 appendString:@"]\n"];
  [(NSMutableString *)v4 appendFormat:@"      Chain Tx Power Offset       : ["];
  if (a3->var5)
  {
    unint64_t v8 = 0;
    do
    {
      [(NSMutableString *)v4 appendFormat:@"%i", a3->var7[v8]];
      unsigned int v9 = a3->var5;
      if (v8 < v9 - 1)
      {
        [(NSMutableString *)v4 appendString:@","];
        unsigned int v9 = a3->var5;
      }
      ++v8;
    }
    while (v8 < v9);
  }
  [(NSMutableString *)v4 appendString:@"]\n"];
  [(NSMutableString *)v4 appendFormat:@"      WiFi RSSI Thresh / Hyst     : %i/%i\n", a3->var8, a3->var9];
  [(NSMutableString *)v4 appendFormat:@"      BT RSSI Thresh / Hyst       : %i/%i\n", a3->var10, a3->var11];
  [(NSMutableString *)v4 appendFormat:@"      SISO Resp Enable            : ["];
  if (a3->var12)
  {
    unint64_t v10 = 0;
    do
    {
      [(NSMutableString *)v4 appendFormat:@"%i", a3->var13[v10]];
      unsigned int var12 = a3->var12;
      if (v10 < var12 - 1)
      {
        [(NSMutableString *)v4 appendString:@","];
        unsigned int var12 = a3->var12;
      }
      ++v10;
    }
    while (v10 < var12);
  }
  [(NSMutableString *)v4 appendString:@"]\n"];
  [(NSMutableString *)v4 appendFormat:@"      Max SISO Resp Power         : ["];
  if (a3->var12)
  {
    unint64_t v12 = 0;
    do
    {
      [(NSMutableString *)v4 appendFormat:@"%i", a3->var14[v12]];
      unsigned int v13 = a3->var12;
      if (v12 < v13 - 1)
      {
        [(NSMutableString *)v4 appendString:@","];
        unsigned int v13 = a3->var12;
      }
      ++v12;
    }
    while (v12 < v13);
  }
  [(NSMutableString *)v4 appendString:@"]\n"];
  id v14 = [(NSMutableString *)v4 copy];

  return v14;
}

+ (id)__logTxPower:(apple80211_per_chain_power_data_get *)a3
{
  id v4 = +[NSMutableString stringWithCapacity:0];
  [(NSMutableString *)v4 appendFormat:@"      Current            : %i\n", a3->var2];
  [(NSMutableString *)v4 appendFormat:@"      Offset             : %i\n", a3->var1];
  [(NSMutableString *)v4 appendFormat:@"      Min                : %i\n", a3->var3];
  [(NSMutableString *)v4 appendFormat:@"      Max                : %i\n", a3->var4];
  id v5 = [(NSMutableString *)v4 copy];

  return v5;
}

+ (id)__logNetworkStatus:(id)a3
{
  id v4 = +[NSMutableString string];
  if ([a3 primaryIPv4InterfaceName])
  {
    [v4 appendFormat:@"    Primary IPv4         : %s (%s / %s)\n", [objc_msgSend(objc_msgSend(a3, "primaryIPv4InterfaceName"), "UTF8String") UTF8String], [objc_msgSend(objc_msgSend(a3, "primaryIPv4ServiceName"), "UTF8String") UTF8String], [objc_msgSend(objc_msgSend(a3, "primaryIPv4ServiceID"), "UTF8String") UTF8String]];
    id v5 = [a3 primaryIPv4Addresses];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (int i = 0; i != v7; int i = (char *)i + 1)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 appendFormat:@"                         : %s\n", [*(id *)(*((void *)&v25 + 1) + 8 * i) UTF8String]];
        }
        id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v7);
    }
  }
  else
  {
    [v4 appendFormat:@"    Primary IPv4         : None\n"];
  }
  if ([a3 primaryIPv6InterfaceName])
  {
    [v4 appendFormat:@"    Primary IPv6         : %s (%s / %s)\n", [objc_msgSend(objc_msgSend(a3, "primaryIPv6InterfaceName"), "UTF8String") UTF8String], [objc_msgSend(objc_msgSend(a3, "primaryIPv6ServiceName"), "UTF8String") UTF8String], [objc_msgSend(objc_msgSend(a3, "primaryIPv6ServiceID"), "UTF8String") UTF8String]];
    id v10 = [a3 primaryIPv6Addresses];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          [v4 appendFormat:@"                         : %s\n", [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) UTF8String]];
        }
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v12);
    }
  }
  else
  {
    [v4 appendFormat:@"    Primary IPv6         : None\n"];
  }
  id v15 = [a3 primaryDNSAddresses];
  if ([v15 count])
  {
    [v4 appendFormat:@"    DNS Addresses        : %s\n", [objc_msgSend(objc_msgSend(v15, "firstObject"), "UTF8String") UTF8String]];
    if ((unint64_t)[v15 count] >= 2 && (unint64_t)objc_msgSend(v15, "count") >= 2)
    {
      unint64_t v16 = 1;
      do
        [v4 appendFormat:@"                         : %s\n", [v15 objectAtIndexedSubscript:v16++] UTF8String]];
      while (v16 < (unint64_t)[v15 count]);
    }
  }
  else
  {
    [v4 appendFormat:@"    DNS Addresses        : None\n"];
  }
  long long v17 = "Not Reachable";
  if (([a3 isAppleReachable] & 2) != 0
    && ([a3 isAppleReachable] & 4) == 0)
  {
    long long v17 = "Reachable";
  }
  id v18 = [a3 isAppleReachable];
  long long v19 = " (WWAN)";
  if ((v18 & 0x40000) == 0) {
    long long v19 = "";
  }
  [v4 appendFormat:@"    Apple                : %s%s\n", v17, v19];
  return v4;
}

+ (id)__logWiFiStatus:(id)a3
{
  id v5 = +[NSMutableString string];
  [v5 appendFormat:@"    MAC Address          : %s (hw=%s)\n", [objc_msgSend(objc_msgSend(a3, "macAddress"), "UTF8String") UTF8String], [objc_msgSend(objc_msgSend(a3, "hardwareMACAddress"), "UTF8String") UTF8String]];
  [v5 appendFormat:@"    Interface Name       : %s\n", [objc_msgSend(objc_msgSend(a3, "interfaceName"), "UTF8String")] UTF8String]];
  if ([a3 powerOn]) {
    id v6 = "On";
  }
  else {
    id v6 = "Off";
  }
  if (objc_msgSend(objc_msgSend(a3, "power"), "length") == (id)24) {
    [objc_msgSend(a3, "power") bytes];
  }
  [v5 appendFormat:@"    Power                : %s [%@]\n", v6, W5DescriptionForPower()];
  [a3 opMode];
  [v5 appendFormat:@"    Op Mode              : %s\n", [W5DescriptionForOpMode() UTF8String]];
  if (objc_msgSend(objc_msgSend(a3, "ssidString"), "UTF8String")) {
    id v7 = [(const char *)[a3 ssidString] UTF8String];
  }
  else {
    id v7 = "None";
  }
  [v5 appendFormat:@"    SSID                 : %s\n", v7];
  if (objc_msgSend(objc_msgSend(a3, "bssid"), "UTF8String")) {
    uint64_t v8 = (const char *)[a3 bssid].UTF8String;
  }
  else {
    uint64_t v8 = "None";
  }
  [v5 appendFormat:@"    BSSID                : %s\n", v8];
  [v5 appendFormat:@"    RSSI                 : %i dBm\n", [a3 rssi]];
  [v5 appendFormat:@"    Noise                : %i dBm\n", [a3 noise]];
  [a3 txRate];
  [v5 appendFormat:@"    Tx Rate              : %.1f Mbps\n", v9];
  if ([a3 ssid])
  {
    [a3 security];
    [v5 appendFormat:@"    Security             : %s\n", [W5DescriptionForSecurity() UTF8String]];
  }
  else
  {
    [v5 appendFormat:@"    Security             : None\n", v51];
  }
  if ([a3 security] == (id)12
    || [a3 security] == (id)11
    || [a3 security] == (id)9
    || [a3 security] == (id)10
    || [a3 security] == (id)8)
  {
    [a3 eapolControlMode];
    [v5 appendFormat:@"    802.1X Mode          : %s\n", [W5DescriptionForEAPOLControlMode() UTF8String]];
    [a3 eapolSupplicantState];
    [v5 appendFormat:@"    802.1X Supplicant    : %s\n", [W5DescriptionForEAPOLSupplicantState() UTF8String]];
  }
  [a3 phyMode];
  [v5 appendFormat:@"    PHY Mode             : %s\n", [W5DescriptionForPHYMode() UTF8String]];
  [v5 appendFormat:@"    MCS Index            : %i\n", [a3 mcsIndex]];
  id v10 = [a3 ssid];
  if (v10) {
    id v10 = [a3 guardInterval];
  }
  [v5 appendFormat:@"    Guard Interval       : %i\n", v10];
  [v5 appendFormat:@"    NSS                  : %i\n", [a3 numberOfSpacialStreams]];
  [a3 channel];
  if ([(id)W5DescriptionForChannel() UTF8String])
  {
    [a3 channel];
    id v11 = (const char *)[(id)W5DescriptionForChannel() UTF8String];
  }
  else
  {
    id v11 = "None";
  }
  [v5 appendFormat:@"    Channel              : %s\n", v11];
  [v5 appendFormat:@"    Country Code         : %s\n", [objc_msgSend(objc_msgSend(a3, "countryCode"), "UTF8String") UTF8String]];
  if (objc_msgSend(objc_msgSend(a3, "networkServiceID"), "UTF8String")) {
    id v12 = (const char *)[[[a3 networkServiceID] UTF8String]];
  }
  else {
    id v12 = "None";
  }
  [v5 appendFormat:@"    NetworkServiceID     : %s\n", v12];
  [a3 ipv4ConfigMethod];
  [v5 appendFormat:@"    IPv4 Config Method   : %s\n", [W5DescriptionForIPv4ConfigMethod() UTF8String]];
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "firstObject"), "UTF8String")) {
    uint64_t v13 = (const char *)[[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "firstObject"), "UTF8String");
  }
  else {
    uint64_t v13 = "None";
  }
  [v5 appendFormat:@"    IPv4 Address         : %s\n", v13];
  if ((unint64_t)objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "count") >= 2)
  {
    unint64_t v14 = 1;
    do
      printf("                         : %s\n", (const char *)[[[objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "objectAtIndexedSubscript:", v14++) UTF8String];
    while (v14 < (unint64_t)[objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "count")]);
  }
  if (objc_msgSend(objc_msgSend(a3, "ipv4RouterAddress"), "UTF8String")) {
    id v15 = (const char *)[objc_msgSend(objc_msgSend(a3, "ipv4RouterAddress"), "UTF8String")];
  }
  else {
    id v15 = "None";
  }
  [v5 appendFormat:@"    IPv4 Router          : %s\n", v15];
  [a3 ipv6ConfigMethod];
  [v5 appendFormat:@"    IPv6 Config Method   : %s\n", [W5DescriptionForIPv6ConfigMethod() UTF8String]];
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "firstObject"), "UTF8String")) {
    unint64_t v16 = (const char *)[[[objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "firstObject") UTF8String];
  }
  else {
    unint64_t v16 = "None";
  }
  [v5 appendFormat:@"    IPv6 Address         : %s\n", v16];
  if ((unint64_t)objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "count") >= 2)
  {
    unint64_t v17 = 1;
    do
      printf("                         : %s\n", (const char *)[objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "objectAtIndexedSubscript:", v17++), "UTF8String"]);
    while (v17 < (unint64_t)[objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "count")]);
  }
  if (objc_msgSend(objc_msgSend(a3, "ipv6RouterAddress"), "UTF8String")) {
    id v18 = (const char *)[objc_msgSend(objc_msgSend(a3, "ipv6RouterAddress"), "UTF8String")];
  }
  else {
    id v18 = "None";
  }
  [v5 appendFormat:@"    IPv6 Router          : %s\n", v18];
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "firstObject"), "UTF8String")) {
    long long v19 = (const char *)[[[objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "firstObject") UTF8String];
  }
  else {
    long long v19 = "None";
  }
  [v5 appendFormat:@"    DNS                  : %s\n", v19];
  if ((unint64_t)objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "count") >= 2)
  {
    unint64_t v20 = 1;
    do
      [v5 appendFormat:@"                         : %s\n", [objc_msgSend(objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "objectAtIndexedSubscript:", v20++), "UTF8String") UTF8String]];
    while (v20 < (unint64_t)[[objc_msgSend(a3, "dnsAddresses") count]];
  }
  [a3 btcMode];
  [v5 appendFormat:@"    BTC Mode             : %s\n", [W5DescriptionForBTCMode() UTF8String]];
  if ([a3 desense])
  {
    if (objc_msgSend(objc_msgSend(a3, "desense"), "length") == (id)16) {
      [objc_msgSend(a3, "desense") bytes];
    }
    if (objc_msgSend(objc_msgSend(a3, "desenseLevel"), "length") == (id)8) {
      [objc_msgSend(a3, "desenseLevel") bytes];
    }
    id v52 = [(id)W5DescriptionForDesense() UTF8String];
    CFStringRef v21 = @"    Desense              : %s\n";
  }
  else
  {
    CFStringRef v21 = @"    Desense              : Unavailable\n";
  }
  [v5 appendFormat:v21, v52];
  if ([a3 chainAck])
  {
    if (objc_msgSend(objc_msgSend(a3, "chainAck"), "length") == (id)24) {
      [objc_msgSend(a3, "chainAck") bytes];
    }
    id v53 = [(id)W5DescriptionForChainAck() UTF8String];
    CFStringRef v22 = @"    Chain Ack            : [%s]\n";
  }
  else
  {
    CFStringRef v22 = @"    Chain Ack            : Unavailable\n";
  }
  [v5 appendFormat:v22, v53];
  if ([a3 txChainPower])
  {
    [objc_msgSend(a3, "txChainPower") length];
    if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "txChainPower"), "bytes") + 1))
    {
      [objc_msgSend(a3, "txChainPower") length];
      if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "txChainPower"), "bytes") + 1))
      {
        unint64_t v23 = 0;
        uint64_t v24 = 8;
        do
        {
          [objc_msgSend(a3, "txChainPower") length];
          [objc_msgSend(a3, "txChainPower") bytes];
          [v5 appendFormat:@"    Tx Power [%lu]         : %s\n", v23, [W5DescriptionForChainPowerState() UTF8String]];
          if (objc_msgSend(objc_msgSend(a3, "txChainPower"), "length") == (id)88) {
            long long v25 = (char *)[a3 txChainPower].bytes;
          }
          else {
            long long v25 = 0;
          }
          long long v26 = *(_OWORD *)&v25[v24];
          LODWORD(v55) = *(_DWORD *)&v25[v24 + 16];
          long long v54 = v26;
          [v5 appendFormat:@"%s", [objc_msgSend(objc_msgSend(a1, "__logTxPower:", &v54), "UTF8String") UTF8String]];
          ++v23;
          [objc_msgSend(a3, "txChainPower") length];
          v24 += 20;
        }
        while (v23 < *((int *)[a3 txChainPower].bytes + 1));
      }
    }
  }
  if ([a3 btcProfiles2GHz])
  {
    [objc_msgSend(a3, "btcProfiles2GHz") length];
    if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "bytes") + 2))
    {
      unint64_t v27 = 0;
      uint64_t v28 = 12;
      do
      {
        [objc_msgSend(a3, "btcConfig") length];
        if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcConfig"), "bytes") + 1))
        {
          [objc_msgSend(a3, "btcConfig") length];
          if (v27 == *((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcConfig"), "bytes") + 2)) {
            long long v29 = "Active";
          }
          else {
            long long v29 = "Inactive";
          }
        }
        else
        {
          long long v29 = "Inactive";
        }
        [v5 appendFormat:@"    BTC Profile 2.4GHz [%lu]        : %s\n", v27, v29];
        if (objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "length") == (id)572) {
          long long v30 = (char *)[a3 btcProfiles2GHz].bytes;
        }
        else {
          long long v30 = 0;
        }
        long long v54 = *(_OWORD *)&v30[v28];
        long long v31 = *(_OWORD *)&v30[v28 + 16];
        long long v32 = *(_OWORD *)&v30[v28 + 32];
        long long v33 = *(_OWORD *)&v30[v28 + 64];
        long long v57 = *(_OWORD *)&v30[v28 + 48];
        long long v58 = v33;
        long long v55 = v31;
        long long v56 = v32;
        long long v34 = *(_OWORD *)&v30[v28 + 80];
        long long v35 = *(_OWORD *)&v30[v28 + 96];
        long long v36 = *(_OWORD *)&v30[v28 + 112];
        *(_OWORD *)&v61[12] = *(_OWORD *)&v30[v28 + 124];
        long long v60 = v35;
        *(_OWORD *)uint64_t v61 = v36;
        long long v59 = v34;
        [v5 appendFormat:@"%s", [objc_msgSend(objc_msgSend(a1, "__logBTCProfile:", &v54), "UTF8String") UTF8String]];
        ++v27;
        [objc_msgSend(a3, "btcProfiles2GHz") length];
        v28 += 140;
      }
      while (v27 < *((unsigned int *)[a3 btcProfiles2GHz].bytes + 2));
    }
  }
  if ([a3 btcProfiles5GHz])
  {
    [objc_msgSend(a3, "btcProfiles5GHz") length];
    if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "bytes") + 2))
    {
      unint64_t v37 = 0;
      uint64_t v38 = 12;
      do
      {
        [objc_msgSend(a3, "btcConfig") length];
        if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcConfig"), "bytes") + 3))
        {
          [objc_msgSend(a3, "btcConfig") length];
          if (v37 == *((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcConfig"), "bytes") + 4)) {
            char v39 = "Active";
          }
          else {
            char v39 = "Inactive";
          }
        }
        else
        {
          char v39 = "Inactive";
        }
        [v5 appendFormat:@"    BTC Profile 5GHz [%lu]          : %s\n", v37, v39];
        if (objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "length") == (id)572) {
          uint64_t v40 = (char *)[a3 btcProfiles5GHz].bytes;
        }
        else {
          uint64_t v40 = 0;
        }
        long long v54 = *(_OWORD *)&v40[v38];
        long long v41 = *(_OWORD *)&v40[v38 + 16];
        long long v42 = *(_OWORD *)&v40[v38 + 32];
        long long v43 = *(_OWORD *)&v40[v38 + 64];
        long long v57 = *(_OWORD *)&v40[v38 + 48];
        long long v58 = v43;
        long long v55 = v41;
        long long v56 = v42;
        long long v44 = *(_OWORD *)&v40[v38 + 80];
        long long v45 = *(_OWORD *)&v40[v38 + 96];
        long long v46 = *(_OWORD *)&v40[v38 + 112];
        *(_OWORD *)&v61[12] = *(_OWORD *)&v40[v38 + 124];
        long long v60 = v45;
        *(_OWORD *)uint64_t v61 = v46;
        long long v59 = v44;
        [v5 appendFormat:@"%s", [objc_msgSend(objc_msgSend(a1, "__logBTCProfile:", &v54), "UTF8String") UTF8String]];
        ++v37;
        [objc_msgSend(a3, "btcProfiles5GHz") length];
        v38 += 140;
      }
      while (v37 < *((unsigned int *)[a3 btcProfiles5GHz].bytes + 2));
    }
  }
  if ([a3 smartCCADesenseSupported]) {
    uint64_t v47 = "Supported";
  }
  else {
    uint64_t v47 = "Not Supported";
  }
  [v5 appendFormat:@"    SmartCCA/Desense     : %s (USB=%d)\n", v47, [a3 smartCCADesenseUSBPresence]];
  unsigned int v48 = [objc_msgSend(a3, "capabilities") containsObject:&off_1000EB950];
  int v49 = "No";
  if (v48) {
    int v49 = "Yes";
  }
  [v5 appendFormat:@"    Supports 6e          : %s\n", v49];
  [v5 appendFormat:@"    Supported Channels   : %s\n", [objc_msgSend(objc_msgSend(objc_msgSend(a3, "supportedChannels"), "componentsJoinedByString:", @","), "UTF8String") UTF8String]];
  return v5;
}

+ (id)__logBluetoothStatus:(id)a3
{
  id v4 = +[NSMutableString string];
  unsigned int v5 = [a3 powerOn];
  id v6 = "Off";
  if (v5) {
    id v6 = "On";
  }
  [v4 appendFormat:@"    Power                : %s\n", v6];
  if (objc_msgSend(objc_msgSend(a3, "address"), "UTF8String")) {
    id v7 = (const char *)[[[a3 address] UTF8String];
  }
  else {
    id v7 = "None";
  }
  [v4 appendFormat:@"    MAC Address          : %s\n", v7];
  if ([a3 isDiscoverable]) {
    uint64_t v8 = "Yes";
  }
  else {
    uint64_t v8 = "No";
  }
  [v4 appendFormat:@"    Discoverable         : %s\n", v8];
  if ([a3 isConnectable]) {
    uint64_t v9 = "Yes";
  }
  else {
    uint64_t v9 = "No";
  }
  [v4 appendFormat:@"    Connectable          : %s\n", v9];
  if ([a3 isScanning]) {
    id v10 = "Yes";
  }
  else {
    id v10 = "No";
  }
  [v4 appendFormat:@"    Scanning             : %s\n", v10];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v30 = a3;
  id obj = [a3 devices];
  id v11 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v39;
    do
    {
      for (int i = 0; i != v12; int i = (char *)i + 1)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v13 += [v18 isPaired];
        v14 += [v18 isCloudPaired];
        v15 += [v18 isConnected];
      }
      id v12 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  [v4 appendFormat:@"    Devices              : %lu (paired=%lu cloud=%lu connected=%lu)\n\n", [v30 devices].count, v13, v14, v15];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obja = [v30 devices];
  id v19 = [obja countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v35;
    long long v31 = v4;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(obja);
        }
        unint64_t v23 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
        [v4 appendFormat:@"    %@\n", [v23 name]];
        [v4 appendFormat:@"    Address          : %@\n", [v23 address]];
        if ([v23 isPaired]) {
          uint64_t v24 = "Yes";
        }
        else {
          uint64_t v24 = "No";
        }
        [v4 appendFormat:@"    Paired           : %s\n", v24];
        if ([v23 isCloudPaired]) {
          long long v25 = "Yes";
        }
        else {
          long long v25 = "No";
        }
        [v4 appendFormat:@"    CloudPaired      : %s\n", v25];
        if ([v23 isConnected]) {
          long long v26 = "Yes";
        }
        else {
          long long v26 = "No";
        }
        [v4 appendFormat:@"    Connected        : %s\n", v26];
        if ([v23 isConnected])
        {
          [v23 majorClass];
          [v23 minorClass];
          id v4 = v31;
          [v31 appendFormat:@"    Type             : %@\n", W5DescriptionForBluetoothDeviceType()];
          if ([v23 isLowEnergy]) {
            unint64_t v27 = "Yes";
          }
          else {
            unint64_t v27 = "No";
          }
          [v31 appendFormat:@"    LE               : %s\n", v27];
          if ([v23 isAppleDevice]) {
            uint64_t v28 = "Yes";
          }
          else {
            uint64_t v28 = "No";
          }
          [v31 appendFormat:@"    Apple            : %s\n", v28];
        }
        [v4 appendString:@"\n"];
      }
      id v20 = [obja countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v20);
  }
  return v4;
}

- (id)__logAWDLStatus:(id)a3
{
  id v5 = +[NSMutableString string];
  id v6 = [(W5StatusManager *)self->_status corewifi];
  [v5 appendFormat:@"IPv6: %@\n\n", [[-[CWFInterface AWDL](v6, "AWDL") IPv6Addresses] firstObject]];
  [a3 airDropDiscoverableMode];
  [v5 appendFormat:@"AirDrop Discoverable Mode: %@\n\n", W5DescriptionForAirDropDiscoverableMode()];
  DWORD2(v49) = 0;
  *(void *)&long long v49 = 0;
  [v6 AWDLSyncEnabled].getBytes:&v49 length:12;
  if (DWORD2(v49)) {
    id v7 = "enabled";
  }
  else {
    id v7 = "disabled";
  }
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl is %s\n", v7)];
  *(void *)&long long v49 = 0;
  [v6 AWDLOpMode].getBytes:&v49 length:8;
  if (DWORD1(v49) <= 2) {
    uint64_t v8 = (&off_1000DF050)[DWORD1(v49)];
  }
  else {
    uint64_t v8 = "UNKNOWN";
  }
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl mode = %s\n", v8)];
  *(void *)&long long v60 = 0;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  [v6 AWDLPeerTrafficRegistration:&v49];
  if (DWORD2(v59))
  {
    uint64_t v9 = " FAVOR INFRA HINT";
    if (!HIDWORD(v59)) {
      uint64_t v9 = " NO HINT";
    }
    id v10 = +[NSString stringWithFormat:@"traffic registration found for peer (hint=%x%s) %02x:%02x:%02x:%02x:%02x:%02x \n", HIDWORD(v59), v9, BYTE4(v49), BYTE5(v49), BYTE6(v49), BYTE7(v49), BYTE8(v49), BYTE9(v49)];
  }
  else
  {
    id v10 = +[NSString stringWithFormat:@"no peer traffic registration active\n", v39, v40, v41, v42, v43, v44, v45, v46];
  }
  [v5 appendString:v10];
  *(void *)&long long v49 = 0;
  [v6 AWDLMasterChannel getBytes:&v49 length:8];
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl master channel = %u\n", DWORD1(v49))];
  *(void *)&long long v49 = 0;
  [v6 AWDLSecondaryMasterChannel getBytes:&v49 length:8];
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl secondary master channel = %u\n", DWORD1(v49))];
  id v11 = +[NSMutableString string];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  [v6 AWDLSyncChannelSequence].getBytes:&v49, 400;
  [v11 appendFormat:@"awdl channel sequence: strategy %u, step count %u, encoding %u, length=%u, duplicate=%u, fill=%u\n", HIDWORD(v73), BYTE7(v49), BYTE6(v49), BYTE5(v49), BYTE8(v49), BYTE9(v49)];
  if (BYTE5(v49))
  {
    unint64_t v12 = 0;
    uint64_t v13 = (unsigned int *)&v50;
    while (1)
    {
      [v11 appendFormat:@"%u", *v13];
      if (*v13)
      {
        unsigned int v14 = v13[1];
        CFStringRef v15 = @"++";
        if ((v14 & 0x400) != 0) {
          goto LABEL_20;
        }
        if ((v14 & 4) != 0) {
          break;
        }
      }
LABEL_21:
      [v11 appendString:@" "];
      ++v12;
      v13 += 3;
      if (v12 >= BYTE5(v49)) {
        goto LABEL_22;
      }
    }
    if ((v14 & 0x200) != 0) {
      CFStringRef v15 = @"+";
    }
    else {
      CFStringRef v15 = @"-";
    }
LABEL_20:
    [v11 appendString:v15];
    goto LABEL_21;
  }
LABEL_22:
  [v11 appendString:@"\n"];
  [v5 appendString:[v11 copy]];
  *(void *)&long long v52 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  [v6 AWDLElectionParameters].getBytes:&v49, 56);
  id v16 = +[NSMutableString string];
  [v16 appendFormat:@"awdl election params:\n"];
  [v16 appendFormat:@"  electionID            %u\n", WORD1(v50)];
  [v16 appendFormat:@"  self metric           0x%x\n", v51];
  [v16 appendFormat:@"  flags                 0x%x\n", v50];
  [v16 appendFormat:@"  top master metric     0x%x\n", HIDWORD(v50)];
  [v16 appendFormat:@"  distance from top     %u\n", BYTE4(v50)];
  [v16 appendFormat:@"  top master            %02X:%02X:%02X:%02X:%02X:%02X\n", BYTE6(v50), BYTE7(v50), BYTE8(v50), BYTE9(v50), BYTE10(v50), BYTE11(v50)];
  [v5 appendString:[v16 copy]];
  DWORD2(v49) = 0;
  *(void *)&long long v49 = 0;
  [v6 AWDLElectionMetric getBytes:&v49 length:12];
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl election metric = %u\n", DWORD1(v49))];
  id v17 = +[NSMutableString string];
  long long v49 = 0uLL;
  LODWORD(v50) = 0;
  [v6 AWDLElectionRSSIThresholds getBytes:&v49 length:20];
  [v17 appendString:@"awdl election rssi thresholds:\n"];
  [v17 appendFormat:@"  close     %d\n", DWORD2(v49)];
  [v17 appendFormat:@"  mid       %d\n", DWORD1(v49)];
  [v17 appendFormat:@"  edge      %d\n", v50];
  [v17 appendFormat:@"  closeSync %d\n", HIDWORD(v49)];
  [v5 appendString:[v17 copy]];
  *(void *)&long long v49 = 0;
  [(-[CWFInterface AWDLSocialTimeSlots](v6, "AWDLSocialTimeSlots")) getBytes:&v49 length:8];
  id v18 = "enabled";
  if (!BYTE4(v49)) {
    id v18 = "disabled";
  }
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl social time slots: %s\n", v18)];
  *(void *)&long long v49 = 0;
  [v6 AWDLEncryptionType].getBytes:&v49 length:8;
  if (DWORD1(v49)) {
    id v19 = "ENABLED";
  }
  else {
    id v19 = "DISABLED";
  }
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl encryption is %s\n", v19)];
  long long v49 = 0uLL;
  *(void *)&long long v50 = 0;
  [(-[CWFInterface AWDLStrategy](v6, "AWDLStrategy")) getBytes:&v49 length:24];
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl strategy: %u sched %@ [%llu.%03llu]\n", DWORD1(v49), W5DescriptionForAWDLScheduleState(), (unint64_t)v50 / 0x3B9ACA00, (unint64_t)v50 % 0x3B9ACA00 / 0xF4240)];
  *(void *)&long long v49 = 0;
  [v6 AWDLPresenceMode].getBytes:&v49 length:8;
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl presence mode = %u\n", DWORD1(v49))];
  *(void *)&long long v49 = 0;
  [v6 AWDLGuardTime].getBytes:&v49 length:8;
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl guard time = %u\n", DWORD1(v49))];
  long long v49 = 0uLL;
  [v6 AWDLAvailabilityWindowAPAlignment].getBytes:&v49, 16);
  if (DWORD1(v49)) {
    id v20 = "ENABLED";
  }
  else {
    id v20 = "DISABLED";
  }
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl availability window ap beacon alignment: %s offset %d (ms)\n", v20, DWORD2(v49))];
  *(void *)&long long v49 = 0;
  [v6 AWDLContinuousElectionAlgorithmEnabled] getBytes:&v49 length:8;
  if (DWORD1(v49)) {
    uint64_t v21 = "ENABLED";
  }
  else {
    uint64_t v21 = "DISABLED";
  }
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl aw continous election %s\n", v21)];
  id v22 = +[NSMutableString string];
  long long v49 = 0uLL;
  *(void *)&long long v50 = 0;
  [v6 AWDLSyncState].getBytes:&v49, 24);
  switch(DWORD1(v49))
  {
    case 1:
      [v22 appendFormat:@"awdl state: master [%02X:%02X:%02X:%02X:%02X:%02X]\n", BYTE8(v49), BYTE9(v49), BYTE10(v49), BYTE11(v49), BYTE12(v49), BYTE13(v49)];
      break;
    case 2:
      [v22 appendFormat:@"awdl state: slave [%02X:%02X:%02X:%02X:%02X:%02X]\n", BYTE8(v49), BYTE9(v49), BYTE10(v49), BYTE11(v49), BYTE12(v49), BYTE13(v49)];
      break;
    case 3:
      [v22 appendFormat:@"awdl state: non-election master [%02X:%02X:%02X:%02X:%02X:%02X]\n", BYTE8(v49), BYTE9(v49), BYTE10(v49), BYTE11(v49), BYTE12(v49), BYTE13(v49)];
      break;
    default:
      [v22 appendString:@"awdl state: stop\n"];
      break;
  }
  [v5 appendString:[v22 copy]];
  *(void *)&long long v49 = 0;
  [v6 AWDLAFTxMode].getBytes:&v49 length:8;
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl af tx mode = %u\n", DWORD1(v49))];
  long long v49 = 0uLL;
  LODWORD(v50) = 0;
  [v6 AWDLExtensionStateMachineParameters:&v49 length:20];
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl ext params: min=%u, maxUni=%u, maxMulti=%u, maxAction=%u\n", v50, DWORD2(v49), DWORD1(v49), HIDWORD(v49))];
  long long v49 = 0uLL;
  *(void *)&long long v50 = 0;
  [v6 AWDLSyncParameters].getBytes:&v49 length:24;
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl sync params: aw_period=%d, aw_length=%d, extension_length=%d, sync_frame_period=%d, as non election master %d\n", DWORD2(v49), DWORD1(v49), HIDWORD(v49), v50, DWORD1(v50))];
  id v23 = +[NSMutableString string];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  [v6 AWDLSidecarDiagnostics getBytes:&v49 length:80];
  [v23 appendFormat:@"awdl sidecar diags: txLatencySumMS=%d, txFailCount=%d, txPacketCount=%d, txMaxPacketBurstSizeKB=%d, peerRssi24G=%d, peerRssi5G=%d\n", DWORD1(v49), DWORD2(v49), HIDWORD(v49), v50, DWORD1(v50), DWORD2(v50)];
  for (uint64_t i = 0; i != 36; i += 12)
    [v23 appendFormat:@"                    ch=%d, cca=%d\n", *((unsigned __int8 *)&v52 + i + 4), *(unsigned int *)((char *)&v52 + i)];
  [v5 appendString:[v23 copy]];
  [v5 appendString:@"\n\n"];
  id v25 = +[NSMutableString string];
  int v48 = 0;
  uint64_t v47 = 0;
  [v6 AWDLSyncEnabled].getBytes:&v47 length:12;
  [v25 appendString:@"----------------------------------------------------------------------\n"];
  [v25 appendString:@"AWDL Statistics\n"];
  [v25 appendString:@"----------------------------------------------------------------------\n"];
  if (v48)
  {
    bzero(&v49, 0xE80uLL);
    [v6 AWDLStatistics getBytes:&v49 length:3712];
    [v25 appendFormat:@"Rx Bytes              = %d\n", DWORD2(v49)];
    [v25 appendFormat:@"Tx Bytes              = %d\n", HIDWORD(v49)];
    [v25 appendFormat:@"Self Infra Channel    = %d\n", DWORD1(v50)];
    [v25 appendFormat:@"Peer Infra Channel    = %d\n", BYTE8(v50)];
    [v25 appendFormat:@"# of Peers Discovered = %d\n", BYTE9(v50)];
    [v25 appendFormat:@"# of Cached Peers     = %d\n", BYTE10(v50)];
    [v25 appendFormat:@"Flags                 = %x\n", DWORD1(v49)];
    if (BYTE4(v49)) {
      long long v26 = "XZ";
    }
    else {
      long long v26 = "non-XZ";
    }
    [v25 appendFormat:@"Country Code          = %s\n", v26];
    if ((BYTE4(v49) & 0x10) != 0) {
      unint64_t v27 = "Yes";
    }
    else {
      unint64_t v27 = "No";
    }
    [v25 appendFormat:@"Is AppleTV            = %s\n", v27];
    if ((BYTE4(v49) & 8) != 0) {
      uint64_t v28 = "Yes";
    }
    else {
      uint64_t v28 = "No";
    }
    [v25 appendFormat:@"Supports Solo         = %s\n", v28];
    if ((BYTE4(v49) & 0x20) != 0) {
      long long v29 = "Yes";
    }
    else {
      long long v29 = "No";
    }
    [v25 appendFormat:@"Was Airplaying        = %s\n", v29];
    if ((BYTE4(v49) & 0x40) != 0) {
      id v30 = "Yes";
    }
    else {
      id v30 = "No";
    }
    [v25 appendFormat:@"Was Infra-Airplaying  = %s\n", v30];
    [v25 appendString:@"\n"];
    [v25 appendFormat:@"Cached Peer's Infra on: \n"];
    [v25 appendFormat:@"                 2.4G = %d\n", BYTE11(v50)];
    [v25 appendFormat:@"                   5G = %d\n", BYTE12(v50)];
    [v25 appendFormat:@"                  DFS = %d\n", BYTE13(v50)];
    [v25 appendFormat:@"       Not-Associated = %d\n", BYTE14(v50)];
    [v25 appendFormat:@"           Same Infra = %d\n", v51];
    [v25 appendFormat:@"      Different Infra = %d\n", HIBYTE(v50)];
    [v25 appendString:@"AWDL State History:\n"];
    [v25 appendString:@"                           State           Count      Duration(msecs)\n"];
    uint64_t v31 = 0;
    long long v32 = &v72;
    do
    {
      [v25 appendFormat:@"%32s %15d %20llu\n", [W5DescriptionForAWDLScheduleState() UTF8String], *((unsigned int *)v32 - 2), *(void *)v32];
      ++v31;
      ++v32;
    }
    while (v31 != 54);
    [v25 appendString:@"\n"];
    [v25 appendFormat:@"No-Service Idle Time  = %llu\n", *((void *)&v51 + 1)];
    [v25 appendFormat:@"Services Browsed      = +%d -%d (+%d, -%d)\n", v78, v84, v77, v83];
    [v25 appendFormat:@"Services Advertised   = +%d -%d (+%d, -%d)\n", v75, v81, v74, v80];
    [v25 appendString:@"\n"];
    [v25 appendString:@"\n"];
    [v25 appendString:@"Add Service History:\n"];
    [v25 appendString:@"      #            Browse                                     |         Advertise\n"];
    [v25 appendString:@"             Id              Key                              |   Id              Key\n"];
    uint64_t v33 = 0;
    uint64_t v34 = 1;
    do
    {
      [v25 appendFormat:@"      %d -   %3d, ", v34, *(unsigned int *)&v79[v33 + 32]];
      [v25 appendString:sub_10007DAF4((uint64_t)&v79[v33])];
      [v25 appendFormat:@"                %3d, ", *(unsigned int *)&v76[v33 + 32]];
      [v25 appendString:sub_10007DAF4((uint64_t)&v76[v33])];
      [v25 appendString:@"\n"];
      v33 += 48;
      uint64_t v34 = (v34 + 1);
    }
    while (v33 != 384);
    [v25 appendString:@"\n"];
    [v25 appendString:@"\n"];
    [v25 appendString:@"Delete Service History:\n"];
    [v25 appendString:@"      #                     Browse                            |               Advertise\n"];
    [v25 appendString:@"             Id         Age             Key                   |   Id         Age              Key\n"];
    uint64_t v35 = 0;
    uint64_t v36 = 1;
    do
    {
      [v25 appendFormat:@"     %d -    %3d, %10llu, ", v36, *(unsigned int *)&v85[v35 + 32], *(void *)&v85[v35 + 40]];
      [v25 appendString:sub_10007DAF4((uint64_t)&v85[v35])];
      [v25 appendFormat:@"    %3d, %10llu, ", *(unsigned int *)&v82[v35 + 32], *(void *)&v82[v35 + 40]];
      [v25 appendString:sub_10007DAF4((uint64_t)&v82[v35])];
      [v25 appendString:@"\n"];
      v35 += 48;
      uint64_t v36 = (v36 + 1);
    }
    while (v35 != 384);
    CFStringRef v37 = @"\n";
  }
  else
  {
    CFStringRef v37 = @"AWDL is DISABLED\n";
  }
  [v25 appendString:v37];
  [v5 appendString:[v25 copy]];
  return [v5 copy];
}

- (id)__pingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 wait:(double)a6 interval:(double)a7 trafficClass:(id)a8 interfaceName:(id)a9 dataLength:(unint64_t)a10
{
  id v10 = 0;
  if (a3 && a4 <= 2147483646 && a5 < 2147483650.0 && a9 != 0)
  {
    if (a8 && ([a8 integerValue], (uint64_t v20 = W5DescriptionForPingTrafficClass()) != 0))
    {
      uint64_t v21 = v20;
      v35[0] = @"-c";
      v35[1] = +[NSString stringWithFormat:@"%ld", a4];
      void v35[2] = @"-b";
      void v35[3] = a9;
      void v35[4] = @"-k";
      v35[5] = v21;
      v35[6] = @"-i";
      v35[7] = +[NSString stringWithFormat:@"%.1f", *(void *)&a7];
      v35[8] = @"-t";
      v35[9] = +[NSString stringWithFormat:@"%.2f", *(void *)&a5];
      v35[10] = @"-W";
      v35[11] = +[NSString stringWithFormat:@"%ld", (uint64_t)(a6 * 1000.0)];
      v35[12] = @"-s";
      v35[13] = +[NSString stringWithFormat:@"%ld", a10 + 56];
      v35[14] = a3;
      id v22 = v35;
      uint64_t v23 = 15;
    }
    else
    {
      v34[0] = @"-c";
      v34[1] = +[NSString stringWithFormat:@"%ld", a4];
      void v34[2] = @"-b";
      void v34[3] = a9;
      void v34[4] = @"-i";
      v34[5] = +[NSString stringWithFormat:@"%.1f", *(void *)&a7];
      v34[6] = @"-t";
      v34[7] = +[NSString stringWithFormat:@"%.2f", *(void *)&a5];
      v34[8] = @"-W";
      v34[9] = +[NSString stringWithFormat:@"%ld", (uint64_t)(a6 * 1000.0)];
      v34[10] = @"-s";
      v34[11] = +[NSString stringWithFormat:@"%ld", a10 + 56];
      v34[12] = a3;
      id v22 = v34;
      uint64_t v23 = 13;
    }
    uint64_t v24 = +[NSArray arrayWithObjects:v22 count:v23];
    +[NSDate timeIntervalSinceReferenceDate];
    double v26 = v25;
    unint64_t v27 = +[NSMutableData dataWithCapacity:0];
    +[NSTask runTaskWithLaunchPath:@"/sbin/ping" arguments:v24 outputData:v27 error:0];
    id v10 = objc_alloc_init((Class)W5PingResult);
    [v10 setInterfaceName:a9];
    [v10 setAddress:a3];
    [v10 setCount:a4];
    [v10 setTimeout:a5];
    [v10 setWait:a6];
    [v10 setInterval:a7];
    [v10 setTrafficClass:[a8 integerValue]];
    [v10 setDataLength:a10];
    [v10 setStartedAt:v26];
    +[NSDate timeIntervalSinceReferenceDate];
    [v10 setEndedAt:];
    [v10 setCommand:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"/sbin/ping %@", -[NSArray componentsJoinedByString:](v24, "componentsJoinedByString:", @" "];
    [v10 setOutput:[objc_alloc((Class)NSString) initWithData:v27 encoding:4]];
    +[W5LogManager __parsePingOutput:v27 result:v10];
    if (v10)
    {
      id v28 = objc_alloc_init((Class)W5Event);
      [v28 setEventID:34];
      [v10 endedAt];
      [v28 setTimestamp:];
      CFStringRef v32 = @"PingResult";
      id v33 = v10;
      [v28 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1)];
      pingCallback = (void (**)(id, id))self->_pingCallback;
      if (pingCallback) {
        pingCallback[2](pingCallback, v28);
      }
    }
  }
  return v10;
}

- (id)__ping6WithAddress:(id)a3 count:(int64_t)a4 wait:(double)a5 trafficClass:(id)a6 interfaceName:(id)a7 dataLength:(unint64_t)a8
{
  id v8 = 0;
  if (a3 && a4 <= 2147483646 && a7)
  {
    if (a6 && ([a6 integerValue], (uint64_t v15 = W5DescriptionForPingTrafficClass()) != 0))
    {
      uint64_t v16 = v15;
      v30[0] = @"-c";
      v30[1] = +[NSString stringWithFormat:@"%ld", a4];
      void v30[2] = @"-B";
      v30[3] = a7;
      void v30[4] = @"-I";
      v30[5] = a7;
      void v30[6] = @"-k";
      v30[7] = v16;
      v30[8] = @"-i";
      v30[9] = +[NSString stringWithFormat:@"%f", *(void *)&a5];
      v30[10] = @"-s";
      v30[11] = +[NSString stringWithFormat:@"%ld", a8 + 56];
      v30[12] = a3;
      id v17 = v30;
      uint64_t v18 = 13;
    }
    else
    {
      v29[0] = @"-c";
      v29[1] = +[NSString stringWithFormat:@"%ld", a4];
      void v29[2] = @"-B";
      void v29[3] = a7;
      void v29[4] = @"-I";
      void v29[5] = a7;
      v29[6] = @"-i";
      v29[7] = +[NSString stringWithFormat:@"%f", *(void *)&a5];
      v29[8] = @"-s";
      v29[9] = +[NSString stringWithFormat:@"%ld", a8 + 56];
      v29[10] = a3;
      id v17 = v29;
      uint64_t v18 = 11;
    }
    id v19 = +[NSArray arrayWithObjects:v17 count:v18];
    +[NSDate timeIntervalSinceReferenceDate];
    double v21 = v20;
    id v22 = +[NSMutableData dataWithCapacity:0];
    +[NSTask runTaskWithLaunchPath:@"/sbin/ping6" arguments:v19 outputData:v22 error:0];
    id v8 = objc_alloc_init((Class)W5PingResult);
    [v8 setInterfaceName:a7];
    [v8 setAddress:a3];
    [v8 setCount:a4];
    [v8 setWait:a5];
    [v8 setTrafficClass:[a6 integerValue]];
    [v8 setDataLength:a8];
    [v8 setStartedAt:v21];
    +[NSDate timeIntervalSinceReferenceDate];
    [v8 setEndedAt:];
    [v8 setCommand:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"/sbin/ping6 %@", -[NSArray componentsJoinedByString:](v19, "componentsJoinedByString:", @" "];
    [v8 setOutput:[objc_alloc((Class)NSString) initWithData:v22 encoding:4]];
    +[W5LogManager __parsePingOutput:v22 result:v8];
    if (v8)
    {
      id v23 = objc_alloc_init((Class)W5Event);
      [v23 setEventID:34];
      [v8 endedAt];
      [v23 setTimestamp:];
      CFStringRef v27 = @"PingResult";
      id v28 = v8;
      [v23 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1)];
      pingCallback = (void (**)(id, id))self->_pingCallback;
      if (pingCallback) {
        pingCallback[2](pingCallback, v23);
      }
    }
  }
  return v8;
}

- (id)__pingUsingCFNetworkWithAddress:(id)a3 count:(int64_t)a4 timeout:(int64_t)a5 trafficClass:(id)a6 networkServiceType:(id)a7
{
  id v7 = 0;
  if (a3 && a4 <= 2147483646 && a5 <= 2147483646)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v13 = v12;
    id v14 = +[NSMutableArray array];
    double v15 = 0.0;
    double v16 = 0.0;
    int64_t v46 = a4;
    if (a4 >= 1)
    {
      uint64_t v17 = kCFNetDiagnosticPingOptionTimeout;
      uint64_t v18 = kCFNetDiagnosticPingOptionPacketCount;
      uint64_t v48 = kCFNetDiagnosticPingOptionTrafficClass;
      uint64_t v47 = kCFNetDiagnosticPingOptionTypeOfService;
      int64_t v19 = v46;
      do
      {
        v58[0] = v17;
        double v20 = +[NSNumber numberWithInteger:a5];
        v58[1] = v18;
        v59[0] = v20;
        v59[1] = &off_1000EB308;
        id v21 = [+[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2] mutableCopy];
        id v22 = v21;
        if (a6) {
          [v21 setObject:a6 forKeyedSubscript:v48];
        }
        if (a7) {
          [v22 setObject:a7 forKeyedSubscript:v47];
        }
        +[NSDate timeIntervalSinceReferenceDate];
        double v24 = v23;
        CFTypeRef cf = 0;
        int v25 = CFNetDiagnosticPingWithOptions();
        +[NSDate timeIntervalSinceReferenceDate];
        if (v25)
        {
          double v16 = v16 + 1.0;
          [v14 addObject:[NSNumber numberWithDouble:((v26 - v24) * 1000.0)]];
        }
        --v19;
      }
      while (v19);
    }
    double v27 = 0.0;
    double v28 = 0.0;
    if ([v14 count])
    {
      unint64_t v29 = 0;
      double v15 = 0.0;
      do
      {
        [v14[v29] doubleValue];
        double v28 = v28 + v30;
        if (v30 <= v15) {
          double v31 = v15;
        }
        else {
          double v31 = v30;
        }
        if (v30 < v27) {
          double v32 = v30;
        }
        else {
          double v32 = v27;
        }
        if (v29) {
          double v15 = v31;
        }
        else {
          double v15 = v30;
        }
        if (v29) {
          double v27 = v32;
        }
        else {
          double v27 = v30;
        }
        ++v29;
      }
      while (v29 < (unint64_t)[v14 count]);
    }
    double v33 = 0.0;
    double v34 = 0.0;
    if ([v14 count]) {
      double v34 = v28 / (double)(unint64_t)[v14 count];
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v35 = [v14 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v36; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v51 != v37) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v50 + 1) + 8 * i) doubleValue];
          double v33 = v33 + (v39 - v34) * (v39 - v34);
        }
        id v36 = [v14 countByEnumeratingWithState:&v50 objects:v57 count:16];
      }
      while (v36);
    }
    double v40 = sqrt(v33 / (double)(unint64_t)[v14 count]);
    id v7 = objc_alloc_init((Class)W5PingResult);
    [v7 setInterfaceName:[-[W5StatusManager wifi](self->_status, "wifi") interfaceName]];
    [v7 setAddress:a3];
    [v7 setCount:v46];
    [v7 setMin:v27];
    [v7 setMax:v15];
    [v7 setAvg:v34];
    [v7 setStddev:v40];
    [v7 setPacketLoss:((double)v46 - v16) / (double)v46];
    [v7 setStartedAt:v13];
    +[NSDate timeIntervalSinceReferenceDate];
    [v7 setEndedAt:];
    id v41 = v7;
    if (v7)
    {
      id v42 = objc_alloc_init((Class)W5Event);
      [v42 setEventID:34];
      [v7 endedAt];
      [v42 setTimestamp:];
      CFStringRef v55 = @"PingResult";
      id v56 = v7;
      [v42 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1)];
      pingCallback = (void (**)(id, id))self->_pingCallback;
      if (pingCallback) {
        pingCallback[2](pingCallback, v42);
      }
    }
  }
  return v7;
}

- (id)__pingUsingIMFoundationWithAddress:(id)a3 timeout:(int64_t)a4
{
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x3052000000;
  id v22 = sub_10005D9A4;
  double v23 = sub_10005D9B4;
  uint64_t v24 = 0;
  uint64_t v7 = sub_10007DBDC();
  if (a4 <= 2147483646 && a3 && v7)
  {
    id v8 = dispatch_semaphore_create(0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x3052000000;
    double v30 = sub_10005D9A4;
    double v31 = sub_10005D9B4;
    uint64_t v9 = (objc_class *)qword_1001036E8;
    uint64_t v32 = qword_1001036E8;
    if (!qword_1001036E8)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      void v25[2] = sub_10007DD20;
      void v25[3] = &unk_1000DD348;
      v25[4] = &buf;
      sub_10007DD20((uint64_t)v25);
      uint64_t v9 = *(objc_class **)(*((void *)&buf + 1) + 40);
    }
    _Block_object_dispose(&buf, 8);
    id v10 = [[v9 alloc] initWithAddress:a3 wifi:1];
    +[NSDate timeIntervalSinceReferenceDate];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    void v18[2] = sub_10007B388;
    void v18[3] = &unk_1000DE820;
    void v18[4] = a3;
    v18[5] = self;
    v18[8] = v11;
    v18[6] = v8;
    v18[7] = &v19;
    [v10 startWithTimeout:dispatch_get_global_queue(0, 0) queue:v18 completionHandler:(double)a4];
    dispatch_time_t v12 = dispatch_time(0, 80000000000);
    if (dispatch_semaphore_wait(v8, v12) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134349056;
      *(void *)((char *)&buf + 4) = 0x4054000000000000;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", (uint8_t *)&buf, 0xCu);
    }
    id v13 = (id)v20[5];
  }
  if (v20[5])
  {
    id v14 = objc_alloc_init((Class)W5Event);
    [v14 setEventID:34];
    [(id)v20[5] endedAt];
    [v14 setTimestamp:];
    CFStringRef v26 = @"PingResult";
    uint64_t v27 = v20[5];
    [v14 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1)];
    pingCallback = (void (**)(id, id))self->_pingCallback;
    if (pingCallback) {
      pingCallback[2](pingCallback, v14);
    }
  }
  double v16 = (void *)v20[5];
  _Block_object_dispose(&v19, 8);
  return v16;
}

+ (void)__parsePingOutput:(id)a3 result:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      id v5 = [objc_alloc((Class)NSString) initWithData:a3 encoding:4];
      if (v5)
      {
        id v14 = v5;
        id v6 = [v5 componentsSeparatedByString:@"\n"];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v16;
          do
          {
            id v10 = 0;
            do
            {
              if (*(void *)v16 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
              if ([v11 containsObject:@"loss"])
              {
                id v12 = [v11 objectAtIndexedSubscript:6];
                [objc_msgSend(v12, "substringToIndex:", (char *)objc_msgSend(v12, "length") - 1) doubleValue];
                [a4 setPacketLoss:];
              }
              else if ([v11 containsObject:@"round-trip"])
              {
                id v13 = [[[v11 objectAtIndexedSubscript:3] componentsSeparatedByString:@"/"];
                [v13 objectAtIndexedSubscript:0];
                [a4 setMin:];
                [v13 objectAtIndexedSubscript:1];
                [a4 setAvg:];
                [v13[2] doubleValue];
                [a4 setMax:];
                [v13[3] doubleValue];
                [a4 setStddev:];
              }
              id v10 = (char *)v10 + 1;
            }
            while (v8 != v10);
            id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v8);
        }
        [a4 setOutput:v14];
      }
    }
  }
}

- (void)__runToolWithOutputFileHandle:(id)a3 launchPath:(id)a4 arguments:(id)a5
{
}

- (void)__runToolWithOutputFileHandle:(id)a3 readFromStandardError:(BOOL)a4 launchPath:(id)a5 arguments:(id)a6 addCommand:(BOOL)a7 addTimestamps:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v12 = a4;
  if (a7)
  {
    id v15 = +[NSMutableString string];
    [v15 appendString:@"--------------------------------------------------------------------\n"];
    [v15 appendFormat:@"%@ %@\n", [a5 lastPathComponent], [a6 componentsJoinedByString:@" "];
    [v15 appendString:@"--------------------------------------------------------------------\n"];
    [a3 writeData:[v15 dataUsingEncoding:4]];
  }
  id v16 = [a3 offsetInFile];
  long long v17 = +[NSDate date];
  if (v8)
  {
    long long v18 = v17;
    id v19 = +[NSMutableString string];
    [v19 appendFormat:@"BEGIN: %@, END: 00:00:00.000\n", -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18)];
    [v19 appendString:@"--------------------------------------------------------------------\n"];
    [a3 writeData:[v19 dataUsingEncoding:4]];
    if (v12) {
      id v20 = 0;
    }
    else {
      id v20 = a3;
    }
    if (v12) {
      id v21 = a3;
    }
    else {
      id v21 = 0;
    }
    +[NSTask runTaskWithLaunchPath:a5 arguments:a6 timeout:v20 outputFileHandle:v21 errorFileHandle:0 launchHandler:0 didLaunch:10.0 error:0];
    [a3 seekToFileOffset:v16];
    id v22 = +[NSMutableString string];
    [v22 appendFormat:@"BEGIN: %@, END: %@\n", -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18), -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", +[NSDate date](NSDate, "date"))];
    [v22 appendString:@"--------------------------------------------------------------------\n"];
    [a3 writeData:[v22 dataUsingEncoding:4]];
    [a3 seekToEndOfFile];
LABEL_18:
    [a3 writeData:[@"\n" dataUsingEncoding:4]];
    return;
  }
  if (v12) {
    id v23 = 0;
  }
  else {
    id v23 = a3;
  }
  if (v12) {
    id v24 = a3;
  }
  else {
    id v24 = 0;
  }
  +[NSTask runTaskWithLaunchPath:a5 arguments:a6 timeout:v23 outputFileHandle:v24 errorFileHandle:0 launchHandler:0 didLaunch:10.0 error:0];
  if (v9) {
    goto LABEL_18;
  }
}

- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4
{
}

- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4 addCommand:(BOOL)a5 addTimestamps:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    [(W5LogManager *)self __runToolWithOutputFileHandle:a4 readFromStandardError:0 launchPath:@"/usr/local/bin/wl" arguments:a3 addCommand:v7 addTimestamps:v6];
  }
  else if (v7)
  {
    id v11 = +[NSMutableString string];
    [v11 appendString:@"--------------------------------------------------------------------\n"];
    [v11 appendFormat:@"%@ %@ -- NOT ASSOCIATED, NOOP\n", @"/usr/local/bin/wl", [a3 componentsJoinedByString:@" "];
    [v11 appendString:@"--------------------------------------------------------------------\n\n"];
    [a4 writeData:[v11 dataUsingEncoding:4]];
  }
}

- (BOOL)__wlCLIWithArguments:(id)a3 outputFilePath:(id)a4 outputData:(id)a5
{
  if (![(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID]) {
    return 0;
  }
  if (a4)
  {
    return +[NSTask runTaskWithLaunchPath:@"/usr/local/bin/wl" arguments:a3 outputFilePath:a4 error:0];
  }
  if (!a5) {
    return 0;
  }

  return +[NSTask runTaskWithLaunchPath:@"/usr/local/bin/wl" arguments:a3 outputData:a5 error:0];
}

- (void)__dumpCoreCaptureLogsWithReason:(id)a3 component:(id)a4
{
  BOOL v6 = [(W5StatusManager *)self->_status concurrentQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007C058;
  v7[3] = &unk_1000DDC30;
  void v7[4] = a4;
  v7[5] = a3;
  [(NSOperationQueue *)v6 addOperationWithBlock:v7];
}

+ (id)__temporaryDirectory
{
  CFDictionaryRef v2 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [[(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:@"com.apple.wifivelocity"] stringByAppendingPathComponent:[(NSString *)[+[NSUUID UUID] UUIDString] substringToIndex:5]]);
  uint64_t v5 = 0;
  if (![+[NSFileManager defaultManager] createDirectoryAtPath:[(NSURL *)v2 path] withIntermediateDirectories:1 attributes:0 error:&v5])
  {
    unsigned int v3 = sub_10009756C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      BOOL v7 = "+[W5LogManager __temporaryDirectory]";
      __int16 v8 = 2080;
      BOOL v9 = "W5LogManager.m";
      __int16 v10 = 1024;
      int v11 = 9786;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_send_and_compose_impl();
    }
  }
  return v2;
}

- (id)collectedItemCallback
{
  return self->_collectedItemCallback;
}

- (id)collectLogItemCallback
{
  return self->_collectLogItemCallback;
}

- (id)pingCallback
{
  return self->_pingCallback;
}

@end