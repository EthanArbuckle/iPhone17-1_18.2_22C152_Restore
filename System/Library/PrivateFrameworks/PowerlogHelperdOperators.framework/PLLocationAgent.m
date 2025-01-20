@interface PLLocationAgent
+ (id)defaults;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionClientStatus;
+ (id)entryEventForwardDefinitionGPSSubscription;
+ (id)entryEventForwardDefinitionGnssSession;
+ (id)entryEventForwardDefinitionLogLevel;
+ (id)entryEventForwardDefinitionOdometry;
+ (id)entryEventForwardDefinitionStatusBar;
+ (id)entryEventForwardDefinitionSuppressionManagerClient;
+ (id)entryEventForwardDefinitionTechStatus;
+ (id)entryEventForwardDefinitionViewObstructed;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitionMapsBusyness;
+ (id)entryEventIntervalDefinitionPDR;
+ (id)entryEventIntervalDefinitionSeparationAlert;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitionClientStatusDebug;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionClientStatus;
+ (id)entryEventPointDefinitionGeoFenceHandoff;
+ (id)entryEventPointDefinitionMiLo;
+ (id)entryEventPointDefinitionMotionPacket;
+ (id)entryEventPointDefinitionWifiLocationScanRequesters;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (BOOL)shouldRateLimitTechStatus;
- (NSDate)gps_segment_date;
- (NSDate)gps_segment_lastWrittenDate;
- (NSDate)lastResyncActiveClientsDate;
- (NSDate)lastTechStatusNotificationDate;
- (NSMutableDictionary)activeClients;
- (NSMutableDictionary)bundleIDToWeightUsingGPSCache;
- (NSMutableDictionary)bundleIDToWeightUsingLocationCache;
- (NSMutableDictionary)bundleIDToWeightUsingWiFiCache;
- (NSMutableDictionary)clientStatusTypeStrings;
- (NSMutableDictionary)localCache;
- (NSMutableSet)activeBackgroundLocationClients;
- (NSMutableSet)processes;
- (NSNumber)techStatusLimiterIsActive;
- (PLCFNotificationOperatorComposition)techStatusChangedNotification;
- (PLEntryNotificationOperatorComposition)sbcLevelChanged;
- (PLLocationAgent)init;
- (PLNSNotificationOperatorComposition)thermalMonitorListener;
- (PLXPCListenerOperatorComposition)checkInSessionXPCListener;
- (PLXPCListenerOperatorComposition)clientStatusNotification;
- (PLXPCListenerOperatorComposition)gnssSessionListener;
- (PLXPCListenerOperatorComposition)gpsSubscriptionListener;
- (PLXPCListenerOperatorComposition)locationGPSListener;
- (PLXPCListenerOperatorComposition)logLevelNotification;
- (PLXPCListenerOperatorComposition)mapsBusynessStateListener;
- (PLXPCListenerOperatorComposition)miLoScansListener;
- (PLXPCListenerOperatorComposition)motionPacketListener;
- (PLXPCListenerOperatorComposition)odometryListener;
- (PLXPCListenerOperatorComposition)pdrListener;
- (PLXPCListenerOperatorComposition)separationAlertListener;
- (PLXPCListenerOperatorComposition)statusBarNotification;
- (PLXPCListenerOperatorComposition)suppressionManagerClientListener;
- (PLXPCListenerOperatorComposition)viewObstructedListener;
- (PLXPCListenerOperatorComposition)wifiLocationScanRequestersListener;
- (double)gps_segment_lastWrittenTimestamp;
- (double)gps_segment_power;
- (double)gps_segment_timestamp;
- (id)getOpenEntryForClientSettings:(id)a3 withTimeStarted:(id)a4 withClient:(id)a5 withType:(id)a6 withEntryKey:(id)a7;
- (id)humanReadableNameForTechnology:(id)a3;
- (id)lastEntryWithClient:(id)a3 withType:(id)a4 withBundleID:(id)a5 withEntryKey:(id)a6;
- (unint64_t)convertCheckInEvent:(id)a3;
- (unint64_t)convertClientEvent:(id)a3;
- (unint64_t)convertOdometryEvent:(id)a3;
- (unint64_t)convertViewObstructedEvent:(id)a3;
- (void)closeOpenEntryForClient:(id)a3 withOpenEntry:(id)a4 withTimeStopped:(id)a5;
- (void)initOperatorDependancies;
- (void)logEventForwardCheckInSession:(id)a3;
- (void)logEventForwardClientStatuswithPayload:(id)a3;
- (void)logEventForwardGnssSession:(id)a3;
- (void)logEventForwardOdometry:(id)a3;
- (void)logEventForwardSuppressionManagerClient:(id)a3;
- (void)logEventForwardTechStatus;
- (void)logEventForwardTechStatus_withLimiter;
- (void)logEventForwardViewObstructed:(id)a3;
- (void)logEventFowardGPSSubscription:(id)a3;
- (void)logEventIntervalMapsBusynessState:(id)a3;
- (void)logEventIntervalPDR:(id)a3;
- (void)logEventIntervalSeparationAlert:(id)a3;
- (void)logEventNoneClientStatus;
- (void)logEventNoneClientStatusDebugWithClients:(id)a3;
- (void)logEventPointClientStatus;
- (void)logEventPointMiLoScans:(id)a3;
- (void)logEventPointMotionPacket:(id)a3;
- (void)logEventPointWifiLocationScanRequesters:(id)a3;
- (void)modelGpsSegmentPower:(id)a3 withGpsPower:(double)a4 withTotalDuration:(double)a5;
- (void)processesOfInterest:(id)a3;
- (void)resyncActiveClients;
- (void)setActiveBackgroundLocationClients:(id)a3;
- (void)setActiveClients:(id)a3;
- (void)setBundleIDToWeightUsingGPSCache:(id)a3;
- (void)setBundleIDToWeightUsingLocationCache:(id)a3;
- (void)setBundleIDToWeightUsingWiFiCache:(id)a3;
- (void)setCheckInSessionXPCListener:(id)a3;
- (void)setClientStatusNotification:(id)a3;
- (void)setClientStatusTypeStrings:(id)a3;
- (void)setGnssSessionListener:(id)a3;
- (void)setGpsSubscriptionListener:(id)a3;
- (void)setGps_segment_date:(id)a3;
- (void)setGps_segment_lastWrittenDate:(id)a3;
- (void)setGps_segment_lastWrittenTimestamp:(double)a3;
- (void)setGps_segment_power:(double)a3;
- (void)setGps_segment_timestamp:(double)a3;
- (void)setLastResyncActiveClientsDate:(id)a3;
- (void)setLastTechStatusNotificationDate:(id)a3;
- (void)setLocalCache:(id)a3;
- (void)setLocationGPSListener:(id)a3;
- (void)setLogLevelNotification:(id)a3;
- (void)setMapsBusynessStateListener:(id)a3;
- (void)setMiLoScansListener:(id)a3;
- (void)setMotionPacketListener:(id)a3;
- (void)setOdometryListener:(id)a3;
- (void)setPdrListener:(id)a3;
- (void)setProcesses:(id)a3;
- (void)setSbcLevelChanged:(id)a3;
- (void)setSeparationAlertListener:(id)a3;
- (void)setStatusBarNotification:(id)a3;
- (void)setSuppressionManagerClientListener:(id)a3;
- (void)setTechStatusChangedNotification:(id)a3;
- (void)setTechStatusLimiterIsActive:(id)a3;
- (void)setThermalMonitorListener:(id)a3;
- (void)setViewObstructedListener:(id)a3;
- (void)setWifiLocationScanRequestersListener:(id)a3;
- (void)updateClientsLocationInfo:(id)a3;
- (void)updateGnssPowerMetric:(id)a3;
- (void)updateLocalCacheWithClient:(id)a3 withType:(id)a4 withBundleID:(id)a5 withEntry:(id)a6;
- (void)updateLocationDistributionEvents;
- (void)updateLocationQualificationEvents;
- (void)writeModeledPower;
@end

@implementation PLLocationAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLLocationAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"ClientStatus";
  v3 = [a1 entryEventPointDefinitionClientStatus];
  v11[0] = v3;
  v10[1] = @"GeoFenceHandoff";
  v4 = [a1 entryEventPointDefinitionGeoFenceHandoff];
  v11[1] = v4;
  v10[2] = @"WifiLocationScanRequesters";
  v5 = [a1 entryEventPointDefinitionWifiLocationScanRequesters];
  v11[2] = v5;
  v10[3] = @"MiLoScanEvent";
  v6 = [a1 entryEventPointDefinitionMiLo];
  v11[3] = v6;
  v10[4] = @"MotionPacket";
  v7 = [a1 entryEventPointDefinitionMotionPacket];
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

+ (id)entryEventPointDefinitionClientStatus
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v28[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C00];
  v26[0] = *MEMORY[0x1E4F92CD0];
  v26[1] = v2;
  v27[0] = &unk_1F4011DC8;
  v27[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F92C08];
  v26[2] = *MEMORY[0x1E4F92CC0];
  v26[3] = v3;
  v27[2] = MEMORY[0x1E4F1CC38];
  v27[3] = MEMORY[0x1E4F1CC38];
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E4F92CA8];
  v24[0] = @"timestampEnd";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_DateFormat");
  v25[0] = v21;
  v24[1] = @"Type";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_StringFormat");
  v25[1] = v19;
  v24[2] = @"Client";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_StringFormat");
  v25[2] = v17;
  v24[3] = @"BundleId";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_StringFormat_withBundleID");
  v25[3] = v15;
  v24[4] = @"Executable";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v25[4] = v5;
  v24[5] = @"Authorized";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v25[5] = v7;
  v24[6] = @"LocationDesiredAccuracy";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
  v25[6] = v9;
  v24[7] = @"LocationDistanceFilter";
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_RealFormat");
  v25[7] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:8];
  v29[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  return v13;
}

+ (id)entryEventPointDefinitionGeoFenceHandoff
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitionWifiLocationScanRequesters
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4011DC8;
  v14[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"scanRequester";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v11[1] = @"numRequests";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionMiLo
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v20 = *MEMORY[0x1E4F92CD0];
  v21 = &unk_1F4011DD8;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"BTScanDuration";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_RealFormat");
  v19[0] = v15;
  v18[1] = @"BleActiveScanRate";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v19[1] = v13;
  v18[2] = @"NumLocalizations";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v19[2] = v3;
  v18[3] = @"NumRecordings";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19[3] = v5;
  v18[4] = @"TriggerType";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v19[4] = v7;
  v18[5] = @"WiFiScanDuration";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
  v19[5] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  v23[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionMotionPacket
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v14 = *MEMORY[0x1E4F92CD0];
  v15 = &unk_1F4011DC8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"action";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v13[0] = v4;
  v12[1] = @"nonWaking";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v13[1] = v6;
  void v12[2] = @"type";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventForwardDefinitions
{
  v17[9] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    v16[0] = @"TechStatus";
    uint64_t v3 = [a1 entryEventForwardDefinitionTechStatus];
    v17[0] = v3;
    v16[1] = @"ClientStatus";
    v4 = [a1 entryEventForwardDefinitionClientStatus];
    v17[1] = v4;
    void v16[2] = @"LogLevel";
    v5 = [a1 entryEventForwardDefinitionLogLevel];
    v17[2] = v5;
    void v16[3] = @"StatusBar";
    v6 = [a1 entryEventForwardDefinitionStatusBar];
    void v17[3] = v6;
    v16[4] = @"GnssSession";
    v7 = [a1 entryEventForwardDefinitionGnssSession];
    v17[4] = v7;
    v16[5] = @"GPSActivation";
    v8 = [a1 entryEventForwardDefinitionGPSSubscription];
    v17[5] = v8;
    v16[6] = @"Odometry";
    v9 = [a1 entryEventForwardDefinitionOdometry];
    v17[6] = v9;
    v16[7] = @"ViewObstructed";
    v10 = [a1 entryEventForwardDefinitionViewObstructed];
    v17[7] = v10;
    v16[8] = @"SuppressionManagerClient";
    v11 = [a1 entryEventForwardDefinitionSuppressionManagerClient];
    v17[8] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:9];
  }
  else
  {
    uint64_t v3 = objc_msgSend(a1, "entryEventForwardDefinitionTechStatus", @"TechStatus");
    v15[0] = v3;
    v14[1] = @"ClientStatus";
    v4 = [a1 entryEventForwardDefinitionClientStatus];
    v15[1] = v4;
    void v14[2] = @"StatusBar";
    v5 = [a1 entryEventForwardDefinitionStatusBar];
    void v15[2] = v5;
    v14[3] = @"GnssSession";
    v6 = [a1 entryEventForwardDefinitionGnssSession];
    v15[3] = v6;
    v14[4] = @"GPSActivation";
    v7 = [a1 entryEventForwardDefinitionGPSSubscription];
    v15[4] = v7;
    v14[5] = @"Odometry";
    v8 = [a1 entryEventForwardDefinitionOdometry];
    v15[5] = v8;
    v14[6] = @"ViewObstructed";
    v9 = [a1 entryEventForwardDefinitionViewObstructed];
    v15[6] = v9;
    v14[7] = @"SuppressionManagerClient";
    v10 = [a1 entryEventForwardDefinitionSuppressionManagerClient];
    v15[7] = v10;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
  }

  return v12;
}

