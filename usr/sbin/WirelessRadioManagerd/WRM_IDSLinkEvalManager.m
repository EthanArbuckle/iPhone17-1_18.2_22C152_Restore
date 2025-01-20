@interface WRM_IDSLinkEvalManager
+ (id)WRM_IDSLinkEvalManagerSingleton;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)canBTMeetIDSRequirement:(unint64_t)a3 :(int)a4 :(int)a5;
- (BOOL)canBTMeetTerminusRequirement;
- (BOOL)canWiFiMeetIDSRequirement:(unint64_t)a3 :(int)a4 :(int)a5;
- (BOOL)canWiFiRadioMeetIDSRequirements:(unint64_t)a3 :(int)a4;
- (BOOL)canWiFiRadioMeetMinRequirements;
- (BOOL)canWiFiRadioMeetTerminusRequirements:(id)a3;
- (BOOL)canWiFiRadioMeetTerminusRequirementsForCompanionLink:(id)a3;
- (BOOL)canWiFiTransportMeetIDSApplicationRequirements:(unint64_t)a3 :(int)a4 :(int)a5;
- (BOOL)doesIRATClientSubscriptionContextExist;
- (BOOL)enableiRATManager;
- (BOOL)isBTLinkQualityGood;
- (BOOL)isMarconiDevice;
- (BOOL)isPingPongAvoidanceTimerSatisfied:(id)a3;
- (BOOL)isWiFiArqQualityIndicatorGoodForIDS:(unint64_t)a3 :(int)a4;
- (BOOL)isWiFiDataRateIndicatorGoodForIDS:(unint64_t)a3 :(int)a4;
- (BOOL)needWiFiLQM;
- (NSMutableArray)miRATProximityClientContexts;
- (WRM_IDSLinkEvalManager)autorelease;
- (WRM_IDSLinkEvalManager)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getQueue;
- (id)getiRATClientFromList:(int)a3;
- (id)getiRATProximityClientFromList:(int)a3;
- (int)evaluateLink:(unint64_t)a3 :(int)a4 :(int)a5;
- (int)getBTLQMScore;
- (unint64_t)getBtRxPer;
- (unint64_t)getBtTxPer;
- (unint64_t)getMovingAvgBTRssi;
- (unint64_t)getWiFiRssi;
- (unint64_t)retainCount;
- (void)addProximityiRatClient:(id)a3;
- (void)addiRatClient:(id)a3;
- (void)configureIDSMetricsReporting;
- (void)dealloc;
- (void)deleteProximityiRATClient:(int)a3;
- (void)deleteiRATClient:(int)a3;
- (void)evaluateBTWiFiLink;
- (void)evaluateBTWiFiLinkForTerminus;
- (void)evaluateBandwidth;
- (void)existingContexts;
- (void)handlaIDSMetrics:(id)a3;
- (void)handleBTLQMEval:(id)a3;
- (void)handleBTRegistered;
- (void)handleControllerAvailability:(unint64_t)a3;
- (void)handleIDSRegisterd;
- (void)handleIDSToolRegisterd;
- (void)handleInternalMessage:(id)a3;
- (void)handleLinkPrefSubscribe:(id)a3;
- (void)handleSessionNotification:(id)a3;
- (void)handleSubscribeStatusUpdate:(id)a3 :(BOOL)a4;
- (void)handleTerminusLinkPrefSubscribe:(id)a3;
- (void)handleTerminusSubscribeStatusUpdate:(id)a3;
- (void)handleWiFiRegistered;
- (void)handleWiFiStateChaneEvents:(id)a3;
- (void)postBluetoothLQMScore:(BOOL)a3;
- (void)removeProximityiRatClient:(id)a3;
- (void)removeiRatClient:(id)a3;
- (void)sendMessage:(int)a3 withMsg:(id)a4;
- (void)sendiRATRecommendationToWatch:(int)a3;
- (void)setMiRATProximityClientContexts:(id)a3;
- (void)updateBTLQMScore;
- (void)updateControllerSession:(id)a3 ofId:(unint64_t)a4;
- (void)updateControllerState:(id)a3;
@end

@implementation WRM_IDSLinkEvalManager

- (BOOL)doesIRATClientSubscriptionContextExist
{
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  id v4 = [(NSMutableArray *)self->miRATClientContexts count];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s: iRAT client count:%d.", "-[WRM_IDSLinkEvalManager doesIRATClientSubscriptionContextExist]", v4);
  if (!v4)
  {
    CFStringRef v17 = @" No iRAT client available.";
LABEL_24:
    +[WCM_Logging logLevel:27 message:v17];
    goto LABEL_25;
  }
  v19 = miRATClientContexts;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = self->miRATClientContexts;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v24 + 1) + 8 * i) getHandoverContexts];
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s: iRAT client Context count:%d.", "-[WRM_IDSLinkEvalManager doesIRATClientSubscriptionContextExist]", [v9 count]);
        if ([v9 count])
        {
          BOOL v16 = 1;
          miRATClientContexts = v19;
          goto LABEL_26;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  miRATClientContexts = v19;
  id v10 = [(NSMutableArray *)[(WRM_IDSLinkEvalManager *)self miRATProximityClientContexts] count];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s: iRAT Proximity client count:%d.", "-[WRM_IDSLinkEvalManager doesIRATClientSubscriptionContextExist]", v10);
  if (!v10)
  {
    CFStringRef v17 = @"No iRAT proximity client available";
    goto LABEL_24;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v11 = [(WRM_IDSLinkEvalManager *)self miRATProximityClientContexts];
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (!v12)
  {
LABEL_25:
    BOOL v16 = 0;
    goto LABEL_26;
  }
  uint64_t v13 = *(void *)v21;
  while (2)
  {
    for (j = 0; j != v12; j = (char *)j + 1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v11);
      }
      v15 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
      if (v15
        && [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) mTerminusContext]
        && (objc_msgSend(objc_msgSend(v15, "mTerminusContext"), "mTerminusIsRegistered") & 1) != 0)
      {
        BOOL v16 = 1;
        goto LABEL_26;
      }
    }
    id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    BOOL v16 = 0;
    if (v12) {
      continue;
    }
    break;
  }
LABEL_26:
  objc_sync_exit(miRATClientContexts);
  return v16;
}

- (BOOL)needWiFiLQM
{
  BOOL v2 = [(WRM_IDSLinkEvalManager *)self doesIRATClientSubscriptionContextExist];
  v3 = "NO";
  if (v2) {
    v3 = "YES";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s: needWiFiLQM? %s ", "-[WRM_IDSLinkEvalManager needWiFiLQM]", v3);
  return v2;
}

+ (id)WRM_IDSLinkEvalManagerSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078980;
  block[3] = &unk_10020D980;
  block[4] = a1;
  if (qword_10027D088 != -1) {
    dispatch_once(&qword_10027D088, block);
  }
  return (id)qword_10027D090;
}

- (void)handleInternalMessage:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s: internalMsg: %@", "-[WRM_IDSLinkEvalManager(privateFunctions) handleInternalMessage:]", a3);
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kInternalMessageId");
  if (uint64 == 1040)
  {
LABEL_4:
    +[WCM_Logging logLevel:27 message:@"handleInternalMessage:evaluateBTWiFiLink"];
    return;
  }
  if (uint64 == 1003)
  {
    byte_10027CEC1 = 0;
    byte_10027CEC0 = 1;
    goto LABEL_4;
  }
  +[WCM_Logging logLevel:27 message:@"handleInternalMessage:default"];

  [(WRM_IDSLinkEvalManager *)self evaluateBTWiFiLink];
}

- (int)getBTLQMScore
{
  return self->mCurrentBTLQMScore;
}

- (BOOL)canBTMeetTerminusRequirement
{
  return [(WRM_IDSLinkEvalManager *)self getBTLQMScore] != 1;
}

