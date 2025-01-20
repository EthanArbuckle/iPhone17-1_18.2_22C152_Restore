@interface WRM_BWEvalManager
+ (id)WRM_BWEvalManagerSingleton;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)doesIRATClientSubscriptionContextExist;
- (BOOL)enableiRATManager;
- (BOOL)isCallKitAppInDenyList:(id)a3;
- (BOOL)isCellStreamingExitCriteriaMet;
- (BOOL)isConnectedLinkStreamingQualityGood;
- (BOOL)isCoreMediaStreamingActive;
- (BOOL)isSmartDataModeEnabled;
- (BOOL)isStreamingAppForeground;
- (BOOL)isWiFiPrimary;
- (BOOL)needWiFiLQM;
- (WRM_BWEvalManager)autorelease;
- (WRM_BWEvalManager)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getQueue;
- (id)getSpeedTestMetrics;
- (id)getiRATClientFromList:(int)a3;
- (int)evaluateLink:(unint64_t)a3 :(int)a4 :(int)a5;
- (int)getDeltaIPStats:(unint64_t *)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unint64_t *)a6;
- (unint64_t)getLPMState;
- (unint64_t)retainCount;
- (unsigned)getMLPredictedCellBW;
- (unsigned)getMLPredictedWiFiBW;
- (unsigned)getPredictedCellBW:(double *)a3 backhaul:(double)a4;
- (unsigned)getPredictedWiFiBW:(double *)a3 backhaul:(double)a4;
- (unsigned)getPredictedWiFiBandwidth:(double *)a3;
- (void)addiRatClient:(id)a3;
- (void)calcAdjustedBandwith:(id *)a3 :(float)a4;
- (void)createMLModel;
- (void)dealloc;
- (void)deleteiRATClient:(int)a3;
- (void)evaluateCellularBandwidth:(id *)a3;
- (void)evaluateSDMBWChangeNotification:(unint64_t)a3;
- (void)evaluateWiFiBandwidth:(id *)a3;
- (void)evaluateWiFiLink;
- (void)existingContexts;
- (void)feedAWDCoreWiFiMetrics;
- (void)feedAWDRadioStats;
- (void)feedAWDStreamingStats:(id *)a3;
- (void)getInitialIPStats;
- (void)handleAppStateChange:(id)a3;
- (void)handleCellularDataMetricsRequest:(id)a3;
- (void)handleControllerAvailability:(unint64_t)a3;
- (void)handleEnhancedBufferingNotificatione:(id)a3;
- (void)handleGetMLPredictedThroughput:(id)a3;
- (void)handleGetStreamingMetrics:(id)a3;
- (void)handleIMGVideoClientRegisterd;
- (void)handleInternalMessage:(id)a3;
- (void)handleLinkPrefSubscribe:(id)a3;
- (void)handleNrPhyMetricsRequest:(id)a3;
- (void)handleQSHMetrics:(id)a3;
- (void)handleSessionNotification:(id)a3;
- (void)handleStreamingStateChange:(int)a3 appId:(id)a4;
- (void)handleSubscribeStatusUpdate:(id)a3 :(BOOL)a4;
- (void)handleUpdateStallMessage:(id)a3;
- (void)handleVoIPStateChange:(int)a3 appId:(id)a4;
- (void)handleVoIPStateChangeConference:(int)a3 appId:(id)a4;
- (void)handleWiFiMetricsRequest:(id)a3;
- (void)handleWiFiRegistered;
- (void)handleWiFiStateChaneEvents:(id)a3;
- (void)notifyEHBState:(unsigned __int8)a3;
- (void)notifyScreenStatePassCodeNotEnabled:(int)a3;
- (void)notifyStreamingState:(unsigned __int8)a3 :(unsigned int)a4;
- (void)processSessionStatusUpdate:(id)a3;
- (void)queryInterfaceStats:(const char *)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unint64_t *)a6 :(unint64_t *)a7;
- (void)registerLPMNotifier;
- (void)registerWebkitStreamingNotification;
- (void)removeiRatClient:(id)a3;
- (void)resetStreamingState:(BOOL)a3;
- (void)sendMessage:(int)a3 withMsg:(id)a4;
- (void)startPeriodicTask:(double)a3 :(id)a4;
- (void)stopPeriodicTask;
- (void)subscribeAppStateChangeEvent;
- (void)subscribeForDeviceLockStateInfo;
- (void)subscribeForScreenStateInfo;
- (void)unSubscribeAppStateChangeEvent;
- (void)unSubscribeForDeviceLockStateInfo;
- (void)unSubscribeForScreenStateInfo;
- (void)updateControllerSession:(id)a3 ofId:(unint64_t)a4;
- (void)updateControllerState:(id)a3;
- (void)updateDLBWEstimation:(unsigned int)a3 :(unsigned int)a4;
- (void)updateLPMState;
- (void)updateNRQSHMetrics:(unsigned int)a3 :(unsigned int)a4 :(unsigned int)a5;
- (void)updateQSHMetrics:(unsigned int)a3 :(unsigned int)a4 :(unsigned int)a5 :(unsigned int)a6;
@end

@implementation WRM_BWEvalManager

- (BOOL)doesIRATClientSubscriptionContextExist
{
  obj = self->miRATClientContexts;
  objc_sync_enter(obj);
  id v3 = [(NSMutableArray *)self->miRATClientContexts count];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, @"%s: iRAT client count:%d.", "-[WRM_BWEvalManager doesIRATClientSubscriptionContextExist]", v3);
  if (!v3)
  {
    +[WCM_Logging logLevel:28 message:@" No iRAT client available."];
    goto LABEL_11;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  miRATClientContexts = self->miRATClientContexts;
  id v5 = [(NSMutableArray *)miRATClientContexts countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5)
  {
LABEL_11:
    char v6 = 0;
    goto LABEL_12;
  }
  char v6 = 0;
  uint64_t v7 = *(void *)v13;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(miRATClientContexts);
      }
      id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) getHandoverContexts];
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, @"%s: iRAT client Context count:%d.", "-[WRM_BWEvalManager doesIRATClientSubscriptionContextExist]", [v9 count]);
      v6 |= [v9 count] != 0;
    }
    id v5 = [(NSMutableArray *)miRATClientContexts countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v5);
LABEL_12:
  objc_sync_exit(obj);
  return v6 & 1;
}

- (BOOL)isCallKitAppInDenyList:(id)a3
{
  return [a3 isEqualToString:@"net.whatsapp.WhatsApp"];
}

- (void)handleAppStateChange:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100013174;
  v3[3] = &unk_10020DAB0;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async([+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getQueue], v3);
}

- (void)registerLPMNotifier
{
  if (!qword_10027CE08)
  {
    qword_10027CE08 = (uint64_t)dispatch_queue_create("com.apple.WRM.BatterySaverWatcher", 0);
    objc_initWeak(&location, self);
    id v3 = qword_10027CE08;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003A894;
    handler[3] = &unk_10020D958;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch("com.apple.system.lowpowermode", &dword_10027CE10, v3, handler);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003A8D8;
    block[3] = &unk_10020D980;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)qword_10027CE08, block);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (BOOL)needWiFiLQM
{
  BOOL v2 = [(WRM_BWEvalManager *)self doesIRATClientSubscriptionContextExist];
  id v3 = "NO";
  if (v2) {
    id v3 = "YES";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, @"%s: needWiFiLQM? %s ", "-[WRM_BWEvalManager needWiFiLQM]", v3);
  return v2;
}

+ (id)WRM_BWEvalManagerSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071B24;
  block[3] = &unk_10020D980;
  block[4] = a1;
  if (qword_10027D050 != -1) {
    dispatch_once(&qword_10027D050, block);
  }
  return (id)qword_10027D058;
}

- (void)queryInterfaceStats:(const char *)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unint64_t *)a6 :(unint64_t *)a7
{
  size_t size = 0;
  *(_OWORD *)v22 = xmmword_1001E7C90;
  uint64_t v23 = 6;
  sysctl(v22, 6u, 0, &size, 0, 0);
  v8 = (unsigned __int16 *)malloc_type_malloc(size, 0xB5F3D015uLL);
  sysctl(v22, 6u, v8, &size, 0, 0);
  if ((uint64_t)size < 1)
  {
    unint64_t v12 = 0;
    unint64_t v11 = 0;
    unint64_t v10 = 0;
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    unint64_t v13 = (unint64_t)v8 + size;
    long long v14 = v8;
    do
    {
      uint64_t v15 = *v14;
      if (*((unsigned char *)v14 + 3) == 18 && *((unsigned char *)v14 + 161) == 18)
      {
        size_t v16 = *((unsigned __int8 *)v14 + 165) >= 0x3Fu ? 63 : *((unsigned __int8 *)v14 + 165);
        if (v16) {
          memcpy(__dst, v14 + 84, v16);
        }
        else {
          size_t v16 = 0;
        }
        __dst[v16] = 0;
        if (!strcmp(a3, __dst))
        {
          v10 += *((void *)v14 + 7);
          v9 += *((void *)v14 + 9);
          v12 += *((void *)v14 + 12);
          v11 += *((void *)v14 + 13);
        }
      }
      long long v14 = (unsigned __int16 *)((char *)v14 + v15);
    }
    while ((unint64_t)v14 < v13);
  }
  if (a5) {
    *a5 = v10;
  }
  if (a4) {
    *a4 = v9;
  }
  if (a6) {
    *a6 = v11;
  }
  if (a7) {
    *a7 = v12;
  }
  if (v8) {
    free(v8);
  }
}

- (unint64_t)getLPMState
{
  uint64_t state64 = 0;
  if (!dword_10027CE10) {
    return 0;
  }
  notify_get_state(dword_10027CE10, &state64);
  return state64;
}

- (void)updateLPMState
{
  unint64_t v2 = [(WRM_BWEvalManager *)self getLPMState];
  if (byte_10027CE14 != (v2 != 0))
  {
    byte_10027CE14 = v2 != 0;
    +[WCM_Logging logLevel:24, @"LPM state:%d", v2 != 0 message];
  }
}

- (void)registerWebkitStreamingNotification
{
  if (!notify_register_check("com.apple.WebKit.mediaStreamingActivity", &dword_10027C870))
  {
    uint64_t state64 = 0;
    notify_get_state(dword_10027C870, &state64);
    +[WCM_Logging logLevel:24 message:@"registerWebkitStreamingNotification:notify_register_dispatch called"];
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    char v7 = 0;
    v4[0] = 0;
    v4[1] = v4;
    v4[2] = 0x2020000000;
    char v5 = 0;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003AA5C;
    v3[3] = &unk_10020D9A8;
    v3[5] = v6;
    void v3[6] = v4;
    v3[4] = self;
    if (!notify_register_dispatch("com.apple.WebKit.mediaStreamingActivity", &dword_10027C870, (dispatch_queue_t)&_dispatch_main_q, v3))+[WCM_Logging logLevel:24 message:@"registerWebkitStreamingNotification:exit"]; {
    _Block_object_dispose(v4, 8);
    }
    _Block_object_dispose(v6, 8);
  }
}

- (void)subscribeAppStateChangeEvent
{
  if ([(WRM_BWEvalManager *)self isSmartDataModeEnabled])
  {
    [(WRM_BWEvalManager *)self registerWebkitStreamingNotification];
    qword_10027CDE0 = (uint64_t)objc_alloc_init((Class)BKSApplicationStateMonitor);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100014020;
    v3[3] = &unk_10020D9D0;
    v3[4] = self;
    [(id)qword_10027CDE0 setHandler:v3];
    qword_10027CDF0 = (uint64_t)objc_alloc_init((Class)NSMutableSet);
    qword_10027CDF8 = (uint64_t)objc_alloc_init((Class)NSMutableSet);
  }
}

- (void)unSubscribeAppStateChangeEvent
{
  if ([(WRM_BWEvalManager *)self isSmartDataModeEnabled])
  {
    if (qword_10027CDE0)
    {

      qword_10027CDE0 = 0;
    }
    if (qword_10027CE08)
    {
      dispatch_release((dispatch_object_t)qword_10027CE08);
      qword_10027CE08 = 0;
    }
    notify_cancel(dword_10027CE10);
    dword_10027CE10 = 0;
    notify_cancel(dword_10027C870);
    dword_10027C870 = 0;
  }
  if (qword_10027CDF0)
  {
    [(id)qword_10027CDF0 removeAllObjects];
  }
  if (qword_10027CDF8)
  {
    [(id)qword_10027CDF8 removeAllObjects];
    unint64_t v2 = (void *)qword_10027CDF8;
  }
}

- (BOOL)isStreamingAppForeground
{
  return byte_10027CF60;
}

- (void)handleVoIPStateChangeConference:(int)a3 appId:(id)a4
{
  +[WCM_Logging logLevel:24, @"handleVoIPStateChangeConference state=%d appId=%@", *(void *)&a3, a4 message];
  if (a3 == 8)
  {
    [(id)qword_10027CDF0 addObject:a4];
    id v6 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
    uint64_t v7 = 1;
  }
  else
  {
    [(id)qword_10027CDF0 removeObject:a4];
    if ([(id)qword_10027CDF0 count])
    {
      +[WCM_Logging logLevel:24, @"handleVoIPStateChange skip rxVoIPAppNotification %@", qword_10027CDF0 message];
      return;
    }
    id v6 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
    uint64_t v7 = 0;
  }

  [v6 rxVoIPAppNotification:v7];
}

