@interface PLWifiAgent
+ (BOOL)isBeaconLoggingEnabled;
+ (BOOL)isNonUDMMac;
+ (BOOL)isScanForwardLoggingEnabled;
+ (BOOL)isScanLoggingEnabled;
+ (id)entryEventBackwardDefinitionAutoJoin;
+ (id)entryEventBackwardDefinitionBeaconProfile;
+ (id)entryEventBackwardDefinitionCumulativeBasic;
+ (id)entryEventBackwardDefinitionCumulativeBasicMac;
+ (id)entryEventBackwardDefinitionCumulativeMultiCore;
+ (id)entryEventBackwardDefinitionDiffBasic;
+ (id)entryEventBackwardDefinitionHotspotPowerStats;
+ (id)entryEventBackwardDefinitionScanForwardStats;
+ (id)entryEventBackwardDefinitionScans;
+ (id)entryEventBackwardDefinitionUserScan;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionAWDLState;
+ (id)entryEventForwardDefinitionHotspotState;
+ (id)entryEventForwardDefinitionModuleInfo;
+ (id)entryEventForwardDefinitionPowerState;
+ (id)entryEventForwardDefinitionRSSI;
+ (id)entryEventForwardDefinitionWifiAssist;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionAWDLServicesAndPorts;
+ (id)entryEventPointDefinitionJoin;
+ (id)entryEventPointDefinitionRemoteControlSession;
+ (id)entryEventPointDefinitionWake;
+ (id)entryEventPointDefinitionWifiInstantPower;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (BOOL)hasWiFi;
- (BOOL)isWiFiPowered;
- (BOOL)isWowEnabled;
- (BOOL)isWowSupported;
- (NSDate)wifi_segment_date;
- (NSDate)wifi_segment_lastWrittenDate;
- (NSString)wifiChipset;
- (NSString)wifiManufacturer;
- (PLCFNotificationOperatorComposition)notificationWiFiChanged;
- (PLEntry)lastEntryForHelperd;
- (PLEntryNotificationOperatorComposition)batteryLevelChanged;
- (PLEntryNotificationOperatorComposition)deviceWake;
- (PLEntryNotificationOperatorComposition)remoteSessionCallback;
- (PLEntryNotificationOperatorComposition)sbcLevelChanged;
- (PLNSNotificationOperatorComposition)thermalMonitorListener;
- (PLWifiAgent)init;
- (PLXPCListenerOperatorComposition)remoteControlSessionListener;
- (WiFiP2PAWDLStateMonitor)monitor;
- (__WiFiDeviceClient)wifiAwdlDevice;
- (__WiFiDeviceClient)wifiDevice;
- (__WiFiDeviceClient)wifiHotspotDevice;
- (__WiFiManagerClient)wifiManager;
- (double)wifi_segment_lastWrittenTimestamp;
- (double)wifi_segment_power_data;
- (double)wifi_segment_power_idle;
- (double)wifi_segment_power_location;
- (double)wifi_segment_power_pipeline;
- (double)wifi_segment_timestamp;
- (id)decodeWifiEventLinkReason:(unsigned int)a3;
- (id)wifiChipsetQuery;
- (id)wifiManufacturerQuery;
- (unint64_t)autoJoinScanDuration;
- (unint64_t)getCurrentChannelWidth:(__WiFiNetwork *)a3;
- (unint64_t)lastLoggedTimestamp;
- (unint64_t)locationScanDuration;
- (unint64_t)pipelineScanDuration;
- (unint64_t)remainingAllowedRSSIEntryCount;
- (unint64_t)setupScanDuration;
- (unint64_t)unknownScanDuration;
- (void)findWifiDevice;
- (void)handleRemoteSessionCallbackWithUserInfo:(id)a3;
- (void)initOperatorDependancies;
- (void)log;
- (void)logAWDLStateEntry:(id)a3;
- (void)logEventBackwardCumulativeProperties;
- (void)logEventBackwardDiffProperties;
- (void)logEventBackwardUserScanDuration;
- (void)logEventBackwardWifiProperties:(BOOL)a3;
- (void)logEventBackwardWifiProperties:(id)a3 withNetworkProperties:(id)a4 shallModelPower:(BOOL)a5;
- (void)logEventForwardAWDLState:(id)a3;
- (void)logEventForwardHotspotState:(id)a3;
- (void)logEventForwardModuleInfo;
- (void)logEventForwardRSSI:(id)a3;
- (void)logEventForwardWifiAssist:(BOOL)a3;
- (void)logEventPointAWDLServicesAndPorts;
- (void)logEventPointJoin:(unsigned __int8)a3 withStats:(id)a4;
- (void)logEventPointMetricMonitorInstantKeys;
- (void)logEventPointRemoteControlSession:(id)a3;
- (void)logEventPointWake:(id)a3;
- (void)logEventPointWakeDataFrame:(id)a3 withParams:(id)a4 toEntry:(id)a5;
- (void)logEventPointWakeLink:(id)a3 withParams:(id)a4 toEntry:(id)a5;
- (void)logEventPointWakePNO:(id)a3 withParams:(id)a4 toEntry:(id)a5;
- (void)logFromAJCallback:(id)a3 withFlag:(unsigned __int8)a4 withStats:(id)a5;
- (void)logFromLinkChangeCallback:(id)a3 withStats:(id)a4;
- (void)logFromWiFiNoAvailableCallback:(id)a3 withAvailability:(BOOL)a4 withWakeParams:(id)a5;
- (void)modelWiFiPower:(id)a3;
- (void)modelWiFiSegmentPower:(id)a3 withDataPower:(double)a4 withIdlePower:(double)a5 withLocationPower:(double)a6 withPipelinePower:(double)a7 withTotalDuration:(double)a8;
- (void)setAutoJoinScanDuration:(unint64_t)a3;
- (void)setBatteryLevelChanged:(id)a3;
- (void)setDeviceWake:(id)a3;
- (void)setLastEntryForHelperd:(id)a3;
- (void)setLastLoggedTimestamp:(unint64_t)a3;
- (void)setLocationScanDuration:(unint64_t)a3;
- (void)setMonitor:(id)a3;
- (void)setPipelineScanDuration:(unint64_t)a3;
- (void)setRemainingAllowedRSSIEntryCount:(unint64_t)a3;
- (void)setRemoteControlSessionListener:(id)a3;
- (void)setRemoteSessionCallback:(id)a3;
- (void)setSbcLevelChanged:(id)a3;
- (void)setSetupScanDuration:(unint64_t)a3;
- (void)setThermalMonitorListener:(id)a3;
- (void)setUnknownScanDuration:(unint64_t)a3;
- (void)setWiFiAWDLDevice:(__WiFiDeviceClient *)a3;
- (void)setWiFiHotspotDevice:(__WiFiDeviceClient *)a3;
- (void)setWifiAwdlDevice:(__WiFiDeviceClient *)a3;
- (void)setWifiDevice:(__WiFiDeviceClient *)a3;
- (void)setWifiHotspotDevice:(__WiFiDeviceClient *)a3;
- (void)setWifiManager:(__WiFiManagerClient *)a3;
- (void)setWifi_segment_date:(id)a3;
- (void)setWifi_segment_lastWrittenDate:(id)a3;
- (void)setWifi_segment_lastWrittenTimestamp:(double)a3;
- (void)setWifi_segment_power_data:(double)a3;
- (void)setWifi_segment_power_idle:(double)a3;
- (void)setWifi_segment_power_location:(double)a3;
- (void)setWifi_segment_power_pipeline:(double)a3;
- (void)setWifi_segment_timestamp:(double)a3;
- (void)updateEventBackwardUserScanDuration:(id)a3;
- (void)writeModeledPower;
@end

@implementation PLWifiAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLWifiAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitionWifiInstantPower
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (+[PLUtilities isPowerlogHelperd])
  {
    v12[0] = *MEMORY[0x1E4F92C50];
    uint64_t v10 = *MEMORY[0x1E4F92CD0];
    v11 = &unk_1F4011FB8;
    objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v13[0] = v2;
    v12[1] = *MEMORY[0x1E4F92CA8];
    v8 = @"WifiPower";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v9 = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v13[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v6;
}

+ (id)entryEventPointDefinitions
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"Wake";
  objc_super v2 = +[PLWifiAgent entryEventPointDefinitionWake];
  v10[0] = v2;
  v9[1] = @"AWDLServicesAndPorts";
  v3 = +[PLWifiAgent entryEventPointDefinitionAWDLServicesAndPorts];
  v10[1] = v3;
  v9[2] = @"Join";
  v4 = +[PLWifiAgent entryEventPointDefinitionJoin];
  v10[2] = v4;
  v9[3] = @"RemoteControlSession";
  v5 = +[PLWifiAgent entryEventPointDefinitionRemoteControlSession];
  v10[3] = v5;
  v9[4] = @"MetricMonitorInstantKeys";
  v6 = +[PLWifiAgent entryEventPointDefinitionWifiInstantPower];
  v10[4] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

- (void)logEventPointMetricMonitorInstantKeys
{
}

+ (id)entryEventPointDefinitionWake
{
  v38[3] = *MEMORY[0x1E4F143B8];
  if (+[PLWifiAgent isNonUDMMac])
  {
    objc_super v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v37[0] = *MEMORY[0x1E4F92C50];
    uint64_t v3 = *MEMORY[0x1E4F92C60];
    v35[0] = *MEMORY[0x1E4F92CD0];
    v35[1] = v3;
    v36[0] = &unk_1F4011FC8;
    v36[1] = MEMORY[0x1E4F1CC38];
    uint64_t v4 = *MEMORY[0x1E4F92C08];
    v35[2] = *MEMORY[0x1E4F92CB8];
    v35[3] = v4;
    v36[2] = MEMORY[0x1E4F1CC28];
    v36[3] = MEMORY[0x1E4F1CC38];
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];
    v38[0] = v28;
    v37[1] = *MEMORY[0x1E4F92CA8];
    v33[0] = @"WakeReason";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v27, "commonTypeDict_StringFormat");
    v34[0] = v26;
    v33[1] = @"WakeTime";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
    v34[1] = v24;
    v33[2] = @"PID";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v34[2] = v22;
    v33[3] = @"ProcessName";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_StringFormat_withProcessName");
    v34[3] = v20;
    v33[4] = @"WakeLen";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v34[4] = v18;
    v33[5] = @"spi";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v34[5] = v16;
    v33[6] = @"seqNo";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v34[6] = v6;
    v33[7] = @"TCPKAWakeReason";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
    v34[7] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:8];
    v38[1] = v9;
    v37[2] = *MEMORY[0x1E4F92C68];
    v31[0] = @"value";
    uint64_t v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
    v31[1] = @"unit";
    v32[0] = v11;
    uint64_t v12 = *MEMORY[0x1E4F92D18];
    v29[0] = *MEMORY[0x1E4F92D10];
    v29[1] = v12;
    v30[0] = &unk_1F400CE80;
    v30[1] = @"s";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    v32[1] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    v38[2] = v14;
    objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
  }
  return v2;
}

+ (id)entryEventPointDefinitionJoin
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v33[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v31[0] = *MEMORY[0x1E4F92CD0];
  v31[1] = v2;
  v32[0] = &unk_1F4011FD8;
  v32[1] = MEMORY[0x1E4F1CC28];
  void v31[2] = *MEMORY[0x1E4F92CB8];
  void v32[2] = MEMORY[0x1E4F1CC28];
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E4F92CA8];
  v29[0] = @"State";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v30[0] = v26;
  v29[1] = @"Reason";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v30[1] = v24;
  void v29[2] = @"LPM_LPAS_POWER_BUDGET_REMAINING";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  void v30[2] = v22;
  v29[3] = @"LPM_POWER_CONSUMPTION_DUE_TO_FRTS";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v30[3] = v20;
  v29[4] = @"LPM_POWER_CONSUMPTION_DUE_TO_MAC";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v30[4] = v18;
  v29[5] = @"LPM_POWER_CONSUMPTION_DUE_TO_RF";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v30[5] = v16;
  v29[6] = @"LPM_POWER_CONSUMPTION_DUE_TO_ROAM_SCAN";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v30[6] = v14;
  v29[7] = @"LPM_POWER_CONSUMPTION_DUE_TO_USER_SCAN";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v30[7] = v4;
  v29[8] = @"LPM_POWER_CONSUMPTION_IN_SELF_MANAGED_LPAS";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v30[8] = v6;
  v29[9] = @"LPM_TOTAL_LPAS_DURATION";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v30[9] = v8;
  v29[10] = @"LPM_TOTAL_LPAS_POWER_PERIOD_REMAINING";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v30[10] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:11];
  v34[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionRemoteControlSession
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v20 = *MEMORY[0x1E4F92CD0];
  v21 = &unk_1F4011FB8;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"Active";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v19[0] = v15;
  v18[1] = @"BundleID";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_StringFormat_withBundleID");
  v19[1] = v13;
  v18[2] = @"ConnectionID";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
  v19[2] = v3;
  v18[3] = @"DeviceType";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19[3] = v5;
  v18[4] = @"Reason";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v19[4] = v7;
  v18[5] = @"TransportType";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v19[5] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  v23[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionAWDLServicesAndPorts
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v24 = *MEMORY[0x1E4F92CD0];
  v25 = &unk_1F4011FB8;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"port_1";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v23[0] = v19;
  v22[1] = @"port_2";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v23[1] = v17;
  void v22[2] = @"port_3";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v23[2] = v15;
  v22[3] = @"port_4";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v23[3] = v13;
  v22[4] = @"service_1";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
  void v23[4] = v3;
  v22[5] = @"service_2";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v23[5] = v5;
  v22[6] = @"service_3";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v23[6] = v7;
  v22[7] = @"service_4";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v23[7] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:8];
  v27[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitions
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"AWDLState";
  uint64_t v2 = +[PLWifiAgent entryEventForwardDefinitionAWDLState];
  v10[0] = v2;
  v9[1] = @"HotspotState";
  uint64_t v3 = +[PLWifiAgent entryEventForwardDefinitionHotspotState];
  v10[1] = v3;
  v9[2] = @"ModuleInfo";
  uint64_t v4 = +[PLWifiAgent entryEventForwardDefinitionModuleInfo];
  v10[2] = v4;
  v9[3] = @"WifiAssist";
  v5 = +[PLWifiAgent entryEventForwardDefinitionWifiAssist];
  v10[3] = v5;
  v9[4] = @"RSSI";
  v6 = +[PLWifiAgent entryEventForwardDefinitionRSSI];
  v10[4] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

+ (id)entryEventForwardDefinitionModuleInfo
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (+[PLWifiAgent isNonUDMMac])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v16 = *MEMORY[0x1E4F92CD0];
    v17 = &unk_1F4011FB8;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19[0] = v13;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"ChipInfo";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
    v15[0] = v4;
    v14[1] = @"ManufacturerId";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v15[1] = v6;
    v14[2] = @"ModuleInfo";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
    v15[2] = v8;
    v14[3] = @"ProductId";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v15[3] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    v19[1] = v11;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  return v2;
}

+ (id)entryEventForwardDefinitionRSSI
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v24[0] = *MEMORY[0x1E4F92CD0];
  v24[1] = v2;
  v25[0] = &unk_1F4011FB8;
  v25[1] = MEMORY[0x1E4F1CC28];
  v24[2] = *MEMORY[0x1E4F92C70];
  uint64_t v3 = MEMORY[0x1E4F1CC38];
  v25[2] = MEMORY[0x1E4F1CC38];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  v27[0] = v4;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"RSSI";
  uint64_t v5 = *MEMORY[0x1E4F92D10];
  v21[0] = &unk_1F400CE98;
  uint64_t v6 = *MEMORY[0x1E4F92C88];
  v20[0] = v5;
  v20[1] = v6;
  uint64_t v18 = *MEMORY[0x1E4F92C80];
  uint64_t v19 = v3;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v21[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v22[1] = @"ScaledRSSI";
  v23[0] = v8;
  v16[1] = v6;
  v17[0] = &unk_1F400CE98;
  v16[0] = v5;
  uint64_t v14 = *MEMORY[0x1E4F92C78];
  v15 = &unk_1F4011FE8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v23[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v27[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionWifiAssist
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F4011FB8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"WifiAssistFallback";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v9 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitionHotspotState
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4011FB8;
  v14[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"HotSpotOn";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v11[1] = @"ADHS";
  v12[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventForwardDefinitionAWDLState
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  if (+[PLWifiAgent isNonUDMMac])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v15[0] = *MEMORY[0x1E4F92C50];
    uint64_t v3 = *MEMORY[0x1E4F92CB8];
    v13[0] = *MEMORY[0x1E4F92CD0];
    v13[1] = v3;
    v14[0] = &unk_1F4011FF8;
    v14[1] = MEMORY[0x1E4F1CC28];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    v16[0] = v4;
    v15[1] = *MEMORY[0x1E4F92CA8];
    v11[0] = @"AWDLDown";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
    v11[1] = @"AWDLRanging";
    v12[0] = v6;
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v12[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v16[1] = v9;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  return v2;
}

+ (id)entryEventForwardDefinitionPowerState
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F4011FB8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"PowerOn";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v9 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventBackwardDefinitions
{
  v13[8] = *MEMORY[0x1E4F143B8];
  v12[0] = @"BeaconProfile";
  uint64_t v2 = +[PLWifiAgent entryEventBackwardDefinitionBeaconProfile];
  v13[0] = v2;
  v12[1] = @"CumulativeProperties";
  uint64_t v3 = +[PLWifiAgent entryEventBackwardDefinitionCumulativeBasic];
  v13[1] = v3;
  void v12[2] = @"DiffProperties";
  uint64_t v4 = +[PLWifiAgent entryEventBackwardDefinitionDiffBasic];
  void v13[2] = v4;
  v12[3] = @"CumulativeUserScanDurations";
  uint64_t v5 = +[PLWifiAgent entryEventBackwardDefinitionUserScan];
  void v13[3] = v5;
  v12[4] = @"HotspotPowerStats";
  uint64_t v6 = +[PLWifiAgent entryEventBackwardDefinitionHotspotPowerStats];
  v13[4] = v6;
  v12[5] = @"AutoJoin";
  v7 = +[PLWifiAgent entryEventBackwardDefinitionAutoJoin];
  v13[5] = v7;
  v12[6] = @"Scans";
  v8 = +[PLWifiAgent entryEventBackwardDefinitionScans];
  v13[6] = v8;
  v12[7] = @"ScanForwardStats";
  v9 = +[PLWifiAgent entryEventBackwardDefinitionScanForwardStats];
  v13[7] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:8];

  return v10;
}

+ (id)entryEventBackwardDefinitionAutoJoin
{
  v76[2] = *MEMORY[0x1E4F143B8];
  v75[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v73[0] = *MEMORY[0x1E4F92CD0];
  v73[1] = v2;
  v74[0] = &unk_1F4012008;
  v74[1] = MEMORY[0x1E4F1CC28];
  v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:2];
  v76[0] = v70;
  v75[1] = *MEMORY[0x1E4F92CA8];
  v71[0] = @"AutoJoinAbortedCount";
  v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  v68 = objc_msgSend(v69, "commonTypeDict_IntegerFormat");
  v72[0] = v68;
  v71[1] = @"AutoJoinCount";
  v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat");
  v72[1] = v66;
  v71[2] = @"AutoJoinDidFindCandidateCount";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat");
  v72[2] = v64;
  v71[3] = @"AutoJoinRetryCount";
  v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat");
  v72[3] = v62;
  v71[4] = @"CombinedScanChannelCount";
  v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  v60 = objc_msgSend(v61, "commonTypeDict_IntegerFormat");
  v72[4] = v60;
  v71[5] = @"CombinedScanChannelCount2ghz";
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v72[5] = v58;
  v71[6] = @"CombinedScanChannelCount5ghz";
  v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v72[6] = v56;
  v71[7] = @"GasQueryCount";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v72[7] = v54;
  v71[8] = @"AutoHotspotCount";
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v72[8] = v52;
  v71[9] = @"Unlocked";
  v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v72[9] = v50;
  v71[10] = @"CountryCodeChanged";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v72[10] = v48;
  v71[11] = @"KnownNetworkAdded";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v72[11] = v46;
  v71[12] = @"LinkDown";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v72[12] = v44;
  v71[13] = @"AssocFailure";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v72[13] = v42;
  v71[14] = @"Retry";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v72[14] = v40;
  v71[15] = @"PowerOn";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v72[15] = v38;
  v71[16] = @"AjEnabled";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v72[16] = v36;
  v71[17] = @"Manual";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v72[17] = v34;
  v71[18] = @"DarkWake";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v72[18] = v32;
  v71[19] = @"UserWake";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v72[19] = v30;
  v71[20] = @"CallEnded";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v72[20] = v28;
  v71[21] = @"PlaybackEnded";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v72[21] = v26;
  v71[22] = @"DeviceUnlocked";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v72[22] = v24;
  v71[23] = @"Registration";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v72[23] = v22;
  v71[24] = @"AppState";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v72[24] = v20;
  v71[25] = @"MaintWake";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v72[25] = v18;
  v71[26] = @"NetServiceInactive";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v72[26] = v16;
  v71[27] = @"BssidChanged";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v72[27] = v14;
  v71[28] = @"Retry(fg)";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v72[28] = v4;
  v71[29] = @"Retry(inactive)";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v72[29] = v6;
  v71[30] = @"CombinedScanChannelCount6ghz";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v72[30] = v8;
  v71[31] = @"Followup6ghzScanChannelCount";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v72[31] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:32];
  v76[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];

  return v12;
}

+ (BOOL)isScanLoggingEnabled
{
  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004015] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0)
  {
    return 1;
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F92A38];
  return [v3 isWiFiClass:1004017];
}

+ (id)entryEventBackwardDefinitionScans
{
  v34[2] = *MEMORY[0x1E4F143B8];
  if ([a1 isScanLoggingEnabled])
  {
    v33[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v31[0] = *MEMORY[0x1E4F92CD0];
    v31[1] = v2;
    v32[0] = &unk_1F4011FB8;
    v32[1] = MEMORY[0x1E4F1CC28];
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    v34[0] = v28;
    v33[1] = *MEMORY[0x1E4F92CA8];
    v29[0] = @"Duration2G";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat_withUnit_ms");
    v30[0] = v26;
    v29[1] = @"Duration5G";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat_withUnit_ms");
    v30[1] = v24;
    void v29[2] = @"Duration6G";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat_withUnit_ms");
    void v30[2] = v22;
    v29[3] = @"Count2G";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v30[3] = v20;
    v29[4] = @"Count5G";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v30[4] = v18;
    v29[5] = @"Count6G";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v30[5] = v16;
    v29[6] = @"CountActive";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v30[6] = v14;
    v29[7] = @"CountPassive";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v30[7] = v4;
    v29[8] = @"Count2GSC";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v30[8] = v6;
    v29[9] = @"Count5GSC";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v30[9] = v8;
    v29[10] = @"Count6GSC";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v30[10] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:11];
    v34[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (BOOL)isScanForwardLoggingEnabled
{
  return [MEMORY[0x1E4F92A38] isWiFiClass:1004017];
}

+ (id)entryEventBackwardDefinitionScanForwardStats
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  if ([a1 isScanForwardLoggingEnabled])
  {
    v16[0] = *MEMORY[0x1E4F92C50];
    uint64_t v14 = *MEMORY[0x1E4F92CD0];
    v15 = &unk_1F4011FB8;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v17[0] = v2;
    v16[1] = *MEMORY[0x1E4F92CA8];
    v12[0] = @"ScanForwardCurrentBSSS";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat_withUnit_ms");
    v13[0] = v4;
    v12[1] = @"ScanForwardForwardedBSSS";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat_withUnit_ms");
    v13[1] = v6;
    void v12[2] = @"ScanForwardTotalSPMIMSGS";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat_withUnit_ms");
    void v13[2] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    v17[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v10;
}

+ (id)entryEventBackwardDefinitionHotspotPowerStats
{
  void v32[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004010] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004013] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004014] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004015] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWiFiClass:1004017])
  {
    v31[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v29[0] = *MEMORY[0x1E4F92CD0];
    v29[1] = v2;
    v30[0] = &unk_1F4011FB8;
    v30[1] = MEMORY[0x1E4F1CC28];
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    v32[0] = v26;
    v31[1] = *MEMORY[0x1E4F92CA8];
    v27[0] = @"ADHSActiveStateCount";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v28[0] = v24;
    v27[1] = @"ADHSDynamicStateCount";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v28[1] = v22;
    v27[2] = @"ADHSLowPowerStateCount";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v28[2] = v20;
    void v27[3] = @"ADHSOffStateCount";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v28[3] = v18;
    void v27[4] = @"ADHSTXPackets";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v28[4] = v16;
    v27[5] = @"ADHSRXPackets";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v28[5] = v14;
    v27[6] = @"ADHSActiveStateDuration";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat_withUnit_ms");
    v28[6] = v4;
    v27[7] = @"ADHSDynamicStateDuration";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat_withUnit_ms");
    v28[7] = v6;
    v27[8] = @"ADHSLowPowerStateDuration";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat_withUnit_ms");
    v28[8] = v8;
    v27[9] = @"ADHSOffStateDuration";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat_withUnit_ms");
    v28[9] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:10];
    v32[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (BOOL)isBeaconLoggingEnabled
{
  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004010] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004013] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004014] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004011] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004012] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004015] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0)
  {
    return 1;
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F92A38];
  return [v3 isWiFiClass:1004017];
}