- (BOOL)canWiFiRadioMeetTerminusRequirementsForCompanionLink:(id)a3
{
  id v5 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
  id v6 = [(WCM_WiFiController *)self->mWiFi wifiService];
  unsigned int v7 = [(WCM_WiFiService *)v6 isLSMWiFiQualityGood];
  unsigned int v23 = [(WRM_IDSP2PController *)self->mIDSP2PController isRemoteWiFiGood];
  id v8 = [(WCM_WiFiService *)v6 getRSSI];
  id v9 = [(WCM_WiFiService *)v6 getSNR];
  unsigned int v22 = [(WCM_WiFiService *)v6 isWiFiConnected];
  unsigned int v10 = [(WRM_IDSLinkEvalManager *)self canBTMeetTerminusRequirement];
  id v11 = (id)[(WCM_WiFiService *)v6 getBadVideoCounter];
  id v12 = (id)[(WCM_WiFiService *)v6 getGoodVideoCounter];
  if (!objc_msgSend(objc_msgSend(a3, "mTerminusContext"), "mCompanionWifiLinkIsRecommended"))
  {
    if ((uint64_t)v9 > (uint64_t)[v5 idsMinWiFiSnrTh0])
    {
      id v13 = [v5 idsMinWiFiRssiTh0];
      goto LABEL_6;
    }
LABEL_12:
    id v14 = v11;
    unsigned int v16 = v7;
    id v18 = v8;
    unsigned int v19 = 0;
    goto LABEL_13;
  }
  if ((uint64_t)v9 <= (uint64_t)[v5 idsMinWiFiSnrTh1]) {
    goto LABEL_12;
  }
  id v13 = [v5 idsMinWiFiRssiTh1];
LABEL_6:
  id v14 = v11;
  BOOL v15 = (int)v12 < (int)v11;
  unsigned int v16 = v7;
  if (v15) {
    unsigned int v17 = 0;
  }
  else {
    unsigned int v17 = v7;
  }
  id v18 = v8;
  if ((uint64_t)v8 > (uint64_t)v13) {
    unsigned int v19 = v17;
  }
  else {
    unsigned int v19 = 0;
  }
LABEL_13:
  if ((v22 & v23) == 1) {
    unsigned int v20 = v19 | v10 ^ 1;
  }
  else {
    unsigned int v20 = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s: RSSI %lld, SNR %lld isWifi available %d isAssociated %d, LSM Quality: %d, isCompanionWiFiGood: %d, infra WiFi good: %d, BT good: %d,badCounter: %d, goodCounter:%d, wifi entry criteria met: %d", "-[WRM_IDSLinkEvalManager(privateFunctions) canWiFiRadioMeetTerminusRequirementsForCompanionLink:]", v18, v9, [(WCM_WiFiService *)v6 isWiFiPrimaryInterface], v22, v16, v23, v20, v10, v14, v12, v19);
  return v20;
}

- (BOOL)canWiFiRadioMeetTerminusRequirements:(id)a3
{
  id v5 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
  id v6 = [(WCM_WiFiController *)self->mWiFi wifiService];
  unsigned int v7 = [(WCM_WiFiService *)v6 isLSMWiFiQualityGood];
  id v8 = [(WCM_WiFiService *)v6 getRSSI];
  id v9 = [(WCM_WiFiService *)v6 getSNR];
  [(WCM_WiFiService *)v6 getAdjustedBeaconPer];
  double v11 = v10;
  unsigned int v12 = [(WCM_WiFiService *)v6 isWiFiConnected];
  unsigned int v13 = [(WCM_WiFiService *)v6 isBeaconSchedValid];
  if (v12)
  {
    unsigned int v14 = v13;
    if ((uint64_t)v9 > (uint64_t)[v5 dataMinWifiSnrTh0]
      && (uint64_t)v8 > (uint64_t)[v5 dataMinWifiRssiTh0])
    {
      if (v14)
      {
        if (v11 * 100.0 <= (double)(uint64_t)[v5 dataMinWifiBeaconPerTh0]) {
          char v15 = v7;
        }
        else {
          char v15 = 0;
        }
        if (v15) {
          goto LABEL_9;
        }
      }
      else if (v7)
      {
LABEL_9:
        BOOL v16 = 1;
        goto LABEL_12;
      }
    }
  }
  BOOL v16 = 0;
LABEL_12:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s: RSSI %lld, SNR %lld Beacon PER %llf isWifi available %d isAssociated %d,LSM Quality: %d, direct WiFi good:%d", "-[WRM_IDSLinkEvalManager(privateFunctions) canWiFiRadioMeetTerminusRequirements:]", v8, v9, *(void *)&v11, [(WCM_WiFiService *)v6 isWiFiPrimaryInterface], v12, v7, v16);
  id v17 = [a3 mTerminusContext];
  if (v12)
  {
    [v17 setWifiRSSI:v8];
    [objc_msgSend(a3, "mTerminusContext") setWifiSNR:v9];
    [objc_msgSend(a3, "mTerminusContext") setWifiCCA:-[WCM_WiFiService getCCA](v6, "getCCA")];
    [objc_msgSend(a3, "mTerminusContext") setBeaconPER:(int)(v11 * 100.0)];
    [objc_msgSend(a3, "mTerminusContext") setNwType:(char)[WCM_WiFiService getPointOfInterest](v6, "getPointOfInterest")];
    [objc_msgSend(a3, "mTerminusContext") setLsmRecommendationBe:-[WCM_WiFiService getBEDecision](v6, "getBEDecision")];
    [objc_msgSend(a3, "mTerminusContext") setExpectedThroughputVIBE:-[WCM_WiFiService getTxThroughputVI](v6, "getTxThroughputVI")];
    [objc_msgSend(a3, "mTerminusContext") setPacketLifetimeVIBE:-[WCM_WiFiService getLifeTimeVI](v6, "getLifeTimeVI")];
    uint64_t v18 = [(WCM_WiFiService *)v6 getTxLossRateVI];
  }
  else
  {
    [v17 setWifiRSSI:-600];
    [objc_msgSend(a3, "mTerminusContext") setWifiSNR:-600];
    [objc_msgSend(a3, "mTerminusContext") setWifiCCA:0];
    [objc_msgSend(a3, "mTerminusContext") setBeaconPER:0];
    [objc_msgSend(a3, "mTerminusContext") setNwType:3];
    [objc_msgSend(a3, "mTerminusContext") setLsmRecommendationBe:-1];
    [objc_msgSend(a3, "mTerminusContext") setExpectedThroughputVIBE:0];
    [objc_msgSend(a3, "mTerminusContext") setPacketLifetimeVIBE:0];
    uint64_t v18 = 0;
  }
  [objc_msgSend(a3, "mTerminusContext") setPacketLossRateVIBE:v18];
  return v16;
}

- (BOOL)canWiFiRadioMeetMinRequirements
{
  id v3 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
  id v4 = [(WCM_WiFiController *)self->mWiFi wifiService];
  id v5 = [(WCM_WiFiService *)v4 getRSSI];
  id v6 = [(WCM_WiFiService *)v4 getSNR];
  unsigned int v7 = [(WCM_WiFiService *)v4 isWiFiConnected];
  if (v7) {
    LOBYTE(v7) = (uint64_t)v6 > (uint64_t)[v3 dataMinWifiSnrTh1]
  }
              && (uint64_t)v5 > (uint64_t)[v3 dataMinWifiRssiTh1];
  return v7;
}

- (BOOL)canWiFiRadioMeetIDSRequirements:(unint64_t)a3 :(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
  id v8 = [(WCM_WiFiController *)self->mWiFi wifiService];
  id v9 = [(WCM_WiFiService *)v8 getRSSI];
  id v10 = [(WCM_WiFiService *)v8 getSNR];
  unsigned int v11 = [(WRM_IDSLinkEvalManager *)self isWiFiArqQualityIndicatorGoodForIDS:a3 :v4];
  unsigned int v12 = [(WRM_IDSLinkEvalManager *)self isWiFiDataRateIndicatorGoodForIDS:a3 :v4];
  +[WCM_Logging logLevel:27, @"RSSI %lld, SNR %lld ARQ Quality Indicator %d, Data Rate Quality Indictor %d", v9, v10, v11, v12 message];
  if (v4 == 3) {
    return (uint64_t)v10 >= (uint64_t)[v7 idsMinWiFiSnrTh0]
  }
        && (uint64_t)v9 >= (uint64_t)[v7 idsMinWiFiRssiTh0]
        && ((v11 ^ 1) & 1) == 0
        && v12 == 1;
  if ((uint64_t)v10 < (uint64_t)[v7 idsMinWiFiSnrTh1]) {
    return 0;
  }
  if ((uint64_t)v9 >= (uint64_t)[v7 idsMinWiFiRssiTh1]) {
    char v13 = v11;
  }
  else {
    char v13 = 0;
  }
  return v12 & v13;
}

- (BOOL)isWiFiArqQualityIndicatorGoodForIDS:(unint64_t)a3 :(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton", a3) getiRATConfigController];
  id v7 = [(WCM_WiFiController *)self->mWiFi wifiService];
  [(WCM_WiFiService *)v7 getMovingAverageTxPer];
  unint64_t v9 = (unint64_t)(v8 * 100.0);
  unsigned __int8 v10 = [(WCM_WiFiService *)v7 isMovingAverageTxPerValid];
  [(WCM_WiFiService *)v7 getTxPer];
  double v12 = v11 * 100.0;
  uint64_t v13 = (uint64_t)v12;
  unsigned int v14 = "Not BLUETOOTH";
  if (v4 == 2) {
    unsigned int v14 = "BLUETOOTH";
  }
  +[WCM_Logging logLevel:27, @"Moving Avg Tx PER %lld, Tx PER %lld,connectedLinkType: %d, Link: %s", v9, (uint64_t)v12, v4, v14 message];
  if (v4 == 3) {
    return (uint64_t)[v6 idsMinAvgWiFiTxPktLossRateTh0] >= v13;
  }
  if ((unint64_t)[v6 idsMinAvgWiFiTxPktLossRateTh1] > v9) {
    return 1;
  }
  return v10 ^ 1;
}

- (BOOL)isWiFiDataRateIndicatorGoodForIDS:(unint64_t)a3 :(int)a4
{
  id v6 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton", a3) getiRATConfigController];
  id v7 = [(WCM_WiFiController *)self->mWiFi wifiService];
  unsigned int v8 = [(WCM_WiFiService *)v7 isQBSSLoadValid];
  [(WCM_WiFiService *)v7 getCalculatedAvailableRxPhyBandwidth];
  float v10 = v9;
  [(WCM_WiFiService *)v7 getCalculatedAvailableTxPhyBandwidth];
  float v12 = v11;
  double v13 = v11;
  +[WCM_Logging logLevel:27, @"WIFI Throughput Estimation, Calculated Rx PHY Rate: %.2f, Calculated TX Rate: %.2f", v10, v11 message];
  if (v8)
  {
    LODWORD(v14) = 1151500288;
    *(float *)&double v15 = v10;
    [(WCM_WiFiService *)v7 getL3Bandwidth:v14 :v15];
    float v17 = v16;
    LODWORD(v18) = 1151500288;
    *(float *)&double v19 = v12;
    [(WCM_WiFiService *)v7 getL3Bandwidth:v18 :v19];
    float v12 = v20;
    long long v21 = "WIFI";
    if (a4 == 2) {
      long long v21 = "BLUETOOTH";
    }
    +[WCM_Logging logLevel:27, @"WIFI Throughput Estimation using QBSS load, Calculated L3 Rx PHY BW: %.2f, Calculated L3 TX PHY BW: %.2f, Recommended Link:%s", v17, v20, v21 message];
    if (a4 != 3)
    {
      if (a4 == 1)
      {
        float v12 = v12 + v12;
        id v22 = [v6 idsMinWiFiThroughputTh1];
        return v12 >= (float)(uint64_t)v22;
      }
      if (v17 < (float)(uint64_t)[v6 idsMinWiFiThroughputTh1]) {
        return 0;
      }
      id v26 = [v6 idsMinWiFiThroughputTh1];
      return v12 >= (float)(uint64_t)v26;
    }
    if (v17 >= (float)(uint64_t)[v6 idsMinWiFiThroughputTh0]) {
      return 1;
    }
    id v25 = [v6 idsMinWiFiThroughputTh0];
  }
  else
  {
    unsigned int v23 = "WIFI";
    if (a4 == 2) {
      unsigned int v23 = "BLUETOOTH";
    }
    +[WCM_Logging logLevel:27, @"WIFI rate Estimation without QBSS load, Effective Rx Phy Rate: %.2f, Effective Tx Phy Rate: %.2f, Recommended Link: %s", v10, *(void *)&v13, v23 message];
    if (a4 != 3)
    {
      if (a4 == 1)
      {
        id v22 = [v6 idsMinWiFiEffectivePhyRateTh1];
        return v12 >= (float)(uint64_t)v22;
      }
      if (v10 < (float)(uint64_t)[v6 idsMinWiFiEffectivePhyRateTh1]) {
        return 0;
      }
      id v26 = [v6 idsMinWiFiEffectivePhyRateTh1];
      return v12 >= (float)(uint64_t)v26;
    }
    if (v10 >= (float)(uint64_t)[v6 idsMinWiFiEffectivePhyRateTh0]) {
      return 1;
    }
    id v25 = [v6 idsMinWiFiEffectivePhyRateTh0];
  }
  return v12 >= (float)(uint64_t)v25;
}

- (BOOL)canWiFiTransportMeetIDSApplicationRequirements:(unint64_t)a3 :(int)a4 :(int)a5
{
  id v8 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton", a3) getiRATConfigController];
  mIDSMetricsController = self->mIDSMetricsController;
  if (!mIDSMetricsController) {
    return 1;
  }
  int v35 = a5;
  v34 = v8;
  id v36 = (id)[(WRM_IdsMetricsController *)mIDSMetricsController getRTT];
  [(WRM_IdsMetricsController *)self->mIDSMetricsController getTxPer];
  double v11 = v10 * 100.0;
  unsigned int v12 = [(WRM_IdsMetricsController *)self->mIDSMetricsController getTxPerValid];
  [(WRM_IdsMetricsController *)self->mIDSMetricsController getAnticipiatedTxPer];
  double v14 = v13 * 100.0;
  unsigned int v15 = [(WRM_IdsMetricsController *)self->mIDSMetricsController getAnticipiatedTxPerValid];
  [(WRM_IdsMetricsController *)self->mIDSMetricsController getTxPerAnticipatedMovAvg];
  double v17 = v16 * 100.0;
  unsigned int v18 = [(WRM_IdsMetricsController *)self->mIDSMetricsController getTxPerAnticipatedMovAvgValid];
  uint64_t v19 = [(WRM_IdsMetricsController *)self->mIDSMetricsController getAvgTxPDUSize];
  uint64_t v20 = [(WRM_IdsMetricsController *)self->mIDSMetricsController getAvgRxPDUSize];
  [(WRM_IdsMetricsController *)self->mIDSMetricsController evaluateDLThroughput];
  uint64_t v22 = v21;
  [(WRM_IdsMetricsController *)self->mIDSMetricsController evaluateULThroughput];
  double v24 = v23;
  uint64_t v25 = [(WRM_IdsMetricsController *)self->mIDSMetricsController getRTTMovAvg];
  [(WRM_IdsMetricsController *)self->mIDSMetricsController getTxPerMovAvg];
  double v27 = v26 * 100.0;
  uint64_t v28 = [(WRM_IdsMetricsController *)self->mIDSMetricsController getAvgTxPDUSizeMovAvg];
  uint64_t v29 = [(WRM_IdsMetricsController *)self->mIDSMetricsController getAvgRxPDUSizeMovAvg];
  +[WCM_Logging logLevel:27, @"Ant PER: %.2f,  Ant PER Valid: %d, Ant Mov PER: %.2f, Ant Mov PER Valid:%d", *(void *)&v14, v15, *(void *)&v17, v18 message];
  +[WCM_Logging logLevel:27, @"IDS Metrics, RTT: %d, M_avg RTT: %d, TX PER: %.2f, Tx PER Valid: %d, M_avg TX PER: %.2f, Rx Size: %d, MAvgRx Size: %d, DL Thr: %.2f, Tx Size: %d, MAvgTx Size: %d,  UL Thr: %.2f", v36, v25, *(void *)&v11, v12, *(void *)&v27, v20, v29, v22, v19, v28, *(void *)&v24 message];
  BOOL result = 1;
  if (a4 == 1 && v35 != 3 && v24 < 1000.0)
  {
    if ((uint64_t)[v34 idsWiFiMinRttTh1] <= (int)v36) {
      return 0;
    }
    char v31 = v14 >= (double)(uint64_t)[v34 idsWiFiMinPerTh1] ? v15 : 0;
    if (v31) {
      return 0;
    }
    char v32 = v17 >= (double)(uint64_t)[v34 idsMovAvgWiFiMinPerTh1] ? v18 : 0;
    if (v32) {
      return 0;
    }
    unsigned int v33 = v11 >= (double)(uint64_t)[v34 idsAvgWiFiMinPerTh1] ? v12 : 0;
    return v33 != 1;
  }
  return result;
}

- (BOOL)canWiFiMeetIDSRequirement:(unint64_t)a3 :(int)a4 :(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  BOOL v9 = -[WRM_IDSLinkEvalManager canWiFiRadioMeetIDSRequirements::](self, "canWiFiRadioMeetIDSRequirements::");
  if (v9)
  {
    LOBYTE(v9) = [(WRM_IDSLinkEvalManager *)self canWiFiTransportMeetIDSApplicationRequirements:a3 :v6 :v5];
  }
  return v9;
}

- (BOOL)canBTMeetIDSRequirement:(unint64_t)a3 :(int)a4 :(int)a5
{
  id v8 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton", a3) getiRATConfigController];
  mIDSMetricsController = self->mIDSMetricsController;
  if (!mIDSMetricsController) {
    return 1;
  }
  id v10 = (id)[(WRM_IdsMetricsController *)mIDSMetricsController getRTT];
  [(WRM_IdsMetricsController *)self->mIDSMetricsController getTxPer];
  double v12 = v11 * 100.0;
  unsigned int v13 = [(WRM_IdsMetricsController *)self->mIDSMetricsController getTxPerValid];
  uint64_t v14 = [(WRM_IdsMetricsController *)self->mIDSMetricsController getAvgTxPDUSize];
  uint64_t v15 = [(WRM_IdsMetricsController *)self->mIDSMetricsController getAvgRxPDUSize];
  [(WRM_IdsMetricsController *)self->mIDSMetricsController evaluateDLThroughput];
  uint64_t v17 = v16;
  [(WRM_IdsMetricsController *)self->mIDSMetricsController evaluateDLThroughput];
  uint64_t v19 = v18;
  uint64_t v20 = [(WRM_IdsMetricsController *)self->mIDSMetricsController getRTTMovAvg];
  [(WRM_IdsMetricsController *)self->mIDSMetricsController getTxPerMovAvg];
  +[WCM_Logging logLevel:27, @"IDS Metrics, RTT: %d, M_avg RTT: %d, TX PER: %.2f, M_avg TX PER: %.2f, Tx PER Valid: %d, Rx Size: %d, MAvgRx Size: %d, DL Thr: %.2f, Tx Size: %d, MAvgTx Size: %d,  UL Thr: %.2f", v10, v20, *(void *)&v12, v13, v21 * 100.0, v15, [(WRM_IdsMetricsController *)self->mIDSMetricsController getAvgRxPDUSizeMovAvg], v17, v14, [(WRM_IdsMetricsController *)self->mIDSMetricsController getAvgTxPDUSizeMovAvg], v19 message];
  BOOL result = 1;
  if (a4 == 3 && a5 != 1)
  {
    if ((uint64_t)[v8 idsBTMinRttTh1] <= (int)v10) {
      return 0;
    }
    unsigned int v23 = v12 >= (double)(uint64_t)[v8 idsBTMinPerTh1] ? v13 : 0;
    return v23 != 1;
  }
  return result;
}

- (void)handleBTLQMEval:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  mQueueTerminus = self->mQueueTerminus;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076918;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_after(v4, mQueueTerminus, block);
}