- (void)getInitialIPStats
{
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v6 = 0;
  mWiFi = self->mWiFi;
  if (mWiFi
    && [(WCM_WiFiService *)[(WCM_WiFiController *)mWiFi wifiService] isWiFiPrimaryInterface])
  {
    v4 = "en0";
  }
  else
  {
    id v5 = [[+[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton") getInternetInterfaceName];
    +[WCM_Logging logLevel:24, @"getInitialIPStats internetInterfaceName=%@", v5 message];
    if (v5) {
      v4 = (const char *)[v5 UTF8String];
    }
    else {
      v4 = "pdp_ip0";
    }
  }
  [(WRM_BWEvalManager *)self queryInterfaceStats:v4 :&v9 :&v8 :&v7 :&v6];
  qword_10027CF68 = v9;
  qword_10027CF70 = v8;
  qword_10027CF78 = v7;
  qword_10027CF80 = v6;
  +[WCM_Logging logLevel:24, @"sPackets: %llu, rPackets: %llu, txBytes: %llu, rxBytes: %llu", v9, v8, v7, v6 message];
}

- (int)getDeltaIPStats:(unint64_t *)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unint64_t *)a6
{
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  int v11 = [[WRM_SCService WRM_SCServiceControllerSingleton] isWiFiPrimary];
  if (v11)
  {
    unint64_t v12 = "en0";
  }
  else
  {
    id v13 = [[+[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton") getInternetInterfaceName];
    +[WCM_Logging logLevel:24, @"getDeltaIPStats internetInterfaceName=%@", v13 message];
    if (v13) {
      unint64_t v12 = (const char *)[v13 UTF8String];
    }
    else {
      unint64_t v12 = "pdp_ip0";
    }
  }
  [(WRM_BWEvalManager *)self queryInterfaceStats:v12 :&v22 :&v21 :&v20 :&v19];
  uint64_t v14 = v22;
  *a3 = v22 - qword_10027CF68;
  uint64_t v15 = v21;
  *a4 = v21 - qword_10027CF70;
  uint64_t v16 = v20;
  *a5 = v20 - qword_10027CF78;
  uint64_t v17 = v19;
  *a6 = v19 - qword_10027CF80;
  +[WCM_Logging logLevel:24, @"sPackets: %llu, rPackets: %llu, txBytes: %llu, rxBytes: %llu", v14, v15, v16, v17 message];
  qword_10027CF68 = v22;
  qword_10027CF70 = v21;
  qword_10027CF78 = v20;
  qword_10027CF80 = v19;
  +[WCM_Logging logLevel:24, @"Delta TX: %llu, RX: %llu, RX Bytes: %llu, TX Bytes: %llu", *a3, *a4, *a6, *a5 message];
  return v11;
}

- (void)startPeriodicTask:(double)a3 :(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003B140;
  void v4[3] = &unk_10020DA20;
  *(double *)&v4[7] = a3;
  v4[5] = self;
  v4[6] = a4;
  dispatch_async([+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getQueue], v4);
}

- (void)stopPeriodicTask
{
  if (qword_10027CE00)
  {
    dispatch_source_cancel((dispatch_source_t)qword_10027CE00);
    dispatch_release((dispatch_object_t)qword_10027CE00);
    qword_10027CE00 = 0;
  }
}

- (void)handleVoIPStateChange:(int)a3 appId:(id)a4
{
  +[WCM_Logging logLevel:24, @"handleVoIPStateChange state= %d, appId=%@", *(void *)&a3, a4 message];
  if (a3 == 8)
  {
    [(id)qword_10027CDF0 addObject:a4];
    [(WRM_BWEvalManager *)self getInitialIPStats];
    [(WRM_BWEvalManager *)self startPeriodicTask:&stru_10020DA60 :5.0];
  }
  else
  {
    [(id)qword_10027CDF0 removeObject:a4];
    if ([(id)qword_10027CDF0 count])
    {
      +[WCM_Logging logLevel:24, @"handleVoIPStateChange skip rxVoIPAppNotification %@", qword_10027CDF0 message];
    }
    else
    {
      [(WRM_BWEvalManager *)self stopPeriodicTask];
      id v7 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
      [v7 rxVoIPAppNotification:0];
    }
  }
}

- (void)handleStreamingStateChange:(int)a3 appId:(id)a4
{
  +[WCM_Logging logLevel:24, @"handleStreamingStateChange state=%d appId=%@", *(void *)&a3, a4 message];
  if (a3 == 8)
  {
    [(WRM_BWEvalManager *)self getInitialIPStats];
    byte_10027CF60 = 1;
    [(id)qword_10027CDF8 addObject:a4];
    +[WCM_Logging logLevel:24, @"FG Streaming app active: %d, LPM Mode: %d", byte_10027CF60, byte_10027CE14 message];
    dispatch_time_t v7 = dispatch_time(0, 10000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003B730;
    block[3] = &unk_10020D980;
    block[4] = self;
    dispatch_after(v7, (dispatch_queue_t)[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getQueue], block);
  }
  else
  {
    [(id)qword_10027CDF8 removeObject:a4];
    if ([(id)qword_10027CDF8 count])
    {
      +[WCM_Logging logLevel:24, @"handleStreamingStateChange skip rxVoIPAppNotification %@", qword_10027CDF8, v8 message];
    }
    else
    {
      byte_10027CF60 = 0;
      [(WRM_BWEvalManager *)self stopPeriodicTask];
      if (byte_10027CDE9)
      {
        [(WRM_BWEvalManager *)self notifyStreamingState:2 :0];
        byte_10027CDE9 = 0;
      }
      +[WCM_Logging logLevel:24, @"FG Streaming app active: %d, LP Mode: %d", byte_10027CF60, byte_10027CE14 message];
    }
  }
}

- (BOOL)isSmartDataModeEnabled
{
  id v2 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];

  return [v2 isRecentDevice];
}

- (void)resetStreamingState:(BOOL)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B988;
  block[3] = &unk_10020DAD0;
  BOOL v4 = a3;
  dispatch_async([+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getQueue], block);
}

- (void)handleInternalMessage:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, @"%s: internalMsg: %@", "-[WRM_BWEvalManager(privateFunctions) handleInternalMessage:]", a3);
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kInternalMessageId");
  if (uint64 == 1040 || uint64 == 1003) {
    CFStringRef v7 = @"handleInternalMessage:evaluateWiFiLink";
  }
  else {
    CFStringRef v7 = @"handleInternalMessage:default";
  }
  +[WCM_Logging logLevel:28 message:v7];

  [(WRM_BWEvalManager *)self evaluateWiFiLink];
}

- (void)handleUpdateStallMessage:(id)a3
{
  +[WCM_Logging logLevel:28 message:@"iRAT Video BW Mgr: handleUpdateStallMessage, Stall detected"];
  mWrmiRATStreaming = self->mWrmiRATStreaming;
  mWrmiRATStreaming->event = 2;
  mWrmiRATStreaming->numStall = 1;
  ++self->mStreamingTotalStallDetected;
  mProximityMsgQueue = self->mProximityMsgQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006EEF8;
  block[3] = &unk_10020D980;
  void block[4] = self;
  dispatch_async(mProximityMsgQueue, block);
}

- (void)handleGetMLPredictedThroughput:(id)a3
{
  +[WCM_Logging logLevel:28 message:@"Called handleGetMLPredictedThroughput"];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  int64_t int64 = xpc_dictionary_get_int64(value, "WRMMLPredictedThroughput_linkType");
  int64_t v7 = int64;
  if (int64 == -1)
  {
    if (objc_msgSend(objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getWiFiService"), "isWiFiPrimaryInterface"))
    {
      uint64_t v8 = [(WRM_BWEvalManager *)self getMLPredictedWiFiBW];
      +[WCM_Logging logLevel:28, @"WiFiThroughputEstimation: primary interface: WiFi handleGetMLPredictedThroughput: link: %llu, mlpredictedThroughput: %u", -1, v8 message];
    }
    else
    {
      uint64_t v8 = [(WRM_BWEvalManager *)self getMLPredictedCellBW];
      +[WCM_Logging logLevel:28, @"CellularThroughputEstimation: primary interface: Cellular handleGetMLPredictedThroughput: link: %llu, mlpredictedThroughput: %u", -1, v8 message];
    }
  }
  else if (int64)
  {
    if (int64 == 1)
    {
      uint64_t v8 = [(WRM_BWEvalManager *)self getMLPredictedWiFiBW];
      +[WCM_Logging logLevel:28, @"WiFiThroughputEstimation: handleGetMLPredictedThroughput: link: %llu, mlpredictedThroughput: %u", 1, v8 message];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = [(WRM_BWEvalManager *)self getMLPredictedCellBW];
    +[WCM_Logging logLevel:28, @"CellularThroughputEstimation: handleGetMLPredictedThroughput: link: %llu, mlpredictedThroughput: %u", 0, v8 message];
  }
  +[WCM_Logging logLevel:28, @"handleGetMLPredictedThroughput: link: %llu, mlpredictedThroughput: %u", v7, v8 message];
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    unint64_t v10 = reply;
    xpc_dictionary_set_uint64(reply, "WRMMLPredictedThroughput_CoreMedia", v8);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    xpc_connection_send_message(remote_connection, v10);
    +[WCM_Logging logLevel:28, @"Sending response to handleGetMLPredictedThroughput message %@", v10 message];
    xpc_release(v10);
  }
  else
  {
    +[WCM_Logging logLevel:28 message:@"Do not post handleGetMLPredictedThroughput reply is NULL"];
  }
}

- (void)handleGetStreamingMetrics:(id)a3
{
  +[WCM_Logging logLevel:28 message:@"Called handleGetStreamingMetrics"];
  [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getSymptomsService];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  xpc_dictionary_get_uint64(value, "WRMGetStreamingMetrics_linkType");
  uint64_t mHarvestedLatency = self->mHarvestedLatency;
  if (self->mStreamingSessionActive)
  {
    BOOL mStreamingSessionActive = 1;
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = [(WRM_BWEvalManager *)self isStreamingAppForeground];
    BOOL mStreamingSessionActive = self->mStreamingSessionActive;
  }
  +[WCM_Logging logLevel:28, @"handleGetStreamingMetrics: session active: %d, BW: %d", mStreamingSessionActive, self->mHarvestedBW message];
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    unint64_t v10 = reply;
    xpc_dictionary_set_BOOL(reply, "isValid", v8);
    xpc_dictionary_set_uint64(v10, "MaxBW", self->mHarvestedBW);
    xpc_dictionary_set_uint64(v10, "StallDetected", self->mStreamingStallDetected);
    xpc_dictionary_set_uint64(v10, "AvgRTT", mHarvestedLatency);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    xpc_connection_send_message(remote_connection, v10);
    +[WCM_Logging logLevel:28, @"Sending response to handleGetStreamingMetrics message %@", v10 message];
    xpc_release(v10);
  }
  else
  {
    +[WCM_Logging logLevel:28 message:@"Do not post handleGetStreamingMetrics reply is NULL"];
  }
}

- (void)handleQSHMetrics:(id)a3
{
  +[WCM_Logging logLevel:28 message:@"Called handleQSHMetrics"];
  xpc_dictionary_get_value(a3, "kMessageArgs");
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    id v5 = reply;
    xpc_dictionary_set_uint64(reply, "totalCellularBW", dword_10027CE88);
    xpc_dictionary_set_uint64(v5, "nrConfiguredBW", dword_10027CE94);
    xpc_dictionary_set_uint64(v5, "totalLayers", dword_10027CE8C);
    xpc_dictionary_set_uint64(v5, "nrLayers", dword_10027CE98);
    xpc_dictionary_set_uint64(v5, "lteMaxScheduledLayers", dword_10027CE98);
    xpc_dictionary_set_uint64(v5, "nrModulation", dword_10027CE9C);
    xpc_dictionary_set_uint64(v5, "totalCCs", dword_10027CE84);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    xpc_connection_send_message(remote_connection, v5);
    +[WCM_Logging logLevel:28, @"Sending response to handleQSHMetrics message %@", v5 message];
    xpc_release(v5);
  }
  else
  {
    +[WCM_Logging logLevel:28 message:@"Do not post handleQSHMetrics reply is NULL"];
  }
}

- (void)handleSessionNotification:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, @"%s: message: %@", "-[WRM_BWEvalManager(privateFunctions) handleSessionNotification:]", a3);
  int64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64 > 422)
  {
    if (uint64 > 2000)
    {
      switch(uint64)
      {
        case 2001:
          [(WRM_BWEvalManager *)self handleCellularDataMetricsRequest:a3];
          return;
        case 2002:
          [(WRM_BWEvalManager *)self handleQSHMetrics:a3];
          return;
        case 2100:
          [(WRM_BWEvalManager *)self handleWiFiMetricsRequest:a3];
          return;
      }
    }
    else
    {
      switch(uint64)
      {
        case 423:
          [(WRM_BWEvalManager *)self handleGetMLPredictedThroughput:a3];
          return;
        case 1000:
          xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
          [(WRM_BWEvalManager *)self handleInternalMessage:value];
          return;
        case 2000:
          [(WRM_BWEvalManager *)self handleNrPhyMetricsRequest:a3];
          return;
      }
    }
LABEL_52:
    +[WCM_Logging logLevel:28 message:@"handleSessionNotification:default"];
    return;
  }
  if (uint64 > 411)
  {
    switch(uint64)
    {
      case 412:
        [(WRM_BWEvalManager *)self handleUpdateStallMessage:a3];
        return;
      case 417:
        [(WRM_BWEvalManager *)self handleGetStreamingMetrics:a3];
        return;
      case 418:
        [(WRM_BWEvalManager *)self handleEnhancedBufferingNotificatione:a3];
        return;
    }
    goto LABEL_52;
  }
  switch(uint64)
  {
    case 103:
      [(WRM_BWEvalManager *)self handleWiFiStateChaneEvents:a3];
      break;
    case 404:
      [(WRM_BWEvalManager *)self handleLinkPrefSubscribe:a3];
      break;
    case 405:
      [(WRM_BWEvalManager *)self handleSubscribeStatusUpdate:a3 :1];
      return;
    default:
      goto LABEL_52;
  }
}