+ (id)entryEventBackwardDefinitionBeaconProfile
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isMac] & 1) != 0
    || ![a1 isBeaconLoggingEnabled])
  {
    v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v22[0] = *MEMORY[0x1E4F92C50];
    uint64_t v3 = *MEMORY[0x1E4F92CB8];
    v20[0] = *MEMORY[0x1E4F92CD0];
    v20[1] = v3;
    v21[0] = &unk_1F4011FB8;
    v21[1] = MEMORY[0x1E4F1CC28];
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    v23[0] = v17;
    v22[1] = *MEMORY[0x1E4F92CA8];
    v18[0] = @"ScheduleBeacon";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v19[0] = v15;
    v18[1] = @"MissedBeacon";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v19[1] = v5;
    void v18[2] = @"ReceivedBeacon";
    uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v19[2] = v7;
    v18[3] = @"TrimmedBeacon";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v19[3] = v9;
    v18[4] = @"WifiTimestamp";
    uint64_t v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v19[4] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
    v23[1] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionUserScan
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F4011FB8;
  v20[1] = MEMORY[0x1E4F1CC28];
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"AutojoinScanDuration";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat_withUnit_ms");
  v18[0] = v14;
  v17[1] = @"LocationScanDuration";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat_withUnit_ms");
  v18[1] = v4;
  void v17[2] = @"PipelineScanDuration";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat_withUnit_ms");
  void v18[2] = v6;
  void v17[3] = @"SetupScanDuration";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat_withUnit_ms");
  v18[3] = v8;
  v17[4] = @"UnknownScanDuration";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat_withUnit_ms");
  v18[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionCumulativeMultiCore
{
  v201[57] = *MEMORY[0x1E4F143B8];
  id v188 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v200[0] = @"WifiTimestamp";
  v186 = [MEMORY[0x1E4F929D8] sharedInstance];
  v184 = objc_msgSend(v186, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[0] = v184;
  v200[1] = @"PMDuration";
  v182 = [MEMORY[0x1E4F929D8] sharedInstance];
  v180 = objc_msgSend(v182, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[1] = v180;
  v200[2] = @"MPCDuration";
  v178 = [MEMORY[0x1E4F929D8] sharedInstance];
  v176 = objc_msgSend(v178, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[2] = v176;
  v200[3] = @"TXDuration";
  v174 = [MEMORY[0x1E4F929D8] sharedInstance];
  v172 = objc_msgSend(v174, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[3] = v172;
  v200[4] = @"RXDuration";
  v170 = [MEMORY[0x1E4F929D8] sharedInstance];
  v168 = objc_msgSend(v170, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[4] = v168;
  v200[5] = @"HSICSuspendDuration";
  v166 = [MEMORY[0x1E4F929D8] sharedInstance];
  v164 = objc_msgSend(v166, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[5] = v164;
  v200[6] = @"HSICActiveDuration";
  v162 = [MEMORY[0x1E4F929D8] sharedInstance];
  v160 = objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[6] = v160;
  v200[7] = @"PNOScanSSIDDuration";
  v158 = [MEMORY[0x1E4F929D8] sharedInstance];
  v156 = objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[7] = v156;
  v200[8] = @"PNOBSSIDDuration";
  v154 = [MEMORY[0x1E4F929D8] sharedInstance];
  v152 = objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[8] = v152;
  v200[9] = @"RoamScanDuration";
  v150 = [MEMORY[0x1E4F929D8] sharedInstance];
  v148 = objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[9] = v148;
  v200[10] = @"AssociatedScanDuration";
  v146 = [MEMORY[0x1E4F929D8] sharedInstance];
  v144 = objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[10] = v144;
  v200[11] = @"OtherScanDuration";
  v142 = [MEMORY[0x1E4F929D8] sharedInstance];
  v140 = objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[11] = v140;
  v200[12] = @"UserScanDuration";
  v138 = [MEMORY[0x1E4F929D8] sharedInstance];
  v136 = objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[12] = v136;
  v200[13] = @"FRTSDuration";
  v134 = [MEMORY[0x1E4F929D8] sharedInstance];
  v132 = objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[13] = v132;
  v200[14] = @"PCIESuspendDuration";
  v130 = [MEMORY[0x1E4F929D8] sharedInstance];
  v128 = objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
  v201[14] = v128;
  v200[15] = @"PCIEActiveDuration";
  v126 = [MEMORY[0x1E4F929D8] sharedInstance];
  v124 = objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
  v201[15] = v124;
  v200[16] = @"PCIEPERSTDuration";
  v122 = [MEMORY[0x1E4F929D8] sharedInstance];
  v120 = objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
  v201[16] = v120;
  v200[17] = @"PCIEL0Count";
  v118 = [MEMORY[0x1E4F929D8] sharedInstance];
  v116 = objc_msgSend(v118, "commonTypeDict_IntegerFormat");
  v201[17] = v116;
  v200[18] = @"PCIEL0Duration";
  v114 = [MEMORY[0x1E4F929D8] sharedInstance];
  v112 = objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
  v201[18] = v112;
  v200[19] = @"PCIEL2Count";
  v110 = [MEMORY[0x1E4F929D8] sharedInstance];
  v108 = objc_msgSend(v110, "commonTypeDict_IntegerFormat");
  v201[19] = v108;
  v200[20] = @"PCIEL2Duration";
  v106 = [MEMORY[0x1E4F929D8] sharedInstance];
  v104 = objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_us");
  v201[20] = v104;
  v200[21] = @"PCIEL1Count";
  v102 = [MEMORY[0x1E4F929D8] sharedInstance];
  v100 = objc_msgSend(v102, "commonTypeDict_IntegerFormat");
  v201[21] = v100;
  v200[22] = @"PCIEL1Duration";
  v98 = [MEMORY[0x1E4F929D8] sharedInstance];
  v96 = objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_us");
  v201[22] = v96;
  v200[23] = @"PCIEL11Count";
  v94 = [MEMORY[0x1E4F929D8] sharedInstance];
  v92 = objc_msgSend(v94, "commonTypeDict_IntegerFormat");
  v201[23] = v92;
  v200[24] = @"PCIEL11Duration";
  v90 = [MEMORY[0x1E4F929D8] sharedInstance];
  v88 = objc_msgSend(v90, "commonTypeDict_IntegerFormat_withUnit_us");
  v201[24] = v88;
  v200[25] = @"PCIEL12Count";
  v86 = [MEMORY[0x1E4F929D8] sharedInstance];
  v84 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
  v201[25] = v84;
  v200[26] = @"PCIEL12Duration";
  v82 = [MEMORY[0x1E4F929D8] sharedInstance];
  v80 = objc_msgSend(v82, "commonTypeDict_IntegerFormat_withUnit_us");
  v201[26] = v80;
  v200[27] = @"AWDLTXDuration";
  v78 = [MEMORY[0x1E4F929D8] sharedInstance];
  v76 = objc_msgSend(v78, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[27] = v76;
  v200[28] = @"AWDLRXDuration";
  v74 = [MEMORY[0x1E4F929D8] sharedInstance];
  v72 = objc_msgSend(v74, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[28] = v72;
  v200[29] = @"AWDLAWDuration";
  v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  v70 = objc_msgSend(v71, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[29] = v70;
  v200[30] = @"AWDLScanDuration";
  v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  v68 = objc_msgSend(v69, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[30] = v68;
  v200[31] = @"AutojoinScanDuration";
  v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[31] = v66;
  v200[32] = @"LocationScanDuration";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[32] = v64;
  v200[33] = @"PipelineScanDuration";
  v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[33] = v62;
  v200[34] = @"SetupScanDuration";
  v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  v60 = objc_msgSend(v61, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[34] = v60;
  v200[35] = @"UnknownScanDuration";
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[35] = v58;
  v200[36] = @"CurrentChannel";
  v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v201[36] = v56;
  v200[37] = @"CurrentSSID";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  v54 = objc_msgSend(v55, "commonTypeDict_StringFormat");
  v201[37] = v54;
  v200[38] = @"CurrentBandwidth";
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v201[38] = v52;
  v200[39] = @"WifiPowered";
  v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  v50 = objc_msgSend(v51, "commonTypeDict_BoolFormat");
  v201[39] = v50;
  v200[40] = @"WowEnabled";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_BoolFormat");
  v201[40] = v48;
  v200[41] = @"Carplay";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_BoolFormat");
  v201[41] = v46;
  v200[42] = @"SISOTXDuration";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[42] = v44;
  v200[43] = @"MIMOTXDuration";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[43] = v42;
  v200[44] = @"MIMORXDuration";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[44] = v40;
  v200[45] = @"SISORXDuration";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[45] = v38;
  v200[46] = @"MIMOCSDuration";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[46] = v36;
  v200[47] = @"SISOCSDuration";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[47] = v34;
  v200[48] = @"OCLRXDuration";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[48] = v32;
  v200[49] = @"OCLCSDuration";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[49] = v30;
  v200[50] = @"READINGTYPE";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v201[50] = v28;
  v200[51] = @"isADHSConnected";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v201[51] = v26;
  v200[52] = @"AutoHotspotBTScanDuration";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat_withUnit_s");
  v201[52] = v24;
  v200[53] = @"AutoHotspotBTScanCount";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v201[53] = v3;
  v200[54] = @"OPSFullDuration";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[54] = v5;
  v200[55] = @"OPSPartialDuration";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[55] = v7;
  v200[56] = @"PSBWDuration";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat_withUnit_ms");
  v201[56] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v201 forKeys:v200 count:57];
  v189 = (void *)[v188 initWithDictionary:v10];

  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004015] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWiFiClass:1004017])
  {
    v198[0] = @"SCAssocScanCount";
    v187 = [MEMORY[0x1E4F929D8] sharedInstance];
    v185 = objc_msgSend(v187, "commonTypeDict_IntegerFormat");
    v199[0] = v185;
    v198[1] = @"SCAssocScanDuration";
    v183 = [MEMORY[0x1E4F929D8] sharedInstance];
    v181 = objc_msgSend(v183, "commonTypeDict_IntegerFormat");
    v199[1] = v181;
    v198[2] = @"SCBlankedScanCount";
    v179 = [MEMORY[0x1E4F929D8] sharedInstance];
    v177 = objc_msgSend(v179, "commonTypeDict_IntegerFormat");
    v199[2] = v177;
    v198[3] = @"SCIdleDurationSISO";
    v175 = [MEMORY[0x1E4F929D8] sharedInstance];
    v173 = objc_msgSend(v175, "commonTypeDict_IntegerFormat");
    v199[3] = v173;
    v198[4] = @"SCPMDuration";
    v171 = [MEMORY[0x1E4F929D8] sharedInstance];
    v169 = objc_msgSend(v171, "commonTypeDict_IntegerFormat");
    v199[4] = v169;
    v198[5] = @"SCPNOScanCount";
    v167 = [MEMORY[0x1E4F929D8] sharedInstance];
    v165 = objc_msgSend(v167, "commonTypeDict_IntegerFormat");
    v199[5] = v165;
    v198[6] = @"SCPNOScanDuration";
    v163 = [MEMORY[0x1E4F929D8] sharedInstance];
    v161 = objc_msgSend(v163, "commonTypeDict_IntegerFormat");
    v199[6] = v161;
    v198[7] = @"SCRoamScanCount";
    v159 = [MEMORY[0x1E4F929D8] sharedInstance];
    v157 = objc_msgSend(v159, "commonTypeDict_IntegerFormat");
    v199[7] = v157;
    v198[8] = @"SCRoamScanDuration";
    v155 = [MEMORY[0x1E4F929D8] sharedInstance];
    v153 = objc_msgSend(v155, "commonTypeDict_IntegerFormat");
    v199[8] = v153;
    v198[9] = @"SCRXDurationSISO";
    v151 = [MEMORY[0x1E4F929D8] sharedInstance];
    v149 = objc_msgSend(v151, "commonTypeDict_IntegerFormat");
    v199[9] = v149;
    v198[10] = @"SCRXMPCDuration";
    v147 = [MEMORY[0x1E4F929D8] sharedInstance];
    v145 = objc_msgSend(v147, "commonTypeDict_IntegerFormat");
    v199[10] = v145;
    v198[11] = @"SCTimestamp";
    v143 = [MEMORY[0x1E4F929D8] sharedInstance];
    v141 = objc_msgSend(v143, "commonTypeDict_IntegerFormat");
    v199[11] = v141;
    v198[12] = @"SCUserScanCount";
    v139 = [MEMORY[0x1E4F929D8] sharedInstance];
    v137 = objc_msgSend(v139, "commonTypeDict_IntegerFormat");
    v199[12] = v137;
    v198[13] = @"SCUserScanDuration";
    v135 = [MEMORY[0x1E4F929D8] sharedInstance];
    v133 = objc_msgSend(v135, "commonTypeDict_IntegerFormat");
    v199[13] = v133;
    v198[14] = @"InactivityDuration";
    v131 = [MEMORY[0x1E4F929D8] sharedInstance];
    v129 = objc_msgSend(v131, "commonTypeDict_IntegerFormat");
    v199[14] = v129;
    v198[15] = @"InactivityLPBeaconsMissed";
    v127 = [MEMORY[0x1E4F929D8] sharedInstance];
    v125 = objc_msgSend(v127, "commonTypeDict_IntegerFormat");
    v199[15] = v125;
    v198[16] = @"InactivityLPBeaconsReceived";
    v123 = [MEMORY[0x1E4F929D8] sharedInstance];
    v121 = objc_msgSend(v123, "commonTypeDict_IntegerFormat");
    v199[16] = v121;
    v198[17] = @"InactivityLPBeaconsScheduled";
    v119 = [MEMORY[0x1E4F929D8] sharedInstance];
    v117 = objc_msgSend(v119, "commonTypeDict_IntegerFormat");
    v199[17] = v117;
    v198[18] = @"InactivityLPEarlyBeaconsTerminated";
    v115 = [MEMORY[0x1E4F929D8] sharedInstance];
    v113 = objc_msgSend(v115, "commonTypeDict_IntegerFormat");
    v199[18] = v113;
    v198[19] = @"InactivityLPWakeDuration";
    v111 = [MEMORY[0x1E4F929D8] sharedInstance];
    v109 = objc_msgSend(v111, "commonTypeDict_IntegerFormat");
    v199[19] = v109;
    v198[20] = @"InactivityMPCBeaconsMissed";
    v107 = [MEMORY[0x1E4F929D8] sharedInstance];
    v105 = objc_msgSend(v107, "commonTypeDict_IntegerFormat");
    v199[20] = v105;
    v198[21] = @"InactivityMPCBeaconsReceived";
    v103 = [MEMORY[0x1E4F929D8] sharedInstance];
    v101 = objc_msgSend(v103, "commonTypeDict_IntegerFormat");
    v199[21] = v101;
    v198[22] = @"InactivityMPCBeaconsScheduled";
    v99 = [MEMORY[0x1E4F929D8] sharedInstance];
    v97 = objc_msgSend(v99, "commonTypeDict_IntegerFormat");
    v199[22] = v97;
    v198[23] = @"InactivityMPEarlyBeaconsTerminated";
    v95 = [MEMORY[0x1E4F929D8] sharedInstance];
    v93 = objc_msgSend(v95, "commonTypeDict_IntegerFormat");
    v199[23] = v93;
    v198[24] = @"InactivityMPWakeDuration";
    v91 = [MEMORY[0x1E4F929D8] sharedInstance];
    v89 = objc_msgSend(v91, "commonTypeDict_IntegerFormat");
    v199[24] = v89;
    v198[25] = @"MulticastRXDuration";
    v87 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v87, "commonTypeDict_IntegerFormat_withUnit_ms");
    v199[25] = v85;
    v198[26] = @"BroadcastRXDuration";
    v83 = [MEMORY[0x1E4F929D8] sharedInstance];
    v81 = objc_msgSend(v83, "commonTypeDict_IntegerFormat_withUnit_ms");
    v199[26] = v81;
    v198[27] = @"IBSSRXDuration";
    v79 = [MEMORY[0x1E4F929D8] sharedInstance];
    v77 = objc_msgSend(v79, "commonTypeDict_IntegerFormat_withUnit_ms");
    v199[27] = v77;
    v198[28] = @"MBSSRXDuration";
    v75 = [MEMORY[0x1E4F929D8] sharedInstance];
    v73 = objc_msgSend(v75, "commonTypeDict_IntegerFormat_withUnit_ms");
    v199[28] = v73;
    v198[29] = @"OBSSRXDuration";
    v11 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v12 = objc_msgSend(v11, "commonTypeDict_IntegerFormat_withUnit_ms");
    v199[29] = v12;
    v198[30] = @"MulticastRxBytes";
    v13 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
    v199[30] = v14;
    v198[31] = @"MulticastRxPkts";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v199[31] = v16;
    v198[32] = @"MulticastRxTotal";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v199[32] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v199 forKeys:v198 count:33];

    uint64_t v20 = v189;
    [v189 addEntriesFromDictionary:v19];
    v196[0] = *MEMORY[0x1E4F92C50];
    uint64_t v194 = *MEMORY[0x1E4F92CD0];
    v195 = &unk_1F4012018;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v195 forKeys:&v194 count:1];
    v196[1] = *MEMORY[0x1E4F92CA8];
    v197[0] = v21;
    v197[1] = v189;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v197 forKeys:v196 count:2];

LABEL_5:
    goto LABEL_6;
  }
  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004013] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWiFiClass:1004014])
  {
    v192[0] = *MEMORY[0x1E4F92C50];
    uint64_t v190 = *MEMORY[0x1E4F92CD0];
    v191 = &unk_1F4011FC8;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
    v192[1] = *MEMORY[0x1E4F92CA8];
    v193[0] = v19;
    uint64_t v20 = v189;
    v193[1] = v189;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v193 forKeys:v192 count:2];
    goto LABEL_5;
  }
  v22 = (void *)MEMORY[0x1E4F1CC08];
  uint64_t v20 = v189;
LABEL_6:

  return v22;
}

+ (id)entryEventBackwardDefinitionCumulativeBasicMac
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitionCumulativeBasic
{
  v199[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004013] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004014] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004015] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWiFiClass:1004017])
  {
    uint64_t v3 = [a1 entryEventBackwardDefinitionCumulativeMultiCore];
    goto LABEL_7;
  }
  if ([MEMORY[0x1E4F92A38] isWiFiClass:1004010])
  {
    v198[0] = *MEMORY[0x1E4F92C50];
    uint64_t v196 = *MEMORY[0x1E4F92CD0];
    v197 = &unk_1F4011FC8;
    v163 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v197 forKeys:&v196 count:1];
    v199[0] = v163;
    v198[1] = *MEMORY[0x1E4F92CA8];
    v194[0] = @"WifiTimestamp";
    v162 = [MEMORY[0x1E4F929D8] sharedInstance];
    v161 = objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
    v195[0] = v161;
    v194[1] = @"PMDuration";
    v160 = [MEMORY[0x1E4F929D8] sharedInstance];
    v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
    v195[1] = v159;
    v194[2] = @"MPCDuration";
    v158 = [MEMORY[0x1E4F929D8] sharedInstance];
    v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
    v195[2] = v157;
    v194[3] = @"TXDuration";
    v156 = [MEMORY[0x1E4F929D8] sharedInstance];
    v155 = objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[3] = v155;
    v194[4] = @"RXDuration";
    v154 = [MEMORY[0x1E4F929D8] sharedInstance];
    v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[4] = v153;
    v194[5] = @"HSICSuspendDuration";
    v152 = [MEMORY[0x1E4F929D8] sharedInstance];
    v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
    v195[5] = v151;
    v194[6] = @"HSICActiveDuration";
    v150 = [MEMORY[0x1E4F929D8] sharedInstance];
    v149 = objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
    v195[6] = v149;
    v194[7] = @"PNOScanSSIDDuration";
    v148 = [MEMORY[0x1E4F929D8] sharedInstance];
    v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
    v195[7] = v147;
    v194[8] = @"PNOBSSIDDuration";
    v146 = [MEMORY[0x1E4F929D8] sharedInstance];
    v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
    v195[8] = v145;
    v194[9] = @"RoamScanDuration";
    v144 = [MEMORY[0x1E4F929D8] sharedInstance];
    v143 = objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
    v195[9] = v143;
    v194[10] = @"AssociatedScanDuration";
    v142 = [MEMORY[0x1E4F929D8] sharedInstance];
    v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
    v195[10] = v141;
    v194[11] = @"OtherScanDuration";
    v140 = [MEMORY[0x1E4F929D8] sharedInstance];
    v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_s");
    v195[11] = v139;
    v194[12] = @"UserScanDuration";
    v138 = [MEMORY[0x1E4F929D8] sharedInstance];
    v137 = objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
    v195[12] = v137;
    v194[13] = @"FRTSDuration";
    v136 = [MEMORY[0x1E4F929D8] sharedInstance];
    v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[13] = v135;
    v194[14] = @"PCIESuspendDuration";
    v134 = [MEMORY[0x1E4F929D8] sharedInstance];
    v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_us");
    v195[14] = v133;
    v194[15] = @"PCIEActiveDuration";
    v132 = [MEMORY[0x1E4F929D8] sharedInstance];
    v131 = objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_us");
    v195[15] = v131;
    v194[16] = @"PCIEPERSTDuration";
    v130 = [MEMORY[0x1E4F929D8] sharedInstance];
    v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
    v195[16] = v129;
    v194[17] = @"PCIEL0Count";
    v128 = [MEMORY[0x1E4F929D8] sharedInstance];
    v127 = objc_msgSend(v128, "commonTypeDict_IntegerFormat");
    v195[17] = v127;
    v194[18] = @"PCIEL0Duration";
    v126 = [MEMORY[0x1E4F929D8] sharedInstance];
    v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
    v195[18] = v125;
    v194[19] = @"PCIEL2Count";
    v124 = [MEMORY[0x1E4F929D8] sharedInstance];
    v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat");
    v195[19] = v123;
    v194[20] = @"PCIEL2Duration";
    v122 = [MEMORY[0x1E4F929D8] sharedInstance];
    v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
    v195[20] = v121;
    v194[21] = @"PCIEL1Count";
    v120 = [MEMORY[0x1E4F929D8] sharedInstance];
    v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat");
    v195[21] = v119;
    v194[22] = @"PCIEL1Duration";
    v118 = [MEMORY[0x1E4F929D8] sharedInstance];
    v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_us");
    v195[22] = v117;
    v194[23] = @"PCIEL11Count";
    v116 = [MEMORY[0x1E4F929D8] sharedInstance];
    v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
    v195[23] = v115;
    v194[24] = @"PCIEL11Duration";
    v114 = [MEMORY[0x1E4F929D8] sharedInstance];
    v113 = objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
    v195[24] = v113;
    v194[25] = @"PCIEL12Count";
    v112 = [MEMORY[0x1E4F929D8] sharedInstance];
    v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v195[25] = v111;
    v194[26] = @"PCIEL12Duration";
    v110 = [MEMORY[0x1E4F929D8] sharedInstance];
    v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat_withUnit_us");
    v195[26] = v109;
    v194[27] = @"AWDLTXDuration";
    v108 = [MEMORY[0x1E4F929D8] sharedInstance];
    v107 = objc_msgSend(v108, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[27] = v107;
    v194[28] = @"AWDLRXDuration";
    v106 = [MEMORY[0x1E4F929D8] sharedInstance];
    v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[28] = v105;
    v194[29] = @"AWDLAWDuration";
    v104 = [MEMORY[0x1E4F929D8] sharedInstance];
    v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat_withUnit_s");
    v195[29] = v103;
    v194[30] = @"AWDLScanDuration";
    v102 = [MEMORY[0x1E4F929D8] sharedInstance];
    v101 = objc_msgSend(v102, "commonTypeDict_IntegerFormat_withUnit_s");
    v195[30] = v101;
    v194[31] = @"AutojoinScanDuration";
    v100 = [MEMORY[0x1E4F929D8] sharedInstance];
    v99 = objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[31] = v99;
    v194[32] = @"LocationScanDuration";
    v98 = [MEMORY[0x1E4F929D8] sharedInstance];
    v97 = objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[32] = v97;
    v194[33] = @"PipelineScanDuration";
    v96 = [MEMORY[0x1E4F929D8] sharedInstance];
    v95 = objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[33] = v95;
    v194[34] = @"SetupScanDuration";
    v94 = [MEMORY[0x1E4F929D8] sharedInstance];
    v93 = objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[34] = v93;
    v194[35] = @"UnknownScanDuration";
    v92 = [MEMORY[0x1E4F929D8] sharedInstance];
    v91 = objc_msgSend(v92, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[35] = v91;
    v194[36] = @"CurrentChannel";
    v90 = [MEMORY[0x1E4F929D8] sharedInstance];
    v89 = objc_msgSend(v90, "commonTypeDict_IntegerFormat");
    v195[36] = v89;
    v194[37] = @"CurrentSSID";
    v88 = [MEMORY[0x1E4F929D8] sharedInstance];
    v87 = objc_msgSend(v88, "commonTypeDict_StringFormat");
    v195[37] = v87;
    v194[38] = @"CurrentBandwidth";
    v86 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
    v195[38] = v85;
    v194[39] = @"WifiPowered";
    v84 = [MEMORY[0x1E4F929D8] sharedInstance];
    v83 = objc_msgSend(v84, "commonTypeDict_BoolFormat");
    v195[39] = v83;
    v194[40] = @"WowEnabled";
    v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    v81 = objc_msgSend(v82, "commonTypeDict_BoolFormat");
    v195[40] = v81;
    v194[41] = @"Carplay";
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    v79 = objc_msgSend(v80, "commonTypeDict_BoolFormat");
    v195[41] = v79;
    v194[42] = @"SISOTXDuration";
    v78 = [MEMORY[0x1E4F929D8] sharedInstance];
    v77 = objc_msgSend(v78, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[42] = v77;
    v194[43] = @"MIMOTXDuration";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[43] = v75;
    v194[44] = @"MIMORXDuration";
    v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[44] = v73;
    v194[45] = @"SISORXDuration";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[45] = v71;
    v194[46] = @"MIMOCSDuration";
    v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[46] = v69;
    v194[47] = @"SISOCSDuration";
    v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[47] = v67;
    v194[48] = @"OCLRXDuration";
    v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    v65 = objc_msgSend(v66, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[48] = v65;
    v194[49] = @"OCLCSDuration";
    v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[49] = v63;
    v194[50] = @"READINGTYPE";
    v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
    v195[50] = v61;
    v194[51] = @"isADHSConnected";
    v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v195[51] = v59;
    v194[52] = @"AutoHotspotBTScanDuration";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[52] = v6;
    v194[53] = @"AutoHotspotBTScanCount";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v195[53] = v8;
    v194[54] = @"OPSFullDuration";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[54] = v10;
    v194[55] = @"OPSPartialDuration";
    v11 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v12 = objc_msgSend(v11, "commonTypeDict_IntegerFormat_withUnit_ms");
    v195[55] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v195 forKeys:v194 count:56];
    v199[1] = v13;
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v199 forKeys:v198 count:2];
  }
  else
  {
    if ([MEMORY[0x1E4F92A38] isWiFiClass:1004007])
    {
      v192[0] = *MEMORY[0x1E4F92C50];
      uint64_t v190 = *MEMORY[0x1E4F92CD0];
      v191 = &unk_1F4011FC8;
      v163 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
      v193[0] = v163;
      v192[1] = *MEMORY[0x1E4F92CA8];
      v188[0] = @"WifiTimestamp";
      v162 = [MEMORY[0x1E4F929D8] sharedInstance];
      v161 = objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
      v189[0] = v161;
      v188[1] = @"PMDuration";
      v160 = [MEMORY[0x1E4F929D8] sharedInstance];
      v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
      v189[1] = v159;
      v188[2] = @"MPCDuration";
      v158 = [MEMORY[0x1E4F929D8] sharedInstance];
      v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
      v189[2] = v157;
      v188[3] = @"TXDuration";
      v156 = [MEMORY[0x1E4F929D8] sharedInstance];
      v155 = objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[3] = v155;
      v188[4] = @"RXDuration";
      v154 = [MEMORY[0x1E4F929D8] sharedInstance];
      v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[4] = v153;
      v188[5] = @"HSICSuspendDuration";
      v152 = [MEMORY[0x1E4F929D8] sharedInstance];
      v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
      v189[5] = v151;
      v188[6] = @"HSICActiveDuration";
      v150 = [MEMORY[0x1E4F929D8] sharedInstance];
      v149 = objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
      v189[6] = v149;
      v188[7] = @"PNOScanSSIDDuration";
      v148 = [MEMORY[0x1E4F929D8] sharedInstance];
      v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
      v189[7] = v147;
      v188[8] = @"PNOBSSIDDuration";
      v146 = [MEMORY[0x1E4F929D8] sharedInstance];
      v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
      v189[8] = v145;
      v188[9] = @"RoamScanDuration";
      v144 = [MEMORY[0x1E4F929D8] sharedInstance];
      v143 = objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
      v189[9] = v143;
      v188[10] = @"AssociatedScanDuration";
      v142 = [MEMORY[0x1E4F929D8] sharedInstance];
      v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
      v189[10] = v141;
      v188[11] = @"OtherScanDuration";
      v140 = [MEMORY[0x1E4F929D8] sharedInstance];
      v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_s");
      v189[11] = v139;
      v188[12] = @"UserScanDuration";
      v138 = [MEMORY[0x1E4F929D8] sharedInstance];
      v137 = objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
      v189[12] = v137;
      v188[13] = @"FRTSDuration";
      v136 = [MEMORY[0x1E4F929D8] sharedInstance];
      v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[13] = v135;
      v188[14] = @"PCIESuspendDuration";
      v134 = [MEMORY[0x1E4F929D8] sharedInstance];
      v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_us");
      v189[14] = v133;
      v188[15] = @"PCIEActiveDuration";
      v132 = [MEMORY[0x1E4F929D8] sharedInstance];
      v131 = objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_us");
      v189[15] = v131;
      v188[16] = @"PCIEPERSTDuration";
      v130 = [MEMORY[0x1E4F929D8] sharedInstance];
      v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
      v189[16] = v129;
      v188[17] = @"PCIEL0Count";
      v128 = [MEMORY[0x1E4F929D8] sharedInstance];
      v127 = objc_msgSend(v128, "commonTypeDict_IntegerFormat");
      v189[17] = v127;
      v188[18] = @"PCIEL0Duration";
      v126 = [MEMORY[0x1E4F929D8] sharedInstance];
      v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
      v189[18] = v125;
      v188[19] = @"PCIEL2Count";
      v124 = [MEMORY[0x1E4F929D8] sharedInstance];
      v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat");
      v189[19] = v123;
      v188[20] = @"PCIEL2Duration";
      v122 = [MEMORY[0x1E4F929D8] sharedInstance];
      v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
      v189[20] = v121;
      v188[21] = @"PCIEL1Count";
      v120 = [MEMORY[0x1E4F929D8] sharedInstance];
      v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat");
      v189[21] = v119;
      v188[22] = @"PCIEL1Duration";
      v118 = [MEMORY[0x1E4F929D8] sharedInstance];
      v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_us");
      v189[22] = v117;
      v188[23] = @"PCIEL11Count";
      v116 = [MEMORY[0x1E4F929D8] sharedInstance];
      v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
      v189[23] = v115;
      v188[24] = @"PCIEL11Duration";
      v114 = [MEMORY[0x1E4F929D8] sharedInstance];
      v113 = objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
      v189[24] = v113;
      v188[25] = @"PCIEL12Count";
      v112 = [MEMORY[0x1E4F929D8] sharedInstance];
      v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
      v189[25] = v111;
      v188[26] = @"PCIEL12Duration";
      v110 = [MEMORY[0x1E4F929D8] sharedInstance];
      v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat_withUnit_us");
      v189[26] = v109;
      v188[27] = @"AWDLTXDuration";
      v108 = [MEMORY[0x1E4F929D8] sharedInstance];
      v107 = objc_msgSend(v108, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[27] = v107;
      v188[28] = @"AWDLRXDuration";
      v106 = [MEMORY[0x1E4F929D8] sharedInstance];
      v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[28] = v105;
      v188[29] = @"AWDLAWDuration";
      v104 = [MEMORY[0x1E4F929D8] sharedInstance];
      v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat_withUnit_s");
      v189[29] = v103;
      v188[30] = @"AWDLScanDuration";
      v102 = [MEMORY[0x1E4F929D8] sharedInstance];
      v101 = objc_msgSend(v102, "commonTypeDict_IntegerFormat_withUnit_s");
      v189[30] = v101;
      v188[31] = @"AutojoinScanDuration";
      v100 = [MEMORY[0x1E4F929D8] sharedInstance];
      v99 = objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[31] = v99;
      v188[32] = @"LocationScanDuration";
      v98 = [MEMORY[0x1E4F929D8] sharedInstance];
      v97 = objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[32] = v97;
      v188[33] = @"PipelineScanDuration";
      v96 = [MEMORY[0x1E4F929D8] sharedInstance];
      v95 = objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[33] = v95;
      v188[34] = @"SetupScanDuration";
      v94 = [MEMORY[0x1E4F929D8] sharedInstance];
      v93 = objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[34] = v93;
      v188[35] = @"UnknownScanDuration";
      v92 = [MEMORY[0x1E4F929D8] sharedInstance];
      v91 = objc_msgSend(v92, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[35] = v91;
      v188[36] = @"CurrentChannel";
      v90 = [MEMORY[0x1E4F929D8] sharedInstance];
      v89 = objc_msgSend(v90, "commonTypeDict_IntegerFormat");
      v189[36] = v89;
      v188[37] = @"CurrentSSID";
      v88 = [MEMORY[0x1E4F929D8] sharedInstance];
      v87 = objc_msgSend(v88, "commonTypeDict_StringFormat");
      v189[37] = v87;
      v188[38] = @"CurrentBandwidth";
      v86 = [MEMORY[0x1E4F929D8] sharedInstance];
      v85 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
      v189[38] = v85;
      v188[39] = @"WifiPowered";
      v84 = [MEMORY[0x1E4F929D8] sharedInstance];
      v83 = objc_msgSend(v84, "commonTypeDict_BoolFormat");
      v189[39] = v83;
      v188[40] = @"WowEnabled";
      v82 = [MEMORY[0x1E4F929D8] sharedInstance];
      v81 = objc_msgSend(v82, "commonTypeDict_BoolFormat");
      v189[40] = v81;
      v188[41] = @"Carplay";
      v80 = [MEMORY[0x1E4F929D8] sharedInstance];
      v79 = objc_msgSend(v80, "commonTypeDict_BoolFormat");
      v189[41] = v79;
      v188[42] = @"SISOTXDuration";
      v78 = [MEMORY[0x1E4F929D8] sharedInstance];
      v77 = objc_msgSend(v78, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[42] = v77;
      v188[43] = @"MIMOTXDuration";
      v76 = [MEMORY[0x1E4F929D8] sharedInstance];
      v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[43] = v75;
      v188[44] = @"MIMORXDuration";
      v74 = [MEMORY[0x1E4F929D8] sharedInstance];
      v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[44] = v73;
      v188[45] = @"SISORXDuration";
      v72 = [MEMORY[0x1E4F929D8] sharedInstance];
      v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[45] = v71;
      v188[46] = @"MIMOCSDuration";
      v70 = [MEMORY[0x1E4F929D8] sharedInstance];
      v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[46] = v69;
      v188[47] = @"SISOCSDuration";
      uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
      v15 = objc_msgSend(v14, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[47] = v15;
      v188[48] = @"OCLRXDuration";
      uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
      v17 = objc_msgSend(v16, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[48] = v17;
      v188[49] = @"OCLCSDuration";
      uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
      uint64_t v19 = objc_msgSend(v18, "commonTypeDict_IntegerFormat_withUnit_ms");
      v189[49] = v19;
      v188[50] = @"READINGTYPE";
      uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
      v21 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
      v189[50] = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v189 forKeys:v188 count:51];
      v193[1] = v22;
      uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v193 forKeys:v192 count:2];

      goto LABEL_15;
    }
    if ([MEMORY[0x1E4F92A38] isWiFiClass:1004005])
    {
      v186[0] = *MEMORY[0x1E4F92C50];
      uint64_t v184 = *MEMORY[0x1E4F92CD0];
      v185 = &unk_1F4012028;
      v163 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v185 forKeys:&v184 count:1];
      v187[0] = v163;
      v186[1] = *MEMORY[0x1E4F92CA8];
      v182[0] = @"WifiTimestamp";
      v162 = [MEMORY[0x1E4F929D8] sharedInstance];
      v161 = objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
      v183[0] = v161;
      v182[1] = @"PMDuration";
      v160 = [MEMORY[0x1E4F929D8] sharedInstance];
      v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
      v183[1] = v159;
      v182[2] = @"MPCDuration";
      v158 = [MEMORY[0x1E4F929D8] sharedInstance];
      v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
      v183[2] = v157;
      v182[3] = @"TXDuration";
      v156 = [MEMORY[0x1E4F929D8] sharedInstance];
      v155 = objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[3] = v155;
      v182[4] = @"RXDuration";
      v154 = [MEMORY[0x1E4F929D8] sharedInstance];
      v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[4] = v153;
      v182[5] = @"HSICSuspendDuration";
      v152 = [MEMORY[0x1E4F929D8] sharedInstance];
      v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
      v183[5] = v151;
      v182[6] = @"HSICActiveDuration";
      v150 = [MEMORY[0x1E4F929D8] sharedInstance];
      v149 = objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
      v183[6] = v149;
      v182[7] = @"PNOScanSSIDDuration";
      v148 = [MEMORY[0x1E4F929D8] sharedInstance];
      v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
      v183[7] = v147;
      v182[8] = @"PNOBSSIDDuration";
      v146 = [MEMORY[0x1E4F929D8] sharedInstance];
      v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
      v183[8] = v145;
      v182[9] = @"RoamScanDuration";
      v144 = [MEMORY[0x1E4F929D8] sharedInstance];
      v143 = objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
      v183[9] = v143;
      v182[10] = @"AssociatedScanDuration";
      v142 = [MEMORY[0x1E4F929D8] sharedInstance];
      v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
      v183[10] = v141;
      v182[11] = @"OtherScanDuration";
      v140 = [MEMORY[0x1E4F929D8] sharedInstance];
      v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_s");
      v183[11] = v139;
      v182[12] = @"UserScanDuration";
      v138 = [MEMORY[0x1E4F929D8] sharedInstance];
      v137 = objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
      v183[12] = v137;
      v182[13] = @"FRTSDuration";
      v136 = [MEMORY[0x1E4F929D8] sharedInstance];
      v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[13] = v135;
      v182[14] = @"PCIESuspendDuration";
      v134 = [MEMORY[0x1E4F929D8] sharedInstance];
      v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_us");
      v183[14] = v133;
      v182[15] = @"PCIEActiveDuration";
      v132 = [MEMORY[0x1E4F929D8] sharedInstance];
      v131 = objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_us");
      v183[15] = v131;
      v182[16] = @"PCIEPERSTDuration";
      v130 = [MEMORY[0x1E4F929D8] sharedInstance];
      v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
      v183[16] = v129;
      v182[17] = @"PCIEL0Count";
      v128 = [MEMORY[0x1E4F929D8] sharedInstance];
      v127 = objc_msgSend(v128, "commonTypeDict_IntegerFormat");
      v183[17] = v127;
      v182[18] = @"PCIEL0Duration";
      v126 = [MEMORY[0x1E4F929D8] sharedInstance];
      v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
      v183[18] = v125;
      v182[19] = @"PCIEL2Count";
      v124 = [MEMORY[0x1E4F929D8] sharedInstance];
      v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat");
      v183[19] = v123;
      v182[20] = @"PCIEL2Duration";
      v122 = [MEMORY[0x1E4F929D8] sharedInstance];
      v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
      v183[20] = v121;
      v182[21] = @"PCIEL1Count";
      v120 = [MEMORY[0x1E4F929D8] sharedInstance];
      v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat");
      v183[21] = v119;
      v182[22] = @"PCIEL1Duration";
      v118 = [MEMORY[0x1E4F929D8] sharedInstance];
      v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_us");
      v183[22] = v117;
      v182[23] = @"PCIEL11Count";
      v116 = [MEMORY[0x1E4F929D8] sharedInstance];
      v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
      v183[23] = v115;
      v182[24] = @"PCIEL11Duration";
      v114 = [MEMORY[0x1E4F929D8] sharedInstance];
      v113 = objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
      v183[24] = v113;
      v182[25] = @"PCIEL12Count";
      v112 = [MEMORY[0x1E4F929D8] sharedInstance];
      v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
      v183[25] = v111;
      v182[26] = @"PCIEL12Duration";
      v110 = [MEMORY[0x1E4F929D8] sharedInstance];
      v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat_withUnit_us");
      v183[26] = v109;
      v182[27] = @"AWDLTXDuration";
      v108 = [MEMORY[0x1E4F929D8] sharedInstance];
      v107 = objc_msgSend(v108, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[27] = v107;
      v182[28] = @"AWDLRXDuration";
      v106 = [MEMORY[0x1E4F929D8] sharedInstance];
      v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[28] = v105;
      v182[29] = @"AWDLAWDuration";
      v104 = [MEMORY[0x1E4F929D8] sharedInstance];
      v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat_withUnit_s");
      v183[29] = v103;
      v182[30] = @"AWDLScanDuration";
      v102 = [MEMORY[0x1E4F929D8] sharedInstance];
      v101 = objc_msgSend(v102, "commonTypeDict_IntegerFormat_withUnit_s");
      v183[30] = v101;
      v182[31] = @"AutojoinScanDuration";
      v100 = [MEMORY[0x1E4F929D8] sharedInstance];
      v99 = objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[31] = v99;
      v182[32] = @"LocationScanDuration";
      v98 = [MEMORY[0x1E4F929D8] sharedInstance];
      v97 = objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[32] = v97;
      v182[33] = @"PipelineScanDuration";
      v96 = [MEMORY[0x1E4F929D8] sharedInstance];
      v95 = objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[33] = v95;
      v182[34] = @"SetupScanDuration";
      v94 = [MEMORY[0x1E4F929D8] sharedInstance];
      v93 = objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[34] = v93;
      v182[35] = @"UnknownScanDuration";
      v92 = [MEMORY[0x1E4F929D8] sharedInstance];
      v91 = objc_msgSend(v92, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[35] = v91;
      v182[36] = @"CurrentChannel";
      v90 = [MEMORY[0x1E4F929D8] sharedInstance];
      v89 = objc_msgSend(v90, "commonTypeDict_IntegerFormat");
      v183[36] = v89;
      v182[37] = @"CurrentSSID";
      v88 = [MEMORY[0x1E4F929D8] sharedInstance];
      v87 = objc_msgSend(v88, "commonTypeDict_StringFormat");
      v183[37] = v87;
      v182[38] = @"CurrentBandwidth";
      v86 = [MEMORY[0x1E4F929D8] sharedInstance];
      v85 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
      v183[38] = v85;
      v182[39] = @"WifiPowered";
      v84 = [MEMORY[0x1E4F929D8] sharedInstance];
      v83 = objc_msgSend(v84, "commonTypeDict_BoolFormat");
      v183[39] = v83;
      v182[40] = @"WowEnabled";
      v82 = [MEMORY[0x1E4F929D8] sharedInstance];
      v81 = objc_msgSend(v82, "commonTypeDict_BoolFormat");
      v183[40] = v81;
      v182[41] = @"Carplay";
      v80 = [MEMORY[0x1E4F929D8] sharedInstance];
      v79 = objc_msgSend(v80, "commonTypeDict_BoolFormat");
      v183[41] = v79;
      v182[42] = @"SISOTXDuration";
      v78 = [MEMORY[0x1E4F929D8] sharedInstance];
      v77 = objc_msgSend(v78, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[42] = v77;
      v182[43] = @"MIMOTXDuration";
      v76 = [MEMORY[0x1E4F929D8] sharedInstance];
      v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[43] = v75;
      v182[44] = @"MIMORXDuration";
      v74 = [MEMORY[0x1E4F929D8] sharedInstance];
      v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[44] = v73;
      v182[45] = @"SISORXDuration";
      v23 = [MEMORY[0x1E4F929D8] sharedInstance];
      uint64_t v24 = objc_msgSend(v23, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[45] = v24;
      v182[46] = @"MIMOCSDuration";
      v25 = [MEMORY[0x1E4F929D8] sharedInstance];
      v26 = objc_msgSend(v25, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[46] = v26;
      v182[47] = @"SISOCSDuration";
      v27 = [MEMORY[0x1E4F929D8] sharedInstance];
      v28 = objc_msgSend(v27, "commonTypeDict_IntegerFormat_withUnit_ms");
      v183[47] = v28;
      v182[48] = @"READINGTYPE";
      v29 = [MEMORY[0x1E4F929D8] sharedInstance];
      v30 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
      v183[48] = v30;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v183 forKeys:v182 count:49];
      v187[1] = v31;
      uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v187 forKeys:v186 count:2];

      goto LABEL_16;
    }
    if (([MEMORY[0x1E4F92A38] isWiFiClass:1004011] & 1) != 0
      || [MEMORY[0x1E4F92A38] isWiFiClass:1004012]
      && (int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] < 1001205)
    {
      v180[0] = *MEMORY[0x1E4F92C50];
      uint64_t v178 = *MEMORY[0x1E4F92CD0];
      v179 = &unk_1F4012038;
      v163 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v179 forKeys:&v178 count:1];
      v181[0] = v163;
      v180[1] = *MEMORY[0x1E4F92CA8];
      v176[0] = @"WifiTimestamp";
      v162 = [MEMORY[0x1E4F929D8] sharedInstance];
      v161 = objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
      v177[0] = v161;
      v176[1] = @"PMDuration";
      v160 = [MEMORY[0x1E4F929D8] sharedInstance];
      v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
      v177[1] = v159;
      v176[2] = @"MPCDuration";
      v158 = [MEMORY[0x1E4F929D8] sharedInstance];
      v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
      v177[2] = v157;
      v176[3] = @"TXDuration";
      v156 = [MEMORY[0x1E4F929D8] sharedInstance];
      v155 = objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_ms");
      v177[3] = v155;
      v176[4] = @"RXDuration";
      v154 = [MEMORY[0x1E4F929D8] sharedInstance];
      v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_ms");
      v177[4] = v153;
      v176[5] = @"HSICSuspendDuration";
      v152 = [MEMORY[0x1E4F929D8] sharedInstance];
      v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
      v177[5] = v151;
      v176[6] = @"HSICActiveDuration";
      v150 = [MEMORY[0x1E4F929D8] sharedInstance];
      v149 = objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
      v177[6] = v149;
      v176[7] = @"PNOScanSSIDDuration";
      v148 = [MEMORY[0x1E4F929D8] sharedInstance];
      v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
      v177[7] = v147;
      v176[8] = @"PNOBSSIDDuration";
      v146 = [MEMORY[0x1E4F929D8] sharedInstance];
      v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
      v177[8] = v145;
      v176[9] = @"RoamScanDuration";
      v144 = [MEMORY[0x1E4F929D8] sharedInstance];
      v143 = objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
      v177[9] = v143;
      v176[10] = @"AssociatedScanDuration";
      v142 = [MEMORY[0x1E4F929D8] sharedInstance];
      v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
      v177[10] = v141;
      v176[11] = @"OtherScanDuration";
      v140 = [MEMORY[0x1E4F929D8] sharedInstance];
      v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_s");
      v177[11] = v139;
      v176[12] = @"UserScanDuration";
      v138 = [MEMORY[0x1E4F929D8] sharedInstance];
      v137 = objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
      v177[12] = v137;
      v176[13] = @"FRTSDuration";
      v136 = [MEMORY[0x1E4F929D8] sharedInstance];
      v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_ms");
      v177[13] = v135;
      v176[14] = @"PCIESuspendDuration";
      v134 = [MEMORY[0x1E4F929D8] sharedInstance];
      v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_us");
      v177[14] = v133;
      v176[15] = @"PCIEActiveDuration";
      v132 = [MEMORY[0x1E4F929D8] sharedInstance];
      v131 = objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_us");
      v177[15] = v131;
      v176[16] = @"PCIEPERSTDuration";
      v130 = [MEMORY[0x1E4F929D8] sharedInstance];
      v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
      v177[16] = v129;
      v176[17] = @"PCIEL0Count";
      v128 = [MEMORY[0x1E4F929D8] sharedInstance];
      v127 = objc_msgSend(v128, "commonTypeDict_IntegerFormat");
      v177[17] = v127;
      v176[18] = @"PCIEL0Duration";
      v126 = [MEMORY[0x1E4F929D8] sharedInstance];
      v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
      v177[18] = v125;
      v176[19] = @"PCIEL2Count";
      v124 = [MEMORY[0x1E4F929D8] sharedInstance];
      v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat");
      v177[19] = v123;
      v176[20] = @"PCIEL2Duration";
      v122 = [MEMORY[0x1E4F929D8] sharedInstance];
      v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
      v177[20] = v121;
      v176[21] = @"PCIEL1Count";
      v120 = [MEMORY[0x1E4F929D8] sharedInstance];
      v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat");
      v177[21] = v119;
      v176[22] = @"PCIEL1Duration";
      v118 = [MEMORY[0x1E4F929D8] sharedInstance];
      v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_us");
      v177[22] = v117;
      v176[23] = @"PCIEL11Count";
      v116 = [MEMORY[0x1E4F929D8] sharedInstance];
      v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
      v177[23] = v115;
      v176[24] = @"PCIEL11Duration";
      v114 = [MEMORY[0x1E4F929D8] sharedInstance];
      v113 = objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
      v177[24] = v113;
      v176[25] = @"PCIEL12Count";
      v112 = [MEMORY[0x1E4F929D8] sharedInstance];
      v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
      v177[25] = v111;
      v176[26] = @"PCIEL12Duration";
      v110 = [MEMORY[0x1E4F929D8] sharedInstance];
      v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat_withUnit_us");
      v177[26] = v109;
      v176[27] = @"AWDLTXDuration";
      v108 = [MEMORY[0x1E4F929D8] sharedInstance];
      v107 = objc_msgSend(v108, "commonTypeDict_IntegerFormat_withUnit_ms");
      v177[27] = v107;
      v176[28] = @"AWDLRXDuration";
      v106 = [MEMORY[0x1E4F929D8] sharedInstance];
      v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_ms");
      v177[28] = v105;
      v176[29] = @"AWDLAWDuration";
      v104 = [MEMORY[0x1E4F929D8] sharedInstance];
      v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat_withUnit_s");
      v177[29] = v103;
      v176[30] = @"AWDLScanDuration";
      v102 = [MEMORY[0x1E4F929D8] sharedInstance];
      v101 = objc_msgSend(v102, "commonTypeDict_IntegerFormat_withUnit_s");
      v177[30] = v101;
      v176[31] = @"AutojoinScanDuration";
      v100 = [MEMORY[0x1E4F929D8] sharedInstance];
      v99 = objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_ms");
      v177[31] = v99;
      v176[32] = @"LocationScanDuration";
      v98 = [MEMORY[0x1E4F929D8] sharedInstance];
      v97 = objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_ms");
      v177[32] = v97;
      v176[33] = @"PipelineScanDuration";
      v96 = [MEMORY[0x1E4F929D8] sharedInstance];
      v95 = objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_ms");
      v177[33] = v95;
      v176[34] = @"SetupScanDuration";
      v94 = [MEMORY[0x1E4F929D8] sharedInstance];
      v93 = objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_ms");
      v177[34] = v93;
      v176[35] = @"UnknownScanDuration";
      v92 = [MEMORY[0x1E4F929D8] sharedInstance];
      v91 = objc_msgSend(v92, "commonTypeDict_IntegerFormat_withUnit_ms");
      v177[35] = v91;
      v176[36] = @"CurrentChannel";
      v90 = [MEMORY[0x1E4F929D8] sharedInstance];
      v89 = objc_msgSend(v90, "commonTypeDict_IntegerFormat");
      v177[36] = v89;
      v176[37] = @"CurrentSSID";
      v88 = [MEMORY[0x1E4F929D8] sharedInstance];
      v87 = objc_msgSend(v88, "commonTypeDict_StringFormat");
      v177[37] = v87;
      v176[38] = @"CurrentBandwidth";
      v86 = [MEMORY[0x1E4F929D8] sharedInstance];
      v85 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
      v177[38] = v85;
      v176[39] = @"WifiPowered";
      v84 = [MEMORY[0x1E4F929D8] sharedInstance];
      v83 = objc_msgSend(v84, "commonTypeDict_BoolFormat");
      v177[39] = v83;
      v176[40] = @"WowEnabled";
      v82 = [MEMORY[0x1E4F929D8] sharedInstance];
      v81 = objc_msgSend(v82, "commonTypeDict_BoolFormat");
      v177[40] = v81;
      v176[41] = @"Carplay";
      v80 = [MEMORY[0x1E4F929D8] sharedInstance];
      v79 = objc_msgSend(v80, "commonTypeDict_BoolFormat");
      v177[41] = v79;
      v176[42] = @"READINGTYPE";
      v32 = [MEMORY[0x1E4F929D8] sharedInstance];
      v33 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
      v177[42] = v33;
      v176[43] = @"PhyOfflineDuration";
      v34 = [MEMORY[0x1E4F929D8] sharedInstance];
      v35 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
      v177[43] = v35;
      v176[44] = @"PhyCalibrationDuration";
      v36 = [MEMORY[0x1E4F929D8] sharedInstance];
      v37 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
      v177[44] = v37;
      v176[45] = @"PhyCalibrationCount";
      v38 = [MEMORY[0x1E4F929D8] sharedInstance];
      v39 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
      v177[45] = v39;
      v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v177 forKeys:v176 count:46];
      v181[1] = v40;
      uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v181 forKeys:v180 count:2];

      goto LABEL_17;
    }
    if (![MEMORY[0x1E4F92A38] isWiFiClass:1004012]
      || (int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] <= 1001204)
    {
      v168[0] = *MEMORY[0x1E4F92C50];
      uint64_t v166 = *MEMORY[0x1E4F92CD0];
      v167 = &unk_1F4012048;
      v163 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v167 forKeys:&v166 count:1];
      v169[0] = v163;
      v168[1] = *MEMORY[0x1E4F92CA8];
      v164[0] = @"WifiTimestamp";
      v162 = [MEMORY[0x1E4F929D8] sharedInstance];
      v161 = objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
      v165[0] = v161;
      v164[1] = @"PMDuration";
      v160 = [MEMORY[0x1E4F929D8] sharedInstance];
      v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
      v165[1] = v159;
      v164[2] = @"MPCDuration";
      v158 = [MEMORY[0x1E4F929D8] sharedInstance];
      v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
      v165[2] = v157;
      v164[3] = @"TXDuration";
      v156 = [MEMORY[0x1E4F929D8] sharedInstance];
      v155 = objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_ms");
      v165[3] = v155;
      v164[4] = @"RXDuration";
      v154 = [MEMORY[0x1E4F929D8] sharedInstance];
      v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_ms");
      v165[4] = v153;
      v164[5] = @"HSICSuspendDuration";
      v152 = [MEMORY[0x1E4F929D8] sharedInstance];
      v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
      v165[5] = v151;
      v164[6] = @"HSICActiveDuration";
      v150 = [MEMORY[0x1E4F929D8] sharedInstance];
      v149 = objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
      v165[6] = v149;
      v164[7] = @"PNOScanSSIDDuration";
      v148 = [MEMORY[0x1E4F929D8] sharedInstance];
      v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
      v165[7] = v147;
      v164[8] = @"PNOBSSIDDuration";
      v146 = [MEMORY[0x1E4F929D8] sharedInstance];
      v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
      v165[8] = v145;
      v164[9] = @"RoamScanDuration";
      v144 = [MEMORY[0x1E4F929D8] sharedInstance];
      v143 = objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
      v165[9] = v143;
      v164[10] = @"AssociatedScanDuration";
      v142 = [MEMORY[0x1E4F929D8] sharedInstance];
      v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
      v165[10] = v141;
      v164[11] = @"OtherScanDuration";
      v140 = [MEMORY[0x1E4F929D8] sharedInstance];
      v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_s");
      v165[11] = v139;
      v164[12] = @"UserScanDuration";
      v138 = [MEMORY[0x1E4F929D8] sharedInstance];
      v137 = objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
      v165[12] = v137;
      v164[13] = @"FRTSDuration";
      v136 = [MEMORY[0x1E4F929D8] sharedInstance];
      v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_ms");
      v165[13] = v135;
      v164[14] = @"PCIESuspendDuration";
      v134 = [MEMORY[0x1E4F929D8] sharedInstance];
      v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_us");
      v165[14] = v133;
      v164[15] = @"PCIEActiveDuration";
      v132 = [MEMORY[0x1E4F929D8] sharedInstance];
      v131 = objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_us");
      v165[15] = v131;
      v164[16] = @"PCIEPERSTDuration";
      v130 = [MEMORY[0x1E4F929D8] sharedInstance];
      v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
      v165[16] = v129;
      v164[17] = @"PCIEL0Count";
      v128 = [MEMORY[0x1E4F929D8] sharedInstance];
      v127 = objc_msgSend(v128, "commonTypeDict_IntegerFormat");
      v165[17] = v127;
      v164[18] = @"PCIEL0Duration";
      v126 = [MEMORY[0x1E4F929D8] sharedInstance];
      v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
      v165[18] = v125;
      v164[19] = @"PCIEL2Count";
      v124 = [MEMORY[0x1E4F929D8] sharedInstance];
      v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat");
      v165[19] = v123;
      v164[20] = @"PCIEL2Duration";
      v122 = [MEMORY[0x1E4F929D8] sharedInstance];
      v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
      v165[20] = v121;
      v164[21] = @"PCIEL1Count";
      v120 = [MEMORY[0x1E4F929D8] sharedInstance];
      v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat");
      v165[21] = v119;
      v164[22] = @"PCIEL1Duration";
      v118 = [MEMORY[0x1E4F929D8] sharedInstance];
      v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_us");
      v165[22] = v117;
      v164[23] = @"PCIEL11Count";
      v116 = [MEMORY[0x1E4F929D8] sharedInstance];
      v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
      v165[23] = v115;
      v164[24] = @"PCIEL11Duration";
      v114 = [MEMORY[0x1E4F929D8] sharedInstance];
      v113 = objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
      v165[24] = v113;
      v164[25] = @"PCIEL12Count";
      v112 = [MEMORY[0x1E4F929D8] sharedInstance];
      v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
      v165[25] = v111;
      v164[26] = @"PCIEL12Duration";
      v110 = [MEMORY[0x1E4F929D8] sharedInstance];
      v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat_withUnit_us");
      v165[26] = v109;
      v164[27] = @"AWDLTXDuration";
      v108 = [MEMORY[0x1E4F929D8] sharedInstance];
      v107 = objc_msgSend(v108, "commonTypeDict_IntegerFormat_withUnit_ms");
      v165[27] = v107;
      v164[28] = @"AWDLRXDuration";
      v106 = [MEMORY[0x1E4F929D8] sharedInstance];
      v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_ms");
      v165[28] = v105;
      v164[29] = @"AWDLAWDuration";
      v104 = [MEMORY[0x1E4F929D8] sharedInstance];
      v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat_withUnit_s");
      v165[29] = v103;
      v164[30] = @"AWDLScanDuration";
      v102 = [MEMORY[0x1E4F929D8] sharedInstance];
      v101 = objc_msgSend(v102, "commonTypeDict_IntegerFormat_withUnit_s");
      v165[30] = v101;
      v164[31] = @"AutojoinScanDuration";
      v100 = [MEMORY[0x1E4F929D8] sharedInstance];
      v99 = objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_ms");
      v165[31] = v99;
      v164[32] = @"LocationScanDuration";
      v98 = [MEMORY[0x1E4F929D8] sharedInstance];
      v97 = objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_ms");
      v165[32] = v97;
      v164[33] = @"PipelineScanDuration";
      v96 = [MEMORY[0x1E4F929D8] sharedInstance];
      v95 = objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_ms");
      v165[33] = v95;
      v164[34] = @"SetupScanDuration";
      v94 = [MEMORY[0x1E4F929D8] sharedInstance];
      v93 = objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_ms");
      v165[34] = v93;
      v164[35] = @"UnknownScanDuration";
      v92 = [MEMORY[0x1E4F929D8] sharedInstance];
      v91 = objc_msgSend(v92, "commonTypeDict_IntegerFormat_withUnit_ms");
      v165[35] = v91;
      v164[36] = @"CurrentChannel";
      v90 = [MEMORY[0x1E4F929D8] sharedInstance];
      v89 = objc_msgSend(v90, "commonTypeDict_IntegerFormat");
      v165[36] = v89;
      v164[37] = @"CurrentSSID";
      v88 = [MEMORY[0x1E4F929D8] sharedInstance];
      v87 = objc_msgSend(v88, "commonTypeDict_StringFormat");
      v165[37] = v87;
      v164[38] = @"CurrentBandwidth";
      v86 = [MEMORY[0x1E4F929D8] sharedInstance];
      v85 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
      v165[38] = v85;
      v164[39] = @"WifiPowered";
      v50 = [MEMORY[0x1E4F929D8] sharedInstance];
      v51 = objc_msgSend(v50, "commonTypeDict_BoolFormat");
      v165[39] = v51;
      v164[40] = @"WowEnabled";
      v52 = [MEMORY[0x1E4F929D8] sharedInstance];
      v53 = objc_msgSend(v52, "commonTypeDict_BoolFormat");
      v165[40] = v53;
      v164[41] = @"Carplay";
      v54 = [MEMORY[0x1E4F929D8] sharedInstance];
      v55 = objc_msgSend(v54, "commonTypeDict_BoolFormat");
      v165[41] = v55;
      v164[42] = @"READINGTYPE";
      v56 = [MEMORY[0x1E4F929D8] sharedInstance];
      v57 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
      v165[42] = v57;
      v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v165 forKeys:v164 count:43];
      v169[1] = v58;
      uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v169 forKeys:v168 count:2];

      goto LABEL_18;
    }
    v174[0] = *MEMORY[0x1E4F92C50];
    uint64_t v172 = *MEMORY[0x1E4F92CD0];
    v173 = &unk_1F4011FC8;
    v163 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v172 count:1];
    v175[0] = v163;
    v174[1] = *MEMORY[0x1E4F92CA8];
    v170[0] = @"WifiTimestamp";
    v162 = [MEMORY[0x1E4F929D8] sharedInstance];
    v161 = objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[0] = v161;
    v170[1] = @"PMDuration";
    v160 = [MEMORY[0x1E4F929D8] sharedInstance];
    v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[1] = v159;
    v170[2] = @"MPCDuration";
    v158 = [MEMORY[0x1E4F929D8] sharedInstance];
    v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[2] = v157;
    v170[3] = @"TXDuration";
    v156 = [MEMORY[0x1E4F929D8] sharedInstance];
    v155 = objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_ms");
    v171[3] = v155;
    v170[4] = @"RXDuration";
    v154 = [MEMORY[0x1E4F929D8] sharedInstance];
    v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_ms");
    v171[4] = v153;
    v170[5] = @"HSICSuspendDuration";
    v152 = [MEMORY[0x1E4F929D8] sharedInstance];
    v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[5] = v151;
    v170[6] = @"HSICActiveDuration";
    v150 = [MEMORY[0x1E4F929D8] sharedInstance];
    v149 = objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[6] = v149;
    v170[7] = @"PNOScanSSIDDuration";
    v148 = [MEMORY[0x1E4F929D8] sharedInstance];
    v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[7] = v147;
    v170[8] = @"PNOBSSIDDuration";
    v146 = [MEMORY[0x1E4F929D8] sharedInstance];
    v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[8] = v145;
    v170[9] = @"RoamScanDuration";
    v144 = [MEMORY[0x1E4F929D8] sharedInstance];
    v143 = objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[9] = v143;
    v170[10] = @"AssociatedScanDuration";
    v142 = [MEMORY[0x1E4F929D8] sharedInstance];
    v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[10] = v141;
    v170[11] = @"OtherScanDuration";
    v140 = [MEMORY[0x1E4F929D8] sharedInstance];
    v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[11] = v139;
    v170[12] = @"UserScanDuration";
    v138 = [MEMORY[0x1E4F929D8] sharedInstance];
    v137 = objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[12] = v137;
    v170[13] = @"FRTSDuration";
    v136 = [MEMORY[0x1E4F929D8] sharedInstance];
    v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_ms");
    v171[13] = v135;
    v170[14] = @"PCIESuspendDuration";
    v134 = [MEMORY[0x1E4F929D8] sharedInstance];
    v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_us");
    v171[14] = v133;
    v170[15] = @"PCIEActiveDuration";
    v132 = [MEMORY[0x1E4F929D8] sharedInstance];
    v131 = objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_us");
    v171[15] = v131;
    v170[16] = @"PCIEPERSTDuration";
    v130 = [MEMORY[0x1E4F929D8] sharedInstance];
    v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
    v171[16] = v129;
    v170[17] = @"PCIEL0Count";
    v128 = [MEMORY[0x1E4F929D8] sharedInstance];
    v127 = objc_msgSend(v128, "commonTypeDict_IntegerFormat");
    v171[17] = v127;
    v170[18] = @"PCIEL0Duration";
    v126 = [MEMORY[0x1E4F929D8] sharedInstance];
    v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
    v171[18] = v125;
    v170[19] = @"PCIEL2Count";
    v124 = [MEMORY[0x1E4F929D8] sharedInstance];
    v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat");
    v171[19] = v123;
    v170[20] = @"PCIEL2Duration";
    v122 = [MEMORY[0x1E4F929D8] sharedInstance];
    v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
    v171[20] = v121;
    v170[21] = @"PCIEL1Count";
    v120 = [MEMORY[0x1E4F929D8] sharedInstance];
    v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat");
    v171[21] = v119;
    v170[22] = @"PCIEL1Duration";
    v118 = [MEMORY[0x1E4F929D8] sharedInstance];
    v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_us");
    v171[22] = v117;
    v170[23] = @"PCIEL11Count";
    v116 = [MEMORY[0x1E4F929D8] sharedInstance];
    v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
    v171[23] = v115;
    v170[24] = @"PCIEL11Duration";
    v114 = [MEMORY[0x1E4F929D8] sharedInstance];
    v113 = objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
    v171[24] = v113;
    v170[25] = @"PCIEL12Count";
    v112 = [MEMORY[0x1E4F929D8] sharedInstance];
    v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v171[25] = v111;
    v170[26] = @"PCIEL12Duration";
    v110 = [MEMORY[0x1E4F929D8] sharedInstance];
    v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat_withUnit_us");
    v171[26] = v109;
    v170[27] = @"AWDLTXDuration";
    v108 = [MEMORY[0x1E4F929D8] sharedInstance];
    v107 = objc_msgSend(v108, "commonTypeDict_IntegerFormat_withUnit_ms");
    v171[27] = v107;
    v170[28] = @"AWDLRXDuration";
    v106 = [MEMORY[0x1E4F929D8] sharedInstance];
    v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_ms");
    v171[28] = v105;
    v170[29] = @"AWDLAWDuration";
    v104 = [MEMORY[0x1E4F929D8] sharedInstance];
    v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[29] = v103;
    v170[30] = @"AWDLScanDuration";
    v102 = [MEMORY[0x1E4F929D8] sharedInstance];
    v101 = objc_msgSend(v102, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[30] = v101;
    v170[31] = @"AutojoinScanDuration";
    v100 = [MEMORY[0x1E4F929D8] sharedInstance];
    v99 = objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_ms");
    v171[31] = v99;
    v170[32] = @"LocationScanDuration";
    v98 = [MEMORY[0x1E4F929D8] sharedInstance];
    v97 = objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_ms");
    v171[32] = v97;
    v170[33] = @"PipelineScanDuration";
    v96 = [MEMORY[0x1E4F929D8] sharedInstance];
    v95 = objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_ms");
    v171[33] = v95;
    v170[34] = @"SetupScanDuration";
    v94 = [MEMORY[0x1E4F929D8] sharedInstance];
    v93 = objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_ms");
    v171[34] = v93;
    v170[35] = @"UnknownScanDuration";
    v92 = [MEMORY[0x1E4F929D8] sharedInstance];
    v91 = objc_msgSend(v92, "commonTypeDict_IntegerFormat_withUnit_ms");
    v171[35] = v91;
    v170[36] = @"CurrentChannel";
    v90 = [MEMORY[0x1E4F929D8] sharedInstance];
    v89 = objc_msgSend(v90, "commonTypeDict_IntegerFormat");
    v171[36] = v89;
    v170[37] = @"CurrentSSID";
    v88 = [MEMORY[0x1E4F929D8] sharedInstance];
    v87 = objc_msgSend(v88, "commonTypeDict_StringFormat");
    v171[37] = v87;
    v170[38] = @"CurrentBandwidth";
    v86 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
    v171[38] = v85;
    v170[39] = @"WifiPowered";
    v84 = [MEMORY[0x1E4F929D8] sharedInstance];
    v83 = objc_msgSend(v84, "commonTypeDict_BoolFormat");
    v171[39] = v83;
    v170[40] = @"WowEnabled";
    v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    v81 = objc_msgSend(v82, "commonTypeDict_BoolFormat");
    v171[40] = v81;
    v170[41] = @"Carplay";
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    v79 = objc_msgSend(v80, "commonTypeDict_BoolFormat");
    v171[41] = v79;
    v170[42] = @"READINGTYPE";
    v78 = [MEMORY[0x1E4F929D8] sharedInstance];
    v77 = objc_msgSend(v78, "commonTypeDict_IntegerFormat");
    v171[42] = v77;
    v170[43] = @"PhyOfflineDuration";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat");
    v171[43] = v75;
    v170[44] = @"PhyCalibrationDuration";
    v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat");
    v171[44] = v73;
    v170[45] = @"PhyCalibrationCount";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v171[45] = v71;
    v170[46] = @"PNOScanSSID5GDuration";
    v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[46] = v69;
    v170[47] = @"PNOBSSID5GDuration";
    v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[47] = v67;
    v170[48] = @"RoamScan5GDuration";
    v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    v42 = objc_msgSend(v41, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[48] = v42;
    v170[49] = @"AssociatedScan5GDuration";
    v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v43, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[49] = v44;
    v170[50] = @"OtherScan5GDuration";
    v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v45, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[50] = v46;
    v170[51] = @"UserScan5GDuration";
    v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v48 = objc_msgSend(v47, "commonTypeDict_IntegerFormat_withUnit_s");
    v171[51] = v48;
    v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v171 forKeys:v170 count:52];
    v175[1] = v49;
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v175 forKeys:v174 count:2];
  }
