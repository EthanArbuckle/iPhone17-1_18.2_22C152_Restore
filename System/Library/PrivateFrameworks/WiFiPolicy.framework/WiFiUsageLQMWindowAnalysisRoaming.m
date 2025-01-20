@interface WiFiUsageLQMWindowAnalysisRoaming
+ (BOOL)isColocatedRoam:(id)a3;
+ (BOOL)isWNMRoam:(id)a3;
+ (id)bssSupportWithFlags:(id)a3;
- ($6E47B81FEB72AA1B248A20B58E3F028F)roamConfigCriteria;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamConfigChannels;
- (BOOL)firstRoamAfterRoamRecommLifted;
- (BOOL)isColocatedRoam;
- (BOOL)isWNMScoreRoam;
- (NSString)roamBssSupports;
- (NSString)roamingReason;
- (NSString)roamingStatus;
- (WiFiUsageLQMWindowAnalysisRoaming)initWithRollingWindow:(id)a3 WithRoamingState:(BOOL)a4 andReasonString:(id)a5 andStatus:(unint64_t)a6 asString:(id)a7 andLatency:(unint64_t)a8 andRoamData:(id)a9 andCurrentBSSSession:(id)a10 andContext:(context)a11 andPingPongStats:(id)a12 andTimestamp:(id)a13 onQueue:(id)a14;
- (WiFiUsageSessionPingPongStats)pingPongStats;
- (double)roamSuppressionWaitForRoamEnd;
- (double)roamSuppressionWaitForRoamStart;
- (id)addDimensionsTo:(id)a3;
- (int64_t)latency;
- (int64_t)originRssi;
- (int64_t)roamConfigTriggerRssi;
- (int64_t)scanDuration;
- (int64_t)targetRssi;
- (unint64_t)roamFullBandScanCount;
- (unint64_t)roamPartialBandScanCount;
- (unint64_t)roamPktsPendingAqm;
- (unint64_t)roamPktsPendingTxSubQ;
- (unint64_t)roamScannedChannelCount;
- (unint64_t)roamSuppressionEnabledPerc;
- (void)setFirstRoamAfterRoamRecommLifted:(BOOL)a3;
- (void)setIsColocatedRoam:(BOOL)a3;
- (void)setIsWNMScoreRoam:(BOOL)a3;
- (void)setLatency:(int64_t)a3;
- (void)setOriginRssi:(int64_t)a3;
- (void)setPingPongStats:(id)a3;
- (void)setRoamBssSupports:(id)a3;
- (void)setRoamConfigChannels:(id *)a3;
- (void)setRoamConfigCriteria:(id *)a3;
- (void)setRoamConfigTriggerRssi:(int64_t)a3;
- (void)setRoamFullBandScanCount:(unint64_t)a3;
- (void)setRoamPartialBandScanCount:(unint64_t)a3;
- (void)setRoamPktsPendingAqm:(unint64_t)a3;
- (void)setRoamPktsPendingTxSubQ:(unint64_t)a3;
- (void)setRoamScannedChannelCount:(unint64_t)a3;
- (void)setRoamSuppressionEnabledPerc:(unint64_t)a3;
- (void)setRoamSuppressionWaitForRoamEnd:(double)a3;
- (void)setRoamSuppressionWaitForRoamStart:(double)a3;
- (void)setRoamingReason:(id)a3;
- (void)setRoamingStatus:(id)a3;
- (void)setScanDuration:(int64_t)a3;
- (void)setTargetRssi:(int64_t)a3;
@end

@implementation WiFiUsageLQMWindowAnalysisRoaming