- (void)handleWiFiMetricsRequest:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  if ((uint64 - 1) >= 0x15)
  {
    id v5 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      id v5 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    id v5 = off_10020ED90[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s Message received from client %d(%s) ", "-[WRM_BWEvalManager(privateFunctions) handleWiFiMetricsRequest:]", uint64, v5);
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F84C;
  block[3] = &unk_10020D980;
  void block[4] = self;
  dispatch_async(mQueue, block);
}

- (void)handleCellularDataMetricsRequest:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  if ((uint64 - 1) >= 0x15)
  {
    id v5 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      id v5 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    id v5 = off_10020ED90[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s Message received from client %d(%s) ", "-[WRM_BWEvalManager(privateFunctions) handleCellularDataMetricsRequest:]", uint64, v5);
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FC6C;
  block[3] = &unk_10020D980;
  void block[4] = self;
  dispatch_async(mQueue, block);
}

- (void)handleNrPhyMetricsRequest:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  if ((uint64 - 1) >= 0x15)
  {
    id v5 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      id v5 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    id v5 = off_10020ED90[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s Message received from client %d(%s) ", "-[WRM_BWEvalManager(privateFunctions) handleNrPhyMetricsRequest:]", uint64, v5);
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FF3C;
  block[3] = &unk_10020D980;
  void block[4] = self;
  dispatch_async(mQueue, block);
}

- (void)handleEnhancedBufferingNotificatione:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  xpc_object_t v4 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  size_t count = xpc_array_get_count(v4);
  if (count)
  {
    size_t v6 = count;
    size_t v7 = 0;
    unsigned __int8 v8 = 0;
    do
    {
      xpc_object_t v9 = xpc_array_get_value(v4, v7);
      if (xpc_dictionary_get_value(v9, "kMaxElgBrate"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, @"%s: Received status update with Eligible bit rate ", "-[WRM_BWEvalManager(privateFunctions) handleEnhancedBufferingNotificatione:]");
        uint64_t uint64 = xpc_dictionary_get_uint64(v9, "kMaxElgBrate");
        if (uint64) {
          unsigned __int8 v8 = 2 * (uint64 == 0x1FFFFFFFFFFFFFLL);
        }
        else {
          unsigned __int8 v8 = 1;
        }
      }
      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  [(WRM_BWEvalManager *)self notifyEHBState:v8];
}

- (void)handleLinkPrefSubscribe:(id)a3
{
  +[WCM_Logging logLevel:28 message:@"BW Link Eval Manager: handleLinkPrefSubscribe."];
  [(NSDate *)self->mCMStatusUpdateEvaluationTimer timeIntervalSinceNow];
  self->mTimeSinceCMStatusEvaluationStarted = v5;
  dword_10027CEAC = 0;
  *(void *)&self->mDeviation = 0;
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  id v8 = [(WRM_BWEvalManager *)self getiRATClientFromList:uint64];
  if ((uint64 - 1) >= 0x15)
  {
    xpc_object_t v9 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      xpc_object_t v9 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    xpc_object_t v9 = off_10020ED90[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:28, @"Message received from client %d(%s) ", uint64, v9 message];
  xpc_object_t v10 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  size_t count = xpc_array_get_count(v10);
  if (count)
  {
    size_t v12 = count;
    uint64_t v19 = self;
    [v8 removeAllMobilityContextsFromList];
    +[WCM_Logging logLevel:24 message:@"Removing all contexts from iRAT client."];
    for (size_t i = 0; i != v12; ++i)
    {
      xpc_object_t v14 = xpc_array_get_value(v10, i);
      uint64_t v15 = xpc_dictionary_get_uint64(v14, "kWRMApplicationType");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, @"%s: Record#= %d Application Type=%llu", "-[WRM_BWEvalManager(privateFunctions) handleLinkPrefSubscribe:]", i, v15);
      uint64_t v16 = objc_alloc_init(WRM_Mobility_Context);
      [(WRM_Mobility_Context *)v16 setApplicationType:v15];
      [(WRM_Mobility_Context *)v16 activateMobilityContext:1];
      [v8 addMobilityContextToList:v16];
    }
LABEL_11:
    [(WRM_BWEvalManager *)v19 evaluateWiFiLink];
    if (v19->mWiFi && (objc_opt_respondsToSelector() & 1) != 0)
    {
      mWiFsize_t i = v19->mWiFi;
      BOOL v18 = [(WRM_BWEvalManager *)v19 needWiFiLQM];
      [(WCM_WiFiController *)mWiFi toggleWiFiLQMIfNeeded:v18];
    }
    return;
  }
  if ([(WRM_BWEvalManager *)self doesIRATClientSubscriptionContextExist])
  {
    uint64_t v19 = self;
    [v8 removeAllMobilityContextsFromList];
    +[WCM_Logging logLevel:24 message:@"Removing all contexts from iRAT client."];
    goto LABEL_11;
  }

  +[WCM_Logging logLevel:28 message:@"Ignoring un-subscribe message from a client for which subscription does not exist"];
}

- (BOOL)isCoreMediaStreamingActive
{
  return self->mStreamingConnectionReferenceCount != 0;
}

- (void)processSessionStatusUpdate:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kWRMVideoStreamingStarted");
  unint64_t mStreamingConnectionReferenceCount = self->mStreamingConnectionReferenceCount;
  if (uint64)
  {
    self->unint64_t mStreamingConnectionReferenceCount = mStreamingConnectionReferenceCount + 1;
    if ([(WRM_BWEvalManager *)self isWiFiPrimary])
    {
      unint64_t mAchievedMaxWiFiBW = self->mAchievedMaxWiFiBW;
      mWrmiRATStreaming = self->mWrmiRATStreaming;
      mWrmiRATStreaming->pActualLowBandwidth = self->mAchievedPreviousWiFiBW;
      mWrmiRATStreaming->maxOfActualLowBandwidth = mAchievedMaxWiFiBW;
      dword_10027CEA4 = [(WRM_BWEvalManager *)self getMLPredictedWiFiBW];
    }
    else
    {
      xpc_object_t v9 = self->mWrmiRATStreaming;
      if (self->mStreamingConnectionReferenceCount == 1) {
        char v10 = 1;
      }
      else {
        char v10 = 2;
      }
      v9->coldStartTypeCellular = v10;
      unint64_t mAchievedMaxCellBW = self->mAchievedMaxCellBW;
      v9->pActualLowBandwidth = self->mAchievedPreviousCellBW;
      v9->maxOfActualLowBandwidth = mAchievedMaxCellBW;
      dword_10027CEA0 = [(WRM_BWEvalManager *)self getMLPredictedCellBW];
    }
  }
  else
  {
    self->unint64_t mStreamingConnectionReferenceCount = mStreamingConnectionReferenceCount - 1;
  }
  unint64_t v12 = self->mStreamingConnectionReferenceCount;
  if (v12 == 1)
  {
    self->BOOL mStreamingSessionActive = 1;
    dword_10027CE80 = 0;
    self->mMovAVGAchievedBW = 0.0;
    self->mHarvestedBW = 0;
    self->uint64_t mHarvestedLatency = 0;
    [(WRM_BWEvalManager *)self notifyStreamingState:1 :0];
    unint64_t v12 = self->mStreamingConnectionReferenceCount;
  }
  if (!v12)
  {
    self->BOOL mStreamingSessionActive = 0;
    dword_10027CE80 = 0;
    self->mMovAVGAchievedBW = 0.0;
    self->mHarvestedBW = 0;
    self->uint64_t mHarvestedLatency = 0;
    [(WRM_BWEvalManager *)self notifyStreamingState:2 :0];
  }
  self->mStreamingConnectionExpectedTimeHorizon = xpc_dictionary_get_uint64(a3, "kWRMExpectedTimeHorizon");
  self->mStreamingStallDetected = xpc_dictionary_get_uint64(a3, "kWRMVideoStreamingNumStallDetected");
  self->mStreamingFatalErrorDetected = xpc_dictionary_get_uint64(a3, "kWRMVideoStreamingFatalErrorDetected") != 0;
  self->mStreamingTotalStallDuration = xpc_dictionary_get_uint64(a3, "kWRMVideoStreamingTotalStallTime");
  +[WCM_Logging logLevel:28, @"processSessionStatusUpdate: reference count: %lld", self->mStreamingConnectionReferenceCount message];

  [(WRM_BWEvalManager *)self notifyCommCenterManager];
}

- (void)evaluateSDMBWChangeNotification:(unint64_t)a3
{
  if ([(WCM_WiFiService *)[(WCM_WiFiController *)self->mWiFi wifiService] isWiFiPrimaryInterface])
  {
    return;
  }
  float mMovAVGAchievedBW = self->mMovAVGAchievedBW;
  if (mMovAVGAchievedBW >= 15000.0)
  {
    int v6 = 1;
  }
  else
  {
    if (mMovAVGAchievedBW > 6500.0)
    {
LABEL_11:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, @"%s: SDM actul: %d, WghtAVG BW: %f", "-[WRM_BWEvalManager(privateFunctions) evaluateSDMBWChangeNotification:]", a3, mMovAVGAchievedBW);
      return;
    }
    int v6 = 2;
  }
  if (v6 == dword_10027CE80 || !self->mStreamingConnectionReferenceCount) {
    goto LABEL_11;
  }
  dword_10027CE80 = v6;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, @"%s: SDM recommendation changed, actul: %d, WghtAVG BW: %f", "-[WRM_BWEvalManager(privateFunctions) evaluateSDMBWChangeNotification:]", a3, mMovAVGAchievedBW);
  uint64_t v7 = self->mMovAVGAchievedBW;

  [(WRM_BWEvalManager *)self notifyStreamingState:0 :v7];
}

- (BOOL)isWiFiPrimary
{
  id v2 = +[WRM_SCService WRM_SCServiceControllerSingleton];
  if (v2)
  {
    LOBYTE(v2) = [v2 isWiFiPrimary];
  }
  return (char)v2;
}

- (void)handleSubscribeStatusUpdate:(id)a3 :(BOOL)a4
{
  self->mWrmiRATStreaming->event = 1;
  [(WRM_BWEvalManager *)self feedAWDRadioStats];
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  uint64_t v7 = WRM_MotionController;
  if ((uint64 - 1) >= 0x15)
  {
    id v8 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      id v8 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    id v8 = off_10020ED90[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:28, @"iRAT Video BW Mgr: Status update Msg recvd from client %d(%s)", uint64, v8 message];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  xpc_object_t v10 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  size_t count = xpc_array_get_count(v10);
  if (count)
  {
    size_t v12 = count;
    for (size_t i = 0; v12 != i; ++i)
    {
      xpc_object_t v14 = xpc_array_get_value(v10, i);
      uint64_t v15 = xpc_dictionary_get_uint64(v14, "kWRMApplicationType");
      if (xpc_dictionary_get_value(v14, "kWRMVideoStreamingStarted"))
      {
        [&v7[50] logLevel:28 message:@"%s: reseting SDM recommendation", "-[WRM_BWEvalManager(privateFunctions) handleSubscribeStatusUpdate::]"];
        mProximityMsgQueue = self->mProximityMsgQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100070F20;
        block[3] = &unk_10020DAB0;
        void block[4] = self;
        void block[5] = v14;
        dispatch_async(mProximityMsgQueue, block);
        [&v7[50] logLevel:28, @"Streaming session active: %d, Contains BW achieved: %d", self->mStreamingSessionActive, 0, v48, v49, v50, v51, v52, v53, v54 message];
      }
      else
      {
        uint64_t v55 = v15;
        if (xpc_dictionary_get_value(v14, "kWRMStreamingDataSentCount"))
        {
          uint64_t v17 = v7;
          unsigned int v18 = xpc_dictionary_get_uint64(v14, "kWRMStreamingDataSentCount");
          unsigned int v19 = xpc_dictionary_get_uint64(v14, "kWRMStreamingDataSentDuration");
          unsigned int v20 = xpc_dictionary_get_uint64(v14, "kWRMCurrentLinkBandwidthAchieved");
          unsigned int v21 = xpc_dictionary_get_uint64(v14, "kSesLatency");
          unint64_t v22 = v18;
          if (!v18 || !v19 || !v20) {
            return;
          }
          uint64_t v7 = v17;
          self->mDataSent = v22;
          self->mDuration = v19;
          self->mHarvestedBW = v20;
          self->uint64_t mHarvestedLatency = v21;
          float mMovAVGAchievedBW = self->mMovAVGAchievedBW;
          float v24 = 12000.0;
          if (mMovAVGAchievedBW != 0.0) {
            float v24 = (double)v20 * 0.2 + mMovAVGAchievedBW * 0.8;
          }
          self->float mMovAVGAchievedBW = v24;
          -[WRM_BWEvalManager evaluateSDMBWChangeNotification:](self, "evaluateSDMBWChangeNotification:");
        }
        else if (!byte_10027CE7C)
        {
          return;
        }
        if ([(WRM_BWEvalManager *)self isWiFiPrimary])
        {
          unint64_t mAchievedWiFiBW = self->mAchievedWiFiBW;
          self->mAchievedPreviousBW = mAchievedWiFiBW;
          self->mAchievedPreviousWiFiBW = mAchievedWiFiBW;
          uint64_t v26 = xpc_dictionary_get_uint64(v14, "kWRMCurrentLinkBandwidthAchieved");
          self->unint64_t mAchievedBW = v26;
          self->unint64_t mAchievedWiFiBW = v26;
          unint64_t mAchievedMovAvgWiFiBW = self->mAchievedMovAvgWiFiBW;
          if (mAchievedMovAvgWiFiBW) {
            unint64_t v28 = (v26 - mAchievedMovAvgWiFiBW + 8 * mAchievedMovAvgWiFiBW) >> 3;
          }
          else {
            unint64_t v28 = v26;
          }
          self->unint64_t mAchievedMovAvgWiFiBW = v28;
          [&v7[50] logLevel:28 message:@"streaming on WiFi"];
        }
        else
        {
          unint64_t mAchievedCellBW = self->mAchievedCellBW;
          self->mAchievedPreviousCellBW = mAchievedCellBW;
          self->mAchievedPreviousBW = mAchievedCellBW;
          uint64_t v30 = xpc_dictionary_get_uint64(v14, "kWRMCurrentLinkBandwidthAchieved");
          self->unint64_t mAchievedBW = v30;
          self->unint64_t mAchievedCellBW = v30;
          if (self->mWrmiRATStreaming->coldStartTypeCellular) {
            byte_10027CEA8 = 1;
          }
          [&v7[50] logLevel:28 message:@"ThroughputPrediction: streaming on cellular: mAchievedCellBW: %llu" v30];
        }
        [&v7[50] logLevel:28, @"%s: Record#=%d, IMG Video Application Type=%llu,Achieved BW:%llu, Previous Achieved BW:%llu, Data Sent:%llu, Duration:%llu, mAchievedWiFiBW:%llu, mAchievedCellBW:%llu", "-[WRM_BWEvalManager(privateFunctions) handleSubscribeStatusUpdate::]", i, v55, self->mAchievedBW, self->mAchievedPreviousBW, self->mDataSent, self->mDuration, self->mAchievedWiFiBW, self->mAchievedCellBW message];
      }
    }
  }
  [(WRM_BWEvalManager *)self evaluateWiFiLink];
  [(NSDate *)self->mCMStatusUpdateEvaluationTimer timeIntervalSinceNow];
  double v32 = self->mTimeSinceCMStatusEvaluationStarted - v31;
  mWrmiRATStreaming = (int32x2_t *)self->mWrmiRATStreaming;
  float v34 = (float)self->mAchievedBW - (float)mWrmiRATStreaming[5].u32[1];
  float v35 = (float)(v34 + (float)(self->mMovingAvgDeviation * 7.0)) * 0.125;
  self->mDeviation = v34;
  self->mMovingAvgDeviation = v35;
  if (v32 >= 120.0 || byte_10027CE7C != 0 || byte_10027CEA8 != 0)
  {
    [(NSDate *)self->mCMStatusUpdateEvaluationTimer timeIntervalSinceNow];
    self->mTimeSinceCMStatusEvaluationStarted = v38;
    mWrmiRATStreaming = (int32x2_t *)self->mWrmiRATStreaming;
    if (mWrmiRATStreaming[47].i8[5])
    {
      int v39 = dword_10027CEAC;
      mWrmiRATStreaming[1].i32[0] = dword_10027CEAC;
      dword_10027CEAC = v39 + 1;
      mWrmiRATStreaming[46].i32[0] = self->mStreamingStallDetected;
      mWrmiRATStreaming[47].i8[0] = self->mStreamingFatalErrorDetected;
      unint64_t mAchievedBW = self->mAchievedBW;
      mWrmiRATStreaming[7] = vmovn_s64(*(int64x2_t *)&self->mDataSent);
      mWrmiRATStreaming[2].i32[1] = mWrmiRATStreaming[5].i32[0];
      mWrmiRATStreaming[3].i32[0] = mAchievedBW;
      mWrmiRATStreaming[4].i32[1] = (int)self->mMovingAvgDeviation;
      if ([(WRM_BWEvalManager *)self isWiFiPrimary])
      {
        unint64_t mAchievedMaxWiFiBW = self->mAchievedMaxWiFiBW;
        v42 = self->mWrmiRATStreaming;
        v42->pActualLowBandwidth = self->mAchievedPreviousWiFiBW;
        v42->maxOfActualLowBandwidth = mAchievedMaxWiFiBW;
        [&v7[50] logLevel:28 message:@"ThroughputPrediction streaming getMLPredictedWiFiBW mAchievedMaxWiFiBW=%llu" mAchievedMaxWiFiBW];
        [&v7[50] logLevel:28, @"Actual Throughput: %d, ThroughputPrediction: cell: %d, wifi: %d, cell_prediction_error: %f", self->mAchievedWiFiBW, 0, -[WRM_BWEvalManager getMLPredictedWiFiBW](self, "getMLPredictedWiFiBW"), 0 message];
      }
      else if (byte_10027CEA8)
      {
        if (self->mWrmiRATStreaming->coldStartTypeCellular == 1) {
          CFStringRef v43 = @"COLD START: Actual Throughput: %d, ThroughputPrediction: cell: %d, wifi: %d, cell_prediction_error: %f";
        }
        else {
          CFStringRef v43 = @"SEMI COLD START: Actual Throughput: %d, ThroughputPrediction: cell: %d, wifi: %d, cell_prediction_error: %f";
        }
        [&v7[50] logLevel:28 message:v43 self->mAchievedCellBW, dword_10027CEA0, dword_10027CEA4, (double)self->mAchievedCellBW / 1000.0 - (double)dword_10027CEA0 / 1000.0];
        byte_10027CEA8 = 0;
      }
      else
      {
        unint64_t mAchievedMaxCellBW = self->mAchievedMaxCellBW;
        v45 = self->mWrmiRATStreaming;
        v45->pActualLowBandwidth = self->mAchievedPreviousCellBW;
        v45->maxOfActualLowBandwidth = mAchievedMaxCellBW;
        [&v7[50] logLevel:28 message:@"ThroughputPrediction streaming getMLPredictedCellBW mAchievedMaxCellBW=%llu" mAchievedMaxCellBW];
        uint64_t v46 = [(WRM_BWEvalManager *)self getMLPredictedCellBW];
        [&v7[50] logLevel:28, @"Actual Throughput: %d, ThroughputPrediction: cell: %d, wifi: %d, cell_prediction_error: %f", self->mAchievedCellBW, v46, 0, (double)self->mAchievedCellBW / 1000.0 - (double)v46 / 1000.0 message];
      }
      [&v7[50] logLevel:28, @"%s: Sending AWD report Act Low BW =%llu, Est. Low BW =%llu, Deviation =%lld, data sent =%llu, duration= %llu", "-[WRM_BWEvalManager(privateFunctions) handleSubscribeStatusUpdate::]", self->mAchievedBW, self->mWrmiRATStreaming->estimatedLowBandwidth, self->mAchievedBW - self->mWrmiRATStreaming->estimatedLowBandwidth, self->mWrmiRATStreaming->cmDataSentCount, self->mWrmiRATStreaming->cmDataSentDuration message];
      v47 = self->mProximityMsgQueue;
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_100070F2C;
      v56[3] = &unk_10020D980;
      v56[4] = self;
      dispatch_async(v47, v56);
      mWrmiRATStreaming = (int32x2_t *)self->mWrmiRATStreaming;
    }
  }
  if (mWrmiRATStreaming[47].i8[5]) {
    [&v7[50] logLevel:28, @"%s: Act Low BW =%llu, Est. Low BW =%llu, Deviation =%.2f, Mov Deviation = %.2f", "-[WRM_BWEvalManager(privateFunctions) handleSubscribeStatusUpdate::]", self->mAchievedBW, mWrmiRATStreaming[5].u32[1], self->mDeviation, self->mMovingAvgDeviation message];
  }
}

- (void)evaluateWiFiLink
{
  uint64_t v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  +[WCM_Logging logLevel:28, @"Evaluate WIFI Link: Total number of IMG clients %zu.", [(NSMutableArray *)self->miRATClientContexts count] message];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obj = self->miRATClientContexts;
  id v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v35;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(obj);
        }
        xpc_object_t v4 = *(void **)(*((void *)&v34 + 1) + 8 * v3);
        unsigned int v5 = [v4 getMyClientType];
        int v6 = "ClientCommCenter";
        if (v5 != 1)
        {
          if (v5 - 2 >= 0x14)
          {
            int v6 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
            if (v5 == 22) {
              int v6 = "ClientCoreMediaStreaming";
            }
          }
          else
          {
            int v6 = off_10020EE38[v5 - 2];
          }
        }
        uint64_t v27 = v3;
        +[WCM_Logging logLevel:28, @"<%s>Evaluate WiFi Link: BEGIN.", v6 message];
        uint64_t v26 = v4;
        id v7 = [v4 getHandoverContexts];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v28 = v7;
        id v8 = [v7 countByEnumeratingWithState:&v30 objects:v41 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v29 = *(void *)v31;
          if (v5 == 22) {
            xpc_object_t v10 = "ClientCoreMediaStreaming";
          }
          else {
            xpc_object_t v10 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
          }
          uint64_t v11 = (int)(v5 - 2);
          do
          {
            for (size_t i = 0; i != v9; size_t i = (char *)i + 1)
            {
              if (*(void *)v31 != v29) {
                objc_enumerationMutation(v28);
              }
              id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              id v14 = [v13 getApplicationType];
              id v15 = [v13 getConnectedLinkType];
              id v16 = [v13 getRecommenedLinkType];
              uint64_t v17 = "ClientCommCenter";
              if (v5 != 1)
              {
                uint64_t v17 = v10;
                if (v11 <= 0x13) {
                  uint64_t v17 = off_10020EE38[v11];
                }
              }
              unsigned int v18 = "UNKNOWN_APP!!!";
              if (v14 == (id)2) {
                unsigned int v18 = "CT_Th_Call";
              }
              if (v14 == (id)1) {
                unsigned int v18 = "CT_VOICE";
              }
              if (!v14) {
                unsigned int v18 = "CT_DATA";
              }
              +[WCM_Logging logLevel:28, @"<%s>{%s}Evaluate Link: BEGIN.", v17, v18 message];
              if ([(WRM_BWEvalManager *)self evaluateLink:v14 :v15 :v16] == 1)
              {
                uint64_t v19 = 1;
                [v13 setLinkPreferenceNotificationRequired:1];
                [(WRM_BWEvalManager *)self evaluateWiFiBandwidth:&v38];
              }
              else
              {
                [v13 setLinkPreferenceNotificationRequired:0];
                [(WRM_BWEvalManager *)self evaluateCellularBandwidth:&v38];
                uint64_t v19 = 0;
              }
              [v13 setConnectedLinkType:v19];
              [v13 setMinEvalBW:(void)v38];
              [v13 setMaxEvalBW:*((void *)&v38 + 1)];
              [v13 setMinMovEvalBW:(void)v39];
              [v13 setMaxMovEvalBW:*((void *)&v39 + 1)];
              [v13 setNetworkEvalBW:v40];
              unsigned int v20 = "ClientCommCenter";
              if (v5 != 1)
              {
                unsigned int v20 = v10;
                if (v11 <= 0x13) {
                  unsigned int v20 = off_10020EE38[v11];
                }
              }
              if (v14)
              {
                unsigned int v21 = "CT_VOICE";
                if (v14 != (id)1)
                {
                  unsigned int v21 = "UNKNOWN_APP!!!";
                  if (v14 == (id)2) {
                    unsigned int v21 = "CT_Th_Call";
                  }
                }
              }
              else
              {
                unsigned int v21 = "CT_DATA";
              }
              +[WCM_Logging logLevel:28, @"<%s>{%s}Evaluate WIFI-CELLULAR Link BW: END.", v20, v21 message];
              unint64_t v22 = "ClientCommCenter";
              if (v5 != 1)
              {
                unint64_t v22 = v10;
                if (v11 <= 0x13) {
                  unint64_t v22 = off_10020EE38[v11];
                }
              }
              +[WCM_Logging logLevel:28, @"<%s>Evaluate CELLULAR-WiFi Link BW: END.", v22 message];
            }
            id v9 = [v28 countByEnumeratingWithState:&v30 objects:v41 count:16];
          }
          while (v9);
        }
        [v26 handleLinkPreferenceNotificationCM:0];
        [(WRM_BWEvalManager *)self feedAWDStreamingStats:&v38];
        uint64_t v3 = v27 + 1;
      }
      while ((id)(v27 + 1) != v25);
      id v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v25);
  }
}

