@interface WRM_HandoverManager
+ (id)WRM_HandoverManagerSingleton;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)can4G5GMeetApplicationRequirementsAppTypeWiFiCallingCallIdle:(int)a3;
- (BOOL)canCellularMeetApplicationRequirement:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6 :(int)a7;
- (BOOL)canCellularMeetApplicationRequirementsAppTypeData;
- (BOOL)canCellularMeetApplicationRequirementsAppTypeThumper:(BOOL)a3 :(int)a4 :(int)a5;
- (BOOL)canCellularMeetApplicationRequirementsAppTypeWiFiCalling:(BOOL)a3 :(int)a4 :(int)a5;
- (BOOL)canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallActive:(int)a3;
- (BOOL)canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallIdle:(int)a3;
- (BOOL)canWiFiMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(int)a6;
- (BOOL)canWiFiMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5;
- (BOOL)canWiFiRadioMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5;
- (BOOL)canWiFiRadioMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5;
- (BOOL)canWiFiTransportMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5;
- (BOOL)canWiFiTransportMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5;
- (BOOL)disableICEClient;
- (BOOL)disableQMIClient;
- (BOOL)doesIRATClientSubscriptionContextExist;
- (BOOL)enableiRATManager;
- (BOOL)evaluateCellularLinkForWiFiCallingCellPreferredPolicy:(int)a3 :(BOOL)a4;
- (BOOL)evaluateCellularLinkForWiFiCallingIMSPreferredPolicy:(int)a3 :(BOOL)a4;
- (BOOL)evaluateCellularLinkForWiFiCallingWiFiPreferredPolicy:(int)a3 :(BOOL)a4;
- (BOOL)handoverEvaluationRequired;
- (BOOL)highThroughputRequired:(int)a3;
- (BOOL)isActiveHandoverSupported;
- (BOOL)isAppQualityGoodOnWiFi:(int)a3;
- (BOOL)isCallActive;
- (BOOL)isCellularEntryCriteriaMetForIMSThumpCallCurrentLinkWiFi;
- (BOOL)isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi:(BOOL)a3;
- (BOOL)isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone;
- (BOOL)isCellularExitCriteriaMetForIMSThumpCallCurrentLinkCellular;
- (BOOL)isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE:(BOOL)a3;
- (BOOL)isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR:(BOOL)a3;
- (BOOL)isCellularExitCriteriaMetForVoiceCallCallCurrentLinkUMTS;
- (BOOL)isCellularThroughputGood;
- (BOOL)isDeviceConnectedOverNonLTERadio;
- (BOOL)isEnhancedCTServiceNeeded;
- (BOOL)isEnhancedSisSupported;
- (BOOL)isIMSTransportQualityGood;
- (BOOL)isIbiSdmSupported;
- (BOOL)isLteEntryCriteriaMetCurrentLinkNone;
- (BOOL)isLteEntryCriteriaMetCurrentLinkWiFi:(int64_t)a3;
- (BOOL)isMovingAverageAudioQualityOfCurrentCallGood:(int)a3;
- (BOOL)isNrEntryCriteriaMetCurrentLinkNone;
- (BOOL)isNrEntryCriteriaMetCurrentLinkWiFi:(int64_t)a3;
- (BOOL)isQmiSdmSupported;
- (BOOL)isRecentDevice;
- (BOOL)isSaAllowedOnWiFiAssociation:(int64_t)a3;
- (BOOL)isSisSupportedOnICE;
- (BOOL)isUplinkAudioQualityOfCurrentCallGood:(int)a3;
- (BOOL)isVoIPCallActive;
- (BOOL)isWiFiAppEntryCriteriaMet;
- (BOOL)isWiFiAppExitCriteriaMet;
- (BOOL)isWiFiArqQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6;
- (BOOL)isWiFiArqQualityIndicatorGoodControlFW:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6;
- (BOOL)isWiFiArqQualityIndicatorGoodUserData:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6;
- (BOOL)isWiFiBeaconLossQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(int)a5;
- (BOOL)isWiFiLinkActive;
- (BOOL)isWiFiLinkEvaluationDesired;
- (BOOL)isWiFiLoadQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6;
- (BOOL)isWiFiSymtompsIndicatorGoodEnoughForActiveApplication:(unint64_t)a3 :(int)a4;
- (BOOL)isWiFiSymtompsIndicatorGoodEnoughForIdleApplication:(unint64_t)a3 :(int)a4;
- (BOOL)isWiFiVoIPQualityGoodEnough;
- (BOOL)needWiFiLQM;
- (WRM_HandoverManager)autorelease;
- (WRM_HandoverManager)init;
- (id)getCTService;
- (id)getIbiClient;
- (id)getMotionController;
- (id)getQmiClientForSim:(int64_t)a3;
- (id)getQueue;
- (id)getSCService;
- (id)getSymptomsService;
- (id)getWiFiCallingController;
- (id)getWiFiController;
- (id)getWiFiService;
- (id)getiRATClientFromList:(int)a3;
- (id)getiRATConfigController;
- (int)convertToHOAlgorithmType:(unint64_t)a3;
- (int)evaluateLink:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6 :(int)a7 :(int)a8;
- (int)evaluateLinkNonWiFiPreferred:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6 :(int)a7;
- (int)evaluateLinkWiFiPreferred:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6;
- (int)getIWLANServiceType;
- (int64_t)getRSSIHysteresis;
- (int64_t)getSNRHysteresis;
- (unint64_t)retainCount;
- (void)addiRatClient:(id)a3;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)configureRTPMetricsReporting;
- (void)createIBIClient;
- (void)createQMIClient;
- (void)createSymptomsService;
- (void)dealloc;
- (void)deleteiRATClient:(int)a3;
- (void)evalExitForceOutranking;
- (void)evalFR2CoverageLikely:(BOOL)a3;
- (void)evalSAStateSlice;
- (void)evalSAStatusWiFiCallCallingPrefChanged;
- (void)evaluateActiveCallQuality;
- (void)evaluateHandover;
- (void)evaluateWiFiVersusCell;
- (void)existingContexts;
- (void)feedAWDCallEndStats;
- (void)feedAWDDataLinkPreferenceChange:(int)a3;
- (void)forceActiveModeEval:(BOOL)a3;
- (void)handleAVGStreamingThroughput:(float)a3;
- (void)handleCTConfig;
- (void)handleCallKitConfig;
- (void)handleCellularLinkQualityUpdate:(id)a3;
- (void)handleControllerAvailability:(unint64_t)a3;
- (void)handleDataPlanUpdate:(id)a3;
- (void)handleIPTelephonyMetrics:(id)a3;
- (void)handleIWLANMetrics:(id)a3;
- (void)handleInternalMessage:(id)a3;
- (void)handleLinkPrefSubscribe:(id)a3;
- (void)handleMotionUpdate:(id)a3;
- (void)handleNetworkdConfig;
- (void)handlePeriodicRTPMetrics:(id)a3;
- (void)handleSIPMetricsRecevied:(id)a3;
- (void)handleSIPStalledMetricsRecevied:(id)a3;
- (void)handleSessionNotification:(id)a3;
- (void)handleSubscribeStatusUpdate:(id)a3 :(BOOL)a4;
- (void)handleWiFiConfig;
- (void)handleWiFiLinkQualityUpdate:(id)a3;
- (void)handleWiFiStateChaneEvents:(id)a3;
- (void)initHandoverReasonCode;
- (void)initWiFiCellDataEval;
- (void)lowPowerModePeriodicWakeUp;
- (void)monitorNetworkSymptoms:(int)a3;
- (void)monitorTransportMetrics;
- (void)notifyAVStatus:(unsigned __int8)a3 :(unsigned __int16)a4;
- (void)notifyBBUsingMappedSlotInfo:(BOOL)a3;
- (void)notifyBBVoIPState:(unsigned __int8)a3 :(unsigned __int8)a4 :(unsigned __int8)a5 :(unsigned __int8)a6;
- (void)notifyDuplicationState:(unsigned __int8)a3;
- (void)notifyEHBState:(unsigned __int8)a3;
- (void)notifyRecommendations;
- (void)postBBNotification:(unsigned __int8)a3 :(unsigned __int8)a4;
- (void)postLinkPreference:(unint64_t)a3;
- (void)postWRMStateToBB;
- (void)registerForCTNotifications;
- (void)registerForSCNotifications;
- (void)registerSFOutrankDecisionNotification;
- (void)registerSFRestartNotification;
- (void)registerThermalNotificationReasonToThrottle;
- (void)registerThermalTimeToThrottleNotification;
- (void)removeiRatClient:(id)a3;
- (void)resetActiveCallEvaluationMetrics;
- (void)resetActiveCallTimer;
- (void)rxVoIPAppNotification:(BOOL)a3;
- (void)sendMessage:(int)a3 withMsg:(id)a4;
- (void)setBBSAState:(BOOL)a3;
- (void)setCTService:(id)a3;
- (void)setHOAlertUI:(BOOL)a3;
- (void)setIWLANServiceType:(int)a3;
- (void)setPingPongTimerMultipler:(unint64_t)a3 :(int)a4 :(unint64_t)a5;
- (void)setSCService:(id)a3;
- (void)setWiFiLinkDown:(BOOL)a3;
- (void)setiRATPolicy:(unint64_t)a3;
- (void)showHOAlertUI:(BOOL)a3;
- (void)submitCallEndMetics;
- (void)submitDataLinkPreferenceMetrics:(int)a3;
- (void)submitMetricsCBRSWithDataSimRecommendation:(BOOL)a3 forSimSlot:(int64_t)a4;
- (void)submitWiFiVersusCellAWDMetrics;
- (void)switchPrivateNwDataSim:(int64_t)a3 currentSlotQuality:(int)a4 anyCallState:(int)a5;
- (void)toggleSAState:(BOOL)a3;
- (void)triggerABC:(id)a3 subType:(id)a4 subtypeContext:(id)a5;
- (void)triggerBWEval;
- (void)triggerEnableSA:(BOOL)a3;
- (void)triggerHarvestDataEval;
- (void)updateAVCRTPMetric:(unint64_t)a3;
- (void)updateActiveHandoverStatus;
- (void)updateAppState:(int)a3 Category:(id)a4 sessionType:(int)a5;
- (void)updateCellularMetricsMovAverage;
- (void)updateControllerSession:(id)a3 ofId:(unint64_t)a4;
- (void)updateControllerState:(id)a3;
- (void)updateHandoverReasonCode:(int)a3;
@end

@implementation WRM_HandoverManager

- (BOOL)canCellularMeetApplicationRequirementsAppTypeData
{
  id v3 = [(WRM_HandoverManager *)self getCTService];
  id v4 = [(WRM_HandoverManager *)self getSCService];
  unsigned int v5 = [v3 getServingCellType];
  unsigned __int8 v6 = [v3 dataAttachedWithCellularNetwork];
  unsigned __int8 v7 = [v3 cellularDataEnabled];
  unsigned int v8 = [v4 getCellularDataLQM];
  if (v5 == 10) {
    unsigned __int8 v9 = 0;
  }
  else {
    unsigned __int8 v9 = v6;
  }
  char v10 = v9 & v7;
  if (v8 > 0x31) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    CFStringRef v12 = @"CT_DATA meet application requirements";
  }
  else
  {
    [(WRM_HandoverManager *)self updateHandoverReasonCode:0x20000];
    CFStringRef v12 = @"CT_DATA can't meet application requirements";
  }
  +[WCM_Logging logLevel:24 message:v12];
  return v11;
}

- (void)handleSessionNotification:(id)a3
{
  int64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64 <= 407)
  {
    if (uint64 > 201)
    {
      switch(uint64)
      {
        case 202:
          [(WRM_HandoverManager *)self handlePeriodicRTPMetrics:a3];
          break;
        case 400:
          [(WRM_HandoverManager *)self handleLinkPrefSubscribe:a3];
          [(WCM_WiFiController *)self->mWiFi toggleWiFiLQMIfNeeded:[(WRM_HandoverManager *)self needWiFiLQM]];
          [(WRM_HandoverManager *)self registerForCTNotifications];
          [(WRM_HandoverManager *)self registerForSCNotifications];
          break;
        case 401:
          [(WRM_HandoverManager *)self handleSubscribeStatusUpdate:a3 :1];
          break;
      }
    }
    else if (uint64 == 100)
    {
      [(WRM_HandoverManager *)self monitorTransportMetrics];
      [(WRM_HandoverManager *)self handleWiFiConfig];
    }
    else if (uint64 == 103)
    {
      [(WRM_HandoverManager *)self monitorTransportMetrics];
      [(WRM_HandoverManager *)self handleWiFiStateChaneEvents:a3];
    }
    else if (uint64 == 109 && [(WRM_HandoverManager *)self isRecentDevice])
    {
      dispatch_time_t v6 = dispatch_time(0, 2000000000);
      mQueue = self->mQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C76AC;
      block[3] = &unk_10020D980;
      block[4] = self;
      dispatch_after(v6, mQueue, block);
    }
  }
  else if (uint64 <= 419)
  {
    switch(uint64)
    {
      case 408:
        [(WRM_HandoverManager *)self handleCellularLinkQualityUpdate:a3];
        break;
      case 411:
        [(WRM_HandoverManager *)self handleBBAssertionBGAppActiveRequest:a3];
        break;
      case 416:
        [(WRM_HandoverManager *)self handleIWLANMetrics:a3];
        break;
    }
  }
  else if (uint64 > 700)
  {
    if (uint64 == 701)
    {
      [(WRM_HandoverManager *)self handleSIPMetricsRecevied:a3];
    }
    else if (uint64 == 1000)
    {
      xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
      [(WRM_HandoverManager *)self handleInternalMessage:value];
    }
  }
  else if (uint64 == 420)
  {
    [(WRM_HandoverManager *)self handleSIPStalledMetricsRecevied:a3];
  }
  else if (uint64 == 700)
  {
    [(WRM_HandoverManager *)self handleIPTelephonyMetrics:a3];
  }
}

- (void)handleInternalMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kInternalMessageId");
  xpc_object_t value = xpc_dictionary_get_value(a3, "kInternalMessageArgs");
  if (uint64 == 1003)
  {
    +[WCM_Logging logLevel:29 message:@"handleInternalMessage:handleWiFiLinkQualityUpdate"];
    [(WRM_HandoverManager *)self monitorTransportMetrics];
    [(WRM_HandoverManager *)self handleWiFiLinkQualityUpdate:value];
  }
  else if (uint64 == 1001)
  {
    [(WRM_HandoverManager *)self handleMotionUpdate:value];
  }
}

- (void)evaluateWiFiVersusCell
{
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DAB0;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async(mQueue, block);
}

- (BOOL)can4G5GMeetApplicationRequirementsAppTypeWiFiCallingCallIdle:(int)a3
{
  id v5 = [(WRM_HandoverManager *)self getCTService];
  unsigned int v6 = [v5 getServingCellType];
  id v7 = [v5 getCurrentSignalBars];
  if (([v5 isVoLTESupported] & 1) == 0)
  {
    CFStringRef v9 = @"canMeetApplicationRequirementsAppTypeWiFiCallingCallIdle, VoLTE not enabled,preferWiFi";
LABEL_9:
    +[WCM_Logging logLevel:24 message:v9];
    return 0;
  }
  +[WCM_Logging logLevel:24, @"canMeetApplicationRequirementsAppTypeWiFiCallingCallIdle, signal bars:%d, VoLTE enabled: %d", v7, 1 message];
  if ((v6 & 0xFFFFFFF7) != 1) {
    return 0;
  }
  if (a3 == 2)
  {
    if ([(WRM_HandoverManager *)self isLteEntryCriteriaMetCurrentLinkNone]
      || [(WRM_HandoverManager *)self isNrEntryCriteriaMetCurrentLinkNone])
    {
      CFStringRef v8 = @"EntryCriteriaMetCurrentLinkNone true";
      goto LABEL_17;
    }
    CFStringRef v9 = @"EntryCriteriaMetCurrentLinkNone false";
    goto LABEL_9;
  }
  if (a3 != 1)
  {
    if (![(WRM_HandoverManager *)self isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE:0])
    {
      CFStringRef v8 = @"isCellularExitCriteriaMetForCellularCallCurrentLinkLTE false";
      goto LABEL_17;
    }
    CFStringRef v9 = @"isCellularExitCriteriaMetForCellularCallCurrentLinkLTE true";
    goto LABEL_9;
  }
  if (![(WRM_HandoverManager *)self isLteEntryCriteriaMetCurrentLinkWiFi:2]
    && ![(WRM_HandoverManager *)self isNrEntryCriteriaMetCurrentLinkWiFi:2])
  {
    CFStringRef v9 = @"EntryCriteriaMetCurrentLinkWiFi false";
    goto LABEL_9;
  }
  CFStringRef v8 = @"EntryCriteriaMetCurrentLinkWiFi true";
LABEL_17:
  +[WCM_Logging logLevel:24 message:v8];
  return 1;
}

- (BOOL)isNrEntryCriteriaMetCurrentLinkWiFi:(int64_t)a3
{
  id v5 = [(WRM_HandoverManager *)self getCTService];
  unsigned int v6 = (char *)[v5 getCurrentSignalBars];
  [v5 getCurrentMovAvgSignalBars];
  float v8 = v7;
  unsigned int v9 = [v5 isVoiceLQMValid];
  id v10 = [(WRM_HandoverManager *)self getiRATConfigController];
  unsigned int v11 = [(WRM_HandoverManager *)self isActiveHandoverSupported];
  BOOL v12 = 0;
  CFStringRef v13 = @"isEntryCriteriaMetCurrentLinkWiFi: Entry Criteria not met";
  if (v11 && v9)
  {
    id v14 = [v5 getLteVoiceLQM];
    +[WCM_Logging logLevel:24, @"isEntryCriteriaMetCurrentLinkWiFi, Voice LQM: %d, Signal Bars: %d, Mov Avg Sig Bars:%f", v14, v6, v8 message];
    if ((v14 - 50) <= 0xFFFFFFCE
      && (float)(v8 * 10.0) > (float)(uint64_t)[v10 minMovSigBarTh0]
      && (uint64_t)v6 >= (uint64_t)((char *)[v10 minSigBarTh0] - a3))
    {
      BOOL v12 = 1;
      CFStringRef v13 = @"isEntryCriteriaMetCurrentLinkWiFi: LQM better than kPOOR";
    }
    else
    {
      BOOL v12 = 0;
      CFStringRef v13 = @"isEntryCriteriaMetCurrentLinkWiFi: Entry Criteria not met";
    }
  }
  +[WCM_Logging logLevel:24 message:v13];
  return v12;
}

- (BOOL)isLteEntryCriteriaMetCurrentLinkWiFi:(int64_t)a3
{
  id v5 = [(WRM_HandoverManager *)self getSCService];
  id v6 = [(WRM_HandoverManager *)self getCTService];
  float v7 = (char *)[v6 getCurrentSignalBars];
  unsigned int v8 = [v5 getCellularDataLQM];
  [v6 getCurrentMovAvgSignalBars];
  float v10 = v9;
  unsigned int v11 = [v6 isVoiceLQMValid];
  id v12 = [(WRM_HandoverManager *)self getiRATConfigController];
  if (![(WRM_HandoverManager *)self isActiveHandoverSupported] || !v11)
  {
    if (v8 - 50 <= 0xFFFFFFCE
      && (float)(v10 * 10.0) > (float)(uint64_t)[v12 minMovSigBarTh0]
      && (uint64_t)v7 >= (uint64_t)((char *)[v12 minSigBarTh0] - a3))
    {
      BOOL v14 = 1;
      CFStringRef v15 = @"isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi: Data LQM better than kPOOR";
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v13 = [v6 getLteVoiceLQM];
  +[WCM_Logging logLevel:24, @"isLteEntryCriteriaMetCurrentLinkWiFi, Voice LQM: %d, Signal Bars: %d, Mov Avg Sig Bars:%f", v13, v7, v10 message];
  if ((v13 - 50) > 0xFFFFFFCE
    || (float)(v10 * 10.0) <= (float)(uint64_t)[v12 minMovSigBarTh0]
    || (uint64_t)v7 < (uint64_t)((char *)[v12 minSigBarTh0] - a3))
  {
LABEL_10:
    BOOL v14 = 0;
    CFStringRef v15 = @"isLteEntryCriteriaMetCurrentLinkWiFi: Entry Criteria not met";
    goto LABEL_11;
  }
  BOOL v14 = 1;
  CFStringRef v15 = @"isLteEntryCriteriaMetCurrentLinkWiFi: LQM better than kPOOR";
LABEL_11:
  +[WCM_Logging logLevel:24 message:v15];
  return v14;
}

- (BOOL)canCellularMeetApplicationRequirementsAppTypeWiFiCalling:(BOOL)a3 :(int)a4 :(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  id v9 = [(WRM_HandoverManager *)self getCTService];
  self->deviceRegisteredWithCellularNetwork = [v9 registeredWithCellularNetwork];
  unsigned int v10 = [v9 dataAttachedWithCellularNetwork];
  unsigned int v11 = [v9 isIMSPreferenceEnabled];
  +[WCM_Logging logLevel:24, @"canCellularMeetApplicationRequirementsAppTypeWiFiCalling, algorithm: %d, reg status:%d, attach status:%d, IMS preference: %d", v5, self->deviceRegisteredWithCellularNetwork, v10, v11 message];
  if (v5 == 2)
  {
    unsigned int v12 = [(WRM_HandoverManager *)self evaluateCellularLinkForWiFiCallingCellPreferredPolicy:v6 :v7];
  }
  else if (v5 == 1)
  {
    unsigned int v12 = [(WRM_HandoverManager *)self evaluateCellularLinkForWiFiCallingIMSPreferredPolicy:v6 :v7];
  }
  else
  {
    unsigned int v12 = [(WRM_HandoverManager *)self evaluateCellularLinkForWiFiCallingWiFiPreferredPolicy:v6 :v7];
  }
  BOOL v13 = v12;
  if (!self->deviceRegisteredWithCellularNetwork && (v10 & v11 & 1) == 0)
  {
    +[WCM_Logging logLevel:24 message:@"canCellularMeetApplicationRequirementsAppTypeWiFiCalling:device not registered or attached with cellular network with IMS preference"];
    BOOL v13 = 0;
  }
  +[WCM_Logging logLevel:24, @"canCellularMeetApplicationRequirementsAppTypeWiFiCalling:CellualrEval Status:%d", v13 message];
  return v13;
}

- (BOOL)handoverEvaluationRequired
{
  id v3 = [(WRM_HandoverManager *)self getMotionController];
  id v4 = [(WRM_HandoverManager *)self getiRATConfigController];
  [(NSDate *)self->mStartTime timeIntervalSinceNow];
  double v6 = v5;
  double v7 = self->prevTimeSinceStart - v5;
  +[WCM_Logging logLevel:24, @"HO Evaluation time duration is: %lf", *(void *)&v7 message];
  switch([v3 getMobilityState])
  {
    case 0u:
      +[WCM_Logging logLevel:24 message:@"Device motion: STATIONARY"];
      if (v7 * 1000.0 < (double)(uint64_t)[v4 pingPongAvoidanceThresholdStationary]) {
        goto LABEL_18;
      }
      self->prevTimeSinceStart = v6;
      goto LABEL_20;
    case 1u:
      double v8 = (double)(uint64_t)[v4 pingPongAvoidanceThresholdWalking];
      double v9 = v7 * 1000.0;
      BOOL v10 = v7 * 1000.0 >= v8;
      if (v7 * 1000.0 >= v8) {
        self->prevTimeSinceStart = v6;
      }
      CFStringRef v11 = @"Device motion: WALKING";
      goto LABEL_16;
    case 2u:
      double v8 = (double)(uint64_t)[self pingPongAvoidanceThresholdRunning];
      double v9 = v7 * 1000.0;
      BOOL v10 = v7 * 1000.0 >= v8;
      if (v7 * 1000.0 >= v8) {
        self->prevTimeSinceStart = v6;
      }
      CFStringRef v11 = @"Device motion: RUNNING";
      goto LABEL_16;
    case 3u:
      double v8 = (double)(uint64_t)[v4 pingPongAvoidanceThresholdStationary];
      double v9 = v7 * 1000.0;
      BOOL v10 = v7 * 1000.0 >= v8;
      if (v7 * 1000.0 >= v8) {
        self->prevTimeSinceStart = v6;
      }
      CFStringRef v11 = @"Device motion: VEHICULAR";
      goto LABEL_16;
    case 4u:
      double v8 = (double)(uint64_t)[v4 pingPongAvoidanceThresholdWalking];
      double v9 = v7 * 1000.0;
      BOOL v10 = v7 * 1000.0 >= v8;
      if (v7 * 1000.0 >= v8) {
        self->prevTimeSinceStart = v6;
      }
      CFStringRef v11 = @"Device motion: PEDESTRIAN";
LABEL_16:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v11, v8, v9);
      break;
    default:
      double v12 = (double)(uint64_t)[v4 pingPongAvoidanceThresholdStationary];
      if (v7 * 1000.0 >= v12)
      {
        self->prevTimeSinceStart = v6;
        +[WCM_Logging logLevel:24, @"Device motion: UNKNOWN", v12, v7 * 1000.0 message];
LABEL_20:
        BOOL v10 = 1;
      }
      else
      {
LABEL_18:
        BOOL v10 = 0;
      }
      break;
  }
  return v10;
}

- (void)handleWiFiLinkQualityUpdate:(id)a3
{
  +[WCM_Logging logLevel:24 message:@"Handover Manager received WiFi link metrics"];
  byte_10027CEC1 = 0;
  [(WRM_HandoverManager *)self updateCellularMetricsMovAverage];
  if ([(WRM_HandoverManager *)self isRecentDevice]) {
    [(WRM_HandoverManager *)self evaluateWiFiVersusCell];
  }
  if ([(WRM_HandoverManager *)self handoverEvaluationRequired])
  {
    +[WCM_Logging logLevel:24 message:@"Evaluating WiFi versus Cellular link preference."];
    [(WRM_HandoverManager *)self evaluateHandover];
  }
  else
  {
    +[WCM_Logging logLevel:24 message:@"No need of Handover Evaluation: Evaluation Criteria not met."];
  }
}

+ (id)WRM_HandoverManagerSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C6468;
  block[3] = &unk_10020D980;
  block[4] = a1;
  if (qword_10027D240 != -1) {
    dispatch_once(&qword_10027D240, block);
  }
  return (id)qword_10027D248;
}