+ (id)entryEventForwardDefinitionTechStatus
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v33[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v31[0] = *MEMORY[0x1E4F92CD0];
  v31[1] = v2;
  v32[0] = &unk_1F4011DD8;
  v32[1] = MEMORY[0x1E4F1CC38];
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E4F92CA8];
  v29[0] = @"gps";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_BoolFormat");
  v30[0] = v26;
  v29[1] = @"nmea";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_BoolFormat");
  v30[1] = v24;
  v29[2] = @"accessory";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_BoolFormat");
  v30[2] = v22;
  v29[3] = @"wifi";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_BoolFormat");
  v30[3] = v20;
  void v29[4] = @"skyhook";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_BoolFormat");
  v30[4] = v18;
  v29[5] = @"cell";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_BoolFormat");
  v30[5] = v16;
  v29[6] = @"lac";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_BoolFormat");
  v30[6] = v14;
  v29[7] = @"mcc";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v30[7] = v4;
  v29[8] = @"gps_coarse";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v30[8] = v6;
  v29[9] = @"pipeline";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_BoolFormat");
  v30[9] = v8;
  v29[10] = @"wifi2";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_BoolFormat");
  v30[10] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:11];
  v34[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionClientStatus
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C00];
  v27[0] = *MEMORY[0x1E4F92CD0];
  v27[1] = v2;
  v28[0] = &unk_1F4011DE8;
  v28[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F92CF8];
  v27[2] = *MEMORY[0x1E4F92CC0];
  v27[3] = v3;
  void v28[2] = MEMORY[0x1E4F1CC38];
  v28[3] = &unk_1F400C7A8;
  uint64_t v4 = *MEMORY[0x1E4F92C08];
  void v27[4] = *MEMORY[0x1E4F92CF0];
  v27[5] = v4;
  v28[4] = &unk_1F4011DF8;
  v28[5] = MEMORY[0x1E4F1CC38];
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:6];
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E4F92CA8];
  v25[0] = @"timestampEnd";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_DateFormat");
  v26[0] = v22;
  v25[1] = @"Type";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_StringFormat");
  v26[1] = v20;
  v25[2] = @"Client";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_StringFormat_withBundleID");
  v26[2] = v18;
  v25[3] = @"BundleId";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v26[3] = v16;
  v25[4] = @"Executable";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withAppName");
  void v26[4] = v6;
  v25[5] = @"LocationDesiredAccuracy";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v26[5] = v8;
  v25[6] = @"LocationDistanceFilter";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v26[6] = v10;
  v25[7] = @"InUseLevel";
  v11 = [MEMORY[0x1E4F929D8] sharedInstance];
  v12 = objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v26[7] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:8];
  v30[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  return v14;
}

+ (id)entryEventForwardDefinitionLogLevel
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F4011DC8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"Level";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"RotationEnabled";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitionStatusBar
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4011DC8;
  v14[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"Status";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"BundleID";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventForwardDefinitionGnssSession
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F4011E08;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"eventType";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"eventStatus";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitionGPSSubscription
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4011DC8;
  v14[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"ServiceName";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v11[1] = @"Register";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventForwardDefinitionOdometry
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F4011DC8;
  v16[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"odometryEvent";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v14[0] = v5;
  v13[1] = @"updateInterval";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
  v14[1] = v7;
  void v13[2] = @"identifier";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  void v14[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitionSuppressionManagerClient
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v14 = *MEMORY[0x1E4F92CD0];
  v15 = &unk_1F4011DC8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"clientEvent";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v13[0] = v4;
  v12[1] = @"clientType";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v13[1] = v6;
  void v12[2] = @"clientNumbers";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventForwardDefinitionViewObstructed
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F4011DC8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"VOEvent";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventBackwardDefinitions
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isGPSClass:1008002] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isGPSClass:1008003] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isGPSClass:1008005] & 1) != 0
    || [MEMORY[0x1E4F92A38] isGPSClass:1008004])
  {
    v24 = @"GPSPower";
    v22[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v20[0] = *MEMORY[0x1E4F92CD0];
    v20[1] = v2;
    v21[0] = &unk_1F4011E08;
    v21[1] = @"log";
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    v23[0] = v17;
    v22[1] = *MEMORY[0x1E4F92CA8];
    v18[0] = @"startTime";
    v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v19[0] = v15;
    v18[1] = @"measuredInterval";
    uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
    v19[1] = v3;
    v18[2] = @"activeInterval";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v19[2] = v5;
    void v18[3] = @"averagePower";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v19[3] = v7;
    v18[4] = @"activeL5IntervalSec";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v19[4] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
    v23[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    v25[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"MapsBusyness";
  uint64_t v3 = [a1 entryEventIntervalDefinitionMapsBusyness];
  v9[0] = v3;
  v8[1] = @"SeparationAlert";
  uint64_t v4 = [a1 entryEventIntervalDefinitionSeparationAlert];
  v9[1] = v4;
  v8[2] = @"PDR";
  v5 = [a1 entryEventIntervalDefinitionPDR];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)entryEventIntervalDefinitionMapsBusyness
{
  void v29[2] = *MEMORY[0x1E4F143B8];
  v28[0] = *MEMORY[0x1E4F92C50];
  uint64_t v26 = *MEMORY[0x1E4F92CD0];
  v27 = &unk_1F4011E08;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E4F92CA8];
  v24[0] = @"timestampEnd";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_DateFormat");
  v25[0] = v21;
  v24[1] = @"Launched";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v25[1] = v19;
  v24[2] = @"HarvestedRealTimeOnPower";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v25[2] = v17;
  v24[3] = @"HarvestedRealTimeOnBattery";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  void v25[3] = v15;
  v24[4] = @"HarvestedDifferential";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v25[4] = v13;
  v24[5] = @"RateLimit";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v25[5] = v3;
  v24[6] = @"LocationNotUsable";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v25[6] = v5;
  v24[7] = @"LocationNoAuth";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v25[7] = v7;
  void v24[8] = @"LocationUnavailable";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v25[8] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:9];
  v29[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  return v11;
}

+ (id)entryEventIntervalDefinitionSeparationAlert
{
  void v29[2] = *MEMORY[0x1E4F143B8];
  v28[0] = *MEMORY[0x1E4F92C50];
  uint64_t v26 = *MEMORY[0x1E4F92CD0];
  v27 = &unk_1F4011DC8;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E4F92CA8];
  v24[0] = @"timestampEnd";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_DateFormat");
  v25[0] = v21;
  v24[1] = @"DurationOfVisits";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
  v25[1] = v19;
  v24[2] = @"NumberOfVisits";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v25[2] = v17;
  v24[3] = @"TotalGeoFence";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  void v25[3] = v15;
  v24[4] = @"GPSAttribution";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v25[4] = v13;
  v24[5] = @"BTScanCount";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v25[5] = v3;
  v24[6] = @"WifiScanCount";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v25[6] = v5;
  v24[7] = @"Notifications";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v25[7] = v7;
  void v24[8] = @"DevicesMonitored";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v25[8] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:9];
  v29[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  return v11;
}

+ (id)entryEventIntervalDefinitionPDR
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  v17 = &unk_1F4011DC8;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"sessionEndTime";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_RealFormat");
  v15[0] = v3;
  v14[1] = @"numFences";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v15[1] = v5;
  void v14[2] = @"identifier";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  void v15[2] = v7;
  void v14[3] = @"sessionStartTime";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
  void v15[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventNoneDefinitions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a1 isDebugEnabled])
  {
    v6 = @"ClientStatusDebug";
    uint64_t v3 = [a1 entryEventNoneDefinitionClientStatusDebug];
    v7[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v4;
}

+ (id)entryEventNoneDefinitionClientStatusDebug
{
  v48[2] = *MEMORY[0x1E4F143B8];
  v47[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v45[0] = *MEMORY[0x1E4F92CD0];
  v45[1] = v2;
  v46[0] = &unk_1F4011DC8;
  v46[1] = MEMORY[0x1E4F1CC38];
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  v48[0] = v42;
  v47[1] = *MEMORY[0x1E4F92CA8];
  v43[0] = @"Client";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_StringFormat");
  v44[0] = v40;
  v43[1] = @"BundleId";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_StringFormat_withBundleID");
  v44[1] = v38;
  v43[2] = @"Executable";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_StringFormat");
  v44[2] = v36;
  v43[3] = @"Authorized";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_BoolFormat");
  v44[3] = v34;
  v43[4] = @"LocationDesiredAccuracy";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
  v44[4] = v32;
  v43[5] = @"LocationDistanceFilter";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_RealFormat");
  v44[5] = v30;
  v43[6] = @"LocationTimeStarted";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v44[6] = v28;
  v43[7] = @"LocationTimeStopped";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v26 = objc_msgSend(v27, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v44[7] = v26;
  v43[8] = @"FenceTimeStarted";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v44[8] = v24;
  v43[9] = @"FenceTimeStopped";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v44[9] = v22;
  v43[10] = @"SignificantTimeStarted";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v44[10] = v20;
  v43[11] = @"SignificantTimeStopped";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v44[11] = v18;
  v43[12] = @"BeaconRegionTimeStarted";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v44[12] = v16;
  v43[13] = @"BeaconRegionTimeStopped";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v44[13] = v14;
  v43[14] = @"RangeTimeStarted";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v44[14] = v4;
  v43[15] = @"RangeTimeStopped";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v44[15] = v6;
  v43[16] = @"VisitTimeStarted";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v44[16] = v8;
  v43[17] = @"VisitTimeStopped";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v44[17] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:18];
  v48[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];

  return v12;
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLLocationAgent)init
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)PLLocationAgent;
  uint64_t v2 = [(PLAgent *)&v40 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    clientStatusTypeStrings = v2->_clientStatusTypeStrings;
    v2->_clientStatusTypeStrings = (NSMutableDictionary *)v3;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v28 = [&unk_1F40132B8 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v37;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(&unk_1F40132B8);
          }
          uint64_t v29 = v5;
          v6 = *(void **)(*((void *)&v36 + 1) + 8 * v5);
          v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v27);
          [(NSMutableDictionary *)v2->_clientStatusTypeStrings setObject:v7 forKeyedSubscript:v6];

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          uint64_t v8 = [&unk_1F40132D0 countByEnumeratingWithState:&v32 objects:v41 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v33 != v10) {
                  objc_enumerationMutation(&unk_1F40132D0);
                }
                uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
                v13 = [v6 stringByAppendingString:v12];
                uint64_t v14 = [(NSMutableDictionary *)v2->_clientStatusTypeStrings objectForKeyedSubscript:v6];
                [v14 setObject:v13 forKeyedSubscript:v12];
              }
              uint64_t v9 = [&unk_1F40132D0 countByEnumeratingWithState:&v32 objects:v41 count:16];
            }
            while (v9);
          }
          uint64_t v5 = v29 + 1;
        }
        while (v29 + 1 != v28);
        uint64_t v28 = [&unk_1F40132B8 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v28);
    }
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    localCache = v2->_localCache;
    v2->_localCache = (NSMutableDictionary *)v15;

    techStatusLimiterIsActive = v2->_techStatusLimiterIsActive;
    v2->_techStatusLimiterIsActive = (NSNumber *)MEMORY[0x1E4F1CC28];

    id v18 = objc_alloc(MEMORY[0x1E4F929A0]);
    uint64_t v19 = *MEMORY[0x1E4F1E578];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __23__PLLocationAgent_init__block_invoke;
    v30[3] = &unk_1E6E47908;
    uint64_t v20 = v2;
    v31 = v20;
    uint64_t v21 = [v18 initWithOperator:v20 forNotification:v19 requireState:0 withBlock:v30];
    techStatusChangedNotification = v20->_techStatusChangedNotification;
    v20->_techStatusChangedNotification = (PLCFNotificationOperatorComposition *)v21;

    uint64_t v23 = objc_opt_new();
    processes = v20->_processes;
    v20->_processes = (NSMutableSet *)v23;

    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v20 selector:sel_processesOfInterest_ name:@"PLLocationAgent.addProcessesOfInterest" object:0];
  }
  return v2;
}

uint64_t __23__PLLocationAgent_init__block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __23__PLLocationAgent_init__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_defaultOnce, block);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_classDebugEnabled)
    {
      uint64_t v3 = [NSString stringWithFormat:@"techStatusChanged callback"];
      uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLLocationAgent init]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:928];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "logEventForwardTechStatus_withLimiter");
}

uint64_t __23__PLLocationAgent_init__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_classDebugEnabled = result;
  return result;
}

- (void)processesOfInterest:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = [v4 objectForKeyedSubscript:@"entry"];
    if (v5)
    {
      v6 = [(PLLocationAgent *)self processes];
      v7 = [v8 objectForKeyedSubscript:@"entry"];
      [v6 unionSet:v7];
    }
    uint64_t v4 = v8;
  }
}