LABEL_15:

LABEL_16:
LABEL_17:

LABEL_18:
LABEL_7:
  return v3;
}

+ (id)entryEventBackwardDefinitionDiffBasic
{
  v191[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004013] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWiFiClass:1004014])
  {
    v190[0] = *MEMORY[0x1E4F92C50];
    uint64_t v188 = *MEMORY[0x1E4F92CD0];
    v189 = &unk_1F4012018;
    uint64_t v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v189 forKeys:&v188 count:1];
    v191[0] = v102;
    v190[1] = *MEMORY[0x1E4F92CA8];
    v186[0] = @"TimeDuration";
    v98 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v86 = objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_s");
    v187[0] = v86;
    v186[1] = @"PMDuration";
    v94 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v90 = objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_s");
    v187[1] = v90;
    void v186[2] = @"MPCDuration";
    v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v78 = objc_msgSend(v82, "commonTypeDict_IntegerFormat_withUnit_s");
    void v187[2] = v78;
    v186[3] = @"TXDuration";
    v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    v161 = objc_msgSend(v74, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[3] = v161;
    v186[4] = @"RXDuration";
    v160 = [MEMORY[0x1E4F929D8] sharedInstance];
    v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[4] = v159;
    v186[5] = @"HSICSuspendDuration";
    v158 = [MEMORY[0x1E4F929D8] sharedInstance];
    v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
    v187[5] = v157;
    v186[6] = @"HSICActiveDuration";
    v156 = [MEMORY[0x1E4F929D8] sharedInstance];
    v155 = objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_s");
    v187[6] = v155;
    v186[7] = @"PNOScanSSIDDuration";
    v154 = [MEMORY[0x1E4F929D8] sharedInstance];
    v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_s");
    v187[7] = v153;
    v186[8] = @"PNOBSSIDDuration";
    v152 = [MEMORY[0x1E4F929D8] sharedInstance];
    v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
    v187[8] = v151;
    v186[9] = @"RoamScanDuration";
    v150 = [MEMORY[0x1E4F929D8] sharedInstance];
    v149 = objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
    v187[9] = v149;
    v186[10] = @"AssociatedScanDuration";
    v148 = [MEMORY[0x1E4F929D8] sharedInstance];
    v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
    v187[10] = v147;
    v186[11] = @"OtherScanDuration";
    v146 = [MEMORY[0x1E4F929D8] sharedInstance];
    v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
    v187[11] = v145;
    v186[12] = @"UserScanDuration";
    v144 = [MEMORY[0x1E4F929D8] sharedInstance];
    v143 = objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
    v187[12] = v143;
    v186[13] = @"FRTSDuration";
    v142 = [MEMORY[0x1E4F929D8] sharedInstance];
    v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[13] = v141;
    v186[14] = @"PCIESuspendDuration";
    v140 = [MEMORY[0x1E4F929D8] sharedInstance];
    v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_us");
    v187[14] = v139;
    v186[15] = @"PCIEActiveDuration";
    v138 = [MEMORY[0x1E4F929D8] sharedInstance];
    v137 = objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_us");
    v187[15] = v137;
    v186[16] = @"PCIEPERSTDuration";
    v136 = [MEMORY[0x1E4F929D8] sharedInstance];
    v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_us");
    v187[16] = v135;
    v186[17] = @"AWDLTXDuration";
    v134 = [MEMORY[0x1E4F929D8] sharedInstance];
    v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[17] = v133;
    v186[18] = @"AWDLRXDuration";
    v132 = [MEMORY[0x1E4F929D8] sharedInstance];
    v131 = objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[18] = v131;
    v186[19] = @"AWDLAWDuration";
    v130 = [MEMORY[0x1E4F929D8] sharedInstance];
    v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_s");
    v187[19] = v129;
    v186[20] = @"AWDLScanDuration";
    v128 = [MEMORY[0x1E4F929D8] sharedInstance];
    v127 = objc_msgSend(v128, "commonTypeDict_IntegerFormat_withUnit_s");
    v187[20] = v127;
    v186[21] = @"AutojoinScanDuration";
    v126 = [MEMORY[0x1E4F929D8] sharedInstance];
    v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[21] = v125;
    v186[22] = @"LocationScanDuration";
    v124 = [MEMORY[0x1E4F929D8] sharedInstance];
    v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[22] = v123;
    v186[23] = @"PipelineScanDuration";
    v122 = [MEMORY[0x1E4F929D8] sharedInstance];
    v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[23] = v121;
    v186[24] = @"SetupScanDuration";
    v120 = [MEMORY[0x1E4F929D8] sharedInstance];
    v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[24] = v119;
    v186[25] = @"UnknownScanDuration";
    v118 = [MEMORY[0x1E4F929D8] sharedInstance];
    v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[25] = v117;
    v186[26] = @"CurrentChannel";
    v116 = [MEMORY[0x1E4F929D8] sharedInstance];
    v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
    v187[26] = v115;
    v186[27] = @"CurrentSSID";
    v114 = [MEMORY[0x1E4F929D8] sharedInstance];
    v113 = objc_msgSend(v114, "commonTypeDict_StringFormat");
    v187[27] = v113;
    v186[28] = @"CurrentBandwidth";
    v112 = [MEMORY[0x1E4F929D8] sharedInstance];
    v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v187[28] = v111;
    v186[29] = @"WifiPowered";
    v110 = [MEMORY[0x1E4F929D8] sharedInstance];
    v109 = objc_msgSend(v110, "commonTypeDict_BoolFormat");
    v187[29] = v109;
    v186[30] = @"WowEnabled";
    v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    v108 = objc_msgSend(v70, "commonTypeDict_BoolFormat");
    v187[30] = v108;
    v186[31] = @"SISOTXDuration";
    v107 = [MEMORY[0x1E4F929D8] sharedInstance];
    v69 = objc_msgSend(v107, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[31] = v69;
    v186[32] = @"MIMOTXDuration";
    v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    v66 = objc_msgSend(v68, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[32] = v66;
    v186[33] = @"MIMORXDuration";
    v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[33] = v64;
    v186[34] = @"SISORXDuration";
    v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    v61 = objc_msgSend(v63, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[34] = v61;
    v186[35] = @"MIMOCSDuration";
    v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[35] = v59;
    v186[36] = @"SISOCSDuration";
    v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[36] = v57;
    v186[37] = @"OCLRXDuration";
    v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[37] = v55;
    v186[38] = @"OCLCSDuration";
    v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[38] = v53;
    v186[39] = @"OPSFullDuration";
    v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    v50 = objc_msgSend(v52, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[39] = v50;
    v186[40] = @"OPSPartialDuration";
    v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[40] = v48;
    v186[41] = @"PSBWDuration";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat_withUnit_ms");
    v187[41] = v3;
    v186[42] = @"isADHSConnected";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v187[42] = v5;
    v186[43] = @"AutoHotspotBTScanDuration";
    uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_withUnit_s");
    v187[43] = v7;
    v186[44] = @"AutoHotspotBTScanCount";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v187[44] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v187 forKeys:v186 count:45];
    v191[1] = v10;
    id v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v191 forKeys:v190 count:2];

    v11 = v70;
    uint64_t v12 = (void *)v86;

    v13 = v74;
    uint64_t v14 = (void *)v78;

    v15 = v82;
    uint64_t v16 = (void *)v90;

    v17 = v94;
    uint64_t v18 = v98;

    uint64_t v19 = (void *)v102;
LABEL_4:

LABEL_5:
LABEL_6:

    goto LABEL_7;
  }
  if ([MEMORY[0x1E4F92A38] isWiFiClass:1004010])
  {
    v184[0] = *MEMORY[0x1E4F92C50];
    uint64_t v182 = *MEMORY[0x1E4F92CD0];
    v183 = &unk_1F4012018;
    uint64_t v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v183 forKeys:&v182 count:1];
    v185[0] = v103;
    v184[1] = *MEMORY[0x1E4F92CA8];
    v180[0] = @"TimeDuration";
    v99 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v87 = objc_msgSend(v99, "commonTypeDict_IntegerFormat_withUnit_s");
    v181[0] = v87;
    v180[1] = @"PMDuration";
    v95 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v91 = objc_msgSend(v95, "commonTypeDict_IntegerFormat_withUnit_s");
    v181[1] = v91;
    void v180[2] = @"MPCDuration";
    v83 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v79 = objc_msgSend(v83, "commonTypeDict_IntegerFormat_withUnit_s");
    void v181[2] = v79;
    v180[3] = @"TXDuration";
    v75 = [MEMORY[0x1E4F929D8] sharedInstance];
    v161 = objc_msgSend(v75, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[3] = v161;
    v180[4] = @"RXDuration";
    v160 = [MEMORY[0x1E4F929D8] sharedInstance];
    v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[4] = v159;
    v180[5] = @"HSICSuspendDuration";
    v158 = [MEMORY[0x1E4F929D8] sharedInstance];
    v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
    v181[5] = v157;
    v180[6] = @"HSICActiveDuration";
    v156 = [MEMORY[0x1E4F929D8] sharedInstance];
    v155 = objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_s");
    v181[6] = v155;
    v180[7] = @"PNOScanSSIDDuration";
    v154 = [MEMORY[0x1E4F929D8] sharedInstance];
    v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_s");
    v181[7] = v153;
    v180[8] = @"PNOBSSIDDuration";
    v152 = [MEMORY[0x1E4F929D8] sharedInstance];
    v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
    v181[8] = v151;
    v180[9] = @"RoamScanDuration";
    v150 = [MEMORY[0x1E4F929D8] sharedInstance];
    v149 = objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
    v181[9] = v149;
    v180[10] = @"AssociatedScanDuration";
    v148 = [MEMORY[0x1E4F929D8] sharedInstance];
    v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
    v181[10] = v147;
    v180[11] = @"OtherScanDuration";
    v146 = [MEMORY[0x1E4F929D8] sharedInstance];
    v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
    v181[11] = v145;
    v180[12] = @"UserScanDuration";
    v144 = [MEMORY[0x1E4F929D8] sharedInstance];
    v143 = objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
    v181[12] = v143;
    v180[13] = @"FRTSDuration";
    v142 = [MEMORY[0x1E4F929D8] sharedInstance];
    v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[13] = v141;
    v180[14] = @"PCIESuspendDuration";
    v140 = [MEMORY[0x1E4F929D8] sharedInstance];
    v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_us");
    v181[14] = v139;
    v180[15] = @"PCIEActiveDuration";
    v138 = [MEMORY[0x1E4F929D8] sharedInstance];
    v137 = objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_us");
    v181[15] = v137;
    v180[16] = @"PCIEPERSTDuration";
    v136 = [MEMORY[0x1E4F929D8] sharedInstance];
    v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_us");
    v181[16] = v135;
    v180[17] = @"AWDLTXDuration";
    v134 = [MEMORY[0x1E4F929D8] sharedInstance];
    v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[17] = v133;
    v180[18] = @"AWDLRXDuration";
    v132 = [MEMORY[0x1E4F929D8] sharedInstance];
    v131 = objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[18] = v131;
    v180[19] = @"AWDLAWDuration";
    v130 = [MEMORY[0x1E4F929D8] sharedInstance];
    v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_s");
    v181[19] = v129;
    v180[20] = @"AWDLScanDuration";
    v128 = [MEMORY[0x1E4F929D8] sharedInstance];
    v127 = objc_msgSend(v128, "commonTypeDict_IntegerFormat_withUnit_s");
    v181[20] = v127;
    v180[21] = @"AutojoinScanDuration";
    v126 = [MEMORY[0x1E4F929D8] sharedInstance];
    v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[21] = v125;
    v180[22] = @"LocationScanDuration";
    v124 = [MEMORY[0x1E4F929D8] sharedInstance];
    v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[22] = v123;
    v180[23] = @"PipelineScanDuration";
    v122 = [MEMORY[0x1E4F929D8] sharedInstance];
    v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[23] = v121;
    v180[24] = @"SetupScanDuration";
    v120 = [MEMORY[0x1E4F929D8] sharedInstance];
    v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[24] = v119;
    v180[25] = @"UnknownScanDuration";
    v118 = [MEMORY[0x1E4F929D8] sharedInstance];
    v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[25] = v117;
    v180[26] = @"CurrentChannel";
    v116 = [MEMORY[0x1E4F929D8] sharedInstance];
    v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
    v181[26] = v115;
    v180[27] = @"CurrentSSID";
    v114 = [MEMORY[0x1E4F929D8] sharedInstance];
    v113 = objc_msgSend(v114, "commonTypeDict_StringFormat");
    v181[27] = v113;
    v180[28] = @"CurrentBandwidth";
    v112 = [MEMORY[0x1E4F929D8] sharedInstance];
    v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v181[28] = v111;
    v180[29] = @"WifiPowered";
    v110 = [MEMORY[0x1E4F929D8] sharedInstance];
    v109 = objc_msgSend(v110, "commonTypeDict_BoolFormat");
    v181[29] = v109;
    v180[30] = @"WowEnabled";
    v71 = [MEMORY[0x1E4F929D8] sharedInstance];
    v108 = objc_msgSend(v71, "commonTypeDict_BoolFormat");
    v181[30] = v108;
    v180[31] = @"SISOTXDuration";
    v107 = [MEMORY[0x1E4F929D8] sharedInstance];
    v69 = objc_msgSend(v107, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[31] = v69;
    v180[32] = @"MIMOTXDuration";
    v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    v66 = objc_msgSend(v68, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[32] = v66;
    v180[33] = @"MIMORXDuration";
    v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[33] = v64;
    v180[34] = @"SISORXDuration";
    v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    v61 = objc_msgSend(v63, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[34] = v61;
    v180[35] = @"MIMOCSDuration";
    v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[35] = v59;
    v180[36] = @"SISOCSDuration";
    v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[36] = v57;
    v180[37] = @"OCLRXDuration";
    v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[37] = v55;
    v180[38] = @"OCLCSDuration";
    v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[38] = v53;
    v180[39] = @"OPSFullDuration";
    v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[39] = v51;
    v180[40] = @"OPSPartialDuration";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v21, "commonTypeDict_IntegerFormat_withUnit_ms");
    v181[40] = v22;
    v180[41] = @"isADHSConnected";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v181[41] = v24;
    v180[42] = @"AutoHotspotBTScanDuration";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v25, "commonTypeDict_IntegerFormat_withUnit_s");
    v181[42] = v26;
    v180[43] = @"AutoHotspotBTScanCount";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v28 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v181[43] = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v181 forKeys:v180 count:44];
    v185[1] = v29;
    id v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v185 forKeys:v184 count:2];

    uint64_t v12 = (void *)v87;
    uint64_t v14 = (void *)v79;

    v15 = v83;
    uint64_t v16 = (void *)v91;

    v17 = v95;
    v13 = v75;

    uint64_t v18 = v99;
    uint64_t v19 = (void *)v103;

    v11 = v71;
    goto LABEL_4;
  }
  if ([MEMORY[0x1E4F92A38] isWiFiClass:1004007])
  {
    v178[0] = *MEMORY[0x1E4F92C50];
    uint64_t v176 = *MEMORY[0x1E4F92CD0];
    v177 = &unk_1F4012018;
    uint64_t v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v177 forKeys:&v176 count:1];
    v179[0] = v104;
    v178[1] = *MEMORY[0x1E4F92CA8];
    v174[0] = @"TimeDuration";
    v100 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v88 = objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_s");
    v175[0] = v88;
    v174[1] = @"PMDuration";
    v96 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v92 = objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_s");
    v175[1] = v92;
    void v174[2] = @"MPCDuration";
    v84 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v80 = objc_msgSend(v84, "commonTypeDict_IntegerFormat_withUnit_s");
    void v175[2] = v80;
    v174[3] = @"TXDuration";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    v161 = objc_msgSend(v76, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[3] = v161;
    v174[4] = @"RXDuration";
    v160 = [MEMORY[0x1E4F929D8] sharedInstance];
    v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[4] = v159;
    v174[5] = @"HSICSuspendDuration";
    v158 = [MEMORY[0x1E4F929D8] sharedInstance];
    v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
    v175[5] = v157;
    v174[6] = @"HSICActiveDuration";
    v156 = [MEMORY[0x1E4F929D8] sharedInstance];
    v155 = objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_s");
    v175[6] = v155;
    v174[7] = @"PNOScanSSIDDuration";
    v154 = [MEMORY[0x1E4F929D8] sharedInstance];
    v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_s");
    v175[7] = v153;
    v174[8] = @"PNOBSSIDDuration";
    v152 = [MEMORY[0x1E4F929D8] sharedInstance];
    v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
    v175[8] = v151;
    v174[9] = @"RoamScanDuration";
    v150 = [MEMORY[0x1E4F929D8] sharedInstance];
    v149 = objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
    v175[9] = v149;
    v174[10] = @"AssociatedScanDuration";
    v148 = [MEMORY[0x1E4F929D8] sharedInstance];
    v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
    v175[10] = v147;
    v174[11] = @"OtherScanDuration";
    v146 = [MEMORY[0x1E4F929D8] sharedInstance];
    v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
    v175[11] = v145;
    v174[12] = @"UserScanDuration";
    v144 = [MEMORY[0x1E4F929D8] sharedInstance];
    v143 = objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
    v175[12] = v143;
    v174[13] = @"FRTSDuration";
    v142 = [MEMORY[0x1E4F929D8] sharedInstance];
    v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[13] = v141;
    v174[14] = @"PCIESuspendDuration";
    v140 = [MEMORY[0x1E4F929D8] sharedInstance];
    v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_us");
    v175[14] = v139;
    v174[15] = @"PCIEActiveDuration";
    v138 = [MEMORY[0x1E4F929D8] sharedInstance];
    v137 = objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_us");
    v175[15] = v137;
    v174[16] = @"PCIEPERSTDuration";
    v136 = [MEMORY[0x1E4F929D8] sharedInstance];
    v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_us");
    v175[16] = v135;
    v174[17] = @"AWDLTXDuration";
    v134 = [MEMORY[0x1E4F929D8] sharedInstance];
    v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[17] = v133;
    v174[18] = @"AWDLRXDuration";
    v132 = [MEMORY[0x1E4F929D8] sharedInstance];
    v131 = objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[18] = v131;
    v174[19] = @"AWDLAWDuration";
    v130 = [MEMORY[0x1E4F929D8] sharedInstance];
    v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_s");
    v175[19] = v129;
    v174[20] = @"AWDLScanDuration";
    v128 = [MEMORY[0x1E4F929D8] sharedInstance];
    v127 = objc_msgSend(v128, "commonTypeDict_IntegerFormat_withUnit_s");
    v175[20] = v127;
    v174[21] = @"AutojoinScanDuration";
    v126 = [MEMORY[0x1E4F929D8] sharedInstance];
    v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[21] = v125;
    v174[22] = @"LocationScanDuration";
    v124 = [MEMORY[0x1E4F929D8] sharedInstance];
    v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[22] = v123;
    v174[23] = @"PipelineScanDuration";
    v122 = [MEMORY[0x1E4F929D8] sharedInstance];
    v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[23] = v121;
    v174[24] = @"SetupScanDuration";
    v120 = [MEMORY[0x1E4F929D8] sharedInstance];
    v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[24] = v119;
    v174[25] = @"UnknownScanDuration";
    v118 = [MEMORY[0x1E4F929D8] sharedInstance];
    v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[25] = v117;
    v174[26] = @"CurrentChannel";
    v116 = [MEMORY[0x1E4F929D8] sharedInstance];
    v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
    v175[26] = v115;
    v174[27] = @"CurrentSSID";
    v114 = [MEMORY[0x1E4F929D8] sharedInstance];
    v113 = objc_msgSend(v114, "commonTypeDict_StringFormat");
    v175[27] = v113;
    v174[28] = @"CurrentBandwidth";
    v112 = [MEMORY[0x1E4F929D8] sharedInstance];
    v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v175[28] = v111;
    v174[29] = @"WifiPowered";
    v110 = [MEMORY[0x1E4F929D8] sharedInstance];
    v109 = objc_msgSend(v110, "commonTypeDict_BoolFormat");
    v175[29] = v109;
    v174[30] = @"WowEnabled";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    v108 = objc_msgSend(v72, "commonTypeDict_BoolFormat");
    v175[30] = v108;
    v174[31] = @"SISOTXDuration";
    v107 = [MEMORY[0x1E4F929D8] sharedInstance];
    v69 = objc_msgSend(v107, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[31] = v69;
    v174[32] = @"MIMOTXDuration";
    v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    v66 = objc_msgSend(v68, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[32] = v66;
    v174[33] = @"MIMORXDuration";
    v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[33] = v64;
    v174[34] = @"SISORXDuration";
    v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[34] = v62;
    v174[35] = @"MIMOCSDuration";
    v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    v31 = objc_msgSend(v30, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[35] = v31;
    v174[36] = @"SISOCSDuration";
    v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    v33 = objc_msgSend(v32, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[36] = v33;
    v174[37] = @"OCLRXDuration";
    v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    v35 = objc_msgSend(v34, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[37] = v35;
    v174[38] = @"OCLCSDuration";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    v37 = objc_msgSend(v36, "commonTypeDict_IntegerFormat_withUnit_ms");
    v175[38] = v37;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v175 forKeys:v174 count:39];
    v179[1] = v38;
    id v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v179 forKeys:v178 count:2];

    v17 = v96;
    uint64_t v12 = (void *)v88;

    uint64_t v18 = v100;
    uint64_t v19 = (void *)v104;

    v11 = v72;
    v13 = v76;

    uint64_t v14 = (void *)v80;
    v15 = v84;

    uint64_t v16 = (void *)v92;
    goto LABEL_5;
  }
  if ([MEMORY[0x1E4F92A38] isWiFiClass:1004005])
  {
    v172[0] = *MEMORY[0x1E4F92C50];
    uint64_t v170 = *MEMORY[0x1E4F92CD0];
    v171 = &unk_1F4012008;
    uint64_t v105 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v171 forKeys:&v170 count:1];
    v173[0] = v105;
    v172[1] = *MEMORY[0x1E4F92CA8];
    v168[0] = @"TimeDuration";
    v101 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v89 = objc_msgSend(v101, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[0] = v89;
    v168[1] = @"PMDuration";
    v97 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v93 = objc_msgSend(v97, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[1] = v93;
    void v168[2] = @"MPCDuration";
    v85 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v81 = objc_msgSend(v85, "commonTypeDict_IntegerFormat_withUnit_s");
    void v169[2] = v81;
    v168[3] = @"TXDuration";
    v77 = [MEMORY[0x1E4F929D8] sharedInstance];
    v161 = objc_msgSend(v77, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[3] = v161;
    v168[4] = @"RXDuration";
    v160 = [MEMORY[0x1E4F929D8] sharedInstance];
    v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[4] = v159;
    v168[5] = @"HSICSuspendDuration";
    v158 = [MEMORY[0x1E4F929D8] sharedInstance];
    v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[5] = v157;
    v168[6] = @"HSICActiveDuration";
    v156 = [MEMORY[0x1E4F929D8] sharedInstance];
    v155 = objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[6] = v155;
    v168[7] = @"PNOScanSSIDDuration";
    v154 = [MEMORY[0x1E4F929D8] sharedInstance];
    v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[7] = v153;
    v168[8] = @"PNOBSSIDDuration";
    v152 = [MEMORY[0x1E4F929D8] sharedInstance];
    v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[8] = v151;
    v168[9] = @"RoamScanDuration";
    v150 = [MEMORY[0x1E4F929D8] sharedInstance];
    v149 = objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[9] = v149;
    v168[10] = @"AssociatedScanDuration";
    v148 = [MEMORY[0x1E4F929D8] sharedInstance];
    v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[10] = v147;
    v168[11] = @"OtherScanDuration";
    v146 = [MEMORY[0x1E4F929D8] sharedInstance];
    v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[11] = v145;
    v168[12] = @"UserScanDuration";
    v144 = [MEMORY[0x1E4F929D8] sharedInstance];
    v143 = objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[12] = v143;
    v168[13] = @"FRTSDuration";
    v142 = [MEMORY[0x1E4F929D8] sharedInstance];
    v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[13] = v141;
    v168[14] = @"PCIESuspendDuration";
    v140 = [MEMORY[0x1E4F929D8] sharedInstance];
    v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_us");
    v169[14] = v139;
    v168[15] = @"PCIEActiveDuration";
    v138 = [MEMORY[0x1E4F929D8] sharedInstance];
    v137 = objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_us");
    v169[15] = v137;
    v168[16] = @"PCIEPERSTDuration";
    v136 = [MEMORY[0x1E4F929D8] sharedInstance];
    v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_us");
    v169[16] = v135;
    v168[17] = @"AutojoinScanDuration";
    v134 = [MEMORY[0x1E4F929D8] sharedInstance];
    v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[17] = v133;
    v168[18] = @"LocationScanDuration";
    v132 = [MEMORY[0x1E4F929D8] sharedInstance];
    v131 = objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[18] = v131;
    v168[19] = @"PipelineScanDuration";
    v130 = [MEMORY[0x1E4F929D8] sharedInstance];
    v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[19] = v129;
    v168[20] = @"SetupScanDuration";
    v128 = [MEMORY[0x1E4F929D8] sharedInstance];
    v127 = objc_msgSend(v128, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[20] = v127;
    v168[21] = @"UnknownScanDuration";
    v126 = [MEMORY[0x1E4F929D8] sharedInstance];
    v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[21] = v125;
    v168[22] = @"AWDLTXDuration";
    v124 = [MEMORY[0x1E4F929D8] sharedInstance];
    v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[22] = v123;
    v168[23] = @"AWDLRXDuration";
    v122 = [MEMORY[0x1E4F929D8] sharedInstance];
    v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[23] = v121;
    v168[24] = @"AWDLAWDuration";
    v120 = [MEMORY[0x1E4F929D8] sharedInstance];
    v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[24] = v119;
    v168[25] = @"AWDLScanDuration";
    v118 = [MEMORY[0x1E4F929D8] sharedInstance];
    v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_s");
    v169[25] = v117;
    v168[26] = @"CurrentChannel";
    v116 = [MEMORY[0x1E4F929D8] sharedInstance];
    v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
    v169[26] = v115;
    v168[27] = @"CurrentSSID";
    v114 = [MEMORY[0x1E4F929D8] sharedInstance];
    v113 = objc_msgSend(v114, "commonTypeDict_StringFormat");
    v169[27] = v113;
    v168[28] = @"CurrentBandwidth";
    v112 = [MEMORY[0x1E4F929D8] sharedInstance];
    v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v169[28] = v111;
    v168[29] = @"WifiPowered";
    v110 = [MEMORY[0x1E4F929D8] sharedInstance];
    v109 = objc_msgSend(v110, "commonTypeDict_BoolFormat");
    v169[29] = v109;
    v168[30] = @"WowEnabled";
    v73 = [MEMORY[0x1E4F929D8] sharedInstance];
    v108 = objc_msgSend(v73, "commonTypeDict_BoolFormat");
    v169[30] = v108;
    v168[31] = @"SISOTXDuration";
    v107 = [MEMORY[0x1E4F929D8] sharedInstance];
    v69 = objc_msgSend(v107, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[31] = v69;
    v168[32] = @"MIMOTXDuration";
    v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[32] = v67;
    v168[33] = @"MIMORXDuration";
    v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    v40 = objc_msgSend(v39, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[33] = v40;
    v168[34] = @"SISORXDuration";
    v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    v42 = objc_msgSend(v41, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[34] = v42;
    v168[35] = @"MIMOCSDuration";
    v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v43, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[35] = v44;
    v168[36] = @"SISOCSDuration";
    v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v45, "commonTypeDict_IntegerFormat_withUnit_ms");
    v169[36] = v46;
    v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v169 forKeys:v168 count:37];
    v173[1] = v47;
    id v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v173 forKeys:v172 count:2];

    v11 = v73;
    v13 = v77;

    uint64_t v14 = (void *)v81;
    v15 = v85;

    uint64_t v16 = (void *)v93;
    v17 = v97;

    uint64_t v12 = (void *)v89;
    uint64_t v18 = v101;

    uint64_t v19 = (void *)v105;
    goto LABEL_6;
  }
  v166[0] = *MEMORY[0x1E4F92C50];
  uint64_t v164 = *MEMORY[0x1E4F92CD0];
  v165 = &unk_1F4011FF8;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v165 forKeys:&v164 count:1];
  v167[0] = v19;
  v166[1] = *MEMORY[0x1E4F92CA8];
  v162[0] = @"TimeDuration";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v12 = objc_msgSend(v18, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[0] = v12;
  v162[1] = @"PMDuration";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[1] = v16;
  v162[2] = @"MPCDuration";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[2] = v14;
  v162[3] = @"TXDuration";
  v13 = [MEMORY[0x1E4F929D8] sharedInstance];
  v161 = objc_msgSend(v13, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[3] = v161;
  v162[4] = @"RXDuration";
  v160 = [MEMORY[0x1E4F929D8] sharedInstance];
  v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[4] = v159;
  v162[5] = @"HSICSuspendDuration";
  v158 = [MEMORY[0x1E4F929D8] sharedInstance];
  v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[5] = v157;
  v162[6] = @"HSICActiveDuration";
  v156 = [MEMORY[0x1E4F929D8] sharedInstance];
  v155 = objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[6] = v155;
  v162[7] = @"PNOScanSSIDDuration";
  v154 = [MEMORY[0x1E4F929D8] sharedInstance];
  v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[7] = v153;
  v162[8] = @"PNOBSSIDDuration";
  v152 = [MEMORY[0x1E4F929D8] sharedInstance];
  v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[8] = v151;
  v162[9] = @"RoamScanDuration";
  v150 = [MEMORY[0x1E4F929D8] sharedInstance];
  v149 = objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[9] = v149;
  v162[10] = @"AssociatedScanDuration";
  v148 = [MEMORY[0x1E4F929D8] sharedInstance];
  v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[10] = v147;
  v162[11] = @"OtherScanDuration";
  v146 = [MEMORY[0x1E4F929D8] sharedInstance];
  v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[11] = v145;
  v162[12] = @"UserScanDuration";
  v144 = [MEMORY[0x1E4F929D8] sharedInstance];
  v143 = objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[12] = v143;
  v162[13] = @"FRTSDuration";
  v142 = [MEMORY[0x1E4F929D8] sharedInstance];
  v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_ms");
  v163[13] = v141;
  v162[14] = @"PCIESuspendDuration";
  v140 = [MEMORY[0x1E4F929D8] sharedInstance];
  v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_us");
  v163[14] = v139;
  v162[15] = @"PCIEActiveDuration";
  v138 = [MEMORY[0x1E4F929D8] sharedInstance];
  v137 = objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_us");
  v163[15] = v137;
  v162[16] = @"PCIEPERSTDuration";
  v136 = [MEMORY[0x1E4F929D8] sharedInstance];
  v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_us");
  v163[16] = v135;
  v162[17] = @"AutojoinScanDuration";
  v134 = [MEMORY[0x1E4F929D8] sharedInstance];
  v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_ms");
  v163[17] = v133;
  v162[18] = @"LocationScanDuration";
  v132 = [MEMORY[0x1E4F929D8] sharedInstance];
  v131 = objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_ms");
  v163[18] = v131;
  v162[19] = @"PipelineScanDuration";
  v130 = [MEMORY[0x1E4F929D8] sharedInstance];
  v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_ms");
  v163[19] = v129;
  v162[20] = @"SetupScanDuration";
  v128 = [MEMORY[0x1E4F929D8] sharedInstance];
  v127 = objc_msgSend(v128, "commonTypeDict_IntegerFormat_withUnit_ms");
  v163[20] = v127;
  v162[21] = @"UnknownScanDuration";
  v126 = [MEMORY[0x1E4F929D8] sharedInstance];
  v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_ms");
  v163[21] = v125;
  v162[22] = @"AWDLTXDuration";
  v124 = [MEMORY[0x1E4F929D8] sharedInstance];
  v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat_withUnit_ms");
  v163[22] = v123;
  v162[23] = @"AWDLRXDuration";
  v122 = [MEMORY[0x1E4F929D8] sharedInstance];
  v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_ms");
  v163[23] = v121;
  v162[24] = @"AWDLAWDuration";
  v120 = [MEMORY[0x1E4F929D8] sharedInstance];
  v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[24] = v119;
  v162[25] = @"AWDLScanDuration";
  v118 = [MEMORY[0x1E4F929D8] sharedInstance];
  v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_s");
  v163[25] = v117;
  v162[26] = @"CurrentChannel";
  v116 = [MEMORY[0x1E4F929D8] sharedInstance];
  v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
  v163[26] = v115;
  v162[27] = @"CurrentSSID";
  v114 = [MEMORY[0x1E4F929D8] sharedInstance];
  v113 = objc_msgSend(v114, "commonTypeDict_StringFormat");
  v163[27] = v113;
  v162[28] = @"CurrentBandwidth";
  v112 = [MEMORY[0x1E4F929D8] sharedInstance];
  v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
  v163[28] = v111;
  v162[29] = @"WifiPowered";
  v110 = [MEMORY[0x1E4F929D8] sharedInstance];
  v109 = objc_msgSend(v110, "commonTypeDict_BoolFormat");
  v163[29] = v109;
  v162[30] = @"WowEnabled";
  v11 = [MEMORY[0x1E4F929D8] sharedInstance];
  v108 = objc_msgSend(v11, "commonTypeDict_BoolFormat");
  v163[30] = v108;
  v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v163 forKeys:v162 count:31];
  v167[1] = v107;
  id v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v167 forKeys:v166 count:2];
LABEL_7:

  return v106;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)setWifiManager:(__WiFiManagerClient *)a3
{
  if ([(PLWifiAgent *)self wifiManager] != a3)
  {
    if ([(PLWifiAgent *)self wifiManager])
    {
      [(PLWifiAgent *)self wifiManager];
      WiFiManagerClientRegisterDeviceAttachmentCallback();
      [(PLWifiAgent *)self wifiManager];
      CFRunLoopGetMain();
      WiFiManagerClientUnscheduleFromRunLoop();
    }
    self->_wifiManager = a3;
    if ([(PLWifiAgent *)self wifiManager])
    {
      [(PLWifiAgent *)self wifiManager];
      CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop();
      [(PLWifiAgent *)self wifiManager];
      WiFiManagerClientRegisterDeviceAttachmentCallback();
      [(PLWifiAgent *)self findWifiDevice];
    }
    else if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __30__PLWifiAgent_setWifiManager___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (setWifiManager__defaultOnce != -1) {
        dispatch_once(&setWifiManager__defaultOnce, block);
      }
      if (setWifiManager__classDebugEnabled)
      {
        uint64_t v6 = [NSString stringWithFormat:@"WARNING: Was passed an invalid wifi manager reference"];
        v7 = (void *)MEMORY[0x1E4F929B8];
        v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        v9 = [v8 lastPathComponent];
        uint64_t v10 = [NSString stringWithUTF8String:"-[PLWifiAgent setWifiManager:]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:2231];

        v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
  }
}

uint64_t __30__PLWifiAgent_setWifiManager___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  setWifiManager__classDebugEnabled = result;
  return result;
}

- (void)setWiFiHotspotDevice:(__WiFiDeviceClient *)a3
{
  if ([(PLWifiAgent *)self wifiHotspotDevice] != a3)
  {
    if ([(PLWifiAgent *)self wifiHotspotDevice])
    {
      [(PLWifiAgent *)self wifiHotspotDevice];
      WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback();
    }
    self->_wifiHotspotDevice = a3;
    if ([(PLWifiAgent *)self wifiHotspotDevice])
    {
      [(PLWifiAgent *)self wifiHotspotDevice];
      WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback();
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v5 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __36__PLWifiAgent_setWiFiHotspotDevice___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v5;
        if (setWiFiHotspotDevice__defaultOnce != -1) {
          dispatch_once(&setWiFiHotspotDevice__defaultOnce, block);
        }
        if (setWiFiHotspotDevice__classDebugEnabled)
        {
          uint64_t v6 = [NSString stringWithFormat:@"WARNING: set wifi hotspot device reference"];
          v7 = (void *)MEMORY[0x1E4F929B8];
          v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
          v9 = [v8 lastPathComponent];
          uint64_t v10 = [NSString stringWithUTF8String:"-[PLWifiAgent setWiFiHotspotDevice:]"];
          [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:2252];

          v11 = PLLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
LABEL_17:
        }
      }
    }
    else if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __36__PLWifiAgent_setWiFiHotspotDevice___block_invoke_726;
      uint64_t v20 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v21 = v12;
      if (setWiFiHotspotDevice__defaultOnce_724 != -1) {
        dispatch_once(&setWiFiHotspotDevice__defaultOnce_724, &v17);
      }
      if (setWiFiHotspotDevice__classDebugEnabled_725)
      {
        uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"WARNING: Was passed an invalid wifi hotspot device reference", v17, v18, v19, v20, v21);
        v13 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        v15 = [v14 lastPathComponent];
        uint64_t v16 = [NSString stringWithUTF8String:"-[PLWifiAgent setWiFiHotspotDevice:]"];
        [v13 logMessage:v6 fromFile:v15 fromFunction:v16 fromLineNumber:2254];

        v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        goto LABEL_17;
      }
    }
  }
}

uint64_t __36__PLWifiAgent_setWiFiHotspotDevice___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  setWiFiHotspotDevice__classDebugEnabled = result;
  return result;
}

uint64_t __36__PLWifiAgent_setWiFiHotspotDevice___block_invoke_726(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  setWiFiHotspotDevice__classDebugEnabled_725 = result;
  return result;
}

- (void)setWiFiAWDLDevice:(__WiFiDeviceClient *)a3
{
  if ([(PLWifiAgent *)self wifiAwdlDevice] != a3)
  {
    if ([(PLWifiAgent *)self wifiAwdlDevice])
    {
      [(PLWifiAgent *)self wifiAwdlDevice];
      WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback();
    }
    self->_wifiAwdlDevice = a3;
    if ([(PLWifiAgent *)self wifiAwdlDevice])
    {
      [(PLWifiAgent *)self wifiAwdlDevice];
      WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback();
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v5 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __33__PLWifiAgent_setWiFiAWDLDevice___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v5;
        if (setWiFiAWDLDevice__defaultOnce != -1) {
          dispatch_once(&setWiFiAWDLDevice__defaultOnce, block);
        }
        if (setWiFiAWDLDevice__classDebugEnabled)
        {
          uint64_t v6 = [NSString stringWithFormat:@"WARNING: set wifi awdl device reference"];
          v7 = (void *)MEMORY[0x1E4F929B8];
          v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
          v9 = [v8 lastPathComponent];
          uint64_t v10 = [NSString stringWithUTF8String:"-[PLWifiAgent setWiFiAWDLDevice:]"];
          [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:2274];

          v11 = PLLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
LABEL_17:
        }
      }
    }
    else if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __33__PLWifiAgent_setWiFiAWDLDevice___block_invoke_735;
      uint64_t v20 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v21 = v12;
      if (setWiFiAWDLDevice__defaultOnce_733 != -1) {
        dispatch_once(&setWiFiAWDLDevice__defaultOnce_733, &v17);
      }
      if (setWiFiAWDLDevice__classDebugEnabled_734)
      {
        uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"WARNING: Was passed an invalid wifi awdl device reference", v17, v18, v19, v20, v21);
        v13 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        v15 = [v14 lastPathComponent];
        uint64_t v16 = [NSString stringWithUTF8String:"-[PLWifiAgent setWiFiAWDLDevice:]"];
        [v13 logMessage:v6 fromFile:v15 fromFunction:v16 fromLineNumber:2276];

        v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        goto LABEL_17;
      }
    }
  }
}