- (id)getQueue
{
  return self->mQueue;
}

- (BOOL)canWiFiMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (![(WRM_HandoverManager *)self getIWLANServiceType]
    && objc_msgSend(-[WRM_HandoverManager getCTService](self, "getCTService"), "getServingCellType") == 10)
  {
    uint64_t v9 = 0x20000;
LABEL_7:
    [(WRM_HandoverManager *)self updateHandoverReasonCode:v9];
    LOBYTE(v10) = 1;
    return v10;
  }
  BOOL v10 = [(WRM_HandoverManager *)self canWiFiRadioMeetIdleApplicationRequirements:a3 :a4 :v5];
  if (v10)
  {
    BOOL v10 = [(WRM_HandoverManager *)self canWiFiTransportMeetIdleApplicationRequirements:a3 :a4 :v5];
    if (v10)
    {
      uint64_t v9 = 0x10000;
      goto LABEL_7;
    }
  }
  return v10;
}

- (BOOL)isWiFiSymtompsIndicatorGoodEnoughForIdleApplication:(unint64_t)a3 :(int)a4
{
  if ([(WRM_SymptomsService *)self->mSymtomsService isBackhaulGood])
  {
    if (a3 - 1 >= 2)
    {
      if (!a3)
      {
        unsigned int v6 = [(WRM_SymptomsService *)self->mSymtomsService isConnectedLinkGood:0];
        +[WCM_Logging logLevel:24, @"{%s}isWiFiSymtompsIndicatorGoodEnoughForIdleApplication: return %d", "CT_DATA", v6 message];
        goto LABEL_15;
      }
      unsigned int v6 = 1;
    }
    else
    {
      unsigned int v6 = [(WRM_SymptomsService *)self->mSymtomsService isConnectedLinkGood:0];
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
  if (a3)
  {
    if (a3 == 1)
    {
      double v7 = "CT_VOICE";
    }
    else
    {
      double v7 = "UNKNOWN_APP!!!";
      if (a3 == 2) {
        double v7 = "CT_Th_Call";
      }
    }
  }
  else
  {
    double v7 = "CT_DATA";
  }
  +[WCM_Logging logLevel:24, @"{%s}isWiFiSymtompsIndicatorGoodEnoughForIdleApplication: return %d", v7, v6 message];
LABEL_15:
  if (v6) {
    return 1;
  }
  if ([(WRM_SymptomsService *)self->mSymtomsService dpdFailureDetected]) {
    [(WRM_HandoverManager *)self updateHandoverReasonCode:1];
  }
  if ([(WRM_SymptomsService *)self->mSymtomsService sipTimeOutDetected]) {
    [(WRM_HandoverManager *)self updateHandoverReasonCode:64];
  }
  [(WRM_HandoverManager *)self updateHandoverReasonCode:128];
  return 0;
}

- (BOOL)canWiFiTransportMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (![[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController", a3) symtompsMetricsEnabled])return 1; {

  }
  return [(WRM_HandoverManager *)self isWiFiSymtompsIndicatorGoodEnoughForIdleApplication:a4 :v5];
}

- (BOOL)canWiFiRadioMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v21 = [(WRM_HandoverManager *)self getiRATConfigController];
  uint64_t v9 = [(WCM_WiFiController *)self->mWiFi wifiService];
  BOOL v10 = [(WCM_WiFiService *)v9 getRSSI];
  CFStringRef v11 = [(WCM_WiFiService *)v9 getSNR];
  unsigned int v12 = [(WCM_WiFiService *)v9 isWiFiNetworkCaptive];
  int64_t v20 = [(WRM_HandoverManager *)self getSNRHysteresis];
  int64_t v19 = [(WRM_HandoverManager *)self getRSSIHysteresis];
  unsigned int v13 = [(WRM_HandoverManager *)self isWiFiArqQualityIndicatorGood:a3 :a4 :v5 :0];
  unsigned int v14 = [(WRM_HandoverManager *)self isWiFiBeaconLossQualityIndicatorGood:a3 :a4 :v5];
  unsigned int v15 = [(WRM_HandoverManager *)self isWiFiLoadQualityIndicatorGood:a3 :a4 :0 :v5];
  +[WCM_Logging logLevel:24, @"canWiFiRadioMeetIdleApplicationRequirements: RSSI = %lld, SNR=%lld, ARQ Quality=%d, Beacon Quality =%d, Load Quality =%d, WiFi Captive Status: %d, connected link type: %d", v10, v11, v13, v14, v15, v12, v5 message];
  if (a4 - 1 >= 2)
  {
    if (!a4)
    {
      +[WCM_Logging logLevel:24 message:@"canWiFiRadioMeetIdleApplicationRequirements: CT_DATA"];
      return byte_10027CF11 == 0;
    }
    CFStringRef v17 = @"canWiFiRadioMeetIdleApplicationRequirements: Application category not supported";
    goto LABEL_15;
  }
  +[WCM_Logging logLevel:24 message:@"canWiFiRadioMeetIdleApplicationRequirements: CT_VOICE"];
  if (v5)
  {
    if (v5 == 1)
    {
      +[WCM_Logging logLevel:24 message:@"canWiFiRadioMeetIdleApplicationRequirements:connectedLinkType == WRM_WIFI"];
      if ((uint64_t)v11 < (uint64_t)((char *)[v21 minIdleWiFiSnrTh1] + v20)
        || (uint64_t)v10 < (uint64_t)((char *)[v21 minIdleWiFiRssiTh1] + v19)
        || ((v15 ^ 1) & 1) != 0
        || ((v14 ^ 1) & 1) != 0
        || v13 != 1)
      {
        if ((uint64_t)v11 < (uint64_t)((char *)[v21 minIdleWiFiSnrTh1] + v20)) {
          [(WRM_HandoverManager *)self updateHandoverReasonCode:4];
        }
        if ((uint64_t)v10 < (uint64_t)((char *)[v21 minIdleWiFiRssiTh1] + v19)) {
          [(WRM_HandoverManager *)self updateHandoverReasonCode:8];
        }
        return 0;
      }
      return 1;
    }
    CFStringRef v17 = @"CT_VOICE: connectedLinkType == NO Context";
LABEL_15:
    +[WCM_Logging logLevel:24 message:v17];
    return 1;
  }
  +[WCM_Logging logLevel:24 message:@"canWiFiRadioMeetIdleApplicationRequirements:connectedLinkType == WRM_CELLULAR"];
  if ((uint64_t)v11 < (uint64_t)((char *)[v21 minIdleWiFiSnrTh0] + v20)) {
    return 0;
  }
  if ((uint64_t)v10 >= (uint64_t)((char *)[v21 minIdleWiFiRssiTh0] + v19)) {
    char v18 = v15;
  }
  else {
    char v18 = 0;
  }
  return v18 & v13 & v14;
}

- (id)getiRATConfigController
{
  return self->miRATConfig;
}

- (BOOL)isWiFiLoadQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6
{
  BOOL v7 = a5;
  unsigned int v9 = [(WRM_HandoverManager *)self getIWLANServiceType];
  if (v9 != 1)
  {
    BOOL v10 = [(WCM_WiFiController *)self->mWiFi wifiService];
    id v11 = [(WRM_HandoverManager *)self getiRATConfigController];
    id v12 = [(WCM_WiFiService *)v10 getCCA];
    if (a6 == 1)
    {
      if (!v7)
      {
        id v13 = [v11 minIdleWiFiCcaTh1];
        goto LABEL_9;
      }
    }
    else if (!a6)
    {
      if (v7) {
        id v13 = [v11 minActiveWiFiCcaTh0];
      }
      else {
        id v13 = [v11 minIdleWiFiCcaTh0];
      }
LABEL_9:
      if ((uint64_t)v12 >= (uint64_t)v13)
      {
        [(WRM_HandoverManager *)self updateHandoverReasonCode:32];
        LOBYTE(v9) = 0;
        return v9;
      }
    }
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)isWiFiBeaconLossQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  BOOL v7 = [(WCM_WiFiController *)self->mWiFi wifiService];
  if (![(WCM_WiFiService *)v7 isBeaconPerValid]) {
    return 1;
  }
  id v8 = [(WRM_HandoverManager *)self getiRATConfigController];
  [(WCM_WiFiService *)v7 getBeaconPer];
  uint64_t v10 = (uint64_t)(v9 * 100.0);
  +[WCM_Logging logLevel:24, @" Beacon PER %lld", v10 message];
  if (!a5)
  {
    id v11 = [v8 minWiFiBeaconPerTh0];
    return (uint64_t)v11 >= v10;
  }
  if (a5 != 1) {
    return 1;
  }
  id v11 = [v8 minWiFiBeaconPerTh1];
  return (uint64_t)v11 >= v10;
}

- (BOOL)isWiFiArqQualityIndicatorGoodUserData:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6
{
  BOOL v6 = a6;
  unsigned int v10 = [(WRM_HandoverManager *)self getIWLANServiceType];
  if (v10 != 1)
  {
    id v11 = [(WCM_WiFiController *)self->mWiFi wifiService];
    id v12 = [(WRM_HandoverManager *)self getiRATConfigController];
    [(WCM_WiFiService *)v11 getTxPer];
    uint64_t v14 = (uint64_t)(v13 * 100.0);
    unsigned int v15 = [(WCM_WiFiService *)v11 isTxPerValid];
    [(WCM_WiFiService *)v11 getTxFail];
    uint64_t v17 = (uint64_t)v16;
    [(WCM_WiFiService *)v11 getRxRatio];
    double v19 = v18 * 100.0;
    [(WCM_WiFiService *)v11 getCumulativeTxPer];
    +[WCM_Logging logLevel:24, @"Actual Tx PER %lld, TX Fail %lld, RX Ratio=%lf, CumTxPER %lld, TX PER valid: %d", v14, v17, *(void *)&v19, (uint64_t)(v20 * 100.0), v15 message];
    if (!v15) {
      goto LABEL_18;
    }
    if (v6)
    {
      if (a4 != 1) {
        goto LABEL_18;
      }
      if (a5)
      {
        if (a5 == 1 && (uint64_t)[v12 minActiveWiFiTxPktLossRateTh1] < v14)
        {
          CFStringRef v21 = @"iRAT detected WiFi bad because of WiFi_Metrics: TX PER THREASHOLD: %lld";
LABEL_13:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v21, [v12 minActiveWiFiTxPktLossRateTh1]);
LABEL_17:
          [(WRM_HandoverManager *)self updateHandoverReasonCode:16];
          LOBYTE(v10) = 0;
          return v10;
        }
        goto LABEL_18;
      }
      id v22 = [v12 minActiveWiFiTxPktLossRateTh0];
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"TX PER THREASHOLD: %lld", [v12 minActiveWiFiTxPktLossRateTh1]);
      if (a5)
      {
        if (a5 == 1 && (uint64_t)[v12 minIdleWiFiTxPktLossRateTh1] < v14)
        {
          CFStringRef v21 = @"iRAT detected WiFi bad because of WiFi_Metrics: TX PER THREASHOLD:%lld";
          goto LABEL_13;
        }
LABEL_18:
        LOBYTE(v10) = 1;
        return v10;
      }
      id v22 = [v12 minIdleWiFiTxPktLossRateTh0];
    }
    if ((uint64_t)v22 < v14) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  return v10;
}

- (BOOL)isWiFiArqQualityIndicatorGoodControlFW:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6
{
  unsigned int v8 = [(WRM_HandoverManager *)self getIWLANServiceType];
  if (v8 != 1)
  {
    double v9 = [(WCM_WiFiController *)self->mWiFi wifiService];
    id v10 = [(WRM_HandoverManager *)self getiRATConfigController];
    [(WCM_WiFiService *)v9 getFwTxPer];
    uint64_t v12 = (uint64_t)(v11 * 100.0);
    unsigned int v13 = [(WCM_WiFiService *)v9 isFwTxPerValid];
    [(WCM_WiFiService *)v9 getCumulativeFwTxPer];
    uint64_t v15 = (uint64_t)(v14 * 100.0);
    unsigned int v16 = [(WCM_WiFiService *)v9 isCumulativeFwTxPerValid];
    +[WCM_Logging logLevel:24, @"Actual FW TxPER %lld, CumFwTxPer %lld, FWTxPER valid: %d ", v12, v15, v13 message];
    if (v13) {
      uint64_t v17 = v12;
    }
    else {
      uint64_t v17 = 0;
    }
    if (v16) {
      uint64_t v18 = v15;
    }
    else {
      uint64_t v18 = 0;
    }
    +[WCM_Logging logLevel:24, @"Effective FW TxPER %lld, CumFwTxPer %lld", v17, v18, v18 message];
    if (v13)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"FW TX PER THREASHOLD: %lld", [v10 minIdleWiFiFwTxPktLossRateTh1]);
      if (a5)
      {
        if (a5 == 1 && (uint64_t)[v10 minIdleWiFiFwTxPktLossRateTh1] < v12)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"iRAT detected WiFi bad because of WiFi_Metrics: FW TX PER THREASHOLD: %lld", [v10 minIdleWiFiFwTxPktLossRateTh1]);
LABEL_14:
          [(WRM_HandoverManager *)self updateHandoverReasonCode:16];
          LOBYTE(v8) = 0;
          return v8;
        }
      }
      else if ((uint64_t)[v10 minIdleWiFiFwTxPktLossRateTh1] < v12)
      {
        goto LABEL_14;
      }
    }
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (int)getIWLANServiceType
{
  return [(WRM_iRATConfig *)self->miRATConfig ctServiceType];
}

- (BOOL)isWiFiArqQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  unsigned int v11 = -[WRM_HandoverManager isWiFiArqQualityIndicatorGoodUserData::::](self, "isWiFiArqQualityIndicatorGoodUserData::::");
  unsigned int v12 = [(WRM_HandoverManager *)self isWiFiArqQualityIndicatorGoodControlFW:a3 :a4 :v7 :v6];
  LOBYTE(v6) = v12;
  +[WCM_Logging logLevel:24, @"isWiFiArqQualityIndicatorGood: %d, isWiFiArqQualityIndicatorGoodControlFW:%d", v11, v12 message];
  return v11 & v6;
}

- (void)updateHandoverReasonCode:(int)a3
{
  self->mReasons |= a3;
}

- (int64_t)getSNRHysteresis
{
  id v3 = [(WRM_HandoverManager *)self getiRATConfigController];
  switch(objc_msgSend(-[WRM_HandoverManager getMotionController](self, "getMotionController"), "getMobilityState"))
  {
    case 0u:
      CFStringRef v4 = @"Device motion: STATIONARY";
      goto LABEL_9;
    case 1u:
      CFStringRef v5 = @"Device motion: WALKING";
      goto LABEL_11;
    case 2u:
      +[WCM_Logging logLevel:24 message:@"Device motion: RUNNING"];
      return (int64_t)[v3 snrHysterisisRunning];
    case 3u:
      CFStringRef v4 = @"Device motion: VEHICULAR";
      goto LABEL_9;
    case 4u:
      CFStringRef v5 = @"Device motion: PEDESTRIAN";
LABEL_11:
      +[WCM_Logging logLevel:24 message:v5];
      int64_t result = (int64_t)[v3 snrHysterisisWalking];
      break;
    default:
      CFStringRef v4 = @"Device motion: UNKNOWN";
LABEL_9:
      +[WCM_Logging logLevel:24 message:v4];
      int64_t result = 0;
      break;
  }
  return result;
}

- (int64_t)getRSSIHysteresis
{
  id v3 = [(WRM_HandoverManager *)self getiRATConfigController];
  switch(objc_msgSend(-[WRM_HandoverManager getMotionController](self, "getMotionController"), "getMobilityState"))
  {
    case 0u:
      CFStringRef v4 = @"Device motion: STATIONARY";
      goto LABEL_9;
    case 1u:
      CFStringRef v5 = @"Device motion: WALKING";
      goto LABEL_11;
    case 2u:
      +[WCM_Logging logLevel:24 message:@"Device  motion: RUNNING"];
      return (int64_t)[v3 rssiHysterisisRunning];
    case 3u:
      CFStringRef v4 = @"Device motion: VEHICULAR";
      goto LABEL_9;
    case 4u:
      CFStringRef v5 = @"Device motion: PEDESTRIAN";
LABEL_11:
      +[WCM_Logging logLevel:24 message:v5];
      int64_t result = (int64_t)[v3 rssiHysterisisWalking];
      break;
    default:
      CFStringRef v4 = @"Device motion: UNKNOWN";
LABEL_9:
      +[WCM_Logging logLevel:24 message:v4];
      int64_t result = 0;
      break;
  }
  return result;
}

- (id)getMotionController
{
  return self->mMotionController;
}

- (id)getCTService
{
  return self->mCTService;
}

- (int)evaluateLink:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6 :(int)a7 :(int)a8
{
  uint64_t v8 = *(void *)&a8;
  mWiFi = self->mWiFi;
  if (!mWiFi)
  {
    CFStringRef v17 = @"Evaluate link: WiFi not initialized.";
LABEL_13:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v17, a5, *(void *)&a6, *(void *)&a7);
    goto LABEL_14;
  }
  uint64_t v12 = *(void *)&a7;
  uint64_t v13 = *(void *)&a6;
  BOOL v14 = a5;
  unsigned int v16 = [(WCM_WiFiController *)mWiFi wifiService];
  if (!v16)
  {
    CFStringRef v17 = @"Evaluate link: WiFi service not initialized.";
    goto LABEL_13;
  }
  if (byte_10027CF2C)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C7EA0;
    block[3] = &unk_10020D980;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
LABEL_14:
    [(WRM_HandoverManager *)self updateHandoverReasonCode:2];
    int v19 = 0;
    goto LABEL_15;
  }
  if (![(WCM_WiFiService *)v16 isWiFiPrimaryInterface])
  {
    byte_10027CD02 = 0;
    CFStringRef v17 = @"Evaluate link: WiFi link not primary yet. ";
    goto LABEL_13;
  }
  if (!byte_10027CD00) {
    [(WRM_HandoverManager *)self toggleSAState:1];
  }
  byte_10027CD02 = 1;
  if (v12)
  {
    +[WCM_Logging logLevel:24 message:@"Evaluate link: Using Non-WIFI_Preferred algorithm. "];
    unsigned int v18 = [(WRM_HandoverManager *)self evaluateLinkNonWiFiPreferred:a3 :a4 :v14 :v13 :v12];
  }
  else
  {
    +[WCM_Logging logLevel:24 message:@"Evaluate link: Using WiFi-Preferred algorithm. "];
    unsigned int v18 = [(WRM_HandoverManager *)self evaluateLinkWiFiPreferred:a3 :a4 :v14 :v13];
  }
  int v19 = v18;
LABEL_15:
  double v20 = "CT_DATA";
  CFStringRef v21 = "CT_VOICE";
  id v22 = "UNKNOWN_APP!!!";
  if (a4 == 2) {
    id v22 = "CT_Th_Call";
  }
  if (a4 != 1) {
    CFStringRef v21 = v22;
  }
  if (a4) {
    double v20 = v21;
  }
  v23 = "WIFI";
  if (!v19) {
    v23 = "CELLULAR";
  }
  +[WCM_Logging logLevel:24, @"{%s}iRAT: Evaluate link preferred:slot:%d: %s", v20, v8, v23 message];
  return v19;
}

- (void)toggleSAState:(BOOL)a3
{
  mQueue = self->mQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001DF04;
  v4[3] = &unk_10020DE10;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(mQueue, v4);
}

- (int)evaluateLinkWiFiPreferred:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6
{
  uint64_t v6 = *(void *)&a6;
  if (!a5)
  {
    if (a4 == 1 && byte_10027CED8)
    {
      [(WRM_HandoverManager *)self updateHandoverReasonCode:256];
      [(WRM_HandoverManager *)self updateHandoverReasonCode:16];
      CFStringRef v11 = @"Evaluate link: Cellular: VoIP quality was not good.";
      goto LABEL_8;
    }
    +[WCM_Logging logLevel:24 message:@"Evaluate link: Call Idle."];
    if (![(WRM_HandoverManager *)self canWiFiMeetIdleApplicationRequirements:a3 :a4 :v6])
    {
      uint64_t v13 = self;
      unint64_t v14 = a3;
      unint64_t v15 = a4;
      uint64_t v16 = 0;
      return ![(WRM_HandoverManager *)v13 canCellularMeetApplicationRequirement:v14 :v15 :v16 :v6 :0];
    }
    return 1;
  }
  id v10 = [(WRM_HandoverManager *)self getCTService];
  if (!v6 && [v10 isSrvccHandoverInProgress])
  {
    CFStringRef v11 = @"evaluateLinkWiFiPreferred:: skip WiFi link evaluation, SRVCC handover is in progress";
LABEL_8:
    +[WCM_Logging logLevel:24 message:v11];
    return 0;
  }
  +[WCM_Logging logLevel:24 message:@"Evaluate link: Call active."];
  if ([(WRM_HandoverManager *)self canWiFiMeetActiveApplicationRequirements:a3 :a4 :v6 :0])
  {
    return 1;
  }
  uint64_t v13 = self;
  unint64_t v14 = a3;
  unint64_t v15 = a4;
  uint64_t v16 = 1;
  return ![(WRM_HandoverManager *)v13 canCellularMeetApplicationRequirement:v14 :v15 :v16 :v6 :0];
}

- (int)evaluateLinkNonWiFiPreferred:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6 :(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  BOOL v9 = a5;
  +[WCM_Logging logLevel:24, @"Using evaluateLinkNonWiFiPreferred: algorithm type: %d", *(void *)&a7 message];
  if ([(WRM_HandoverManager *)self canCellularMeetApplicationRequirement:a3 :a4 :v9 :v8 :v7])
  {
    CFStringRef v13 = @"Cellular can meet application requirements";
LABEL_10:
    +[WCM_Logging logLevel:24 message:v13];
    return 0;
  }
  +[WCM_Logging logLevel:24 message:@"Cellular can not meet application requirements"];
  mWiFi = self->mWiFi;
  if (!mWiFi)
  {
    [(WRM_HandoverManager *)self updateHandoverReasonCode:2];
    CFStringRef v13 = @"Evaluate link: WiFi not initialized.";
    goto LABEL_10;
  }
  unint64_t v15 = [(WCM_WiFiController *)mWiFi wifiService];
  if (!v15)
  {
    [(WRM_HandoverManager *)self updateHandoverReasonCode:2];
    CFStringRef v13 = @"Evaluate link: WiFi service not initialized.";
    goto LABEL_10;
  }
  if ([(WCM_WiFiService *)v15 isWiFiPrimaryInterface])
  {
    byte_10027CD02 = 1;
    +[WCM_Logging logLevel:24 message:@"WiFi link is primary."];
    if (v9) {
      return [(WRM_HandoverManager *)self canWiFiMeetActiveApplicationRequirements:a3 :a4 :v8 :v7];
    }
    else {
      return [(WRM_HandoverManager *)self canWiFiMeetIdleApplicationRequirements:a3 :a4 :v8];
    }
  }
  else
  {
    +[WCM_Logging logLevel:24 message:@"WiFi link is not primary: recommend cellular"];
    [(WRM_HandoverManager *)self updateHandoverReasonCode:2];
    int result = 0;
    byte_10027CD02 = 0;
  }
  return result;
}

- (BOOL)canCellularMeetApplicationRequirement:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6 :(int)a7
{
  if (a4)
  {
    uint64_t v8 = *(void *)&a7;
    uint64_t v9 = *(void *)&a6;
    BOOL v10 = a5;
    unsigned int v11 = [(WRM_HandoverManager *)self getIWLANServiceType];
    if (v11)
    {
      if (v11 != 1)
      {
        if (v11 == 2) {
          [(WRM_HandoverManager *)self canCellularMeetApplicationRequirementsAppTypeThumper:v10 :v9 :v8];
        }
        goto LABEL_7;
      }
    }
    else
    {
      BOOL v12 = [(WRM_HandoverManager *)self canCellularMeetApplicationRequirementsAppTypeWiFiCalling:v10 :v9 :v8];
      if (!v12) {
        return v12;
      }
    }
LABEL_9:
    [(WRM_HandoverManager *)self updateHandoverReasonCode:512];
    LOBYTE(v12) = 1;
    return v12;
  }
  if ([(WRM_HandoverManager *)self canCellularMeetApplicationRequirementsAppTypeData])
  {
    goto LABEL_9;
  }
LABEL_7:
  LOBYTE(v12) = 0;
  return v12;
}

