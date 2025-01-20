@interface W5DiagnosticsManager
+ (BOOL)__detectLocalIPv4Address:(id)a3;
+ (BOOL)__isDoubleNATWithTracerouteOutput:(id)a3;
+ (BOOL)__setNetworkServiceOrder:(id)a3;
+ (id)__ambiguousSSIDs;
+ (id)__channelNumbersForWiFiChannels:(id)a3;
+ (id)__networkServiceOrder;
+ (id)__performDNSResolution:(id)a3;
+ (void)__parsePingOutput:(id)a3 result:(id)a4;
- (BOOL)__isDefaultCountryCode:(id)a3;
- (BOOL)__isUsingCustomProxySettings:(id)a3;
- (BOOL)__performCurlWithAddress:(id)a3;
- (BOOL)__performLoadViaNSURLSessionWithAddress:(id)a3 usingTimeout:(id)a4 andForceWiFiInterface:(BOOL)a5;
- (W5DiagnosticsManager)initWithStatusManager:(id)a3 peerDiagnosticsManager:(id)a4;
- (id)__adjust5GHzWeights:(id)a3;
- (id)__applyChannelWeights:(id)a3 supportedChannels:(id)a4;
- (id)__channelWeightsForChannel:(id)a3;
- (id)__channelWeightsForScanResults:(id)a3 supportedChannels:(id)a4 rssiThreshold:(int64_t)a5;
- (id)__defaultDiagnosticsTests;
- (id)__downloadSpeedtestWithFileSize:(int)a3 timeout:(unint64_t)a4 error:(id *)a5;
- (id)__filteredChannelWeights:(id)a3 channels:(id)a4;
- (id)__occupiedChannelsForScanResults:(id)a3 supportedChannels:(id)a4 rssiThreshold:(int64_t)a5 ignoreChannel:(id)a6;
- (id)__only2GHzChannels:(id)a3;
- (id)__only2GHz_1_6_11_14_Channels:(id)a3;
- (id)__only5GHz20MHz40MHzChannels:(id)a3;
- (id)__only5GHz40MHzChannels:(id)a3;
- (id)__only5GHzChannels:(id)a3;
- (id)__only5GHzNonDFSChannels:(id)a3;
- (id)__orderedChannelWeights:(id)a3;
- (id)__overlappingChannelsForChannel:(id)a3 supportedChannels:(id)a4;
- (id)__pendingRequestWithUUID:(id)a3;
- (id)__performCFPingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 trafficClass:(id)a6 networkServiceType:(id)a7 dataLength:(unint64_t)a8;
- (id)__performPing6WithAddress:(id)a3 count:(int64_t)a4 wait:(double)a5 trafficClass:(id)a6 interfaceName:(id)a7 dataLength:(unint64_t)a8;
- (id)__performPingUsingIMFoundationWithAddress:(id)a3 timeout:(int64_t)a4;
- (id)__performPingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 wait:(double)a6 interval:(double)a7 trafficClass:(id)a8 interfaceName:(id)a9 dataLength:(unint64_t)a10;
- (id)__performTracerouteWithAddress:(id)a3 maxTTL:(int64_t)a4 waittime:(int64_t)a5 queries:(int64_t)a6;
- (id)__preferredNetworkWithNetworkName:(id)a3 configuration:(id)a4;
- (id)__runDiagnosticsTest:(id)a3;
- (id)__scanResultWithNetworkName:(id)a3;
- (id)__testAWDLEnabledWithConfiguration:(id)a3;
- (id)__testAWDLRealtimeWithConfiguration:(id)a3;
- (id)__testAirPortBaseStationWithConfiguration:(id)a3;
- (id)__testAmbiguousNetworkNameWithConfiguration:(id)a3;
- (id)__testBTCoexWithConfiguration:(id)a3;
- (id)__testCaptivePortalWithConfiguration:(id)a3;
- (id)__testConcurrentWithConfiguration:(id)a3;
- (id)__testConflictingCountryCodeWithConfiguration:(id)a3;
- (id)__testConflictingPHYMode11acWithConfiguration:(id)a3;
- (id)__testConflictingPHYMode11nWithConfiguration:(id)a3;
- (id)__testConflictingSecurityTypePNLWithConfiguration:(id)a3;
- (id)__testCongested2GHzWithConfiguration:(id)a3;
- (id)__testCongested5GHzWithConfiguration:(id)a3;
- (id)__testCongestedChannelUsingCCAWithConfiguration:(id)a3;
- (id)__testCongestedChannelWithConfiguration:(id)a3;
- (id)__testCurlApple;
- (id)__testCustomDNS;
- (id)__testCustomIPv4;
- (id)__testCustomIPv6;
- (id)__testCustomWebProxy;
- (id)__testDetectDoubleNAT;
- (id)__testDiscoverPeerTypes;
- (id)__testDownloadSpeedWithConfiguration:(id)a3;
- (id)__testHT402GHzWithConfiguration:(id)a3;
- (id)__testHiddenNetworkWithConfiguration:(id)a3;
- (id)__testHighBTConnectedWithConfiguration:(id)a3;
- (id)__testHighBTPairedWithConfiguration:(id)a3;
- (id)__testIPv4Assigned;
- (id)__testIPv6Assigned;
- (id)__testLargePNLWithConfiguration:(id)a3;
- (id)__testLeakyAP;
- (id)__testLegacyRates11bWithConfiguration:(id)a3;
- (id)__testLegacySecurityWEPWithConfiguration:(id)a3;
- (id)__testLegacySecurityWPAWithConfiguration:(id)a3;
- (id)__testLongBeaconIntervalWithConfiguration:(id)a3;
- (id)__testLongDTIMInterval;
- (id)__testNoSecurityWithConfiguration:(id)a3;
- (id)__testPNLContainsHiddenWithConfiguration:(id)a3;
- (id)__testPasspointWithConfiguration:(id)a3;
- (id)__testPeerDiagnostics;
- (id)__testPeerTypes;
- (id)__testPing6AWDLWithConfiguration:(id)a3;
- (id)__testPingLANUsingCFNetworkWithConfiguration:(id)a3;
- (id)__testPingLANUsingIMFoundation;
- (id)__testPingLANWithConfiguration:(id)a3;
- (id)__testPingWANUsingCFNetworkWithConfiguration:(id)a3;
- (id)__testPingWANUsingIMFoundation;
- (id)__testPingWANWithConfiguration:(id)a3;
- (id)__testPoorSignalWithConfiguration:(id)a3;
- (id)__testReachApple;
- (id)__testReachabilityToPeersWithConfiguration:(id)a3;
- (id)__testResolveDNS;
- (id)__testRetrieveApple;
- (id)__testRetrieveAppleForceWiFiWithConfiguration:(id)a3;
- (id)__testUploadSpeedWithConfiguration:(id)a3;
- (id)__testWiFiHiddenScanResultsWithConfiguration:(id)a3;
- (id)__testWiFiIsPrimaryIPv4;
- (id)__testWiFiIsPrimaryIPv6;
- (id)__testWiFiLink;
- (id)__testWiFiNoScanResultsWithConfiguration:(id)a3;
- (id)__testiOSPersonalHotspotWithConfiguration:(id)a3;
- (id)__uploadSpeedtestWithFileSize:(int)a3 timeout:(unint64_t)a4 error:(id *)a5;
- (id)completedTestCallback;
- (id)diagnosticsHistory;
- (id)pingCallback;
- (int64_t)__ipv4ConfigMethodForDescription:(id)a3;
- (int64_t)__ipv6ConfigMethodForDescription:(id)a3;
- (void)__nextRequest;
- (void)__purgeDiagnosticsHistory;
- (void)__resetNetworkServiceOrderFromFile;
- (void)__runRequest:(id)a3 reply:(id)a4;
- (void)__updateDiagnosticsHistoryWithResult:(id)a3;
- (void)addRequest:(id)a3;
- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)resetNetworkServiceOrderForTeardown;
- (void)setCompletedTestCallback:(id)a3;
- (void)setPingCallback:(id)a3;
- (void)teardownAndNotify:(id)a3;
@end

@implementation W5DiagnosticsManager

- (W5DiagnosticsManager)initWithStatusManager:(id)a3 peerDiagnosticsManager:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)W5DiagnosticsManager;
  v6 = [(W5DiagnosticsManager *)&v14 init];
  if (!v6) {
    goto LABEL_10;
  }
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.wifivelocity.diagnostics", 0);
  *((void *)v6 + 5) = v7;
  if (!v7) {
    goto LABEL_10;
  }
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifivelocity.diagnostics.default-route", v8);
  *((void *)v6 + 11) = v9;
  if (!v9) {
    goto LABEL_10;
  }
  dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 5), v6 + 40, (void *)1, 0);
  if (!a3) {
    goto LABEL_10;
  }
  *((void *)v6 + 1) = a3;
  *((void *)v6 + 2) = a4;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  *((void *)v6 + 6) = v10;
  if (!v10) {
    goto LABEL_10;
  }
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  *((void *)v6 + 8) = v11;
  if (v11 && (id v12 = objc_alloc_init((Class)NSDateFormatter), (*((void *)v6 + 14) = v12) != 0))
  {
    [v12 setDateFormat:@"HH:mm:ss.SSS"];
    [v6 __resetNetworkServiceOrderFromFile];
  }
  else
  {
LABEL_10:

    return 0;
  }
  return (W5DiagnosticsManager *)v6;
}

- (void)dealloc
{
  [(NSURLSession *)self->_urlSession invalidateAndCancel];
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  wifiDefaultRouteQueue = self->_wifiDefaultRouteQueue;
  if (wifiDefaultRouteQueue) {
    dispatch_release(wifiDefaultRouteQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)W5DiagnosticsManager;
  [(W5DiagnosticsManager *)&v5 dealloc];
}

- (void)setCompletedTestCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_completedTestCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003BDEC;
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
    v6[2] = sub_10003BEE8;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)addRequest:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003BFB4;
  v4[3] = &unk_1000DDC30;
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
    dispatch_queue_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
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

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C184;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)teardownAndNotify:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003C460;
  v4[3] = &unk_1000DDC08;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)diagnosticsHistory
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  dispatch_queue_t v9 = sub_10003C5C4;
  id v10 = sub_10003C5D4;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003C5E0;
  v5[3] = &unk_1000DDD30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)__resetNetworkServiceOrderFromFile
{
  v2 = +[NSData dataWithContentsOfFile:@"/var/run/wifivelocity-tmp"];
  if ([(NSData *)v2 length])
  {
    id v3 = +[NSPropertyListSerialization propertyListWithData:v2 options:0 format:0 error:0];
    if (v3)
    {
      id v4 = v3;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] Restoring network service order from file", v5, 2u);
      }
      +[W5DiagnosticsManager __setNetworkServiceOrder:v4];
    }
    [+[NSFileManager defaultManager] removeItemAtPath:@"/var/run/wifivelocity-tmp" error:0];
  }
}

- (void)resetNetworkServiceOrderForTeardown
{
  wifiDefaultRouteQueue = self->_wifiDefaultRouteQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C78C;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_sync(wifiDefaultRouteQueue, block);
}

- (void)__nextRequest
{
  if (!self->_activeRequest)
  {
    if ([(NSMutableArray *)self->_pendingRequests count])
    {
      id v3 = [[-[NSMutableArray firstObject](self->_pendingRequests) copy];
      self->_activeRequest = (W5DiagnosticsTestRequestInternal *)[[-[NSMutableArray firstObject](self->_pendingRequests, "firstObject") copy];
      [(NSMutableArray *)self->_pendingRequests removeObjectAtIndex:0];
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x3052000000;
      v6[3] = sub_10003C5C4;
      v6[4] = sub_10003C5D4;
      uint64_t v7 = 0;
      uint64_t v4 = os_transaction_create();
      [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager")] osTransactionCreate:@"com.apple.wifivelocity.diagnostics" transaction:v4];
      uint64_t v7 = v4;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10003C9D4;
      v5[3] = &unk_1000DE6C0;
      v5[4] = self;
      v5[5] = v3;
      void v5[6] = v6;
      [(W5DiagnosticsManager *)self __runRequest:v3 reply:v5];
      _Block_object_dispose(v6, 8);
    }
  }
}

- (id)__defaultDiagnosticsTests
{
  id v2 = +[NSMutableArray array];
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
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:52, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:57, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:58, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v5, &off_1000EDF98)];
  [v2 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", v6, &off_1000EDF98)]];
  if (v4) {
    [v2 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 59, &off_1000EDF98)]];
  }
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:12, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:13, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:7, &off_1000EDF98]];
  [v2 addObject:+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 8, &off_1000EDF98)];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:9, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:11, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 54, &off_1000EDF98)];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:14, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:15, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:16, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:17, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:18, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:19, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:20, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:21, &off_1000EDF98]];
  [v2 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 22, &off_1000EDF98)];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:51, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:24, &off_1000EDF98]];
  [v2 addObject:+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 27, &off_1000EDF98)];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:28, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:29, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:30, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:31, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:32, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:34, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:35, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:36, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:37 configuration:&off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:38, &off_1000EDF98]];
  [v2 addObject:+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, 40, &off_1000EDF98)];
  [v2 addObject:[+[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 39, &off_1000EDF98)]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:41, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:](44, &off_1000EDF98)];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:45, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:46, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:47, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:48, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:43, &off_1000EDF98]];
  [v2 addObject:[W5DiagnosticsTestRequest requestWithTestID:configuration:42, &off_1000EDF98]];
  return v2;
}

- (void)__purgeDiagnosticsHistory
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(NSMutableDictionary *)self->_diagnosticsHistory allKeys];
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v9 = [(NSMutableDictionary *)self->_diagnosticsHistory objectForKeyedSubscript:v8];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = [v9 allKeys];
        id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * (void)j);
              [objc_msgSend(v9, "objectForKeyedSubscript:", v15) testCompleted];
              if (v4 - v16 > 86400.0) {
                [v9 setObject:0 forKeyedSubscript:v15];
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v12);
        }
        if (!objc_msgSend(objc_msgSend(v9, "allKeys"), "count")) {
          [(NSMutableDictionary *)self->_diagnosticsHistory setObject:0 forKeyedSubscript:v8];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }
}

- (void)__updateDiagnosticsHistoryWithResult:(id)a3
{
  if (a3 && ([a3 didPass] & 1) == 0)
  {
    id v5 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] networkName];
    if ([a3 testID] == (id)52) {
      id v5 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] lastAssociatedSSIDString];
    }
    if (v5)
    {
      id v6 = [(NSMutableDictionary *)self->_diagnosticsHistory objectForKeyedSubscript:v5];
      if (!v6)
      {
        id v6 = +[NSMutableDictionary dictionary];
        [(NSMutableDictionary *)self->_diagnosticsHistory setObject:v6 forKeyedSubscript:v5];
      }
      [v6 setObject:a3 forKeyedSubscript:[NSNumber numberWithInteger:objc_msgSend(a3, "testID")]];
    }
  }

  [(W5DiagnosticsManager *)self __purgeDiagnosticsHistory];
}

- (void)__runRequest:(id)a3 reply:(id)a4
{
  id v7 = [a3 testRequests];
  if (!v7) {
    id v7 = [(W5DiagnosticsManager *)self __defaultDiagnosticsTests];
  }
  if (![(NSArray *)self->_wifiScanResults count])
  {

    self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] scanCache:1];
  }
  uint64_t v8 = [(W5StatusManager *)self->_status concurrentQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003D504;
  v9[3] = &unk_1000DE050;
  v9[4] = a3;
  v9[5] = v7;
  v9[6] = self;
  v9[7] = a4;
  [(NSOperationQueue *)v8 addOperationWithBlock:v9];
}

