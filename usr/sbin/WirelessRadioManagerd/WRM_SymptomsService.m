@interface WRM_SymptomsService
- (BOOL)createNetworkSymptomsFeed;
- (BOOL)dpdFailureDetected;
- (BOOL)evaluateBackHaulLink;
- (BOOL)getNetworkFullScoreFromSF:(int)a3;
- (BOOL)getNetworkUsageAdviceFromSF:(int)a3;
- (BOOL)isBackhaulGood;
- (BOOL)isConnectedLinkGood:(BOOL)a3;
- (BOOL)isCurrentAttachPointHasChanged:(id)a3;
- (BOOL)isIMSTransportQualityGood;
- (BOOL)scorecardForIKETunnel:(id)a3 isInstant:(BOOL)a4;
- (BOOL)sipTimeOutDetected;
- (BOOL)updateAllNetworkSymptoms:(int)a3;
- (BOOL)watchpointForIKETunnel:(id)a3 onThreshold:(unsigned int)a4;
- (WRM_SymptomsService)init;
- (double)evaluateNetworkBandwidth;
- (double)getAgeOfMetricCurrInstant;
- (double)getAgeOfMetricDictionary:(id)a3;
- (double)getCurrentAgeOfConnectedLinkInSeconds;
- (double)getMetricFromDictionary:(id)a3 :(int)a4;
- (double)getNetworkThroughput;
- (double)getRxDupeRatio;
- (double)getRxRetryRatio;
- (double)getTCPAvgRTT;
- (double)getTCPMinRTT;
- (double)getTCPRttVar;
- (double)getWifiNetMetricCurrInstant:(int)a3;
- (id)getImsTunnelId;
- (int)calculateCellularHistoryScore;
- (int)calculateCellularScore;
- (int)calculateWifiHistoryScore;
- (int)calculateWifiScore;
- (int)getNetworkHistScore:(int)a3;
- (int)getNetworkScore:(int)a3;
- (int)mapSFNetworkAdvisoryToNetworkScore:(int)a3;
- (void)dealloc;
- (void)displayIKEMetrics:(id)a3;
- (void)displayWatchpointHit:(id)a3;
- (void)handleNetworkdRestart;
- (void)notifyIRATManager:(int64_t)a3;
- (void)notifyWifiCallState:(BOOL)a3;
- (void)resetIMSMetrics;
- (void)resetSFContext;
- (void)setIKEv2WatchPoint:(id)a3;
- (void)triggerAutoBugCapture:(id)a3 subType:(id)a4 subtypeContext:(id)a5;
- (void)updateDPDMetrics:(BOOL)a3;
- (void)updateSIPMetrics:(BOOL)a3;
- (void)watchTcpConnectionFallBack;
@end

@implementation WRM_SymptomsService

- (BOOL)updateAllNetworkSymptoms:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(NSDate *)self->mSFQueryTimer timeIntervalSinceNow];
  double v6 = v5;
  double v7 = self->mPrevTimeSinceSFQueryStarted - v5;
  +[WCM_Logging logLevel:24, @"iRAT:Rate limiting SF Delta Time %lf", *(void *)&v7 message];
  if (v7 < 120.0)
  {
    CFStringRef v8 = @"Enforce rate limiting, do not query SF";
    uint64_t v9 = 18;
    goto LABEL_7;
  }
  self->mPrevTimeSinceSFQueryStarted = v6;
  if (v3 != 1)
  {
    if (!v3)
    {
      +[WCM_Logging logLevel:24, @"updateAllNetworkSymptoms: BEGIN. Advice query:answer %llu:%llu FullScore query:answer %llu:%llu.", self->mAdviceQueried, self->mAdviceAnswered, self->mFullScoreQueried, self->mFullScoreAnswered message];
      [(WRM_SymptomsService *)self getNetworkUsageAdviceFromSF:0];
      [(WRM_SymptomsService *)self getNetworkFullScoreFromSF:0];
      +[WCM_Logging logLevel:24, @"updateAllNetworkSymptoms: END. Advice query:answer %llu:%llu FullScore query:answer %llu:%llu.", self->mAdviceQueried, self->mAdviceAnswered, self->mFullScoreQueried, self->mFullScoreAnswered message];
      return v7 >= 120.0;
    }
    v11 = "-[WRM_SymptomsService updateAllNetworkSymptoms:]";
    uint64_t v12 = v3;
    CFStringRef v8 = @"iRAT: %s. Unknown network type %d.";
    uint64_t v9 = 16;
LABEL_7:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v9, v8, v11, v12, v13, v14);
  }
  return v7 >= 120.0;
}