- (BOOL)doesIRATClientSubscriptionContextExist
{
  obj = self->miRATClientContexts;
  objc_sync_enter(obj);
  id v3 = [(NSMutableArray *)self->miRATClientContexts count];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s: iRAT client count:%d.", "-[WRM_HandoverManager doesIRATClientSubscriptionContextExist]", v3);
  if (!v3)
  {
    +[WCM_Logging logLevel:24 message:@" No iRAT client available."];
    goto LABEL_13;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  miRATClientContexts = self->miRATClientContexts;
  id v5 = [(NSMutableArray *)miRATClientContexts countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5)
  {
LABEL_13:
    char v6 = 0;
    goto LABEL_14;
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
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s: iRAT client Context count:%d.", "-[WRM_HandoverManager doesIRATClientSubscriptionContextExist]", [v9 count]);
      if ([v9 count])
      {
        +[WCM_Logging logLevel:24 message:@"doesIRATClientSubscriptionContextExist: Subscription Context found"];
        char v6 = 1;
      }
    }
    id v5 = [(NSMutableArray *)miRATClientContexts countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v5);
LABEL_14:
  objc_sync_exit(obj);
  return v6 & 1;
}

- (void)evaluateHandover
{
  id v52 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getCTService];
  id v3 = [(NSMutableArray *)self->miRATClientContexts count];
  if (!v3)
  {
    CFStringRef v4 = @"Evaluate Handover: No iRAT client available.";
    goto LABEL_5;
  }
  +[WCM_Logging logLevel:24, @"Evaluate Handover: Total number of iRAT clients %zu.", v3 message];
  if (!byte_10027CEC1)
  {
    id v58 = [(WRM_HandoverManager *)self getiRATConfigController];
    unsigned int v57 = [[-[WRM_HandoverManager getMotionController](self) getMobilityState];
    id v5 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"mActive" ascending:0];
    miRATClientContexts = self->miRATClientContexts;
    v51 = v5;
    id v77 = v5;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id obj = [(NSMutableArray *)miRATClientContexts sortedArrayUsingDescriptors:+[NSArray arrayWithObjects:&v77 count:1]];
    id v55 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
    if (!v55) {
      goto LABEL_133;
    }
    uint64_t v54 = *(void *)v72;
    v63 = self;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v72 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v71 + 1) + 8 * v7);
        if ([(WRM_HandoverManager *)self isEnhancedCTServiceNeeded])
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"Evaluate Handover: device, slot id: %d", [v8 getActiveSlot]);
          [v52 setActiveSlot:[v8 getActiveSlot]];
        }
        id v9 = [v8 getMyClientType];
        BOOL v10 = "ClientCommCenter";
        if (v9 != 1)
        {
          if ((v9 - 2) >= 0x14)
          {
            BOOL v10 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
            if (v9 == 22) {
              BOOL v10 = "ClientCoreMediaStreaming";
            }
          }
          else
          {
            BOOL v10 = (&off_100211010)[(int)v9 - 2];
          }
        }
        uint64_t v56 = v7;
        +[WCM_Logging logLevel:24, @"<%s>Evaluate Handover: BEGIN.", v10 message];
        id v59 = [v8 getHandoverContexts];
        id v60 = [v8 getHandoverAlgorithmType:1];
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v62 = [v59 countByEnumeratingWithState:&v67 objects:v75 count:16];
        if (v62)
        {
          uint64_t v61 = *(void *)v68;
          unsigned int v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
          if (v9 == 22) {
            unsigned int v11 = "ClientCoreMediaStreaming";
          }
          v64 = v11;
          id v65 = v9;
          uint64_t v66 = (int)v9 - 2;
          do
          {
            long long v12 = 0;
            do
            {
              long long v13 = v8;
              if (*(void *)v68 != v61) {
                objc_enumerationMutation(v59);
              }
              id v9 = *(id *)(*((void *)&v67 + 1) + 8 * (void)v12);
              id v14 = [v9 getBandwidth];
              id v15 = [v9 getApplicationType];
              id v16 = [v9 getCallState];
              id v17 = [v9 getConnectedLinkType];
              if (v65 == 1) {
                unsigned int v18 = "ClientCommCenter";
              }
              else {
                unsigned int v18 = v64;
              }
              if (v65 != 1 && v66 <= 0x13) {
                unsigned int v18 = (&off_100211010)[v66];
              }
              if (v15)
              {
                int v19 = "CT_VOICE";
                if (v15 != (id)1)
                {
                  if (v15 == (id)2) {
                    int v19 = "CT_Th_Call";
                  }
                  else {
                    int v19 = "UNKNOWN_APP!!!";
                  }
                }
              }
              else
              {
                int v19 = "CT_DATA";
              }
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"<%s>{%s}Slot: %d Evaluate Handover: BEGIN.", v18, v19, [v13 getActiveSlot]);
              if (v17) {
                BOOL v20 = 1;
              }
              else {
                BOOL v20 = byte_10027CD02 == 0;
              }
              char v21 = v20;
              id v22 = v63;
              if (!v20 && ((v16 ^ 1) & 1) == 0 && byte_10027CED9)
              {
LABEL_48:
                if (v15)
                {
                  v23 = "CT_VOICE";
                  if (v15 != (id)1)
                  {
                    v23 = "UNKNOWN_APP!!!";
                    if (v15 == (id)2) {
                      v23 = "CT_Th_Call";
                    }
                  }
                }
                else
                {
                  v23 = "CT_DATA";
                }
                +[WCM_Logging logLevel:24, @"{%s}Skipping link evaluation for client connected on cellular link", v23 message];
                [v9 setLinkPreferenceNotificationRequired:0];
                uint64_t v8 = v13;
                LODWORD(v9) = v65;
                goto LABEL_102;
              }
              if (v21) {
                goto LABEL_54;
              }
              if ([(WRM_HandoverManager *)v63 canCellularMeetApplicationRequirement:v14 :v15 :v16 :0 :v60])
              {
                +[WCM_Logging logLevel:24, @"canCellularMeetApplicationRequirement ok, appType: %d, callActive: %d, alg: %d", v15, v16, v60 message];
              }
              else if ([(WRM_HandoverManager *)v63 isWiFiLinkEvaluationDesired])
              {
                +[WCM_Logging logLevel:24, @"Continue to evaluate WiFi link: Cellular link bad, appType: %d, callActive: %d, alg: %d", v15, v16, v60 message];
                goto LABEL_55;
              }
              +[WCM_Logging logLevel:24, @"evaluate_handover: connectedLinkType == WRM_CELLULAR, appType: %d, call active: %d", v15, v16 message];
              if (v57 != 5 && v57)
              {
                [v9 getDeltaTimeSinceLastCellularRecommendation];
                double v43 = v42;
                if (v16)
                {
                  double v44 = v42 * 1000.0;
                  +[WCM_Logging logLevel:24, @"active: getDeltaTimeSinceLastCellularRecommendation: delta time:%lf", v42 * 1000.0 message];
                  if (v44 < (double)(uint64_t)[v58 cellularStickinessThreaholdIdle]) {
                    goto LABEL_48;
                  }
                  CFStringRef v35 = @"WiFi link evaluation criteria met: Motion state not stationary, active";
                  goto LABEL_121;
                }
                id v45 = [v9 getPingPongAvoidanceTimerMultiplier];
                unint64_t v46 = (void)[v58 cellularStickinessThreaholdIdle] * (void)v45;
                id v22 = v63;
                double v47 = v43 * 1000.0;
                +[WCM_Logging logLevel:24, @"idle: getDeltaTimeSinceLastCellularRecommendation: delta time:%lf, effectiveBlockout time:%lld ", *(void *)&v47, v46 message];
                if (v47 < (double)v46) {
                  goto LABEL_48;
                }
                CFStringRef v41 = @"WiFi link evaluation criteria met: Motion state not stationary, idle";
              }
              else
              {
                [v9 getDeltaTimeSinceLastCellularRecommendation];
                double v34 = v33 * 1000.0;
                if (v16)
                {
                  +[WCM_Logging logLevel:24, @"state: active, getDeltaTimeSinceLastCellularRecommendation: delta time:%lf", v33 * 1000.0 message];
                  if (v34 < (double)(uint64_t)[v58 cellularStickinessThreaholdStationaryActive]) {
                    goto LABEL_48;
                  }
                  CFStringRef v35 = @"WiFi link evaluation criteria met: CellularStickinessThreaholdStationaryActive";
LABEL_121:
                  +[WCM_Logging logLevel:24 message:v35];
LABEL_54:
                  [v9 updatePrevTimeStamp];
                  goto LABEL_55;
                }
                id v39 = [v9 getPingPongAvoidanceTimerMultiplier];
                unint64_t v40 = (void)[v58 cellularStickinessThreaholdStationary] * (void)v39;
                id v22 = v63;
                +[WCM_Logging logLevel:24, @"state: idle, getDeltaTimeSinceLastCellularRecommendation: delta time:%lf, effective blockout:%lld", *(void *)&v34, v40 message];
                if (v34 < (double)v40) {
                  goto LABEL_48;
                }
                CFStringRef v41 = @"WiFi link evaluation criteria met: CellularStickinessThreaholdStationary";
              }
              +[WCM_Logging logLevel:24 message:v41];
              [v9 updatePrevTimeStamp];
              [v9 setPingPongAvoidanceTimerMultiplier:1];
LABEL_55:
              [(WRM_HandoverManager *)v22 initHandoverReasonCode];
              if (v15)
              {
                v24 = "CT_VOICE";
                id v25 = v60;
                if (v15 != (id)1)
                {
                  v24 = "UNKNOWN_APP!!!";
                  if (v15 == (id)2) {
                    v24 = "CT_Th_Call";
                  }
                }
              }
              else
              {
                v24 = "CT_DATA";
                id v25 = v60;
              }
              +[WCM_Logging logLevel:24, @"{%s}invoking evaluate link", v24 message];
              unsigned int v26 = -[WRM_HandoverManager evaluateLink::::::](v22, "evaluateLink::::::", v14, v15, v16, v17, v25, [v13 getActiveSlot]);
              BOOL v27 = v26 == 1;
              if ([v9 getConnectedLinkType] == v27)
              {
                [v9 setLinkPreferenceNotificationRequired:0];
                if (v15)
                {
                  v28 = "CT_VOICE";
                  uint64_t v8 = v13;
                  id v9 = v65;
                  if (v15 != (id)1)
                  {
                    v28 = "UNKNOWN_APP!!!";
                    if (v15 == (id)2) {
                      v28 = "CT_Th_Call";
                    }
                  }
                }
                else
                {
                  v28 = "CT_DATA";
                  uint64_t v8 = v13;
                  id v9 = v65;
                }
                +[WCM_Logging logLevel:24, @"{%s}Link preference did not change for application type =%lld for client =%d current link type =%d ", v28, v15, v9, v27 message];
                goto LABEL_102;
              }
              id v29 = [[-[WRM_HandoverManager getMotionController](v22, "getMotionController") getMobilityState];
              if (v17) {
                BOOL v30 = 0;
              }
              else {
                BOOL v30 = v26 == 1;
              }
              v31 = v22;
              uint64_t v32 = v30;
              if (v30)
              {
                [(WRM_MetricsService *)v31->mMetrics updateiRATMetricCellToWifi:v16 :v15 :v29 :v31->mReasons];
LABEL_90:
                if (byte_10027CF26 && v15 == (id)1) {
                  [(WRM_HandoverManager *)v63 showHOAlertUI:v32];
                }
                goto LABEL_93;
              }
              if (v17 == 1 && v26 != 1)
              {
                [(WRM_MetricsService *)v63->mMetrics updateiRATMetricWifiToCell:v16 :v15 :v29 :v63->mReasons];
                goto LABEL_90;
              }
LABEL_93:
              [v9 setLinkPreferenceNotificationRequired:1];
              [v9 setConnectedLinkType:v27];
              [v9 setHandoverReasonType:v63->mReasons];
              if (v15)
              {
                v36 = "CT_VOICE";
                uint64_t v8 = v13;
                id v9 = v65;
                if (v15 != (id)1)
                {
                  v36 = "UNKNOWN_APP!!!";
                  if (v15 == (id)2) {
                    v36 = "CT_Th_Call";
                  }
                }
              }
              else
              {
                v36 = "CT_DATA";
                uint64_t v8 = v13;
                id v9 = v65;
              }
              +[WCM_Logging logLevel:24, @"{%s}Link preference changed for application type =%lld for client =%d", v36, v15, v9, v50 message];
LABEL_102:
              if (v9 == 1) {
                v37 = "ClientCommCenter";
              }
              else {
                v37 = v64;
              }
              if (v9 != 1 && v66 <= 0x13) {
                v37 = (&off_100211010)[v66];
              }
              if (v15)
              {
                v38 = "CT_VOICE";
                if (v15 != (id)1)
                {
                  if (v15 == (id)2) {
                    v38 = "CT_Th_Call";
                  }
                  else {
                    v38 = "UNKNOWN_APP!!!";
                  }
                }
              }
              else
              {
                v38 = "CT_DATA";
              }
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"<%s>{%s}Slot:%d Evaluate Handover: END.", v37, v38, [v8 getActiveSlot]);
              long long v12 = (char *)v12 + 1;
            }
            while (v62 != v12);
            id v48 = [v59 countByEnumeratingWithState:&v67 objects:v75 count:16];
            id v62 = v48;
          }
          while (v48);
        }
        [v8 handleLinkPreferenceNotification:0];
        v49 = "ClientCommCenter";
        self = v63;
        if (v9 != 1)
        {
          if ((v9 - 2) >= 0x14)
          {
            v49 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
            if (v9 == 22) {
              v49 = "ClientCoreMediaStreaming";
            }
          }
          else
          {
            v49 = (&off_100211010)[(int)v9 - 2];
          }
        }
        +[WCM_Logging logLevel:24, @"<%s>Evaluate Handover: END.", v49 message];
        uint64_t v7 = v56 + 1;
      }
      while ((id)(v56 + 1) != v55);
      id v55 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
      if (!v55)
      {
LABEL_133:

        return;
      }
    }
  }
  CFStringRef v4 = @"Do not evaluate link yet, did not receive LQM event from WiFi Manager yet";
LABEL_5:

  +[WCM_Logging logLevel:24 message:v4];
}

- (BOOL)isEnhancedCTServiceNeeded
{
  return 1;
}

- (void)initHandoverReasonCode
{
  self->mReasons = 0;
}

- (void)monitorNetworkSymptoms:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(WRM_iRATConfig *)self->miRATConfig symtompsMetricsEnabled]
    && [(WRM_SymptomsService *)self->mSymtomsService updateAllNetworkSymptoms:v3])
  {
    unsigned int v5 = [(WRM_SymptomsService *)self->mSymtomsService getNetworkScore:v3];
    char v6 = "WRM_NETWORK_TYPE_INVALID!!!";
    if (v3 == 1) {
      char v6 = "CELLULAR";
    }
    if (!v3) {
      char v6 = "WIFI";
    }
    if (v5 + 1 >= 5)
    {
      if (v5 == -2) {
        uint64_t v7 = "WRM_NETWORK_SCORE_ERROR         ";
      }
      else {
        uint64_t v7 = "WRM_NETWORK_SCORE_INVALID_VALUE!!!";
      }
    }
    else
    {
      uint64_t v7 = off_10020E748[v5 + 1];
    }
    +[WCM_Logging logLevel:24, @"iRAT: check symtoms service done. %s score %s ", v6, v7 message];
  }
}

- (void)updateAppState:(int)a3 Category:(id)a4 sessionType:(int)a5
{
  dword_10027CE48 = a5;
  byte_10027CE5B = ((a3 - 4) & 0xFFFFFFFB) == 0;
  [(WRM_HandoverManager *)self triggerBWEval];
  [(WRM_HandoverManager *)self evaluateWiFiVersusCell];
  +[WCM_Logging logLevel:24, @"updateAppState: active: %d, category: %@", byte_10027CE5B, a4 message];
}

- (void)triggerBWEval
{
  uint64_t v4 = 0;
  if (byte_10027CE5B
    && [(WRM_HandoverManager *)self highThroughputRequired:dword_10027CE48])
  {
    qword_10027CE50 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton];
    unsigned int v2 = [(id)qword_10027CE50 getPredictedWiFiBandwidth:&v4];
    if (v2)
    {
      uint64_t v3 = v4;
      qword_10027CE40 = v4;
    }
    else
    {
      uint64_t v3 = qword_10027CE40;
    }
    +[WCM_Logging logLevel:24, @"triggerBWEval: predicted BW: %f, status: %d", v3, v2 != 0 message];
  }
}

- (BOOL)highThroughputRequired:(int)a3
{
  return a3 == 1 || a3 == 4;
}

- (BOOL)evaluateCellularLinkForWiFiCallingIMSPreferredPolicy:(int)a3 :(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = [[-[WRM_HandoverManager getCTService](self) getCTService] isVoLTESupported];
  if (v4)
  {
    return [(WRM_HandoverManager *)self canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallActive:v5];
  }
  else
  {
    unsigned int v8 = v7;
    BOOL v9 = [(WRM_HandoverManager *)self can4G5GMeetApplicationRequirementsAppTypeWiFiCallingCallIdle:v5] & v7;
    +[WCM_Logging logLevel:24, @"evaluateCellularLinkForWiFiCallingIMSPreferredPolicy:CellualrEval Status:%d, VoLTE enabled:%d", v9, v8 message];
    return v9;
  }
}

- (void)updateControllerState:(id)a3
{
  mQueue = self->mQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100024680;
  v4[3] = &unk_10020DAB0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(mQueue, v4);
}

- (void)updateCellularMetricsMovAverage
{
  id v2 = [(WRM_HandoverManager *)self getCTService];
  if (v2)
  {
    [v2 updateMovAverageOfSignalBar];
  }
}

- (void)setWiFiLinkDown:(BOOL)a3
{
  byte_10027CF2C = a3;
}

- (BOOL)needWiFiLQM
{
  BOOL v2 = [(WRM_HandoverManager *)self doesIRATClientSubscriptionContextExist];
  uint64_t v3 = "NO";
  if (v2) {
    uint64_t v3 = "YES";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s: needWiFiLQM? %s ", "-[WRM_HandoverManager needWiFiLQM]", v3);
  return v2;
}

- (void)monitorTransportMetrics
{
}

- (BOOL)isRecentDevice
{
  unsigned int v2 = [[[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager] wrmPlatformId];
  int32x4_t v3 = vdupq_n_s32(v2);
  return vmaxvq_u8((uint8x16_t)vorrq_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001EB010), (int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001EB000)), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001EAFF0), (int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001EAFE0))), vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001EB050), (int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001EB040)), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001EB030), (int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001EB020))))) & 1 | (v2 == 170) | (v2 - 13 < 2);
}

- (BOOL)isActiveHandoverSupported
{
  return byte_10027CF24;
}

- (id)getSCService
{
  return self->mSCService;
}

- (void)initWiFiCellDataEval
{
  qword_10027CE70 = [(WRM_MetricsService *)self->mMetrics getWRM5GVersusWiFiLinkPreferenceMetrics];
  *(unsigned char *)(qword_10027CE70 + 148) = 0;
  byte_10027CE5B = 0;
  notify_register_check("com.apple.WRM.iRAT_event.linkRecommendation", &dword_10027CE68);
  [(WRM_HandoverManager *)self registerSFRestartNotification];
  [(WRM_HandoverManager *)self registerSFOutrankDecisionNotification];
  [(WRM_HandoverManager *)self registerThermalTimeToThrottleNotification];

  [(WRM_HandoverManager *)self registerThermalNotificationReasonToThrottle];
}

- (void)forceActiveModeEval:(BOOL)a3
{
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FF80;
  block[3] = &unk_10020DAD0;
  BOOL v5 = a3;
  dispatch_async(mQueue, block);
}

- (void)triggerHarvestDataEval
{
  id v2 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
  [v2 triggerHarvestedCellEval];

  [v2 triggerLocationUpdate];
}

- (BOOL)isWiFiAppEntryCriteriaMet
{
  double v4 = 0.0;
  if (byte_10027CE5B
    && (qword_10027CE50 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), [(id)qword_10027CE50 getPredictedWiFiBandwidth:&v4]))
  {
    qword_10027CE40 = *(void *)&v4;
    BOOL v2 = v4 > 10.0;
  }
  else
  {
    BOOL v2 = 1;
  }
  +[WCM_Logging logLevel:24, @"isWiFiAppEntryCriteriaMet: BW:%f, eval status: %d, appActive:%d", qword_10027CE40, v2, byte_10027CE5B message];
  return v2;
}

- (BOOL)isWiFiAppExitCriteriaMet
{
  return 0;
}

- (BOOL)isAppQualityGoodOnWiFi:(int)a3
{
  id v5 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton];
  qword_10027CE50 = (uint64_t)v5;
  if (dword_10027CE48 != 1)
  {
    if (a3 == 1) {
      return 1;
    }
LABEL_5:
    [(WRM_HandoverManager *)self isWiFiAppEntryCriteriaMet];
    return 1;
  }
  if (a3 != 1) {
    goto LABEL_5;
  }
  [v5 isWiFiStreamingExitCriteriaMet];
  return 1;
}

- (BOOL)isCellularThroughputGood
{
  return 1;
}

- (void)handleAVGStreamingThroughput:(float)a3
{
}

- (void)notifyRecommendations
{
  uint64_t v3 = dword_10027CA60;
  uint64_t v4 = byte_10027CE38;
  uint64_t v5 = byte_10027CE39;
  uint64_t v6 = byte_10027CE3A;
  uint64_t v7 = byte_10027CE3B;
  uint64_t v8 = byte_10027CE3D & 1;
  unint64_t v9 = ((unint64_t)byte_10027CE3C << 40) & 0xFFFEFFFFFFFFFFFFLL | (v8 << 48) | ((unint64_t)byte_10027CE3B << 32) | ((unint64_t)byte_10027CE3A << 24) | ((unint64_t)byte_10027CE39 << 16) | ((unint64_t)byte_10027CE38 << 8) | dword_10027CA60;
  +[WCM_Logging logLevel:24, @"notifyRecommendations updated: m5GAvailable: %d", byte_10027CE3C message];
  +[WCM_Logging logLevel:24, @"notifyRecommendations updated: mUsingPrivateNetwork: %d", v8 message];
  +[WCM_Logging logLevel:24, @"notifyRecommendations updated: preferred link: %d, wifiscore: %d, wifi conf: %d, cell score: %d, cell conf:%d, Private network Enabled:%d, preference:%d", v3, v4, v5, v6, v7, v8, v9 message];
  [(WRM_HandoverManager *)self postLinkPreference:v9];
  byte_10027CE59 = 0;
}

- (void)postLinkPreference:(unint64_t)a3
{
  notify_set_state(dword_10027CE68, a3);
  +[WCM_Logging logLevel:24, @"preference: notifyRecommendations: %d", a3 message];

  notify_post("com.apple.WRM.iRAT_event.linkRecommendation");
}

- (void)registerSFOutrankDecisionNotification
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100050364;
  handler[3] = &unk_10020DFA8;
  handler[4] = self;
  if (notify_register_dispatch("com.apple.symptoms.celloutrankrecommendation", &dword_10027CE5C, (dispatch_queue_t)&_dispatch_main_q, handler))
  {
    CFStringRef v2 = @"registerSFOutrankDecisionNotification returned error";
  }
  else
  {
    CFStringRef v2 = @"registerSFOutrankDecisionNotification did not return error";
  }
  +[WCM_Logging logLevel:24 message:v2];
}

- (void)registerSFRestartNotification
{
  int out_token = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10005059C;
  v2[3] = &unk_10020DFA8;
  v2[4] = self;
  if (notify_register_dispatch("com.apple.symptoms.managed_events.startup", &out_token, (dispatch_queue_t)&_dispatch_main_q, v2))
  {
    +[WCM_Logging logLevel:24 message:@"registerSFRestartNotification returned error"];
  }
}