- (int)evaluateLink:(unint64_t)a3 :(int)a4 :(int)a5
{
  int v6 = [(WRM_BWEvalManager *)self isWiFiPrimary];
  id v7 = "CT_DATA";
  id v8 = "CT_VOICE";
  id v9 = "UNKNOWN_APP!!!";
  if (a3 == 2) {
    id v9 = "CT_Th_Call";
  }
  if (a3 != 1) {
    id v8 = v9;
  }
  if (a3) {
    id v7 = v8;
  }
  xpc_object_t v10 = "CELLULAR";
  if (v6) {
    xpc_object_t v10 = "WIFI";
  }
  +[WCM_Logging logLevel:28, @"{%s}iRAT: Evaluate link preferred: %s", v7, v10 message];
  return v6;
}

- (void)evaluateCellularBandwidth:(id *)a3
{
  unint64_t mAchievedCellBW = self->mAchievedCellBW;
  if (mAchievedCellBW > self->mAchievedMaxCellBW)
  {
    self->unint64_t mAchievedMaxCellBW = mAchievedCellBW;
    +[WCM_Logging logLevel:28, @"evaluateCellularBandwidth mAchievedMaxCellBW=%llu", mAchievedCellBW message];
  }
  a3->var4 = 0;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var2 = 0u;
}