- (void)initOperatorDependancies
{
  bundleIDToWeightUsingGPSCache = self->_bundleIDToWeightUsingGPSCache;
  self->_bundleIDToWeightUsingGPSCache = 0;

  bundleIDToWeightUsingWiFiCache = self->_bundleIDToWeightUsingWiFiCache;
  self->_bundleIDToWeightUsingWiFiCache = 0;

  bundleIDToWeightUsingLocationCache = self->_bundleIDToWeightUsingLocationCache;
  self->_bundleIDToWeightUsingLocationCache = 0;

  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  activeClients = self->_activeClients;
  self->_activeClients = v6;

  id v8 = [MEMORY[0x1E4F1CA80] set];
  activeBackgroundLocationClients = self->_activeBackgroundLocationClients;
  self->_activeBackgroundLocationClients = v8;

  if (!+[PLUtilities isPowerlogHelperd])
  {
    if ([MEMORY[0x1E4F92A38] internalBuild])
    {
      id v10 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke;
      v79[3] = &unk_1E6E47740;
      v79[4] = self;
      v11 = (PLXPCListenerOperatorComposition *)[v10 initWithOperator:self withRegistration:&unk_1F400F088 withBlock:v79];
      logLevelNotification = self->_logLevelNotification;
      self->_logLevelNotification = v11;
    }
    [(PLLocationAgent *)self logEventForwardClientStatuswithPayload:0];
    id v13 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_406;
    v78[3] = &unk_1E6E47740;
    v78[4] = self;
    uint64_t v14 = (PLXPCListenerOperatorComposition *)[v13 initWithOperator:self withRegistration:&unk_1F400F0B0 withBlock:v78];
    statusBarNotification = self->_statusBarNotification;
    self->_statusBarNotification = v14;

    id v16 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_421;
    v77[3] = &unk_1E6E47740;
    v77[4] = self;
    v17 = (PLXPCListenerOperatorComposition *)[v16 initWithOperator:self withRegistration:&unk_1F400F0D8 withBlock:v77];
    clientStatusNotification = self->_clientStatusNotification;
    self->_clientStatusNotification = v17;

    id v19 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_430;
    v76[3] = &unk_1E6E47740;
    v76[4] = self;
    uint64_t v20 = (PLXPCListenerOperatorComposition *)[v19 initWithOperator:self withRegistration:&unk_1F400F100 withBlock:v76];
    separationAlertListener = self->_separationAlertListener;
    self->_separationAlertListener = v20;

    id v22 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_444;
    v75[3] = &unk_1E6E47740;
    v75[4] = self;
    uint64_t v23 = (PLXPCListenerOperatorComposition *)[v22 initWithOperator:self withRegistration:&unk_1F400F128 withBlock:v75];
    mapsBusynessStateListener = self->_mapsBusynessStateListener;
    self->_mapsBusynessStateListener = v23;

    if (([MEMORY[0x1E4F92A38] isGPSClass:1008002] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isGPSClass:1008003] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isGPSClass:1008005] & 1) != 0
      || [MEMORY[0x1E4F92A38] isGPSClass:1008004])
    {
      id v25 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_456;
      v74[3] = &unk_1E6E47740;
      v74[4] = self;
      uint64_t v26 = (PLXPCListenerOperatorComposition *)[v25 initWithOperator:self withRegistration:&unk_1F400F150 withBlock:v74];
      locationGPSListener = self->_locationGPSListener;
      self->_locationGPSListener = v26;

      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_462;
      v73[3] = &unk_1E6E47908;
      v73[4] = self;
      uint64_t v28 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v73];
      sbcLevelChanged = self->_sbcLevelChanged;
      self->_sbcLevelChanged = v28;

      id v30 = objc_alloc(MEMORY[0x1E4F92A28]);
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_472;
      v72[3] = &unk_1E6E47908;
      v72[4] = self;
      v31 = (PLNSNotificationOperatorComposition *)[v30 initWithOperator:self forNotification:@"PLThermalMonitorNotification" withBlock:v72];
      thermalMonitorListener = self->_thermalMonitorListener;
      self->_thermalMonitorListener = v31;
    }
    id v33 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_484;
    v71[3] = &unk_1E6E47740;
    v71[4] = self;
    long long v34 = (PLXPCListenerOperatorComposition *)[v33 initWithOperator:self withRegistration:&unk_1F400F178 withBlock:v71];
    wifiLocationScanRequestersListener = self->_wifiLocationScanRequestersListener;
    self->_wifiLocationScanRequestersListener = v34;

    id v36 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_496;
    v70[3] = &unk_1E6E47740;
    v70[4] = self;
    long long v37 = (PLXPCListenerOperatorComposition *)[v36 initWithOperator:self withRegistration:&unk_1F400F1A0 withBlock:v70];
    odometryListener = self->_odometryListener;
    self->_odometryListener = v37;

    id v39 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_504;
    v69[3] = &unk_1E6E47740;
    v69[4] = self;
    objc_super v40 = (PLXPCListenerOperatorComposition *)[v39 initWithOperator:self withRegistration:&unk_1F400F1C8 withBlock:v69];
    pdrListener = self->_pdrListener;
    self->_pdrListener = v40;

    id v42 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_514;
    v68[3] = &unk_1E6E47740;
    v68[4] = self;
    uint64_t v43 = (void *)[v42 initWithOperator:self withRegistration:&unk_1F400F1F0 withBlock:v68];
    [(PLLocationAgent *)self setCheckInSessionXPCListener:v43];

    id v44 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_519;
    v67[3] = &unk_1E6E47740;
    v67[4] = self;
    v45 = (PLXPCListenerOperatorComposition *)[v44 initWithOperator:self withRegistration:&unk_1F400F218 withBlock:v67];
    miLoScansListener = self->_miLoScansListener;
    self->_miLoScansListener = v45;

    id v47 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_527;
    v66[3] = &unk_1E6E47740;
    v66[4] = self;
    v48 = (PLXPCListenerOperatorComposition *)[v47 initWithOperator:self withRegistration:&unk_1F400F240 withBlock:v66];
    gpsSubscriptionListener = self->_gpsSubscriptionListener;
    self->_gpsSubscriptionListener = v48;

    id v50 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_532;
    v65[3] = &unk_1E6E47740;
    v65[4] = self;
    v51 = (PLXPCListenerOperatorComposition *)[v50 initWithOperator:self withRegistration:&unk_1F400F268 withBlock:v65];
    gnssSessionListener = self->_gnssSessionListener;
    self->_gnssSessionListener = v51;

    id v53 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_537;
    v64[3] = &unk_1E6E47740;
    v64[4] = self;
    v54 = (PLXPCListenerOperatorComposition *)[v53 initWithOperator:self withRegistration:&unk_1F400F290 withBlock:v64];
    motionPacketListener = self->_motionPacketListener;
    self->_motionPacketListener = v54;

    id v56 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_545;
    v63[3] = &unk_1E6E47740;
    v63[4] = self;
    v57 = (PLXPCListenerOperatorComposition *)[v56 initWithOperator:self withRegistration:&unk_1F400F2B8 withBlock:v63];
    viewObstructedListener = self->_viewObstructedListener;
    self->_viewObstructedListener = v57;

    id v59 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_553;
    v62[3] = &unk_1E6E47740;
    v62[4] = self;
    v60 = (PLXPCListenerOperatorComposition *)[v59 initWithOperator:self withRegistration:&unk_1F400F2E0 withBlock:v62];
    suppressionManagerClientListener = self->_suppressionManagerClientListener;
    self->_suppressionManagerClientListener = v60;
  }
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2;
    id v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v20 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_2_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_2_defaultOnce, &block);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_2_classDebugEnabled)
    {
      id v8 = [NSString stringWithFormat:@"log level changed with payload=%@", v6, block, v17, v18, v19, v20];
      uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLLocationAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:967];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"LogLevel"];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14 withRawData:v6];
  [*(id *)(a1 + 32) logEntry:v15];
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_2_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_406(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_407;
    id v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v23 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_3_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_3_defaultOnce, &block);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_3_classDebugEnabled)
    {
      id v8 = [NSString stringWithFormat:@"status bar changed with payload=%@", v6, block, v20, v21, v22, v23];
      uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLLocationAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:983];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"StatusBar"];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14];
  id v16 = [v6 objectForKeyedSubscript:@"Status"];
  [v15 setObject:v16 forKeyedSubscript:@"Status"];

  uint64_t v17 = [v6 objectForKeyedSubscript:@"Pid"];
  id v18 = +[PLUtilities bundleIDFromPid:](PLUtilities, "bundleIDFromPid:", [v17 intValue]);
  [v15 setObject:v18 forKeyedSubscript:@"BundleID"];

  [*(id *)(a1 + 32) logEntry:v15];
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_407(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_3_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_421(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_422;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_4_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_4_defaultOnce, &block);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_4_classDebugEnabled)
    {
      id v8 = [NSString stringWithFormat:@"client status XPC with payload=%@", v6, block, v15, v16, v17, v18];
      uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLLocationAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:993];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) logEventForwardClientStatuswithPayload:v6];
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_422(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_4_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_431;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_5_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_5_defaultOnce, &block);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_5_classDebugEnabled)
    {
      id v8 = [NSString stringWithFormat:@"SeparationAlert XPC with payload=%@", v6, block, v15, v16, v17, v18];
      uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLLocationAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:1022];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) logEventIntervalSeparationAlert:v6];
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_431(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_5_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_445;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_6_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_6_defaultOnce, &block);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_6_classDebugEnabled)
    {
      id v8 = [NSString stringWithFormat:@"Received Maps BusynessState XPC with payload=%@", v6, block, v15, v16, v17, v18];
      uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLLocationAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:1033];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) logEventIntervalMapsBusynessState:v6];
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_445(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_6_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_456(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_457;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_7_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_7_defaultOnce, &block);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_7_classDebugEnabled)
    {
      id v8 = [NSString stringWithFormat:@"Received GnssPowerMetric XPC with payload=%@", v6, block, v15, v16, v17, v18];
      uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLLocationAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:1059];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) updateGnssPowerMetric:v6];
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_457(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_7_classDebugEnabled = result;
  return result;
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_462(uint64_t a1)
{
  if (notify_post("com.apple.powerlog.gpslogtrigger")
    && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_464;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_8_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_8_defaultOnce, block);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_8_classDebugEnabled)
    {
      uint64_t v3 = [NSString stringWithFormat:@"GPS Notification failed."];
      uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      id v6 = [v5 lastPathComponent];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PLLocationAgent initOperatorDependancies]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1069];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  return [*(id *)(a1 + 32) writeModeledPower];
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_464(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_8_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_472(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_473;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_defaultOnce, block);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_classDebugEnabled)
    {
      uint64_t v5 = [NSString stringWithFormat:@"Notification from ThermalMonitor: %@", v3];
      id v6 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      id v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PLLocationAgent initOperatorDependancies]_block_invoke"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1081];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if (notify_post("com.apple.powerlog.gpslogtrigger")
    && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_479;
    void v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = v11;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_defaultOnce_477 != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_defaultOnce_477, v18);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_classDebugEnabled_478)
    {
      uint64_t v12 = [NSString stringWithFormat:@"GPS Notification failed."];
      id v13 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      uint64_t v15 = [v14 lastPathComponent];
      id v16 = [NSString stringWithUTF8String:"-[PLLocationAgent initOperatorDependancies]_block_invoke_2"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:1083];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) writeModeledPower];
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_473(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_classDebugEnabled = result;
  return result;
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_479(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_classDebugEnabled_478 = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_485;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_10_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_10_defaultOnce, &block);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_10_classDebugEnabled)
    {
      id v8 = [NSString stringWithFormat:@"Received WifiLocationScanRequesters XPC with payload=%@", v6, block, v15, v16, v17, v18];
      uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      uint64_t v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLLocationAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:1094];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointWifiLocationScanRequesters:v6];
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_485(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_10_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_496(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_496_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardOdometry:v6];
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_504_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalPDR:v6];
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_514_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardCheckInSession:v6];
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_519(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_519_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointMiLoScans:v6];
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_527(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_527_cold_1();
  }

  [*(id *)(a1 + 32) logEventFowardGPSSubscription:v6];
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_532(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_532_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardGnssSession:v6];
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_537(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_537_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointMotionPacket:v6];
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_545(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_545_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardViewObstructed:v6];
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_553(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_553_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardSuppressionManagerClient:v6];
}

- (id)humanReadableNameForTechnology:(id)a3
{
  unsigned int v3 = [a3 intValue] - 1;
  if (v3 > 0xA) {
    return @"unknown";
  }
  else {
    return off_1E6E48C48[v3];
  }
}

- (void)logEventPointClientStatus
{
  v46[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (logEventPointClientStatus_defaultOnce != -1) {
      dispatch_once(&logEventPointClientStatus_defaultOnce, block);
    }
    if (logEventPointClientStatus_classDebugEnabled)
    {
      uint64_t v5 = [NSString stringWithFormat:@"begin"];
      id v6 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      id v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventPointClientStatus]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1200];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v11 = (void *)CLCopyAppsUsingLocation();
  uint64_t v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ClientStatus"];
  id v13 = [MEMORY[0x1E4F1CA48] array];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke_561;
  v41[3] = &unk_1E6E48BD8;
  v41[4] = self;
  id v14 = v12;
  id v42 = v14;
  id v15 = v13;
  id v43 = v15;
  [v11 enumerateKeysAndObjectsUsingBlock:v41];
  if (![v15 count])
  {
    id v25 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14];
    [v25 setIsErrorEntry:1];
    [(PLOperator *)self logEntry:v25];
LABEL_24:

    goto LABEL_25;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke_575;
    v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v40[4] = v16;
    if (logEventPointClientStatus_defaultOnce_573 != -1) {
      dispatch_once(&logEventPointClientStatus_defaultOnce_573, v40);
    }
    if (logEventPointClientStatus_classDebugEnabled_574)
    {
      uint64_t v17 = [NSString stringWithFormat:@"logging newOpenEntries=%@", v15];
      uint64_t v18 = (void *)MEMORY[0x1E4F929B8];
      id v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      uint64_t v20 = [v19 lastPathComponent];
      uint64_t v21 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventPointClientStatus]"];
      [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:1233];

      id v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

      unint64_t v3 = 0x1E4F92000uLL;
    }
  }
  id v45 = v14;
  v46[0] = v15;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
  [(PLOperator *)self logEntries:v23 withGroupID:v14];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v24 = objc_opt_class();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke_581;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = v24;
    if (logEventPointClientStatus_defaultOnce_579 != -1) {
      dispatch_once(&logEventPointClientStatus_defaultOnce_579, v39);
    }
    if (logEventPointClientStatus_classDebugEnabled_580)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"!!! %s/%d: location start signal; newOpenEntries=%@",
        "-[PLLocationAgent logEventPointClientStatus]",
        1235,
      id v25 = v15);
      uint64_t v26 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      uint64_t v28 = [v27 lastPathComponent];
      uint64_t v29 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventPointClientStatus]"];
      [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:1235];

      id v30 = PLLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

      unint64_t v3 = 0x1E4F92000;
      goto LABEL_24;
    }
  }
LABEL_25:
  if ([*(id *)(v3 + 2496) debugEnabled])
  {
    uint64_t v31 = objc_opt_class();
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke_587;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v31;
    if (logEventPointClientStatus_defaultOnce_585 != -1) {
      dispatch_once(&logEventPointClientStatus_defaultOnce_585, v38);
    }
    if (logEventPointClientStatus_classDebugEnabled_586)
    {
      long long v32 = [NSString stringWithFormat:@"end"];
      id v33 = (void *)MEMORY[0x1E4F929B8];
      long long v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      long long v35 = [v34 lastPathComponent];
      id v36 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventPointClientStatus]"];
      [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:1243];

      long long v37 = PLLogCommon();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __44__PLLocationAgent_logEventPointClientStatus__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointClientStatus_classDebugEnabled = result;
  return result;
}