- (void)registerThermalTimeToThrottleNotification
{
  +[WCM_Logging logLevel:24 message:@"registerThermalTimeToThrottleNotification: start"];
  if (notify_register_dispatch("com.apple.thermal.timeToMitigate", &dword_10027CE64, (dispatch_queue_t)&_dispatch_main_q, &stru_10020E310))
  {
    +[WCM_Logging logLevel:24 message:@"registerThermalTimeToThrottleNotification returned error"];
  }
  else
  {
    +[WCM_Logging logLevel:24, @"registerThermalTimeToThrottleNotification returned: %d", 0 message];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100050768, @"com.apple.thermal.timeToMitigate", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)registerThermalNotificationReasonToThrottle
{
  +[WCM_Logging logLevel:24 message:@"registerThermalNotificationReasonToThrottle: start"];
  if (notify_register_dispatch("com.apple.thermal.mitigationReasonCode", &dword_10027CE60, (dispatch_queue_t)&_dispatch_main_q, &stru_10020E330))
  {
    +[WCM_Logging logLevel:24 message:@"registerThermalNotificationReasonToThrottle returned error"];
  }
  else
  {
    +[WCM_Logging logLevel:24 message:@"registerThermalNotificationReasonToThrottle did not return error"];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100050934, @"com.apple.thermal.mitigationReasonCode", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)handleDataPlanUpdate:(id)a3
{
}

- (void)submitWiFiVersusCellAWDMetrics
{
  uint64_t v3 = [(WCM_WiFiController *)self->mWiFi wifiService];
  id v4 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getSCService];
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedCTServiceNeeded"))
  {
    id v5 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
    unsigned int v6 = [v5 getCTDataIndictor];
    unsigned __int8 v7 = [v5 getFR2Status];
    *(unsigned char *)(qword_10027CE70 + 149) = v7;
    unsigned int v8 = [v5 getLocationDBFR1Count];
    *(_DWORD *)(qword_10027CE70 + 152) = v8;
    unsigned int v9 = [v5 getLocationDBFR2Count];
    uint64_t v10 = qword_10027CE70;
    *(_DWORD *)(qword_10027CE70 + 156) = v9;
    *(_DWORD *)(v10 + 184) = byte_10027CE3B;
    unsigned int v11 = [v5 getRadioCoverage];
    *(_DWORD *)(qword_10027CE70 + 188) = v11;
    unsigned int v12 = [v5 getRadioFrequency];
    uint64_t v13 = qword_10027CE70;
    *(_DWORD *)(qword_10027CE70 + 164) = *(double *)&qword_10027CE40;
    int v14 = byte_10027CE39;
    *(_DWORD *)(v13 + 172) = byte_10027CE38;
    *(_DWORD *)(v13 + 176) = v14;
    *(_DWORD *)(v13 + 180) = byte_10027CE3A;
    int v15 = dword_10027CE48;
    int v16 = byte_10027CE6C;
    *(_DWORD *)(v13 + 192) = v12;
    *(_DWORD *)(v13 + 196) = v16;
    *(_DWORD *)(v13 + 200) = v15;
    *(unsigned char *)(v13 + 160) = byte_10027CE5A;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"evaluateWiFiVersusCell: send metric: locationDBFR1Count %d", *(unsigned int *)(v13 + 152), [v5 getLocationDBFR1Count]);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"evaluateWiFiVersusCell: send metric: locationDBFR2Count %d", *(unsigned int *)(qword_10027CE70 + 156), [v5 getLocationDBFR2Count]);
  }
  else
  {
    id v5 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getCTService];
    unsigned int v6 = 0;
  }
  *(_DWORD *)(qword_10027CE70 + 88) = dword_10027CA60;
  unsigned int v17 = [v4 getCellularDataLQM];
  *(_DWORD *)(qword_10027CE70 + 8) = v17;
  [v5 getMeasureBWDataSlot];
  *(void *)(qword_10027CE70 + 12) = v18;
  unsigned int v19 = [v5 getDataSlotLoad];
  uint64_t v20 = qword_10027CE70;
  *(_DWORD *)(qword_10027CE70 + 20) = v19;
  *(_DWORD *)(v20 + 24) = 0;
  *(void *)(v20 + 40) = 0;
  *(_DWORD *)(v20 + 48) = 0;
  unsigned int v21 = [v5 getRRCState];
  uint64_t v22 = qword_10027CE70;
  *(_DWORD *)(qword_10027CE70 + 80) = v21;
  *(_DWORD *)(v22 + 84) = 0;
  if ([v5 getServingCellType] == 9)
  {
    *(void *)(qword_10027CE70 + 72) = @"N_RADIO";
    [v5 getNrRSRP];
    *(_DWORD *)(qword_10027CE70 + 56) = (uint64_t)v23;
    [v5 getNrRSRQ];
    *(_DWORD *)(qword_10027CE70 + 60) = (uint64_t)v24;
    [v5 getNrSNR];
    *(_DWORD *)(qword_10027CE70 + 64) = (uint64_t)v25;
    unsigned int v26 = [v5 isDeviceUsingFR2Radio];
    uint64_t v27 = qword_10027CE70;
    if (v26)
    {
LABEL_11:
      *(_DWORD *)(v27 + 52) = 1;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if ([v5 getServingCellType] == 1)
  {
    *(void *)(qword_10027CE70 + 72) = @"LTE_RADIO";
    [v5 getServingCellRSRP];
    *(_DWORD *)(qword_10027CE70 + 28) = (uint64_t)v28;
    [v5 getServingCellRSRQ];
    *(_DWORD *)(qword_10027CE70 + 32) = (uint64_t)v29;
    [v5 getServingCellSNR];
    *(_DWORD *)(qword_10027CE70 + 36) = (uint64_t)v30;
    if (v6 - 16 >= 4 && v6 != 8) {
      goto LABEL_14;
    }
    [v5 getNrRSRP];
    *(_DWORD *)(qword_10027CE70 + 56) = (uint64_t)v31;
    [v5 getNrRSRQ];
    *(_DWORD *)(qword_10027CE70 + 60) = (uint64_t)v32;
    [v5 getNrSNR];
    uint64_t v27 = qword_10027CE70;
    *(_DWORD *)(qword_10027CE70 + 64) = (uint64_t)v33;
    *(_DWORD *)(v27 + 68) = 1;
    if ((v6 & 0xFFFFFFFE) == 0x10) {
      goto LABEL_11;
    }
LABEL_12:
    *(_DWORD *)(v27 + 52) = 0;
    goto LABEL_14;
  }
  *(void *)(qword_10027CE70 + 72) = @"UNKNOWN_RADIO";
LABEL_14:
  if ([(WCM_WiFiService *)v3 isWiFiPrimaryInterface])
  {
    unsigned int v34 = [(WCM_WiFiService *)v3 getPointOfInterest];
    *(_DWORD *)(qword_10027CE70 + 92) = v34;
    unsigned int v35 = [(WCM_WiFiService *)v3 getCCA];
    *(_DWORD *)(qword_10027CE70 + 96) = v35;
    unsigned int v36 = [(WCM_WiFiService *)v3 getChannelUtlization];
    *(_DWORD *)(qword_10027CE70 + 104) = v36;
    unsigned int v37 = [(WCM_WiFiService *)v3 getRSSI];
    *(_DWORD *)(qword_10027CE70 + 108) = v37;
    [(WCM_WiFiService *)v3 getRxPhyRate];
    *(_DWORD *)(qword_10027CE70 + 112) = (int)v38;
    unsigned int v39 = [(WCM_WiFiService *)v3 getSNR];
    *(_DWORD *)(qword_10027CE70 + 116) = v39;
    unsigned int v40 = [(WCM_WiFiService *)v3 getConnectedStationCount];
    *(_DWORD *)(qword_10027CE70 + 120) = v40;
    [(WCM_WiFiService *)v3 getTxPer];
    *(_DWORD *)(qword_10027CE70 + 124) = (v41 * 100.0);
    unsigned int v42 = [(WCM_WiFiService *)v3 getWghtAverageRXPhyRate];
    *(_DWORD *)(qword_10027CE70 + 128) = v42;
    unsigned int v43 = [(WCM_WiFiService *)v3 getWghtAverageSNR];
    *(_DWORD *)(qword_10027CE70 + 132) = v43;
    unsigned int v44 = [(WCM_WiFiService *)v3 getWghtAverageTXPhyRate];
    *(_DWORD *)(qword_10027CE70 + 136) = v44;
    unsigned int v45 = [(WCM_WiFiService *)v3 getWghtAverageRSSI];
    uint64_t v46 = qword_10027CE70;
    *(_DWORD *)(qword_10027CE70 + 100) = 0;
    *(void *)(v46 + 140) = v45;
  }
  else
  {
    uint64_t v47 = qword_10027CE70;
    *(_OWORD *)(qword_10027CE70 + 92) = 0u;
    *(_OWORD *)(v47 + 108) = 0u;
    *(_OWORD *)(v47 + 124) = 0u;
    *(void *)(v47 + 140) = 0;
  }
  [self->mMetrics getAWDService] submitMeric5GVersusWiFiLinkMetrics];

  +[WCM_Logging logLevel:24 message:@"evaluateWiFiVersusCell: submitAWDMetrics"];
}

- (void)evalExitForceOutranking
{
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050EAC;
  block[3] = &unk_10020D980;
  void block[4] = self;
  dispatch_async(mQueue, block);
}

- (void)evalFR2CoverageLikely:(BOOL)a3
{
  if (byte_10027CE3C != a3)
  {
    byte_10027CE3C = a3;
    [(WRM_HandoverManager *)self notifyRecommendations];
  }
}

- (BOOL)canCellularMeetApplicationRequirementsAppTypeThumper:(BOOL)a3 :(int)a4 :(int)a5
{
  id v7 = [(WRM_HandoverManager *)self getCTService];
  unsigned int v8 = [v7 cellularDataEnabled];
  unsigned int v9 = [v7 dataAttachedWithCellularNetwork];
  unsigned int v10 = [v7 getServingCellType];
  if ((a4 - 1) > 1)
  {
    if (![(WRM_HandoverManager *)self isCellularExitCriteriaMetForIMSThumpCallCurrentLinkCellular]&& ((v9 ^ 1) & 1) == 0&& ((v8 ^ 1) & 1) == 0)
    {
      CFStringRef v11 = @"isCellularExitCriteriaMetForIMSThCallCurrentLinkCellular false";
      goto LABEL_8;
    }
    CFStringRef v13 = @"isCellularExitCriteriaMetForIMSThCallCurrentLinkCellular true";
LABEL_11:
    +[WCM_Logging logLevel:24 message:v13];
    BOOL v12 = 0;
    goto LABEL_12;
  }
  if (([(WRM_HandoverManager *)self isCellularEntryCriteriaMetForIMSThumpCallCurrentLinkWiFi] & v9 & v8) != 1)
  {
    CFStringRef v13 = @"isCellularEntryCriteriaMetForIMSThCallCurrentLinkWiFi false";
    goto LABEL_11;
  }
  CFStringRef v11 = @"isCellularEntryCriteriaMetForIMSThVoIPCallCurrentLinkWiFi true";
LABEL_8:
  +[WCM_Logging logLevel:24 message:v11];
  BOOL v12 = 1;
LABEL_12:
  unsigned int v14 = v10 - 1;
  if (v10 - 1 < 0xA && ((0x2FFu >> v14) & 1) != 0)
  {
    int v15 = off_10020E620[v14];
  }
  else
  {
    int v15 = "UNKNOWN_RADIO!!!";
    if (v10 == 9) {
      int v15 = "N_RADIO";
    }
  }
  +[WCM_Logging logLevel:24, @"Cell Link Eval Status: %d, Attach Status: %d Serving Cell Type: %s, Cellular Data Enabled: %d", v12, self->deviceAttachedWithCellularNetwork, v15, v8 message];
  if ((v9 & v8 & 1) == 0)
  {
    +[WCM_Logging logLevel:24 message:@"canCellularMeetApplicationRequirementsAppTypeThumper false because cellular not ready"];
    [(WRM_HandoverManager *)self updateHandoverReasonCode:0x20000];
  }
  return v12;
}

- (BOOL)isCellularEntryCriteriaMetForIMSThumpCallCurrentLinkWiFi
{
  id v3 = [(WRM_HandoverManager *)self getSCService];
  id v4 = [(WRM_HandoverManager *)self getCTService];
  unsigned int v5 = [v4 getServingCellType];
  unsigned int v6 = (char *)[v4 getCurrentSignalBars];
  id v7 = [(WRM_HandoverManager *)self getiRATConfigController];
  id v8 = [v3 getCellularDataLQM];
  +[WCM_Logging logLevel:24, @"isCellularEntryCriteriaMetForIMSThCallCurrentLinkWiFi,LQM: %d, Signal Bars: %d", v8, v6 message];
  switch(v5)
  {
    case 2u:
      CFStringRef v13 = (char *)[v7 minSigBarTh2];
      if ((int)v8 > 49 || (uint64_t)v6 >= (uint64_t)(v13 - 1))
      {
        +[WCM_Logging logLevel:24, @"UMTS entry conditions are met bars:%ld", v6 message];
        return 1;
      }
      else
      {
        +[WCM_Logging logLevel:24, @"UMTS entry conditions are not met bars:%ld", v6 message];
        return 0;
      }
    case 3u:
    case 8u:
      if (byte_10027CEDA)
      {
        BOOL v12 = (char *)[v7 minSigBarTh2];
        if ((int)v8 > 49 || (uint64_t)v6 >= (uint64_t)(v12 - 1))
        {
          byte_10027CEDA = 0;
          BOOL v11 = 1;
LABEL_17:
          [(WRM_HandoverManager *)self updateHandoverReasonCode:0x400000];
          +[WCM_Logging logLevel:24, @"Thumper not supported on 2G radio:%ld", v6 message];
          return v11;
        }
      }
      else
      {
        +[WCM_Logging logLevel:24, @"Thumper not supported on 2G radio:%ld", v6 message];
      }
      BOOL v11 = 0;
      goto LABEL_17;
    default:
      unsigned int v9 = (char *)[v7 minSigBarTh2] - 1;
      return (int)v8 > 49 || (uint64_t)v6 >= (uint64_t)v9;
  }
}

- (BOOL)isCellularExitCriteriaMetForIMSThumpCallCurrentLinkCellular
{
  id v3 = [(WRM_HandoverManager *)self getCTService];
  unsigned int v4 = [v3 getServingCellType];
  unsigned int v5 = (char *)[v3 getCurrentSignalBars];
  id v6 = [[-[WRM_HandoverManager getSCService](self) getCellularDataLQM];
  id v7 = [(WRM_HandoverManager *)self getiRATConfigController];
  +[WCM_Logging logLevel:24, @"isCellularExitCriteriaMetForIMSThCallCurrentLinkCellular,LQM: %d, Signal Bars: %d", v6, v5 message];
  switch(v4)
  {
    case 3u:
    case 8u:
      [(WRM_HandoverManager *)self updateHandoverReasonCode:0x400000];
      +[WCM_Logging logLevel:24, @"isCellularExitCriteriaMetForIMSThumpCallCurrentLinkCellular:%ld", v5 message];
      return 1;
    default:
      if (((uint64_t)v5 > (uint64_t)((char *)[v7 minSigBarTh1] + 1) || (int)v6 >= 11)
        && (uint64_t)v5 > (uint64_t)[v7 minSigBarTh1])
      {
        return 0;
      }
      [(WRM_HandoverManager *)self updateHandoverReasonCode:0x80000];
      [(WRM_HandoverManager *)self updateHandoverReasonCode:0x40000];
      return 1;
  }
}

- (BOOL)evaluateCellularLinkForWiFiCallingWiFiPreferredPolicy:(int)a3 :(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = [(WRM_HandoverManager *)self getCTService];
  id v7 = [v6 getServingCellType];
  unsigned int v8 = [v6 isVoLTESupported];
  id v9 = [v6 getCurrentSignalBars];
  unsigned int v10 = [v6 getLteVoiceLQM];
  if (v5 == 1 && v4)
  {
    if ((v7 & 0xFFFFFFF7) == 1) {
      unsigned int v11 = v8;
    }
    else {
      unsigned int v11 = 0;
    }
  }
  else
  {
    BOOL v13 = v9 != (id)1 && v10 != 10;
    if (!v4) {
      BOOL v13 = 1;
    }
    if (v5) {
      unsigned int v11 = 1;
    }
    else {
      unsigned int v11 = v13;
    }
  }
  if (v7 == 10) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v11;
  }
  +[WCM_Logging logLevel:24, @"evaluateCellularLinkForWiFiCallingWiFiPreferredPolicy servingCellType:%d,VoLTE status:%d, call status:%d, evalStatus:%d, connected link: %d", v7, v8, v4, v14, v5 message];
  return v14;
}

- (BOOL)evaluateCellularLinkForWiFiCallingCellPreferredPolicy:(int)a3 :(BOOL)a4
{
  if (a4) {
    return [(WRM_HandoverManager *)self canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallActive:*(void *)&a3];
  }
  else {
    return [(WRM_HandoverManager *)self canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallIdle:*(void *)&a3];
  }
}

- (BOOL)canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallIdle:(int)a3
{
  id v5 = [(WRM_HandoverManager *)self getCTService];
  unsigned int v6 = [v5 getServingCellType];
  id v7 = (char *)[v5 getCurrentSignalBars];
  id v8 = [[-[WRM_HandoverManager getSCService](self, "getSCService") getCellularDataLQM];
  unsigned int v9 = [v5 isVoLTESupported];
  id v10 = [(WRM_HandoverManager *)self getiRATConfigController];
  +[WCM_Logging logLevel:24, @"canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallIdle, VoLTE enabled: %d", v9 message];
  if (v6 == 10)
  {
    unsigned int v11 = "UNKNOWN_RADIO ";
  }
  else if (v6 - 1 >= 8)
  {
    unsigned int v11 = "UNKNOWN_RADIO!!!";
    if (v6 == 9) {
      unsigned int v11 = "N_RADIO";
    }
  }
  else
  {
    unsigned int v11 = off_10020E708[v6 - 1];
  }
  +[WCM_Logging logLevel:24, @"Signal BARs =%ld, Registration Status = %d, Serving Cell Type: %s, Data LQM=%d", v7, self->deviceRegisteredWithCellularNetwork, v11, v8 message];
  if (a3 == 2)
  {
    if ([(WRM_HandoverManager *)self isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone])
    {
      CFStringRef v12 = @"isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone true";
      goto LABEL_32;
    }
    CFStringRef v13 = @"isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone false";
    goto LABEL_35;
  }
  if (a3 == 1)
  {
    if ([(WRM_HandoverManager *)self isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi:0])
    {
      CFStringRef v12 = @"isCellularEntryCriteriaMetForCellularCallCurrentLinkWiFi true";
LABEL_32:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v12, v15, v16);
      return 1;
    }
    CFStringRef v13 = @"isCellularEntryCriteriaMetForCellulaVoiceCurrentLinkWiFi false";
    goto LABEL_35;
  }
  switch(v6)
  {
    case 1u:
      if (![(WRM_HandoverManager *)self isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE:0])
      {
        CFStringRef v12 = @"isCellularExitCriteriaMetForCellularCallCurrentLinkLTE false";
        goto LABEL_32;
      }
      CFStringRef v13 = @"isCellularExitCriteriaMetForCellularCallCurrentLinkLTE true";
      goto LABEL_35;
    case 2u:
      if (![(WRM_HandoverManager *)self isCellularExitCriteriaMetForVoiceCallCallCurrentLinkUMTS])
      {
        CFStringRef v12 = @"isCellularExitCriteriaMetForVoiceCallCallCurrentLinkUMTS not met";
        goto LABEL_32;
      }
      CFStringRef v13 = @"isCellularExitCriteriaMetForVoiceCallCallCurrentLinkUMTS met";
      goto LABEL_35;
    case 9u:
      if (![(WRM_HandoverManager *)self isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR:0])
      {
        CFStringRef v12 = @"isCellularExitCriteriaMetForCellularCallCurrentLinkNR false";
        goto LABEL_32;
      }
      CFStringRef v13 = @"isCellularExitCriteriaMetForCellularCallCurrentLinkNR true";
      goto LABEL_35;
  }
  if (v6 != 10)
  {
    if (((uint64_t)v7 > (uint64_t)((char *)[v10 minSigBarTh1] + 1) || (int)v8 >= 11)
      && (uint64_t)v7 > (uint64_t)[v10 minSigBarTh1])
    {
      +[WCM_Logging logLevel:24, @"signal bar: %d, data LQM: %d", v7, v8 message];
      return 1;
    }
    int v15 = v7;
    id v16 = v8;
    CFStringRef v13 = @"signal bar: %d, data LQM: %d";
LABEL_35:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v13, v15, v16);
  }
  return 0;
}

- (BOOL)canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallActive:(int)a3
{
  id v5 = [(WRM_HandoverManager *)self getCTService];
  unsigned int v6 = [v5 getServingCellType];
  unsigned int v7 = [v5 isVoLTESupported];
  unsigned int v8 = [v5 isIMSPreferenceEnabled];
  +[WCM_Logging logLevel:24, @"canCellularMeetApplicationRequirementsAppTypeWiFiCallingCallActive, VoLTE enabled: %d, IMS_preference: %d", v7, v8 message];
  if (a3 != 1)
  {
    if (v6 == 9)
    {
      if (![(WRM_HandoverManager *)self isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR:1])
      {
        CFStringRef v10 = @"isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR false";
        goto LABEL_18;
      }
      CFStringRef v11 = @"isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR true";
    }
    else
    {
      if (v6 != 1) {
        return 0;
      }
      if (![(WRM_HandoverManager *)self isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE:1])
      {
        CFStringRef v10 = @"isCellularExitCriteriaMetForCellularCallCurrentLinkLTE false";
        goto LABEL_18;
      }
      CFStringRef v11 = @"isCellularExitCriteriaMetForCellularCallCurrentLinkLTE true";
    }
LABEL_14:
    +[WCM_Logging logLevel:24 message:v11];
    return 0;
  }
  BOOL result = 0;
  if (v6 == 1 && ((v7 ^ 1) & 1) == 0 && ((v8 ^ 1) & 1) == 0)
  {
    if ([(WRM_HandoverManager *)self isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi:1])
    {
      CFStringRef v10 = @"isCellularEntryCriteriaMetForCellularCallCurrentLinkWiFi true";
LABEL_18:
      +[WCM_Logging logLevel:24 message:v10];
      return 1;
    }
    CFStringRef v11 = @"isCellularEntryCriteriaMetForCellulaVoiceCurrentLinkWiFi false";
    goto LABEL_14;
  }
  return result;
}