- (WiFiUsageLQMWindowAnalysisRoaming)initWithRollingWindow:(id)a3 WithRoamingState:(BOOL)a4 andReasonString:(id)a5 andStatus:(unint64_t)a6 asString:(id)a7 andLatency:(unint64_t)a8 andRoamData:(id)a9 andCurrentBSSSession:(id)a10 andContext:(context)a11 andPingPongStats:(id)a12 andTimestamp:(id)a13 onQueue:(id)a14
{
  __int16 v56 = a6;
  id v17 = a5;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  id v21 = a12;
  v60.receiver = self;
  v60.super_class = (Class)WiFiUsageLQMWindowAnalysisRoaming;
  v22 = [(WiFiUsageLQMWindowAnalysis *)&v60 initWithRollingWindow:a3 andReason:@"Roaming" andContext:*(void *)&a11.var0 & 0xFFFFFFLL andTimestamp:a13 onQueue:a14];
  v23 = v22;
  if (v22)
  {
    [(WiFiUsageLQMWindowAnalysisRoaming *)v22 setRoamingReason:v17];
    [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setRoamingStatus:v18];
    [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setLatency:a8];
    uint64_t v24 = [v19 objectForKey:@"ROAMEDEVENT_FLAGS"];
    id v25 = v18;
    if ((v56 & 0x1FF) != 0)
    {
      [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setRoamBssSupports:0];
      [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setIsWNMScoreRoam:0];
      BOOL v26 = 0;
    }
    else
    {
      +[WiFiUsageLQMWindowAnalysisRoaming bssSupportWithFlags:v24];
      v28 = id v27 = v19;
      [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setRoamBssSupports:v28];

      id v19 = v27;
      [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setIsWNMScoreRoam:+[WiFiUsageLQMWindowAnalysisRoaming isWNMRoam:v24]];
      BOOL v26 = +[WiFiUsageLQMWindowAnalysisRoaming isColocatedRoam:v24];
    }
    [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setIsColocatedRoam:v26];
    if (v20)
    {
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamConfigTriggerRssi:](v23, "setRoamConfigTriggerRssi:", [v20 roamConfigTriggerRssi]);
      [v20 roamConfigChannels];
      [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setRoamConfigChannels:v59];
      [v20 roamConfigCriteria];
    }
    else
    {
      [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setRoamConfigTriggerRssi:0x7FFFFFFFFFFFFFFFLL];
      memset(v59, 0, sizeof(v59));
      [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setRoamConfigChannels:v59];
      memset(v58, 0, sizeof(v58));
    }
    [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setRoamConfigCriteria:v58];
    v29 = [v19 objectForKey:@"ROAMEDEVENT_ORIGIN_RSSI"];
    v51 = v29;
    if (v29) {
      uint64_t v30 = [v29 integerValue];
    }
    else {
      uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setOriginRssi:v30];
    v31 = [v19 objectForKey:@"ROAMEDEVENT_TARGET_RSSI"];
    v50 = v31;
    if (v31) {
      uint64_t v32 = [v31 integerValue];
    }
    else {
      uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v55 = v17;
    [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setTargetRssi:v32];
    id v53 = v21;
    [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setPingPongStats:v21];
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamSuppressionEnabledPerc:](v23, "setRoamSuppressionEnabledPerc:", [v20 inRoamSuppressionEnabledDurationPerc]);
    -[WiFiUsageLQMWindowAnalysisRoaming setFirstRoamAfterRoamRecommLifted:](v23, "setFirstRoamAfterRoamRecommLifted:", [v20 roamsAfterSupprLifted] == 1);
    if (v23->_firstRoamAfterRoamRecommLifted)
    {
      [v20 lastRoamSuppressionWaitForRoamStart];
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamSuppressionWaitForRoamStart:](v23, "setRoamSuppressionWaitForRoamStart:");
      [v20 lastRoamSuppressionWaitForRoamEnd];
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamSuppressionWaitForRoamEnd:](v23, "setRoamSuppressionWaitForRoamEnd:");
    }
    v33 = [v19 objectForKey:@"ROAM_SCAN_SUMMARY"];
    v57 = v19;
    v34 = [v19 objectForKey:@"ROAMEDEVENT_CHANNELS_SCANNED_COUNT"];
    v35 = [v33 objectForKey:@"ROAM_SCAN_DURATION"];
    v36 = [v33 objectForKey:@"ROAM_NUM_FULL_BAND_SCANS"];
    v37 = [v33 objectForKey:@"ROAM_NUM_PARTIAL_SCANS"];
    if (v34) {
      uint64_t v38 = [v34 unsignedIntegerValue];
    }
    else {
      uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setRoamScannedChannelCount:v38];
    if (v35) {
      uint64_t v39 = [v35 unsignedIntegerValue];
    }
    else {
      uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setScanDuration:v39];
    if (v36) {
      uint64_t v40 = [v36 unsignedIntegerValue];
    }
    else {
      uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setRoamFullBandScanCount:v40];
    v52 = v25;
    v49 = (void *)v24;
    if (v37) {
      uint64_t v41 = [v37 unsignedIntegerValue];
    }
    else {
      uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setRoamPartialBandScanCount:v41];
    v42 = [v57 objectForKey:@"ROAM_PKT_LOSS_INFO"];
    v43 = [v42 objectForKey:@"ROAM_PKTS_PENDING_AQM"];
    v44 = [v42 objectForKey:@"ROAM_PKTS_PENDING_TXSUBQ"];
    if (v43) {
      uint64_t v45 = [v43 unsignedIntegerValue];
    }
    else {
      uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setRoamPktsPendingAqm:v45];
    if (v44) {
      uint64_t v46 = [v44 unsignedIntegerValue];
    }
    else {
      uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [(WiFiUsageLQMWindowAnalysisRoaming *)v23 setRoamPktsPendingTxSubQ:v46];
    v47 = v23;

    id v17 = v55;
    id v19 = v57;
    id v18 = v52;
    id v21 = v53;
  }

  return v23;
}