void __44__PLLocationAgent_logEventPointClientStatus__block_invoke_561(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v34 = v6;
  id v35 = v5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke_2;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_defaultOnce, v44);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_classDebugEnabled)
    {
      id v8 = [NSString stringWithFormat:@"client=%@", v5];
      uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      uint64_t v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventPointClientStatus]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:1209];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

      id v6 = v34;
      id v5 = v35;
    }
  }
  id v14 = [*(id *)(a1 + 32) processes];
  if ([v14 containsObject:v5])
  {
  }
  else
  {
    BOOL v15 = +[PLUtilities isPowerlogHelperd];

    if (v15) {
      goto LABEL_28;
    }
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [*(id *)(a1 + 32) clientStatusTypeStrings];
  uint64_t v38 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v41;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * v16);
        uint64_t v18 = [*(id *)(a1 + 32) clientStatusTypeStrings];
        id v19 = [v18 objectForKeyedSubscript:v17];
        uint64_t v20 = [v19 objectForKeyedSubscript:@"TimeStarted"];
        uint64_t v21 = [v6 objectForKeyedSubscript:v20];

        id v22 = [*(id *)(a1 + 32) clientStatusTypeStrings];
        uint64_t v23 = [v22 objectForKeyedSubscript:v17];
        uint64_t v24 = [v23 objectForKeyedSubscript:@"TimeStopped"];
        uint64_t v25 = [v6 objectForKeyedSubscript:v24];

        if (v21 | v25)
        {
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v26 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke_567;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v26;
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_defaultOnce_565 != -1) {
              dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_defaultOnce_565, block);
            }
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_classDebugEnabled_566)
            {
              uint64_t v27 = [NSString stringWithFormat:@"type=%@, timeStarted=%@, timeStopped=%@", v17, v21, v25];
              uint64_t v28 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
              id v30 = [v29 lastPathComponent];
              uint64_t v31 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventPointClientStatus]_block_invoke_2"];
              [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:1219];

              long long v32 = PLLogCommon();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v27;
                _os_log_debug_impl(&dword_1E4220000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              id v6 = v34;
              id v5 = v35;
            }
          }
          id v33 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 40) withRawData:v6];
          [v33 setObject:v5 forKeyedSubscript:@"Client"];
          [v33 setObject:v17 forKeyedSubscript:@"Type"];
          [*(id *)(a1 + 48) addObject:v33];
        }
        ++v16;
      }
      while (v38 != v16);
      uint64_t v38 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v38);
  }

LABEL_28:
}

uint64_t __44__PLLocationAgent_logEventPointClientStatus__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_classDebugEnabled = result;
  return result;
}

uint64_t __44__PLLocationAgent_logEventPointClientStatus__block_invoke_567(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_classDebugEnabled_566 = result;
  return result;
}

uint64_t __44__PLLocationAgent_logEventPointClientStatus__block_invoke_575(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointClientStatus_classDebugEnabled_574 = result;
  return result;
}

uint64_t __44__PLLocationAgent_logEventPointClientStatus__block_invoke_581(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointClientStatus_classDebugEnabled_580 = result;
  return result;
}

uint64_t __44__PLLocationAgent_logEventPointClientStatus__block_invoke_587(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointClientStatus_classDebugEnabled_586 = result;
  return result;
}

- (void)logEventPointWifiLocationScanRequesters:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"WifiLocationScanRequesters"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointMiLoScans:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"MiLoScanEvent"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointMotionPacket:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"MotionPacket"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (BOOL)shouldRateLimitTechStatus
{
  if (+[PLUtilities isPowerlogHelperd]
    || ![MEMORY[0x1E4F929C0] liteMode])
  {
    return 0;
  }
  unint64_t v3 = [(PLLocationAgent *)self lastTechStatusNotificationDate];

  if (v3)
  {
    uint64_t v4 = [(PLLocationAgent *)self lastTechStatusNotificationDate];
    [v4 timeIntervalSinceNow];
    BOOL v6 = v5 >= -2.0;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [(PLLocationAgent *)self setLastTechStatusNotificationDate:v4];
    BOOL v6 = 0;
  }

  return v6;
}

- (void)logEventForwardTechStatus_withLimiter
{
  unint64_t v3 = [(PLLocationAgent *)self techStatusLimiterIsActive];
  objc_sync_enter(v3);
  uint64_t v4 = [(PLLocationAgent *)self techStatusLimiterIsActive];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    if ([(PLLocationAgent *)self shouldRateLimitTechStatus])
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v6 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__PLLocationAgent_logEventForwardTechStatus_withLimiter__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v6;
        if (logEventForwardTechStatus_withLimiter_defaultOnce != -1) {
          dispatch_once(&logEventForwardTechStatus_withLimiter_defaultOnce, block);
        }
        if (logEventForwardTechStatus_withLimiter_classDebugEnabled)
        {
          id v7 = [NSString stringWithFormat:@"Rate-limiting CLTechStatusChangedNotification"];
          id v8 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
          id v10 = [v9 lastPathComponent];
          uint64_t v11 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventForwardTechStatus_withLimiter]"];
          [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:1343];

          uint64_t v12 = PLLogCommon();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      [(PLLocationAgent *)self setTechStatusLimiterIsActive:MEMORY[0x1E4F1CC38]];
      id v13 = [(PLLocationAgent *)self lastTechStatusNotificationDate];
      [v13 timeIntervalSinceNow];
      dispatch_time_t v15 = dispatch_time(1000000000 * (uint64_t)v14, 2000000000);
      uint64_t v16 = [(PLOperator *)self workQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __56__PLLocationAgent_logEventForwardTechStatus_withLimiter__block_invoke_595;
      void v17[3] = &unk_1E6E47848;
      v17[4] = self;
      dispatch_after(v15, v16, v17);
    }
    else
    {
      [(PLLocationAgent *)self logEventForwardTechStatus];
      id v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [(PLLocationAgent *)self setLastTechStatusNotificationDate:v13];
    }
  }
  objc_sync_exit(v3);
}

uint64_t __56__PLLocationAgent_logEventForwardTechStatus_withLimiter__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardTechStatus_withLimiter_classDebugEnabled = result;
  return result;
}

void __56__PLLocationAgent_logEventForwardTechStatus_withLimiter__block_invoke_595(uint64_t a1)
{
  [*(id *)(a1 + 32) logEventForwardTechStatus];
  [*(id *)(a1 + 32) setTechStatusLimiterIsActive:MEMORY[0x1E4F1CC28]];
  id v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [*(id *)(a1 + 32) setLastTechStatusNotificationDate:v2];
}

- (void)logEventForwardTechStatus
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __44__PLLocationAgent_logEventForwardTechStatus__block_invoke;
    v58[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v58[4] = v4;
    if (logEventForwardTechStatus_defaultOnce != -1) {
      dispatch_once(&logEventForwardTechStatus_defaultOnce, v58);
    }
    if (logEventForwardTechStatus_classDebugEnabled)
    {
      char v5 = [NSString stringWithFormat:@"begin"];
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      id v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventForwardTechStatus]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1360];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  id v44 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"TechStatus"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v44];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v12 = [v11 definedKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v55;
    uint64_t v16 = MEMORY[0x1E4F1CC28];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(v12);
        }
        [v11 setObject:v16 forKeyedSubscript:*(void *)(*((void *)&v54 + 1) + 8 * i)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v14);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = (id)CLCopyTechnologiesInUse();
  uint64_t v18 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v51;
    uint64_t v21 = MEMORY[0x1E4F1CC38];
    id v45 = v11;
    do
    {
      uint64_t v22 = 0;
      uint64_t v46 = v19;
      do
      {
        if (*(void *)v51 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v50 + 1) + 8 * v22);
        uint64_t v24 = [(PLLocationAgent *)self humanReadableNameForTechnology:v23];
        [v11 setObject:v21 forKeyedSubscript:v24];

        if ([*(id *)(v3 + 2496) debugEnabled])
        {
          uint64_t v25 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __44__PLLocationAgent_logEventForwardTechStatus__block_invoke_598;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v25;
          if (logEventForwardTechStatus_defaultOnce_596 != -1) {
            dispatch_once(&logEventForwardTechStatus_defaultOnce_596, block);
          }
          if (logEventForwardTechStatus_classDebugEnabled_597)
          {
            uint64_t v26 = v20;
            unint64_t v27 = v3;
            uint64_t v28 = NSString;
            uint64_t v29 = self;
            id v30 = [(PLLocationAgent *)self humanReadableNameForTechnology:v23];
            uint64_t v31 = [v28 stringWithFormat:@"Technology in use=%@", v30];

            long long v32 = (void *)MEMORY[0x1E4F929B8];
            id v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
            id v34 = [v33 lastPathComponent];
            id v35 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventForwardTechStatus]"];
            [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:1372];

            id v36 = PLLogCommon();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v60 = v31;
              _os_log_debug_impl(&dword_1E4220000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v3 = v27;
            self = v29;
            uint64_t v11 = v45;
            uint64_t v19 = v46;
            uint64_t v20 = v26;
            uint64_t v21 = MEMORY[0x1E4F1CC38];
          }
        }
        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
    }
    while (v19);
  }

  [(PLOperator *)self logEntry:v11];
  if ([*(id *)(v3 + 2496) debugEnabled])
  {
    uint64_t v37 = objc_opt_class();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __44__PLLocationAgent_logEventForwardTechStatus__block_invoke_604;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v48[4] = v37;
    if (logEventForwardTechStatus_defaultOnce_602 != -1) {
      dispatch_once(&logEventForwardTechStatus_defaultOnce_602, v48);
    }
    if (logEventForwardTechStatus_classDebugEnabled_603)
    {
      uint64_t v38 = [NSString stringWithFormat:@"end"];
      id v39 = (void *)MEMORY[0x1E4F929B8];
      long long v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      long long v41 = [v40 lastPathComponent];
      long long v42 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventForwardTechStatus]"];
      [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:1376];

      long long v43 = PLLogCommon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __44__PLLocationAgent_logEventForwardTechStatus__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardTechStatus_classDebugEnabled = result;
  return result;
}

uint64_t __44__PLLocationAgent_logEventForwardTechStatus__block_invoke_598(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardTechStatus_classDebugEnabled_597 = result;
  return result;
}

uint64_t __44__PLLocationAgent_logEventForwardTechStatus__block_invoke_604(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardTechStatus_classDebugEnabled_603 = result;
  return result;
}

- (void)updateLocalCacheWithClient:(id)a3 withType:(id)a4 withBundleID:(id)a5 withEntry:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (__CFString *)a5;
  id v13 = a6;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    uint64_t v37 = __78__PLLocationAgent_updateLocalCacheWithClient_withType_withBundleID_withEntry___block_invoke;
    uint64_t v38 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v39 = v14;
    if (updateLocalCacheWithClient_withType_withBundleID_withEntry__defaultOnce != -1) {
      dispatch_once(&updateLocalCacheWithClient_withType_withBundleID_withEntry__defaultOnce, &block);
    }
    if (updateLocalCacheWithClient_withType_withBundleID_withEntry__classDebugEnabled)
    {
      uint64_t v15 = [NSString stringWithFormat:@"client=%@, type=%@, entry=%@", v10, v11, v13, block, v36, v37, v38, v39];
      uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      uint64_t v18 = [v17 lastPathComponent];
      uint64_t v19 = [NSString stringWithUTF8String:"-[PLLocationAgent updateLocalCacheWithClient:withType:withBundleID:withEntry:]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:1383];

      uint64_t v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if (v10 && v11)
  {
    if (!v12) {
      uint64_t v12 = &stru_1F3FCA098;
    }
    uint64_t v21 = [(PLLocationAgent *)self localCache];
    uint64_t v22 = [v21 objectForKeyedSubscript:v10];

    if (!v22)
    {
      uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v24 = [(PLLocationAgent *)self localCache];
      [v24 setObject:v23 forKeyedSubscript:v10];
    }
    uint64_t v25 = [(PLLocationAgent *)self localCache];
    uint64_t v26 = [v25 objectForKeyedSubscript:v10];
    unint64_t v27 = [v26 objectForKeyedSubscript:v11];

    if (!v27)
    {
      uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v29 = [(PLLocationAgent *)self localCache];
      id v30 = [v29 objectForKeyedSubscript:v10];
      [v30 setObject:v28 forKeyedSubscript:v11];
    }
    uint64_t v31 = v13;
    if (!v13)
    {
      uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
    }
    long long v32 = [(PLLocationAgent *)self localCache];
    id v33 = [v32 objectForKeyedSubscript:v10];
    id v34 = [v33 objectForKeyedSubscript:v11];
    [v34 setObject:v31 forKeyedSubscript:v12];

    if (!v13) {
  }
    }
}

uint64_t __78__PLLocationAgent_updateLocalCacheWithClient_withType_withBundleID_withEntry___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateLocalCacheWithClient_withType_withBundleID_withEntry__classDebugEnabled = result;
  return result;
}

- (id)lastEntryWithClient:(id)a3 withType:(id)a4 withBundleID:(id)a5 withEntryKey:(id)a6
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (__CFString *)a5;
  id v13 = a6;
  id v14 = 0;
  if (v10 && v11)
  {
    if (!v12) {
      uint64_t v12 = &stru_1F3FCA098;
    }
    uint64_t v15 = [(PLLocationAgent *)self localCache];
    uint64_t v16 = [v15 objectForKeyedSubscript:v10];
    uint64_t v17 = [v16 objectForKeyedSubscript:v11];
    uint64_t v18 = [v17 objectForKeyedSubscript:v12];

    if (!v18)
    {
      uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"Client" withValue:v10 withComparisonOperation:0];
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"Type" withValue:v11 withComparisonOperation:0];
      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"BundleId" withValue:v12 withComparisonOperation:0];
      uint64_t v21 = [(PLOperator *)self storage];
      v27[0] = v26;
      v27[1] = v19;
      v27[2] = v20;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
      uint64_t v18 = [v21 lastEntryForKey:v13 withComparisons:v22 isSingleton:0];

      [(PLLocationAgent *)self updateLocalCacheWithClient:v10 withType:v11 withBundleID:v12 withEntry:v18];
    }
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
    if (v18 == v23) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = v18;
    }
    id v14 = v24;
  }
  return v14;
}