- (BOOL)isNrEntryCriteriaMetCurrentLinkNone
{
  id v3 = [(WRM_HandoverManager *)self getCTService];
  id v4 = [v3 getCurrentSignalBars];
  unsigned int v5 = [[-[WRM_HandoverManager getSCService](self) getCellularDataLQM];
  id v6 = [(WRM_HandoverManager *)self getiRATConfigController];
  if ([(WRM_HandoverManager *)self isActiveHandoverSupported]
    && [v3 isVoiceLQMValid])
  {
    if ((int)[v3 getLteVoiceLQM] >= 50 && (uint64_t)v4 >= (uint64_t)objc_msgSend(v6, "minSigBarTh2"))
    {
      BOOL v7 = 1;
      CFStringRef v8 = @"isEntryCriteriaMetCurrentLinkNone met: Voice LQM GOOD or POOR";
    }
    else
    {
      BOOL v7 = 0;
      CFStringRef v8 = @"isEntryCriteriaMetCurrentLinkNone not met: Voice LQM Bad";
    }
  }
  else if (v5 - 50 <= 0xFFFFFFCE && (uint64_t)v4 >= (uint64_t)[v6 minSigBarTh2])
  {
    BOOL v7 = 1;
    CFStringRef v8 = @"isEntryCriteriaMetCurrentLinkNone: Data LQM better than kPOOR";
  }
  else
  {
    BOOL v7 = 0;
    CFStringRef v8 = @"isEntryCriteriaMetCurrentLinkNone: Entry Criteria not met";
  }
  +[WCM_Logging logLevel:24 message:v8];
  return v7;
}

- (BOOL)isLteEntryCriteriaMetCurrentLinkNone
{
  id v3 = [(WRM_HandoverManager *)self getCTService];
  id v4 = [v3 getCurrentSignalBars];
  unsigned int v5 = [[-[WRM_HandoverManager getSCService](self) getCellularDataLQM];
  id v6 = [(WRM_HandoverManager *)self getiRATConfigController];
  if ([(WRM_HandoverManager *)self isActiveHandoverSupported]
    && [v3 isVoiceLQMValid])
  {
    if ((int)[v3 getLteVoiceLQM] >= 50 && (uint64_t)v4 >= (uint64_t)objc_msgSend(v6, "minSigBarTh2"))
    {
      BOOL v7 = 1;
      CFStringRef v8 = @"isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone met: Voice LQM GOOD or POOR";
    }
    else
    {
      BOOL v7 = 0;
      CFStringRef v8 = @"isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone not met: Voice LQM Bad";
    }
  }
  else if (v5 - 50 <= 0xFFFFFFCE && (uint64_t)v4 >= (uint64_t)[v6 minSigBarTh2])
  {
    BOOL v7 = 1;
    CFStringRef v8 = @"isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkNone: Data LQM better than kPOOR";
  }
  else
  {
    BOOL v7 = 0;
    CFStringRef v8 = @"isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkNone: Entry Criteria not met";
  }
  +[WCM_Logging logLevel:24 message:v8];
  return v7;
}

- (BOOL)isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone
{
  id v3 = [(WRM_HandoverManager *)self getCTService];
  unsigned int v4 = [v3 getServingCellType];
  id v5 = [v3 getCurrentSignalBars];
  unsigned int v6 = [[-[WRM_HandoverManager getSCService](self) getCellularDataLQM];
  id v7 = [(WRM_HandoverManager *)self getiRATConfigController];
  BOOL result = 0;
  switch(v4)
  {
    case 1u:
      return [(WRM_HandoverManager *)self isLteEntryCriteriaMetCurrentLinkNone];
    case 2u:
      if ((uint64_t)v5 >= (uint64_t)[v7 minSigBarTh2] && v6 - 50 <= 0xFFFFFFCE)
      {
        CFStringRef v9 = @"isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone met: LQM GOOD or POOR";
        goto LABEL_11;
      }
      CFStringRef v10 = @"isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone not met:LQM Bad";
      goto LABEL_15;
    case 9u:
      return result;
    case 0xAu:
      CFStringRef v10 = @"isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone not met: ServingCell not known";
      goto LABEL_15;
    default:
      if ((uint64_t)v5 < (uint64_t)[v7 minSigBarTh2] || v6 - 50 > 0xFFFFFFCE)
      {
        CFStringRef v10 = @"isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone not met";
LABEL_15:
        +[WCM_Logging logLevel:24 message:v10];
        return 0;
      }
      else
      {
        CFStringRef v9 = @"isCellularEntryCriteriaMetForVoiceCallCurrentLinkNone met";
LABEL_11:
        +[WCM_Logging logLevel:24 message:v9];
        return 1;
      }
  }
}

- (BOOL)isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WRM_HandoverManager *)self getSCService];
  id v6 = [(WRM_HandoverManager *)self getCTService];
  unsigned int v7 = [v6 getServingCellType];
  CFStringRef v8 = (char *)[v6 getCurrentSignalBars];
  [v6 getCurrentMovAvgSignalBars];
  float v10 = v9;
  unsigned int v11 = [v5 getCellularDataLQM];
  unsigned int v12 = [v6 isAudioQualityGood];
  id v13 = [(WRM_HandoverManager *)self getiRATConfigController];
  uint64_t v14 = v13;
  if (v3) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 2;
  }
  switch(v7)
  {
    case 1u:
      return [(WRM_HandoverManager *)self isLteEntryCriteriaMetCurrentLinkWiFi:v15];
    case 2u:
      if ((uint64_t)v8 >= (uint64_t)((char *)[v13 minSigBarTh0] - v15)
        && (float)(v10 * 10.0) > (float)(uint64_t)[v14 minMovSigBarTh0]
        && v11 - 1 >= 0x31
        && ((v12 ^ 1) & 1) == 0)
      {
        BOOL v17 = 1;
        +[WCM_Logging logLevel:24, @"isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi met: LQM POOR. CS Audio Quality: %d, SigBars:%d, MovAvgBars:%f", 1, v8, v10 message];
        return v17;
      }
      +[WCM_Logging logLevel:24, @"isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi Entry Criteria not met, CS Audio Quality:%d, SigBars:%d, MovAvgBars:%f", v12, v8, v10 message];
      return 0;
    case 9u:
      return [(WRM_HandoverManager *)self isNrEntryCriteriaMetCurrentLinkWiFi:v15];
    case 0xAu:
      CFStringRef v18 = @"isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi not met: ServingCell not known";
      goto LABEL_24;
    default:
      if ((uint64_t)v8 < (uint64_t)((char *)[v13 minSigBarTh0] - v15)
        || (float)(v10 * 10.0) <= (float)(uint64_t)[v14 minMovSigBarTh0]
        || v11 - 1 < 0x31
        || ((v12 ^ 1) & 1) != 0)
      {
        double v21 = v10;
        uint64_t v19 = v12;
        uint64_t v20 = v8;
        CFStringRef v18 = @"default: isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi not met. CS Audio Quality: %d,SigBars:%d,MovAvgBars:%f";
LABEL_24:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v18, v19, v20, *(void *)&v21);
        return 0;
      }
      else
      {
        BOOL v17 = 1;
        +[WCM_Logging logLevel:24, @"default: isCellularEntryCriteriaMetForIMSVoiceCallCurrentLinkWiFi met. CS Audio Quality: %d, SigBars:%d,MovAvgBars:%f", 1, v8, v10 message];
      }
      return v17;
  }
}

- (BOOL)isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WRM_HandoverManager *)self getCTService];
  unsigned int v6 = [v5 getServingCellType];
  [v5 getServingCellRSRP];
  double v8 = v7;
  [v5 getCurrentAudioErasure];
  double v10 = v9;
  unsigned int v11 = [v5 isSrvccHandoverInProgress];
  id v12 = [(WRM_HandoverManager *)self getiRATConfigController];
  if (v11 && v3)
  {
    +[WCM_Logging logLevel:24 message:@"isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLT did not meet: SRVCC Handover in progress"];
    return 0;
  }
  if (![(WRM_HandoverManager *)self isActiveHandoverSupported]
    || ![v5 isVoiceLQMValid]
    || v6 != 1)
  {
    id v18 = [[-[WRM_HandoverManager getSCService](self) getCellularDataLQM];
    uint64_t v19 = (char *)[v5 getCurrentSignalBars];
    +[WCM_Logging logLevel:24, @"isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE, Data LQM: %d, Signal Bars: %d", v18, v19 message];
    if (((int)v18 > 10 || (uint64_t)v19 > (uint64_t)((char *)[v12 minSigBarTh1] + 1))
      && (uint64_t)v19 > (uint64_t)[v12 minSigBarTh1])
    {
      return 0;
    }
    goto LABEL_26;
  }
  +[WCM_Logging logLevel:24 message:@"Evaluating LTE Link Quality Metrics"];
  id v13 = [v5 getLteVoiceLQM];
  uint64_t v14 = (char *)[v5 getCurrentSignalBars];
  +[WCM_Logging logLevel:24, @"isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLTE, Voice LQM: %d, Signal Bars: %d, RSRP: %f, Erasure: %f", v13, v14, *(void *)&v8, *(void *)&v10 message];
  if (!v3)
  {
    if ((v13 != 10 || (uint64_t)v14 > (uint64_t)((char *)[v12 minSigBarTh1] + 1))
      && (uint64_t)v14 > (uint64_t)[v12 minSigBarTh1])
    {
      return 0;
    }
    goto LABEL_26;
  }
  BOOL v15 = v8 <= -115.0 && v10 >= 5.0;
  if (v13 == 10)
  {
    if (!v15)
    {
      id v16 = self;
      uint64_t v17 = 0x80000;
LABEL_27:
      [(WRM_HandoverManager *)v16 updateHandoverReasonCode:v17];
      return 1;
    }
LABEL_23:
    id v16 = self;
    uint64_t v17 = 0x100000;
    goto LABEL_27;
  }
  if (v15) {
    goto LABEL_23;
  }
  double v21 = (char *)[v12 minSigBarTh1];
  BOOL result = 0;
  if ((uint64_t)v14 <= (uint64_t)v21 && (int)v13 < 51)
  {
LABEL_26:
    [(WRM_HandoverManager *)self updateHandoverReasonCode:0x80000];
    id v16 = self;
    uint64_t v17 = 0x40000;
    goto LABEL_27;
  }
  return result;
}

- (BOOL)isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WRM_HandoverManager *)self getCTService];
  unsigned int v6 = [v5 isSrvccHandoverInProgress];
  id v7 = [(WRM_HandoverManager *)self getiRATConfigController];
  if (v6 && v3)
  {
    +[WCM_Logging logLevel:24 message:@"isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkLT did not meet: SRVCC Handover in progress"];
    return 0;
  }
  +[WCM_Logging logLevel:24 message:@"Evaluating LTE Link Quality when device is camped on NR CELL"];
  id v9 = [v5 getLteVoiceLQM];
  double v10 = (char *)[v5 getCurrentSignalBars];
  [v5 getServingCellRSRP];
  double v12 = v11;
  [v5 getCurrentAudioErasure];
  double v14 = v13;
  +[WCM_Logging logLevel:24, @"isCellularExitCriteriaMetForIMSVoiceCallCurrentLinkNR, Voice LQM: %d, Signal Bars: %d, RSRP: %f, Erasure:%f", v9, v10, *(void *)&v12, *(void *)&v13 message];
  if (!v3)
  {
    if ((v9 != 10 || (uint64_t)v10 > (uint64_t)((char *)[v7 minSigBarTh1] + 1))
      && (uint64_t)v10 > (uint64_t)[v7 minSigBarTh1])
    {
      return 0;
    }
    goto LABEL_19;
  }
  BOOL v15 = v14 >= 5.0;
  if (v12 > -115.0) {
    BOOL v15 = 0;
  }
  if (v9 == 10)
  {
    if (!v15)
    {
      id v16 = self;
      uint64_t v17 = 0x80000;
LABEL_20:
      [(WRM_HandoverManager *)v16 updateHandoverReasonCode:v17];
      return 1;
    }
LABEL_16:
    id v16 = self;
    uint64_t v17 = 0x100000;
    goto LABEL_20;
  }
  if (v15) {
    goto LABEL_16;
  }
  id v18 = (char *)[v7 minSigBarTh1];
  BOOL result = 0;
  if ((uint64_t)v10 <= (uint64_t)v18 && (int)v9 < 51)
  {
LABEL_19:
    [(WRM_HandoverManager *)self updateHandoverReasonCode:0x80000];
    id v16 = self;
    uint64_t v17 = 0x40000;
    goto LABEL_20;
  }
  return result;
}

- (BOOL)isCellularExitCriteriaMetForVoiceCallCallCurrentLinkUMTS
{
  id v3 = [(WRM_HandoverManager *)self getSCService];
  id v4 = [(WRM_HandoverManager *)self getCTService];
  unsigned int v5 = [v4 isAudioQualityGood];
  id v6 = [v3 getCellularDataLQM];
  id v7 = (char *)[v4 getCurrentSignalBars];
  id v8 = [(WRM_HandoverManager *)self getiRATConfigController];
  +[WCM_Logging logLevel:24, @"isCellularExitCriteriaMetForVoiceCallCallCurrentLinkUMTS,LQM: %d, Signal Bars: %d. CS audio quality: %d", v6, v7, v5 message];
  if ((uint64_t)v7 <= (uint64_t)((char *)[v8 minSigBarTh1] + 1) && (int)v6 < 11
    || (uint64_t)v7 <= (uint64_t)[v8 minSigBarTh1])
  {
    [(WRM_HandoverManager *)self updateHandoverReasonCode:0x80000];
    [(WRM_HandoverManager *)self updateHandoverReasonCode:0x40000];
    BOOL v9 = 1;
    CFStringRef v10 = @"UMTS exit conditions are met signal bars:%ld";
  }
  else
  {
    BOOL v9 = 0;
    CFStringRef v10 = @"UMTS exit conditions are not met signal bars:%ld ";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v10, v7);
  return v9;
}

- (BOOL)canWiFiRadioMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = [(WRM_HandoverManager *)self getiRATConfigController];
  CFStringRef v10 = [(WCM_WiFiController *)self->mWiFi wifiService];
  double v11 = [(WCM_WiFiService *)v10 getRSSI];
  double v12 = [(WCM_WiFiService *)v10 getSNR];
  unsigned int v13 = [(WRM_HandoverManager *)self isWiFiArqQualityIndicatorGood:a3 :a4 :v5 :1];
  unsigned int v14 = [(WRM_HandoverManager *)self isWiFiBeaconLossQualityIndicatorGood:a3 :a4 :v5];
  unsigned int v15 = [(WRM_HandoverManager *)self isWiFiLoadQualityIndicatorGood:a3 :a4 :1 :v5];
  +[WCM_Logging logLevel:24, @"canWiFiRadioMeetActiveApplicationRequirements: RSSI = %lld, SNR=%lld, ARQ Quality=%d, Beacon Quality =%d, Load Quality =%d", v11, v12, v13, v14, v15 message];
  int64_t v16 = [(WRM_HandoverManager *)self getSNRHysteresis];
  int64_t v17 = [(WRM_HandoverManager *)self getRSSIHysteresis];
  if (a4 - 1 >= 2)
  {
    if (a4) {
      CFStringRef v19 = @"Application category not supported";
    }
    else {
      CFStringRef v19 = @"canWiFiRadioMeetActiveApplicationRequirements: CT_DATA";
    }
    goto LABEL_19;
  }
  int64_t v22 = v17;
  +[WCM_Logging logLevel:24 message:@"canWiFiRadioMeetActiveApplicationRequirements: CT_VOICE"];
  if (v5)
  {
    if (v5 == 1)
    {
      +[WCM_Logging logLevel:24 message:@"canWiFiRadioMeetActiveApplicationRequirements:connectedLinkType == WRM_IWLAN_WIFI"];
      +[WCM_Logging logLevel:message:](WCM_Logging, @"minActiveWiFiSnrTh1 = %lld, minActiveWiFiRssiTh1 =%lld", [v9 minActiveWiFiSnrTh1], [v9 minActiveWiFiRssiTh1]);
      if ((uint64_t)v12 < (uint64_t)((char *)[v9 minActiveWiFiSnrTh1] + v16)
        || ((uint64_t)v11 >= (uint64_t)((char *)[v9 minActiveWiFiRssiTh1] + v22) ? (char v18 = v13) : (char v18 = 0),
            (v18 & 1) == 0))
      {
        if ((uint64_t)v12 < (uint64_t)((char *)[v9 minActiveWiFiSnrTh1] + v16)) {
          [(WRM_HandoverManager *)self updateHandoverReasonCode:4];
        }
        if ((uint64_t)v11 < (uint64_t)((char *)[v9 minActiveWiFiRssiTh1] + v22)) {
          [(WRM_HandoverManager *)self updateHandoverReasonCode:8];
        }
        return 0;
      }
      return 1;
    }
    CFStringRef v19 = @"canWiFiRadioMeetActiveApplicationRequirements:connectedLinkType == No Context";
LABEL_19:
    +[WCM_Logging logLevel:24 message:v19];
    return 1;
  }
  +[WCM_Logging logLevel:24 message:@"canWiFiRadioMeetActiveApplicationRequirements:connectedLinkType == WRM_IWLAN_CELLULAR"];
  if ((uint64_t)v12 < (uint64_t)((char *)[v9 minActiveWiFiSnrTh0] + v16)) {
    return 0;
  }
  if ((uint64_t)v11 >= (uint64_t)((char *)[v9 minActiveWiFiRssiTh0] + v22)) {
    char v21 = v15;
  }
  else {
    char v21 = 0;
  }
  return v21 & v13;
}

- (BOOL)isWiFiSymtompsIndicatorGoodEnoughForActiveApplication:(unint64_t)a3 :(int)a4
{
  unsigned int v6 = -[WRM_SymptomsService getNetworkScore:](self->mSymtomsService, "getNetworkScore:", 0, *(void *)&a4);
  BOOL v7 = 0;
  if ([(WRM_SymptomsService *)self->mSymtomsService isBackhaulGood])
  {
    BOOL v7 = 1;
    if (a3 - 3 >= 0xFFFFFFFFFFFFFFFELL && (v6 & 0xFFFFFFFE) != 2) {
      BOOL v7 = [(WRM_SymptomsService *)self->mSymtomsService isConnectedLinkGood:1];
    }
  }
  id v8 = "CT_DATA";
  id v9 = "CT_VOICE";
  CFStringRef v10 = "UNKNOWN_APP!!!";
  if (a3 == 2) {
    CFStringRef v10 = "CT_Th_Call";
  }
  if (a3 != 1) {
    id v9 = v10;
  }
  if (a3) {
    id v8 = v9;
  }
  +[WCM_Logging logLevel:24, @"{%s}isWiFiSymtompsIndicatorGoodEnoughForActiveApplication: return %d", v8, v7 message];
  if (!v7)
  {
    [(WRM_HandoverManager *)self updateHandoverReasonCode:128];
    if ([(WRM_SymptomsService *)self->mSymtomsService dpdFailureDetected]) {
      [(WRM_HandoverManager *)self updateHandoverReasonCode:1];
    }
    if ([(WRM_SymptomsService *)self->mSymtomsService sipTimeOutDetected]) {
      [(WRM_HandoverManager *)self updateHandoverReasonCode:64];
    }
  }
  return v7;
}

- (BOOL)canWiFiTransportMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = [(WRM_HandoverManager *)self getiRATConfigController];
  if (a4 - 1 >= 2)
  {
    if (a4)
    {
      +[WCM_Logging logLevel:24 message:@"Application category not supported"];
      return 1;
    }
    if (![v8 symtompsMetricsEnabled]) {
      return 1;
    }
    double v11 = self;
    unint64_t v12 = 0;
  }
  else
  {
    if (v5 == 1)
    {
      if ([v8 rtpMetricsEnabled])
      {
        return [(WRM_HandoverManager *)self isWiFiVoIPQualityGoodEnough];
      }
      return 1;
    }
    if (![v8 symtompsMetricsEnabled]) {
      return 1;
    }
    double v11 = self;
    unint64_t v12 = a4;
  }

  return [(WRM_HandoverManager *)v11 isWiFiSymtompsIndicatorGoodEnoughForActiveApplication:v12 :v5];
}

- (BOOL)canWiFiMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(int)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v11 = -[WRM_HandoverManager canWiFiRadioMeetActiveApplicationRequirements:::](self, "canWiFiRadioMeetActiveApplicationRequirements:::");
  if (v11)
  {
    BOOL v11 = [(WRM_HandoverManager *)self canWiFiTransportMeetActiveApplicationRequirements:a3 :a4 :v7];
    if (v11)
    {
      BOOL v11 = [(WRM_HandoverManager *)self isMovingAverageAudioQualityOfCurrentCallGood:v7];
      if (v11)
      {
        BOOL v11 = [(WRM_HandoverManager *)self isUplinkAudioQualityOfCurrentCallGood:v7];
        if (v11)
        {
          BOOL v11 = [(WRM_HandoverManager *)self isIMSTransportQualityGood];
          if (v11)
          {
            [(WRM_HandoverManager *)self updateHandoverReasonCode:0x10000];
            LOBYTE(v11) = 1;
          }
        }
      }
    }
  }
  if (!v11 && a4 == 1 && v7 == 1 && a6)
  {
    id v12 = [(WRM_HandoverManager *)self getCTService];
    unsigned int v13 = [v12 getServingCellType];
    unsigned int v14 = [v12 isVoLTESupported];
    if (v13 == 1 && (v14 & 1) != 0)
    {
      LOBYTE(v11) = 0;
    }
    else
    {
      +[WCM_Logging logLevel:24, @"canWiFiMeetActiveApplicationRequirements: serving cell is not LTE so supress bad WiFi evaluation, Volte Enabled %d", v14 message];
      LOBYTE(v11) = 1;
    }
  }
  return v11;
}

