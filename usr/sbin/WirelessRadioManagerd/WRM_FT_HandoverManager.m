@interface WRM_FT_HandoverManager
+ (id)WRM_FT_HandoverManagerSingleton;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)canCellularMeetApplicationRequirement:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6 :(BOOL)a7;
- (BOOL)canWiFiMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5;
- (BOOL)canWiFiMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5;
- (BOOL)canWiFiRadioMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5;
- (BOOL)canWiFiRadioMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5;
- (BOOL)canWiFiTransportMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5;
- (BOOL)canWiFiTransportMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5;
- (BOOL)doesIRATClientSubscriptionContextExist;
- (BOOL)enableiRATManager;
- (BOOL)handoverEvaluationRequired;
- (BOOL)isAVCFaceTimeCallActive;
- (BOOL)isCellularEntryCriteriaMetForFaceTimeCallCurrentLinkWiFi;
- (BOOL)isCellularExitCriteriaMetForFaceTimeCallCurrentLinkCellular;
- (BOOL)isCellularRadioMetricsGoodEnoughForIMSVoIP:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6;
- (BOOL)isMovingAverageDownlinkAudioQualityOfCurrentCallGood:(int)a3;
- (BOOL)isMovingAverageUplinkAudioQualityOfCurrentCallGood:(int)a3;
- (BOOL)isVideoQualityGood:(int)a3;
- (BOOL)isWiFiArqQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6;
- (BOOL)isWiFiBeaconLossQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(int)a5;
- (BOOL)isWiFiDataRateIndicatorGoodForFaceTime:(unint64_t)a3 :(int)a4;
- (BOOL)isWiFiLinkActive;
- (BOOL)isWiFiLinkEvaluationDesired;
- (BOOL)isWiFiLoadQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6;
- (BOOL)isWiFiVoIPQualityGoodEnough;
- (BOOL)needWiFiLQM;
- (WRM_FT_HandoverManager)autorelease;
- (WRM_FT_HandoverManager)init;
- (id)getAVConferenceController;
- (id)getCTService;
- (id)getQueue;
- (id)getSCService;
- (id)getWiFiController;
- (id)getiRATClientFromList:(int)a3;
- (id)getiRATConfigController;
- (int)evaluateLink:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6;
- (int)evaluateLinkWiFiPreferred:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6;
- (int64_t)getRSSIHysteresis;
- (int64_t)getSNRHysteresis;
- (unint64_t)retainCount;
- (unsigned)faceTimeCallType;
- (void)addiRatClient:(id)a3;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)configureIDSMetricsReporting;
- (void)configureRTPMetricsReporting;
- (void)dealloc;
- (void)deleteiRATClient:(int)a3;
- (void)evaluateActiveCallQuality;
- (void)evaluateCellAleratedState:(unint64_t)a3;
- (void)evaluateHandover;
- (void)evaluateWiFiAleratedState:(unint64_t)a3;
- (void)existingContexts;
- (void)feedAWDMetricsCellularStats;
- (void)feedAWDMetricsCellularStatsWithUUID:(id)a3;
- (void)feedAWDMetricsWiFiStats;
- (void)handlaIDSMetrics:(id)a3;
- (void)handleCallNotification:(id)a3;
- (void)handleCellularLinkQualityUpdate:(id)a3;
- (void)handleControllerAvailability:(unint64_t)a3;
- (void)handleFTConfig;
- (void)handleGetMetrcisMessage:(id)a3;
- (void)handleIDSRegisterd;
- (void)handleIDSToolRegisterd;
- (void)handleInternalMessage:(id)a3;
- (void)handleLinkPrefSubscribe:(id)a3;
- (void)handleLinkPrefSubscribeIDS:(id)a3;
- (void)handleMotionUpdate:(id)a3;
- (void)handlePeriodicRTPMetrics:(id)a3;
- (void)handleRTPEvent:(id)a3;
- (void)handleSessionNotification:(id)a3;
- (void)handleSubscribeStatusUpdate:(id)a3 :(BOOL)a4;
- (void)handleSubscribeStatusUpdateIDS:(id)a3 :(BOOL)a4;
- (void)handleWiFiConfig;
- (void)handleWiFiLinkQualityUpdate:(id)a3;
- (void)handleWiFiStateChaneEvents:(id)a3;
- (void)initCallNotifications;
- (void)initHandoverReasonCode;
- (void)registerForCTNotifications;
- (void)registerForSCNotifications;
- (void)removeiRatClient:(id)a3;
- (void)resetActiveCallEvaluationMetrics;
- (void)resetActiveCallTimer;
- (void)sendMessage:(int)a3 withMsg:(id)a4;
- (void)setPingPongTimerMultipler:(unint64_t)a3 :(int)a4 :(unint64_t)a5;
- (void)setWiFiLinkDown:(BOOL)a3;
- (void)toggleFastLQMReport:(BOOL)a3;
- (void)updateControllerSession:(id)a3 ofId:(unint64_t)a4;
- (void)updateControllerState:(id)a3;
- (void)updateHandoverReasonCode:(int)a3;
- (void)updateRSSITh:(int64_t)a3;
- (void)updateSlotInfoCTServie;
@end

@implementation WRM_FT_HandoverManager

- (void)handleSessionNotification:(id)a3
{
  int64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64 <= 401)
  {
    if (uint64 > 200)
    {
      if (uint64 == 201)
      {
        [(WRM_FT_HandoverManager *)self handleRTPEvent:a3];
      }
      else if (uint64 == 202)
      {
        [(WRM_FT_HandoverManager *)self handlePeriodicRTPMetrics:a3];
      }
    }
    else if (uint64 == 100)
    {
      [(WRM_FT_HandoverManager *)self handleWiFiConfig];
    }
    else if (uint64 == 103)
    {
      [(WRM_FT_HandoverManager *)self handleWiFiStateChaneEvents:a3];
    }
  }
  else
  {
    switch(uint64)
    {
      case 402:
        [(WRM_FT_HandoverManager *)self handleLinkPrefSubscribeIDS:a3];
        goto LABEL_24;
      case 403:
        -[WRM_FT_HandoverManager handleSubscribeStatusUpdateIDS::](self, "handleSubscribeStatusUpdateIDS::", a3);
        break;
      case 404:
      case 405:
      case 409:
      case 410:
      case 411:
      case 412:
      case 413:
      case 414:
        return;
      case 406:
        [(WRM_FT_HandoverManager *)self handleLinkPrefSubscribe:a3];
LABEL_24:
        [(WCM_WiFiController *)self->mWiFi toggleWiFiLQMIfNeeded:[(WRM_FT_HandoverManager *)self needWiFiLQM]];
        [(WRM_FT_HandoverManager *)self registerForCTNotifications];
        [(WRM_FT_HandoverManager *)self registerForSCNotifications];
        break;
      case 407:
        [(WRM_FT_HandoverManager *)self handleSubscribeStatusUpdate:a3 :1];
        break;
      case 408:
        [(WRM_FT_HandoverManager *)self handleCellularLinkQualityUpdate:a3];
        break;
      case 415:
        [(WRM_FT_HandoverManager *)self handleGetMetrcisMessage:a3];
        break;
      default:
        if (uint64 == 600)
        {
          [(WRM_FT_HandoverManager *)self handlaIDSMetrics:a3];
        }
        else if (uint64 == 1000)
        {
          xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
          [(WRM_FT_HandoverManager *)self handleInternalMessage:value];
        }
        break;
    }
  }
}

- (void)handleInternalMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kInternalMessageId");
  xpc_object_t value = xpc_dictionary_get_value(a3, "kInternalMessageArgs");
  if (uint64 == 1040 || uint64 == 1003)
  {
    +[WCM_Logging logLevel:29 message:@"handleInternalMessage:handleWiFiLinkQualityUpdate"];
    [(WRM_FT_HandoverManager *)self handleWiFiLinkQualityUpdate:value];
  }
  else if (uint64 == 1001)
  {
    [(WRM_FT_HandoverManager *)self handleMotionUpdate:value];
  }
}

- (void)handleWiFiLinkQualityUpdate:(id)a3
{
  +[WCM_Logging logLevel:29 message:@"FT Handover Manager received WiFi link metrics"];
  byte_10027D041 = 0;
  if ([(WRM_FT_HandoverManager *)self handoverEvaluationRequired])
  {
    +[WCM_Logging logLevel:29 message:@"Evaluating WiFi versus Cellular link preference."];
    [(WRM_FT_HandoverManager *)self evaluateHandover];
  }
  else
  {
    +[WCM_Logging logLevel:29 message:@"No need of Handover Evaluation: Evaluation Criteria not met."];
  }
}

- (BOOL)doesIRATClientSubscriptionContextExist
{
  obj = self->miRATClientContexts;
  objc_sync_enter(obj);
  id v3 = [(NSMutableArray *)self->miRATClientContexts count];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, @"%s: iRAT client count:%d.", "-[WRM_FT_HandoverManager doesIRATClientSubscriptionContextExist]", v3);
  if (!v3)
  {
    +[WCM_Logging logLevel:29 message:@" No iRAT client available."];
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
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, @"%s: iRAT client Context count:%d.", "-[WRM_FT_HandoverManager doesIRATClientSubscriptionContextExist]", [v9 count]);
      v6 |= [v9 count] != 0;
    }
    id v5 = [(NSMutableArray *)miRATClientContexts countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v5);
LABEL_12:
  objc_sync_exit(obj);
  return v6 & 1;
}

+ (id)WRM_FT_HandoverManagerSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069224;
  block[3] = &unk_10020D980;
  block[4] = a1;
  if (qword_10027D030 != -1) {
    dispatch_once(&qword_10027D030, block);
  }
  return (id)qword_10027D038;
}