- (void)calcAdjustedBandwith:(id *)a3 :(float)a4
{
  +[WCM_Logging logLevel:28, @"calcAdjustedBandwith:minEvalBW: %d, CM reported BW:%d, Correction Factor:%.2f, maxBW: %d", a3->var0, self->mAchievedMaxWiFiBW, a4, self->mAchievedMaxWiFiBW message];
  float mScallingFactor = self->mScallingFactor;
  unint64_t var0 = a3->var0;
  if (mScallingFactor > 1.0)
  {
    float v8 = (float)a3->var1 / mScallingFactor;
    if (var0 > (unint64_t)v8)
    {
      a3->unint64_t var0 = (unint64_t)v8;
      unint64_t var0 = (unint64_t)v8;
    }
  }
  unint64_t mAchievedMovAvgWiFiBW = self->mAchievedMovAvgWiFiBW;
  if (var0 > mAchievedMovAvgWiFiBW && mAchievedMovAvgWiFiBW)
  {
    +[WCM_Logging logLevel:28 message:@"Link is backhaul limited, use historical bandwitdh"];
    unint64_t v10 = self->mAchievedMovAvgWiFiBW;
    a3->unint64_t var0 = v10;
  }
  else
  {
    +[WCM_Logging logLevel:28 message:@"Link is not backhaul limited, use WiFi estimated bandwitdh"];
    unint64_t v10 = a3->var0;
  }
  unint64_t v11 = (v10 - self->mEvalMovAvgWiFiBW + 8 * self->mEvalMovAvgWiFiBW) >> 3;
  self->mEvalMovAvgWiFiBW = v11;
  a3->var2 = v11;
}

- (void)evaluateWiFiBandwidth:(id *)a3
{
  id v5 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getWiFiController];
  if (v5)
  {
    id v6 = [v5 wifiService];
    [v6 getMinMaxAvailableRxBandwidth:a3];
    unint64_t mAchievedWiFiBW = self->mAchievedWiFiBW;
    if (mAchievedWiFiBW > self->mAchievedMaxWiFiBW)
    {
      self->unint64_t mAchievedMaxWiFiBW = mAchievedWiFiBW;
      self->float mScallingFactor = (float)a3->var1 / (float)mAchievedWiFiBW;
      +[WCM_Logging logLevel:28, @"evaluateWiFiBandwidth: mAchievedMaxWiFiBW=%llu", mAchievedWiFiBW message];
    }
    [v6 getMovingAvgOfRxRetryPercent];
    double v9 = 1.0 - v8;
    *(float *)&double v9 = v9;
    [(WRM_BWEvalManager *)self calcAdjustedBandwith:a3 :v9];
  }
}

- (void)handleWiFiStateChaneEvents:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  +[WCM_Logging logLevel:28 message:@"WRM IDS Link Eval Manager received WiFi link state change event"];
  self->unint64_t mAchievedMaxWiFiBW = 0;
  self->unint64_t mAchievedBW = 0;
  self->mEvalMovAvgWiFiBW = 0;
  self->mPrevEstMaxWiFiBW = 0;
  self->BOOL mStreamingSessionActive = 0;
  *(void *)&self->float mScallingFactor = 1065353216;
  self->mMovingAvgDeviation = 0.0;
  if (value)
  {
    if (xpc_dictionary_get_int64(value, "kWRM_WiFi_LINK_STATUS"))
    {
      +[WCM_Logging logLevel:28 message:@"IDS Link Eval Manager:Link down event received"];
    }
    else
    {
      int64_t int64 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_RSSI");
      int64_t v6 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_SNR");
      +[WCM_Logging logLevel:28 message:@"IMG BW Eval Mgr :Linkup event received"];
      mWiFsize_t i = self->mWiFi;
      if (mWiFi)
      {
        double v8 = [(WCM_WiFiController *)mWiFi wifiService];
        [(WCM_WiFiService *)v8 setRSSI:int64];
        [(WCM_WiFiService *)v8 setSNR:v6];
        [(WCM_WiFiService *)v8 resetWiFiBWEstimationState];
      }
    }
    [(WRM_BWEvalManager *)self evaluateWiFiLink];
  }
  else
  {
    +[WCM_Logging logLevel:28 message:@"IMG BW Eval Manager:Empty message received"];
  }
}

- (void)addiRatClient:(id)a3
{
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  [(NSMutableArray *)self->miRATClientContexts addObject:a3];
  [(WRM_BWEvalManager *)self existingContexts];

  objc_sync_exit(miRATClientContexts);
}

- (void)removeiRatClient:(id)a3
{
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  [(WRM_BWEvalManager *)self existingContexts];
  [(NSMutableArray *)self->miRATClientContexts removeObject:a3];
  [(WRM_BWEvalManager *)self existingContexts];

  objc_sync_exit(miRATClientContexts);
}

- (void)deleteiRATClient:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  id v6 = [(WRM_BWEvalManager *)self getiRATClientFromList:v3];
  if (v6) {
    [(WRM_BWEvalManager *)self removeiRatClient:v6];
  }
  objc_sync_exit(miRATClientContexts);
  if (self->mWiFi && (objc_opt_respondsToSelector() & 1) != 0)
  {
    mWiFsize_t i = self->mWiFi;
    BOOL v8 = [(WRM_BWEvalManager *)self needWiFiLQM];
    [(WCM_WiFiController *)mWiFi toggleWiFiLQMIfNeeded:v8];
  }
}

- (void)existingContexts
{
}

- (void)handleControllerAvailability:(unint64_t)a3
{
  if ([(WRM_BWEvalManager *)self enableiRATManager])
  {
    if (a3 == 1)
    {
      [(WRM_BWEvalManager *)self handleWiFiRegistered];
    }
    else if (a3 == 20 || a3 == 13)
    {
      [(WRM_BWEvalManager *)self handleIMGVideoClientRegisterd];
    }
  }
}

- (void)handleIMGVideoClientRegisterd
{
}

- (void)handleWiFiRegistered
{
  +[WCM_Logging logLevel:28 message:@"WiFi registration status changed."];
  if (!self->mWiFi)
  {
    +[WCM_Logging logLevel:18 message:@"WiFi did not register, can't get state"];
    [(WRM_BWEvalManager *)self evaluateWiFiLink];
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = [a1 WRM_BWEvalManagerSingleton:a3];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (unint64_t)retainCount
{
  return -1;
}

- (WRM_BWEvalManager)autorelease
{
  return self;
}

- (WRM_BWEvalManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)WRM_BWEvalManager;
  id v2 = [(WRM_BWEvalManager *)&v6 init];
  if (v2)
  {
    v2->mQueue = (OS_dispatch_queue *)[[WRM_HandoverManager WRM_HandoverManagerSingleton] getQueue];
    v2->mProximityMsgQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.WirelessRadioManager.BWMgrProximity", 0);
    v2->miRATClientContexts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    +[WCM_Logging logLevel:28 message:@"IMG Video BW Manager initialized"];
    v2->mPrevEstMaxWiFiBW = 0;
    v2->unint64_t mAchievedMaxCellBW = 0;
    v2->unint64_t mAchievedMaxWiFiBW = 0;
    v2->mWiFsize_t i = 0;
    v2->mDataSent = 0;
    v2->mDuration = 0;
    v2->mContainsDataSentFlag = 0;
    mMetrics = +[WRM_MetricsService getSingleton];
    v2->mMetrics = mMetrics;
    if (mMetrics)
    {
      [(WRM_MetricsService *)mMetrics initStreamingMetrics];
      mMetrics = v2->mMetrics;
    }
    xpc_object_t v4 = [(WRM_MetricsService *)mMetrics getWRMStreaming];
    v2->mWrmiRATStreaming = v4;
    v4->coldStartTypeCellular = 0;
    v2->BOOL mStreamingSessionActive = 0;
    v2->mEvalMovAvgWiFiBW = 0;
    *(_OWORD *)&v2->unint64_t mAchievedBW = 0u;
    *(_OWORD *)&v2->mAchievedPreviousWiFiBW = 0u;
    *(_OWORD *)&v2->unint64_t mAchievedWiFiBW = 0u;
    v2->float mMovAVGAchievedBW = 0.0;
    v2->float mScallingFactor = 1.0;
    v2->mStreamingTotalStallDetected = 0;
    v2->mStreamingTotalStallDuration = 0;
    v2->mStreamingStallDetected = 0;
    v2->mStreamingFatalErrorDetected = 0;
    v2->mCMStatusUpdateEvaluationTimer = (NSDate *)[+[NSDate date] copy];
    v2->mTimeSinceCMStatusEvaluationStarted = 0.0;
    [(WRM_BWEvalManager *)v2 subscribeForDeviceLockStateInfo];
    [(WRM_BWEvalManager *)v2 subscribeForScreenStateInfo];
    [(WRM_BWEvalManager *)v2 subscribeAppStateChangeEvent];
    [(WRM_BWEvalManager *)v2 createMLModel];
  }
  return v2;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:28 message:@"Handover Manager: Dealloc called for Video BW manager "];
  miRATClientContexts = self->miRATClientContexts;
  if (miRATClientContexts) {

  }
  mProximityMsgQueue = self->mProximityMsgQueue;
  if (mProximityMsgQueue) {
    dispatch_release(mProximityMsgQueue);
  }
  mCMStatusUpdateEvaluationTimer = self->mCMStatusUpdateEvaluationTimer;
  self->mWiFsize_t i = 0;
  if (mCMStatusUpdateEvaluationTimer)
  {

    self->mCMStatusUpdateEvaluationTimer = 0;
    self->mTimeSinceCMStatusEvaluationStarted = 0.0;
  }
  iratWiFiModel = self->iratWiFiModel;
  if (iratWiFiModel)
  {

    self->iratWiFiModel = 0;
  }
  iratCellularModel = self->iratCellularModel;
  if (iratCellularModel)
  {

    self->iratCellularModel = 0;
  }
  [(WRM_BWEvalManager *)self unSubscribeForDeviceLockStateInfo];
  [(WRM_BWEvalManager *)self unSubscribeForScreenStateInfo];
  [(WRM_BWEvalManager *)self unSubscribeAppStateChangeEvent];
  v8.receiver = self;
  v8.super_class = (Class)WRM_BWEvalManager;
  [(WRM_BWEvalManager *)&v8 dealloc];
}

- (id)getQueue
{
  return self->mQueue;
}

- (void)updateControllerSession:(id)a3 ofId:(unint64_t)a4
{
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071EFC;
  block[3] = &unk_10020DDC0;
  void block[5] = self;
  block[6] = a4;
  void block[4] = a3;
  dispatch_async(mQueue, block);
}

- (void)updateControllerState:(id)a3
{
  mQueue = self->mQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000721E8;
  void v4[3] = &unk_10020DAB0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mQueue, v4);
}

- (BOOL)enableiRATManager
{
  return 1;
}

- (id)getiRATClientFromList:(int)a3
{
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v6 = self->miRATClientContexts;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v6);
      }
      unint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      if ([v10 getMyClientType] == a3) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    unint64_t v10 = 0;
  }
  objc_sync_exit(miRATClientContexts);
  return v10;
}

- (void)feedAWDCoreWiFiMetrics
{
  id v11 = [objc_alloc((Class)CWFInterface) initWithServiceType:1];
  [v11 activate];
  id v3 = [v11 channel];
  id v4 = [v11 guardInterval];
  id v5 = [v11 numberOfSpatialStreams];
  unsigned int v6 = [v11 PHYMode];
  id v7 = [v11 MCSIndex];
  unsigned int v8 = [v11 bluetoothCoexistenceMode];
  mWrmiRATStreaming = self->mWrmiRATStreaming;
  mWrmiRATStreaming->wifinumberOfSpatialStreams = (int)v5;
  uint64_t v10 = v8;
  mWrmiRATStreaming->wifiguardinterval = (int)v4;
  mWrmiRATStreaming->wifimcsindex = (int)v7;
  mWrmiRATStreaming->wifiCapability = v6;
  mWrmiRATStreaming->btWiFiCoexState = v8;
  self->mWrmiRATStreaming->wifichannel = [v3 channel];
  +[WCM_Logging logLevel:28, @"MCS: %lu, PMode: %d, GI: %lu, NSS: %lu, CCH: %@, COEX mode: %lu", v7, v6, v4, v5, v3, v10 message];
  [v11 invalidate];
}

- (void)feedAWDRadioStats
{
  if (self->mWiFi && (objc_opt_respondsToSelector() & 1) != 0) {
    id v3 = [(WCM_WiFiController *)self->mWiFi wifiService];
  }
  else {
    id v3 = 0;
  }
  id v4 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getSCService];
  id v5 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getSymptomsService];
  if (!objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedCTServiceNeeded"))
  {
    id v6 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getCTService];
    unsigned int v7 = 0;
    if (v3) {
      goto LABEL_7;
    }
LABEL_10:
    mWrmiRATStreaming = self->mWrmiRATStreaming;
    mWrmiRATStreaming->wrmRecommendedRAT = 0;
    goto LABEL_12;
  }
  id v6 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
  [v6 setActiveSlot:[v6 getUserDataPreferredSlot]];
  unsigned int v7 = [v6 getCTDataIndictor];
  if (!v3) {
    goto LABEL_10;
  }