- (void)evaluateActiveCallQuality
{
  [(NSDate *)self->mAudioEvaluationTimer timeIntervalSinceNow];
  double v4 = v3;
  double v5 = self->mTimeSinceAudioEvaluationStarted - v3;
  if (v5 <= 30.0)
  {
    +[WCM_Logging logLevel:24, @"evaluateActiveCallQuality: not evaluating audio quality, call too short duration:%lf", *(void *)&v5 message];
    self->mTimeSinceAudioEvaluationStarted = v4;
    return;
  }
  +[WCM_Logging logLevel:24, @"evaluateActiveCallQuality: evaluating audio quality, call duration:%lf", *(void *)&v5 message];
  mWiFi = self->mWiFi;
  if (!mWiFi)
  {
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = [(WCM_WiFiController *)mWiFi wifiService];
  if (v7)
  {
LABEL_7:
    [(WCM_WiFiService *)v7 getCumulativeTxPer];
    uint64_t v9 = (uint64_t)(v8 * 100.0);
    uint64_t v10 = [(WCM_WiFiService *)v7 getRSSI];
    id v11 = [(WRM_HandoverManager *)self getWiFiCallingController];
    uint64_t v12 = (uint64_t)[v11 averagedNominalJitterBufferDelay];
    [v11 movAvgRxPktLoss];
    uint64_t v14 = (uint64_t)v13;
    +[WCM_Logging logLevel:24, @"evaluateActiveCallQuality: Avg RSSI: %lld, CumTX PER: %lld, AVG Nominal Jitter Buffer:%lld, RTP pkt loss:%lld ", v10, v9, v12, (uint64_t)v13 message];
    +[WCM_Logging logLevel:24 message:@"Handover Manager: Checking active call Quality evaluation criteria"];
    BOOL v16 = v12 <= 1000 && v14 <= 20 && v9 <= 20;
    if (v16 || v10 < -65)
    {
      +[WCM_Logging logLevel:24 message:@"Handover Manager: Audio Quality was good"];
    }
    else
    {
      unsigned int v17 = [[-[WRM_HandoverManager getCTService](self) getCTService] isVoLTESupported];
      +[WCM_Logging logLevel:24, @"Handover Manager: Audio Quality was bad, WiFiMetrics: TX PER THREASHOLD: %lld, RTP Loss THREASHOLD: %lld, Nominal jitter buffer delay THREASHOLD: %lld, AVG Call RSSI THREASHOLD: %lld", 20, 20, 1000, 4294967231 message];
      byte_10027CED8 = 1;
      if (!v17 || ![(WRM_HandoverManager *)self isActiveHandoverSupported]) {
        [(WRM_HandoverManager *)self setPingPongTimerMultipler:90 :dword_10027CF28 :1];
      }
    }
    [(WRM_HandoverManager *)self evaluateHandover];
    goto LABEL_20;
  }
  +[WCM_Logging logLevel:24 message:@"evaluateActiveCallQuality: ptrWiFiService==NULL"];
LABEL_20:
  byte_10027CED8 = 0;

  +[WCM_Logging logLevel:24 message:@"evaluateActiveCallQuality: exit"];
}

- (BOOL)isWiFiVoIPQualityGoodEnough
{
  mWiFi = self->mWiFi;
  if (mWiFi)
  {
    double v4 = [(WCM_WiFiController *)mWiFi wifiService];
    uint64_t v5 = [(WCM_WiFiService *)v4 getRSSI];
    [(WCM_WiFiService *)v4 getRxRatio];
    double v7 = v6;
    unsigned __int8 v8 = [(WCM_WiFiService *)v4 isRxRatioValid];
    [(WCM_WiFiService *)v4 getTxPer];
    uint64_t v10 = (uint64_t)(v9 * 100.0);
    unsigned int v11 = ![(WCM_WiFiService *)v4 isTxPerValid];
  }
  else
  {
    uint64_t v5 = 0;
    unsigned __int8 v8 = 0;
    uint64_t v10 = 0;
    unsigned int v11 = 1;
    double v7 = 0.0;
  }
  id v12 = [(WRM_HandoverManager *)self getCTService];
  unsigned int v13 = [v12 isVoLTESupported];
  if ((id)[(WRM_iRATConfig *)self->miRATConfig ctServiceType] != (id)2
    && (!v13 || ![(WRM_HandoverManager *)self isActiveHandoverSupported]))
  {
    CFStringRef v19 = @"isWiFiVoIPQualityGoodEnough:VoLTE not enabled or handover not supported on device";
    goto LABEL_13;
  }
  id v14 = [(WRM_HandoverManager *)self getWiFiCallingController];
  if (!v14)
  {
    +[WCM_Logging logLevel:24 message:@"isWiFiVoIPQualityGoodEnough: tmpPtrWiFiCallingController == NULL"];
    [0 resetRTPMetrics];
    [0 resetCumulativeRTPMetrics];
    uint64_t v20 = 0;
LABEL_18:
    [v20 resetPeriodicRTPStats];
    return 1;
  }
  unsigned int v15 = v14;
  if (!byte_10027CF25)
  {
    CFStringRef v21 = @"isWiFiVoIPQualityGoodEnough: Call not on WiFI";
LABEL_17:
    +[WCM_Logging logLevel:24 message:v21];
    [v15 resetRTPMetrics];
    [v15 resetCumulativeRTPMetrics];
    uint64_t v20 = v15;
    goto LABEL_18;
  }
  unsigned int v16 = [v12 getCallState];
  unsigned int v17 = [v12 isCallOnHold];
  unsigned int v18 = [v12 isCallInConference];
  if (v16 != 1)
  {
    CFStringRef v21 = @"isWiFiVoIPQualityGoodEnough: do not use RTP metrics, call not active";
    goto LABEL_17;
  }
  if ((v17 | v18) == 1)
  {
    CFStringRef v19 = @"isWiFiVoIPQualityGoodEnough: do not use RTP metrics, call on hold or in conference";
LABEL_13:
    +[WCM_Logging logLevel:24 message:v19];
    return 1;
  }
  [(NSDate *)self->mLatteContextStartedTimer timeIntervalSinceNow];
  if (self->mTimeSinceLatteContextStarted - v23 < 3.0)
  {
    CFStringRef v19 = @"isWiFiVoIPQualityGoodEnough: ignoring inital RTP metrics to avoid false alarm";
    goto LABEL_13;
  }
  id v24 = [(WRM_HandoverManager *)self getiRATConfigController];
  [WCM_Logging logLevel:24 message:@"Rx Pkt loss: %lld, nominal buffer delay %lld", [v15 rxPktLoss], [v15 nominalJitterBufferDelay]];
  id v25 = [v15 rxPktLoss];
  if (v25 < [v24 handoverRxPktLossThreshold]
    || v5 >= -70 && (v10 < 6 ? (int v26 = 1) : (int v26 = v11), v7 >= 0.3 ? (v27 = v8) : (v27 = 0), v26 == 1 && (v27 & 1) == 0))
  {
    +[WCM_Logging logLevel:24 message:@"isWiFiVoIPQualityGoodEnough: true"];
    byte_10027CEDA = 0;
    return 1;
  }
  +[WCM_Logging logLevel:24 message:@"isWiFiVoIPQualityGoodEnough: false"];
  byte_10027CEDA = 1;
  [WCM_Logging logLevel:24 message:@"WiFiMetrics: triggering handover due to RTP Erasure: %lld, RTP Erasure THREASHOLD: %lld ", [v15 rxPktLoss], [v24 handoverRxPktLossThreshold]];
  [(WRM_HandoverManager *)self updateHandoverReasonCode:256];
  return 0;
}

- (BOOL)isMovingAverageAudioQualityOfCurrentCallGood:(int)a3
{
  if ([(WRM_HandoverManager *)self getIWLANServiceType] == 1) {
    return 1;
  }
  id v5 = [(WRM_HandoverManager *)self getWiFiCallingController];
  if (byte_10027CF25)
  {
    id v6 = [(WRM_HandoverManager *)self getCTService];
    unsigned int v7 = [v6 getCallState];
    unsigned int v8 = [v6 isCallOnHold];
    unsigned int v9 = [v6 isCallInConference];
    if (v7 == 1)
    {
      unsigned int v10 = v9;
      if ((id)[(WRM_iRATConfig *)self->miRATConfig ctServiceType] != (id)2
        && (![v6 isVoLTESupported]
         || ![(WRM_HandoverManager *)self isActiveHandoverSupported]))
      {
        CFStringRef v11 = @"isWiFiVoIPQualityGoodEnough:VoLTE not enabled or handover not supported on device";
        goto LABEL_18;
      }
      if ((v8 | v10) == 1)
      {
        CFStringRef v11 = @"isWiFiVoIPQualityGoodEnough: do not use RTP metrics, call on hold or in conference";
LABEL_18:
        +[WCM_Logging logLevel:24 message:v11];
        return 1;
      }
      id v13 = [(WRM_HandoverManager *)self getiRATConfigController];
      if (!a3)
      {
        CFStringRef v11 = @"isMovingAverageAudioQualityOfCurrentCallGood: returned";
        goto LABEL_18;
      }
      id v14 = v13;
      mWiFi = self->mWiFi;
      if (mWiFi)
      {
        unsigned int v16 = [(WCM_WiFiController *)mWiFi wifiService];
        if (!v16)
        {
          +[WCM_Logging logLevel:24 message:@"evaluateActiveCallQuality: ptrWiFiService==NULL"];
          goto LABEL_31;
        }
      }
      else
      {
        unsigned int v16 = 0;
      }
      [(WCM_WiFiService *)v16 getMovingAverageTxPer];
      unint64_t v20 = (unint64_t)(v19 * 100.0);
      unsigned int v21 = [(WCM_WiFiService *)v16 isMovingAverageTxPerValid];
      id v22 = [v5 movAvgNominalJitterBufferDelay];
      [v5 movAvgRxPktLoss];
      uint64_t v24 = (uint64_t)v23;
      [v5 movAvgIdleRxPktLoss];
      uint64_t v26 = (uint64_t)v25;
      if ((unint64_t)(uint64_t)v25 >= 0x64)
      {
        +[WCM_Logging logLevel:24 message:@"evaluateActiveCallQuality: discard invalid metrics"];
        uint64_t v26 = 0;
      }
      +[WCM_Logging logLevel:24, @"isMovingAverageAudioQualityOfCurrentCallGood: TX PER (Mov Avg): %lld, Moving Avg RTP packet loss: %lld, Moving Avg Valid: %d, Mov Jitter Buffer Delay: %lld, Total Mov AVG RTP packet loss: %lld ", v20, v24, v21, v22, v26 message];
      if ((unint64_t)[v14 minActiveWiFiAvgTxPktLossRateTh] < v20) {
        char v27 = v21;
      }
      else {
        char v27 = 0;
      }
      if ((v27 & 1) != 0
        || (uint64_t)[v14 handoverAvgRxPktLossThreshold] < v24
        || v26 > (uint64_t)[v14 handoverAvgIdleRxPktLossThreshold])
      {
        [WCM_Logging logLevel:24 message:@"Handover Manager: Moving average audio quality was bad, WiFiMetics: TX PER THREASHOLD: %lld, RX RTP THREASHOLD: %lld" minActiveWiFiAvgTxPktLossRateTh:[v14 minActiveWiFiAvgTxPktLossRateTh] handoverAvgRxPktLossThreshold:[v14 handoverAvgRxPktLossThreshold]];
        byte_10027CED9 = 1;
        [(WRM_HandoverManager *)self updateHandoverReasonCode:256];
        [(WRM_HandoverManager *)self updateHandoverReasonCode:16];
        BOOL v17 = 0;
LABEL_32:
        +[WCM_Logging logLevel:24 message:@"isMovingAverageAudioQualityOfCurrentCallGood: exit"];
        return v17;
      }
LABEL_31:
      BOOL v17 = 1;
      goto LABEL_32;
    }
    CFStringRef v12 = @"isMovingAverageAudioQualityOfCurrentCallGood: discard WIFI RTP metrics, call not active";
  }
  else
  {
    CFStringRef v12 = @"isMovingAverageAudioQualityOfCurrentCallGood: Call not on WiFI";
  }
  +[WCM_Logging logLevel:24 message:v12];
  [v5 resetRTPMetrics];
  [v5 resetCumulativeRTPMetrics];
  [v5 resetPeriodicRTPStats];
  return 1;
}

- (BOOL)isIMSTransportQualityGood
{
  mSymtomsService = self->mSymtomsService;
  if (mSymtomsService
    && (unsigned int v4 = [(WRM_SymptomsService *)mSymtomsService isIMSTransportQualityGood],
        +[WCM_Logging logLevel:24, @"Handover Manager: isIMSTransportQualityGood: %d", v4 message], (v4 & 1) == 0))
  {
    [(WRM_HandoverManager *)self updateHandoverReasonCode:128];
    if ([(WRM_SymptomsService *)self->mSymtomsService dpdFailureDetected]) {
      [(WRM_HandoverManager *)self updateHandoverReasonCode:1];
    }
    BOOL v5 = [(WRM_SymptomsService *)self->mSymtomsService sipTimeOutDetected];
    if (v5)
    {
      [(WRM_HandoverManager *)self updateHandoverReasonCode:64];
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isUplinkAudioQualityOfCurrentCallGood:(int)a3
{
  if ([(WRM_HandoverManager *)self getIWLANServiceType] != 1)
  {
    id v5 = [(WRM_HandoverManager *)self getCTService];
    if ([v5 getCallState] == 1)
    {
      if ((id)[(WRM_iRATConfig *)self->miRATConfig ctServiceType] == (id)2
        || [v5 isVoLTESupported]
        && [(WRM_HandoverManager *)self isActiveHandoverSupported])
      {
        if (a3)
        {
          id v6 = [(WCM_WiFiController *)self->mWiFi wifiService];
          [(WCM_WiFiService *)v6 getTxPer];
          double v8 = v7 * 100.0;
          [(WCM_WiFiService *)v6 getTxRetryPercent];
          double v10 = v9;
          unsigned int v11 = [(WCM_WiFiService *)v6 isTxPerValid];
          unsigned __int8 v12 = [(WCM_WiFiService *)v6 isRetryValid];
          int64_t v13 = [(WCM_WiFiService *)v6 getCCA];
          signed int v14 = [(WCM_WiFiService *)v6 getChannelUtlization];
          unsigned int v15 = [(WCM_WiFiService *)v6 isQBSSLoadValid];
          int64_t v16 = [(WCM_WiFiService *)v6 getRSSI];
          if (v8 < 2.0 || v11 == 0)
          {
            BOOL v18 = 1;
          }
          else
          {
            uint64_t v20 = v14;
            if (!v15) {
              uint64_t v20 = v13;
            }
            char v21 = v12 ^ 1;
            BOOL v18 = 1;
            CFStringRef v19 = @"isUplinkAudioQualityOfCurrentCallGood: exit";
            if (v10 * 100.0 < 60.0) {
              char v21 = 1;
            }
            if ((v21 & 1) != 0 || v20 < 40) {
              goto LABEL_29;
            }
            uint64_t v22 = v16;
            +[WCM_Logging logLevel:24, @"Handover Manager: Uplink Audio Quality was bad, WiFiMetrics: TX PER THREASHOLD: %lld, TX Retry THREASHOLD: %lld, Load THREASHOLD: %lld", v10 * 100.0, 2, 60, 40 message];
            if (!objc_msgSend(-[WRM_HandoverManager getMotionController](self, "getMotionController"), "getMobilityState")|| v22 >= -70)
            {
              +[WCM_Logging logLevel:24 message:@"Handover Manager: Blocklist WiFi till call ends due to bad uplink audio"];
              byte_10027CED9 = 1;
            }
            [(WRM_HandoverManager *)self updateHandoverReasonCode:16];
            [(WRM_HandoverManager *)self updateHandoverReasonCode:32];
            if (byte_10027CED9) {
              [(WRM_HandoverManager *)self updateHandoverReasonCode:256];
            }
            BOOL v18 = 0;
          }
          CFStringRef v19 = @"isUplinkAudioQualityOfCurrentCallGood: exit";
        }
        else
        {
          BOOL v18 = 1;
          CFStringRef v19 = @"isUplinkAudioQualityOfCurrentCallGood: returned";
        }
      }
      else
      {
        BOOL v18 = 1;
        CFStringRef v19 = @"isUplinkAudioQualityOfCurrentCallGood:VoLTE not enabled or handover not supported on device";
      }
LABEL_29:
      +[WCM_Logging logLevel:24 message:v19];
      return v18;
    }
  }
  return 1;
}

- (void)handleMotionUpdate:(id)a3
{
  int64_t int64 = xpc_dictionary_get_int64(a3, "kWRMM_MOTION_STATE");
  [(WRM_HandoverManager *)self evaluateHandover];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"handleMotionUpdate received: %s: motion state: %d", "-[WRM_HandoverManager(privateFunctions) handleMotionUpdate:]", int64);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = [a1 WRM_HandoverManagerSingleton:a3];

  return v3;
}

- (void)addiRatClient:(id)a3
{
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  [(NSMutableArray *)self->miRATClientContexts addObject:a3];
  [(WRM_HandoverManager *)self existingContexts];

  objc_sync_exit(miRATClientContexts);
}

- (void)removeiRatClient:(id)a3
{
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  [(WRM_HandoverManager *)self existingContexts];
  [(NSMutableArray *)self->miRATClientContexts removeObject:a3];
  [(WRM_HandoverManager *)self existingContexts];

  objc_sync_exit(miRATClientContexts);
}

- (void)deleteiRATClient:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  id v6 = [(WRM_HandoverManager *)self getiRATClientFromList:v3];
  if (v6) {
    [(WRM_HandoverManager *)self removeiRatClient:v6];
  }
  objc_sync_exit(miRATClientContexts);
  mWiFi = self->mWiFi;
  BOOL v8 = [(WRM_HandoverManager *)self needWiFiLQM];

  [(WCM_WiFiController *)mWiFi toggleWiFiLQMIfNeeded:v8];
}

- (id)getiRATClientFromList:(int)a3
{
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->miRATClientContexts;
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
      double v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
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
    double v10 = 0;
  }
  objc_sync_exit(miRATClientContexts);
  return v10;
}

- (void)existingContexts
{
}

- (unint64_t)retainCount
{
  return -1;
}

- (WRM_HandoverManager)autorelease
{
  return self;
}

- (WRM_HandoverManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)WRM_HandoverManager;
  CFStringRef v2 = [(WRM_HandoverManager *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.WirelessRadioManager.Handover", 0);
    v2->mWiFi = 0;
    v2->mQueue = (OS_dispatch_queue *)v3;
    v2->mCTService = 0;
    unsigned int v4 = +[WRM_IDSP2PController wrm_IDSP2PControllerSingleton];
    v2->mSCService = 0;
    v2->mIDSP2PController = v4;
    v2->mIPTelephonyController = 0;
    v2->mWiFiCalling = 0;
    v2->mSymtomsService = 0;
    byte_10027CF2C = 0;
    byte_10027CEC1 = 1;
    byte_10027CF25 = 0;
    v2->miRATConfig = 0;
    v2->mMotionController = 0;
    v2->miRATClientContexts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->miRATConfig = (WRM_iRATConfig *)objc_opt_new();
    v2->mMotionController = (WRM_MotionController *)+[WRM_MotionController singleton];
    id v5 = +[WRM_MetricsService getSingleton];
    v2->mMetrics = v5;
    if (v5)
    {
      [(WRM_MetricsService *)v5 initiRATMetrics];
      [(WRM_MetricsService *)v2->mMetrics initWiFiCallingMetrics];
      [(WRM_MetricsService *)v2->mMetrics initStandaloneLinkPrefMetrics];
      [(WRM_MetricsService *)v2->mMetrics init5GVersusWiFiLinkPrefMetrics];
    }
    [(WRM_HandoverManager *)v2 updateActiveHandoverStatus];
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"Handover Manager: Bundle ID %@", [+[NSBundle mainBundle] bundleIdentifier]);
    +[WCM_Logging logLevel:24 message:@"Handover Manager: Handover manager initialized"];
    v2->wrmWifiCallingEnd = (WRMWiFiCallingEnd *)((char *)[(WRM_MetricsService *)v2->mMetrics getWiFiCallingMetrics]+ 8);
    id v6 = [(WRM_MetricsService *)v2->mMetrics getStandaloneLinkPreferenceMetrics];
    v2->mDataLinkPrefMetrics = v6;
    v6->metricsUpdate = 0;
    v2->mStartTime = (NSDate *)[+[NSDate date] copy];
    v2->prevTimeSinceStart = 0.0;
    v2->mAudioEvaluationTimer = (NSDate *)[+[NSDate date] copy];
    v2->mTimeSinceAudioEvaluationStarted = 0.0;
    v2->mLatteContextStartedTimer = (NSDate *)[+[NSDate date] copy];
    v2->mTimeSinceLatteContextStarted = 0.0;
    if (NSClassFromString(@"CXCallObserver"))
    {
      id v7 = (CXCallObserver *)objc_alloc_init((Class)CXCallObserver);
      v2->mCallObserver = v7;
      [(CXCallObserver *)v7 setDelegate:v2 queue:&_dispatch_main_q];
    }
    else
    {
      v2->mCallObserver = 0;
    }
    byte_10027CF11 = 0;
    byte_10027CF12 = 0;
    [(WRM_HandoverManager *)v2 initWiFiCellDataEval];
    *(_OWORD *)&v2->mQMINasClientPrimary = 0u;
    *(_OWORD *)&v2->mQMIDsdClientPrimary = 0u;
    if ([(WRM_iRATConfig *)v2->miRATConfig qmiClientEnabled]) {
      [(WRM_HandoverManager *)v2 createQMIClient];
    }
    [(WRM_HandoverManager *)v2 createIBIClient];
  }
  return v2;
}

- (void)dealloc
{
  p_mQueue = &self->mQueue;
  mQueue = self->mQueue;
  if (mQueue) {
    dispatch_release(mQueue);
  }
  mCTService = self->mCTService;
  if (mCTService) {

  }
  mIDSP2PController = self->mIDSP2PController;
  if (mIDSP2PController) {

  }
  mSCService = self->mSCService;
  if (mSCService) {

  }
  mWiFi = self->mWiFi;
  if (mWiFi) {

  }
  mWiFiCalling = self->mWiFiCalling;
  if (mWiFiCalling) {

  }
  mSymtomsService = self->mSymtomsService;
  if (mSymtomsService) {

  }
  miRATConfig = self->miRATConfig;
  if (miRATConfig) {

  }
  mCallObserver = self->mCallObserver;
  if (mCallObserver)
  {
    [(CXCallObserver *)mCallObserver setDelegate:0 queue:0];

    self->mCallObserver = 0;
  }
  mQMINasClientPrimary = self->mQMINasClientPrimary;
  if (mQMINasClientPrimary)
  {

    self->mQMINasClientPrimary = 0;
  }
  mQMINasClientSecondary = self->mQMINasClientSecondary;
  if (mQMINasClientSecondary)
  {

    self->mQMINasClientSecondary = 0;
  }
  mQMIDsdClientPrimary = self->mQMIDsdClientPrimary;
  if (mQMIDsdClientPrimary)
  {

    self->mQMIDsdClientPrimary = 0;
  }
  mIBIClient = self->mIBIClient;
  if (mIBIClient)
  {

    self->mIBIClient = 0;
  }
  self->mIPTelephonyController = 0;
  *(_OWORD *)p_mQueue = 0u;
  *((_OWORD *)p_mQueue + 1) = 0u;
  *((_OWORD *)p_mQueue + 2) = 0u;
  p_mQueue[6] = 0;
  +[WCM_Logging logLevel:24 message:@"Handover Manager: Dealloc called for handover manager "];
  miRATClientContexts = self->miRATClientContexts;
  if (miRATClientContexts) {

  }
  mStartTime = self->mStartTime;
  if (mStartTime)
  {

    self->mStartTime = 0;
    self->prevTimeSinceStart = 0.0;
  }
  mAudioEvaluationTimer = self->mAudioEvaluationTimer;
  if (mAudioEvaluationTimer)
  {

    self->mAudioEvaluationTimer = 0;
    self->mTimeSinceAudioEvaluationStarted = 0.0;
  }
  mLatteContextStartedTimer = self->mLatteContextStartedTimer;
  if (mLatteContextStartedTimer)
  {

    self->mLatteContextStartedTimer = 0;
    self->mTimeSinceLatteContextStarted = 0.0;
  }
  v21.receiver = self;
  v21.super_class = (Class)WRM_HandoverManager;
  [(WRM_HandoverManager *)&v21 dealloc];
}

- (BOOL)isQmiSdmSupported
{
  return ![(WRM_HandoverManager *)self disableQMIClient];
}

- (BOOL)isIbiSdmSupported
{
  return 0;
}

- (void)postBBNotification:(unsigned __int8)a3 :(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if ([(WRM_HandoverManager *)self isQmiSdmSupported])
  {
    +[WCM_Logging logLevel:24, @"postBBNotification calling notifyBBLockState : mQMINasClientPrimary: %x", self->mQMINasClientPrimary message];
    mQMINasClientPrimary = self->mQMINasClientPrimary;
    uint64_t v8 = v5;
    uint64_t v9 = v4;
_objc_msgSend$notifyBBLockState__:
    [mQMINasClientPrimary notifyBBLockState:v8 :v9];
    return;
  }
  if ([(WRM_HandoverManager *)self isIbiSdmSupported])
  {
    +[WCM_Logging logLevel:24, @"postBBNotification calling notifyBBLockState : mIBIClient: %x", self->mIBIClient message];
    mQMINasClientPrimary = self->mIBIClient;
    uint64_t v8 = 1;
    uint64_t v9 = v5;
    goto _objc_msgSend$notifyBBLockState__;
  }
}

- (void)notifyEHBState:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if ([(WRM_HandoverManager *)self isQmiSdmSupported])
  {
    +[WCM_Logging logLevel:24, @"postBBNotification calling notifyEHBState : mQMINasClientPrimary: %x", self->mQMINasClientPrimary message];
    mQMINasClientPrimary = self->mQMINasClientPrimary;
    [(WRM_QMINasClient *)mQMINasClientPrimary notifyStreamingEBHState:v3];
  }
  else if ([(WRM_HandoverManager *)self isIbiSdmSupported])
  {
    +[WCM_Logging logLevel:24, @"postBBNotification calling notifyEHBState : mIBIClient: %x", self->mIBIClient message];
    mIBIClient = self->mIBIClient;
    -[WRM_IceClientDriver notifyStreamingEBHState::](mIBIClient, "notifyStreamingEBHState::", 1);
  }
}

- (void)notifyAVStatus:(unsigned __int8)a3 :(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if ([(WRM_HandoverManager *)self isQmiSdmSupported])
  {
    +[WCM_Logging logLevel:24, @"postBBNotification calling notifyAVStatus : mQMINasClientPrimary: %x", self->mQMINasClientPrimary message];
    mQMINasClientPrimary = self->mQMINasClientPrimary;
    [(WRM_QMINasClient *)mQMINasClientPrimary notifyAVStatus:v5 :v4];
  }
  else if ([(WRM_HandoverManager *)self isIbiSdmSupported])
  {
    +[WCM_Logging logLevel:24, @"postBBNotification calling notifyAVStatus : mIBIClient: %x", self->mIBIClient message];
    mIBIClient = self->mIBIClient;
    -[WRM_IceClientDriver notifyAVStatus:::](mIBIClient, "notifyAVStatus:::", 1, v5);
  }
}

- (void)triggerABC:(id)a3 subType:(id)a4 subtypeContext:(id)a5
{
}

- (BOOL)isDeviceConnectedOverNonLTERadio
{
  if ([(WRM_HandoverManager *)self isEnhancedCTServiceNeeded]) {
    mCTService = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
  }
  else {
    mCTService = self->mCTService;
  }

  return [(WRM_CTService *)mCTService checkIfServingCellNonLTE];
}

- (BOOL)isVoIPCallActive
{
  return (byte_10027CF12 | byte_10027CF11) != 0;
}

- (void)rxVoIPAppNotification:(BOOL)a3
{
  if (!byte_10027CF11)
  {
    if (a3)
    {
      uint64_t v3 = 1;
      char v4 = 1;
    }
    else
    {
      char v4 = 0;
      if (!byte_10027CF12)
      {
LABEL_7:
        byte_10027CF12 = v4;
        return;
      }
      uint64_t v3 = 2;
    }
    [(WRM_HandoverManager *)self notifyBBVoIPState:2 :v3 :2 :0];
    goto LABEL_7;
  }
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  if (objc_msgSend(a4, "hasConnected", a3))
  {
    unsigned int v6 = [a4 hasEnded];
    byte_10027CF11 = v6 ^ 1;
    unsigned __int8 v7 = 1;
    if (((v6 ^ 1) & 1) == 0)
    {
      [(WRM_HandoverManager *)self toggleSAState:[(WRM_SCService *)self->mSCService isWiFiPrimary]];
      if (byte_10027CF11) {
        unsigned __int8 v7 = 1;
      }
      else {
        unsigned __int8 v7 = 2;
      }
    }
    id v8 = [@"com.apple.coretelephony" isEqualToString:[a4 providerIdentifier]];
    unsigned __int8 v9 = 1;
    if ((objc_msgSend(@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider", "isEqualToString:", objc_msgSend(a4, "providerIdentifier")) & 1) == 0)
    {
      if ([[@"com.apple.coretelephony" isEqualToString:[a4 providerIdentifier]] unsigned __int8 v9 = 1; {
      else
      }
        unsigned __int8 v9 = 2;
    }
    unsigned int v10 = [a4 isVideo];
    if (v10) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    uint64_t v12 = v7;
    if (v10) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 1;
    }
    [(WRM_HandoverManager *)self notifyBBVoIPState:v9 :v12 :v11 :v8];
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"Call Active: %d, provider id: %@, VoIP app type: %d, VoIP CallType: %d, isTelephonyCall: %d", byte_10027CF11, [a4 providerIdentifier], v9, v13, v8);
    id v14 = +[WCM_PolicyManager singleton];
    uint64_t v15 = byte_10027CF11;
    [v14 updateCallStateActive:v15];
  }
}

- (void)updateControllerSession:(id)a3 ofId:(unint64_t)a4
{
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C7200;
  block[3] = &unk_10020DDC0;
  void block[5] = self;
  block[6] = a4;
  void block[4] = a3;
  dispatch_async(mQueue, block);
}

- (BOOL)enableiRATManager
{
  return 1;
}

- (BOOL)isSisSupportedOnICE
{
  return 0;
}

- (BOOL)isEnhancedSisSupported
{
  unsigned int v2 = [[[WCM_PolicyManager singleton] platformManager] wrmPlatformId];
  int32x4_t v3 = vdupq_n_s32(v2);
  *(int32x2_t *)v4.i8 = vdup_n_s32(v2 & 0xFFFFFFFE);
  v4.i64[1] = v3.i64[0];
  return (vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vceqq_s32(v4, (int32x4_t)xmmword_1001EB070), (int16x8_t)vceqq_s32(v3, (int32x4_t)xmmword_1001EB060)))) | vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(v3, (int32x4_t)xmmword_1001EB080)))) & 1 | (v2 == 166 || (v2 & 0xFFFFFFFD) == 168);
}

- (BOOL)disableICEClient
{
  unsigned int v2 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager] wrmPlatformId];
  return (v2 > 0xA) | (0x350u >> v2) & 1;
}

- (BOOL)disableQMIClient
{
  unsigned int v2 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager] wrmPlatformId];
  BOOL result = 0;
  BOOL v4 = v2 > 0x39 || ((1 << v2) & 0x3FC000003EFF800) == 0;
  if (v4)
  {
    unsigned int v5 = v2 - 131;
    BOOL v6 = v5 >= 0x27;
    BOOL v4 = v5 == 39;
    uint64_t v7 = (1 << v5) & 0xAA8D92A001;
    if (!v4 && v6 || v7 == 0) {
      return 1;
    }
  }
  return result;
}