- (void)resyncActiveClients
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PLLocationAgent_resyncActiveClients__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (resyncActiveClients_defaultOnce != -1) {
      dispatch_once(&resyncActiveClients_defaultOnce, block);
    }
    if (resyncActiveClients_classDebugEnabled)
    {
      uint64_t v4 = [NSString stringWithFormat:@"ResyncingActiveClients on powerlog init"];
      char v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLLocationAgent resyncActiveClients]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1439];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  id v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLLocationAgent *)self setLastResyncActiveClientsDate:v10];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __38__PLLocationAgent_resyncActiveClients__block_invoke_619;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = v11;
    if (resyncActiveClients_defaultOnce_617 != -1) {
      dispatch_once(&resyncActiveClients_defaultOnce_617, v21);
    }
    if (resyncActiveClients_classDebugEnabled_618)
    {
      uint64_t v12 = NSString;
      id v13 = [(PLLocationAgent *)self lastResyncActiveClientsDate];
      id v14 = [v12 stringWithFormat:@"lastResyncActiveClientsDate: %@", v13];

      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      uint64_t v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLLocationAgent resyncActiveClients]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:1441];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v20 = (void *)CLCopyAppsUsingLocation();
  [(PLLocationAgent *)self updateClientsLocationInfo:v20];
}

uint64_t __38__PLLocationAgent_resyncActiveClients__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  resyncActiveClients_classDebugEnabled = result;
  return result;
}

uint64_t __38__PLLocationAgent_resyncActiveClients__block_invoke_619(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  resyncActiveClients_classDebugEnabled_618 = result;
  return result;
}

- (void)logEventForwardClientStatuswithPayload:(id)a3
{
  id v4 = a3;
  char v5 = (void *)os_transaction_create();
  uint64_t v6 = [(PLLocationAgent *)self lastResyncActiveClientsDate];

  int v7 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (v6)
  {
    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke_629;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v8;
      if (logEventForwardClientStatuswithPayload__defaultOnce_627 != -1) {
        dispatch_once(&logEventForwardClientStatuswithPayload__defaultOnce_627, block);
      }
      if (logEventForwardClientStatuswithPayload__classDebugEnabled_628)
      {
        uint64_t v9 = [NSString stringWithFormat:@"Received Client status change notification"];
        id v10 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
        uint64_t v12 = [v11 lastPathComponent];
        id v13 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventForwardClientStatuswithPayload:]"];
        [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:1459];

        id v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    if (v4)
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      uint64_t v16 = [(PLLocationAgent *)self lastResyncActiveClientsDate];
      [v15 timeIntervalSinceDate:v16];
      double v18 = v17;

      if (v18 >= 3600.0)
      {
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v33 = objc_opt_class();
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke_641;
          v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v40[4] = v33;
          if (logEventForwardClientStatuswithPayload__defaultOnce_639 != -1) {
            dispatch_once(&logEventForwardClientStatuswithPayload__defaultOnce_639, v40);
          }
          if (logEventForwardClientStatuswithPayload__classDebugEnabled_640)
          {
            id v34 = objc_msgSend(NSString, "stringWithFormat:", @"diff: %f", *(void *)&v18);
            id v35 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
            uint64_t v37 = [v36 lastPathComponent];
            uint64_t v38 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventForwardClientStatuswithPayload:]"];
            [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:1468];

            uint64_t v39 = PLLogCommon();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }
          }
        }
        [(PLLocationAgent *)self resyncActiveClients];
      }
      else
      {
        [(PLLocationAgent *)self updateClientsLocationInfo:v4];
      }
    }
    else if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v26 = objc_opt_class();
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke_635;
      v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v41[4] = v26;
      if (logEventForwardClientStatuswithPayload__defaultOnce_633 != -1) {
        dispatch_once(&logEventForwardClientStatuswithPayload__defaultOnce_633, v41);
      }
      if (logEventForwardClientStatuswithPayload__classDebugEnabled_634)
      {
        unint64_t v27 = [NSString stringWithFormat:@"No payload!"];
        uint64_t v28 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
        id v30 = [v29 lastPathComponent];
        uint64_t v31 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventForwardClientStatuswithPayload:]"];
        [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:1461];

        long long v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v19 = objc_opt_class();
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke;
      v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v43[4] = v19;
      if (logEventForwardClientStatuswithPayload__defaultOnce != -1) {
        dispatch_once(&logEventForwardClientStatuswithPayload__defaultOnce, v43);
      }
      if (logEventForwardClientStatuswithPayload__classDebugEnabled)
      {
        uint64_t v20 = [NSString stringWithFormat:@"Initializing lastResyncActiveClientsDate"];
        uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
        uint64_t v23 = [v22 lastPathComponent];
        uint64_t v24 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventForwardClientStatuswithPayload:]"];
        [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:1455];

        uint64_t v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    [(PLLocationAgent *)self resyncActiveClients];
  }
}

uint64_t __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardClientStatuswithPayload__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke_629(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardClientStatuswithPayload__classDebugEnabled_628 = result;
  return result;
}

uint64_t __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke_635(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardClientStatuswithPayload__classDebugEnabled_634 = result;
  return result;
}

uint64_t __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke_641(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardClientStatuswithPayload__classDebugEnabled_640 = result;
  return result;
}

- (id)getOpenEntryForClientSettings:(id)a3 withTimeStarted:(id)a4 withClient:(id)a5 withType:(id)a6 withEntryKey:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  uint64_t v16 = (void *)[a3 mutableCopy];
  double v17 = (void *)MEMORY[0x1E4F1C9C8];
  [v15 doubleValue];
  double v19 = v18;

  uint64_t v20 = [v17 dateWithTimeIntervalSinceReferenceDate:v19];
  uint64_t v21 = [v20 convertFromSystemToMonotonic];
  [v16 setObject:v21 forKeyedSubscript:@"entryDate"];

  id v22 = v16;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12 withRawData:v22];

  [v23 setObject:v14 forKeyedSubscript:@"Client"];
  [v23 setObject:v13 forKeyedSubscript:@"Type"];
  uint64_t v24 = [v23 objectForKeyedSubscript:@"BundleId"];
  [(PLLocationAgent *)self updateLocalCacheWithClient:v14 withType:v13 withBundleID:v24 withEntry:v23];

  return v23;
}

- (void)closeOpenEntryForClient:(id)a3 withOpenEntry:(id)a4 withTimeStopped:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1E4F1C9C8];
  [a5 doubleValue];
  uint64_t v11 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
  id v12 = [v11 convertFromSystemToMonotonic];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __73__PLLocationAgent_closeOpenEntryForClient_withOpenEntry_withTimeStopped___block_invoke;
  v30[3] = &unk_1E6E481B0;
  id v13 = v9;
  id v31 = v13;
  id v14 = v12;
  id v32 = v14;
  uint64_t v33 = self;
  [(PLOperator *)self updateEntry:v13 withBlock:v30];
  id v15 = [(PLLocationAgent *)self activeClients];
  uint64_t v16 = [v15 objectForKey:v8];

  if (v16)
  {
    double v17 = [v16 objectForKeyedSubscript:@"BundleId"];
    double v18 = [(PLLocationAgent *)self activeClients];
    [v18 removeObjectForKey:v8];

    if (v17)
    {
      double v19 = [(PLLocationAgent *)self activeBackgroundLocationClients];
      [v19 removeObject:v17];
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v20 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__PLLocationAgent_closeOpenEntryForClient_withOpenEntry_withTimeStopped___block_invoke_651;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v20;
      if (closeOpenEntryForClient_withOpenEntry_withTimeStopped__defaultOnce != -1) {
        dispatch_once(&closeOpenEntryForClient_withOpenEntry_withTimeStopped__defaultOnce, block);
      }
      if (closeOpenEntryForClient_withOpenEntry_withTimeStopped__classDebugEnabled)
      {
        uint64_t v21 = NSString;
        id v22 = [(PLLocationAgent *)self activeClients];
        uint64_t v23 = [v21 stringWithFormat:@"Active clients: %@", v22];

        uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
        uint64_t v26 = [v25 lastPathComponent];
        unint64_t v27 = [NSString stringWithUTF8String:"-[PLLocationAgent closeOpenEntryForClient:withOpenEntry:withTimeStopped:]"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:1518];

        uint64_t v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
  }
}

void __73__PLLocationAgent_closeOpenEntryForClient_withOpenEntry_withTimeStopped___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"timestampEnd"];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __73__PLLocationAgent_closeOpenEntryForClient_withOpenEntry_withTimeStopped___block_invoke_2;
    id v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v13 = v2;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_12_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_12_defaultOnce, &block);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_12_classDebugEnabled)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"!!! %s/%d: location terminate signal; lastEntry=%@",
        "-[PLLocationAgent closeOpenEntryForClient:withOpenEntry:withTimeStopped:]_block_invoke",
        1506,
        *(void *)(a1 + 32),
        block,
        v10,
        v11,
        v12,
      uint64_t v3 = v13);
      id v4 = (void *)MEMORY[0x1E4F929B8];
      char v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      uint64_t v6 = [v5 lastPathComponent];
      int v7 = [NSString stringWithUTF8String:"-[PLLocationAgent closeOpenEntryForClient:withOpenEntry:withTimeStopped:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1506];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __73__PLLocationAgent_closeOpenEntryForClient_withOpenEntry_withTimeStopped___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_12_classDebugEnabled = result;
  return result;
}

uint64_t __73__PLLocationAgent_closeOpenEntryForClient_withOpenEntry_withTimeStopped___block_invoke_651(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  closeOpenEntryForClient_withOpenEntry_withTimeStopped__classDebugEnabled = result;
  return result;
}