+ (BOOL)isColocatedRoam:(id)a3
{
  if (a3) {
    return ((unint64_t)[a3 unsignedIntegerValue] >> 7) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (BOOL)isWNMRoam:(id)a3
{
  if (a3) {
    return ((unint64_t)[a3 unsignedIntegerValue] >> 6) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (id)bssSupportWithFlags:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if (!v3) {
    goto LABEL_9;
  }
  char v5 = [v3 unsignedIntegerValue];
  char v6 = v5;
  if (v5)
  {
    [v4 appendString:@"NR&"];
    if ((v6 & 2) == 0)
    {
LABEL_4:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v4 appendString:@"FT&"];
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      goto LABEL_6;
    }
LABEL_15:
    [v4 appendString:@"adaptiveFBT&"];
    if ((v6 & 0x10) == 0)
    {
LABEL_7:
      if ((v6 & 0x20) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_14:
  [v4 appendString:@"BTM&"];
  if ((v6 & 8) != 0) {
    goto LABEL_15;
  }
LABEL_6:
  if ((v6 & 0x10) == 0) {
    goto LABEL_7;
  }
LABEL_16:
  [v4 appendString:@"fastlane&"];
  if ((v6 & 0x20) != 0) {
LABEL_8:
  }
    [v4 appendString:@"ntwAssurance&"];
LABEL_9:
  v7 = [NSString stringWithString:v4];

  return v7;
}

- (id)addDimensionsTo:(id)a3
{
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)WiFiUsageLQMWindowAnalysisRoaming;
  id v5 = [(WiFiUsageLQMWindowAnalysis *)&v64 addDimensionsTo:v4];
  [v4 setObject:self->_roamingReason forKeyedSubscript:@"roamingReason"];
  [v4 setObject:self->_roamingStatus forKeyedSubscript:@"roamingStatus"];
  char v6 = [NSNumber numberWithBool:self->_isWNMScoreRoam];
  [v4 setObject:v6 forKeyedSubscript:@"roamIsWNMScoreRoam"];

  v7 = [NSNumber numberWithBool:self->_isColocatedRoam];
  [v4 setObject:v7 forKeyedSubscript:@"roamIsColocatedRoam"];

  [v4 setObject:self->_roamBssSupports forKeyedSubscript:@"roamTargetBssSupports"];
  v8 = +[WiFiUsageLQMTransformations numberForKeyPath:@"roamConfigTriggerRssi" ofObject:self];
  [v4 setObject:v8 forKeyedSubscript:@"roamConfigTriggerRssi"];

  long long v9 = *(_OWORD *)&self->_roamConfigChannels.valueByBand[2];
  v63[0] = *(_OWORD *)self->_roamConfigChannels.valueByBand;
  v63[1] = v9;
  v10 = +[WiFiUsagePrivacyFilter getLabelForIntegerByBand:v63];
  [v4 setObject:v10 forKeyedSubscript:@"roamConfigChannelsByBand"];

  v11 = [NSNumber numberWithBool:self->_roamConfigCriteria.isAllowed];
  [v4 setObject:v11 forKeyedSubscript:@"roamConfigIsARAllowed"];

  v12 = [NSNumber numberWithBool:self->_roamConfigCriteria.forceApply];
  [v4 setObject:v12 forKeyedSubscript:@"roamConfigIsARForceApplied"];

  v13 = [NSNumber numberWithBool:self->_roamConfigCriteria.deviceSupport];
  [v4 setObject:v13 forKeyedSubscript:@"roamConfigDeviceSupportsAR"];

  v14 = [NSNumber numberWithBool:self->_roamConfigCriteria.isEAP];
  [v4 setObject:v14 forKeyedSubscript:@"roamConfigIsEAP"];

  v15 = [NSNumber numberWithInteger:self->_roamConfigCriteria.environment];
  [v4 setObject:v15 forKeyedSubscript:@"roamConfigEnv"];

  v16 = [NSNumber numberWithInteger:self->_roamConfigCriteria.networkOfInterestType];
  [v4 setObject:v16 forKeyedSubscript:@"roamConfigNetworkType"];

  id v17 = [NSNumber numberWithInteger:self->_roamConfigCriteria.LOIType];
  [v4 setObject:v17 forKeyedSubscript:@"roamConfigARLOIType"];

  int64_t originRssi = self->_originRssi;
  if (originRssi == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"roamOriginRssi"];
  }
  else
  {
    id v19 = +[WiFiUsageLQMTransformations getBinRssi:originRssi As:0];
    [v4 setObject:v19 forKeyedSubscript:@"roamOriginRssi"];
  }
  int64_t targetRssi = self->_targetRssi;
  if (targetRssi == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"roamTargetRssi"];
  }
  else
  {
    id v21 = +[WiFiUsageLQMTransformations getBinRssi:targetRssi As:0];
    [v4 setObject:v21 forKeyedSubscript:@"roamTargetRssi"];
  }
  v62.receiver = self;
  v62.super_class = (Class)WiFiUsageLQMWindowAnalysisRoaming;
  v22 = [(WiFiUsageLQMWindowAnalysis *)&v62 windowBeforeTrigger];
  v23 = [v22 samples];
  uint64_t v24 = [v23 lastObject];
  id v25 = +[WiFiUsageLQMTransformations numberForKeyPath:@"driverRoamRecommended" ofObject:v24];
  [v4 setObject:v25 forKeyedSubscript:@"roamingRecommended"];

  v61.receiver = self;
  v61.super_class = (Class)WiFiUsageLQMWindowAnalysisRoaming;
  BOOL v26 = [(WiFiUsageLQMWindowAnalysis *)&v61 windowBeforeTrigger];
  id v27 = [v26 samples];
  v28 = [v27 lastObject];
  v29 = +[WiFiUsageLQMTransformations numberForKeyPath:@"driverTDrecommended" ofObject:v28];
  [v4 setObject:v29 forKeyedSubscript:@"tdRecommended"];

  v60.receiver = self;
  v60.super_class = (Class)WiFiUsageLQMWindowAnalysisRoaming;
  uint64_t v30 = [(WiFiUsageLQMWindowAnalysis *)&v60 windowBeforeTrigger];
  v31 = [v30 samples];
  uint64_t v32 = [v31 lastObject];

  v33 = +[WiFiUsageLQMTransformations numberForKeyPath:@"chanQualScore" ofObject:v32];
  [v4 setObject:v33 forKeyedSubscript:@"last_chanQualScore_before"];

  v34 = +[WiFiUsageLQMTransformations numberForKeyPath:@"txLatencyScore" ofObject:v32];
  [v4 setObject:v34 forKeyedSubscript:@"last_txLatencyScore_before"];

  v35 = +[WiFiUsageLQMTransformations numberForKeyPath:@"rxLatencyScore" ofObject:v32];
  [v4 setObject:v35 forKeyedSubscript:@"last_rxLatencyScore_before"];

  v36 = +[WiFiUsageLQMTransformations numberForKeyPath:@"txLossScore" ofObject:v32];
  [v4 setObject:v36 forKeyedSubscript:@"last_txLossScore_before"];

  v37 = +[WiFiUsageLQMTransformations numberForKeyPath:@"rxLossScore" ofObject:v32];
  [v4 setObject:v37 forKeyedSubscript:@"last_rxLossScore_before"];

  uint64_t v38 = +[WiFiUsageLQMTransformations numberForKeyPath:@"txLatencyP95" ofObject:v32];
  uint64_t v39 = v38;
  if (v38)
  {
    uint64_t v40 = +[WiFiUsageLQMSample binLabelfromFieldName:value:](WiFiUsageLQMUserSample, "binLabelfromFieldName:value:", @"txLatencyP95", [v38 unsignedIntegerValue]);
    [v4 setObject:v40 forKeyedSubscript:@"last_txLatencyP95_before"];
  }
  else
  {
    [v4 setObject:0 forKeyedSubscript:@"last_txLatencyP95_before"];
  }
  uint64_t v41 = +[WiFiUsageLQMTransformations numberForKeyPath:@"pingPongNth" ofObject:self->_pingPongStats];
  [v4 setObject:v41 forKeyedSubscript:@"roamPingPongNth"];

  v42 = +[WiFiUsageLQMTransformations getLabelPingPongStats:self->_pingPongStats];
  [v4 setObject:v42 forKeyedSubscript:@"roamPingPongSequence"];

  v43 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:self->_roamSuppressionEnabledPerc As:0];
  [v4 setObject:v43 forKeyedSubscript:@"roamSuppressedEnabledPerc"];

  if (self->_firstRoamAfterRoamRecommLifted)
  {
    v44 = +[WiFiUsageLQMTransformations getBinForRoamingLatency:(unint64_t)(self->_roamSuppressionWaitForRoamStart * 1000.0) As:0];
    [v4 setObject:v44 forKeyedSubscript:@"roamSuppressionWaitForRoamStart"];

    uint64_t v45 = +[WiFiUsageLQMTransformations getBinForRoamingLatency:(unint64_t)(self->_roamSuppressionWaitForRoamEnd * 1000.0) As:0];
    [v4 setObject:v45 forKeyedSubscript:@"roamSuppressionWaitForRoamEnd"];
  }
  int64_t latency = self->_latency;
  if (latency == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"roamingLatencyms"];
  }
  else
  {
    v47 = +[WiFiUsageLQMTransformations getBinForRoamingLatency:latency As:0];
    [v4 setObject:v47 forKeyedSubscript:@"roamingLatencyms"];
  }
  int64_t scanDuration = self->_scanDuration;
  if (scanDuration == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"roamScanDuration"];
  }
  else
  {
    v49 = +[WiFiUsageLQMTransformations getBinForRoamingLatency:scanDuration As:0];
    [v4 setObject:v49 forKeyedSubscript:@"roamScanDuration"];
  }
  v50 = +[WiFiUsageLQMTransformations getBinScannedChannels:self->_roamScannedChannelCount As:0];
  [v4 setObject:v50 forKeyedSubscript:@"roamScannedChannelCountAsString"];

  v51 = +[WiFiUsageLQMTransformations numberForKeyPath:@"roamFullBandScanCount" ofObject:self];
  v52 = [v51 description];
  [v4 setObject:v52 forKeyedSubscript:@"roamFullBandScanCount"];

  id v53 = +[WiFiUsageLQMTransformations numberForKeyPath:@"roamPartialBandScanCount" ofObject:self];
  v54 = [v53 description];
  [v4 setObject:v54 forKeyedSubscript:@"roamPartialBandScanCount"];

  unint64_t roamPktsPendingAqm = self->_roamPktsPendingAqm;
  if (roamPktsPendingAqm == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"roamPktsPendingAqm"];
  }
  else
  {
    __int16 v56 = +[WiFiUsageLQMTransformations getBinFrames:roamPktsPendingAqm As:0];
    [v4 setObject:v56 forKeyedSubscript:@"roamPktsPendingAqm"];
  }
  unint64_t roamPktsPendingTxSubQ = self->_roamPktsPendingTxSubQ;
  if (roamPktsPendingTxSubQ == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"roamPktsPendingTxSubQ"];
  }
  else
  {
    v58 = +[WiFiUsageLQMTransformations getBinFrames:roamPktsPendingTxSubQ As:0];
    [v4 setObject:v58 forKeyedSubscript:@"roamPktsPendingTxSubQ"];
  }

  return v4;
}

