@interface WRM_AWDService
- (WRM_AWDService)init;
- (id)convetDataLqmToString:(int)a3;
- (void)dealloc;
- (void)submitDataLinkPreferenceaMetrics;
- (void)submitMeric5GVersusWiFiLinkMetrics;
- (void)submitMericStreaming;
- (void)submitMetricWiFiCallingEnd;
- (void)submitMetricsCBRSForSim:(int64_t)a3 dataLQM:(int)a4 congested:(BOOL)a5;
- (void)submitMetricsFaceTimeHandover;
- (void)submitMetricsTelephonyOrFtCallEnd:(BOOL)a3;
- (void)submitProximityMetrics:(BOOL)a3;
@end

@implementation WRM_AWDService

- (WRM_AWDService)init
{
  v5.receiver = self;
  v5.super_class = (Class)WRM_AWDService;
  v2 = [(WRM_AWDService *)&v5 init];
  if (v2)
  {
    v3 = (NSDate *)[+[NSDate date] copy];
    v2->curProximityReportInterval = 0.0;
    v2->prevProximityReportInterval = 0.0;
    v2->mProximityReportTimer = v3;
  }
  return v2;
}

- (void)dealloc
{
  p_mProximityReportTimer = &self->mProximityReportTimer;
  mProximityReportTimer = self->mProximityReportTimer;
  if (mProximityReportTimer)
  {

    *p_mProximityReportTimer = 0;
    p_mProximityReportTimer[1] = 0;
    p_mProximityReportTimer[2] = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WRM_AWDService;
  [(WRM_AWDService *)&v5 dealloc];
}

- (void)submitMetricsTelephonyOrFtCallEnd:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (unsigned int *)[+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton") getWRMFaceTimeHandover];
  if (v4)
  {
    objc_super v5 = v4;
    id v6 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
    id v7 = objc_alloc_init((Class)sub_10013650C());
    id v8 = objc_alloc_init((Class)sub_1001365FC());
    id v9 = objc_alloc_init((Class)sub_1001366EC());
    [v7 setTimeOfDay:+[WRM_Timer getTimeStamp](WRM_Timer, "getTimeStamp")];
    [v7 setIsCallFailed:v3];
    int v10 = v5[39] - 1;
    if (v10 > 4)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v11 = dword_100207540[v10];
      uint64_t v12 = dword_100207554[v10];
    }
    [v7 setMessageType:v11];
    [v7 setMessageTrigger:v12];
    [v7 setWifiRssi:*((void *)v5 + 2)];
    [v7 setWifiSNR:*((void *)v5 + 3)];
    [v7 setWifiQbssLoad:v5[9]];
    [v7 setWifiCca:v5[8]];
    [v7 setWifiStationCount:v5[15]];
    [v7 setWifiEstimatedBW:v5[16]];
    [v7 setWifiRxPhyRate:v5[10]];
    [v7 setWifiTxPhyRate:v5[13]];
    [v7 setWifiTxPER:v5[12]];
    [v7 setWifiRxRetry:v5[11]];
    [v7 setWifiCaptiveNetworks:*((unsigned __int8 *)v5 + 56)];
    [v7 setCellDataLQM:v5[30]];
    [v7 setCellVoiceLQM:v5[31]];
    v13 = (void *)*((void *)v5 + 13);
    if (v13)
    {
      if ([v13 isEqualToString:@"LTE"])
      {
        +[WCM_Logging logLevel:25, @"submitMetricsTelephonyOrFtCallEnd rat= LTE, rsrp=%d, snr=%d, rsrq=%d", v5[32], v5[34], v5[33] message];
        [v7 setCellRatType:@"LTE"];
        [v7 setCellLteRSRP:v5[32]];
        [v7 setCellLteSNR:v5[34]];
        [v7 setCellLteRSRQ:v5[33]];
      }
      else if ([*((id *)v5 + 13) isEqualToString:@"N_RADIO"])
      {
        +[WCM_Logging logLevel:25, @"submitMetricsTelephonyOrFtCallEnd rat= NR, rsrp=%d, snr=%d, rsrq=%d", v5[32], v5[34], v5[33] message];
        [v7 setCellRatType:@"N_RADIO"];
        [v7 setCellNrRSRP:v5[32]];
        [v7 setCellNrSNR:v5[34]];
        [v7 setCellNrRSRQ:v5[33]];
      }
      else if ([*((id *)v5 + 13) isEqualToString:@"UMTS"])
      {
        +[WCM_Logging logLevel:25, @"submitMetricsTelephonyOrFtCallEnd rat= UMTS, rsrp=%d, snr=%d", v5[32], v5[34] message];
        [v7 setCellRatType:@"UMTS"];
        [v7 setCellLteRSRP:v5[32]];
        [v7 setCellLteSNR:v5[34]];
      }
    }
    if ((v5[39] & 0xFFFFFFFE) == 2)
    {
      [v7 setFtFacetimeAction:v5[22]];
      [v7 setFtFacetimePacketLoss:v5[23]];
      [v7 setFtFacetimeTimeDelay:v5[24]];
      [v7 setFtCounter:v5[2]];
    }
    [v7 setWrmAlertedMode:*((unsigned __int8 *)v5 + 140)];
    [v7 setWrmIsPCDetected:*((unsigned __int8 *)v5 + 142)];
    [v7 setWrmIsStallDetected:*((unsigned __int8 *)v5 + 143)];
    [v7 setWrmAudioErasure:v5[36]];
    [v7 setWrmVideoErasure:v5[37]];
    [v6 getLastKnownLatitude];
    [v8 setLat:];
    [v6 getLastKnownLongitude];
    [v8 setLng:];
    [v9 setLatLng:v8];
    [v7 setLocation:v9];
    id v14 = objc_alloc((Class)NSDate);
    [v6 getLastKnownLocationTimestamp];
    id v20 = [v14 initWithTimeIntervalSince1970:];
    [v8 lat];
    uint64_t v16 = v15;
    [v8 lng];
    uint64_t v18 = v17;
    [v20 timeIntervalSinceNow];
    +[WCM_Logging logLevel:25, @"submitMetricsTelephonyOrFtCallEnd callFailed=%d, lat=%f, lng=%f location obtained from %fseconds before", v3, v16, v18, -v19 message];
    [(id)sub_1001367DC() reportCellConnectionQualityHarvestRecord:v7];
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, @"%s:metric is not ready", "-[WRM_AWDService submitMetricsTelephonyOrFtCallEnd:]");
  }
}