- (id)__testDetectDoubleNAT
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:8];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    if (+[W5DiagnosticsManager __isDoubleNATWithTracerouteOutput:[(W5DiagnosticsManager *)self __performTracerouteWithAddress:@"captive.apple.com" maxTTL:2 waittime:1 queries:1]])
    {
      [v3 setResult:1];
    }
    else
    {
      [v3 setDidPass:1];
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testPingLANWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  uint64_t v6 = 1;
  [v5 setTestID:1];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v7 = [a3 objectForKeyedSubscript:@"PingCount"];
  id v8 = [a3 objectForKeyedSubscript:@"PingTimeout"];
  id v9 = [a3 objectForKeyedSubscript:@"PingInterval"];
  id v10 = [a3 objectForKeyedSubscript:@"PingWait"];
  id v11 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  if (v7) {
    uint64_t v6 = (uint64_t)[v7 integerValue];
  }
  if (v8)
  {
    [v8 doubleValue];
    double v13 = v12;
    if (v9) {
      goto LABEL_5;
    }
  }
  else
  {
    double v13 = 2.0;
    if (v9)
    {
LABEL_5:
      [v9 doubleValue];
      double v15 = v14;
      if (v10) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  double v15 = 0.1;
  if (v10)
  {
LABEL_6:
    [v10 doubleValue];
    double v17 = v16;
    if (!v11) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_19:
  double v17 = 2.0;
  if (v11) {
LABEL_7:
  }
    id v11 = [v11 unsignedIntegerValue];
LABEL_8:
  id v18 = [a3 objectForKeyedSubscript:@"PingTrafficClass"];
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    id v19 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv4RouterAddress];
    id v20 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv6RouterAddress];
    if (v19 || (id v19 = v20) != 0)
    {
      id v21 = [(W5DiagnosticsManager *)self __performPingWithAddress:v19 count:v6 timeout:v18 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:v11 trafficClass:v13 interfaceName:v17 dataLength:v15];
      if (v21)
      {
        long long v22 = v21;
        if ((uint64_t)[v21 count] >= 1)
        {
          [v22 packetLoss];
          if (v23 < 100.0)
          {
            [v5 setResult:1];
            [v5 setDidPass:1];
          }
        }
        CFStringRef v25 = @"PingResult";
        long long v26 = v22;
        [v5 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1)]];
      }
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testPing6AWDLWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:59];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"PingCount"];
  id v7 = [a3 objectForKeyedSubscript:@"PingWait"];
  id v8 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  if (v6)
  {
    uint64_t v9 = (uint64_t)[v6 integerValue];
    if (v7) {
      goto LABEL_3;
    }
LABEL_13:
    double v11 = 2.0;
    if (!v8) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v9 = 1;
  if (!v7) {
    goto LABEL_13;
  }
LABEL_3:
  [v7 doubleValue];
  double v11 = v10;
  if (v8) {
LABEL_4:
  }
    id v8 = [v8 unsignedIntegerValue];
LABEL_5:
  id v12 = [a3 objectForKeyedSubscript:@"PingTrafficClass"];
  if (objc_msgSend(objc_msgSend(-[CWFInterface AWDL](-[W5StatusManager corewifi](self->_status, "corewifi"), "AWDL"), "IPv6Addresses"), "count"))
  {
    id v13 = [(W5DiagnosticsManager *)self __performPing6WithAddress:@"ff02::fb" count:v9 wait:v12 trafficClass:[(W5WiFiInterface *)[(W5StatusManager *)self->_status awdl] interfaceName] interfaceName:v8 dataLength:v11];
    if (v13)
    {
      double v14 = v13;
      if ((uint64_t)[v13 count] >= 1)
      {
        [v14 packetLoss];
        if (v15 < 100.0)
        {
          [v5 setResult:1];
          [v5 setDidPass:1];
        }
      }
      CFStringRef v17 = @"PingResult";
      id v18 = v14;
      [v5 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)]];
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testPingWANWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:4];
  +[NSDate timeIntervalSinceReferenceDate];
  v52 = v5;
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"PingCount"];
  id v7 = [a3 objectForKeyedSubscript:@"PingTimeout"];
  id v8 = [a3 objectForKeyedSubscript:@"PingInterval"];
  id v9 = [a3 objectForKeyedSubscript:@"PingWait"];
  id v10 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  id v11 = [a3 objectForKeyedSubscript:@"PingWANUseAppleDNS"];
  id v12 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  id v13 = [a3 objectForKeyedSubscript:@"IPAddress"];
  if (v6)
  {
    uint64_t v53 = (uint64_t)[v6 integerValue];
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v53 = 1;
    if (v7)
    {
LABEL_3:
      [v7 doubleValue];
      double v15 = v14;
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  double v15 = 2.0;
  if (v8)
  {
LABEL_4:
    [v8 doubleValue];
    double v17 = v16;
    if (v9) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  double v17 = 0.1;
  if (v9)
  {
LABEL_5:
    [v9 doubleValue];
    double v19 = v18;
    if (!v10) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  double v19 = 2.0;
  if (v10) {
LABEL_6:
  }
    id v10 = [v10 unsignedIntegerValue];
LABEL_7:
  id v20 = v13;
  if (v11)
  {
    char v21 = [v11 BOOLValue] ^ 1;
    if (v12)
    {
LABEL_9:
      unsigned __int8 v22 = [v12 BOOLValue];
      goto LABEL_17;
    }
  }
  else
  {
    char v21 = 1;
    if (v12) {
      goto LABEL_9;
    }
  }
  unsigned __int8 v22 = 1;
LABEL_17:
  id v23 = [a3 objectForKeyedSubscript:@"PingTrafficClass"];
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    id v24 = +[NSMutableArray array];
    if (v21)
    {
      status = self->_status;
      if (v20)
      {
        id v26 = [(W5DiagnosticsManager *)self __performPingWithAddress:v20 count:v53 timeout:v23 wait:[(W5WiFiInterface *)[(W5StatusManager *)status wifi] interfaceName] interval:v10 trafficClass:v15 interfaceName:v19 dataLength:v17];
        if (v26) {
          [v24 addObject:v26];
        }
      }
      else
      {
        id v36 = [(CWFInterface *)[(W5StatusManager *)status corewifi] DNSServerAddresses];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v37 = [v36 countByEnumeratingWithState:&v58 objects:v69 count:16];
        if (v37)
        {
          id v38 = v37;
          uint64_t v39 = *(void *)v59;
          do
          {
            for (i = 0; i != v38; i = (char *)i + 1)
            {
              if (*(void *)v59 != v39) {
                objc_enumerationMutation(v36);
              }
              id v41 = [(W5DiagnosticsManager *)self __performPingWithAddress:*(void *)(*((void *)&v58 + 1) + 8 * i) count:v53 timeout:v23 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:v10 trafficClass:v15 interfaceName:v19 dataLength:v17];
              if (v41)
              {
                v42 = v41;
                [v24 addObject:v41];
                [v42 packetLoss];
                if (v43 < 100.0) {
                  char v44 = 1;
                }
                else {
                  char v44 = v22;
                }
                if (v44) {
                  goto LABEL_51;
                }
              }
              else if (v22)
              {
                goto LABEL_51;
              }
            }
            id v38 = [v36 countByEnumeratingWithState:&v58 objects:v69 count:16];
          }
          while (v38);
        }
      }
    }
    else
    {
      v27 = sub_100096ED4();
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v28 = [v27 countByEnumeratingWithState:&v62 objects:v70 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v63;
        do
        {
          for (j = 0; j != v29; j = (char *)j + 1)
          {
            if (*(void *)v63 != v30) {
              objc_enumerationMutation(v27);
            }
            id v32 = [(W5DiagnosticsManager *)self __performPingWithAddress:*(void *)(*((void *)&v62 + 1) + 8 * (void)j) count:v53 timeout:v23 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:v10 trafficClass:v15 interfaceName:v19 dataLength:v17];
            if (v32)
            {
              v33 = v32;
              [v24 addObject:v32];
              [v33 packetLoss];
              if (v34 < 100.0) {
                char v35 = 1;
              }
              else {
                char v35 = v22;
              }
              if (v35) {
                goto LABEL_51;
              }
            }
            else if (v22)
            {
              goto LABEL_51;
            }
          }
          id v29 = [v27 countByEnumeratingWithState:&v62 objects:v70 count:16];
        }
        while (v29);
      }
    }
LABEL_51:
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v45 = [v24 countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v55;
      while (2)
      {
        for (k = 0; k != v46; k = (char *)k + 1)
        {
          if (*(void *)v55 != v47) {
            objc_enumerationMutation(v24);
          }
          v49 = *(void **)(*((void *)&v54 + 1) + 8 * (void)k);
          if ((uint64_t)[v49 count] >= 1)
          {
            [v49 packetLoss];
            if (v50 < 100.0)
            {
              [v52 setDidPass:1];
              [v52 setResult:1];
              goto LABEL_62;
            }
          }
        }
        id v46 = [v24 countByEnumeratingWithState:&v54 objects:v68 count:16];
        if (v46) {
          continue;
        }
        break;
      }
    }
LABEL_62:
    CFStringRef v66 = @"PingResults";
    id v67 = [v24 copy];
    [v52 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1)]];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v52 setTestCompleted:];
  return v52;
}

- (id)__testPingLANUsingIMFoundation
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:2];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    id v4 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv4RouterAddress];
    id v5 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv6RouterAddress];
    if (v4 || (id v4 = v5) != 0)
    {
      id v6 = [(W5DiagnosticsManager *)self __performPingUsingIMFoundationWithAddress:v4 timeout:1];
      if (v6)
      {
        id v7 = v6;
        if ((uint64_t)[v6 count] >= 1)
        {
          [v7 packetLoss];
          if (v8 < 100.0)
          {
            [v3 setDidPass:1];
            [v3 setResult:1];
          }
        }
        CFStringRef v10 = @"PingResult";
        id v11 = v7;
        [v3 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)];
      }
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testPingWANUsingIMFoundation
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:5];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    id v4 = +[NSMutableArray array];
    id v5 = sub_100096ED4();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v37;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(W5DiagnosticsManager *)self __performPingUsingIMFoundationWithAddress:*(void *)(*((void *)&v36 + 1) + 8 * v9) timeout:1];
        if (v10)
        {
          id v11 = v10;
          [v4 addObject:v10];
          [v11 packetLoss];
          if (v12 < 100.0) {
            break;
          }
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v5 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    id v13 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] DNSServerAddresses];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
LABEL_13:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [(W5DiagnosticsManager *)self __performPingUsingIMFoundationWithAddress:*(void *)(*((void *)&v32 + 1) + 8 * v17) timeout:1];
        if (v18)
        {
          double v19 = v18;
          [v4 addObject:v18];
          [v19 packetLoss];
          if (v20 < 100.0) {
            break;
          }
        }
        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v32 objects:v43 count:16];
          if (v15) {
            goto LABEL_13;
          }
          break;
        }
      }
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v21 = [v4 countByEnumeratingWithState:&v28 objects:v42 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v29;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v4);
          }
          CFStringRef v25 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ((uint64_t)[v25 count] >= 1)
          {
            [v25 packetLoss];
            if (v26 < 100.0)
            {
              [v3 setDidPass:1];
              [v3 setResult:1];
              goto LABEL_31;
            }
          }
        }
        id v22 = [v4 countByEnumeratingWithState:&v28 objects:v42 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
LABEL_31:
    CFStringRef v40 = @"PingResults";
    id v41 = [v4 copy];
    [v3 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testPingLANUsingCFNetworkWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"PingCount"];
  id v7 = [a3 objectForKeyedSubscript:@"PingTimeout"];
  id v8 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  if (v6)
  {
    uint64_t v9 = (uint64_t)[v6 integerValue];
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = 1;
    if (v7)
    {
LABEL_3:
      [v7 doubleValue];
      double v11 = v10;
      if (!v8) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  double v11 = 2.0;
  if (v8) {
LABEL_4:
  }
    id v8 = [v8 unsignedIntegerValue];
LABEL_5:
  id v12 = [a3 objectForKeyedSubscript:@"PingTrafficClass"];
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    id v13 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv4RouterAddress];
    id v14 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv6RouterAddress];
    if (v13 || (id v13 = v14) != 0)
    {
      id v15 = [(W5DiagnosticsManager *)self __performCFPingWithAddress:v13 count:v9 timeout:v12 trafficClass:0 networkServiceType:v8 dataLength:v11];
      if (v15)
      {
        uint64_t v16 = v15;
        if ((uint64_t)[v15 count] >= 1)
        {
          [v16 packetLoss];
          if (v17 < 100.0)
          {
            [v5 setDidPass:1];
            [v5 setResult:1];
          }
        }
        CFStringRef v19 = @"PingResult";
        double v20 = v16;
        [v5 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1)];
      }
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testPingWANUsingCFNetworkWithConfiguration:(id)a3
{
  id v4 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v4 setTestID:6];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setTestStarted:];
  id v5 = [a3 objectForKeyedSubscript:@"PingCount"];
  id v6 = [a3 objectForKeyedSubscript:@"PingTimeout"];
  id v7 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  id v8 = [a3 objectForKeyedSubscript:@"PingWANUseAppleDNS"];
  id v9 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  id v10 = [a3 objectForKeyedSubscript:@"IPAddress"];
  if (v5)
  {
    uint64_t v11 = (uint64_t)[v5 integerValue];
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = 1;
    if (v6)
    {
LABEL_3:
      [v6 doubleValue];
      double v13 = v12;
      if (!v7) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  double v13 = 2.0;
  if (v7) {
LABEL_4:
  }
    id v7 = [v7 unsignedIntegerValue];
LABEL_5:
  if (v8)
  {
    char v14 = [v8 BOOLValue] ^ 1;
    if (v9)
    {
LABEL_7:
      unsigned __int8 v15 = [v9 BOOLValue];
      goto LABEL_13;
    }
  }
  else
  {
    char v14 = 1;
    if (v9) {
      goto LABEL_7;
    }
  }
  unsigned __int8 v15 = 1;
LABEL_13:
  id v16 = [a3 objectForKeyedSubscript:@"PingTrafficClass"];
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    id v17 = +[NSMutableArray array];
    id v44 = v4;
    if (v14)
    {
      if (v10)
      {
        id v18 = [(W5DiagnosticsManager *)self __performCFPingWithAddress:v10 count:v11 timeout:v16 trafficClass:0 networkServiceType:v7 dataLength:v13];
        if (v18) {
          [v17 addObject:v18];
        }
      }
      else
      {
        id v28 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] DNSServerAddresses];
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v29 = [v28 countByEnumeratingWithState:&v51 objects:v62 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v52;
          do
          {
            for (i = 0; i != v30; i = (char *)i + 1)
            {
              if (*(void *)v52 != v31) {
                objc_enumerationMutation(v28);
              }
              id v33 = -[W5DiagnosticsManager __performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:](self, "__performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:", *(void *)(*((void *)&v51 + 1) + 8 * i), v11, v16, 0, v7, v13, v44);
              if (v33)
              {
                long long v34 = v33;
                [v17 addObject:v33];
                [v34 packetLoss];
                if (v35 < 100.0) {
                  char v36 = 1;
                }
                else {
                  char v36 = v15;
                }
                if (v36) {
                  goto LABEL_47;
                }
              }
              else if (v15)
              {
                goto LABEL_47;
              }
            }
            id v30 = [v28 countByEnumeratingWithState:&v51 objects:v62 count:16];
          }
          while (v30);
        }
      }
    }
    else
    {
      CFStringRef v19 = sub_100096ED4();
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v20 = [v19 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v56;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v56 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = -[W5DiagnosticsManager __performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:](self, "__performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:", *(void *)(*((void *)&v55 + 1) + 8 * (void)j), v11, v16, 0, v7, v13, v44);
            if (v24)
            {
              CFStringRef v25 = v24;
              [v17 addObject:v24];
              [v25 packetLoss];
              if (v26 < 100.0) {
                char v27 = 1;
              }
              else {
                char v27 = v15;
              }
              if (v27) {
                goto LABEL_47;
              }
            }
            else if (v15)
            {
              goto LABEL_47;
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v21);
      }
    }
LABEL_47:
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v37 = [v17 countByEnumeratingWithState:&v47 objects:v61 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v48;
      while (2)
      {
        for (k = 0; k != v38; k = (char *)k + 1)
        {
          if (*(void *)v48 != v39) {
            objc_enumerationMutation(v17);
          }
          id v41 = *(void **)(*((void *)&v47 + 1) + 8 * (void)k);
          if ((uint64_t)[v41 count] >= 1)
          {
            [v41 packetLoss];
            if (v42 < 100.0)
            {
              [v45 setDidPass:1];
              [v45 setResult:1];
              goto LABEL_58;
            }
          }
        }
        id v38 = [v17 countByEnumeratingWithState:&v47 objects:v61 count:16];
        if (v38) {
          continue;
        }
        break;
      }
    }
LABEL_58:
    CFStringRef v59 = @"PingResults";
    id v60 = [v17 copy];
    id v4 = v45;
    [v45 setInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setTestCompleted:];
  return v4;
}

- (id)__testConcurrentWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:53];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v20 = v5;
  [v5 setDidPass:1];
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  id v7 = [a3 objectForKeyedSubscript:@"ConcurrentRequests"];
  id v22 = +[NSMutableArray array];
  id v21 = dispatch_queue_create(0, 0);
  id v8 = dispatch_group_create();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        dispatch_group_enter(v8);
        char v14 = [(W5StatusManager *)self->_status concurrentQueue];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10003F910;
        v28[3] = &unk_1000DE788;
        v28[4] = v13;
        v28[5] = v6;
        v28[6] = self;
        v28[7] = v21;
        v28[8] = v22;
        v28[9] = v8;
        [(NSOperationQueue *)v14 addOperationWithBlock:v28];
      }
      id v10 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = [v22 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    while (2)
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v22);
        }
        if (([*(id *)(*((void *)&v24 + 1) + 8 * (void)j) didPass] & 1) == 0)
        {
          [v20 setDidPass:0];
          goto LABEL_18;
        }
      }
      id v16 = [v22 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_18:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FA60;
  block[3] = &unk_1000DDC30;
  block[4] = v20;
  void block[5] = v22;
  dispatch_sync(v21, block);
  +[NSDate timeIntervalSinceReferenceDate];
  [v20 setTestCompleted:];
  if (v8) {
    dispatch_release(v8);
  }
  if (v21) {
    dispatch_release(v21);
  }
  return v20;
}

- (id)__testResolveDNS
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:7];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    id v4 = +[W5DiagnosticsManager __performDNSResolution:@"captive.apple.com"];
    if ([v4 count])
    {
      [v3 setDidPass:1];
      [v3 setResult:1];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = [v4 countByEnumeratingWithState:&v13 objects:v20 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v14;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v4);
            }
            id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            id v10 = (const sockaddr *)[v9 bytes];
            if ((unint64_t)[v9 length] >= 0x10
              && v10->sa_family == 2
              && !getnameinfo(v10, v10->sa_len, v19, 0x10u, 0, 0, 2))
            {
              uint64_t v11 = +[NSString stringWithCString:v19 encoding:1];
              if (v11)
              {
                CFStringRef v17 = @"DNSResolution";
                id v18 = v11;
                [v3 setInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)];
              }
              goto LABEL_16;
            }
          }
          id v6 = [v4 countByEnumeratingWithState:&v13 objects:v20 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
    }
  }