- (void)updateActiveHandoverStatus
{
  unsigned int v3 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager] wrmPlatformId];
  uint64_t v4 = 1;
  if (v3 > 0x39 || ((1 << v3) & 0x3FC000003EFEFFFLL) == 0)
  {
    byte_10027CF24 = 0;
    uint64_t v6 = 1;
    [(WRM_HandoverManager *)self setIWLANServiceType:1];
    uint64_t v4 = byte_10027CF24;
  }
  else
  {
    [(WRM_HandoverManager *)self setIWLANServiceType:0];
    uint64_t v6 = 0;
    byte_10027CF24 = 1;
  }
  +[WCM_Logging logLevel:24, @"Handover support status: %d, Device Service Type: %d", v4, v6 message];
}

- (void)handleControllerAvailability:(unint64_t)a3
{
  if ([(WRM_HandoverManager *)self enableiRATManager])
  {
    switch(a3)
    {
      case 7uLL:
        goto LABEL_8;
      case 8uLL:
        goto LABEL_11;
      case 9uLL:
        goto LABEL_18;
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
        return;
      case 0xFuLL:
        goto LABEL_15;
      default:
        if (a3 == 21)
        {
LABEL_8:
          [(WRM_HandoverManager *)self handleCTConfig];
          switch(a3)
          {
            case 0xFuLL:
LABEL_15:
              [(WRM_HandoverManager *)self handleCallKitConfig];
              break;
            case 9uLL:
LABEL_18:
              [(WRM_HandoverManager *)self configureRTPMetricsReporting];
              break;
            case 8uLL:
LABEL_11:
              [(WRM_HandoverManager *)self handleNetworkdConfig];
              break;
          }
        }
        else if (a3 == 1)
        {
          [(WRM_HandoverManager *)self handleWiFiConfig];
        }
        break;
    }
  }
}

- (void)handleCallKitConfig
{
}

- (void)handleCTConfig
{
}

- (void)handleNetworkdConfig
{
}

- (void)handleWiFiConfig
{
  +[WCM_Logging logLevel:24 message:@"WiFi config changed."];
  if (!self->mWiFi)
  {
    +[WCM_Logging logLevel:18 message:@"WiFi did not register, can't get state"];
    [(WRM_HandoverManager *)self evaluateHandover];
  }
}

- (BOOL)isWiFiLinkEvaluationDesired
{
  mWiFi = self->mWiFi;
  if (!mWiFi)
  {
    CFStringRef v8 = @"isWiFiLinkEvaluationDesired: WiFi not initialized.";
LABEL_7:
    +[WCM_Logging logLevel:26 message:v8];
    LOBYTE(v6) = 0;
    return v6;
  }
  uint64_t v4 = [(WCM_WiFiController *)mWiFi wifiService];
  if (!v4)
  {
    CFStringRef v8 = @"isWiFiLinkEvaluationDesired: WiFi service not initialized.";
    goto LABEL_7;
  }
  unsigned int v5 = v4;
  unsigned int v6 = [(WCM_WiFiService *)v4 isWiFiPrimaryInterface];
  if (v6)
  {
    int64_t v7 = [(WCM_WiFiService *)v5 getRSSI];
    LOBYTE(v6) = v7 >= (uint64_t)[-[WRM_HandoverManager getiRATConfigController](self, "getiRATConfigController") minActiveWiFiRssiTh0];
  }
  return v6;
}

- (void)notifyBBUsingMappedSlotInfo:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(WRM_CTService *)self->mCTService isWiFiCallingSupportedSlot1];
  if ([(WRM_CTService *)self->mCTService isWiFiCallingSupportedSlot2]) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  byte_10027CD01 = v6 | v5;
  if ([(WRM_HandoverManager *)self isQmiSdmSupported])
  {
    switch(byte_10027CD01)
    {
      case 0:
      case 3:
        -[WRM_QMINasClient setBBSAState::](self->mQMINasClientPrimary, "setBBSAState::", v3);
        mQMINasClientSecondary = self->mQMINasClientSecondary;
        uint64_t v8 = byte_10027CD01;
        BOOL v9 = v3;
        goto LABEL_12;
      case 1:
        [(WRM_QMINasClient *)self->mQMINasClientPrimary setBBSAState:v3 :1];
        mQMINasClientSecondary = self->mQMINasClientSecondary;
        if (mQMINasClientSecondary) {
          goto LABEL_11;
        }
        return;
      case 2:
        [(WRM_QMINasClient *)self->mQMINasClientSecondary setBBSAState:v3 :2];
        mQMINasClientSecondary = self->mQMINasClientPrimary;
        if (!mQMINasClientSecondary) {
          return;
        }
LABEL_11:
        uint64_t v8 = byte_10027CD01;
        BOOL v9 = 0;
LABEL_12:
        [(WRM_QMINasClient *)mQMINasClientSecondary setBBSAState:v9 :v8];
        break;
      default:
        return;
    }
  }
  else if ([(WRM_HandoverManager *)self isIbiSdmSupported])
  {
    switch(byte_10027CD01)
    {
      case 0:
      case 3:
        -[WRM_IceClientDriver setBBSAState:::](self->mIBIClient, "setBBSAState:::", 1, v3);
        mIBIClient = self->mIBIClient;
        uint64_t v11 = byte_10027CD01;
        uint64_t v12 = 2;
        BOOL v13 = v3;
        goto LABEL_19;
      case 1:
        mIBIClient = self->mIBIClient;
        uint64_t v12 = 1;
        BOOL v13 = v3;
        uint64_t v11 = 1;
        goto LABEL_19;
      case 2:
        mIBIClient = self->mIBIClient;
        uint64_t v12 = 2;
        BOOL v13 = v3;
        uint64_t v11 = 2;
LABEL_19:
        [(WRM_IceClientDriver *)mIBIClient setBBSAState:v12 :v13 :v11];
        break;
      default:
        return;
    }
  }
}

- (void)triggerEnableSA:(BOOL)a3
{
  mQueue = self->mQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C7DDC;
  v4[3] = &unk_10020DE10;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(mQueue, v4);
}

- (void)setBBSAState:(BOOL)a3
{
}

- (id)getWiFiController
{
  return self->mWiFi;
}

- (id)getWiFiService
{
  return [(WCM_WiFiController *)self->mWiFi wifiService];
}

- (void)switchPrivateNwDataSim:(int64_t)a3 currentSlotQuality:(int)a4 anyCallState:(int)a5
{
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C7F7C;
  block[3] = &unk_10020DC08;
  void block[4] = self;
  void block[5] = a3;
  int v7 = a4;
  int v8 = a5;
  dispatch_async(mQueue, block);
}

- (void)submitMetricsCBRSWithDataSimRecommendation:(BOOL)a3 forSimSlot:(int64_t)a4
{
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C826C;
  block[3] = &unk_10020DD48;
  void block[4] = self;
  void block[5] = a4;
  BOOL v6 = a3;
  dispatch_async(mQueue, block);
}

- (void)showHOAlertUI:(BOOL)a3
{
  id v4 = objc_alloc_init((Class)NSMutableString);
  BOOL v5 = v4;
  if (qword_10027CF00)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s %d: Notification is already pending!", "-[WRM_HandoverManager showHOAlertUI:]", 2193);
  }
  else
  {
    [v4 appendString:@"iRAT Handover Alert\n"];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [[-[WRM_MetricsService getiRATMetricHORecordCache](self->mMetrics, "getiRATMetricHORecordCache") reverseObjectEnumerator];
    id v23 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v23)
    {
      uint64_t v7 = 0;
      uint64_t v22 = *(void *)v26;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(obj);
          }
          BOOL v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          -[WRM_MetricsService getReasonStr::](self->mMetrics, "getReasonStr::", [v9 mReason], v29);
          id v10 = [v9 getDate];
          id v11 = objc_alloc_init((Class)NSDateFormatter);
          [v11 setDateFormat:@"MM/dd HH:mm:ss"];
          id v12 = [v11 stringFromDate:v10];
          BOOL v13 = self;
          if ([v9 mApp] == (id)1) {
            id v14 = "vo";
          }
          else {
            id v14 = "dat";
          }
          unsigned int v15 = [v9 mType];
          int64_t v16 = "->C";
          if (v15 == 200) {
            int64_t v16 = "->W";
          }
          uint64_t v20 = v14;
          self = v13;
          [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d: %s %s %@ (%s)\n", (char *)i + v7, v20, v16, v12, v29)];
        }
        uint64_t v7 = (v7 + i);
        id v23 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v23);
    }
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    qword_10027CEF8 = (uint64_t)Mutable;
    if (Mutable)
    {
      CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v5);
      CFDictionarySetValue((CFMutableDictionaryRef)qword_10027CEF8, kCFUserNotificationDefaultButtonTitleKey, @"OK");
      CFDictionarySetValue((CFMutableDictionaryRef)qword_10027CEF8, kCFUserNotificationAlternateButtonTitleKey, @"Radar");
      SInt32 error = 0;
      BOOL v18 = CFUserNotificationCreate(kCFAllocatorDefault, 60.0, 0, &error, (CFDictionaryRef)qword_10027CEF8);
      qword_10027CF00 = (uint64_t)v18;
      if (!error)
      {
        if (v18)
        {
          qword_10027CF08 = (uint64_t)CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v18, (CFUserNotificationCallBack)sub_1000C86A8, 0);
          if (qword_10027CF08)
          {
            Main = CFRunLoopGetMain();
            CFRunLoopAddSource(Main, (CFRunLoopSourceRef)qword_10027CF08, kCFRunLoopDefaultMode);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s %d: Notification created", "-[WRM_HandoverManager showHOAlertUI:]", 2254);
          }
        }
      }
    }
  }
  if (qword_10027CF08) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = qword_10027CF00 == 0;
  }
  if (!v6)
  {
    CFRelease((CFTypeRef)qword_10027CF00);
    qword_10027CF00 = 0;
  }
  if (qword_10027CEF8)
  {
    CFRelease((CFTypeRef)qword_10027CEF8);
    qword_10027CEF8 = 0;
  }
}

- (void)setCTService:(id)a3
{
  self->mCTService = (WRM_CTService *)a3;
}

- (void)setSCService:(id)a3
{
  self->mSCService = (WRM_SCService *)a3;
}

- (id)getWiFiCallingController
{
  return self->mWiFiCalling;
}

- (id)getSymptomsService
{
  return self->mSymtomsService;
}

- (void)handleWiFiStateChaneEvents:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  byte_10027CEC1 = 0;
  if ([(WRM_HandoverManager *)self isRecentDevice]) {
    [(WRM_HandoverManager *)self evaluateWiFiVersusCell];
  }
  mSymtomsService = self->mSymtomsService;
  if (mSymtomsService) {
    [(WRM_SymptomsService *)mSymtomsService resetIMSMetrics];
  }
  +[WCM_Logging logLevel:24 message:@"Handover Manager received WiFi link state change event"];
  if (value)
  {
    int64_t int64 = xpc_dictionary_get_int64(value, "kWRM_WiFi_LINK_STATUS");
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    miRATClientContexts = self->miRATClientContexts;
    id v8 = [(NSMutableArray *)miRATClientContexts countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(miRATClientContexts);
          }
          -[WRM_HandoverManager setPingPongTimerMultipler:::](self, "setPingPongTimerMultipler:::", 1, [*(id *)(*((void *)&v23 + 1) + 8 * i) getMyClientType], 1);
        }
        id v9 = [(NSMutableArray *)miRATClientContexts countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }
    byte_10027CED9 = 0;
    if (int64)
    {
      dispatch_time_t v12 = dispatch_time(0, 2000000000);
      mQueue = self->mQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C8A98;
      block[3] = &unk_10020D980;
      void block[4] = self;
      dispatch_after(v12, mQueue, block);
      +[WCM_Logging logLevel:24 message:@"Handover Manager:Link down event received"];
      byte_10027CF2C = 1;
      dispatch_time_t v14 = dispatch_time(0, 2000000000);
      unsigned int v15 = self->mQueue;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000C8AA4;
      v21[3] = &unk_10020D980;
      v21[4] = self;
      dispatch_after(v14, v15, v21);
    }
    else
    {
      id v16 = [(WRM_HandoverManager *)self getCTService];
      if (v16)
      {
        BOOL v17 = v16;
        [v16 invalidateAudioQualityMetrics];
        [v17 initMovAverageOfSignalBar];
      }
      [(WRM_HandoverManager *)self toggleSAState:1];
      byte_10027CF2C = 0;
      int64_t v18 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_RSSI");
      int64_t v19 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_SNR");
      +[WCM_Logging logLevel:24 message:@"Handover Manager:Linkup event received"];
      uint64_t v20 = [(WCM_WiFiController *)self->mWiFi wifiService];
      [(WCM_WiFiService *)v20 setRSSI:v18];
      [(WCM_WiFiService *)v20 setSNR:v19];
      if ([(WRM_HandoverManager *)self isRecentDevice]) {
        [(WRM_HandoverManager *)self triggerHarvestDataEval];
      }
    }
    [(WRM_HandoverManager *)self evaluateHandover];
  }
  else
  {
    +[WCM_Logging logLevel:24 message:@"Handover Manager:Empty message received"];
  }
}

- (void)handleCellularLinkQualityUpdate:(id)a3
{
  +[WCM_Logging logLevel:24 message:@"Handover Manager received Cellular link metrics"];
  if ([(WRM_HandoverManager *)self handoverEvaluationRequired])
  {
    [(WRM_HandoverManager *)self evaluateHandover];
  }
}

- (void)handleLinkPrefSubscribe:(id)a3
{
  +[WCM_Logging logLevel:24 message:@"HandoverManager: handleIWLANRadioLinkPreferenceRequest."];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  id v7 = [(WRM_HandoverManager *)self getiRATClientFromList:uint64];
  if (uint64 == 1)
  {
    id v8 = "ClientCommCenter";
  }
  else if ((uint64 - 2) >= 0x14)
  {
    id v8 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      id v8 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    id v8 = (&off_100211010)[(int)uint64 - 2];
  }
  +[WCM_Logging logLevel:24, @"Message received from client %d(%s) ", uint64, v8 message];
  xpc_object_t v32 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  size_t count = xpc_array_get_count(v32);
  [v7 removeAllMobilityContextsFromList];
  +[WCM_Logging logLevel:24 message:@"Removing all contexts from iRAT client."];
  if (count)
  {
    id v28 = a3;
    double v29 = self;
    if (!self->mWiFi) {
      +[WCM_Logging logLevel:18 message:@"WiFi did not register, can't get state"];
    }
    size_t v10 = 0;
    int64_t int64 = 0;
    uint64_t v12 = 0;
    unsigned int v31 = uint64 - 1;
    BOOL v13 = &dword_10027CEEC;
    if (uint64 == 1) {
      BOOL v13 = &dword_10027CEE8;
    }
    double v30 = v13;
    do
    {
      dispatch_time_t v14 = v7;
      xpc_object_t v15 = xpc_array_get_value(v32, v10);
      uint64_t v16 = xpc_dictionary_get_uint64(v15, "kWRMApplicationType");
      uint64_t v17 = xpc_dictionary_get_uint64(v15, "kWRMDesiredLinkQoS");
      uint64_t v18 = xpc_dictionary_get_uint64(v15, "kWRMDesiredBandwidth");
      if (xpc_dictionary_get_value(v15, "kWRMSubscribeSlotInfo")) {
        uint64_t v19 = xpc_dictionary_get_uint64(v15, "kWRMSubscribeSlotInfo") + 1;
      }
      else {
        uint64_t v19 = 1;
      }
      xpc_object_t v20 = xpc_dictionary_get_value(v15, "kWRMPolicyInfo");
      if (v20)
      {
        objc_super v21 = v20;
        int64_t int64 = xpc_dictionary_get_int64(v20, "kWRMPolicyInfoHoAlgorithmType");
        uint64_t v12 = xpc_dictionary_get_uint64(v21, "kWRMPolicyInfoServiceType");
        if (v31 <= 1) {
          *double v30 = int64;
        }
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s: Record#= %d Application Type=%llu, LinkQoS=%llu, Bandwidth=%llu,Service Status=%llu AlgorithmType=%d, ServiceType=%llu", "-[WRM_HandoverManager handleLinkPrefSubscribe:]", v10, v16, v17, v18, 0, int64, v12);
      uint64_t v22 = objc_alloc_init(WRM_Mobility_Context);
      [(WRM_Mobility_Context *)v22 setLinkQoS:v17];
      [(WRM_Mobility_Context *)v22 setBandwidth:v18];
      [(WRM_Mobility_Context *)v22 setMappedApplicationType:v16 :v12];
      [(WRM_Mobility_Context *)v22 activateMobilityContext:1];
      id v7 = v14;
      [v14 addMobilityContextToList:v22];

      ++v10;
    }
    while (count != v10);
    [v14 setActiveSlot:v19];
    if (MGGetBoolAnswer() && qword_10027CEE0)
    {
      +[WCM_Logging logLevel:24 message:@"handleLinkPrefSubscribe: Use internal UI iRAT policy"];
      long long v23 = v29;
      int64_t int64 = [(WRM_HandoverManager *)v29 convertToHOAlgorithmType:qword_10027CEE0];
    }
    else
    {
      long long v23 = v29;
      if (![(WRM_iRATConfig *)v29->miRATConfig handoverAlgorithmSettingDynamic]) {
        int64_t int64 = [(WRM_iRATConfig *)v29->miRATConfig handoverAlgorithmType];
      }
    }
    [v14 setHandoverAlgorithmType:int64];
    [(WRM_HandoverManager *)v23 setIWLANServiceType:v12];
    if ([v14 isStatusUpdateMsgBuffered])
    {
      +[WCM_Logging logLevel:24 message:@"Processing buffered status update message"];
      [(WRM_HandoverManager *)v23 handleSubscribeStatusUpdate:v28 :0];
    }
    if ([v14 isCallActive])
    {
      id v25 = [v14 getMobilityContextFromList:[v14 getBufferedAppType]];
      if (v25)
      {
        long long v26 = v25;
        if (byte_10027CF25) {
          [v25 setConnectedLinkType:1];
        }
        [v26 setCallState:1];
        +[WCM_Logging logLevel:24 message:@"HandoverManager: Update call status becuase CT subscribed in the middle of call"];
      }
    }
    [v14 postiRATNotificationToEnableDisableCellData:1 :1];
    [v14 postiRATNotificationToEnableDisableCellData:0 :1];
    id v27 = [v14 getMobilityContextFromList:1];
    [v27 setConnectedLinkType:0];
  }
  else if ([(WRM_iRATConfig *)self->miRATConfig mobilityStateAwarenessEnabled])
  {
    mMotionController = self->mMotionController;
    [(WRM_MotionController *)mMotionController stopAllAlarms];
  }
}

- (void)handleSubscribeStatusUpdate:(id)a3 :(BOOL)a4
{
  BOOL v4 = a4;
  [self getWiFiCallingController].resetRTPMetrics;
  id v7 = [(WCM_WiFiController *)self->mWiFi wifiService];
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  id v9 = [(WRM_HandoverManager *)self getiRATClientFromList:uint64];
  dword_10027CF28 = uint64;
  size_t v10 = WRM_MotionController;
  if ((uint64 - 1) >= 0x15)
  {
    id v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      id v11 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    id v11 = (&off_1002110B0)[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:24, @"HandoverManager: Message received from client %d(%s)", uint64, v11 message];
  if (v4)
  {
    xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
    xpc_object_t v13 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
    size_t count = xpc_array_get_count(v13);
    if (count)
    {
      size_t v15 = count;
      for (size_t i = 0; i != v15; ++i)
      {
        xpc_object_t v17 = xpc_array_get_value(v13, i);
        uint64_t v18 = xpc_dictionary_get_uint64(v17, "kWRMApplicationType");
        uint64_t v19 = xpc_dictionary_get_uint64(v17, "kWRMLinkType");
        uint64_t v20 = xpc_dictionary_get_uint64(v17, "kWRMServiceStatus");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s: Record#=%d, Application Type=%llu, Link Type=%llu Service Status %d ", "-[WRM_HandoverManager handleSubscribeStatusUpdate::]", i, v18, v19, v20);
      }
      size_t v10 = WRM_MotionController;
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v19 = 2;
      uint64_t v18 = 1;
    }
    [v9 setStatusUpdateMsgBuffered:1];
    [v9 setBufferedLinkType:v19];
    if (v18 == 1 && (id)[(WRM_iRATConfig *)self->miRATConfig ctServiceType] == (id)2)
    {
      CFStringRef v23 = @"handleSubscribeStatusUpdate changing mapped application type to CT_Thumper";
      uint64_t v18 = 2;
    }
    else
    {
      CFStringRef v23 = @"handleSubscribeStatusUpdate using application type CT_VoLTE";
    }
    [&v10[50] logLevel:24 message:v23];
    [v9 setBufferedAppType:v18];
    [v9 setCallState:v20 != 0];
    if (([v9 isCallActive] & 1) == 0)
    {
      byte_10027CED9 = 0;
      [WRM_HandoverManager getCTService(self) setSrvccHandoverState:0];
    }
    if ([v9 isCallActive] && objc_msgSend(v9, "getBufferedLinkType") == 1)
    {
      byte_10027CF25 = 1;
      [(WRM_HandoverManager *)self triggerEnableSA:0];
      [(WRM_SymptomsService *)self->mSymtomsService notifyWifiCallState:1];
      [(WCM_WiFiService *)v7 setWiFiCallingState:1];
      if ([(WRM_iRATConfig *)self->miRATConfig mobilityStateAwarenessEnabled])
      {
        [(WRM_MotionController *)self->mMotionController stopAllAlarms];
        [(WRM_MotionController *)self->mMotionController startMonitoringAlarms];
      }
      CFStringRef v24 = @"HandoverManager: handleSubscribeStatusUpdate: Call on WiFi";
    }
    else
    {
      if ([(WRM_iRATConfig *)self->miRATConfig mobilityStateAwarenessEnabled]) {
        [(WRM_MotionController *)self->mMotionController stopAllAlarms];
      }
      [(WRM_SymptomsService *)self->mSymtomsService notifyWifiCallState:0];
      [(WCM_WiFiService *)v7 setWiFiCallingState:0];
      byte_10027CF25 = 0;
      CFStringRef v24 = @"HandoverManager: handleSubscribeStatusUpdate:Call not on WIFI";
    }
    [&v10[50] logLevel:24 message:v24];
    [&v10[50] logLevel:24 message:@"HandoverManager: handleSubscribeStatusUpdate."];
    id v25 = [v9 getMobilityContextFromList:v18];
    if (v25)
    {
      long long v26 = v25;
      unsigned int v27 = [v25 getCallState];
      [v26 setCallState:v20 != 0];
      [v26 setRecommendedLinkType:v19];
      if (!v20 && v27)
      {
        id v28 = v10 + 50;
        if (v19)
        {
          [(__objc2_class *)v28 logLevel:24 message:@"Handover Manager: evaluateActiveCallQuality"];
          [(WRM_HandoverManager *)self evaluateActiveCallQuality];
        }
        else
        {
          [(__objc2_class *)v28 logLevel:24 message:@"Handover Manager:  do not evaluateActiveCallQuality"];
        }
      }
      if (v20 != v27)
      {
        [&v10[50] logLevel:24 message:@"Handover Manager: resetActiveCallEvaluationMetrics"];
        [(WRM_HandoverManager *)self resetActiveCallEvaluationMetrics];
      }
    }
  }
  else
  {
    id v21 = [v9 getMobilityContextFromList:[v9 getBufferedAppType]];
    if (v21)
    {
      uint64_t v22 = v21;
      [v21 setConnectedLinkType:[v9 getBufferedLinkType]];
      [v22 setCallState:[v9 isCallActive]];
      [v9 setStatusUpdateMsgBuffered:0];
      +[WCM_Logging logLevel:24 message:@"HandoverManager: handleSubscribeStatusUpdate."];
    }
  }
}

- (void)configureRTPMetricsReporting
{
  mWiFiCalling = self->mWiFiCalling;
  if (mWiFiCalling)
  {
    [(WRM_AVConferenceController *)mWiFiCalling configureRTPMetricsReporting];
    BOOL v4 = self->mWiFiCalling;
    [(WRM_AVConferenceController *)v4 resetPeriodicRTPStats];
  }
}

- (void)handleSIPStalledMetricsRecevied:(id)a3
{
  +[WCM_Logging logLevel:24 message:@"handleSIPStalledMetricsRecevied"];
  if (self->mSymtomsService)
  {
    +[WCM_Logging logLevel:16 message:@"handleSIPStalledMetricsRecevied, update SIP Stalled"];
    [(WRM_SymptomsService *)self->mSymtomsService updateSIPMetrics:1];
    [(WRM_HandoverManager *)self evaluateHandover];
    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    mQueue = self->mQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C95D0;
    block[3] = &unk_10020D980;
    void block[4] = self;
    dispatch_after(v4, mQueue, block);
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"handleSIPMetricsRecevied-> mSymtomsService not init"];
  }
}

- (void)handleSIPMetricsRecevied:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    BOOL v5 = value;
    if (xpc_dictionary_get_value(value, "kRegtdLinkType")) {
      uint64_t uint64 = xpc_dictionary_get_uint64(v5, "kRegtdLinkType");
    }
    else {
      uint64_t uint64 = 0;
    }
    if (xpc_dictionary_get_value(v5, "kSipTmo")) {
      BOOL v7 = xpc_dictionary_get_BOOL(v5, "kSipTmo");
    }
    else {
      BOOL v7 = 0;
    }
    if (uint64)
    {
      if (self->mSymtomsService)
      {
        +[WCM_Logging logLevel:16, @"handleSIPMetricsRecevied, update SIP TMO: %d", v7 message];
        [(WRM_SymptomsService *)self->mSymtomsService updateSIPMetrics:v7];
      }
      else
      {
        +[WCM_Logging logLevel:16 message:@"handleSIPMetricsRecevied-> mSymtomsService not init"];
      }
    }
    +[WCM_Logging logLevel:24, @"handleSIPMetricsRecevied, sip TMO:%d, connected link: %d", v7, uint64 message];
    [(WRM_HandoverManager *)self evaluateHandover];
    if (v7)
    {
      dispatch_time_t v8 = dispatch_time(0, 20000000000);
      mQueue = self->mQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C97E4;
      block[3] = &unk_10020D980;
      void block[4] = self;
      dispatch_after(v8, mQueue, block);
    }
  }
  else
  {
    +[WCM_Logging logLevel:24, @"handleSIPMetricsRecevied, sip TMO:%d, connected link: %d", 0, 0 message];
    [(WRM_HandoverManager *)self evaluateHandover];
  }
}