LABEL_7:
  self->mWrmiRATStreaming->wrmRecommendedRAT = [(WCM_WiFiService *)v3 isWiFiPrimaryInterface];
  if ([(WCM_WiFiService *)v3 isWiFiPrimaryInterface])
  {
    self->mWrmiRATStreaming->wifiRsssize_t i = (int)[(WCM_WiFiService *)v3 getRSSI];
    [(WCM_WiFiService *)v3 getRxPhyRate];
    self->mWrmiRATStreaming->phyRate = (int)v8;
    self->mWrmiRATStreaming->cca = [(WCM_WiFiService *)v3 getCCA];
    self->mWrmiRATStreaming->StationCount = [(WCM_WiFiService *)v3 getConnectedStationCount];
    self->mWrmiRATStreaming->lqmScoreWifsize_t i = [(WCM_WiFiService *)v3 isWiFiQualityGoodForProximityMode];
    self->mWrmiRATStreaming->decisionVIBE = [(WCM_WiFiService *)v3 getBEDecision];
    self->mWrmiRATStreaming->decisionVO = [(WCM_WiFiService *)v3 getVoiceDecision];
    self->mWrmiRATStreaming->expectedThroughputVIBE = [(WCM_WiFiService *)v3 getTxThroughputVI];
    self->mWrmiRATStreaming->expectedThroughputVO = [(WCM_WiFiService *)v3 getTxThroughputVO];
    self->mWrmiRATStreaming->packetLifetimeVIBE = [(WCM_WiFiService *)v3 getLifeTimeVI];
    self->mWrmiRATStreaming->pkgLifeTimeVO = [(WCM_WiFiService *)v3 getLifeTimeVO];
    self->mWrmiRATStreaming->pktLossRateVO = [(WCM_WiFiService *)v3 getTxLossRateVO];
    self->mWrmiRATStreaming->goodDecisionsCounterVO = [(WCM_WiFiService *)v3 getGoodVoiceCounter];
    self->mWrmiRATStreaming->badDecisionsCounterVO = [(WCM_WiFiService *)v3 getBadVoiceCounter];
    self->mWrmiRATStreaming->goodDecisionsCounterVIBE = [(WCM_WiFiService *)v3 getGoodVoiceCounter];
    self->mWrmiRATStreaming->badDecisionsCounterVIBE = [(WCM_WiFiService *)v3 getBadVideoCounter];
    self->mWrmiRATStreaming->invalidDecisionCounter = [(WCM_WiFiService *)v3 getInvalidCounter];
    self->mWrmiRATStreaming->weightedAveragePhyrateRx = [(WCM_WiFiService *)v3 getWghtAverageRXPhyRate];
    self->mWrmiRATStreaming->weightedAveragePhyrateTx = [(WCM_WiFiService *)v3 getWghtAverageTXPhyRate];
    self->mWrmiRATStreaming->weightedAverageRsssize_t i = -[(WCM_WiFiService *)v3 getWghtAverageRSSI];
    self->mWrmiRATStreaming->weightedAverageSnr = [(WCM_WiFiService *)v3 getWghtAverageSNR];
    [(WCM_WiFiService *)v3 getTxPer];
    self->mWrmiRATStreaming->txPER = (v9 * 100.0);
    [(WCM_WiFiService *)v3 getRxRatio];
    self->mWrmiRATStreaming->rxRetry = (v10 * 100.0);
    self->mWrmiRATStreaming->devicePointOfInterest = [(WCM_WiFiService *)v3 getPointOfInterest];
    self->mWrmiRATStreaming->wifChannelBW = [(WCM_WiFiService *)v3 getWiFiBW];
    unsigned int v11 = [(WCM_WiFiService *)v3 getChannelType];
    long long v12 = self->mWrmiRATStreaming;
    v12->wifChannelType = v11;
    v12->wifilowDataMode = 0;
    self->mWrmiRATStreaming->isWfiCaptive = [(WCM_WiFiService *)v3 isWiFiNetworkCaptive];
    [v5 getTCPAvgRTT];
    self->mWrmiRATStreaming->tcpRTTAvg = (v13 * 1000.0);
    [v5 getTCPMinRTT];
    self->mWrmiRATStreaming->tcpRTTmin = (v14 * 1000.0);
    [v5 getTCPRttVar];
    self->mWrmiRATStreaming->tcpRTTvar = (v15 * 1000.0);
    [v5 getRxDupeRatio];
    self->mWrmiRATStreaming->ratioDupeBytes = (v16 * 100.0);
    [v5 getRxRetryRatio];
    self->mWrmiRATStreaming->ratioOOBBytes = (v17 * 100.0);
    goto LABEL_13;
  }
  mWrmiRATStreaming = self->mWrmiRATStreaming;
LABEL_12:
  mWrmiRATStreaming->devicePointOfInterest = 0;
  *(_OWORD *)&mWrmiRATStreaming->pkgLifeTimeVO = 0u;
  *(_OWORD *)&mWrmiRATStreaming->weightedAverageRsssize_t i = 0u;
  *(_OWORD *)&mWrmiRATStreaming->goodDecisionsCounterVO = 0u;
  *(_OWORD *)&mWrmiRATStreaming->invalidDecisionCounter = 0u;
  *(_OWORD *)&mWrmiRATStreaming->wifiRsssize_t i = 0u;
  *(_OWORD *)&mWrmiRATStreaming->StationCount = 0u;
  self->mWrmiRATStreaming->StationCount = [v6 getDataSlotLoad];