LABEL_16:
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testReachApple
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:9];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  if (([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] reachabilityFlags] & 6) == 2)
  {
    [v3 setDidPass:1];
    [v3 setResult:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testRetrieveApple
{
  id v3 = +[NSString stringWithFormat:@"https://%@", @"captive.apple.com"];
  id v4 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v4 setTestID:10];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setTestStarted:];
  if ([(W5DiagnosticsManager *)self __performLoadViaNSURLSessionWithAddress:v3 usingTimeout:0 andForceWiFiInterface:0])
  {
    [v4 setDidPass:1];
    [v4 setResult:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setTestCompleted:];
  return v4;
}

- (id)__testRetrieveAppleForceWiFiWithConfiguration:(id)a3
{
  id v5 = +[NSString stringWithFormat:@"https://%@", @"captive.apple.com"];
  id v6 = [a3 objectForKeyedSubscript:@"Timeout"];
  id v7 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v7 setTestID:11];
  +[NSDate timeIntervalSinceReferenceDate];
  [v7 setTestStarted:];
  if ([(W5DiagnosticsManager *)self __performLoadViaNSURLSessionWithAddress:v5 usingTimeout:v6 andForceWiFiInterface:1])
  {
    [v7 setDidPass:1];
    [v7 setResult:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v7 setTestCompleted:];
  return v7;
}

- (id)__testCurlApple
{
  id v3 = +[NSString stringWithFormat:@"https://%@", @"captive.apple.com"];
  id v4 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v4 setTestID:54];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setTestStarted:];
  if ([(W5DiagnosticsManager *)self __performCurlWithAddress:v3])
  {
    [v4 setDidPass:1];
    [v4 setResult:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setTestCompleted:];
  return v4;
}

- (id)__testIPv4Assigned
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:12];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  id v4 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv4Addresses];
  id v5 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv4RouterAddress];
  if ([v4 count]) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    [v3 setDidPass:1];
    [v3 setResult:1];
    v8[0] = @"IPv4Addresses";
    v8[1] = @"IPv4Router";
    v9[0] = v4;
    v9[1] = v5;
    [v3 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testPeerDiagnostics
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:60];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  id v4 = [(W5PeerDiagnosticsManager *)self->_peerDiagnostics gatherPeerDiagnostics];
  if ([v4 count])
  {
    [v3 setResult:1];
    [v3 setDidPass:1];
    CFStringRef v6 = @"PeerDiagnosticsResults";
    id v7 = v4;
    [v3 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1)];
  }
  else
  {
    [v3 setDidPass:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testPeerTypes
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:61];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  id v4 = [(W5PeerDiagnosticsManager *)self->_peerDiagnostics gatherPeerTypes];
  if (v4)
  {
    id v5 = v4;
    [v3 setResult:1];
    [v3 setDidPass:1];
    CFStringRef v7 = @"PeerDevicesInfo";
    id v8 = v5;
    [v3 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1)];
  }
  else
  {
    [v3 setDidPass:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testDiscoverPeerTypes
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:62];
  [v3 setDidPass:1];
  [v3 setResult:1];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  [(W5PeerDiagnosticsManager *)self->_peerDiagnostics beginPeerDiscovery];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testIPv6Assigned
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:13];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  id v4 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv6Addresses];
  id v5 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] IPv6RouterAddress];
  if ([v4 count]) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    [v3 setDidPass:1];
    [v3 setResult:1];
    v8[0] = @"IPv6Addresses";
    v8[1] = @"IPv6Router";
    v9[0] = v4;
    v9[1] = v5;
    [v3 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testCustomIPv4
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:14];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  int64_t v4 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] ipv4ConfigMethod];
  if (v4 == 3) {
    [v3 setDidPass:1];
  }
  else {
    [v3 setResult:1];
  }
  CFStringRef v6 = @"IPv4ConfigMethod";
  CFStringRef v7 = +[NSNumber numberWithInteger:v4];
  [v3 setInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1)];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testCustomIPv6
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:15];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  int64_t v4 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] ipv6ConfigMethod];
  if (v4 == 1) {
    [v3 setDidPass:1];
  }
  else {
    [v3 setResult:1];
  }
  CFStringRef v6 = @"IPv6ConfigMethod";
  CFStringRef v7 = +[NSNumber numberWithInteger:v4];
  [v3 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1)];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testCustomDNS
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:16];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  if ([(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] isUsingCustomDNSSettings])
  {
    [v3 setResult:1];
  }
  else
  {
    [v3 setDidPass:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testCustomWebProxy
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:17];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  if ([(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] isUsingCustomProxySetting])
  {
    [v3 setResult:1];
  }
  else
  {
    [v3 setDidPass:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testCongestedChannelUsingCCAWithConfiguration:(id)a3
{
  id v3 = [(W5DiagnosticsManager *)self __testCongestedChannelWithConfiguration:a3];
  [v3 setTestID:23];
  return v3;
}

- (id)__testCongestedChannelWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:24];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  uint64_t v6 = (uint64_t)[a3 objectForKeyedSubscript:@"MaxScanCacheAge"];
  +[NSDate timeIntervalSinceReferenceDate];
  if ((v6 & 0x8000000000000000) == 0)
  {
    double v8 = v7;
    if (v7 - self->_wifiScanTimestamp > (double)v6)
    {

      self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
      self->_wifiScanTimestamp = v8;
    }
  }
  id v9 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v9) {
    id v10 = [(W5DiagnosticsManager *)self __scanResultWithNetworkName:v9];
  }
  else {
    id v10 = [(W5StatusManager *)self->_status wifi];
  }
  id v11 = [(W5WiFiInterface *)v10 channel];
  id v12 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] supportedChannels];
  id v13 = [(W5DiagnosticsManager *)self __overlappingChannelsForChannel:v11 supportedChannels:v12];
  id v14 = [(W5DiagnosticsManager *)self __occupiedChannelsForScanResults:self->_wifiScanResults supportedChannels:v12 rssiThreshold:-80 ignoreChannel:v11];
  id v15 = [(W5DiagnosticsManager *)self __orderedChannelWeights:[(W5DiagnosticsManager *)self __adjust5GHzWeights:[(W5DiagnosticsManager *)self __applyChannelWeights:[(W5DiagnosticsManager *)self __channelWeightsForScanResults:self->_wifiScanResults supportedChannels:v12 rssiThreshold:-80] supportedChannels:v12]]];
  id v42 = [(W5DiagnosticsManager *)self __only2GHz_1_6_11_14_Channels:v15];
  id v43 = [(W5DiagnosticsManager *)self __only5GHz20MHz40MHzChannels:v15];
  id v44 = [(W5DiagnosticsManager *)self __only5GHz40MHzChannels:v43];
  id v45 = [(W5DiagnosticsManager *)self __only5GHzNonDFSChannels:v43];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v16 = [v13 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v51;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v51 != v20) {
          objc_enumerationMutation(v13);
        }
        v19 += [v14 containsObject:*(void *)(*((void *)&v50 + 1) + 8 * i)];
      }
      v18 += (uint64_t)v17;
      id v17 = [v13 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v17);
    float v22 = (float)v19;
    float v23 = (float)v18;
  }
  else
  {
    float v23 = 0.0;
    float v22 = 0.0;
  }
  id v24 = +[NSMutableArray array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v26 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v47;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v47 != v28) {
          objc_enumerationMutation(wifiScanResults);
        }
        long long v30 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
        id v31 = [objc_msgSend(v30, "channel") channel];
        if (v31 == [v11 channel]) {
          [v24 addObject:v30];
        }
      }
      id v27 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v27);
  }
  id v32 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] cachedLinkQualityMetric];
  id v33 = [objc_msgSend(v32, "linkQualityMetricData") bytes];
  if (v33 && v33[18])
  {
    double v35 = v44;
    long long v34 = v45;
    char v36 = v43;
    if ((unint64_t)[v32 CCA] >= 0x47) {
      [v5 setResult:1];
    }
    else {
      [v5 setDidPass:1];
    }
    id v38 = &Apple80211BindToInterface_ptr;
    id v40 = +[NSMutableDictionary dictionary];
    [v40 setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v32, "CCA")) forKeyedSubscript:@"CCA"];
    uint64_t v39 = v42;
    if (!v11) {
      goto LABEL_36;
    }
LABEL_35:
    [v40 setObject:v11 forKeyedSubscript:@"CurrentChannel"];
    goto LABEL_36;
  }
  if ((unint64_t)[v24 count] > 4 || (*(float *)&double v37 = v22 / v23, (float)(v22 / v23) > 0.5)) {
    [v5 setResult:1, v37];
  }
  else {
    [v5 setDidPass:1, v37];
  }
  id v38 = &Apple80211BindToInterface_ptr;
  double v35 = v44;
  long long v34 = v45;
  uint64_t v39 = v42;
  char v36 = v43;
  id v40 = +[NSMutableDictionary dictionary];
  if (v11) {
    goto LABEL_35;
  }