- (void)handleIWLANMetrics:(id)a3
{
  unsigned int v5 = [(WRM_HandoverManager *)self isDeviceConnectedOverNonLTERadio];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    BOOL v7 = value;
    if (xpc_dictionary_get_value(value, "kTunnelDisconnected"))
    {
      int64_t int64 = xpc_dictionary_get_int64(v7, "kTunnelDisconnected");
      +[WCM_Logging logLevel:16, @"handleIWLANMetrics reasonCode: %d, checkIfServingCellNonLTE: %d", int64, v5 message];
      if (int64 == 1) {
        uint64_t v9 = v5 ^ 1;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      +[WCM_Logging logLevel:16 message:@"handleIWLANMetrics empty message recevied, no WRMiWLANMetricsReport_TunnelDisconnected"];
      uint64_t v9 = 0;
    }
    mSymtomsService = self->mSymtomsService;
    if (mSymtomsService) {
      [(WRM_SymptomsService *)mSymtomsService updateDPDMetrics:v9];
    }
    else {
      +[WCM_Logging logLevel:16 message:@"handleIWLANMetrics-> mSymtomsService not init"];
    }
    +[WCM_Logging logLevel:24, @"Recevied handleIWLANMetrics, dpd:%d", v9 message];
    [(WRM_HandoverManager *)self evaluateHandover];
    if (v9)
    {
      dispatch_time_t v11 = dispatch_time(0, 20000000000);
      mQueue = self->mQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C9A04;
      block[3] = &unk_10020D980;
      void block[4] = self;
      dispatch_after(v11, mQueue, block);
    }
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"handleIWLANMetrics empty message recevied, ccDpdMetrics is null"];
    +[WCM_Logging logLevel:24, @"Recevied handleIWLANMetrics, dpd:%d", 0 message];
    [(WRM_HandoverManager *)self evaluateHandover];
  }
}

- (void)handleIPTelephonyMetrics:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    unsigned int v5 = value;
    BOOL v6 = xpc_dictionary_get_value(value, "WRMIPTelephonyEventReport_CallStatus")
      && xpc_dictionary_get_uint64(v5, "WRMIPTelephonyEventReport_CallStatus") != 0;
    BOOL v7 = xpc_dictionary_get_value(v5, "WRMIPTelephonyEventReport_LocalHold")
      && xpc_dictionary_get_uint64(v5, "WRMIPTelephonyEventReport_LocalHold") != 0;
    BOOL v8 = xpc_dictionary_get_value(v5, "WRMIPTelephonyEventReport_RemoteHold")
      && xpc_dictionary_get_uint64(v5, "WRMIPTelephonyEventReport_RemoteHold") != 0;
    BOOL v9 = xpc_dictionary_get_value(v5, "WRMIPTelephonyEventReport_Conference")
      && xpc_dictionary_get_uint64(v5, "WRMIPTelephonyEventReport_Conference") != 0;
    +[WCM_Logging logLevel:24, @"Received IP Telephony Event , Call Status=%ld, Local Hold Enabled=%d Remote Hold Enabled=%d,Conference Enabled=%d ", v6, v7, v8, v9 message];
    id v10 = [(WRM_HandoverManager *)self getCTService];
    if (v10)
    {
      dispatch_time_t v11 = v10;
      [v10 setCallState:v6];
      [v11 setCallInConference:v9];
      [v11 setCallOnHold:v7 | v8];
      if (v6)
      {
        [(WRM_HandoverManager *)self resetActiveCallTimer];
      }
    }
  }
}

- (void)handlePeriodicRTPMetrics:(id)a3
{
  id v4 = [[-[WRM_HandoverManager getCTService](self, "getCTService", a3) getCallState];
  unsigned int v5 = [(WCM_WiFiController *)self->mWiFi wifiService];
  +[WCM_Logging logLevel:24 message:@"Handover Manager received filtered RTP netrics"];
  if (v4 == 1)
  {
    if (byte_10027CF25)
    {
      id v6 = [(WRM_HandoverManager *)self getWiFiCallingController];
      self->wrmWifiCallingEnd->Latte_RTP_Packet_Loss = [v6 avgRxPktLoss];
      self->wrmWifiCallingEnd->WiFi_RSSI = [(WCM_WiFiService *)v5 getRSSI];
      self->wrmWifiCallingEnd->WiFi_SINR = [(WCM_WiFiService *)v5 getSNR];
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"Rx periodic Average RTP packet loss=%lld", [v6 avgRxPktLoss]);
      double v7 = (double)(unint64_t)[v6 erasuresInSpeech] * 100.0;
      self->wrmWifiCallingEnd->Latte_Erasures = (v7
                                                             / ((double)(unint64_t)[v6 totalPlayBacks]+ 0.000001));
      self->wrmWifiCallingEnd->Latte_Nominal_Jitter_Buffer_Size = [v6 movAvgNominalJitterBufferDelay];
      self->wrmWifiCallingEnd->Latte_Dejitter_Buffer_Underflow = [v6 averagedNominalJitterBufferDelay];
      [(WRM_HandoverManager *)self evaluateHandover];
      [v6 resetRTPMetrics];
    }
    else
    {
      +[WCM_Logging logLevel:24 message:@"handlePeriodicRTPMetrics: discard RTP metrics, call not on WiFi"];
    }
  }
  else
  {
    +[WCM_Logging logLevel:24, @"handlePeriodicRTPMetrics: discard WIFI RTP metrics, call not active, call state: %d", v4 message];
  }
}

- (BOOL)isWiFiLinkActive
{
  return 0;
}

- (void)registerForCTNotifications
{
  if (self->mCTService)
  {
    +[WCM_Logging logLevel:24 message:@"CT already registered."];
  }
  else if ([(WRM_HandoverManager *)self isEnhancedCTServiceNeeded])
  {
    BOOL v3 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
    self->mCTService = v3;
    [(WRM_CTService *)v3 initCoreTelephonyClient];
  }
  else
  {
    self->mCTService = (WRM_CTService *)+[WRM_CTService WRM_CTServiceControllerSingleton];
  }
  mCTService = self->mCTService;

  [(WRM_CTService *)mCTService tiggerEnhanceLQMConfiguration];
}

- (void)registerForSCNotifications
{
  if (self->mSCService)
  {
    +[WCM_Logging logLevel:24 message:@"SC already registered."];
  }
  else
  {
    self->mSCService = (WRM_SCService *)+[WRM_SCService WRM_SCServiceControllerSingleton];
  }
}

- (void)sendMessage:(int)a3 withMsg:(id)a4
{
  id v5 = [[+[WCM_Server singleton](WCM_Server, "singleton") getSessionFor:a3];

  [v5 sendMessage:a4];
}

- (void)setHOAlertUI:(BOOL)a3
{
  byte_10027CF26 = a3;
}

- (int)convertToHOAlgorithmType:(unint64_t)a3
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

- (void)setiRATPolicy:(unint64_t)a3
{
  mQueue = self->mQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C9FC0;
  v4[3] = &unk_10020DB90;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(mQueue, v4);
}

- (void)resetActiveCallEvaluationMetrics
{
  +[WCM_Logging logLevel:24 message:@"resetActiveCallEvaluationMetrics"];
  [(NSDate *)self->mAudioEvaluationTimer timeIntervalSinceNow];
  self->mTimeSinceAudioEvaluationStarted = v3;
  id v4 = [(WRM_HandoverManager *)self getWiFiCallingController];
  mWiFsize_t i = self->mWiFi;
  if (mWiFi && (mWiFsize_t i = [(WCM_WiFiController *)mWiFi wifiService]) == 0)
  {
    +[WCM_Logging logLevel:24 message:@"resetActiveCallEvaluationMetrics: ptrWiFiService==NULL"];
  }
  else
  {
    [(WCM_WiFiController *)mWiFi resetCumulativeCounters];
    [v4 resetCumulativeRTPMetrics];
  }
  byte_10027CED8 = 0;

  +[WCM_Logging logLevel:24 message:@"resetActiveCallEvaluationMetrics: exit"];
}

- (void)setPingPongTimerMultipler:(unint64_t)a3 :(int)a4 :(unint64_t)a5
{
  id v6 = [[-[WRM_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", *(void *)&a4)) getMobilityContextFromList:a5];

  [v6 setPingPongAvoidanceTimerMultiplier:a3];
}

- (void)resetActiveCallTimer
{
  [(NSDate *)self->mLatteContextStartedTimer timeIntervalSinceNow];
  self->mTimeSinceLatteContextStarted = v3;
}

- (void)setIWLANServiceType:(int)a3
{
  if (a3 == 2) {
    byte_10027CF24 = 1;
  }
}

- (void)feedAWDDataLinkPreferenceChange:(int)a3
{
  id v5 = [(WCM_WiFiController *)self->mWiFi wifiService];
  id v6 = [(WRM_HandoverManager *)self getCTService];
  id v7 = [(WRM_HandoverManager *)self getSCService];
  id v8 = [[-[WRM_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", 1) getMobilityContextFromList:1];
  unsigned int v9 = [v8 getCallState];
  unsigned int v10 = [v8 getConnectedLinkType];
  unsigned int v11 = [[-[WRM_HandoverManager getMotionController](self) getMobilityState];
  if (self->mMetrics)
  {
    mDataLinkPrefMetrics = self->mDataLinkPrefMetrics;
    mDataLinkPrefMetrics->callStatus = v9;
    mDataLinkPrefMetrics->dataLinkPref = a3;
    mDataLinkPrefMetrics->voiceLinkPref = v10;
    mDataLinkPrefMetrics->motionState = v11;
    mDataLinkPrefMetrics->dataAppStatus = 0;
    unsigned int v13 = [v7 isDataLQMValid];
    int v14 = 0;
    if (v13) {
      int v14 = [v7 getCellularDataLQM];
    }
    self->mDataLinkPrefMetrics->dataLQM = v14;
    unsigned int v15 = [v6 isVoiceLQMValid];
    if (v15) {
      unsigned int v15 = [v6 getLteVoiceLQM];
    }
    self->mDataLinkPrefMetrics->voiceLQM = v15;
    if ([v6 getServingCellType] == 1)
    {
      self->mDataLinkPrefMetrics->ratType = (NSString *)@"LTE_RADIO";
      [v6 getServingCellRSRP];
      self->mDataLinkPrefMetrics->cellRSRP = (uint64_t)v16;
      [v6 getServingCellSNR];
    }
    else
    {
      unsigned int v18 = [v6 getServingCellType];
      uint64_t v19 = self->mDataLinkPrefMetrics;
      if (v18 != 2)
      {
        v19->ratType = (NSString *)@"UNKNOWN_RADIO";
        goto LABEL_12;
      }
      v19->ratType = (NSString *)@"UMTS_RADIO";
      [v6 getServingCellRSCP];
      self->mDataLinkPrefMetrics->cellRSRP = (uint64_t)v20;
      [v6 getServingCellECIO];
    }
    self->mDataLinkPrefMetrics->cellSINR = (uint64_t)v17;
LABEL_12:
    self->mDataLinkPrefMetrics->signalBar = [v6 getCurrentSignalBars];
    self->mDataLinkPrefMetrics->wifiRsssize_t i = (int)[(WCM_WiFiService *)v5 getRSSI];
    self->mDataLinkPrefMetrics->wifiSNR = (int)[(WCM_WiFiService *)v5 getSNR];
    [(WCM_WiFiService *)v5 getBeaconPer];
    self->mDataLinkPrefMetrics->bcnPer = (int)(v21 * 100.0);
    self->mDataLinkPrefMetrics->cca = [(WCM_WiFiService *)v5 getCCA];
    self->mDataLinkPrefMetrics->qbssLoad = [(WCM_WiFiService *)v5 getChannelUtlization];
    self->mDataLinkPrefMetrics->stationCount = [(WCM_WiFiService *)v5 getConnectedStationCount];
    [(WCM_WiFiService *)v5 getEstimatedAvailableRxPhyBandwidth];
    self->mDataLinkPrefMetrics->wifiEstimatedBandwitdh = (int)v22;
    [(WCM_WiFiService *)v5 getRxPhyRate];
    self->mDataLinkPrefMetrics->wifiRxPhyRate = (int)v23;
    [(WCM_WiFiService *)v5 getRxRetryPercent];
    self->mDataLinkPrefMetrics->wifiRxRetry = (int)v24;
    [(WCM_WiFiService *)v5 getTxPer];
    self->mDataLinkPrefMetrics->wifiTxPER = (int)v25;
    [(WCM_WiFiService *)v5 getTxPhyRate];
    self->mDataLinkPrefMetrics->wifiTxPhyRate = v26;
    self->mDataLinkPrefMetrics->captiveNetworks = [(WCM_WiFiService *)v5 isWiFiNetworkCaptive];
    self->mDataLinkPrefMetrics->bssLoad = [(WCM_WiFiService *)v5 getPointOfInterest];
    self->mDataLinkPrefMetrics->decisionVIBE = [(WCM_WiFiService *)v5 getBEDecision];
    self->mDataLinkPrefMetrics->decisionVO = [(WCM_WiFiService *)v5 getVoiceDecision];
    self->mDataLinkPrefMetrics->expectedThroughputVIBE = [(WCM_WiFiService *)v5 getTxThroughputVI];
    self->mDataLinkPrefMetrics->packetLifetimeVIBE = [(WCM_WiFiService *)v5 getLifeTimeVI];
    self->mDataLinkPrefMetrics->pkgLifeTimeVO = [(WCM_WiFiService *)v5 getLifeTimeVO];
    unsigned int v27 = [(WCM_WiFiService *)v5 getTxLossRateVO];
    id v28 = self->mDataLinkPrefMetrics;
    v28->pktLossRateVO = v27;
    v28->lqmScoreWifsize_t i = a3 == 1;
    v28->metricsUpdate = 1;
  }
}

- (void)submitDataLinkPreferenceMetrics:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->mDataLinkPrefMetrics->metricsUpdate)
  {
    +[WCM_Logging logLevel:24 message:@"submitDataLinkPreferenceMetrics::submitDataLinkPreferenceaMetrics"];
    [self->mMetrics getAWDService] submitDataLinkPreferenceaMetrics];
  }
  else
  {
    +[WCM_Logging logLevel:24 message:@"submitDataLinkPreferenceMetrics::feedAWDDataLinkPreferenceChange"];
  }

  [(WRM_HandoverManager *)self feedAWDDataLinkPreferenceChange:v3];
}

- (void)submitCallEndMetics
{
  [(WRM_HandoverManager *)self feedAWDCallEndStats];
  id v3 = [(WRM_MetricsService *)self->mMetrics getAWDService];

  [v3 submitMetricWiFiCallingEnd];
}

- (void)feedAWDCallEndStats
{
  id v3 = [(WCM_WiFiController *)self->mWiFi wifiService];
  unsigned int v4 = [[-[WRM_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", dword_10027CF28) getMobilityContextFromList:1] getRecommenedLinkType];
  if (self->mMetrics)
  {
    unsigned int v5 = v4;
    self->wrmWifiCallingEnd->HO_Capability = byte_10027CF24;
    if ([(WCM_WiFiService *)v3 isBeaconPerValid])
    {
      [(WCM_WiFiService *)v3 getBeaconPer];
      unsigned int v7 = (v6 * 100.0);
    }
    else
    {
      unsigned int v7 = 0;
    }
    self->wrmWifiCallingEnd->Beacon_Rate = v7;
    if ([(WCM_WiFiService *)v3 isTxPerValid])
    {
      [(WCM_WiFiService *)v3 getTxPer];
      unsigned int v9 = (v8 * 100.0);
    }
    else
    {
      unsigned int v9 = 0;
    }
    self->wrmWifiCallingEnd->WiFi_TxPER = v9;
    self->wrmWifiCallingEnd->BSS_Load = [(WCM_WiFiService *)v3 getCCA];
    unsigned __int8 v10 = [(WCM_WiFiService *)v3 isWiFiNetworkCaptive];
    wrmWifiCallingEnd = self->wrmWifiCallingEnd;
    wrmWifiCallingEnd->Captive_Network = v10;
    wrmWifiCallingEnd->iWLAN_Status = v5 == 1;
    self->wrmWifiCallingEnd->WOW_Enabled = [(WCM_WiFiService *)v3 isWoWEnabled];
    id v12 = [(WRM_HandoverManager *)self getCTService];
    id v13 = [(WRM_HandoverManager *)self getSCService];
    int v14 = [v12 isVoiceLQMValid];
    if (v14) {
      int v14 = [v12 getLteVoiceLQM];
    }
    self->wrmWifiCallingEnd->LTE_Voice_LQM = v14;
    int v15 = [v13 isDataLQMValid];
    if (v15) {
      int v15 = [v13 getCellularDataLQM];
    }
    self->wrmWifiCallingEnd->LTE_Data_LQM = v15;
    [v12 getServingCellRSRP];
    self->wrmWifiCallingEnd->LTE_RSRP = (int)v16;
    self->wrmWifiCallingEnd->LTE_Signal_bar = [v12 getCurrentSignalBars];
    [v12 getServingCellSNR];
    unsigned int v18 = self->wrmWifiCallingEnd;
    v18->LTE_SINR = v17;
    CFStringRef v19 = @"Cellular";
    if (v5 == 1) {
      CFStringRef v19 = @"WiFi";
    }
    v18->WRM_Recommended_RAT = &v19->isa;
    +[WCM_Logging logLevel:24, @"HandoverManager: feedAWDCallEndStats RAT  %@, WiFi_RSSI: %d LTE_RSRP: %d iWLAN Status: %d LTE_Voice_LQM: %d, Latte_RTP_Packet_Loss: %d,Latte_Erasures: %d,Latte_Nominal_Jitter_Buffer_Size: %d, Latte_Nominal_Jitter_BufferCall: %d, SNR: %d,Signal BARS:%d", v19, v18->WiFi_RSSI, v18->LTE_RSRP, v18->iWLAN_Status, v18->LTE_Voice_LQM, v18->Latte_RTP_Packet_Loss, v18->Latte_Erasures, v18->Latte_Nominal_Jitter_Buffer_Size, v18->Latte_Dejitter_Buffer_Underflow, v17, v18->LTE_Signal_bar message];
  }
}

- (void)updateAVCRTPMetric:(unint64_t)a3
{
}

- (void)createSymptomsService
{
  if (self->mSymtomsService)
  {
    +[WCM_Logging logLevel:24 message:@"iRAT: SymptomsService already exist."];
    mSymtomsService = self->mSymtomsService;
    [(WRM_SymptomsService *)mSymtomsService resetSFContext];
  }
  else
  {
    self->mSymtomsService = objc_alloc_init(WRM_SymptomsService);
    +[WCM_Logging logLevel:24 message:@"iRAT: SymptomsService created."];
  }
}

- (void)createIBIClient
{
  if (![(WRM_HandoverManager *)self disableICEClient] && !self->mIBIClient)
  {
    self->mIBIClient = objc_alloc_init(WRM_IceClientDriver);
    +[WCM_Logging logLevel:24 message:@"iRAT: ICE client is created."];
  }
}

- (void)createQMIClient
{
  if ([(WRM_HandoverManager *)self disableQMIClient]) {
    return;
  }
  if (self->mQMINasClientPrimary)
  {
    CFStringRef v3 = @"iRAT: QMI NAS Primary client already exist.";
  }
  else
  {
    unsigned int v4 = [[WRM_QMINasClient alloc] initWithSub:1];
    self->mQMINasClientPrimary = v4;
    if (!v4) {
      goto LABEL_7;
    }
    CFStringRef v3 = @"iRAT: QMI NAS Primary client is created.";
  }
  +[WCM_Logging logLevel:24 message:v3];
LABEL_7:
  if (![(WRM_HandoverManager *)self isRecentDevice]) {
    return;
  }
  if (self->mQMINasClientSecondary)
  {
    CFStringRef v5 = @"iRAT: QMI NAS Secondary client already exist.";
LABEL_12:
    +[WCM_Logging logLevel:24 message:v5];
    goto LABEL_13;
  }
  double v6 = [[WRM_QMINasClient alloc] initWithSub:2];
  self->mQMINasClientSecondary = v6;
  if (v6)
  {
    CFStringRef v5 = @"iRAT: QMI NAS Secondary client is created.";
    goto LABEL_12;
  }
LABEL_13:
  if (self->mQMIDsdClientPrimary)
  {
    CFStringRef v7 = @"iRAT: QMI DSD Primary client already exist.";
  }
  else
  {
    double v8 = [[WRM_QMIDsdClient alloc] initWithSub:1];
    self->mQMIDsdClientPrimary = v8;
    if (!v8) {
      return;
    }
    CFStringRef v7 = @"iRAT: QMI DSD Primary client is created.";
  }

  +[WCM_Logging logLevel:24 message:v7];
}

- (void)notifyBBVoIPState:(unsigned __int8)a3 :(unsigned __int8)a4 :(unsigned __int8)a5 :(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  uint64_t v9 = a3;
  if ([(WRM_HandoverManager *)self isQmiSdmSupported])
  {
    [(WRM_QMINasClient *)self->mQMINasClientPrimary notifyBBCallState:v9 :v8 :v7 :v6];
  }
  else if ([(WRM_HandoverManager *)self isIbiSdmSupported])
  {
    [(WRM_IceClientDriver *)self->mIBIClient notifyBBCallState:1 :v9 :v8 :v7 :v6];
  }
  id v11 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];

  [v11 updateCallState:v8];
}

- (void)notifyDuplicationState:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if ([(WRM_HandoverManager *)self isQmiSdmSupported])
  {
    mQMINasClientPrimary = self->mQMINasClientPrimary;
    [(WRM_QMINasClient *)mQMINasClientPrimary notifyFTDupelicationState:v3];
  }
  else if ([(WRM_HandoverManager *)self isIbiSdmSupported])
  {
    mIBIClient = self->mIBIClient;
    -[WRM_IceClientDriver notifyFTDupelicationState::](mIBIClient, "notifyFTDupelicationState::", 1);
  }
}

- (BOOL)isCallActive
{
  return byte_10027CF11;
}

- (void)postWRMStateToBB
{
  if (byte_10027CD00 != 2) {
    [(WRM_HandoverManager *)self setBBSAState:byte_10027CD00 != 0];
  }

  +[WCM_Logging logLevel:24 message:@"postWRMStateToBB"];
}

- (void)evalSAStatusWiFiCallCallingPrefChanged
{
  +[WCM_Logging logLevel:26 message:@"evalSAStatusWiFiCallCallingPrefChanged "];
  if (self->mSCService)
  {
    dispatch_time_t v3 = dispatch_time(0, 2000000000);
    mQueue = self->mQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CAD70;
    block[3] = &unk_10020D980;
    void block[4] = self;
    dispatch_after(v3, mQueue, block);
  }
}

- (void)evalSAStateSlice
{
  +[WCM_Logging logLevel:26 message:@"evalSAStateSlice "];
  mSCService = self->mSCService;
  if (mSCService)
  {
    BOOL v4 = [(WRM_SCService *)mSCService isWiFiPrimary];
    [(WRM_HandoverManager *)self toggleSAState:v4];
  }
}

- (void)lowPowerModePeriodicWakeUp
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  miRATClientContexts = self->miRATClientContexts;
  id v3 = [(NSMutableArray *)miRATClientContexts countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (size_t i = 0; i != v4; size_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(miRATClientContexts);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v7 isLowPowerModePeriodicWakeUpNotificationSubscribed]) {
          [v7 notifylowPowerModePeriodicWakeUp];
        }
      }
      id v4 = [(NSMutableArray *)miRATClientContexts countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)isSaAllowedOnWiFiAssociation:(int64_t)a3
{
  id v4 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];

  return [v4 isSaAllowedOnWiFiAssociation:a3];
}

- (id)getQmiClientForSim:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = 80;
    return *(Class *)((char *)&self->super.isa + v3);
  }
  if (a3 == 2)
  {
    uint64_t v3 = 88;
    return *(Class *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (id)getIbiClient
{
  return self->mIBIClient;
}

@end