LABEL_13:
  if ([v6 getServingCellType] != 1)
  {
    if ([v6 getServingCellType] == 2)
    {
      self->mWrmiRATStreaming->ratType = (NSString *)@"UMTS_RADIO";
      [v6 getServingCellRSCP];
      self->mWrmiRATStreaming->CellRSRP = (int)v26;
      [v6 getServingCellECIO];
      self->mWrmiRATStreaming->CellSinr = (int)v27;
      goto LABEL_28;
    }
    unsigned int v28 = [v6 getServingCellType];
    uint64_t v29 = self->mWrmiRATStreaming;
    if (v28 != 9)
    {
      v29->ratType = (NSString *)@"UNKNOWN_RADIO";
      goto LABEL_28;
    }
    v29->ratType = (NSString *)@"N_RADIO";
    [v6 getNrRSRP];
    self->mWrmiRATStreaming->cellNrRSRP = (int)v30;
    [v6 getNrSNR];
    self->mWrmiRATStreaming->cellNrSNR = (int)v31;
    [v6 getNrRSRQ];
    self->mWrmiRATStreaming->cellNrRSRQ = (int)v32;
    if (!objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedCTServiceNeeded")|| !objc_msgSend(v6, "isDeviceUsingFR2Radio"))
    {
      self->mWrmiRATStreaming->isFR1 = 1;
      goto LABEL_28;
    }
LABEL_23:
    self->mWrmiRATStreaming->isFR1 = 0;
    goto LABEL_28;
  }
  self->mWrmiRATStreaming->ratType = (NSString *)@"LTE_RADIO";
  [v6 getServingCellRSRP];
  self->mWrmiRATStreaming->CellRSRP = (int)v19;
  [v6 getServingCellSNR];
  self->mWrmiRATStreaming->CellSinr = (int)v20;
  self->mWrmiRATStreaming->rrcState = [v6 getRRCState];
  [v6 getServingCellRSRQ];
  unint64_t v22 = self->mWrmiRATStreaming;
  v22->cellLteRSRQ = (int)v21;
  if (v7 - 16 >= 4 && v7 != 8)
  {
    *(_WORD *)&v22->cellNsaEnabled = 0;
    v22->cellNrRSRP = 0;
    *(void *)&v22->cellNrRSRQ = 0;
    goto LABEL_28;
  }
  v22->cellNsaEnabled = 1;
  [v6 getNrRSRP];
  self->mWrmiRATStreaming->cellNrRSRP = (int)v23;
  [v6 getNrSNR];
  self->mWrmiRATStreaming->cellNrSNR = (int)v24;
  [v6 getNrRSRQ];
  self->mWrmiRATStreaming->cellNrRSRQ = (int)v25;
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedCTServiceNeeded")&& objc_msgSend(v6, "isDeviceUsingFR2Radio"))
  {
    goto LABEL_23;
  }
  self->mWrmiRATStreaming->isFR1 = 1;
LABEL_28:
  self->mWrmiRATStreaming->lqmScorecellular = [v4 getCellularDataLQM];
  [v6 getMeasureBWDataSlot];
  self->mWrmiRATStreaming->cellEstimatedBW = v33;
  self->mWrmiRATStreaming->cellARFCN = [v6 getUARFCNDataSlot];
  self->mWrmiRATStreaming->cellBandInfo = [v6 getBandInfoDataSlot];
  unsigned int v34 = [v6 getBandWidthDataSlot];
  long long v35 = self->mWrmiRATStreaming;
  v35->cellChannelBW = v34;
  v35->tcpRTTAvg = self->mHarvestedLatency;
  v35->mac_DLCA_configured = dword_10027CE84;
  v35->total_configured_bw = dword_10027CE88;
  v35->total_configured_mimo_layers = dword_10027CE8C;
  v35->lte_max_scheduled_mimo_layers_in_a_cell = dword_10027CE90;
  v35->nr_configured_bw = dword_10027CE94;
  v35->nr_total_scheduled_mimo_layers = dword_10027CE98;
  v35->nr_max_dl_modulation = dword_10027CE9C;
  self->mWrmiRATStreaming->lqmScoreBT = [[+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton") getMovingAvgBTRssi];
  self->mWrmiRATStreaming->rxRetransmissionRate = [[+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton") getBtTxPer];
  unsigned int v36 = [[+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton") getBtRxPer];
  long long v37 = self->mWrmiRATStreaming;
  v37->txRetransmissionRate = v36;
  +[WCM_Logging logLevel:28, @"CELL BW: %d,TCP_RTT_AVG: %d,TCP_RTT_MIN: %d,TCP_RTT_VAR: %d, RX Dupe ratio: %d, RX_RETRY: %d, WiFi_CH: %d WiFi_CH_TYPE: %d", v37->cellEstimatedBW, v37->tcpRTTAvg, v37->tcpRTTmin, v37->tcpRTTvar, v37->ratioDupeBytes, v37->ratioOOBBytes, v37->wifChannelBW, v37->wifChannelType message];
  [(WRM_BWEvalManager *)self updateBBState];
  self->mWrmiRATStreaming->metricsUpdate = 1;
}

- (void)feedAWDStreamingStats:(id *)a3
{
  [(WRM_BWEvalManager *)self feedAWDRadioStats];
  mWrmiRATStreaming = self->mWrmiRATStreaming;
  *(int32x4_t *)&mWrmiRATStreaming->estimatedHighBandwidth = vrev64q_s32(vuzp1q_s32(*(int32x4_t *)&a3->var0, *(int32x4_t *)&a3->var2));
  if (self->mStreamingFatalErrorDetected) {
    mWrmiRATStreaming->event = 3;
  }
}

- (void)createMLModel
{
  uint64_t v7 = 0;
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isRecentDevice"))
  {
    if (self->iratWiFiModel)
    {
      +[WCM_Logging logLevel:28 message:@"WiFiThroughputPrediction: createMLModel, iratWiFiModel already created"];
    }
    else
    {
      id v3 = [(MLModel *)[sub_100072CD0() modelWithContentsOfURL:+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/System/Library/WRM/iRATBW.mlmodelc") error:&v7];
      self->iratWiFiModel = v3;
      +[WCM_Logging logLevel:28, @"WiFiThroughputPrediction: init DEBUG ptr : %p ", v3 message];
      if (v7) {
        +[WCM_Logging logLevel:28, @"WiFiThroughputPrediction: No iratWiFiModel present %@", v7 message];
      }
      id v4 = self->iratWiFiModel;
    }
    if (self->iratCellularModel)
    {
      +[WCM_Logging logLevel:28 message:@"CellularThroughputPrediction: createMLModel, iratCellularModel already created"];
    }
    else
    {
      id v5 = [(MLModel *)[sub_100072CD0() modelWithContentsOfURL:+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/System/Library/WRM/CellularThroughputPrediction.mlmodelc") error:&v7]];
      self->iratCellularModel = v5;
      +[WCM_Logging logLevel:28, @"CellularThroughputPrediction: init DEBUG ptr : %p ", v5 message];
      if (v7) {
        +[WCM_Logging logLevel:28, @"CellularThroughputPrediction: No iratCellularModel present %@", v7 message];
      }
      id v6 = self->iratCellularModel;
    }
  }
}

- (unsigned)getMLPredictedWiFiBW
{
  uint64_t v5 = 0;
  uint64_t v3 = [(WRM_BWEvalManager *)self getPredictedWiFiBW:&v5 backhaul:(double)self->mAchievedMaxWiFiBW / 1000.0];
  +[WCM_Logging logLevel:28, @"WiFiThroughputPrediction: getMLPredictedWiFiBW: %d", v3 message];
  [(WRM_BWEvalManager *)self feedAWDCoreWiFiMetrics];
  return v3;
}

- (unsigned)getPredictedWiFiBandwidth:(double *)a3
{
  unint64_t mAchievedMaxWiFiBW = self->mAchievedMaxWiFiBW;
  if (mAchievedMaxWiFiBW) {
    double v4 = (double)mAchievedMaxWiFiBW / 1000.0;
  }
  else {
    double v4 = 44.0;
  }
  uint64_t v5 = [(WRM_BWEvalManager *)self getPredictedWiFiBW:a3 backhaul:v4];
  unsigned int v6 = v5;
  +[WCM_Logging logLevel:28, @"WiFiThroughputPrediction: getPredictedWiFiBandwidth: %d", v5 message];
  return v6;
}

- (unsigned)getPredictedWiFiBW:(double *)a3 backhaul:(double)a4
{
  id v36 = 0;
  if (!self->iratWiFiModel) {
    goto LABEL_12;
  }
  mWiFsize_t i = self->mWiFi;
  if (mWiFi)
  {
    float v8 = [(WCM_WiFiController *)mWiFi wifiService];
    if (![(WCM_WiFiService *)v8 isWiFiPrimaryInterface])
    {
      +[WCM_Logging logLevel:28 message:@"WiFi is not primary link"];
LABEL_12:
      LODWORD(mWiFi) = 0;
      return mWiFi;
    }
    [WRM_HandoverManager WRM_HandoverManagerSingleton].getSymptomsService.getTCPAvgRTT;
    double v10 = v9 * 1000.0;
    id v11 = [objc_alloc((Class)CWFInterface) initWithServiceType:1];
    [v11 activate];
    id v12 = [v11 guardInterval];
    id v13 = [v11 numberOfSpatialStreams];
    [v11 invalidate];

    id v14 = (id)[(WCM_WiFiService *)v8 getChannelType];
    BOOL v15 = [(WCM_WiFiService *)v8 isWiFiNetworkCaptive];
    id v35 = [(WCM_WiFiService *)v8 getCCA];
    unsigned int v16 = [(WCM_WiFiService *)v8 getWghtAverageRXPhyRate];
    unsigned int v17 = [(WCM_WiFiService *)v8 getWghtAverageMetricsValid];
    unsigned int v34 = a3;
    if (v16 && v17)
    {
      id v18 = v12;
      int64_t v19 = [(WCM_WiFiService *)v8 getWghtAverageRSSI];
      int64_t v20 = [(WCM_WiFiService *)v8 getWghtAverageSNR];
      double v21 = (double)[(WCM_WiFiService *)v8 getWghtAverageRXPhyRate] / 1000.0;
      CFStringRef v22 = @"wght_avg_valid, using weighted average";
    }
    else
    {
      id v18 = v12;
      int64_t v19 = [(WCM_WiFiService *)v8 getRSSI];
      int64_t v20 = [(WCM_WiFiService *)v8 getSNR];
      [(WCM_WiFiService *)v8 getRxPhyRate];
      double v21 = v23;
      CFStringRef v22 = @"wght_avg not valid, using inst avg";
    }
    +[WCM_Logging logLevel:28 message:v22];
    +[WCM_Logging logLevel:28 message:@"Start ML recommendation for BW estimation"];
    +[WCM_Logging logLevel:28, @"WiFiThroughputPrediction input features: avg_rx_phy_rate: %f, avg_rssi: %d, avg_snr: %f, backhaul: %f, tcpRTTAvg: %f, wifChannelType: %f, wifiguardinterval: %lu, isWfiCaptive: %d, wifinumberOfSpatialStreams: %lu", *(void *)&v21, v19, v20, *(void *)&a4, *(void *)&v10, v14, v18, v15, v13 message];
    v37[0] = @"cca";
    v38[0] = +[NSNumber numberWithInt:v35];
    v37[1] = @"weighted_average_phyrate_rx";
    v38[1] = +[NSNumber numberWithDouble:v21];
    v37[2] = @"weighted_average_rssi";
    v38[2] = +[NSNumber numberWithInt:v19];
    v37[3] = @"weighted_average_snr";
    v38[3] = +[NSNumber numberWithInt:v20];
    v37[4] = @"maxOfActualLowBandwidth_d";
    v38[4] = +[NSNumber numberWithDouble:a4];
    v37[5] = @"tcpRTTAvg";
    v38[5] = +[NSNumber numberWithDouble:v10];
    v37[6] = @"wifChannelType";
    v38[6] = +[NSNumber numberWithInt:v14];
    v37[7] = @"wifiguardinterval";
    v38[7] = +[NSNumber numberWithUnsignedInteger:v18];
    v37[8] = @"isWfiCaptive";
    v38[8] = +[NSNumber numberWithBool:v15];
    v37[9] = @"wifinumberOfSpatialStreams";
    v38[9] = +[NSNumber numberWithUnsignedInteger:v13];
    double v24 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:10];
    id v25 = [objc_alloc((Class)sub_10007333C()) initWithDictionary:v24 error:&v36];
    +[WCM_Logging logLevel:28, @"Calling predictionFromFeatures, input:%@", [(NSDictionary *)v24 description] message];
    id v26 = [(MLModel *)self->iratWiFiModel predictionFromFeatures:v25 error:&v36];
    if (v36)
    {
      +[WCM_Logging logLevel:28 message:@"Ran into an error while predicting"];
      id v33 = [v36 localizedDescription];
      CFStringRef v27 = @"Failed prediction: %@";
LABEL_11:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, v27, v33);

      goto LABEL_12;
    }
    if (!v26)
    {
      CFStringRef v27 = @"prediction reutrned invalid output";
      goto LABEL_11;
    }
    [objc_msgSend(v26, "featureValueForName:", @"actualLowBandwidth_d") doubleValue];
    double v29 = v28;
    mWrmiRATStreaming = self->mWrmiRATStreaming;
    *(void *)&mWrmiRATStreaming->wifiModelConfidenceLevel = 0x200000001;
    mWrmiRATStreaming->mlPredictedWiFiBW = v28;
    +[WCM_Logging logLevel:28, @"Complete ML recommendation for BW Estimation, Model Output: %f, Predicted Value: %f ", *(void *)&v28, (float)v28 message];
    [(WCM_WiFiService *)v8 resetWghtAverageMetricsFlag];
    LODWORD(v31) = self->mWrmiRATStreaming->mlPredictedWiFiBW;
    *unsigned int v34 = (double)v31;

    +[WCM_Logging logLevel:28, @"WiFiThroughputPrediction: getPredictedWiFiBW ML Model: %f", *(void *)&v29 message];
    LODWORD(mWiFi) = (v29 * 1000.0);
  }
  return mWiFi;
}

- (unsigned)getMLPredictedCellBW
{
  +[WCM_Logging logLevel:28, @"CellularThroughputPrediction: getMLPredictedCellBW maxActualBW before calling ML Prediction: %llu", self->mAchievedMaxCellBW, 0 message];
  uint64_t v3 = [(WRM_BWEvalManager *)self getPredictedCellBW:&v5 backhaul:(double)self->mAchievedMaxCellBW];
  +[WCM_Logging logLevel:28, @"CellularThroughputPrediction: getMLPredictedCellBW: %d", v3 message];
  return v3;
}

- (unsigned)getPredictedCellBW:(double *)a3 backhaul:(double)a4
{
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedCTServiceNeeded"))
  {
    id v7 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
    [v7 setActiveSlot:[v7 getUserDataPreferredSlot]];
    unsigned int v8 = [v7 getCTDataIndictor];
  }
  else
  {
    id v7 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getCTService];
    unsigned int v8 = 0;
  }
  id v9 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getSCService];
  id v79 = 0;
  if (!self->iratCellularModel)
  {
    +[WCM_Logging logLevel:28 message:@"CellularThroughputPrediction: iratCellularModel is nil"];
    return 0;
  }
  id v11 = v9;
  LODWORD(v10) = dword_10027CE84;
  double v12 = (double)v10;
  LODWORD(v10) = dword_10027CE88;
  *(double *)&unint64_t v13 = (double)v10;
  unint64_t v77 = v13;
  double v78 = v12;
  LODWORD(v13) = dword_10027CE8C;
  *(double *)&unint64_t v14 = (double)v13;
  unint64_t v76 = v14;
  LODWORD(v14) = dword_10027CE90;
  double v15 = (double)v14;
  LODWORD(v14) = dword_10027CE94;
  double v16 = (double)v14;
  LODWORD(v14) = dword_10027CE98;
  double v17 = (double)v14;
  LODWORD(v14) = dword_10027CE9C;
  double v18 = (double)v14;
  if ([v7 getServingCellType] == 1)
  {
    double v71 = a4;
    [v7 getServingCellRSRP];
    double v20 = v19;
    [v7 getServingCellSNR];
    double v22 = v21;
    [v7 getServingCellRSRQ];
    double v24 = v23;
    double v25 = 0.0;
    double v74 = v22;
    double v75 = v20;
    double v73 = v15;
    if (v8 - 16 < 4 || v8 == 8)
    {
      double v62 = v18;
      double v63 = v17;
      double v65 = v16;
      [v7 getNrRSRP];
      double v60 = v26;
      [v7 getNrSNR];
      double v64 = v27;
      [v7 getNrRSRQ];
      double v61 = v28;
      unsigned int v29 = [v7 isDeviceUsingFR2Radio] ^ 1;
      double v30 = 1.0;
    }
    else
    {
      unsigned int v29 = 0;
      double v60 = 0.0;
      double v61 = 0.0;
      double v64 = 0.0;
      double v65 = 0.0;
      double v30 = 0.0;
      double v62 = 0.0;
      double v63 = 0.0;
    }
    a4 = v71;
  }
  else if ([v7 getServingCellType] == 2)
  {
    [v7 getServingCellRSCP];
    double v75 = v31;
    [v7 getServingCellECIO];
    double v74 = v32;
    unsigned int v29 = 0;
    double v60 = 0.0;
    double v61 = 0.0;
    double v25 = -1.0;
    double v64 = 0.0;
    double v65 = 0.0;
    double v24 = 0.0;
    double v30 = 0.0;
    double v73 = 0.0;
    double v62 = 0.0;
    double v63 = 0.0;
  }
  else
  {
    double v65 = v16;
    double v62 = v18;
    double v63 = v17;
    if ([v7 getServingCellType] == 9)
    {
      [v7 getNrRSRP];
      double v60 = v33;
      [v7 getNrSNR];
      double v64 = v34;
      [v7 getNrRSRQ];
      double v61 = v35;
      unsigned int v29 = 0;
      double v25 = 1.0;
      double v74 = 0.0;
      double v75 = 0.0;
      double v24 = 0.0;
      double v30 = 0.0;
      double v73 = 0.0;
    }
    else
    {
      unsigned int v29 = 0;
      double v25 = -1.0;
      double v75 = 0.0;
      double v73 = v15;
      double v74 = 0.0;
      double v60 = 0.0;
      double v61 = 0.0;
      double v64 = 0.0;
      double v24 = 0.0;
      double v30 = 0.0;
    }
  }
  BOOL v36 = v25 == 0.0;
  double v37 = 1.0;
  if (v30 == 1.0) {
    unsigned int v38 = v29;
  }
  else {
    unsigned int v38 = 0;
  }
  int v39 = v29 ^ 1;
  if (v30 != 1.0) {
    int v39 = 0;
  }
  double v40 = v30;
  double v69 = v30;
  if ((v36 & v39) == 0) {
    double v37 = 2.0;
  }
  if ((v36 & v38) != 0) {
    double v41 = 0.0;
  }
  else {
    double v41 = v37;
  }
  double v72 = (double)[v11 getCellularDataLQM:v37];
  [v7 getMeasureBWDataSlot];
  double v42 = (double)(int)[v7 getBandWidthDataSlot];
  [v7 getMeasureBWDataSlot];
  double v44 = v43 / 1000.0;
  double v66 = v43 / 1000.0;
  double v45 = v25;
  double v70 = v25;
  if (a4 == 0.0) {
    double v46 = 56.0;
  }
  else {
    double v46 = a4 / 1000.0;
  }
  double v47 = (double)self->mAchievedPreviousCellBW / 1000.0;
  +[WCM_Logging logLevel:28 message:@"CellularThroughputPrediction: Start ML recommendation for Cellular BW estimation"];
  v82[0] = &off_10023BBB0;
  v82[1] = &off_10023BBE0;
  v83[0] = &off_10023BBC8;
  v83[1] = &off_10023BBC8;
  v82[2] = &off_10023BBF8;
  v82[3] = &off_10023BC10;
  v83[2] = &off_10023BBC8;
  v83[3] = &off_10023BBC8;
  v82[4] = &off_10023BC28;
  v82[5] = &off_10023BC40;
  v83[4] = &off_10023BBC8;
  v83[5] = &off_10023BBC8;
  v82[6] = &off_10023BC58;
  v82[7] = &off_10023BC70;
  v83[6] = &off_10023BBC8;
  v83[7] = &off_10023BBC8;
  v82[8] = &off_10023BC88;
  v82[9] = &off_10023BCA0;
  v83[8] = &off_10023BBC8;
  v83[9] = &off_10023BBC8;
  v82[10] = &off_10023BCB8;
  v82[11] = &off_10023BCD0;
  v83[10] = &off_10023BBC8;
  v83[11] = &off_10023BBC8;
  v82[12] = &off_10023BCE8;
  v82[13] = &off_10023BD00;
  v83[12] = &off_10023BBC8;
  v83[13] = &off_10023BBC8;
  v82[14] = &off_10023BD18;
  v82[15] = &off_10023BD30;
  v83[14] = &off_10023BBC8;
  v83[15] = &off_10023BBC8;
  v82[16] = &off_10023BD48;
  v82[17] = &off_10023BBC8;
  v83[16] = &off_10023BD18;
  v83[17] = &off_10023BD18;
  v82[18] = &off_10023BD60;
  v82[19] = &off_10023BD78;
  v83[18] = &off_10023BD18;
  v83[19] = &off_10023BD18;
  v82[20] = &off_10023BD90;
  v82[21] = &off_10023BDA8;
  v83[20] = &off_10023BD18;
  v83[21] = &off_10023BD18;
  v82[22] = &off_10023BDC0;
  v82[23] = &off_10023BDD8;
  v83[22] = &off_10023BD18;
  v83[23] = &off_10023BD18;
  v82[24] = &off_10023BDF0;
  v82[25] = &off_10023BE08;
  v83[24] = &off_10023BD18;
  v83[25] = &off_10023BD18;
  v82[26] = &off_10023BE20;
  v82[27] = &off_10023BE38;
  v83[26] = &off_10023BD18;
  v83[27] = &off_10023BD18;
  v82[28] = &off_10023BE50;
  v82[29] = &off_10023BE68;
  v83[28] = &off_10023BD18;
  v83[29] = &off_10023BD18;
  v82[30] = &off_10023BE80;
  v82[31] = &off_10023BE98;
  v83[30] = &off_10023BD18;
  v83[31] = &off_10023BD18;
  v82[32] = &off_10023BEB0;
  v82[33] = &off_10023BEC8;
  v83[32] = &off_10023BD18;
  v83[33] = &off_10023BD18;
  v82[34] = &off_10023BEE0;
  v82[35] = &off_10023BEF8;
  v83[34] = &off_10023BD18;
  v83[35] = &off_10023BD18;
  v82[36] = &off_10023BF10;
  v82[37] = &off_10023BF28;
  v83[36] = &off_10023BD18;
  v83[37] = &off_10023BF40;
  v82[38] = &off_10023BF58;
  v82[39] = &off_10023BF70;
  v83[38] = &off_10023BF40;
  v83[39] = &off_10023BF40;
  v82[40] = &off_10023BF88;
  v82[41] = &off_10023BFA0;
  v83[40] = &off_10023BF40;
  v83[41] = &off_10023BF40;
  v82[42] = &off_10023BFB8;
  v82[43] = &off_10023BFD0;
  v83[42] = &off_10023BF40;
  v83[43] = &off_10023BF40;
  v82[44] = &off_10023BFE8;
  v82[45] = &off_10023C000;
  v83[44] = &off_10023BF40;
  v83[45] = &off_10023BF40;
  v82[46] = &off_10023C018;
  v82[47] = &off_10023C030;
  v83[46] = &off_10023BF40;
  v83[47] = &off_10023BF40;
  v82[48] = &off_10023C048;
  v82[49] = &off_10023C060;
  v83[48] = &off_10023BF40;
  v83[49] = &off_10023BF40;
  v82[50] = &off_10023C078;
  v82[51] = &off_10023C090;
  v83[50] = &off_10023BF40;
  v83[51] = &off_10023BF40;
  v82[52] = &off_10023C0A8;
  v82[53] = &off_10023C0C0;
  v83[52] = &off_10023BF40;
  v83[53] = &off_10023BF40;
  v82[54] = &off_10023C0D8;
  v82[55] = &off_10023C0F0;
  v83[54] = &off_10023BF40;
  v83[55] = &off_10023BF40;
  v82[56] = &off_10023C108;
  v82[57] = &off_10023C120;
  v83[56] = &off_10023BF40;
  v83[57] = &off_10023BF40;
  v82[58] = &off_10023C138;
  v83[58] = &off_10023BF40;
  double v48 = (double)(int)[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v83, v82, 59) objectForKey:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "getBandInfoDataSlot"))] intValue];
  double v67 = v47;
  double v68 = v48;
  double v49 = v47;
  if (v47 == 0.0) {
    double v50 = v46;
  }
  else {
    double v50 = 0.0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, @"CellularThroughputPrediction CellRSRP: %f, CellSnr: %f, lqmScorecellular: %f, ratType: %f, isFR1: %d, Backhaul: %f, pActualLowBandwidth: %f, cellNrRSRP: %f, cellNrRSRQ: %f, cellNrSNR: %f, cellLteRSRQ: %f, cellEstimatedBW: %f, cellChannelBW: %f, cellNsaEnabled: %f, cellBandInfo: %f, NRType: %f", *(void *)&v75, *(void *)&v74, *(void *)&v72, *(void *)&v45, v29, *(void *)&v50, *(void *)&v49, *(void *)&v60, *(void *)&v61, *(void *)&v64, *(void *)&v24, *(void *)&v44, *(void *)&v42, *(void *)&v40, *(void *)&v48,
    *(void *)&v41);
  +[WCM_Logging logLevel:28, @"CellularThroughputPrediction QSH Metrics num_ccs: %f, total_configured_bw: %f, total_configured_mimo_layers: %f, lte_max_scheduled_mimo_layers_in_a_cell: %f, nr_configured_bw: %f, nr_total_scheduled_mimo_layers: %f, nr_max_dl_modulation: %f", *(void *)&v78, v77, v76, *(void *)&v73, *(void *)&v65, *(void *)&v63, *(void *)&v62 message];
  v80[0] = @"cellSinr";
  v81[0] = +[NSNumber numberWithDouble:v74];
  v80[1] = @"cellNrRSRQ";
  v81[1] = +[NSNumber numberWithDouble:v61];
  v80[2] = @"cellLteRSRQ";
  v81[2] = +[NSNumber numberWithDouble:v24];
  v80[3] = @"cellNrRSRP";
  v81[3] = +[NSNumber numberWithDouble:v60];
  v80[4] = @"maxOfActualLowBandwidth_d";
  v81[4] = +[NSNumber numberWithDouble:v50];
  v80[5] = @"lqmScorecellular";
  v81[5] = +[NSNumber numberWithDouble:v72];
  v80[6] = @"cellChannelBW";
  v81[6] = +[NSNumber numberWithDouble:v42];
  v80[7] = @"cellNrSNR";
  v81[7] = +[NSNumber numberWithDouble:v64];
  v80[8] = @"cellRsrp";
  v81[8] = +[NSNumber numberWithDouble:v75];
  v80[9] = @"cellEstimatedBW";
  v81[9] = +[NSNumber numberWithDouble:v66];
  v80[10] = @"pActualLowBandwidth";
  v81[10] = +[NSNumber numberWithDouble:v67];
  v80[11] = @"cellBandInfo";
  v81[11] = +[NSNumber numberWithDouble:v68];
  v80[12] = @"cellNsaEnabled";
  v81[12] = +[NSNumber numberWithDouble:v69];
  v80[13] = @"NRType";
  v81[13] = +[NSNumber numberWithDouble:v41];
  v80[14] = @"ratType";
  v81[14] = +[NSNumber numberWithDouble:v70];
  uint64_t v51 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:15];
  id v52 = [objc_alloc((Class)sub_10007333C()) initWithDictionary:v51 error:&v79];
  +[WCM_Logging logLevel:28, @"CellularThroughputPrediction: Calling predictionFromFeatures, input:%@", [(NSDictionary *)v51 description] message];
  id v53 = [(MLModel *)self->iratCellularModel predictionFromFeatures:v52 error:&v79];
  if (v79)
  {
    +[WCM_Logging logLevel:28 message:@"CellularThroughputPrediction: Ran into an error while predicting"];
    id v59 = [v79 localizedDescription];
    CFStringRef v54 = @"CellularThroughputPrediction: Failed prediction: %@";
LABEL_35:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, v54, v59);

    return 0;
  }
  if (!v53)
  {
    CFStringRef v54 = @"CellularThroughputPrediction: prediction reutrned invalid output";
    goto LABEL_35;
  }
  [objc_msgSend(v53, "featureValueForName:", @"actualLowBandwidth_d") doubleValue];
  double v57 = v56;
  self->mWrmiRATStreaming->mlPredictedCellBW = v56;
  +[WCM_Logging logLevel:28, @"CellularThroughputPrediction: Completete ML recommendation for BW Estimation, Model Output: %f, Predicted Value: %f", *(void *)&v56, (float)v56 message];
  LODWORD(v58) = self->mWrmiRATStreaming->mlPredictedCellBW;
  *a3 = (double)v58;

  +[WCM_Logging logLevel:28, @"CellularThroughputPrediction: getPredictedCellBW ML Model: %f", *(void *)&v57 message];
  return (v57 * 1000.0);
}