LABEL_36:
  if ([v39 count]) {
    [v40 setObject:[v39 firstObject] forKeyedSubscript:@"2GHzChannel"];
  }
  if ([v36 count]) {
    [v40 setObject:objc_msgSend(v36, "firstObject") forKeyedSubscript:@"5GHzChannel"];
  }
  if ([v35 count]) {
    [v40 setObject:[v35 firstObject] forKeyedSubscript:@"5GHz40MHzChannel"];
  }
  if ([v34 count]) {
    [v40 setObject:[v34 firstObject] forKeyedSubscript:@"5GHzNonDFSChannel"];
  }
  [v5 setInfo:[v40 copy]];
  [v38[359] timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testCongested2GHzWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:25];
  [v5 setConfiguration:a3];
  uint64_t v6 = &Apple80211BindToInterface_ptr;
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  uint64_t v7 = (uint64_t)[[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
  +[NSDate timeIntervalSinceReferenceDate];
  if ((v7 & 0x8000000000000000) == 0)
  {
    double v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
      self->_wifiScanTimestamp = v9;
    }
  }
  id v10 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] supportedChannels];
  id v11 = [(W5DiagnosticsManager *)self __only2GHzChannels:v10];
  id v12 = [(W5DiagnosticsManager *)self __occupiedChannelsForScanResults:self->_wifiScanResults supportedChannels:v11 rssiThreshold:-80 ignoreChannel:0];
  id v13 = [(W5DiagnosticsManager *)self __orderedChannelWeights:[(W5DiagnosticsManager *)self __adjust5GHzWeights:[(W5DiagnosticsManager *)self __applyChannelWeights:[(W5DiagnosticsManager *)self __channelWeightsForScanResults:self->_wifiScanResults supportedChannels:v10 rssiThreshold:-80] supportedChannels:v10]]];
  id v14 = [(W5DiagnosticsManager *)self __only2GHz_1_6_11_14_Channels:v13];
  id v15 = [(W5DiagnosticsManager *)self __only5GHz20MHz40MHzChannels:v13];
  id v16 = [(W5DiagnosticsManager *)self __only5GHz40MHzChannels:v15];
  id v17 = [(W5DiagnosticsManager *)self __only5GHzNonDFSChannels:v15];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v18) {
    goto LABEL_13;
  }
  id v19 = v18;
  id v27 = v14;
  id v28 = v16;
  id v29 = v17;
  long long v30 = v5;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = *(void *)v32;
  do
  {
    for (i = 0; i != v19; i = (char *)i + 1)
    {
      if (*(void *)v32 != v22) {
        objc_enumerationMutation(v11);
      }
      v21 += [v12 containsObject:[NSNumber numberWithInteger:objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "channel", v27, v28, v29)]];
    }
    v20 += (uint64_t)v19;
    id v19 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v19);
  float v24 = (float)v21 / (float)v20;
  id v17 = v29;
  id v5 = v30;
  uint64_t v6 = &Apple80211BindToInterface_ptr;
  id v14 = v27;
  id v16 = v28;
  if (v24 > 0.75) {
    [v30 setResult:1];
  }
  else {
LABEL_13:
  }
    [v5 setDidPass:1];
  id v25 = +[NSMutableDictionary dictionary];
  if ([v14 count]) {
    [v25 setObject:[v14 firstObject] forKeyedSubscript:@"2GHzChannel"];
  }
  if ([v15 count]) {
    [v25 setObject:[v15 firstObject] forKeyedSubscript:@"5GHzChannel"];
  }
  if ([v16 count]) {
    [v25 setObject:[v16 firstObject] forKeyedSubscript:@"5GHz40MHzChannel"];
  }
  if ([v17 count]) {
    [v25 setObject:[v17 firstObject] forKeyedSubscript:@"5GHzNonDFSChannel"];
  }
  [v5 setInfo:[v25 copy]];
  [v6[359] timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testCongested5GHzWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:26];
  [v5 setConfiguration:a3];
  uint64_t v6 = &Apple80211BindToInterface_ptr;
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  uint64_t v7 = (uint64_t)[a3[@"MaxScanCacheAge"] integerValue];
  +[NSDate timeIntervalSinceReferenceDate];
  if ((v7 & 0x8000000000000000) == 0)
  {
    double v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
      self->_wifiScanTimestamp = v9;
    }
  }
  id v10 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] supportedChannels];
  id v11 = [(W5DiagnosticsManager *)self __only5GHzChannels:v10];
  id v12 = [(W5DiagnosticsManager *)self __occupiedChannelsForScanResults:self->_wifiScanResults supportedChannels:v11 rssiThreshold:-80 ignoreChannel:0];
  id v13 = [(W5DiagnosticsManager *)self __orderedChannelWeights:[(W5DiagnosticsManager *)self __adjust5GHzWeights:[(W5DiagnosticsManager *)self __applyChannelWeights:[(W5DiagnosticsManager *)self __channelWeightsForScanResults:self->_wifiScanResults supportedChannels:v10 rssiThreshold:-80] supportedChannels:v10]]];
  id v14 = [(W5DiagnosticsManager *)self __only2GHz_1_6_11_14_Channels:v13];
  id v15 = [(W5DiagnosticsManager *)self __only5GHz20MHz40MHzChannels:v13];
  id v16 = [(W5DiagnosticsManager *)self __only5GHz40MHzChannels:v15];
  id v17 = [(W5DiagnosticsManager *)self __only5GHzNonDFSChannels:v15];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v18) {
    goto LABEL_13;
  }
  id v19 = v18;
  id v27 = v14;
  id v28 = v16;
  id v29 = v17;
  long long v30 = v5;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = *(void *)v32;
  do
  {
    for (i = 0; i != v19; i = (char *)i + 1)
    {
      if (*(void *)v32 != v22) {
        objc_enumerationMutation(v11);
      }
      v21 += [v12 containsObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "channel", v27, v28, v29))]];
    }
    v20 += (uint64_t)v19;
    id v19 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v19);
  float v24 = (float)v21 / (float)v20;
  id v17 = v29;
  id v5 = v30;
  uint64_t v6 = &Apple80211BindToInterface_ptr;
  id v14 = v27;
  id v16 = v28;
  if (v24 > 0.75) {
    [v30 setResult:1];
  }
  else {
LABEL_13:
  }
    [v5 setDidPass:1];
  id v25 = +[NSMutableDictionary dictionary];
  if ([v14 count]) {
    [v25 setObject:[v14 firstObject] forKeyedSubscript:@"2GHzChannel"];
  }
  if ([v15 count]) {
    [v25 setObject:[v15 firstObject] forKeyedSubscript:@"5GHzChannel"];
  }
  if ([v16 count]) {
    [v25 setObject:[v16 firstObject] forKeyedSubscript:@"5GHz40MHzChannel"];
  }
  if ([v17 count]) {
    [v25 setObject:[v17 firstObject] forKeyedSubscript:@"5GHzNonDFSChannel"];
  }
  [v5 setInfo:[v25 copy]];
  [v6[359] timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testHT402GHzWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:27];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  uint64_t v6 = [(uint64_t)[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
  +[NSDate timeIntervalSinceReferenceDate];
  if ((v6 & 0x8000000000000000) == 0)
  {
    double v8 = v7;
    if (v7 - self->_wifiScanTimestamp > (double)v6)
    {

      self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
      self->_wifiScanTimestamp = v8;
    }
  }
  id v9 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v11 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(wifiScanResults);
        }
        id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(objc_msgSend(v15, "channel"), "flags") & 8) != 0
          && (objc_msgSend(objc_msgSend(v15, "channel"), "flags") & 4) != 0)
        {
          [v9 addObject:v15];
        }
      }
      id v12 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }
  id v16 = +[NSMutableDictionary dictionary];
  if ([v9 count])
  {
    [v5 setResult:1];
    [v16 setObject:[v9 copy] forKeyedSubscript:@"ScanResults"];
  }
  else
  {
    [v5 setDidPass:1];
  }
  id v17 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] supportedChannels];
  id v18 = [(W5DiagnosticsManager *)self __orderedChannelWeights:[(W5DiagnosticsManager *)self __adjust5GHzWeights:[(W5DiagnosticsManager *)self __applyChannelWeights:[(W5DiagnosticsManager *)self __channelWeightsForScanResults:self->_wifiScanResults supportedChannels:v17 rssiThreshold:-80] supportedChannels:v17]]];
  id v19 = [(W5DiagnosticsManager *)self __only2GHz_1_6_11_14_Channels:v18];
  id v20 = [(W5DiagnosticsManager *)self __only5GHz20MHz40MHzChannels:v18];
  id v21 = [(W5DiagnosticsManager *)self __only5GHz40MHzChannels:v20];
  id v22 = [(W5DiagnosticsManager *)self __only5GHzNonDFSChannels:v20];
  if ([v19 count]) {
    [v16 setObject:[v19 firstObject] forKeyedSubscript:@"2GHzChannel"];
  }
  if ([v20 count]) {
    [v16 setObject:[v20 firstObject] forKeyedSubscript:@"5GHzChannel"];
  }
  if ([v21 count]) {
    [v16 setObject:[v21 firstObject] forKeyedSubscript:@"5GHz40MHzChannel"];
  }
  if ([v22 count]) {
    [v16 setObject:[v22 firstObject] forKeyedSubscript:@"5GHzNonDFSChannel"];
  }
  [v5 setInfo:[v16 copy]];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testNoSecurityWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:38];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = [(uint64_t)[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
    +[NSDate timeIntervalSinceReferenceDate];
    if ((v8 & 0x8000000000000000) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
        self->_wifiScanTimestamp = v10;
      }
    }
    id v11 = [(W5DiagnosticsManager *)self __scanResultWithNetworkName:v7];
    if (v11)
    {
      id v12 = v11;
      id v13 = [v11 strongestSupportedSecurity];
      if (v13) {
        [v5 setDidPass:1];
      }
      else {
        [v5 setResult:1];
      }
      v21[0] = @"ScanResult";
      v21[1] = @"Security";
      v22[0] = v12;
      v22[1] = +[NSNumber numberWithInteger:v13];
      id v15 = (NSNumber **)v22;
      id v16 = (const __CFString **)v21;
      uint64_t v17 = 2;
LABEL_15:
      [v5 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v16, v17)];
    }
  }
  else if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    int64_t v14 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] security];
    if (v14) {
      [v5 setDidPass:1];
    }
    else {
      [v5 setResult:1];
    }
    CFStringRef v19 = @"Security";
    id v20 = +[NSNumber numberWithInteger:v14];
    id v15 = &v20;
    id v16 = &v19;
    uint64_t v17 = 1;
    goto LABEL_15;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testLegacySecurityWEPWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:39];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = [(uint64_t)[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
    +[NSDate timeIntervalSinceReferenceDate];
    if ((v8 & 0x8000000000000000) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
        self->_wifiScanTimestamp = v10;
      }
    }
    id v11 = [(W5DiagnosticsManager *)self __scanResultWithNetworkName:v7];
    if (v11)
    {
      id v12 = v11;
      id v13 = [v11 supportedSecurityTypes];
      if (([v13 containsObject:&off_1000EAE28] & 1) != 0
        || ([v13 containsObject:&off_1000EAE40] & 1) != 0
        || [v12 supportsWEPCipher])
      {
        [v5 setResult:1];
      }
      else
      {
        [v5 setDidPass:1];
      }
      v22[0] = @"ScanResult";
      v22[1] = @"Security";
      v23[0] = v12;
      v23[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 strongestSupportedSecurity]);
      int64_t v14 = (NSNumber **)v23;
      id v15 = (const __CFString **)v22;
      uint64_t v16 = 2;
LABEL_17:
      [v5 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v15, v16)];
    }
  }
  else if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    int64_t v17 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] security];
    id v18 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] currentNetwork];
    if (v17 == 1 || v17 == 8 || [v18 supportsWEPCipher]) {
      [v5 setResult:1];
    }
    else {
      [v5 setDidPass:1];
    }
    CFStringRef v20 = @"Security";
    id v21 = +[NSNumber numberWithInteger:v17];
    int64_t v14 = &v21;
    id v15 = &v20;
    uint64_t v16 = 1;
    goto LABEL_17;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testLegacySecurityWPAWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:40];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (uint64_t)[[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
    +[NSDate timeIntervalSinceReferenceDate];
    if ((v8 & 0x8000000000000000) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
        self->_wifiScanTimestamp = v10;
      }
    }
    id v11 = [(W5DiagnosticsManager *)self __scanResultWithNetworkName:v7];
    if (v11)
    {
      id v12 = v11;
      id v13 = [v11 supportedSecurityTypes];
      if (([v13 containsObject:&off_1000EAE58] & 1) != 0
        || ([v13 containsObject:&off_1000EAE70] & 1) != 0
        || [v12 supportsTKIPCipher])
      {
        [v5 setResult:1];
      }
      else
      {
        [v5 setDidPass:1];
      }
      v22[0] = @"ScanResult";
      v22[1] = @"Security";
      v23[0] = v12;
      v23[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 strongestSupportedSecurity]);
      int64_t v14 = (NSNumber **)v23;
      id v15 = (const __CFString **)v22;
      uint64_t v16 = 2;
LABEL_16:
      [v5 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v15, v16)];
    }
  }
  else if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    unint64_t v17 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] security];
    id v18 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] currentNetwork];
    if (v17 <= 0xA && ((1 << v17) & 0x60C) != 0 || [v18 supportsTKIPCipher]) {
      [v5 setResult:1];
    }
    else {
      [v5 setDidPass:1];
    }
    CFStringRef v20 = @"Security";
    id v21 = +[NSNumber numberWithInteger:v17];
    int64_t v14 = &v21;
    id v15 = &v20;
    uint64_t v16 = 1;
    goto LABEL_16;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testLegacyRates11bWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:41];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (uint64_t)[a3 objectForKeyedSubscript:@"MaxScanCacheAge"].integerValue;
    +[NSDate timeIntervalSinceReferenceDate];
    if ((v8 & 0x8000000000000000) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
        self->_wifiScanTimestamp = v10;
      }
    }
    id v11 = [(W5DiagnosticsManager *)self __scanResultWithNetworkName:v7];
    if (v11)
    {
      id v12 = v11;
      if ([v11 fastestSupportedPHYMode] == 4) {
        [v5 setResult:1];
      }
      else {
        [v5 setDidPass:1];
      }
      CFStringRef v14 = @"ScanResult";
      id v15 = v12;
      [v5 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)];
    }
  }
  else if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] PHYMode] == 4) {
      [v5 setResult:1];
    }
    else {
      [v5 setDidPass:1];
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testAirPortBaseStationWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:33];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (uint64_t)[a3 objectForKeyedSubscript:@"MaxScanCacheAge"].integerValue;
    +[NSDate timeIntervalSinceReferenceDate];
    if ((v8 & 0x8000000000000000) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
        self->_wifiScanTimestamp = v10;
      }
    }
    id v11 = [(W5DiagnosticsManager *)self __scanResultWithNetworkName:v7];
  }
  else
  {
    id v11 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] currentNetwork];
  }
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 airPortBaseStationModelName];
    if (v13)
    {
      id v14 = v13;
      [v5 setDidPass:1];
      [v5 setResult:1];
      v16[0] = @"ScanResult";
      v16[1] = @"AirPortModelName";
      v17[0] = v12;
      v17[1] = v14;
      [v5 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2)];
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testiOSPersonalHotspotWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:44];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (!v6)
  {
    id v11 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] currentNetwork];
    if (!v11) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  id v7 = v6;
  uint64_t v8 = [(uint64_t)[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
  +[NSDate timeIntervalSinceReferenceDate];
  if ((v8 & 0x8000000000000000) == 0)
  {
    double v10 = v9;
    if (v9 - self->_wifiScanTimestamp > (double)v8)
    {

      self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
      self->_wifiScanTimestamp = v10;
    }
  }
  id v11 = [(W5DiagnosticsManager *)self __scanResultWithNetworkName:v7];
  if (v11)
  {
LABEL_8:
    if ([v11 isPersonalHotspot]) {
      [v5 setResult:1];
    }
    else {
      [v5 setDidPass:1];
    }
  }
LABEL_11:
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testPasspointWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:45];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (!v6)
  {
    if (![(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] currentNetwork]) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  id v7 = v6;
  uint64_t v8 = (uint64_t)[[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
  +[NSDate timeIntervalSinceReferenceDate];
  if ((v8 & 0x8000000000000000) == 0)
  {
    double v10 = v9;
    if (v9 - self->_wifiScanTimestamp > (double)v8)
    {

      self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
      self->_wifiScanTimestamp = v10;
    }
  }
  if ([(W5DiagnosticsManager *)self __scanResultWithNetworkName:v7])
  {
LABEL_8:
    if ([-[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork") isPasspoint])[v5 setResult:1]; {
    else
    }
      [v5 setDidPass:1];
  }
LABEL_11:
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (BOOL)__isDefaultCountryCode:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 lowercaseString];

  return [&off_1000EFF00 containsObject:v3];
}

- (id)__testConflictingCountryCodeWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:28];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  id v21 = v5;
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  uint64_t v7 = [[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
  +[NSDate timeIntervalSinceReferenceDate];
  if ((v7 & 0x8000000000000000) == 0)
  {
    double v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
      self->_wifiScanTimestamp = v9;
    }
  }
  id v10 = [[-[CWFInterface countryCode](-[W5StatusManager corewifi](self->_status, "corewifi"), "countryCode") stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")] lowercaseString];
  id v11 = +[NSMutableArray array];
  if (![(W5DiagnosticsManager *)self __isDefaultCountryCode:v10])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    wifiScanResults = self->_wifiScanResults;
    id v13 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(wifiScanResults);
          }
          unint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v18 = [[[objc_msgSend(objc_msgSend(v17, "countryCode"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")) lowercaseString];
          if (v10
            && v18
            && ([v18 isEqualToString:v10] & 1) == 0
            && (!v6 || objc_msgSend(objc_msgSend(v17, "ssidString"), "isEqualToString:", v6))
            && ([v11 containsObject:v17] & 1) == 0)
          {
            [v11 addObject:v17];
          }
        }
        id v14 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }
  }
  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  if (v10) {
    [v19 setObject:objc_msgSend(v10, "copy") forKeyedSubscript:@"AdoptedCountryCode"];
  }
  if ([v11 count])
  {
    [v21 setResult:1];
    [v19 setObject:[v11 copy] forKeyedSubscript:@"ScanResults"];
  }
  else
  {
    [v21 setDidPass:1];
  }
  if (objc_msgSend(objc_msgSend(v19, "allKeys"), "count")) {
    [v21 setInfo:v19];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v21 setTestCompleted:];
  return v21;
}

- (id)__testConflictingSecurityTypePNLWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:29];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  long long v33 = v5;
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  uint64_t v7 = [(uint64_t)[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
  +[NSDate timeIntervalSinceReferenceDate];
  if ((v7 & 0x8000000000000000) == 0)
  {
    double v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
      self->_wifiScanTimestamp = v9;
    }
  }
  id v10 = +[NSMutableArray array];
  id v11 = +[NSMutableArray array];
  id v12 = +[NSMutableDictionary dictionary];
  id v13 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v14 = [[a3 objectForKeyedSubscript:@"UseCachedPNL"] boolValue];
  uint64_t v15 = [(W5StatusManager *)self->_status wifi];
  if (v14) {
    id v16 = v13;
  }
  else {
    id v16 = 0;
  }
  id v17 = [(W5WiFiInterface *)v15 cachedPreferredNetworksListWithUUID:v16];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v18 = [v17 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v39;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v22 ssidString]
          && (!v6 || objc_msgSend(objc_msgSend(v22, "ssidString"), "isEqualToString:", v6)))
        {
          [v12 setObject:v22 forKeyedSubscript:[v22 ssidString]];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v19);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v24 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v35;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(wifiScanResults);
        }
        id v28 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
        id v29 = [v12 objectForKeyedSubscript:objc_msgSend(v28, "ssidString")];
        if (v29)
        {
          id v30 = v29;
          if ((objc_msgSend(v28, "supportsSecurity:", objc_msgSend(v29, "security")) & 1) == 0)
          {
            if (([v10 containsObject:v28] & 1) == 0) {
              [v10 addObject:v28];
            }
            if (([v11 containsObject:v30] & 1) == 0) {
              [v11 addObject:v30];
            }
          }
        }
      }
      id v25 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v25);
  }
  if ([v11 count])
  {
    [v33 setResult:1];
    v42[0] = @"ScanResults";
    id v31 = [v10 copy];
    v42[1] = @"PreferredNetworks";
    v43[0] = v31;
    v43[1] = [v11 copy];
    [v33 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2)];
  }
  else
  {
    [v33 setDidPass:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v33 setTestCompleted:];
  return v33;
}

- (id)__testCaptivePortalWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:46];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6) {
    id v7 = [(W5DiagnosticsManager *)self __preferredNetworkWithNetworkName:v6 configuration:a3];
  }
  else {
    id v7 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] currentPreferredNetwork];
  }
  id v8 = v7;
  if (v7)
  {
    if ([v7 isCaptive]) {
      [v5 setResult:1];
    }
    else {
      [v5 setDidPass:1];
    }
    CFStringRef v10 = @"PreferredNetwork";
    id v11 = v8;
    [v5 setInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testAWDLRealtimeWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:22];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v7 = [[a3 objectForKeyedSubscript:@"UseCachedStatus"] BOOLValue];
  status = self->_status;
  if (v7) {
    id v9 = [[-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6) awdl];
  }
  else {
    id v9 = [(W5StatusManager *)status awdlStatus];
  }
  CFStringRef v10 = v9;
  if ([v9 awdlStrategy]
    && *((_DWORD *)objc_msgSend(objc_msgSend(v10, "awdlStrategy"), "bytes") + 2) == 9)
  {
    [v5 setResult:1];
  }
  else
  {
    [v5 setDidPass:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testAWDLEnabledWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:21];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v7 = [[a3 objectForKeyedSubscript:@"UseCachedStatus"] boolValue];
  status = self->_status;
  if (v7) {
    id v9 = [[-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6) awdl];
  }
  else {
    id v9 = [(W5StatusManager *)status awdlStatus];
  }
  CFStringRef v10 = v9;
  if ([v9 awdlSyncEnabled]
    && *((_DWORD *)objc_msgSend(objc_msgSend(v10, "awdlSyncEnabled"), "bytes") + 2))
  {
    [v5 setResult:1];
  }
  else
  {
    [v5 setDidPass:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testBTCoexWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:20];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v7 = [[a3 objectForKeyedSubscript:@"UseCachedStatus"] BOOLValue];
  status = self->_status;
  if (v7) {
    id v9 = [[-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6) wifi];
  }
  else {
    id v9 = [(W5StatusManager *)status wifiStatus];
  }
  if ([v9 btcMode] == 7) {
    [v5 setResult:1];
  }
  else {
    [v5 setDidPass:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testHighBTConnectedWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:19];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v7 = [[a3 objectForKeyedSubscript:@"UseCachedStatus"] boolValue];
  status = self->_status;
  if (v7) {
    id v9 = [[-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6) bluetooth];
  }
  else {
    id v9 = [(W5StatusManager *)status bluetoothStatus];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [v9 devices];
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (!v11)
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
LABEL_14:
    [v5 setDidPass:1];
    goto LABEL_15;
  }
  id v12 = v11;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)v21;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v21 != v15) {
        objc_enumerationMutation(v10);
      }
      id v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      v13 += [v17 isConnected];
      v14 += [v17 isAppleDevice];
    }
    id v12 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
  }
  while (v12);
  if (v13 < 1) {
    goto LABEL_14;
  }
  [v5 setResult:1];
LABEL_15:
  v24[0] = @"BTConnectedCount";
  id v18 = +[NSNumber numberWithInteger:v13];
  v24[1] = @"BTAppleDeviceConnectedCount";
  v25[0] = v18;
  v25[1] = +[NSNumber numberWithInteger:v14];
  [v5 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2)];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testHighBTPairedWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:18];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v7 = [[a3 objectForKeyedSubscript:@"UseCachedStatus"] BOOLValue];
  status = self->_status;
  if (v7) {
    id v9 = [[-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6) bluetooth];
  }
  else {
    id v9 = [(W5StatusManager *)status bluetoothStatus];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = [v9 devices];
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (!v11)
  {
    uint64_t v13 = 0;
LABEL_17:
    [v5 setDidPass:1];
    goto LABEL_18;
  }
  id v12 = v11;
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)v19;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v19 != v14) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if (([v16 isPaired] & 1) != 0 || objc_msgSend(v16, "isCloudPaired")) {
        ++v13;
      }
    }
    id v12 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
  }
  while (v12);
  if (v13 < 1) {
    goto LABEL_17;
  }
  [v5 setResult:1];