- (BOOL)isConnectedLinkGood:(BOOL)a3
{
  +[WCM_Logging logLevel:20 message:@"isConnectedLinkGood called"];
  BOOL mSIPTimeOutOverWiFiDetected = self->mSIPTimeOutOverWiFiDetected;
  BOOL mWiFiIPsecTunnelDisconnected = self->mWiFiIPsecTunnelDisconnected;
  if (self->mSIPTimeOutOverWiFiDetected)
  {
    BOOL v6 = self->mWiFiIPsecTunnelDisconnected;
LABEL_4:
    +[WCM_Logging logLevel:20, @"SIP TMO: %d, DPD failure: %d", mSIPTimeOutOverWiFiDetected, v6 message];
    BOOL v6 = 0;
    goto LABEL_5;
  }
  BOOL v6 = 1;
  if (mWiFiIPsecTunnelDisconnected) {
    goto LABEL_4;
  }
LABEL_5:
  +[WCM_Logging logLevel:24, @"isConnectedLinkGood status %d", v6 message];
  return v6;
}

- (BOOL)isBackhaulGood
{
  return self->mBackHaulLinkGood;
}

- (WRM_SymptomsService)init
{
  v7.receiver = self;
  v7.super_class = (Class)WRM_SymptomsService;
  v2 = [(WRM_SymptomsService *)&v7 init];
  uint64_t v3 = (WRM_SymptomsService *)v2;
  if (v2)
  {
    *((void *)v2 + 1) = 0;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *((void *)v2 + 32) = 0;
    *((void *)v2 + 33) = 0;
    v2[272] = 1;
    *((_WORD *)v2 + 8) = 0;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *((void *)v2 + 15) = 0;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 200) = 0u;
    *((void *)v2 + 27) = 0;
    *((void *)v2 + 28) = [+[NSDate date] copy];
    v3->mPrevTimeSinceThroughputEstimationStarted = 0.0;
    v3->mSFQueryTimer = (NSDate *)[+[NSDate date] copy];
    v3->mPrevTimeSinceSFQueryStarted = 0.0;
    v3->mABCreporter = (SDRDiagnosticReporter *)objc_alloc_init((Class)SDRDiagnosticReporter);
    if ([(WRM_SymptomsService *)v3 createNetworkSymptomsFeed])
    {
      CFStringRef v4 = @"iRAT: NetworkPerformanceFeed created.";
      uint64_t v5 = 24;
    }
    else
    {
      CFStringRef v4 = @"iRAT: NetworkPerformanceFeed failed to create.";
      uint64_t v5 = 17;
    }
    +[WCM_Logging logLevel:v5 message:v4];
  }
  return v3;
}

- (void)dealloc
{
  mAnalyticsWorkspace = self->mAnalyticsWorkspace;
  if (mAnalyticsWorkspace) {
    CFRelease(mAnalyticsWorkspace);
  }
  mNetworkPerfFeed = self->mNetworkPerfFeed;
  if (mNetworkPerfFeed) {
    CFRelease(mNetworkPerfFeed);
  }

  mSFThroughEstimationTimer = self->mSFThroughEstimationTimer;
  if (mSFThroughEstimationTimer)
  {

    self->mSFThroughEstimationTimer = 0;
    self->mPrevTimeSinceThroughputEstimationStarted = 0.0;
  }
  mSFQueryTimer = self->mSFQueryTimer;
  if (mSFQueryTimer)
  {

    self->mSFQueryTimer = 0;
    self->mPrevTimeSinceSFQueryStarted = 0.0;
  }
  mABCreporter = self->mABCreporter;
  if (mABCreporter)
  {

    self->mABCreporter = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)WRM_SymptomsService;
  [(WRM_SymptomsService *)&v8 dealloc];
}