- (void)evaluateHandover
{
  id v3 = [(NSMutableArray *)self->miRATClientContexts count];
  if (!v3)
  {
    +[WCM_Logging logLevel:29 message:@"Evaluate Handover: No iRAT client available."];
    return;
  }
  +[WCM_Logging logLevel:29, @"Evaluate Handover: Total number of iRAT clients %zu.", v3 message];
  [(WRM_FT_HandoverManager *)self updateSlotInfoCTServie];
  id v46 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obj = self->miRATClientContexts;
  id v43 = [(NSMutableArray *)obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (!v43)
  {
LABEL_100:
    v38 = "ClientFaceTimeCalling";
    goto LABEL_101;
  }
  v47 = self;
  uint64_t v42 = *(void *)v57;
  do
  {
    uint64_t v4 = 0;
    do
    {
      if (*(void *)v57 != v42) {
        objc_enumerationMutation(obj);
      }
      id v5 = *(void **)(*((void *)&v56 + 1) + 8 * v4);
      id v6 = [v5 getMyClientType];
      uint64_t v7 = "ClientCommCenter";
      v8 = v47;
      if (v6 != 1)
      {
        if ((v6 - 2) >= 0x14)
        {
          uint64_t v7 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
          if (v6 == 22) {
            uint64_t v7 = "ClientCoreMediaStreaming";
          }
        }
        else
        {
          uint64_t v7 = off_10020EC08[(int)v6 - 2];
        }
      }
      uint64_t v45 = v4;
      +[WCM_Logging logLevel:29, @"<%s>Evaluate Handover: BEGIN.", v7 message];
      v44 = v5;
      id v9 = [v5 getHandoverContexts];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v48 = v9;
      id v51 = [v9 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v51)
      {
        v10 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
        if (v6 == 22) {
          v10 = "ClientCoreMediaStreaming";
        }
        v49 = v10;
        uint64_t v50 = *(void *)v53;
        uint64_t v11 = (int)v6 - 2;
        do
        {
          long long v12 = 0;
          do
          {
            if (*(void *)v53 != v50) {
              objc_enumerationMutation(v48);
            }
            long long v13 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v12);
            id v14 = [v13 getBandwidth];
            id v15 = [v13 getApplicationType];
            id v16 = [v13 getCallState];
            id v17 = [v13 getConnectedLinkType];
            if ([v13 getSubscriptionType] != (id)1)
            {
              +[WCM_Logging logLevel:29, @"Evaluate Handover: SubscriptionType != WIFI_CELL, HO Eval Required: %d", 0, v39 message];
              goto LABEL_81;
            }
            v18 = "ClientCommCenter";
            if (v6 != 1)
            {
              v18 = v49;
              if (v11 <= 0x13) {
                v18 = off_10020EC08[v11];
              }
            }
            if (v15)
            {
              v19 = "VOICE";
              if (v15 != (id)1)
              {
                v19 = "UNKNOWN_APP!!!";
                if (v15 == (id)2) {
                  v19 = "VIDEO";
                }
              }
            }
            else
            {
              v19 = "DATA";
            }
            +[WCM_Logging logLevel:29, @"<%s>{%s}Evaluate Handover: BEGIN.", v18, v19 message];
            if v17 || (byte_10027D045) {
              goto LABEL_32;
            }
            if (byte_10027D046 == 1)
            {
              +[WCM_Logging logLevel:29 message:@"evaluate_handover: connectedLinkType == WRM_CELLULAR"];
              [v13 getDeltaTimeSinceLastCellularRecommendation];
              double v28 = v27;
              if (v16)
              {
                double v29 = v27 * 1000.0;
                +[WCM_Logging logLevel:29, @"state: active, getDeltaTimeSinceLastCellularRecommendation: delta time:%lf", v27 * 1000.0 message];
                if (v29 < (double)(uint64_t)[v46 faceTimeCellularStickinessThreaholdActive]) {
                  goto LABEL_84;
                }
                +[WCM_Logging logLevel:29 message:@"WiFi link evaluation criteria met: FaceTimeCellularStickinessThreaholdStationaryActive"];
LABEL_32:
                [v13 updatePrevTimeStamp];
                goto LABEL_33;
              }
              id v32 = [v13 getPingPongAvoidanceTimerMultiplier];
              unint64_t v33 = (void)[v46 faceTimeCellularStickinessThreaholdActive] * (void)v32;
              double v34 = v28 * 1000.0;
              +[WCM_Logging logLevel:29, @"state: idle, getDeltaTimeSinceLastCellularRecommendation: delta time:%lf, effective blockout:%lld", *(void *)&v34, v33 message];
              double v35 = (double)v33;
              v8 = v47;
              if (v34 < v35)
              {
LABEL_84:
                if (v15)
                {
                  v36 = "VOICE";
                  if (v15 != (id)1)
                  {
                    v36 = "UNKNOWN_APP!!!";
                    if (v15 == (id)2) {
                      v36 = "VIDEO";
                    }
                  }
                }
                else
                {
                  v36 = "DATA";
                }
                +[WCM_Logging logLevel:29, @"{%s}Skipping link evaluation for client connected on cellular link", v36 message];
                [v13 setLinkPreferenceNotificationRequired:0];
                goto LABEL_71;
              }
              +[WCM_Logging logLevel:29 message:@"WiFi link evaluation criteria met: FaceTimeCellularStickinessThreaholdStationary"];
              [v13 updatePrevTimeStamp];
              [v13 setPingPongAvoidanceTimerMultiplier:1];
            }
LABEL_33:
            [(WRM_FT_HandoverManager *)v8 initHandoverReasonCode];
            if (v15)
            {
              v20 = "VOICE";
              if (v15 != (id)1)
              {
                v20 = "UNKNOWN_APP!!!";
                if (v15 == (id)2) {
                  v20 = "VIDEO";
                }
              }
            }
            else
            {
              v20 = "DATA";
            }
            +[WCM_Logging logLevel:29, @"{%s}invoking evaluate link", v20 message];
            unsigned int v21 = [(WRM_FT_HandoverManager *)v8 evaluateLink:v14 :v15 :v16 :v17];
            BOOL v22 = v21 == 1;
            if ([v13 getConnectedLinkType] != v22)
            {
              if (v17) {
                BOOL v24 = 0;
              }
              else {
                BOOL v24 = v21 == 1;
              }
              char v25 = v24;
              if (!v24)
              {
                if (v17 == 1 && v21 != 1)
                {
                  [(WRM_MetricsService *)v47->mMetrics updateiRATMetricWifiToCell:v16 :v15 :5 :v47->mReasons];
LABEL_57:
                  byte_10027D046 = v25 ^ 1;
                }
                [v13 setLinkPreferenceNotificationRequired:1];
                [v13 setConnectedLinkType:v22];
                v8 = v47;
                [v13 setHandoverReasonType:v47->mReasons];
                if (v15)
                {
                  v26 = "VOICE";
                  if (v15 != (id)1)
                  {
                    v26 = "UNKNOWN_APP!!!";
                    if (v15 == (id)2) {
                      v26 = "VIDEO";
                    }
                  }
                }
                else
                {
                  v26 = "DATA";
                }
                +[WCM_Logging logLevel:29, @"{%s}Link preference changed for application type =%lld for client =%d", v26, v15, v6, v40 message];
                goto LABEL_71;
              }
              [(WRM_MetricsService *)v47->mMetrics updateiRATMetricCellToWifi:v16 :v15 :5 :v47->mReasons];
              goto LABEL_57;
            }
            [v13 setLinkPreferenceNotificationRequired:0];
            if (v15)
            {
              v23 = "VOICE";
              if (v15 != (id)1)
              {
                v23 = "UNKNOWN_APP!!!";
                if (v15 == (id)2) {
                  v23 = "VIDEO";
                }
              }
            }
            else
            {
              v23 = "DATA";
            }
            +[WCM_Logging logLevel:29, @"{%s}Link preference did not change for application type =%lld for client =%d current link type =%d ", v23, v15, v6, v22 message];
LABEL_71:
            v30 = "ClientCommCenter";
            if (v6 != 1)
            {
              v30 = v49;
              if (v11 <= 0x13) {
                v30 = off_10020EC08[v11];
              }
            }
            if (v15)
            {
              v31 = "VOICE";
              if (v15 != (id)1)
              {
                v31 = "UNKNOWN_APP!!!";
                if (v15 == (id)2) {
                  v31 = "VIDEO";
                }
              }
            }
            else
            {
              v31 = "DATA";
            }
            +[WCM_Logging logLevel:29, @"<%s>{%s}Evaluate Handover: END.", v30, v31 message];
LABEL_81:
            long long v12 = (char *)v12 + 1;
          }
          while (v51 != v12);
          id v37 = [v48 countByEnumeratingWithState:&v52 objects:v60 count:16];
          id v51 = v37;
        }
        while (v37);
      }
      [v44 handleLinkPreferenceNotificationInternetDataVoiceVideo:0:v8->mCTService:v8->mWiFi->wifiService];
      uint64_t v4 = v45 + 1;
    }
    while ((id)(v45 + 1) != v43);
    id v43 = [(NSMutableArray *)obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  }
  while (v43);
  v38 = "ClientCommCenter";
  switch((int)v6)
  {
    case 1:
      break;
    case 2:
      v38 = "ClientCommCenter1";
      break;
    case 3:
      v38 = "ClientNetworkd";
      break;
    case 4:
      v38 = "ClientIDS";
      break;
    case 5:
      v38 = "ClientIDSTool";
      break;
    case 6:
      v38 = "ClientIMGVideo";
      break;
    case 7:
      goto LABEL_100;
    case 8:
      v38 = "ClientCallKitTelephony";
      break;
    case 9:
      v38 = "ClientLocationd";
      break;
    case 10:
      v38 = "ClientCarousel";
      break;
    case 11:
      v38 = "ClientMusic";
      break;
    case 12:
      v38 = "ClientIMGVideoTest";
      break;
    case 13:
      v38 = "ClientTerminus";
      break;
    case 14:
      v38 = "ClientSiri";
      break;
    case 15:
      v38 = "ClientWebkit";
      break;
    case 16:
      v38 = "ClientWebkitMail";
      break;
    case 17:
      v38 = "ClientWebkitNotification";
      break;
    case 18:
      v38 = "ClientWirelessStress";
      break;
    case 19:
      v38 = "ClientCoreDuet";
      break;
    case 20:
      v38 = "ClientJTRNt";
      break;
    case 21:
      v38 = "ClientNPT";
      break;
    default:
      v38 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
      if (v6 == 22) {
        v38 = "ClientCoreMediaStreaming";
      }
      break;
  }
LABEL_101:
  +[WCM_Logging logLevel:29, @"<%s>Evaluate Handover: END.", v38 message];
}

- (void)updateSlotInfoCTServie
{
  mCTService = self->mCTService;
  id v3 = [(WRM_CTService *)mCTService getUserDataPreferredSlot];

  [(WRM_CTService *)mCTService setActiveSlot:v3];
}

- (void)updateControllerState:(id)a3
{
  mQueue = self->mQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100024674;
  v4[3] = &unk_10020DAB0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mQueue, v4);
}

- (void)setWiFiLinkDown:(BOOL)a3
{
  byte_10027D040 = a3;
}

- (BOOL)needWiFiLQM
{
  BOOL v2 = [(WRM_FT_HandoverManager *)self doesIRATClientSubscriptionContextExist];
  id v3 = "NO";
  if (v2) {
    id v3 = "YES";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, @"%s: needWiFiLQM? %s ", "-[WRM_FT_HandoverManager needWiFiLQM]", v3);
  return v2;
}

- (BOOL)handoverEvaluationRequired
{
  id v3 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  [(NSDate *)self->mStartTime timeIntervalSinceNow];
  double v5 = v4;
  double v6 = self->mPrevTimeSinceStart - v4;
  +[WCM_Logging logLevel:29, @"HO Evaluation time duration is: %lf", *(void *)&v6 message];
  double v7 = (double)(uint64_t)[v3 pingPongAvoidanceThresholdStationary];
  if (v6 * 1000.0 >= v7) {
    self->mPrevTimeSinceStart = v5;
  }
  return v6 * 1000.0 >= v7;
}

- (id)getiRATConfigController
{
  return self->miRATConfig;
}

- (void)handleMotionUpdate:(id)a3
{
  int64_t int64 = xpc_dictionary_get_int64(a3, "kWRMM_MOTION_STATE");
  [(WRM_FT_HandoverManager *)self evaluateHandover];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, @"handleMotionUpdate received: %s: motion state: %d", "-[WRM_FT_HandoverManager(privateFunctions) handleMotionUpdate:]", int64);
}

- (BOOL)isCellularRadioMetricsGoodEnoughForIMSVoIP:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6
{
  +[WCM_Logging logLevel:29, @"isCellularRadioMetricsGoodEnoughForIMSVoIP", *(void *)&a5, a6 message];
  if (a4 - 1 > 1)
  {
    CFStringRef v9 = @"isCellularRadioMetricsGoodEnoughForIMSVoIP: application category not supported";
    goto LABEL_11;
  }
  if ((a5 - 1) > 1)
  {
    if (![(WRM_FT_HandoverManager *)self isCellularExitCriteriaMetForFaceTimeCallCurrentLinkCellular])
    {
      CFStringRef v9 = @"isCellularExitCriteriaMetForIMSFaceCallCurrentLinkCellular false";
      goto LABEL_11;
    }
    CFStringRef v10 = @"isCellularExitCriteriaMetForIMSFaceCallCurrentLinkCellular true";
LABEL_9:
    +[WCM_Logging logLevel:29 message:v10];
    return 0;
  }
  if (![(WRM_FT_HandoverManager *)self isCellularEntryCriteriaMetForFaceTimeCallCurrentLinkWiFi])
  {
    CFStringRef v10 = @"isCellularEntryCriteriaMetForIMSFaceTimeCallCurrentLinkWiFi false";
    goto LABEL_9;
  }
  CFStringRef v9 = @"isCellularEntryCriteriaMetForIMSFaceTimeVoIPCallCurrentLinkWiFi true";
LABEL_11:
  +[WCM_Logging logLevel:29 message:v9];
  return 1;
}

- (BOOL)isCellularEntryCriteriaMetForFaceTimeCallCurrentLinkWiFi
{
  id v3 = [(WRM_FT_HandoverManager *)self getSCService];
  id v4 = [(WRM_FT_HandoverManager *)self getCTService];
  unsigned int v5 = [v4 getServingCellType];
  double v6 = (char *)[v4 getCurrentSignalBars];
  unsigned int v7 = v5 - 1;
  if (v7) {
    [v4 getNrRSRP];
  }
  else {
    [v4 getServingCellRSRP];
  }
  double v9 = v8;
  id v10 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  id v11 = [v3 getCellularDataLQM];
  +[WCM_Logging logLevel:29, @"isCellularEntryCriteriaMetForFaceTimeCallCurrentLinkWiFi,LQM: %d, Signal Bars: %d", v11, v6 message];
  switch(v7)
  {
    case 1u:
      id v16 = (char *)[v10 minSigBarTh2];
      if ((int)v11 > 49 || (uint64_t)v6 >= (uint64_t)(v16 - 1))
      {
        +[WCM_Logging logLevel:29, @"UMTS entry conditions are met bars:%ld", v6 message];
        return 1;
      }
      else
      {
        +[WCM_Logging logLevel:29, @"UMTS entry conditions are not met bars:%ld", v6 message];
        return 0;
      }
    case 2u:
    case 7u:
      if (byte_10027CE78)
      {
        long long v12 = (char *)[v10 minSigBarTh2];
        if ((int)v11 > 49 || (uint64_t)v6 >= (uint64_t)(v12 - 1))
        {
          byte_10027CE78 = 0;
          BOOL v13 = 1;
LABEL_21:
          [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:0x400000];
          return v13;
        }
      }
      else
      {
        +[WCM_Logging logLevel:29, @"FaceTime not supported on 2G radio:%ld", v6 message];
      }
      BOOL v13 = 0;
      goto LABEL_21;
    case 8u:
      BOOL v13 = v9 >= -110.0;
      +[WCM_Logging logLevel:29, @"FaceTime entry criteria met on 5G radio:%f, status:%d", *(void *)&v9, v9 >= -110.0 message];
      return v13;
    default:
      id v14 = (char *)[v10 minSigBarTh2] - 1;
      return (int)v11 > 49 || (uint64_t)v6 >= (uint64_t)v14;
  }
}