uint64_t __33__PLWifiAgent_setWiFiAWDLDevice___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  setWiFiAWDLDevice__classDebugEnabled = result;
  return result;
}

uint64_t __33__PLWifiAgent_setWiFiAWDLDevice___block_invoke_735(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  setWiFiAWDLDevice__classDebugEnabled_734 = result;
  return result;
}

- (void)setWifiDevice:(__WiFiDeviceClient *)a3
{
  if ([(PLWifiAgent *)self wifiDevice] != a3)
  {
    if ([(PLWifiAgent *)self wifiDevice])
    {
      [(PLWifiAgent *)self wifiDevice];
      WiFiDeviceClientRegisterPowerCallback();
      [(PLWifiAgent *)self wifiDevice];
      WiFiDeviceClientRegisterExtendedLinkCallback();
      [(PLWifiAgent *)self wifiDevice];
      WiFiDeviceClientRegisterDeviceAvailableCallback();
      [(PLWifiAgent *)self wifiDevice];
      WiFiDeviceClientRegisterScanUpdateCallback();
      if ([(PLWifiAgent *)self wifiManager])
      {
        [(PLWifiAgent *)self wifiManager];
        WiFiManagerClientRegisterUserAutoJoinStateChangedCallback();
      }
      if ([MEMORY[0x1E4F929C0] fullMode])
      {
        [(PLWifiAgent *)self wifiDevice];
        WiFiDeviceClientRegisterLQMCallback();
      }
    }
    self->_wifiDevice = a3;
    if ([(PLWifiAgent *)self wifiDevice])
    {
      [(PLWifiAgent *)self wifiDevice];
      WiFiDeviceClientRegisterPowerCallback();
      [(PLWifiAgent *)self wifiDevice];
      WiFiDeviceClientRegisterExtendedLinkCallback();
      [(PLWifiAgent *)self wifiDevice];
      WiFiDeviceClientRegisterDeviceAvailableCallback();
      if (([MEMORY[0x1E4F929C0] taskMode] & 1) != 0
        || [MEMORY[0x1E4F929C0] fullMode])
      {
        [(PLWifiAgent *)self wifiDevice];
        WiFiDeviceClientRegisterScanUpdateCallback();
      }
      if ([(PLWifiAgent *)self wifiManager])
      {
        [(PLWifiAgent *)self wifiManager];
        WiFiManagerClientRegisterUserAutoJoinStateChangedCallback();
      }
      if ([MEMORY[0x1E4F929C0] fullMode])
      {
        [(PLWifiAgent *)self wifiDevice];
        WiFiDeviceClientRegisterLQMCallback();
      }
      [(PLWifiAgent *)self logEventForwardModuleInfo];
    }
    else if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __29__PLWifiAgent_setWifiDevice___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (setWifiDevice__defaultOnce != -1) {
        dispatch_once(&setWifiDevice__defaultOnce, block);
      }
      if (setWifiDevice__classDebugEnabled)
      {
        uint64_t v6 = [NSString stringWithFormat:@"WARNING: Was passed an invalid wifi device reference"];
        v7 = (void *)MEMORY[0x1E4F929B8];
        v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        v9 = [v8 lastPathComponent];
        uint64_t v10 = [NSString stringWithUTF8String:"-[PLWifiAgent setWifiDevice:]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:2333];

        v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
  }
}

uint64_t __29__PLWifiAgent_setWifiDevice___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  setWifiDevice__classDebugEnabled = result;
  return result;
}

- (void)findWifiDevice
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F92000uLL;
  if (![(PLWifiAgent *)self wifiManager])
  {
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_58;
    }
    uint64_t v46 = objc_opt_class();
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __29__PLWifiAgent_findWifiDevice__block_invoke_771;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v46;
    if (findWifiDevice_defaultOnce_769 != -1) {
      dispatch_once(&findWifiDevice_defaultOnce_769, v52);
    }
    if (!findWifiDevice_classDebugEnabled_770)
    {
LABEL_58:
      v13 = 0;
      goto LABEL_59;
    }
    v40 = [NSString stringWithFormat:@"WARNING: No wifi manager set--this method should not be getting called"];
    v47 = (void *)MEMORY[0x1E4F929B8];
    v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
    v49 = [v48 lastPathComponent];
    v50 = [NSString stringWithUTF8String:"-[PLWifiAgent findWifiDevice]"];
    [v47 logMessage:v40 fromFile:v49 fromFunction:v50 fromLineNumber:2393];

    v45 = PLLogCommon();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }
    v13 = 0;
    goto LABEL_57;
  }
  [(PLWifiAgent *)self wifiManager];
  uint64_t v4 = (void *)WiFiManagerClientCopyDevices();
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    -[PLWifiAgent setWifiDevice:](self, "setWifiDevice:", [v5 objectAtIndex:0]);
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __29__PLWifiAgent_findWifiDevice__block_invoke;
    v57[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v57[4] = v6;
    if (findWifiDevice_defaultOnce != -1) {
      dispatch_once(&findWifiDevice_defaultOnce, v57);
    }
    if (findWifiDevice_classDebugEnabled)
    {
      v7 = [NSString stringWithFormat:@"WARNING: No wifi devices found"];
      v8 = (void *)MEMORY[0x1E4F929B8];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      uint64_t v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLWifiAgent findWifiDevice]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:2350];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [(PLWifiAgent *)self wifiManager];
  v13 = (void *)WiFiManagerClientCopyInterfaces();

  if (v13 && [v13 count])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __29__PLWifiAgent_findWifiDevice__block_invoke_747;
      v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v56[4] = v14;
      if (findWifiDevice_defaultOnce_745 != -1) {
        dispatch_once(&findWifiDevice_defaultOnce_745, v56);
      }
      if (findWifiDevice_classDebugEnabled_746)
      {
        v15 = objc_msgSend(NSString, "stringWithFormat:", @"WARNING: wifi devices found count: %lu", objc_msgSend(v13, "count"));
        uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        uint64_t v18 = [v17 lastPathComponent];
        uint64_t v19 = [NSString stringWithUTF8String:"-[PLWifiAgent findWifiDevice]"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:2358];

        uint64_t v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    if ([v13 count])
    {
      unint64_t v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v51 = v13;
      do
      {
        uint64_t v24 = [v13 objectAtIndex:v21];
        if (WiFiDeviceClientIsInterfaceAWDL())
        {
          if ([*(id *)(v3 + 2496) debugEnabled])
          {
            uint64_t v25 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __29__PLWifiAgent_findWifiDevice__block_invoke_753;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v25;
            if (findWifiDevice_defaultOnce_751 != -1) {
              dispatch_once(&findWifiDevice_defaultOnce_751, block);
            }
            if (findWifiDevice_classDebugEnabled_752)
            {
              v26 = [NSString stringWithFormat:@"WARNING: wifi devices found: %@", WiFiDeviceClientGetInterfaceName()];
              v27 = (void *)MEMORY[0x1E4F929B8];
              v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
              v29 = [v28 lastPathComponent];
              v30 = [NSString stringWithUTF8String:"-[PLWifiAgent findWifiDevice]"];
              [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:2366];

              v31 = PLLogCommon();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v59 = v26;
                _os_log_debug_impl(&dword_1E4220000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v3 = 0x1E4F92000uLL;
              v13 = v51;
            }
          }
          [(PLWifiAgent *)self setWiFiAWDLDevice:v24];
          int v22 = 1;
        }
        if (WiFiDeviceClientIsInterfaceHostAp())
        {
          if ([*(id *)(v3 + 2496) debugEnabled])
          {
            uint64_t v32 = objc_opt_class();
            v54[0] = MEMORY[0x1E4F143A8];
            v54[1] = 3221225472;
            v54[2] = __29__PLWifiAgent_findWifiDevice__block_invoke_759;
            v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v54[4] = v32;
            if (findWifiDevice_defaultOnce_757 != -1) {
              dispatch_once(&findWifiDevice_defaultOnce_757, v54);
            }
            if (findWifiDevice_classDebugEnabled_758)
            {
              v33 = [NSString stringWithFormat:@"WARNING: wifi hs devices found: %@", WiFiDeviceClientGetInterfaceName()];
              v34 = (void *)MEMORY[0x1E4F929B8];
              v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
              v36 = [v35 lastPathComponent];
              v37 = [NSString stringWithUTF8String:"-[PLWifiAgent findWifiDevice]"];
              [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:2374];

              v38 = PLLogCommon();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v59 = v33;
                _os_log_debug_impl(&dword_1E4220000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v3 = 0x1E4F92000;
              v13 = v51;
            }
          }
          [(PLWifiAgent *)self setWiFiHotspotDevice:v24];
          int v23 = 1;
        }
        if (v22 & v23) {
          break;
        }
        ++v21;
      }
      while ([v13 count] > v21);
    }
    goto LABEL_59;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v39 = objc_opt_class();
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __29__PLWifiAgent_findWifiDevice__block_invoke_765;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v39;
    if (findWifiDevice_defaultOnce_763 != -1) {
      dispatch_once(&findWifiDevice_defaultOnce_763, v53);
    }
    if (findWifiDevice_classDebugEnabled_764)
    {
      v40 = [NSString stringWithFormat:@"WARNING: No wifi interfaces found"];
      v41 = (void *)MEMORY[0x1E4F929B8];
      v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      v43 = [v42 lastPathComponent];
      v44 = [NSString stringWithUTF8String:"-[PLWifiAgent findWifiDevice]"];
      [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:2389];

      v45 = PLLogCommon();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
LABEL_57:
    }
  }
LABEL_59:
}

uint64_t __29__PLWifiAgent_findWifiDevice__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  findWifiDevice_classDebugEnabled = result;
  return result;
}

uint64_t __29__PLWifiAgent_findWifiDevice__block_invoke_747(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  findWifiDevice_classDebugEnabled_746 = result;
  return result;
}

uint64_t __29__PLWifiAgent_findWifiDevice__block_invoke_753(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  findWifiDevice_classDebugEnabled_752 = result;
  return result;
}

uint64_t __29__PLWifiAgent_findWifiDevice__block_invoke_759(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  findWifiDevice_classDebugEnabled_758 = result;
  return result;
}

uint64_t __29__PLWifiAgent_findWifiDevice__block_invoke_765(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  findWifiDevice_classDebugEnabled_764 = result;
  return result;
}

uint64_t __29__PLWifiAgent_findWifiDevice__block_invoke_771(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  findWifiDevice_classDebugEnabled_770 = result;
  return result;
}

- (PLWifiAgent)init
{
  v12.receiver = self;
  v12.super_class = (Class)PLWifiAgent;
  uint64_t v2 = [(PLAgent *)&v12 init];
  unint64_t v3 = v2;
  if (v2)
  {
    v2->_lastLoggedTimestamp = 0;
    v2->_autoJoinScanDuration = 0;
    v2->_locationScanDuration = 0;
    v2->_pipelineScanDuration = 0;
    v2->_setupScanDuration = 0;
    v2->_unknownScanDuration = 0;
    wifiChipset = v2->_wifiChipset;
    v2->_wifiChipset = 0;

    wifiManufacturer = v3->_wifiManufacturer;
    v3->_wifiManufacturer = 0;

    v3->_remainingAllowedRSSIEntryCount = 0;
    id v6 = objc_alloc(MEMORY[0x1E4F929E8]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __19__PLWifiAgent_init__block_invoke;
    v10[3] = &unk_1E6E47908;
    v7 = v3;
    v11 = v7;
    v8 = (void *)[v6 initWithOperator:v7 forEntryKey:@"ApplicationMetrics_RemoteControlSession_1_2" withBlock:v10];
    [(PLWifiAgent *)v7 setRemoteSessionCallback:v8];
  }
  return v3;
}

uint64_t __19__PLWifiAgent_init__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleRemoteSessionCallbackWithUserInfo:a2];
  }
  return result;
}

- (void)initOperatorDependancies
{
  v38[1] = *MEMORY[0x1E4F143B8];
  [(PLWifiAgent *)self setWifiManager:WiFiManagerClientCreate()];
  id v3 = objc_alloc(MEMORY[0x1E4F929A0]);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke;
  v34[3] = &unk_1E6E47908;
  void v34[4] = self;
  uint64_t v4 = (PLCFNotificationOperatorComposition *)[v3 initWithOperator:self forNotification:@"com.apple.airport.userNotification" requireState:1 withBlock:v34];
  notificationWiFiChanged = self->_notificationWiFiChanged;
  self->_notificationWiFiChanged = v4;

  if ([(PLOperator *)self isDebugEnabled])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F929E8]);
    v35[0] = &unk_1F400CEB0;
    v35[1] = &unk_1F400CEC8;
    v36[0] = &unk_1F4011FB8;
    v36[1] = &unk_1F400CEE0;
    v37 = @"Level";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
    v38[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    void v33[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_803;
    v33[3] = &unk_1E6E47908;
    v33[4] = self;
    v9 = (PLEntryNotificationOperatorComposition *)[v6 initWithOperator:self forEntryKey:@"PLBatteryAgent_EventBackward_Battery" withFilter:v8 withBlock:v33];
    batteryLevelChanged = self->_batteryLevelChanged;
    self->_batteryLevelChanged = v9;
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  void v32[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_2_804;
  void v32[3] = &unk_1E6E47908;
  void v32[4] = self;
  v11 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v32];
  sbcLevelChanged = self->_sbcLevelChanged;
  self->_sbcLevelChanged = v11;

  id v13 = objc_alloc(MEMORY[0x1E4F929E8]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  void v31[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_811;
  void v31[3] = &unk_1E6E47908;
  v31[4] = self;
  uint64_t v14 = (void *)[v13 initWithOperator:self forEntryKey:@"PLSleepWakeAgent_EventForward_PowerState" withBlock:v31];
  [(PLWifiAgent *)self setDeviceWake:v14];
  void block[5] = MEMORY[0x1E4F143A8];
  block[6] = 3221225472;
  block[7] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_819;
  block[8] = &unk_1E6E47F58;
  block[9] = self;
  block[10] = 0;
  if (!tcp_connection_fallback_watcher_create() && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_820;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v15;
    if (initOperatorDependancies_defaultOnce_0 != -1) {
      dispatch_once(&initOperatorDependancies_defaultOnce_0, block);
    }
    if (initOperatorDependancies_classDebugEnabled_0)
    {
      uint64_t v16 = [NSString stringWithFormat:@"Unable to create cell fallback observer"];
      uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      uint64_t v19 = [v18 lastPathComponent];
      uint64_t v20 = [NSString stringWithUTF8String:"-[PLWifiAgent initOperatorDependancies]"];
      [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:2548];

      unint64_t v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  int v22 = (PLNSNotificationOperatorComposition *)[objc_alloc(MEMORY[0x1E4F92A28]) initWithOperator:self forNotification:@"PLThermalMonitorNotification" withBlock:&__block_literal_global_830];
  thermalMonitorListener = self->_thermalMonitorListener;
  self->_thermalMonitorListener = v22;

  id v24 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  void v29[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_841;
  v29[3] = &unk_1E6E47740;
  v29[4] = self;
  uint64_t v25 = (PLXPCListenerOperatorComposition *)[v24 initWithOperator:self withRegistration:&unk_1F400F858 withBlock:v29];
  remoteControlSessionListener = self->_remoteControlSessionListener;
  self->_remoteControlSessionListener = v25;

  if ([(PLWifiAgent *)self hasWiFi])
  {
    v27 = (WiFiP2PAWDLStateMonitor *)objc_alloc_init(MEMORY[0x1E4FB6FD8]);
    monitor = self->_monitor;
    self->_monitor = v27;
  }
}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_defaultOnce != -1) {
      dispatch_once(&kPLWifiAgentEventForwardWifiAssist_block_invoke_defaultOnce, block);
    }
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_classDebugEnabled)
    {
      v7 = [NSString stringWithFormat:@"Wifi Application Key Logger: %@ = %@", v5, v4];
      v8 = (void *)MEMORY[0x1E4F929B8];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      uint64_t v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLWifiAgent initOperatorDependancies]_block_invoke"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:2478];

      objc_super v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __39__PLWifiAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLWifiAgentEventForwardWifiAssist_block_invoke_classDebugEnabled = result;
  return result;
}

uint64_t __39__PLWifiAgent_initOperatorDependancies__block_invoke_803(uint64_t a1)
{
  [*(id *)(a1 + 32) log];
  uint64_t result = [MEMORY[0x1E4F92A38] isHomePod];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 writeModeledPower];
  }
  return result;
}

uint64_t __39__PLWifiAgent_initOperatorDependancies__block_invoke_2_804(uint64_t a1)
{
  [*(id *)(a1 + 32) setRemainingAllowedRSSIEntryCount:3];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_3;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_2_defaultOnce != -1) {
      dispatch_once(&kPLWifiAgentEventForwardWifiAssist_block_invoke_2_defaultOnce, block);
    }
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_2_classDebugEnabled)
    {
      id v3 = [NSString stringWithFormat:@"Logging on mac"];
      id v4 = (void *)MEMORY[0x1E4F929B8];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      uint64_t v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLWifiAgent initOperatorDependancies]_block_invoke_2"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:2497];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) log];
  uint64_t result = [MEMORY[0x1E4F92A38] isHomePod];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) writeModeledPower];
  }
  return result;
}

uint64_t __39__PLWifiAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLWifiAgentEventForwardWifiAssist_block_invoke_2_classDebugEnabled = result;
  return result;
}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke_811(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = [a2 objectForKey:@"entry"];
    id v3 = v2;
    if (v2)
    {
      [v2 objectForKeyedSubscript:@"Reason"];
    }
    else if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_2_815;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (kPLWifiAgentEventForwardWifiAssist_block_invoke_3_defaultOnce != -1) {
        dispatch_once(&kPLWifiAgentEventForwardWifiAssist_block_invoke_3_defaultOnce, block);
      }
      if (kPLWifiAgentEventForwardWifiAssist_block_invoke_3_classDebugEnabled)
      {
        id v5 = [NSString stringWithFormat:@"WARNING: No entry object associated with SleepWake entry"];
        uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
        v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        v8 = [v7 lastPathComponent];
        v9 = [NSString stringWithUTF8String:"-[PLWifiAgent initOperatorDependancies]_block_invoke"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:2511];

        uint64_t v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
  }
}

uint64_t __39__PLWifiAgent_initOperatorDependancies__block_invoke_2_815(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLWifiAgentEventForwardWifiAssist_block_invoke_3_classDebugEnabled = result;
  return result;
}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke_819(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = tcp_fallback_watcher_fallback_inuse();
    id v3 = *(void **)(a1 + 32);
    [v3 logEventForwardWifiAssist:v2];
  }
  else
  {
    uint64_t v4 = PLLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__PLWifiAgent_initOperatorDependancies__block_invoke_819_cold_1();
    }
  }
}

uint64_t __39__PLWifiAgent_initOperatorDependancies__block_invoke_820(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  initOperatorDependancies_classDebugEnabled_0 = result;
  return result;
}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke_828(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __41__PLCameraAgent_initOperatorDependancies__block_invoke_172_cold_1();
  }
}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke_841(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  v7 = PLLogWifi();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __39__PLWifiAgent_initOperatorDependancies__block_invoke_841_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointRemoteControlSession:v6];
}

- (BOOL)isWiFiPowered
{
  BOOL v3 = [(PLWifiAgent *)self hasWiFi];
  if (v3)
  {
    [(PLWifiAgent *)self wifiDevice];
    LOBYTE(v3) = WiFiDeviceClientGetPower() != 0;
  }
  return v3;
}

- (BOOL)hasWiFi
{
  BOOL v3 = [(PLWifiAgent *)self wifiManager];
  if (v3) {
    LOBYTE(v3) = [(PLWifiAgent *)self wifiDevice] != 0;
  }
  return (char)v3;
}

- (BOOL)isWowSupported
{
  BOOL v3 = [(PLWifiAgent *)self hasWiFi];
  if (v3)
  {
    [(PLWifiAgent *)self wifiManager];
    LOBYTE(v3) = WiFiManagerClientGetWoWCapability() != 0;
  }
  return v3;
}

- (BOOL)isWowEnabled
{
  BOOL v3 = [(PLWifiAgent *)self isWowSupported];
  if (v3)
  {
    [(PLWifiAgent *)self wifiManager];
    LOBYTE(v3) = WiFiManagerClientGetWoWState() != 0;
  }
  return v3;
}