- (void)resetIMSMetrics
{
  *(_WORD *)&self->BOOL mSIPTimeOutOverWiFiDetected = 0;
}

- (int)getNetworkScore:(int)a3
{
  if (a3 == 1)
  {
    return [(WRM_SymptomsService *)self calculateCellularScore];
  }
  else if (a3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, @"iRAT: %s. Unknown network type %d.", "-[WRM_SymptomsService getNetworkScore:]", *(void *)&a3, v3, v4);
    return -1;
  }
  else
  {
    return [(WRM_SymptomsService *)self calculateWifiScore];
  }
}

- (int)getNetworkHistScore:(int)a3
{
  if (a3 == 1)
  {
    return [(WRM_SymptomsService *)self calculateCellularHistoryScore];
  }
  else if (a3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, @"iRAT: %s. Unknown network type %d.", "-[WRM_SymptomsService getNetworkHistScore:]", *(void *)&a3, v3, v4);
    return -201;
  }
  else
  {
    return [(WRM_SymptomsService *)self calculateWifiHistoryScore];
  }
}

- (double)getAgeOfMetricCurrInstant
{
  [(WRM_SymptomsService *)self getAgeOfMetricDictionary:self->mWifiInstantCurrent];
  return result;
}

- (double)getAgeOfMetricDictionary:(id)a3
{
  double v3 = 0.0;
  if (a3)
  {
    if ([a3 count])
    {
      id v5 = [a3 allValues];
      if ([v5 count])
      {
        id v6 = [v5 objectAtIndex:0];
        if (v6)
        {
          objc_super v7 = v6;
          if ([v6 count])
          {
            id v8 = [objc_msgSend(v7, "allValues") objectAtIndex:0];
            [objc_msgSend(v8, "objectForKeyedSubscript:", kPerformanceNetAttachSinceTime) timeIntervalSinceNow];
            return -v9;
          }
        }
      }
    }
  }
  return v3;
}

- (double)getWifiNetMetricCurrInstant:(int)a3
{
  [(WRM_SymptomsService *)self getMetricFromDictionary:self->mWifiInstantCurrent :*(void *)&a3];
  return result;
}