LABEL_18:
  CFStringRef v22 = @"BTPairedCount";
  long long v23 = +[NSNumber numberWithInteger:v13];
  [v5 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1)];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testLargePNLWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:47];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  LODWORD(a3) = [[objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"UseCachedPNL")) BOOLValue];
  unsigned int v7 = [(W5StatusManager *)self->_status wifi];
  if (a3) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = [[-[W5WiFiInterface cachedPreferredNetworksListWithUUID:](v7, "cachedPreferredNetworksListWithUUID:", v8) count];
  if ((unint64_t)v9 < 0xA) {
    [v5 setDidPass:1];
  }
  else {
    [v5 setResult:1];
  }
  CFStringRef v11 = @"PNLCount";
  id v12 = +[NSNumber numberWithUnsignedInteger:v9];
  [v5 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testLongBeaconIntervalWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:34];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = [[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
    +[NSDate timeIntervalSinceReferenceDate];
    if ((v8 & 0x8000000000000000) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
        self->_wifiScanTimestamp = v10;
      }
    }
    id v11 = [(W5DiagnosticsManager *)self __scanResultWithNetworkName:v7];
  }
  else
  {
    id v11 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] currentNetwork];
  }
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 beaconInterval];
    if (v13 == (id)100) {
      [v5 setDidPass:1];
    }
    else {
      [v5 setResult:1];
    }
    v15[0] = @"ScanResult";
    v15[1] = @"BeaconInterval";
    v16[0] = v12;
    v16[1] = +[NSNumber numberWithInteger:v13];
    [v5 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testLongDTIMInterval
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:35];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    id v4 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] DTIMInterval];
    if (v4 == (id)3) {
      [v3 setDidPass:1];
    }
    else {
      [v3 setResult:1];
    }
    CFStringRef v6 = @"DTIMInterval";
    id v7 = +[NSNumber numberWithUnsignedInteger:v4];
    [v3 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1)]];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testConflictingPHYMode11acWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:36];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  uint64_t v7 = [(uint64_t)[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
  +[NSDate timeIntervalSinceReferenceDate];
  if ((v7 & 0x8000000000000000) == 0)
  {
    double v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
      self->_wifiScanTimestamp = v9;
    }
  }
  id v10 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] supportedPHYModes];
  if ((v10 & 0x80) != 0)
  {
    [v5 setDidPass:1];
    CFStringRef v27 = @"SupportedPHYModes";
    id v28 = +[NSNumber numberWithUnsignedInt:v10];
    long long v19 = &v28;
    long long v20 = &v27;
LABEL_22:
    uint64_t v21 = 1;
    goto LABEL_23;
  }
  id v11 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v13 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(wifiScanResults);
        }
        id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v17 supportsPHYMode:128]
          && ([v17 supportsPHYMode:16] & 1) == 0
          && (!v6 || objc_msgSend(objc_msgSend(v17, "ssidString"), "isEqualToString:", v6))
          && ([v11 containsObject:v17] & 1) == 0)
        {
          [v11 addObject:v17];
        }
      }
      id v14 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v14);
  }
  if (![v11 count])
  {
    [v5 setDidPass:1];
    CFStringRef v29 = @"SupportedPHYModes";
    id v30 = +[NSNumber numberWithUnsignedInt:v10];
    long long v19 = &v30;
    long long v20 = &v29;
    goto LABEL_22;
  }
  [v5 setResult:1];
  v31[0] = @"SupportedPHYModes";
  long long v18 = +[NSNumber numberWithUnsignedInt:v10];
  v31[1] = @"ScanResults";
  v32[0] = v18;
  v32[1] = [v11 copy];
  long long v19 = (NSNumber **)v32;
  long long v20 = (const __CFString **)v31;
  uint64_t v21 = 2;
LABEL_23:
  [v5 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v20, v21)]];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testConflictingPHYMode11nWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:37];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  uint64_t v7 = [(uint64_t)[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
  +[NSDate timeIntervalSinceReferenceDate];
  if ((v7 & 0x8000000000000000) == 0)
  {
    double v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
      self->_wifiScanTimestamp = v9;
    }
  }
  id v10 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] supportedPHYModes];
  if ((v10 & 0x10) != 0)
  {
    [v5 setDidPass:1];
    CFStringRef v27 = @"SupportedPHYModes";
    id v28 = +[NSNumber numberWithUnsignedInt:v10];
    long long v19 = &v28;
    long long v20 = &v27;
LABEL_23:
    uint64_t v21 = 1;
    goto LABEL_24;
  }
  id v11 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v13 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(wifiScanResults);
        }
        id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v17 supportsPHYMode:16]
          && ([v17 supportsPHYMode:2] & 1) == 0
          && ([v17 supportsPHYMode:8] & 1) == 0
          && (!v6 || objc_msgSend(objc_msgSend(v17, "ssidString"), "isEqualToString:", v6))
          && ([v11 containsObject:v17] & 1) == 0)
        {
          [v11 addObject:v17];
        }
      }
      id v14 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v14);
  }
  if (![v11 count])
  {
    [v5 setDidPass:1];
    CFStringRef v29 = @"SupportedPHYModes";
    id v30 = +[NSNumber numberWithUnsignedInt:v10];
    long long v19 = &v30;
    long long v20 = &v29;
    goto LABEL_23;
  }
  [v5 setResult:1];
  v31[0] = @"SupportedPHYModes";
  long long v18 = +[NSNumber numberWithUnsignedInt:v10];
  v31[1] = @"ScanResults";
  v32[0] = v18;
  v32[1] = [v11 copy];
  long long v19 = (NSNumber **)v32;
  long long v20 = (const __CFString **)v31;
  uint64_t v21 = 2;
LABEL_24:
  [v5 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v20, v21)];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testPoorSignalWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:32];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = [(uint64_t)[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
    +[NSDate timeIntervalSinceReferenceDate];
    if ((v8 & 0x8000000000000000) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
        self->_wifiScanTimestamp = v10;
      }
    }
    id v11 = [(W5DiagnosticsManager *)self __scanResultWithNetworkName:v7];
    uint64_t v12 = (uint64_t)[v11 rssi];
    id v13 = [v11 noise];
    id v14 = v13;
    if (v12 < -70 || v12 - (uint64_t)v13 <= 9) {
      [v5 setResult:1];
    }
    else {
      [v5 setDidPass:1];
    }
    v23[0] = @"RSSI";
    v23[1] = @"Noise";
    v24[0] = +[NSNumber numberWithInteger:v12];
    v24[1] = +[NSNumber numberWithInteger:v14];
    long long v18 = (NSDictionary *)[+[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2] mutableCopy];
    long long v19 = v18;
    if (v11) {
      [(NSDictionary *)v18 setObject:v11 forKeyedSubscript:@"ScanResult"];
    }
    goto LABEL_17;
  }
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID])
  {
    uint64_t v15 = (uint64_t)[(CWFInterface *)[(W5StatusManager *)self->_status corewifi] RSSI];
    id v16 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] noise];
    id v17 = v16;
    if (v15 < -70 || v15 - (uint64_t)v16 <= 9) {
      [v5 setResult:1];
    }
    else {
      [v5 setDidPass:1];
    }
    v21[0] = @"RSSI";
    v21[1] = @"Noise";
    v22[0] = +[NSNumber numberWithInteger:v15];
    v22[1] = +[NSNumber numberWithInteger:v17];
    long long v19 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
LABEL_17:
    [v5 setInfo:v19];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testPNLContainsHiddenWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:48];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = +[NSMutableArray array];
  id v7 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  LODWORD(a3) = [[objc_msgSend(a3, "objectForKeyedSubscript:", @"UseCachedPNL") BOOLValue];
  uint64_t v8 = [(W5StatusManager *)self->_status wifi];
  if (a3) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  id v10 = [(W5WiFiInterface *)v8 cachedPreferredNetworksListWithUUID:v9];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
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
        uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v15 isHidden]) {
          [v6 addObject:v15];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v12);
  }
  if ([v6 count])
  {
    [v5 setResult:1];
    CFStringRef v21 = @"PreferredNetworks";
    id v22 = [v6 copy];
    [v5 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1)];
  }
  else
  {
    [v5 setDidPass:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__preferredNetworkWithNetworkName:(id)a3 configuration:(id)a4
{
  id v4 = a4;
  id v7 = [a4 objectForKeyedSubscript:@"InternalUUID"];
  LODWORD(v4) = [[objc_msgSend(v4, "objectForKeyedSubscript:", @"UseCachedPNL") boolValue];
  uint64_t v8 = [(W5StatusManager *)self->_status wifi];
  if (v4) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  id v10 = [(W5WiFiInterface *)v8 cachedPreferredNetworksListWithUUID:v9];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v11) {
    return 0;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v18;
LABEL_6:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v18 != v13) {
      objc_enumerationMutation(v10);
    }
    uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
    if (objc_msgSend(objc_msgSend(v15, "ssidString"), "isEqualToString:", a3)) {
      return v15;
    }
    if (v12 == (id)++v14)
    {
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        goto LABEL_6;
      }
      return 0;
    }
  }
}

- (id)__scanResultWithNetworkName:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v5 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  id v7 = 0;
  uint64_t v8 = *(void *)v14;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(wifiScanResults);
      }
      id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      if (objc_msgSend(objc_msgSend(v10, "ssidString"), "isEqualToString:", a3))
      {
        if (!v7 || (id v11 = [v10 rssi], (uint64_t)v11 > (uint64_t)objc_msgSend(v7, "rssi"))) {
          id v7 = v10;
        }
      }
    }
    id v6 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v6);
  return v7;
}

- (id)__testHiddenNetworkWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:43];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6) {
    id v7 = [(W5DiagnosticsManager *)self __preferredNetworkWithNetworkName:v6 configuration:a3];
  }
  else {
    id v7 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] currentPreferredNetwork];
  }
  if ([v7 isHidden]) {
    [v5 setResult:1];
  }
  else {
    [v5 setDidPass:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testAmbiguousNetworkNameWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:42];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6
    || (id v6 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] networkName]) != 0)
  {
    if ([+[W5DiagnosticsManager __ambiguousSSIDs](W5DiagnosticsManager, "__ambiguousSSIDs") containsObject:v6])[v5 setResult:1]; {
    else
    }
      [v5 setDidPass:1];
    CFStringRef v8 = @"NetworkName";
    id v9 = v6;
    [v5 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1)];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testWiFiHiddenScanResultsWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:30];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  uint64_t v6 = (uint64_t)[[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
  +[NSDate timeIntervalSinceReferenceDate];
  if ((v6 & 0x8000000000000000) == 0)
  {
    double v8 = v7;
    if (v7 - self->_wifiScanTimestamp > (double)v6)
    {

      self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
      self->_wifiScanTimestamp = v8;
    }
  }
  id v9 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v11 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(wifiScanResults);
        }
        long long v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (![v15 ssid]) {
          [v9 addObject:v15];
        }
      }
      id v12 = [(NSArray *)wifiScanResults countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v12);
  }
  if ([v9 count])
  {
    [v5 setResult:1];
    CFStringRef v21 = @"ScanResults";
    id v22 = [v9 copy];
    [v5 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1)];
  }
  else
  {
    [v5 setDidPass:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testWiFiNoScanResultsWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:31];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  uint64_t v6 = (uint64_t)[a3 objectForKeyedSubscript:@"MaxScanCacheAge"] integerValue];
  +[NSDate timeIntervalSinceReferenceDate];
  if ((v6 & 0x8000000000000000) == 0)
  {
    double v8 = v7;
    if (v7 - self->_wifiScanTimestamp > (double)v6)
    {

      self->_wifiScanResults = (NSArray *)[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] performScanOnChannels:0 translate:1];
      self->_wifiScanTimestamp = v8;
    }
  }
  if ([(NSArray *)self->_wifiScanResults count]) {
    [v5 setDidPass:1];
  }
  else {
    [v5 setResult:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__downloadSpeedtestWithFileSize:(int)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x3052000000;
  long long v38 = sub_10003C5C4;
  long long v39 = sub_10003C5D4;
  uint64_t v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3052000000;
  long long v32 = sub_10003C5C4;
  long long v33 = sub_10003C5D4;
  uint64_t v34 = 0;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  if (sub_10004B254())
  {
    id v8 = [(id)sub_100045224() defaultConfiguration];
    [v8 setInterfaceType:1];
    [v8 setDownloadSize:v7];
    [v8 setCollectMetadata:0];
    id v9 = [(id)sub_100045314() performanceTestWithConfiguration:v8];
    if (v9)
    {
      id v10 = objc_alloc_init((Class)NSLock);
      id v11 = dispatch_semaphore_create(0);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100045404;
      v20[3] = &unk_1000DE7B0;
      v20[6] = &v25;
      v20[7] = &v21;
      v20[8] = &v35;
      v20[9] = &v29;
      v20[4] = v10;
      v20[5] = v11;
      [v9 startDownloadWithCompletion:v20];
      dispatch_time_t v12 = dispatch_time(0, 1000000000 * a4);
      if (dispatch_semaphore_wait(v11, v12))
      {
        [v10 lock];
        if (!*((unsigned char *)v22 + 24))
        {
          *((unsigned char *)v26 + 24) = 1;
          NSErrorUserInfoKey v45 = NSLocalizedFailureReasonErrorKey;
          CFStringRef v46 = @"W5TimeoutErr";
          uint64_t v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 3, +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1]);
          v30[5] = (uint64_t)v13;
        }
        [v10 unlock];
      }
      id v14 = (id)v30[5];
      id v15 = (id)v36[5];
      if (a5)
      {
        long long v16 = (void *)v30[5];
        if (v16)
        {
          long long v17 = (NSError *)[v16 copy];
LABEL_14:
          *a5 = v17;
        }
      }
    }
    else if (a5)
    {
      NSErrorUserInfoKey v43 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v44 = @"W5NotSupportedErr";
      long long v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 4, +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1]);
      goto LABEL_14;
    }
  }
  else if (a5)
  {
    NSErrorUserInfoKey v41 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v42 = @"W5NotSupportedErr";
    long long v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 4, +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1]);
    goto LABEL_14;
  }
  id v18 = [(id)v36[5] copy];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v18;
}

- (id)__uploadSpeedtestWithFileSize:(int)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x3052000000;
  long long v38 = sub_10003C5C4;
  long long v39 = sub_10003C5D4;
  uint64_t v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3052000000;
  long long v32 = sub_10003C5C4;
  long long v33 = sub_10003C5D4;
  uint64_t v34 = 0;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  if (sub_10004B254())
  {
    id v8 = [(id)sub_100045224() defaultConfiguration];
    [v8 setInterfaceType:1];
    [v8 setUploadSize:v7];
    [v8 setCollectMetadata:0];
    id v9 = [(id)sub_100045314() performanceTestWithConfiguration:v8];
    if (v9)
    {
      id v10 = objc_alloc_init((Class)NSLock);
      id v11 = dispatch_semaphore_create(0);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000458B0;
      v20[3] = &unk_1000DE7B0;
      v20[6] = &v25;
      v20[7] = &v21;
      v20[8] = &v35;
      v20[9] = &v29;
      v20[4] = v10;
      v20[5] = v11;
      [v9 startUploadWithCompletion:v20];
      dispatch_time_t v12 = dispatch_time(0, 1000000000 * a4);
      if (dispatch_semaphore_wait(v11, v12))
      {
        [v10 lock];
        if (!*((unsigned char *)v22 + 24))
        {
          *((unsigned char *)v26 + 24) = 1;
          NSErrorUserInfoKey v45 = NSLocalizedFailureReasonErrorKey;
          CFStringRef v46 = @"W5TimeoutErr";
          uint64_t v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 3, +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1]);
          v30[5] = (uint64_t)v13;
        }
        [v10 unlock];
      }
      id v14 = (id)v30[5];
      id v15 = (id)v36[5];
      if (a5)
      {
        long long v16 = (void *)v30[5];
        if (v16)
        {
          long long v17 = (NSError *)[v16 copy];
LABEL_14:
          *a5 = v17;
        }
      }
    }
    else if (a5)
    {
      NSErrorUserInfoKey v43 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v44 = @"W5NotSupportedErr";
      long long v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 4, +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1]);
      goto LABEL_14;
    }
  }
  else if (a5)
  {
    NSErrorUserInfoKey v41 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v42 = @"W5NotSupportedErr";
    long long v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 4, +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1]);
    goto LABEL_14;
  }
  id v18 = [(id)v36[5] copy];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v18;
}