- (void)handleSessionNotification:(id)a3
{
  int64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s:Recevied message: %lld", "-[WRM_IDSLinkEvalManager(privateFunctions) handleSessionNotification:]", uint64);
  if (uint64 > 413)
  {
    if (uint64 > 599)
    {
      if (uint64 == 600)
      {
        [(WRM_IDSLinkEvalManager *)self handlaIDSMetrics:a3];
      }
      else if (uint64 == 1000)
      {
        xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
        [(WRM_IDSLinkEvalManager *)self handleInternalMessage:value];
      }
    }
    else if (uint64 == 414)
    {
      [(WRM_IDSLinkEvalManager *)self handleTerminusSubscribeStatusUpdate:a3];
    }
    else if (uint64 == 421)
    {
      [(WRM_IDSLinkEvalManager *)self handleBTLQMEval:a3];
    }
  }
  else if (uint64 > 402)
  {
    if (uint64 == 403)
    {
      [(WRM_IDSLinkEvalManager *)self handleSubscribeStatusUpdate:a3 :1];
    }
    else if (uint64 == 413)
    {
      [(WRM_IDSLinkEvalManager *)self handleTerminusLinkPrefSubscribe:a3];
    }
  }
  else if (uint64 == 103)
  {
    [(WRM_IDSLinkEvalManager *)self handleWiFiStateChaneEvents:a3];
  }
  else if (uint64 == 402)
  {
    [(WRM_IDSLinkEvalManager *)self handleLinkPrefSubscribe:a3];
  }
}