- (BOOL)isConnectedLinkStreamingQualityGood
{
  return 1;
}

- (BOOL)isCellStreamingExitCriteriaMet
{
  return 1;
}

- (void)updateDLBWEstimation:(unsigned int)a3 :(unsigned int)a4
{
  mWrmiRATStreaming = self->mWrmiRATStreaming;
  mWrmiRATStreaming->cellEstimatedBW = a3;
  mWrmiRATStreaming->cellEstimatedBWConf = a4;
}

- (void)updateQSHMetrics:(unsigned int)a3 :(unsigned int)a4 :(unsigned int)a5 :(unsigned int)a6
{
  dword_10027CE84 = a3;
  dword_10027CE8C = a5;
  dword_10027CE90 = a6;
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedCTServiceNeeded"))
  {
    id v7 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
    [v7 setActiveSlot:[v7 getUserDataPreferredSlot]];
    unsigned int v8 = [v7 getCTDataIndictor];
  }
  else
  {
    id v7 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getCTService];
    unsigned int v8 = 0;
  }
  if ([v7 getServingCellType] == 1 && (v8 - 16 >= 4 && v8 != 8 || dword_10027CE94 <= a4)) {
    dword_10027CE88 = a4;
  }
}

- (void)updateNRQSHMetrics:(unsigned int)a3 :(unsigned int)a4 :(unsigned int)a5
{
  dword_10027CE94 = a3;
  dword_10027CE98 = a4;
  dword_10027CE9C = a5;
}

- (id)getSpeedTestMetrics
{
  id v2 = +[WRM_SCService WRM_SCServiceControllerSingleton];
  id v3 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getWiFiService];
  id v4 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getSymptomsService];
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedCTServiceNeeded"))
  {
    id v5 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
    [v5 setActiveSlot:[v5 getUserDataPreferredSlot]];
    [v5 getCTDataIndictor];
  }
  else
  {
    id v5 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getCTService];
  }
  v8[0] = @"wghtRSSI";
  v9[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 getWghtAverageRSSI]);
  v8[1] = @"wghtSNR";
  v9[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 getWghtAverageSNR]);
  v8[2] = @"wghtPhyRate";
  v9[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v3 getWghtAverageRXPhyRate]);
  v8[3] = @"tcpRTT";
  [v4 getTCPMinRTT];
  v9[3] = +[NSNumber numberWithDouble:v6 * 1000.0];
  v8[4] = @"chType";
  v9[4] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v3 getChannelType]);
  v8[5] = @"isCaptive";
  v9[5] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isWiFiNetworkCaptive]);
  v8[6] = @"cellularDataLQM";
  v9[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v2 getCellularDataLQM]);
  v8[7] = @"CCA";
  v9[7] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 getCCA]);
  v8[8] = @"nrRSRP";
  [v5 getNrRSRP];
  v9[8] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v8[9] = @"nrRSRQ";
  [v5 getNrRSRQ];
  v9[9] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v8[10] = @"nrSNR";
  [v5 getNrSNR];
  v9[10] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v8[11] = @"totalCellularBW";
  v9[11] = +[NSNumber numberWithUnsignedInt:dword_10027CE88];
  v8[12] = @"nrConfiguredBW";
  v9[12] = +[NSNumber numberWithUnsignedInt:dword_10027CE94];
  v8[13] = @"totalLayers";
  v9[13] = +[NSNumber numberWithUnsignedInt:dword_10027CE8C];
  v8[14] = @"nrLayers";
  v9[14] = +[NSNumber numberWithUnsignedInt:dword_10027CE98];
  v8[15] = @"lteMaxScheduledLayers";
  v9[15] = +[NSNumber numberWithUnsignedInt:dword_10027CE90];
  v8[16] = @"nrModulation";
  v9[16] = +[NSNumber numberWithUnsignedInt:dword_10027CE9C];
  v8[17] = @"totalCCs";
  v9[17] = +[NSNumber numberWithUnsignedInt:dword_10027CE84];
  return +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:18];
}

- (void)sendMessage:(int)a3 withMsg:(id)a4
{
  id v5 = [[+[WCM_Server singleton](WCM_Server, "singleton") getSessionFor:a3];

  [v5 sendMessage:a4];
}

- (void)subscribeForDeviceLockStateInfo
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100084260, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)unSubscribeForDeviceLockStateInfo
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.keybagd.lock_status", 0);
}

- (void)subscribeForScreenStateInfo
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000843E8;
  handler[3] = &unk_10020DFA8;
  void handler[4] = self;
  notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &dword_10027CEC4, (dispatch_queue_t)&_dispatch_main_q, handler);
  [(WRM_BWEvalManager *)self notifyScreenStatePassCodeNotEnabled:dword_10027CEC4];
}

- (void)unSubscribeForScreenStateInfo
{
  id v3 = +[NSNotificationCenter defaultCenter];

  [(NSNotificationCenter *)v3 removeObserver:self];
}

- (void)notifyStreamingState:(unsigned __int8)a3 :(unsigned int)a4
{
  unsigned __int16 v4 = a4;
  uint64_t v5 = a3;
  id v6 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];

  [v6 notifyAVStatus:v5 :v4];
}

- (void)notifyEHBState:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];

  [v4 notifyEHBState:v3];
}

- (void)notifyScreenStatePassCodeNotEnabled:(int)a3
{
  uint64_t state64 = 0;
  int v4 = MKBGetDeviceLockState();
  notify_get_state(a3, &state64);
  uint64_t v5 = state64;
  +[WCM_Logging logLevel:24, @"Rx screen state change event NotDark:%d, keybagLockState: %d", state64 == 0, v4 message];
  if (v4 == 3)
  {
    id v6 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
    if (v5) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    [v6 postBBNotification:v7 :0];
  }
}

@end