- (unint64_t)getCurrentChannelWidth:(__WiFiNetwork *)a3
{
  CFNumberRef Property = (const __CFNumber *)WiFiNetworkGetProperty();
  if (Property)
  {
    int valuePtr = 0;
    CFNumberGetValue(Property, kCFNumberSInt32Type, &valuePtr);
    if ((valuePtr & 2) != 0)
    {
      return 20;
    }
    else
    {
      unint64_t v4 = 80;
      uint64_t v5 = 10;
      uint64_t v6 = 160;
      if ((valuePtr & 0x800) == 0) {
        uint64_t v6 = 0;
      }
      if ((valuePtr & 1) == 0) {
        uint64_t v5 = v6;
      }
      if ((valuePtr & 0x400) == 0) {
        unint64_t v4 = v5;
      }
      if ((valuePtr & 4) != 0) {
        return 40;
      }
      else {
        return v4;
      }
    }
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v8 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__PLWifiAgent_getCurrentChannelWidth___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v8;
      if (getCurrentChannelWidth__defaultOnce != -1) {
        dispatch_once(&getCurrentChannelWidth__defaultOnce, block);
      }
      if (getCurrentChannelWidth__classDebugEnabled)
      {
        v9 = [NSString stringWithFormat:@"channel width flag is null"];
        uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
        v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        objc_super v12 = [v11 lastPathComponent];
        id v13 = [NSString stringWithUTF8String:"-[PLWifiAgent getCurrentChannelWidth:]"];
        [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:2645];

        uint64_t v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    return 0;
  }
}

uint64_t __38__PLWifiAgent_getCurrentChannelWidth___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getCurrentChannelWidth__classDebugEnabled = result;
  return result;
}

- (id)decodeWifiEventLinkReason:(unsigned int)a3
{
  if (a3 - 1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"other(%u)", *(void *)&a3);
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v3 = off_1E6E49410[a3 - 1];
  }
  return v3;
}

+ (BOOL)isNonUDMMac
{
  return 0;
}

- (void)logFromWiFiNoAvailableCallback:(id)a3 withAvailability:(BOOL)a4 withWakeParams:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __78__PLWifiAgent_logFromWiFiNoAvailableCallback_withAvailability_withWakeParams___block_invoke;
    v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = v8;
    if (logFromWiFiNoAvailableCallback_withAvailability_withWakeParams__defaultOnce != -1) {
      dispatch_once(&logFromWiFiNoAvailableCallback_withAvailability_withWakeParams__defaultOnce, v20);
    }
    if (logFromWiFiNoAvailableCallback_withAvailability_withWakeParams__classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"before dispatch WiFi availability= %d:, wakeparams=%@", v5, v7];
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      objc_super v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLWifiAgent logFromWiFiNoAvailableCallback:withAvailability:withWakeParams:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:2711];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v15 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PLWifiAgent_logFromWiFiNoAvailableCallback_withAvailability_withWakeParams___block_invoke_868;
  block[3] = &unk_1E6E493C8;
  BOOL v19 = v5;
  block[4] = self;
  id v18 = v7;
  id v16 = v7;
  dispatch_async(v15, block);
}

uint64_t __78__PLWifiAgent_logFromWiFiNoAvailableCallback_withAvailability_withWakeParams___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logFromWiFiNoAvailableCallback_withAvailability_withWakeParams__classDebugEnabled = result;
  return result;
}

void __78__PLWifiAgent_logFromWiFiNoAvailableCallback_withAvailability_withWakeParams___block_invoke_868(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4E7EF70]();
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) logEventBackwardWifiProperties:1];
    if (*(void *)(a1 + 40)) {
      objc_msgSend(*(id *)(a1 + 32), "logEventPointWake:");
    }
  }
}

- (void)logFromLinkChangeCallback:(id)a3 withStats:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PLWifiAgent_logFromLinkChangeCallback_withStats___block_invoke;
  block[3] = &unk_1E6E481B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __51__PLWifiAgent_logFromLinkChangeCallback_withStats___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4E7EF70]();
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PLWifiAgent_logFromLinkChangeCallback_withStats___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_4_defaultOnce != -1) {
      dispatch_once(&kPLWifiAgentEventForwardWifiAssist_block_invoke_4_defaultOnce, block);
    }
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_4_classDebugEnabled)
    {
      unint64_t v4 = NSString;
      BOOL v5 = [*(id *)(a1 + 32) className];
      id v6 = [v4 stringWithFormat:@"%@ got CFCallback %@", v5, *(void *)(a1 + 40)];

      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLWifiAgent logFromLinkChangeCallback:withStats:]_block_invoke"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:2728];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __51__PLWifiAgent_logFromLinkChangeCallback_withStats___block_invoke_874;
    void v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v19[4] = v12;
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_4_defaultOnce_872 != -1) {
      dispatch_once(&kPLWifiAgentEventForwardWifiAssist_block_invoke_4_defaultOnce_872, v19);
    }
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_4_classDebugEnabled_873)
    {
      id v13 = [NSString stringWithFormat:@"link change dic: %@", *(void *)(a1 + 48)];
      uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      id v16 = [v15 lastPathComponent];
      uint64_t v17 = [NSString stringWithUTF8String:"-[PLWifiAgent logFromLinkChangeCallback:withStats:]_block_invoke_2"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:2729];

      id v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) log];
}

uint64_t __51__PLWifiAgent_logFromLinkChangeCallback_withStats___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLWifiAgentEventForwardWifiAssist_block_invoke_4_classDebugEnabled = result;
  return result;
}

uint64_t __51__PLWifiAgent_logFromLinkChangeCallback_withStats___block_invoke_874(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLWifiAgentEventForwardWifiAssist_block_invoke_4_classDebugEnabled_873 = result;
  return result;
}

- (void)logFromAJCallback:(id)a3 withFlag:(unsigned __int8)a4 withStats:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PLOperator *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __52__PLWifiAgent_logFromAJCallback_withFlag_withStats___block_invoke;
  void v13[3] = &unk_1E6E48880;
  v13[4] = self;
  id v14 = v8;
  unsigned __int8 v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __52__PLWifiAgent_logFromAJCallback_withFlag_withStats___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4E7EF70]();
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PLWifiAgent_logFromAJCallback_withFlag_withStats___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_5_defaultOnce != -1) {
      dispatch_once(&kPLWifiAgentEventForwardWifiAssist_block_invoke_5_defaultOnce, block);
    }
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_5_classDebugEnabled)
    {
      unint64_t v4 = NSString;
      BOOL v5 = [*(id *)(a1 + 32) className];
      id v6 = [v4 stringWithFormat:@"%@ got AJCallback %@", v5, *(void *)(a1 + 40)];

      id v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLWifiAgent logFromAJCallback:withFlag:withStats:]_block_invoke"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:2757];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointJoin:*(unsigned __int8 *)(a1 + 56) withStats:*(void *)(a1 + 48)];
}

uint64_t __52__PLWifiAgent_logFromAJCallback_withFlag_withStats___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLWifiAgentEventForwardWifiAssist_block_invoke_5_classDebugEnabled = result;
  return result;
}

- (void)log
{
  [(PLWifiAgent *)self logEventBackwardWifiProperties:1];
  [(PLWifiAgent *)self logEventBackwardUserScanDuration];
  [(PLWifiAgent *)self logEventPointAWDLServicesAndPorts];
}

- (void)logEventPointWake:(id)a3
{
  id v4 = a3;
  if ([(PLWifiAgent *)self hasWiFi])
  {
    if (v4)
    {
      id v5 = v4;
      goto LABEL_11;
    }
    [(PLWifiAgent *)self wifiDevice];
    id v5 = (id)WiFiDeviceClientCopyProperty();
    if (v5)
    {
LABEL_11:
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v12 = objc_opt_class();
        v91[0] = MEMORY[0x1E4F143A8];
        v91[1] = 3221225472;
        v91[2] = __33__PLWifiAgent_logEventPointWake___block_invoke_896;
        v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v91[4] = v12;
        if (logEventPointWake__defaultOnce_894 != -1) {
          dispatch_once(&logEventPointWake__defaultOnce_894, v91);
        }
        if (logEventPointWake__classDebugEnabled_895)
        {
          id v13 = [NSString stringWithFormat:@"wake params = %@", v5];
          id v14 = (void *)MEMORY[0x1E4F929B8];
          id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
          unsigned __int8 v16 = [v15 lastPathComponent];
          uint64_t v17 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWake:]"];
          [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:2800];

          id v18 = PLLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      uint64_t v86 = self;
      BOOL v19 = [v5 objectForCFString:@"IO80211InterfaceWoWWakeUpCommand"];
      uint64_t v20 = [v5 objectForCFString:@"IO80211InterfaceWoWWakeUpData"];
      uint64_t v21 = [v5 objectForKey:@"IO80211InterfaceWoWWakeUpTCPKAWakeReason"];
      int v22 = [v5 objectForCFString:@"IO80211InterfaceWoWWakeUpTimeStamp"];
      [v22 doubleValue];
      double v24 = v23;

      uint64_t v25 = (void *)MEMORY[0x1E4F28ED0];
      v26 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v24];
      v27 = [v26 convertFromSystemToMonotonic];
      [v27 timeIntervalSince1970];
      uint64_t v28 = objc_msgSend(v25, "numberWithDouble:");

      v29 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Wake"];
      v30 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v29];
      [v30 setObject:v19 forKeyedSubscript:@"WakeReason"];
      v84 = (void *)v28;
      [v30 setObject:v28 forKeyedSubscript:@"WakeTime"];
      v85 = (void *)v21;
      uint64_t v31 = v21;
      id v11 = v20;
      [v30 setObject:v31 forKeyedSubscript:@"TCPKAWakeReason"];
      if (v20)
      {
        uint64_t v32 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[NSObject length](v20, "length"));
        [v30 setObject:v32 forKeyedSubscript:@"WakeLen"];
      }
      if (![v19 isEqualToString:@"DataFrame"])
      {
        if ([v19 isEqualToString:@"E_PFN_NET_FOUND"])
        {
          [(PLWifiAgent *)self logEventPointWakePNO:v20 withParams:v5 toEntry:v30];
        }
        else
        {
          if (![v19 isEqualToString:@"E_LINK"])
          {
            if (![MEMORY[0x1E4F929C0] debugEnabled]) {
              goto LABEL_58;
            }
            uint64_t v72 = objc_opt_class();
            v88[0] = MEMORY[0x1E4F143A8];
            v88[1] = 3221225472;
            v88[2] = __33__PLWifiAgent_logEventPointWake___block_invoke_960;
            v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v88[4] = v72;
            if (logEventPointWake__defaultOnce_958 != -1) {
              dispatch_once(&logEventPointWake__defaultOnce_958, v88);
            }
            if (!logEventPointWake__classDebugEnabled_959) {
              goto LABEL_58;
            }
            uint64_t v79 = v29;
            v82 = v19;
            v73 = [NSString stringWithFormat:@"WARNING: unrecognized wake reason: %@", v19];
            v74 = (void *)MEMORY[0x1E4F929B8];
            v75 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
            v76 = [v75 lastPathComponent];
            v77 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWake:]"];
            [v74 logMessage:v73 fromFile:v76 fromFunction:v77 fromLineNumber:2849];

            uint64_t v78 = PLLogCommon();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }

            BOOL v19 = v82;
            goto LABEL_57;
          }
          [(PLWifiAgent *)self logEventPointWakeLink:v20 withParams:v5 toEntry:v30];
        }
LABEL_58:
        [(PLOperator *)self logEntry:v30];

LABEL_59:
        goto LABEL_60;
      }
      uint64_t v79 = v29;
      [(PLWifiAgent *)self logEventPointWakeDataFrame:v20 withParams:v5 toEntry:v30];
      uint64_t v33 = [v30 objectForKeyedSubscript:@"tcp_dest_port"];
      id v80 = v4;
      uint64_t v81 = v19;
      if (v33
        && (v34 = (void *)v33,
            [v30 objectForKeyedSubscript:@"tcp_source_port"],
            v35 = objc_claimAutoreleasedReturnValue(),
            v35,
            v34,
            v35))
      {
        v36 = (void *)MEMORY[0x1E4F28ED0];
        v37 = [v30 objectForKeyedSubscript:@"tcp_dest_port"];
        v83 = objc_msgSend(v36, "numberWithInteger:", objc_msgSend(v37, "integerValue"));

        v38 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v39 = @"tcp_source_port";
      }
      else
      {
        uint64_t v40 = [v30 objectForKeyedSubscript:@"udp_dest_port"];
        if (!v40
          || (v41 = (void *)v40,
              [v30 objectForKeyedSubscript:@"udp_source_port"],
              v42 = objc_claimAutoreleasedReturnValue(),
              v42,
              v41,
              !v42))
        {
          if (![MEMORY[0x1E4F929C0] debugEnabled]) {
            goto LABEL_46;
          }
          uint64_t v47 = objc_opt_class();
          v90[0] = MEMORY[0x1E4F143A8];
          v90[1] = 3221225472;
          v90[2] = __33__PLWifiAgent_logEventPointWake___block_invoke_932;
          v90[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v90[4] = v47;
          if (logEventPointWake__defaultOnce_930 != -1) {
            dispatch_once(&logEventPointWake__defaultOnce_930, v90);
          }
          if (!logEventPointWake__classDebugEnabled_931)
          {
LABEL_46:
            uint64_t v46 = 0;
            v83 = 0;
            goto LABEL_47;
          }
          v45 = [NSString stringWithFormat:@"WARNING: unsupported network protocol"];
          v48 = (void *)MEMORY[0x1E4F929B8];
          v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
          v50 = [v49 lastPathComponent];
          v51 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWake:]"];
          [v48 logMessage:v45 fromFile:v50 fromFunction:v51 fromLineNumber:2828];

          v52 = PLLogCommon();
          self = v86;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }

          uint64_t v46 = 0;
          v83 = 0;
LABEL_30:

LABEL_47:
          v58 = +[PLProcessPortMap sharedInstance];
          v59 = [v30 objectForKeyedSubscript:@"ip_destination"];
          uint64_t v60 = [v30 objectForKeyedSubscript:@"ip_source"];
          v61 = [v30 objectForKeyedSubscript:@"ip_protocol"];
          v62 = [v58 pidAndProcessNameForDestAddress:v59 withDestPort:v83 withSourceAddress:v60 withSourcePort:v46 withProtocol:v61];

          id v4 = v80;
          BOOL v19 = v81;
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v63 = objc_opt_class();
            v89[0] = MEMORY[0x1E4F143A8];
            v89[1] = 3221225472;
            v89[2] = __33__PLWifiAgent_logEventPointWake___block_invoke_948;
            v89[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v89[4] = v63;
            if (logEventPointWake__defaultOnce_946 != -1) {
              dispatch_once(&logEventPointWake__defaultOnce_946, v89);
            }
            if (logEventPointWake__classDebugEnabled_947)
            {
              id v87 = v5;
              v64 = [NSString stringWithFormat:@"pidAndProcessName=%@", v62];
              v65 = (void *)MEMORY[0x1E4F929B8];
              v66 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
              v67 = [v66 lastPathComponent];
              v68 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWake:]"];
              [v65 logMessage:v64 fromFile:v67 fromFunction:v68 fromLineNumber:2837];

              v69 = PLLogCommon();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
                __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
              }

              id v4 = v80;
              BOOL v19 = v81;
              id v5 = v87;
            }
          }
          if (v62)
          {
            v70 = [v62 pid];
            [v30 setObject:v70 forKeyedSubscript:@"PID"];

            v71 = [v62 processName];
            [v30 setObject:v71 forKeyedSubscript:@"ProcessName"];
          }
LABEL_57:
          v29 = v79;
          goto LABEL_58;
        }
        v43 = (void *)MEMORY[0x1E4F28ED0];
        v44 = [v30 objectForKeyedSubscript:@"udp_dest_port"];
        v83 = objc_msgSend(v43, "numberWithInteger:", objc_msgSend(v44, "integerValue"));

        v38 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v39 = @"udp_source_port";
      }
      v45 = [v30 objectForKeyedSubscript:v39];
      uint64_t v46 = objc_msgSend(v38, "numberWithInteger:", objc_msgSend(v45, "integerValue"));
      goto LABEL_30;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v53 = objc_opt_class();
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __33__PLWifiAgent_logEventPointWake___block_invoke_890;
      v92[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v92[4] = v53;
      if (logEventPointWake__defaultOnce_888 != -1) {
        dispatch_once(&logEventPointWake__defaultOnce_888, v92);
      }
      if (logEventPointWake__classDebugEnabled_889)
      {
        id v5 = [NSString stringWithFormat:@"WARNING: woke up for wlan but WoW wakeup parameters dictionary returned nil"];
        v54 = (void *)MEMORY[0x1E4F929B8];
        v55 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        v56 = [v55 lastPathComponent];
        v57 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWake:]"];
        [v54 logMessage:v5 fromFile:v56 fromFunction:v57 fromLineNumber:2798];

        id v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        goto LABEL_59;
      }
    }
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__PLWifiAgent_logEventPointWake___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (logEventPointWake__defaultOnce != -1) {
      dispatch_once(&logEventPointWake__defaultOnce, block);
    }
    if (logEventPointWake__classDebugEnabled)
    {
      id v5 = [NSString stringWithFormat:@"No wifi to log power properties about"];
      id v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWake:]"];
      [v7 logMessage:v5 fromFile:v9 fromFunction:v10 fromLineNumber:2784];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
      goto LABEL_59;
    }
  }
LABEL_60:
}

uint64_t __33__PLWifiAgent_logEventPointWake___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWake__classDebugEnabled = result;
  return result;
}

uint64_t __33__PLWifiAgent_logEventPointWake___block_invoke_890(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWake__classDebugEnabled_889 = result;
  return result;
}

uint64_t __33__PLWifiAgent_logEventPointWake___block_invoke_896(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWake__classDebugEnabled_895 = result;
  return result;
}

uint64_t __33__PLWifiAgent_logEventPointWake___block_invoke_932(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWake__classDebugEnabled_931 = result;
  return result;
}

uint64_t __33__PLWifiAgent_logEventPointWake___block_invoke_948(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWake__classDebugEnabled_947 = result;
  return result;
}

uint64_t __33__PLWifiAgent_logEventPointWake___block_invoke_960(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWake__classDebugEnabled_959 = result;
  return result;
}

- (void)logEventPointWakeDataFrame:(id)a3 withParams:(id)a4 toEntry:(id)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  if ((unint64_t)[v6 length] > 0xE)
  {
    [v6 getBytes:v89 length:14];
    id v15 = objc_msgSend(v6, "subdataWithRange:", 14, objc_msgSend(v6, "length") - 14);
    objc_msgSend(NSString, "stringWithFormat:", @"%02x:%02x:%02x:%02x:%02x:%02x;",
      v89[0],
      v89[1],
      v89[2],
      v89[3],
      v89[4],
    unsigned __int8 v16 = v89[5]);
    objc_msgSend(NSString, "stringWithFormat:", @"%02x:%02x:%02x:%02x:%02x:%02x;",
      v89[6],
      v89[7],
      v89[8],
      v89[9],
      v89[10],
    uint64_t v17 = v89[11]);
    id v18 = [MEMORY[0x1E4F92A30] decodeEtherType:bswap32(v90) >> 16];
    [v7 setObject:v17 forKeyedSubscript:@"RemoteMAC"];
    [v7 setObject:v16 forKeyedSubscript:@"LocalMAC"];
    [v7 setObject:v18 forKeyedSubscript:@"EtherType"];
    if (([v18 isEqualToString:@"IPv4"] & 1) != 0
      || [v18 isEqualToString:@"IPv6"])
    {
      BOOL v19 = [MEMORY[0x1E4F92A30] decodeIPPacket:v15 encryptedPath:0];
      int v20 = [MEMORY[0x1E4F929C0] debugEnabled];
      if (v19)
      {
        v83 = v15;
        v84 = v16;
        if (v20)
        {
          uint64_t v21 = objc_opt_class();
          v86[0] = MEMORY[0x1E4F143A8];
          v86[1] = 3221225472;
          v86[2] = __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke_994;
          v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v86[4] = v21;
          if (logEventPointWakeDataFrame_withParams_toEntry__defaultOnce_992 != -1) {
            dispatch_once(&logEventPointWakeDataFrame_withParams_toEntry__defaultOnce_992, v86);
          }
          if (logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled_993)
          {
            int v22 = [NSString stringWithFormat:@"Dictionary for IP: %@", v19];
            double v23 = (void *)MEMORY[0x1E4F929B8];
            double v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
            uint64_t v25 = [v24 lastPathComponent];
            v26 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWakeDataFrame:withParams:toEntry:]"];
            [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:2887];

            v27 = PLLogCommon();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }
          }
        }
        uint64_t v28 = [v19 objectForKeyedSubscript:@"destination"];
        [v7 setObject:v28 forKeyedSubscript:@"ip_destination"];

        v29 = [v19 objectForKeyedSubscript:@"source"];
        [v7 setObject:v29 forKeyedSubscript:@"ip_source"];

        v30 = [v19 objectForKeyedSubscript:@"protocol"];
        [v7 setObject:v30 forKeyedSubscript:@"ip_protocol"];

        uint64_t v31 = NSString;
        uint64_t v32 = [v19 objectForKeyedSubscript:@"version"];
        uint64_t v33 = [v31 stringWithFormat:@"%@", v32];
        [v7 setObject:v33 forKeyedSubscript:@"ip_version"];

        v34 = (void *)MEMORY[0x1E4F28ED0];
        v35 = [v19 objectForKeyedSubscript:@"seqNo"];
        v36 = objc_msgSend(v34, "numberWithUnsignedInt:", objc_msgSend(v35, "unsignedIntValue"));
        [v7 setObject:v36 forKeyedSubscript:@"seqNo"];

        v37 = (void *)MEMORY[0x1E4F28ED0];
        v38 = [v19 objectForKeyedSubscript:@"spi"];
        uint64_t v39 = objc_msgSend(v37, "numberWithUnsignedInt:", objc_msgSend(v38, "unsignedIntValue"));
        [v7 setObject:v39 forKeyedSubscript:@"spi"];

        uint64_t v40 = [v19 objectForKey:@"protocol"];
        LODWORD(v32) = [v40 isEqualToString:@"TCP"];

        if (v32)
        {
          v41 = NSString;
          v42 = [v19 objectForKeyedSubscript:@"protocol_info"];
          v43 = [v42 objectForKeyedSubscript:@"ack"];
          v44 = [v41 stringWithFormat:@"%@", v43];
          [v7 setObject:v44 forKeyedSubscript:@"tcp_ack"];

          v45 = NSString;
          uint64_t v46 = [v19 objectForKeyedSubscript:@"protocol_info"];
          uint64_t v47 = [v46 objectForKeyedSubscript:@"seq"];
          v48 = [v45 stringWithFormat:@"%@", v47];
          [v7 setObject:v48 forKeyedSubscript:@"tcp_seq"];

          v49 = NSString;
          v50 = [v19 objectForKeyedSubscript:@"protocol_info"];
          v51 = [v50 objectForKeyedSubscript:@"window"];
          v52 = [v49 stringWithFormat:@"%@", v51];
          [v7 setObject:v52 forKeyedSubscript:@"tcp_window"];

          uint64_t v53 = NSString;
          v54 = [v19 objectForKeyedSubscript:@"protocol_info"];
          v55 = [v54 objectForKeyedSubscript:@"control"];
          v56 = [v53 stringWithFormat:@"%@", v55];
          [v7 setObject:v56 forKeyedSubscript:@"tcp_control"];

          v57 = NSString;
          v58 = [v19 objectForKeyedSubscript:@"protocol_info"];
          v59 = [v58 objectForKeyedSubscript:@"dest_port"];
          uint64_t v60 = [v57 stringWithFormat:@"%@", v59];
          [v7 setObject:v60 forKeyedSubscript:@"tcp_dest_port"];

          v61 = NSString;
          v62 = [v19 objectForKeyedSubscript:@"protocol_info"];
          uint64_t v63 = [v62 objectForKeyedSubscript:@"source_port"];
          v64 = [v61 stringWithFormat:@"%@", v63];
          v65 = @"tcp_source_port";
        }
        else
        {
          v76 = [v19 objectForKey:@"protocol"];
          int v77 = [v76 isEqualToString:@"UDP"];

          if (!v77)
          {
            id v15 = v83;
            unsigned __int8 v16 = v84;
            goto LABEL_38;
          }
          uint64_t v78 = NSString;
          uint64_t v79 = [v19 objectForKeyedSubscript:@"protocol_info"];
          id v80 = [v79 objectForKeyedSubscript:@"dest_port"];
          uint64_t v81 = [v78 stringWithFormat:@"%@", v80];
          [v7 setObject:v81 forKeyedSubscript:@"udp_dest_port"];

          v82 = NSString;
          v62 = [v19 objectForKeyedSubscript:@"protocol_info"];
          uint64_t v63 = [v62 objectForKeyedSubscript:@"source_port"];
          v64 = [v82 stringWithFormat:@"%@", v63];
          v65 = @"udp_source_port";
        }
        [v7 setObject:v64 forKeyedSubscript:v65];
      }
      else
      {
        if (!v20) {
          goto LABEL_38;
        }
        uint64_t v66 = objc_opt_class();
        v87[0] = MEMORY[0x1E4F143A8];
        v87[1] = 3221225472;
        v87[2] = __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke_988;
        v87[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v87[4] = v66;
        if (logEventPointWakeDataFrame_withParams_toEntry__defaultOnce_986 != -1) {
          dispatch_once(&logEventPointWakeDataFrame_withParams_toEntry__defaultOnce_986, v87);
        }
        if (!logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled_987) {
          goto LABEL_38;
        }
        v83 = v15;
        v84 = v16;
        v62 = [NSString stringWithFormat:@"Unable to decode IP packet"];
        v67 = (void *)MEMORY[0x1E4F929B8];
        v68 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        v69 = [v68 lastPathComponent];
        v70 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWakeDataFrame:withParams:toEntry:]"];
        [v67 logMessage:v62 fromFile:v69 fromFunction:v70 fromLineNumber:2885];

        uint64_t v63 = PLLogCommon();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }

      id v15 = v83;
    }
    else
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_39;
      }
      uint64_t v71 = objc_opt_class();
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke_1057;
      v85[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v85[4] = v71;
      if (logEventPointWakeDataFrame_withParams_toEntry__defaultOnce_1055 != -1) {
        dispatch_once(&logEventPointWakeDataFrame_withParams_toEntry__defaultOnce_1055, v85);
      }
      if (!logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled_1056) {
        goto LABEL_39;
      }
      v84 = v16;
      BOOL v19 = [NSString stringWithFormat:@"Unrelated etherType: %@", v18];
      uint64_t v72 = (void *)MEMORY[0x1E4F929B8];
      v73 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      v74 = [v73 lastPathComponent];
      v75 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWakeDataFrame:withParams:toEntry:]"];
      [v72 logMessage:v19 fromFile:v74 fromFunction:v75 fromLineNumber:2912];

      v62 = PLLogCommon();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }

    unsigned __int8 v16 = v84;
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (logEventPointWakeDataFrame_withParams_toEntry__defaultOnce != -1) {
      dispatch_once(&logEventPointWakeDataFrame_withParams_toEntry__defaultOnce, block);
    }
    if (logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"WARNING: payload too short: length of %lu", objc_msgSend(v6, "length"));
      id v10 = (void *)MEMORY[0x1E4F929B8];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      uint64_t v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWakeDataFrame:withParams:toEntry:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:2859];

      id v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
LABEL_40:
}

uint64_t __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled = result;
  return result;
}

uint64_t __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke_988(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled_987 = result;
  return result;
}

uint64_t __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke_994(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled_993 = result;
  return result;
}

uint64_t __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke_1057(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled_1056 = result;
  return result;
}

- (void)logEventPointWakePNO:(id)a3 withParams:(id)a4 toEntry:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 objectForCFString:@"IO80211InterfaceWoWWakeUpCommand"];
  memset(v51, 0, 48);
  uint64_t v49 = 0;
  memset(v48, 0, sizeof(v48));
  memset(v50, 0, 44);
  id v44 = v7;
  v43 = (void *)v9;
  if ((unint64_t)[v7 length] > 0x67)
  {
    [v7 getBytes:v51 length:48];
    objc_msgSend(v7, "getBytes:range:", v48, 48, 56);
    if (v51[1] == 553648128)
    {
      uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v48[2]];
      [v8 setObject:v17 forKeyedSubscript:@"network_count"];

      int v18 = v48[2];
      if (v48[2] >= 5) {
        int v18 = 5;
      }
      v48[2] = v18;
      if (v18)
      {
        uint64_t v19 = 0;
        int v20 = 0;
        unint64_t v21 = 60;
        while (1)
        {
          v21 += 44;
          if ([v7 length] < v21) {
            break;
          }
          if (v19)
          {
            objc_msgSend(v7, "getBytes:range:", v50, 44 * (v19 - 1) + 104, 44);
          }
          else
          {
            long long v22 = *(_OWORD *)(((unint64_t)v48 | 0xC) + 0x10);
            v50[0] = *(_OWORD *)((unint64_t)v48 | 0xC);
            v50[1] = v22;
            *(_OWORD *)((char *)&v50[1] + 12) = *(_OWORD *)(((unint64_t)v48 | 0xC) + 0x1C);
          }
          unint64_t v23 = v19 + 1;
          if (BYTE7(v50[0]) >= 0x20u) {
            int v24 = 32;
          }
          else {
            int v24 = BYTE7(v50[0]);
          }
          BYTE7(v50[0]) = v24;
          __memcpy_chk();
          v52[v24] = 0;
          uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"%02x:%02x:%02x:%02x:%02x:%02x", LOBYTE(v50[0]), BYTE1(v50[0]), BYTE2(v50[0]), BYTE3(v50[0]), BYTE4(v50[0]), BYTE5(v50[0]));

          v26 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:BYTE6(v50[0])];
          v27 = objc_msgSend(NSString, "stringWithFormat:", @"network%d_channel", v19);
          [v8 setObject:v26 forKeyedSubscript:v27];

          uint64_t v28 = [NSString stringWithUTF8String:v52];
          v29 = objc_msgSend(NSString, "stringWithFormat:", @"network%d_ssid", v19);
          [v8 setObject:v28 forKeyedSubscript:v29];

          v30 = objc_msgSend(NSString, "stringWithFormat:", @"network%d_bssid", v19);
          [v8 setObject:v25 forKeyedSubscript:v30];

          uint64_t v31 = [MEMORY[0x1E4F28ED0] numberWithInt:SWORD4(v50[2])];
          uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"network%d_rssi", v19);
          [v8 setObject:v31 forKeyedSubscript:v32];

          ++v19;
          int v20 = v25;
          id v7 = v44;
          if (v23 >= v48[2]) {
            goto LABEL_31;
          }
        }
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_38;
        }
        uint64_t v38 = objc_opt_class();
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __55__PLWifiAgent_logEventPointWakePNO_withParams_toEntry___block_invoke_1075;
        v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v45[4] = v38;
        if (logEventPointWakePNO_withParams_toEntry__defaultOnce_1073 != -1) {
          dispatch_once(&logEventPointWakePNO_withParams_toEntry__defaultOnce_1073, v45);
        }
        if (!logEventPointWakePNO_withParams_toEntry__classDebugEnabled_1074)
        {
LABEL_38:
          uint64_t v25 = v20;
          goto LABEL_31;
        }
        id v11 = [NSString stringWithFormat:@"WoW wake payload too small to decode all PNO networks"];
        uint64_t v39 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        v41 = [v40 lastPathComponent];
        v42 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWakePNO:withParams:toEntry:]"];
        [v39 logMessage:v11 fromFile:v41 fromFunction:v42 fromLineNumber:2943];

        unsigned __int8 v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        goto LABEL_29;
      }
    }
    else if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v33 = objc_opt_class();
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __55__PLWifiAgent_logEventPointWakePNO_withParams_toEntry___block_invoke_1066;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v33;
      if (logEventPointWakePNO_withParams_toEntry__defaultOnce_1064 != -1) {
        dispatch_once(&logEventPointWakePNO_withParams_toEntry__defaultOnce_1064, v46);
      }
      if (logEventPointWakePNO_withParams_toEntry__classDebugEnabled_1065)
      {
        id v11 = [NSString stringWithFormat:@"WiFi Logger wl_event_msg_t.event_type (0x%x) and wow_wakeup_command (%@ 0x%x) don't match", bswap32(v51[1]), v9, 16];
        v34 = (void *)MEMORY[0x1E4F929B8];
        v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        v36 = [v35 lastPathComponent];
        v37 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWakePNO:withParams:toEntry:]"];
        [v34 logMessage:v11 fromFile:v36 fromFunction:v37 fromLineNumber:2933];

        unsigned __int8 v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        goto LABEL_28;
      }
    }
LABEL_30:
    uint64_t v25 = 0;
    goto LABEL_31;
  }
  if (![MEMORY[0x1E4F929C0] debugEnabled]) {
    goto LABEL_30;
  }
  uint64_t v10 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PLWifiAgent_logEventPointWakePNO_withParams_toEntry___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v10;
  if (logEventPointWakePNO_withParams_toEntry__defaultOnce != -1) {
    dispatch_once(&logEventPointWakePNO_withParams_toEntry__defaultOnce, block);
  }
  if (!logEventPointWakePNO_withParams_toEntry__classDebugEnabled) {
    goto LABEL_30;
  }
  id v11 = [NSString stringWithFormat:@"WoW wake payload too small to decode E_PFN_NET_FOUND"];
  uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
  id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
  id v14 = [v13 lastPathComponent];
  id v15 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWakePNO:withParams:toEntry:]"];
  [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:2925];

  unsigned __int8 v16 = PLLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
  }
LABEL_28:
  int v20 = 0;
LABEL_29:

  uint64_t v25 = v20;
  id v7 = v44;
LABEL_31:
}

uint64_t __55__PLWifiAgent_logEventPointWakePNO_withParams_toEntry___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWakePNO_withParams_toEntry__classDebugEnabled = result;
  return result;
}

uint64_t __55__PLWifiAgent_logEventPointWakePNO_withParams_toEntry___block_invoke_1066(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWakePNO_withParams_toEntry__classDebugEnabled_1065 = result;
  return result;
}

uint64_t __55__PLWifiAgent_logEventPointWakePNO_withParams_toEntry___block_invoke_1075(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWakePNO_withParams_toEntry__classDebugEnabled_1074 = result;
  return result;
}

- (void)logEventPointWakeLink:(id)a3 withParams:(id)a4 toEntry:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  memset(v27, 0, sizeof(v27));
  if ((unint64_t)[v7 length] > 0x2F)
  {
    [v7 getBytes:v27 length:48];
    if (DWORD1(v27[0]) == 0x10000000)
    {
      uint64_t v10 = [(PLWifiAgent *)self decodeWifiEventLinkReason:bswap32(HIDWORD(v27[0]))];
      [v8 setObject:v10 forKeyedSubscript:@"loss_reason"];
LABEL_17:

      goto LABEL_18;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      unint64_t v23 = __56__PLWifiAgent_logEventPointWakeLink_withParams_toEntry___block_invoke_1102;
      int v24 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v25 = v16;
      if (logEventPointWakeLink_withParams_toEntry__defaultOnce_1100 != -1) {
        dispatch_once(&logEventPointWakeLink_withParams_toEntry__defaultOnce_1100, &v21);
      }
      if (logEventPointWakeLink_withParams_toEntry__classDebugEnabled_1101)
      {
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"WiFi Logger wl_event_msg_t.event_type (0x%x) and wow_wakeup_command (0x%x) don't match", bswap32(DWORD1(v27[0])), 16, v21, v22, v23, v24, v25);
        uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
        int v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        uint64_t v19 = [v18 lastPathComponent];
        int v20 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWakeLink:withParams:toEntry:]"];
        [v17 logMessage:v10 fromFile:v19 fromFunction:v20 fromLineNumber:2983];

        id v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        goto LABEL_16;
      }
    }
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PLWifiAgent_logEventPointWakeLink_withParams_toEntry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (logEventPointWakeLink_withParams_toEntry__defaultOnce != -1) {
      dispatch_once(&logEventPointWakeLink_withParams_toEntry__defaultOnce, block);
    }
    if (logEventPointWakeLink_withParams_toEntry__classDebugEnabled)
    {
      uint64_t v10 = [NSString stringWithFormat:@"WoW wake payload too small to decode E_LINK"];
      id v11 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      id v13 = [v12 lastPathComponent];
      id v14 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointWakeLink:withParams:toEntry:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:2974];

      id v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
LABEL_16:

      goto LABEL_17;
    }
  }
LABEL_18:
}

uint64_t __56__PLWifiAgent_logEventPointWakeLink_withParams_toEntry___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWakeLink_withParams_toEntry__classDebugEnabled = result;
  return result;
}

uint64_t __56__PLWifiAgent_logEventPointWakeLink_withParams_toEntry___block_invoke_1102(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointWakeLink_withParams_toEntry__classDebugEnabled_1101 = result;
  return result;
}

- (void)logEventPointJoin:(unsigned __int8)a3 withStats:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  if ([(PLWifiAgent *)self hasWiFi])
  {
    if (v6)
    {
      id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Join"];
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
      uint64_t v9 = [v6 objectForKey:*MEMORY[0x1E4F78C70]];
      [v8 setObject:v9 forKeyedSubscript:@"Reason"];

      uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v4 != 0];
      [v8 setObject:v10 forKeyedSubscript:@"State"];

      [(PLOperator *)self logEntry:v8];
    }
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PLWifiAgent_logEventPointJoin_withStats___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (logEventPointJoin_withStats__defaultOnce != -1) {
      dispatch_once(&logEventPointJoin_withStats__defaultOnce, block);
    }
    if (logEventPointJoin_withStats__classDebugEnabled)
    {
      uint64_t v12 = [NSString stringWithFormat:@"No wifi to log power properties about"];
      id v13 = (void *)MEMORY[0x1E4F929B8];
      id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      id v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventPointJoin:withStats:]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:2990];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __43__PLWifiAgent_logEventPointJoin_withStats___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointJoin_withStats__classDebugEnabled = result;
  return result;
}