- (id)__testDownloadSpeedWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:49];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  uint64_t v6 = (_UNKNOWN **)[a3 objectForKeyedSubscript:@"SpeedTestFileSizes"];
  id v7 = [a3 objectForKeyedSubscript:@"SpeedTestTimeout"];
  if (v7) {
    uint64_t v8 = (uint64_t)[v7 unsignedIntegerValue];
  }
  else {
    uint64_t v8 = 5;
  }
  uint64_t v16 = 0;
  if (!v6) {
    uint64_t v6 = &off_1000EFF18;
  }
  if (objc_msgSend(v6, "count", v16))
  {
    unint64_t v9 = 1;
    while (1)
    {
      id v10 = [[-[W5DiagnosticsManager __downloadSpeedtestWithFileSize:timeout:error:](self, "__downloadSpeedtestWithFileSize:timeout:error:", objc_msgSend(objc_msgSend(v6, "objectAtIndexedSubscript:", v9 - 1), "unsignedIntValue"), v8, &v16);
      if (!v10) {
        break;
      }
      id v11 = v10;
      id v12 = [v10 fileSize];
      [v11 speed];
      double v14 = v13;
      if (v9 < (unint64_t)[v6 count])
      {
        ++v9;
        if ((double)(unint64_t)(8 * (void)v12) / (v14 * 1000000.0) <= 1.0) {
          continue;
        }
      }
      [v5 setDidPass:1];
      [v5 setResult:1];
      CFStringRef v17 = @"Mbps";
      [v11 speed];
      id v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v5 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)];
      break;
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testUploadSpeedWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:50];
  [v5 setConfiguration:a3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  uint64_t v6 = (_UNKNOWN **)[a3 objectForKeyedSubscript:@"SpeedTestFileSizes"];
  id v7 = [a3 objectForKeyedSubscript:@"SpeedTestTimeout"];
  if (v7) {
    uint64_t v8 = (uint64_t)[v7 unsignedIntegerValue];
  }
  else {
    uint64_t v8 = 5;
  }
  uint64_t v16 = 0;
  if (!v6) {
    uint64_t v6 = &off_1000EFF30;
  }
  if (objc_msgSend(v6, "count", v16))
  {
    unint64_t v9 = 1;
    while (1)
    {
      id v10 = [[-[W5DiagnosticsManager __uploadSpeedtestWithFileSize:timeout:error:](self, "__uploadSpeedtestWithFileSize:timeout:error:", [v6 objectAtIndexedSubscript:v9 - 1], v8, &v16);
      if (!v10) {
        break;
      }
      id v11 = v10;
      id v12 = [v10 fileSize];
      [v11 speed];
      double v14 = v13;
      if (v9 < (unint64_t)[v6 count])
      {
        ++v9;
        if ((double)(unint64_t)(8 * (void)v12) / (v14 * 1000000.0) <= 1.0) {
          continue;
        }
      }
      [v5 setDidPass:1];
      [v5 setResult:1];
      CFStringRef v17 = @"Mbps";
      [v11 speed];
      id v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v5 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)];
      break;
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__testLeakyAP
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:51];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  id v4 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] currentNetwork];
  [v4 scanRecord];
  uint64_t v5 = WiFiNetworkCreate();
  if (v5
    && (uint64_t v6 = (const void *)v5, [v4 bssid], IsAPLeaky = WiFiNetworkIsAPLeaky(), CFRelease(v6), IsAPLeaky))
  {
    [v3 setResult:1];
  }
  else
  {
    [v3 setDidPass:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testWiFiLink
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:52];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  id v4 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] networkName];
  if (v4)
  {
    CFStringRef v6 = @"NetworkName";
    id v7 = v4;
    [v3 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1)];
    [v3 setResult:1];
    [v3 setDidPass:1];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testWiFiIsPrimaryIPv4
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:57];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  id v4 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] globalIPv4InterfaceName];
  id v5 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] globalIPv4NetworkServiceName];
  id v6 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] globalIPv4NetworkServiceID];
  if (objc_msgSend(-[CWFInterface networkServiceID](-[W5StatusManager corewifi](self->_status, "corewifi"), "networkServiceID"), "isEqualToString:", v6))
  {
    [v3 setResult:1];
    [v3 setDidPass:1];
  }
  id v7 = +[NSMutableDictionary dictionary];
  [v7 setObject:v4 forKeyedSubscript:@"IPv4InterfaceName"];
  [v7 setObject:v5 forKeyedSubscript:@"IPv4ServiceName"];
  [v7 setObject:v6 forKeyedSubscript:@"IPv4ServiceID"];
  [v3 setInfo:v7];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testWiFiIsPrimaryIPv6
{
  id v3 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v3 setTestID:58];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestStarted:];
  id v4 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] globalIPv6InterfaceName];
  id v5 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] globalIPv6NetworkServiceName];
  id v6 = [(CWFInterface *)[(W5StatusManager *)self->_status corewifi] globalIPv6NetworkServiceID];
  if (objc_msgSend(-[CWFInterface networkServiceID](-[W5StatusManager corewifi](self->_status, "corewifi"), "networkServiceID"), "isEqualToString:", v6))
  {
    [v3 setResult:1];
    [v3 setDidPass:1];
  }
  id v7 = +[NSMutableDictionary dictionary];
  [v7 setObject:v4 forKeyedSubscript:@"IPv6InterfaceName"];
  [v7 setObject:v5 forKeyedSubscript:@"IPv6ServiceName"];
  [v7 setObject:v6 forKeyedSubscript:@"IPv6ServiceID"];
  [v3 setInfo:v7];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTestCompleted:];
  return v3;
}

- (id)__testReachabilityToPeersWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init((Class)W5DiagnosticsTestResult);
  [v5 setTestID:63];
  id v6 = &Apple80211BindToInterface_ptr;
  +[NSDate timeIntervalSinceReferenceDate];
  [v5 setTestStarted:];
  id v7 = [a3 objectForKeyedSubscript:@"PingCount"];
  id v8 = [a3 objectForKeyedSubscript:@"PingTimeout"];
  id v9 = [a3 objectForKeyedSubscript:@"PingInterval"];
  id v10 = [a3 objectForKeyedSubscript:@"PingWait"];
  id v11 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  if (v7)
  {
    uint64_t v32 = (uint64_t)[v7 integerValue];
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v32 = 1;
    if (v8)
    {
LABEL_3:
      [v8 doubleValue];
      double v13 = v12;
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  double v13 = 2.0;
  if (v9)
  {
LABEL_4:
    [v9 doubleValue];
    double v15 = v14;
    if (v10) {
      goto LABEL_5;
    }
LABEL_23:
    double v17 = 2.0;
    if (!v11) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_22:
  double v15 = 0.1;
  if (!v10) {
    goto LABEL_23;
  }
LABEL_5:
  [v10 doubleValue];
  double v17 = v16;
  if (v11) {
LABEL_6:
  }
    id v11 = [v11 unsignedIntegerValue];
LABEL_7:
  id v18 = [a3 objectForKeyedSubscript:@"PingTrafficClass"];
  id v19 = [a3 objectForKeyedSubscript:@"AddressesToPing"];
  id v33 = (id)objc_opt_new();
  if ([(CWFInterface *)[(W5StatusManager *)self->_status corewifi] SSID]
    && (long long v36 = 0u,
        long long v37 = 0u,
        long long v34 = 0u,
        long long v35 = 0u,
        (id v20 = [v19 countByEnumeratingWithState:&v34 objects:v40 count:16]) != 0))
  {
    id v21 = v20;
    id v31 = v5;
    uint64_t v22 = *(void *)v35;
    char v23 = 1;
    char v24 = 1;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        id v26 = [(W5DiagnosticsManager *)self __performPingWithAddress:*(void *)(*((void *)&v34 + 1) + 8 * i) count:v32 timeout:v18 wait:[(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName] interval:v11 trafficClass:v13 interfaceName:v17 dataLength:v15];
        [v26 packetLoss];
        if (v27 >= 100.0)
        {
          char v23 = 0;
          char v24 = 0;
        }
        [v33 addObject:v26];
      }
      id v21 = [v19 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v21);
    uint64_t v28 = v23 & 1;
    uint64_t v29 = v24 & 1;
    id v5 = v31;
    id v6 = &Apple80211BindToInterface_ptr;
  }
  else
  {
    uint64_t v28 = 1;
    uint64_t v29 = 1;
  }
  [v5 setDidPass:v28];
  [v5 setResult:v29];
  CFStringRef v38 = @"PingsReceived";
  id v39 = v33;
  [v5 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1)];
  [v6[359] timeIntervalSinceReferenceDate];
  [v5 setTestCompleted:];
  return v5;
}

- (id)__orderedChannelWeights:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100046550;
  v4[3] = &unk_1000DE7D8;
  v4[4] = a3;
  return [objc_msgSend(objc_msgSend(a3, "allKeys"), "sortedArrayUsingComparator:", v4);
}

- (id)__overlappingChannelsForChannel:(id)a3 supportedChannels:(id)a4
{
  id v6 = +[NSMutableArray array];
  id v7 = +[NSMutableArray array];
  id v8 = [a3 channel];
  if (([a3 flags] & 0x800) != 0)
  {
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 16)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 15)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 14)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 13)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 12)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 11)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 10)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 9)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 8)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 7)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 6)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 5)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 4)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 3)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 2)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 1)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8)];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 1)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 + 2)]];
    [v7 addObject:[NSNumber numberWithInteger:v8]];
    [v7 addObject:[NSNumber numberWithInteger:*(int *)(v8 + 4)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 + 5)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 + 6)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 + 7)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 8)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 + 9)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 + 10)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 11)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 + 12)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 13)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 + 14)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 + 15)]];
    id v11 = (char *)v8 + 16;
  }
  else if (([a3 flags] & 0x400) != 0)
  {
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 8)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 7)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 6)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 5)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 4)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 3)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 2)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 1)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 1)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 + 2)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 3)]];
    [v7 addObject:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 4)];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 5)]];
    [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 6)]];
    [v7 addObject:[NSNumber numberWithInteger:((char *)v8 + 7)]];
    id v11 = (char *)v8 + 8;
  }
  else
  {
    unsigned __int8 v9 = [a3 flags];
    unsigned __int16 v10 = (unsigned __int16)[a3 flags];
    if ((v9 & 4) != 0)
    {
      uint64_t v12 = -2;
      if ((v10 & 0x200) != 0) {
        uint64_t v12 = 2;
      }
      uint64_t v13 = (v12 + 2 * (uint64_t)v8) >> 1;
      [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 - 4)]];
      [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 - 3)]];
      [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 - 2)]];
      [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 - 1)]];
      [v7 addObject:[NSNumber numberWithInteger:v13]];
      [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 + 1)]];
      [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 + 2)];
      [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 + 3)]];
      id v11 = (char *)(v13 + 4);
    }
    else
    {
      if ((v10 & 2) == 0) {
        goto LABEL_12;
      }
      [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 2)]];
      [v7 addObject:[NSNumber numberWithInteger:((char *)v8 - 1)]];
      [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8)]];
      [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 1)]];
      id v11 = (char *)v8 + 2;
    }
  }
  [v7 addObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11)]];
LABEL_12:
  id v14 = +[W5DiagnosticsManager __channelNumbersForWiFiChannels:a4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v7);
        }
        uint64_t v19 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if ([v14 containsObject:v19]) {
          [v6 addObject:v19];
        }
      }
      id v16 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }
  return [v6 copy];
}

+ (id)__channelNumbersForWiFiChannels:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        [v4 addObject:[NSNumber numberWithInteger:objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "channel")]];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return [v4 copy];
}

- (id)__only5GHzNonDFSChannels:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 flags] & 0x10) != 0
          && ([v9 flags] & 0x100) == 0)
        {
          [v4 addObject:v9];
        }
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return [v4 copy];
}

- (id)__only2GHzChannels:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 flags] & 8) != 0 && (objc_msgSend(v9, "flags") & 2) != 0) {
          [v4 addObject:v9];
        }
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return [v4 copy];
}

- (id)__only5GHzChannels:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 flags] & 0x10) != 0 && (objc_msgSend(v9, "flags") & 2) != 0) {
          [v4 addObject:v9];
        }
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return [v4 copy];
}

- (id)__only2GHz_1_6_11_14_Channels:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 flags] & 8) != 0
          && ([v9 flags] & 2) != 0
          && ([v9 channel] == (id)1
           || [v9 channel] == (id)6
           || [v9 channel] == (id)11
           || [v9 channel] == (id)14))
        {
          [v4 addObject:v9];
        }
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return [v4 copy];
}

- (id)__only5GHz20MHz40MHzChannels:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 flags] & 0x10) != 0
          && (([v9 flags] & 2) != 0 || (objc_msgSend(v9, "flags") & 4) != 0))
        {
          [v4 addObject:v9];
        }
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return [v4 copy];
}

- (id)__only5GHz40MHzChannels:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 flags] & 0x10) != 0 && (objc_msgSend(v9, "flags") & 4) != 0) {
          [v4 addObject:v9];
        }
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return [v4 copy];
}

- (id)__filteredChannelWeights:(id)a3 channels:(id)a4
{
  id v6 = +[NSMutableDictionary dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [a3 allKeys];
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ([a4 containsObject:v12]) {
          [v6 setObject:objc_msgSend(a3, "objectForKeyedSubscript:", v12) forKeyedSubscript:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return [v6 copy];
}

- (id)__adjust5GHzWeights:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [a3 allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v10 flags] & 0x100) != 0) {
          double v11 = 0.1;
        }
        else {
          double v11 = 0.0;
        }
        if (([v10 flags] & 4) != 0) {
          double v11 = v11 + -0.1;
        }
        if ((uint64_t)[v10 channel] > 48) {
          double v11 = v11 + -0.1;
        }
        if ((uint64_t)[v10 channel] > 148) {
          double v11 = v11 + -0.1;
        }
        [objc_msgSend(a3, "objectForKeyedSubscript:", v10) floatValue];
        [v4 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11 + v12)] forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  return [v4 copy];
}

- (id)__applyChannelWeights:(id)a3 supportedChannels:(id)a4
{
  id v23 = +[NSMutableDictionary dictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(a4);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v11 = [(W5DiagnosticsManager *)self __overlappingChannelsForChannel:v10 supportedChannels:a4];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v25;
          float v15 = 0.0;
          float v16 = 0.0;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v11);
              }
              float v15 = v15 + 1.0;
              [objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v24 + 1) + 8 * (void)j)) floatValue];
              float v16 = v16 + v18;
            }
            id v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v13);
          id v20 = (NSNumber *)&off_1000F0850;
          if (v16 > 0.0)
          {
            *(float *)&double v19 = v16 / v15;
            id v20 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", &off_1000F0850, v19);
          }
        }
        else
        {
          id v20 = (NSNumber *)&off_1000F0850;
        }
        [v23 setObject:v20 forKeyedSubscript:v10];
      }
      id v7 = [a4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }
  return [v23 copy];
}

- (id)__channelWeightsForScanResults:(id)a3 supportedChannels:(id)a4 rssiThreshold:(int64_t)a5
{
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = +[W5DiagnosticsManager __channelNumbersForWiFiChannels:a4];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v42;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 setObject:&off_1000EAFD8 forKeyedSubscript:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v9);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v31 = [a3 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v38;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(a3);
        }
        uint64_t v32 = v12;
        id v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
        if ((uint64_t)[v13 rssi] >= a5)
        {
          id v14 = -[W5DiagnosticsManager __channelWeightsForChannel:](self, "__channelWeightsForChannel:", [v13 channel]);
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v15 = [v14 allKeys];
          id v16 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v34;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v34 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
                id v21 = [v14 objectForKeyedSubscript:v20];
                [objc_msgSend(v6, "objectForKeyedSubscript:", v20) floatValue];
                float v23 = v22;
                [v21 floatValue];
                *(float *)&double v25 = v23 + v24;
                [v6 setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v25) forKeyedSubscript:v20];
              }
              id v17 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
            }
            while (v17);
          }
        }
        uint64_t v12 = v32 + 1;
      }
      while ((id)(v32 + 1) != v31);
      id v31 = [a3 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v31);
  }
  return [(W5DiagnosticsManager *)self __filteredChannelWeights:v6 channels:v7];
}

- (id)__occupiedChannelsForScanResults:(id)a3 supportedChannels:(id)a4 rssiThreshold:(int64_t)a5 ignoreChannel:(id)a6
{
  id v10 = +[NSMutableOrderedSet orderedSet];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(a3);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((uint64_t)[v15 rssi] >= a5)
        {
          id v16 = [a6 channel];
          if (v16 != objc_msgSend(objc_msgSend(v15, "channel"), "channel")) {
            [v10 addObjectsFromArray:-[W5DiagnosticsManager __overlappingChannelsForChannel:supportedChannels:](self, "__overlappingChannelsForChannel:supportedChannels:", [v15 channel], a4)];
          }
        }
      }
      id v12 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
  return [v10 array];
}

- (id)__channelWeightsForChannel:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = [a3 channel];
  if (([a3 flags] & 0x800) != 0)
  {
    [v4 setObject:&off_1000EAE10 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 16)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 15)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 14)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 13)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 + 12)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 11)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:*(char *)v5 + 10]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 9)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 8)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 7)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 6)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 5)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 4)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 + 3)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 2)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 1)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:v5]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 1)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 2)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 3)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 4)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 5)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 6)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 7)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 8)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 9)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 10)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 11)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 12)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 13)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 14)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 15)]];
    id v8 = (char *)v5 - 16;
  }
  else if (([a3 flags] & 0x400) != 0)
  {
    [v4 setObject:&off_1000EAE10 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 8)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 + 7)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 6)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 5)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 4)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 3)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 + 2)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 1)];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:v5]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 1)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 2)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 3)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 4)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 5)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 6)]];
    [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 7)]];
    id v8 = (char *)v5 - 8;
  }
  else
  {
    unsigned __int8 v6 = [a3 flags];
    unsigned __int16 v7 = (unsigned __int16)[a3 flags];
    if ((v6 & 4) != 0)
    {
      uint64_t v9 = -2;
      if ((v7 & 0x200) != 0) {
        uint64_t v9 = 2;
      }
      uint64_t v10 = (v9 + 2 * (uint64_t)v5) >> 1;
      [v4 setObject:&off_1000EAE10 forKeyedSubscript:[NSNumber numberWithInteger:v10 + 4]];
      [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:v10 + 3]];
      [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:v10 + 2]];
      [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:v10 + 1]];
      [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:v10]];
      [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:v10 - 1]];
      [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:v10 - 2]];
      [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:v10 - 3]];
      id v8 = (char *)(v10 - 4);
    }
    else
    {
      if ((v7 & 2) == 0) {
        goto LABEL_12;
      }
      [v4 setObject:&off_1000EAE10 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 2)];
      [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 1)];
      [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:v5]];
      [v4 setObject:&off_1000EAE88 forKeyedSubscript:[NSNumber numberWithInteger:((char *)v5 - 1)]];
      id v8 = (char *)v5 - 2;
    }
  }
  [v4 setObject:&off_1000EAE10 forKeyedSubscript:[NSNumber numberWithInteger:v8]];