- (void)handleTerminusLinkPrefSubscribe:(id)a3
{
  mQueueTerminus = self->mQueueTerminus;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100076C3C;
  v4[3] = &unk_10020DAB0;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(mQueueTerminus, v4);
}

- (void)handleLinkPrefSubscribe:(id)a3
{
  +[WCM_Logging logLevel:27 message:@"IDS Link Eval Manager: handleLinkPrefSubscribe."];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  id v7 = [(WRM_IDSLinkEvalManager *)self getiRATClientFromList:uint64];
  if ((uint64 - 1) >= 0x15)
  {
    id v8 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      id v8 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    id v8 = off_10020EFA8[(int)uint64 - 1];
  }
  +[WCM_Logging logLevel:27, @"Message received from client %d(%s) ", uint64, v8 message];
  xpc_object_t v9 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  size_t count = xpc_array_get_count(v9);
  byte_10027CEC0 = 0;
  if (count)
  {
    size_t v11 = count;
    uint64_t v20 = self;
    [v7 removeAllMobilityContextsFromList];
    +[WCM_Logging logLevel:24 message:@"Removing all contexts from iRAT client."];
    size_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 2;
    do
    {
      xpc_object_t v15 = xpc_array_get_value(v9, v12);
      uint64_t v16 = xpc_dictionary_get_uint64(v15, "kWRMApplicationType");
      if (xpc_dictionary_get_value(v15, "kWRMSubscriptionType")) {
        uint64_t v13 = xpc_dictionary_get_uint64(v15, "kWRMSubscriptionType");
      }
      if (xpc_dictionary_get_value(v15, "kWRMLinkType")) {
        uint64_t v14 = xpc_dictionary_get_uint64(v15, "kWRMLinkType");
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s: Record#= %d Application Type=%llu", "-[WRM_IDSLinkEvalManager(privateFunctions) handleLinkPrefSubscribe:]", v12, v16);
      uint64_t v17 = objc_alloc_init(WRM_Mobility_Context);
      [(WRM_Mobility_Context *)v17 setApplicationType:v16];
      [(WRM_Mobility_Context *)v17 setConnectedLinkType:v14];
      [(WRM_Mobility_Context *)v17 setSubscriptionType:v13];
      [(WRM_Mobility_Context *)v17 activateMobilityContext:1];
      [v7 addMobilityContextToList:v17];

      ++v12;
    }
    while (v11 != v12);
    goto LABEL_15;
  }
  if ([(WRM_IDSLinkEvalManager *)self doesIRATClientSubscriptionContextExist])
  {
    uint64_t v20 = self;
    [v7 removeAllMobilityContextsFromList];
    +[WCM_Logging logLevel:24 message:@"Removing all contexts from iRAT client."];
LABEL_15:
    [(WRM_IDSLinkEvalManager *)v20 evaluateBTWiFiLink];
    +[WCM_Logging logLevel:27 message:@"Send IDS Notification at connection setup"];
    mWiFi = v20->mWiFi;
    BOOL v19 = [(WRM_IDSLinkEvalManager *)v20 needWiFiLQM];
    [(WCM_WiFiController *)mWiFi toggleWiFiLQMIfNeeded:v19];
    return;
  }

  +[WCM_Logging logLevel:27 message:@"Ignoring un-subscribe message from a client for which subscription does not exist"];
}

- (void)handleTerminusSubscribeStatusUpdate:(id)a3
{
  mQueueTerminus = self->mQueueTerminus;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000771C4;
  v4[3] = &unk_10020DAB0;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(mQueueTerminus, v4);
}

- (void)handleSubscribeStatusUpdate:(id)a3 :(BOOL)a4
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kClientType");
  id v7 = WRM_MotionController;
  if ((uint64 - 1) >= 0x15)
  {
    id v8 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    if (uint64 == 22) {
      id v8 = "ClientCoreMediaStreaming";
    }
  }
  else
  {
    id v8 = off_10020EFA8[(int)uint64 - 1];
  }
  uint64_t v30 = uint64;
  char v31 = self;
  +[WCM_Logging logLevel:27, @"IDS Link Eval Mgr: Message received from client %d(%s)", uint64, v8 message];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  xpc_object_t xarray = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  size_t count = xpc_array_get_count(xarray);
  if (count)
  {
    size_t v11 = count;
    size_t v12 = 0;
    BOOL v13 = 0;
    BOOL v14 = 0;
    do
    {
      xpc_object_t v15 = v7;
      xpc_object_t v16 = xpc_array_get_value(xarray, v12);
      uint64_t v17 = xpc_dictionary_get_uint64(v16, "kWRMApplicationType");
      uint64_t v18 = xpc_dictionary_get_uint64(v16, "kWRMLinkType");
      if (xpc_dictionary_get_value(v16, "kWRMConnected")) {
        BOOL v14 = xpc_dictionary_get_uint64(v16, "kWRMConnected") != 0;
      }
      if (xpc_dictionary_get_value(v16, "kWRMNearByOverBT")) {
        BOOL v13 = xpc_dictionary_get_uint64(v16, "kWRMNearByOverBT") != 0;
      }
      id v7 = v15;
      if (v18 >= 3)
      {
        BOOL v19 = "UNKNOWN_WRM_IWLAN_LINK_TYPE!!!";
        if (v18 == 3) {
          BOOL v19 = "WRM_IWLAN_BLUETOOTH";
        }
      }
      else
      {
        BOOL v19 = off_10020EEF0[(int)v18];
      }
      [&v15[50] logLevel:27, @"%s: Record#=%d, IDS Application Type=%llu, IDS Connected Link Type=%llu (%s) isConnected %d, isGizmoNearbyOverBt %d", "-[WRM_IDSLinkEvalManager(privateFunctions) handleSubscribeStatusUpdate::]", v12++, v17, v18, v19, v14, v13 message];
    }
    while (v11 != v12);
  }
  else
  {
    uint64_t v17 = 0;
    BOOL v14 = 0;
    BOOL v13 = 0;
    uint64_t v18 = 2;
  }
  [&v7[50] logLevel:27 message:@"IDS Link Eval Manager: handleSubscribeStatusUpdate."];
  id v20 = [[-[WRM_IDSLinkEvalManager getiRATClientFromList:](self, "getiRATClientFromList:", v30) getMobilityContextFromList:v17];
  if (v20)
  {
    double v21 = v20;
    [&v7[50] logLevel:27 message:@"IDS Link Eval Manager: handleSubscribeStatusUpdate."];
    [(WRM_IdsMetricsController *)v31->mIDSMetricsController resetIDSMetrics];
    [v21 setRecommendedLinkType:v18];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v22 = [(WRM_IDSLinkEvalManager *)v31 miRATProximityClientContexts];
  id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v22);
        }
        double v27 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (v27 && [*(id *)(*((void *)&v33 + 1) + 8 * i) mTerminusContext])
        {
          [objc_msgSend(v27, "mTerminusContext") setRecommendedLinkType:v18];
          if (v18)
          {
            if (v18 == 2 || v18 == 3)
            {
              id v28 = [v27 mTerminusContext];
              uint64_t v29 = 0;
            }
            else
            {
              id v28 = [v27 mTerminusContext];
              if (v14) {
                uint64_t v29 = 1;
              }
              else {
                uint64_t v29 = 2;
              }
            }
          }
          else
          {
            id v28 = [v27 mTerminusContext];
            uint64_t v29 = 3;
          }
          [v28 setMCurrentActiveLink:v29];
          [objc_msgSend(v27, "mTerminusContext") setIsGizmoNearbyOverBt:v13];
        }
      }
      id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v24);
  }
}