- (void)logEventPointRemoteControlSession:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"RemoteControlSession"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardModuleInfo
{
  if ([(PLWifiAgent *)self hasWiFi])
  {
    uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ModuleInfo"];
    uint64_t v4 = [(PLOperator *)self storage];
    id v5 = [v4 lastEntryForKey:v3];

    if (v5)
    {
LABEL_19:

      return;
    }
    [(PLWifiAgent *)self wifiDevice];
    id v6 = WiFiDeviceClientCopyProperty();
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __40__PLWifiAgent_logEventForwardModuleInfo__block_invoke_1114;
      void v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v24[4] = v7;
      if (logEventForwardModuleInfo_defaultOnce_1112 != -1) {
        dispatch_once(&logEventForwardModuleInfo_defaultOnce_1112, v24);
      }
      if (logEventForwardModuleInfo_classDebugEnabled_1113)
      {
        id v8 = [NSString stringWithFormat:@"Module parameters: %@", v6];
        uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        uint64_t v11 = [v10 lastPathComponent];
        uint64_t v12 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventForwardModuleInfo]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:3078];

        id v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    if (v6)
    {
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
      id v15 = [v6 objectForKey:@"ChipInfo"];
      [v14 setObject:v15 forKeyedSubscript:@"ChipInfo"];

      uint64_t v16 = [v6 objectForKey:@"ManufacturerID"];
      [v14 setObject:v16 forKeyedSubscript:@"ManufacturerId"];

      uint64_t v17 = [v6 objectForKey:@"ModuleInfo"];
      [v14 setObject:v17 forKeyedSubscript:@"ModuleInfo"];

      int v18 = [v6 objectForKey:@"ProductID"];
      [v14 setObject:v18 forKeyedSubscript:@"ProductId"];

      [(PLOperator *)self logEntry:v14];
    }
LABEL_18:

    goto LABEL_19;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PLWifiAgent_logEventForwardModuleInfo__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v19;
    if (logEventForwardModuleInfo_defaultOnce != -1) {
      dispatch_once(&logEventForwardModuleInfo_defaultOnce, block);
    }
    if (logEventForwardModuleInfo_classDebugEnabled)
    {
      uint64_t v3 = [NSString stringWithFormat:@"No wifi to log module info about"];
      int v20 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      uint64_t v22 = [v21 lastPathComponent];
      unint64_t v23 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventForwardModuleInfo]"];
      [v20 logMessage:v3 fromFile:v22 fromFunction:v23 fromLineNumber:3068];

      id v6 = PLLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
      goto LABEL_18;
    }
  }
}

uint64_t __40__PLWifiAgent_logEventForwardModuleInfo__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardModuleInfo_classDebugEnabled = result;
  return result;
}

uint64_t __40__PLWifiAgent_logEventForwardModuleInfo__block_invoke_1114(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardModuleInfo_classDebugEnabled_1113 = result;
  return result;
}

- (void)logEventForwardRSSI:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      int v18 = __35__PLWifiAgent_logEventForwardRSSI___block_invoke;
      uint64_t v19 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v20 = v5;
      if (logEventForwardRSSI__defaultOnce != -1) {
        dispatch_once(&logEventForwardRSSI__defaultOnce, &block);
      }
      if (logEventForwardRSSI__classDebugEnabled)
      {
        id v6 = [NSString stringWithFormat:@"LinkQuality Callback: %@", v4, block, v17, v18, v19, v20];
        uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
        id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        uint64_t v9 = [v8 lastPathComponent];
        uint64_t v10 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventForwardRSSI:]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:3099];

        uint64_t v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    uint64_t v12 = [v4 objectForKey:@"RSSI"];
    id v13 = [v4 objectForKey:@"SCALED_RSSI"];
    id v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"RSSI"];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14];
    [v15 setObject:v12 forKeyedSubscript:@"RSSI"];
    [v15 setObject:v13 forKeyedSubscript:@"ScaledRSSI"];
    [(PLOperator *)self logEntry:v15];
    [(PLWifiAgent *)self setRemainingAllowedRSSIEntryCount:[(PLWifiAgent *)self remainingAllowedRSSIEntryCount] - 1];
  }
}

uint64_t __35__PLWifiAgent_logEventForwardRSSI___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardRSSI__classDebugEnabled = result;
  return result;
}

- (void)logEventForwardWifiAssist:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"WifiAssist"];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [v5 setObject:v6 forKeyedSubscript:@"WifiAssistFallback"];

  [(PLOperator *)self logEntry:v5];
}

- (void)logAWDLStateEntry:(id)a3
{
  id v4 = a3;
  id v6 = [v4 dictionary];
  uint64_t v5 = [v4 entryDate];

  [(PLOperator *)self logForSubsystem:@"WifiMetrics" category:@"AWDLState" data:v6 date:v5];
}

- (void)logEventForwardAWDLState:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__PLWifiAgent_logEventForwardAWDLState___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (logEventForwardAWDLState__defaultOnce != -1) {
        dispatch_once(&logEventForwardAWDLState__defaultOnce, block);
      }
      if (logEventForwardAWDLState__classDebugEnabled)
      {
        id v6 = [NSString stringWithFormat:@"AWDL Availability Callback: %@", v4];
        id v7 = (void *)MEMORY[0x1E4F929B8];
        id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        uint64_t v9 = [v8 lastPathComponent];
        uint64_t v10 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventForwardAWDLState:]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:3193];

        uint64_t v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    uint64_t v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"AWDLState"];
    id v13 = [(PLOperator *)self storage];
    id v14 = [v13 lastEntryForKey:v12];

    if (!v14
      || ([v14 objectForKeyedSubscript:@"AWDLDown"],
          id v15 = objc_claimAutoreleasedReturnValue(),
          [v4 objectForKeyedSubscript:@"LINK_CHANGED_IS_LINKDOWN"],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v15 != v16))
    {
      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12];
      int v18 = [v4 objectForKeyedSubscript:@"LINK_CHANGED_IS_LINKDOWN"];
      [v17 setObject:v18 forKeyedSubscript:@"AWDLDown"];

      [v17 setObject:&unk_1F400CF10 forKeyedSubscript:@"AWDLRanging"];
      uint64_t v19 = 0;
      [(PLWifiAgent *)self wifiAwdlDevice];
      WiFiDeviceClientCopyInterfaceStateInfo();
      [(PLOperator *)self logEntry:v17];
      [(PLWifiAgent *)self logAWDLStateEntry:v17];
    }
  }
}

uint64_t __40__PLWifiAgent_logEventForwardAWDLState___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardAWDLState__classDebugEnabled = result;
  return result;
}

uint64_t __40__PLWifiAgent_logEventForwardAWDLState___block_invoke_1146(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardAWDLState__classDebugEnabled_1145 = result;
  return result;
}

- (void)logEventForwardHotspotState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = *MEMORY[0x1E4F78C10];
    uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F78C10]];
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = *MEMORY[0x1E4F78C18];
      uint64_t v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F78C18]];

      if (v10)
      {
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v11 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __43__PLWifiAgent_logEventForwardHotspotState___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v11;
          if (logEventForwardHotspotState__defaultOnce != -1) {
            dispatch_once(&logEventForwardHotspotState__defaultOnce, block);
          }
          if (logEventForwardHotspotState__classDebugEnabled)
          {
            uint64_t v12 = [NSString stringWithFormat:@"Hotspot Availability Callback: %@", v5];
            id v13 = (void *)MEMORY[0x1E4F929B8];
            id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
            id v15 = [v14 lastPathComponent];
            uint64_t v16 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventForwardHotspotState:]"];
            [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:3222];

            uint64_t v17 = PLLogCommon();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }
          }
        }
        int v18 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"HotspotState"];
        uint64_t v19 = [(PLOperator *)self storage];
        uint64_t v20 = [v19 lastEntryForKey:v18];

        if (v20)
        {
          uint64_t v21 = [v20 objectForKeyedSubscript:@"HotSpotOn"];
          if (v21)
          {
            uint64_t v22 = (void *)v21;
            unint64_t v23 = [v20 objectForKeyedSubscript:@"ADHS"];

            if (v23)
            {
              int v24 = [v20 objectForKeyedSubscript:@"HotSpotOn"];
              int v25 = [v24 BOOLValue];
              v26 = [v5 objectForKeyedSubscript:v9];
              if (v25 == [v26 BOOLValue])
              {
                v27 = [v20 objectForKeyedSubscript:@"ADHS"];
                int v43 = [v27 BOOLValue];
                uint64_t v28 = [v5 objectForKeyedSubscript:v6];
                int v42 = [v28 BOOLValue];

                if (v43 == v42)
                {
                  if (![MEMORY[0x1E4F929C0] debugEnabled]) {
                    goto LABEL_19;
                  }
                  uint64_t v36 = objc_opt_class();
                  v44[0] = MEMORY[0x1E4F143A8];
                  v44[1] = 3221225472;
                  v44[2] = __43__PLWifiAgent_logEventForwardHotspotState___block_invoke_1155;
                  v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v44[4] = v36;
                  if (logEventForwardHotspotState__defaultOnce_1153 != -1) {
                    dispatch_once(&logEventForwardHotspotState__defaultOnce_1153, v44);
                  }
                  if (!logEventForwardHotspotState__classDebugEnabled_1154) {
                    goto LABEL_19;
                  }
                  v29 = [NSString stringWithFormat:@"Same hotspot data: %@", v5];
                  v37 = (void *)MEMORY[0x1E4F929B8];
                  uint64_t v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
                  uint64_t v39 = [v38 lastPathComponent];
                  uint64_t v40 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventForwardHotspotState:]"];
                  [v37 logMessage:v29 fromFile:v39 fromFunction:v40 fromLineNumber:3228];

                  v41 = PLLogCommon();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
                    __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
                  }

LABEL_18:
LABEL_19:

                  goto LABEL_20;
                }
              }
              else
              {
              }
            }
          }
        }
        v29 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v18];
        v30 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v31 = [v5 objectForKeyedSubscript:v9];
        uint64_t v32 = objc_msgSend(v30, "numberWithBool:", objc_msgSend(v31, "BOOLValue"));
        [v29 setObject:v32 forKeyedSubscript:@"HotSpotOn"];

        uint64_t v33 = (void *)MEMORY[0x1E4F28ED0];
        v34 = [v5 objectForKeyedSubscript:v6];
        v35 = objc_msgSend(v33, "numberWithBool:", objc_msgSend(v34, "BOOLValue"));
        [v29 setObject:v35 forKeyedSubscript:@"ADHS"];

        [(PLOperator *)self logEntry:v29];
        goto LABEL_18;
      }
    }
  }
LABEL_20:
}

uint64_t __43__PLWifiAgent_logEventForwardHotspotState___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardHotspotState__classDebugEnabled = result;
  return result;
}

uint64_t __43__PLWifiAgent_logEventForwardHotspotState___block_invoke_1155(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardHotspotState__classDebugEnabled_1154 = result;
  return result;
}

- (void)logEventBackwardCumulativeProperties
{
}

- (void)logEventBackwardDiffProperties
{
}

- (void)logEventBackwardUserScanDuration
{
  id v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"CumulativeUserScanDurations"];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_autoJoinScanDuration];
  [v3 setObject:v4 forKeyedSubscript:@"AutojoinScanDuration"];

  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_locationScanDuration];
  [v3 setObject:v5 forKeyedSubscript:@"LocationScanDuration"];

  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_pipelineScanDuration];
  [v3 setObject:v6 forKeyedSubscript:@"PipelineScanDuration"];

  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_unknownScanDuration];
  [v3 setObject:v7 forKeyedSubscript:@"UnknownScanDuration"];

  id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_setupScanDuration];
  [v3 setObject:v8 forKeyedSubscript:@"SetupScanDuration"];

  [(PLOperator *)self logEntry:v3];
}

- (void)updateEventBackwardUserScanDuration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 objectForKey:@"SCAN_CHANNELS"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v6 = [v4 objectForKey:@"ScanReqClientName"];
      if (!v5
        || ([MEMORY[0x1E4F1CA98] null],
            uint64_t v7 = objc_claimAutoreleasedReturnValue(),
            v7,
            v5 == v7))
      {
        uint64_t v8 = 0;
        uint64_t v16 = 110;
        uint64_t v17 = 3000;
        if (!v6)
        {
LABEL_21:
          int v18 = &OBJC_IVAR___PLWifiAgent__autoJoinScanDuration;
LABEL_22:
          *(Class *)((char *)&self->super.super.super.isa + *v18) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                                     + *v18)
                                                                          + v17);
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v20 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __51__PLWifiAgent_updateEventBackwardUserScanDuration___block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v20;
            if (updateEventBackwardUserScanDuration__defaultOnce != -1) {
              dispatch_once(&updateEventBackwardUserScanDuration__defaultOnce, block);
            }
            if (updateEventBackwardUserScanDuration__classDebugEnabled)
            {
              uint64_t v21 = [NSString stringWithFormat:@"User scan counter update: clientName = %@, dwellTime= %lu, channelCountNum = %lu, totalScanTime = %lu\n", v6, v16, v8, v17];
              uint64_t v22 = (void *)MEMORY[0x1E4F929B8];
              unint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
              int v24 = [v23 lastPathComponent];
              int v25 = [NSString stringWithUTF8String:"-[PLWifiAgent updateEventBackwardUserScanDuration:]"];
              [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:3326];

              v26 = PLLogCommon();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
                __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
              }
            }
          }
          goto LABEL_29;
        }
LABEL_12:
        if ([v6 hasPrefix:@"location"])
        {
          int v18 = &OBJC_IVAR___PLWifiAgent__locationScanDuration;
        }
        else if ([v6 hasPrefix:@"Setup"])
        {
          int v18 = &OBJC_IVAR___PLWifiAgent__setupScanDuration;
        }
        else
        {
          int v19 = [v6 hasPrefix:@"pipe"];
          int v18 = &OBJC_IVAR___PLWifiAgent__unknownScanDuration;
          if (v19) {
            int v18 = &OBJC_IVAR___PLWifiAgent__pipelineScanDuration;
          }
        }
        goto LABEL_22;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v8 = [v5 count];
        uint64_t v9 = [v4 objectForKey:@"SCAN_DWELL_TIME"];
        if (!v9) {
          goto LABEL_19;
        }
        uint64_t v10 = (void *)v9;
        uint64_t v11 = [v4 objectForKey:@"SCAN_DWELL_TIME"];
        uint64_t v12 = [MEMORY[0x1E4F1CA98] null];

        if (v11 == v12)
        {
LABEL_19:
          uint64_t v16 = 110;
LABEL_20:
          uint64_t v17 = v16 * v8;
          if (!v6) {
            goto LABEL_21;
          }
          goto LABEL_12;
        }
        id v13 = [v4 objectForKey:@"SCAN_DWELL_TIME"];
        char v14 = objc_opt_respondsToSelector();

        if (v14)
        {
          id v15 = [v4 objectForKey:@"SCAN_DWELL_TIME"];
          uint64_t v16 = (int)[v15 intValue];

          goto LABEL_20;
        }
      }
LABEL_29:

      goto LABEL_30;
    }
  }
LABEL_31:
}

uint64_t __51__PLWifiAgent_updateEventBackwardUserScanDuration___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateEventBackwardUserScanDuration__classDebugEnabled = result;
  return result;
}

- (void)logEventPointAWDLServicesAndPorts
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "No wifi to log active services and ports about", v2, v3, v4, v5, v6);
}

- (void)logEventBackwardWifiProperties:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PLWifiAgent *)self hasWiFi])
  {
    int valuePtr = 115;
    CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
    [(PLWifiAgent *)self wifiDevice];
    uint8_t v6 = (void *)WiFiDeviceClientCopyProperty();
    CFRelease(v5);
    [(PLWifiAgent *)self wifiDevice];
    uint64_t v7 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
    uint64_t v8 = PLLogWifi();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PLWifiAgent logEventBackwardWifiProperties:].cold.5();
    }

    uint64_t v9 = objc_opt_new();
    [v9 setObject:@"<error>" forKeyedSubscript:@"CurrentSSID"];
    [v9 setObject:&unk_1F400CF10 forKeyedSubscript:@"CurrentChannel"];
    [v9 setObject:&unk_1F400CF10 forKeyedSubscript:@"CurrentBandwidth"];
    [v9 setObject:&unk_1F400CF10 forKeyedSubscript:@"Carplay"];
    if (!v7)
    {
      uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
      [v9 setObject:v36 forKeyedSubscript:@"CurrentSSID"];

      [v9 setObject:&unk_1F400CF10 forKeyedSubscript:@"CurrentChannel"];
      [v9 setObject:&unk_1F400CF10 forKeyedSubscript:@"CurrentBandwidth"];
LABEL_35:
      int v37 = [MEMORY[0x1E4F929C0] debugEnabled];
      if (v6)
      {
        if (v37)
        {
          uint64_t v38 = objc_opt_class();
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_1220;
          v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v54[4] = v38;
          if (logEventBackwardWifiProperties__defaultOnce_1218 != -1) {
            dispatch_once(&logEventBackwardWifiProperties__defaultOnce_1218, v54);
          }
          if (logEventBackwardWifiProperties__classDebugEnabled_1219)
          {
            uint64_t v39 = [NSString stringWithFormat:@"wifi properties dictionary: %@, need to model power=%d", v6, v3];
            uint64_t v40 = (void *)MEMORY[0x1E4F929B8];
            v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
            int v42 = [v41 lastPathComponent];
            int v43 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventBackwardWifiProperties:]"];
            [v40 logMessage:v39 fromFile:v42 fromFunction:v43 fromLineNumber:3488];

            id v44 = PLLogCommon();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }
          }
        }
        [(PLWifiAgent *)self logEventBackwardWifiProperties:v6 withNetworkProperties:v9 shallModelPower:v3];
      }
      else if (v37)
      {
        uint64_t v45 = objc_opt_class();
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_1214;
        v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v55[4] = v45;
        if (logEventBackwardWifiProperties__defaultOnce_1212 != -1) {
          dispatch_once(&logEventBackwardWifiProperties__defaultOnce_1212, v55);
        }
        if (logEventBackwardWifiProperties__classDebugEnabled_1213)
        {
          uint64_t v46 = [NSString stringWithFormat:@"No wifi properties"];
          uint64_t v47 = (void *)MEMORY[0x1E4F929B8];
          v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
          uint64_t v49 = [v48 lastPathComponent];
          v50 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventBackwardWifiProperties:]"];
          [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:3486];

          v51 = PLLogCommon();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
LABEL_51:

      return;
    }
    [v9 setObject:WiFiNetworkGetSSID() forKeyedSubscript:@"CurrentSSID"];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"CurrentSSID"];

    if (v10)
    {
      [v9 setObject:MEMORY[0x1E4E7E620](v7) forKeyedSubscript:@"CurrentChannel"];
      uint64_t v11 = [v9 objectForKeyedSubscript:@"CurrentChannel"];

      if (v11)
      {
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[PLWifiAgent getCurrentChannelWidth:](self, "getCurrentChannelWidth:", v7));
        [v9 setObject:v12 forKeyedSubscript:@"CurrentBandwidth"];

        id v13 = MEMORY[0x1E4E7E620](v7);
        [v9 setObject:v13 forKeyedSubscript:@"CurrentChannel"];
        if (WiFiNetworkGetOperatingBand() == 3)
        {
          char v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v13, "intValue") + 1000);
          [v9 setObject:v14 forKeyedSubscript:@"CurrentChannel"];

          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v15 = objc_opt_class();
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_1200;
            v57[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v57[4] = v15;
            if (logEventBackwardWifiProperties__defaultOnce_1198 != -1) {
              dispatch_once(&logEventBackwardWifiProperties__defaultOnce_1198, v57);
            }
            if (logEventBackwardWifiProperties__classDebugEnabled_1199)
            {
              uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"6G chan %lu", v13);
              v52 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
              int v18 = [v17 lastPathComponent];
              int v19 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventBackwardWifiProperties:]"];
              [v52 logMessage:v16 fromFile:v18 fromFunction:v19 fromLineNumber:3473];

              uint64_t v20 = (void *)v16;
              uint64_t v21 = PLLogCommon();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
                __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
              }
            }
          }
        }
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v22 = objc_opt_class();
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_1206;
          v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v56[4] = v22;
          if (logEventBackwardWifiProperties__defaultOnce_1204 != -1) {
            dispatch_once(&logEventBackwardWifiProperties__defaultOnce_1204, v56);
          }
          if (logEventBackwardWifiProperties__classDebugEnabled_1205)
          {
            uint64_t v53 = v13;
            unint64_t v23 = NSString;
            int v24 = [v9 objectForKeyedSubscript:@"CurrentBandwidth"];
            int v25 = [v23 stringWithFormat:@"kPLWACurrentChannelWidthInMHz = %@", v24];

            v26 = (void *)MEMORY[0x1E4F929B8];
            v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
            uint64_t v28 = [v27 lastPathComponent];
            v29 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventBackwardWifiProperties:]"];
            [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:3476];

            v30 = PLLogCommon();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }

            id v13 = v53;
          }
        }

        goto LABEL_32;
      }
    }
    else
    {
      [v9 setObject:@"<unknown>" forKeyedSubscript:@"CurrentSSID"];
    }
    [v9 setObject:&unk_1F400CF10 forKeyedSubscript:@"CurrentChannel"];
    [v9 setObject:&unk_1F400CF10 forKeyedSubscript:@"CurrentBandwidth"];
LABEL_32:
    if (WiFiNetworkIsCarPlay()) {
      [v9 setObject:&unk_1F400CF28 forKeyedSubscript:@"Carplay"];
    }
    CFRelease(v7);
    goto LABEL_35;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v31 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v31;
    if (logEventBackwardWifiProperties__defaultOnce != -1) {
      dispatch_once(&logEventBackwardWifiProperties__defaultOnce, block);
    }
    if (logEventBackwardWifiProperties__classDebugEnabled)
    {
      uint8_t v6 = [NSString stringWithFormat:@"No wifi to log power properties about"];
      uint64_t v32 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      v34 = [v33 lastPathComponent];
      v35 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventBackwardWifiProperties:]"];
      [v32 logMessage:v6 fromFile:v34 fromFunction:v35 fromLineNumber:3432];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
      goto LABEL_51;
    }
  }
}

uint64_t __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardWifiProperties__classDebugEnabled = result;
  return result;
}

uint64_t __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_1200(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardWifiProperties__classDebugEnabled_1199 = result;
  return result;
}

uint64_t __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_1206(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardWifiProperties__classDebugEnabled_1205 = result;
  return result;
}

uint64_t __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_1214(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardWifiProperties__classDebugEnabled_1213 = result;
  return result;
}

uint64_t __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_1220(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardWifiProperties__classDebugEnabled_1219 = result;
  return result;
}

- (void)logEventBackwardWifiProperties:(id)a3 withNetworkProperties:(id)a4 shallModelPower:(BOOL)a5
{
  BOOL v328 = a5;
  v413[10] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v327 = a4;
  v412[0] = @"SOFTAP_LOWPOWER_STATS_ACTIVE_STATE_DURATION";
  v412[1] = @"SOFTAP_LOWPOWER_STATS_ACTIVE_STATE_COUNT";
  v413[0] = @"ADHSActiveStateDuration";
  v413[1] = @"ADHSActiveStateCount";
  v412[2] = @"SOFTAP_LOWPOWER_STATS_DYNAMIC_STATE_DURATION";
  v412[3] = @"SOFTAP_LOWPOWER_STATS_DYNAMIC_STATE_COUNT";
  v413[2] = @"ADHSDynamicStateDuration";
  v413[3] = @"ADHSDynamicStateDuration";
  v412[4] = @"SOFTAP_LOWPOWER_STATS_LOWPOWER_STATE_COUNT";
  v412[5] = @"SOFTAP_LOWPOWER_STATS_LOWPOWER_STATE_COUNT";
  v413[4] = @"ADHSLowPowerStateDuration";
  v413[5] = @"ADHSLowPowerStateDuration";
  v412[6] = @"SOFTAP_LOWPOWER_STATS_OFF_STATE_COUNT";
  v412[7] = @"SOFTAP_LOWPOWER_STATS_OFF_STATE_COUNT";
  v413[6] = @"ADHSOffStateDuration";
  v413[7] = @"ADHSOffStateDuration";
  v412[8] = @"SOFTAP_LOWPOWER_STATS_TXPACKETS";
  v412[9] = @"SOFTAP_LOWPOWER_STATS_RXPACKETS";
  v413[8] = @"ADHSTXPackets";
  v413[9] = @"ADHSRXPackets";
  v337 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v413 forKeys:v412 count:10];
  v322 = [v337 allValues];
  uint64_t v8 = *MEMORY[0x1E4F92D28];
  v323 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"HotspotPowerStats"];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"CACHED_TIME_STAMP"];
  unsigned int v352 = [v9 integerValue];

  uint64_t v10 = [v7 objectForKeyedSubscript:@"INSTANT_ASSOCIATED_SLEEP_DURATION"];
  uint64_t v11 = [v10 integerValue];

  uint64_t v12 = [v7 objectForKeyedSubscript:@"INSTANT_UNASSOCIATED_SLEEP_DURATION"];
  uint64_t v13 = [v12 integerValue];

  char v14 = [v7 objectForKeyedSubscript:@"INSTANT_TIME_STAMP"];
  unsigned int v346 = [v14 integerValue];

  uint64_t v15 = +[PLOperator entryKeyForType:v8 andName:@"CumulativeProperties"];
  v334 = +[PLOperator entryKeyForType:v8 andName:@"DiffProperties"];
  v321 = +[PLOperator entryKeyForType:v8 andName:@"BeaconProfile"];
  v326 = +[PLOperator entryKeyForType:v8 andName:@"AutoJoin"];
  v325 = +[PLOperator entryKeyForType:v8 andName:@"Scans"];
  v324 = +[PLOperator entryKeyForType:v8 andName:@"ScanForwardStats"];
  if (+[PLUtilities isPowerlogHelperd])
  {
    uint64_t v16 = self->_lastEntryForHelperd;
  }
  else
  {
    uint64_t v17 = [(PLOperator *)self storage];
    uint64_t v16 = [v17 lastEntryForKey:v15];
  }
  BOOL v350 = (v11 | v13) != 0;
  v340 = v16;
  if (v16)
  {
    int v18 = [(PLEntry *)v16 objectForKeyedSubscript:@"WifiTimestamp"];
    unint64_t v348 = [v18 unsignedIntegerValue];
  }
  else
  {
    unint64_t v348 = 0;
  }
  v332 = (void *)v15;
  v336 = self;
  v355 = v7;
  int v19 = objc_opt_new();
  BOOL v20 = +[PLWifiAgent isBeaconLoggingEnabled];
  uint64_t v21 = (void *)MEMORY[0x1E4F1CC08];
  uint64_t v22 = &unk_1F400FA60;
  if (!v20) {
    uint64_t v22 = (void *)MEMORY[0x1E4F1CC08];
  }
  obuint64_t j = v22;
  BOOL v23 = +[PLWifiAgent isScanLoggingEnabled];
  int v24 = &unk_1F400FA88;
  if (!v23) {
    int v24 = v21;
  }
  id v342 = v24;
  BOOL v25 = +[PLWifiAgent isScanForwardLoggingEnabled];
  v26 = &unk_1F400FAB0;
  if (!v25) {
    v26 = v21;
  }
  id v343 = v26;
  v330 = v19;
  [v19 addEntriesFromDictionary:&unk_1F400F880];
  int v27 = [MEMORY[0x1E4F92A38] kPLWiFiClassOfDevice];
  uint64_t v28 = 0;
  v29 = &unk_1F400F8A8;
  v30 = &unk_1F400FA38;
  uint64_t v31 = &unk_1F400F8F8;
  uint64_t v32 = &unk_1F400F998;
  uint64_t v33 = &unk_1F400F970;
  v34 = &unk_1F400F948;
  int v35 = 0;
  uint64_t v331 = 0;
  int v329 = 0;
  uint64_t v36 = &unk_1F400F920;
  int v37 = &unk_1F400F8D0;
  switch(v27)
  {
    case 1004001:
    case 1004002:
    case 1004003:
    case 1004006:
    case 1004008:
      goto LABEL_20;
    case 1004004:
    case 1004005:
      goto LABEL_19;
    case 1004007:
      goto LABEL_18;
    case 1004009:
      goto LABEL_21;
    case 1004010:
      goto LABEL_17;
    case 1004011:
      uint64_t v331 = 0;
      int v329 = 0;
      uint64_t v28 = 0;
      uint64_t v36 = &unk_1F400F9E8;
      int v37 = &unk_1F400F9C0;
      goto LABEL_19;
    case 1004012:
      [v19 addEntriesFromDictionary:&unk_1F400F8A8];
      [v19 addEntriesFromDictionary:&unk_1F400F9C0];
      [v19 addEntriesFromDictionary:&unk_1F400F9E8];
      HIDWORD(v331) = 0;
      if ((int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] <= 1001204)
      {
        uint64_t v38 = 0;
        LODWORD(v331) = 0;
        int v329 = 0;
      }
      else
      {
        uint64_t v28 = &unk_1F400FAD8;
        LODWORD(v331) = 1;
        int v329 = 0;
        v29 = &unk_1F400FA10;
LABEL_21:
        [v19 addEntriesFromDictionary:v29];
        uint64_t v38 = v28;
      }
      uint64_t v39 = v336;
      uint64_t v40 = v340;
      if (!v350)
      {
        int v43 = 1;
        if (!v340)
        {
          LODWORD(v42) = 1;
          goto LABEL_40;
        }
        BOOL v44 = v352 > v348;
        goto LABEL_36;
      }
      if (v346 <= (unint64_t)v352)
      {
        BOOL v44 = v352 > v348;
        int v43 = 1;
LABEL_36:
        if (v44) {
          LODWORD(v42) = 1;
        }
        else {
          LODWORD(v42) = 2;
        }
        goto LABEL_40;
      }
      if (v348) {
        BOOL v41 = v352 > v348;
      }
      else {
        BOOL v41 = 1;
      }
      LODWORD(v42) = v41;
      if (v42) {
        int v43 = 2;
      }
      else {
        int v43 = 1;
      }
LABEL_40:
      unint64_t v45 = 0x1E4F28000uLL;
      v344 = v38;
      do
      {
        uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v332];
        v339 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v334];
        v351 = v46;
        if (v42 == 2)
        {
          if (!v40 || [(PLWifiAgent *)v39 isWiFiPowered])
          {
            LODWORD(v42) = 2;
            goto LABEL_269;
          }
          v179 = (void *)[(PLEntry *)v40 copy];
          v180 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v334];
          v181 = [MEMORY[0x1E4F1CA98] null];
          [v179 setObject:v181 forKeyedSubscript:@"CurrentSSID"];

          [v179 setObject:&unk_1F400CF10 forKeyedSubscript:@"CurrentChannel"];
          [v179 setObject:&unk_1F400CF10 forKeyedSubscript:@"CurrentBandwidth"];
          [v179 setObject:&unk_1F400CF10 forKeyedSubscript:@"WifiPowered"];
          [v179 setObject:&unk_1F400CF10 forKeyedSubscript:@"Carplay"];
          uint64_t v182 = [*(id *)(v45 + 3792) numberWithUnsignedInteger:v336->_autoJoinScanDuration];
          [v179 setObject:v182 forKeyedSubscript:@"AutojoinScanDuration"];

          v183 = [*(id *)(v45 + 3792) numberWithUnsignedInteger:v336->_locationScanDuration];
          [v179 setObject:v183 forKeyedSubscript:@"LocationScanDuration"];

          uint64_t v184 = [*(id *)(v45 + 3792) numberWithUnsignedInteger:v336->_pipelineScanDuration];
          [v179 setObject:v184 forKeyedSubscript:@"PipelineScanDuration"];

          v185 = [*(id *)(v45 + 3792) numberWithUnsignedInteger:v336->_unknownScanDuration];
          [v179 setObject:v185 forKeyedSubscript:@"UnknownScanDuration"];

          v186 = [*(id *)(v45 + 3792) numberWithUnsignedInteger:v336->_setupScanDuration];
          v354 = v179;
          [v179 setObject:v186 forKeyedSubscript:@"SetupScanDuration"];

          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"AWDLAWDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"AWDLRXDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"AWDLScanDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"AWDLTXDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"AssociatedScanDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"AutojoinScanDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"CurrentBandwidth"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"CurrentChannel"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"CurrentSSID"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"FRTSDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"HSICActiveDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"HSICSuspendDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"LocationScanDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"MPCDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"OtherScanDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"PCIEActiveDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"PCIEPERSTDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"PCIESuspendDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"PMDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"PNOBSSIDDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"PNOScanSSIDDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"PipelineScanDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"RXDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"RoamScanDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"SetupScanDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"TXDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"TimeDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"UnknownScanDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"UserScanDuration"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"WifiPowered"];
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"WowEnabled"];
          if ([MEMORY[0x1E4F92A38] isWiFiClass:1004005])
          {
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"SISOTXDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"MIMOTXDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"MIMORXDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"SISORXDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"MIMOCSDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"SISOCSDuration"];
          }
          if (([MEMORY[0x1E4F92A38] isWiFiClass:1004007] & 1) != 0
            || ([MEMORY[0x1E4F92A38] isWiFiClass:1004010] & 1) != 0
            || ([MEMORY[0x1E4F92A38] isWiFiClass:1004013] & 1) != 0
            || [MEMORY[0x1E4F92A38] isWiFiClass:1004014])
          {
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"SISOTXDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"MIMOTXDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"MIMORXDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"SISORXDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"MIMOCSDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"SISOCSDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"OCLCSDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"OCLRXDuration"];
          }
          unint64_t v45 = 0x1E4F28000uLL;
          v187 = v179;
          uint64_t v39 = v336;
          if ([MEMORY[0x1E4F92A38] isWiFiClass:1004010])
          {
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"OPSFullDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"OPSPartialDuration"];
          }
          if (([MEMORY[0x1E4F92A38] isWiFiClass:1004013] & 1) != 0
            || [MEMORY[0x1E4F92A38] isWiFiClass:1004014])
          {
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"OPSFullDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"OPSPartialDuration"];
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"PSBWDuration"];
          }
          int v188 = v43;
          if (([MEMORY[0x1E4F92A38] isWiFiClass:1004015] & 1) != 0
            || ([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
            || [MEMORY[0x1E4F92A38] isWiFiClass:1004017])
          {
            [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"SCRXDurationSISO"];
          }
          if (v331)
          {
            long long v362 = 0u;
            long long v363 = 0u;
            long long v360 = 0u;
            long long v361 = 0u;
            uint64_t v189 = [v38 countByEnumeratingWithState:&v360 objects:v400 count:16];
            if (v189)
            {
              uint64_t v190 = v189;
              uint64_t v191 = *(void *)v361;
              do
              {
                for (uint64_t i = 0; i != v190; ++i)
                {
                  if (*(void *)v361 != v191) {
                    objc_enumerationMutation(v38);
                  }
                  [v180 setObject:&unk_1F400CF10 forKeyedSubscript:*(void *)(*((void *)&v360 + 1) + 8 * i)];
                }
                uint64_t v190 = [v38 countByEnumeratingWithState:&v360 objects:v400 count:16];
              }
              while (v190);
            }
          }
          if (HIDWORD(v331))
          {
            long long v358 = 0u;
            long long v359 = 0u;
            long long v356 = 0u;
            long long v357 = 0u;
            id v193 = v322;
            uint64_t v194 = [v193 countByEnumeratingWithState:&v356 objects:v399 count:16];
            if (v194)
            {
              uint64_t v195 = v194;
              uint64_t v196 = *(void *)v357;
              do
              {
                for (uint64_t j = 0; j != v195; ++j)
                {
                  if (*(void *)v357 != v196) {
                    objc_enumerationMutation(v193);
                  }
                  [v180 setObject:&unk_1F400CF10 forKeyedSubscript:*(void *)(*((void *)&v356 + 1) + 8 * j)];
                }
                uint64_t v195 = [v193 countByEnumeratingWithState:&v356 objects:v399 count:16];
              }
              while (v195);
            }

            uint64_t v38 = v344;
          }
          [v180 setObject:&unk_1F400CF10 forKeyedSubscript:@"TimeDuration"];
          v198 = [(PLEntry *)v40 objectForKey:@"CurrentChannel"];
          [v180 setObject:v198 forKeyedSubscript:@"CurrentChannel"];

          v199 = [(PLEntry *)v40 objectForKey:@"CurrentSSID"];
          [v180 setObject:v199 forKeyedSubscript:@"CurrentSSID"];

          v200 = [(PLEntry *)v40 objectForKey:@"CurrentBandwidth"];
          [v180 setObject:v200 forKeyedSubscript:@"CurrentBandwidth"];

          v201 = [(PLEntry *)v40 objectForKey:@"WowEnabled"];
          [v180 setObject:v201 forKeyedSubscript:@"WowEnabled"];

          v202 = [(PLEntry *)v40 objectForKey:@"WifiPowered"];
          [v180 setObject:v202 forKeyedSubscript:@"WifiPowered"];

          v203 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:2];
          [v354 setObject:v203 forKeyedSubscript:@"READINGTYPE"];

          if (+[PLUtilities isPowerlogHelperd]) {
            objc_storeStrong((id *)&v336->_lastEntryForHelperd, v354);
          }
          else {
            [(PLOperator *)v336 logEntry:v354];
          }
          int v43 = v188;
          uint64_t v46 = v351;
          if (v328) {
            [(PLWifiAgent *)v336 modelWiFiPower:v180];
          }

          LODWORD(v42) = 2;
          goto LABEL_267;
        }
        int v333 = v43;
        uint64_t v47 = *(void **)(v45 + 3792);
        if (v42) {
          v48 = @"CACHED_TIME_STAMP";
        }
        else {
          v48 = @"INSTANT_TIME_STAMP";
        }
        uint64_t v49 = [v355 objectForKeyedSubscript:v48];
        v50 = objc_msgSend(v47, "numberWithUnsignedInteger:", objc_msgSend(v49, "integerValue"));
        [v46 setObject:v50 forKeyedSubscript:@"WifiTimestamp"];

        if (v40)
        {
          v51 = *(void **)(v45 + 3792);
          v52 = [v46 objectForKeyedSubscript:@"WifiTimestamp"];
          uint64_t v53 = [v52 unsignedIntegerValue];
          v54 = [(PLEntry *)v40 objectForKeyedSubscript:@"WifiTimestamp"];
          v55 = objc_msgSend(v51, "numberWithInteger:", v53 - objc_msgSend(v54, "unsignedIntegerValue"));
          [v339 setObject:v55 forKeyedSubscript:@"TimeDuration"];
        }
        v347 = &unk_1F4013D20;
        if (([MEMORY[0x1E4F92A38] isWiFiClass:1004011] & 1) == 0)
        {
          int v56 = [MEMORY[0x1E4F92A38] isWiFiClass:1004012];
          v57 = &unk_1F4013D20;
          if (!v56) {
            v57 = &unk_1F4013D38;
          }
          v347 = v57;
        }
        long long v398 = 0u;
        long long v397 = 0u;
        long long v396 = 0u;
        long long v395 = 0u;
        id v58 = v330;
        v341 = v40;
        unsigned int v353 = v42;
        uint64_t v349 = [v58 countByEnumeratingWithState:&v395 objects:v411 count:16];
        if (v349)
        {
          uint64_t v345 = *(void *)v396;
          id v335 = v58;
          do
          {
            uint64_t v59 = 0;
            do
            {
              if (*(void *)v396 != v345) {
                objc_enumerationMutation(v58);
              }
              uint64_t v60 = *(void *)(*((void *)&v395 + 1) + 8 * v59);
              v61 = [v58 objectForKeyedSubscript:v60];
              v62 = [v61 objectAtIndexedSubscript:v42 != 0];
              uint64_t v63 = [v355 objectForKeyedSubscript:v62];
              unint64_t v64 = [v63 integerValue];

              if ([v347 containsObject:v60]) {
                unint64_t v65 = v64 / 0x3E8uLL;
              }
              else {
                unint64_t v65 = v64;
              }
              uint64_t v66 = [*(id *)(v45 + 3792) numberWithUnsignedInteger:v65];
              [v351 setObject:v66 forKeyedSubscript:v60];

              if (v40)
              {
                v67 = [(PLEntry *)v40 objectForKey:v60];
                if ([v67 isNil]) {
                  goto LABEL_91;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  unint64_t v68 = [v67 unsignedLongValue];
                  goto LABEL_68;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  unint64_t v68 = [v67 longLongValue];
LABEL_68:
                  unint64_t v69 = v68;
                  unint64_t v70 = v68 - v65;
                  if (v68 > v65)
                  {
                    if ([&unk_1F4013D50 containsObject:v60])
                    {
                      uint64_t v71 = *(void **)(v45 + 3792);
                      if (v70 - 858994 <= 0x346DC4)
                      {
                        uint64_t v72 = v65 - v69 + 4294967;
                        goto LABEL_90;
                      }
                    }
                    else
                    {
                      if ([MEMORY[0x1E4F929C0] debugEnabled])
                      {
                        uint64_t v81 = objc_opt_class();
                        v394[0] = MEMORY[0x1E4F143A8];
                        v394[1] = 3221225472;
                        v394[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke;
                        v394[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                        v394[4] = v81;
                        v82 = v394;
                        if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce != -1) {
                          dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce, v82);
                        }

                        if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled)
                        {
                          v83 = [NSString stringWithFormat:@"diff[%@] = %lu < %lu, ignoring setting to zero", v60, v65, v69];
                          v84 = (void *)MEMORY[0x1E4F929B8];
                          v85 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
                          uint64_t v86 = [v85 lastPathComponent];
                          id v87 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]"];
                          [v84 logMessage:v83 fromFile:v86 fromFunction:v87 fromLineNumber:4080];

                          uint64_t v88 = PLLogCommon();
                          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412290;
                            v402 = v83;
                            _os_log_debug_impl(&dword_1E4220000, v88, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                          }

                          unint64_t v45 = 0x1E4F28000uLL;
                        }
                      }
                      uint64_t v71 = *(void **)(v45 + 3792);
                    }
                    uint64_t v72 = 0;
LABEL_90:
                    uint64_t v89 = [v71 numberWithUnsignedInteger:v72];
                    [v339 setObject:v89 forKeyedSubscript:v60];

LABEL_91:
                    uint64_t v40 = v341;
                    goto LABEL_92;
                  }
                }
                else
                {
                  unint64_t v69 = 0;
                }
                if ([MEMORY[0x1E4F929C0] debugEnabled])
                {
                  uint64_t v73 = objc_opt_class();
                  v393[0] = MEMORY[0x1E4F143A8];
                  v393[1] = 3221225472;
                  v393[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_2273;
                  v393[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v393[4] = v73;
                  v74 = v393;
                  if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_2271 != -1) {
                    dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_2271, v74);
                  }

                  if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_2272)
                  {
                    v75 = [NSString stringWithFormat:@"diff[%@] = %lu - %lu", v60, v65, v69];
                    v76 = (void *)MEMORY[0x1E4F929B8];
                    int v77 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
                    uint64_t v78 = [v77 lastPathComponent];
                    uint64_t v79 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]"];
                    [v76 logMessage:v75 fromFile:v78 fromFunction:v79 fromLineNumber:4086];

                    id v80 = PLLogCommon();
                    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v402 = v75;
                      _os_log_debug_impl(&dword_1E4220000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                    unint64_t v45 = 0x1E4F28000uLL;
                    id v58 = v335;
                  }
                }
                uint64_t v71 = *(void **)(v45 + 3792);
                uint64_t v72 = v65 - v69;
                goto LABEL_90;
              }