LABEL_12:
  id v11 = [v4 copy];

  return v11;
}

+ (id)__ambiguousSSIDs
{
  if (qword_1001036D8 != -1) {
    dispatch_once(&qword_1001036D8, &stru_1000DE7F8);
  }
  return (id)qword_1001036D0;
}

- (BOOL)__isUsingCustomProxySettings:(id)a3
{
  if ([a3 count] != (id)2) {
    return [a3 count] != 0;
  }
  id v4 = [a3 objectForKeyedSubscript:kSCPropNetProxiesExceptionsList];
  if ([v4 count] == (id)2
    && [v4 containsObject:@"*.local"]
    && [v4 containsObject:@"169.254/16"])
  {
    return [[a3 objectForKeyedSubscript:kSCPropNetProxiesFTPPassive] BOOLValue] ^ 1;
  }
  else
  {
    return 1;
  }
}

- (int64_t)__ipv6ConfigMethodForDescription:(id)a3
{
  if ([a3 isEqualToString:kSCValNetIPv6ConfigMethodAutomatic]) {
    return 1;
  }
  if ([a3 isEqualToString:kSCValNetIPv6ConfigMethodLinkLocal]) {
    return 2;
  }
  if ([a3 isEqualToString:kSCValNetIPv6ConfigMethodManual]) {
    return 3;
  }
  if ([a3 isEqualToString:kSCValNetIPv6ConfigMethodRouterAdvertisement]) {
    return 4;
  }
  if ([a3 isEqualToString:kSCValNetIPv6ConfigMethod6to4]) {
    return 5;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)__ipv4ConfigMethodForDescription:(id)a3
{
  if ([a3 isEqualToString:kSCValNetIPv4ConfigMethodAutomatic]) {
    return 1;
  }
  if ([a3 isEqualToString:kSCValNetIPv4ConfigMethodLinkLocal]) {
    return 2;
  }
  if ([a3 isEqualToString:kSCValNetIPv4ConfigMethodDHCP]) {
    return 3;
  }
  if ([a3 isEqualToString:kSCValNetIPv4ConfigMethodManual]) {
    return 4;
  }
  if ([a3 isEqualToString:kSCValNetIPv4ConfigMethodBOOTP]) {
    return 5;
  }
  if ([a3 isEqualToString:kSCValNetIPv4ConfigMethodINFORM]) {
    return 6;
  }
  if ([a3 isEqualToString:kSCValNetIPv4ConfigMethodPPP]) {
    return 7;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)__runDiagnosticsTest:(id)a3
{
  [a3 testID];
  uint64_t v5 = W5DescriptionForDiagnosticsTestID();
  if (-[NSArray containsObject:](-[W5StatusManager bootArgs](self->_status, "bootArgs"), "containsObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@=%ld", @"wifivelocity-exclude-test", [a3 testID]))|| -[NSArray containsObject:](-[W5StatusManager bootArgs](self->_status, "bootArgs"), "containsObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@='%@'", @"wifivelocity-exclude-test", v5)))
  {
    unsigned __int8 v6 = sub_10009756C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543618;
      uint64_t v24 = v5;
      __int16 v25 = 2048;
      id v26 = [a3 testID];
      _os_log_send_and_compose_impl();
    }
    return 0;
  }
  else
  {
    uint64_t v9 = sub_10009756C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:+[NSDate date]];
      int v23 = 138543874;
      uint64_t v24 = (uint64_t)v10;
      __int16 v25 = 2114;
      id v26 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "UUIDString") substringToIndex:5];
      __int16 v27 = 2114;
      uint64_t v28 = v5;
      LODWORD(v22) = 32;
      long long v21 = &v23;
      _os_log_send_and_compose_impl();
    }
    switch((unint64_t)objc_msgSend(a3, "testID", v21, v22))
    {
      case 1uLL:
        id v11 = -[W5DiagnosticsManager __testPingLANWithConfiguration:](self, "__testPingLANWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 2uLL:
        id v11 = [(W5DiagnosticsManager *)self __testPingLANUsingIMFoundation];
        goto LABEL_75;
      case 3uLL:
        id v11 = -[W5DiagnosticsManager __testPingLANUsingCFNetworkWithConfiguration:](self, "__testPingLANUsingCFNetworkWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 4uLL:
        id v11 = -[W5DiagnosticsManager __testPingWANWithConfiguration:](self, "__testPingWANWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 5uLL:
        id v11 = [(W5DiagnosticsManager *)self __testPingWANUsingIMFoundation];
        goto LABEL_75;
      case 6uLL:
        id v11 = -[W5DiagnosticsManager __testPingWANUsingCFNetworkWithConfiguration:](self, "__testPingWANUsingCFNetworkWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 7uLL:
        id v11 = [(W5DiagnosticsManager *)self __testResolveDNS];
        goto LABEL_75;
      case 8uLL:
        id v11 = [(W5DiagnosticsManager *)self __testDetectDoubleNAT];
        goto LABEL_75;
      case 9uLL:
        id v11 = [(W5DiagnosticsManager *)self __testReachApple];
        goto LABEL_75;
      case 0xAuLL:
        id v11 = [(W5DiagnosticsManager *)self __testRetrieveApple];
        goto LABEL_75;
      case 0xBuLL:
        id v11 = -[W5DiagnosticsManager __testRetrieveAppleForceWiFiWithConfiguration:](self, "__testRetrieveAppleForceWiFiWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0xCuLL:
        id v11 = [(W5DiagnosticsManager *)self __testIPv4Assigned];
        goto LABEL_75;
      case 0xDuLL:
        id v11 = [(W5DiagnosticsManager *)self __testIPv6Assigned];
        goto LABEL_75;
      case 0xEuLL:
        id v11 = [(W5DiagnosticsManager *)self __testCustomIPv4];
        goto LABEL_75;
      case 0xFuLL:
        id v11 = [(W5DiagnosticsManager *)self __testCustomIPv6];
        goto LABEL_75;
      case 0x10uLL:
        id v11 = [(W5DiagnosticsManager *)self __testCustomDNS];
        goto LABEL_75;
      case 0x11uLL:
        id v11 = [(W5DiagnosticsManager *)self __testCustomWebProxy];
        goto LABEL_75;
      case 0x12uLL:
        id v11 = -[W5DiagnosticsManager __testHighBTPairedWithConfiguration:](self, "__testHighBTPairedWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x13uLL:
        id v11 = -[W5DiagnosticsManager __testHighBTConnectedWithConfiguration:](self, "__testHighBTConnectedWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x14uLL:
        id v11 = -[W5DiagnosticsManager __testBTCoexWithConfiguration:](self, "__testBTCoexWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x15uLL:
        id v11 = -[W5DiagnosticsManager __testAWDLEnabledWithConfiguration:](self, "__testAWDLEnabledWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x16uLL:
        id v11 = -[W5DiagnosticsManager __testAWDLRealtimeWithConfiguration:](self, "__testAWDLRealtimeWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x17uLL:
        id v11 = -[W5DiagnosticsManager __testCongestedChannelUsingCCAWithConfiguration:](self, "__testCongestedChannelUsingCCAWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x18uLL:
        id v11 = -[W5DiagnosticsManager __testCongestedChannelWithConfiguration:](self, "__testCongestedChannelWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x19uLL:
        id v11 = -[W5DiagnosticsManager __testCongested2GHzWithConfiguration:](self, "__testCongested2GHzWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x1AuLL:
        id v11 = -[W5DiagnosticsManager __testCongested5GHzWithConfiguration:](self, "__testCongested5GHzWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x1BuLL:
        id v11 = -[W5DiagnosticsManager __testHT402GHzWithConfiguration:](self, "__testHT402GHzWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x1CuLL:
        id v11 = -[W5DiagnosticsManager __testConflictingCountryCodeWithConfiguration:](self, "__testConflictingCountryCodeWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x1DuLL:
        id v11 = -[W5DiagnosticsManager __testConflictingSecurityTypePNLWithConfiguration:](self, "__testConflictingSecurityTypePNLWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x1EuLL:
        id v11 = -[W5DiagnosticsManager __testWiFiHiddenScanResultsWithConfiguration:](self, "__testWiFiHiddenScanResultsWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x1FuLL:
        id v11 = -[W5DiagnosticsManager __testWiFiNoScanResultsWithConfiguration:](self, "__testWiFiNoScanResultsWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x20uLL:
        id v11 = -[W5DiagnosticsManager __testPoorSignalWithConfiguration:](self, "__testPoorSignalWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x21uLL:
        id v11 = -[W5DiagnosticsManager __testAirPortBaseStationWithConfiguration:](self, "__testAirPortBaseStationWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x22uLL:
        id v11 = -[W5DiagnosticsManager __testLongBeaconIntervalWithConfiguration:](self, "__testLongBeaconIntervalWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x23uLL:
        id v11 = [(W5DiagnosticsManager *)self __testLongDTIMInterval];
        goto LABEL_75;
      case 0x24uLL:
        id v11 = -[W5DiagnosticsManager __testConflictingPHYMode11acWithConfiguration:](self, "__testConflictingPHYMode11acWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x25uLL:
        id v11 = -[W5DiagnosticsManager __testConflictingPHYMode11nWithConfiguration:](self, "__testConflictingPHYMode11nWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x26uLL:
        id v11 = -[W5DiagnosticsManager __testNoSecurityWithConfiguration:](self, "__testNoSecurityWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x27uLL:
        id v11 = -[W5DiagnosticsManager __testLegacySecurityWEPWithConfiguration:](self, "__testLegacySecurityWEPWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x28uLL:
        id v11 = -[W5DiagnosticsManager __testLegacySecurityWPAWithConfiguration:](self, "__testLegacySecurityWPAWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x29uLL:
        id v11 = -[W5DiagnosticsManager __testLegacyRates11bWithConfiguration:](self, "__testLegacyRates11bWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x2AuLL:
        id v11 = -[W5DiagnosticsManager __testAmbiguousNetworkNameWithConfiguration:](self, "__testAmbiguousNetworkNameWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x2BuLL:
        id v11 = -[W5DiagnosticsManager __testHiddenNetworkWithConfiguration:](self, "__testHiddenNetworkWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x2CuLL:
        id v11 = -[W5DiagnosticsManager __testiOSPersonalHotspotWithConfiguration:](self, "__testiOSPersonalHotspotWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x2DuLL:
        id v11 = -[W5DiagnosticsManager __testPasspointWithConfiguration:](self, "__testPasspointWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x2EuLL:
        id v11 = -[W5DiagnosticsManager __testCaptivePortalWithConfiguration:](self, "__testCaptivePortalWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x2FuLL:
        id v11 = -[W5DiagnosticsManager __testLargePNLWithConfiguration:](self, "__testLargePNLWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x30uLL:
        id v11 = -[W5DiagnosticsManager __testPNLContainsHiddenWithConfiguration:](self, "__testPNLContainsHiddenWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x31uLL:
        id v11 = -[W5DiagnosticsManager __testDownloadSpeedWithConfiguration:](self, "__testDownloadSpeedWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x32uLL:
        id v11 = -[W5DiagnosticsManager __testUploadSpeedWithConfiguration:](self, "__testUploadSpeedWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x33uLL:
        id v11 = [(W5DiagnosticsManager *)self __testLeakyAP];
        goto LABEL_75;
      case 0x34uLL:
        id v11 = [(W5DiagnosticsManager *)self __testWiFiLink];
        goto LABEL_75;
      case 0x35uLL:
        id v11 = -[W5DiagnosticsManager __testConcurrentWithConfiguration:](self, "__testConcurrentWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x36uLL:
        id v11 = [(W5DiagnosticsManager *)self __testCurlApple];
        goto LABEL_75;
      case 0x37uLL:
        id v7 = objc_alloc_init((Class)W5DiagnosticsTestResult);
        [v7 setTestID:[a3 testID]];
        [v7 setDidPass:1];
        [v7 setResult:1];
        +[NSDate timeIntervalSinceReferenceDate];
        [v7 setTestStarted:];
        [(W5DiagnosticsManager *)self beginWiFiDefaultRoute];
        goto LABEL_70;
      case 0x38uLL:
        id v7 = objc_alloc_init((Class)W5DiagnosticsTestResult);
        [v7 setTestID:[a3 testID]];
        [v7 setDidPass:1];
        [v7 setResult:1];
        +[NSDate timeIntervalSinceReferenceDate];
        [v7 setTestStarted:];
        [(W5DiagnosticsManager *)self endWiFiDefaultRoute];
LABEL_70:
        +[NSDate timeIntervalSinceReferenceDate];
        [v7 setTestCompleted:];
        break;
      case 0x39uLL:
        id v11 = [(W5DiagnosticsManager *)self __testWiFiIsPrimaryIPv4];
        goto LABEL_75;
      case 0x3AuLL:
        id v11 = [(W5DiagnosticsManager *)self __testWiFiIsPrimaryIPv6];
        goto LABEL_75;
      case 0x3BuLL:
        id v11 = -[W5DiagnosticsManager __testPing6AWDLWithConfiguration:](self, "__testPing6AWDLWithConfiguration:", [a3 configuration]);
        goto LABEL_75;
      case 0x3CuLL:
        id v11 = [(W5DiagnosticsManager *)self __testPeerDiagnostics];
        goto LABEL_75;
      case 0x3DuLL:
        id v11 = [(W5DiagnosticsManager *)self __testPeerTypes];
        goto LABEL_75;
      case 0x3EuLL:
        id v11 = [(W5DiagnosticsManager *)self __testDiscoverPeerTypes];
        goto LABEL_75;
      case 0x3FuLL:
        id v11 = -[W5DiagnosticsManager __testReachabilityToPeersWithConfiguration:](self, "__testReachabilityToPeersWithConfiguration:", [a3 configuration]);
LABEL_75:
        id v7 = v11;
        break;
      default:
        id v7 = 0;
        break;
    }
    id v12 = sub_10009756C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:+[NSDate date]];
      id v14 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "UUIDString") substringToIndex:5];
      [v7 testCompleted];
      double v16 = v15;
      [v7 testStarted];
      double v18 = v16 - v17;
      unsigned int v19 = [v7 result];
      unsigned int v20 = [v7 didPass];
      int v23 = 138544642;
      uint64_t v24 = (uint64_t)v13;
      __int16 v25 = 2114;
      id v26 = v14;
      __int16 v27 = 2114;
      uint64_t v28 = v5;
      __int16 v29 = 2048;
      double v30 = v18;
      __int16 v31 = 1024;
      unsigned int v32 = v19;
      __int16 v33 = 1024;
      unsigned int v34 = v20;
      _os_log_send_and_compose_impl();
    }
  }
  return v7;
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
        id v6 = [v5 componentsSeparatedByString:@"\n"];
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v15;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v15 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = [[*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) componentsSeparatedByCharactersInSet:+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")];
              if ([v11 containsObject:@"loss"]
                && (unint64_t)[v11 count] >= 7)
              {
                id v12 = [v11 objectAtIndexedSubscript:6];
                [objc_msgSend(v12, "substringToIndex:", (char *)objc_msgSend(v12, "length") - 1) doubleValue];
                [a4 setPacketLoss:];
              }
              else if ([v11 containsObject:@"round-trip"] {
                     && (unint64_t)[v11 count] >= 4)
              }
              {
                id v13 = [[v11 objectAtIndexedSubscript:3] componentsSeparatedByString:@"/"];
                if ((unint64_t)[v13 count] >= 4)
                {
                  [objc_msgSend(v13, "objectAtIndexedSubscript:", 0) doubleValue];
                  [a4 setMin:];
                  [v13[1] doubleValue];
                  [a4 setAvg:];
                  [v13[2] doubleValue];
                  [a4 setMax:];
                  [v13[3] doubleValue];
                  [a4 setStddev:];
                }
              }
              uint64_t v10 = (char *)v10 + 1;
            }
            while (v8 != v10);
            id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v8);
        }
      }
    }
  }
}

+ (BOOL)__detectLocalIPv4Address:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"."];
  return (unint64_t)[v3 count] >= 2
      && (objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "integerValue") == (id)10
       || objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "integerValue") == (id)172
       && objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 1), "integerValue") == (id)16
       || objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "integerValue") == (id)192
       && [v3 objectAtIndexedSubscript:1] == 168);
}

+ (BOOL)__isDoubleNATWithTracerouteOutput:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [a3 componentsSeparatedByString:@"\n"];
  id v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v10 = (unint64_t)[v9 rangeOfString:@"("];
        id v11 = (char *)[v9 rangeOfString:@""]);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL && v11 != (char *)0x7FFFFFFFFFFFFFFFLL) {
          v6 += [a1 __detectLocalIPv4Address:[v9 substringWithRange:v10 + 1, &v11[~v10]]];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6 > 1;
}

- (id)__performTracerouteWithAddress:(id)a3 maxTTL:(int64_t)a4 waittime:(int64_t)a5 queries:(int64_t)a6
{
  id result = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  if (result)
  {
    v9[0] = @"-n";
    v9[1] = @"-m";
    void v9[2] = @"6";
    v9[3] = @"-i";
    v9[4] = result;
    v9[5] = @"-w";
    v9[6] = @"2";
    v9[7] = @"-q";
    void v9[8] = @"1";
    v9[9] = @"captive.apple.com";
    uint64_t v7 = +[NSArray arrayWithObjects:v9 count:10];
    id v8 = +[NSMutableData dataWithCapacity:0];
    if (+[NSTask runTaskWithLaunchPath:@"/usr/sbin/traceroute" arguments:v7 outputData:v8 error:0])
    {
      return [objc_alloc((Class)NSString) initWithData:v8 encoding:4];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)__performPingUsingIMFoundationWithAddress:(id)a3 timeout:(int64_t)a4
{
  uint64_t v19 = 0;
  unsigned int v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = sub_10003C5C4;
  int v23 = sub_10003C5D4;
  uint64_t v24 = 0;
  uint64_t v7 = sub_10004B584();
  if (a4 <= 2147483646 && a3 && v7)
  {
    id v8 = dispatch_semaphore_create(0);
    +[NSDate timeIntervalSinceReferenceDate];
    uint64_t v10 = v9;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x3052000000;
    double v30 = sub_10003C5C4;
    __int16 v31 = sub_10003C5D4;
    id v11 = (objc_class *)qword_1001036C8;
    uint64_t v32 = qword_1001036C8;
    if (!qword_1001036C8)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      void v25[2] = sub_10004B6C8;
      v25[3] = &unk_1000DD348;
      v25[4] = &buf;
      sub_10004B6C8((uint64_t)v25);
      id v11 = *(objc_class **)(*((void *)&buf + 1) + 40);
    }
    _Block_object_dispose(&buf, 8);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100049D04;
    v18[3] = &unk_1000DE820;
    v18[4] = a3;
    v18[5] = self;
    v18[8] = v10;
    v18[6] = v8;
    v18[7] = &v19;
    [objc_msgSend([v11 alloc] initWithAddress:a3 wifi:1) startWithTimeout:dispatch_get_global_queue(0, 0) queue:v18 completionHandler:(double)a4];
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
  long long v16 = (void *)v20[5];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)__performPingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 wait:(double)a6 interval:(double)a7 trafficClass:(id)a8 interfaceName:(id)a9 dataLength:(unint64_t)a10
{
  if (a5 >= 2147483650.0 || a4 > 2147483646 || a3 == 0 || a9 == 0) {
    return 0;
  }
  if (a8 && ([a8 integerValue], (uint64_t v21 = W5DescriptionForPingTrafficClass()) != 0))
  {
    uint64_t v22 = v21;
    v37[0] = @"-c";
    v37[1] = +[NSString stringWithFormat:@"%ld", a4];
    v37[2] = @"-b";
    v37[3] = a9;
    v37[4] = @"-k";
    v37[5] = v22;
    v37[6] = @"-i";
    v37[7] = +[NSString stringWithFormat:@"%.1f", *(void *)&a7];
    v37[8] = @"-t";
    v37[9] = +[NSString stringWithFormat:@"%.2f", *(void *)&a5];
    v37[10] = @"-W";
    v37[11] = +[NSString stringWithFormat:@"%ld", (uint64_t)(a6 * 1000.0)];
    v37[12] = @"-s";
    v37[13] = +[NSString stringWithFormat:@"%ld", a10 + 56];
    v37[14] = a3;
    int v23 = v37;
    uint64_t v24 = 15;
  }
  else
  {
    v36[0] = @"-c";
    v36[1] = +[NSString stringWithFormat:@"%ld", a4];
    v36[2] = @"-b";
    v36[3] = a9;
    v36[4] = @"-i";
    v36[5] = +[NSString stringWithFormat:@"%.1f", *(void *)&a7];
    v36[6] = @"-t";
    v36[7] = +[NSString stringWithFormat:@"%.2f", *(void *)&a5];
    v36[8] = @"-W";
    v36[9] = +[NSString stringWithFormat:@"%ld", (uint64_t)(a6 * 1000.0)];
    v36[10] = @"-s";
    v36[11] = +[NSString stringWithFormat:@"%ld", a10 + 56];
    v36[12] = a3;
    int v23 = v36;
    uint64_t v24 = 13;
  }
  __int16 v25 = +[NSArray arrayWithObjects:v23 count:v24];
  +[NSDate timeIntervalSinceReferenceDate];
  double v27 = v26;
  uint64_t v28 = +[NSMutableData dataWithCapacity:0];
  +[NSTask runTaskWithLaunchPath:@"/sbin/ping" arguments:v25 outputData:v28 error:0];
  id v29 = objc_alloc_init((Class)W5PingResult);
  [v29 setInterfaceName:a9];
  [v29 setAddress:a3];
  [v29 setCount:a4];
  [v29 setTimeout:a5];
  [v29 setWait:a6];
  [v29 setInterval:a7];
  [v29 setTrafficClass:[a8 integerValue]];
  [v29 setDataLength:a10];
  [v29 setStartedAt:v27];
  +[NSDate timeIntervalSinceReferenceDate];
  [v29 setEndedAt:];
  [v29 setCommand:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"/sbin/ping %@", -[NSArray componentsJoinedByString:](v25, "componentsJoinedByString:", @" "];
  [v29 setOutput:[objc_alloc((Class)NSString) initWithData:v28 encoding:4]];
  +[W5DiagnosticsManager __parsePingOutput:v28 result:v29];
  if (v29)
  {
    id v30 = objc_alloc_init((Class)W5Event);
    [v30 setEventID:34];
    [v29 endedAt];
    [v30 setTimestamp:];
    CFStringRef v34 = @"PingResult";
    id v35 = v29;
    [v30 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1)];
    pingCallback = (void (**)(id, id))self->_pingCallback;
    if (pingCallback) {
      pingCallback[2](pingCallback, v30);
    }
  }
  return v29;
}

- (id)__performPing6WithAddress:(id)a3 count:(int64_t)a4 wait:(double)a5 trafficClass:(id)a6 interfaceName:(id)a7 dataLength:(unint64_t)a8
{
  id v8 = 0;
  if (a3 && a4 <= 2147483646 && a7)
  {
    if (a6 && ([a6 integerValue], (uint64_t v15 = W5DescriptionForPingTrafficClass()) != 0))
    {
      uint64_t v16 = v15;
      v30[0] = @"-c";
      v30[1] = +[NSString stringWithFormat:@"%ld", a4];
      v30[2] = @"-B";
      v30[3] = a7;
      v30[4] = @"-I";
      v30[5] = a7;
      v30[6] = @"-k";
      v30[7] = v16;
      v30[8] = @"-i";
      v30[9] = +[NSString stringWithFormat:@"%f", *(void *)&a5];
      v30[10] = @"-s";
      v30[11] = +[NSString stringWithFormat:@"%ld", a8 + 56];
      v30[12] = a3;
      long long v17 = v30;
      uint64_t v18 = 13;
    }
    else
    {
      v29[0] = @"-c";
      v29[1] = +[NSString stringWithFormat:@"%ld", a4];
      v29[2] = @"-B";
      v29[3] = a7;
      v29[4] = @"-I";
      v29[5] = a7;
      v29[6] = @"-i";
      v29[7] = +[NSString stringWithFormat:@"%f", *(void *)&a5];
      v29[8] = @"-s";
      v29[9] = +[NSString stringWithFormat:@"%ld", a8 + 56];
      v29[10] = a3;
      long long v17 = v29;
      uint64_t v18 = 11;
    }
    uint64_t v19 = +[NSArray arrayWithObjects:v17 count:v18];
    +[NSDate timeIntervalSinceReferenceDate];
    double v21 = v20;
    uint64_t v22 = +[NSMutableData dataWithCapacity:0];
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
    +[W5DiagnosticsManager __parsePingOutput:v22 result:v8];
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

- (id)__performCFPingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 trafficClass:(id)a6 networkServiceType:(id)a7 dataLength:(unint64_t)a8
{
  id v8 = 0;
  if (a3 && a4 <= 2147483646 && a5 < 2147483650.0)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v14 = v13;
    id v15 = +[NSMutableArray array];
    double v16 = 0.0;
    double v17 = 0.0;
    int64_t v47 = a4;
    if (a4 >= 1)
    {
      uint64_t v18 = kCFNetDiagnosticPingOptionTimeout;
      uint64_t v19 = kCFNetDiagnosticPingOptionPacketCount;
      uint64_t v20 = kCFNetDiagnosticPingOptionDataLength;
      uint64_t v49 = kCFNetDiagnosticPingOptionTrafficClass;
      uint64_t v48 = kCFNetDiagnosticPingOptionTypeOfService;
      int64_t v21 = v47;
      do
      {
        v60[0] = v18;
        v61[0] = +[NSNumber numberWithDouble:a5];
        v61[1] = &off_1000EAE10;
        v60[1] = v19;
        v60[2] = v20;
        v61[2] = +[NSNumber numberWithUnsignedInteger:a8];
        id v22 = [+[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:3] mutableCopy];
        id v23 = v22;
        if (a6) {
          [v22 setObject:a6 forKeyedSubscript:v49];
        }
        if (a7) {
          [v23 setObject:a7 forKeyedSubscript:v48];
        }
        +[NSDate timeIntervalSinceReferenceDate];
        double v25 = v24;
        CFTypeRef cf = 0;
        int v26 = CFNetDiagnosticPingWithOptions();
        +[NSDate timeIntervalSinceReferenceDate];
        if (v26)
        {
          double v17 = v17 + 1.0;
          [v15 addObject:[NSNumber numberWithDouble:((v27 - v25) * 1000.0)]];
        }
        --v21;
      }
      while (v21);
    }
    double v28 = 0.0;
    double v29 = 0.0;
    if ([v15 count])
    {
      unint64_t v30 = 0;
      double v16 = 0.0;
      do
      {
        [objc_msgSend(v15, "objectAtIndexedSubscript:", v30) doubleValue];
        double v29 = v29 + v31;
        if (v31 <= v16) {
          double v32 = v16;
        }
        else {
          double v32 = v31;
        }
        if (v31 < v28) {
          double v33 = v31;
        }
        else {
          double v33 = v28;
        }
        if (v30) {
          double v16 = v32;
        }
        else {
          double v16 = v31;
        }
        if (v30) {
          double v28 = v33;
        }
        else {
          double v28 = v31;
        }
        ++v30;
      }
      while (v30 < (unint64_t)[v15 count]);
    }
    long long v52 = 0u;
    long long v53 = 0u;
    double v34 = v29 / (double)(unint64_t)[v15 count];
    long long v54 = 0u;
    long long v55 = 0u;
    id v35 = [v15 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v53;
      double v38 = 0.0;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v53 != v37) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v52 + 1) + 8 * i) doubleValue];
          double v38 = v38 + (v40 - v34) * (v40 - v34);
        }
        id v36 = [v15 countByEnumeratingWithState:&v52 objects:v59 count:16];
      }
      while (v36);
    }
    else
    {
      double v38 = 0.0;
    }
    double v41 = sqrt(v38 / (double)(unint64_t)[v15 count]);
    id v8 = objc_alloc_init((Class)W5PingResult);
    [v8 setInterfaceName:[-[W5StatusManager wifi](self->_status, "wifi") interfaceName]];
    [v8 setAddress:a3];
    [v8 setCount:v47];
    [v8 setTimeout:a5];
    [v8 setWait:1.0];
    [v8 setInterval:1.0];
    [v8 setTrafficClass:[a6 integerValue]];
    [v8 setDataLength:a8];
    [v8 setMin:v28];
    [v8 setMax:v16];
    [v8 setAvg:v34];
    [v8 setStddev:v41];
    [v8 setPacketLoss:((double)v47 - v17) / (double)v47];
    [v8 setStartedAt:v14];
    +[NSDate timeIntervalSinceReferenceDate];
    [v8 setEndedAt:];
    id v42 = v8;
    if (v8)
    {
      id v43 = objc_alloc_init((Class)W5Event);
      [v43 setEventID:34];
      [v8 endedAt];
      [v43 setTimestamp:];
      CFStringRef v57 = @"PingResult";
      id v58 = v8;
      [v43 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1)];
      pingCallback = (void (**)(id, id))self->_pingCallback;
      if (pingCallback) {
        pingCallback[2](pingCallback, v43);
      }
    }
  }
  return v8;
}

- (BOOL)__performCurlWithAddress:(id)a3
{
  id v4 = [(W5WiFiInterface *)[(W5StatusManager *)self->_status wifi] interfaceName];
  LOBYTE(v5) = 0;
  if (a3)
  {
    if (v4)
    {
      id v9 = a3;
      uint64_t v6 = +[NSArray arrayWithObjects:&v9 count:1];
      uint64_t v7 = +[NSMutableData dataWithCapacity:0];
      BOOL v5 = +[NSTask runTaskWithLaunchPath:@"/usr/local/bin/curl" arguments:v6 timeout:v7 outputData:0 errorData:0 launchHandler:0 didLaunch:1.6 error:0];
      if (v5) {
        LOBYTE(v5) = [[[objc_alloc((Class)NSString) initWithData:v7 encoding:4] length] != 0;
      }
    }
  }
  return v5;
}

+ (id)__performDNSResolution:(id)a3
{
  id v3 = CFHostCreateWithName(kCFAllocatorDefault, (CFStringRef)a3);
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  int started = CFHostStartInfoResolution(v3, kCFHostAddresses, 0);
  CFRetain(v4);
  dispatch_time_t v6 = dispatch_time(0, 1600000);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004ADCC;
  block[3] = &unk_1000DD380;
  block[4] = v4;
  dispatch_after(v6, global_queue, block);
  if (!started) {
    goto LABEL_8;
  }
  CFArrayRef Addressing = CFHostGetAddressing(v4, 0);
  CFArrayRef v9 = Addressing;
  if (Addressing)
  {
    if (CFArrayGetCount(Addressing))
    {
      CFArrayRef v9 = (const __CFArray *)[(__CFArray *)v9 copy];
      goto LABEL_6;
    }
LABEL_8:
    CFArrayRef v9 = 0;
  }
LABEL_6:
  CFRelease(v4);
  return v9;
}

+ (id)__networkServiceOrder
{
  id v2 = SCPreferencesCreate(kCFAllocatorDefault, @"wifivelocityd", 0);
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  id v4 = SCNetworkSetCopyCurrent(v2);
  if (v4)
  {
    BOOL v5 = v4;
    CFArrayRef ServiceOrder = SCNetworkSetGetServiceOrder(v4);
    CFArrayRef v7 = ServiceOrder;
    if (ServiceOrder)
    {
      if (CFArrayGetCount(ServiceOrder)) {
        CFArrayRef v7 = (const __CFArray *)[(__CFArray *)v7 copy];
      }
      else {
        CFArrayRef v7 = 0;
      }
    }
    CFRelease(v5);
  }
  else
  {
    CFArrayRef v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

+ (BOOL)__setNetworkServiceOrder:(id)a3
{
  id v4 = SCPreferencesCreate(kCFAllocatorDefault, @"wifivelocityd", 0);
  if (!v4) {
    return 0;
  }
  BOOL v5 = v4;
  if (SCPreferencesLock(v4, 1u))
  {
    dispatch_time_t v6 = SCNetworkSetCopyCurrent(v5);
    if (v6)
    {
      CFArrayRef v7 = v6;
      if (SCNetworkSetSetServiceOrder(v6, (CFArrayRef)a3)
        && SCPreferencesCommitChanges(v5)
        && SCPreferencesApplyChanges(v5))
      {
        usleep(0x186A0u);
        BOOL v8 = 1;
      }
      else
      {
        BOOL v8 = 0;
      }
      SCPreferencesUnlock(v5);
      CFRelease(v7);
      goto LABEL_9;
    }
    SCPreferencesUnlock(v5);
  }
  BOOL v8 = 0;
LABEL_9:
  CFRelease(v5);
  return v8;
}

- (BOOL)__performLoadViaNSURLSessionWithAddress:(id)a3 usingTimeout:(id)a4 andForceWiFiInterface:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = 0;
  int64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  CFArrayRef v9 = dispatch_semaphore_create(0);
  uint64_t v10 = +[NSURL URLWithString:a3];
  if (v10)
  {
    if (a4) {
      [a4 doubleValue];
    }
    else {
      double v11 = 1.6;
    }
    dispatch_time_t v12 = +[NSURLRequest requestWithURL:v10 cachePolicy:1 timeoutInterval:v11];
    if (v12)
    {
      urlSession = self->_urlSession;
      if (urlSession
        || (double v14 = +[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"), (v15 = v14) != 0)&& ([(NSURLSessionConfiguration *)v14 setRequestCachePolicy:1], [(NSURLSessionConfiguration *)v15 setHTTPMaximumConnectionsPerHost:1], [(NSURLSessionConfiguration *)v15 setAllowsCellularAccess:!v5], urlSession = +[NSURLSession sessionWithConfiguration:v15], (self->_urlSession = urlSession) != 0))
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10004B1EC;
        v19[3] = &unk_1000DE848;
        v19[4] = v9;
        v19[5] = &v20;
        [(NSURLSessionDataTask *)[(NSURLSession *)urlSession dataTaskWithRequest:v12 completionHandler:v19] resume];
        dispatch_time_t v16 = dispatch_time(0, 80000000000);
        if (dispatch_semaphore_wait(v9, v16) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134349056;
          uint64_t v25 = 0x4054000000000000;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
        }
        [(NSURLSession *)self->_urlSession resetWithCompletionHandler:&stru_1000DE868];
      }
    }
  }
  char v17 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v17;
}

- (id)completedTestCallback
{
  return self->_completedTestCallback;
}

- (id)pingCallback
{
  return self->_pingCallback;
}

@end