- (void)configureIDSMetricsReporting
{
  [(WRM_IdsMetricsController *)self->mIDSMetricsController resetIDSMetrics];
  [(WRM_IdsMetricsController *)self->mIDSMetricsController resetCumulativeIdsMetrics];
  [(WRM_IdsMetricsController *)self->mIDSMetricsController configureIDSMetricsReporting];
  mIDSP2PController = self->mIDSP2PController;

  [(WRM_IDSP2PController *)mIDSP2PController InitService];
}

- (void)handlaIDSMetrics:(id)a3
{
  mWiFi = self->mWiFi;
  if (mWiFi)
  {
    uint64_t v6 = [(WCM_WiFiController *)mWiFi wifiService];
    if (v6)
    {
      id v7 = v6;
      [(WRM_IdsMetricsController *)self->mIDSMetricsController handlePeriodicIDSMetrics:a3];
      if (![(WCM_WiFiService *)v7 isWiFiPrimaryInterface])
      {
        [(WRM_IDSLinkEvalManager *)self evaluateBTWiFiLink];
      }
      return;
    }
    CFStringRef v8 = @"handlaIDSMetrics: WiFi service not initialized.";
  }
  else
  {
    CFStringRef v8 = @"handlaIDSMetrics: WiFi not initialized.";
  }

  +[WCM_Logging logLevel:27 message:v8];
}