- (NSString)roamingReason
{
  return self->_roamingReason;
}

- (void)setRoamingReason:(id)a3
{
}

- (NSString)roamingStatus
{
  return self->_roamingStatus;
}

- (void)setRoamingStatus:(id)a3
{
}

- (int64_t)latency
{
  return self->_latency;
}

- (void)setLatency:(int64_t)a3
{
  self->_int64_t latency = a3;
}

- (BOOL)isWNMScoreRoam
{
  return self->_isWNMScoreRoam;
}

- (void)setIsWNMScoreRoam:(BOOL)a3
{
  self->_isWNMScoreRoam = a3;
}

- (BOOL)isColocatedRoam
{
  return self->_isColocatedRoam;
}

- (void)setIsColocatedRoam:(BOOL)a3
{
  self->_isColocatedRoam = a3;
}

- (NSString)roamBssSupports
{
  return self->_roamBssSupports;
}

- (void)setRoamBssSupports:(id)a3
{
}

- (int64_t)roamConfigTriggerRssi
{
  return self->_roamConfigTriggerRssi;
}

- (void)setRoamConfigTriggerRssi:(int64_t)a3
{
  self->_roamConfigTriggerRssi = a3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamConfigChannels
{
  long long v3 = *(_OWORD *)self[9].var1;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[9].var0[1];
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setRoamConfigChannels:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_roamConfigChannels.valueByBand = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_roamConfigChannels.valueByBand[2] = v3;
}

- ($6E47B81FEB72AA1B248A20B58E3F028F)roamConfigCriteria
{
  long long v3 = *(_OWORD *)&self[10].var6;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[10].var4;
  *(_OWORD *)&retstr->var5 = v3;
  return self;
}

- (void)setRoamConfigCriteria:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_roamConfigCriteria.isAllowed = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_roamConfigCriteria.networkOfInterestType = v3;
}