- (void)updateClientsLocationInfo:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1E4E7EF70]();
  uint64_t v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ClientStatus"];
  if ([(PLOperator *)self isDebugEnabled]) {
    [(PLLocationAgent *)self logEventNoneClientStatusDebugWithClients:v4];
  }
  int v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [(PLLocationAgent *)self activeBackgroundLocationClients];
  uint64_t v10 = (void *)[v9 copy];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke;
  v36[3] = &unk_1E6E48C00;
  v36[4] = self;
  id v11 = v6;
  id v37 = v11;
  id v12 = v7;
  id v38 = v12;
  id v13 = v8;
  id v39 = v13;
  [v4 enumerateKeysAndObjectsUsingBlock:v36];
  unint64_t v14 = 0x1E4F92000uLL;
  if ([v12 count])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v15 = objc_opt_class();
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_719;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v15;
      if (updateClientsLocationInfo__defaultOnce != -1) {
        dispatch_once(&updateClientsLocationInfo__defaultOnce, v35);
      }
      if (updateClientsLocationInfo__classDebugEnabled)
      {
        id v32 = v4;
        uint64_t v33 = v5;
        uint64_t v16 = [NSString stringWithFormat:@"logging newOpenEntries=%@", v12];
        double v17 = (void *)MEMORY[0x1E4F929B8];
        double v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
        double v19 = [v18 lastPathComponent];
        uint64_t v20 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]"];
        [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:1666];

        uint64_t v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }

        id v4 = v32;
        char v5 = v33;
        unint64_t v14 = 0x1E4F92000;
      }
    }
    id v40 = v11;
    v41[0] = v12;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    [(PLOperator *)self logEntries:v22 withGroupID:v11];
  }
  else
  {
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
    [v22 setIsErrorEntry:1];
    [(PLOperator *)self logEntry:v22];
  }

  [(PLLocationAgent *)self updateLocationDistributionEvents];
  uint64_t v23 = [(PLLocationAgent *)self activeBackgroundLocationClients];
  char v24 = [v10 isEqualToSet:v23];

  if ((v24 & 1) == 0) {
    [(PLLocationAgent *)self updateLocationQualificationEvents];
  }

  if ([*(id *)(v14 + 2496) debugEnabled])
  {
    uint64_t v25 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_722;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v25;
    if (updateClientsLocationInfo__defaultOnce_720 != -1) {
      dispatch_once(&updateClientsLocationInfo__defaultOnce_720, block);
    }
    if (updateClientsLocationInfo__classDebugEnabled_721)
    {
      uint64_t v26 = [NSString stringWithFormat:@"end"];
      unint64_t v27 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      uint64_t v29 = [v28 lastPathComponent];
      id v30 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]"];
      [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:1680];

      id v31 = PLLogCommon();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

void __45__PLLocationAgent_updateClientsLocationInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v143 = a2;
  id v5 = a3;
  unint64_t v6 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    v168[0] = MEMORY[0x1E4F143A8];
    v168[1] = 3221225472;
    v168[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_2;
    v168[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v168[4] = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce, v168);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled)
    {
      id v8 = [NSString stringWithFormat:@"client=%@", v143];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      id v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:1541];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v166 = 0u;
    long long v167 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    id obj = [*(id *)(a1 + 32) clientStatusTypeStrings];
    uint64_t v145 = [obj countByEnumeratingWithState:&v164 objects:v171 count:16];
    if (!v145) {
      goto LABEL_121;
    }
    uint64_t v144 = *(void *)v165;
    v125 = v152;
    v126 = v154;
    v127 = v156;
    v128 = v158;
    id v142 = v5;
    while (1)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v165 != v144) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v164 + 1) + 8 * v14);
        context = (void *)MEMORY[0x1E4E7EF70]();
        uint64_t v16 = [*(id *)(a1 + 32) clientStatusTypeStrings];
        double v17 = [v16 objectForKeyedSubscript:v15];
        double v18 = [v17 objectForKeyedSubscript:@"TimeStarted"];
        uint64_t v19 = [v5 objectForKeyedSubscript:v18];

        uint64_t v20 = [*(id *)(a1 + 32) clientStatusTypeStrings];
        v147 = v15;
        uint64_t v21 = [v20 objectForKeyedSubscript:v15];
        id v22 = [v21 objectForKeyedSubscript:@"TimeStopped"];
        uint64_t v23 = [v5 objectForKeyedSubscript:v22];

        char v24 = [v5 objectForKeyedSubscript:@"InUseLevel"];
        if ([*(id *)(v6 + 2496) debugEnabled])
        {
          uint64_t v25 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_659;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v25;
          if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_657 != -1) {
            dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_657, block);
          }
          if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_658)
          {
            uint64_t v26 = v19;
            uint64_t v27 = a1;
            uint64_t v28 = v23;
            uint64_t v29 = v24;
            id v30 = [NSString stringWithFormat:@"InUseLevel = %@", v24];
            id v31 = (void *)MEMORY[0x1E4F929B8];
            id v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
            uint64_t v33 = [v32 lastPathComponent];
            id v34 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2"];
            [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:1564];

            id v35 = PLLogCommon();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v170 = v30;
              _os_log_debug_impl(&dword_1E4220000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            id v5 = v142;
            unint64_t v6 = 0x1E4F92000uLL;
            char v24 = v29;
            uint64_t v23 = v28;
            a1 = v27;
            uint64_t v19 = v26;
          }
        }
        if (v19 | v23)
        {
          v146 = v24;
          if (v19)
          {
            uint64_t v36 = [v5 objectForKeyedSubscript:@"LocationDesiredAccuracy"];
            id v37 = v36;
            if (v36 && [v36 integerValue] >= 6378136)
            {
              if ([v37 integerValue] != 2147483642) {
                [v37 integerValue];
              }
              goto LABEL_109;
            }
LABEL_35:
          }
          else if ([*(id *)(v6 + 2496) debugEnabled])
          {
            uint64_t v38 = objc_opt_class();
            v162[0] = MEMORY[0x1E4F143A8];
            v162[1] = 3221225472;
            v162[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_666;
            v162[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v162[4] = v38;
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_664 != -1) {
              dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_664, v162);
            }
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_665)
            {
              id v37 = [NSString stringWithFormat:@"type=%@, timeStarted=%@, timeStopped=%@", v147, 0, v23, v125, v126, v127, v128];
              id v39 = (void *)MEMORY[0x1E4F929B8];
              id v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
              long long v41 = [v40 lastPathComponent];
              long long v42 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2"];
              [v39 logMessage:v37 fromFile:v41 fromFunction:v42 fromLineNumber:1580];

              long long v43 = PLLogCommon();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v170 = v37;
                _os_log_debug_impl(&dword_1E4220000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              id v5 = v142;
              unint64_t v6 = 0x1E4F92000uLL;
              goto LABEL_35;
            }
          }
          id v37 = [v5 objectForKeyedSubscript:@"BundleId"];
          id v44 = [*(id *)(a1 + 32) lastEntryWithClient:v143 withType:v147 withBundleID:v37 withEntryKey:*(void *)(a1 + 40)];
          if ([*(id *)(v6 + 2496) debugEnabled])
          {
            uint64_t v45 = objc_opt_class();
            v161[0] = MEMORY[0x1E4F143A8];
            v161[1] = 3221225472;
            v161[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_669;
            v161[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v161[4] = v45;
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_667 != -1) {
              dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_667, v161);
            }
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_668)
            {
              uint64_t v132 = v23;
              uint64_t v46 = v44;
              id v47 = [NSString stringWithFormat:@"lastEntry=%@", v44];
              uint64_t v48 = (void *)MEMORY[0x1E4F929B8];
              v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
              long long v50 = [v49 lastPathComponent];
              long long v51 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2"];
              [v48 logMessage:v47 fromFile:v50 fromFunction:v51 fromLineNumber:1587];

              long long v52 = PLLogCommon();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v170 = v47;
                _os_log_debug_impl(&dword_1E4220000, v52, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              id v5 = v142;
              unint64_t v6 = 0x1E4F92000uLL;
              id v44 = v46;
              uint64_t v23 = v132;
            }
          }
          if (!v44
            || ([v44 objectForKeyedSubscript:@"timestampEnd"],
                long long v53 = objc_claimAutoreleasedReturnValue(),
                v53,
                v53))
          {
            if ([*(id *)(v6 + 2496) debugEnabled])
            {
              uint64_t v54 = objc_opt_class();
              v160[0] = MEMORY[0x1E4F143A8];
              v160[1] = 3221225472;
              v160[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_675;
              v160[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v160[4] = v54;
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_673 != -1) {
                dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_673, v160);
              }
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_674)
              {
                v133 = v44;
                long long v55 = [NSString stringWithFormat:@"last entry doesn't exist or last entry stopped"];
                long long v56 = (void *)MEMORY[0x1E4F929B8];
                long long v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
                v58 = [v57 lastPathComponent];
                id v59 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2"];
                [v56 logMessage:v55 fromFile:v58 fromFunction:v59 fromLineNumber:1592];

                v60 = PLLogCommon();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v170 = v55;
                  _os_log_debug_impl(&dword_1E4220000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                id v5 = v142;
                unint64_t v6 = 0x1E4F92000uLL;
                id v44 = v133;
              }
            }
            if (v19)
            {
              id v61 = [*(id *)(a1 + 32) getOpenEntryForClientSettings:v5 withTimeStarted:v19 withClient:v143 withType:v147 withEntryKey:*(void *)(a1 + 40)];
              [*(id *)(a1 + 48) addObject:v61];
              goto LABEL_54;
            }
            id v61 = 0;
            char v24 = v146;
LABEL_108:

LABEL_109:
            goto LABEL_110;
          }
          v81 = v146;
          if ([*(id *)(v6 + 2496) debugEnabled])
          {
            uint64_t v82 = objc_opt_class();
            v159[0] = MEMORY[0x1E4F143A8];
            v159[1] = 3221225472;
            v159[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_681;
            v159[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v159[4] = v82;
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_679 != -1) {
              dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_679, v159);
            }
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_680)
            {
              v136 = v44;
              v83 = [NSString stringWithFormat:@"last entry exists and is still open"];
              v84 = (void *)MEMORY[0x1E4F929B8];
              v85 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
              v86 = [v85 lastPathComponent];
              v87 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2"];
              [v84 logMessage:v83 fromFile:v86 fromFunction:v87 fromLineNumber:1604];

              v88 = PLLogCommon();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v170 = v83;
                _os_log_debug_impl(&dword_1E4220000, v88, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              id v5 = v142;
              v81 = v146;
              id v44 = v136;
            }
          }
          int v89 = [v81 intValue];
          v90 = [v44 objectForKeyedSubscript:@"InUseLevel"];
          int v91 = [v90 intValue];

          int v92 = [MEMORY[0x1E4F929C0] debugEnabled];
          if (!v19 || v89 == v91)
          {
            unint64_t v6 = 0x1E4F92000;
            if (v23)
            {
              char v24 = v146;
              if (v92)
              {
                uint64_t v110 = objc_opt_class();
                v153[0] = MEMORY[0x1E4F143A8];
                v153[1] = 3221225472;
                v154[0] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_700;
                v154[1] = &__block_descriptor_40_e5_v8__0lu32l8;
                v154[2] = v110;
                if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_698 != -1) {
                  dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_698, v153);
                }
                if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_699)
                {
                  v139 = v44;
                  v131 = v37;
                  v111 = [NSString stringWithFormat:@"Location event stopped"];
                  v112 = (void *)MEMORY[0x1E4F929B8];
                  v113 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
                  v114 = [v113 lastPathComponent];
                  v115 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2"];
                  [v112 logMessage:v111 fromFile:v114 fromFunction:v115 fromLineNumber:1627];

                  v116 = PLLogCommon();
                  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v170 = v111;
                    _os_log_debug_impl(&dword_1E4220000, v116, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  id v5 = v142;
                  char v24 = v146;
                  id v37 = v131;
                  id v44 = v139;
                }
              }
              [*(id *)(a1 + 32) closeOpenEntryForClient:v143 withOpenEntry:v44 withTimeStopped:v23];
              id v61 = 0;
              goto LABEL_108;
            }
            char v24 = v146;
            if (v92)
            {
              uint64_t v117 = objc_opt_class();
              v151[0] = MEMORY[0x1E4F143A8];
              v151[1] = 3221225472;
              v152[0] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_706;
              v152[1] = &__block_descriptor_40_e5_v8__0lu32l8;
              v152[2] = v117;
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_704 != -1) {
                dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_704, v151);
              }
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_705)
              {
                v140 = v44;
                v118 = [NSString stringWithFormat:@"Location event still open"];
                v119 = (void *)MEMORY[0x1E4F929B8];
                v120 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
                v121 = [v120 lastPathComponent];
                v122 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2"];
                [v119 logMessage:v118 fromFile:v121 fromFunction:v122 fromLineNumber:1633];

                v123 = PLLogCommon();
                if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v170 = v118;
                  _os_log_debug_impl(&dword_1E4220000, v123, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                id v5 = v142;
                unint64_t v6 = 0x1E4F92000;
                char v24 = v146;
                id v44 = v140;
              }
            }
            id v61 = v44;
          }
          else
          {
            if (v92)
            {
              uint64_t v93 = objc_opt_class();
              v157[0] = MEMORY[0x1E4F143A8];
              v157[1] = 3221225472;
              v158[0] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_687;
              v158[1] = &__block_descriptor_40_e5_v8__0lu32l8;
              v158[2] = v93;
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_685 != -1) {
                dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_685, v157);
              }
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_686)
              {
                v94 = NSString;
                v137 = v44;
                v95 = [v44 objectForKeyedSubscript:@"InUseLevel"];
                v96 = [v94 stringWithFormat:@"Inuse level changed from %@ to %@", v95, v146];

                v97 = (void *)MEMORY[0x1E4F929B8];
                v98 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
                v99 = [v98 lastPathComponent];
                v100 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2"];
                [v97 logMessage:v96 fromFile:v99 fromFunction:v100 fromLineNumber:1607];

                v101 = PLLogCommon();
                if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v170 = v96;
                  _os_log_debug_impl(&dword_1E4220000, v101, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                id v5 = v142;
                id v44 = v137;
              }
            }
            v102 = (void *)MEMORY[0x1E4F28ED0];
            [*(id *)(a1 + 56) timeIntervalSinceReferenceDate];
            v103 = objc_msgSend(v102, "numberWithDouble:");
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v104 = objc_opt_class();
              v155[0] = MEMORY[0x1E4F143A8];
              v155[1] = 3221225472;
              v156[0] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_694;
              v156[1] = &__block_descriptor_40_e5_v8__0lu32l8;
              v156[2] = v104;
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_692 != -1) {
                dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_692, v155);
              }
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_693)
              {
                v138 = v44;
                v129 = [NSString stringWithFormat:@"TimestampStarted: %@ TimestampInUseLevel: %@", v19, v103];
                v105 = (void *)MEMORY[0x1E4F929B8];
                v106 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
                v107 = [v106 lastPathComponent];
                v108 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2"];
                [v105 logMessage:v129 fromFile:v107 fromFunction:v108 fromLineNumber:1610];

                v109 = PLLogCommon();
                if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v170 = v129;
                  _os_log_debug_impl(&dword_1E4220000, v109, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                id v5 = v142;
                id v44 = v138;
              }
            }
            [*(id *)(a1 + 32) closeOpenEntryForClient:v143 withOpenEntry:v44 withTimeStopped:v103];
            id v61 = [*(id *)(a1 + 32) getOpenEntryForClientSettings:v5 withTimeStarted:v103 withClient:v143 withType:v147 withEntryKey:*(void *)(a1 + 40)];
            [*(id *)(a1 + 48) addObject:v61];

            unint64_t v6 = 0x1E4F92000;
LABEL_54:
            char v24 = v146;
            if (!v61) {
              goto LABEL_108;
            }
          }
          if ([v147 isEqualToString:@"Location"])
          {
            v130 = v37;
            if ([*(id *)(v6 + 2496) debugEnabled])
            {
              uint64_t v62 = objc_opt_class();
              v150[0] = MEMORY[0x1E4F143A8];
              v150[1] = 3221225472;
              v150[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_712;
              v150[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v150[4] = v62;
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_710 != -1) {
                dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_710, v150);
              }
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_711)
              {
                v134 = v44;
                uint64_t v63 = [NSString stringWithFormat:@"still open location openEntry=%@", v61];
                v64 = (void *)MEMORY[0x1E4F929B8];
                v65 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
                v66 = [v65 lastPathComponent];
                v67 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2"];
                [v64 logMessage:v63 fromFile:v66 fromFunction:v67 fromLineNumber:1652];

                v68 = PLLogCommon();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v170 = v63;
                  _os_log_debug_impl(&dword_1E4220000, v68, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                id v5 = v142;
                unint64_t v6 = 0x1E4F92000uLL;
                char v24 = v146;
                id v44 = v134;
              }
            }
            v69 = [*(id *)(a1 + 32) activeClients];
            [v69 setObject:v61 forKeyedSubscript:v143];

            if ([*(id *)(v6 + 2496) debugEnabled])
            {
              uint64_t v70 = objc_opt_class();
              v149[0] = MEMORY[0x1E4F143A8];
              v149[1] = 3221225472;
              v149[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_718;
              v149[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v149[4] = v70;
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_716 != -1) {
                dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_716, v149);
              }
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_717)
              {
                v135 = v44;
                v71 = NSString;
                v72 = [*(id *)(a1 + 32) activeClients];
                v73 = [v71 stringWithFormat:@"Active clients: %@", v72];

                v74 = (void *)MEMORY[0x1E4F929B8];
                v75 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
                v76 = [v75 lastPathComponent];
                v77 = [NSString stringWithUTF8String:"-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2"];
                [v74 logMessage:v73 fromFile:v76 fromFunction:v77 fromLineNumber:1654];

                v78 = PLLogCommon();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v170 = v73;
                  _os_log_debug_impl(&dword_1E4220000, v78, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                id v5 = v142;
                unint64_t v6 = 0x1E4F92000;
                char v24 = v146;
                id v44 = v135;
              }
            }
            v79 = [v61 objectForKeyedSubscript:@"BundleId"];
            if (v79 && ![v24 intValue])
            {
              v80 = [*(id *)(a1 + 32) activeBackgroundLocationClients];
              [v80 addObject:v79];

              char v24 = v146;
            }

            id v37 = v130;
          }
          goto LABEL_108;
        }