- (BOOL)isCurrentAttachPointHasChanged:(id)a3
{
  if (a3)
  {
    id v5 = [a3 count];
    if (v5)
    {
      id v5 = [[objc_msgSend(a3, "allValues") objectAtIndex:0];
      if (v5)
      {
        id v6 = v5;
        id v5 = [v5 count];
        if (v5)
        {
          id v7 = [[objc_msgSend(v6, "allValues") objectAtIndex:0];

          self->mCurrentConnectionIdentifier = 0;
          id v8 = (NSString *)[v7 objectForKeyedSubscript:kPerformanceNetAttachIdentifier];
          self->mCurrentConnectionIdentifier = v8;
          double v9 = v8;
          if ([(NSString *)self->mPreviousConnectionIdentifier isEqualToString:self->mCurrentConnectionIdentifier])
          {
            LOBYTE(v5) = 1;
          }
          else
          {

            LOBYTE(v5) = 0;
            self->mPreviousConnectionIdentifier = self->mCurrentConnectionIdentifier;
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (double)getMetricFromDictionary:(id)a3 :(int)a4
{
  double v4 = -1.0;
  if (!a3) {
    return v4;
  }
  if (![a3 count]) {
    return v4;
  }
  id v7 = [[objc_msgSend(a3, "allValues") objectAtIndex:0];
  if (!v7) {
    return v4;
  }
  id v8 = v7;
  if (![v7 count]) {
    return v4;
  }
  id v9 = [[objc_msgSend(v8, "allValues") objectAtIndex:0];
  v10 = v9;
  switch(a4)
  {
    case 1:
      [objc_msgSend(v9, "objectForKeyedSubscript:", kPerformanceNetAttachConnSuccesses) doubleValue];
      double v12 = v11;
      [objc_msgSend(v10, "objectForKeyedSubscript:", kPerformanceNetAttachConnAttempts) doubleValue];
      return 1.0 - v12 / (v13 + 0.000001);
    case 2:
      uint64_t v14 = &kPerformanceNetAttachFaultyStay;
      goto LABEL_9;
    case 3:
      uint64_t v14 = &kPerformanceNetAttachLowQualyStay;
LABEL_9:
      [objc_msgSend(v9, "objectForKeyedSubscript:", *v14) doubleValue];
      double v16 = v15;
      v17 = &kPerformanceNetAttachOverallStay;
      goto LABEL_12;
    case 4:
      [objc_msgSend(v9, "objectForKeyedSubscript:", kPerformanceNetAttachReTxBytes) doubleValue];
      double v16 = v18;
      v17 = &kPerformanceNetAttachBytesOut;
      goto LABEL_12;
    case 5:
      [objc_msgSend(v9, "objectForKeyedSubscript:", kPerformanceNetAttachRxDupeBytes) doubleValue];
      double v16 = v19;
      v17 = &kPerformanceNetAttachBytesIn;
LABEL_12:
      [objc_msgSend(v10, "objectForKeyedSubscript:", *v17) doubleValue];
      return v16 / (v20 + 0.000001);
    case 6:
      v21 = &kPerformanceNetAttachRttMin;
      goto LABEL_16;
    case 7:
      v21 = &kPerformanceNetAttachRttAvg;
      goto LABEL_16;
    case 8:
      v21 = &kPerformanceNetAttachRttVar;
LABEL_16:
      [objc_msgSend(v9, "objectForKeyedSubscript:", *v21) doubleValue];
      double v4 = v22;
      if (v22 == 1.79769313e308) {
        return 9999.0;
      }
      return v4;
    case 9:
      v23 = &kPerformanceNetAttachConnAttempts;
      goto LABEL_24;
    case 10:
      v23 = &kPerformanceNetAttachConnSuccesses;
      goto LABEL_24;
    case 11:
      v23 = &kPerformanceNetAttachPacketsIn;
      goto LABEL_24;
    case 13:
      v23 = &kPerformanceNetAttachBytesIn;
LABEL_24:
      id v25 = [v9 objectForKeyedSubscript:*v23];
      [v25 doubleValue];
      break;
    default:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, @"iRAT: %s. invalid metric type.", "-[WRM_SymptomsService getMetricFromDictionary::]");
      return 0.0;
  }
  return result;
}

- (BOOL)createNetworkSymptomsFeed
{
  if (self->mNetworkPerfFeed)
  {
    +[WCM_Logging logLevel:20 message:@"iRAT: NetworkPerFeed already created."];
LABEL_6:
    LOBYTE(v4) = 1;
    return (char)v4;
  }
  id v3 = objc_alloc((Class)AnalyticsWorkspace);
  double v4 = (AnalyticsWorkspace *)[v3 initWorkspaceWithService:kSymptomAnalyticsServiceEndpoint];
  self->mAnalyticsWorkspace = v4;
  if (v4)
  {
    double v4 = (AnalyticsWorkspace *)[objc_alloc((Class)NetworkPerformanceFeed) initWithWorkspace:self->mAnalyticsWorkspace];
    self->mNetworkPerfFeed = v4;
    if (v4)
    {
      [-[AnalyticsWorkspace setQueue:](v4, "setQueue:", [+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getQueue]);
      int out_token = 0;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100132E48;
      v6[3] = &unk_10020DFA8;
      v6[4] = self;
      notify_register_dispatch("com.apple.networkd.started", &out_token, (dispatch_queue_t)&_dispatch_main_q, v6);
      goto LABEL_6;
    }
  }
  return (char)v4;
}

- (void)handleNetworkdRestart
{
}

- (BOOL)getNetworkUsageAdviceFromSF:(int)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, @"%s. Unsupported network type %s.", "-[WRM_SymptomsService getNetworkUsageAdviceFromSF:]", "WRM_NETWORK_TYPE_INVALID!!!");
      LOBYTE(v7) = 0;
      return v7;
    }
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = 1;
  }
  mNetworkPerfFeed = self->mNetworkPerfFeed;
  if (!mNetworkPerfFeed)
  {
    [(WRM_SymptomsService *)self createNetworkSymptomsFeed];
    mNetworkPerfFeed = self->mNetworkPerfFeed;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100132FD4;
  v11[3] = &unk_100211CA0;
  int v12 = a3;
  v11[4] = self;
  unsigned int v7 = [(NetworkPerformanceFeed *)mNetworkPerfFeed usageConsultOn:v5 onlyRelativeToReferencePoint:0 reply:v11];
  if (v7)
  {
    ++self->mAdviceQueried;
    id v8 = "TRUE";
  }
  else
  {
    id v8 = "FALSE";
  }
  id v9 = "WRM_NETWORK_TYPE_INVALID!!!";
  if (a3 == 1) {
    id v9 = "CELLULAR";
  }
  if (!a3) {
    id v9 = "WIFI";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"iRAT: %s: query Symptom Framework for %s advice rtn: %s", "-[WRM_SymptomsService getNetworkUsageAdviceFromSF:]", v9, v8);
  return v7;
}

- (BOOL)getNetworkFullScoreFromSF:(int)a3
{
  if (a3 == 1)
  {
    id v8 = "CELLULAR";
LABEL_9:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, @"%s. Unsupported network type %s.", "-[WRM_SymptomsService getNetworkFullScoreFromSF:]", v8);
    LOBYTE(v6) = 0;
    return v6;
  }
  if (a3)
  {
    id v8 = "WRM_NETWORK_TYPE_INVALID!!!";
    goto LABEL_9;
  }
  if (!self->mNetworkPerfFeed) {
    [(WRM_SymptomsService *)self createNetworkSymptomsFeed];
  }
  double v4 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", kSymptomAnalyticsServiceNetworkAttachmentCurrent, kSymptomAnalyticsServiceNetworkAttachmentInstant, 0);
  mNetworkPerfFeed = self->mNetworkPerfFeed;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10013322C;
  v10[3] = &unk_100211CC8;
  v10[4] = self;
  int v11 = 0;
  unsigned int v6 = [(NetworkPerformanceFeed *)mNetworkPerfFeed fullScorecardFor:1 options:v4 reply:v10];
  if (v6)
  {
    ++self->mFullScoreQueried;
    unsigned int v7 = "TRUE";
  }
  else
  {
    unsigned int v7 = "FALSE";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"iRAT: %s: query Symptom Framework for %s full score rtn: %s", "-[WRM_SymptomsService getNetworkFullScoreFromSF:]", "WIFI", v7);
  return v6;
}

- (int)mapSFNetworkAdvisoryToNetworkScore:(int)a3
{
  if (a3 == 7) {
    int v3 = 3;
  }
  else {
    int v3 = -100;
  }
  if (a3 == 6) {
    int v4 = 2;
  }
  else {
    int v4 = v3;
  }
  if (a3 == 5) {
    int v5 = 1;
  }
  else {
    int v5 = v4;
  }
  if ((a3 - 3) >= 2) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  if ((a3 & 0xFFFFFFFD) != 0) {
    return v6;
  }
  else {
    return -2;
  }
}

- (void)notifyWifiCallState:(BOOL)a3
{
  if (a3) {
    CFStringRef v3 = @"iRAT: Sending WiFiCallOnSymtomps.";
  }
  else {
    CFStringRef v3 = @"iRAT: Sending WIFIcallOFFSymtomps.";
  }
  uint64_t v4 = symptom_create();
  +[WCM_Logging logLevel:20 message:v3];

  _symptom_send(v4);
}

- (void)watchTcpConnectionFallBack
{
  if (!tcp_connection_fallback_watcher_create()) {
    +[WCM_Logging logLevel:24 message:@"iRAT: Failed to create TCP Connection Wacther"];
  }
}

- (int)calculateWifiScore
{
  return [(WRM_SymptomsService *)self mapSFNetworkAdvisoryToNetworkScore:self->mWifiAdvisory];
}

- (int)calculateCellularScore
{
  return [(WRM_SymptomsService *)self mapSFNetworkAdvisoryToNetworkScore:self->mCellularAdvisory];
}

- (int)calculateWifiHistoryScore
{
  return -200;
}

- (void)displayIKEMetrics:(id)a3
{
  if (a3 && [a3 count])
  {
    id v4 = [a3 objectForKeyedSubscript:kSymptomAnalyticsServiceFlowInstant];
    id v5 = [a3 objectForKeyedSubscript:kSymptomAnalyticsServiceFlowHistorical];
    if (v4) {
      id v5 = v4;
    }
    if (v5)
    {
      [v5 enumerateKeysAndObjectsUsingBlock:&stru_100211D08];
    }
  }
}

- (double)evaluateNetworkBandwidth
{
  if (self->mCurrentBytesIn <= self->mPrevBytesIn)
  {
    +[WCM_Logging logLevel:20, @"iRAT: Symptom Metrics not evaluating throughput", v10, v11, v12, v13, v14 message];
  }
  else
  {
    [(NSDate *)self->mSFThroughEstimationTimer timeIntervalSinceNow];
    double v4 = self->mPrevTimeSinceThroughputEstimationStarted - v3;
    double v5 = self->mCurrentBytesIn - self->mPrevBytesIn;
    double v6 = v5 / (self->mCurrentPacketsIn - self->mPrevPacketsIn + 0.000001);
    double v7 = v5 * 8.0 / (v4 * 1000000.0);
    double v8 = (v7 + self->mAvgNetworkThroughput * 19.0) / 20.0;
    self->mNetworkThroughput = v7;
    self->mAvgNetworkThroughput = v8;
    self->mPrevTimeSinceThroughputEstimationStarted = v3;
    +[WCM_Logging logLevel:28, @"iRAT: Symptom Metrics Throughput Estimation, Duration: %.2f, Delta Bytes: %.2f, Throughput:%.2f, Average Pkt Size: %.2f AVG Bandwidth: %.2f", *(void *)&v4, *(void *)&v5, *(void *)&v7, *(void *)&v6, *(void *)&v8 message];
  }
  return self->mNetworkThroughput;
}

- (BOOL)evaluateBackHaulLink
{
  return 1;
}

- (id)getImsTunnelId
{
  return self->mImsTunnelID;
}

- (void)setIKEv2WatchPoint:(id)a3
{
  self->mImsTunnelID = (NSString *)a3;
  -[WRM_SymptomsService watchpointForIKETunnel:onThreshold:](self, "watchpointForIKETunnel:onThreshold:");
}

- (BOOL)scorecardForIKETunnel:(id)a3 isInstant:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = kSymptomAnalyticsServiceFlowTagIKE;
  uint64_t v7 = kSymptomAnalyticsServiceFlowTag;
  if (!a3) {
    a3 = +[NSNull null];
  }
  double v8 = &kSymptomAnalyticsServiceFlowInstant;
  if (!v4) {
    double v8 = &kSymptomAnalyticsServiceFlowHistorical;
  }
  id v9 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, v7, a3, *v8, 0);
  mNetworkPerfFeed = self->mNetworkPerfFeed;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100133B7C;
  v12[3] = &unk_100211D30;
  v12[4] = self;
  if ([(NetworkPerformanceFeed *)mNetworkPerfFeed fullScorecardFor:1 options:v9 reply:v12])++self->mFullScoreQueried; {
  else
  }
    +[WCM_Logging logLevel:20 message:@"iRAT: Failed to ussye scorecard request."];
  return 1;
}

- (void)displayWatchpointHit:(id)a3
{
}

- (BOOL)watchpointForIKETunnel:(id)a3 onThreshold:(unsigned int)a4
{
  uint64_t v7 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", kSymptomAnalyticsServiceFlowTagIKE, kSymptomAnalyticsServiceFlowTag, 0);
  mNetworkPerfFeed = self->mNetworkPerfFeed;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100133DD4;
  v10[3] = &unk_100211D30;
  v10[4] = self;
  if (([(NetworkPerformanceFeed *)mNetworkPerfFeed watchpointOn:1 forIdentifier:a3 andKey:kPerformanceFlowTxReTxPackets onThreshold:v7 withOptions:v10 uponHit:(double)a4] & 1) == 0)+[WCM_Logging logLevel:20 message:@"iRAT: Failed to issue watchpoint request."]; {
  return 1;
  }
}

- (double)getCurrentAgeOfConnectedLinkInSeconds
{
  return self->mCurrentMetricsAge;
}

- (int)calculateCellularHistoryScore
{
  return -200;
}

- (void)resetSFContext
{
  self->mBackHaulLinkGood = 1;
  self->mCurrentMetricsAge = 0.0;
  *(_OWORD *)&self->mPrevConnAttempt = 0u;
  *(_OWORD *)&self->mCurrentConnAttempt = 0u;
  *(_OWORD *)&self->mCurrentMinRTT = 0u;
  self->mCurrentVarRTT = 0.0;
}

- (void)notifyIRATManager:(int64_t)a3
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "kWRMM_IKEv2_RTT_UPDATE", a3);
  *(_OWORD *)keys = *(_OWORD *)&off_100211D70;
  values[0] = xpc_uint64_create(0x3EAuLL);
  values[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)double v8 = *(_OWORD *)&off_100211D80;
  object[0] = xpc_uint64_create(0x3E8uLL);
  object[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v8, object, 2uLL);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 20, @"%s: ready to send a xpc message: %@.", "-[WRM_SymptomsService notifyIRATManager:]", v6);
  [+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") updateControllerState:v6];
  xpc_release(object[0]);
  xpc_release(v6);
  xpc_release(values[0]);
  xpc_release(v5);
  xpc_release(v4);
}

- (double)getNetworkThroughput
{
  return self->mAvgNetworkThroughput;
}

- (void)updateSIPMetrics:(BOOL)a3
{
  self->BOOL mSIPTimeOutOverWiFiDetected = a3;
}

- (void)updateDPDMetrics:(BOOL)a3
{
  self->BOOL mWiFiIPsecTunnelDisconnected = a3;
}

- (BOOL)isIMSTransportQualityGood
{
  return !self->mSIPTimeOutOverWiFiDetected && !self->mWiFiIPsecTunnelDisconnected;
}

- (BOOL)dpdFailureDetected
{
  return self->mWiFiIPsecTunnelDisconnected;
}

- (BOOL)sipTimeOutDetected
{
  return self->mSIPTimeOutOverWiFiDetected;
}

- (double)getTCPAvgRTT
{
  return self->mCurrentAvgRTT;
}

- (double)getTCPMinRTT
{
  return self->mCurrentMinRTT;
}

- (double)getTCPRttVar
{
  return self->mCurrentVarRTT;
}

- (double)getRxDupeRatio
{
  return self->mCurrentDupeRatio;
}

- (double)getRxRetryRatio
{
  return self->mCurrentRetryRatio;
}

- (void)triggerAutoBugCapture:(id)a3 subType:(id)a4 subtypeContext:(id)a5
{
  id v6 = [(SDRDiagnosticReporter *)self->mABCreporter signatureWithDomain:@"iRATManager" type:a3 subType:a4 subtypeContext:a5 detectedProcess:@"WirelessRadioManagerd" triggerThresholdValues:0];
  mABCreporter = self->mABCreporter;

  [(SDRDiagnosticReporter *)mABCreporter snapshotWithSignature:v6 duration:0 events:0 payload:0 actions:&stru_100211DB0 reply:1.0];
}

@end