- (int64_t)originRssi
{
  return self->_originRssi;
}

- (void)setOriginRssi:(int64_t)a3
{
  self->_int64_t originRssi = a3;
}

- (int64_t)targetRssi
{
  return self->_targetRssi;
}

- (void)setTargetRssi:(int64_t)a3
{
  self->_int64_t targetRssi = a3;
}

- (WiFiUsageSessionPingPongStats)pingPongStats
{
  return self->_pingPongStats;
}

- (void)setPingPongStats:(id)a3
{
}

- (unint64_t)roamSuppressionEnabledPerc
{
  return self->_roamSuppressionEnabledPerc;
}

- (void)setRoamSuppressionEnabledPerc:(unint64_t)a3
{
  self->_roamSuppressionEnabledPerc = a3;
}

- (BOOL)firstRoamAfterRoamRecommLifted
{
  return self->_firstRoamAfterRoamRecommLifted;
}

- (void)setFirstRoamAfterRoamRecommLifted:(BOOL)a3
{
  self->_firstRoamAfterRoamRecommLifted = a3;
}

- (double)roamSuppressionWaitForRoamStart
{
  return self->_roamSuppressionWaitForRoamStart;
}

- (void)setRoamSuppressionWaitForRoamStart:(double)a3
{
  self->_roamSuppressionWaitForRoamStart = a3;
}