- (void)sendiRATRecommendationToWatch:(int)a3
{
  if (objc_msgSend(objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController"), "p2pAssistanceEnabled"))
  {
    if (![(WRM_IDSP2PController *)self->mIDSP2PController IsIDSInitDone]) {
      [(WRM_IDSP2PController *)self->mIDSP2PController InitService];
    }
    CFStringRef v5 = @"WRM_IWLAN_NOT_INIT";
    if (a3 == 1) {
      CFStringRef v5 = @"WRM_IWLAN_WIFI";
    }
    if (a3 == 3) {
      CFStringRef v6 = @"WRM_IWLAN_BLUETOOTH";
    }
    else {
      CFStringRef v6 = v5;
    }
    mIDSP2PController = self->mIDSP2PController;
    [(WRM_IDSP2PController *)mIDSP2PController WrmSendp2pMessage:@"BT versus WiFi pref" MessageBody:v6 withOptions:0];
  }
}

- (void)evaluateBTWiFiLink
{
  id v3 = [(NSMutableArray *)self->miRATClientContexts count];
  if (v3)
  {
    +[WCM_Logging logLevel:27, @"Evaluate BT-WIFI: Total number of IDS clients %zu.", v3 message];
    if (byte_10027CEC0)
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v34 = self;
      obj = self->miRATClientContexts;
      id v30 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (!v30) {
        return;
      }
      uint64_t v29 = *(void *)v41;
      while (1)
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v41 != v29) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v5 = *(void **)(*((void *)&v40 + 1) + 8 * v4);
          unsigned int v6 = [v5 getMyClientType];
          id v7 = "ClientCommCenter";
          if (v6 != 1)
          {
            if (v6 - 2 >= 0x14)
            {
              id v7 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
              if (v6 == 22) {
                id v7 = "ClientCoreMediaStreaming";
              }
            }
            else
            {
              id v7 = off_10020EF08[v6 - 2];
            }
          }
          uint64_t v32 = v4;
          +[WCM_Logging logLevel:27, @"<%s>Evaluate BT-WiFi Link: BEGIN.", v7 message];
          char v31 = v5;
          id v8 = [v5 getHandoverContexts];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v33 = v8;
          id v9 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v35 = *(void *)v37;
            if (v6 == 22) {
              size_t v11 = "ClientCoreMediaStreaming";
            }
            else {
              size_t v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
            }
            uint64_t v12 = (int)(v6 - 2);
            do
            {
              for (i = 0; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v37 != v35) {
                  objc_enumerationMutation(v33);
                }
                BOOL v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                id v15 = [v14 getApplicationType];
                id v16 = [v14 getConnectedLinkType];
                id v17 = [v14 getRecommenedLinkType];
                if ([v14 getSubscriptionType] == (id)1)
                {
                  +[WCM_Logging logLevel:27, @"Do not evaluate, WiFi versus BT because subscription is for WiFi versus Cellular, %d", 0 message];
                  continue;
                }
                uint64_t v18 = "ClientCommCenter";
                if (v6 != 1)
                {
                  uint64_t v18 = v11;
                  if (v12 <= 0x13) {
                    uint64_t v18 = off_10020EF08[v12];
                  }
                }
                if (v15)
                {
                  BOOL v19 = "CT_VOICE";
                  if (v15 != (id)1)
                  {
                    BOOL v19 = "UNKNOWN_APP!!!";
                    if (v15 == (id)2) {
                      BOOL v19 = "CT_Th_Call";
                    }
                  }
                }
                else
                {
                  BOOL v19 = "CT_DATA";
                }
                +[WCM_Logging logLevel:27, @"<%s>{%s}Evaluate Link: BEGIN.", v18, v19 message];
                if (v16 != 3) {
                  goto LABEL_44;
                }
                if ([(WRM_IDSLinkEvalManager *)v34 canBTMeetIDSRequirement:v15 :3 :v17])
                {
                  [v14 getDeltaTimeSinceLastCellularRecommendation];
                  double v21 = v20 * 1000.0;
                  +[WCM_Logging logLevel:27, @"getDeltaTimeSinceLastBTRecommendation: delta time:%lf, effectiveBlockout time:%lld ", v20 * 1000.0, 30000 message];
                  if (v21 < 30000.0)
                  {
                    uint64_t v22 = "UNKNOWN_APP!!!";
                    if (v15 == (id)2) {
                      uint64_t v22 = "CT_Th_Call";
                    }
                    if (v15 == (id)1) {
                      uint64_t v22 = "CT_VOICE";
                    }
                    if (!v15) {
                      uint64_t v22 = "CT_DATA";
                    }
                    +[WCM_Logging logLevel:27, @"{%s}Skipping link evaluation for client connected on BT link", v22 message];
                    [v14 setLinkPreferenceNotificationRequired:0];
                    continue;
                  }
                  +[WCM_Logging logLevel:27 message:@"IDS WiFi link evaluation criteria met"];
LABEL_44:
                  [v14 updatePrevTimeStamp];
                  goto LABEL_45;
                }
                +[WCM_Logging logLevel:27 message:@"Continue to evaluate WiFi link: BT link bad"];
LABEL_45:
                if ([(WRM_IDSLinkEvalManager *)v34 evaluateLink:v15 :v16 :v17] == 1) {
                  uint64_t v23 = 1;
                }
                else {
                  uint64_t v23 = 3;
                }
                if (v23 == [v14 getConnectedLinkType])
                {
                  [v14 setLinkPreferenceNotificationRequired:0];
                }
                else
                {
                  [v14 setLinkPreferenceNotificationRequired:1];
                  [(WRM_IdsMetricsController *)v34->mIDSMetricsController resetIDSMetrics];
                  [(WRM_IDSLinkEvalManager *)v34 sendiRATRecommendationToWatch:v23];
                }
                [v14 setConnectedLinkType:v23];
                id v24 = "ClientCommCenter";
                if (v6 != 1)
                {
                  id v24 = v11;
                  if (v12 <= 0x13) {
                    id v24 = off_10020EF08[v12];
                  }
                }
                if (v15)
                {
                  uint64_t v25 = "CT_VOICE";
                  if (v15 != (id)1)
                  {
                    uint64_t v25 = "UNKNOWN_APP!!!";
                    if (v15 == (id)2) {
                      uint64_t v25 = "CT_Th_Call";
                    }
                  }
                }
                else
                {
                  uint64_t v25 = "CT_DATA";
                }
                +[WCM_Logging logLevel:27, @"<%s>{%s}Evaluate BT-WIFI Link: END.", v24, v25 message];
                double v26 = "ClientCommCenter";
                if (v6 != 1)
                {
                  double v26 = v11;
                  if (v12 <= 0x13) {
                    double v26 = off_10020EF08[v12];
                  }
                }
                +[WCM_Logging logLevel:27, @"<%s>Evaluate BT-WiFi Link: END.", v26 message];
              }
              id v10 = [v33 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v10);
          }
          [v31 handleLinkPreferenceNotificationIDS:0];
          uint64_t v4 = v32 + 1;
        }
        while ((id)(v32 + 1) != v30);
        id v30 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (!v30) {
          return;
        }
      }
    }
    CFStringRef v27 = @"Do not evaluate WiFi link, LQM not received yet";
  }
  else
  {
    CFStringRef v27 = @"Evaluate BT-WIFI Link: No IDS client available.";
  }

  +[WCM_Logging logLevel:27 message:v27];
}

- (int)evaluateLink:(unint64_t)a3 :(int)a4 :(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  if (a4 == 1 && byte_10027CEC1)
  {
    +[WCM_Logging logLevel:27 message:@"iRAT restarted, WiFi not yet initalized"];
    int v9 = 1;
    id v10 = "WIFI";
    goto LABEL_14;
  }
  mWiFi = self->mWiFi;
  if (!mWiFi)
  {
    CFStringRef v13 = @"Evaluate link: WiFi not initialized.";
LABEL_12:
    +[WCM_Logging logLevel:27 message:v13];
    int v9 = 2;
    id v10 = "BLUETOOTH";
    goto LABEL_14;
  }
  uint64_t v12 = [(WCM_WiFiController *)mWiFi wifiService];
  if (!v12)
  {
    CFStringRef v13 = @"Evaluate link: WiFi service not initialized.";
    goto LABEL_12;
  }
  id v10 = "BLUETOOTH";
  if ([(WCM_WiFiService *)v12 isWiFiPrimaryInterface])
  {
    if ([(WRM_IDSLinkEvalManager *)self canWiFiMeetIDSRequirement:a3 :v6 :v5])
    {
      id v10 = "WIFI";
      int v9 = 1;
    }
    else
    {
      int v9 = 2;
    }
  }
  else
  {
    int v9 = 2;
  }
LABEL_14:
  BOOL v14 = "CT_DATA";
  id v15 = "CT_VOICE";
  id v16 = "UNKNOWN_APP!!!";
  if (a3 == 2) {
    id v16 = "CT_Th_Call";
  }
  if (a3 != 1) {
    id v15 = v16;
  }
  if (a3) {
    BOOL v14 = v15;
  }
  +[WCM_Logging logLevel:27, @"{%s}iRAT: Evaluate link preferred: %s", v14, v10 message];
  return v9;
}