LABEL_110:

        ++v14;
      }
      while (v145 != v14);
      uint64_t v124 = [obj countByEnumeratingWithState:&v164 objects:v171 count:16];
      uint64_t v145 = v124;
      if (!v124)
      {
LABEL_121:

        break;
      }
    }
  }
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_659(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_658 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_666(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_665 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_669(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_668 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_675(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_674 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_681(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_680 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_687(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_686 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_694(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_693 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_700(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_699 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_706(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_705 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_712(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_711 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_718(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_717 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_719(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateClientsLocationInfo__classDebugEnabled = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_722(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateClientsLocationInfo__classDebugEnabled_721 = result;
  return result;
}

- (unint64_t)convertClientEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"enabled"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"disabled"])
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = 2;
  }

  return v4;
}

- (unint64_t)convertViewObstructedEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"suppress"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"unsuppress"])
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = 2;
  }

  return v4;
}

- (void)logEventForwardSuppressionManagerClient:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v10 = +[PLOperator entryKeyForType:v4 andName:@"SuppressionManagerClient"];
  unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10 withRawData:v5];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"clientEvent"];

  unint64_t v8 = [(PLLocationAgent *)self convertClientEvent:v7];
  id v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
  [v6 setObject:v9 forKeyedSubscript:@"clientEvent"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardViewObstructed:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v10 = +[PLOperator entryKeyForType:v4 andName:@"ViewObstructed"];
  unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"VOEvent"];

  unint64_t v8 = [(PLLocationAgent *)self convertViewObstructedEvent:v7];
  id v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
  [v6 setObject:v9 forKeyedSubscript:@"VOEvent"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventFowardGPSSubscription:(id)a3
{
  id v15 = a3;
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"GPSActivation"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
  unint64_t v6 = [v15 objectForKeyedSubscript:@"ServiceName"];
  uint64_t v7 = [v6 rangeOfString:@"peer silo:"];
  uint64_t v9 = v8;
  uint64_t v10 = [v6 rangeOfString:@">"];
  id v11 = 0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = objc_msgSend(v6, "substringWithRange:", v7 + v9, v10 - (v7 + v9));
  }
  [v5 setObject:v11 forKeyedSubscript:@"ServiceName"];
  id v12 = (void *)MEMORY[0x1E4F28ED0];
  id v13 = [v15 objectForKeyedSubscript:@"Register"];
  uint64_t v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
  [v5 setObject:v14 forKeyedSubscript:@"Register"];

  [(PLOperator *)self logEntry:v5];
}

- (void)logEventForwardGnssSession:(id)a3
{
  id v4 = a3;
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"GnssSession"];
  unint64_t v6 = [v4 objectForKeyedSubscript:@"eventCfTimeSec"];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v8 = [v4 objectForKeyedSubscript:@"eventCfTimeSec"];
    [v8 doubleValue];
    uint64_t v9 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");

    uint64_t v10 = [v9 convertFromSystemToMonotonic];

    id v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(PLLocationAgent *)v4 logEventForwardGnssSession:v11];
    }

    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5 withDate:v10];
    id v13 = [v4 objectForKeyedSubscript:@"eventType"];
    [v12 setObject:v13 forKeyedSubscript:@"eventType"];

    uint64_t v14 = [v4 objectForKeyedSubscript:@"eventStatus"];
    [v12 setObject:v14 forKeyedSubscript:@"eventStatus"];

    [(PLOperator *)self logEntry:v12];
  }
  else
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5 withRawData:v4];
    [(PLOperator *)self logEntry:v10];
  }
}

- (unint64_t)convertOdometryEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"start"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"stop"])
  {
    unint64_t v4 = 0;
  }
  else
  {
    id v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PLLocationAgent convertOdometryEvent:]();
    }

    unint64_t v4 = 2;
  }

  return v4;
}

- (unint64_t)convertCheckInEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"start"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"stop"])
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = 2;
  }

  return v4;
}

- (void)logEventForwardOdometry:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v12 = +[PLOperator entryKeyForType:v4 andName:@"Odometry"];
  unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"odometryEvent"];
  unint64_t v8 = [(PLLocationAgent *)self convertOdometryEvent:v7];

  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
  [v6 setObject:v9 forKeyedSubscript:@"odometryEvent"];

  uint64_t v10 = [v5 objectForKeyedSubscript:@"updateInterval"];
  [v6 setObject:v10 forKeyedSubscript:@"updateInterval"];

  id v11 = [v5 objectForKeyedSubscript:@"identifier"];

  [v6 setObject:v11 forKeyedSubscript:@"identifier"];
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardCheckInSession:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  unint64_t v6 = [v4 objectForKeyedSubscript:@"event"];

  unint64_t v7 = [(PLLocationAgent *)self convertCheckInEvent:v6];
  unint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v7];
  [v5 setObject:v8 forKeyedSubscript:@"event"];

  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLLocationAgent logEventForwardCheckInSession:]();
  }

  [(PLOperator *)self logForSubsystem:@"CoreRoutine" category:@"CheckInSession" data:v5];
}

- (void)logEventIntervalSeparationAlert:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v13 = +[PLOperator entryKeyForType:v4 andName:@"SeparationAlert"];
  unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13 withRawData:v5];
  unint64_t v7 = [v5 objectForKeyedSubscript:@"timestamp"];

  [v7 doubleValue];
  double v9 = v8;

  uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v9];
  id v11 = [v10 convertFromSystemToMonotonic];
  [v6 setEntryDate:v11];

  id v12 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v6 setObject:v12 forKeyedSubscript:@"timestampEnd"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventIntervalMapsBusynessState:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v21 = +[PLOperator entryKeyForType:v4 andName:@"MapsBusyness"];
  unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v21];
  unint64_t v7 = [v5 objectForKeyedSubscript:&unk_1F400C808];
  [v7 doubleValue];
  double v9 = v8;

  uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v9];
  id v11 = [v10 convertFromSystemToMonotonic];
  [v6 setEntryDate:v11];

  id v12 = [v5 objectForKeyedSubscript:&unk_1F400C820];
  [v6 setObject:v12 forKeyedSubscript:@"Launched"];

  id v13 = [v5 objectForKeyedSubscript:&unk_1F400C838];
  [v6 setObject:v13 forKeyedSubscript:@"HarvestedRealTimeOnPower"];

  uint64_t v14 = [v5 objectForKeyedSubscript:&unk_1F400C850];
  [v6 setObject:v14 forKeyedSubscript:@"HarvestedRealTimeOnBattery"];

  id v15 = [v5 objectForKeyedSubscript:&unk_1F400C868];
  [v6 setObject:v15 forKeyedSubscript:@"HarvestedDifferential"];

  uint64_t v16 = [v5 objectForKeyedSubscript:&unk_1F400C880];
  [v6 setObject:v16 forKeyedSubscript:@"RateLimit"];

  double v17 = [v5 objectForKeyedSubscript:&unk_1F400C898];
  [v6 setObject:v17 forKeyedSubscript:@"LocationNotUsable"];

  double v18 = [v5 objectForKeyedSubscript:&unk_1F400C8B0];
  [v6 setObject:v18 forKeyedSubscript:@"LocationNoAuth"];

  uint64_t v19 = [v5 objectForKeyedSubscript:&unk_1F400C8C8];

  [v6 setObject:v19 forKeyedSubscript:@"LocationUnavailable"];
  uint64_t v20 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v6 setObject:v20 forKeyedSubscript:@"timestampEnd"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventIntervalPDR:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"PDR"];
  unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventNoneClientStatus
{
  id v3 = (id)CLCopyAppsUsingLocation();
  [(PLLocationAgent *)self logEventNoneClientStatusDebugWithClients:v3];
}

- (void)logEventNoneClientStatusDebugWithClients:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F92D40];
  id v5 = a3;
  unint64_t v6 = +[PLOperator entryKeyForType:v4 andName:@"ClientStatusDebug"];
  id v7 = objc_opt_new();
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __60__PLLocationAgent_logEventNoneClientStatusDebugWithClients___block_invoke;
  uint64_t v14 = &unk_1E6E48C28;
  id v15 = v6;
  id v16 = v7;
  double v17 = self;
  id v8 = v7;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v11];

  id v18 = v9;
  v19[0] = v8;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1, v11, v12, v13, v14);
  [(PLOperator *)self logEntries:v10 withGroupID:v9];
}

void __60__PLLocationAgent_logEventNoneClientStatusDebugWithClients___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 32) withRawData:v6];
  [v7 setObject:v5 forKeyedSubscript:@"Client"];
  [*(id *)(a1 + 40) addObject:v7];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    double v17 = __60__PLLocationAgent_logEventNoneClientStatusDebugWithClients___block_invoke_2;
    id v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v8;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_14_defaultOnce != -1) {
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_14_defaultOnce, &block);
    }
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_14_classDebugEnabled)
    {
      id v9 = [NSString stringWithFormat:@"Client=%@ entry=%@ clientSettings=%@", v5, v7, v6, block, v16, v17, v18, v19];
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
      uint64_t v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLLocationAgent logEventNoneClientStatusDebugWithClients:]_block_invoke"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:1921];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __60__PLLocationAgent_logEventNoneClientStatusDebugWithClients___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_14_classDebugEnabled = result;
  return result;
}

- (void)updateLocationDistributionEvents
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    id v3 = [(PLLocationAgent *)self activeClients];
    v71 = self;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __51__PLLocationAgent_updateLocationDistributionEvents__block_invoke;
      v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v88[4] = v4;
      if (updateLocationDistributionEvents_defaultOnce != -1) {
        dispatch_once(&updateLocationDistributionEvents_defaultOnce, v88);
      }
      if (updateLocationDistributionEvents_classDebugEnabled)
      {
        id v5 = [NSString stringWithFormat:@"clientToOpenEntry=%@", v3];
        id v6 = (void *)MEMORY[0x1E4F929B8];
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
        uint64_t v8 = [v7 lastPathComponent];
        id v9 = [NSString stringWithUTF8String:"-[PLLocationAgent updateLocationDistributionEvents]"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1956];

        uint64_t v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    uint64_t v70 = [MEMORY[0x1E4F1CA60] dictionary];
    v69 = [MEMORY[0x1E4F1CA60] dictionary];
    v67 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v11 = v3;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v84 objects:v93 count:16];
    id v72 = v11;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v85;
      uint64_t v73 = *(void *)v85;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v85 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v84 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector())
          {
            double v17 = (void *)MEMORY[0x1E4E7EF70]();
            id v18 = [v11 objectForKeyedSubscript:v16];
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v19 = objc_opt_class();
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __51__PLLocationAgent_updateLocationDistributionEvents__block_invoke_789;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v19;
              if (updateLocationDistributionEvents_defaultOnce_787 != -1) {
                dispatch_once(&updateLocationDistributionEvents_defaultOnce_787, block);
              }
              if (updateLocationDistributionEvents_classDebugEnabled_788)
              {
                uint64_t v20 = [NSString stringWithFormat:@"clientID=%@, openEntry=%@", v16, v18];
                id v21 = (void *)MEMORY[0x1E4F929B8];
                id v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
                uint64_t v23 = [v22 lastPathComponent];
                char v24 = [NSString stringWithUTF8String:"-[PLLocationAgent updateLocationDistributionEvents]"];
                [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:1965];

                uint64_t v25 = PLLogCommon();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  int v92 = v20;
                  _os_log_debug_impl(&dword_1E4220000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                id v11 = v72;
              }
            }
            uint64_t v26 = [v18 objectForKeyedSubscript:@"LocationDesiredAccuracy"];
            uint64_t v27 = v26;
            if (v26)
            {
              [v26 doubleValue];
              if (v28 < 1000.0)
              {
                uint64_t v29 = [v18 entryDate];

                if (v29)
                {
                  id v30 = [v18 objectForKeyedSubscript:@"BundleId"];
                  if (v30) {
                    goto LABEL_74;
                  }
                  if ([v16 hasPrefix:@"com.apple.locationd.bundle-"])
                  {
                    id v40 = [v16 substringFromIndex:objc_msgSend(@"com.apple.locationd.bundle-", "length")];
                    long long v41 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v40];
                    id v30 = +[PLUtilities bundleIDFromURL:v41];

                    id v11 = v72;
                    if (v30)
                    {
LABEL_74:
                      if ([MEMORY[0x1E4F929C0] debugEnabled])
                      {
                        uint64_t v31 = objc_opt_class();
                        v82[0] = MEMORY[0x1E4F143A8];
                        v82[1] = 3221225472;
                        v82[2] = __51__PLLocationAgent_updateLocationDistributionEvents__block_invoke_799;
                        v82[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                        v82[4] = v31;
                        if (updateLocationDistributionEvents_defaultOnce_797 != -1) {
                          dispatch_once(&updateLocationDistributionEvents_defaultOnce_797, v82);
                        }
                        if (updateLocationDistributionEvents_classDebugEnabled_798)
                        {
                          uint64_t v32 = [NSString stringWithFormat:@"bundleID=%@", v30];
                          v68 = (void *)MEMORY[0x1E4F929B8];
                          uint64_t v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m"];
                          id v34 = [v33 lastPathComponent];
                          id v35 = [NSString stringWithUTF8String:"-[PLLocationAgent updateLocationDistributionEvents]"];
                          [v68 logMessage:v32 fromFile:v34 fromFunction:v35 fromLineNumber:1986];

                          uint64_t v36 = (void *)v32;
                          id v37 = PLLogCommon();
                          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412290;
                            int v92 = v36;
                            _os_log_debug_impl(&dword_1E4220000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                          }

                          id v11 = v72;
                        }
                      }
                      [v27 doubleValue];
                      if (v38 >= 100.0) {
                        id v39 = v69;
                      }
                      else {
                        id v39 = v70;
                      }
                      [v39 setObject:&unk_1F400C820 forKeyedSubscript:v30];
                    }
                  }
                }
              }
            }

            uint64_t v14 = v73;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v84 objects:v93 count:16];
      }
      while (v13);
    }

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v42 = [v70 allKeys];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v78 objects:v90 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v79 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = *(void *)(*((void *)&v78 + 1) + 8 * i);
          uint64_t v48 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", 1.0 / (double)(unint64_t)objc_msgSend(v70, "count"));
          [v70 setObject:v48 forKeyedSubscript:v47];
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v78 objects:v90 count:16];
      }
      while (v44);
    }

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v49 = [v69 allKeys];
    uint64_t v50 = [v49 countByEnumeratingWithState:&v74 objects:v89 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v75;
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v75 != v52) {
            objc_enumerationMutation(v49);
          }
          uint64_t v54 = *(void *)(*((void *)&v74 + 1) + 8 * j);
          long long v55 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", 1.0 / (double)(unint64_t)objc_msgSend(v69, "count"));
          [v69 setObject:v55 forKeyedSubscript:v54];
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v74 objects:v89 count:16];
      }
      while (v51);
    }

    if ([v70 count]) {
      long long v56 = v70;
    }
    else {
      long long v56 = v69;
    }
    [v67 setValuesForKeysWithDictionary:v56];
    int v57 = [v70 isEqualToDictionary:v71->_bundleIDToWeightUsingGPSCache];
    int v58 = [v69 isEqualToDictionary:v71->_bundleIDToWeightUsingWiFiCache];
    char v59 = [v67 isEqualToDictionary:v71->_bundleIDToWeightUsingLocationCache];
    char v60 = v59;
    id v61 = v72;
    if (v57 && v58 && (v59 & 1) != 0) {
      goto LABEL_67;
    }
    uint64_t v62 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    if (v57)
    {
      if (v58) {
        goto LABEL_64;
      }
    }
    else
    {
      v64 = [MEMORY[0x1E4F92900] sharedInstance];
      [v64 createDistributionEventForwardWithDistributionID:23 withChildNodeNameToWeight:v70 withStartDate:v62];

      v65 = [MEMORY[0x1E4F92900] sharedInstance];
      [v65 createDistributionEventForwardWithDistributionID:24 withChildNodeNameToWeight:v70 withStartDate:v62];

      id v61 = v72;
      objc_storeStrong((id *)&v71->_bundleIDToWeightUsingGPSCache, v70);
      if (v58)
      {
LABEL_64:
        if (v60)
        {
LABEL_66:

LABEL_67:
          return;
        }
LABEL_65:
        uint64_t v63 = [MEMORY[0x1E4F92900] sharedInstance];
        [v63 createDistributionEventForwardWithDistributionID:30 withChildNodeNameToWeight:v67 withStartDate:v62];

        objc_storeStrong((id *)&v71->_bundleIDToWeightUsingLocationCache, v67);
        goto LABEL_66;
      }
    }
    v66 = [MEMORY[0x1E4F92900] sharedInstance];
    [v66 createDistributionEventForwardWithDistributionID:25 withChildNodeNameToWeight:v69 withStartDate:v62];

    id v61 = v72;
    objc_storeStrong((id *)&v71->_bundleIDToWeightUsingWiFiCache, v69);
    if (v60) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
}