- (double)roamSuppressionWaitForRoamEnd
{
  return self->_roamSuppressionWaitForRoamEnd;
}

- (void)setRoamSuppressionWaitForRoamEnd:(double)a3
{
  self->_roamSuppressionWaitForRoamEnd = a3;
}

- (int64_t)scanDuration
{
  return self->_scanDuration;
}

- (void)setScanDuration:(int64_t)a3
{
  self->_int64_t scanDuration = a3;
}

- (unint64_t)roamScannedChannelCount
{
  return self->_roamScannedChannelCount;
}

- (void)setRoamScannedChannelCount:(unint64_t)a3
{
  self->_roamScannedChannelCount = a3;
}

- (unint64_t)roamFullBandScanCount
{
  return self->_roamFullBandScanCount;
}

- (void)setRoamFullBandScanCount:(unint64_t)a3
{
  self->_roamFullBandScanCount = a3;
}

- (unint64_t)roamPartialBandScanCount
{
  return self->_roamPartialBandScanCount;
}

- (void)setRoamPartialBandScanCount:(unint64_t)a3
{
  self->_roamPartialBandScanCount = a3;
}

- (unint64_t)roamPktsPendingAqm
{
  return self->_roamPktsPendingAqm;
}

- (void)setRoamPktsPendingAqm:(unint64_t)a3
{
  self->_unint64_t roamPktsPendingAqm = a3;
}

- (unint64_t)roamPktsPendingTxSubQ
{
  return self->_roamPktsPendingTxSubQ;
}

- (void)setRoamPktsPendingTxSubQ:(unint64_t)a3
{
  self->_unint64_t roamPktsPendingTxSubQ = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pingPongStats, 0);
  objc_storeStrong((id *)&self->_roamBssSupports, 0);
  objc_storeStrong((id *)&self->_roamingStatus, 0);

  objc_storeStrong((id *)&self->_roamingReason, 0);
}

@end