- (BOOL)isCellularExitCriteriaMetForFaceTimeCallCurrentLinkCellular
{
  id v3 = [(WRM_FT_HandoverManager *)self getCTService];
  unsigned int v4 = [v3 getServingCellType];
  unsigned int v5 = (char *)[v3 getCurrentSignalBars];
  unsigned int v6 = v4 - 1;
  if (v4 == 1) {
    [v3 getServingCellRSRP];
  }
  else {
    [v3 getNrRSRP];
  }
  double v8 = v7;
  id v9 = [[-[WRM_FT_HandoverManager getSCService](self) getCellularDataLQM];
  id v10 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  +[WCM_Logging logLevel:29, @"isCellularExitCriteriaMetForFaceTimeCallCurrentLinkCellular,LQM: %d, Signal Bars: %d", v9, v5 message];
  switch(v6)
  {
    case 2u:
    case 7u:
      [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:0x400000];
      +[WCM_Logging logLevel:29, @"isCellularExitCriteriaMetForFaceTimeCallCurrentLinkCellular:%ld", v5 message];
      goto LABEL_11;
    case 8u:
      BOOL v11 = v8 < -121.0;
      if (v8 < -121.0) {
        [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:0x100000];
      }
      +[WCM_Logging logLevel:29, @"FaceTime exit criteria met on 5G radio: %f, status:%d", *(void *)&v8, v8 < -121.0 message];
      break;
    default:
      if ((uint64_t)v5 <= (uint64_t)((char *)[v10 minSigBarTh1] + 1) && (int)v9 < 11
        || (uint64_t)v5 <= (uint64_t)[v10 minSigBarTh1])
      {
        [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:0x80000];
        [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:0x40000];
LABEL_11:
        BOOL v11 = 1;
      }
      else
      {
        BOOL v11 = 0;
      }
      break;
  }
  return v11;
}

- (BOOL)isWiFiDataRateIndicatorGoodForFaceTime:(unint64_t)a3 :(int)a4
{
  uint64_t v21 = 0;
  memset(v20, 0, sizeof(v20));
  id v6 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton", a3) getiRATConfigController];
  double v7 = [(WCM_WiFiController *)self->mWiFi wifiService];
  [+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton") getEstimatedWiFiBandwidth:v20];
  unint64_t v8 = *(void *)&v20[0];
  float v9 = (float)*(unint64_t *)&v20[0];
  [(WCM_WiFiService *)v7 getRxRetryPercent];
  double v11 = v10;
  [(WCM_WiFiService *)v7 getTxRetryPercent];
  double v13 = v12;
  [(WCM_WiFiService *)v7 getRxPhyRate];
  float v15 = (1.0 - v11) * v14;
  [(WCM_WiFiService *)v7 getTxPhyRate];
  float v17 = (1.0 - v13) * v16;
  +[WCM_Logging logLevel:29, @"Estimated BW: %.2f, Calculated Available Rx PHY Rate: %.2f, Calculated Available TX Rate: %.2f", v9, v15, v17 message];
  if (a4 == 1) {
    return v9 >= (float)(uint64_t)[v6 idsMinWiFiThroughputTh1]
  }
        && v15 >= (float)(uint64_t)[v6 idsMinWiFiEffectivePhyRateTh1]
        && v17 >= (float)(uint64_t)[v6 idsMinWiFiEffectivePhyRateTh1];
  return !a4 && v8 > 0x8FB;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = [a1 WRM_FT_HandoverManagerSingleton:a3];

  return v3;
}

- (void)addiRatClient:(id)a3
{
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  [(NSMutableArray *)self->miRATClientContexts addObject:a3];
  [(WRM_FT_HandoverManager *)self existingContexts];

  objc_sync_exit(miRATClientContexts);
}

- (void)removeiRatClient:(id)a3
{
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  [(WRM_FT_HandoverManager *)self existingContexts];
  [(NSMutableArray *)self->miRATClientContexts removeObject:a3];
  [(WRM_FT_HandoverManager *)self existingContexts];

  objc_sync_exit(miRATClientContexts);
}

- (void)deleteiRATClient:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  id v6 = [(WRM_FT_HandoverManager *)self getiRATClientFromList:v3];
  if (v6) {
    [(WRM_FT_HandoverManager *)self removeiRatClient:v6];
  }
  objc_sync_exit(miRATClientContexts);
  mWiFi = self->mWiFi;
  BOOL v8 = [(WRM_FT_HandoverManager *)self needWiFiLQM];

  [(WCM_WiFiController *)mWiFi toggleWiFiLQMIfNeeded:v8];
}

- (void)evaluateCellAleratedState:(unint64_t)a3
{
  unsigned int v4 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton", a3) platformManager] wrmPlatformId];
  if ((objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isRecentDevice") & 1) == 0&& v4 - 3 > 6)
  {
    return;
  }
  BOOL mInAleratedState = self->mInAleratedState;
  id v6 = [(WRM_FT_HandoverManager *)self getCTService];
  id v7 = [v6 getServingCellType];
  unsigned int v8 = v7;
  switch(v7)
  {
    case 1:
      [v6 getServingCellRSRP];
      double v10 = v9;
      [v6 getServingCellSNR];
      uint64_t v12 = v11;
      [v6 getServingCellRSRQ];
      break;
    case 2:
      [v6 getServingCellECIO];
      uint64_t v22 = v21;
      [v6 getServingCellRSCP];
      double v16 = v23;
      +[WCM_Logging logLevel:29, @"RSCP :%lf, ECIO: %lf", *(void *)&v23, v22 message];
      double v10 = 0.0;
      goto LABEL_10;
    case 9:
      [v6 getNrRSRP];
      double v10 = v14;
      [v6 getNrSNR];
      uint64_t v12 = v15;
      [v6 getNrRSRQ];
      break;
    default:
      +[WCM_Logging logLevel:29, @" RAT type: %d", v7 message];
      double v10 = 0.0;
      goto LABEL_9;
  }
  +[WCM_Logging logLevel:29, @"RSRP: %lf, SNR: %lf, RSRQ: %lf", *(void *)&v10, v12, v13 message];
LABEL_9:
  double v16 = 0.0;
LABEL_10:
  +[WCM_Logging logLevel:29, @"evaluateCellAleratedState,state:%d", mInAleratedState message];
  if (self->mInAleratedState)
  {
    BOOL v17 = v8 == 1 && v10 > -110.0 || v8 == 9 && v10 > -105.0 || v16 > -105.0 && v8 == 2;
    +[WCM_Logging logLevel:29, @"isExitCriteriaMet : %d", v17 message];
    uint64_t v25 = mInAleratedState && !v17;
  }
  else
  {
    uint64_t v18 = 1;
    if (v8 > 9)
    {
      BOOL v19 = 1;
    }
    else
    {
      BOOL v19 = 1;
      if (((1 << v8) & 0x207) != 0)
      {
        BOOL v20 = v8 == 9 || v8 == 1;
        if (v20 && v10 < -121.0)
        {
          uint64_t v18 = 0;
        }
        else
        {
          uint64_t v18 = 0;
          BOOL v19 = v16 < -115.0 && v8 == 2;
        }
      }
    }
    +[WCM_Logging logLevel:29, @"isEntryCriteriaMetRatType met: %d, isEntryCriteriaMet: %d", v18, v19 message];
    uint64_t v25 = mInAleratedState || v19;
  }
  if (self->mInAleratedState != v25)
  {
    id v27 = [(WRM_FT_HandoverManager *)self getiRATClientFromList:7];
    +[WCM_Logging logLevel:29, @"updating evaluateCellAleratedState: state: %d", v25 message];
    [v27 alertWRMClient::::v25, self->mCTService, -[WCM_WiFiController wifiService](self->mWiFi, "wifiService"), 0];
  }
  self->BOOL mInAleratedState = v25;
}

- (void)evaluateWiFiAleratedState:(unint64_t)a3
{
  id v4 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  BOOL mInAleratedState = self->mInAleratedState;
  +[WCM_Logging logLevel:29, @"evaluateWiFiAleratedState,state:%d", self->mInAleratedState message];
  id v6 = [(WCM_WiFiController *)self->mWiFi wifiService];
  uint64_t v7 = [(WCM_WiFiService *)v6 getRSSI];
  id v8 = [(WCM_WiFiService *)v6 getCCA];
  signed int v9 = [(WCM_WiFiService *)v6 getConnectedStationCount];
  [(WCM_WiFiService *)v6 getTxPer];
  double v11 = v10;
  [(WCM_WiFiService *)v6 getMovingAverageTxPer];
  double v13 = v12;
  unsigned int v14 = [(WCM_WiFiService *)v6 isMovingAverageTxPerValid];
  [(WCM_WiFiService *)v6 getRxRatio];
  double v16 = v15;
  unsigned __int8 v17 = [(WCM_WiFiService *)v6 isRxRatioValid];
  id v18 = [(WRM_FT_HandoverManager *)self getAVConferenceController];
  [v18 deltaVideoErasure];
  float v20 = v19;
  if (v7 >= (uint64_t)[v4 faceTimeAleratedModeRssiTh0])
  {
    BOOL v23 = 0;
  }
  else if (v14 && (uint64_t)[v4 faceTimeAleratedModeTxPer1] <= (uint64_t)(v13 * 100.0))
  {
    BOOL v23 = 1;
  }
  else
  {
    id v21 = [v4 faceTimeAleratedModeCCATh0];
    if (v16 >= 0.3) {
      unsigned __int8 v22 = v17;
    }
    else {
      unsigned __int8 v22 = 0;
    }
    BOOL v23 = 1;
    if ((uint64_t)v8 <= (uint64_t)v21 && (v22 & 1) == 0)
    {
      [v18 movAvgRxPktLoss];
      BOOL v23 = v24 >= 3.0;
    }
  }
  if (self->mInAleratedState)
  {
    if (v7 >= (uint64_t)[v4 faceTimeAleratedModeRssiTh0]
      && (uint64_t)[v4 faceTimeAleratedModeTxPer0] >= (uint64_t)(v11 * 100.0))
    {
      uint64_t v25 = mInAleratedState & ((uint64_t)v8 > (uint64_t)[v4 faceTimeAleratedModeCCATh0]);
    }
    else
    {
      uint64_t v25 = mInAleratedState;
    }
  }
  else
  {
    char v26 = v7 <= (uint64_t)[v4 faceTimeAleratedModeRssiTh1] || v23;
    if ((v26 & 1) != 0
      || (uint64_t)v8 >= (uint64_t)[v4 faceTimeAleratedModeCCATh1]
      && (uint64_t)[v4 faceTimeAleratedModeVideoErasures] < (uint64_t)v20)
    {
      BOOL v27 = 1;
    }
    else
    {
      BOOL v27 = (uint64_t)v8 >= (uint64_t)[v4 faceTimeAleratedModeCCATh1]
         && (uint64_t)[v4 faceTimeAleratedModeStationCount] <= v9;
    }
    uint64_t v25 = mInAleratedState || v27;
  }
  if (self->mInAleratedState != v25)
  {
    id v28 = [(WRM_FT_HandoverManager *)self getiRATClientFromList:7];
    +[WCM_Logging logLevel:29, @"evaluateWiFiAleratedState: state: %d", v25 message];
    [v28 alertWRMClient::::v25 self->mCTService -[WCM_WiFiController wifiService](self->mWiFi, "wifiService") 1];
    self->mWrmiRATFaceTimeMetrics->alertedMode = v25;
  }
  if ((unint64_t)(v7 + 60) <= 0xFFFFFFFFFFFFFFF6) {
    [(WRM_FT_HandoverManager *)self toggleFastLQMReport:v7 < -69];
  }
  self->BOOL mInAleratedState = v25;
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

- (WRM_FT_HandoverManager)autorelease
{
  return self;
}

- (WRM_FT_HandoverManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)WRM_FT_HandoverManager;
  BOOL v2 = [(WRM_FT_HandoverManager *)&v7 init];
  if (v2)
  {
    v2->mQueue = (OS_dispatch_queue *)[[WRM_HandoverManager WRM_HandoverManagerSingleton] getQueue];
    *(_OWORD *)&v2->mCTService = 0u;
    *(_OWORD *)&v2->mWiFi = 0u;
    v2->mAVConferenceController = (WRM_AVConferenceController *)objc_opt_new();
    uint64_t v3 = +[WRM_IdsMetricsController WRM_IdsMetricsControllerSingleton];
    v2->mMotionController = 0;
    v2->mIDSMetricsController = v3;
    byte_10027D040 = 0;
    byte_10027D041 = 1;
    byte_10027D042 = 0;
    v2->mDiscardRTPMetrics = 0;
    byte_10027D043 = 0;
    v2->miRATConfig = (WRM_iRATConfig *)[[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
    v2->miRATClientContexts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->mMotionController = (WRM_MotionController *)+[WRM_MotionController singleton];
    id v4 = +[WRM_MetricsService getSingleton];
    v2->mMetrics = v4;
    if (v4) {
      [(WRM_MetricsService *)v4 initFaceTimeHandoverMetrics];
    }
    if (NSClassFromString(@"CXCallObserver"))
    {
      unsigned int v5 = (CXCallObserver *)objc_alloc_init((Class)CXCallObserver);
      v2->mCallObserver = v5;
      [(CXCallObserver *)v5 setDelegate:v2 queue:&_dispatch_main_q];
    }
    else
    {
      v2->mCallObserver = 0;
    }
    [(WRM_FT_HandoverManager *)v2 initCallNotifications];
    v2->mWrmiRATFaceTimeMetrics = [(WRM_MetricsService *)v2->mMetrics getWRMFaceTimeHandover];
    v2->mStartTime = (NSDate *)[+[NSDate date] copy];
    v2->mPrevTimeSinceStart = 0.0;
    v2->mAudioEvaluationTimer = (NSDate *)[+[NSDate date] copy];
    v2->mTimeSinceAudioEvaluationStarted = 0.0;
    v2->mLatteContextStartedTimer = (NSDate *)[+[NSDate date] copy];
    v2->mTimeSinceLatteContextStarted = 0.0;
    +[WCM_Logging logLevel:29 message:@"FT Handover Manager: Handover manager initialized"];
    byte_10027D044 = 0;
    v2->BOOL mInAleratedState = 0;
  }
  return v2;
}

- (void)dealloc
{
  self->miRATConfig = 0;
  self->mIDSMetricsController = 0;
  *(_OWORD *)&self->mQueue = 0u;
  *(_OWORD *)&self->mSCService = 0u;
  self->mBT = 0;
  mCallObserver = self->mCallObserver;
  if (mCallObserver)
  {
    [(CXCallObserver *)mCallObserver setDelegate:0 queue:0];

    self->mCallObserver = 0;
  }
  mAVConferenceController = self->mAVConferenceController;
  if (mAVConferenceController)
  {

    self->mAVConferenceController = 0;
  }
  self->mIDSMetricsController = 0;
  self->mDiscardRTPMetrics = 0;
  +[WCM_Logging logLevel:29 message:@"FT Handover Manager: Dealloc called for handover manager "];
  miRATClientContexts = self->miRATClientContexts;
  if (miRATClientContexts) {

  }
  mStartTime = self->mStartTime;
  if (mStartTime)
  {

    self->mStartTime = 0;
    self->mPrevTimeSinceStart = 0.0;
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
  v9.receiver = self;
  v9.super_class = (Class)WRM_FT_HandoverManager;
  [(WRM_FT_HandoverManager *)&v9 dealloc];
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
  block[2] = sub_100069F00;
  block[3] = &unk_10020DDC0;
  void block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(mQueue, block);
}

- (BOOL)enableiRATManager
{
  return 1;
}

- (void)handleControllerAvailability:(unint64_t)a3
{
  if ([(WRM_FT_HandoverManager *)self enableiRATManager])
  {
    if ((uint64_t)a3 > 11)
    {
      if (a3 == 12)
      {
        [(WRM_FT_HandoverManager *)self handleIDSToolRegisterd];
      }
      else if (a3 == 14)
      {
        [(WRM_FT_HandoverManager *)self handleFTConfig];
      }
    }
    else if (a3 == 1)
    {
      [(WRM_FT_HandoverManager *)self handleWiFiConfig];
    }
    else if (a3 == 11)
    {
      [(WRM_FT_HandoverManager *)self handleIDSRegisterd];
    }
  }
}

- (void)handleIDSToolRegisterd
{
}

- (void)handleIDSRegisterd
{
  if ([(WRM_FT_HandoverManager *)self getiRATClientFromList:4])
  {
    +[WCM_Logging logLevel:29 message:@"IDS Link Manager: configureIDSMetricsReporting."];
    [(WRM_FT_HandoverManager *)self configureIDSMetricsReporting];
  }

  +[WCM_Logging logLevel:29 message:@"IDS registration status changed."];
}

- (void)configureIDSMetricsReporting
{
  [(WRM_IdsMetricsController *)self->mIDSMetricsController resetIDSMetrics];
  [(WRM_IdsMetricsController *)self->mIDSMetricsController resetCumulativeIdsMetrics];
  mIDSMetricsController = self->mIDSMetricsController;

  [(WRM_IdsMetricsController *)mIDSMetricsController configureIDSMetricsReporting];
}

- (void)handlaIDSMetrics:(id)a3
{
  mWiFi = self->mWiFi;
  if (mWiFi)
  {
    if ([(WCM_WiFiController *)mWiFi wifiService])
    {
      mIDSMetricsController = self->mIDSMetricsController;
      [(WRM_IdsMetricsController *)mIDSMetricsController handlePeriodicIDSMetrics:a3];
      return;
    }
    CFStringRef v7 = @"handlaIDSMetrics: WiFi service not initialized.";
  }
  else
  {
    CFStringRef v7 = @"handlaIDSMetrics: WiFi not initialized.";
  }

  +[WCM_Logging logLevel:29 message:v7];
}

- (void)handleFTConfig
{
  +[WCM_Logging logLevel:29 message:@"FaceTime Calling Client config changed."];

  [(WRM_FT_HandoverManager *)self configureRTPMetricsReporting];
}

- (void)handleWiFiConfig
{
  +[WCM_Logging logLevel:29 message:@"WiFi config changed."];
  if (!self->mWiFi)
  {
    +[WCM_Logging logLevel:18 message:@"WiFi did not register, can't get state"];
    [(WRM_FT_HandoverManager *)self evaluateHandover];
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
  id v4 = [(WCM_WiFiController *)mWiFi wifiService];
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
    LOBYTE(v6) = v7 >= (uint64_t)[-[WRM_FT_HandoverManager getiRATConfigController](self, "getiRATConfigController") faceTimeMinActiveWiFiRssiTh0];
  }
  return v6;
}

- (int)evaluateLink:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  if (a6 == 1 && byte_10027D041 == 1)
  {
    +[WCM_Logging logLevel:29 message:@"iRAT restarted, WiFi not yet initalized"];
    int v11 = 1;
    goto LABEL_16;
  }
  mWiFi = self->mWiFi;
  if (mWiFi)
  {
    long long v13 = [(WCM_WiFiController *)mWiFi wifiService];
    if (v13)
    {
      if (byte_10027D040)
      {
        [(WRM_FT_HandoverManager *)self evaluateCellAleratedState:a4];
        +[WCM_Logging logLevel:29, @"Evaluate link: WiFi link not associated.  mLinkDown:%d", byte_10027D040 message];
LABEL_14:
        [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:2];
        goto LABEL_15;
      }
      if ([(WCM_WiFiService *)v13 isWiFiPrimaryInterface])
      {
        byte_10027D045 = 0;
        [(WRM_FT_HandoverManager *)self evaluateWiFiAleratedState:a4];
        int v11 = [(WRM_FT_HandoverManager *)self evaluateLinkWiFiPreferred:a3 :a4 :v7 :v6];
        goto LABEL_16;
      }
      [(WRM_FT_HandoverManager *)self evaluateCellAleratedState:a4];
      byte_10027D045 = 1;
      CFStringRef v14 = @"Evaluate link: WiFi link not primary yet. ";
    }
    else
    {
      CFStringRef v14 = @"Evaluate link: WiFi service not initialized.";
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v14, v20);
    goto LABEL_14;
  }
  +[WCM_Logging logLevel:29 message:@"Evaluate link: WiFi not initialized."];
  [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:2];
  [(WRM_FT_HandoverManager *)self evaluateCellAleratedState:a4];
LABEL_15:
  int v11 = 0;
LABEL_16:
  long long v15 = "DATA";
  double v16 = "VOICE";
  unsigned __int8 v17 = "UNKNOWN_APP!!!";
  if (a4 == 2) {
    unsigned __int8 v17 = "VIDEO";
  }
  if (a4 != 1) {
    double v16 = v17;
  }
  if (a4) {
    long long v15 = v16;
  }
  id v18 = "WIFI";
  if (!v11) {
    id v18 = "CELLULAR";
  }
  +[WCM_Logging logLevel:29, @"{%s}iRAT: Evaluate link preferred: %s", v15, v18 message];
  return v11;
}

- (int)evaluateLinkWiFiPreferred:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  if (a5)
  {
    +[WCM_Logging logLevel:29 message:@"Evaluate link: Call active."];
    if ([(WRM_FT_HandoverManager *)self canWiFiMeetActiveApplicationRequirements:a3 :a4 :v6])
    {
      return 1;
    }
  }
  else
  {
    +[WCM_Logging logLevel:29 message:@"Evaluate link: Call Idle."];
    if ([(WRM_FT_HandoverManager *)self canWiFiMeetIdleApplicationRequirements:a3 :a4 :v6])
    {
      return 1;
    }
  }
  return ![(WRM_FT_HandoverManager *)self canCellularMeetApplicationRequirement:a3 :a4 :v7 :v6 :0];
}

- (id)getWiFiController
{
  return self->mWiFi;
}

- (id)getCTService
{
  return self->mCTService;
}

- (id)getSCService
{
  return self->mSCService;
}

- (id)getAVConferenceController
{
  return self->mAVConferenceController;
}

- (void)handleWiFiStateChaneEvents:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  +[WCM_Logging logLevel:29 message:@"FT Handover Manager received WiFi link state change event"];
  if (value)
  {
    byte_10027D043 = 0;
    int64_t int64 = xpc_dictionary_get_int64(value, "kWRM_WiFi_LINK_STATUS");
    byte_10027D046 = 0;
    if (int64)
    {
      +[WCM_Logging logLevel:29 message:@"FT Handover Manager:Link down event received"];
      byte_10027D040 = 1;
    }
    else
    {
      byte_10027D040 = 0;
      int64_t v6 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_RSSI");
      int64_t v7 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_SNR");
      +[WCM_Logging logLevel:29 message:@"FT Handover Manager:Linkup event received"];
      CFStringRef v8 = [(WCM_WiFiController *)self->mWiFi wifiService];
      [(WCM_WiFiService *)v8 updateTxStats:0 :0 :0];
      [(WCM_WiFiService *)v8 updateTxPer];
      [(WCM_WiFiService *)v8 updateFwTxStats:0 :0 :0];
      [(WCM_WiFiService *)v8 updateFwTxPer];
      [(WCM_WiFiService *)v8 updateRxStats:0 :0];
      [(WCM_WiFiService *)v8 updateRxRatio];
      [(WCM_WiFiService *)v8 updateRxBeacons:0 :0];
      [(WCM_WiFiService *)v8 updateRxBeaconPer];
      [(WCM_WiFiService *)v8 setRSSI:v6];
      [(WCM_WiFiService *)v8 setSNR:v7];
    }
    [(WRM_FT_HandoverManager *)self evaluateHandover];
  }
  else
  {
    +[WCM_Logging logLevel:29 message:@"FT Handover Manager:Empty message received"];
  }
}

- (void)handleCellularLinkQualityUpdate:(id)a3
{
  +[WCM_Logging logLevel:29 message:@"FT Handover Manager received Cellular link metrics"];
  if ([(WRM_FT_HandoverManager *)self handoverEvaluationRequired])
  {
    [(WRM_FT_HandoverManager *)self evaluateHandover];
  }
}

- (void)updateRSSITh:(int64_t)a3
{
  if ((unint64_t)(a3 + 79) >= 0xFFFFFFFFFFFFFFF7) {
    -[WRM_iRATConfig updateFaceTimeRSSITh:](self->miRATConfig, "updateFaceTimeRSSITh:");
  }
}

- (void)handleLinkPrefSubscribe:(id)a3
{
  byte_10027D044 = 1;
  dword_10027D048 = 0;
  byte_10027D046 = 0;
  +[WCM_Logging logLevel:29 message:@"HandoverManager: handleIWLANRadioLinkPreferenceRequest."];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  id v6 = a3;
  int64_t v7 = WRM_MotionController;
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "kClientType");
  id v22 = [(WRM_FT_HandoverManager *)self getiRATClientFromList:uint64];
  if ((uint64 - 1) >= 0x15)
  {
    objc_super v9 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      objc_super v9 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    objc_super v9 = off_10020ECA8[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:29, @"Message received from client %d(%s) ", uint64, v9 message];
  xpc_object_t xarray = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  size_t count = xpc_array_get_count(xarray);
  [v22 removeAllMobilityContextsFromList];
  +[WCM_Logging logLevel:29 message:@"Removing all contexts from iRAT client."];
  size_t v20 = count;
  if (count)
  {
    if (!self->mWiFi) {
      +[WCM_Logging logLevel:18 message:@"WiFi did not register, can't get state"];
    }
    size_t v11 = 0;
    do
    {
      xpc_object_t v12 = xpc_array_get_value(xarray, v11);
      uint64_t v13 = xpc_dictionary_get_uint64(v12, "kWRMApplicationType");
      uint64_t v14 = xpc_dictionary_get_uint64(v12, "kWRMDesiredLinkQoS");
      uint64_t v15 = xpc_dictionary_get_uint64(v12, "kWRMDesiredBandwidth");
      [&v7[50] logLevel:29, @"%s: Record#= %d Application Type=%llu, LinkQoS=%llu, Bandwidth=%llu,Service Status=%llu", "-[WRM_FT_HandoverManager handleLinkPrefSubscribe:]", v11, v13, v14, v15, 0 message];
      if (xpc_dictionary_get_value(v12, "kWRMRSSITh"))
      {
        int64_t int64 = xpc_dictionary_get_int64(v12, "kWRMRSSITh");
        [&v7[50] logLevel:29 message:@"%s: Enabling AVC test: RSSI: TH: %lld ", "-[WRM_FT_HandoverManager handleLinkPrefSubscribe:]", int64];
        [(WRM_FT_HandoverManager *)self updateRSSITh:int64];
      }
      unsigned __int8 v17 = v7;
      [&v7[50] logLevel:29, @"%s: AVC RSSI TH1: %lld, RSSI: TH0: %lld ", "-[WRM_FT_HandoverManager handleLinkPrefSubscribe:]", -[WRM_iRATConfig faceTimeMinActiveWiFiRssiTh1](self->miRATConfig, "faceTimeMinActiveWiFiRssiTh1"), -[WRM_iRATConfig faceTimeMinActiveWiFiRssiTh0](self->miRATConfig, "faceTimeMinActiveWiFiRssiTh0") message];
      id v18 = objc_alloc_init(WRM_Mobility_Context);
      [(WRM_Mobility_Context *)v18 setLinkQoS:v14];
      [(WRM_Mobility_Context *)v18 setBandwidth:v15];
      [(WRM_Mobility_Context *)v18 setApplicationType:v13];
      [(WRM_Mobility_Context *)v18 activateMobilityContext:1];
      [(WRM_Mobility_Context *)v18 setSubscriptionType:1];
      [(WRM_Mobility_Context *)v18 setCallState:byte_10027D044];
      [v22 addMobilityContextToList:v18];

      int64_t v7 = v17;
      ++v11;
    }
    while (v20 != v11);
    [(WRM_FT_HandoverManager *)self evaluateHandover];
    [v22 handleLinkPreferenceNotificationInternetDataVoiceVideo:1 self->mCTService:self->mWiFi->wifiService];
    [&v17[50] logLevel:29 message:@"Send Link Preference Notification at connection setup"];
    if (objc_msgSend(objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController"), "mobilityStateAwarenessEnabled"))
    {
      [(WRM_MotionController *)self->mMotionController stopAllAlarms];
      mMotionController = self->mMotionController;
      [(WRM_MotionController *)mMotionController startMonitoringAlarms];
    }
  }
}

- (void)handleSubscribeStatusUpdate:(id)a3 :(BOOL)a4
{
  unsigned int v5 = self;
  [objc_msgSend(-[WRM_FT_HandoverManager getAVConferenceController](self, "getAVConferenceController", a3, a4), "resetRTPMetrics");
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  int64_t v7 = WRM_MotionController;
  if ((uint64 - 1) >= 0x15)
  {
    CFStringRef v8 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      CFStringRef v8 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    CFStringRef v8 = off_10020ECA8[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:29, @"FaceTime HandoverManager: Message received from client %d(%s)", uint64, v8 message];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  xpc_object_t v10 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  size_t count = xpc_array_get_count(v10);
  if (count)
  {
    size_t v12 = count;
    double v29 = v5;
    for (size_t i = 0; i != v12; ++i)
    {
      xpc_object_t v14 = xpc_array_get_value(v10, i);
      uint64_t v15 = xpc_dictionary_get_uint64(v14, "kWRMApplicationType");
      unsigned int v16 = xpc_dictionary_get_uint64(v14, "kWRMFaceTimeReactionType");
      uint64_t v17 = xpc_dictionary_get_uint64(v14, "kWRMFaceTimeTimeDuration");
      int v18 = xpc_dictionary_get_uint64(v14, "kWRMLinkType");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, @"%s: Record#=%d, Application Type=%llu, FaceTimeReactionType=%llu FaceTimeDuration  %d ", "-[WRM_FT_HandoverManager handleSubscribeStatusUpdate::]", i, v15, v16, v17);
    }
    unsigned int v5 = v29;
    int64_t v7 = WRM_MotionController;
  }
  else
  {
    LODWORD(v17) = 0;
    unsigned int v16 = 0;
    int v18 = 2;
    uint64_t v15 = 1;
  }
  unsigned int v19 = [[-[WRM_FT_HandoverManager getiRATClientFromList:](v5, "getiRATClientFromList:", 7) getMobilityContextFromList:v15] getConnectedLinkType];
  if (v16 == 5)
  {
    BOOL v20 = 0;
    byte_10027D046 = 0;
LABEL_15:
    BOOL v21 = 1;
    goto LABEL_16;
  }
  BOOL v20 = v16 == 2;
  if (v16 == 2) {
    goto LABEL_15;
  }
  if (v16) {
    goto LABEL_17;
  }
  BOOL v21 = v18 == 1;
LABEL_16:
  byte_10027D042 = v21;
LABEL_17:
  if (![(WCM_WiFiService *)[(WCM_WiFiController *)v5->mWiFi wifiService] isWiFiPrimaryInterface])goto LABEL_23; {
  if (v20)
  }
  {
    uint64_t v22 = 1;
  }
  else
  {
    if (v16 - 3 > 2) {
      goto LABEL_23;
    }
    uint64_t v22 = 0;
  }
  [+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") notifyDuplicationState:v22];
LABEL_23:
  mWrmiRATFaceTimeMetrics = v5->mWrmiRATFaceTimeMetrics;
  mWrmiRATFaceTimeMetrics->faceTimeAction = v16;
  CFStringRef v24 = @"Cellular";
  mWrmiRATFaceTimeMetrics->facetimeDelay = v17;
  if (v19 == 1) {
    CFStringRef v24 = @"WiFi";
  }
  mWrmiRATFaceTimeMetrics->iRATRecommendation = &v24->isa;
  [(WRM_MetricsService *)v5->mMetrics getReasonStr:v5->mReasons :v30];
  v5->mWrmiRATFaceTimeMetrics->iRATRecommendationReason = +[NSString stringWithFormat:@"%s", v30];
  [(WRM_FT_HandoverManager *)v5 feedAWDMetricsWiFiStats];
  [(WRM_FT_HandoverManager *)v5 feedAWDMetricsCellularStats];
  uint64_t v25 = v5->mWrmiRATFaceTimeMetrics;
  BOOL v26 = v25->alertedMode || v5->mInAleratedState;
  v25->alertedMode = v26;
  int v27 = v16 == 3 || v20;
  if (v27 == 1)
  {
    int v28 = dword_10027D048;
    v25->counter = dword_10027D048;
    dword_10027D048 = v28 + 1;
    [objc_msgSend(-[WRM_MetricsService getAWDService](v5->mMetrics, "getAWDService")) submitMetricsFaceTimeHandover];
    [&v7[50] logLevel:29 message:@"FT HandoverManager: submitMetricsFaceTimeHandover"];
  }
  [&v7[50] logLevel:29 message:@"FT HandoverManager: handleSubscribeStatusUpdate."];
}

- (void)handleLinkPrefSubscribeIDS:(id)a3
{
  +[WCM_Logging logLevel:29 message:@"IDS WiFi-Cell Link Eval Manager: handleLinkPrefSubscribe."];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  id v7 = [(WRM_FT_HandoverManager *)self getiRATClientFromList:uint64];
  if ((uint64 - 1) >= 0x15)
  {
    CFStringRef v8 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      CFStringRef v8 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    CFStringRef v8 = off_10020ECA8[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:29, @"Message received from client %d(%s)", uint64, v8 message];
  xpc_object_t v9 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  size_t count = xpc_array_get_count(v9);
  if (count)
  {
    size_t v11 = count;
    uint64_t v17 = self;
    [v7 removeAllMobilityContextsFromList];
    +[WCM_Logging logLevel:29 message:@"Removing all contexts from iRAT client."];
    size_t v12 = 0;
    uint64_t v13 = 2;
    do
    {
      xpc_object_t v14 = xpc_array_get_value(v9, v12);
      uint64_t v15 = xpc_dictionary_get_uint64(v14, "kWRMApplicationType");
      if (xpc_dictionary_get_value(v14, "kWRMLinkType")) {
        uint64_t v13 = xpc_dictionary_get_uint64(v14, "kWRMLinkType");
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, @"%s: Record#= %d Application Type=%llu", "-[WRM_FT_HandoverManager handleLinkPrefSubscribeIDS:]", v12, v15);
      unsigned int v16 = objc_alloc_init(WRM_Mobility_Context);
      [(WRM_Mobility_Context *)v16 setApplicationType:v15];
      [(WRM_Mobility_Context *)v16 setSubscriptionType:1];
      [(WRM_Mobility_Context *)v16 setConnectedLinkType:v13];
      [(WRM_Mobility_Context *)v16 activateMobilityContext:1];
      [v7 addMobilityContextToList:v16];

      ++v12;
    }
    while (v11 != v12);
    goto LABEL_13;
  }
  if ([(WRM_FT_HandoverManager *)self doesIRATClientSubscriptionContextExist])
  {
    uint64_t v17 = self;
    [v7 removeAllMobilityContextsFromList];
    +[WCM_Logging logLevel:29 message:@"Removing all contexts from iRAT client."];
LABEL_13:
    [(WRM_FT_HandoverManager *)v17 evaluateHandover];
    return;
  }

  +[WCM_Logging logLevel:29 message:@"Ignoring un-subscribe message from a client for which subscription does not exist"];
}

- (void)handleGetMetrcisMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  if ((uint64 - 1) >= 0x15)
  {
    unsigned int v5 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      unsigned int v5 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    unsigned int v5 = off_10020ECA8[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s Message received from client %d(%s) ", "-[WRM_FT_HandoverManager handleGetMetrcisMessage:]", uint64, v5);
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B5E0;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async(mQueue, block);
}

- (void)handleSubscribeStatusUpdateIDS:(id)a3 :(BOOL)a4
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  if ((uint64 - 1) >= 0x15)
  {
    id v7 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      id v7 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    id v7 = off_10020ECA8[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:29, @"IDS WiFi versus Cell Link Eval Mgr: Message received from client %d(%s)", uint64, v7 message];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  xpc_object_t v9 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  size_t count = xpc_array_get_count(v9);
  if (count)
  {
    size_t v11 = count;
    uint64_t v16 = uint64;
    for (size_t i = 0; i != v11; ++i)
    {
      xpc_object_t v13 = xpc_array_get_value(v9, i);
      uint64_t v14 = xpc_dictionary_get_uint64(v13, "kWRMApplicationType");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, @"%s: Record#=%d, IDS Application Type=%llu, IDS Connected Link Type=%llu", "-[WRM_FT_HandoverManager handleSubscribeStatusUpdateIDS::]", i, v14, xpc_dictionary_get_uint64(v13, "kWRMLinkType"));
    }
    uint64_t uint64 = v16;
  }
  else
  {
    uint64_t v14 = 0;
  }
  +[WCM_Logging logLevel:29 message:@"IDS Link Eval Manager: handleSubscribeStatusUpdate."];
  if (objc_msgSend(-[WRM_FT_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", uint64), "getMobilityContextFromList:", v14))
  {
    +[WCM_Logging logLevel:29 message:@"IDS Link Eval Manager: handleSubscribeStatusUpdate."];
    mIDSMetricsController = self->mIDSMetricsController;
    [(WRM_IdsMetricsController *)mIDSMetricsController resetIDSMetrics];
  }
}

- (void)configureRTPMetricsReporting
{
  mAVConferenceController = self->mAVConferenceController;
  if (mAVConferenceController)
  {
    [(WRM_AVConferenceController *)mAVConferenceController configureFaceTimeRTPMetricsReporting];
    id v4 = self->mAVConferenceController;
    [(WRM_AVConferenceController *)v4 resetPeriodicRTPStats];
  }
}

- (void)handleRTPEvent:(id)a3
{
  id v5 = [(WRM_FT_HandoverManager *)self getAVConferenceController];
  [v5 handleRTPEvent:a3];
  +[WCM_Logging logLevel:message:](WCM_Logging, 29, @"handleRTPEvent, poor connection =%lld, mediaStall = %lld", [v5 poorConnectionDetected], [v5 mediaStallDetected]);
  [(WRM_FT_HandoverManager *)self evaluateHandover];
  [v5 setPoorConnectionDetected:0];

  [v5 setMediaStallDetected:0];
}

- (void)handlePeriodicRTPMetrics:(id)a3
{
  id v5 = [(WRM_FT_HandoverManager *)self getAVConferenceController];
  [v5 handlePeriodicRTPMetrics:a3];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, @"Rx periodic Average RTP packet loss=%lld", [v5 avgRxPktLoss]);
  [(WRM_FT_HandoverManager *)self evaluateHandover];

  [v5 resetRTPMetrics];
}

- (BOOL)isWiFiLinkActive
{
  return 0;
}

- (int64_t)getSNRHysteresis
{
  id v3 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
  switch([(WRM_MotionController *)self->mMotionController getMobilityState])
  {
    case 0:
      CFStringRef v4 = @"Device motion: STATIONARY";
      goto LABEL_9;
    case 1:
      CFStringRef v5 = @"Device motion: WALKING";
      goto LABEL_11;
    case 2:
      +[WCM_Logging logLevel:29 message:@"Device motion: RUNNING"];
      return (int64_t)[v3 snrHysterisisRunning];
    case 3:
      CFStringRef v4 = @"Device motion: VEHICULAR";
      goto LABEL_9;
    case 4:
      CFStringRef v5 = @"Device motion: PEDESTRIAN";
LABEL_11:
      +[WCM_Logging logLevel:29 message:v5];
      int64_t result = (int64_t)[v3 snrHysterisisWalking];
      break;
    default:
      CFStringRef v4 = @"Device motion: UNKNOWN";
LABEL_9:
      +[WCM_Logging logLevel:29 message:v4];
      int64_t result = 0;
      break;
  }
  return result;
}

- (int64_t)getRSSIHysteresis
{
  id v3 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
  switch([(WRM_MotionController *)self->mMotionController getMobilityState])
  {
    case 0:
      CFStringRef v4 = @"Device motion: STATIONARY";
      goto LABEL_9;
    case 1:
      CFStringRef v5 = @"Device motion: WALKING";
      goto LABEL_11;
    case 2:
      +[WCM_Logging logLevel:29 message:@"Device  motion: RUNNING"];
      return (int64_t)[v3 rssiHysterisisRunning];
    case 3:
      CFStringRef v4 = @"Device motion: VEHICULAR";
      goto LABEL_9;
    case 4:
      CFStringRef v5 = @"Device motion: PEDESTRIAN";
LABEL_11:
      +[WCM_Logging logLevel:29 message:v5];
      int64_t result = (int64_t)[v3 rssiHysterisisWalking];
      break;
    default:
      CFStringRef v4 = @"Device motion: UNKNOWN";
LABEL_9:
      +[WCM_Logging logLevel:29 message:v4];
      int64_t result = 0;
      break;
  }
  return result;
}

- (BOOL)isWiFiBeaconLossQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  id v7 = [(WCM_WiFiController *)self->mWiFi wifiService];
  if (![(WCM_WiFiService *)v7 isBeaconPerValid]) {
    return 1;
  }
  id v8 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  [(WCM_WiFiService *)v7 getBeaconPer];
  uint64_t v10 = (uint64_t)(v9 * 100.0);
  +[WCM_Logging logLevel:29, @" Beacon PER %lld", v10 message];
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

- (BOOL)isWiFiLoadQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6
{
  BOOL v7 = a5;
  double v9 = [(WCM_WiFiController *)self->mWiFi wifiService];
  id v10 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  id v11 = [(WCM_WiFiService *)v9 getCCA];
  if (a6 == 1)
  {
    if (!v7)
    {
      id v12 = [v10 minIdleWiFiCcaTh1];
      goto LABEL_8;
    }
    return 1;
  }
  if (a6) {
    return 1;
  }
  if (v7) {
    id v12 = [v10 minActiveWiFiCcaTh0];
  }
  else {
    id v12 = [v10 minIdleWiFiCcaTh0];
  }
LABEL_8:
  if ((uint64_t)v11 < (uint64_t)v12) {
    return 1;
  }
  [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:32];
  return 0;
}

- (BOOL)isWiFiArqQualityIndicatorGood:(unint64_t)a3 :(unint64_t)a4 :(int)a5 :(BOOL)a6
{
  BOOL v38 = a6;
  BOOL v7 = [(WCM_WiFiController *)self->mWiFi wifiService];
  double v34 = self;
  id v35 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  [(WCM_WiFiService *)v7 getTxPer];
  uint64_t v9 = (uint64_t)(v8 * 100.0);
  unsigned int v10 = [(WCM_WiFiService *)v7 isTxPerValid];
  [(WCM_WiFiService *)v7 getTxFail];
  uint64_t v12 = (uint64_t)v11;
  [(WCM_WiFiService *)v7 getFwTxPer];
  uint64_t v14 = (uint64_t)(v13 * 100.0);
  unsigned int v15 = [(WCM_WiFiService *)v7 isFwTxPerValid];
  [(WCM_WiFiService *)v7 getRxRatio];
  double v17 = v16 * 100.0;
  [(WCM_WiFiService *)v7 getCumulativeTxPer];
  uint64_t v19 = (uint64_t)(v18 * 100.0);
  unsigned int v20 = [(WCM_WiFiService *)v7 isCumulativeTxPerValid];
  [(WCM_WiFiService *)v7 getCumulativeFwTxPer];
  uint64_t v22 = (uint64_t)(v21 * 100.0);
  unsigned int v23 = [(WCM_WiFiService *)v7 isCumulativeFwTxPerValid];
  +[WCM_Logging logLevel:29, @"Actual Tx PER %lld, FW Tx PER %lld TX Fail %lld, RX Ratio=%lf CumTxPER %lld CumFwTxPer %lld", v9, v14, v12, *(void *)&v17, v19, v22 message];
  if (v10) {
    uint64_t v24 = v9;
  }
  else {
    uint64_t v24 = 0;
  }
  if (v15) {
    uint64_t v25 = v14;
  }
  else {
    uint64_t v25 = 0;
  }
  if (v20) {
    uint64_t v26 = v19;
  }
  else {
    uint64_t v26 = 0;
  }
  if (v23) {
    uint64_t v27 = v22;
  }
  else {
    uint64_t v27 = 0;
  }
  +[WCM_Logging logLevel:29, @"Effective Tx PER %lld, FW Tx PER %lld TX Fail %lld, RX Ratio=%lf CumTxPER %lld CumFwTxPer %lld", v24, v25, v12, *(void *)&v17, v26, v27 message];
  if (v38)
  {
    if ((v10 & 1) == 0 || a4 != 2 && a4 != 1) {
      return 1;
    }
    if (!a5)
    {
      id v28 = [v35 minActiveWiFiTxPktLossRateTh0];
LABEL_35:
      if ((uint64_t)v28 >= v9) {
        return 1;
      }
LABEL_33:
      [(WRM_FT_HandoverManager *)v34 updateHandoverReasonCode:16];
      return 0;
    }
    if (a5 == 1)
    {
      id v28 = [v35 minActiveWiFiTxPktLossRateTh1];
      goto LABEL_35;
    }
  }
  else if ((v10 | v15))
  {
    if (a5)
    {
      if (a5 != 1) {
        return 1;
      }
      double v29 = v35;
      id v30 = [v35 minIdleWiFiTxPktLossRateTh1];
    }
    else
    {
      double v29 = v35;
      id v30 = [v35 minIdleWiFiTxPktLossRateTh0];
    }
    if ((uint64_t)v30 >= v9) {
      char v31 = v10;
    }
    else {
      char v31 = 0;
    }
    if (v31) {
      return 1;
    }
    char v32 = (uint64_t)[v29 minIdleWiFiFwTxPktLossRateTh1] >= v14 ? v15 : 0;
    if (v32) {
      return 1;
    }
    goto LABEL_33;
  }
  return 1;
}

- (BOOL)canWiFiRadioMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v21 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  uint64_t v9 = [(WCM_WiFiController *)self->mWiFi wifiService];
  unsigned int v10 = [(WCM_WiFiService *)v9 getRSSI];
  double v11 = [(WCM_WiFiService *)v9 getSNR];
  unsigned int v12 = [(WCM_WiFiService *)v9 isWiFiNetworkCaptive];
  int64_t v20 = [(WRM_FT_HandoverManager *)self getSNRHysteresis];
  int64_t v19 = [(WRM_FT_HandoverManager *)self getRSSIHysteresis];
  unsigned int v13 = [(WRM_FT_HandoverManager *)self isWiFiArqQualityIndicatorGood:a3 :a4 :v5 :0];
  unsigned int v14 = [(WRM_FT_HandoverManager *)self isWiFiBeaconLossQualityIndicatorGood:a3 :a4 :v5];
  unsigned int v15 = [(WRM_FT_HandoverManager *)self isWiFiLoadQualityIndicatorGood:a3 :a4 :0 :v5];
  +[WCM_Logging logLevel:29, @"canWiFiRadioMeetIdleApplicationRequirements: RSSI = %lld, SNR=%lld, ARQ Quality=%d Beacon Quality =%d Load Quality =%d WiFi Captive Status: %d", v10, v11, v13, v14, v15, v12 message];
  if (a4 - 1 >= 2)
  {
    if (a4) {
      CFStringRef v16 = @"canWiFiRadioMeetIdleApplicationRequirements: Application category not supported";
    }
    else {
      CFStringRef v16 = @"canWiFiRadioMeetIdleApplicationRequirements: DATA";
    }
    goto LABEL_15;
  }
  +[WCM_Logging logLevel:29 message:@"canWiFiRadioMeetIdleApplicationRequirements: VOICE"];
  if (v5)
  {
    if (v5 == 1)
    {
      +[WCM_Logging logLevel:29 message:@"canWiFiRadioMeetIdleApplicationRequirements:connectedLinkType == WRM_WIFI"];
      if ((uint64_t)v11 < (uint64_t)((char *)[v21 minIdleWiFiSnrTh1] + v20)
        || (uint64_t)v10 < (uint64_t)((char *)[v21 minIdleWiFiRssiTh1] + v19)
        || ((v15 ^ 1) & 1) != 0
        || ((v14 ^ 1) & 1) != 0
        || v13 != 1)
      {
        if ((uint64_t)v11 < (uint64_t)((char *)[v21 minIdleWiFiSnrTh1] + v20)) {
          [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:4];
        }
        if ((uint64_t)v10 < (uint64_t)((char *)[v21 minIdleWiFiRssiTh1] + v19)) {
          [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:8];
        }
        return 0;
      }
      return 1;
    }
    CFStringRef v16 = @"VOICE: connectedLinkType == NO Context";
LABEL_15:
    +[WCM_Logging logLevel:29 message:v16];
    return 1;
  }
  +[WCM_Logging logLevel:29 message:@"canWiFiRadioMeetIdleApplicationRequirements:connectedLinkType == WRM_CELLULAR"];
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

- (BOOL)canWiFiTransportMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  if (a5 == 1)
  {
    +[WCM_Logging logLevel:29, @"Evaluating IDS transport metrics: Connected link WiFi, status: %d", 1 message];
    BOOL v6 = [(WRM_IdsMetricsController *)self->mIDSMetricsController isIDSTransportMetricsGoodEnough:1 :1];
    +[WCM_Logging logLevel:29, @"Evaluated IDS transport metrics: Connected link WiFi, status: %d", v6 message];
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)canWiFiRadioMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  unsigned int v10 = [(WCM_WiFiController *)self->mWiFi wifiService];
  double v11 = [(WCM_WiFiService *)v10 getRSSI];
  unsigned int v12 = [(WCM_WiFiService *)v10 getSNR];
  unsigned int v13 = [(WRM_FT_HandoverManager *)self isWiFiArqQualityIndicatorGood:a3 :a4 :v5 :1];
  unsigned int v14 = [(WRM_FT_HandoverManager *)self isWiFiBeaconLossQualityIndicatorGood:a3 :a4 :v5];
  unsigned int v15 = [(WRM_FT_HandoverManager *)self isWiFiLoadQualityIndicatorGood:a3 :a4 :1 :v5];
  +[WCM_Logging logLevel:29, @"canWiFiRadioMeetActiveApplicationRequirements: RSSI = %lld, SNR=%lld, ARQ Quality=%d Beacon Quality =%d Load Quality =%d, BW Quality =%d", v11, v12, v13, v14, v15, [(WRM_FT_HandoverManager *)self isWiFiDataRateIndicatorGoodForFaceTime:a4 :v5] message];
  int64_t v16 = [(WRM_FT_HandoverManager *)self getSNRHysteresis];
  int64_t v17 = [(WRM_FT_HandoverManager *)self getRSSIHysteresis];
  switch(a4)
  {
    case 2uLL:
      int64_t v20 = v17;
      CFStringRef v21 = @"canWiFiRadioMeetActiveApplicationRequirements: VIDEO";
      break;
    case 1uLL:
      int64_t v20 = v17;
      CFStringRef v21 = @"canWiFiRadioMeetActiveApplicationRequirements: VOICE";
      break;
    case 0uLL:
      +[WCM_Logging logLevel:29 message:@"canWiFiRadioMeetActiveApplicationRequirements: DATA"];
      mIDSMetricsController = self->mIDSMetricsController;
      return [(WRM_IdsMetricsController *)mIDSMetricsController isIDSTransportMetricsGoodEnough:v5 :1];
    default:
      CFStringRef v23 = @"Application category not supported";
      goto LABEL_22;
  }
  +[WCM_Logging logLevel:29 message:v21];
  if (v5)
  {
    if (v5 != 1)
    {
      CFStringRef v23 = @"canWiFiRadioMeetActiveApplicationRequirements:connectedLinkType == No Context";
LABEL_22:
      +[WCM_Logging logLevel:29 message:v23];
      return 1;
    }
    +[WCM_Logging logLevel:29 message:@"canWiFiRadioMeetActiveApplicationRequirements:connectedLinkType == WRM_IWLAN_WIFI"];
    [WCM_Logging logLevel:29 message:@"minActiveWiFiSnrTh1 = %lld, faceTimeMinActiveWiFiRssiTh1 =%lld", [v9 minActiveWiFiSnrTh1], [v9 faceTimeMinActiveWiFiRssiTh1]];
    if ((uint64_t)v12 >= (uint64_t)((char *)[v9 minActiveWiFiSnrTh1] + v16))
    {
      char v22 = (uint64_t)v11 >= (uint64_t)((char *)[v9 faceTimeMinActiveWiFiRssiTh1] + v20) ? v13 : 0;
      if (v22) {
        return 1;
      }
    }
    if ((uint64_t)v12 < (uint64_t)((char *)[v9 minActiveWiFiSnrTh1] + v16)) {
      [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:4];
    }
    if ((uint64_t)v11 < (uint64_t)((char *)[v9 faceTimeMinActiveWiFiRssiTh1] + v20)) {
      [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:8];
    }
    return 0;
  }
  +[WCM_Logging logLevel:29 message:@"canWiFiRadioMeetActiveApplicationRequirements:connectedLinkType == WRM_IWLAN_CELLULAR"];
  if ((uint64_t)v12 < (uint64_t)((char *)[v9 minActiveWiFiSnrTh0] + v16)) {
    return 0;
  }
  if ((uint64_t)v11 >= (uint64_t)((char *)[v9 faceTimeMinActiveWiFiRssiTh0] + v20)) {
    char v24 = v15;
  }
  else {
    char v24 = 0;
  }
  return v24 & v13;
}

- (BOOL)isWiFiVoIPQualityGoodEnough
{
  mWiFsize_t i = self->mWiFi;
  if (mWiFi)
  {
    CFStringRef v4 = [(WCM_WiFiController *)mWiFi wifiService];
    uint64_t v5 = [(WCM_WiFiService *)v4 getRSSI];
    [(WCM_WiFiService *)v4 getRxRatio];
    double v7 = v6;
    unsigned __int8 v8 = [(WCM_WiFiService *)v4 isRxRatioValid];
    [(WCM_WiFiService *)v4 getTxPer];
    uint64_t v10 = (uint64_t)(v9 * 100.0);
    unsigned int v11 = [(WCM_WiFiService *)v4 isTxPerValid];
    uint64_t v12 = [(WCM_WiFiService *)v4 getCCA];
    int v13 = v11 ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
    unsigned __int8 v8 = 0;
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    double v7 = 0.0;
    int v13 = 1;
  }
  id v14 = [(WRM_FT_HandoverManager *)self getAVConferenceController];
  if (!v14)
  {
    +[WCM_Logging logLevel:29 message:@"isWiFiVoIPQualityGoodEnough: ptrAVConferenceController == NULL"];
    [0 resetRTPMetrics];
    [0 resetCumulativeRTPMetrics];
    int64_t v17 = 0;
LABEL_11:
    [v17 resetPeriodicRTPStats];
    return 1;
  }
  unsigned int v15 = v14;
  if ((byte_10027D042 & 1) == 0)
  {
    CFStringRef v16 = @"isWiFiVoIPQualityGoodEnough: Call not on WiFI";
    goto LABEL_10;
  }
  if (self->mDiscardRTPMetrics)
  {
    CFStringRef v16 = @"isWiFiVoIPQualityGoodEnough:discard RTP metrics ";
LABEL_10:
    +[WCM_Logging logLevel:29 message:v16];
    [v15 resetRTPMetrics];
    [v15 resetCumulativeRTPMetrics];
    int64_t v17 = v15;
    goto LABEL_11;
  }
  [(NSDate *)self->mLatteContextStartedTimer timeIntervalSinceNow];
  if (self->mTimeSinceLatteContextStarted - v19 < 3.0)
  {
    +[WCM_Logging logLevel:29 message:@"isWiFiVoIPQualityGoodEnough: ignoring inital RTP metrics to avoid false alarm"];
    return 1;
  }
  id v20 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  [WCM_Logging logLevel:29 message:@"Rx Pkt loss: %lld, nominal buffer delay %lld", [v15 rxPktLoss], [v15 nominalJitterBufferDelay]];
  id v21 = [v15 rxPktLoss];
  if (v21 < [v20 faceTimeHandoverRxPktLossThreshold]
    || v12 <= 87
    && v5 >= -75
    && (v10 < 6 ? (int v22 = 1) : (int v22 = v13), v7 >= 0.3 ? (v23 = v8) : (v23 = 0), v22 == 1 && (v23 & 1) == 0))
  {
    +[WCM_Logging logLevel:29 message:@"isWiFiVoIPQualityGoodEnough: true"];
    byte_10027CE78 = 0;
    return 1;
  }
  +[WCM_Logging logLevel:29 message:@"isWiFiVoIPQualityGoodEnough: false"];
  byte_10027CE78 = 1;
  [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:256];
  return 0;
}

- (BOOL)canWiFiTransportMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  id v8 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  if (a4 - 1 >= 2)
  {
    if (a4) {
      +[WCM_Logging logLevel:29 message:@"Application category not supported"];
    }
    return 1;
  }
  if (a5 != 1 || ![v8 rtpMetricsEnabled]) {
    return 1;
  }

  return [(WRM_FT_HandoverManager *)self isWiFiVoIPQualityGoodEnough];
}

- (BOOL)canWiFiMeetActiveApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v9 = -[WRM_FT_HandoverManager canWiFiRadioMeetActiveApplicationRequirements:::](self, "canWiFiRadioMeetActiveApplicationRequirements:::");
  if (v9)
  {
    BOOL v9 = [(WRM_FT_HandoverManager *)self canWiFiTransportMeetActiveApplicationRequirements:a3 :a4 :v5];
    if (v9)
    {
      BOOL v9 = [(WRM_FT_HandoverManager *)self isMovingAverageUplinkAudioQualityOfCurrentCallGood:v5];
      if (v9)
      {
        BOOL v9 = [(WRM_FT_HandoverManager *)self isMovingAverageDownlinkAudioQualityOfCurrentCallGood:v5];
        if (v9)
        {
          [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:0x10000];
          LOBYTE(v9) = 1;
        }
      }
    }
  }
  return v9;
}

- (BOOL)canWiFiMeetIdleApplicationRequirements:(unint64_t)a3 :(unint64_t)a4 :(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v9 = -[WRM_FT_HandoverManager canWiFiRadioMeetIdleApplicationRequirements:::](self, "canWiFiRadioMeetIdleApplicationRequirements:::");
  if (v9)
  {
    BOOL v9 = [(WRM_FT_HandoverManager *)self canWiFiTransportMeetIdleApplicationRequirements:a3 :a4 :v5];
    if (v9)
    {
      [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:0x10000];
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (void)registerForCTNotifications
{
  if (self->mCTService)
  {
    +[WCM_Logging logLevel:24 message:@"CT already registered."];
  }
  else
  {
    id v3 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
    self->mCTService = v3;
    [(WRM_CTService *)v3 initCoreTelephonyClient];
  }
  mCTService = self->mCTService;

  [(WRM_CTService *)mCTService tiggerEnhanceLQMConfiguration];
}

- (void)registerForSCNotifications
{
  if (self->mSCService)
  {
    +[WCM_Logging logLevel:29 message:@"SC already registered."];
  }
  else
  {
    self->mSCService = (WRM_SCService *)+[WRM_SCService WRM_SCServiceControllerSingleton];
  }
}

- (BOOL)canCellularMeetApplicationRequirement:(unint64_t)a3 :(unint64_t)a4 :(BOOL)a5 :(int)a6 :(BOOL)a7
{
  uint64_t v7 = *(void *)&a6;
  BOOL v8 = a5;
  id v12 = [(WRM_FT_HandoverManager *)self getCTService];
  unsigned int v13 = [v12 getServingCellType];
  id v14 = [(WRM_FT_HandoverManager *)self getSCService];
  [v12 getServingCellFilteredMeasurements];
  uint64_t v44 = (uint64_t)v15;
  id v16 = [v12 getCurrentSignalBars];
  self->BOOL mDeviceAttachedWithCellularNetwork = [v12 dataAttachedWithCellularNetwork];
  self->mDeviceRegisteredWithCellularNetwork = [v12 registeredWithCellularNetwork];
  unsigned int v17 = [v12 cellularDataEnabled];
  BOOL v18 = [(WRM_FT_HandoverManager *)self isCellularRadioMetricsGoodEnoughForIMSVoIP:a3 :a4 :v7 :v8];
  BOOL mDeviceAttachedWithCellularNetwork = self->mDeviceAttachedWithCellularNetwork;
  id v20 = "UNKNOWN_RADIO ";
  switch(v13)
  {
    case 1u:
      +[WCM_Logging logLevel:29, @"IMS VoIP Status =%d, Signal BARs =%ld, Registration Status = %d, Attach Status =%d Serving Cell Type: %s, Cellular Data Enabled=%d", v18, v16, self->mDeviceRegisteredWithCellularNetwork, mDeviceAttachedWithCellularNetwork, "LTE Radio", v17 message];
      [v12 getServingCellRSRP];
      uint64_t v22 = v21;
      [v12 getServingCellSNR];
      uint64_t v24 = v23;
      [v12 getServingCellRSRQ];
      goto LABEL_16;
    case 2u:
      +[WCM_Logging logLevel:29, @"IMS VoIP Status =%d, Signal BARs =%ld, Registration Status = %d, Attach Status =%d Serving Cell Type: %s, Cellular Data Enabled=%d", v18, v16, self->mDeviceRegisteredWithCellularNetwork, mDeviceAttachedWithCellularNetwork, "UMTS_RADIO", v17 message];
      [v12 getServingCellECIO];
      uint64_t v27 = v26;
      [v12 getServingCellRSCP];
      uint64_t v29 = v28;
      id v30 = [v14 getCellularDataLQM];
      +[WCM_Logging logLevel:29, @"CT RSCP: %ld, QMI RSCP :%lf, QMI ECIO: %lf Data LQM %d", v44, v29, v27, v30, v42, v43 message];
      goto LABEL_17;
    case 3u:
      id v20 = "CDMA1X_RADIO";
      goto LABEL_10;
    case 4u:
      id v20 = "CDMAEVDO";
      goto LABEL_10;
    case 5u:
      id v20 = "CDMAHybrid";
      goto LABEL_10;
    case 6u:
      id v20 = "eHRPD_RADIO";
      goto LABEL_10;
    case 7u:
      id v20 = "TDSCDMA_RADIO";
      goto LABEL_10;
    case 8u:
      id v20 = "GSM_RADIO";
      goto LABEL_10;
    case 0xAu:
LABEL_10:
      +[WCM_Logging logLevel:29, @"IMS VoIP Status =%d, Signal BARs =%ld, Registration Status = %d, Attach Status =%d Serving Cell Type: %s, Cellular Data Enabled=%d", v18, v16, self->mDeviceRegisteredWithCellularNetwork, mDeviceAttachedWithCellularNetwork, v20, v17 message];
      goto LABEL_11;
    default:
      char v31 = "UNKNOWN_RADIO!!!";
      if (v13 == 9) {
        char v31 = "N_RADIO";
      }
      +[WCM_Logging logLevel:29, @"IMS VoIP Status =%d, Signal BARs =%ld, Registration Status = %d, Attach Status =%d Serving Cell Type: %s, Cellular Data Enabled=%d", v18, v16, self->mDeviceRegisteredWithCellularNetwork, mDeviceAttachedWithCellularNetwork, v31, v17 message];
      if (v13 == 9)
      {
        [v12 getNrRSRP];
        uint64_t v22 = v32;
        [v12 getNrSNR];
        uint64_t v24 = v33;
        [v12 getNrRSRQ];
LABEL_16:
        uint64_t v34 = v25;
        id v35 = [v12 getLteVoiceLQM];
        id v30 = [v14 getCellularDataLQM];
        +[WCM_Logging logLevel:29, @"CT RSRP: %ld, QMI RSRP:%lf, SNR: %lf, RSRQ:%lf Voice LQM: %d Data LQM %d", v44, v22, v24, v34, v35, v30 message];
      }
      else
      {
LABEL_11:
        id v30 = [v14 getCellularDataLQM];
        +[WCM_Logging logLevel:29, @"Data LQM %d", v30 message];
      }
LABEL_17:
      if (a4 - 1 >= 2)
      {
        if (a4)
        {
          CFStringRef v40 = @"Application category not supported";
        }
        else
        {
          if (!self->mDeviceAttachedWithCellularNetwork || v13 == 10) {
            unsigned int v38 = 0;
          }
          else {
            unsigned int v38 = v17;
          }
          if (v30 >= 0x14 && v38)
          {
            id v41 = v30;
            CFStringRef v36 = @"DATA: Data Status:true,LQM: %d";
            goto LABEL_31;
          }
          [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:0x20000];
          CFStringRef v40 = @"DATA: Data Status:false, Cellular Quality BAD";
        }
      }
      else
      {
        if (v18 && self->mDeviceRegisteredWithCellularNetwork)
        {
          CFStringRef v36 = @" VOICE: FaceTimeVoIPStatus:true";
LABEL_31:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, v36, v41);
          [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:512];
          return 1;
        }
        CFStringRef v40 = @" VOICE: FaceTimeVoIPStatus:false";
      }
      +[WCM_Logging logLevel:29 message:v40];
      return 0;
  }
}

- (void)feedAWDMetricsWiFiStats
{
  id v3 = [(WCM_WiFiController *)self->mWiFi wifiService];
  self->mWrmiRATFaceTimeMetrics->wifiRsssize_t i = (int)[(WCM_WiFiService *)v3 getRSSI];
  self->mWrmiRATFaceTimeMetrics->wifiSNR = (int)[(WCM_WiFiService *)v3 getSNR];
  [(WCM_WiFiService *)v3 getRxPhyRate];
  self->mWrmiRATFaceTimeMetrics->wifiRxPhyRate = (int)v4;
  [(WCM_WiFiService *)v3 getTxPhyRate];
  self->mWrmiRATFaceTimeMetrics->wifiTxPhyRate = (int)v5;
  self->mWrmiRATFaceTimeMetrics->cca = [(WCM_WiFiService *)v3 getCCA];
  self->mWrmiRATFaceTimeMetrics->qbssLoad = [(WCM_WiFiService *)v3 getChannelUtlization];
  [(WCM_WiFiService *)v3 getRxRatio];
  self->mWrmiRATFaceTimeMetrics->wifiRxRetry = (int)(v6 * 100.0);
  [(WCM_WiFiService *)v3 getTxPer];
  self->mWrmiRATFaceTimeMetrics->wifiTxPER = (int)(v7 * 100.0);
  self->mWrmiRATFaceTimeMetrics->captiveNetworks = [(WCM_WiFiService *)v3 isWiFiNetworkCaptive];
  self->mWrmiRATFaceTimeMetrics->stationCount = [(WCM_WiFiService *)v3 getConnectedStationCount];
}

- (void)feedAWDMetricsCellularStatsWithUUID:(id)a3
{
  id v4 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];

  [v4 feedCellularMetricsWithUUID:a3];
}

- (void)feedAWDMetricsCellularStats
{
  id v3 = [(WRM_FT_HandoverManager *)self getCTService];
  id v4 = [(WRM_FT_HandoverManager *)self getSCService];
  unsigned int v5 = [v3 getCTDataIndictor];
  unsigned int v6 = [v3 isVoiceLQMValid];
  if (v6) {
    unsigned int v6 = [v3 getLteVoiceLQM];
  }
  self->mWrmiRATFaceTimeMetrics->voiceLQM = v6;
  unsigned int v7 = [v4 isDataLQMValid];
  if (v7) {
    unsigned int v7 = [v4 getCellularDataLQM];
  }
  self->mWrmiRATFaceTimeMetrics->dataLQM = v7;
  unsigned int v8 = [v3 dataAttachedWithCellularNetwork];
  self->BOOL mDeviceAttachedWithCellularNetwork = v8;
  if (v8) {
    unsigned int v8 = [v3 getCurrentSignalBars];
  }
  self->mWrmiRATFaceTimeMetrics->signalBar = v8;
  switch([v3 getServingCellType])
  {
    case 1u:
      self->mWrmiRATFaceTimeMetrics->ratType = (NSString *)@"LTE";
      [v3 getServingCellRSRP];
      self->mWrmiRATFaceTimeMetrics->cellRsrp = (int)v9;
      [v3 getServingCellRSRQ];
      self->mWrmiRATFaceTimeMetrics->cellRsrq = (int)v10;
      [v3 getServingCellSNR];
      mWrmiRATFaceTimeMetrics = self->mWrmiRATFaceTimeMetrics;
      mWrmiRATFaceTimeMetrics->cellSnr = (int)v11;
      mWrmiRATFaceTimeMetrics->isNSAMode = v5 - 16 < 4 || v5 == 8;
      return;
    case 2u:
      self->mWrmiRATFaceTimeMetrics->ratType = (NSString *)@"UMTS";
      [v3 getServingCellRSCP];
      self->mWrmiRATFaceTimeMetrics->cellRsrp = (int)v15;
      [v3 getServingCellECIO];
      goto LABEL_20;
    case 3u:
      unsigned int v13 = self->mWrmiRATFaceTimeMetrics;
      CFStringRef v14 = @"CDMA1X";
      goto LABEL_18;
    case 4u:
      unsigned int v13 = self->mWrmiRATFaceTimeMetrics;
      CFStringRef v14 = @"CDMAEVDO";
      goto LABEL_18;
    case 5u:
      unsigned int v13 = self->mWrmiRATFaceTimeMetrics;
      CFStringRef v14 = @"CDMAHybrid";
      goto LABEL_18;
    case 6u:
      unsigned int v13 = self->mWrmiRATFaceTimeMetrics;
      CFStringRef v14 = @"eHRPD_RADIO";
      goto LABEL_18;
    case 7u:
      unsigned int v13 = self->mWrmiRATFaceTimeMetrics;
      CFStringRef v14 = @"TDSCDMA";
      goto LABEL_18;
    case 8u:
      unsigned int v13 = self->mWrmiRATFaceTimeMetrics;
      CFStringRef v14 = @"GSM";
      goto LABEL_18;
    case 9u:
      self->mWrmiRATFaceTimeMetrics->ratType = (NSString *)@"N_RADIO";
      [v3 getNrRSRP];
      self->mWrmiRATFaceTimeMetrics->cellRsrp = (int)v17;
      [v3 getNrRSRQ];
      self->mWrmiRATFaceTimeMetrics->cellRsrq = (int)v18;
      [v3 getNrSNR];
LABEL_20:
      self->mWrmiRATFaceTimeMetrics->cellSnr = (int)v16;
      return;
    default:
      unsigned int v13 = self->mWrmiRATFaceTimeMetrics;
      CFStringRef v14 = @"UNKNOWN";
LABEL_18:
      v13->ratType = &v14->isa;
      return;
  }
}

- (void)sendMessage:(int)a3 withMsg:(id)a4
{
  id v5 = [[+[WCM_Server singleton](WCM_Server, "singleton") getSessionFor:a3];

  [v5 sendMessage:a4];
}

- (void)initHandoverReasonCode
{
  self->mReasons = 0;
}

- (void)updateHandoverReasonCode:(int)a3
{
  self->mReasons |= a3;
}

- (void)resetActiveCallEvaluationMetrics
{
  +[WCM_Logging logLevel:29 message:@"resetActiveCallEvaluationMetrics"];
  [(NSDate *)self->mAudioEvaluationTimer timeIntervalSinceNow];
  self->mTimeSinceAudioEvaluationStarted = v3;
  id v4 = [(WRM_FT_HandoverManager *)self getAVConferenceController];
  mWiFsize_t i = self->mWiFi;
  if (mWiFi && (mWiFsize_t i = [(WCM_WiFiController *)mWiFi wifiService]) == 0)
  {
    +[WCM_Logging logLevel:29 message:@"resetActiveCallEvaluationMetrics: ptrWiFiService==NULL"];
  }
  else
  {
    [(WCM_WiFiController *)mWiFi resetCumulativeCounters];
    [v4 resetCumulativeRTPMetrics];
  }

  +[WCM_Logging logLevel:29 message:@"resetActiveCallEvaluationMetrics: exit"];
}

- (void)setPingPongTimerMultipler:(unint64_t)a3 :(int)a4 :(unint64_t)a5
{
  id v6 = [[-[WRM_FT_HandoverManager getiRATClientFromList:](self, "getiRATClientFromList:", *(void *)&a4) getMobilityContextFromList:a5];

  [v6 setPingPongAvoidanceTimerMultiplier:a3];
}

- (void)evaluateActiveCallQuality
{
  [(NSDate *)self->mAudioEvaluationTimer timeIntervalSinceNow];
  double v4 = v3;
  double v5 = self->mTimeSinceAudioEvaluationStarted - v3;
  if (v5 <= 30.0)
  {
    +[WCM_Logging logLevel:29, @"evaluateActiveCallQuality: not evaluating audio quality, call too short duration:%lf", *(void *)&v5 message];
    self->mTimeSinceAudioEvaluationStarted = v4;
    return;
  }
  +[WCM_Logging logLevel:29, @"evaluateActiveCallQuality: evaluating audio quality, call duration:%lf", *(void *)&v5 message];
  mWiFsize_t i = self->mWiFi;
  if (!mWiFi)
  {
    unsigned int v7 = 0;
    goto LABEL_7;
  }
  unsigned int v7 = [(WCM_WiFiController *)mWiFi wifiService];
  if (v7)
  {
LABEL_7:
    [(WCM_WiFiService *)v7 getCumulativeTxPer];
    uint64_t v9 = (uint64_t)(v8 * 100.0);
    uint64_t v10 = [(WCM_WiFiService *)v7 getRSSI];
    id v11 = [(WRM_FT_HandoverManager *)self getAVConferenceController];
    uint64_t v12 = (uint64_t)[v11 averagedNominalJitterBufferDelay];
    [v11 movAvgRxPktLoss];
    uint64_t v14 = (uint64_t)v13;
    +[WCM_Logging logLevel:29, @"evaluateActiveCallQuality: Avg RSSI: %lld CumTX PER: %lld, AVG Nominal Jitter Buffer:%lld, RTP pkt loss:%lld ", v10, v9, v12, (uint64_t)v13 message];
    +[WCM_Logging logLevel:29 message:@"Handover Manager: Checking active call Quality evaluation criteria"];
    BOOL v16 = v12 <= 1000 && v14 <= 20 && v9 <= 20;
    if (!v16 && v10 >= -65) {
      +[WCM_Logging logLevel:29 message:@"Handover Manager: Audio Quality was good"];
    }
    [(WRM_FT_HandoverManager *)self evaluateHandover];
    goto LABEL_17;
  }
  +[WCM_Logging logLevel:29 message:@"evaluateActiveCallQuality: ptrWiFiService==NULL"];
LABEL_17:

  +[WCM_Logging logLevel:29 message:@"evaluateActiveCallQuality: exit"];
}

- (BOOL)isMovingAverageUplinkAudioQualityOfCurrentCallGood:(int)a3
{
  id v5 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  if (a3 == 1)
  {
    id v6 = v5;
    mWiFsize_t i = self->mWiFi;
    if (mWiFi)
    {
      double v8 = [(WCM_WiFiController *)mWiFi wifiService];
      if (!v8)
      {
        +[WCM_Logging logLevel:29 message:@"isMovingAverageUplinkAudioQualityOfCurrentCallGood: ptrWiFiService==NULL"];
        BOOL v9 = 1;
LABEL_10:
        CFStringRef v10 = @"isMovingAverageUplinklinkAudioQualityOfCurrentCallGood exit";
        goto LABEL_11;
      }
    }
    else
    {
      double v8 = 0;
    }
    [(WCM_WiFiService *)v8 getMovingAverageTxPer];
    unint64_t v12 = (unint64_t)(v11 * 100.0);
    unsigned int v13 = [(WCM_WiFiService *)v8 isMovingAverageTxPerValid];
    +[WCM_Logging logLevel:29, @"isMovingAverageUplinkAudioQualityOfCurrentCallGood: TX PER (Mov Avg): %lld, Moving Avg Valid:%d", v12, v13 message];
    id v14 = [v6 faceTimeMinActiveWiFiAvgTxPktLossRateTh];
    BOOL v9 = 1;
    CFStringRef v10 = @"isMovingAverageUplinklinkAudioQualityOfCurrentCallGood exit";
    if (v13 && (unint64_t)v14 < v12)
    {
      +[WCM_Logging logLevel:29 message:@"Handover Manager: Moving average uplink audio quality was bad"];
      [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:16];
      [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:32];
      BOOL v9 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v9 = 1;
    CFStringRef v10 = @"isMovingAverageUplinkAudioQualityOfCurrentCallGood: returned";
  }
LABEL_11:
  +[WCM_Logging logLevel:29 message:v10];
  return v9;
}

- (BOOL)isVideoQualityGood:(int)a3
{
  id v3 = [(WRM_FT_HandoverManager *)self getAVConferenceController];
  [v3 totalVideoPacketLossRate];
  uint64_t v5 = (uint64_t)(float)(v4 * 100.0);
  [v3 deltaVideoErasure];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, @"isVideoQualityGood, Vid erasure supported: %d, Delta videoErasure: %d , Video packet loss: %d", [v3 videoErasureSupported], (uint64_t)v6, v5);
  return 1;
}

- (BOOL)isMovingAverageDownlinkAudioQualityOfCurrentCallGood:(int)a3
{
  id v5 = [(WRM_FT_HandoverManager *)self getAVConferenceController];
  id v6 = [(WRM_FT_HandoverManager *)self getiRATConfigController];
  if ((byte_10027D042 & 1) == 0)
  {
    CFStringRef v7 = @"isMovingAverageDownlinkAudioQualityOfCurrentCallGood: Call not on WiFI";
    goto LABEL_5;
  }
  if (self->mDiscardRTPMetrics)
  {
    CFStringRef v7 = @"isMovingAverageDownlinkAudioQualityOfCurrentCallGood: discard RTP metrics";
LABEL_5:
    +[WCM_Logging logLevel:29 message:v7];
    [v5 resetRTPMetrics];
    [v5 resetCumulativeRTPMetrics];
    [v5 resetPeriodicRTPStats];
LABEL_6:
    LOBYTE(v8) = 1;
    return v8;
  }
  CFStringRef v10 = v6;
  if (!self->mWiFi)
  {
    id v27 = [0 wifiService];
    uint64_t v11 = (uint64_t)[v27 getRSSI];
    [v27 getRxRatio];
    double v15 = v28;
    unsigned int v12 = [v27 isRxRatioValid];
    [v27 getTxPer];
    uint64_t v13 = (uint64_t)(v29 * 100.0);
    unsigned int v14 = [v27 isTxPerValid] ^ 1;
    if (a3) {
      goto LABEL_10;
    }
LABEL_23:
    [v5 primaryAudioPacketLossRate];
    uint64_t v31 = (uint64_t)v30;
    [v5 primaryVideoPacketLossRate];
    uint64_t v33 = (uint64_t)v32;
    BOOL v8 = v31 < 1 && v33 < 1;
    if (v8) {
      [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:0x10000];
    }
    +[WCM_Logging logLevel:29, @"isMovingAverageDownlinkAudioQualityOfCurrentCallGood: returned, Audio Quality good : %lld, WiFi Audo Loss Rate: %lld, WiFi Video Loss Rate: %lld", v8, v31, v33 message];
    return v8;
  }
  uint64_t v11 = 0;
  unsigned int v12 = 0;
  uint64_t v13 = 0;
  unsigned int v14 = 1;
  double v15 = 0.0;
  if (!a3) {
    goto LABEL_23;
  }
LABEL_10:
  if (a3 != 1)
  {
    +[WCM_Logging logLevel:29 message:@"isMovingAverageDownlinkAudioQualityOfCurrentCallGood: returned"];
    goto LABEL_6;
  }
  unsigned int v40 = v12;
  id v16 = [v5 movAvgNominalJitterBufferDelay];
  [v5 movAvgRxPktLoss];
  uint64_t v18 = (uint64_t)v17;
  unsigned int v19 = [(WRM_FT_HandoverManager *)self isVideoQualityGood:1];
  unsigned int v20 = [v5 poorConnectionDetected];
  self->mWrmiRATFaceTimeMetrics->isPCDetected = [v5 poorConnectionDetected];
  self->mWrmiRATFaceTimeMetrics->isStallDetected = [v5 mediaStallDetected];
  [v5 primaryAudioPacketLossRate];
  self->mWrmiRATFaceTimeMetrics->audioErasure = (float)(v21 * 100.0);
  [v5 deltaVideoErasure];
  self->mWrmiRATFaceTimeMetrics->videoErasure = v22;
  [v5 totalVideoPacketLossRate];
  self->mWrmiRATFaceTimeMetrics->facetimePacketLoss = (float)(v23 * 100.0);
  +[WCM_Logging logLevel:29, @"isMovingAverageDownlinkAudioQualityOfCurrentCallGood: Moving Avg RTP packet loss:%lld, Mov Jitter Buffer Delay: %lld, video good : %lld, Bad connection deteted: %lld", v18, v16, v19, v20 message];
  if ((uint64_t)[v10 faceTimeHandoverAvgRxPktLossThreshold] < v18
    || v20 && (v11 < -75 || (v13 < 6 ? (int v35 = 1) : (int v35 = v14), v15 >= 0.3 ? (v36 = v40) : (v36 = 0), v35 != 1 || v36)))
  {
    +[WCM_Logging logLevel:29 message:@"Handover Manager: Moving average audio quality was bad or poor connection detected"];
    unsigned int v24 = [v5 mediaStallDetected];
    if (v24) {
      uint64_t v25 = 64;
    }
    else {
      uint64_t v25 = 1;
    }
    if ((v24 & 1) == 0 && ((v19 ^ 1) & 1) == 0)
    {
      if (objc_msgSend(v5, "poorConnectionDetected", v25)) {
        uint64_t v26 = 128;
      }
      else {
        uint64_t v26 = 16;
      }
      [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:v26];
      uint64_t v25 = 256;
    }
    [(WRM_FT_HandoverManager *)self updateHandoverReasonCode:v25];
    LOBYTE(v8) = 0;
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  +[WCM_Logging logLevel:29, @"isMovingAverageAudioQualityOfCurrentCallGood: exit", v37, v38, v39 message];
  return v8;
}

- (void)toggleFastLQMReport:(BOOL)a3
{
  BOOL v3 = a3;
  float v4 = [(WCM_WiFiController *)self->mWiFi wifiService];
  if (byte_10027D043 != 1)
  {
    if (!v3) {
      return;
    }
    goto LABEL_5;
  }
  if (!v3)
  {
LABEL_5:
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10006DE38;
    v5[3] = &unk_10020DE10;
    BOOL v6 = v3;
    v5[4] = v4;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)resetActiveCallTimer
{
  [(NSDate *)self->mLatteContextStartedTimer timeIntervalSinceNow];
  self->mTimeSinceLatteContextStarted = v3;
}

- (unsigned)faceTimeCallType
{
  id v2 = [(WRM_FT_HandoverManager *)self getAVConferenceController];
  id v3 = [v2 callType];
  if (v3 != (id)2)
  {
    if ([v2 callType] == (id)4)
    {
      LOBYTE(v3) = 2;
    }
    else
    {
      id v3 = [v2 callType];
      if (v3 != (id)1) {
        LOBYTE(v3) = [v2 callType] == (id)3;
      }
    }
  }
  return v3;
}

- (BOOL)isAVCFaceTimeCallActive
{
  return byte_10027D044;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v6 = [[objc_msgSend(a3, "calls") count];
  if ((unint64_t)v6 > 1)
  {
    BOOL v7 = 1;
LABEL_26:
    self->mDiscardRTPMetrics = v7;
    goto LABEL_27;
  }
  if (v6 != (id)1)
  {
    BOOL v7 = 0;
    goto LABEL_26;
  }
  id v8 = [a3 calls];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v9) {
    goto LABEL_27;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v17;
  do
  {
    unsigned int v12 = 0;
    do
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v12);
      if (([v13 isOutgoing] & 1) == 0
        && ([v13 hasConnected] & 1) == 0
        && ![v13 hasEnded]
        || ([v13 hasConnected] & 1) != 0)
      {
        BOOL v14 = 0;
LABEL_17:
        self->mDiscardRTPMetrics = v14;
        goto LABEL_18;
      }
      if (([v13 isOnHold] & 1) != 0
        || [v13 isOutgoing]
        && ([v13 hasConnected] & 1) == 0
        && ([v13 hasEnded] & 1) == 0)
      {
        BOOL v14 = 1;
        goto LABEL_17;
      }
LABEL_18:
      unsigned int v12 = (char *)v12 + 1;
    }
    while (v10 != v12);
    id v15 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    id v10 = v15;
  }
  while (v15);
LABEL_27:
  +[WCM_Logging logLevel:29, @"callObserver: discard RTP metrics: %d", self->mDiscardRTPMetrics message];
}

- (void)initCallNotifications
{
  +[WCM_Logging logLevel:29 message:@"TUCallCenterCallStatusChangedNotification register"];
  +[TUCallCenter sharedInstance];
  id v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 addObserver:self selector:"handleCallNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
  float v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = TUCallCenterVideoCallStatusChangedNotification;

  [(NSNotificationCenter *)v4 addObserver:self selector:"handleCallNotification:" name:v5 object:0];
}

- (void)handleCallNotification:(id)a3
{
  +[WCM_Logging logLevel:29, @"handleCallNotification notification=%@", a3 message];
  id v5 = [a3 name];
  uint64_t v6 = TUCallCenterCallStatusChangedNotification;
  if (([v5 isEqualToString:TUCallCenterCallStatusChangedNotification] & 1) != 0
    || (id v7 = [a3 name],
        [v7 isEqualToString:TUCallCenterVideoCallStatusChangedNotification]))
  {
    id v8 = [a3 object];
    +[WCM_Logging logLevel:29, @"handleCallNotification call=%@", v8 message];
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, @"handleCallNotification provider=%@", [v8 provider]);
    +[WCM_Logging logLevel:message:](WCM_Logging, 29, @"handleCallNotification bundleIdentifier=%@", [objc_msgSend(objc_msgSend(v8, "provider"), "bundleIdentifier")]);
    +[WCM_Logging logLevel:message:](WCM_Logging, 29, @"handleCallNotification inCallUIBundleIdentifier=%@", [objc_msgSend(objc_msgSend(v8, "provider"), "inCallUIBundleIdentifier")]);
    +[WCM_Logging logLevel:message:](WCM_Logging, 29, @"handleCallNotification displayAppBundleIdentifier=%@", [objc_msgSend(objc_msgSend(v8, "provider"), "displayAppBundleIdentifier")]);
    id v9 = [(WRM_FT_HandoverManager *)self getiRATClientFromList:1];
    +[WCM_Logging logLevel:29, @"handleCallNotification controller=%@", v9 message];
    if (objc_msgSend(objc_msgSend(objc_msgSend(v8, "provider"), "bundleIdentifier"), "length")
      || objc_msgSend(objc_msgSend(objc_msgSend(v8, "provider"), "displayAppBundleIdentifier"), "length"))
    {
      xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
      id v11 = [[[v8 provider] bundleIdentifier] length];
      id v12 = [v8 provider];
      if (v11) {
        id v13 = [v12 bundleIdentifier];
      }
      else {
        id v13 = [v12 displayAppBundleIdentifier];
      }
      xpc_dictionary_set_string(v10, "kWRMVoIPBundleId", (const char *)[v13 UTF8String]);
      BOOL v14 = [v8 status] == 3 || [v8 status] == 4;
      xpc_dictionary_set_BOOL(v10, "kWRMVoIPCallStartingFlag", v14);
      xpc_dictionary_set_BOOL(v10, "kWRMVoIPCallEndedFlag", [v8 status] == 6);
      xpc_dictionary_set_BOOL(v10, "kWRMVoIPCallActiveFlag", [v8 status] == 1);
      xpc_dictionary_set_BOOL(v10, "kWRMVoIPCallVideoFlag", (BOOL)[v8 isVideo]);
      [v9 sendMessage:2500 withArgs:v10];
      xpc_release(v10);
    }
  }
  if (objc_msgSend(objc_msgSend(a3, "name"), "isEqualToString:", v6))
  {
    id v15 = [a3 object];
    if ([v15 status] == 6
      && ((objc_msgSend(objc_msgSend(v15, "provider"), "isTelephonyProvider") & 1) != 0
       || objc_msgSend(objc_msgSend(v15, "provider"), "isFaceTimeProvider")))
    {
      mWrmiRATFaceTimeMetrics = self->mWrmiRATFaceTimeMetrics;
      if (mWrmiRATFaceTimeMetrics)
      {
        mWrmiRATFaceTimeMetrics->callType = 0;
        if (objc_msgSend(objc_msgSend(v15, "provider"), "isFaceTimeProvider"))
        {
          unsigned int v17 = [v15 isVideo];
          long long v18 = self->mWrmiRATFaceTimeMetrics;
          if (v17) {
            int v19 = 2;
          }
          else {
            int v19 = 3;
          }
          goto LABEL_30;
        }
        if (objc_msgSend(objc_msgSend(v15, "provider"), "isTelephonyProvider"))
        {
          if ([v15 providerContext]
            && objc_msgSend(objc_msgSend(objc_msgSend(v15, "providerContext"), "objectForKeyedSubscript:", @"kCallSubType"), "isEqualToString:", @"kCallSubTypeVoLTE"))
          {
            goto LABEL_29;
          }
          if ([v15 providerContext]
            && objc_msgSend(objc_msgSend(objc_msgSend(v15, "providerContext"), "objectForKeyedSubscript:", @"kCallSubType"), "isEqualToString:", @"kCallSubTypeWifi"))
          {
            long long v18 = self->mWrmiRATFaceTimeMetrics;
            int v19 = 5;
LABEL_30:
            v18->callType = v19;
            goto LABEL_31;
          }
          if ([v15 providerContext]
            && objc_msgSend(objc_msgSend(objc_msgSend(v15, "providerContext"), "objectForKeyedSubscript:", @"kCallSubType"), "isEqualToString:", @"kCallSubTypeVoNR"))
          {
LABEL_29:
            long long v18 = self->mWrmiRATFaceTimeMetrics;
            int v19 = 4;
            goto LABEL_30;
          }
          if ([v15 providerContext]
            && objc_msgSend(objc_msgSend(objc_msgSend(v15, "providerContext"), "objectForKeyedSubscript:", @"kCallSubType"), "isEqualToString:", @"kCallSubTypeTelephony"))
          {
            long long v18 = self->mWrmiRATFaceTimeMetrics;
            int v19 = 1;
            goto LABEL_30;
          }
        }
LABEL_31:
        if ([v15 localSenderIdentityUUID]) {
          id v20 = [objc_alloc((Class)NSUUID) initWithUUIDString:[objc_msgSend(objc_msgSend(v15, "localSenderIdentityUUID"), "UUIDString") UUIDString]];
        }
        else {
          id v20 = 0;
        }
        unsigned int v21 = [v15 disconnectedReason];
        objc_initWeak(&location, self);
        mQueue = self->mQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10006E68C;
        block[3] = &unk_10020EBE8;
        objc_copyWeak(&v24, &location);
        block[4] = v20;
        void block[5] = self;
        unsigned int v25 = v21;
        dispatch_async(mQueue, block);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
    }
  }
}

@end