uint64_t __51__PLLocationAgent_updateLocationDistributionEvents__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateLocationDistributionEvents_classDebugEnabled = result;
  return result;
}

uint64_t __51__PLLocationAgent_updateLocationDistributionEvents__block_invoke_789(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateLocationDistributionEvents_classDebugEnabled_788 = result;
  return result;
}

uint64_t __51__PLLocationAgent_updateLocationDistributionEvents__block_invoke_799(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateLocationDistributionEvents_classDebugEnabled_798 = result;
  return result;
}

- (void)updateLocationQualificationEvents
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F92900] sharedInstance];
    id v3 = [(PLLocationAgent *)self activeBackgroundLocationClients];
    uint64_t v4 = [v3 allObjects];
    id v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v6 createQualificationEventForwardWithQualificationID:15 withChildNodeNames:v4 withStartDate:v5];
  }
}

- (void)updateGnssPowerMetric:(id)a3
{
  id v20 = a3;
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"GPSPower"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
  id v6 = [v20 objectForKey:@"intervalStartTime"];
  [v5 setObject:v6 forKeyedSubscript:@"startTime"];

  id v7 = [v20 objectForKey:@"measuredInterval"];
  [v5 setObject:v7 forKeyedSubscript:@"measuredInterval"];

  uint64_t v8 = [v20 objectForKey:@"activeInterval"];
  [v5 setObject:v8 forKeyedSubscript:@"activeInterval"];

  id v9 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v10 = [v20 objectForKey:@"averagePower"];
  [v10 doubleValue];
  uint64_t v12 = [v9 numberWithInt:(100 * (int)v11)];
  [v5 setObject:v12 forKeyedSubscript:@"averagePower"];

  uint64_t v13 = [v20 objectForKey:@"activeL5IntervalSec"];
  [v5 setObject:v13 forKeyedSubscript:@"activeL5IntervalSec"];

  [(PLOperator *)self logEntry:v5];
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    uint64_t v14 = [v5 entryDate];
    uint64_t v15 = [v20 objectForKey:@"averagePower"];
    [v15 doubleValue];
    double v17 = v16;
    id v18 = [v20 objectForKey:@"measuredInterval"];
    [v18 doubleValue];
    [(PLLocationAgent *)self modelGpsSegmentPower:v14 withGpsPower:v17 withTotalDuration:v19];
  }
}

- (void)modelGpsSegmentPower:(id)a3 withGpsPower:(double)a4 withTotalDuration:(double)a5
{
  id v15 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    [v15 timeIntervalSince1970];
    double v10 = v9;
    if (self->_gps_segment_lastWrittenDate)
    {
      double gps_segment_lastWrittenTimestamp = self->_gps_segment_lastWrittenTimestamp;
      double v12 = self->_gps_segment_timestamp - gps_segment_lastWrittenTimestamp;
      double v13 = 0.0;
      if (v12 > 0.0) {
        double v13 = v12 * self->_gps_segment_power;
      }
      double v14 = v10 - gps_segment_lastWrittenTimestamp;
      if (v14 > 0.0)
      {
        self->_gps_segment_power = (v13 + a4 * a5) / v14;
        objc_storeStrong((id *)&self->_gps_segment_date, a3);
        self->_gps_segment_timestamp = v10;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_gps_segment_lastWrittenDate, a3);
      self->_double gps_segment_lastWrittenTimestamp = v10;
      objc_storeStrong((id *)&self->_gps_segment_date, a3);
      self->_gps_segment_timestamp = self->_gps_segment_lastWrittenTimestamp;
      self->_gps_segment_power = a4;
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)writeModeledPower
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0
    && self->_gps_segment_timestamp != self->_gps_segment_lastWrittenTimestamp)
  {
    if (self->_gps_segment_power > 1000.0) {
      self->_gps_segment_power = 1000.0;
    }
    id v3 = [MEMORY[0x1E4F92900] sharedInstance];
    [v3 createPowerEventBackwardWithRootNodeID:48 withPower:self->_gps_segment_date withEndDate:self->_gps_segment_power];

    objc_storeStrong((id *)&self->_gps_segment_lastWrittenDate, self->_gps_segment_date);
    self->_double gps_segment_lastWrittenTimestamp = self->_gps_segment_timestamp;
  }
}

- (PLCFNotificationOperatorComposition)techStatusChangedNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTechStatusChangedNotification:(id)a3
{
}

- (NSDate)lastTechStatusNotificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastTechStatusNotificationDate:(id)a3
{
}

- (NSNumber)techStatusLimiterIsActive
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTechStatusLimiterIsActive:(id)a3
{
}

- (PLXPCListenerOperatorComposition)logLevelNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLogLevelNotification:(id)a3
{
}

- (PLXPCListenerOperatorComposition)statusBarNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setStatusBarNotification:(id)a3
{
}

- (PLXPCListenerOperatorComposition)clientStatusNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setClientStatusNotification:(id)a3
{
}

- (PLXPCListenerOperatorComposition)gpsSubscriptionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setGpsSubscriptionListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)mapsBusynessStateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMapsBusynessStateListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)separationAlertListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSeparationAlertListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)locationGPSListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLocationGPSListener:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)sbcLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSbcLevelChanged:(id)a3
{
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)wifiLocationScanRequestersListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setWifiLocationScanRequestersListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)odometryListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOdometryListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)pdrListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPdrListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)checkInSessionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCheckInSessionXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)miLoScansListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMiLoScansListener:(id)a3
{
}

- (NSMutableDictionary)localCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLocalCache:(id)a3
{
}

- (NSMutableDictionary)clientStatusTypeStrings
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setClientStatusTypeStrings:(id)a3
{
}

- (NSMutableSet)processes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 200, 1);
}

- (void)setProcesses:(id)a3
{
}

- (NSMutableDictionary)bundleIDToWeightUsingGPSCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setBundleIDToWeightUsingGPSCache:(id)a3
{
}

- (NSMutableDictionary)bundleIDToWeightUsingWiFiCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setBundleIDToWeightUsingWiFiCache:(id)a3
{
}

- (NSMutableDictionary)bundleIDToWeightUsingLocationCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBundleIDToWeightUsingLocationCache:(id)a3
{
}

- (NSMutableDictionary)activeClients
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setActiveClients:(id)a3
{
}

- (NSMutableSet)activeBackgroundLocationClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 240, 1);
}

- (void)setActiveBackgroundLocationClients:(id)a3
{
}

- (NSDate)lastResyncActiveClientsDate
{
  return (NSDate *)objc_getProperty(self, a2, 248, 1);
}

- (void)setLastResyncActiveClientsDate:(id)a3
{
}

- (double)gps_segment_power
{
  return self->_gps_segment_power;
}

- (void)setGps_segment_power:(double)a3
{
  self->_gps_segment_power = a3;
}

- (NSDate)gps_segment_lastWrittenDate
{
  return (NSDate *)objc_getProperty(self, a2, 264, 1);
}

- (void)setGps_segment_lastWrittenDate:(id)a3
{
}

- (double)gps_segment_lastWrittenTimestamp
{
  return self->_gps_segment_lastWrittenTimestamp;
}

- (void)setGps_segment_lastWrittenTimestamp:(double)a3
{
  self->_double gps_segment_lastWrittenTimestamp = a3;
}

- (NSDate)gps_segment_date
{
  return (NSDate *)objc_getProperty(self, a2, 280, 1);
}

- (void)setGps_segment_date:(id)a3
{
}

- (double)gps_segment_timestamp
{
  return self->_gps_segment_timestamp;
}

- (void)setGps_segment_timestamp:(double)a3
{
  self->_gps_segment_timestamp = a3;
}

- (PLXPCListenerOperatorComposition)viewObstructedListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 296, 1);
}

- (void)setViewObstructedListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)suppressionManagerClientListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSuppressionManagerClientListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)gnssSessionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 312, 1);
}

- (void)setGnssSessionListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)motionPacketListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 320, 1);
}

- (void)setMotionPacketListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionPacketListener, 0);
  objc_storeStrong((id *)&self->_gnssSessionListener, 0);
  objc_storeStrong((id *)&self->_suppressionManagerClientListener, 0);
  objc_storeStrong((id *)&self->_viewObstructedListener, 0);
  objc_storeStrong((id *)&self->_gps_segment_date, 0);
  objc_storeStrong((id *)&self->_gps_segment_lastWrittenDate, 0);
  objc_storeStrong((id *)&self->_lastResyncActiveClientsDate, 0);
  objc_storeStrong((id *)&self->_activeBackgroundLocationClients, 0);
  objc_storeStrong((id *)&self->_activeClients, 0);
  objc_storeStrong((id *)&self->_bundleIDToWeightUsingLocationCache, 0);
  objc_storeStrong((id *)&self->_bundleIDToWeightUsingWiFiCache, 0);
  objc_storeStrong((id *)&self->_bundleIDToWeightUsingGPSCache, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_clientStatusTypeStrings, 0);
  objc_storeStrong((id *)&self->_localCache, 0);
  objc_storeStrong((id *)&self->_miLoScansListener, 0);
  objc_storeStrong((id *)&self->_checkInSessionXPCListener, 0);
  objc_storeStrong((id *)&self->_pdrListener, 0);
  objc_storeStrong((id *)&self->_odometryListener, 0);
  objc_storeStrong((id *)&self->_wifiLocationScanRequestersListener, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_sbcLevelChanged, 0);
  objc_storeStrong((id *)&self->_locationGPSListener, 0);
  objc_storeStrong((id *)&self->_separationAlertListener, 0);
  objc_storeStrong((id *)&self->_mapsBusynessStateListener, 0);
  objc_storeStrong((id *)&self->_gpsSubscriptionListener, 0);
  objc_storeStrong((id *)&self->_clientStatusNotification, 0);
  objc_storeStrong((id *)&self->_statusBarNotification, 0);
  objc_storeStrong((id *)&self->_logLevelNotification, 0);
  objc_storeStrong((id *)&self->_techStatusLimiterIsActive, 0);
  objc_storeStrong((id *)&self->_lastTechStatusNotificationDate, 0);
  objc_storeStrong((id *)&self->_techStatusChangedNotification, 0);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_496_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Received InertialOdometryPowerMetric XPC with payload=%@", v2, v3, v4, v5, v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_504_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Received PedestrianFencePowerMetric XPC with payload=%@", v2, v3, v4, v5, v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_514_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "CheckInSession callback %@", v2, v3, v4, v5, v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_519_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Received MiLoScanEvent XPC with payload=%@", v2, v3, v4, v5, v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_527_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Received gpsactivation XPC with payload=%@", v2, v3, v4, v5, v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_532_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Received GnssSession XPC with payload=%@", v2, v3, v4, v5, v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_537_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Received MotionPacket XPC with payload=%@", v2, v3, v4, v5, v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_545_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "ViewObstructed state change XPC with payload=%@", v2, v3, v4, v5, v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_553_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "SuppressionManager client state change XPC with payload=%@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardGnssSession:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 objectForKeyedSubscript:@"eventCfTimeSec"];
  v6[0] = 67109378;
  v6[1] = [v5 intValue];
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1E4220000, a3, OS_LOG_TYPE_DEBUG, "GnssSession logging absolute time %d as logging timestamp %@", (uint8_t *)v6, 0x12u);
}

- (void)convertOdometryEvent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Unknown odometryEvent %@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardCheckInSession:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "CheckInSession updated payload: %@", v2, v3, v4, v5, v6);
}

@end