- (void)evaluateBandwidth
{
  id v2 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getSymptomsService];
  id v3 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getWiFiController];
  if (v3)
  {
    id v4 = [v3 wifiService];
    [v4 getEstimatedAvailableRxPhyBandwidth];
    float v6 = v5;
    [v4 getCalculatedAvailableRxPhyBandwidth];
    float v8 = v7;
    [v4 getCalculatedAvailableTxPhyBandwidth];
    float v10 = v9;
    +[WCM_Logging logLevel:27, @"WIFI Throughput Estimation, Estimated Rx PHY BW: %.2f, Calculated Rx PHY BW: %.2f, Calculated TX BW: %.2f", v6, v8, v9 message];
    LODWORD(v11) = 1151500288;
    *(float *)&double v12 = v6;
    [v4 getL3Bandwidth:v11 :v12];
    float v14 = v13;
    LODWORD(v15) = 1151500288;
    *(float *)&double v16 = v8;
    [v4 getL3Bandwidth:v15 :v16];
    float v18 = v17;
    LODWORD(v19) = 1151500288;
    *(float *)&double v20 = v10;
    [v4 getL3Bandwidth:v19 :v20];
    +[WCM_Logging logLevel:27, @"WIFI Throughput Estimation, Estimated L3 Rx PHY BW: %.2f, Calculated L3 Rx PHY BW: %.2f, Calculated L3 TX BW: %.2f", v14, v18, v21 message];
  }
  if (v2) {
    +[WCM_Logging logLevel:27, @"L3 Bandwidth BW: %.2f", 0 message];
  }
}

- (void)handleWiFiStateChaneEvents:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  +[WCM_Logging logLevel:27 message:@"WRM IDS Link Eval Manager received WiFi link state change event"];
  if (value)
  {
    id v5 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
    if (xpc_dictionary_get_int64(value, "kWRM_WiFi_LINK_STATUS"))
    {
      +[WCM_Logging logLevel:27 message:@"IDS Link Eval Manager:Link down event received"];
      if (![v5 p2pAssistanceEnabled])
      {
LABEL_13:
        [(WRM_IDSLinkEvalManager *)self evaluateBTWiFiLink];
        return;
      }
      p_mIDSP2PController = &self->mIDSP2PController;
      CFStringRef v7 = @"LinkDown";
      if ([(WRM_IDSP2PController *)self->mIDSP2PController IsIDSInitDone])
      {
LABEL_6:
        [(WRM_IDSP2PController *)*p_mIDSP2PController WrmSendp2pMessage:@"WiFi status" MessageBody:v7 withOptions:0];
        goto LABEL_13;
      }
    }
    else
    {
      int64_t int64 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_RSSI");
      int64_t v9 = xpc_dictionary_get_int64(value, "kWRMM_WiFi_SNR");
      +[WCM_Logging logLevel:27 message:@"IDS Link Eval Mgr :Linkup event received"];
      float v10 = [(WCM_WiFiController *)self->mWiFi wifiService];
      [(WCM_WiFiService *)v10 setRSSI:int64];
      [(WCM_WiFiService *)v10 setSNR:v9];
      if (![v5 p2pAssistanceEnabled]) {
        goto LABEL_13;
      }
      p_mIDSP2PController = &self->mIDSP2PController;
      CFStringRef v7 = @"LinkUP";
      if ([(WRM_IDSP2PController *)self->mIDSP2PController IsIDSInitDone]) {
        goto LABEL_6;
      }
    }
    [(WRM_IDSP2PController *)*p_mIDSP2PController InitService];
    goto LABEL_6;
  }

  +[WCM_Logging logLevel:27 message:@"IDS Link Eval Manager:Empty message received"];
}

- (void)addProximityiRatClient:(id)a3
{
  mQueueTerminus = self->mQueueTerminus;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100078380;
  v4[3] = &unk_10020DAB0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mQueueTerminus, v4);
}

- (void)removeProximityiRatClient:(id)a3
{
  if ([a3 queue]) {
    dispatch_release((dispatch_object_t)[a3 queue]);
  }
  [a3 setQueue:0];
  if ([a3 mTerminusContext])
  {

    [a3 setMTerminusContext:0];
  }
  id v5 = [(WRM_IDSLinkEvalManager *)self miRATProximityClientContexts];

  [(NSMutableArray *)v5 removeObject:a3];
}

- (void)deleteProximityiRATClient:(int)a3
{
  mQueueTerminus = self->mQueueTerminus;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000784BC;
  v4[3] = &unk_10020E678;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(mQueueTerminus, v4);
}

- (void)addiRatClient:(id)a3
{
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  [(NSMutableArray *)self->miRATClientContexts addObject:a3];
  [(WRM_IDSLinkEvalManager *)self existingContexts];

  objc_sync_exit(miRATClientContexts);
}

- (void)removeiRatClient:(id)a3
{
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  [(WRM_IDSLinkEvalManager *)self existingContexts];
  [(NSMutableArray *)self->miRATClientContexts removeObject:a3];
  [(WRM_IDSLinkEvalManager *)self existingContexts];

  objc_sync_exit(miRATClientContexts);
}

- (void)deleteiRATClient:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  id v6 = [(WRM_IDSLinkEvalManager *)self getiRATClientFromList:v3];
  if (v6) {
    [(WRM_IDSLinkEvalManager *)self removeiRatClient:v6];
  }
  objc_sync_exit(miRATClientContexts);
  mWiFi = self->mWiFi;
  BOOL v8 = [(WRM_IDSLinkEvalManager *)self needWiFiLQM];

  [(WCM_WiFiController *)mWiFi toggleWiFiLQMIfNeeded:v8];
}

- (void)existingContexts
{
}

- (void)handleControllerAvailability:(unint64_t)a3
{
  if ([(WRM_IDSLinkEvalManager *)self enableiRATManager])
  {
    if ((uint64_t)a3 > 10)
    {
      if (a3 == 12)
      {
        [(WRM_IDSLinkEvalManager *)self handleIDSToolRegisterd];
      }
      else if (a3 == 11)
      {
        [(WRM_IDSLinkEvalManager *)self handleIDSRegisterd];
      }
    }
    else if (a3 == 1)
    {
      [(WRM_IDSLinkEvalManager *)self handleWiFiRegistered];
    }
    else if (a3 == 4)
    {
      [(WRM_IDSLinkEvalManager *)self handleBTRegistered];
    }
  }
}

- (void)handleIDSToolRegisterd
{
}

- (void)handleIDSRegisterd
{
  if ([(WRM_IDSLinkEvalManager *)self getiRATClientFromList:4])
  {
    +[WCM_Logging logLevel:27 message:@"IDS Link Manager: configureIDSMetricsReporting."];
    [(WRM_IDSLinkEvalManager *)self configureIDSMetricsReporting];
  }

  +[WCM_Logging logLevel:27 message:@"IDS registration status changed."];
}

- (void)handleBTRegistered
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s BT registration status changed. State: %d", "-[WRM_IDSLinkEvalManager(privateFunctions) handleBTRegistered]", [(WCM_BTController *)self->mBT getBTState]);

  [(WRM_IDSLinkEvalManager *)self evaluateBTWiFiLink];
}