LABEL_92:
              ++v59;
              LODWORD(v42) = v353;
            }
            while (v349 != v59);
            uint64_t v349 = [v58 countByEnumeratingWithState:&v395 objects:v411 count:16];
          }
          while (v349);
        }

        if (v40 && v42 == 1)
        {
          unsigned __int16 v90 = [(PLEntry *)v40 objectForKey:@"CurrentChannel"];
          uint64_t v91 = v351;
          [v351 setObject:v90 forKeyedSubscript:@"CurrentChannel"];

          uint64_t v92 = [(PLEntry *)v40 objectForKey:@"CurrentSSID"];
          [v351 setObject:v92 forKeyedSubscript:@"CurrentSSID"];

          uint64_t v93 = [(PLEntry *)v40 objectForKey:@"CurrentBandwidth"];
          [v351 setObject:v93 forKeyedSubscript:@"CurrentBandwidth"];

          v94 = [(PLEntry *)v40 objectForKey:@"WowEnabled"];
          [v351 setObject:v94 forKeyedSubscript:@"WowEnabled"];

          v95 = [(PLEntry *)v40 objectForKey:@"Carplay"];
          [v351 setObject:v95 forKeyedSubscript:@"Carplay"];

          v96 = [(PLEntry *)v40 objectForKey:@"WifiPowered"];
          v97 = v336;
        }
        else
        {
          v98 = [v327 objectForKeyedSubscript:@"CurrentChannel"];
          uint64_t v91 = v351;
          [v351 setObject:v98 forKeyedSubscript:@"CurrentChannel"];

          v99 = [v327 objectForKeyedSubscript:@"CurrentSSID"];
          [v351 setObject:v99 forKeyedSubscript:@"CurrentSSID"];

          v100 = [v327 objectForKeyedSubscript:@"CurrentBandwidth"];
          [v351 setObject:v100 forKeyedSubscript:@"CurrentBandwidth"];

          v101 = [v327 objectForKeyedSubscript:@"Carplay"];
          [v351 setObject:v101 forKeyedSubscript:@"Carplay"];

          v97 = v336;
          uint64_t v102 = objc_msgSend(*(id *)(v45 + 3792), "numberWithBool:", -[PLWifiAgent isWowEnabled](v336, "isWowEnabled"));
          [v351 setObject:v102 forKeyedSubscript:@"WowEnabled"];

          v96 = objc_msgSend(*(id *)(v45 + 3792), "numberWithBool:", -[PLWifiAgent isWiFiPowered](v336, "isWiFiPowered"));
        }
        [v91 setObject:v96 forKeyedSubscript:@"WifiPowered"];

        if (v331)
        {
          uint64_t v103 = [v355 objectForKeyedSubscript:@"AutoJoinPowerDiag"];
          uint64_t v104 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v326];
          long long v389 = 0u;
          long long v390 = 0u;
          long long v391 = 0u;
          long long v392 = 0u;
          uint64_t v105 = [v344 allKeys];
          uint64_t v106 = [v105 countByEnumeratingWithState:&v389 objects:v410 count:16];
          if (v106)
          {
            uint64_t v107 = v106;
            uint64_t v108 = *(void *)v390;
            do
            {
              for (uint64_t k = 0; k != v107; ++k)
              {
                if (*(void *)v390 != v108) {
                  objc_enumerationMutation(v105);
                }
                uint64_t v110 = *(void *)(*((void *)&v389 + 1) + 8 * k);
                v111 = [v344 objectForKeyedSubscript:v110];
                [v104 setObject:0 forKeyedSubscript:v111];

                v112 = [v103 objectForKey:v110];

                if (v112)
                {
                  v113 = [v103 objectForKeyedSubscript:v110];
                  v114 = [v344 objectForKeyedSubscript:v110];
                  [v104 setObject:v113 forKeyedSubscript:v114];
                }
                v115 = [v103 objectForKeyedSubscript:@"auto_join_trigger_counts"];
                v116 = [v115 objectForKey:v110];

                if (v116)
                {
                  v117 = [v103 objectForKeyedSubscript:@"auto_join_trigger_counts"];
                  v118 = [v117 objectForKeyedSubscript:v110];
                  v119 = [v344 objectForKeyedSubscript:v110];
                  [v104 setObject:v118 forKeyedSubscript:v119];
                }
              }
              uint64_t v107 = [v105 countByEnumeratingWithState:&v389 objects:v410 count:16];
            }
            while (v107);
          }

          v97 = v336;
          [(PLOperator *)v336 logEntry:v104];
          uint64_t v40 = v341;
          unint64_t v45 = 0x1E4F28000;
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v120 = objc_opt_class();
            v388[0] = MEMORY[0x1E4F143A8];
            v388[1] = 3221225472;
            v388[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_2285;
            v388[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v388[4] = v120;
            v121 = v388;
            if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_2283 != -1) {
              dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_2283, v121);
            }

            if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_2284)
            {
              v122 = [NSString stringWithFormat:@"Logged AJ keys:%@", v104];
              v123 = (void *)MEMORY[0x1E4F929B8];
              v124 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
              v125 = [v124 lastPathComponent];
              v126 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]"];
              [v123 logMessage:v122 fromFile:v125 fromFunction:v126 fromLineNumber:4135];

              v127 = PLLogCommon();
              if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v402 = v122;
                _os_log_debug_impl(&dword_1E4220000, v127, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v45 = 0x1E4F28000;
            }
          }
        }
        if (HIDWORD(v331))
        {
          v128 = [v355 objectForKey:@"AutoHotspotLPHSPowerStats"];

          if (v128)
          {
            v129 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v323];
            v130 = [v355 objectForKeyedSubscript:@"AutoHotspotLPHSPowerStats"];
            long long v384 = 0u;
            long long v385 = 0u;
            long long v386 = 0u;
            long long v387 = 0u;
            v131 = [v337 allKeys];
            uint64_t v132 = [v131 countByEnumeratingWithState:&v384 objects:v409 count:16];
            if (v132)
            {
              uint64_t v133 = v132;
              uint64_t v134 = *(void *)v385;
              do
              {
                for (uint64_t m = 0; m != v133; ++m)
                {
                  if (*(void *)v385 != v134) {
                    objc_enumerationMutation(v131);
                  }
                  uint64_t v136 = *(void *)(*((void *)&v384 + 1) + 8 * m);
                  v137 = [v130 objectForKey:v136];

                  if (v137)
                  {
                    v138 = [v130 objectForKeyedSubscript:v136];
                    v139 = [v337 objectForKeyedSubscript:v136];
                    [v129 setObject:v138 forKeyedSubscript:v139];
                  }
                }
                uint64_t v133 = [v131 countByEnumeratingWithState:&v384 objects:v409 count:16];
              }
              while (v133);
            }

            [(PLOperator *)v97 logEntry:v129];
            uint64_t v40 = v341;
            unint64_t v45 = 0x1E4F28000;
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v140 = objc_opt_class();
              v383[0] = MEMORY[0x1E4F143A8];
              v383[1] = 3221225472;
              v383[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_2294;
              v383[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v383[4] = v140;
              v141 = v383;
              if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_2292 != -1) {
                dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_2292, v141);
              }

              if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_2293)
              {
                v142 = [NSString stringWithFormat:@"Logged ADHS keys:%@", v129];
                v143 = (void *)MEMORY[0x1E4F929B8];
                v144 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
                v145 = [v144 lastPathComponent];
                v146 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]"];
                [v143 logMessage:v142 fromFile:v145 fromFunction:v146 fromLineNumber:4150];

                v147 = PLLogCommon();
                if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v402 = v142;
                  _os_log_debug_impl(&dword_1E4220000, v147, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                unint64_t v45 = 0x1E4F28000uLL;
              }
            }
          }
        }
        if (v329)
        {
          long long v381 = 0u;
          long long v382 = 0u;
          long long v379 = 0u;
          long long v380 = 0u;
          uint64_t v148 = [&unk_1F400FB00 countByEnumeratingWithState:&v379 objects:v408 count:16];
          if (v148)
          {
            uint64_t v149 = v148;
            uint64_t v150 = *(void *)v380;
            do
            {
              for (uint64_t n = 0; n != v149; ++n)
              {
                if (*(void *)v380 != v150) {
                  objc_enumerationMutation(&unk_1F400FB00);
                }
                uint64_t v152 = *(void *)(*((void *)&v379 + 1) + 8 * n);
                v153 = [&unk_1F400FB00 objectForKeyedSubscript:v152];
                v154 = [v355 objectForKey:v153];

                if (v154)
                {
                  v155 = [&unk_1F400FB00 objectForKeyedSubscript:v152];
                  v156 = [v355 objectForKeyedSubscript:v155];
                  [v351 setObject:v156 forKeyedSubscript:v152];
                }
              }
              uint64_t v149 = [&unk_1F400FB00 countByEnumeratingWithState:&v379 objects:v408 count:16];
            }
            while (v149);
          }
        }
        if (v40)
        {
          v157 = [(PLEntry *)v40 objectForKey:@"CurrentChannel"];
          [v339 setObject:v157 forKeyedSubscript:@"CurrentChannel"];

          v158 = [(PLEntry *)v40 objectForKey:@"CurrentSSID"];
          [v339 setObject:v158 forKeyedSubscript:@"CurrentSSID"];

          v159 = [(PLEntry *)v40 objectForKey:@"CurrentBandwidth"];
          [v339 setObject:v159 forKeyedSubscript:@"CurrentBandwidth"];

          v160 = [(PLEntry *)v40 objectForKey:@"WowEnabled"];
          [v339 setObject:v160 forKeyedSubscript:@"WowEnabled"];

          v161 = [(PLEntry *)v40 objectForKey:@"WifiPowered"];
          [v339 setObject:v161 forKeyedSubscript:@"WifiPowered"];
        }
        uint64_t v39 = v336;
        v162 = [*(id *)(v45 + 3792) numberWithUnsignedInteger:v336->_autoJoinScanDuration];
        [v351 setObject:v162 forKeyedSubscript:@"AutojoinScanDuration"];

        v163 = [*(id *)(v45 + 3792) numberWithUnsignedInteger:v336->_locationScanDuration];
        [v351 setObject:v163 forKeyedSubscript:@"LocationScanDuration"];

        uint64_t v164 = [*(id *)(v45 + 3792) numberWithUnsignedInteger:v336->_pipelineScanDuration];
        [v351 setObject:v164 forKeyedSubscript:@"PipelineScanDuration"];

        v165 = [*(id *)(v45 + 3792) numberWithUnsignedInteger:v336->_unknownScanDuration];
        [v351 setObject:v165 forKeyedSubscript:@"UnknownScanDuration"];

        uint64_t v166 = [*(id *)(v45 + 3792) numberWithUnsignedInteger:v336->_setupScanDuration];
        [v351 setObject:v166 forKeyedSubscript:@"SetupScanDuration"];

        uint64_t v38 = v344;
        if (v40)
        {
          uint64_t v167 = [(PLEntry *)v40 objectForKeyedSubscript:@"AutojoinScanDuration"];
          if (v167)
          {
            v168 = (void *)v167;
            uint64_t v169 = [(PLEntry *)v40 objectForKeyedSubscript:@"LocationScanDuration"];
            if (!v169)
            {

              goto LABEL_201;
            }
            uint64_t v170 = (void *)v169;
            uint64_t v171 = [(PLEntry *)v40 objectForKeyedSubscript:@"PipelineScanDuration"];
            if (v171)
            {
              uint64_t v172 = (void *)v171;
              v173 = [(PLEntry *)v40 objectForKeyedSubscript:@"UnknownScanDuration"];
              if (v173)
              {
                v174 = [(PLEntry *)v40 objectForKeyedSubscript:@"SetupScanDuration"];

                uint64_t v38 = v344;
                if (!v174) {
                  goto LABEL_201;
                }
                v175 = [v351 objectForKeyedSubscript:@"AutojoinScanDuration"];
                unint64_t v176 = [v175 unsignedLongLongValue];
                v177 = [(PLEntry *)v40 objectForKeyedSubscript:@"AutojoinScanDuration"];
                unint64_t v178 = [v177 unsignedLongLongValue];

                if (v176 >= v178)
                {
                  v281 = *(void **)(v45 + 3792);
                  v282 = [v351 objectForKeyedSubscript:@"AutojoinScanDuration"];
                  uint64_t v283 = [v282 unsignedLongLongValue];
                  v284 = [(PLEntry *)v40 objectForKeyedSubscript:@"AutojoinScanDuration"];
                  v285 = objc_msgSend(v281, "numberWithUnsignedLongLong:", v283 - objc_msgSend(v284, "unsignedLongLongValue"));
                  [v339 setObject:v285 forKeyedSubscript:@"AutojoinScanDuration"];
                }
                else
                {
                  [v339 setObject:0 forKeyedSubscript:@"AutojoinScanDuration"];
                }
                v286 = [v351 objectForKeyedSubscript:@"LocationScanDuration"];
                unint64_t v287 = [v286 unsignedLongLongValue];
                v288 = [(PLEntry *)v40 objectForKeyedSubscript:@"LocationScanDuration"];
                unint64_t v289 = [v288 unsignedLongLongValue];

                if (v287 >= v289)
                {
                  v290 = *(void **)(v45 + 3792);
                  v291 = [v351 objectForKeyedSubscript:@"LocationScanDuration"];
                  uint64_t v292 = [v291 unsignedLongLongValue];
                  v293 = [(PLEntry *)v40 objectForKeyedSubscript:@"LocationScanDuration"];
                  v294 = objc_msgSend(v290, "numberWithUnsignedLongLong:", v292 - objc_msgSend(v293, "unsignedLongLongValue"));
                  [v339 setObject:v294 forKeyedSubscript:@"LocationScanDuration"];
                }
                else
                {
                  [v339 setObject:0 forKeyedSubscript:@"LocationScanDuration"];
                }
                v295 = [v351 objectForKeyedSubscript:@"PipelineScanDuration"];
                unint64_t v296 = [v295 unsignedLongLongValue];
                v297 = [(PLEntry *)v40 objectForKeyedSubscript:@"PipelineScanDuration"];
                unint64_t v298 = [v297 unsignedLongLongValue];

                if (v296 >= v298)
                {
                  v299 = *(void **)(v45 + 3792);
                  v300 = [v351 objectForKeyedSubscript:@"PipelineScanDuration"];
                  uint64_t v301 = [v300 unsignedLongLongValue];
                  v302 = [(PLEntry *)v40 objectForKeyedSubscript:@"PipelineScanDuration"];
                  v303 = objc_msgSend(v299, "numberWithUnsignedLongLong:", v301 - objc_msgSend(v302, "unsignedLongLongValue"));
                  [v339 setObject:v303 forKeyedSubscript:@"PipelineScanDuration"];
                }
                else
                {
                  [v339 setObject:0 forKeyedSubscript:@"PipelineScanDuration"];
                }
                v304 = [v351 objectForKeyedSubscript:@"UnknownScanDuration"];
                unint64_t v305 = [v304 unsignedLongLongValue];
                v306 = [(PLEntry *)v40 objectForKeyedSubscript:@"UnknownScanDuration"];
                unint64_t v307 = [v306 unsignedLongLongValue];

                if (v305 >= v307)
                {
                  v308 = *(void **)(v45 + 3792);
                  v309 = [v351 objectForKeyedSubscript:@"UnknownScanDuration"];
                  uint64_t v310 = [v309 unsignedLongLongValue];
                  v311 = [(PLEntry *)v40 objectForKeyedSubscript:@"UnknownScanDuration"];
                  v312 = objc_msgSend(v308, "numberWithUnsignedLongLong:", v310 - objc_msgSend(v311, "unsignedLongLongValue"));
                  [v339 setObject:v312 forKeyedSubscript:@"UnknownScanDuration"];
                }
                else
                {
                  [v339 setObject:0 forKeyedSubscript:@"UnknownScanDuration"];
                }
                v313 = [v351 objectForKeyedSubscript:@"SetupScanDuration"];
                unint64_t v314 = [v313 unsignedLongLongValue];
                v315 = [(PLEntry *)v40 objectForKeyedSubscript:@"SetupScanDuration"];
                unint64_t v316 = [v315 unsignedLongLongValue];

                if (v314 < v316)
                {
                  [v339 setObject:0 forKeyedSubscript:@"SetupScanDuration"];
                  goto LABEL_200;
                }
                v317 = *(void **)(v45 + 3792);
                v168 = [v351 objectForKeyedSubscript:@"SetupScanDuration"];
                uint64_t v318 = [v168 unsignedLongLongValue];
                v319 = [(PLEntry *)v40 objectForKeyedSubscript:@"SetupScanDuration"];
                v320 = objc_msgSend(v317, "numberWithUnsignedLongLong:", v318 - objc_msgSend(v319, "unsignedLongLongValue"));
                [v339 setObject:v320 forKeyedSubscript:@"SetupScanDuration"];

LABEL_199:
LABEL_200:
                uint64_t v38 = v344;
                goto LABEL_201;
              }
            }
            goto LABEL_199;
          }
        }
LABEL_201:
        uint64_t v46 = v351;
        uint64_t v42 = v353;
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v204 = objc_opt_class();
          v378[0] = MEMORY[0x1E4F143A8];
          v378[1] = 3221225472;
          v378[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_2300;
          v378[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v378[4] = v204;
          v205 = v378;
          if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_2298 != -1) {
            dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_2298, v205);
          }

          if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_2299)
          {
            v206 = [NSString stringWithFormat:@"Last logged data: %@ current data:%@", v40, v351];
            v207 = (void *)MEMORY[0x1E4F929B8];
            v208 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
            v209 = [v208 lastPathComponent];
            v210 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]"];
            [v207 logMessage:v206 fromFile:v209 fromFunction:v210 fromLineNumber:4216];

            v211 = PLLogCommon();
            if (os_log_type_enabled(v211, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v402 = v206;
              _os_log_debug_impl(&dword_1E4220000, v211, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            uint64_t v38 = v344;
            uint64_t v46 = v351;
            uint64_t v42 = v353;
          }
        }
        v212 = [*(id *)(v45 + 3792) numberWithUnsignedInt:v42];
        [v46 setObject:v212 forKeyedSubscript:@"READINGTYPE"];

        if (+[PLUtilities isPowerlogHelperd]) {
          [(PLWifiAgent *)v336 setLastEntryForHelperd:v46];
        }
        else {
          [(PLOperator *)v336 logEntry:v46];
        }
        if (+[PLWifiAgent isBeaconLoggingEnabled])
        {
          v213 = [v46 objectForKeyedSubscript:@"CurrentChannel"];
          if ([v213 integerValue] >= 1)
          {
            v214 = [v46 objectForKeyedSubscript:@"WifiTimestamp"];
            uint64_t v215 = [v214 integerValue];
            v216 = [(PLEntry *)v40 objectForKeyedSubscript:@"WifiTimestamp"];
            uint64_t v42 = [v216 integerValue] + 60000;

            uint64_t v38 = v344;
            BOOL v41 = v215 <= v42;
            LODWORD(v42) = v353;
            uint64_t v46 = v351;
            if (v41) {
              goto LABEL_223;
            }
            v213 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v321];
            long long v374 = 0u;
            long long v375 = 0u;
            long long v376 = 0u;
            long long v377 = 0u;
            uint64_t v217 = [obj countByEnumeratingWithState:&v374 objects:v407 count:16];
            if (v217)
            {
              uint64_t v218 = v217;
              uint64_t v219 = *(void *)v375;
              do
              {
                for (iuint64_t i = 0; ii != v218; ++ii)
                {
                  if (*(void *)v375 != v219) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v221 = *(void *)(*((void *)&v374 + 1) + 8 * ii);
                  v222 = [obj objectForKeyedSubscript:v221];
                  v223 = [v222 objectAtIndexedSubscript:v353 != 0];
                  v224 = [v355 objectForKeyedSubscript:v223];
                  uint64_t v225 = [v224 integerValue];

                  v226 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v225];
                  [v213 setObject:v226 forKeyedSubscript:v221];
                }
                uint64_t v218 = [obj countByEnumeratingWithState:&v374 objects:v407 count:16];
              }
              while (v218);
            }
            v227 = [v351 objectForKeyedSubscript:@"WifiTimestamp"];
            uint64_t v46 = v351;
            [v213 setObject:v227 forKeyedSubscript:@"WifiTimestamp"];

            uint64_t v39 = v336;
            [(PLOperator *)v336 logEntry:v213];
            uint64_t v40 = v341;
            uint64_t v38 = v344;
            unint64_t v45 = 0x1E4F28000;
            LODWORD(v42) = v353;
          }
        }