- (void)submitMetricsFaceTimeHandover
{
  v2 = (unsigned int *)[[+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton") getWRMFaceTimeHandover];
  if (v2)
  {
    +[WCM_Logging logLevel:16 message:@"submit CA metric com.apple.Telephony.wrmFacetimeRecommendation"];
    AnalyticsSendEventLazy();
    id v3 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
    id v4 = objc_alloc_init((Class)sub_10013650C());
    id v5 = objc_alloc_init((Class)sub_1001365FC());
    id v6 = objc_alloc_init((Class)sub_1001366EC());
    [v4 setTimeOfDay:+[WRM_Timer getTimeStamp](WRM_Timer, "getTimeStamp")];
    [v4 setWifiRssi:*((void *)v2 + 2)];
    [v4 setWifiSNR:*((void *)v2 + 3)];
    [v4 setWifiQbssLoad:v2[9]];
    [v4 setWifiCca:v2[8]];
    [v4 setWifiStationCount:v2[15]];
    [v4 setWifiEstimatedBW:v2[16]];
    [v4 setWifiRxPhyRate:v2[10]];
    [v4 setWifiTxPhyRate:v2[13]];
    [v4 setWifiTxPER:v2[12]];
    [v4 setWifiRxRetry:v2[11]];
    [v4 setWifiCaptiveNetworks:*((unsigned __int8 *)v2 + 56)];
    [v4 setCellDataLQM:v2[30]];
    [v4 setCellVoiceLQM:v2[31]];
    id v7 = (void *)*((void *)v2 + 13);
    if (v7)
    {
      if ([v7 isEqualToString:@"LTE"])
      {
        +[WCM_Logging logLevel:25, @"GEONetworkSelectionHarvestReporter rat= LTE, rsrp=%d, snr=%d, rsrq=%d", v2[32], v2[34], v2[33], _NSConcreteStackBlock, 3221225472, sub_100136CB4, &unk_100211EF0, v2 message];
        [v4 setCellRatType:@"LTE"];
        [v4 setCellLteRSRP:v2[32]];
        [v4 setCellLteSNR:v2[34]];
        [v4 setCellLteRSRQ:v2[33]];
      }
      else if ([*((id *)v2 + 13) isEqualToString:@"N_RADIO"])
      {
        +[WCM_Logging logLevel:25, @"GEONetworkSelectionHarvestReporter rat= NR, rsrp=%d, snr=%d, rsrq=%d", v2[32], v2[34], v2[33], _NSConcreteStackBlock, 3221225472, sub_100136CB4, &unk_100211EF0, v2 message];
        [v4 setCellRatType:@"N_RADIO"];
        [v4 setCellNrRSRP:v2[32]];
        [v4 setCellNrSNR:v2[34]];
        [v4 setCellNrRSRQ:v2[33]];
      }
    }
    [v4 setFtFacetimeAction:v2[22]];
    [v4 setFtFacetimePacketLoss:v2[23]];
    [v4 setFtFacetimeTimeDelay:v2[24]];
    [v4 setFtCounter:v2[2]];
    [v4 setFtIRATRecommendation:*((void *)v2 + 9)];
    [v4 setFtIRATRecommendationReason:*((void *)v2 + 10)];
    [v4 setWrmAlertedMode:*((unsigned __int8 *)v2 + 140)];
    [v4 setWrmIsPCDetected:*((unsigned __int8 *)v2 + 142)];
    [v4 setWrmIsStallDetected:*((unsigned __int8 *)v2 + 143)];
    [v4 setWrmAudioErasure:v2[36]];
    [v4 setWrmVideoErasure:v2[37]];
    if (objc_msgSend(+[WRM_SCService WRM_SCServiceControllerSingleton](WRM_SCService, "WRM_SCServiceControllerSingleton"), "isWiFiPrimary"))
    {
      [v3 getLastKnownLatitude];
      [v5 setLat:];
      [v3 getLastKnownLongitude];
      [v5 setLng:];
      [v6 setLatLng:v5];
      [v4 setLocation:v6];
      [v5 lat];
      uint64_t v9 = v8;
      [v5 lng];
      +[WCM_Logging logLevel:25, @"GEONetworkSelectionHarvestReporter wifi primary, lat=%f, lng=%f", v9, v10 message];
    }
    else
    {
      +[WCM_Logging logLevel:25, @"GEONetworkSelectionHarvestReporter wifi Not primary", v11, v12 message];
    }
    [(id)sub_1001367DC() reportCellConnectionQualityHarvestRecord:v4];

    [[+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton")] resetFaceTimeHandover];
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, @"%s: WRMMetricsiRATFaceTimeHandover metric is not ready", "-[WRM_AWDService submitMetricsFaceTimeHandover]");
  }
}

- (void)submitProximityMetrics:(BOOL)a3
{
  id v4 = [[+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton") getWRMProximity];
  if (v4)
  {
    dword_10027D350 = v4[14];
    [(NSDate *)self->mProximityReportTimer timeIntervalSinceNow];
    self->prevProximityReportInterval = v5;
    +[WCM_Logging logLevel:16 message:@"submit CA metric com.apple.Telephony.wrmLinkStateChange"];
    AnalyticsSendEventLazy();
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"WRMPRoximityMetrics metric is not ready"];
  }
}

- (void)submitDataLinkPreferenceaMetrics
{
  v2 = [[+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton") getStandaloneLinkPreferenceMetrics];
  if (v2)
  {
    +[WCM_Logging logLevel:16 message:@"submit CA metric com.apple.Telephony.wrmLinkPrefChangeEvent"];
    AnalyticsSendEventLazy();
    v2[172] = 0;
    [[+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton") resetStandaloneLinkPreferenceMetrics];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"WRMMetricsiRATDataRecommendation metric is not ready"];
  }
}

- (void)submitMetricWiFiCallingEnd
{
  if (objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "getWRMWiFiCallingEnd"))
  {
    id v2 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
    if (v2) {
      [v2 getWatchAssociated];
    }
    +[WCM_Logging logLevel:25 message:@"Submitted CA metric WiFiCallingEnd"];
    AnalyticsSendEventLazy();
    [+[WRM_MetricsService getSingleton](WRM_MetricsService) resetWiFiCallingEnd];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"WiFiCallingEnd metric is not ready"];
  }
}

- (void)submitMericStreaming
{
  id v2 = [(unsigned int *)[+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton") getWRMStreaming]];
  if (v2)
  {
    +[WCM_Logging logLevel:25 message:@"Submit CA metric com.apple.Telephony.wrmStreamingReport."];
    if (MGGetBoolAnswer())
    {
      id v4 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
      id v5 = objc_alloc_init((Class)sub_1001365FC());
      [v4 getLastKnownLatitude];
      [v5 setLat:];
      [v4 getLastKnownLongitude];
      [v5 setLng:];
      v35 = 0;
      uint64_t v36 = (uint64_t)&v35;
      uint64_t v37 = 0x3052000000;
      v38 = sub_100139B64;
      v39 = sub_100139B74;
      id v6 = (void *)qword_10027D380;
      uint64_t v40 = qword_10027D380;
      if (!qword_10027D380)
      {
        v30 = _NSConcreteStackBlock;
        uint64_t v31 = 3221225472;
        uint64_t v32 = (uint64_t)sub_100139E48;
        v33 = &unk_10020DAF8;
        v34 = &v35;
        sub_100139E48((uint64_t)&v30);
        id v6 = *(void **)(v36 + 40);
      }
      _Block_object_dispose(&v35, 8);
      [v5 lat];
      double v8 = v7;
      [v5 lng];
      id v10 = [v6 coordinatesToGeoHashWithLength:7 latitude:v8 longitude:v9];
      v35 = 0;
      uint64_t v36 = (uint64_t)&v35;
      uint64_t v37 = 0x3052000000;
      v38 = sub_100139B64;
      v39 = sub_100139B74;
      uint64_t v11 = (objc_class *)qword_10027D390;
      uint64_t v40 = qword_10027D390;
      if (!qword_10027D390)
      {
        v30 = _NSConcreteStackBlock;
        uint64_t v31 = 3221225472;
        uint64_t v32 = (uint64_t)sub_100139FE8;
        v33 = &unk_10020DAF8;
        v34 = &v35;
        sub_100139FE8((uint64_t)&v30);
        uint64_t v11 = *(objc_class **)(v36 + 40);
      }
      v21 = v3;
      _Block_object_dispose(&v35, 8);
      id v12 = [v11 alloc];
      v13 = +[NSNumber numberWithUnsignedInt:v2[2]];
      id v14 = +[NSNumber numberWithUnsignedInt:v2[3]];
      if (*((void *)v2 + 23)) {
        CFStringRef v15 = (const __CFString *)*((void *)v2 + 23);
      }
      else {
        CFStringRef v15 = @"INVALID_RAT";
      }
      uint64_t v16 = +[NSNumber numberWithUnsignedInt:v2[44]];
      v29 = +[NSNumber numberWithBool:*((unsigned __int8 *)v2 + 288)];
      if (*((unsigned char *)v2 + 288)) {
        v28 = +[NSNumber numberWithBool:*((unsigned __int8 *)v2 + 289)];
      }
      else {
        v28 = (NSNumber *)&__kCFBooleanFalse;
      }
      v27 = +[NSNumber numberWithUnsignedInt:v2[77]];
      v26 = +[NSNumber numberWithUnsignedInt:v2[79]];
      v25 = +[NSNumber numberWithUnsignedInt:v2[80]];
      v24 = +[NSNumber numberWithUnsignedInt:v2[41]];
      v23 = +[NSNumber numberWithUnsignedInt:v2[42]];
      v22 = +[NSNumber numberWithInt:v2[76]];
      id v17 = objc_msgSend(v12, "initWithGeohash:counter:event:ratType:rrcState:cellNsaEnabled:isFR1:cellARFCN:cellBandInfo:cellChannelBW:cellRsrp:cellSinr:cellLteRSRQ:cellNrRSRP:cellNrRSRQ:cellNrSNR:maxDLCAConfigured:totalConfiguredBw:nrConfiguredBw:nrTotalScheduledMimoLayers:totalConfiguredMimoLayers:lteMaxScheduledMimoLayersInACell:nrMaxDlModulation:actualHighBandwidth:actualLowBandwidth:pActualLowBandwidth:maxOfActualLowBandwidth:estimatedHighBandwidth:estimatedLowBandwidth:movingAvgHighBandwidth:movingAvgLowBandwidth:cmDataSentCount:cmDataSentDuration:tcpRTTAvg:tcpRTTvar:videoStreamingStallTime:numStall:stallDuration:cellEstimatedBW:cellLoad:cellModelConfidenceLevel:mlPredictedCellBW:qbssLoad:lqmScorecellular:", v10, v13, v14, v15, v16, v29, v28, v27, v26, v25, v24,
              v23,
              v22,
              +[NSNumber numberWithInt:v2[73]],
              +[NSNumber numberWithInt:v2[74]],
              +[NSNumber numberWithInt:v2[75]],
              +[NSNumber numberWithUnsignedInt:v2[84]],
              +[NSNumber numberWithUnsignedInt:v2[85]],
              +[NSNumber numberWithUnsignedInt:v2[86]],
              +[NSNumber numberWithUnsignedInt:v2[87]],
              +[NSNumber numberWithUnsignedInt:v2[88]],
              +[NSNumber numberWithUnsignedInt:v2[89]],
              +[NSNumber numberWithUnsignedInt:v2[90]],
              +[NSNumber numberWithUnsignedInt:v2[5]],
              +[NSNumber numberWithUnsignedInt:v2[6]],
              +[NSNumber numberWithUnsignedInt:v2[7]],
              +[NSNumber numberWithUnsignedInt:v2[8]],
              +[NSNumber numberWithUnsignedInt:v2[10]],
              +[NSNumber numberWithUnsignedInt:v2[11]],
              +[NSNumber numberWithUnsignedInt:v2[12]],
              +[NSNumber numberWithUnsignedInt:v2[13]],
              +[NSNumber numberWithUnsignedInt:v2[14]],
              +[NSNumber numberWithUnsignedInt:v2[15]],
              +[NSNumber numberWithUnsignedInt:v2[67]],
              +[NSNumber numberWithUnsignedInt:v2[69]],
              +[NSNumber numberWithUnsignedInt:v2[93]],
              +[NSNumber numberWithUnsignedInt:v2[92]],
              +[NSNumber numberWithUnsignedInt:v2[93]],
              +[NSNumber numberWithUnsignedInt:v2[78]],
              +[NSNumber numberWithUnsignedInt:v2[45]],
              +[NSNumber numberWithUnsignedInt:v2[91]],
              +[NSNumber numberWithUnsignedInt:v2[55]],
              +[NSNumber numberWithUnsignedInt:v2[20]],
              +[NSNumber numberWithUnsignedInt:v2[43]]);
      v30 = 0;
      uint64_t v31 = (uint64_t)&v30;
      uint64_t v32 = 0x2020000000;
      uint64_t v18 = (uint64_t (*)(void))off_10027D3A0;
      v33 = off_10027D3A0;
      if (!off_10027D3A0)
      {
        v35 = _NSConcreteStackBlock;
        uint64_t v36 = 3221225472;
        uint64_t v37 = (uint64_t)sub_10013A1AC;
        v38 = (void (*)(uint64_t, uint64_t))&unk_10020DAF8;
        v39 = (void (*)(uint64_t))&v30;
        double v19 = (void *)sub_10013A040();
        id v20 = dlsym(v19, "__BMRootLibrary");
        *(void *)(*((void *)v39 + 1) + 24) = v20;
        off_10027D3A0 = *(_UNKNOWN **)(*((void *)v39 + 1) + 24);
        uint64_t v18 = *(uint64_t (**)(void))(v31 + 24);
      }
      _Block_object_dispose(&v30, 8);
      if (!v18) {
        sub_10013AF80();
      }
      [objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend((id)v18(), "Device"), "Wireless"), "ConnectivityContext"), "source"), "sendEvent:", v17);

      id v3 = v21;
    }
    AnalyticsSendEventLazy();
    [+[WRM_MetricsService getSingleton](WRM_MetricsService) resetStreaming];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Streaming metric is not ready"];
  }
}

- (void)submitMeric5GVersusWiFiLinkMetrics
{
  if (objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "getWRM5GVersusWiFiLinkPreferenceMetrics"))
  {
    +[WCM_Logging logLevel:16 message:@"submit CA metric com.apple.Telephony.wrmWiFiCell5GData"];
    AnalyticsSendEventLazy();
    [+[WRM_MetricsService getSingleton](WRM_MetricsService) reset5GVersusWiFiMetrics];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Cell versus WiFi metric is not ready"];
  }
}

- (id)convetDataLqmToString:(int)a3
{
  if (a3 > 19)
  {
    switch(a3)
    {
      case 20:
        return @"MinViable";
      case 50:
        return @"Poor";
      case 100:
        return @"Good";
      default:
        return @"Unknown";
    }
  }
  else
  {
    if (a3 != -2)
    {
      if (a3 == 10) {
        return @"Bad";
      }
      return @"Unknown";
    }
    return @"Off";
  }
}

- (void)submitMetricsCBRSForSim:(int64_t)a3 dataLQM:(int)a4 congested:(BOOL)a5
{
  +[WCM_Logging logLevel:25, @"submit CA com.apple.Telephony.wrmCBRSRecommendation slot=%ld, lqm=%ld, isCongested=%d", a3, a4, a5 message];
  AnalyticsSendEventLazy();
}

@end