- (void)handleWiFiRegistered
{
  +[WCM_Logging logLevel:27 message:@"WiFi registration status changed."];
  if (!self->mWiFi)
  {
    +[WCM_Logging logLevel:18 message:@"WiFi did not register, can't get state"];
    [(WRM_IDSLinkEvalManager *)self evaluateBTWiFiLink];
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = [a1 WRM_IDSLinkEvalManagerSingleton:a3];

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

- (WRM_IDSLinkEvalManager)autorelease
{
  return self;
}

- (WRM_IDSLinkEvalManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)WRM_IDSLinkEvalManager;
  id v2 = [(WRM_IDSLinkEvalManager *)&v5 init];
  if (v2)
  {
    v2->mQueue = (OS_dispatch_queue *)[[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getQueue];
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v2->mQueueTerminus = (OS_dispatch_queue *)dispatch_queue_create("com.apple.WirelessRadioManager.IDSLinkEvalMgr", v3);
    v2->miRATClientContexts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    [(WRM_IDSLinkEvalManager *)v2 setMiRATProximityClientContexts:objc_alloc_init((Class)NSMutableArray)];
    v2->mIDSMetricsController = (WRM_IdsMetricsController *)+[WRM_IdsMetricsController WRM_IdsMetricsControllerSingleton];
    v2->mIDSP2PController = (WRM_IDSP2PController *)+[WRM_IDSP2PController wrm_IDSP2PControllerSingleton];
    +[WCM_Logging logLevel:27 message:@"IDS Linkeval Manager: IDS Eval manager initialized"];
    qword_10027CEB0 = 0;
    v2->mWiFi = 0;
    v2->mBT = 0;
    byte_10027CEC1 = 1;
    v2->mCurrentBTLQMScore = -1;
    v2->mBtLQMUpdateNeeded = 0;
  }
  return v2;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:27 message:@"Handover Manager: Dealloc called for IDS Linkeval manager "];
  [(NSMutableArray *)[(WRM_IDSLinkEvalManager *)self miRATProximityClientContexts] removeAllObjects];
  miRATClientContexts = self->miRATClientContexts;
  if (miRATClientContexts) {

  }
  if ([(WRM_IDSLinkEvalManager *)self miRATProximityClientContexts]) {
  self->mWiFi = 0;
  }
  self->mBT = 0;
  mIDSMetricsController = self->mIDSMetricsController;
  if (mIDSMetricsController) {

  }
  self->mIDSMetricsController = 0;
  mIDSP2PController = self->mIDSP2PController;
  if (mIDSP2PController) {

  }
  self->mIDSP2PController = 0;
  v6.receiver = self;
  v6.super_class = (Class)WRM_IDSLinkEvalManager;
  [(WRM_IDSLinkEvalManager *)&v6 dealloc];
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
  block[2] = sub_100078CF8;
  block[3] = &unk_10020DDC0;
  void block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(mQueue, block);
}

- (void)updateControllerState:(id)a3
{
  mQueueTerminus = self->mQueueTerminus;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000791D4;
  v4[3] = &unk_10020DAB0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(mQueueTerminus, v4);
}

- (BOOL)enableiRATManager
{
  return 1;
}

- (id)getiRATClientFromList:(int)a3
{
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v6 = self->miRATClientContexts;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        float v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 getMyClientType] == a3)
        {
          if ((a3 - 1) >= 0x15)
          {
            double v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
            if (a3 == 22) {
              double v11 = "ClientCoreMediaStreaming";
            }
          }
          else
          {
            double v11 = off_10020EFA8[a3 - 1];
          }
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s: Found valid irat context for %s", "-[WRM_IDSLinkEvalManager getiRATClientFromList:]", v11);
          goto LABEL_15;
        }
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  float v10 = 0;
LABEL_15:
  objc_sync_exit(miRATClientContexts);
  return v10;
}

- (id)getiRATProximityClientFromList:(int)a3
{
  miRATClientContexts = self->miRATClientContexts;
  objc_sync_enter(miRATClientContexts);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v6 = [(WRM_IDSLinkEvalManager *)self miRATProximityClientContexts];
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        float v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 getMyClientType] == a3)
        {
          if ((a3 - 1) >= 0x15)
          {
            double v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
            if (a3 == 22) {
              double v11 = "ClientCoreMediaStreaming";
            }
          }
          else
          {
            double v11 = off_10020EFA8[a3 - 1];
          }
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s: Found valid context for %s", "-[WRM_IDSLinkEvalManager getiRATProximityClientFromList:]", v11);
          goto LABEL_15;
        }
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  float v10 = 0;
LABEL_15:
  objc_sync_exit(miRATClientContexts);
  return v10;
}

- (BOOL)isPingPongAvoidanceTimerSatisfied:(id)a3
{
  id v4 = [[WRM_HandoverManager WRM_HandoverManagerSingleton] getiRATConfigController];
  [objc_msgSend(a3, "mTerminusContext") getDeltaTimeSinceLastCellularRecommendation];
  double v6 = v5;
  id v7 = [v4 dataBtStickinessTimeThreshMs];
  double v8 = v6 * 1000.0;
  +[WCM_Logging logLevel:27, @"delta time:%lf, effectiveBlockout time:%lld ", *(void *)&v8, v7 message];
  if (v8 >= (double)(unint64_t)v7) {
    [objc_msgSend(a3, "mTerminusContext") updatePrevTimeStamp];
  }
  return v8 >= (double)(unint64_t)v7;
}

- (void)updateBTLQMScore
{
  id v3 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
  if (!self->mIDSMetricsController) {
    goto LABEL_8;
  }
  id v4 = v3;
  mBT = self->mBT;
  if (!mBT) {
    goto LABEL_8;
  }
  id v6 = [(WCM_BTController *)mBT getMovingAvgBTRssi];
  unsigned int v7 = [(WCM_BTController *)self->mBT isBTMetricsValid];
  +[WCM_Logging logLevel:27, @"btMetricsValid: %d btMovingAvg RSSI %llu", v7, v6 message];
  if (!v6)
  {
LABEL_9:
    int v8 = 1;
    goto LABEL_10;
  }
  if (!v7)
  {
LABEL_8:
    int v8 = -1;
    goto LABEL_10;
  }
  if (v6 >= [v4 dataMinBtRssiTh1]) {
    goto LABEL_9;
  }
  if (v6 >= [v4 dataMinBtRssiTh0]) {
    int v8 = 2;
  }
  else {
    int v8 = 3;
  }
LABEL_10:
  self->mCurrentBTLQMScore = v8;
}

- (BOOL)isMarconiDevice
{
  return 1;
}

- (void)postBluetoothLQMScore:(BOOL)a3
{
  BOOL v3 = a3;
  +[WCM_Logging logLevel:27, @"postBluetoothLQMScore: mBtLQMUpdateNeeded %d", self->mBtLQMUpdateNeeded message];
  if (self->mBtLQMUpdateNeeded || v3)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      unsigned int v7 = v6;
      xpc_dictionary_set_int64(v6, "WRMLinkPrefBTScore_LQMScore", self->mCurrentBTLQMScore);
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      int v8 = [(WRM_IDSLinkEvalManager *)self miRATProximityClientContexts];
      id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          double v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) sendMessage:1309 withArgs:v7];
            +[WCM_Logging logLevel:27, @"BT LQMScore has changed, post: LQMScore %d", self->mCurrentBTLQMScore message];
            double v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
      xpc_release(v7);
    }
  }
}

- (void)evaluateBTWiFiLinkForTerminus
{
  mQueueTerminus = self->mQueueTerminus;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079894;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async(mQueueTerminus, block);
}

- (void)sendMessage:(int)a3 withMsg:(id)a4
{
  id v5 = [[+[WCM_Server singleton](WCM_Server, "singleton") getSessionFor:*(void *)&a3];

  [v5 sendMessage:a4];
}

- (BOOL)isBTLinkQualityGood
{
  id v2 = self;
  unint64_t v3 = [(WCM_BTController *)self->mBT getMovingAvgBTRssi];
  LODWORD(v2) = [(WCM_BTController *)v2->mBT isBTMetricsValid];
  id v4 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
  return v2 && v3 < (unint64_t)[v4 commCenterBTlpmThreasholdBTProximity];
}

- (unint64_t)getMovingAvgBTRssi
{
  return [(WCM_BTController *)self->mBT getMovingAvgBTRssi];
}

- (unint64_t)getBtTxPer
{
  [(WCM_BTController *)self->mBT getBtTxPer];
  return (unint64_t)(v2 * 100.0);
}

- (unint64_t)getWiFiRssi
{
  double v2 = [(WCM_WiFiController *)self->mWiFi wifiService];

  return [(WCM_WiFiService *)v2 getRSSI];
}

- (unint64_t)getBtRxPer
{
  return 0;
}

- (NSMutableArray)miRATProximityClientContexts
{
  return self->_miRATProximityClientContexts;
}

- (void)setMiRATProximityClientContexts:(id)a3
{
}

@end