LABEL_223:
        if (+[PLWifiAgent isScanLoggingEnabled])
        {
          v228 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v325];
          long long v370 = 0u;
          long long v371 = 0u;
          long long v372 = 0u;
          long long v373 = 0u;
          uint64_t v229 = [v342 countByEnumeratingWithState:&v370 objects:v406 count:16];
          if (v229)
          {
            uint64_t v230 = v229;
            uint64_t v231 = *(void *)v371;
            do
            {
              for (juint64_t j = 0; jj != v230; ++jj)
              {
                if (*(void *)v371 != v231) {
                  objc_enumerationMutation(v342);
                }
                uint64_t v233 = *(void *)(*((void *)&v370 + 1) + 8 * jj);
                v234 = [v342 objectForKeyedSubscript:v233];
                v235 = [v234 objectAtIndexedSubscript:v353 != 0];
                v236 = [v355 objectForKeyedSubscript:v235];
                uint64_t v237 = [v236 integerValue];

                v238 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v237];
                [v228 setObject:v238 forKeyedSubscript:v233];
              }
              uint64_t v230 = [v342 countByEnumeratingWithState:&v370 objects:v406 count:16];
            }
            while (v230);
          }
          v239 = [v351 objectForKeyedSubscript:@"WifiTimestamp"];
          [v228 setObject:v239 forKeyedSubscript:@"WifiTimestamp"];

          uint64_t v39 = v336;
          uint64_t v40 = v341;
          uint64_t v38 = v344;
          unint64_t v45 = 0x1E4F28000;
          LODWORD(v42) = v353;
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v240 = objc_opt_class();
            v369[0] = MEMORY[0x1E4F143A8];
            v369[1] = 3221225472;
            v369[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_2306;
            v369[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v369[4] = v240;
            v241 = v369;
            if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_2304 != -1) {
              dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_2304, v241);
            }

            if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_2305)
            {
              v242 = [NSString stringWithFormat:@" current data:%@ %@", v228, v342];
              v243 = (void *)MEMORY[0x1E4F929B8];
              v244 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
              v245 = [v244 lastPathComponent];
              v246 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]"];
              [v243 logMessage:v242 fromFile:v245 fromFunction:v246 fromLineNumber:4248];

              v247 = PLLogCommon();
              if (os_log_type_enabled(v247, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v402 = v242;
                _os_log_debug_impl(&dword_1E4220000, v247, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              uint64_t v38 = v344;
              LODWORD(v42) = v353;
            }
          }
          [(PLOperator *)v336 logEntry:v228];

          uint64_t v46 = v351;
        }
        if (+[PLWifiAgent isScanForwardLoggingEnabled])
        {
          v248 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v324];
          long long v365 = 0u;
          long long v366 = 0u;
          long long v367 = 0u;
          long long v368 = 0u;
          uint64_t v249 = [v343 countByEnumeratingWithState:&v365 objects:v405 count:16];
          if (v249)
          {
            uint64_t v250 = v249;
            uint64_t v251 = *(void *)v366;
            do
            {
              for (kuint64_t k = 0; kk != v250; ++kk)
              {
                if (*(void *)v366 != v251) {
                  objc_enumerationMutation(v343);
                }
                uint64_t v253 = *(void *)(*((void *)&v365 + 1) + 8 * kk);
                v254 = [v343 objectForKeyedSubscript:v253];
                v255 = [v254 objectAtIndexedSubscript:v353 != 0];
                v256 = [v355 objectForKeyedSubscript:v255];
                uint64_t v257 = [v256 integerValue];

                v258 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v257];
                [v248 setObject:v258 forKeyedSubscript:v253];
              }
              uint64_t v250 = [v343 countByEnumeratingWithState:&v365 objects:v405 count:16];
            }
            while (v250);
          }
          v259 = [v351 objectForKeyedSubscript:@"WifiTimestamp"];
          [v248 setObject:v259 forKeyedSubscript:@"WifiTimestamp"];

          uint64_t v39 = v336;
          uint64_t v38 = v344;
          LODWORD(v42) = v353;
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v260 = objc_opt_class();
            v364[0] = MEMORY[0x1E4F143A8];
            v364[1] = 3221225472;
            v364[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_2312;
            v364[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v364[4] = v260;
            v261 = v364;
            if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_2310 != -1) {
              dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_2310, v261);
            }

            if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_2311)
            {
              v262 = [NSString stringWithFormat:@"ScanForward current data: %@ %@", v248, v343];
              v263 = (void *)MEMORY[0x1E4F929B8];
              v264 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
              v265 = [v264 lastPathComponent];
              v266 = [NSString stringWithUTF8String:"-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]"];
              [v263 logMessage:v262 fromFile:v265 fromFunction:v266 fromLineNumber:4262];

              v267 = PLLogCommon();
              if (os_log_type_enabled(v267, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v402 = v262;
                _os_log_debug_impl(&dword_1E4220000, v267, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              uint64_t v38 = v344;
              LODWORD(v42) = v353;
            }
          }
          v268 = PLLogWifi();
          uint64_t v40 = v341;
          unint64_t v45 = 0x1E4F28000;
          if (os_log_type_enabled(v268, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v402 = v248;
            __int16 v403 = 2112;
            id v404 = v343;
            _os_log_debug_impl(&dword_1E4220000, v268, OS_LOG_TYPE_DEBUG, "ScanForward current data: %@ %@", buf, 0x16u);
          }

          [(PLOperator *)v336 logEntry:v248];
          uint64_t v46 = v351;
        }
        if (v40)
        {
          v269 = [v339 objectForKeyedSubscript:@"TimeDuration"];
          uint64_t v270 = [v269 integerValue];

          if (v270 >= 1)
          {
            if (v333 >= 2)
            {
              v271 = [v339 objectForKeyedSubscript:@"TimeDuration"];
              double v272 = (double)[v271 integerValue] / 1000.0;

              v273 = [v339 entryDate];
              v274 = [(PLEntry *)v40 entryDate];
              [v273 timeIntervalSinceDate:v274];
              double v276 = v275;

              if (v272 < v276)
              {
                v277 = (void *)MEMORY[0x1E4F1C9C8];
                v278 = [(PLEntry *)v40 entryDate];
                v279 = [v277 dateWithTimeInterval:v278 sinceDate:v272];
                [v339 setEntryDate:v279];
              }
            }
            if (v328) {
              [(PLWifiAgent *)v39 modelWiFiPower:v339];
            }
          }
        }
        int v43 = v333;
        if (v333 >= 2)
        {
          v280 = v46;

          if (v280)
          {
            v187 = [(PLEntry *)v280 objectForKeyedSubscript:@"WifiTimestamp"];
            [v187 unsignedIntegerValue];
            LODWORD(v42) = 0;
            uint64_t v40 = v280;
LABEL_267:

            goto LABEL_269;
          }
          uint64_t v40 = 0;
          LODWORD(v42) = 0;
        }
LABEL_269:

        BOOL v41 = v43-- <= 1;
      }
      while (!v41);

      return;
    case 1004013:
    case 1004014:
      goto LABEL_16;
    case 1004015:
      goto LABEL_15;
    case 1004016:
    case 1004017:
      v30 = &unk_1F400F8F8;
      uint64_t v32 = &unk_1F400FA38;
      uint64_t v33 = &unk_1F400F998;
      v34 = &unk_1F400F970;
      uint64_t v36 = &unk_1F400F948;
      uint64_t v31 = &unk_1F400F920;
LABEL_15:
      [v19 addEntriesFromDictionary:&unk_1F400F8A8];
      [v19 addEntriesFromDictionary:&unk_1F400F8D0];
      HIDWORD(v331) = 1;
      v29 = v31;
      int v37 = v36;
      uint64_t v36 = v34;
      v34 = v33;
      uint64_t v33 = v32;
      uint64_t v32 = v30;
LABEL_16:
      [v19 addEntriesFromDictionary:v29];
      v29 = v37;
      int v37 = v36;
      uint64_t v36 = v34;
      v34 = v33;
      uint64_t v33 = v32;
LABEL_17:
      [v19 addEntriesFromDictionary:v29];
      int v35 = 1;
      v29 = v37;
      int v37 = v36;
      uint64_t v36 = v34;
      v34 = v33;
LABEL_18:
      int v329 = HIDWORD(v331);
      [v19 addEntriesFromDictionary:v29];
      LODWORD(v331) = 1;
      HIDWORD(v331) = v35;
      v29 = v37;
      int v37 = v36;
      uint64_t v36 = v34;
      uint64_t v28 = &unk_1F400FAD8;
LABEL_19:
      [v19 addEntriesFromDictionary:v29];
      v29 = v37;
      int v37 = v36;
LABEL_20:
      [v19 addEntriesFromDictionary:v29];
      v29 = v37;
      goto LABEL_21;
    default:
      LODWORD(v331) = 0;
      int v329 = 0;
      goto LABEL_21;
  }
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled = result;
  return result;
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_2273(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_2272 = result;
  return result;
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_2285(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_2284 = result;
  return result;
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_2294(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_2293 = result;
  return result;
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_2300(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_2299 = result;
  return result;
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_2306(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_2305 = result;
  return result;
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_2312(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_2311 = result;
  return result;
}

- (id)wifiChipsetQuery
{
  wifiChipset = self->_wifiChipset;
  if (wifiChipset) {
    goto LABEL_49;
  }
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ModuleInfo"];
  CFNumberRef v5 = [(PLOperator *)self storage];
  uint8_t v6 = [v5 lastEntryForKey:v4];

  if (v6)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      uint64_t v28 = __31__PLWifiAgent_wifiChipsetQuery__block_invoke;
      v29 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v30 = v7;
      if (wifiChipsetQuery_defaultOnce != -1) {
        dispatch_once(&wifiChipsetQuery_defaultOnce, &block);
      }
      if (wifiChipsetQuery_classDebugEnabled)
      {
        uint64_t v8 = [NSString stringWithFormat:@"last module entry: %@", v6, block, v27, v28, v29, v30];
        uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        uint64_t v11 = [v10 lastPathComponent];
        uint64_t v12 = [NSString stringWithUTF8String:"-[PLWifiAgent wifiChipsetQuery]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:4441];

        uint64_t v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    char v14 = [v6 objectForKeyedSubscript:@"ProductId"];
    int v15 = [v14 intValue];

    uint64_t v16 = 0;
    if (v15 > 17459)
    {
      if (v15 <= 18346)
      {
        switch(v15)
        {
          case 17460:
            uint64_t v17 = @"4388";
            goto LABEL_47;
          case 17489:
            uint64_t v17 = @"4399";
            goto LABEL_47;
          case 17544:
            uint64_t v17 = @"4377";
            goto LABEL_47;
        }
        goto LABEL_20;
      }
      if (v15 <= 48411)
      {
        if (v15 == 18347)
        {
          uint64_t v17 = @"43452";
          goto LABEL_47;
        }
        if (v15 == 48410)
        {
          uint64_t v17 = @"4334";
          goto LABEL_47;
        }
LABEL_20:

        goto LABEL_50;
      }
      if (v15 == 48412)
      {
        uint64_t v17 = @"4324";
        goto LABEL_47;
      }
      if (v15 != 48417) {
        goto LABEL_20;
      }
    }
    else
    {
      if (v15 > 17371)
      {
        if (v15 > 17444)
        {
          if (v15 == 17445)
          {
            uint64_t v17 = @"4378";
            goto LABEL_47;
          }
          if (v15 == 17459)
          {
            uint64_t v17 = @"4387";
            goto LABEL_47;
          }
        }
        else
        {
          if (v15 == 17372)
          {
            uint64_t v17 = @"4355";
            goto LABEL_47;
          }
          if (v15 == 17418)
          {
            uint64_t v17 = @"4357";
LABEL_47:
            int v24 = self->_wifiChipset;
            self->_wifiChipset = &v17->isa;

            goto LABEL_48;
          }
        }
        goto LABEL_20;
      }
      if (v15 != 17204)
      {
        if (v15 == 17315)
        {
          uint64_t v17 = @"4350";
          goto LABEL_47;
        }
        if (v15 == 17323)
        {
          uint64_t v17 = @"4345";
          goto LABEL_47;
        }
        goto LABEL_20;
      }
    }
    uint64_t v17 = @"43342";
    goto LABEL_47;
  }
  if ([(PLOperator *)self isDebugEnabled])
  {
    int v18 = [NSString stringWithFormat:@"wifiChipsetQuery: WiFi Module entry not found. Assume 4334 for now."];
    int v19 = (void *)MEMORY[0x1E4F929B8];
    BOOL v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
    uint64_t v21 = [v20 lastPathComponent];
    uint64_t v22 = [NSString stringWithUTF8String:"-[PLWifiAgent wifiChipsetQuery]"];
    [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:4494];

    BOOL v23 = PLLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }

    uint64_t v16 = @"4334";
    goto LABEL_20;
  }
LABEL_48:

  wifiChipset = self->_wifiChipset;
LABEL_49:
  uint64_t v16 = wifiChipset;
LABEL_50:
  return v16;
}

uint64_t __31__PLWifiAgent_wifiChipsetQuery__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  wifiChipsetQuery_classDebugEnabled = result;
  return result;
}

- (id)wifiManufacturerQuery
{
  uint64_t v2 = self;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  wifiManufacturer = self->_wifiManufacturer;
  if (!wifiManufacturer)
  {
    uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ModuleInfo"];
    CFNumberRef v5 = [(PLOperator *)v2 storage];
    uint8_t v6 = [v5 lastEntryForKey:v4];

    if (!v6)
    {
LABEL_37:

      wifiManufacturer = v2->_wifiManufacturer;
      goto LABEL_38;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__PLWifiAgent_wifiManufacturerQuery__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (wifiManufacturerQuery_defaultOnce != -1) {
        dispatch_once(&wifiManufacturerQuery_defaultOnce, block);
      }
      if (wifiManufacturerQuery_classDebugEnabled)
      {
        uint64_t v8 = [NSString stringWithFormat:@"last module entry: %@", v6];
        uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
        uint64_t v11 = [v10 lastPathComponent];
        uint64_t v12 = [NSString stringWithUTF8String:"-[PLWifiAgent wifiManufacturerQuery]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:4508];

        uint64_t v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    uint64_t v36 = v6;
    int v37 = v4;
    v34 = [v6 objectForKeyedSubscript:@"ModuleInfo"];
    char v14 = [v34 componentsSeparatedByString:@" "];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
    int v35 = v2;
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v14);
          }
          BOOL v20 = [*(id *)(*((void *)&v39 + 1) + 8 * i) componentsSeparatedByString:@"="];
          if ([v20 count] == 2)
          {
            uint64_t v21 = [v20 objectAtIndexedSubscript:0];
            int v22 = [v21 isEqualToString:@"V"];

            if (v22)
            {
              uint64_t v23 = [v20 objectAtIndexedSubscript:1];

              uint64_t v17 = (void *)v23;
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v16);
    }
    else
    {
      uint64_t v17 = 0;
    }
    uint64_t v4 = v37;
    if ([v17 isEqualToString:@"u"])
    {
      int v24 = @"usi";
      uint64_t v2 = v35;
    }
    else
    {
      uint64_t v2 = v35;
      if ([v17 isEqualToString:@"t"])
      {
        int v24 = @"usi";
        goto LABEL_36;
      }
      if (([v17 isEqualToString:@"m"] & 1) != 0
        || ![MEMORY[0x1E4F929C0] debugEnabled])
      {
        int v24 = @"murata";
        goto LABEL_36;
      }
      uint64_t v25 = objc_opt_class();
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      void v38[2] = __36__PLWifiAgent_wifiManufacturerQuery__block_invoke_2387;
      v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v38[4] = v25;
      if (wifiManufacturerQuery_defaultOnce_2385 != -1) {
        dispatch_once(&wifiManufacturerQuery_defaultOnce_2385, v38);
      }
      if (!wifiManufacturerQuery_classDebugEnabled_2386)
      {
        int v24 = @"murata";
        uint64_t v4 = v37;
        goto LABEL_36;
      }
      v26 = [NSString stringWithFormat:@"PLWiFiAgent wifiManufacturerQuery: manufacturer string not recognized: %@. Defaulting to murata", v17];
      uint64_t v27 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
      v29 = [v28 lastPathComponent];
      uint64_t v30 = [NSString stringWithUTF8String:"-[PLWifiAgent wifiManufacturerQuery]"];
      [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:4529];

      uint64_t v31 = PLLogCommon();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

      int v24 = @"murata";
      uint64_t v4 = v37;
    }
    uint8_t v6 = v36;
LABEL_36:
    uint64_t v32 = v2->_wifiManufacturer;
    v2->_wifiManufacturer = &v24->isa;

    goto LABEL_37;
  }
LABEL_38:
  return wifiManufacturer;
}

uint64_t __36__PLWifiAgent_wifiManufacturerQuery__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  wifiManufacturerQuery_classDebugEnabled = result;
  return result;
}

uint64_t __36__PLWifiAgent_wifiManufacturerQuery__block_invoke_2387(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  wifiManufacturerQuery_classDebugEnabled_2386 = result;
  return result;
}

- (void)modelWiFiPower:(id)a3
{
  v336[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    CFNumberRef v5 = [v4 objectForKeyedSubscript:@"WifiPowered"];

    if (!v5)
    {
      int v56 = [v4 entryDate];
      v57 = [v4 objectForKeyedSubscript:@"TimeDuration"];
      [v57 doubleValue];
      [(PLWifiAgent *)self modelWiFiSegmentPower:v56 withDataPower:0.0 withIdlePower:0.0 withLocationPower:0.0 withPipelinePower:0.0 withTotalDuration:v58 / 1000.0];
LABEL_82:

      goto LABEL_83;
    }
    unint64_t v6 = 0x1E4F92000;
    if (([MEMORY[0x1E4F92A38] isWiFiClass:1004002] & 1) != 0
      || [MEMORY[0x1E4F92A38] isWiFiClass:1004003])
    {
      uint64_t v7 = [v4 objectForKeyedSubscript:@"CurrentChannel"];
      [v7 doubleValue];
      double v9 = v8;

      uint64_t v10 = [v4 objectForKeyedSubscript:@"PMDuration"];
      [v10 doubleValue];
      double v331 = v11;

      uint64_t v12 = [v4 objectForKeyedSubscript:@"MPCDuration"];
      [v12 doubleValue];
      double v328 = v13;

      char v14 = [v4 objectForKeyedSubscript:@"TimeDuration"];
      [v14 doubleValue];
      double v326 = v15;

      uint64_t v16 = [v4 objectForKeyedSubscript:@"TXDuration"];
      [v16 doubleValue];
      double v324 = v17;

      uint64_t v18 = [v4 objectForKeyedSubscript:@"RXDuration"];
      [v18 doubleValue];
      double v322 = v19;

      BOOL v20 = [v4 objectForKeyedSubscript:@"HSICActiveDuration"];
      [v20 doubleValue];
      double v320 = v21;

      int v22 = [v4 objectForKeyedSubscript:@"AssociatedScanDuration"];
      [v22 doubleValue];
      double v24 = v23;
      uint64_t v25 = [v4 objectForKeyedSubscript:@"OtherScanDuration"];
      [v25 doubleValue];
      double v27 = v26;
      uint64_t v28 = [v4 objectForKeyedSubscript:@"PNOBSSIDDuration"];
      [v28 doubleValue];
      double v30 = v29;
      uint64_t v31 = [v4 objectForKeyedSubscript:@"PNOScanSSIDDuration"];
      [v31 doubleValue];
      double v33 = v32;
      v34 = [v4 objectForKeyedSubscript:@"RoamScanDuration"];
      [v34 doubleValue];
      double v36 = v35;
      int v37 = [v4 objectForKeyedSubscript:@"SetupScanDuration"];
      [v37 doubleValue];
      double v39 = v38;
      [v4 objectForKeyedSubscript:@"UserScanDuration"];
      v41 = long long v40 = self;
      [v41 doubleValue];
      double v43 = v42;

      self = v40;
      BOOL v44 = [v4 objectForKeyedSubscript:@"FRTSDuration"];
      [v44 doubleValue];
      double v318 = v45;

      uint64_t v46 = +[PLUtilities powerModelForOperatorName:@"wifi"];
      uint64_t v47 = [(PLWifiAgent *)v40 wifiChipsetQuery];
      v48 = [v46 objectForKeyedSubscript:v47];
      uint64_t v49 = [(PLWifiAgent *)v40 wifiManufacturerQuery];
      v50 = [v48 objectForKeyedSubscript:v49];

      if (v9 >= 0.0)
      {
        double v59 = v24 + v27 + v30 + v33 + v36 + v39 + v43;
        uint64_t v60 = @"5";
        if (v9 != 0.0)
        {
          v61 = @"2.4";
          if (v9 > 11.0) {
            v61 = @"5";
          }
          uint64_t v60 = v61;
        }
        v62 = [v50 objectForKeyedSubscript:v60];
        uint64_t v63 = [v62 objectForKeyedSubscript:@"tx"];
        [v63 doubleValue];
        double v65 = v64;

        uint64_t v66 = [v50 objectForKeyedSubscript:v60];
        v67 = [v66 objectForKeyedSubscript:@"rx"];
        [v67 doubleValue];
        double v69 = v68;

        unint64_t v70 = [v50 objectForKeyedSubscript:v60];
        uint64_t v71 = [v70 objectForKeyedSubscript:@"cs"];
        [v71 doubleValue];
        double v73 = v72;

        v74 = [v50 objectForKeyedSubscript:v60];
        v75 = [v74 objectForKeyedSubscript:@"hsic"];
        [v75 doubleValue];
        double v77 = v76;

        double v78 = v326 - v331 - v328 - v324 - v322;
        if (v78 < 0.0) {
          double v78 = 0.0;
        }
        double v79 = v78 * v73;
        double v80 = v320 + v328 + v331 + v59 - v326;
        if (v80 < 0.0) {
          double v80 = 0.0;
        }
        double v81 = v80 * v77;
        double v82 = v324 * v65 + v322 * v69;
        double v54 = v82 + v79 + v81;
        double v83 = v318 - v322 - v324;
        if (v83 < 0.0) {
          double v83 = 0.0;
        }
        double v84 = v82 + v81 + v83 * v73;
        if (v9 == 0.0) {
          double v55 = 0.0;
        }
        else {
          double v55 = v84;
        }
      }
      else
      {
        v51 = [v50 objectForKeyedSubscript:@"scan"];
        [v51 doubleValue];
        double v53 = v52;

        double v54 = (v326 - v331 - v328) * v53;
        double v55 = 0.0;
      }
    }
    else
    {
      if (([MEMORY[0x1E4F92A38] isWiFiClass:1004006] & 1) == 0
        && ([MEMORY[0x1E4F92A38] isWiFiClass:1004004] & 1) == 0
        && ![MEMORY[0x1E4F92A38] isWiFiClass:1004008])
      {
        if (([MEMORY[0x1E4F92A38] isWiFiClass:1004005] & 1) != 0
          || ([MEMORY[0x1E4F92A38] isWiFiClass:1004007] & 1) != 0
          || ([MEMORY[0x1E4F92A38] isWiFiClass:1004010] & 1) != 0
          || ([MEMORY[0x1E4F92A38] isWiFiClass:1004013] & 1) != 0
          || ([MEMORY[0x1E4F92A38] isWiFiClass:1004014] & 1) != 0
          || ([MEMORY[0x1E4F92A38] isWiFiClass:1004015] & 1) != 0
          || ([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
          || (v55 = 0.0, double v54 = 0.0, [MEMORY[0x1E4F92A38] isWiFiClass:1004017]))
        {
          uint64_t v184 = [v4 objectForKeyedSubscript:@"CurrentChannel"];
          [v184 doubleValue];
          double v330 = v185;

          v186 = [v4 objectForKeyedSubscript:@"PMDuration"];
          [v186 doubleValue];
          double v188 = v187;

          uint64_t v189 = [v4 objectForKeyedSubscript:@"MPCDuration"];
          [v189 doubleValue];
          double v191 = v190;

          v192 = [v4 objectForKeyedSubscript:@"TimeDuration"];
          [v192 doubleValue];
          double v194 = v193;

          uint64_t v195 = [v4 objectForKeyedSubscript:@"TXDuration"];
          [v195 doubleValue];
          double v197 = v196;

          v198 = [v4 objectForKeyedSubscript:@"MIMOTXDuration"];
          [v198 doubleValue];
          double v200 = v199;

          v201 = [v4 objectForKeyedSubscript:@"RXDuration"];
          [v201 doubleValue];
          double v203 = v202;

          uint64_t v204 = [v4 objectForKeyedSubscript:@"MIMORXDuration"];
          [v204 doubleValue];
          double v206 = v205;

          v207 = [v4 objectForKeyedSubscript:@"SISORXDuration"];
          [v207 doubleValue];

          v208 = [v4 objectForKeyedSubscript:@"MIMOCSDuration"];
          [v208 doubleValue];
          double v210 = v209;

          v211 = [v4 objectForKeyedSubscript:@"SISOCSDuration"];
          [v211 doubleValue];

          v212 = [v4 objectForKeyedSubscript:@"OCLCSDuration"];
          [v212 doubleValue];
          double v314 = v213;

          if (([MEMORY[0x1E4F92A38] isWiFiClass:1004015] & 1) != 0
            || ([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
            || (double v317 = 0.0, [MEMORY[0x1E4F92A38] isWiFiClass:1004017]))
          {
            v214 = [v4 objectForKeyedSubscript:@"SCRXDurationSISO"];
            [v214 doubleValue];
            double v317 = v215;
          }
          v216 = [v4 objectForKeyedSubscript:@"FRTSDuration"];
          [v216 doubleValue];
          double v316 = v217;

          if (v206 <= v203) {
            double v218 = v206;
          }
          else {
            double v218 = v203;
          }
          if (v200 <= v197) {
            double v219 = v200;
          }
          else {
            double v219 = v197;
          }
          double v323 = v219;
          double v55 = 0.0;
          if (v194 - v203 - v197 - v188 - v191 >= 0.0) {
            double v220 = v194 - v203 - v197 - v188 - v191;
          }
          else {
            double v220 = 0.0;
          }
          if (v210 <= v220) {
            double v221 = v210;
          }
          else {
            double v221 = v220;
          }
          double v319 = v218;
          double v321 = v221;
          v222 = +[PLUtilities powerModelForOperatorName:@"wifi"];
          v223 = [(PLWifiAgent *)self wifiChipsetQuery];
          id v327 = v222;
          v224 = [v222 objectForKeyedSubscript:v223];
          uint64_t v225 = [(PLWifiAgent *)self wifiManufacturerQuery];
          v226 = [v224 objectForKeyedSubscript:v225];

          if (v330 >= 0.0)
          {
            v325 = v226;
            int v333 = self;
            uint64_t v231 = @"5";
            if (v330 != 0.0)
            {
              v232 = @"2.4";
              if (v330 > 11.0) {
                v232 = @"5";
              }
              uint64_t v231 = v232;
            }
            uint64_t v233 = [v4 objectForKeyedSubscript:@"CurrentBandwidth"];
            [v233 doubleValue];
            unsigned int v235 = (int)v234;

            if (v235) {
              uint64_t v236 = v235;
            }
            else {
              uint64_t v236 = 20;
            }
            uint64_t v237 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v236);
            v238 = [v226 objectForKeyedSubscript:v231];
            v239 = [v238 objectForKeyedSubscript:v237];
            uint64_t v240 = [v239 objectForKeyedSubscript:@"mimo_tx"];
            [v240 doubleValue];
            double v312 = v241;

            v242 = [v226 objectForKeyedSubscript:v231];
            v243 = [v242 objectForKeyedSubscript:v237];
            v244 = [v243 objectForKeyedSubscript:@"mimo_rx"];
            [v244 doubleValue];
            double v246 = v245;

            v247 = [v226 objectForKeyedSubscript:v231];
            v248 = [v247 objectForKeyedSubscript:v237];
            uint64_t v249 = [v248 objectForKeyedSubscript:@"mimo_cs"];
            [v249 doubleValue];
            double v315 = v250;

            uint64_t v251 = [v226 objectForKeyedSubscript:v231];
            v252 = [v251 objectForKeyedSubscript:v237];
            uint64_t v253 = [v252 objectForKeyedSubscript:@"siso_tx"];
            [v253 doubleValue];
            double v311 = v254;

            v255 = [v226 objectForKeyedSubscript:v231];
            v256 = [v255 objectForKeyedSubscript:v237];
            uint64_t v257 = [v256 objectForKeyedSubscript:@"siso_rx"];
            [v257 doubleValue];
            double v310 = v258;

            v259 = [v226 objectForKeyedSubscript:v231];
            uint64_t v260 = [v259 objectForKeyedSubscript:v237];
            v261 = [v260 objectForKeyedSubscript:@"siso_cs"];
            [v261 doubleValue];
            double v313 = v262;

            v263 = [v226 objectForKeyedSubscript:v231];
            v264 = [v263 objectForKeyedSubscript:v237];
            v265 = [v264 objectForKeyedSubscript:@"ocl_cs"];
            [v265 doubleValue];
            double v309 = v266;

            double v267 = v321;
            if (([MEMORY[0x1E4F92A38] isWiFiClass:1004015] & 1) != 0
              || ([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
              || (double v268 = 0.0, [MEMORY[0x1E4F92A38] isWiFiClass:1004017]))
            {
              v269 = [v226 objectForKeyedSubscript:v231];
              uint64_t v270 = [v269 objectForKeyedSubscript:@"sc"];
              [v270 doubleValue];
              double v268 = v271;
            }
            double v272 = v203 - v319;
            self = v333;
            unint64_t v6 = 0x1E4F92000;
            if (([MEMORY[0x1E4F92A38] isWiFiClass:1004005] & 1) != 0
              || [MEMORY[0x1E4F92A38] isWiFiClass:1004007])
            {
              double v273 = v272 * v310 + v319 * v246;
              uint64_t v230 = v327;
            }
            else
            {
              double v308 = v246;
              v274 = [v4 objectForKeyedSubscript:@"OPSFullDuration"];
              [v274 doubleValue];
              double v276 = v275;

              v277 = [v4 objectForKeyedSubscript:@"OPSPartialDuration"];
              [v277 doubleValue];
              double v279 = v278;

              if (v276 < 0.0) {
                double v276 = 0.0;
              }
              if (v279 >= 0.0) {
                double v280 = v279;
              }
              else {
                double v280 = 0.0;
              }
              v281 = [v226 objectForKeyedSubscript:v231];
              v282 = [v281 objectForKeyedSubscript:v237];
              uint64_t v283 = [v282 objectForKeyedSubscript:@"ops_full"];
              [v283 doubleValue];
              double v307 = v284;

              v285 = [v226 objectForKeyedSubscript:v231];
              v286 = [v285 objectForKeyedSubscript:v237];
              unint64_t v287 = [v286 objectForKeyedSubscript:@"ops_partial"];
              [v287 doubleValue];
              double v289 = v288;

              double v290 = v272 * v310;
              uint64_t v230 = v327;
              if (v319 <= v276 + v280) {
                double v273 = v290 + v319 * v308;
              }
              else {
                double v273 = v290 + (v319 - v276 - v280) * v308 + v280 * v289 + v276 * v307;
              }
              self = v333;
              unint64_t v6 = 0x1E4F92000uLL;
              double v267 = v321;
            }
            double v291 = v220 - v267;
            if (([MEMORY[0x1E4F92A38] isWiFiClass:1004005] & 1) != 0
              || ([MEMORY[0x1E4F92A38] isDeviceClass:100020] & 1) != 0
              || ([MEMORY[0x1E4F92A38] isDeviceClass:100021] & 1) != 0
              || v314 > v267)
            {
              double v292 = v291 * v313 + v267 * v315;
            }
            else
            {
              double v292 = v314 * v309 + (v267 - v314) * v315 + v291 * v313;
            }
            if (([MEMORY[0x1E4F92A38] isWiFiClass:1004015] & 1) != 0
              || ([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
              || (double v293 = 0.0, [MEMORY[0x1E4F92A38] isWiFiClass:1004017]))
            {
              double v293 = v317 * v268;
            }
            double v294 = (v197 - v323) * v311 + v323 * v312;
            if ([*(id *)(v6 + 2496) debugEnabled])
            {
              uint64_t v295 = objc_opt_class();
              v335[0] = MEMORY[0x1E4F143A8];
              v335[1] = 3221225472;
              v335[2] = __30__PLWifiAgent_modelWiFiPower___block_invoke;
              v335[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v335[4] = v295;
              if (modelWiFiPower__defaultOnce != -1) {
                dispatch_once(&modelWiFiPower__defaultOnce, v335);
              }
              if (modelWiFiPower__classDebugEnabled)
              {
                unint64_t v296 = [NSString stringWithFormat:@"txE = %f, rxE = %f, csE = %f, scE = %f", *(void *)&v294, *(void *)&v273, *(void *)&v292, *(void *)&v293];
                v297 = (void *)MEMORY[0x1E4F929B8];
                unint64_t v298 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
                v299 = [v298 lastPathComponent];
                v300 = [NSString stringWithUTF8String:"-[PLWifiAgent modelWiFiPower:]"];
                [v297 logMessage:v296 fromFile:v299 fromFunction:v300 fromLineNumber:4826];

                uint64_t v301 = PLLogCommon();
                if (os_log_type_enabled(v301, OS_LOG_TYPE_DEBUG)) {
                  __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
                }

                self = v333;
                unint64_t v6 = 0x1E4F92000;
                uint64_t v230 = v327;
              }
            }
            double v302 = v294 + v273;
            if (v316 - v203 - v197 >= 0.0) {
              double v303 = v316 - v203 - v197;
            }
            else {
              double v303 = 0.0;
            }
            char v304 = [MEMORY[0x1E4F92A38] isWiFiClass:1004005];
            if (v303 >= v267)
            {
              if ((v304 & 1) != 0
                || ([MEMORY[0x1E4F92A38] isDeviceClass:100020] & 1) != 0
                || ([MEMORY[0x1E4F92A38] isDeviceClass:100021] & 1) != 0
                || v314 > v303)
              {
                double v305 = (v303 - v267) * v313 + v267 * v315;
              }
              else
              {
                double v305 = v314 * v309 + (v267 - v314) * v315 + (v303 - v267) * v313;
              }
            }
            else if ((v304 & 1) != 0 {
                   || ([MEMORY[0x1E4F92A38] isDeviceClass:100020] & 1) != 0
            }
                   || ([MEMORY[0x1E4F92A38] isDeviceClass:100021] & 1) != 0
                   || v314 > v303)
            {
              double v305 = v303 * v315;
            }
            else
            {
              double v305 = v314 * v309 + (v303 - v314) * v315;
            }
            double v54 = v302 + v292 + v293;
            if (v305 < 0.0) {
              double v305 = 0.0;
            }
            double v306 = v302 + v305;
            if (v330 == 0.0) {
              double v55 = 0.0;
            }
            else {
              double v55 = v306;
            }

            v226 = v325;
          }
          else
          {
            v227 = objc_msgSend(v226, "objectForKeyedSubscript:", @"scan", v330);
            [v227 doubleValue];
            double v229 = v228;

            double v54 = (v194 - v188 - v191) * v229;
            uint64_t v230 = v327;
          }
        }
        goto LABEL_43;
      }
      v85 = [v4 objectForKeyedSubscript:@"CurrentChannel"];
      [v85 doubleValue];
      double v87 = v86;

      uint64_t v88 = [v4 objectForKeyedSubscript:@"PMDuration"];
      [v88 doubleValue];
      double v90 = v89;

      uint64_t v91 = [v4 objectForKeyedSubscript:@"MPCDuration"];
      [v91 doubleValue];
      double v93 = v92;

      v94 = [v4 objectForKeyedSubscript:@"TimeDuration"];
      [v94 doubleValue];
      double v96 = v95;

      v97 = [v4 objectForKeyedSubscript:@"TXDuration"];
      [v97 doubleValue];
      double v99 = v98;

      v100 = [v4 objectForKeyedSubscript:@"RXDuration"];
      [v100 doubleValue];
      double v102 = v101;

      uint64_t v103 = [v4 objectForKeyedSubscript:@"FRTSDuration"];
      [v103 doubleValue];
      double v105 = v104;

      uint64_t v46 = +[PLUtilities powerModelForOperatorName:@"wifi"];
      uint64_t v106 = [(PLWifiAgent *)self wifiChipsetQuery];
      uint64_t v107 = [v46 objectForKeyedSubscript:v106];
      uint64_t v108 = [(PLWifiAgent *)self wifiManufacturerQuery];
      v50 = [v107 objectForKeyedSubscript:v108];

      if (v87 < 0.0)
      {
        v109 = [v50 objectForKeyedSubscript:@"scan"];
        [v109 doubleValue];
        double v111 = v110;

        double v54 = (v96 - v90 - v93) * v111;
        double v55 = 0.0;
LABEL_42:

LABEL_43:
        uint64_t v140 = [v4 objectForKeyedSubscript:@"LocationScanDuration"];
        [v140 doubleValue];
        double v142 = v141;

        v143 = [v4 objectForKeyedSubscript:@"PipelineScanDuration"];
        [v143 doubleValue];
        double v145 = v144;

        int v56 = +[PLUtilities powerModelForOperatorName:@"wifi"];
        v146 = [(PLWifiAgent *)self wifiChipset];
        v147 = [v56 objectForKeyedSubscript:v146];
        uint64_t v148 = [(PLWifiAgent *)self wifiManufacturer];
        v57 = [v147 objectForKeyedSubscript:v148];

        uint64_t v149 = [v57 objectForKeyedSubscript:@"scan"];
        [v149 doubleValue];
        double v151 = v150;

        double v152 = v142 * v151;
        BOOL v153 = v142 <= 0.0;
        double v154 = 0.0;
        if (v153) {
          double v155 = 0.0;
        }
        else {
          double v155 = v152;
        }
        if (v145 <= 0.0) {
          double v156 = 0.0;
        }
        else {
          double v156 = v145 * v151;
        }
        double v157 = v54 - v55 - v155 - v156;
        if (v55 < 0.0) {
          double v55 = 0.0;
        }
        if (v157 >= 0.0) {
          double v158 = v157;
        }
        else {
          double v158 = 0.0;
        }
        v159 = [v4 objectForKeyedSubscript:@"TimeDuration"];
        [v159 doubleValue];
        double v161 = v160;

        double v162 = 0.0;
        double v163 = 0.0;
        double v164 = 0.0;
        double v165 = 0.0;
        if (v161 > 0.0)
        {
          if (v156 >= 0.0) {
            double v166 = v156;
          }
          else {
            double v166 = 0.0;
          }
          if (v155 >= 0.0) {
            double v167 = v155;
          }
          else {
            double v167 = 0.0;
          }
          if (v54 >= 0.0) {
            double v168 = v54;
          }
          else {
            double v168 = 0.0;
          }
          double v154 = v168 / v161;
          double v163 = v167 / v161;
          BOOL v153 = v168 <= v55;
          double v164 = v166 / v161;
          if (v153)
          {
            if (v154 <= v163 + v164) {
              double v162 = 0.0;
            }
            else {
              double v162 = v154 - v163 - v164;
            }
          }
          else
          {
            double v162 = v55 / v161;
            double v165 = v158 / v161;
          }
        }
        double v169 = v162;
        double v170 = v164;
        double v171 = v163;
        if ([*(id *)(v6 + 2496) debugEnabled])
        {
          uint64_t v172 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __30__PLWifiAgent_modelWiFiPower___block_invoke_2453;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v172;
          if (modelWiFiPower__defaultOnce_2451 != -1) {
            dispatch_once(&modelWiFiPower__defaultOnce_2451, block);
          }
          if (modelWiFiPower__classDebugEnabled_2452)
          {
            v173 = self;
            v174 = [NSString stringWithFormat:@"wifi_power = %f, wifi_power_data = %f, wifi_power_locatiouint64_t n = %f, wifi_power_wow = %f, wifi_power_idle = %f", *(void *)&v154, *(void *)&v169, *(void *)&v171, 0, *(void *)&v165];
            v175 = (void *)MEMORY[0x1E4F929B8];
            unint64_t v176 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m"];
            v177 = [v176 lastPathComponent];
            unint64_t v178 = [NSString stringWithUTF8String:"-[PLWifiAgent modelWiFiPower:]"];
            [v175 logMessage:v174 fromFile:v177 fromFunction:v178 fromLineNumber:4943];

            v179 = PLLogCommon();
            if (os_log_type_enabled(v179, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }

            self = v173;
          }
        }
        if (+[PLUtilities isPowerlogHelperd])
        {
          v180 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"MetricMonitorInstantKeys"];
          v181 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v180];
          uint64_t v182 = [MEMORY[0x1E4F28ED0] numberWithDouble:v154];
          [v181 setObject:v182 forKeyedSubscript:@"WifiPower"];
          if ([(PLWifiAgent *)self wifiAwdlDevice])
          {
            [(PLWifiAgent *)self wifiAwdlDevice];
            WiFiDeviceClientCopyInterfaceStateInfo();
          }
          v336[0] = v181;
          v183 = [MEMORY[0x1E4F1C978] arrayWithObjects:v336 count:1];
          [(PLOperator *)self postEntries:v183];
        }
        else
        {
          v180 = [v4 entryDate];
          [(PLWifiAgent *)self modelWiFiSegmentPower:v180 withDataPower:v169 withIdlePower:v165 withLocationPower:v171 withPipelinePower:v170 withTotalDuration:v161 / 1000.0];
        }

        goto LABEL_82;
      }
      double v329 = v105;
      double v332 = v90;
      v112 = self;
      v113 = @"5";
      if (v87 != 0.0)
      {
        v114 = @"2.4";
        if (v87 > 11.0) {
          v114 = @"5";
        }
        v113 = v114;
      }
      v115 = [v4 objectForKeyedSubscript:@"CurrentBandwidth"];
      [v115 doubleValue];
      unsigned int v117 = (int)v116;

      if (v117) {
        uint64_t v118 = v117;
      }
      else {
        uint64_t v118 = 20;
      }
      v119 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v118);
      uint64_t v120 = [v50 objectForKeyedSubscript:v113];
      v121 = [v120 objectForKeyedSubscript:v119];
      v122 = [v121 objectForKeyedSubscript:@"tx"];
      [v122 doubleValue];
      double v124 = v123;

      v125 = [v50 objectForKeyedSubscript:v113];
      v126 = [v125 objectForKeyedSubscript:v119];
      v127 = [v126 objectForKeyedSubscript:@"rx"];
      [v127 doubleValue];
      double v129 = v128;

      v130 = [v50 objectForKeyedSubscript:v113];
      v131 = [v130 objectForKeyedSubscript:v119];
      uint64_t v132 = [v131 objectForKeyedSubscript:@"cs"];
      [v132 doubleValue];
      double v134 = v133;

      double v135 = v99 * v124;
      double v136 = v96 - v332 - v93 - v99 - v102;
      double v55 = 0.0;
      if (v136 < 0.0) {
        double v136 = 0.0;
      }
      double v137 = v136 * v134;
      double v138 = v135 + v102 * v129;
      if (v87 != 0.0)
      {
        double v139 = v329 - v102 - v99;
        if (v139 < 0.0) {
          double v139 = 0.0;
        }
        double v55 = v138 + v139 * v134;
      }
      double v54 = v138 + v137;

      self = v112;
    }
    unint64_t v6 = 0x1E4F92000uLL;
    goto LABEL_42;
  }
LABEL_83:
}

uint64_t __30__PLWifiAgent_modelWiFiPower___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  modelWiFiPower__classDebugEnabled = result;
  return result;
}

uint64_t __30__PLWifiAgent_modelWiFiPower___block_invoke_2453(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  modelWiFiPower__classDebugEnabled_2452 = result;
  return result;
}

- (void)modelWiFiSegmentPower:(id)a3 withDataPower:(double)a4 withIdlePower:(double)a5 withLocationPower:(double)a6 withPipelinePower:(double)a7 withTotalDuration:(double)a8
{
  id v24 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    [v24 timeIntervalSince1970];
    double v16 = v15;
    if (self->_wifi_segment_lastWrittenDate)
    {
      double wifi_segment_lastWrittenTimestamp = self->_wifi_segment_lastWrittenTimestamp;
      double v18 = self->_wifi_segment_timestamp - wifi_segment_lastWrittenTimestamp;
      double v19 = 0.0;
      double v20 = 0.0;
      double v21 = 0.0;
      double v22 = 0.0;
      if (v18 > 0.0)
      {
        double v19 = v18 * self->_wifi_segment_power_data;
        double v20 = v18 * self->_wifi_segment_power_idle;
        double v21 = v18 * self->_wifi_segment_power_location;
        double v22 = v18 * self->_wifi_segment_power_pipeline;
      }
      double v23 = v16 - wifi_segment_lastWrittenTimestamp;
      if (v23 > 0.0)
      {
        self->_wifi_segment_power_data = (v19 + a4 * a8) / v23;
        self->_wifi_segment_power_idle = (v20 + a5 * a8) / v23;
        self->_wifi_segment_power_locatiouint64_t n = (v21 + a6 * a8) / v23;
        self->_wifi_segment_power_pipeline = (v22 + a7 * a8) / v23;
        objc_storeStrong((id *)&self->_wifi_segment_date, a3);
        self->_wifi_segment_timestamp = v16;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_wifi_segment_lastWrittenDate, a3);
      self->_double wifi_segment_lastWrittenTimestamp = v16;
      objc_storeStrong((id *)&self->_wifi_segment_date, a3);
      self->_wifi_segment_timestamp = self->_wifi_segment_lastWrittenTimestamp;
      self->_wifi_segment_power_data = a4;
      self->_wifi_segment_power_idle = a5;
      self->_wifi_segment_power_locatiouint64_t n = a6;
      self->_wifi_segment_power_pipeline = a7;
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)writeModeledPower
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0
    && self->_wifi_segment_timestamp != self->_wifi_segment_lastWrittenTimestamp)
  {
    if (self->_wifi_segment_power_data > 2500.0) {
      self->_wifi_segment_power_data = 2500.0;
    }
    if (self->_wifi_segment_power_idle > 2500.0) {
      self->_wifi_segment_power_idle = 2500.0;
    }
    if (self->_wifi_segment_power_location > 2500.0) {
      self->_wifi_segment_power_locatiouint64_t n = 2500.0;
    }
    if (self->_wifi_segment_power_pipeline > 2500.0) {
      self->_wifi_segment_power_pipeline = 2500.0;
    }
    BOOL v3 = [MEMORY[0x1E4F92900] sharedInstance];
    [v3 createPowerEventBackwardWithRootNodeID:11 withPower:self->_wifi_segment_date withEndDate:self->_wifi_segment_power_data];

    id v4 = [MEMORY[0x1E4F92900] sharedInstance];
    [v4 createPowerEventBackwardWithRootNodeID:53 withPower:self->_wifi_segment_date withEndDate:self->_wifi_segment_power_idle];

    CFNumberRef v5 = [MEMORY[0x1E4F92900] sharedInstance];
    [v5 createPowerEventBackwardWithRootNodeID:12 withPower:self->_wifi_segment_date withEndDate:self->_wifi_segment_power_location];

    unint64_t v6 = [MEMORY[0x1E4F92900] sharedInstance];
    [v6 createPowerEventBackwardWithRootNodeID:13 withPower:self->_wifi_segment_date withEndDate:self->_wifi_segment_power_pipeline];

    objc_storeStrong((id *)&self->_wifi_segment_lastWrittenDate, self->_wifi_segment_date);
    self->_double wifi_segment_lastWrittenTimestamp = self->_wifi_segment_timestamp;
  }
}

- (void)handleRemoteSessionCallbackWithUserInfo:(id)a3
{
  BOOL v3 = [a3 objectForKey:@"entry"];
  if (v3)
  {
    id v7 = v3;
    id v4 = [v3 objectForKeyedSubscript:@"event"];

    CFNumberRef v5 = [MEMORY[0x1E4F92900] sharedInstance];
    unint64_t v6 = [v7 entryDate];
    if (v4) {
      [v5 createDistributionEventForwardWithDistributionID:11 withRemovingChildNodeName:@"ScreenContinuityShell" withStartDate:v6];
    }
    else {
      [v5 createDistributionEventForwardWithDistributionID:11 withAddingChildNodeName:@"ScreenContinuityShell" withStartDate:v6];
    }

    BOOL v3 = v7;
  }
}

- (PLEntry)lastEntryForHelperd
{
  return self->_lastEntryForHelperd;
}

- (void)setLastEntryForHelperd:(id)a3
{
}

- (PLCFNotificationOperatorComposition)notificationWiFiChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (__WiFiManagerClient)wifiManager
{
  return self->_wifiManager;
}

- (__WiFiDeviceClient)wifiDevice
{
  return self->_wifiDevice;
}

- (__WiFiDeviceClient)wifiAwdlDevice
{
  return self->_wifiAwdlDevice;
}

- (void)setWifiAwdlDevice:(__WiFiDeviceClient *)a3
{
  self->_wifiAwdlDevice = a3;
}

- (__WiFiDeviceClient)wifiHotspotDevice
{
  return self->_wifiHotspotDevice;
}

- (void)setWifiHotspotDevice:(__WiFiDeviceClient *)a3
{
  self->_wifiHotspotDevice = a3;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)sbcLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSbcLevelChanged:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)deviceWake
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDeviceWake:(id)a3
{
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)remoteControlSessionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRemoteControlSessionListener:(id)a3
{
}

- (unint64_t)lastLoggedTimestamp
{
  return self->_lastLoggedTimestamp;
}

- (void)setLastLoggedTimestamp:(unint64_t)a3
{
  self->_lastLoggedTimestamp = a3;
}

- (unint64_t)locationScanDuration
{
  return self->_locationScanDuration;
}

- (void)setLocationScanDuration:(unint64_t)a3
{
  self->_locationScanDuratiouint64_t n = a3;
}

- (unint64_t)pipelineScanDuration
{
  return self->_pipelineScanDuration;
}

- (void)setPipelineScanDuration:(unint64_t)a3
{
  self->_pipelineScanDuratiouint64_t n = a3;
}

- (unint64_t)autoJoinScanDuration
{
  return self->_autoJoinScanDuration;
}

- (void)setAutoJoinScanDuration:(unint64_t)a3
{
  self->_autoJoinScanDuratiouint64_t n = a3;
}

- (unint64_t)setupScanDuration
{
  return self->_setupScanDuration;
}

- (void)setSetupScanDuration:(unint64_t)a3
{
  self->_setupScanDuratiouint64_t n = a3;
}

- (unint64_t)unknownScanDuration
{
  return self->_unknownScanDuration;
}

- (void)setUnknownScanDuration:(unint64_t)a3
{
  self->_unknownScanDuratiouint64_t n = a3;
}

- (WiFiP2PAWDLStateMonitor)monitor
{
  return (WiFiP2PAWDLStateMonitor *)objc_getProperty(self, a2, 184, 1);
}

- (void)setMonitor:(id)a3
{
}

- (NSString)wifiChipset
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (NSString)wifiManufacturer
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (unint64_t)remainingAllowedRSSIEntryCount
{
  return self->_remainingAllowedRSSIEntryCount;
}

- (void)setRemainingAllowedRSSIEntryCount:(unint64_t)a3
{
  self->_remainingAllowedRSSIEntryCount = a3;
}

- (double)wifi_segment_power_data
{
  return self->_wifi_segment_power_data;
}

- (void)setWifi_segment_power_data:(double)a3
{
  self->_wifi_segment_power_data = a3;
}

- (double)wifi_segment_power_idle
{
  return self->_wifi_segment_power_idle;
}

- (void)setWifi_segment_power_idle:(double)a3
{
  self->_wifi_segment_power_idle = a3;
}

- (double)wifi_segment_power_location
{
  return self->_wifi_segment_power_location;
}

- (void)setWifi_segment_power_location:(double)a3
{
  self->_wifi_segment_power_locatiouint64_t n = a3;
}

- (double)wifi_segment_power_pipeline
{
  return self->_wifi_segment_power_pipeline;
}

- (void)setWifi_segment_power_pipeline:(double)a3
{
  self->_wifi_segment_power_pipeline = a3;
}

- (NSDate)wifi_segment_lastWrittenDate
{
  return (NSDate *)objc_getProperty(self, a2, 248, 1);
}

- (void)setWifi_segment_lastWrittenDate:(id)a3
{
}

- (double)wifi_segment_lastWrittenTimestamp
{
  return self->_wifi_segment_lastWrittenTimestamp;
}

- (void)setWifi_segment_lastWrittenTimestamp:(double)a3
{
  self->_double wifi_segment_lastWrittenTimestamp = a3;
}

- (NSDate)wifi_segment_date
{
  return (NSDate *)objc_getProperty(self, a2, 264, 1);
}

- (void)setWifi_segment_date:(id)a3
{
}

- (double)wifi_segment_timestamp
{
  return self->_wifi_segment_timestamp;
}

- (void)setWifi_segment_timestamp:(double)a3
{
  self->_wifi_segment_timestamp = a3;
}

- (PLEntryNotificationOperatorComposition)remoteSessionCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 280, 1);
}

- (void)setRemoteSessionCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteSessionCallback, 0);
  objc_storeStrong((id *)&self->_wifi_segment_date, 0);
  objc_storeStrong((id *)&self->_wifi_segment_lastWrittenDate, 0);
  objc_storeStrong((id *)&self->_wifiManufacturer, 0);
  objc_storeStrong((id *)&self->_wifiChipset, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_remoteControlSessionListener, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_deviceWake, 0);
  objc_storeStrong((id *)&self->_sbcLevelChanged, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->_notificationWiFiChanged, 0);
  objc_storeStrong((id *)&self->_lastEntryForHelperd, 0);
}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke_819_cold_1()
{
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "cellFallbackObserver could not be created", v1, 2u);
}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke_841_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "RemoteControlSession payload: %@", v2, v3, v4, v5, v6);
}

- (void)logEventBackwardWifiProperties:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "wifi properties: %@", v2, v3, v4, v5, v6);
}

@end