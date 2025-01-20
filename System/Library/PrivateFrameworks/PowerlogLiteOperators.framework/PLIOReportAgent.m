@interface PLIOReportAgent
+ (BOOL)hasAOMSupport;
+ (BOOL)hasAOPSupport;
+ (BOOL)hasMesa;
+ (BOOL)hasPlatinumCapability;
+ (BOOL)isOldLostPerfLoggingModel;
+ (BOOL)shouldLogAmcStatsPerfCounters;
+ (BOOL)shouldLogAtAppSwitchTrigger;
+ (BOOL)shouldLogAudioEvent;
+ (BOOL)shouldLogDCPScanoutStats;
+ (BOOL)shouldLogMTRAging;
+ (BOOL)shouldLogMemCacheStats;
+ (BOOL)shouldLogOpticalInterfaceStats;
+ (BOOL)shouldLogSleepMedia;
+ (BOOL)shouldLogSoCStats;
+ (BOOL)shouldLogSocStatsEvents;
+ (BOOL)shouldLogSocStatsPmgrCounters;
+ (BOOL)shouldLogThermalUPOLimiting;
+ (id)energyKeyToRootNodeID;
+ (id)entryEventBackwardDefinition3DTouchforce;
+ (id)entryEventBackwardDefinition3DTouchluna;
+ (id)entryEventBackwardDefinitionAMCStatsPerfCounters;
+ (id)entryEventBackwardDefinitionANS2PCIE0;
+ (id)entryEventBackwardDefinitionAOPAOPAudioFW;
+ (id)entryEventBackwardDefinitionAOPAOPSensors;
+ (id)entryEventBackwardDefinitionAOPAOP_Haptics;
+ (id)entryEventBackwardDefinitionAOPAmpPower;
+ (id)entryEventBackwardDefinitionAOPMConnectorPower;
+ (id)entryEventBackwardDefinitionAOPPerformance;
+ (id)entryEventBackwardDefinitionAOPPowerState;
+ (id)entryEventBackwardDefinitionAOPProx;
+ (id)entryEventBackwardDefinitionAOPaccelpower;
+ (id)entryEventBackwardDefinitionAOPcmareceived;
+ (id)entryEventBackwardDefinitionAOPcompasspower;
+ (id)entryEventBackwardDefinitionAOPgyropower;
+ (id)entryEventBackwardDefinitionAOPgyroreceived;
+ (id)entryEventBackwardDefinitionAOPlasreceived;
+ (id)entryEventBackwardDefinitionAOPmuxPower;
+ (id)entryEventBackwardDefinitionAOPpressurepower;
+ (id)entryEventBackwardDefinitionActuatorPowerState;
+ (id)entryEventBackwardDefinitionAppleEmbeddedPCIELinkStates;
+ (id)entryEventBackwardDefinitionBluetooth;
+ (id)entryEventBackwardDefinitionBonnLisaStats;
+ (id)entryEventBackwardDefinitionCPUStatsActiveTimeHistogram;
+ (id)entryEventBackwardDefinitionCPUStatsCPUComplexPerformanceStatesData;
+ (id)entryEventBackwardDefinitionCPUStatsCPUComplexThermalUPOLimiting;
+ (id)entryEventBackwardDefinitionCPUStatsCPUComplexVoltageStateTime;
+ (id)entryEventBackwardDefinitionCPUStatsCPUCorePerformanceStatesData;
+ (id)entryEventBackwardDefinitionCPUStatsCPUEvents;
+ (id)entryEventBackwardDefinitionCPUStatsDVDStats;
+ (id)entryEventBackwardDefinitionCPUStatsVoltageDomainPerformanceStates;
+ (id)entryEventBackwardDefinitionCarnelianVaxholmStats;
+ (id)entryEventBackwardDefinitionCorePerformanceLevelResidency;
+ (id)entryEventBackwardDefinitionCoronetPowerStats;
+ (id)entryEventBackwardDefinitionDCPEXT0Scanout;
+ (id)entryEventBackwardDefinitionDCPEXT0Swap;
+ (id)entryEventBackwardDefinitionDCPEXT1Scanout;
+ (id)entryEventBackwardDefinitionDCPEXT1Swap;
+ (id)entryEventBackwardDefinitionDCPEXT2Scanout;
+ (id)entryEventBackwardDefinitionDCPEXT2Swap;
+ (id)entryEventBackwardDefinitionDCPEXT3Scanout;
+ (id)entryEventBackwardDefinitionDCPEXT3Swap;
+ (id)entryEventBackwardDefinitionDCPScanout;
+ (id)entryEventBackwardDefinitionDCPScanoutStats;
+ (id)entryEventBackwardDefinitionDCPSwap;
+ (id)entryEventBackwardDefinitionDisplay;
+ (id)entryEventBackwardDefinitionDisplayPuvloB;
+ (id)entryEventBackwardDefinitionEnergyModel;
+ (id)entryEventBackwardDefinitionGPUCStates;
+ (id)entryEventBackwardDefinitionGPUStatsActiveTimeHistogram;
+ (id)entryEventBackwardDefinitionGPUStatsDVDRequestStates;
+ (id)entryEventBackwardDefinitionGPUStatsGPUCLTM;
+ (id)entryEventBackwardDefinitionGPUStatsGPUPerformanceStates;
+ (id)entryEventBackwardDefinitionGPUStatsIdleTimeHistogram;
+ (id)entryEventBackwardDefinitionH11ANEH11ANEEvents;
+ (id)entryEventBackwardDefinitionH11ANEH11ANEPowerState;
+ (id)entryEventBackwardDefinitionH13ISPH13ISPEvents;
+ (id)entryEventBackwardDefinitionH6ISPH6ISPPowerState;
+ (id)entryEventBackwardDefinitionHapticsStats;
+ (id)entryEventBackwardDefinitionIOMFBFrameRatePhase;
+ (id)entryEventBackwardDefinitionIOMFBNativeRate;
+ (id)entryEventBackwardDefinitionIOMFBScanout;
+ (id)entryEventBackwardDefinitionIOMFBSwap;
+ (id)entryEventBackwardDefinitionIOMFBUSRHistogram;
+ (id)entryEventBackwardDefinitionIOReport;
+ (id)entryEventBackwardDefinitionMTPCaptureButton;
+ (id)entryEventBackwardDefinitionMTPIOPState;
+ (id)entryEventBackwardDefinitionMTPPower;
+ (id)entryEventBackwardDefinitionMTRAging;
+ (id)entryEventBackwardDefinitionMemCacheStats;
+ (id)entryEventBackwardDefinitionMesaMesaPowerState;
+ (id)entryEventBackwardDefinitionMultitouch;
+ (id)entryEventBackwardDefinitionMultitouchCPUStats;
+ (id)entryEventBackwardDefinitionMultitouchHighLevelStats;
+ (id)entryEventBackwardDefinitionNVMe;
+ (id)entryEventBackwardDefinitionNVMeBWLimits;
+ (id)entryEventBackwardDefinitionNVMeTimeweightedthrottlestatistics;
+ (id)entryEventBackwardDefinitionOpticalInterfaceStats;
+ (id)entryEventBackwardDefinitionPMP0PWRS0;
+ (id)entryEventBackwardDefinitionPMPDCS;
+ (id)entryEventBackwardDefinitionPMPDRAMBW;
+ (id)entryEventBackwardDefinitionPMPDRAMState;
+ (id)entryEventBackwardDefinitionPMPEnergyCounters;
+ (id)entryEventBackwardDefinitionPMPFAB;
+ (id)entryEventBackwardDefinitionPMPFabricBW;
+ (id)entryEventBackwardDefinitionPMPPMCDCSFloor;
+ (id)entryEventBackwardDefinitionPMPPMCSOCFloor;
+ (id)entryEventBackwardDefinitionPMPPWRS0;
+ (id)entryEventBackwardDefinitionPMPPerfDrivers;
+ (id)entryEventBackwardDefinitionPMPSOC;
+ (id)entryEventBackwardDefinitionPMPSOC0;
+ (id)entryEventBackwardDefinitionPPMStatsCPMSFerocity;
+ (id)entryEventBackwardDefinitionPPMStatsCPMSLanesEngagement;
+ (id)entryEventBackwardDefinitionPPMStatsCPMSPowerReduction;
+ (id)entryEventBackwardDefinitionPPMStatsDroopController;
+ (id)entryEventBackwardDefinitionPPMStatsPeakPowerPressure;
+ (id)entryEventBackwardDefinitionPPMStatsPolicyCPMS;
+ (id)entryEventBackwardDefinitionPRLUsageAttCheck;
+ (id)entryEventBackwardDefinitionPRLUsageBCheck;
+ (id)entryEventBackwardDefinitionPRLUsageJOn;
+ (id)entryEventBackwardDefinitionPRLUsagePreCheck;
+ (id)entryEventBackwardDefinitionPRLUsageProCheck;
+ (id)entryEventBackwardDefinitionPRLUsageRStandby;
+ (id)entryEventBackwardDefinitionSDXCController;
+ (id)entryEventBackwardDefinitionSIOIOPState;
+ (id)entryEventBackwardDefinitionSIOPower;
+ (id)entryEventBackwardDefinitionSMCPower;
+ (id)entryEventBackwardDefinitionSoCStatsClusterPowerStates;
+ (id)entryEventBackwardDefinitionSoCStatsDeviceStates;
+ (id)entryEventBackwardDefinitionSoCStatsDeviceStatesChannelID;
+ (id)entryEventBackwardDefinitionSoCStatsEvents;
+ (id)entryEventBackwardDefinitionSoCStatsEventsRaw;
+ (id)entryEventBackwardDefinitionSoCStatsH6PMGRCounters;
+ (id)entryEventBackwardDefinitionSoCStatsVoltageDomainPerformanceStates;
+ (id)entryEventBackwardDefinitionSocStatsDvdStats;
+ (id)entryEventBackwardDefinitionSpeakerPowerState;
+ (id)entryEventBackwardDefinitionSpeakerSpeakerEvents;
+ (id)entryEventBackwardDefinitionTrackpadPowerStats;
+ (id)entryEventBackwardDefinitionVDDOK1;
+ (id)entryEventBackwardDefinitionVDDOK2;
+ (id)entryEventBackwardDefinitionWLANPowerConnections;
+ (id)entryEventBackwardDefinitionWLANPowerPhyActivity;
+ (id)entryEventBackwardDefinitionWLANPowerPhyScan;
+ (id)entryEventBackwardDefinitionWifiChipAWDLActivity;
+ (id)entryEventBackwardDefinitionWifiChipConnectionActivity;
+ (id)entryEventBackwardDefinitionWifiChipHSICActivity;
+ (id)entryEventBackwardDefinitionWifiChipPCIeActivity;
+ (id)entryEventBackwardDefinitionWifiChipPMAwakeActivity;
+ (id)entryEventBackwardDefinitionWifiChipRadioPhyicalLayerActivity;
+ (id)entryEventBackwardDefinitionWifiChipRxChipErrorCounters;
+ (id)entryEventBackwardDefinitionWifiChipRxPerRateCounters;
+ (id)entryEventBackwardDefinitionWifiChipRxStatCounters;
+ (id)entryEventBackwardDefinitionWifiChipScanActivity;
+ (id)entryEventBackwardDefinitionWifiChipTxChipErrorCounters;
+ (id)entryEventBackwardDefinitionWifiChipTxStatCounters;
+ (id)entryEventBackwardDefinitionbacklightreportplaybackbacklightfactorsreport;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionMemCacheLabels;
+ (id)entryEventForwardDefinitionSoCStatsOprtp;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventPointDefinitionPmtelemetry_Flex;
+ (id)entryEventPointDefinitionSampleSaturation;
+ (id)entryEventPointDefinitions;
+ (id)keyForSubBlock:(int)a3;
+ (void)load;
- (BOOL)allowlistedChannelID:(unint64_t)a3;
- (BOOL)collectionEnabled;
- (BOOL)fgAppChangedSince:(unint64_t)a3;
- (BOOL)processNotificationForChannelGroup:(id)a3;
- (NSDate)lastFgAppSwitch;
- (NSDate)lastSampleDate;
- (NSDictionary)entryTransformation;
- (NSMutableArray)sampledBundleIDs;
- (NSMutableDictionary)sampleChannelsAudioEvent;
- (NSMutableDictionary)sampleChannelsDaily;
- (NSMutableDictionary)sampleChannelsDisplayStateChange;
- (NSMutableDictionary)sampleChannelsHalfHour;
- (NSMutableDictionary)sampleChannelsScreenState;
- (NSMutableDictionary)sampleChannelsSignificantBattery;
- (NSMutableDictionary)sampleChannelsSnapshot;
- (NSMutableDictionary)sampleChannelsWake;
- (NSString)lastFgApp;
- (PLEntryNotificationOperatorComposition)batteryLevelChangedNotifications;
- (PLEntryNotificationOperatorComposition)displayOffNotification;
- (PLEntryNotificationOperatorComposition)displayOnNotification;
- (PLEntryNotificationOperatorComposition)displayStateChangeNotification;
- (PLEntryNotificationOperatorComposition)screenstateChangedNotifications;
- (PLEntryNotificationOperatorComposition)sleepNotification;
- (PLEntryNotificationOperatorComposition)wakeNotification;
- (PLIOKitOperatorComposition)iokitAging;
- (PLIOKitOperatorComposition)iokitAudio;
- (PLIOReportAgent)init;
- (PLIOReportAgentIOReportStats)SoCIOReportStats;
- (PLIOReportStats)deviceStates;
- (PLMonotonicTimer)displayOffTimer;
- (PLNSNotificationOperatorComposition)enhancedScreenStateChangeListener;
- (PLNSNotificationOperatorComposition)thermalMonitorListener;
- (PLStateTrackingComposition)stateTracker;
- (id)allowSamplingMemCacheStats:(id)a3;
- (id)buildAudioEventSet:(IOReportGroupChecks *)a3;
- (id)buildBaseSet:(IOReportGroupChecks *)a3;
- (id)buildDailySet:(IOReportGroupChecks *)a3;
- (id)buildDisplayStateChangeSet:(IOReportGroupChecks *)a3;
- (id)buildHalfHourSet:(IOReportGroupChecks *)a3;
- (id)buildScreenStateSet:(IOReportGroupChecks *)a3;
- (id)buildSnapshotSet:(IOReportGroupChecks *)a3;
- (id)buildWakeSet:(IOReportGroupChecks *)a3;
- (id)channelDictionaryWithChannelSet:(id)a3 withMinProcessTime:(double)a4;
- (id)entryForReportingGroup:(id)a3 withKey:(id)a4 withChannelGroup:(id)a5 withEntryDate:(id)a6;
- (id)entryKeyForEventWithGroupName:(id)a3 withSubGroupName:(id)a4;
- (id)getBucketName:(int)a3;
- (id)sampleDeltaForChannelGroup:(id)a3;
- (id)sampleSnapshotForChannelGroup:(id)a3;
- (int)addReportSample:(__CFDictionary *)a3 toEntry:(id)a4;
- (int)getAOPSensorsChannelId:(id)a3;
- (int)getChannelId:(id)a3;
- (int)getComplexVoltageStateTimeChannelId:(id)a3;
- (int)getCoreChannelId:(id)a3;
- (int64_t)AOPTotalThreadTime;
- (unsigned)memCacheDriverConn;
- (void)addReportingGroup:(id)a3 toEntry:(id)a4;
- (void)connectToMemCacheDriver;
- (void)initOperatorDependancies;
- (void)initTaskOperatorDependancies;
- (void)log;
- (void)logDisplayOffAPWakeStats;
- (void)logEngagementToCA:(id)a3;
- (void)logEventBackwardAOPAOPSensors:(id)a3;
- (void)logEventBackwardAOPPerformance:(id)a3 withChannels:(id)a4;
- (void)logEventBackwardAOPPowerState:(id)a3 withChannels:(id)a4;
- (void)logEventBackwardComplexPerformanceStates:(id)a3;
- (void)logEventBackwardComplexThermalUPOLimiting:(id)a3 withChannels:(id)a4;
- (void)logEventBackwardComplexVoltageStateTime:(id)a3 withChannels:(id)a4;
- (void)logEventBackwardCorePerformanceStates:(id)a3 withChannels:(id)a4;
- (void)logEventBackwardIOReport;
- (void)logEventBackwardIOReportAtAudioEvent;
- (void)logEventBackwardIOReportAtDisplayOffAPWake;
- (void)logEventBackwardIOReportAtDisplayStateChange;
- (void)logEventBackwardIOReportAtScreenStateChange:(id)a3;
- (void)logEventBackwardIOReportAtWake;
- (void)logEventBackwardIOReportWithDelta:(id)a3 forChannelGroup:(id)a4;
- (void)logEventBackwardMTRAging;
- (void)logEventBackwardMemCacheStats:(id)a3;
- (void)logEventBackwardMemCacheStatsAtScreenStateChange:(id)a3;
- (void)logEventBackwardSoCStatsDeviceStatesChannelID:(id)a3 withChannelGroup:(id)a4 withEntryDate:(id)a5;
- (void)logEventForwardMemCacheLabels;
- (void)logEventForwardSoCStatsOperatingPoints;
- (void)logEventPointIOReport;
- (void)logEventPointIOReportSaturation:(id)a3;
- (void)logEventPointPMTelemetryFlex;
- (void)logSOCHOT0Snapshot:(id)a3;
- (void)logSnapshotValues:(id)a3;
- (void)logStateResidency:(id)a3 withKey:(id)a4 withEntryDate:(id)a5;
- (void)modelAPSoCPower:(id)a3;
- (void)modelPMPAPSocPower:(id)a3;
- (void)readAndLogMemCacheStats;
- (void)sampleDeltaForChannelSets;
- (void)setAOPTotalThreadTime:(int64_t)a3;
- (void)setBatteryLevelChangedNotifications:(id)a3;
- (void)setCollectionEnabled:(BOOL)a3;
- (void)setDeviceStates:(id)a3;
- (void)setDisplayOffNotification:(id)a3;
- (void)setDisplayOffTimer:(id)a3;
- (void)setDisplayOnNotification:(id)a3;
- (void)setDisplayStateChangeNotification:(id)a3;
- (void)setEnhancedScreenStateChangeListener:(id)a3;
- (void)setEntryTransformation:(id)a3;
- (void)setLastFgApp:(id)a3;
- (void)setLastFgAppSwitch:(id)a3;
- (void)setLastSampleDate:(id)a3;
- (void)setMemCacheDriverConn:(unsigned int)a3;
- (void)setSampleChannelsAudioEvent:(id)a3;
- (void)setSampleChannelsDaily:(id)a3;
- (void)setSampleChannelsDisplayStateChange:(id)a3;
- (void)setSampleChannelsHalfHour:(id)a3;
- (void)setSampleChannelsScreenState:(id)a3;
- (void)setSampleChannelsSignificantBattery:(id)a3;
- (void)setSampleChannelsSnapshot:(id)a3;
- (void)setSampleChannelsWake:(id)a3;
- (void)setSampledBundleIDs:(id)a3;
- (void)setScreenstateChangedNotifications:(id)a3;
- (void)setSleepNotification:(id)a3;
- (void)setSoCIOReportStats:(id)a3;
- (void)setStateTracker:(id)a3;
- (void)setThermalMonitorListener:(id)a3;
- (void)setWakeNotification:(id)a3;
- (void)startDisplayOffPeriodicTimer;
- (void)stopDisplayOffPeriodicTimer;
- (void)subscribeToChannelSets;
- (void)triggerMemCacheLogging:(id)a3 withDelay:(unint64_t)a4;
@end

@implementation PLIOReportAgent

uint64_t __45__PLIOReportAgent_addReportingGroup_toEntry___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addReportSample:a2 toEntry:*(void *)(a1 + 40)];
}

uint64_t __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8689(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) logEventBackwardMemCacheStatsAtScreenStateChange:a2];
  }
  return result;
}

- (void)logEventBackwardMemCacheStatsAtScreenStateChange:(id)a3
{
  id v4 = a3;
  if (+[PLIOReportAgent shouldLogMemCacheStats]) {
    [(PLIOReportAgent *)self logEventBackwardMemCacheStats:v4];
  }
}

+ (BOOL)shouldLogMemCacheStats
{
  if (qword_1EBD58428 != -1) {
    dispatch_once(&qword_1EBD58428, &__block_literal_global_8273);
  }
  return byte_1EBD583D5;
}

uint64_t __59__PLIOReportAgent_logStateResidency_withKey_withEntryDate___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IOReportChannelGetChannelName();
  uint64_t v3 = [*(id *)(a1 + 32) getChannelId:v2];
  int Count = IOReportStateGetCount();
  v5 = PLLogIOReport();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v2;
    __int16 v15 = 1024;
    int v16 = Count;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Logging IOReport Core Performance Level Residency channel %@ with %d states", buf, 0x12u);
  }
  v12 = (void *)v2;

  if (Count >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 40) withDate:*(void *)(a1 + 48)];
      v8 = [NSNumber numberWithInt:v3];
      [v7 setObject:v8 forKeyedSubscript:@"Channel"];

      v9 = [NSNumber numberWithInt:v6];
      [v7 setObject:v9 forKeyedSubscript:@"State"];

      v10 = [NSNumber numberWithUnsignedLongLong:IOReportStateGetResidency()];
      [v7 setObject:v10 forKeyedSubscript:@"Residency"];

      [*(id *)(a1 + 56) addObject:v7];
      uint64_t v6 = (v6 + 1);
    }
    while (Count != v6);
  }

  return 0;
}

uint64_t __49__PLIOReportAgent_logEventBackwardAOPAOPSensors___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IOReportChannelGetChannelName();
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"AOPAOPSensors"];
  uint64_t v5 = [*(id *)(a1 + 32) getAOPSensorsChannelId:v2];
  int Count = IOReportStateGetCount();
  v7 = PLLogIOReport();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v2;
    __int16 v19 = 1024;
    int v20 = Count;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Logging IOReport AOP Sensors channel %@ with %d states", buf, 0x12u);
  }
  int v16 = (void *)v2;

  if (Count >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      if (v5 <= 7)
      {
        v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withDate:v3];
        v10 = [NSNumber numberWithInt:v5];
        [v9 setObject:v10 forKeyedSubscript:@"Channel"];

        v11 = [NSNumber numberWithInt:v8];
        [v9 setObject:v11 forKeyedSubscript:@"State"];

        v12 = NSNumber;
        IOReportStateGetDutyCycle();
        v13 = objc_msgSend(v12, "numberWithDouble:");
        [v9 setObject:v13 forKeyedSubscript:@"DutyCycle"];

        uint64_t v14 = [NSNumber numberWithUnsignedLongLong:IOReportStateGetInTransitions()];
        [v9 setObject:v14 forKeyedSubscript:@"Transitions"];

        [*(id *)(a1 + 32) logEntry:v9];
      }
      uint64_t v8 = (v8 + 1);
    }
    while (Count != v8);
  }

  return 0;
}

- (int)getAOPSensorsChannelId:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"accel"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"als"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"compass"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"compass_1"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"gyro"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"hgaccel"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"pressure"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 7;
    if (([v3 isEqualToString:@"Prox"] & 1) == 0)
    {
      if ([v3 isEqualToString:@"prox"]) {
        int v4 = 7;
      }
      else {
        int v4 = -1;
      }
    }
  }

  return v4;
}

- (int)getChannelId:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"CPU"] & 1) != 0
    || ([v3 isEqualToString:@"ECPU"] & 1) != 0)
  {
    int v4 = 0;
  }
  else if (([v3 isEqualToString:@"CPM"] & 1) != 0 {
         || ([v3 isEqualToString:@"ECPM"] & 1) != 0)
  }
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PCPU"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PCPM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PCPM1"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PCPU1"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

id __37__PLIOReportAgent_logEngagementToCA___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"area"];
  id v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
  [v2 setObject:v3 forKeyedSubscript:@"timeScale"];

  int v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:1];
  [v2 setObject:v4 forKeyedSubscript:@"bin"];

  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  [v2 setObject:v5 forKeyedSubscript:@"residency"];

  return v2;
}

- (void)logEventBackwardIOReportWithDelta:(id)a3 forChannelGroup:(id)a4
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D942A350]();
  v85 = v6;
  if (v6)
  {
    context = v8;
    v92 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    if ([(PLOperator *)self isDebugEnabled])
    {
      v9 = NSString;
      v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSince1970];
      v12 = objc_msgSend(v9, "stringWithFormat:", @"/tmp/delta_%f.plist", v11);
      [v85 writeToFile:v12 atomically:1];
    }
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    v13 = [v85 objectForKey:@"IOReportChannelGroups"];
    uint64_t v14 = [v13 allKeys];

    id obj = v14;
    uint64_t v86 = [v14 countByEnumeratingWithState:&v118 objects:v126 count:16];
    if (v86)
    {
      uint64_t v84 = *(void *)v119;
      uint64_t v91 = *MEMORY[0x1E4F92D28];
      v89 = self;
      id v90 = v7;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v119 != v84) {
            objc_enumerationMutation(obj);
          }
          uint64_t v88 = v15;
          int v16 = *(void **)(*((void *)&v118 + 1) + 8 * v15);
          v87 = (void *)MEMORY[0x1D942A350]();
          uint64_t v17 = [v85 objectForKey:@"IOReportChannelGroups"];
          uint64_t v18 = [v17 objectForKey:v16];

          __int16 v19 = [v18 objectForKey:@"IOReportChannelGroups"];
          int v20 = [v19 allKeys];
          uint64_t v21 = [v20 count];

          v100 = v18;
          v105 = v16;
          if (v21)
          {
            [(PLIOReportAgent *)self setAOPTotalThreadTime:0];
            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            v22 = [v18 objectForKey:@"IOReportChannelGroups"];
            v23 = [v22 allKeys];

            id v102 = v23;
            uint64_t v104 = [v23 countByEnumeratingWithState:&v113 objects:v123 count:16];
            if (!v104)
            {
              v96 = 0;
              v97 = 0;
              v24 = 0;
              goto LABEL_106;
            }
            v96 = 0;
            v97 = 0;
            v24 = 0;
            uint64_t v103 = *(void *)v114;
            while (1)
            {
              uint64_t v25 = 0;
              do
              {
                if (*(void *)v114 != v103) {
                  objc_enumerationMutation(v102);
                }
                v26 = *(void **)(*((void *)&v113 + 1) + 8 * v25);
                v27 = [v18 objectForKey:@"IOReportChannelGroups"];
                uint64_t v106 = [v27 objectForKey:v26];

                if ([v105 isEqualToString:@"CPU Stats"]
                  && [v26 isEqualToString:@"CPU Complex Performance States"])
                {
                  v28 = (void *)v106;
                  [(PLIOReportAgent *)self logEventBackwardComplexPerformanceStates:v106];
LABEL_48:
                  v36 = 0;
                  goto LABEL_49;
                }
                if ([v105 isEqualToString:@"CPU Stats"]
                  && [v26 isEqualToString:@"CPU Core Performance States"])
                {
                  v28 = (void *)v106;
                  [(PLIOReportAgent *)self logEventBackwardCorePerformanceStates:v106 withChannels:v7];
                  goto LABEL_48;
                }
                if ([v105 isEqualToString:@"CPU Stats"]
                  && [v26 isEqualToString:@"CPU Complex Thermal/UPO Limiting"])
                {
                  v28 = (void *)v106;
                  [(PLIOReportAgent *)self logEventBackwardComplexThermalUPOLimiting:v106 withChannels:v7];
                  goto LABEL_48;
                }
                if ([v105 isEqualToString:@"CPU Stats"]
                  && [v26 isEqualToString:@"CPU Complex Voltage State Time"])
                {
                  v28 = (void *)v106;
                  [(PLIOReportAgent *)self logEventBackwardComplexVoltageStateTime:v106 withChannels:v7];
                  goto LABEL_48;
                }
                if (![v105 isEqualToString:@"AOP"]
                  || ([v26 isEqualToString:@"Power"] & 1) == 0
                  && ![v26 isEqualToString:@"Performance"])
                {
                  if ([v105 isEqualToString:@"AOP"]
                    && [v26 isEqualToString:@"AOP Sensors"])
                  {
                    v28 = (void *)v106;
                    [(PLIOReportAgent *)self logEventBackwardAOPAOPSensors:v106];
                    goto LABEL_48;
                  }
                  if ([v105 isEqualToString:@"IOMFB Reporting"])
                  {
                    if ([v26 isEqualToString:@"Total native/custom refresh rate"])
                    {
                      if ([MEMORY[0x1E4F92A38] hasCapability:4])
                      {
                        uint64_t v31 = v91;
                        v32 = @"IOMFBNativeRate";
                        goto LABEL_64;
                      }
LABEL_67:
                      uint64_t v38 = +[PLOperator entryKeyForType:v91 andName:@"IOReport"];
                      int v98 = 1;
                      goto LABEL_68;
                    }
                    if ([v26 isEqualToString:@"Subframes per swap request"])
                    {
                      uint64_t v31 = v91;
                      v32 = @"IOMFBSwapHistogram";
                    }
                    else if ([v26 isEqualToString:@"Subframes per scanout"])
                    {
                      uint64_t v31 = v91;
                      v32 = @"IOMFBScanoutHistogram";
                    }
                    else if ([v26 isEqualToString:@"frame rate phase"])
                    {
                      uint64_t v31 = v91;
                      v32 = @"IOMFBFrameRatePhase";
                    }
                    else
                    {
                      uint64_t v31 = v91;
                      v32 = @"IOMFBUSRHistogram";
                    }
LABEL_64:
                    uint64_t v37 = +[PLOperator entryKeyForType:v31 andName:v32];
                  }
                  else
                  {
                    if ([v105 isEqualToString:@"SoC Stats"]
                      && [v26 isEqualToString:@"Device States"])
                    {
                      if (([MEMORY[0x1E4F929C0] BOOLForKey:@"enable_SoCStatsDeviceStates" ifNotSet:0] & 1) == 0)
                      {
                        v28 = (void *)v106;
                        [(PLIOReportAgent *)self logEventBackwardSoCStatsDeviceStatesChannelID:v106 withChannelGroup:v7 withEntryDate:v92];
                        goto LABEL_48;
                      }
                      uint64_t v31 = v91;
                      v32 = @"SoCStatsDeviceStates";
                      goto LABEL_64;
                    }
                    if ([v105 isEqualToString:@"H16ISP"]
                      && [v26 isEqualToString:@"H16ISP Events"])
                    {
                      uint64_t v31 = v91;
                      v32 = @"H13ISPH13ISPEvents";
                      goto LABEL_64;
                    }
                    uint64_t v37 = [(PLIOReportAgent *)self entryKeyForEventWithGroupName:v105 withSubGroupName:v26];
                  }
                  uint64_t v38 = v37;
                  if (!v37) {
                    goto LABEL_67;
                  }
                  int v98 = 0;
LABEL_68:
                  v99 = (void *)v38;
                  v39 = [(PLIOReportAgent *)self entryForReportingGroup:v106 withKey:v38 withChannelGroup:v7 withEntryDate:v92];

                  v101 = v39;
                  if ([v26 isEqualToString:@"Energy Counters"])
                  {
                    [(PLIOReportAgent *)self modelPMPAPSocPower:v39];
                  }
                  else if (([v26 isEqualToString:@"CPMS Lanes engagement"] & 1) != 0 {
                         || ([v26 isEqualToString:@"CPMS Ferocity"] & 1) != 0
                  }
                         || ([v26 isEqualToString:@"CPMS Power Reduction"] & 1) != 0
                         || ([v26 isEqualToString:@"Policy CPMS"] & 1) != 0
                         || [v26 isEqualToString:@"Peak Power Pressure"])
                  {
                    [(PLIOReportAgent *)self logEngagementToCA:v39];
                  }
                  else if ([v105 isEqualToString:@"Trackpad Power Stats"] {
                         && [v26 isEqualToString:@"Trackpad Power State Time (ms)"])
                  }
                  {
                    v93 = objc_opt_new();
                    long long v109 = 0u;
                    long long v110 = 0u;
                    long long v111 = 0u;
                    long long v112 = 0u;
                    id v95 = [v39 definedKeys];
                    uint64_t v50 = [v95 countByEnumeratingWithState:&v109 objects:v122 count:16];
                    if (v50)
                    {
                      uint64_t v51 = v50;
                      uint64_t v52 = *(void *)v110;
                      do
                      {
                        uint64_t v53 = 0;
                        uint64_t v94 = v51;
                        do
                        {
                          if (*(void *)v110 != v52) {
                            objc_enumerationMutation(v95);
                          }
                          v54 = *(void **)(*((void *)&v109 + 1) + 8 * v53);
                          if (([v54 isEqualToString:@"SampleTime"] & 1) == 0)
                          {
                            v55 = NSNumber;
                            v56 = (void *)MEMORY[0x1E4F92A88];
                            v57 = [v101 objectForKeyedSubscript:v54];
                            v58 = objc_msgSend(v55, "numberWithInt:", objc_msgSend(v56, "roundToSigFig:withSigFig:", objc_msgSend(v57, "intValue"), 3));
                            [v101 setObject:v58 forKeyedSubscript:v54];

                            v59 = NSNumber;
                            v60 = (void *)MEMORY[0x1E4F92A88];
                            v61 = [v101 objectForKeyedSubscript:v54];
                            v62 = objc_msgSend(v59, "numberWithInt:", objc_msgSend(v60, "roundToSigFig:withSigFig:", objc_msgSend(v61, "intValue"), 3));
                            [v93 setObject:v62 forKeyedSubscript:v54];

                            uint64_t v51 = v94;
                          }
                          ++v53;
                        }
                        while (v51 != v53);
                        uint64_t v51 = [v95 countByEnumeratingWithState:&v109 objects:v122 count:16];
                      }
                      while (v51);
                    }

                    block[5] = MEMORY[0x1E4F143A8];
                    block[6] = 3221225472;
                    block[7] = __69__PLIOReportAgent_logEventBackwardIOReportWithDelta_forChannelGroup___block_invoke_9558;
                    block[8] = &unk_1E692A2A0;
                    id v108 = v93;
                    id v63 = v93;
                    AnalyticsSendEventLazy();

                    self = v89;
                    id v7 = v90;
                    v39 = v101;
                  }
                  if (v98)
                  {
                    [v39 setObject:v105 forKeyedSubscript:@"Group"];
                    [v39 setObject:v26 forKeyedSubscript:@"SubGroup"];
                  }
                  [v39 allValues];
                  v41 = v40 = v39;
                  uint64_t v42 = [v41 count];

                  if (v42)
                  {
                    uint64_t v18 = v100;
                    v28 = (void *)v106;
                    v24 = v40;
                    if ([MEMORY[0x1E4F929C0] debugEnabled])
                    {
                      uint64_t v43 = objc_opt_class();
                      block[0] = MEMORY[0x1E4F143A8];
                      block[1] = 3221225472;
                      block[2] = __69__PLIOReportAgent_logEventBackwardIOReportWithDelta_forChannelGroup___block_invoke_2;
                      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                      block[4] = v43;
                      if (qword_1EBD584B8 != -1) {
                        dispatch_once(&qword_1EBD584B8, block);
                      }
                      if (byte_1EBD583E1)
                      {
                        v44 = [NSString stringWithFormat:@"!!! entry=%@ !!!", v40];
                        v45 = (void *)MEMORY[0x1E4F929B8];
                        v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLIOReportAgent.m"];
                        v47 = [v46 lastPathComponent];
                        v48 = [NSString stringWithUTF8String:"-[PLIOReportAgent logEventBackwardIOReportWithDelta:forChannelGroup:]"];
                        [v45 logMessage:v44 fromFile:v47 fromFunction:v48 fromLineNumber:10817];

                        v49 = PLLogCommon();
                        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412290;
                          v125 = v44;
                          _os_log_debug_impl(&dword_1D2690000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                        }

                        self = v89;
                        id v7 = v90;
                        uint64_t v18 = v100;
                        v24 = v101;
                      }
                    }
                    [(PLOperator *)self logEntry:v24];
                  }
                  else
                  {
                    v24 = v40;
                    uint64_t v18 = v100;
                    v28 = (void *)v106;
                  }
                  v36 = v99;
                  goto LABEL_49;
                }
                if ([v26 isEqualToString:@"Power"])
                {
                  v29 = v96;
                  v30 = v97;
                  v28 = (void *)v106;
                  v96 = (void *)v106;
LABEL_44:
                  id v35 = v28;

                  v34 = v30;
                  goto LABEL_45;
                }
                int v33 = [v26 isEqualToString:@"Performance"];
                v34 = v97;
                v29 = v97;
                v28 = (void *)v106;
                v30 = (void *)v106;
                if (v33) {
                  goto LABEL_44;
                }
LABEL_45:
                v36 = 0;
                v97 = v34;
                if (v34)
                {
                  uint64_t v18 = v100;
                  if (!v96) {
                    goto LABEL_49;
                  }
                  -[PLIOReportAgent logEventBackwardAOPPerformance:withChannels:](self, "logEventBackwardAOPPerformance:withChannels:");
                  [(PLIOReportAgent *)self logEventBackwardAOPPowerState:v96 withChannels:v7];
                  goto LABEL_48;
                }
                uint64_t v18 = v100;
LABEL_49:

                ++v25;
              }
              while (v25 != v104);
              uint64_t v64 = [v102 countByEnumeratingWithState:&v113 objects:v123 count:16];
              uint64_t v104 = v64;
              if (!v64)
              {
LABEL_106:

                goto LABEL_125;
              }
            }
          }
          if ([v16 isEqualToString:@"Core Performance Level"])
          {
            [(PLIOReportAgent *)self logStateResidency:v18 withKey:@"PLIOReportAgent_EventBackward_CorePerformanceLevelResidency" withEntryDate:v92];
          }
          else
          {
            uint64_t v65 = [(PLIOReportAgent *)self entryKeyForEventWithGroupName:v16 withSubGroupName:0];
            v66 = (void *)v65;
            if (!v65)
            {
              v66 = +[PLOperator entryKeyForType:v91 andName:@"IOReport"];
            }
            v67 = [(PLIOReportAgent *)self entryForReportingGroup:v18 withKey:v66 withChannelGroup:v7 withEntryDate:v92];
            if ([v16 isEqualToString:@"Energy Model"])
            {
              v68 = [v67 objectForKey:@"GPU Energy"];

              if (v68)
              {
                v69 = NSNumber;
                v70 = [v67 objectForKeyedSubscript:@"GPU Energy"];
                [v70 doubleValue];
                v72 = [v69 numberWithDouble:v71 * 0.000001];
                [v67 setObject:v72 forKeyedSubscript:@"GPU Energy"];

                uint64_t v18 = v100;
              }
              [(PLIOReportAgent *)self modelAPSoCPower:v67];
            }
            if (!v65)
            {
              [v67 setObject:v16 forKeyedSubscript:@"Group"];
              [v67 setObject:0 forKeyedSubscript:@"SubGroup"];
            }
            v73 = [v67 allValues];
            uint64_t v74 = [v73 count];

            if (v74)
            {
              if ([MEMORY[0x1E4F929C0] debugEnabled])
              {
                uint64_t v75 = objc_opt_class();
                v117[0] = MEMORY[0x1E4F143A8];
                v117[1] = 3221225472;
                v117[2] = __69__PLIOReportAgent_logEventBackwardIOReportWithDelta_forChannelGroup___block_invoke;
                v117[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v117[4] = v75;
                if (qword_1EBD584B0 != -1) {
                  dispatch_once(&qword_1EBD584B0, v117);
                }
                if (byte_1EBD583E0)
                {
                  v76 = [NSString stringWithFormat:@"!!! entry=%@ !!!", v67];
                  v77 = (void *)MEMORY[0x1E4F929B8];
                  v78 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLIOReportAgent.m"];
                  v79 = [v78 lastPathComponent];
                  v80 = [NSString stringWithUTF8String:"-[PLIOReportAgent logEventBackwardIOReportWithDelta:forChannelGroup:]"];
                  [v77 logMessage:v76 fromFile:v79 fromFunction:v80 fromLineNumber:10680];

                  v81 = PLLogCommon();
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v125 = v76;
                    _os_log_debug_impl(&dword_1D2690000, v81, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  self = v89;
                  id v7 = v90;
                  uint64_t v18 = v100;
                }
              }
              [(PLOperator *)self logEntry:v67];
            }
          }
LABEL_125:

          uint64_t v15 = v88 + 1;
        }
        while (v88 + 1 != v86);
        uint64_t v86 = [obj countByEnumeratingWithState:&v118 objects:v126 count:16];
      }
      while (v86);
    }

    uint64_t v8 = context;
  }
}

- (id)entryKeyForEventWithGroupName:(id)a3 withSubGroupName:(id)a4
{
  id v5 = a4;
  id v6 = [a3 stringByReplacingOccurrencesOfStrings:&unk_1F29ED8E0 withString:&stru_1F294E108];
  if (v5)
  {
    id v7 = [v5 stringByReplacingOccurrencesOfStrings:&unk_1F29ED8E0 withString:&stru_1F294E108];
    uint64_t v8 = *MEMORY[0x1E4F92D28];
    v9 = [NSString stringWithFormat:@"%@%@", v6, v7];
    v10 = +[PLOperator entryKeyForType:v8 andName:v9];
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F92D28];
    id v7 = [NSString stringWithFormat:@"%@", v6];
    v10 = +[PLOperator entryKeyForType:v11 andName:v7];
  }

  v12 = [MEMORY[0x1E4F929D8] definitionForEntryKey:v10];

  if (!v12)
  {

    v10 = 0;
  }

  return v10;
}

- (id)entryForReportingGroup:(id)a3 withKey:(id)a4 withChannelGroup:(id)a5 withEntryDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (objc_class *)MEMORY[0x1E4F929D0];
  id v14 = a6;
  uint64_t v15 = (void *)[[v13 alloc] initWithEntryKey:v11 withDate:v14];

  int v16 = NSNumber;
  uint64_t v17 = [v12 objectForKey:@"currentSampleDate"];
  uint64_t v18 = [v12 objectForKey:@"lastSampleDate"];
  [v17 timeIntervalSinceDate:v18];
  __int16 v19 = objc_msgSend(v16, "numberWithDouble:");
  [v15 setObject:v19 forKeyedSubscript:@"SampleTime"];

  if (qword_1EBD58480 != -1) {
    dispatch_once(&qword_1EBD58480, &__block_literal_global_8788);
  }
  if ([(id)qword_1EBD58488 containsObject:v11])
  {
    int v20 = [v12 objectForKey:@"currentSampleAPWakeTime"];
    uint64_t v21 = [v20 unsignedLongLongValue];

    v22 = [v12 objectForKey:@"lastSampleAPWakeTime"];
    uint64_t v23 = [v22 unsignedLongLongValue];

    v24 = NSNumber;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v21];
    double v26 = v25;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v23];
    v28 = [v24 numberWithDouble:v26 - v27];
    [v15 setObject:v28 forKeyedSubscript:@"APWakeTime"];
  }
  [(PLIOReportAgent *)self addReportingGroup:v10 toEntry:v15];

  return v15;
}

- (void)addReportingGroup:(id)a3 toEntry:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  IOReportIterate();
}

- (void)logEngagementToCA:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [v3 definedKeys];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __37__PLIOReportAgent_logEngagementToCA___block_invoke;
  id v14 = &unk_1E692CDD8;
  id v6 = v3;
  id v15 = v6;
  id v7 = v4;
  id v16 = v7;
  [v5 enumerateObjectsUsingBlock:&v11];

  if (objc_msgSend(v7, "count", v11, v12, v13, v14))
  {
    uint64_t v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v7 count];
      id v10 = [v6 entryKey];
      *(_DWORD *)buf = 134218242;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      int v20 = v10;
      _os_log_impl(&dword_1D2690000, v8, OS_LOG_TYPE_INFO, "cpms: pushing %lu keys to aggd for entry key %@", buf, 0x16u);
    }
    MEMORY[0x1D94294D0](v7, 0);
  }
}

- (void)setAOPTotalThreadTime:(int64_t)a3
{
  self->_AOPTotalThreadTime = a3;
}

void __37__PLIOReportAgent_logEngagementToCA___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:@"SampleTime"] & 1) == 0)
  {
    if ([v3 containsString:@"LanesEng"])
    {
      id v4 = [v3 componentsSeparatedByString:@"_"];
      if ([v4 count] != 2)
      {
LABEL_15:

        id v4 = [NSString stringWithFormat:@"com.apple.power.battery.cpms.%@", v3];
        if ([v4 containsString:@"%"])
        {
          uint64_t v19 = [v4 stringByReplacingOccurrencesOfString:@"%" withString:&stru_1F294E108];

          id v4 = (id)v19;
        }
        if (![v3 containsString:@"_Transitions"])
        {
          uint64_t v21 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
          [v21 doubleValue];
          double v23 = v22;

          uint64_t v8 = [NSNumber numberWithUnsignedLongLong:(unint64_t)(v23 * 1000.0)];
          [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v4];
          goto LABEL_21;
        }
        int v20 = NSNumber;
        uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
        id v10 = objc_msgSend(v20, "numberWithInt:", objc_msgSend(v8, "intValue"));
        [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v4];
LABEL_19:

LABEL_21:
        goto LABEL_22;
      }
      id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
      [v5 doubleValue];
      unint64_t v7 = (unint64_t)(v6 * 1000.0);

      if (!v7)
      {
LABEL_22:

        goto LABEL_23;
      }
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      uint64_t v31 = __37__PLIOReportAgent_logEngagementToCA___block_invoke_2;
      v32 = &unk_1E692CD60;
      id v4 = v4;
      id v33 = v4;
      unint64_t v34 = v7;
      AnalyticsSendEventLazy();
      uint64_t v8 = v4;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v3, "substringWithRange:", 0, 3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v3 substringFromIndex:3];
    uint64_t v8 = [v9 stringByReplacingOccurrencesOfString:@"%" withString:&stru_1F294E108];

    id v10 = [v8 componentsSeparatedByString:@"_"];
    uint64_t v11 = [v10 count];
    if (v11 == 2)
    {
      id v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
      [v16 doubleValue];
      unint64_t v18 = (unint64_t)(v17 * 1000.0);

      if (!v18) {
        goto LABEL_19;
      }
      id v14 = &v24;
      id v24 = v4;
      id v15 = (id *)v25;
      v25[0] = v10;
      v25[1] = v18;
    }
    else
    {
      if (v11 != 3)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
      int v13 = [v12 intValue];

      if (v13 < 1) {
        goto LABEL_19;
      }
      v25[2] = MEMORY[0x1E4F143A8];
      v25[3] = 3221225472;
      v25[4] = __37__PLIOReportAgent_logEngagementToCA___block_invoke_3;
      v25[5] = &unk_1E692CD88;
      id v14 = &v26;
      id v26 = v4;
      id v15 = &v27;
      id v27 = v10;
      int v28 = v13;
    }
    AnalyticsSendEventLazy();

    goto LABEL_13;
  }
LABEL_23:
}

- (int)addReportSample:(__CFDictionary *)a3 toEntry:(id)a4
{
  id v4 = a4;
  uint64_t v5 = MEMORY[0x1D942A350]();
  double v6 = IOReportChannelGetGroup();
  unint64_t v7 = IOReportChannelGetSubGroup();
  uint64_t v8 = IOReportChannelGetChannelName();
  if ([v6 isEqualToString:@"Energy Model"]
    && [v8 containsString:@"ECPUDTL"])
  {
    uint64_t v9 = @"ECPUDTL";
    id v10 = @"CPUDTL";
  }
  else
  {
    if (![v6 isEqualToString:@"AppleEmbeddedPCIE"]
      || ![v7 isEqualToString:@"Link States"])
    {
      goto LABEL_8;
    }
    uint64_t v9 = @"PCIe Port ";
    id v10 = @"Port ";
  }
  uint64_t v11 = [v8 stringByReplacingOccurrencesOfString:v9 withString:v10];

  uint64_t v8 = (void *)v11;
LABEL_8:
  if (IOReportChannelGetUnit())
  {
    uint64_t v12 = [NSString stringWithFormat:@" %@", IOReportChannelGetUnitLabel()];
  }
  else
  {
    uint64_t v12 = &stru_1F294E108;
  }
  int Format = IOReportChannelGetFormat();
  uint64_t v84 = v4;
  context = (void *)v5;
  v78 = v12;
  v79 = v7;
  switch(Format)
  {
    case 3:
      v77 = v8;
      if ([v8 isEqualToString:@"IOMFBUSR"])
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ((int)IOReportHistogramGetBucketCount() >= 1)
        {
          int v16 = 0;
          do
          {
            IOReportHistogramGetBucketBounds();
            double v17 = [NSNumber numberWithUnsignedLongLong:IOReportHistogramGetBucketHits()];
            [v15 addObject:v17];

            ++v16;
          }
          while (v16 < (int)IOReportHistogramGetBucketCount());
        }
        [v4 setObject:v15 forKeyedSubscript:@"IOMFBUSR"];
      }
      else
      {
        if (([v8 isEqualToString:@"subframes"] & 1) == 0)
        {
          if ((int)IOReportHistogramGetBucketCount() >= 1)
          {
            int v56 = 0;
            do
            {
              IOReportHistogramGetBucketBounds();
              v57 = [NSNumber numberWithUnsignedLongLong:IOReportHistogramGetBucketHits()];
              v58 = NSString;
              IOReportScaleValue();
              uint64_t v60 = v59;
              IOReportScaleValue();
              v62 = [v58 stringWithFormat:@"%.1f%@-%.1f%@", v60, @"ms", v61, @"ms"];
              [v4 setObject:v57 forKeyedSubscript:v62];

              ++v56;
            }
            while (v56 < (int)IOReportHistogramGetBucketCount());
          }
          goto LABEL_29;
        }
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ((int)IOReportHistogramGetBucketCount() >= 1)
        {
          int v21 = 0;
          do
          {
            IOReportHistogramGetBucketBounds();
            double v22 = [NSNumber numberWithUnsignedLongLong:IOReportHistogramGetBucketHits()];
            [v15 addObject:v22];

            ++v21;
          }
          while (v21 < (int)IOReportHistogramGetBucketCount());
        }
        double v23 = [v15 objectAtIndexedSubscript:0];
        [v4 setObject:v23 forKeyedSubscript:@"subframes_0"];

        id v24 = [v15 objectAtIndexedSubscript:1];
        [v4 setObject:v24 forKeyedSubscript:@"subframes_1"];

        double v25 = [v15 objectAtIndexedSubscript:2];
        [v4 setObject:v25 forKeyedSubscript:@"subframes_2"];

        id v26 = [v15 objectAtIndexedSubscript:3];
        [v4 setObject:v26 forKeyedSubscript:@"subframes_3"];

        id v27 = [v15 objectAtIndexedSubscript:4];
        [v4 setObject:v27 forKeyedSubscript:@"subframes_4"];

        int v28 = [v15 objectAtIndexedSubscript:5];
        [v4 setObject:v28 forKeyedSubscript:@"subframes_5"];

        uint64_t v29 = [v15 objectAtIndexedSubscript:6];
        [v4 setObject:v29 forKeyedSubscript:@"subframes_6"];

        uint64_t v30 = [v15 objectAtIndexedSubscript:7];
        [v4 setObject:v30 forKeyedSubscript:@"subframes_7"];

        uint64_t v31 = [v15 objectAtIndexedSubscript:8];
        [v4 setObject:v31 forKeyedSubscript:@"subframes_8"];

        v32 = [v15 objectAtIndexedSubscript:9];
        [v4 setObject:v32 forKeyedSubscript:@"subframes_9"];

        id v33 = [v15 objectAtIndexedSubscript:10];
        [v4 setObject:v33 forKeyedSubscript:@"subframes_10"];
      }
LABEL_29:
      uint64_t v8 = v77;
      break;
    case 2:
      if (IOReportStateGetCount() == 2)
      {
        unint64_t v18 = v8;
        uint64_t v19 = [v4 entryKey];
        if ([v19 containsString:@"CPUStatsCPUEvents"])
        {
          char v20 = 1;
        }
        else
        {
          v47 = [v4 entryKey];
          char v20 = [v47 isEqualToString:@"SMCPower"];
        }
        if ((int)IOReportStateGetCount() < 1)
        {
LABEL_66:
          id v14 = [NSNumber numberWithUnsignedLongLong:IOReportStateGetInTransitions()];
          uint64_t v8 = v18;
          v54 = [NSString stringWithFormat:@"%@_Transitions", v18];
          [v84 setObject:v14 forKeyedSubscript:v54];

          goto LABEL_67;
        }
        uint64_t v48 = 0;
        while (1)
        {
          v49 = IOReportStateGetNameForIndex();
          if (!v49) {
            break;
          }
          uint64_t v50 = v49;
          if ([v49 caseInsensitiveCompare:@"OFF"]) {
            goto LABEL_61;
          }
LABEL_65:

          uint64_t v48 = (v48 + 1);
          if ((int)v48 >= (int)IOReportStateGetCount()) {
            goto LABEL_66;
          }
        }
        uint64_t v50 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v48);
LABEL_61:
        uint64_t v51 = [NSString stringWithFormat:@"%@_%@", v18, v50];
        uint64_t v52 = NSNumber;
        if (v20)
        {
          [NSNumber numberWithUnsignedLongLong:IOReportStateGetResidency()];
        }
        else
        {
          IOReportStateGetDutyCycle();
          objc_msgSend(v52, "numberWithDouble:");
        uint64_t v53 = };
        [v84 setObject:v53 forKeyedSubscript:v51];

        goto LABEL_65;
      }
      if ([v6 isEqualToString:@"Multitouch"]
        && ([v8 isEqualToString:@"High Level"] & 1) != 0
        || [v6 isEqualToString:@"3DTouch"]
        && ([v8 isEqualToString:@"force_POWER_STATES"] & 1) != 0
        || ([v6 isEqualToString:@"Bluetooth"] & 1) != 0
        || ([v6 isEqualToString:@"NVMe"] & 1) != 0
        || ([v6 isEqualToString:@"Display"] & 1) != 0)
      {
        char v34 = 1;
      }
      else
      {
        v68 = [v4 entryKey];
        if ([v68 containsString:@"AOPgyropower"])
        {
          char v34 = 1;
        }
        else
        {
          double v71 = [v4 entryKey];
          if ([v71 containsString:@"AOPcompasspower"])
          {
            char v34 = 1;
          }
          else
          {
            v72 = v8;
            v73 = [v4 entryKey];
            if ([v73 containsString:@"AOPpressurepower"])
            {
              char v34 = 1;
            }
            else
            {
              uint64_t v74 = [v4 entryKey];
              if ([v74 containsString:@"AOPaccelpower"])
              {
                char v75 = 1;
              }
              else
              {
                v76 = [v4 entryKey];
                char v75 = [v76 containsString:@"AOPMConnectorPower"];

                id v4 = v84;
              }

              char v34 = v75;
            }

            uint64_t v8 = v72;
          }
        }
      }
      id v35 = [v4 entryKey];
      if (([v35 containsString:@"PPMStatsCPMSLanesengagement"] & 1) == 0)
      {
        v36 = [v4 entryKey];
        if (![v36 containsString:@"PPMStatsCPMSFerocity"])
        {
          id v63 = v8;
          uint64_t v64 = [v4 entryKey];
          if (![v64 containsString:@"PPMStatsCPMSPowerReduction"])
          {
            char v82 = v34;
            uint64_t v65 = [v4 entryKey];
            v66 = v4;
            char v67 = [v65 containsString:@"SDXCController"];

            if (v67)
            {
              int v83 = 1;
              uint64_t v8 = v63;
              char v34 = v82;
            }
            else
            {
              v69 = [v66 entryKey];
              char v70 = [v69 containsString:@"AOPProx"];

              uint64_t v8 = v63;
              char v34 = v82;
              if ((v70 & 1) == 0)
              {
                id v35 = [v66 entryKey];
                int v83 = [v35 containsString:@"MTPbuttoncapture"];
                goto LABEL_42;
              }
              int v83 = 1;
            }
LABEL_43:
            if ((int)IOReportStateGetCount() >= 1)
            {
              uint64_t v37 = 0;
              char v81 = v83 | v34;
              do
              {
                uint64_t v38 = IOReportStateGetNameForIndex();
                if (!v38)
                {
                  uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v37);
                }
                v39 = [NSString stringWithFormat:@"%@_%@", v8, v38];
                v40 = NSNumber;
                if (v81)
                {
                  [NSNumber numberWithUnsignedLongLong:IOReportStateGetResidency()];
                }
                else
                {
                  IOReportStateGetDutyCycle();
                  objc_msgSend(v40, "numberWithDouble:");
                v41 = };
                [v84 setObject:v41 forKeyedSubscript:v39];

                uint64_t v42 = [NSNumber numberWithUnsignedLongLong:IOReportStateGetInTransitions()];
                uint64_t v43 = v8;
                v44 = [NSString stringWithFormat:@"%@_%@_Transitions", v8, v38];
                [v84 setObject:v42 forKeyedSubscript:v44];

                if (v83)
                {
                  IOReportStateGetResidency();
                  v45 = NSNumber;
                  IOReportScaleValue();
                  v46 = objc_msgSend(v45, "numberWithDouble:");
                  [v84 setObject:v46 forKeyedSubscript:v39];
                }
                uint64_t v37 = (v37 + 1);
                uint64_t v8 = v43;
              }
              while ((int)v37 < (int)IOReportStateGetCount());
            }
            break;
          }

          int v83 = 1;
          uint64_t v8 = v63;
LABEL_42:

          goto LABEL_43;
        }
      }
      int v83 = 1;
      goto LABEL_42;
    case 1:
      id v14 = [NSNumber numberWithLongLong:IOReportSimpleGetIntegerValue()];
      [v4 setObject:v14 forKeyedSubscript:v8];
LABEL_67:

      break;
  }

  return 0;
}

void __43__PLIOReportAgent_initOperatorDependancies__block_invoke_3_8702(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLLogIOReport();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Notification from ThermalMonitor: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardIOReport];
}

- (void)logEventBackwardIOReport
{
  id v3 = [(PLIOReportAgent *)self sampleChannelsSignificantBattery];
  BOOL v4 = [(PLIOReportAgent *)self processNotificationForChannelGroup:v3];

  if (v4)
  {
    int v5 = [(PLIOReportAgent *)self sampleChannelsSignificantBattery];
    id v6 = [(PLIOReportAgent *)self sampleDeltaForChannelGroup:v5];
    uint64_t v7 = [(PLIOReportAgent *)self sampleChannelsSignificantBattery];
    [(PLIOReportAgent *)self logEventBackwardIOReportWithDelta:v6 forChannelGroup:v7];
  }
  uint64_t v8 = [(PLIOReportAgent *)self sampleChannelsHalfHour];
  BOOL v9 = [(PLIOReportAgent *)self processNotificationForChannelGroup:v8];

  if (v9)
  {
    id v10 = [(PLIOReportAgent *)self sampleChannelsHalfHour];
    uint64_t v11 = [(PLIOReportAgent *)self sampleDeltaForChannelGroup:v10];
    uint64_t v12 = [(PLIOReportAgent *)self sampleChannelsHalfHour];
    [(PLIOReportAgent *)self logEventBackwardIOReportWithDelta:v11 forChannelGroup:v12];
  }
  int v13 = [(PLIOReportAgent *)self sampleChannelsDaily];
  BOOL v14 = [(PLIOReportAgent *)self processNotificationForChannelGroup:v13];

  if (v14)
  {
    id v17 = [(PLIOReportAgent *)self sampleChannelsDaily];
    id v15 = [(PLIOReportAgent *)self sampleDeltaForChannelGroup:v17];
    int v16 = [(PLIOReportAgent *)self sampleChannelsDaily];
    [(PLIOReportAgent *)self logEventBackwardIOReportWithDelta:v15 forChannelGroup:v16];
  }
}

- (BOOL)processNotificationForChannelGroup:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([MEMORY[0x1E4F929C0] debugEnabled] & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PLIOReportAgent_processNotificationForChannelGroup___block_invoke;
    block[3] = &unk_1E692B928;
    double v22 = @"PLDebugService_Enabled";
    char v23 = 0;
    if (qword_1EBD58468 != -1) {
      dispatch_once(&qword_1EBD58468, block);
    }
    int v4 = byte_1EBD583DD;

    if (!v4)
    {
      if (v3)
      {
        uint64_t v7 = [v3 objectForKey:@"lastNotificationDate"];

        if (!v7) {
          goto LABEL_10;
        }
        uint64_t v8 = [v3 objectForKey:@"lastNotificationDate"];
        [v8 timeIntervalSinceNow];
        double v10 = v9;
        uint64_t v11 = [v3 objectForKey:@"minNotificationProcessTime"];
        double v12 = (double)(int)[v11 intValue];

        if (v10 < v12)
        {
LABEL_10:
          int v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
          [v3 setValue:v13 forKey:@"lastNotificationDate"];
          BOOL v5 = 1;
LABEL_11:

          goto LABEL_6;
        }
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v14 = objc_opt_class();
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __54__PLIOReportAgent_processNotificationForChannelGroup___block_invoke_2;
          v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v20[4] = v14;
          if (qword_1EBD58470 != -1) {
            dispatch_once(&qword_1EBD58470, v20);
          }
          if (byte_1EBD583DE)
          {
            int v13 = [NSString stringWithFormat:@"did not log due to process notification time limit"];
            id v15 = (void *)MEMORY[0x1E4F929B8];
            int v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLIOReportAgent.m"];
            id v17 = [v16 lastPathComponent];
            unint64_t v18 = [NSString stringWithUTF8String:"-[PLIOReportAgent processNotificationForChannelGroup:]"];
            [v15 logMessage:v13 fromFile:v17 fromFunction:v18 fromLineNumber:8855];

            uint64_t v19 = PLLogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              double v25 = v13;
              _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            BOOL v5 = 0;
            goto LABEL_11;
          }
        }
      }
      BOOL v5 = 0;
      goto LABEL_6;
    }
  }
  BOOL v5 = 1;
LABEL_6:

  return v5;
}

- (NSMutableDictionary)sampleChannelsSignificantBattery
{
  return self->_sampleChannelsSignificantBattery;
}

- (NSMutableDictionary)sampleChannelsHalfHour
{
  return self->_sampleChannelsHalfHour;
}

- (NSMutableDictionary)sampleChannelsDaily
{
  return self->_sampleChannelsDaily;
}

- (id)sampleDeltaForChannelGroup:(id)a3
{
  id v3 = a3;
  int v4 = (void *)MEMORY[0x1D942A350]();
  if (v3)
  {
    BOOL v5 = [v3 objectForKey:@"currentSample"];
    [v3 setValue:v5 forKey:@"lastSample"];

    id v6 = [v3 objectForKey:@"currentSampleDate"];
    [v3 setValue:v6 forKey:@"lastSampleDate"];

    uint64_t v7 = [v3 objectForKey:@"currentSampleAPWakeTime"];
    [v3 setValue:v7 forKey:@"lastSampleAPWakeTime"];

    [v3 objectForKey:@"subscription"];
    [v3 objectForKey:@"subscribedChannels"];
    Samples = (void *)IOReportCreateSamples();
    double v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v3 setValue:v9 forKey:@"currentSampleDate"];

    [v3 setValue:Samples forKey:@"currentSample"];
    double v10 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    [v3 setValue:v10 forKey:@"currentSampleAPWakeTime"];

    uint64_t v11 = [v3 objectForKey:@"lastSample"];

    if (v11)
    {
      [v3 objectForKey:@"lastSample"];
      [v3 objectForKey:@"currentSample"];
      SamplesDelta = (void *)IOReportCreateSamplesDelta();
      [v3 removeObjectForKey:@"lastSample"];
      goto LABEL_7;
    }
    uint64_t v13 = [v3 objectForKey:@"currentSample"];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  SamplesDelta = (void *)v13;
LABEL_7:

  return SamplesDelta;
}

id __37__PLIOReportAgent_logEngagementToCA___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
  [v2 setObject:v3 forKeyedSubscript:@"bin"];

  int v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  [v2 setObject:v4 forKeyedSubscript:@"engagement"];

  return v2;
}

- (void)modelAPSoCPower:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [MEMORY[0x1E4F92A38] isHomePod];
  if (v3 && (v4 & 1) == 0)
  {
    BOOL v5 = [v3 objectForKeyedSubscript:@"SampleTime"];
    [v5 doubleValue];
    double v7 = v6;

    uint64_t v8 = [v3 entryDate];
    uint64_t v65 = [v8 dateByAddingTimeInterval:-v7];

    double v9 = [v3 entryDate];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35__PLIOReportAgent_modelAPSoCPower___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v10;
      if (qword_1EBD584D8 != -1) {
        dispatch_once(&qword_1EBD584D8, block);
      }
      if (byte_1EBD583E5)
      {
        uint64_t v11 = [NSString stringWithFormat:@"lastSampleDate=%@, currentSampleDate=%@, sampleTime=%f", v65, v9, *(void *)&v7];
        double v12 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLIOReportAgent.m"];
        uint64_t v14 = [v13 lastPathComponent];
        id v15 = [NSString stringWithUTF8String:"-[PLIOReportAgent modelAPSoCPower:]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:11290];

        int v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v73 = (uint64_t)v11;
          _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(id)objc_opt_class() energyKeyToRootNodeID];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v64 = v69 = 0u;
    id v17 = [v64 allKeys];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v67;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v67 != v20) {
            objc_enumerationMutation(v17);
          }
          double v22 = *(void **)(*((void *)&v66 + 1) + 8 * v21);
          char v23 = [v3 objectForKeyedSubscript:v22];

          if (v23)
          {
            id v24 = [v64 objectForKeyedSubscript:v22];
            double v25 = [v3 objectForKeyedSubscript:v22];
            [v25 doubleValue];
            double v27 = v26;

            double v28 = v27 / v7;
            if ([v22 isEqual:@"CPU Energy"])
            {
              if (([MEMORY[0x1E4F92A38] isDeviceClass:102011] & 1) != 0
                || [MEMORY[0x1E4F92A38] isDeviceClass:102012]
                || ([MEMORY[0x1E4F92A38] isDeviceClass:100022] & 1) != 0
                || [MEMORY[0x1E4F92A38] isDeviceClass:100023])
              {
                double v28 = v28 * 0.68;
              }
              else if (([MEMORY[0x1E4F92A38] isDeviceClass:102015] & 1) != 0 {
                     || [MEMORY[0x1E4F92A38] isDeviceClass:102016]
              }
                     || ([MEMORY[0x1E4F92A38] isDeviceClass:102017] & 1) != 0
                     || [MEMORY[0x1E4F92A38] isDeviceClass:102018])
              {
                double v28 = v28 * 1.55;
              }
              else if (([MEMORY[0x1E4F92A38] isDeviceClass:102021] & 1) != 0 {
                     || ([MEMORY[0x1E4F92A38] isDeviceClass:102022] & 1) != 0
              }
                     || ([MEMORY[0x1E4F92A38] isDeviceClass:102025] & 1) != 0
                     || [MEMORY[0x1E4F92A38] isDeviceClass:102026])
              {
                double v28 = v28 + 8.0;
              }
              goto LABEL_38;
            }
            if ([v22 isEqual:@"Rest of SoC Energy"])
            {
              if (([MEMORY[0x1E4F92A38] isDeviceClass:102017] & 1) != 0
                || [MEMORY[0x1E4F92A38] isDeviceClass:102018])
              {
                double v28 = v28 * 1.6;
              }
              goto LABEL_38;
            }
            if (![v22 isEqual:@"DRAM Energy"]) {
              goto LABEL_38;
            }
            if (([MEMORY[0x1E4F92A38] isSoCClass:1001004] & 1) != 0
              || [MEMORY[0x1E4F92A38] isSoCClass:1001005])
            {
              double v28 = v28 * 3.5;
              goto LABEL_38;
            }
            if (([MEMORY[0x1E4F92A38] isSoCClass:1001006] & 1) != 0
              || [MEMORY[0x1E4F92A38] isSoCClass:1001007])
            {
              double v28 = v28 * 2.4;
              goto LABEL_38;
            }
            if ((int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] <= 1001009
              || (int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] >= 1001015)
            {
LABEL_38:
              if ([v24 intValue] == 54)
              {
                uint64_t v29 = PLLogCommon();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  uint64_t v73 = 0x403E000000000000;
                  _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "Adjusting APSOCBase power to default value: %f", buf, 0xCu);
                }

                double v28 = 30.0;
              }
              uint64_t v30 = [MEMORY[0x1E4F92900] sharedInstance];
              objc_msgSend(v30, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", objc_msgSend(v24, "intValue"), v65, v9, v28);

              if ([v24 intValue] == 54)
              {
                uint64_t v31 = [MEMORY[0x1E4F92900] sharedInstance];
                [v31 createQualificationEventIntervalWithQualificationID:13 withChildNodeNames:&unk_1F29ED8F8 withStartDate:v65 withEndDate:v9];
              }
            }
          }
          ++v21;
        }
        while (v19 != v21);
        uint64_t v32 = [v17 countByEnumeratingWithState:&v66 objects:v71 count:16];
        uint64_t v19 = v32;
      }
      while (v32);
    }

    uint64_t v33 = [v3 objectForKeyedSubscript:@"DRAM"];
    if (v33)
    {
      char v34 = (void *)v33;
      id v35 = [v3 objectForKeyedSubscript:@"DCS"];

      if (v35)
      {
        v36 = [v3 objectForKeyedSubscript:@"DRAM"];
        [v36 doubleValue];
        double v38 = v37;
        v39 = [v3 objectForKeyedSubscript:@"DCS"];
        [v39 doubleValue];
        double v41 = v38 + v40;

        uint64_t v42 = [MEMORY[0x1E4F92900] sharedInstance];
        [v42 createPowerEventIntervalWithRootNodeID:9 withPower:v65 withStartDate:v9 withEndDate:v41 / v7];
      }
    }
    uint64_t v43 = [v3 objectForKeyedSubscript:@"ECPU"];
    if (v43)
    {
      v44 = (void *)v43;
      v45 = [v3 objectForKeyedSubscript:@"PCPU"];

      if (v45)
      {
        v46 = [v3 objectForKeyedSubscript:@"ECPU"];
        [v46 doubleValue];
        double v48 = v47;
        v49 = [v3 objectForKeyedSubscript:@"PCPU"];
        [v49 doubleValue];
        double v51 = v48 + v50;

        double v52 = v51 / v7;
        if ((int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] > 1001015) {
          double v52 = v52 + 10.0;
        }
        uint64_t v53 = [MEMORY[0x1E4F92900] sharedInstance];
        [v53 createPowerEventIntervalWithRootNodeID:2 withPower:v65 withStartDate:v9 withEndDate:v52];
      }
    }
    uint64_t v54 = [v3 objectForKeyedSubscript:@"DISP"];
    if (v54)
    {
      v55 = (void *)v54;
      int v56 = [v3 objectForKeyedSubscript:@"MSR"];

      if (v56)
      {
        v57 = [v3 objectForKeyedSubscript:@"DISP"];
        [v57 doubleValue];
        double v59 = v58;
        uint64_t v60 = [v3 objectForKeyedSubscript:@"MSR"];
        [v60 doubleValue];
        double v62 = v59 + v61;

        id v63 = [MEMORY[0x1E4F92900] sharedInstance];
        [v63 createPowerEventIntervalWithRootNodeID:57 withPower:v65 withStartDate:v9 withEndDate:v62 / v7];
      }
    }
  }
}

- (void)logStateResidency:(id)a3 withKey:(id)a4 withEntryDate:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1D942A350]();
  double v12 = [MEMORY[0x1E4F1CA48] array];
  id v13 = v9;
  id v14 = v10;
  id v15 = v12;
  IOReportIterate();
  if ([v15 count])
  {
    id v17 = v13;
    v18[0] = v15;
    int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    [(PLOperator *)self logEntries:v16 withGroupID:v13];
  }
}

- (void)logEventBackwardAOPAOPSensors:(id)a3
{
}

+ (id)energyKeyToRootNodeID
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    id v2 = (id)MEMORY[0x1E4F1CC08];
  }
  else
  {
    if (qword_1EBD584E8 != -1) {
      dispatch_once(&qword_1EBD584E8, &__block_literal_global_9690);
    }
    id v2 = (id)qword_1EBD584F0;
  }
  return v2;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLIOReportAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"pmtelemetry_flex";
  id v3 = objc_msgSend(a1, "entryEventPointDefinitionPmtelemetry_Flex");
  v7[1] = @"SampleSaturation";
  v8[0] = v3;
  char v4 = [a1 entryEventPointDefinitionSampleSaturation];
  v8[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventPointDefinitionPmtelemetry_Flex
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v16[0] = *MEMORY[0x1E4F92CD0];
    v16[1] = v2;
    v17[0] = &unk_1F29F06F0;
    v17[1] = @"logEventPointIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v16[2] = *MEMORY[0x1E4F92C60];
    v16[3] = v3;
    v17[2] = MEMORY[0x1E4F1CC28];
    v17[3] = MEMORY[0x1E4F1CC38];
    char v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    v19[0] = v4;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"SAGV Average Ratio";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v15[0] = v6;
    v14[1] = @"IA HWP Clipped Bins";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v15[1] = v8;
    v14[2] = @"IA IccMax Clipped Bins";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v15[2] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    v19[1] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    double v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionSampleSaturation
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasCapability:7]
    && ((int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] < 1001018
     || ([MEMORY[0x1E4F92A38] isiOS] & 1) == 0))
  {
    v15[0] = *MEMORY[0x1E4F92C50];
    uint64_t v3 = *MEMORY[0x1E4F92C70];
    v13[0] = *MEMORY[0x1E4F92CD0];
    v13[1] = v3;
    v14[0] = &unk_1F29F06F0;
    v14[1] = MEMORY[0x1E4F1CC38];
    v13[2] = *MEMORY[0x1E4F92C60];
    v14[2] = MEMORY[0x1E4F1CC28];
    char v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v16[0] = v4;
    v15[1] = *MEMORY[0x1E4F92CA8];
    v11[0] = @"CmpsSampleSaturationCount";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v11[1] = @"MagSampleSaturationCount";
    v12[0] = v6;
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v12[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v16[1] = v9;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v2;
}

+ (id)entryEventForwardDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"MemCacheLabels";
  uint64_t v3 = [a1 entryEventForwardDefinitionMemCacheLabels];
  v7[1] = @"SoCStatsoprtp";
  v8[0] = v3;
  char v4 = [a1 entryEventForwardDefinitionSoCStatsOprtp];
  v8[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventForwardDefinitionMemCacheLabels
{
  v256[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogMemCacheStats])
  {
    v255[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C60];
    v253[0] = *MEMORY[0x1E4F92CD0];
    v253[1] = v2;
    v254[0] = &unk_1F29F0700;
    v254[1] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = *MEMORY[0x1E4F92CF0];
    v253[2] = *MEMORY[0x1E4F92CF8];
    v253[3] = v3;
    v254[2] = &unk_1F29E55D8;
    v254[3] = &unk_1F29E55F0;
    v250 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v254 forKeys:v253 count:4];
    v256[0] = v250;
    v255[1] = *MEMORY[0x1E4F92CA8];
    v249 = +[PLIOReportAgent keyForSubBlock:0];
    v251[0] = v249;
    v248 = [MEMORY[0x1E4F929D8] sharedInstance];
    v247 = objc_msgSend(v248, "commonTypeDict_StringFormat");
    v252[0] = v247;
    v246 = +[PLIOReportAgent keyForSubBlock:1];
    v251[1] = v246;
    v245 = [MEMORY[0x1E4F929D8] sharedInstance];
    v244 = objc_msgSend(v245, "commonTypeDict_StringFormat");
    v252[1] = v244;
    v243 = +[PLIOReportAgent keyForSubBlock:2];
    v251[2] = v243;
    v242 = [MEMORY[0x1E4F929D8] sharedInstance];
    v241 = objc_msgSend(v242, "commonTypeDict_StringFormat");
    v252[2] = v241;
    v240 = +[PLIOReportAgent keyForSubBlock:3];
    v251[3] = v240;
    v239 = [MEMORY[0x1E4F929D8] sharedInstance];
    v238 = objc_msgSend(v239, "commonTypeDict_StringFormat");
    v252[3] = v238;
    v237 = +[PLIOReportAgent keyForSubBlock:4];
    v251[4] = v237;
    v236 = [MEMORY[0x1E4F929D8] sharedInstance];
    v235 = objc_msgSend(v236, "commonTypeDict_StringFormat");
    v252[4] = v235;
    v234 = +[PLIOReportAgent keyForSubBlock:5];
    v251[5] = v234;
    v233 = [MEMORY[0x1E4F929D8] sharedInstance];
    v232 = objc_msgSend(v233, "commonTypeDict_StringFormat");
    v252[5] = v232;
    v231 = +[PLIOReportAgent keyForSubBlock:6];
    v251[6] = v231;
    v230 = [MEMORY[0x1E4F929D8] sharedInstance];
    v229 = objc_msgSend(v230, "commonTypeDict_StringFormat");
    v252[6] = v229;
    v228 = +[PLIOReportAgent keyForSubBlock:7];
    v251[7] = v228;
    v227 = [MEMORY[0x1E4F929D8] sharedInstance];
    v226 = objc_msgSend(v227, "commonTypeDict_StringFormat");
    v252[7] = v226;
    v225 = +[PLIOReportAgent keyForSubBlock:8];
    v251[8] = v225;
    v224 = [MEMORY[0x1E4F929D8] sharedInstance];
    v223 = objc_msgSend(v224, "commonTypeDict_StringFormat");
    v252[8] = v223;
    v222 = +[PLIOReportAgent keyForSubBlock:9];
    v251[9] = v222;
    v221 = [MEMORY[0x1E4F929D8] sharedInstance];
    v220 = objc_msgSend(v221, "commonTypeDict_StringFormat");
    v252[9] = v220;
    v219 = +[PLIOReportAgent keyForSubBlock:10];
    v251[10] = v219;
    v218 = [MEMORY[0x1E4F929D8] sharedInstance];
    v217 = objc_msgSend(v218, "commonTypeDict_StringFormat");
    v252[10] = v217;
    v216 = +[PLIOReportAgent keyForSubBlock:11];
    v251[11] = v216;
    v215 = [MEMORY[0x1E4F929D8] sharedInstance];
    v214 = objc_msgSend(v215, "commonTypeDict_StringFormat");
    v252[11] = v214;
    v213 = +[PLIOReportAgent keyForSubBlock:12];
    v251[12] = v213;
    v212 = [MEMORY[0x1E4F929D8] sharedInstance];
    v211 = objc_msgSend(v212, "commonTypeDict_StringFormat");
    v252[12] = v211;
    v210 = +[PLIOReportAgent keyForSubBlock:13];
    v251[13] = v210;
    v209 = [MEMORY[0x1E4F929D8] sharedInstance];
    v208 = objc_msgSend(v209, "commonTypeDict_StringFormat");
    v252[13] = v208;
    v207 = +[PLIOReportAgent keyForSubBlock:14];
    v251[14] = v207;
    v206 = [MEMORY[0x1E4F929D8] sharedInstance];
    v205 = objc_msgSend(v206, "commonTypeDict_StringFormat");
    v252[14] = v205;
    v204 = +[PLIOReportAgent keyForSubBlock:15];
    v251[15] = v204;
    v203 = [MEMORY[0x1E4F929D8] sharedInstance];
    v202 = objc_msgSend(v203, "commonTypeDict_StringFormat");
    v252[15] = v202;
    v201 = +[PLIOReportAgent keyForSubBlock:16];
    v251[16] = v201;
    v200 = [MEMORY[0x1E4F929D8] sharedInstance];
    v199 = objc_msgSend(v200, "commonTypeDict_StringFormat");
    v252[16] = v199;
    v198 = +[PLIOReportAgent keyForSubBlock:17];
    v251[17] = v198;
    v197 = [MEMORY[0x1E4F929D8] sharedInstance];
    v196 = objc_msgSend(v197, "commonTypeDict_StringFormat");
    v252[17] = v196;
    v195 = +[PLIOReportAgent keyForSubBlock:18];
    v251[18] = v195;
    v194 = [MEMORY[0x1E4F929D8] sharedInstance];
    v193 = objc_msgSend(v194, "commonTypeDict_StringFormat");
    v252[18] = v193;
    v192 = +[PLIOReportAgent keyForSubBlock:19];
    v251[19] = v192;
    v191 = [MEMORY[0x1E4F929D8] sharedInstance];
    v190 = objc_msgSend(v191, "commonTypeDict_StringFormat");
    v252[19] = v190;
    v189 = +[PLIOReportAgent keyForSubBlock:20];
    v251[20] = v189;
    v188 = [MEMORY[0x1E4F929D8] sharedInstance];
    v187 = objc_msgSend(v188, "commonTypeDict_StringFormat");
    v252[20] = v187;
    v186 = +[PLIOReportAgent keyForSubBlock:21];
    v251[21] = v186;
    v185 = [MEMORY[0x1E4F929D8] sharedInstance];
    v184 = objc_msgSend(v185, "commonTypeDict_StringFormat");
    v252[21] = v184;
    v183 = +[PLIOReportAgent keyForSubBlock:22];
    v251[22] = v183;
    v182 = [MEMORY[0x1E4F929D8] sharedInstance];
    v181 = objc_msgSend(v182, "commonTypeDict_StringFormat");
    v252[22] = v181;
    v180 = +[PLIOReportAgent keyForSubBlock:23];
    v251[23] = v180;
    v179 = [MEMORY[0x1E4F929D8] sharedInstance];
    v178 = objc_msgSend(v179, "commonTypeDict_StringFormat");
    v252[23] = v178;
    v177 = +[PLIOReportAgent keyForSubBlock:24];
    v251[24] = v177;
    v176 = [MEMORY[0x1E4F929D8] sharedInstance];
    v175 = objc_msgSend(v176, "commonTypeDict_StringFormat");
    v252[24] = v175;
    v174 = +[PLIOReportAgent keyForSubBlock:25];
    v251[25] = v174;
    v173 = [MEMORY[0x1E4F929D8] sharedInstance];
    v172 = objc_msgSend(v173, "commonTypeDict_StringFormat");
    v252[25] = v172;
    v171 = +[PLIOReportAgent keyForSubBlock:26];
    v251[26] = v171;
    v170 = [MEMORY[0x1E4F929D8] sharedInstance];
    v169 = objc_msgSend(v170, "commonTypeDict_StringFormat");
    v252[26] = v169;
    v168 = +[PLIOReportAgent keyForSubBlock:27];
    v251[27] = v168;
    v167 = [MEMORY[0x1E4F929D8] sharedInstance];
    v166 = objc_msgSend(v167, "commonTypeDict_StringFormat");
    v252[27] = v166;
    v165 = +[PLIOReportAgent keyForSubBlock:28];
    v251[28] = v165;
    v164 = [MEMORY[0x1E4F929D8] sharedInstance];
    v163 = objc_msgSend(v164, "commonTypeDict_StringFormat");
    v252[28] = v163;
    v162 = +[PLIOReportAgent keyForSubBlock:29];
    v251[29] = v162;
    v161 = [MEMORY[0x1E4F929D8] sharedInstance];
    v160 = objc_msgSend(v161, "commonTypeDict_StringFormat");
    v252[29] = v160;
    v159 = +[PLIOReportAgent keyForSubBlock:30];
    v251[30] = v159;
    v158 = [MEMORY[0x1E4F929D8] sharedInstance];
    v157 = objc_msgSend(v158, "commonTypeDict_StringFormat");
    v252[30] = v157;
    v156 = +[PLIOReportAgent keyForSubBlock:31];
    v251[31] = v156;
    v155 = [MEMORY[0x1E4F929D8] sharedInstance];
    v154 = objc_msgSend(v155, "commonTypeDict_StringFormat");
    v252[31] = v154;
    v153 = +[PLIOReportAgent keyForSubBlock:32];
    v251[32] = v153;
    v152 = [MEMORY[0x1E4F929D8] sharedInstance];
    v151 = objc_msgSend(v152, "commonTypeDict_StringFormat");
    v252[32] = v151;
    v150 = +[PLIOReportAgent keyForSubBlock:33];
    v251[33] = v150;
    v149 = [MEMORY[0x1E4F929D8] sharedInstance];
    v148 = objc_msgSend(v149, "commonTypeDict_StringFormat");
    v252[33] = v148;
    v147 = +[PLIOReportAgent keyForSubBlock:34];
    v251[34] = v147;
    v146 = [MEMORY[0x1E4F929D8] sharedInstance];
    v145 = objc_msgSend(v146, "commonTypeDict_StringFormat");
    v252[34] = v145;
    v144 = +[PLIOReportAgent keyForSubBlock:35];
    v251[35] = v144;
    v143 = [MEMORY[0x1E4F929D8] sharedInstance];
    v142 = objc_msgSend(v143, "commonTypeDict_StringFormat");
    v252[35] = v142;
    v141 = +[PLIOReportAgent keyForSubBlock:36];
    v251[36] = v141;
    v140 = [MEMORY[0x1E4F929D8] sharedInstance];
    v139 = objc_msgSend(v140, "commonTypeDict_StringFormat");
    v252[36] = v139;
    v138 = +[PLIOReportAgent keyForSubBlock:37];
    v251[37] = v138;
    v137 = [MEMORY[0x1E4F929D8] sharedInstance];
    v136 = objc_msgSend(v137, "commonTypeDict_StringFormat");
    v252[37] = v136;
    v135 = +[PLIOReportAgent keyForSubBlock:38];
    v251[38] = v135;
    v134 = [MEMORY[0x1E4F929D8] sharedInstance];
    v133 = objc_msgSend(v134, "commonTypeDict_StringFormat");
    v252[38] = v133;
    v132 = +[PLIOReportAgent keyForSubBlock:39];
    v251[39] = v132;
    v131 = [MEMORY[0x1E4F929D8] sharedInstance];
    v130 = objc_msgSend(v131, "commonTypeDict_StringFormat");
    v252[39] = v130;
    v129 = +[PLIOReportAgent keyForSubBlock:40];
    v251[40] = v129;
    v128 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v127 = objc_msgSend(v128, "commonTypeDict_StringFormat");
    v252[40] = v127;
    v126 = +[PLIOReportAgent keyForSubBlock:41];
    v251[41] = v126;
    v125 = [MEMORY[0x1E4F929D8] sharedInstance];
    v124 = objc_msgSend(v125, "commonTypeDict_StringFormat");
    v252[41] = v124;
    v123 = +[PLIOReportAgent keyForSubBlock:42];
    v251[42] = v123;
    v122 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v121 = objc_msgSend(v122, "commonTypeDict_StringFormat");
    v252[42] = v121;
    long long v120 = +[PLIOReportAgent keyForSubBlock:43];
    v251[43] = v120;
    long long v119 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v118 = objc_msgSend(v119, "commonTypeDict_StringFormat");
    v252[43] = v118;
    v117 = +[PLIOReportAgent keyForSubBlock:44];
    v251[44] = v117;
    long long v116 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v115 = objc_msgSend(v116, "commonTypeDict_StringFormat");
    v252[44] = v115;
    long long v114 = +[PLIOReportAgent keyForSubBlock:45];
    v251[45] = v114;
    long long v113 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v112 = objc_msgSend(v113, "commonTypeDict_StringFormat");
    v252[45] = v112;
    long long v111 = +[PLIOReportAgent keyForSubBlock:46];
    v251[46] = v111;
    long long v110 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v109 = objc_msgSend(v110, "commonTypeDict_StringFormat");
    v252[46] = v109;
    id v108 = +[PLIOReportAgent keyForSubBlock:47];
    v251[47] = v108;
    v107 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v106 = objc_msgSend(v107, "commonTypeDict_StringFormat");
    v252[47] = v106;
    v105 = +[PLIOReportAgent keyForSubBlock:48];
    v251[48] = v105;
    uint64_t v104 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v103 = objc_msgSend(v104, "commonTypeDict_StringFormat");
    v252[48] = v103;
    id v102 = +[PLIOReportAgent keyForSubBlock:49];
    v251[49] = v102;
    v101 = [MEMORY[0x1E4F929D8] sharedInstance];
    v100 = objc_msgSend(v101, "commonTypeDict_StringFormat");
    v252[49] = v100;
    v99 = +[PLIOReportAgent keyForSubBlock:50];
    v251[50] = v99;
    int v98 = [MEMORY[0x1E4F929D8] sharedInstance];
    v97 = objc_msgSend(v98, "commonTypeDict_StringFormat");
    v252[50] = v97;
    v96 = +[PLIOReportAgent keyForSubBlock:51];
    v251[51] = v96;
    id v95 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v94 = objc_msgSend(v95, "commonTypeDict_StringFormat");
    v252[51] = v94;
    v93 = +[PLIOReportAgent keyForSubBlock:52];
    v251[52] = v93;
    v92 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v91 = objc_msgSend(v92, "commonTypeDict_StringFormat");
    v252[52] = v91;
    id v90 = +[PLIOReportAgent keyForSubBlock:53];
    v251[53] = v90;
    v89 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v88 = objc_msgSend(v89, "commonTypeDict_StringFormat");
    v252[53] = v88;
    v87 = +[PLIOReportAgent keyForSubBlock:54];
    v251[54] = v87;
    uint64_t v86 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v86, "commonTypeDict_StringFormat");
    v252[54] = v85;
    uint64_t v84 = +[PLIOReportAgent keyForSubBlock:55];
    v251[55] = v84;
    int v83 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v82 = objc_msgSend(v83, "commonTypeDict_StringFormat");
    v252[55] = v82;
    char v81 = +[PLIOReportAgent keyForSubBlock:56];
    v251[56] = v81;
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    v79 = objc_msgSend(v80, "commonTypeDict_StringFormat");
    v252[56] = v79;
    v78 = +[PLIOReportAgent keyForSubBlock:57];
    v251[57] = v78;
    v77 = [MEMORY[0x1E4F929D8] sharedInstance];
    v76 = objc_msgSend(v77, "commonTypeDict_StringFormat");
    v252[57] = v76;
    char v75 = +[PLIOReportAgent keyForSubBlock:58];
    v251[58] = v75;
    uint64_t v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v73 = objc_msgSend(v74, "commonTypeDict_StringFormat");
    v252[58] = v73;
    v72 = +[PLIOReportAgent keyForSubBlock:59];
    v251[59] = v72;
    double v71 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v70 = objc_msgSend(v71, "commonTypeDict_StringFormat");
    v252[59] = v70;
    long long v69 = +[PLIOReportAgent keyForSubBlock:60];
    v251[60] = v69;
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v67 = objc_msgSend(v68, "commonTypeDict_StringFormat");
    v252[60] = v67;
    long long v66 = +[PLIOReportAgent keyForSubBlock:61];
    v251[61] = v66;
    uint64_t v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v64 = objc_msgSend(v65, "commonTypeDict_StringFormat");
    v252[61] = v64;
    id v63 = +[PLIOReportAgent keyForSubBlock:62];
    v251[62] = v63;
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v61 = objc_msgSend(v62, "commonTypeDict_StringFormat");
    v252[62] = v61;
    uint64_t v60 = +[PLIOReportAgent keyForSubBlock:63];
    v251[63] = v60;
    double v59 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v58 = objc_msgSend(v59, "commonTypeDict_StringFormat");
    v252[63] = v58;
    v57 = +[PLIOReportAgent keyForSubBlock:64];
    v251[64] = v57;
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_StringFormat");
    v252[64] = v55;
    uint64_t v54 = +[PLIOReportAgent keyForSubBlock:65];
    v251[65] = v54;
    uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v52 = objc_msgSend(v53, "commonTypeDict_StringFormat");
    v252[65] = v52;
    double v51 = +[PLIOReportAgent keyForSubBlock:66];
    v251[66] = v51;
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_StringFormat");
    v252[66] = v49;
    double v48 = +[PLIOReportAgent keyForSubBlock:67];
    v251[67] = v48;
    double v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_StringFormat");
    v252[67] = v46;
    v45 = +[PLIOReportAgent keyForSubBlock:68];
    v251[68] = v45;
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_StringFormat");
    v252[68] = v43;
    uint64_t v42 = +[PLIOReportAgent keyForSubBlock:69];
    v251[69] = v42;
    double v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_StringFormat");
    v252[69] = v40;
    v39 = +[PLIOReportAgent keyForSubBlock:70];
    v251[70] = v39;
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_StringFormat");
    v252[70] = v37;
    v36 = +[PLIOReportAgent keyForSubBlock:71];
    v251[71] = v36;
    id v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_StringFormat");
    v252[71] = v34;
    uint64_t v33 = +[PLIOReportAgent keyForSubBlock:72];
    v251[72] = v33;
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_StringFormat");
    v252[72] = v31;
    uint64_t v30 = +[PLIOReportAgent keyForSubBlock:73];
    v251[73] = v30;
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v28 = objc_msgSend(v29, "commonTypeDict_StringFormat");
    v252[73] = v28;
    double v27 = +[PLIOReportAgent keyForSubBlock:74];
    v251[74] = v27;
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_StringFormat");
    v252[74] = v25;
    id v24 = +[PLIOReportAgent keyForSubBlock:75];
    v251[75] = v24;
    char v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v22 = objc_msgSend(v23, "commonTypeDict_StringFormat");
    v252[75] = v22;
    uint64_t v21 = +[PLIOReportAgent keyForSubBlock:76];
    v251[76] = v21;
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_StringFormat");
    v252[76] = v19;
    uint64_t v18 = +[PLIOReportAgent keyForSubBlock:77];
    v251[77] = v18;
    id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
    v252[77] = v16;
    id v15 = +[PLIOReportAgent keyForSubBlock:78];
    v251[78] = v15;
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
    v252[78] = v5;
    double v6 = +[PLIOReportAgent keyForSubBlock:79];
    v251[79] = v6;
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
    v252[79] = v8;
    id v9 = +[PLIOReportAgent keyForSubBlock:80];
    v251[80] = v9;
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
    v252[80] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v252 forKeys:v251 count:81];
    v256[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v256 forKeys:v255 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventForwardDefinitionSoCStatsOprtp
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if ((int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] > 1001012
    || ([MEMORY[0x1E4F92A38] isHomePod] & 1) != 0
    || [MEMORY[0x1E4F92A38] isARMMac])
  {
    v15[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C60];
    v13[0] = *MEMORY[0x1E4F92CD0];
    v13[1] = v2;
    v14[0] = &unk_1F29F06F0;
    v14[1] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    v16[0] = v3;
    v15[1] = *MEMORY[0x1E4F92CA8];
    v11[0] = @"Channel";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v11[1] = @"Value";
    v12[0] = v5;
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v12[1] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v16[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v9;
}

+ (id)entryEventBackwardDefinitions
{
  v145[136] = *MEMORY[0x1E4F143B8];
  id v97 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v144[0] = @"OpticalInterfaceStats";
  v143 = [a1 entryEventBackwardDefinitionOpticalInterfaceStats];
  v145[0] = v143;
  v144[1] = @"BonnLisaStats";
  v142 = [a1 entryEventBackwardDefinitionBonnLisaStats];
  v145[1] = v142;
  v144[2] = @"CoronetPowerStats";
  v141 = [a1 entryEventBackwardDefinitionCoronetPowerStats];
  v145[2] = v141;
  v144[3] = @"SpeakerPowerState";
  v140 = [a1 entryEventBackwardDefinitionSpeakerPowerState];
  v145[3] = v140;
  v144[4] = @"ActuatorPowerState";
  v139 = [a1 entryEventBackwardDefinitionActuatorPowerState];
  v145[4] = v139;
  v144[5] = @"AOPAOP_Haptics";
  v138 = objc_msgSend(a1, "entryEventBackwardDefinitionAOPAOP_Haptics");
  v145[5] = v138;
  v144[6] = @"AOPAOPAudioFW";
  v137 = [a1 entryEventBackwardDefinitionAOPAOPAudioFW];
  v145[6] = v137;
  v144[7] = @"MultitouchMultitouchCPUstats";
  v136 = [a1 entryEventBackwardDefinitionMultitouchCPUStats];
  v145[7] = v136;
  v144[8] = @"VDDOK1";
  v135 = [a1 entryEventBackwardDefinitionVDDOK1];
  v145[8] = v135;
  v144[9] = @"VDDOK2";
  v134 = [a1 entryEventBackwardDefinitionVDDOK2];
  v145[9] = v134;
  v144[10] = @"DisplayPuvloB";
  v133 = [a1 entryEventBackwardDefinitionDisplayPuvloB];
  v145[10] = v133;
  v144[11] = @"CarnelianVaxholmStats";
  v132 = [a1 entryEventBackwardDefinitionCarnelianVaxholmStats];
  v145[11] = v132;
  v144[12] = @"HapticsStats";
  v131 = [a1 entryEventBackwardDefinitionHapticsStats];
  v145[12] = v131;
  v144[13] = @"SoCStatsDeviceStates";
  v130 = [a1 entryEventBackwardDefinitionSoCStatsDeviceStates];
  v145[13] = v130;
  v144[14] = @"SoCStatsDeviceStatesChannelID";
  v129 = [a1 entryEventBackwardDefinitionSoCStatsDeviceStatesChannelID];
  v145[14] = v129;
  v144[15] = @"SoCStatsEventsRaw";
  v128 = [a1 entryEventBackwardDefinitionSoCStatsEventsRaw];
  v145[15] = v128;
  v144[16] = @"SoCStatsEvents";
  uint64_t v127 = [a1 entryEventBackwardDefinitionSoCStatsEvents];
  v145[16] = v127;
  v144[17] = @"EnergyModel";
  v126 = [a1 entryEventBackwardDefinitionEnergyModel];
  v145[17] = v126;
  v144[18] = @"PMPEnergyCounters";
  v125 = [a1 entryEventBackwardDefinitionPMPEnergyCounters];
  v145[18] = v125;
  v144[19] = @"IOMFBUSRHistogram";
  v124 = [a1 entryEventBackwardDefinitionIOMFBUSRHistogram];
  v145[19] = v124;
  v144[20] = @"IOMFBNativeRate";
  v123 = [a1 entryEventBackwardDefinitionIOMFBNativeRate];
  v145[20] = v123;
  v144[21] = @"IOMFBSwapHistogram";
  v122 = [a1 entryEventBackwardDefinitionIOMFBSwap];
  v145[21] = v122;
  v144[22] = @"IOMFBScanoutHistogram";
  long long v121 = [a1 entryEventBackwardDefinitionIOMFBScanout];
  v145[22] = v121;
  v144[23] = @"DCPswap";
  long long v120 = [a1 entryEventBackwardDefinitionDCPSwap];
  v145[23] = v120;
  v144[24] = @"DCPscanout";
  long long v119 = [a1 entryEventBackwardDefinitionDCPScanout];
  v145[24] = v119;
  v144[25] = @"DCPscanoutstats";
  long long v118 = [a1 entryEventBackwardDefinitionDCPScanoutStats];
  v145[25] = v118;
  v144[26] = @"DCPEXT0swap";
  v117 = [a1 entryEventBackwardDefinitionDCPEXT0Swap];
  v145[26] = v117;
  v144[27] = @"DCPEXT0scanout";
  long long v116 = [a1 entryEventBackwardDefinitionDCPEXT0Scanout];
  v145[27] = v116;
  v144[28] = @"DCPEXT1swap";
  long long v115 = [a1 entryEventBackwardDefinitionDCPEXT1Swap];
  v145[28] = v115;
  v144[29] = @"DCPEXT1scanout";
  long long v114 = [a1 entryEventBackwardDefinitionDCPEXT1Scanout];
  v145[29] = v114;
  v144[30] = @"DCPEXT2swap";
  long long v113 = [a1 entryEventBackwardDefinitionDCPEXT2Swap];
  v145[30] = v113;
  v144[31] = @"DCPEXT2scanout";
  long long v112 = [a1 entryEventBackwardDefinitionDCPEXT2Scanout];
  v145[31] = v112;
  v144[32] = @"DCPEXT3swap";
  long long v111 = [a1 entryEventBackwardDefinitionDCPEXT3Swap];
  v145[32] = v111;
  v144[33] = @"DCPEXT3scanout";
  long long v110 = [a1 entryEventBackwardDefinitionDCPEXT3Scanout];
  v145[33] = v110;
  v144[34] = @"MultitouchMultitouchhighlevelstats";
  long long v109 = [a1 entryEventBackwardDefinitionMultitouchHighLevelStats];
  v145[34] = v109;
  v144[35] = @"3DTouchforce";
  id v108 = [a1 entryEventBackwardDefinition3DTouchforce];
  v145[35] = v108;
  v144[36] = @"3DTouchluna";
  v107 = [a1 entryEventBackwardDefinition3DTouchluna];
  v145[36] = v107;
  v144[37] = @"CorePerformanceLevelResidency";
  uint64_t v106 = [a1 entryEventBackwardDefinitionCorePerformanceLevelResidency];
  v145[37] = v106;
  v144[38] = @"AOPAmpPower";
  v105 = [a1 entryEventBackwardDefinitionAOPAmpPower];
  v145[38] = v105;
  v144[39] = @"AOPAOPSensors";
  uint64_t v104 = [a1 entryEventBackwardDefinitionAOPAOPSensors];
  v145[39] = v104;
  v144[40] = @"AOPmuxPower";
  uint64_t v103 = [a1 entryEventBackwardDefinitionAOPmuxPower];
  v145[40] = v103;
  v144[41] = @"PPMStatsDroopController";
  id v102 = [a1 entryEventBackwardDefinitionPPMStatsDroopController];
  v145[41] = v102;
  v144[42] = @"PPMStatsCPMSLanesengagement";
  v101 = [a1 entryEventBackwardDefinitionPPMStatsCPMSLanesEngagement];
  v145[42] = v101;
  v144[43] = @"PPMStatsCPMSFerocity";
  v100 = [a1 entryEventBackwardDefinitionPPMStatsCPMSFerocity];
  v145[43] = v100;
  v144[44] = @"PPMStatsCPMSPowerReduction";
  v99 = [a1 entryEventBackwardDefinitionPPMStatsCPMSPowerReduction];
  v145[44] = v99;
  v144[45] = @"PPMStatsPeakPowerPressure";
  int v98 = [a1 entryEventBackwardDefinitionPPMStatsPeakPowerPressure];
  v145[45] = v98;
  v144[46] = @"PPMStatsPolicyCPMS";
  v96 = [a1 entryEventBackwardDefinitionPPMStatsPolicyCPMS];
  v145[46] = v96;
  v144[47] = @"IOReport";
  id v95 = [a1 entryEventBackwardDefinitionIOReport];
  v145[47] = v95;
  v144[48] = @"PRLUsagePreCheck";
  uint64_t v94 = [a1 entryEventBackwardDefinitionPRLUsagePreCheck];
  v145[48] = v94;
  v144[49] = @"PRLUsageBCheck";
  v93 = [a1 entryEventBackwardDefinitionPRLUsageBCheck];
  v145[49] = v93;
  v144[50] = @"PRLUsageProCheck";
  v92 = [a1 entryEventBackwardDefinitionPRLUsageProCheck];
  v145[50] = v92;
  v144[51] = @"PRLUsageAttCheck";
  uint64_t v91 = [a1 entryEventBackwardDefinitionPRLUsageAttCheck];
  v145[51] = v91;
  v144[52] = @"PRLUsageJOn";
  id v90 = [a1 entryEventBackwardDefinitionPRLUsageJOn];
  v145[52] = v90;
  v144[53] = @"PRLUsageRStandby";
  v89 = [a1 entryEventBackwardDefinitionPRLUsageRStandby];
  v145[53] = v89;
  v144[54] = @"H13ISPH13ISPEvents";
  uint64_t v88 = [a1 entryEventBackwardDefinitionH13ISPH13ISPEvents];
  v145[54] = v88;
  v144[55] = @"GPUCStates";
  v87 = [a1 entryEventBackwardDefinitionGPUCStates];
  v145[55] = v87;
  v144[56] = @"Display";
  uint64_t v86 = [a1 entryEventBackwardDefinitionDisplay];
  v145[56] = v86;
  v144[57] = @"NVMe";
  v85 = [a1 entryEventBackwardDefinitionNVMe];
  v145[57] = v85;
  v144[58] = @"NVMeBWLimits";
  uint64_t v84 = [a1 entryEventBackwardDefinitionNVMeBWLimits];
  v145[58] = v84;
  v144[59] = @"NVMeTimeweightedthrottlestatistics";
  int v83 = [a1 entryEventBackwardDefinitionNVMeTimeweightedthrottlestatistics];
  v145[59] = v83;
  v144[60] = @"Bluetooth";
  char v82 = [a1 entryEventBackwardDefinitionBluetooth];
  v145[60] = v82;
  v144[61] = @"WLANPowerPhyActivity";
  char v81 = [a1 entryEventBackwardDefinitionWLANPowerPhyActivity];
  v145[61] = v81;
  v144[62] = @"WLANPowerPhyScan";
  v80 = [a1 entryEventBackwardDefinitionWLANPowerPhyScan];
  v145[62] = v80;
  v144[63] = @"WLANPowerConnections";
  v79 = [a1 entryEventBackwardDefinitionWLANPowerConnections];
  v145[63] = v79;
  v144[64] = @"CPUStatsCPUComplexThermalUPOLimiting";
  v78 = [a1 entryEventBackwardDefinitionCPUStatsCPUComplexThermalUPOLimiting];
  v145[64] = v78;
  v144[65] = @"SoCStatsClusterPowerStates";
  v77 = [a1 entryEventBackwardDefinitionSoCStatsClusterPowerStates];
  v145[65] = v77;
  v144[66] = @"TrackpadPowerStats";
  v76 = [a1 entryEventBackwardDefinitionTrackpadPowerStats];
  v145[66] = v76;
  v144[67] = @"GPUStatsDVDRequestStates";
  char v75 = [a1 entryEventBackwardDefinitionGPUStatsDVDRequestStates];
  v145[67] = v75;
  v144[68] = @"GPUStatsActiveTimeHistogram";
  uint64_t v74 = [a1 entryEventBackwardDefinitionGPUStatsActiveTimeHistogram];
  v145[68] = v74;
  v144[69] = @"GPUStatsGPUPerformanceStates";
  uint64_t v73 = [a1 entryEventBackwardDefinitionGPUStatsGPUPerformanceStates];
  v145[69] = v73;
  v144[70] = @"H11ANEH11ANEPowerState";
  v72 = [a1 entryEventBackwardDefinitionH11ANEH11ANEPowerState];
  v145[70] = v72;
  v144[71] = @"H11ANEH11ANEEvents";
  double v71 = [a1 entryEventBackwardDefinitionH11ANEH11ANEEvents];
  v145[71] = v71;
  v144[72] = @"GPUStatsIdleTimeHistogram";
  char v70 = [a1 entryEventBackwardDefinitionGPUStatsIdleTimeHistogram];
  v145[72] = v70;
  v144[73] = @"GPUStatsCLTMinducedGPUPerformanceStates";
  long long v69 = [a1 entryEventBackwardDefinitionGPUStatsGPUCLTM];
  v145[73] = v69;
  v144[74] = @"MesaMesaPowerState";
  long long v68 = [a1 entryEventBackwardDefinitionMesaMesaPowerState];
  v145[74] = v68;
  v144[75] = @"H6ISPH6ISPPowerState";
  long long v67 = [a1 entryEventBackwardDefinitionH6ISPH6ISPPowerState];
  v145[75] = v67;
  v144[76] = @"backlightreportplaybackbacklightfactorsreport";
  long long v66 = [a1 entryEventBackwardDefinitionbacklightreportplaybackbacklightfactorsreport];
  v145[76] = v66;
  v144[77] = @"CPUStatsDVDStats";
  uint64_t v65 = [a1 entryEventBackwardDefinitionCPUStatsDVDStats];
  v145[77] = v65;
  v144[78] = @"CPUStatsActiveTimeHistogram";
  uint64_t v64 = [a1 entryEventBackwardDefinitionCPUStatsActiveTimeHistogram];
  v145[78] = v64;
  v144[79] = @"CPUStatsVoltageDomainPerformanceStates";
  id v63 = [a1 entryEventBackwardDefinitionCPUStatsVoltageDomainPerformanceStates];
  v145[79] = v63;
  v144[80] = @"CPUStatsCPUComplexPerformanceStatesData";
  double v62 = [a1 entryEventBackwardDefinitionCPUStatsCPUComplexPerformanceStatesData];
  v145[80] = v62;
  v144[81] = @"CPUStatsCPUCorePerformanceStatesData";
  double v61 = [a1 entryEventBackwardDefinitionCPUStatsCPUCorePerformanceStatesData];
  v145[81] = v61;
  v144[82] = @"CPUStatsCPUComplexVoltageStateTime";
  uint64_t v60 = [a1 entryEventBackwardDefinitionCPUStatsCPUComplexVoltageStateTime];
  v145[82] = v60;
  v144[83] = @"SoCStatsH6PMGRCounters";
  double v59 = [a1 entryEventBackwardDefinitionSoCStatsH6PMGRCounters];
  v145[83] = v59;
  v144[84] = @"SoCStatsVoltageDomainPerformanceStates";
  double v58 = [a1 entryEventBackwardDefinitionSoCStatsVoltageDomainPerformanceStates];
  v145[84] = v58;
  v144[85] = @"AMCStatsPerfCounters";
  v57 = [a1 entryEventBackwardDefinitionAMCStatsPerfCounters];
  v145[85] = v57;
  v144[86] = @"AppleEmbeddedPCIELinkStates";
  int v56 = [a1 entryEventBackwardDefinitionAppleEmbeddedPCIELinkStates];
  v145[86] = v56;
  v144[87] = @"SocStatsDvdStats";
  v55 = [a1 entryEventBackwardDefinitionSocStatsDvdStats];
  v145[87] = v55;
  v144[88] = @"WifiChipConnectionActivity";
  uint64_t v54 = [a1 entryEventBackwardDefinitionWifiChipConnectionActivity];
  v145[88] = v54;
  v144[89] = @"WifiChipAWDLActivity";
  uint64_t v53 = [a1 entryEventBackwardDefinitionWifiChipAWDLActivity];
  v145[89] = v53;
  v144[90] = @"WifiChipPMAwakeActivity";
  double v52 = [a1 entryEventBackwardDefinitionWifiChipPMAwakeActivity];
  v145[90] = v52;
  v144[91] = @"WifiChipRadioPhyicalLayerActivity";
  double v51 = [a1 entryEventBackwardDefinitionWifiChipRadioPhyicalLayerActivity];
  v145[91] = v51;
  v144[92] = @"WifiChipPCIeActivity";
  double v50 = [a1 entryEventBackwardDefinitionWifiChipPCIeActivity];
  v145[92] = v50;
  v144[93] = @"WifiChipTxStatCounters";
  v49 = [a1 entryEventBackwardDefinitionWifiChipTxStatCounters];
  v145[93] = v49;
  v144[94] = @"WifiChipScanActivity";
  double v48 = [a1 entryEventBackwardDefinitionWifiChipScanActivity];
  v145[94] = v48;
  v144[95] = @"WifiChipHSICActivity";
  double v47 = [a1 entryEventBackwardDefinitionWifiChipHSICActivity];
  v145[95] = v47;
  v144[96] = @"WifiChipRxChipErrorCounters";
  v46 = [a1 entryEventBackwardDefinitionWifiChipRxChipErrorCounters];
  v145[96] = v46;
  v144[97] = @"WifiChipTxChipErrorCounters";
  v45 = [a1 entryEventBackwardDefinitionWifiChipTxChipErrorCounters];
  v145[97] = v45;
  v144[98] = @"WifiChipRxPerRateCounters";
  v44 = [a1 entryEventBackwardDefinitionWifiChipRxPerRateCounters];
  v145[98] = v44;
  v144[99] = @"WifiChipRxStatCounters";
  uint64_t v43 = [a1 entryEventBackwardDefinitionWifiChipRxStatCounters];
  v145[99] = v43;
  v144[100] = @"CPUStatsCPUEvents";
  uint64_t v42 = [a1 entryEventBackwardDefinitionCPUStatsCPUEvents];
  v145[100] = v42;
  v144[101] = @"MTRAging";
  double v41 = [a1 entryEventBackwardDefinitionMTRAging];
  v145[101] = v41;
  v144[102] = @"SpeakerSpeakerEvents";
  double v40 = [a1 entryEventBackwardDefinitionSpeakerSpeakerEvents];
  v145[102] = v40;
  v144[103] = @"PMPPerfDrivers";
  v39 = [a1 entryEventBackwardDefinitionPMPPerfDrivers];
  v145[103] = v39;
  v144[104] = @"AOPgyropower";
  double v38 = [a1 entryEventBackwardDefinitionAOPgyropower];
  v145[104] = v38;
  v144[105] = @"AOPcompasspower";
  double v37 = [a1 entryEventBackwardDefinitionAOPcompasspower];
  v145[105] = v37;
  v144[106] = @"AOPaccelpower";
  v36 = [a1 entryEventBackwardDefinitionAOPaccelpower];
  v145[106] = v36;
  v144[107] = @"AOPpressurepower";
  id v35 = [a1 entryEventBackwardDefinitionAOPpressurepower];
  v145[107] = v35;
  v144[108] = @"AOPPowerState";
  char v34 = [a1 entryEventBackwardDefinitionAOPPowerState];
  v145[108] = v34;
  v144[109] = @"AOPPerformance";
  uint64_t v33 = [a1 entryEventBackwardDefinitionAOPPerformance];
  v145[109] = v33;
  v144[110] = @"IOMFBFrameRatePhase";
  uint64_t v32 = [a1 entryEventBackwardDefinitionIOMFBFrameRatePhase];
  v145[110] = v32;
  v144[111] = @"MemCacheStats";
  uint64_t v31 = [a1 entryEventBackwardDefinitionMemCacheStats];
  v145[111] = v31;
  v144[112] = @"AOPMConnectorPower";
  uint64_t v30 = [a1 entryEventBackwardDefinitionAOPMConnectorPower];
  v145[112] = v30;
  v144[113] = @"SDXCController";
  uint64_t v29 = [a1 entryEventBackwardDefinitionSDXCController];
  v145[113] = v29;
  v144[114] = @"SMCPower";
  double v28 = [a1 entryEventBackwardDefinitionSMCPower];
  v145[114] = v28;
  v144[115] = @"MTPPower";
  double v27 = [a1 entryEventBackwardDefinitionMTPPower];
  v145[115] = v27;
  v144[116] = @"MTPIOPState";
  double v26 = [a1 entryEventBackwardDefinitionMTPIOPState];
  v145[116] = v26;
  v144[117] = @"PMPFAB";
  double v25 = [a1 entryEventBackwardDefinitionPMPFAB];
  v145[117] = v25;
  v144[118] = @"PMPDCS";
  id v24 = [a1 entryEventBackwardDefinitionPMPDCS];
  v145[118] = v24;
  v144[119] = @"PMPSOC0";
  char v23 = [a1 entryEventBackwardDefinitionPMPSOC0];
  v145[119] = v23;
  v144[120] = @"PMPSOC";
  double v22 = [a1 entryEventBackwardDefinitionPMPSOC];
  v145[120] = v22;
  v144[121] = @"SIOPower";
  uint64_t v21 = [a1 entryEventBackwardDefinitionSIOPower];
  v145[121] = v21;
  v144[122] = @"SIOIOPState";
  uint64_t v20 = [a1 entryEventBackwardDefinitionSIOIOPState];
  v145[122] = v20;
  v144[123] = @"AOPcmareceived";
  uint64_t v19 = [a1 entryEventBackwardDefinitionAOPcmareceived];
  v145[123] = v19;
  v144[124] = @"AOPgyroreceived";
  uint64_t v18 = [a1 entryEventBackwardDefinitionAOPgyroreceived];
  v145[124] = v18;
  v144[125] = @"AOPlasreceived";
  id v17 = [a1 entryEventBackwardDefinitionAOPlasreceived];
  v145[125] = v17;
  v144[126] = @"PMPDRAMBW";
  int v16 = [a1 entryEventBackwardDefinitionPMPDRAMBW];
  v145[126] = v16;
  v144[127] = @"PMPDRAMState";
  id v15 = [a1 entryEventBackwardDefinitionPMPDRAMState];
  v145[127] = v15;
  v144[128] = @"PMPFabricBW";
  uint64_t v3 = [a1 entryEventBackwardDefinitionPMPFabricBW];
  v145[128] = v3;
  v144[129] = @"PMPPMCSOCFloor";
  char v4 = [a1 entryEventBackwardDefinitionPMPPMCSOCFloor];
  v145[129] = v4;
  v144[130] = @"PMPPMCDCSFloor";
  BOOL v5 = [a1 entryEventBackwardDefinitionPMPPMCDCSFloor];
  v145[130] = v5;
  v144[131] = @"ANS2PCIE0";
  double v6 = [a1 entryEventBackwardDefinitionANS2PCIE0];
  v145[131] = v6;
  v144[132] = @"PMPPWRS0";
  double v7 = [a1 entryEventBackwardDefinitionPMPPWRS0];
  v145[132] = v7;
  v144[133] = @"PMP0PWRS0";
  id v8 = [a1 entryEventBackwardDefinitionPMP0PWRS0];
  v145[133] = v8;
  v144[134] = @"AOPProx";
  id v9 = [a1 entryEventBackwardDefinitionAOPProx];
  v145[134] = v9;
  v144[135] = @"MTPbuttoncapture";
  id v10 = [a1 entryEventBackwardDefinitionMTPCaptureButton];
  v145[135] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v145 forKeys:v144 count:136];
  double v12 = (void *)[v97 initWithDictionary:v11];

  id v13 = +[PLIOReportAgentIOReportStats entryEventBackwardDefinitions];
  [v12 addEntriesFromDictionary:v13];

  return v12;
}

+ (id)entryEventBackwardDefinitionMTPCaptureButton
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v27[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v25[0] = *MEMORY[0x1E4F92CD0];
  v25[1] = v2;
  v26[0] = &unk_1F29F06F0;
  v26[1] = @"logEventBackwardIOReport";
  double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v28[0] = v22;
  v27[1] = *MEMORY[0x1E4F92CA8];
  v23[0] = @"BaselineTrackingFreq_F1";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
  v24[0] = v20;
  v23[1] = @"BaselineTrackingFreq_F2";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
  v24[1] = v18;
  v23[2] = @"BaselineTrackingFreq_lockout";
  id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v24[2] = v16;
  v23[3] = @"ActiveFreq_F1";
  id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  v24[3] = v14;
  v23[4] = @"ActiveFreq_F2";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v24[4] = v4;
  v23[5] = @"ActiveFreq_lockout";
  BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v24[5] = v6;
  v23[6] = @"HighLevelState_Active";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v24[6] = v8;
  v23[7] = @"HighLevelState_Baseline";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v24[7] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
  v28[1] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionAOPProx
{
  void v26[2] = *MEMORY[0x1E4F143B8];
  v25[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v23[0] = *MEMORY[0x1E4F92CD0];
  v23[1] = v2;
  v24[0] = &unk_1F29F06F0;
  v24[1] = MEMORY[0x1E4F1CC38];
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E4F92CA8];
  v21[0] = @"SampleTime";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat_withUnit_s");
  v22[0] = v18;
  v21[1] = @"PowerState_DC2_120";
  id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v22[1] = v16;
  v21[2] = @"PowerState_DC4_120";
  id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  v22[2] = v14;
  v21[3] = @"PowerState_DC3_1_10";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v22[3] = v4;
  v21[4] = @"PowerState_DC3_1_1";
  BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v22[4] = v6;
  v21[5] = @"PowerState_DC3_1_30";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v22[5] = v8;
  v21[6] = @"PowerState_OFF";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v22[6] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
  v26[1] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionSDXCController
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitionAOPMConnectorPower
{
  v45[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    v44[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v42[0] = *MEMORY[0x1E4F92CD0];
    v42[1] = v2;
    v43[0] = &unk_1F29F06F0;
    v43[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v42[2] = *MEMORY[0x1E4F92CB8];
    v42[3] = v3;
    v43[2] = MEMORY[0x1E4F1CC28];
    v43[3] = MEMORY[0x1E4F1CC38];
    v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:4];
    v45[0] = v39;
    v44[1] = *MEMORY[0x1E4F92CA8];
    v40[0] = @"FWState_Idle";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
    v41[0] = v37;
    v40[1] = @"FWState_Unknown";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_RealFormat");
    v41[1] = v35;
    v40[2] = @"FWState_Offline";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v41[2] = v33;
    v40[3] = @"FWState_WLPwrOn";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_RealFormat");
    v41[3] = v31;
    v40[4] = @"FWState_Bootload";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v41[4] = v29;
    v40[5] = @"FWState_100msLPP";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_RealFormat");
    v41[5] = v27;
    v40[6] = @"FWState_1sLCovOn";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v41[6] = v25;
    v40[7] = @"FWState_1sLNoP1D";
    id v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v23 = objc_msgSend(v24, "commonTypeDict_RealFormat");
    v41[7] = v23;
    v40[8] = @"FWState_Idle_Transitions";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v41[8] = v21;
    v40[9] = @"FWState_Unknown_Transitions";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v41[9] = v19;
    v40[10] = @"FWState_Offline_Transitions";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v41[10] = v17;
    v40[11] = @"FWState_WLPwrOn_Transitions";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v41[11] = v15;
    v40[12] = @"FWState_Bootload_Transitions";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v41[12] = v5;
    v40[13] = @"FWState_100msLPP_Transitions";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v41[13] = v7;
    v40[14] = @"FWState_1sLCovOn_Transitions";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v41[14] = v9;
    v40[15] = @"FWState_1sLNoP1D_Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v41[15] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:16];
    v45[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionIOReport
{
  v25[3] = *MEMORY[0x1E4F143B8];
  v24[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v22[0] = *MEMORY[0x1E4F92CD0];
  v22[1] = v2;
  v23[0] = &unk_1F29F06F0;
  v23[1] = MEMORY[0x1E4F1CC38];
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v25[0] = v17;
  v24[1] = *MEMORY[0x1E4F92CA8];
  v20[0] = @"Group";
  int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v15 = objc_msgSend(v16, "commonTypeDict_StringFormat");
  v21[0] = v15;
  v20[1] = @"SubGroup";
  id v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v14, "commonTypeDict_StringFormat");
  v21[1] = v3;
  v20[2] = @"SampleTime";
  char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat_withUnit_s");
  v21[2] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  v25[1] = v6;
  void v24[2] = *MEMORY[0x1E4F92C68];
  v18[0] = @"value";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v18[1] = @"unit";
  v19[0] = v8;
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v19[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  void v25[2] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

  return v12;
}

+ (id)entryEventBackwardDefinitionGPUStatsDVDRequestStates
{
  v59[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v58[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v56[0] = *MEMORY[0x1E4F92CD0];
    v56[1] = v2;
    v57[0] = &unk_1F29F0710;
    v57[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v56[2] = *MEMORY[0x1E4F92C60];
    v56[3] = v3;
    v57[2] = MEMORY[0x1E4F1CC28];
    v57[3] = MEMORY[0x1E4F1CC38];
    uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:4];
    v59[0] = v53;
    v58[1] = *MEMORY[0x1E4F92CA8];
    v54[0] = @"SampleTime";
    double v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v51 = objc_msgSend(v52, "commonTypeDict_RealFormat_withUnit_s");
    v55[0] = v51;
    v54[1] = @"GPUDVDH_0-9%";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_RealFormat");
    v55[1] = v49;
    v54[2] = @"GPUDVDH_0-9%_Transitions";
    double v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v55[2] = v47;
    v54[3] = @"GPUDVDH_10-19%";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    v45 = objc_msgSend(v46, "commonTypeDict_RealFormat");
    v55[3] = v45;
    v54[4] = @"GPUDVDH_10-19%_Transitions";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v55[4] = v43;
    v54[5] = @"GPUDVDH_20-29%";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v41 = objc_msgSend(v42, "commonTypeDict_RealFormat");
    v55[5] = v41;
    v54[6] = @"GPUDVDH_20-29%_Transitions";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v55[6] = v39;
    v54[7] = @"GPUDVDH_30-39%";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
    v55[7] = v37;
    v54[8] = @"GPUDVDH_30-39%_Transitions";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v55[8] = v35;
    v54[9] = @"GPUDVDH_40-49%";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v55[9] = v33;
    v54[10] = @"GPUDVDH_40-49%_Transitions";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v55[10] = v31;
    v54[11] = @"GPUDVDH_50-59%";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v55[11] = v29;
    v54[12] = @"GPUDVDH_50-59%_Transitions";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v55[12] = v27;
    v54[13] = @"GPUDVDH_60-69%";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v55[13] = v25;
    v54[14] = @"GPUDVDH_60-69%_Transitions";
    id v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v55[14] = v23;
    v54[15] = @"GPUDVDH_70-79%";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v55[15] = v21;
    v54[16] = @"GPUDVDH_70-79%_Transitions";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v55[16] = v19;
    v54[17] = @"GPUDVDH_80-89%";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v55[17] = v17;
    v54[18] = @"GPUDVDH_80-89%_Transitions";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v55[18] = v15;
    v54[19] = @"GPUDVDH_90-99%";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v55[19] = v5;
    v54[20] = @"GPUDVDH_90-99%_Transitions";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v55[20] = v7;
    v54[21] = @"GPUDVDH_100%";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v55[21] = v9;
    v54[22] = @"GPUDVDH_100%_Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v55[22] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:23];
    v59[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionGPUStatsActiveTimeHistogram
{
  v123[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v122[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v120[0] = *MEMORY[0x1E4F92CD0];
    v120[1] = v2;
    v121[0] = &unk_1F29F0720;
    v121[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v120[2] = *MEMORY[0x1E4F92C60];
    v120[3] = v3;
    v121[2] = MEMORY[0x1E4F1CC28];
    v121[3] = MEMORY[0x1E4F1CC38];
    v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:v120 count:4];
    v123[0] = v117;
    v122[1] = *MEMORY[0x1E4F92CA8];
    v118[0] = @"SampleTime";
    long long v116 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v115 = objc_msgSend(v116, "commonTypeDict_RealFormat_withUnit_s");
    v119[0] = v115;
    v118[1] = @"0.0ms-0.1ms";
    long long v114 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v113 = objc_msgSend(v114, "commonTypeDict_IntegerFormat");
    v119[1] = v113;
    v118[2] = @"0.1ms-0.2ms";
    long long v112 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v119[2] = v111;
    v118[3] = @"0.2ms-0.3ms";
    long long v110 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat");
    v119[3] = v109;
    v118[4] = @"0.3ms-0.4ms";
    id v108 = [MEMORY[0x1E4F929D8] sharedInstance];
    v107 = objc_msgSend(v108, "commonTypeDict_IntegerFormat");
    v119[4] = v107;
    v118[5] = @"0.4ms-0.5ms";
    uint64_t v106 = [MEMORY[0x1E4F929D8] sharedInstance];
    v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat");
    v119[5] = v105;
    v118[6] = @"0.5ms-1.0ms";
    uint64_t v104 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat");
    v119[6] = v103;
    v118[7] = @"1.0ms-1.5ms";
    id v102 = [MEMORY[0x1E4F929D8] sharedInstance];
    v101 = objc_msgSend(v102, "commonTypeDict_IntegerFormat");
    v119[7] = v101;
    v118[8] = @"1.5ms-2.0ms";
    v100 = [MEMORY[0x1E4F929D8] sharedInstance];
    v99 = objc_msgSend(v100, "commonTypeDict_IntegerFormat");
    v119[8] = v99;
    v118[9] = @"2.0ms-2.5ms";
    int v98 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v97 = objc_msgSend(v98, "commonTypeDict_IntegerFormat");
    v119[9] = v97;
    v118[10] = @"2.5ms-3.0ms";
    v96 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v95 = objc_msgSend(v96, "commonTypeDict_IntegerFormat");
    v119[10] = v95;
    v118[11] = @"3.0ms-3.5ms";
    uint64_t v94 = [MEMORY[0x1E4F929D8] sharedInstance];
    v93 = objc_msgSend(v94, "commonTypeDict_IntegerFormat");
    v119[11] = v93;
    v118[12] = @"3.5ms-4.0ms";
    v92 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v91 = objc_msgSend(v92, "commonTypeDict_IntegerFormat");
    v119[12] = v91;
    v118[13] = @"4.0ms-4.5ms";
    id v90 = [MEMORY[0x1E4F929D8] sharedInstance];
    v89 = objc_msgSend(v90, "commonTypeDict_IntegerFormat");
    v119[13] = v89;
    v118[14] = @"4.5ms-5.0ms";
    uint64_t v88 = [MEMORY[0x1E4F929D8] sharedInstance];
    v87 = objc_msgSend(v88, "commonTypeDict_IntegerFormat");
    v119[14] = v87;
    v118[15] = @"5.0ms-5.5ms";
    uint64_t v86 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
    v119[15] = v85;
    v118[16] = @"5.5ms-6.0ms";
    uint64_t v84 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v83 = objc_msgSend(v84, "commonTypeDict_IntegerFormat");
    v119[16] = v83;
    v118[17] = @"6.0ms-6.5ms";
    char v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v81 = objc_msgSend(v82, "commonTypeDict_IntegerFormat");
    v119[17] = v81;
    v118[18] = @"6.5ms-7.0ms";
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    v79 = objc_msgSend(v80, "commonTypeDict_IntegerFormat");
    v119[18] = v79;
    v118[19] = @"7.0ms-7.5ms";
    v78 = [MEMORY[0x1E4F929D8] sharedInstance];
    v77 = objc_msgSend(v78, "commonTypeDict_IntegerFormat");
    v119[19] = v77;
    v118[20] = @"7.5ms-8.0ms";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat");
    v119[20] = v75;
    v118[21] = @"8.0ms-8.5ms";
    uint64_t v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat");
    v119[21] = v73;
    v118[22] = @"8.5ms-9.0ms";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v119[22] = v71;
    v118[23] = @"9.0ms-9.5ms";
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat");
    v119[23] = v69;
    v118[24] = @"9.5ms-10.0ms";
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
    v119[24] = v67;
    v118[25] = @"10.0ms-10.5ms";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_IntegerFormat");
    v119[25] = v65;
    v118[26] = @"10.5ms-11.0ms";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v119[26] = v63;
    v118[27] = @"11.0ms-11.5ms";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
    v119[27] = v61;
    v118[28] = @"11.5ms-12.0ms";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v119[28] = v59;
    v118[29] = @"12.0ms-12.5ms";
    double v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat");
    v119[29] = v57;
    v118[30] = @"12.5ms-13.0ms";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v119[30] = v55;
    v118[31] = @"13.0ms-13.5ms";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat");
    v119[31] = v53;
    v118[32] = @"13.5ms-14.0ms";
    double v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v119[32] = v51;
    v118[33] = @"14.0ms-14.5ms";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
    v119[33] = v49;
    v118[34] = @"14.5ms-15.0ms";
    double v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v119[34] = v47;
    v118[35] = @"15.0ms-15.5ms";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
    v119[35] = v45;
    v118[36] = @"15.5ms-16.0ms";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v119[36] = v43;
    v118[37] = @"16.0ms-16.5ms";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
    v119[37] = v41;
    v118[38] = @"16.5ms-17.0ms";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v119[38] = v39;
    v118[39] = @"17.0ms-34.0ms";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
    v119[39] = v37;
    v118[40] = @"34.0ms-68.0ms";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v119[40] = v35;
    v118[41] = @"68.0ms-102.0ms";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v119[41] = v33;
    v118[42] = @"102.0ms-136.0ms";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v119[42] = v31;
    v118[43] = @"136.0ms-170.0ms";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v119[43] = v29;
    v118[44] = @"170.0ms-204.0ms";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v119[44] = v27;
    v118[45] = @"204.0ms-238.0ms";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v119[45] = v25;
    v118[46] = @"238.0ms-272.0ms";
    id v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v119[46] = v23;
    v118[47] = @"272.0ms-306.0ms";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v119[47] = v21;
    v118[48] = @"306.0ms-340.0ms";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v119[48] = v19;
    v118[49] = @"340.0ms-374.0ms";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v119[49] = v17;
    v118[50] = @"374.0ms-408.0ms";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v119[50] = v15;
    v118[51] = @"408.0ms-442.0ms";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v119[51] = v5;
    v118[52] = @"442.0ms-476.0ms";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v119[52] = v7;
    v118[53] = @"476.0ms-510.0ms";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v119[53] = v9;
    v118[54] = @"510.0ms-544.0ms";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v119[54] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:55];
    v123[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v122 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionGPUStatsGPUPerformanceStates
{
  v79[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v78[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v76[0] = *MEMORY[0x1E4F92CD0];
    v76[1] = v2;
    v77[0] = &unk_1F29F0730;
    v77[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v76[2] = *MEMORY[0x1E4F92C60];
    v76[3] = v3;
    v77[2] = MEMORY[0x1E4F1CC28];
    v77[3] = MEMORY[0x1E4F1CC38];
    uint64_t v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:4];
    v79[0] = v73;
    v78[1] = *MEMORY[0x1E4F92CA8];
    v74[0] = @"SampleTime";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v71 = objc_msgSend(v72, "commonTypeDict_RealFormat_withUnit_s");
    v75[0] = v71;
    v74[1] = @"GPUPH_OFF";
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v69 = objc_msgSend(v70, "commonTypeDict_RealFormat");
    v75[1] = v69;
    v74[2] = @"GPUPH_OFF_Transitions";
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
    v75[2] = v67;
    v74[3] = @"GPUPH_P1";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_RealFormat");
    v75[3] = v65;
    v74[4] = @"GPUPH_P1_Transitions";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v75[4] = v63;
    v74[5] = @"GPUPH_P2";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v61 = objc_msgSend(v62, "commonTypeDict_RealFormat");
    v75[5] = v61;
    v74[6] = @"GPUPH_P2_Transitions";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v75[6] = v59;
    v74[7] = @"GPUPH_P3";
    double v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v58, "commonTypeDict_RealFormat");
    v75[7] = v57;
    v74[8] = @"GPUPH_P3_Transitions";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v75[8] = v55;
    v74[9] = @"GPUPH_P4";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_RealFormat");
    v75[9] = v53;
    v74[10] = @"GPUPH_P4_Transitions";
    double v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v75[10] = v51;
    v74[11] = @"GPUPH_P5";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_RealFormat");
    v75[11] = v49;
    v74[12] = @"GPUPH_P5_Transitions";
    double v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v75[12] = v47;
    v74[13] = @"GPUPH_P6";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    v45 = objc_msgSend(v46, "commonTypeDict_RealFormat");
    v75[13] = v45;
    v74[14] = @"GPUPH_P6_Transitions";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v75[14] = v43;
    v74[15] = @"GPUPH_P7";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v41 = objc_msgSend(v42, "commonTypeDict_RealFormat");
    v75[15] = v41;
    v74[16] = @"GPUPH_P7_Transitions";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v75[16] = v39;
    v74[17] = @"GPUPH_P8";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
    v75[17] = v37;
    v74[18] = @"GPUPH_P8_Transitions";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v75[18] = v35;
    v74[19] = @"GPUPH_P9";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v75[19] = v33;
    v74[20] = @"GPUPH_P9_Transitions";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v75[20] = v31;
    v74[21] = @"GPUPH_P10";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v75[21] = v29;
    v74[22] = @"GPUPH_P10_Transitions";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v75[22] = v27;
    v74[23] = @"GPUPH_P11";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v75[23] = v25;
    v74[24] = @"GPUPH_P11_Transitions";
    id v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v75[24] = v23;
    v74[25] = @"GPUPH_P12";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v75[25] = v21;
    v74[26] = @"GPUPH_P12_Transitions";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v75[26] = v19;
    v74[27] = @"GPUPH_P13";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v75[27] = v17;
    v74[28] = @"GPUPH_P13_Transitions";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v75[28] = v15;
    v74[29] = @"GPUPH_P14";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v75[29] = v5;
    v74[30] = @"GPUPH_P14_Transitions";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v75[30] = v7;
    v74[31] = @"GPUPH_P15";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v75[31] = v9;
    v74[32] = @"GPUPH_P15_Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v75[32] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:33];
    v79[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionH11ANEH11ANEPowerState
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasANE])
  {
    v15[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v13[0] = *MEMORY[0x1E4F92CD0];
    v13[1] = v2;
    v14[0] = &unk_1F29F06F0;
    v14[1] = @"logEventBackwardIOReport";
    void v13[2] = *MEMORY[0x1E4F92CE8];
    void v14[2] = MEMORY[0x1E4F1CC38];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v16[0] = v3;
    v15[1] = *MEMORY[0x1E4F92CA8];
    v11[0] = @"ANE Power";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v11[1] = @"ANE Fast";
    v12[0] = v5;
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v12[1] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v16[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v9;
}

+ (id)entryEventBackwardDefinitionH11ANEH11ANEEvents
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasANE])
  {
    v19[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v17[0] = *MEMORY[0x1E4F92CD0];
    v17[1] = v2;
    v18[0] = &unk_1F29F06F0;
    v18[1] = @"logEventBackwardIOReport";
    v17[2] = *MEMORY[0x1E4F92CE8];
    void v18[2] = MEMORY[0x1E4F1CC38];
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4F92CA8];
    v15[0] = @"ANECPU Responses Received";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v16[0] = v4;
    v15[1] = @"ANECPU Commands Sent";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v16[1] = v6;
    void v15[2] = @"Number Power Ups";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v16[2] = v8;
    void v15[3] = @"Number Power Downs";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v16[3] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    v20[1] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    double v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionGPUStatsGPUCLTM
{
  v83[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v82[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v80[0] = *MEMORY[0x1E4F92CD0];
    v80[1] = v2;
    v81[0] = &unk_1F29F0720;
    v81[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v80[2] = *MEMORY[0x1E4F92C60];
    v80[3] = v3;
    v81[2] = MEMORY[0x1E4F1CC28];
    v81[3] = MEMORY[0x1E4F1CC38];
    v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:4];
    v83[0] = v77;
    v82[1] = *MEMORY[0x1E4F92CA8];
    v78[0] = @"SampleTime";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v75 = objc_msgSend(v76, "commonTypeDict_RealFormat_withUnit_s");
    v79[0] = v75;
    v78[1] = @"GPU_CLTM_OFF";
    uint64_t v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v73 = objc_msgSend(v74, "commonTypeDict_RealFormat");
    v79[1] = v73;
    void v78[2] = @"GPU_CLTM_OFF_Transitions";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v79[2] = v71;
    v78[3] = @"GPU_CLTM_P1";
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v69 = objc_msgSend(v70, "commonTypeDict_RealFormat");
    v79[3] = v69;
    v78[4] = @"GPU_CLTM_P1_Transitions";
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
    void v79[4] = v67;
    v78[5] = @"GPU_CLTM_P2";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_RealFormat");
    v79[5] = v65;
    v78[6] = @"GPU_CLTM_P2_Transitions";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v79[6] = v63;
    v78[7] = @"GPU_CLTM_P3";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v61 = objc_msgSend(v62, "commonTypeDict_RealFormat");
    v79[7] = v61;
    v78[8] = @"GPU_CLTM_P3_Transitions";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v79[8] = v59;
    v78[9] = @"GPU_CLTM_P4";
    double v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v58, "commonTypeDict_RealFormat");
    v79[9] = v57;
    v78[10] = @"GPU_CLTM_P4_Transitions";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v79[10] = v55;
    v78[11] = @"GPU_CLTM_P5";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_RealFormat");
    v79[11] = v53;
    v78[12] = @"GPU_CLTM_P5_Transitions";
    double v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v79[12] = v51;
    v78[13] = @"GPU_CLTM_P6";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_RealFormat");
    v79[13] = v49;
    v78[14] = @"GPU_CLTM_P6_Transitions";
    double v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v79[14] = v47;
    v78[15] = @"GPU_CLTM_P7";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    v45 = objc_msgSend(v46, "commonTypeDict_RealFormat");
    v79[15] = v45;
    v78[16] = @"GPU_CLTM_P7_Transitions";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v79[16] = v43;
    v78[17] = @"GPU_CLTM_P8";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v41 = objc_msgSend(v42, "commonTypeDict_RealFormat");
    v79[17] = v41;
    v78[18] = @"GPU_CLTM_P8_Transitions";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v79[18] = v39;
    v78[19] = @"GPU_CLTM_P9";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
    v79[19] = v37;
    v78[20] = @"GPU_CLTM_P9_Transitions";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v79[20] = v35;
    v78[21] = @"GPU_CLTM_P10";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v79[21] = v33;
    v78[22] = @"GPU_CLTM_P10_Transitions";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v79[22] = v31;
    v78[23] = @"GPU_CLTM_P11";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v79[23] = v29;
    v78[24] = @"GPU_CLTM_P11_Transitions";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v79[24] = v27;
    v78[25] = @"GPU_CLTM_P12";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v79[25] = v25;
    v78[26] = @"GPU_CLTM_P12_Transitions";
    id v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v79[26] = v23;
    v78[27] = @"GPU_CLTM_P13";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v79[27] = v21;
    v78[28] = @"GPU_CLTM_P13_Transitions";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v79[28] = v19;
    v78[29] = @"GPU_CLTM_P14";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v79[29] = v17;
    v78[30] = @"GPU_CLTM_P14_Transitions";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v79[30] = v15;
    v78[31] = @"GPU_CLTM_P15";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v79[31] = v5;
    v78[32] = @"GPU_CLTM_P15_Transitions";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v79[32] = v7;
    v78[33] = @"GPU_CLTM_NO_CLTM";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v79[33] = v9;
    v78[34] = @"GPU_CLTM_NO_CLTM_Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v79[34] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:35];
    v83[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionGPUStatsIdleTimeHistogram
{
  v123[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v122[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v120[0] = *MEMORY[0x1E4F92CD0];
    v120[1] = v2;
    v121[0] = &unk_1F29F0720;
    v121[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v120[2] = *MEMORY[0x1E4F92C60];
    v120[3] = v3;
    v121[2] = MEMORY[0x1E4F1CC28];
    v121[3] = MEMORY[0x1E4F1CC38];
    v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:v120 count:4];
    v123[0] = v117;
    v122[1] = *MEMORY[0x1E4F92CA8];
    v118[0] = @"SampleTime";
    long long v116 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v115 = objc_msgSend(v116, "commonTypeDict_RealFormat_withUnit_s");
    v119[0] = v115;
    v118[1] = @"0.0ms-0.1ms";
    long long v114 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v113 = objc_msgSend(v114, "commonTypeDict_IntegerFormat");
    v119[1] = v113;
    v118[2] = @"0.1ms-0.2ms";
    long long v112 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v119[2] = v111;
    v118[3] = @"0.2ms-0.3ms";
    long long v110 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat");
    v119[3] = v109;
    v118[4] = @"0.3ms-0.4ms";
    id v108 = [MEMORY[0x1E4F929D8] sharedInstance];
    v107 = objc_msgSend(v108, "commonTypeDict_IntegerFormat");
    v119[4] = v107;
    v118[5] = @"0.4ms-0.5ms";
    uint64_t v106 = [MEMORY[0x1E4F929D8] sharedInstance];
    v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat");
    v119[5] = v105;
    v118[6] = @"0.5ms-1.0ms";
    uint64_t v104 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat");
    v119[6] = v103;
    v118[7] = @"1.0ms-1.5ms";
    id v102 = [MEMORY[0x1E4F929D8] sharedInstance];
    v101 = objc_msgSend(v102, "commonTypeDict_IntegerFormat");
    v119[7] = v101;
    v118[8] = @"1.5ms-2.0ms";
    v100 = [MEMORY[0x1E4F929D8] sharedInstance];
    v99 = objc_msgSend(v100, "commonTypeDict_IntegerFormat");
    v119[8] = v99;
    v118[9] = @"2.0ms-2.5ms";
    int v98 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v97 = objc_msgSend(v98, "commonTypeDict_IntegerFormat");
    v119[9] = v97;
    v118[10] = @"2.5ms-3.0ms";
    v96 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v95 = objc_msgSend(v96, "commonTypeDict_IntegerFormat");
    v119[10] = v95;
    v118[11] = @"3.0ms-3.5ms";
    uint64_t v94 = [MEMORY[0x1E4F929D8] sharedInstance];
    v93 = objc_msgSend(v94, "commonTypeDict_IntegerFormat");
    v119[11] = v93;
    v118[12] = @"3.5ms-4.0ms";
    v92 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v91 = objc_msgSend(v92, "commonTypeDict_IntegerFormat");
    v119[12] = v91;
    v118[13] = @"4.0ms-4.5ms";
    id v90 = [MEMORY[0x1E4F929D8] sharedInstance];
    v89 = objc_msgSend(v90, "commonTypeDict_IntegerFormat");
    v119[13] = v89;
    v118[14] = @"4.5ms-5.0ms";
    uint64_t v88 = [MEMORY[0x1E4F929D8] sharedInstance];
    v87 = objc_msgSend(v88, "commonTypeDict_IntegerFormat");
    v119[14] = v87;
    v118[15] = @"5.0ms-5.5ms";
    uint64_t v86 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
    v119[15] = v85;
    v118[16] = @"5.5ms-6.0ms";
    uint64_t v84 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v83 = objc_msgSend(v84, "commonTypeDict_IntegerFormat");
    v119[16] = v83;
    v118[17] = @"6.0ms-6.5ms";
    char v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v81 = objc_msgSend(v82, "commonTypeDict_IntegerFormat");
    v119[17] = v81;
    v118[18] = @"6.5ms-7.0ms";
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    v79 = objc_msgSend(v80, "commonTypeDict_IntegerFormat");
    v119[18] = v79;
    v118[19] = @"7.0ms-7.5ms";
    v78 = [MEMORY[0x1E4F929D8] sharedInstance];
    v77 = objc_msgSend(v78, "commonTypeDict_IntegerFormat");
    v119[19] = v77;
    v118[20] = @"7.5ms-8.0ms";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat");
    v119[20] = v75;
    v118[21] = @"8.0ms-8.5ms";
    uint64_t v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat");
    v119[21] = v73;
    v118[22] = @"8.5ms-9.0ms";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v119[22] = v71;
    v118[23] = @"9.0ms-9.5ms";
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat");
    v119[23] = v69;
    v118[24] = @"9.5ms-10.0ms";
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
    v119[24] = v67;
    v118[25] = @"10.0ms-10.5ms";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_IntegerFormat");
    v119[25] = v65;
    v118[26] = @"10.5ms-11.0ms";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v119[26] = v63;
    v118[27] = @"11.0ms-11.5ms";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
    v119[27] = v61;
    v118[28] = @"11.5ms-12.0ms";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v119[28] = v59;
    v118[29] = @"12.0ms-12.5ms";
    double v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat");
    v119[29] = v57;
    v118[30] = @"12.5ms-13.0ms";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v119[30] = v55;
    v118[31] = @"13.0ms-13.5ms";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat");
    v119[31] = v53;
    v118[32] = @"13.5ms-14.0ms";
    double v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v119[32] = v51;
    v118[33] = @"14.0ms-14.5ms";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
    v119[33] = v49;
    v118[34] = @"14.5ms-15.0ms";
    double v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v119[34] = v47;
    v118[35] = @"15.0ms-15.5ms";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
    v119[35] = v45;
    v118[36] = @"15.5ms-16.0ms";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v119[36] = v43;
    v118[37] = @"16.0ms-16.5ms";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
    v119[37] = v41;
    v118[38] = @"16.5ms-17.0ms";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v119[38] = v39;
    v118[39] = @"17.0ms-34.0ms";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
    v119[39] = v37;
    v118[40] = @"34.0ms-68.0ms";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v119[40] = v35;
    v118[41] = @"68.0ms-102.0ms";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v119[41] = v33;
    v118[42] = @"102.0ms-136.0ms";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v119[42] = v31;
    v118[43] = @"136.0ms-170.0ms";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v119[43] = v29;
    v118[44] = @"170.0ms-204.0ms";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v119[44] = v27;
    v118[45] = @"204.0ms-238.0ms";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v119[45] = v25;
    v118[46] = @"238.0ms-272.0ms";
    id v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v119[46] = v23;
    v118[47] = @"272.0ms-306.0ms";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v119[47] = v21;
    v118[48] = @"306.0ms-340.0ms";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v119[48] = v19;
    v118[49] = @"340.0ms-374.0ms";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v119[49] = v17;
    v118[50] = @"374.0ms-408.0ms";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v119[50] = v15;
    v118[51] = @"408.0ms-442.0ms";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v119[51] = v5;
    v118[52] = @"442.0ms-476.0ms";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v119[52] = v7;
    v118[53] = @"476.0ms-510.0ms";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v119[53] = v9;
    v118[54] = @"510.0ms-544.0ms";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v119[54] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:55];
    v123[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v122 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionMultitouch
{
  void v26[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isiOS] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWatch])
  {
    v25[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v23[0] = *MEMORY[0x1E4F92CD0];
    v23[1] = v2;
    v24[0] = &unk_1F29F0720;
    v24[1] = @"logEventBackwardIOReport";
    void v23[2] = *MEMORY[0x1E4F92C60];
    void v24[2] = MEMORY[0x1E4F1CC28];
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
    v26[0] = v20;
    v25[1] = *MEMORY[0x1E4F92CA8];
    v21[0] = @"FTOUCH_GERR_OUT SPEC";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
    v22[0] = v18;
    v21[1] = @"FTOUCH_GERR_IN SPEC";
    id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
    v22[1] = v16;
    v21[2] = @"FTOUCH_GERR_Transitions";
    id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    void v22[2] = v14;
    void v21[3] = @"FTOUCH_INRT_NOTLEARN";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v22[3] = v4;
    v21[4] = @"FTOUCH_INRT_LEARN";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
    v22[4] = v6;
    v21[5] = @"FTOUCH_INRT_Transitions";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v22[5] = v8;
    v21[6] = @"SampleTime";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
    v22[6] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
    v26[1] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  }
  else
  {
    double v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionMultitouchHighLevelStats
{
  v92[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiOS])
  {
    v91[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v89[0] = *MEMORY[0x1E4F92CD0];
    v89[1] = v2;
    v90[0] = &unk_1F29F0740;
    v90[1] = @"logEventBackwardIOReport";
    v89[2] = *MEMORY[0x1E4F92C60];
    v90[2] = MEMORY[0x1E4F1CC28];
    uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:3];
    v92[0] = v59;
    v91[1] = *MEMORY[0x1E4F92CA8];
    v87[0] = @"SampleTime";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v58 = objc_msgSend(v54, "commonTypeDict_RealFormat_withUnit_s");
    v88[0] = v58;
    v87[1] = @"High Level_Unknown";
    uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
    v88[1] = v48;
    v87[2] = @"High Level_Active";
    double v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v52 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
    v88[2] = v52;
    v87[3] = @"High Level_Ready";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
    v88[3] = v45;
    v87[4] = @"High Level_UILock";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_IntegerFormat");
    v88[4] = v65;
    v87[5] = @"High Level_FaceDet";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v88[5] = v63;
    v87[6] = @"High Level_PreReady";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
    v88[6] = v61;
    v87[7] = @"High Level_Anticip";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v88[7] = v57;
    v87[8] = @"High Level_Diag";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v88[8] = v55;
    v87[9] = @"High Level_FastRead";
    v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
    v88[9] = v47;
    v87[10] = @"High Level_TTW";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
    v88[10] = v44;
    v87[11] = @"High Level_TTWSup";
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
    v88[11] = v42;
    v87[12] = @"High Level_Active-U";
    double v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
    v88[12] = v40;
    v87[13] = @"High Level_Active-U_Transitions";
    v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
    v88[13] = v38;
    v87[14] = @"High Level_Active_Transitions";
    double v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
    v88[14] = v36;
    v87[15] = @"High Level_TTW_Transitions";
    id v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
    v88[15] = v34;
    v87[16] = @"High Level_TTWSup_Transitions";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
    v88[16] = v32;
    v87[17] = @"High Level_FaceDet_Transitions";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v88[17] = v30;
    v87[18] = @"High Level_AO-Untri";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
    v88[18] = v28;
    v87[19] = @"High Level_AO-Trigg";
    double v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v88[19] = v26;
    v87[20] = @"High Level_TTWActL";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v88[20] = v4;
    v87[21] = @"High Level_TTWRdyL";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v88[21] = v6;
    v87[22] = @"High Level_TTWActS";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v88[22] = v8;
    v87[23] = @"High Level_TTWRdyS";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v88[23] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:24];
    v92[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:2];

    id v13 = v54;
    id v14 = (void *)v48;

    id v15 = (void *)v59;
    int v16 = v53;

    id v17 = (void *)v45;
    uint64_t v18 = (void *)v12;

    uint64_t v19 = v51;
    uint64_t v20 = (void *)v58;

    uint64_t v21 = (void *)v52;
    double v22 = v50;

LABEL_5:
    goto LABEL_7;
  }
  if ([MEMORY[0x1E4F92A38] isWatch])
  {
    v85[0] = *MEMORY[0x1E4F92C50];
    uint64_t v23 = *MEMORY[0x1E4F92CB0];
    v83[0] = *MEMORY[0x1E4F92CD0];
    v83[1] = v23;
    v84[0] = &unk_1F29F06F0;
    v84[1] = @"logEventBackwardIOReport";
    v83[2] = *MEMORY[0x1E4F92C60];
    v84[2] = MEMORY[0x1E4F1CC28];
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:3];
    v86[0] = v15;
    v85[1] = *MEMORY[0x1E4F92CA8];
    v81[0] = @"HIGH_LVL_ACTIVE";
    uint64_t v79 = *MEMORY[0x1E4F92D10];
    uint64_t v24 = v79;
    v80 = &unk_1F29E5608;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    v82[0] = v13;
    v81[1] = @"HIGH_LVL_ACTIVE_Transitions";
    uint64_t v77 = v24;
    v78 = &unk_1F29E5620;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
    v82[1] = v20;
    v81[2] = @"HIGH_LVL_READY";
    uint64_t v75 = v24;
    v76 = &unk_1F29E5608;
    int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    void v82[2] = v16;
    v81[3] = @"HIGH_LVL_READY_Transitions";
    uint64_t v73 = v24;
    uint64_t v74 = &unk_1F29E5620;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    v82[3] = v14;
    void v81[4] = @"HIGH_LVL_WOT";
    uint64_t v71 = v24;
    v72 = &unk_1F29E5608;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    v82[4] = v19;
    v81[5] = @"HIGH_LVL_WOT_Transitions";
    uint64_t v69 = v24;
    char v70 = &unk_1F29E5620;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    v82[5] = v21;
    v81[6] = @"SampleTime";
    uint64_t v67 = v24;
    long long v68 = &unk_1F29E5608;
    double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    v82[6] = v22;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:7];
    v86[1] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];
    goto LABEL_5;
  }
  uint64_t v18 = (void *)MEMORY[0x1E4F1CC08];
LABEL_7:
  return v18;
}

+ (id)entryEventBackwardDefinition3DTouchforce
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiOS])
  {
    v23[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v21[0] = *MEMORY[0x1E4F92CD0];
    v21[1] = v2;
    v22[0] = &unk_1F29F0720;
    v22[1] = @"logEventBackwardIOReport";
    v21[2] = *MEMORY[0x1E4F92C60];
    void v22[2] = MEMORY[0x1E4F1CC28];
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    v24[0] = v18;
    v23[1] = *MEMORY[0x1E4F92CA8];
    v19[0] = @"SampleTime";
    id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v16 = objc_msgSend(v17, "commonTypeDict_RealFormat_withUnit_s");
    v20[0] = v16;
    v19[1] = @"force_POWER_STATES_INIT";
    id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v20[1] = v14;
    void v19[2] = @"force_POWER_STATES_ACTIVE";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v20[2] = v4;
    void v19[3] = @"force_POWER_STATES_TIMEOUT";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v20[3] = v6;
    v19[4] = @"force_POWER_STATES_READY";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v20[4] = v8;
    v19[5] = @"force_POWER_STATES_LIGHT_SL";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v20[5] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
    v24[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinition3DTouchluna
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isWatch])
  {
    v23[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v21[0] = *MEMORY[0x1E4F92CD0];
    v21[1] = v2;
    v22[0] = &unk_1F29F06F0;
    v22[1] = @"logEventBackwardIOReport";
    v21[2] = *MEMORY[0x1E4F92C60];
    void v22[2] = MEMORY[0x1E4F1CC28];
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    v24[0] = v18;
    v23[1] = *MEMORY[0x1E4F92CA8];
    v19[0] = @"SampleTime";
    id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v16 = objc_msgSend(v17, "commonTypeDict_RealFormat_withUnit_s");
    v20[0] = v16;
    v19[1] = @"luna_POWER_STATES_INIT";
    id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v20[1] = v14;
    void v19[2] = @"luna_POWER_STATES_ACTIVE";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v20[2] = v4;
    void v19[3] = @"luna_POWER_STATES_TIMEOUT";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v20[3] = v6;
    v19[4] = @"luna_POWER_STATES_READY";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v20[4] = v8;
    v19[5] = @"luna_POWER_STATES_LIGHT_SL";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v20[5] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
    v24[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionMesaMesaPowerState
{
  v31[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent hasMesa])
  {
    v30[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v28[0] = *MEMORY[0x1E4F92CD0];
    v28[1] = v2;
    v29[0] = &unk_1F29F0710;
    v29[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v28[2] = *MEMORY[0x1E4F92C60];
    v28[3] = v3;
    v29[2] = MEMORY[0x1E4F1CC28];
    v29[3] = MEMORY[0x1E4F1CC38];
    double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
    v31[0] = v25;
    v30[1] = *MEMORY[0x1E4F92CA8];
    v26[0] = @"SampleTime";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_RealFormat_withUnit_s");
    v27[0] = v23;
    v26[1] = @"Power State_OFF";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v27[1] = v21;
    void v26[2] = @"Power State_OFF_Transitions";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    void v27[2] = v19;
    v26[3] = @"Power State_IDLE";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v27[3] = v17;
    void v26[4] = @"Power State_IDLE_Transitions";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v27[4] = v15;
    v26[5] = @"Power State_FING-DET";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v27[5] = v5;
    v26[6] = @"Power State_FING-DET_Transitions";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v27[6] = v7;
    v26[7] = @"Power State_IMAGING";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v27[7] = v9;
    v26[8] = @"Power State_IMAGING_Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v27[8] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:9];
    v31[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionH6ISPH6ISPPowerState
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v22[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v20[0] = *MEMORY[0x1E4F92CD0];
    v20[1] = v2;
    v21[0] = &unk_1F29F0720;
    v21[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v20[2] = *MEMORY[0x1E4F92C60];
    void v20[3] = v3;
    v21[2] = MEMORY[0x1E4F1CC28];
    void v21[3] = MEMORY[0x1E4F1CC38];
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    v23[0] = v17;
    v22[1] = *MEMORY[0x1E4F92CA8];
    v18[0] = @"SampleTime";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_RealFormat_withUnit_s");
    v19[0] = v15;
    v18[1] = @"ISP Power";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v19[1] = v5;
    void v18[2] = @"ISP Fast";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    void v19[2] = v7;
    void v18[3] = @"Sensor0 Power";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v19[3] = v9;
    v18[4] = @"Sensor1 Power";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v19[4] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
    v23[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionbacklightreportplaybackbacklightfactorsreport
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v16[0] = *MEMORY[0x1E4F92CD0];
    v16[1] = v2;
    v17[0] = &unk_1F29F0720;
    v17[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v16[2] = *MEMORY[0x1E4F92C60];
    void v16[3] = v3;
    v17[2] = MEMORY[0x1E4F1CC28];
    void v17[3] = MEMORY[0x1E4F1CC38];
    char v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    v19[0] = v4;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"SampleTime";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_withUnit_s");
    v15[0] = v6;
    v14[1] = @"MIE factor";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v15[1] = v8;
    void v14[2] = @"DPB factor";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v15[2] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    v19[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionCPUStatsDVDStats
{
  v59[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v58[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v56[0] = *MEMORY[0x1E4F92CD0];
    v56[1] = v2;
    v57[0] = &unk_1F29F0710;
    v57[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v56[2] = *MEMORY[0x1E4F92C60];
    v56[3] = v3;
    v57[2] = MEMORY[0x1E4F1CC28];
    v57[3] = MEMORY[0x1E4F1CC38];
    uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:4];
    v59[0] = v53;
    v58[1] = *MEMORY[0x1E4F92CA8];
    v54[0] = @"SampleTime";
    uint64_t v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v51 = objc_msgSend(v52, "commonTypeDict_RealFormat_withUnit_s");
    v55[0] = v51;
    v54[1] = @"DVD States_0-9%";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_RealFormat");
    v55[1] = v49;
    v54[2] = @"DVD States_0-9%_Transitions";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v55[2] = v47;
    v54[3] = @"DVD States_10-19%";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v46, "commonTypeDict_RealFormat");
    v55[3] = v45;
    v54[4] = @"DVD States_10-19%_Transitions";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v55[4] = v43;
    v54[5] = @"DVD States_20-29%";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v41 = objc_msgSend(v42, "commonTypeDict_RealFormat");
    v55[5] = v41;
    v54[6] = @"DVD States_20-29%_Transitions";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v55[6] = v39;
    v54[7] = @"DVD States_30-39%";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
    v55[7] = v37;
    v54[8] = @"DVD States_30-39%_Transitions";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v55[8] = v35;
    v54[9] = @"DVD States_40-49%";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v55[9] = v33;
    v54[10] = @"DVD States_40-49%_Transitions";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v55[10] = v31;
    v54[11] = @"DVD States_50-59%";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v55[11] = v29;
    v54[12] = @"DVD States_50-59%_Transitions";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v55[12] = v27;
    v54[13] = @"DVD States_60-69%";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v55[13] = v25;
    v54[14] = @"DVD States_60-69%_Transitions";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v55[14] = v23;
    v54[15] = @"DVD States_70-79%";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v55[15] = v21;
    v54[16] = @"DVD States_70-79%_Transitions";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v55[16] = v19;
    v54[17] = @"DVD States_80-89%";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v55[17] = v17;
    v54[18] = @"DVD States_80-89%_Transitions";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v55[18] = v15;
    v54[19] = @"DVD States_90-99%";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v55[19] = v5;
    v54[20] = @"DVD States_90-99%_Transitions";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v55[20] = v7;
    v54[21] = @"DVD States_100%";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v55[21] = v9;
    v54[22] = @"DVD States_100%_Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v55[22] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:23];
    v59[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionCPUStatsActiveTimeHistogram
{
  v123[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v122[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v120[0] = *MEMORY[0x1E4F92CD0];
    v120[1] = v2;
    v121[0] = &unk_1F29F0720;
    v121[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v120[2] = *MEMORY[0x1E4F92C60];
    v120[3] = v3;
    v121[2] = MEMORY[0x1E4F1CC28];
    v121[3] = MEMORY[0x1E4F1CC38];
    v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:v120 count:4];
    v123[0] = v117;
    v122[1] = *MEMORY[0x1E4F92CA8];
    v118[0] = @"SampleTime";
    long long v116 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v115 = objc_msgSend(v116, "commonTypeDict_RealFormat_withUnit_s");
    v119[0] = v115;
    v118[1] = @"0.0ms-0.1ms";
    long long v114 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v113 = objc_msgSend(v114, "commonTypeDict_IntegerFormat");
    v119[1] = v113;
    v118[2] = @"0.1ms-0.2ms";
    long long v112 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v119[2] = v111;
    v118[3] = @"0.2ms-0.3ms";
    long long v110 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat");
    v119[3] = v109;
    v118[4] = @"0.3ms-0.4ms";
    id v108 = [MEMORY[0x1E4F929D8] sharedInstance];
    v107 = objc_msgSend(v108, "commonTypeDict_IntegerFormat");
    v119[4] = v107;
    v118[5] = @"0.4ms-0.5ms";
    uint64_t v106 = [MEMORY[0x1E4F929D8] sharedInstance];
    v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat");
    v119[5] = v105;
    v118[6] = @"0.5ms-1.0ms";
    uint64_t v104 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat");
    v119[6] = v103;
    v118[7] = @"1.0ms-1.5ms";
    id v102 = [MEMORY[0x1E4F929D8] sharedInstance];
    v101 = objc_msgSend(v102, "commonTypeDict_IntegerFormat");
    v119[7] = v101;
    v118[8] = @"1.5ms-2.0ms";
    v100 = [MEMORY[0x1E4F929D8] sharedInstance];
    v99 = objc_msgSend(v100, "commonTypeDict_IntegerFormat");
    v119[8] = v99;
    v118[9] = @"2.0ms-2.5ms";
    int v98 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v97 = objc_msgSend(v98, "commonTypeDict_IntegerFormat");
    v119[9] = v97;
    v118[10] = @"2.5ms-3.0ms";
    v96 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v95 = objc_msgSend(v96, "commonTypeDict_IntegerFormat");
    v119[10] = v95;
    v118[11] = @"3.0ms-3.5ms";
    uint64_t v94 = [MEMORY[0x1E4F929D8] sharedInstance];
    v93 = objc_msgSend(v94, "commonTypeDict_IntegerFormat");
    v119[11] = v93;
    v118[12] = @"3.5ms-4.0ms";
    v92 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v91 = objc_msgSend(v92, "commonTypeDict_IntegerFormat");
    v119[12] = v91;
    v118[13] = @"4.0ms-4.5ms";
    id v90 = [MEMORY[0x1E4F929D8] sharedInstance];
    v89 = objc_msgSend(v90, "commonTypeDict_IntegerFormat");
    v119[13] = v89;
    v118[14] = @"4.5ms-5.0ms";
    uint64_t v88 = [MEMORY[0x1E4F929D8] sharedInstance];
    v87 = objc_msgSend(v88, "commonTypeDict_IntegerFormat");
    v119[14] = v87;
    v118[15] = @"5.0ms-5.5ms";
    uint64_t v86 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
    v119[15] = v85;
    v118[16] = @"5.5ms-6.0ms";
    uint64_t v84 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v83 = objc_msgSend(v84, "commonTypeDict_IntegerFormat");
    v119[16] = v83;
    v118[17] = @"6.0ms-6.5ms";
    char v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v81 = objc_msgSend(v82, "commonTypeDict_IntegerFormat");
    v119[17] = v81;
    v118[18] = @"6.5ms-7.0ms";
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v79 = objc_msgSend(v80, "commonTypeDict_IntegerFormat");
    v119[18] = v79;
    v118[19] = @"7.0ms-7.5ms";
    v78 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v77 = objc_msgSend(v78, "commonTypeDict_IntegerFormat");
    v119[19] = v77;
    v118[20] = @"7.5ms-8.0ms";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat");
    v119[20] = v75;
    v118[21] = @"8.0ms-8.5ms";
    uint64_t v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat");
    v119[21] = v73;
    v118[22] = @"8.5ms-9.0ms";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v119[22] = v71;
    v118[23] = @"9.0ms-9.5ms";
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat");
    v119[23] = v69;
    v118[24] = @"9.5ms-10.0ms";
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
    v119[24] = v67;
    v118[25] = @"10.0ms-10.5ms";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_IntegerFormat");
    v119[25] = v65;
    v118[26] = @"10.5ms-11.0ms";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v119[26] = v63;
    v118[27] = @"11.0ms-11.5ms";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
    v119[27] = v61;
    v118[28] = @"11.5ms-12.0ms";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v119[28] = v59;
    v118[29] = @"12.0ms-12.5ms";
    uint64_t v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat");
    v119[29] = v57;
    v118[30] = @"12.5ms-13.0ms";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v119[30] = v55;
    v118[31] = @"13.0ms-13.5ms";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat");
    v119[31] = v53;
    v118[32] = @"13.5ms-14.0ms";
    uint64_t v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v119[32] = v51;
    v118[33] = @"14.0ms-14.5ms";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
    v119[33] = v49;
    v118[34] = @"14.5ms-15.0ms";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v119[34] = v47;
    v118[35] = @"15.0ms-15.5ms";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
    v119[35] = v45;
    v118[36] = @"15.5ms-16.0ms";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v119[36] = v43;
    v118[37] = @"16.0ms-16.5ms";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
    v119[37] = v41;
    v118[38] = @"16.5ms-17.0ms";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v119[38] = v39;
    v118[39] = @"17.0ms-34.0ms";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
    v119[39] = v37;
    v118[40] = @"34.0ms-68.0ms";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v119[40] = v35;
    v118[41] = @"68.0ms-102.0ms";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v119[41] = v33;
    v118[42] = @"102.0ms-136.0ms";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v119[42] = v31;
    v118[43] = @"136.0ms-170.0ms";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v119[43] = v29;
    v118[44] = @"170.0ms-204.0ms";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v119[44] = v27;
    v118[45] = @"204.0ms-238.0ms";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v119[45] = v25;
    v118[46] = @"238.0ms-272.0ms";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v119[46] = v23;
    v118[47] = @"272.0ms-306.0ms";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v119[47] = v21;
    v118[48] = @"306.0ms-340.0ms";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v119[48] = v19;
    v118[49] = @"340.0ms-374.0ms";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v119[49] = v17;
    v118[50] = @"374.0ms-408.0ms";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v119[50] = v15;
    v118[51] = @"408.0ms-442.0ms";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v119[51] = v5;
    v118[52] = @"442.0ms-476.0ms";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v119[52] = v7;
    v118[53] = @"476.0ms-510.0ms";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v119[53] = v9;
    v118[54] = @"510.0ms-544.0ms";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v119[54] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:55];
    v123[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v122 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionCPUStatsVoltageDomainPerformanceStates
{
  v115[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v114[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v112[0] = *MEMORY[0x1E4F92CD0];
    v112[1] = v2;
    v113[0] = &unk_1F29F0710;
    v113[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v112[2] = *MEMORY[0x1E4F92C60];
    v112[3] = v3;
    v113[2] = MEMORY[0x1E4F1CC28];
    v113[3] = MEMORY[0x1E4F1CC38];
    long long v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:4];
    v115[0] = v109;
    v114[1] = *MEMORY[0x1E4F92CA8];
    v110[0] = @"SampleTime";
    id v108 = [MEMORY[0x1E4F929D8] sharedInstance];
    v107 = objc_msgSend(v108, "commonTypeDict_RealFormat_withUnit_s");
    v111[0] = v107;
    v110[1] = @"Domain1_V0P0";
    uint64_t v106 = [MEMORY[0x1E4F929D8] sharedInstance];
    v105 = objc_msgSend(v106, "commonTypeDict_RealFormat");
    v111[1] = v105;
    v110[2] = @"Domain1_V0P0_Transitions";
    uint64_t v104 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat");
    v111[2] = v103;
    v110[3] = @"Domain1_V0P1";
    id v102 = [MEMORY[0x1E4F929D8] sharedInstance];
    v101 = objc_msgSend(v102, "commonTypeDict_RealFormat");
    v111[3] = v101;
    v110[4] = @"Domain1_V0P1_Transitions";
    v100 = [MEMORY[0x1E4F929D8] sharedInstance];
    v99 = objc_msgSend(v100, "commonTypeDict_IntegerFormat");
    v111[4] = v99;
    v110[5] = @"Domain1_V0P2";
    int v98 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v97 = objc_msgSend(v98, "commonTypeDict_RealFormat");
    v111[5] = v97;
    v110[6] = @"Domain1_V0P2_Transitions";
    v96 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v95 = objc_msgSend(v96, "commonTypeDict_IntegerFormat");
    v111[6] = v95;
    v110[7] = @"Domain1_V0P3";
    uint64_t v94 = [MEMORY[0x1E4F929D8] sharedInstance];
    v93 = objc_msgSend(v94, "commonTypeDict_RealFormat");
    v111[7] = v93;
    v110[8] = @"Domain1_V0P3_Transitions";
    v92 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v91 = objc_msgSend(v92, "commonTypeDict_IntegerFormat");
    v111[8] = v91;
    v110[9] = @"Domain1_V0P4";
    id v90 = [MEMORY[0x1E4F929D8] sharedInstance];
    v89 = objc_msgSend(v90, "commonTypeDict_RealFormat");
    v111[9] = v89;
    v110[10] = @"Domain1_V0P4_Transitions";
    uint64_t v88 = [MEMORY[0x1E4F929D8] sharedInstance];
    v87 = objc_msgSend(v88, "commonTypeDict_IntegerFormat");
    v111[10] = v87;
    v110[11] = @"Domain1_V1P0";
    uint64_t v86 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v86, "commonTypeDict_RealFormat");
    v111[11] = v85;
    v110[12] = @"Domain1_V1P0_Transitions";
    uint64_t v84 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v83 = objc_msgSend(v84, "commonTypeDict_IntegerFormat");
    v111[12] = v83;
    v110[13] = @"Domain1_V1P1";
    char v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v81 = objc_msgSend(v82, "commonTypeDict_RealFormat");
    v111[13] = v81;
    v110[14] = @"Domain1_V1P1_Transitions";
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v79 = objc_msgSend(v80, "commonTypeDict_IntegerFormat");
    v111[14] = v79;
    v110[15] = @"Domain1_V1P2";
    v78 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v77 = objc_msgSend(v78, "commonTypeDict_RealFormat");
    v111[15] = v77;
    v110[16] = @"Domain1_V1P2_Transitions";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat");
    v111[16] = v75;
    v110[17] = @"Domain1_V1P3";
    uint64_t v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v73 = objc_msgSend(v74, "commonTypeDict_RealFormat");
    v111[17] = v73;
    v110[18] = @"Domain1_V1P3_Transitions";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v111[18] = v71;
    v110[19] = @"Domain1_V1P4";
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v69 = objc_msgSend(v70, "commonTypeDict_RealFormat");
    v111[19] = v69;
    v110[20] = @"Domain1_V1P4_Transitions";
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
    v111[20] = v67;
    v110[21] = @"Domain1_V2P0";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_RealFormat");
    v111[21] = v65;
    v110[22] = @"Domain1_V2P0_Transitions";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v111[22] = v63;
    v110[23] = @"Domain1_V2P1";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v61 = objc_msgSend(v62, "commonTypeDict_RealFormat");
    v111[23] = v61;
    v110[24] = @"Domain1_V2P1_Transitions";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v111[24] = v59;
    v110[25] = @"Domain1_V2P2";
    uint64_t v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v58, "commonTypeDict_RealFormat");
    v111[25] = v57;
    v110[26] = @"Domain1_V2P2_Transitions";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v111[26] = v55;
    v110[27] = @"Domain1_V2P3";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_RealFormat");
    v111[27] = v53;
    v110[28] = @"Domain1_V2P3_Transitions";
    uint64_t v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v111[28] = v51;
    v110[29] = @"Domain1_V2P4";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_RealFormat");
    v111[29] = v49;
    v110[30] = @"Domain1_V2P4_Transitions";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v111[30] = v47;
    v110[31] = @"Domain1_V3P0";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v46, "commonTypeDict_RealFormat");
    v111[31] = v45;
    v110[32] = @"Domain1_V3P0_Transitions";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v111[32] = v43;
    v110[33] = @"Domain1_V3P1";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v41 = objc_msgSend(v42, "commonTypeDict_RealFormat");
    v111[33] = v41;
    v110[34] = @"Domain1_V3P1_Transitions";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v111[34] = v39;
    v110[35] = @"Domain1_V3P2";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
    v111[35] = v37;
    v110[36] = @"Domain1_V3P2_Transitions";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v111[36] = v35;
    v110[37] = @"Domain1_V3P3";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v111[37] = v33;
    v110[38] = @"Domain1_V3P3_Transitions";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v111[38] = v31;
    v110[39] = @"Domain1_V3P4";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v111[39] = v29;
    v110[40] = @"Domain1_V3P4_Transitions";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v111[40] = v27;
    v110[41] = @"Domain1_V4P0";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v111[41] = v25;
    v110[42] = @"Domain1_V4P0_Transitions";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v111[42] = v23;
    v110[43] = @"Domain1_V4P1";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v111[43] = v21;
    v110[44] = @"Domain1_V4P1_Transitions";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v111[44] = v19;
    v110[45] = @"Domain1_V4P2";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v111[45] = v17;
    v110[46] = @"Domain1_V4P2_Transitions";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v111[46] = v15;
    v110[47] = @"Domain1_V4P3";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v111[47] = v5;
    v110[48] = @"Domain1_V4P3_Transitions";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v111[48] = v7;
    v110[49] = @"Domain1_V4P4";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v111[49] = v9;
    v110[50] = @"Domain1_V4P4_Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v111[50] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:v110 count:51];
    v115[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionCPUStatsCPUComplexPerformanceStatesData
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v20[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v18[0] = *MEMORY[0x1E4F92CD0];
    v18[1] = v2;
    v19[0] = &unk_1F29F0700;
    v19[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v18[2] = *MEMORY[0x1E4F92C60];
    void v18[3] = v3;
    void v19[2] = MEMORY[0x1E4F1CC28];
    void v19[3] = MEMORY[0x1E4F1CC38];
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
    v21[0] = v15;
    v20[1] = *MEMORY[0x1E4F92CA8];
    v16[0] = @"Channel";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v17[0] = v5;
    v16[1] = @"DutyCycle";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    v17[1] = v7;
    v16[2] = @"State";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v17[2] = v9;
    void v16[3] = @"Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    void v17[3] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    v21[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionCPUStatsCPUCorePerformanceStatesData
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v22[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v20[0] = *MEMORY[0x1E4F92CD0];
    v20[1] = v2;
    v21[0] = &unk_1F29F0750;
    v21[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v20[2] = *MEMORY[0x1E4F92C60];
    void v20[3] = v3;
    v21[2] = MEMORY[0x1E4F1CC28];
    void v21[3] = MEMORY[0x1E4F1CC38];
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    v23[0] = v17;
    v22[1] = *MEMORY[0x1E4F92CA8];
    v18[0] = @"APWakeTime";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_RealFormat_withUnit_s");
    v19[0] = v15;
    v18[1] = @"Channel";
    char v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v19[1] = v5;
    void v18[2] = @"DutyCycle";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    void v19[2] = v7;
    void v18[3] = @"State";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v19[3] = v9;
    void v18[4] = @"Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    void v19[4] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
    v23[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionCPUStatsCPUComplexVoltageStateTime
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v16[0] = *MEMORY[0x1E4F92CD0];
    v16[1] = v2;
    v17[0] = &unk_1F29F06F0;
    v17[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v16[2] = *MEMORY[0x1E4F92C60];
    void v16[3] = v3;
    v17[2] = MEMORY[0x1E4F1CC28];
    void v17[3] = MEMORY[0x1E4F1CC38];
    char v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    v19[0] = v4;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"APWakeTime";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_withUnit_s");
    v15[0] = v6;
    v14[1] = @"Channel";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v15[1] = v8;
    void v14[2] = @"Value";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v15[2] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    v19[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionIOMFBUSRHistogram
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v15[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v13[0] = *MEMORY[0x1E4F92CD0];
    v13[1] = v2;
    v14[0] = &unk_1F29F06F0;
    v14[1] = @"logEventBackwardIOReport";
    void v13[2] = *MEMORY[0x1E4F92C60];
    void v14[2] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v16[0] = v3;
    v15[1] = *MEMORY[0x1E4F92CA8];
    uint64_t v11 = @"IOMFBUSR";
    uint64_t v4 = *MEMORY[0x1E4F92D00];
    v9[0] = *MEMORY[0x1E4F92D10];
    v9[1] = v4;
    v10[0] = &unk_1F29E5638;
    v10[1] = &unk_1F29E5650;
    v9[2] = *MEMORY[0x1E4F92D08];
    v10[2] = &unk_1F29E5620;
    BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
    uint64_t v12 = v5;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v16[1] = v6;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    double v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

+ (id)entryEventBackwardDefinitionIOMFBNativeRate
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v13[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v11[0] = *MEMORY[0x1E4F92CD0];
    v11[1] = v2;
    v12[0] = &unk_1F29F0720;
    v12[1] = @"logEventBackwardIOReport";
    void v11[2] = *MEMORY[0x1E4F92C60];
    void v12[2] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
    v14[0] = v3;
    v13[1] = *MEMORY[0x1E4F92CA8];
    id v9 = @"IOMFBNAT";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    id v10 = v5;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v14[1] = v6;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    double v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

+ (id)entryEventBackwardDefinitionIOMFBSwap
{
  v36[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v35[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v33[0] = *MEMORY[0x1E4F92CD0];
    v33[1] = v2;
    v34[0] = &unk_1F29F0720;
    v34[1] = @"logEventBackwardIOReport";
    v33[2] = *MEMORY[0x1E4F92C60];
    v34[2] = MEMORY[0x1E4F1CC28];
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
    v36[0] = v30;
    v35[1] = *MEMORY[0x1E4F92CA8];
    v31[0] = @"SampleTime";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v28 = objc_msgSend(v29, "commonTypeDict_RealFormat_withUnit_s");
    v32[0] = v28;
    v31[1] = @"subframes_0";
    double v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v32[1] = v26;
    v31[2] = @"subframes_1";
    double v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v32[2] = v24;
    v31[3] = @"subframes_2";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v32[3] = v22;
    void v31[4] = @"subframes_3";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v32[4] = v20;
    v31[5] = @"subframes_4";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v32[5] = v18;
    v31[6] = @"subframes_5";
    id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v32[6] = v16;
    v31[7] = @"subframes_6";
    id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v32[7] = v14;
    v31[8] = @"subframes_7";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v32[8] = v4;
    v31[9] = @"subframes_8";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v32[9] = v6;
    v31[10] = @"subframes_9";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v32[10] = v8;
    v31[11] = @"subframes_10";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v32[11] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:12];
    v36[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionIOMFBScanout
{
  v36[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v35[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v33[0] = *MEMORY[0x1E4F92CD0];
    v33[1] = v2;
    v34[0] = &unk_1F29F0720;
    v34[1] = @"logEventBackwardIOReport";
    v33[2] = *MEMORY[0x1E4F92C60];
    v34[2] = MEMORY[0x1E4F1CC28];
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
    v36[0] = v30;
    v35[1] = *MEMORY[0x1E4F92CA8];
    v31[0] = @"SampleTime";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v28 = objc_msgSend(v29, "commonTypeDict_RealFormat_withUnit_s");
    v32[0] = v28;
    v31[1] = @"subframes_0";
    double v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v32[1] = v26;
    v31[2] = @"subframes_1";
    double v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v32[2] = v24;
    v31[3] = @"subframes_2";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v32[3] = v22;
    void v31[4] = @"subframes_3";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v32[4] = v20;
    v31[5] = @"subframes_4";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v32[5] = v18;
    v31[6] = @"subframes_5";
    id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v32[6] = v16;
    v31[7] = @"subframes_6";
    id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v32[7] = v14;
    v31[8] = @"subframes_7";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v32[8] = v4;
    v31[9] = @"subframes_8";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v32[9] = v6;
    v31[10] = @"subframes_9";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v32[10] = v8;
    v31[11] = @"subframes_10";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v32[11] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:12];
    v36[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionIOMFBFrameRatePhase
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v20[0] = *MEMORY[0x1E4F92CD0];
  v20[1] = v2;
  v21[0] = &unk_1F29F06F0;
  v21[1] = @"logEventBackwardIOReport";
  uint64_t v3 = *MEMORY[0x1E4F92CE8];
  void v20[2] = *MEMORY[0x1E4F92C60];
  void v20[3] = v3;
  v21[2] = MEMORY[0x1E4F1CC28];
  void v21[3] = MEMORY[0x1E4F1CC38];
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"SampleTime";
  int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v15 = objc_msgSend(v16, "commonTypeDict_RealFormat_withUnit_s");
  v19[0] = v15;
  v18[1] = @"fast overlay (video)";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19[1] = v5;
  void v18[2] = @"fast overlay (rgb)";
  double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  void v19[2] = v7;
  void v18[3] = @"out of phase (video)";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v19[3] = v9;
  void v18[4] = @"out of phase (rgb)";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  void v19[4] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
  v23[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v13;
}

+ (id)entryEventBackwardDefinitionDCPSwap
{
  v64[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats]
    && [MEMORY[0x1E4F92A38] hasDCP])
  {
    v63[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v61[0] = *MEMORY[0x1E4F92CD0];
    v61[1] = v2;
    v62[0] = &unk_1F29F0700;
    v62[1] = @"logEventBackwardIOReport";
    v61[2] = *MEMORY[0x1E4F92C60];
    v62[2] = MEMORY[0x1E4F1CC28];
    uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];
    v64[0] = v58;
    v63[1] = *MEMORY[0x1E4F92CA8];
    v59[0] = @"SampleTime";
    v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat_withUnit_s");
    v60[0] = v56;
    v59[1] = @"subframes(0)";
    v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
    v60[1] = v54;
    v59[2] = @"subframes(1)";
    uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
    v60[2] = v52;
    v59[3] = @"subframes(2)";
    double v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
    v60[3] = v50;
    void v59[4] = @"subframes(3)";
    v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
    v60[4] = v48;
    v59[5] = @"subframes(4)";
    double v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
    v60[5] = v46;
    v59[6] = @"subframes(5)";
    uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
    v60[6] = v44;
    v59[7] = @"subframes(6)";
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
    v60[7] = v42;
    v59[8] = @"subframes(7)";
    double v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
    v60[8] = v40;
    v59[9] = @"subframes(8)";
    v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
    v60[9] = v38;
    v59[10] = @"subframes(9)";
    double v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
    v60[10] = v36;
    v59[11] = @"subframes(10)";
    id v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
    v60[11] = v34;
    v59[12] = @"subframes(11)";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
    v60[12] = v32;
    v59[13] = @"subframes(12)";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v60[13] = v30;
    v59[14] = @"subframes(13)";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
    v60[14] = v28;
    v59[15] = @"subframes(14)";
    double v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v60[15] = v26;
    v59[16] = @"subframes(15)";
    double v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v60[16] = v24;
    v59[17] = @"subframes(16)";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v60[17] = v22;
    v59[18] = @"subframes(17)";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v60[18] = v20;
    v59[19] = @"subframes(18)";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v60[19] = v18;
    v59[20] = @"subframes(19)";
    id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v60[20] = v16;
    v59[21] = @"subframes(20)";
    id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v60[21] = v14;
    v59[22] = @"subframes(21)";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v60[22] = v4;
    v59[23] = @"subframes(22)";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v60[23] = v6;
    v59[24] = @"subframes(23)";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v60[24] = v8;
    v59[25] = @"subframes(24)";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v60[25] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:26];
    v64[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionDCPScanout
{
  v64[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats]
    && [MEMORY[0x1E4F92A38] hasDCP])
  {
    v63[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v61[0] = *MEMORY[0x1E4F92CD0];
    v61[1] = v2;
    v62[0] = &unk_1F29F0700;
    v62[1] = @"logEventBackwardIOReport";
    v61[2] = *MEMORY[0x1E4F92C60];
    v62[2] = MEMORY[0x1E4F1CC28];
    uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];
    v64[0] = v58;
    v63[1] = *MEMORY[0x1E4F92CA8];
    v59[0] = @"SampleTime";
    v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat_withUnit_s");
    v60[0] = v56;
    v59[1] = @"subframes(0)";
    v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
    v60[1] = v54;
    v59[2] = @"subframes(1)";
    uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
    v60[2] = v52;
    v59[3] = @"subframes(2)";
    double v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
    v60[3] = v50;
    void v59[4] = @"subframes(3)";
    v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
    v60[4] = v48;
    v59[5] = @"subframes(4)";
    double v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
    v60[5] = v46;
    v59[6] = @"subframes(5)";
    uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
    v60[6] = v44;
    v59[7] = @"subframes(6)";
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
    v60[7] = v42;
    v59[8] = @"subframes(7)";
    double v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
    v60[8] = v40;
    v59[9] = @"subframes(8)";
    v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
    v60[9] = v38;
    v59[10] = @"subframes(9)";
    double v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
    v60[10] = v36;
    v59[11] = @"subframes(10)";
    id v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
    v60[11] = v34;
    v59[12] = @"subframes(11)";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
    v60[12] = v32;
    v59[13] = @"subframes(12)";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v60[13] = v30;
    v59[14] = @"subframes(13)";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
    v60[14] = v28;
    v59[15] = @"subframes(14)";
    double v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v60[15] = v26;
    v59[16] = @"subframes(15)";
    double v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v60[16] = v24;
    v59[17] = @"subframes(16)";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v60[17] = v22;
    v59[18] = @"subframes(17)";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v60[18] = v20;
    v59[19] = @"subframes(18)";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v60[19] = v18;
    v59[20] = @"subframes(19)";
    id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v60[20] = v16;
    v59[21] = @"subframes(20)";
    id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v60[21] = v14;
    v59[22] = @"subframes(21)";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v60[22] = v4;
    v59[23] = @"subframes(22)";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v60[23] = v6;
    v59[24] = @"subframes(23)";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v60[24] = v8;
    v59[25] = @"subframes(24)";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v60[25] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:26];
    v64[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionDCPEXT0Swap
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats]
    && [MEMORY[0x1E4F92A38] hasDCP])
  {
    v36[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v34[0] = *MEMORY[0x1E4F92CD0];
    v34[1] = v2;
    v35[0] = &unk_1F29F06F0;
    v35[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v34[2] = *MEMORY[0x1E4F92C60];
    void v34[3] = v3;
    void v35[2] = MEMORY[0x1E4F1CC28];
    v35[3] = MEMORY[0x1E4F1CC38];
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
    v37[0] = v31;
    v36[1] = *MEMORY[0x1E4F92CA8];
    v32[0] = @"SampleTime";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat_withUnit_s");
    v33[0] = v29;
    v32[1] = @"subframes(0)";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v33[1] = v27;
    v32[2] = @"subframes(1)";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v33[2] = v25;
    v32[3] = @"subframes(2)";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    void v33[3] = v23;
    v32[4] = @"subframes(3)";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v33[4] = v21;
    v32[5] = @"subframes(4)";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v33[5] = v19;
    v32[6] = @"subframes(5)";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v33[6] = v17;
    v32[7] = @"subframes(6)";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v33[7] = v15;
    v32[8] = @"subframes(7)";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v33[8] = v5;
    v32[9] = @"subframes(8)";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v33[9] = v7;
    v32[10] = @"subframes(9)";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v33[10] = v9;
    v32[11] = @"subframes(10)";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v33[11] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:12];
    v37[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionDCPEXT0Scanout
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats]
    && [MEMORY[0x1E4F92A38] hasDCP])
  {
    v36[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v34[0] = *MEMORY[0x1E4F92CD0];
    v34[1] = v2;
    v35[0] = &unk_1F29F06F0;
    v35[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v34[2] = *MEMORY[0x1E4F92C60];
    void v34[3] = v3;
    void v35[2] = MEMORY[0x1E4F1CC28];
    v35[3] = MEMORY[0x1E4F1CC38];
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
    v37[0] = v31;
    v36[1] = *MEMORY[0x1E4F92CA8];
    v32[0] = @"SampleTime";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat_withUnit_s");
    v33[0] = v29;
    v32[1] = @"subframes(0)";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v33[1] = v27;
    v32[2] = @"subframes(1)";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v33[2] = v25;
    v32[3] = @"subframes(2)";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    void v33[3] = v23;
    v32[4] = @"subframes(3)";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v33[4] = v21;
    v32[5] = @"subframes(4)";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v33[5] = v19;
    v32[6] = @"subframes(5)";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v33[6] = v17;
    v32[7] = @"subframes(6)";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v33[7] = v15;
    v32[8] = @"subframes(7)";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v33[8] = v5;
    v32[9] = @"subframes(8)";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v33[9] = v7;
    v32[10] = @"subframes(9)";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v33[10] = v9;
    v32[11] = @"subframes(10)";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v33[11] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:12];
    v37[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionDCPEXT1Swap
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats]
    && [MEMORY[0x1E4F92A38] hasDCP])
  {
    v36[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v34[0] = *MEMORY[0x1E4F92CD0];
    v34[1] = v2;
    v35[0] = &unk_1F29F06F0;
    v35[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v34[2] = *MEMORY[0x1E4F92C60];
    void v34[3] = v3;
    void v35[2] = MEMORY[0x1E4F1CC28];
    v35[3] = MEMORY[0x1E4F1CC38];
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
    v37[0] = v31;
    v36[1] = *MEMORY[0x1E4F92CA8];
    v32[0] = @"SampleTime";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat_withUnit_s");
    v33[0] = v29;
    v32[1] = @"subframes(0)";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v33[1] = v27;
    v32[2] = @"subframes(1)";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v33[2] = v25;
    v32[3] = @"subframes(2)";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    void v33[3] = v23;
    v32[4] = @"subframes(3)";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v33[4] = v21;
    v32[5] = @"subframes(4)";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v33[5] = v19;
    v32[6] = @"subframes(5)";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v33[6] = v17;
    v32[7] = @"subframes(6)";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v33[7] = v15;
    v32[8] = @"subframes(7)";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v33[8] = v5;
    v32[9] = @"subframes(8)";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v33[9] = v7;
    v32[10] = @"subframes(9)";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v33[10] = v9;
    v32[11] = @"subframes(10)";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v33[11] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:12];
    v37[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionDCPEXT1Scanout
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats]
    && [MEMORY[0x1E4F92A38] hasDCP])
  {
    v36[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v34[0] = *MEMORY[0x1E4F92CD0];
    v34[1] = v2;
    v35[0] = &unk_1F29F06F0;
    v35[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v34[2] = *MEMORY[0x1E4F92C60];
    void v34[3] = v3;
    void v35[2] = MEMORY[0x1E4F1CC28];
    v35[3] = MEMORY[0x1E4F1CC38];
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
    v37[0] = v31;
    v36[1] = *MEMORY[0x1E4F92CA8];
    v32[0] = @"SampleTime";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat_withUnit_s");
    v33[0] = v29;
    v32[1] = @"subframes(0)";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v33[1] = v27;
    v32[2] = @"subframes(1)";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v33[2] = v25;
    v32[3] = @"subframes(2)";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    void v33[3] = v23;
    v32[4] = @"subframes(3)";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v33[4] = v21;
    v32[5] = @"subframes(4)";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v33[5] = v19;
    v32[6] = @"subframes(5)";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v33[6] = v17;
    v32[7] = @"subframes(6)";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v33[7] = v15;
    v32[8] = @"subframes(7)";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v33[8] = v5;
    v32[9] = @"subframes(8)";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v33[9] = v7;
    v32[10] = @"subframes(9)";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v33[10] = v9;
    v32[11] = @"subframes(10)";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v33[11] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:12];
    v37[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionDCPEXT2Swap
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats]
    && [MEMORY[0x1E4F92A38] hasDCP])
  {
    v36[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v34[0] = *MEMORY[0x1E4F92CD0];
    v34[1] = v2;
    v35[0] = &unk_1F29F06F0;
    v35[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v34[2] = *MEMORY[0x1E4F92C60];
    void v34[3] = v3;
    void v35[2] = MEMORY[0x1E4F1CC28];
    v35[3] = MEMORY[0x1E4F1CC38];
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
    v37[0] = v31;
    v36[1] = *MEMORY[0x1E4F92CA8];
    v32[0] = @"SampleTime";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat_withUnit_s");
    v33[0] = v29;
    v32[1] = @"subframes(0)";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v33[1] = v27;
    v32[2] = @"subframes(1)";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v33[2] = v25;
    v32[3] = @"subframes(2)";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    void v33[3] = v23;
    v32[4] = @"subframes(3)";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v33[4] = v21;
    v32[5] = @"subframes(4)";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v33[5] = v19;
    v32[6] = @"subframes(5)";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v33[6] = v17;
    v32[7] = @"subframes(6)";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v33[7] = v15;
    v32[8] = @"subframes(7)";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v33[8] = v5;
    v32[9] = @"subframes(8)";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v33[9] = v7;
    v32[10] = @"subframes(9)";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v33[10] = v9;
    v32[11] = @"subframes(10)";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v33[11] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:12];
    v37[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionDCPEXT2Scanout
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats]
    && [MEMORY[0x1E4F92A38] hasDCP])
  {
    v36[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v34[0] = *MEMORY[0x1E4F92CD0];
    v34[1] = v2;
    v35[0] = &unk_1F29F06F0;
    v35[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v34[2] = *MEMORY[0x1E4F92C60];
    void v34[3] = v3;
    void v35[2] = MEMORY[0x1E4F1CC28];
    v35[3] = MEMORY[0x1E4F1CC38];
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
    v37[0] = v31;
    v36[1] = *MEMORY[0x1E4F92CA8];
    v32[0] = @"SampleTime";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat_withUnit_s");
    v33[0] = v29;
    v32[1] = @"subframes(0)";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v33[1] = v27;
    v32[2] = @"subframes(1)";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v33[2] = v25;
    v32[3] = @"subframes(2)";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    void v33[3] = v23;
    v32[4] = @"subframes(3)";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v33[4] = v21;
    v32[5] = @"subframes(4)";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v33[5] = v19;
    v32[6] = @"subframes(5)";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v33[6] = v17;
    v32[7] = @"subframes(6)";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v33[7] = v15;
    v32[8] = @"subframes(7)";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v33[8] = v5;
    v32[9] = @"subframes(8)";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v33[9] = v7;
    v32[10] = @"subframes(9)";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v33[10] = v9;
    v32[11] = @"subframes(10)";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v33[11] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:12];
    v37[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionDCPEXT3Swap
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats]
    && [MEMORY[0x1E4F92A38] hasDCP])
  {
    v36[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v34[0] = *MEMORY[0x1E4F92CD0];
    v34[1] = v2;
    v35[0] = &unk_1F29F06F0;
    v35[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v34[2] = *MEMORY[0x1E4F92C60];
    void v34[3] = v3;
    void v35[2] = MEMORY[0x1E4F1CC28];
    v35[3] = MEMORY[0x1E4F1CC38];
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
    v37[0] = v31;
    v36[1] = *MEMORY[0x1E4F92CA8];
    v32[0] = @"SampleTime";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat_withUnit_s");
    v33[0] = v29;
    v32[1] = @"subframes(0)";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v33[1] = v27;
    v32[2] = @"subframes(1)";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v33[2] = v25;
    v32[3] = @"subframes(2)";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    void v33[3] = v23;
    v32[4] = @"subframes(3)";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v33[4] = v21;
    v32[5] = @"subframes(4)";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v33[5] = v19;
    v32[6] = @"subframes(5)";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v33[6] = v17;
    v32[7] = @"subframes(6)";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v33[7] = v15;
    v32[8] = @"subframes(7)";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v33[8] = v5;
    v32[9] = @"subframes(8)";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v33[9] = v7;
    v32[10] = @"subframes(9)";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v33[10] = v9;
    v32[11] = @"subframes(10)";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v33[11] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:12];
    v37[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionDCPEXT3Scanout
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats]
    && [MEMORY[0x1E4F92A38] hasDCP])
  {
    v36[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v34[0] = *MEMORY[0x1E4F92CD0];
    v34[1] = v2;
    v35[0] = &unk_1F29F06F0;
    v35[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v34[2] = *MEMORY[0x1E4F92C60];
    void v34[3] = v3;
    void v35[2] = MEMORY[0x1E4F1CC28];
    v35[3] = MEMORY[0x1E4F1CC38];
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
    v37[0] = v31;
    v36[1] = *MEMORY[0x1E4F92CA8];
    v32[0] = @"SampleTime";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat_withUnit_s");
    v33[0] = v29;
    v32[1] = @"subframes(0)";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v33[1] = v27;
    v32[2] = @"subframes(1)";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v33[2] = v25;
    v32[3] = @"subframes(2)";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    void v33[3] = v23;
    v32[4] = @"subframes(3)";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v33[4] = v21;
    v32[5] = @"subframes(4)";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v33[5] = v19;
    v32[6] = @"subframes(5)";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v33[6] = v17;
    v32[7] = @"subframes(6)";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v33[7] = v15;
    v32[8] = @"subframes(7)";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v33[8] = v5;
    v32[9] = @"subframes(8)";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v33[9] = v7;
    v32[10] = @"subframes(9)";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v33[10] = v9;
    v32[11] = @"subframes(10)";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v33[11] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:12];
    v37[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionDCPScanoutStats
{
  void v26[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogDCPScanoutStats])
  {
    v25[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v23[0] = *MEMORY[0x1E4F92CD0];
    v23[1] = v2;
    v24[0] = &unk_1F29F06F0;
    v24[1] = @"logEventBackwardIOReport";
    void v23[2] = *MEMORY[0x1E4F92C60];
    void v24[2] = MEMORY[0x1E4F1CC28];
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
    v26[0] = v20;
    v25[1] = *MEMORY[0x1E4F92CA8];
    v21[0] = @"SampleTime";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat_withUnit_s");
    v22[0] = v18;
    v21[1] = @"prc";
    id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v22[1] = v16;
    v21[2] = @"pdc";
    id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    void v22[2] = v14;
    void v21[3] = @"pcc";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    void v22[3] = v4;
    void v21[4] = @"bics";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v22[4] = v6;
    v21[5] = @"ambient";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v22[5] = v8;
    v21[6] = @"duration_exp";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v22[6] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
    v26[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionSoCStatsH6PMGRCounters
{
  v83[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v82[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v80[0] = *MEMORY[0x1E4F92CD0];
    v80[1] = v2;
    v81[0] = &unk_1F29F0720;
    v81[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v80[2] = *MEMORY[0x1E4F92C60];
    v80[3] = v3;
    v81[2] = MEMORY[0x1E4F1CC28];
    v81[3] = MEMORY[0x1E4F1CC38];
    uint64_t v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:4];
    v83[0] = v77;
    v82[1] = *MEMORY[0x1E4F92CA8];
    v78[0] = @"SampleTime";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v75 = objc_msgSend(v76, "commonTypeDict_RealFormat_withUnit_s");
    v79[0] = v75;
    v78[1] = @"LIO_NOT_IDLE";
    uint64_t v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat");
    v79[1] = v73;
    void v78[2] = @"LIO_AF_NOT_IDLE";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v79[2] = v71;
    v78[3] = @"SEP_NOT_IDLE";
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat");
    v79[3] = v69;
    v78[4] = @"SIO_NOT_IDLE";
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
    void v79[4] = v67;
    v78[5] = @"ANS_NOT_IDLE";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_IntegerFormat");
    v79[5] = v65;
    v78[6] = @"MEDIA_NOT_IDLE";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v79[6] = v63;
    v78[7] = @"JPG_NOT_IDLE";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
    v79[7] = v61;
    v78[8] = @"MSR_NOT_IDLE";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v79[8] = v59;
    v78[9] = @"VDEC_NOT_IDLE";
    uint64_t v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat");
    v79[9] = v57;
    v78[10] = @"VENC_SYS_CORE0_NOT_IDLE";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v79[10] = v55;
    v78[11] = @"DISP0_NOT_IDLE";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat");
    v79[11] = v53;
    v78[12] = @"DISP_BUSMUX_NOT_IDLE";
    uint64_t v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v79[12] = v51;
    v78[13] = @"DISP1_NOT_IDLE";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
    v79[13] = v49;
    v78[14] = @"SF_NOT_IDLE";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v79[14] = v47;
    v78[15] = @"SMX_NOT_IDLE";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
    v79[15] = v45;
    v78[16] = @"MCU_NOT_IDLE";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v79[16] = v43;
    v78[17] = @"MCC_NOT_IDLE";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
    v79[17] = v41;
    v78[18] = @"AMPCAH_FIXED_NOT_IDLE";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v79[18] = v39;
    v78[19] = @"AMPCAV_FIXED_NOT_IDLE";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
    v79[19] = v37;
    v78[20] = @"AMPDQH_FIXED_NOT_IDLE";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v79[20] = v35;
    v78[21] = @"AMPDQV_FIXED_NOT_IDLE";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v79[21] = v33;
    v78[22] = @"HSIC0PHY_NOT_IDLE";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v79[22] = v31;
    v78[23] = @"HSIC1PHY_NOT_IDLE";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v79[23] = v29;
    v78[24] = @"HSIC2PHY_NOT_IDLE";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v79[24] = v27;
    v78[25] = @"AF_CLK_ON";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v79[25] = v25;
    v78[26] = @"LIO_CLK_ON";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v79[26] = v23;
    v78[27] = @"DISP0_CLK_ON";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v79[27] = v21;
    v78[28] = @"MCU_FIXED_CLK_ON";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v79[28] = v19;
    v78[29] = @"USB480_0_CLK_ON";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v79[29] = v17;
    v78[30] = @"ISP_SENSOR0_REF_CLK_ON";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v79[30] = v15;
    v78[31] = @"ISP_SENSOR1_REF_CLK_ON";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v79[31] = v5;
    v78[32] = @"SEP_POWER_ON";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v79[32] = v7;
    v78[33] = @"ACS_POWER_ON";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v79[33] = v9;
    v78[34] = @"AMC_POWER_ON";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v79[34] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:35];
    v83[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionSoCStatsVoltageDomainPerformanceStates
{
  v31[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v30[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v28[0] = *MEMORY[0x1E4F92CD0];
    v28[1] = v2;
    v29[0] = &unk_1F29F0710;
    v29[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v28[2] = *MEMORY[0x1E4F92C60];
    v28[3] = v3;
    v29[2] = MEMORY[0x1E4F1CC28];
    v29[3] = MEMORY[0x1E4F1CC38];
    double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
    v31[0] = v25;
    v30[1] = *MEMORY[0x1E4F92CA8];
    v26[0] = @"SampleTime";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_RealFormat_withUnit_s");
    v27[0] = v23;
    v26[1] = @"Domain0_V0P0";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v27[1] = v21;
    void v26[2] = @"Domain0_V0P0_Transitions";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    void v27[2] = v19;
    v26[3] = @"Domain0_V0P1";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v27[3] = v17;
    void v26[4] = @"Domain0_V0P1_Transitions";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v27[4] = v15;
    v26[5] = @"Domain0_V1P0";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v27[5] = v5;
    v26[6] = @"Domain0_V1P0_Transitions";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v27[6] = v7;
    v26[7] = @"Domain0_V1P1";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v27[7] = v9;
    v26[8] = @"Domain0_V1P1_Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v27[8] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:9];
    v31[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionSoCStatsDeviceStatesChannelID
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v18[0] = *MEMORY[0x1E4F92CD0];
  v18[1] = v2;
  v19[0] = &unk_1F29F06F0;
  v19[1] = @"logEventBackwardIOReport";
  uint64_t v3 = *MEMORY[0x1E4F92CE8];
  void v18[2] = *MEMORY[0x1E4F92C60];
  void v18[3] = v3;
  void v19[2] = MEMORY[0x1E4F1CC28];
  void v19[3] = MEMORY[0x1E4F1CC38];
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E4F92CA8];
  v16[0] = @"SampleTime";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat_withUnit_s");
  v17[0] = v5;
  v16[1] = @"channelID";
  double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v17[1] = v7;
  v16[2] = @"value";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
  v17[2] = v9;
  void v16[3] = @"channelName";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  void v17[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  v21[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v13;
}

+ (id)entryEventBackwardDefinitionSoCStatsDeviceStates
{
  v868[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats]
    && [MEMORY[0x1E4F929C0] BOOLForKey:@"enable_SoCStatsDeviceStates" ifNotSet:0])
  {
    v867[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v865[0] = *MEMORY[0x1E4F92CD0];
    v865[1] = v2;
    v866[0] = &unk_1F29F0760;
    v866[1] = @"logEventBackwardIOReport";
    v865[2] = *MEMORY[0x1E4F92C60];
    v866[2] = MEMORY[0x1E4F1CC28];
    v862 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v866 forKeys:v865 count:3];
    v868[0] = v862;
    v867[1] = *MEMORY[0x1E4F92CA8];
    v863[0] = @"SampleTime";
    v861 = [MEMORY[0x1E4F929D8] sharedInstance];
    v860 = objc_msgSend(v861, "commonTypeDict_RealFormat_withUnit_s");
    v864[0] = v860;
    v863[1] = @"CPU0_RUNMAX";
    v859 = [MEMORY[0x1E4F929D8] sharedInstance];
    v858 = objc_msgSend(v859, "commonTypeDict_RealFormat");
    v864[1] = v858;
    v863[2] = @"CPU1_RUNMAX";
    v857 = [MEMORY[0x1E4F929D8] sharedInstance];
    v856 = objc_msgSend(v857, "commonTypeDict_RealFormat");
    v864[2] = v856;
    v863[3] = @"CPU-SYS-IDLE_RUNMAX";
    v855 = [MEMORY[0x1E4F929D8] sharedInstance];
    v854 = objc_msgSend(v855, "commonTypeDict_RealFormat");
    v864[3] = v854;
    v863[4] = @"SIO_P_RUNMAX";
    v853 = [MEMORY[0x1E4F929D8] sharedInstance];
    v852 = objc_msgSend(v853, "commonTypeDict_RealFormat");
    v864[4] = v852;
    v863[5] = @"USB_RUNMAX";
    v851 = [MEMORY[0x1E4F929D8] sharedInstance];
    v850 = objc_msgSend(v851, "commonTypeDict_RealFormat");
    v864[5] = v850;
    v863[6] = @"USBCTRL_RUNMAX";
    v849 = [MEMORY[0x1E4F929D8] sharedInstance];
    v848 = objc_msgSend(v849, "commonTypeDict_RealFormat");
    v864[6] = v848;
    v863[7] = @"USB2HOST0_RUNMAX";
    v847 = [MEMORY[0x1E4F929D8] sharedInstance];
    v846 = objc_msgSend(v847, "commonTypeDict_RealFormat");
    v864[7] = v846;
    v863[8] = @"USB2HOST1_RUNMAX";
    v845 = [MEMORY[0x1E4F929D8] sharedInstance];
    v844 = objc_msgSend(v845, "commonTypeDict_RealFormat");
    v864[8] = v844;
    v863[9] = @"DISP_BUSMUX_RUNMAX";
    v843 = [MEMORY[0x1E4F929D8] sharedInstance];
    v842 = objc_msgSend(v843, "commonTypeDict_RealFormat");
    v864[9] = v842;
    v863[10] = @"MEDIA_RUNMAX";
    v841 = [MEMORY[0x1E4F929D8] sharedInstance];
    v840 = objc_msgSend(v841, "commonTypeDict_RealFormat");
    v864[10] = v840;
    v863[11] = @"SECUART0_RUNMAX";
    v839 = [MEMORY[0x1E4F929D8] sharedInstance];
    v838 = objc_msgSend(v839, "commonTypeDict_RealFormat");
    v864[11] = v838;
    v863[12] = @"SECUART1_RUNMAX";
    v837 = [MEMORY[0x1E4F929D8] sharedInstance];
    v836 = objc_msgSend(v837, "commonTypeDict_RealFormat");
    v864[12] = v836;
    v863[13] = @"ANS_RUNMAX";
    v835 = [MEMORY[0x1E4F929D8] sharedInstance];
    v834 = objc_msgSend(v835, "commonTypeDict_RealFormat");
    v864[13] = v834;
    v863[14] = @"ISP_SYS_RUNMAX";
    v833 = [MEMORY[0x1E4F929D8] sharedInstance];
    v832 = objc_msgSend(v833, "commonTypeDict_RealFormat");
    v864[14] = v832;
    v863[15] = @"MSR_RUNMAX";
    v831 = [MEMORY[0x1E4F929D8] sharedInstance];
    v830 = objc_msgSend(v831, "commonTypeDict_RealFormat");
    v864[15] = v830;
    v863[16] = @"JPG_RUNMAX";
    v829 = [MEMORY[0x1E4F929D8] sharedInstance];
    v828 = objc_msgSend(v829, "commonTypeDict_RealFormat");
    v864[16] = v828;
    v863[17] = @"DISP0_RUNMAX";
    v827 = [MEMORY[0x1E4F929D8] sharedInstance];
    v826 = objc_msgSend(v827, "commonTypeDict_RealFormat");
    v864[17] = v826;
    v863[18] = @"CPM_RUNMAX";
    v825 = [MEMORY[0x1E4F929D8] sharedInstance];
    v824 = objc_msgSend(v825, "commonTypeDict_RealFormat");
    v864[18] = v824;
    v863[19] = @"LIO_RUNMAX";
    v823 = [MEMORY[0x1E4F929D8] sharedInstance];
    v822 = objc_msgSend(v823, "commonTypeDict_RealFormat");
    v864[19] = v822;
    v863[20] = @"IOMUX_RUNMAX";
    v821 = [MEMORY[0x1E4F929D8] sharedInstance];
    v820 = objc_msgSend(v821, "commonTypeDict_RealFormat");
    v864[20] = v820;
    v863[21] = @"AIC_RUNMAX";
    v819 = [MEMORY[0x1E4F929D8] sharedInstance];
    v818 = objc_msgSend(v819, "commonTypeDict_RealFormat");
    v864[21] = v818;
    v863[22] = @"DEBUG_RUNMAX";
    v817 = [MEMORY[0x1E4F929D8] sharedInstance];
    v816 = objc_msgSend(v817, "commonTypeDict_RealFormat");
    v864[22] = v816;
    v863[23] = @"DWI_RUNMAX";
    v815 = [MEMORY[0x1E4F929D8] sharedInstance];
    v814 = objc_msgSend(v815, "commonTypeDict_RealFormat");
    v864[23] = v814;
    v863[24] = @"GPIO_RUNMAX";
    v813 = [MEMORY[0x1E4F929D8] sharedInstance];
    v812 = objc_msgSend(v813, "commonTypeDict_RealFormat");
    v864[24] = v812;
    v863[25] = @"MCA0_RUNMAX";
    v811 = [MEMORY[0x1E4F929D8] sharedInstance];
    v810 = objc_msgSend(v811, "commonTypeDict_RealFormat");
    v864[25] = v810;
    v863[26] = @"MCA1_RUNMAX";
    v809 = [MEMORY[0x1E4F929D8] sharedInstance];
    v808 = objc_msgSend(v809, "commonTypeDict_RealFormat");
    v864[26] = v808;
    v863[27] = @"MCA2_RUNMAX";
    v807 = [MEMORY[0x1E4F929D8] sharedInstance];
    v806 = objc_msgSend(v807, "commonTypeDict_RealFormat");
    v864[27] = v806;
    v863[28] = @"MCA3_RUNMAX";
    v805 = [MEMORY[0x1E4F929D8] sharedInstance];
    v804 = objc_msgSend(v805, "commonTypeDict_RealFormat");
    v864[28] = v804;
    v863[29] = @"MCA4_RUNMAX";
    v803 = [MEMORY[0x1E4F929D8] sharedInstance];
    v802 = objc_msgSend(v803, "commonTypeDict_RealFormat");
    v864[29] = v802;
    v863[30] = @"PWM0_RUNMAX";
    v801 = [MEMORY[0x1E4F929D8] sharedInstance];
    v800 = objc_msgSend(v801, "commonTypeDict_RealFormat");
    v864[30] = v800;
    v863[31] = @"I2C0_RUNMAX";
    v799 = [MEMORY[0x1E4F929D8] sharedInstance];
    v798 = objc_msgSend(v799, "commonTypeDict_RealFormat");
    v864[31] = v798;
    v863[32] = @"I2C1_RUNMAX";
    v797 = [MEMORY[0x1E4F929D8] sharedInstance];
    v796 = objc_msgSend(v797, "commonTypeDict_RealFormat");
    v864[32] = v796;
    v863[33] = @"I2C2_RUNMAX";
    v795 = [MEMORY[0x1E4F929D8] sharedInstance];
    v794 = objc_msgSend(v795, "commonTypeDict_RealFormat");
    v864[33] = v794;
    v863[34] = @"I2C3_RUNMAX";
    v793 = [MEMORY[0x1E4F929D8] sharedInstance];
    v792 = objc_msgSend(v793, "commonTypeDict_RealFormat");
    v864[34] = v792;
    v863[35] = @"SPI0_RUNMAX";
    v791 = [MEMORY[0x1E4F929D8] sharedInstance];
    v790 = objc_msgSend(v791, "commonTypeDict_RealFormat");
    v864[35] = v790;
    v863[36] = @"SPI1_RUNMAX";
    v789 = [MEMORY[0x1E4F929D8] sharedInstance];
    v788 = objc_msgSend(v789, "commonTypeDict_RealFormat");
    v864[36] = v788;
    v863[37] = @"SPI2_RUNMAX";
    v787 = [MEMORY[0x1E4F929D8] sharedInstance];
    v786 = objc_msgSend(v787, "commonTypeDict_RealFormat");
    v864[37] = v786;
    v863[38] = @"SPI3_RUNMAX";
    v785 = [MEMORY[0x1E4F929D8] sharedInstance];
    v784 = objc_msgSend(v785, "commonTypeDict_RealFormat");
    v864[38] = v784;
    v863[39] = @"UART0_RUNMAX";
    v783 = [MEMORY[0x1E4F929D8] sharedInstance];
    v782 = objc_msgSend(v783, "commonTypeDict_RealFormat");
    v864[39] = v782;
    v863[40] = @"UART1_RUNMAX";
    v781 = [MEMORY[0x1E4F929D8] sharedInstance];
    v780 = objc_msgSend(v781, "commonTypeDict_RealFormat");
    v864[40] = v780;
    v863[41] = @"UART2_RUNMAX";
    v779 = [MEMORY[0x1E4F929D8] sharedInstance];
    v778 = objc_msgSend(v779, "commonTypeDict_RealFormat");
    v864[41] = v778;
    v863[42] = @"UART3_RUNMAX";
    v777 = [MEMORY[0x1E4F929D8] sharedInstance];
    v776 = objc_msgSend(v777, "commonTypeDict_RealFormat");
    v864[42] = v776;
    v863[43] = @"UART4_RUNMAX";
    v775 = [MEMORY[0x1E4F929D8] sharedInstance];
    v774 = objc_msgSend(v775, "commonTypeDict_RealFormat");
    v864[43] = v774;
    v863[44] = @"UART5_RUNMAX";
    v773 = [MEMORY[0x1E4F929D8] sharedInstance];
    v772 = objc_msgSend(v773, "commonTypeDict_RealFormat");
    v864[44] = v772;
    v863[45] = @"UART6_RUNMAX";
    v771 = [MEMORY[0x1E4F929D8] sharedInstance];
    v770 = objc_msgSend(v771, "commonTypeDict_RealFormat");
    v864[45] = v770;
    v863[46] = @"AES0_RUNMAX";
    v769 = [MEMORY[0x1E4F929D8] sharedInstance];
    v768 = objc_msgSend(v769, "commonTypeDict_RealFormat");
    v864[46] = v768;
    v863[47] = @"SIO_RUNMAX";
    v767 = [MEMORY[0x1E4F929D8] sharedInstance];
    v766 = objc_msgSend(v767, "commonTypeDict_RealFormat");
    v864[47] = v766;
    v863[48] = @"HSIC0_PHY_RUNMAX";
    v765 = [MEMORY[0x1E4F929D8] sharedInstance];
    v764 = objc_msgSend(v765, "commonTypeDict_RealFormat");
    v864[48] = v764;
    v863[49] = @"HSIC1_PHY_RUNMAX";
    v763 = [MEMORY[0x1E4F929D8] sharedInstance];
    v762 = objc_msgSend(v763, "commonTypeDict_RealFormat");
    v864[49] = v762;
    v863[50] = @"HSIC2_PHY_RUNMAX";
    v761 = [MEMORY[0x1E4F929D8] sharedInstance];
    v760 = objc_msgSend(v761, "commonTypeDict_RealFormat");
    v864[50] = v760;
    v863[51] = @"ISPSENS0_RUNMAX";
    v759 = [MEMORY[0x1E4F929D8] sharedInstance];
    v758 = objc_msgSend(v759, "commonTypeDict_RealFormat");
    v864[51] = v758;
    v863[52] = @"ISPSENS1_RUNMAX";
    v757 = [MEMORY[0x1E4F929D8] sharedInstance];
    v756 = objc_msgSend(v757, "commonTypeDict_RealFormat");
    v864[52] = v756;
    v863[53] = @"MCC_RUNMAX";
    v755 = [MEMORY[0x1E4F929D8] sharedInstance];
    v754 = objc_msgSend(v755, "commonTypeDict_RealFormat");
    v864[53] = v754;
    v863[54] = @"MCU_RUNMAX";
    v753 = [MEMORY[0x1E4F929D8] sharedInstance];
    v752 = objc_msgSend(v753, "commonTypeDict_RealFormat");
    v864[54] = v752;
    v863[55] = @"AMP_RUNMAX";
    v751 = [MEMORY[0x1E4F929D8] sharedInstance];
    v750 = objc_msgSend(v751, "commonTypeDict_RealFormat");
    v864[55] = v750;
    v863[56] = @"USB2HOST0_OHCI_RUNMAX";
    v749 = [MEMORY[0x1E4F929D8] sharedInstance];
    v748 = objc_msgSend(v749, "commonTypeDict_RealFormat");
    v864[56] = v748;
    v863[57] = @"USB2HOST1_OHCI_RUNMAX";
    v747 = [MEMORY[0x1E4F929D8] sharedInstance];
    v746 = objc_msgSend(v747, "commonTypeDict_RealFormat");
    v864[57] = v746;
    v863[58] = @"USBOTG_RUNMAX";
    v745 = [MEMORY[0x1E4F929D8] sharedInstance];
    v744 = objc_msgSend(v745, "commonTypeDict_RealFormat");
    v864[58] = v744;
    v863[59] = @"SMX_RUNMAX";
    v743 = [MEMORY[0x1E4F929D8] sharedInstance];
    v742 = objc_msgSend(v743, "commonTypeDict_RealFormat");
    v864[59] = v742;
    v863[60] = @"SF_RUNMAX";
    v741 = [MEMORY[0x1E4F929D8] sharedInstance];
    v740 = objc_msgSend(v741, "commonTypeDict_RealFormat");
    v864[60] = v740;
    v863[61] = @"CP_RUNMAX";
    v739 = [MEMORY[0x1E4F929D8] sharedInstance];
    v738 = objc_msgSend(v739, "commonTypeDict_RealFormat");
    v864[61] = v738;
    v863[62] = @"ISP_DART_RUNMAX";
    v737 = [MEMORY[0x1E4F929D8] sharedInstance];
    v736 = objc_msgSend(v737, "commonTypeDict_RealFormat");
    v864[62] = v736;
    v863[63] = @"MSR_DART_RUNMAX";
    v735 = [MEMORY[0x1E4F929D8] sharedInstance];
    v734 = objc_msgSend(v735, "commonTypeDict_RealFormat");
    v864[63] = v734;
    v863[64] = @"JPG_DART_RUNMAX";
    v733 = [MEMORY[0x1E4F929D8] sharedInstance];
    v732 = objc_msgSend(v733, "commonTypeDict_RealFormat");
    v864[64] = v732;
    v863[65] = @"DISP0-V_RUNMAX";
    v731 = [MEMORY[0x1E4F929D8] sharedInstance];
    v730 = objc_msgSend(v731, "commonTypeDict_RealFormat");
    v864[65] = v730;
    v863[66] = @"MIPI_DSI_RUNMAX";
    v729 = [MEMORY[0x1E4F929D8] sharedInstance];
    v728 = objc_msgSend(v729, "commonTypeDict_RealFormat");
    v864[66] = v728;
    v863[67] = @"DP_RUNMAX";
    v727 = [MEMORY[0x1E4F929D8] sharedInstance];
    v726 = objc_msgSend(v727, "commonTypeDict_RealFormat");
    v864[67] = v726;
    v863[68] = @"DISP1_RUNMAX";
    v725 = [MEMORY[0x1E4F929D8] sharedInstance];
    v724 = objc_msgSend(v725, "commonTypeDict_RealFormat");
    v864[68] = v724;
    v863[69] = @"DISP-FB-ACTIVE_RUNMAX";
    v723 = [MEMORY[0x1E4F929D8] sharedInstance];
    v722 = objc_msgSend(v723, "commonTypeDict_RealFormat");
    v864[69] = v722;
    v863[70] = @"DISP-FB-MCACHE_RUNMAX";
    v721 = [MEMORY[0x1E4F929D8] sharedInstance];
    v720 = objc_msgSend(v721, "commonTypeDict_RealFormat");
    v864[70] = v720;
    v863[71] = @"DISP-MIE-DPB_RUNMAX";
    v719 = [MEMORY[0x1E4F929D8] sharedInstance];
    v718 = objc_msgSend(v719, "commonTypeDict_RealFormat");
    v864[71] = v718;
    v863[72] = @"VDEC_RUNMAX";
    v717 = [MEMORY[0x1E4F929D8] sharedInstance];
    v716 = objc_msgSend(v717, "commonTypeDict_RealFormat");
    v864[72] = v716;
    v863[73] = @"VENC_SYS_RUNMAX";
    v715 = [MEMORY[0x1E4F929D8] sharedInstance];
    v714 = objc_msgSend(v715, "commonTypeDict_RealFormat");
    v864[73] = v714;
    v863[74] = @"ANS_DLL_RUNMAX";
    v713 = [MEMORY[0x1E4F929D8] sharedInstance];
    v712 = objc_msgSend(v713, "commonTypeDict_RealFormat");
    v864[74] = v712;
    v863[75] = @"GFX_RUNMAX";
    v711 = [MEMORY[0x1E4F929D8] sharedInstance];
    v710 = objc_msgSend(v711, "commonTypeDict_RealFormat");
    v864[75] = v710;
    v863[76] = @"SEP_RUNMAX";
    v709 = [MEMORY[0x1E4F929D8] sharedInstance];
    v708 = objc_msgSend(v709, "commonTypeDict_RealFormat");
    v864[76] = v708;
    v863[77] = @"AES_CLKOFF";
    v707 = [MEMORY[0x1E4F929D8] sharedInstance];
    v706 = objc_msgSend(v707, "commonTypeDict_RealFormat");
    v864[77] = v706;
    v863[78] = @"AES_RUNMAX";
    v705 = [MEMORY[0x1E4F929D8] sharedInstance];
    v704 = objc_msgSend(v705, "commonTypeDict_RealFormat");
    v864[78] = v704;
    v863[79] = @"AIC_CLKOFF";
    v703 = [MEMORY[0x1E4F929D8] sharedInstance];
    v702 = objc_msgSend(v703, "commonTypeDict_RealFormat");
    v864[79] = v702;
    v863[80] = @"ANE-DART_CLKOFF";
    v701 = [MEMORY[0x1E4F929D8] sharedInstance];
    v700 = objc_msgSend(v701, "commonTypeDict_RealFormat");
    v864[80] = v700;
    v863[81] = @"ANE-DART_RUNMAX";
    v699 = [MEMORY[0x1E4F929D8] sharedInstance];
    v698 = objc_msgSend(v699, "commonTypeDict_RealFormat");
    v864[81] = v698;
    v863[82] = @"ANE-SYS-V_CLKOFF";
    v697 = [MEMORY[0x1E4F929D8] sharedInstance];
    v696 = objc_msgSend(v697, "commonTypeDict_RealFormat");
    v864[82] = v696;
    v863[83] = @"ANE-SYS-V_RUNMAX";
    v695 = [MEMORY[0x1E4F929D8] sharedInstance];
    v694 = objc_msgSend(v695, "commonTypeDict_RealFormat");
    v864[83] = v694;
    v863[84] = @"ANE_SYS_CLKOFF";
    v693 = [MEMORY[0x1E4F929D8] sharedInstance];
    v692 = objc_msgSend(v693, "commonTypeDict_RealFormat");
    v864[84] = v692;
    v863[85] = @"ANE_SYS_RUNMAX";
    v691 = [MEMORY[0x1E4F929D8] sharedInstance];
    v690 = objc_msgSend(v691, "commonTypeDict_RealFormat");
    v864[85] = v690;
    v863[86] = @"ANS2_CLKOFF";
    v689 = [MEMORY[0x1E4F929D8] sharedInstance];
    v688 = objc_msgSend(v689, "commonTypeDict_RealFormat");
    v864[86] = v688;
    v863[87] = @"ANS2_RUNMAX";
    v687 = [MEMORY[0x1E4F929D8] sharedInstance];
    v686 = objc_msgSend(v687, "commonTypeDict_RealFormat");
    v864[87] = v686;
    v863[88] = @"APCIE-V_CLKOFF";
    v685 = [MEMORY[0x1E4F929D8] sharedInstance];
    v684 = objc_msgSend(v685, "commonTypeDict_RealFormat");
    v864[88] = v684;
    v863[89] = @"APCIE-V_RUNMAX";
    v683 = [MEMORY[0x1E4F929D8] sharedInstance];
    v682 = objc_msgSend(v683, "commonTypeDict_RealFormat");
    v864[89] = v682;
    v863[90] = @"APCIE_CLKOFF";
    v681 = [MEMORY[0x1E4F929D8] sharedInstance];
    v680 = objc_msgSend(v681, "commonTypeDict_RealFormat");
    v864[90] = v680;
    v863[91] = @"APCIE_GP_CLKOFF";
    v679 = [MEMORY[0x1E4F929D8] sharedInstance];
    v678 = objc_msgSend(v679, "commonTypeDict_RealFormat");
    v864[91] = v678;
    v863[92] = @"APCIE_GP_RUNMAX";
    v677 = [MEMORY[0x1E4F929D8] sharedInstance];
    v676 = objc_msgSend(v677, "commonTypeDict_RealFormat");
    v864[92] = v676;
    v863[93] = @"APCIE_RUNMAX";
    v675 = [MEMORY[0x1E4F929D8] sharedInstance];
    v674 = objc_msgSend(v675, "commonTypeDict_RealFormat");
    v864[93] = v674;
    v863[94] = @"APCIE_ST_CLKOFF";
    v673 = [MEMORY[0x1E4F929D8] sharedInstance];
    v672 = objc_msgSend(v673, "commonTypeDict_RealFormat");
    v864[94] = v672;
    v863[95] = @"APCIE_ST_RUNMAX";
    v671 = [MEMORY[0x1E4F929D8] sharedInstance];
    v670 = objc_msgSend(v671, "commonTypeDict_RealFormat");
    v864[95] = v670;
    v863[96] = @"AUDIO_CLKOFF";
    v669 = [MEMORY[0x1E4F929D8] sharedInstance];
    v668 = objc_msgSend(v669, "commonTypeDict_RealFormat");
    v864[96] = v668;
    v863[97] = @"AUDIO_CPU_CLKOFF";
    v667 = [MEMORY[0x1E4F929D8] sharedInstance];
    v666 = objc_msgSend(v667, "commonTypeDict_RealFormat");
    v864[97] = v666;
    v863[98] = @"AUDIO_CPU_RUNMAX";
    v665 = [MEMORY[0x1E4F929D8] sharedInstance];
    v664 = objc_msgSend(v665, "commonTypeDict_RealFormat");
    v864[98] = v664;
    v863[99] = @"AUDIO_RUNMAX";
    v663 = [MEMORY[0x1E4F929D8] sharedInstance];
    v662 = objc_msgSend(v663, "commonTypeDict_RealFormat");
    v864[99] = v662;
    v863[100] = @"AVD-DART_CLKOFF";
    v661 = [MEMORY[0x1E4F929D8] sharedInstance];
    v660 = objc_msgSend(v661, "commonTypeDict_RealFormat");
    v864[100] = v660;
    v863[101] = @"AVD-DART_RUNMAX";
    v659 = [MEMORY[0x1E4F929D8] sharedInstance];
    v658 = objc_msgSend(v659, "commonTypeDict_RealFormat");
    v864[101] = v658;
    v863[102] = @"AVD-SOC-VMAX_CLKOFF";
    v657 = [MEMORY[0x1E4F929D8] sharedInstance];
    v656 = objc_msgSend(v657, "commonTypeDict_RealFormat");
    v864[102] = v656;
    v863[103] = @"AVD-SOC-VMAX_RUNMAX";
    v655 = [MEMORY[0x1E4F929D8] sharedInstance];
    v654 = objc_msgSend(v655, "commonTypeDict_RealFormat");
    v864[103] = v654;
    v863[104] = @"AVD-SOC-VNOM_CLKOFF";
    v653 = [MEMORY[0x1E4F929D8] sharedInstance];
    v652 = objc_msgSend(v653, "commonTypeDict_RealFormat");
    v864[104] = v652;
    v863[105] = @"AVD-SOC-VNOM_RUNMAX";
    v651 = [MEMORY[0x1E4F929D8] sharedInstance];
    v650 = objc_msgSend(v651, "commonTypeDict_RealFormat");
    v864[105] = v650;
    v863[106] = @"AVD-SYS-V_CLKOFF";
    v649 = [MEMORY[0x1E4F929D8] sharedInstance];
    v648 = objc_msgSend(v649, "commonTypeDict_RealFormat");
    v864[106] = v648;
    v863[107] = @"AVD-SYS-V_RUNMAX";
    v647 = [MEMORY[0x1E4F929D8] sharedInstance];
    v646 = objc_msgSend(v647, "commonTypeDict_RealFormat");
    v864[107] = v646;
    v863[108] = @"AVD_SYS_CLKOFF";
    v645 = [MEMORY[0x1E4F929D8] sharedInstance];
    v644 = objc_msgSend(v645, "commonTypeDict_RealFormat");
    v864[108] = v644;
    v863[109] = @"AVD_SYS_RUNMAX";
    v643 = [MEMORY[0x1E4F929D8] sharedInstance];
    v642 = objc_msgSend(v643, "commonTypeDict_RealFormat");
    v864[109] = v642;
    v863[110] = @"CLPC-DCS-VMAX_CLKOFF";
    v641 = [MEMORY[0x1E4F929D8] sharedInstance];
    v640 = objc_msgSend(v641, "commonTypeDict_RealFormat");
    v864[110] = v640;
    v863[111] = @"CLPC-DCS-VMAX_RUNMAX";
    v639 = [MEMORY[0x1E4F929D8] sharedInstance];
    v638 = objc_msgSend(v639, "commonTypeDict_RealFormat");
    v864[111] = v638;
    v863[112] = @"CLPC-DCS-VNOM_CLKOFF";
    v637 = [MEMORY[0x1E4F929D8] sharedInstance];
    v636 = objc_msgSend(v637, "commonTypeDict_RealFormat");
    v864[112] = v636;
    v863[113] = @"CLPC-DCS-VNOM_RUNMAX";
    v635 = [MEMORY[0x1E4F929D8] sharedInstance];
    v634 = objc_msgSend(v635, "commonTypeDict_RealFormat");
    v864[113] = v634;
    v863[114] = @"CLPC-SOC-VMAX_CLKOFF";
    v633 = [MEMORY[0x1E4F929D8] sharedInstance];
    v632 = objc_msgSend(v633, "commonTypeDict_RealFormat");
    v864[114] = v632;
    v863[115] = @"CLPC-SOC-VMAX_RUNMAX";
    v631 = [MEMORY[0x1E4F929D8] sharedInstance];
    v630 = objc_msgSend(v631, "commonTypeDict_RealFormat");
    v864[115] = v630;
    v863[116] = @"CLPC-SOC-VNOM_CLKOFF";
    v629 = [MEMORY[0x1E4F929D8] sharedInstance];
    v628 = objc_msgSend(v629, "commonTypeDict_RealFormat");
    v864[116] = v628;
    v863[117] = @"CLPC-SOC-VNOM_RUNMAX";
    v627 = [MEMORY[0x1E4F929D8] sharedInstance];
    v626 = objc_msgSend(v627, "commonTypeDict_RealFormat");
    v864[117] = v626;
    v863[118] = @"CPU-BUSY_CLKOFF";
    v625 = [MEMORY[0x1E4F929D8] sharedInstance];
    v624 = objc_msgSend(v625, "commonTypeDict_RealFormat");
    v864[118] = v624;
    v863[119] = @"CPU-BUSY_RUNMAX";
    v623 = [MEMORY[0x1E4F929D8] sharedInstance];
    v622 = objc_msgSend(v623, "commonTypeDict_RealFormat");
    v864[119] = v622;
    v863[120] = @"DCS0_CLKOFF";
    v621 = [MEMORY[0x1E4F929D8] sharedInstance];
    v620 = objc_msgSend(v621, "commonTypeDict_RealFormat");
    v864[120] = v620;
    v863[121] = @"DCS0_RUNMAX";
    v619 = [MEMORY[0x1E4F929D8] sharedInstance];
    v618 = objc_msgSend(v619, "commonTypeDict_RealFormat");
    v864[121] = v618;
    v863[122] = @"DCS1_CLKOFF";
    v617 = [MEMORY[0x1E4F929D8] sharedInstance];
    v616 = objc_msgSend(v617, "commonTypeDict_RealFormat");
    v864[122] = v616;
    v863[123] = @"DCS1_RUNMAX";
    v615 = [MEMORY[0x1E4F929D8] sharedInstance];
    v614 = objc_msgSend(v615, "commonTypeDict_RealFormat");
    v864[123] = v614;
    v863[124] = @"DCS2_CLKOFF";
    v613 = [MEMORY[0x1E4F929D8] sharedInstance];
    v612 = objc_msgSend(v613, "commonTypeDict_RealFormat");
    v864[124] = v612;
    v863[125] = @"DCS2_RUNMAX";
    v611 = [MEMORY[0x1E4F929D8] sharedInstance];
    v610 = objc_msgSend(v611, "commonTypeDict_RealFormat");
    v864[125] = v610;
    v863[126] = @"DCS3_CLKOFF";
    v609 = [MEMORY[0x1E4F929D8] sharedInstance];
    v608 = objc_msgSend(v609, "commonTypeDict_RealFormat");
    v864[126] = v608;
    v863[127] = @"DCS3_RUNMAX";
    v607 = [MEMORY[0x1E4F929D8] sharedInstance];
    v606 = objc_msgSend(v607, "commonTypeDict_RealFormat");
    v864[127] = v606;
    v863[128] = @"DEBUG_CLKOFF";
    v605 = [MEMORY[0x1E4F929D8] sharedInstance];
    v604 = objc_msgSend(v605, "commonTypeDict_RealFormat");
    v864[128] = v604;
    v863[129] = @"DEBUG_USB_CLKOFF";
    v603 = [MEMORY[0x1E4F929D8] sharedInstance];
    v602 = objc_msgSend(v603, "commonTypeDict_RealFormat");
    v864[129] = v602;
    v863[130] = @"DEBUG_USB_RUNMAX";
    v601 = [MEMORY[0x1E4F929D8] sharedInstance];
    v600 = objc_msgSend(v601, "commonTypeDict_RealFormat");
    v864[130] = v600;
    v863[131] = @"DISP-CPM-PG_CLKOFF";
    v599 = [MEMORY[0x1E4F929D8] sharedInstance];
    v598 = objc_msgSend(v599, "commonTypeDict_RealFormat");
    v864[131] = v598;
    v863[132] = @"DISP-CPM-PG_RUNMAX";
    v597 = [MEMORY[0x1E4F929D8] sharedInstance];
    v596 = objc_msgSend(v597, "commonTypeDict_RealFormat");
    v864[132] = v596;
    v863[133] = @"DISP-DCS-PG_CLKOFF";
    v595 = [MEMORY[0x1E4F929D8] sharedInstance];
    v594 = objc_msgSend(v595, "commonTypeDict_RealFormat");
    v864[133] = v594;
    v863[134] = @"DISP-DCS-PG_RUNMAX";
    v593 = [MEMORY[0x1E4F929D8] sharedInstance];
    v592 = objc_msgSend(v593, "commonTypeDict_RealFormat");
    v864[134] = v592;
    v863[135] = @"DISP-FB-ACTIVE_CLKOFF";
    v591 = [MEMORY[0x1E4F929D8] sharedInstance];
    v590 = objc_msgSend(v591, "commonTypeDict_RealFormat");
    v864[135] = v590;
    v863[136] = @"DISP-MIE-DPB_CLKOFF";
    v589 = [MEMORY[0x1E4F929D8] sharedInstance];
    v588 = objc_msgSend(v589, "commonTypeDict_RealFormat");
    v864[136] = v588;
    v863[137] = @"DISP0-DART_CLKOFF";
    v587 = [MEMORY[0x1E4F929D8] sharedInstance];
    v586 = objc_msgSend(v587, "commonTypeDict_RealFormat");
    v864[137] = v586;
    v863[138] = @"DISP0-DART_RUNMAX";
    v585 = [MEMORY[0x1E4F929D8] sharedInstance];
    v584 = objc_msgSend(v585, "commonTypeDict_RealFormat");
    v864[138] = v584;
    v863[139] = @"DISP0-V_CLKOFF";
    v583 = [MEMORY[0x1E4F929D8] sharedInstance];
    v582 = objc_msgSend(v583, "commonTypeDict_RealFormat");
    v864[139] = v582;
    v863[140] = @"DISP0_BE_2X_CLKOFF";
    v581 = [MEMORY[0x1E4F929D8] sharedInstance];
    v580 = objc_msgSend(v581, "commonTypeDict_RealFormat");
    v864[140] = v580;
    v863[141] = @"DISP0_BE_2X_RUNMAX";
    v579 = [MEMORY[0x1E4F929D8] sharedInstance];
    v578 = objc_msgSend(v579, "commonTypeDict_RealFormat");
    v864[141] = v578;
    v863[142] = @"DISP0_BE_CLKOFF";
    v577 = [MEMORY[0x1E4F929D8] sharedInstance];
    v576 = objc_msgSend(v577, "commonTypeDict_RealFormat");
    v864[142] = v576;
    v863[143] = @"DISP0_BE_RUNMAX";
    v575 = [MEMORY[0x1E4F929D8] sharedInstance];
    v574 = objc_msgSend(v575, "commonTypeDict_RealFormat");
    v864[143] = v574;
    v863[144] = @"DISP0_BUSIF_CLKOFF";
    v573 = [MEMORY[0x1E4F929D8] sharedInstance];
    v572 = objc_msgSend(v573, "commonTypeDict_RealFormat");
    v864[144] = v572;
    v863[145] = @"DISP0_BUSIF_RUNMAX";
    v571 = [MEMORY[0x1E4F929D8] sharedInstance];
    v570 = objc_msgSend(v571, "commonTypeDict_RealFormat");
    v864[145] = v570;
    v863[146] = @"DISP0_DSC_CLKOFF";
    v569 = [MEMORY[0x1E4F929D8] sharedInstance];
    v568 = objc_msgSend(v569, "commonTypeDict_RealFormat");
    v864[146] = v568;
    v863[147] = @"DISP0_DSC_RUNMAX";
    v567 = [MEMORY[0x1E4F929D8] sharedInstance];
    v566 = objc_msgSend(v567, "commonTypeDict_RealFormat");
    v864[147] = v566;
    v863[148] = @"DISP0_FE_CLKOFF";
    v565 = [MEMORY[0x1E4F929D8] sharedInstance];
    v564 = objc_msgSend(v565, "commonTypeDict_RealFormat");
    v864[148] = v564;
    v863[149] = @"DISP0_FE_RUNMAX";
    v563 = [MEMORY[0x1E4F929D8] sharedInstance];
    v562 = objc_msgSend(v563, "commonTypeDict_RealFormat");
    v864[149] = v562;
    v863[150] = @"DISP0_GP0_CLKOFF";
    v561 = [MEMORY[0x1E4F929D8] sharedInstance];
    v560 = objc_msgSend(v561, "commonTypeDict_RealFormat");
    v864[150] = v560;
    v863[151] = @"DISP0_GP0_RUNMAX";
    v559 = [MEMORY[0x1E4F929D8] sharedInstance];
    v558 = objc_msgSend(v559, "commonTypeDict_RealFormat");
    v864[151] = v558;
    v863[152] = @"DISP0_GP1_CLKOFF";
    v557 = [MEMORY[0x1E4F929D8] sharedInstance];
    v556 = objc_msgSend(v557, "commonTypeDict_RealFormat");
    v864[152] = v556;
    v863[153] = @"DISP0_GP1_RUNMAX";
    v555 = [MEMORY[0x1E4F929D8] sharedInstance];
    v554 = objc_msgSend(v555, "commonTypeDict_RealFormat");
    v864[153] = v554;
    v863[154] = @"DISP0_HILO_CLKOFF";
    v553 = [MEMORY[0x1E4F929D8] sharedInstance];
    v552 = objc_msgSend(v553, "commonTypeDict_RealFormat");
    v864[154] = v552;
    v863[155] = @"DISP0_HILO_RUNMAX";
    v551 = [MEMORY[0x1E4F929D8] sharedInstance];
    v550 = objc_msgSend(v551, "commonTypeDict_RealFormat");
    v864[155] = v550;
    v863[156] = @"DISP0_PPP_CLKOFF";
    v549 = [MEMORY[0x1E4F929D8] sharedInstance];
    v548 = objc_msgSend(v549, "commonTypeDict_RealFormat");
    v864[156] = v548;
    v863[157] = @"DISP0_PPP_RUNMAX";
    v547 = [MEMORY[0x1E4F929D8] sharedInstance];
    v546 = objc_msgSend(v547, "commonTypeDict_RealFormat");
    v864[157] = v546;
    v863[158] = @"DPA_CLKOFF";
    v545 = [MEMORY[0x1E4F929D8] sharedInstance];
    v544 = objc_msgSend(v545, "commonTypeDict_RealFormat");
    v864[158] = v544;
    v863[159] = @"DPA_RUNMAX";
    v543 = [MEMORY[0x1E4F929D8] sharedInstance];
    v542 = objc_msgSend(v543, "commonTypeDict_RealFormat");
    v864[159] = v542;
    v863[160] = @"DP_CLKOFF";
    v541 = [MEMORY[0x1E4F929D8] sharedInstance];
    v540 = objc_msgSend(v541, "commonTypeDict_RealFormat");
    v864[160] = v540;
    v863[161] = @"DWI_CLKOFF";
    v539 = [MEMORY[0x1E4F929D8] sharedInstance];
    v538 = objc_msgSend(v539, "commonTypeDict_RealFormat");
    v864[161] = v538;
    v863[162] = @"ECPM_CLKOFF";
    v537 = [MEMORY[0x1E4F929D8] sharedInstance];
    v536 = objc_msgSend(v537, "commonTypeDict_RealFormat");
    v864[162] = v536;
    v863[163] = @"ECPM_RUNMAX";
    v535 = [MEMORY[0x1E4F929D8] sharedInstance];
    v534 = objc_msgSend(v535, "commonTypeDict_RealFormat");
    v864[163] = v534;
    v863[164] = @"ECPU0_CLKOFF";
    v533 = [MEMORY[0x1E4F929D8] sharedInstance];
    v532 = objc_msgSend(v533, "commonTypeDict_RealFormat");
    v864[164] = v532;
    v863[165] = @"ECPU0_RUNMAX";
    v531 = [MEMORY[0x1E4F929D8] sharedInstance];
    v530 = objc_msgSend(v531, "commonTypeDict_RealFormat");
    v864[165] = v530;
    v863[166] = @"ECPU1_CLKOFF";
    v529 = [MEMORY[0x1E4F929D8] sharedInstance];
    v528 = objc_msgSend(v529, "commonTypeDict_RealFormat");
    v864[166] = v528;
    v863[167] = @"ECPU1_RUNMAX";
    v527 = [MEMORY[0x1E4F929D8] sharedInstance];
    v526 = objc_msgSend(v527, "commonTypeDict_RealFormat");
    v864[167] = v526;
    v863[168] = @"ECPU2_CLKOFF";
    v525 = [MEMORY[0x1E4F929D8] sharedInstance];
    v524 = objc_msgSend(v525, "commonTypeDict_RealFormat");
    v864[168] = v524;
    v863[169] = @"ECPU2_RUNMAX";
    v523 = [MEMORY[0x1E4F929D8] sharedInstance];
    v522 = objc_msgSend(v523, "commonTypeDict_RealFormat");
    v864[169] = v522;
    v863[170] = @"ECPU3_CLKOFF";
    v521 = [MEMORY[0x1E4F929D8] sharedInstance];
    v520 = objc_msgSend(v521, "commonTypeDict_RealFormat");
    v864[170] = v520;
    v863[171] = @"ECPU3_RUNMAX";
    v519 = [MEMORY[0x1E4F929D8] sharedInstance];
    v518 = objc_msgSend(v519, "commonTypeDict_RealFormat");
    v864[171] = v518;
    v863[172] = @"ECPU_CLKOFF";
    v517 = [MEMORY[0x1E4F929D8] sharedInstance];
    v516 = objc_msgSend(v517, "commonTypeDict_RealFormat");
    v864[172] = v516;
    v863[173] = @"ECPU_RUNMAX";
    v515 = [MEMORY[0x1E4F929D8] sharedInstance];
    v514 = objc_msgSend(v515, "commonTypeDict_RealFormat");
    v864[173] = v514;
    v863[174] = @"GFX-ASC_CLKOFF";
    v513 = [MEMORY[0x1E4F929D8] sharedInstance];
    v512 = objc_msgSend(v513, "commonTypeDict_RealFormat");
    v864[174] = v512;
    v863[175] = @"GFX-ASC_RUNMAX";
    v511 = [MEMORY[0x1E4F929D8] sharedInstance];
    v510 = objc_msgSend(v511, "commonTypeDict_RealFormat");
    v864[175] = v510;
    v863[176] = @"GFX-BUSY_CLKOFF";
    v509 = [MEMORY[0x1E4F929D8] sharedInstance];
    v508 = objc_msgSend(v509, "commonTypeDict_RealFormat");
    v864[176] = v508;
    v863[177] = @"GFX-BUSY_RUNMAX";
    v507 = [MEMORY[0x1E4F929D8] sharedInstance];
    v506 = objc_msgSend(v507, "commonTypeDict_RealFormat");
    v864[177] = v506;
    v863[178] = @"GFX-SGX_CLKOFF";
    v505 = [MEMORY[0x1E4F929D8] sharedInstance];
    v504 = objc_msgSend(v505, "commonTypeDict_RealFormat");
    v864[178] = v504;
    v863[179] = @"GFX-SGX_RUNMAX";
    v503 = [MEMORY[0x1E4F929D8] sharedInstance];
    v502 = objc_msgSend(v503, "commonTypeDict_RealFormat");
    v864[179] = v502;
    v863[180] = @"GFX_CLKOFF";
    v501 = [MEMORY[0x1E4F929D8] sharedInstance];
    v500 = objc_msgSend(v501, "commonTypeDict_RealFormat");
    v864[180] = v500;
    v863[181] = @"GPIO_CLKOFF";
    v499 = [MEMORY[0x1E4F929D8] sharedInstance];
    v498 = objc_msgSend(v499, "commonTypeDict_RealFormat");
    v864[181] = v498;
    v863[182] = @"I2C0_CLKOFF";
    v497 = [MEMORY[0x1E4F929D8] sharedInstance];
    v496 = objc_msgSend(v497, "commonTypeDict_RealFormat");
    v864[182] = v496;
    v863[183] = @"I2C1_CLKOFF";
    v495 = [MEMORY[0x1E4F929D8] sharedInstance];
    v494 = objc_msgSend(v495, "commonTypeDict_RealFormat");
    v864[183] = v494;
    v863[184] = @"I2C2_CLKOFF";
    v493 = [MEMORY[0x1E4F929D8] sharedInstance];
    v492 = objc_msgSend(v493, "commonTypeDict_RealFormat");
    v864[184] = v492;
    v863[185] = @"I2C3_CLKOFF";
    v491 = [MEMORY[0x1E4F929D8] sharedInstance];
    v490 = objc_msgSend(v491, "commonTypeDict_RealFormat");
    v864[185] = v490;
    v863[186] = @"IMX_CLKOFF";
    v489 = [MEMORY[0x1E4F929D8] sharedInstance];
    v488 = objc_msgSend(v489, "commonTypeDict_RealFormat");
    v864[186] = v488;
    v863[187] = @"IMX_RUNMAX";
    v487 = [MEMORY[0x1E4F929D8] sharedInstance];
    v486 = objc_msgSend(v487, "commonTypeDict_RealFormat");
    v864[187] = v486;
    v863[188] = @"ISP-DART_CLKOFF";
    v485 = [MEMORY[0x1E4F929D8] sharedInstance];
    v484 = objc_msgSend(v485, "commonTypeDict_RealFormat");
    v864[188] = v484;
    v863[189] = @"ISP-DART_RUNMAX";
    v483 = [MEMORY[0x1E4F929D8] sharedInstance];
    v482 = objc_msgSend(v483, "commonTypeDict_RealFormat");
    v864[189] = v482;
    v863[190] = @"ISP-SOC-VNOM_CLKOFF";
    v481 = [MEMORY[0x1E4F929D8] sharedInstance];
    v480 = objc_msgSend(v481, "commonTypeDict_RealFormat");
    v864[190] = v480;
    v863[191] = @"ISP-SOC-VNOM_RUNMAX";
    v479 = [MEMORY[0x1E4F929D8] sharedInstance];
    v478 = objc_msgSend(v479, "commonTypeDict_RealFormat");
    v864[191] = v478;
    v863[192] = @"ISP-SYS-V_CLKOFF";
    v477 = [MEMORY[0x1E4F929D8] sharedInstance];
    v476 = objc_msgSend(v477, "commonTypeDict_RealFormat");
    v864[192] = v476;
    v863[193] = @"ISP-SYS-V_RUNMAX";
    v475 = [MEMORY[0x1E4F929D8] sharedInstance];
    v474 = objc_msgSend(v475, "commonTypeDict_RealFormat");
    v864[193] = v474;
    v863[194] = @"ISPSENS0_CLKOFF";
    v473 = [MEMORY[0x1E4F929D8] sharedInstance];
    v472 = objc_msgSend(v473, "commonTypeDict_RealFormat");
    v864[194] = v472;
    v863[195] = @"ISPSENS1_CLKOFF";
    v471 = [MEMORY[0x1E4F929D8] sharedInstance];
    v470 = objc_msgSend(v471, "commonTypeDict_RealFormat");
    v864[195] = v470;
    v863[196] = @"ISPSENS2_CLKOFF";
    v469 = [MEMORY[0x1E4F929D8] sharedInstance];
    v468 = objc_msgSend(v469, "commonTypeDict_RealFormat");
    v864[196] = v468;
    v863[197] = @"ISPSENS2_RUNMAX";
    v467 = [MEMORY[0x1E4F929D8] sharedInstance];
    v466 = objc_msgSend(v467, "commonTypeDict_RealFormat");
    v864[197] = v466;
    v863[198] = @"ISPSENS3_CLKOFF";
    v465 = [MEMORY[0x1E4F929D8] sharedInstance];
    v464 = objc_msgSend(v465, "commonTypeDict_RealFormat");
    v864[198] = v464;
    v863[199] = @"ISPSENS3_RUNMAX";
    v463 = [MEMORY[0x1E4F929D8] sharedInstance];
    v462 = objc_msgSend(v463, "commonTypeDict_RealFormat");
    v864[199] = v462;
    v863[200] = @"ISP_SYS_CLKOFF";
    v461 = [MEMORY[0x1E4F929D8] sharedInstance];
    v460 = objc_msgSend(v461, "commonTypeDict_RealFormat");
    v864[200] = v460;
    v863[201] = @"JPG-SOC-VMAX_CLKOFF";
    v459 = [MEMORY[0x1E4F929D8] sharedInstance];
    v458 = objc_msgSend(v459, "commonTypeDict_RealFormat");
    v864[201] = v458;
    v863[202] = @"JPG-SOC-VMAX_RUNMAX";
    v457 = [MEMORY[0x1E4F929D8] sharedInstance];
    v456 = objc_msgSend(v457, "commonTypeDict_RealFormat");
    v864[202] = v456;
    v863[203] = @"JPG-SOC-VNOM_CLKOFF";
    v455 = [MEMORY[0x1E4F929D8] sharedInstance];
    v454 = objc_msgSend(v455, "commonTypeDict_RealFormat");
    v864[203] = v454;
    v863[204] = @"JPG-SOC-VNOM_RUNMAX";
    v453 = [MEMORY[0x1E4F929D8] sharedInstance];
    v452 = objc_msgSend(v453, "commonTypeDict_RealFormat");
    v864[204] = v452;
    v863[205] = @"JPG0-DART_CLKOFF";
    v451 = [MEMORY[0x1E4F929D8] sharedInstance];
    v450 = objc_msgSend(v451, "commonTypeDict_RealFormat");
    v864[205] = v450;
    v863[206] = @"JPG0-DART_RUNMAX";
    v449 = [MEMORY[0x1E4F929D8] sharedInstance];
    v448 = objc_msgSend(v449, "commonTypeDict_RealFormat");
    v864[206] = v448;
    v863[207] = @"JPG0-V_CLKOFF";
    v447 = [MEMORY[0x1E4F929D8] sharedInstance];
    v446 = objc_msgSend(v447, "commonTypeDict_RealFormat");
    v864[207] = v446;
    v863[208] = @"JPG0-V_RUNMAX";
    v445 = [MEMORY[0x1E4F929D8] sharedInstance];
    v444 = objc_msgSend(v445, "commonTypeDict_RealFormat");
    v864[208] = v444;
    v863[209] = @"JPG1-DART_CLKOFF";
    v443 = [MEMORY[0x1E4F929D8] sharedInstance];
    v442 = objc_msgSend(v443, "commonTypeDict_RealFormat");
    v864[209] = v442;
    v863[210] = @"JPG1-DART_RUNMAX";
    v441 = [MEMORY[0x1E4F929D8] sharedInstance];
    v440 = objc_msgSend(v441, "commonTypeDict_RealFormat");
    v864[210] = v440;
    v863[211] = @"JPG1-V_CLKOFF";
    v439 = [MEMORY[0x1E4F929D8] sharedInstance];
    v438 = objc_msgSend(v439, "commonTypeDict_RealFormat");
    v864[211] = v438;
    v863[212] = @"JPG1-V_RUNMAX";
    v437 = [MEMORY[0x1E4F929D8] sharedInstance];
    v436 = objc_msgSend(v437, "commonTypeDict_RealFormat");
    v864[212] = v436;
    v863[213] = @"JPG_CLKOFF";
    v435 = [MEMORY[0x1E4F929D8] sharedInstance];
    v434 = objc_msgSend(v435, "commonTypeDict_RealFormat");
    v864[213] = v434;
    v863[214] = @"MCA0_CLKOFF";
    v433 = [MEMORY[0x1E4F929D8] sharedInstance];
    v432 = objc_msgSend(v433, "commonTypeDict_RealFormat");
    v864[214] = v432;
    v863[215] = @"MCA1_CLKOFF";
    v431 = [MEMORY[0x1E4F929D8] sharedInstance];
    v430 = objc_msgSend(v431, "commonTypeDict_RealFormat");
    v864[215] = v430;
    v863[216] = @"MCA2_CLKOFF";
    v429 = [MEMORY[0x1E4F929D8] sharedInstance];
    v428 = objc_msgSend(v429, "commonTypeDict_RealFormat");
    v864[216] = v428;
    v863[217] = @"MCA3_CLKOFF";
    v427 = [MEMORY[0x1E4F929D8] sharedInstance];
    v426 = objc_msgSend(v427, "commonTypeDict_RealFormat");
    v864[217] = v426;
    v863[218] = @"MCA4_CLKOFF";
    v425 = [MEMORY[0x1E4F929D8] sharedInstance];
    v424 = objc_msgSend(v425, "commonTypeDict_RealFormat");
    v864[218] = v424;
    v863[219] = @"MCA5_CLKOFF";
    v423 = [MEMORY[0x1E4F929D8] sharedInstance];
    v422 = objc_msgSend(v423, "commonTypeDict_RealFormat");
    v864[219] = v422;
    v863[220] = @"MCA5_RUNMAX";
    v421 = [MEMORY[0x1E4F929D8] sharedInstance];
    v420 = objc_msgSend(v421, "commonTypeDict_RealFormat");
    v864[220] = v420;
    v863[221] = @"MCC_CLKOFF";
    v419 = [MEMORY[0x1E4F929D8] sharedInstance];
    v418 = objc_msgSend(v419, "commonTypeDict_RealFormat");
    v864[221] = v418;
    v863[222] = @"MIPI_DSI_CLKOFF";
    v417 = [MEMORY[0x1E4F929D8] sharedInstance];
    v416 = objc_msgSend(v417, "commonTypeDict_RealFormat");
    v864[222] = v416;
    v863[223] = @"MMX_CLKOFF";
    v415 = [MEMORY[0x1E4F929D8] sharedInstance];
    v414 = objc_msgSend(v415, "commonTypeDict_RealFormat");
    v864[223] = v414;
    v863[224] = @"MMX_RUNMAX";
    v413 = [MEMORY[0x1E4F929D8] sharedInstance];
    v412 = objc_msgSend(v413, "commonTypeDict_RealFormat");
    v864[224] = v412;
    v863[225] = @"MSR-DART_CLKOFF";
    v411 = [MEMORY[0x1E4F929D8] sharedInstance];
    v410 = objc_msgSend(v411, "commonTypeDict_RealFormat");
    v864[225] = v410;
    v863[226] = @"MSR-DART_RUNMAX";
    v409 = [MEMORY[0x1E4F929D8] sharedInstance];
    v408 = objc_msgSend(v409, "commonTypeDict_RealFormat");
    v864[226] = v408;
    v863[227] = @"MSR-V_CLKOFF";
    v407 = [MEMORY[0x1E4F929D8] sharedInstance];
    v406 = objc_msgSend(v407, "commonTypeDict_RealFormat");
    v864[227] = v406;
    v863[228] = @"MSR-V_RUNMAX";
    v405 = [MEMORY[0x1E4F929D8] sharedInstance];
    v404 = objc_msgSend(v405, "commonTypeDict_RealFormat");
    v864[228] = v404;
    v863[229] = @"MSR_ASE_CORE_CLKOFF";
    v403 = [MEMORY[0x1E4F929D8] sharedInstance];
    v402 = objc_msgSend(v403, "commonTypeDict_RealFormat");
    v864[229] = v402;
    v863[230] = @"MSR_ASE_CORE_RUNMAX";
    v401 = [MEMORY[0x1E4F929D8] sharedInstance];
    v400 = objc_msgSend(v401, "commonTypeDict_RealFormat");
    v864[230] = v400;
    v863[231] = @"MSR_CLKOFF";
    v399 = [MEMORY[0x1E4F929D8] sharedInstance];
    v398 = objc_msgSend(v399, "commonTypeDict_RealFormat");
    v864[231] = v398;
    v863[232] = @"NUB_AON_CLKOFF";
    v397 = [MEMORY[0x1E4F929D8] sharedInstance];
    v396 = objc_msgSend(v397, "commonTypeDict_RealFormat");
    v864[232] = v396;
    v863[233] = @"NUB_AON_RUNMAX";
    v395 = [MEMORY[0x1E4F929D8] sharedInstance];
    v394 = objc_msgSend(v395, "commonTypeDict_RealFormat");
    v864[233] = v394;
    v863[234] = @"NUB_FABRIC_CLKOFF";
    v393 = [MEMORY[0x1E4F929D8] sharedInstance];
    v392 = objc_msgSend(v393, "commonTypeDict_RealFormat");
    v864[234] = v392;
    v863[235] = @"NUB_FABRIC_RUNMAX";
    v391 = [MEMORY[0x1E4F929D8] sharedInstance];
    v390 = objc_msgSend(v391, "commonTypeDict_RealFormat");
    v864[235] = v390;
    v863[236] = @"NUB_GPIO_CLKOFF";
    v389 = [MEMORY[0x1E4F929D8] sharedInstance];
    v388 = objc_msgSend(v389, "commonTypeDict_RealFormat");
    v864[236] = v388;
    v863[237] = @"NUB_GPIO_RUNMAX";
    v387 = [MEMORY[0x1E4F929D8] sharedInstance];
    v386 = objc_msgSend(v387, "commonTypeDict_RealFormat");
    v864[237] = v386;
    v863[238] = @"NUB_SRAM_CLKOFF";
    v385 = [MEMORY[0x1E4F929D8] sharedInstance];
    v384 = objc_msgSend(v385, "commonTypeDict_RealFormat");
    v864[238] = v384;
    v863[239] = @"NUB_SRAM_RUNMAX";
    v383 = [MEMORY[0x1E4F929D8] sharedInstance];
    v382 = objc_msgSend(v383, "commonTypeDict_RealFormat");
    v864[239] = v382;
    v863[240] = @"PCIE_REF_CLKOFF";
    v381 = [MEMORY[0x1E4F929D8] sharedInstance];
    v380 = objc_msgSend(v381, "commonTypeDict_RealFormat");
    v864[240] = v380;
    v863[241] = @"PCIE_REF_RUNMAX";
    v379 = [MEMORY[0x1E4F929D8] sharedInstance];
    v378 = objc_msgSend(v379, "commonTypeDict_RealFormat");
    v864[241] = v378;
    v863[242] = @"PCPM_CLKOFF";
    v377 = [MEMORY[0x1E4F929D8] sharedInstance];
    v376 = objc_msgSend(v377, "commonTypeDict_RealFormat");
    v864[242] = v376;
    v863[243] = @"PCPM_RUNMAX";
    v375 = [MEMORY[0x1E4F929D8] sharedInstance];
    v374 = objc_msgSend(v375, "commonTypeDict_RealFormat");
    v864[243] = v374;
    v863[244] = @"PCPU0_CLKOFF";
    v373 = [MEMORY[0x1E4F929D8] sharedInstance];
    v372 = objc_msgSend(v373, "commonTypeDict_RealFormat");
    v864[244] = v372;
    v863[245] = @"PCPU0_RUNMAX";
    v371 = [MEMORY[0x1E4F929D8] sharedInstance];
    v370 = objc_msgSend(v371, "commonTypeDict_RealFormat");
    v864[245] = v370;
    v863[246] = @"PCPU1_CLKOFF";
    v369 = [MEMORY[0x1E4F929D8] sharedInstance];
    v368 = objc_msgSend(v369, "commonTypeDict_RealFormat");
    v864[246] = v368;
    v863[247] = @"PCPU1_RUNMAX";
    v367 = [MEMORY[0x1E4F929D8] sharedInstance];
    v366 = objc_msgSend(v367, "commonTypeDict_RealFormat");
    v864[247] = v366;
    v863[248] = @"PCPU_CLKOFF";
    v365 = [MEMORY[0x1E4F929D8] sharedInstance];
    v364 = objc_msgSend(v365, "commonTypeDict_RealFormat");
    v864[248] = v364;
    v863[249] = @"PCPU_RUNMAX";
    v363 = [MEMORY[0x1E4F929D8] sharedInstance];
    v362 = objc_msgSend(v363, "commonTypeDict_RealFormat");
    v864[249] = v362;
    v863[250] = @"PMGR-DCS-VMAX_CLKOFF";
    v361 = [MEMORY[0x1E4F929D8] sharedInstance];
    v360 = objc_msgSend(v361, "commonTypeDict_RealFormat");
    v864[250] = v360;
    v863[251] = @"PMGR-DCS-VMAX_RUNMAX";
    v359 = [MEMORY[0x1E4F929D8] sharedInstance];
    v358 = objc_msgSend(v359, "commonTypeDict_RealFormat");
    v864[251] = v358;
    v863[252] = @"PMGR-DCS-VNOM_CLKOFF";
    v357 = [MEMORY[0x1E4F929D8] sharedInstance];
    v356 = objc_msgSend(v357, "commonTypeDict_RealFormat");
    v864[252] = v356;
    v863[253] = @"PMGR-DCS-VNOM_RUNMAX";
    v355 = [MEMORY[0x1E4F929D8] sharedInstance];
    v354 = objc_msgSend(v355, "commonTypeDict_RealFormat");
    v864[253] = v354;
    v863[254] = @"PMGR-SOC-VMAX_CLKOFF";
    v353 = [MEMORY[0x1E4F929D8] sharedInstance];
    v352 = objc_msgSend(v353, "commonTypeDict_RealFormat");
    v864[254] = v352;
    v863[255] = @"PMGR-SOC-VMAX_RUNMAX";
    v351 = [MEMORY[0x1E4F929D8] sharedInstance];
    v350 = objc_msgSend(v351, "commonTypeDict_RealFormat");
    v864[255] = v350;
    v863[256] = @"PMGR-SOC-VNOM_CLKOFF";
    v349 = [MEMORY[0x1E4F929D8] sharedInstance];
    v348 = objc_msgSend(v349, "commonTypeDict_RealFormat");
    v864[256] = v348;
    v863[257] = @"PMGR-SOC-VNOM_RUNMAX";
    v347 = [MEMORY[0x1E4F929D8] sharedInstance];
    v346 = objc_msgSend(v347, "commonTypeDict_RealFormat");
    v864[257] = v346;
    v863[258] = @"PMP_CLKOFF";
    v345 = [MEMORY[0x1E4F929D8] sharedInstance];
    v344 = objc_msgSend(v345, "commonTypeDict_RealFormat");
    v864[258] = v344;
    v863[259] = @"PMP_RUNMAX";
    v343 = [MEMORY[0x1E4F929D8] sharedInstance];
    v342 = objc_msgSend(v343, "commonTypeDict_RealFormat");
    v864[259] = v342;
    v863[260] = @"PMS_CLKOFF";
    v341 = [MEMORY[0x1E4F929D8] sharedInstance];
    v340 = objc_msgSend(v341, "commonTypeDict_RealFormat");
    v864[260] = v340;
    v863[261] = @"PMS_RUNMAX";
    v339 = [MEMORY[0x1E4F929D8] sharedInstance];
    v338 = objc_msgSend(v339, "commonTypeDict_RealFormat");
    v864[261] = v338;
    v863[262] = @"PMS_SRAM_CLKOFF";
    v337 = [MEMORY[0x1E4F929D8] sharedInstance];
    v336 = objc_msgSend(v337, "commonTypeDict_RealFormat");
    v864[262] = v336;
    v863[263] = @"PMS_SRAM_RUNMAX";
    v335 = [MEMORY[0x1E4F929D8] sharedInstance];
    v334 = objc_msgSend(v335, "commonTypeDict_RealFormat");
    v864[263] = v334;
    v863[264] = @"PWM0_CLKOFF";
    v333 = [MEMORY[0x1E4F929D8] sharedInstance];
    v332 = objc_msgSend(v333, "commonTypeDict_RealFormat");
    v864[264] = v332;
    v863[265] = @"RMX_CLKOFF";
    v331 = [MEMORY[0x1E4F929D8] sharedInstance];
    v330 = objc_msgSend(v331, "commonTypeDict_RealFormat");
    v864[265] = v330;
    v863[266] = @"RMX_RUNMAX";
    v329 = [MEMORY[0x1E4F929D8] sharedInstance];
    v328 = objc_msgSend(v329, "commonTypeDict_RealFormat");
    v864[266] = v328;
    v863[267] = @"SBR_CLKOFF";
    v327 = [MEMORY[0x1E4F929D8] sharedInstance];
    v326 = objc_msgSend(v327, "commonTypeDict_RealFormat");
    v864[267] = v326;
    v863[268] = @"SBR_RUNMAX";
    v325 = [MEMORY[0x1E4F929D8] sharedInstance];
    v324 = objc_msgSend(v325, "commonTypeDict_RealFormat");
    v864[268] = v324;
    v863[269] = @"SEP-PEARL-V_CLKOFF";
    v323 = [MEMORY[0x1E4F929D8] sharedInstance];
    v322 = objc_msgSend(v323, "commonTypeDict_RealFormat");
    v864[269] = v322;
    v863[270] = @"SEP-PEARL-V_RUNMAX";
    v321 = [MEMORY[0x1E4F929D8] sharedInstance];
    v320 = objc_msgSend(v321, "commonTypeDict_RealFormat");
    v864[270] = v320;
    v863[271] = @"SEP_CLKOFF";
    v319 = [MEMORY[0x1E4F929D8] sharedInstance];
    v318 = objc_msgSend(v319, "commonTypeDict_RealFormat");
    v864[271] = v318;
    v863[272] = @"SIO-CPU-V_CLKOFF";
    v317 = [MEMORY[0x1E4F929D8] sharedInstance];
    v316 = objc_msgSend(v317, "commonTypeDict_RealFormat");
    v864[272] = v316;
    v863[273] = @"SIO-CPU-V_RUNMAX";
    v315 = [MEMORY[0x1E4F929D8] sharedInstance];
    v314 = objc_msgSend(v315, "commonTypeDict_RealFormat");
    v864[273] = v314;
    v863[274] = @"SIO-DART_CLKOFF";
    v313 = [MEMORY[0x1E4F929D8] sharedInstance];
    v312 = objc_msgSend(v313, "commonTypeDict_RealFormat");
    v864[274] = v312;
    v863[275] = @"SIO-DART_RUNMAX";
    v311 = [MEMORY[0x1E4F929D8] sharedInstance];
    v310 = objc_msgSend(v311, "commonTypeDict_RealFormat");
    v864[275] = v310;
    v863[276] = @"SIO_BUSIF_CLKOFF";
    v309 = [MEMORY[0x1E4F929D8] sharedInstance];
    v308 = objc_msgSend(v309, "commonTypeDict_RealFormat");
    v864[276] = v308;
    v863[277] = @"SIO_BUSIF_RUNMAX";
    v307 = [MEMORY[0x1E4F929D8] sharedInstance];
    v306 = objc_msgSend(v307, "commonTypeDict_RealFormat");
    v864[277] = v306;
    v863[278] = @"SIO_CLKOFF";
    v305 = [MEMORY[0x1E4F929D8] sharedInstance];
    v304 = objc_msgSend(v305, "commonTypeDict_RealFormat");
    v864[278] = v304;
    v863[279] = @"SIO_CPU_CLKOFF";
    v303 = [MEMORY[0x1E4F929D8] sharedInstance];
    v302 = objc_msgSend(v303, "commonTypeDict_RealFormat");
    v864[279] = v302;
    v863[280] = @"SIO_CPU_RUNMAX";
    v301 = [MEMORY[0x1E4F929D8] sharedInstance];
    v300 = objc_msgSend(v301, "commonTypeDict_RealFormat");
    v864[280] = v300;
    v863[281] = @"SIO_LEAP_CLKOFF";
    v299 = [MEMORY[0x1E4F929D8] sharedInstance];
    v298 = objc_msgSend(v299, "commonTypeDict_RealFormat");
    v864[281] = v298;
    v863[282] = @"SIO_LEAP_RUNMAX";
    v297 = [MEMORY[0x1E4F929D8] sharedInstance];
    v296 = objc_msgSend(v297, "commonTypeDict_RealFormat");
    v864[282] = v296;
    v863[283] = @"SMC-I2CM1_CLKOFF";
    v295 = [MEMORY[0x1E4F929D8] sharedInstance];
    v294 = objc_msgSend(v295, "commonTypeDict_RealFormat");
    v864[283] = v294;
    v863[284] = @"SMC-I2CM1_RUNMAX";
    v293 = [MEMORY[0x1E4F929D8] sharedInstance];
    v292 = objc_msgSend(v293, "commonTypeDict_RealFormat");
    v864[284] = v292;
    v863[285] = @"SMX_CLKOFF";
    v291 = [MEMORY[0x1E4F929D8] sharedInstance];
    v290 = objc_msgSend(v291, "commonTypeDict_RealFormat");
    v864[285] = v290;
    v863[286] = @"SPI0_CLKOFF";
    v289 = [MEMORY[0x1E4F929D8] sharedInstance];
    v288 = objc_msgSend(v289, "commonTypeDict_RealFormat");
    v864[286] = v288;
    v863[287] = @"SPI1_CLKOFF";
    v287 = [MEMORY[0x1E4F929D8] sharedInstance];
    v286 = objc_msgSend(v287, "commonTypeDict_RealFormat");
    v864[287] = v286;
    v863[288] = @"SPI2_CLKOFF";
    v285 = [MEMORY[0x1E4F929D8] sharedInstance];
    v284 = objc_msgSend(v285, "commonTypeDict_RealFormat");
    v864[288] = v284;
    v863[289] = @"SPI3_CLKOFF";
    v283 = [MEMORY[0x1E4F929D8] sharedInstance];
    v282 = objc_msgSend(v283, "commonTypeDict_RealFormat");
    v864[289] = v282;
    v863[290] = @"SPI_P_CLKOFF";
    v281 = [MEMORY[0x1E4F929D8] sharedInstance];
    v280 = objc_msgSend(v281, "commonTypeDict_RealFormat");
    v864[290] = v280;
    v863[291] = @"SPI_P_RUNMAX";
    v279 = [MEMORY[0x1E4F929D8] sharedInstance];
    v278 = objc_msgSend(v279, "commonTypeDict_RealFormat");
    v864[291] = v278;
    v863[292] = @"SPMI_CLKOFF";
    v277 = [MEMORY[0x1E4F929D8] sharedInstance];
    v276 = objc_msgSend(v277, "commonTypeDict_RealFormat");
    v864[292] = v276;
    v863[293] = @"SPMI_RUNMAX";
    v275 = [MEMORY[0x1E4F929D8] sharedInstance];
    v274 = objc_msgSend(v275, "commonTypeDict_RealFormat");
    v864[293] = v274;
    v863[294] = @"SPMI_SOC0_CLKOFF";
    v273 = [MEMORY[0x1E4F929D8] sharedInstance];
    v272 = objc_msgSend(v273, "commonTypeDict_RealFormat");
    v864[294] = v272;
    v863[295] = @"SPMI_SOC0_RUNMAX";
    v271 = [MEMORY[0x1E4F929D8] sharedInstance];
    v270 = objc_msgSend(v271, "commonTypeDict_RealFormat");
    v864[295] = v270;
    v863[296] = @"SPMI_SOC1_CLKOFF";
    v269 = [MEMORY[0x1E4F929D8] sharedInstance];
    v268 = objc_msgSend(v269, "commonTypeDict_RealFormat");
    v864[296] = v268;
    v863[297] = @"SPMI_SOC1_RUNMAX";
    v267 = [MEMORY[0x1E4F929D8] sharedInstance];
    v266 = objc_msgSend(v267, "commonTypeDict_RealFormat");
    v864[297] = v266;
    v863[298] = @"SPMI_SOC2_CLKOFF";
    v265 = [MEMORY[0x1E4F929D8] sharedInstance];
    v264 = objc_msgSend(v265, "commonTypeDict_RealFormat");
    v864[298] = v264;
    v863[299] = @"SPMI_SOC2_RUNMAX";
    v263 = [MEMORY[0x1E4F929D8] sharedInstance];
    v262 = objc_msgSend(v263, "commonTypeDict_RealFormat");
    v864[299] = v262;
    v863[300] = @"UART0_CLKOFF";
    v261 = [MEMORY[0x1E4F929D8] sharedInstance];
    v260 = objc_msgSend(v261, "commonTypeDict_RealFormat");
    v864[300] = v260;
    v863[301] = @"UART1_CLKOFF";
    v259 = [MEMORY[0x1E4F929D8] sharedInstance];
    v258 = objc_msgSend(v259, "commonTypeDict_RealFormat");
    v864[301] = v258;
    v863[302] = @"UART2_CLKOFF";
    v257 = [MEMORY[0x1E4F929D8] sharedInstance];
    v256 = objc_msgSend(v257, "commonTypeDict_RealFormat");
    v864[302] = v256;
    v863[303] = @"UART3_CLKOFF";
    v255 = [MEMORY[0x1E4F929D8] sharedInstance];
    v254 = objc_msgSend(v255, "commonTypeDict_RealFormat");
    v864[303] = v254;
    v863[304] = @"UART4_CLKOFF";
    v253 = [MEMORY[0x1E4F929D8] sharedInstance];
    v252 = objc_msgSend(v253, "commonTypeDict_RealFormat");
    v864[304] = v252;
    v863[305] = @"UART5_CLKOFF";
    v251 = [MEMORY[0x1E4F929D8] sharedInstance];
    v250 = objc_msgSend(v251, "commonTypeDict_RealFormat");
    v864[305] = v250;
    v863[306] = @"UART6_CLKOFF";
    v249 = [MEMORY[0x1E4F929D8] sharedInstance];
    v248 = objc_msgSend(v249, "commonTypeDict_RealFormat");
    v864[306] = v248;
    v863[307] = @"UART7_CLKOFF";
    v247 = [MEMORY[0x1E4F929D8] sharedInstance];
    v246 = objc_msgSend(v247, "commonTypeDict_RealFormat");
    v864[307] = v246;
    v863[308] = @"UART7_RUNMAX";
    v245 = [MEMORY[0x1E4F929D8] sharedInstance];
    v244 = objc_msgSend(v245, "commonTypeDict_RealFormat");
    v864[308] = v244;
    v863[309] = @"UART8_CLKOFF";
    v243 = [MEMORY[0x1E4F929D8] sharedInstance];
    v242 = objc_msgSend(v243, "commonTypeDict_RealFormat");
    v864[309] = v242;
    v863[310] = @"UART8_RUNMAX";
    v241 = [MEMORY[0x1E4F929D8] sharedInstance];
    v240 = objc_msgSend(v241, "commonTypeDict_RealFormat");
    v864[310] = v240;
    v863[311] = @"UART_N_CLKOFF";
    v239 = [MEMORY[0x1E4F929D8] sharedInstance];
    v238 = objc_msgSend(v239, "commonTypeDict_RealFormat");
    v864[311] = v238;
    v863[312] = @"UART_N_RUNMAX";
    v237 = [MEMORY[0x1E4F929D8] sharedInstance];
    v236 = objc_msgSend(v237, "commonTypeDict_RealFormat");
    v864[312] = v236;
    v863[313] = @"UART_P_CLKOFF";
    v235 = [MEMORY[0x1E4F929D8] sharedInstance];
    v234 = objc_msgSend(v235, "commonTypeDict_RealFormat");
    v864[313] = v234;
    v863[314] = @"UART_P_RUNMAX";
    v233 = [MEMORY[0x1E4F929D8] sharedInstance];
    v232 = objc_msgSend(v233, "commonTypeDict_RealFormat");
    v864[314] = v232;
    v863[315] = @"USB-AUDIO-V_CLKOFF";
    v231 = [MEMORY[0x1E4F929D8] sharedInstance];
    v230 = objc_msgSend(v231, "commonTypeDict_RealFormat");
    v864[315] = v230;
    v863[316] = @"USB-AUDIO-V_RUNMAX";
    v229 = [MEMORY[0x1E4F929D8] sharedInstance];
    v228 = objc_msgSend(v229, "commonTypeDict_RealFormat");
    v864[316] = v228;
    v863[317] = @"USB-DART_CLKOFF";
    v227 = [MEMORY[0x1E4F929D8] sharedInstance];
    v226 = objc_msgSend(v227, "commonTypeDict_RealFormat");
    v864[317] = v226;
    v863[318] = @"USB-DART_RUNMAX";
    v225 = [MEMORY[0x1E4F929D8] sharedInstance];
    v224 = objc_msgSend(v225, "commonTypeDict_RealFormat");
    v864[318] = v224;
    v863[319] = @"USB2DEV_CLKOFF";
    v223 = [MEMORY[0x1E4F929D8] sharedInstance];
    v222 = objc_msgSend(v223, "commonTypeDict_RealFormat");
    v864[319] = v222;
    v863[320] = @"USB2DEV_RUNMAX";
    v221 = [MEMORY[0x1E4F929D8] sharedInstance];
    v220 = objc_msgSend(v221, "commonTypeDict_RealFormat");
    v864[320] = v220;
    v863[321] = @"USB2HOST0_CLKOFF";
    v219 = [MEMORY[0x1E4F929D8] sharedInstance];
    v218 = objc_msgSend(v219, "commonTypeDict_RealFormat");
    v864[321] = v218;
    v863[322] = @"USBCTLREG_CLKOFF";
    v217 = [MEMORY[0x1E4F929D8] sharedInstance];
    v216 = objc_msgSend(v217, "commonTypeDict_RealFormat");
    v864[322] = v216;
    v863[323] = @"USBCTLREG_RUNMAX";
    v215 = [MEMORY[0x1E4F929D8] sharedInstance];
    v214 = objc_msgSend(v215, "commonTypeDict_RealFormat");
    v864[323] = v214;
    v863[324] = @"USB_CLKOFF";
    v213 = [MEMORY[0x1E4F929D8] sharedInstance];
    v212 = objc_msgSend(v213, "commonTypeDict_RealFormat");
    v864[324] = v212;
    v863[325] = @"VDEC-SOC-VNOM_CLKOFF";
    v211 = [MEMORY[0x1E4F929D8] sharedInstance];
    v210 = objc_msgSend(v211, "commonTypeDict_RealFormat");
    v864[325] = v210;
    v863[326] = @"VDEC-SOC-VNOM_RUNMAX";
    v209 = [MEMORY[0x1E4F929D8] sharedInstance];
    v208 = objc_msgSend(v209, "commonTypeDict_RealFormat");
    v864[326] = v208;
    v863[327] = @"VENC-DART_CLKOFF";
    v207 = [MEMORY[0x1E4F929D8] sharedInstance];
    v206 = objc_msgSend(v207, "commonTypeDict_RealFormat");
    v864[327] = v206;
    v863[328] = @"VENC-DART_RUNMAX";
    v205 = [MEMORY[0x1E4F929D8] sharedInstance];
    v204 = objc_msgSend(v205, "commonTypeDict_RealFormat");
    v864[328] = v204;
    v863[329] = @"VENC-DUMMY_CLKOFF";
    v203 = [MEMORY[0x1E4F929D8] sharedInstance];
    v202 = objc_msgSend(v203, "commonTypeDict_RealFormat");
    v864[329] = v202;
    v863[330] = @"VENC-DUMMY_RUNMAX";
    v201 = [MEMORY[0x1E4F929D8] sharedInstance];
    v200 = objc_msgSend(v201, "commonTypeDict_RealFormat");
    v864[330] = v200;
    v863[331] = @"VENC-SOC-VMAX_CLKOFF";
    v199 = [MEMORY[0x1E4F929D8] sharedInstance];
    v198 = objc_msgSend(v199, "commonTypeDict_RealFormat");
    v864[331] = v198;
    v863[332] = @"VENC-SOC-VMAX_RUNMAX";
    v197 = [MEMORY[0x1E4F929D8] sharedInstance];
    v196 = objc_msgSend(v197, "commonTypeDict_RealFormat");
    v864[332] = v196;
    v863[333] = @"VENC-SOC-VNOM_CLKOFF";
    v195 = [MEMORY[0x1E4F929D8] sharedInstance];
    v194 = objc_msgSend(v195, "commonTypeDict_RealFormat");
    v864[333] = v194;
    v863[334] = @"VENC-SOC-VNOM_RUNMAX";
    v193 = [MEMORY[0x1E4F929D8] sharedInstance];
    v192 = objc_msgSend(v193, "commonTypeDict_RealFormat");
    v864[334] = v192;
    v863[335] = @"VENC_DMA_CLKOFF";
    v191 = [MEMORY[0x1E4F929D8] sharedInstance];
    v190 = objc_msgSend(v191, "commonTypeDict_RealFormat");
    v864[335] = v190;
    v863[336] = @"VENC_DMA_RUNMAX";
    v189 = [MEMORY[0x1E4F929D8] sharedInstance];
    v188 = objc_msgSend(v189, "commonTypeDict_RealFormat");
    v864[336] = v188;
    v863[337] = @"VENC_ME0_CLKOFF";
    v187 = [MEMORY[0x1E4F929D8] sharedInstance];
    v186 = objc_msgSend(v187, "commonTypeDict_RealFormat");
    v864[337] = v186;
    v863[338] = @"VENC_ME0_RUNMAX";
    v185 = [MEMORY[0x1E4F929D8] sharedInstance];
    v184 = objc_msgSend(v185, "commonTypeDict_RealFormat");
    v864[338] = v184;
    v863[339] = @"VENC_ME1_CLKOFF";
    v183 = [MEMORY[0x1E4F929D8] sharedInstance];
    v182 = objc_msgSend(v183, "commonTypeDict_RealFormat");
    v864[339] = v182;
    v863[340] = @"VENC_ME1_RUNMAX";
    v181 = [MEMORY[0x1E4F929D8] sharedInstance];
    v180 = objc_msgSend(v181, "commonTypeDict_RealFormat");
    v864[340] = v180;
    v863[341] = @"VENC_PIPE4_CLKOFF";
    v179 = [MEMORY[0x1E4F929D8] sharedInstance];
    v178 = objc_msgSend(v179, "commonTypeDict_RealFormat");
    v864[341] = v178;
    v863[342] = @"VENC_PIPE4_RUNMAX";
    v177 = [MEMORY[0x1E4F929D8] sharedInstance];
    v176 = objc_msgSend(v177, "commonTypeDict_RealFormat");
    v864[342] = v176;
    v863[343] = @"VENC_PIPE5_CLKOFF";
    v175 = [MEMORY[0x1E4F929D8] sharedInstance];
    v174 = objc_msgSend(v175, "commonTypeDict_RealFormat");
    v864[343] = v174;
    v863[344] = @"VENC_PIPE5_RUNMAX";
    v173 = [MEMORY[0x1E4F929D8] sharedInstance];
    v172 = objc_msgSend(v173, "commonTypeDict_RealFormat");
    v864[344] = v172;
    v863[345] = @"VENC_SYS_CLKOFF";
    v171 = [MEMORY[0x1E4F929D8] sharedInstance];
    v170 = objc_msgSend(v171, "commonTypeDict_RealFormat");
    v864[345] = v170;
    v863[346] = @"ANS2-V_CLKOFF";
    v169 = [MEMORY[0x1E4F929D8] sharedInstance];
    v168 = objc_msgSend(v169, "commonTypeDict_RealFormat");
    v864[346] = v168;
    v863[347] = @"ANS2-V_RUNMAX";
    v167 = [MEMORY[0x1E4F929D8] sharedInstance];
    v166 = objc_msgSend(v167, "commonTypeDict_RealFormat");
    v864[347] = v166;
    v863[348] = @"AOP_I2CM0_CLKOFF";
    v165 = [MEMORY[0x1E4F929D8] sharedInstance];
    v164 = objc_msgSend(v165, "commonTypeDict_RealFormat");
    v864[348] = v164;
    v863[349] = @"AOP_I2CM0_RUNMAX";
    v163 = [MEMORY[0x1E4F929D8] sharedInstance];
    v162 = objc_msgSend(v163, "commonTypeDict_RealFormat");
    v864[349] = v162;
    v863[350] = @"AOP_I2CM1_CLKOFF";
    v161 = [MEMORY[0x1E4F929D8] sharedInstance];
    v160 = objc_msgSend(v161, "commonTypeDict_RealFormat");
    v864[350] = v160;
    v863[351] = @"AOP_I2CM1_RUNMAX";
    v159 = [MEMORY[0x1E4F929D8] sharedInstance];
    v158 = objc_msgSend(v159, "commonTypeDict_RealFormat");
    v864[351] = v158;
    v863[352] = @"C0-USB-DART_CLKOFF";
    v157 = [MEMORY[0x1E4F929D8] sharedInstance];
    v156 = objc_msgSend(v157, "commonTypeDict_RealFormat");
    v864[352] = v156;
    v863[353] = @"C0-USB-DART_RUNMAX";
    v155 = [MEMORY[0x1E4F929D8] sharedInstance];
    v154 = objc_msgSend(v155, "commonTypeDict_RealFormat");
    v864[353] = v154;
    v863[354] = @"C0-USBCTL-V_CLKOFF";
    v153 = [MEMORY[0x1E4F929D8] sharedInstance];
    v152 = objc_msgSend(v153, "commonTypeDict_RealFormat");
    v864[354] = v152;
    v863[355] = @"C0-USBCTL-V_RUNMAX";
    v151 = [MEMORY[0x1E4F929D8] sharedInstance];
    v150 = objc_msgSend(v151, "commonTypeDict_RealFormat");
    v864[355] = v150;
    v863[356] = @"C0_USB2DEV_CLKOFF";
    v149 = [MEMORY[0x1E4F929D8] sharedInstance];
    v148 = objc_msgSend(v149, "commonTypeDict_RealFormat");
    v864[356] = v148;
    v863[357] = @"C0_USB2DEV_RUNMAX";
    v147 = [MEMORY[0x1E4F929D8] sharedInstance];
    v146 = objc_msgSend(v147, "commonTypeDict_RealFormat");
    v864[357] = v146;
    v863[358] = @"C0_USB2HOST_CLKOFF";
    v145 = [MEMORY[0x1E4F929D8] sharedInstance];
    v144 = objc_msgSend(v145, "commonTypeDict_RealFormat");
    v864[358] = v144;
    v863[359] = @"C0_USB2HOST_RUNMAX";
    v143 = [MEMORY[0x1E4F929D8] sharedInstance];
    v142 = objc_msgSend(v143, "commonTypeDict_RealFormat");
    v864[359] = v142;
    v863[360] = @"C0_USB31DRD_CLKOFF";
    v141 = [MEMORY[0x1E4F929D8] sharedInstance];
    v140 = objc_msgSend(v141, "commonTypeDict_RealFormat");
    v864[360] = v140;
    v863[361] = @"C0_USB31DRD_RUNMAX";
    v139 = [MEMORY[0x1E4F929D8] sharedInstance];
    v138 = objc_msgSend(v139, "commonTypeDict_RealFormat");
    v864[361] = v138;
    v863[362] = @"C0_USBCTL_CLKOFF";
    v137 = [MEMORY[0x1E4F929D8] sharedInstance];
    v136 = objc_msgSend(v137, "commonTypeDict_RealFormat");
    v864[362] = v136;
    v863[363] = @"C0_USBCTL_RUNMAX";
    v135 = [MEMORY[0x1E4F929D8] sharedInstance];
    v134 = objc_msgSend(v135, "commonTypeDict_RealFormat");
    v864[363] = v134;
    v863[364] = @"C1-USB-DART_CLKOFF";
    v133 = [MEMORY[0x1E4F929D8] sharedInstance];
    v132 = objc_msgSend(v133, "commonTypeDict_RealFormat");
    v864[364] = v132;
    v863[365] = @"C1-USB-DART_RUNMAX";
    v131 = [MEMORY[0x1E4F929D8] sharedInstance];
    v130 = objc_msgSend(v131, "commonTypeDict_RealFormat");
    v864[365] = v130;
    v863[366] = @"C1-USBCTL-V_CLKOFF";
    v129 = [MEMORY[0x1E4F929D8] sharedInstance];
    v128 = objc_msgSend(v129, "commonTypeDict_RealFormat");
    v864[366] = v128;
    v863[367] = @"C1-USBCTL-V_RUNMAX";
    uint64_t v127 = [MEMORY[0x1E4F929D8] sharedInstance];
    v126 = objc_msgSend(v127, "commonTypeDict_RealFormat");
    v864[367] = v126;
    v863[368] = @"C1_USB2DEV_CLKOFF";
    v125 = [MEMORY[0x1E4F929D8] sharedInstance];
    v124 = objc_msgSend(v125, "commonTypeDict_RealFormat");
    v864[368] = v124;
    v863[369] = @"C1_USB2DEV_RUNMAX";
    v123 = [MEMORY[0x1E4F929D8] sharedInstance];
    v122 = objc_msgSend(v123, "commonTypeDict_RealFormat");
    v864[369] = v122;
    v863[370] = @"C1_USB2HOST_CLKOFF";
    long long v121 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v120 = objc_msgSend(v121, "commonTypeDict_RealFormat");
    v864[370] = v120;
    v863[371] = @"C1_USB2HOST_RUNMAX";
    long long v119 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v118 = objc_msgSend(v119, "commonTypeDict_RealFormat");
    v864[371] = v118;
    v863[372] = @"C1_USB31DRD_CLKOFF";
    v117 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v116 = objc_msgSend(v117, "commonTypeDict_RealFormat");
    v864[372] = v116;
    v863[373] = @"C1_USB31DRD_RUNMAX";
    long long v115 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v114 = objc_msgSend(v115, "commonTypeDict_RealFormat");
    v864[373] = v114;
    v863[374] = @"C1_USBCTL_CLKOFF";
    long long v113 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v112 = objc_msgSend(v113, "commonTypeDict_RealFormat");
    v864[374] = v112;
    v863[375] = @"C1_USBCTL_RUNMAX";
    long long v111 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v110 = objc_msgSend(v111, "commonTypeDict_RealFormat");
    v864[375] = v110;
    v863[376] = @"DCS4_CLKOFF";
    long long v109 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v108 = objc_msgSend(v109, "commonTypeDict_RealFormat");
    v864[376] = v108;
    v863[377] = @"DCS4_RUNMAX";
    v107 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v106 = objc_msgSend(v107, "commonTypeDict_RealFormat");
    v864[377] = v106;
    v863[378] = @"DCS5_CLKOFF";
    v105 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v104 = objc_msgSend(v105, "commonTypeDict_RealFormat");
    v864[378] = v104;
    v863[379] = @"DCS5_RUNMAX";
    uint64_t v103 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v102 = objc_msgSend(v103, "commonTypeDict_RealFormat");
    v864[379] = v102;
    v863[380] = @"DCS6_CLKOFF";
    v101 = [MEMORY[0x1E4F929D8] sharedInstance];
    v100 = objc_msgSend(v101, "commonTypeDict_RealFormat");
    v864[380] = v100;
    v863[381] = @"DCS6_RUNMAX";
    v99 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v98 = objc_msgSend(v99, "commonTypeDict_RealFormat");
    v864[381] = v98;
    v863[382] = @"DCS7_CLKOFF";
    id v97 = [MEMORY[0x1E4F929D8] sharedInstance];
    v96 = objc_msgSend(v97, "commonTypeDict_RealFormat");
    v864[382] = v96;
    v863[383] = @"DCS7_RUNMAX";
    id v95 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v94 = objc_msgSend(v95, "commonTypeDict_RealFormat");
    v864[383] = v94;
    v863[384] = @"DISPEXT-DART_CLKOFF";
    v93 = [MEMORY[0x1E4F929D8] sharedInstance];
    v92 = objc_msgSend(v93, "commonTypeDict_RealFormat");
    v864[384] = v92;
    v863[385] = @"DISPEXT-DART_RUNMAX";
    uint64_t v91 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v90 = objc_msgSend(v91, "commonTypeDict_RealFormat");
    v864[385] = v90;
    v863[386] = @"DISPEXT-V_CLKOFF";
    v89 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v88 = objc_msgSend(v89, "commonTypeDict_RealFormat");
    v864[386] = v88;
    v863[387] = @"DISPEXT-V_RUNMAX";
    v87 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v86 = objc_msgSend(v87, "commonTypeDict_RealFormat");
    v864[387] = v86;
    v863[388] = @"DISPEXT_BE_CLKOFF";
    v85 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v84 = objc_msgSend(v85, "commonTypeDict_RealFormat");
    v864[388] = v84;
    v863[389] = @"DISPEXT_BE_RUNMAX";
    int v83 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v82 = objc_msgSend(v83, "commonTypeDict_RealFormat");
    v864[389] = v82;
    v863[390] = @"DISPEXT_DSC_CLKOFF";
    char v81 = [MEMORY[0x1E4F929D8] sharedInstance];
    v80 = objc_msgSend(v81, "commonTypeDict_RealFormat");
    v864[390] = v80;
    v863[391] = @"DISPEXT_DSC_RUNMAX";
    uint64_t v79 = [MEMORY[0x1E4F929D8] sharedInstance];
    v78 = objc_msgSend(v79, "commonTypeDict_RealFormat");
    v864[391] = v78;
    v863[392] = @"DISPEXT_FE_CLKOFF";
    uint64_t v77 = [MEMORY[0x1E4F929D8] sharedInstance];
    v76 = objc_msgSend(v77, "commonTypeDict_RealFormat");
    v864[392] = v76;
    v863[393] = @"DISPEXT_FE_RUNMAX";
    uint64_t v75 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v74 = objc_msgSend(v75, "commonTypeDict_RealFormat");
    v864[393] = v74;
    v863[394] = @"DISPEXT_GP0_CLKOFF";
    uint64_t v73 = [MEMORY[0x1E4F929D8] sharedInstance];
    v72 = objc_msgSend(v73, "commonTypeDict_RealFormat");
    v864[394] = v72;
    v863[395] = @"DISPEXT_GP0_RUNMAX";
    uint64_t v71 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v70 = objc_msgSend(v71, "commonTypeDict_RealFormat");
    v864[395] = v70;
    v863[396] = @"DISPEXT_GP1_CLKOFF";
    uint64_t v69 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v68 = objc_msgSend(v69, "commonTypeDict_RealFormat");
    v864[396] = v68;
    v863[397] = @"DISPEXT_GP1_RUNMAX";
    uint64_t v67 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v66 = objc_msgSend(v67, "commonTypeDict_RealFormat");
    v864[397] = v66;
    v863[398] = @"DISPEXT_PPP_CLKOFF";
    uint64_t v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v64 = objc_msgSend(v65, "commonTypeDict_RealFormat");
    v864[398] = v64;
    v863[399] = @"DISPEXT_PPP_RUNMAX";
    id v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v62 = objc_msgSend(v63, "commonTypeDict_RealFormat");
    v864[399] = v62;
    v863[400] = @"DPA0_CLKOFF";
    double v61 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v60 = objc_msgSend(v61, "commonTypeDict_RealFormat");
    v864[400] = v60;
    v863[401] = @"DPA0_RUNMAX";
    uint64_t v59 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v58 = objc_msgSend(v59, "commonTypeDict_RealFormat");
    v864[401] = v58;
    v863[402] = @"DPA1_CLKOFF";
    v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat");
    v864[402] = v56;
    v863[403] = @"DPA1_RUNMAX";
    v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v54 = objc_msgSend(v55, "commonTypeDict_RealFormat");
    v864[403] = v54;
    v863[404] = @"DP_EXT_CLKOFF";
    uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v52 = objc_msgSend(v53, "commonTypeDict_RealFormat");
    v864[404] = v52;
    v863[405] = @"DP_EXT_RUNMAX";
    double v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v50 = objc_msgSend(v51, "commonTypeDict_RealFormat");
    v864[405] = v50;
    v863[406] = @"I2C4_CLKOFF";
    v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v49, "commonTypeDict_RealFormat");
    v864[406] = v48;
    v863[407] = @"I2C4_RUNMAX";
    double v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_RealFormat");
    v864[407] = v46;
    v863[408] = @"PCPU2_CLKOFF";
    uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_RealFormat");
    v864[408] = v44;
    v863[409] = @"PCPU2_RUNMAX";
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_RealFormat");
    v864[409] = v42;
    v863[410] = @"PCPU3_CLKOFF";
    double v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_RealFormat");
    v864[410] = v40;
    v863[411] = @"PCPU3_RUNMAX";
    v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v38 = objc_msgSend(v39, "commonTypeDict_RealFormat");
    v864[411] = v38;
    v863[412] = @"SIO-CPU-AUDIO_CLKOFF";
    double v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_RealFormat");
    v864[412] = v36;
    v863[413] = @"SIO-CPU-AUDIO_RUNMAX";
    id v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_RealFormat");
    v864[413] = v34;
    v863[414] = @"SMC_I2CM0_CLKOFF";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
    v864[414] = v32;
    v863[415] = @"SMC_I2CM0_RUNMAX";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_RealFormat");
    v864[415] = v30;
    v863[416] = @"SMC_I2CM1_CLKOFF";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
    v864[416] = v28;
    v863[417] = @"SMC_I2CM1_RUNMAX";
    double v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v26 = objc_msgSend(v27, "commonTypeDict_RealFormat");
    v864[417] = v26;
    v863[418] = @"SMC_I2CM2_CLKOFF";
    double v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
    v864[418] = v24;
    v863[419] = @"SMC_I2CM2_RUNMAX";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v22 = objc_msgSend(v23, "commonTypeDict_RealFormat");
    v864[419] = v22;
    v863[420] = @"SMC_I2CM3_CLKOFF";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
    v864[420] = v20;
    v863[421] = @"SMC_I2CM3_RUNMAX";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
    v864[421] = v18;
    v863[422] = @"SMC_I2CM4_CLKOFF";
    id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
    v864[422] = v16;
    v863[423] = @"SMC_I2CM4_RUNMAX";
    id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
    v864[423] = v14;
    v863[424] = @"SPI4_CLKOFF";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v864[424] = v4;
    v863[425] = @"SPI4_RUNMAX";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
    v864[425] = v6;
    v863[426] = @"VENC-SYS-V_CLKOFF";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    v864[426] = v8;
    v863[427] = @"VENC-SYS-V_RUNMAX";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
    v864[427] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v864 forKeys:v863 count:428];
    v868[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v868 forKeys:v867 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionSoCStatsEventsRaw
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v17[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v15[0] = *MEMORY[0x1E4F92CD0];
    v15[1] = v2;
    v16[0] = &unk_1F29F0700;
    v16[1] = @"logSOCHOT0Snapshot";
    void v15[2] = *MEMORY[0x1E4F92C60];
    v16[2] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    v18[0] = v3;
    v17[1] = *MEMORY[0x1E4F92CA8];
    v13[0] = @"SOCHOT0_ACT";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v14[0] = v5;
    v13[1] = @"SOCHOT0_Transitions";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v14[1] = v7;
    void v13[2] = @"DROOP_N";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v14[2] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v18[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (BOOL)shouldLogSleepMedia
{
  if (qword_1EBD58400 != -1) {
    dispatch_once(&qword_1EBD58400, &__block_literal_global_3046);
  }
  return _MergedGlobals_1_25;
}

uint64_t __38__PLIOReportAgent_shouldLogSleepMedia__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] hasSleepMedia];
  if (result) {
    uint64_t result = [MEMORY[0x1E4F92A38] isWatch];
  }
  _MergedGlobals_1_25 = result;
  return result;
}

+ (id)entryEventBackwardDefinitionSoCStatsEvents
{
  v328[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats]
    && ([MEMORY[0x1E4F92A38] isWatch] & 1) == 0)
  {
    v327[0] = *MEMORY[0x1E4F92C50];
    uint64_t v13 = *MEMORY[0x1E4F92CB0];
    v325[0] = *MEMORY[0x1E4F92CD0];
    v325[1] = v13;
    v326[0] = &unk_1F29F0770;
    v326[1] = @"logEventBackwardIOReport";
    uint64_t v14 = *MEMORY[0x1E4F92CE8];
    v325[2] = *MEMORY[0x1E4F92C60];
    v325[3] = v14;
    v326[2] = MEMORY[0x1E4F1CC28];
    v326[3] = MEMORY[0x1E4F1CC38];
    uint64_t v218 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v326 forKeys:v325 count:4];
    v328[0] = v218;
    v327[1] = *MEMORY[0x1E4F92CA8];
    v323[0] = @"APWakeTime";
    v215 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v217 = objc_msgSend(v215, "commonTypeDict_RealFormat_withUnit_s");
    v324[0] = v217;
    v323[1] = @"ANE_ADCLK_TRIG_ACT";
    v209 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v214 = objc_msgSend(v209, "commonTypeDict_RealFormat");
    v324[1] = v214;
    v323[2] = @"ANE_ADCLK_TRIG_INACT";
    v208 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v206 = objc_msgSend(v208, "commonTypeDict_RealFormat");
    v324[2] = v206;
    v323[3] = @"ANE_ADCLK_TRIG_Transitions";
    v211 = [MEMORY[0x1E4F929D8] sharedInstance];
    v316 = objc_msgSend(v211, "commonTypeDict_IntegerFormat");
    v324[3] = v316;
    v323[4] = @"ANE_DITHR_TRIG_ACT";
    v204 = [MEMORY[0x1E4F929D8] sharedInstance];
    v315 = objc_msgSend(v204, "commonTypeDict_RealFormat");
    v324[4] = v315;
    v323[5] = @"ANE_DITHR_TRIG_INACT";
    v314 = [MEMORY[0x1E4F929D8] sharedInstance];
    v313 = objc_msgSend(v314, "commonTypeDict_RealFormat");
    v324[5] = v313;
    v323[6] = @"ANE_DITHR_TRIG_Transitions";
    v312 = [MEMORY[0x1E4F929D8] sharedInstance];
    v311 = objc_msgSend(v312, "commonTypeDict_IntegerFormat");
    v324[6] = v311;
    v323[7] = @"AWAKE_ACT";
    v310 = [MEMORY[0x1E4F929D8] sharedInstance];
    v309 = objc_msgSend(v310, "commonTypeDict_RealFormat");
    v324[7] = v309;
    v323[8] = @"AWAKE_INACT";
    v308 = [MEMORY[0x1E4F929D8] sharedInstance];
    v307 = objc_msgSend(v308, "commonTypeDict_RealFormat");
    v324[8] = v307;
    v323[9] = @"AWAKE_Transitions";
    v306 = [MEMORY[0x1E4F929D8] sharedInstance];
    v305 = objc_msgSend(v306, "commonTypeDict_IntegerFormat");
    v324[9] = v305;
    v323[10] = @"DCS_VMAX_ACT";
    v304 = [MEMORY[0x1E4F929D8] sharedInstance];
    v303 = objc_msgSend(v304, "commonTypeDict_RealFormat");
    v324[10] = v303;
    v323[11] = @"DCS_VMAX_INACT";
    v302 = [MEMORY[0x1E4F929D8] sharedInstance];
    v301 = objc_msgSend(v302, "commonTypeDict_RealFormat");
    v324[11] = v301;
    v323[12] = @"DCS_VMAX_Transitions";
    v300 = [MEMORY[0x1E4F929D8] sharedInstance];
    v299 = objc_msgSend(v300, "commonTypeDict_IntegerFormat");
    v324[12] = v299;
    v323[13] = @"DCS_VMIN_ACT";
    v298 = [MEMORY[0x1E4F929D8] sharedInstance];
    v297 = objc_msgSend(v298, "commonTypeDict_RealFormat");
    v324[13] = v297;
    v323[14] = @"DCS_VMIN_INACT";
    v296 = [MEMORY[0x1E4F929D8] sharedInstance];
    v295 = objc_msgSend(v296, "commonTypeDict_RealFormat");
    v324[14] = v295;
    v323[15] = @"DCS_VMIN_Transitions";
    v294 = [MEMORY[0x1E4F929D8] sharedInstance];
    v293 = objc_msgSend(v294, "commonTypeDict_IntegerFormat");
    v324[15] = v293;
    v323[16] = @"DCS_VNOM_ACT";
    v292 = [MEMORY[0x1E4F929D8] sharedInstance];
    v291 = objc_msgSend(v292, "commonTypeDict_RealFormat");
    v324[16] = v291;
    v323[17] = @"DCS_VNOM_INACT";
    v290 = [MEMORY[0x1E4F929D8] sharedInstance];
    v289 = objc_msgSend(v290, "commonTypeDict_RealFormat");
    v324[17] = v289;
    v323[18] = @"DCS_VNOM_Transitions";
    v288 = [MEMORY[0x1E4F929D8] sharedInstance];
    v287 = objc_msgSend(v288, "commonTypeDict_IntegerFormat");
    v324[18] = v287;
    v323[19] = @"DEEP_WAIT_ACT";
    v286 = [MEMORY[0x1E4F929D8] sharedInstance];
    v285 = objc_msgSend(v286, "commonTypeDict_RealFormat");
    v324[19] = v285;
    v323[20] = @"DEEP_WAIT_INACT";
    v284 = [MEMORY[0x1E4F929D8] sharedInstance];
    v283 = objc_msgSend(v284, "commonTypeDict_RealFormat");
    v324[20] = v283;
    v323[21] = @"DEEP_WAIT_Transitions";
    v282 = [MEMORY[0x1E4F929D8] sharedInstance];
    v281 = objc_msgSend(v282, "commonTypeDict_IntegerFormat");
    v324[21] = v281;
    v323[22] = @"ECPU_ADCLK_TRIG_ACT";
    v280 = [MEMORY[0x1E4F929D8] sharedInstance];
    v279 = objc_msgSend(v280, "commonTypeDict_RealFormat");
    v324[22] = v279;
    v323[23] = @"ECPU_ADCLK_TRIG_INACT";
    v278 = [MEMORY[0x1E4F929D8] sharedInstance];
    v277 = objc_msgSend(v278, "commonTypeDict_RealFormat");
    v324[23] = v277;
    v323[24] = @"ECPU_ADCLK_TRIG_Transitions";
    v276 = [MEMORY[0x1E4F929D8] sharedInstance];
    v275 = objc_msgSend(v276, "commonTypeDict_IntegerFormat");
    v324[24] = v275;
    v323[25] = @"ECPU_DITHR_TRIG_ACT";
    v274 = [MEMORY[0x1E4F929D8] sharedInstance];
    v273 = objc_msgSend(v274, "commonTypeDict_RealFormat");
    v324[25] = v273;
    v323[26] = @"ECPU_DITHR_TRIG_INACT";
    v272 = [MEMORY[0x1E4F929D8] sharedInstance];
    v271 = objc_msgSend(v272, "commonTypeDict_RealFormat");
    v324[26] = v271;
    v323[27] = @"ECPU_DITHR_TRIG_Transitions";
    v270 = [MEMORY[0x1E4F929D8] sharedInstance];
    v269 = objc_msgSend(v270, "commonTypeDict_IntegerFormat");
    v324[27] = v269;
    v323[28] = @"GPU_ADCLK_TRIG_ACT";
    v268 = [MEMORY[0x1E4F929D8] sharedInstance];
    v267 = objc_msgSend(v268, "commonTypeDict_RealFormat");
    v324[28] = v267;
    v323[29] = @"GPU_ADCLK_TRIG_INACT";
    v266 = [MEMORY[0x1E4F929D8] sharedInstance];
    v265 = objc_msgSend(v266, "commonTypeDict_RealFormat");
    v324[29] = v265;
    v323[30] = @"GPU_ADCLK_TRIG_Transitions";
    v264 = [MEMORY[0x1E4F929D8] sharedInstance];
    v263 = objc_msgSend(v264, "commonTypeDict_IntegerFormat");
    v324[30] = v263;
    v323[31] = @"GPU_DITHR_TRIG_ACT";
    v262 = [MEMORY[0x1E4F929D8] sharedInstance];
    v261 = objc_msgSend(v262, "commonTypeDict_RealFormat");
    v324[31] = v261;
    v323[32] = @"GPU_DITHR_TRIG_INACT";
    v260 = [MEMORY[0x1E4F929D8] sharedInstance];
    v259 = objc_msgSend(v260, "commonTypeDict_RealFormat");
    v324[32] = v259;
    v323[33] = @"GPU_DITHR_TRIG_Transitions";
    v258 = [MEMORY[0x1E4F929D8] sharedInstance];
    v257 = objc_msgSend(v258, "commonTypeDict_IntegerFormat");
    v324[33] = v257;
    v323[34] = @"GPU_DROOP_TRIG_ACT";
    v256 = [MEMORY[0x1E4F929D8] sharedInstance];
    v255 = objc_msgSend(v256, "commonTypeDict_RealFormat");
    v324[34] = v255;
    v323[35] = @"GPU_DROOP_TRIG_INACT";
    v254 = [MEMORY[0x1E4F929D8] sharedInstance];
    v253 = objc_msgSend(v254, "commonTypeDict_RealFormat");
    v324[35] = v253;
    v323[36] = @"GPU_DROOP_TRIG_Transitions";
    v252 = [MEMORY[0x1E4F929D8] sharedInstance];
    v251 = objc_msgSend(v252, "commonTypeDict_IntegerFormat");
    v324[36] = v251;
    v323[37] = @"GPU_ILIMIT_ACT";
    v250 = [MEMORY[0x1E4F929D8] sharedInstance];
    v249 = objc_msgSend(v250, "commonTypeDict_RealFormat");
    v324[37] = v249;
    v323[38] = @"GPU_ILIMIT_INACT";
    v248 = [MEMORY[0x1E4F929D8] sharedInstance];
    v247 = objc_msgSend(v248, "commonTypeDict_RealFormat");
    v324[38] = v247;
    v323[39] = @"GPU_ILIMIT_Transitions";
    v246 = [MEMORY[0x1E4F929D8] sharedInstance];
    v245 = objc_msgSend(v246, "commonTypeDict_IntegerFormat");
    v324[39] = v245;
    v323[40] = @"GPU_UVWARN_ACT";
    v244 = [MEMORY[0x1E4F929D8] sharedInstance];
    v243 = objc_msgSend(v244, "commonTypeDict_RealFormat");
    v324[40] = v243;
    v323[41] = @"GPU_UVWARN_INACT";
    v242 = [MEMORY[0x1E4F929D8] sharedInstance];
    v241 = objc_msgSend(v242, "commonTypeDict_RealFormat");
    v324[41] = v241;
    v323[42] = @"GPU_UVWARN_Transitions";
    v240 = [MEMORY[0x1E4F929D8] sharedInstance];
    v239 = objc_msgSend(v240, "commonTypeDict_IntegerFormat");
    v324[42] = v239;
    v323[43] = @"PCPU_ADCLK_TRIG_ACT";
    v238 = [MEMORY[0x1E4F929D8] sharedInstance];
    v237 = objc_msgSend(v238, "commonTypeDict_RealFormat");
    v324[43] = v237;
    v323[44] = @"PCPU_ADCLK_TRIG_INACT";
    v236 = [MEMORY[0x1E4F929D8] sharedInstance];
    v235 = objc_msgSend(v236, "commonTypeDict_RealFormat");
    v324[44] = v235;
    v323[45] = @"PCPU_ADCLK_TRIG_Transitions";
    v234 = [MEMORY[0x1E4F929D8] sharedInstance];
    v233 = objc_msgSend(v234, "commonTypeDict_IntegerFormat");
    v324[45] = v233;
    v323[46] = @"PCPU_DITHR_TRIG_ACT";
    v232 = [MEMORY[0x1E4F929D8] sharedInstance];
    v231 = objc_msgSend(v232, "commonTypeDict_RealFormat");
    v324[46] = v231;
    v323[47] = @"PCPU_DITHR_TRIG_INACT";
    v230 = [MEMORY[0x1E4F929D8] sharedInstance];
    v229 = objc_msgSend(v230, "commonTypeDict_RealFormat");
    v324[47] = v229;
    v323[48] = @"PCPU_DITHR_TRIG_Transitions";
    v228 = [MEMORY[0x1E4F929D8] sharedInstance];
    v227 = objc_msgSend(v228, "commonTypeDict_IntegerFormat");
    v324[48] = v227;
    v323[49] = @"PRE_UPO_ACT";
    v226 = [MEMORY[0x1E4F929D8] sharedInstance];
    v225 = objc_msgSend(v226, "commonTypeDict_RealFormat");
    v324[49] = v225;
    v323[50] = @"PRE_UPO_INACT";
    v224 = [MEMORY[0x1E4F929D8] sharedInstance];
    v223 = objc_msgSend(v224, "commonTypeDict_RealFormat");
    v324[50] = v223;
    v323[51] = @"PRE_UPO_Transitions";
    v222 = [MEMORY[0x1E4F929D8] sharedInstance];
    v221 = objc_msgSend(v222, "commonTypeDict_IntegerFormat");
    v324[51] = v221;
    v323[52] = @"PRE_UVLO_ACT";
    v220 = [MEMORY[0x1E4F929D8] sharedInstance];
    v219 = objc_msgSend(v220, "commonTypeDict_RealFormat");
    v324[52] = v219;
    v323[53] = @"PRE_UVLO_INACT";
    v216 = [MEMORY[0x1E4F929D8] sharedInstance];
    v213 = objc_msgSend(v216, "commonTypeDict_RealFormat");
    v324[53] = v213;
    v323[54] = @"PRE_UVLO_Transitions";
    v212 = [MEMORY[0x1E4F929D8] sharedInstance];
    v210 = objc_msgSend(v212, "commonTypeDict_IntegerFormat");
    v324[54] = v210;
    v323[55] = @"SLP_DDR_ACT";
    v207 = [MEMORY[0x1E4F929D8] sharedInstance];
    v205 = objc_msgSend(v207, "commonTypeDict_RealFormat");
    v324[55] = v205;
    v323[56] = @"SLP_DDR_INACT";
    v203 = [MEMORY[0x1E4F929D8] sharedInstance];
    v202 = objc_msgSend(v203, "commonTypeDict_RealFormat");
    v324[56] = v202;
    v323[57] = @"SLP_DDR_Transitions";
    v201 = [MEMORY[0x1E4F929D8] sharedInstance];
    v200 = objc_msgSend(v201, "commonTypeDict_IntegerFormat");
    v324[57] = v200;
    v323[58] = @"SLP_S2R_ACT";
    v199 = [MEMORY[0x1E4F929D8] sharedInstance];
    v198 = objc_msgSend(v199, "commonTypeDict_RealFormat");
    v324[58] = v198;
    v323[59] = @"SLP_S2R_INACT";
    v197 = [MEMORY[0x1E4F929D8] sharedInstance];
    v196 = objc_msgSend(v197, "commonTypeDict_RealFormat");
    v324[59] = v196;
    v323[60] = @"SLP_S2R_Transitions";
    v195 = [MEMORY[0x1E4F929D8] sharedInstance];
    v194 = objc_msgSend(v195, "commonTypeDict_IntegerFormat");
    v324[60] = v194;
    v323[61] = @"SOCHOT0_ACT";
    v193 = [MEMORY[0x1E4F929D8] sharedInstance];
    v192 = objc_msgSend(v193, "commonTypeDict_RealFormat");
    v324[61] = v192;
    v323[62] = @"SOCHOT0_INACT";
    v191 = [MEMORY[0x1E4F929D8] sharedInstance];
    v190 = objc_msgSend(v191, "commonTypeDict_RealFormat");
    v324[62] = v190;
    v323[63] = @"SOCHOT1_ACT";
    v189 = [MEMORY[0x1E4F929D8] sharedInstance];
    v188 = objc_msgSend(v189, "commonTypeDict_RealFormat");
    v324[63] = v188;
    v323[64] = @"SOCHOT1_INACT";
    v187 = [MEMORY[0x1E4F929D8] sharedInstance];
    v186 = objc_msgSend(v187, "commonTypeDict_RealFormat");
    v324[64] = v186;
    v323[65] = @"SOCHOT1_Transitions";
    v185 = [MEMORY[0x1E4F929D8] sharedInstance];
    v184 = objc_msgSend(v185, "commonTypeDict_IntegerFormat");
    v324[65] = v184;
    v323[66] = @"SOC_VMAX_ACT";
    v183 = [MEMORY[0x1E4F929D8] sharedInstance];
    v182 = objc_msgSend(v183, "commonTypeDict_RealFormat");
    v324[66] = v182;
    v323[67] = @"SOC_VMAX_INACT";
    v181 = [MEMORY[0x1E4F929D8] sharedInstance];
    v180 = objc_msgSend(v181, "commonTypeDict_RealFormat");
    v324[67] = v180;
    v323[68] = @"SOC_VMAX_Transitions";
    v179 = [MEMORY[0x1E4F929D8] sharedInstance];
    v178 = objc_msgSend(v179, "commonTypeDict_IntegerFormat");
    v324[68] = v178;
    v323[69] = @"SOC_VMIN_ACT";
    v177 = [MEMORY[0x1E4F929D8] sharedInstance];
    v176 = objc_msgSend(v177, "commonTypeDict_RealFormat");
    v324[69] = v176;
    v323[70] = @"SOC_VMIN_INACT";
    v175 = [MEMORY[0x1E4F929D8] sharedInstance];
    v174 = objc_msgSend(v175, "commonTypeDict_RealFormat");
    v324[70] = v174;
    v323[71] = @"SOC_VMIN_Transitions";
    v173 = [MEMORY[0x1E4F929D8] sharedInstance];
    v172 = objc_msgSend(v173, "commonTypeDict_IntegerFormat");
    v324[71] = v172;
    v323[72] = @"SOC_VNOM_ACT";
    v171 = [MEMORY[0x1E4F929D8] sharedInstance];
    v170 = objc_msgSend(v171, "commonTypeDict_RealFormat");
    v324[72] = v170;
    v323[73] = @"SOC_VNOM_INACT";
    v169 = [MEMORY[0x1E4F929D8] sharedInstance];
    v168 = objc_msgSend(v169, "commonTypeDict_RealFormat");
    v324[73] = v168;
    v323[74] = @"SOC_VNOM_Transitions";
    v167 = [MEMORY[0x1E4F929D8] sharedInstance];
    v166 = objc_msgSend(v167, "commonTypeDict_IntegerFormat");
    v324[74] = v166;
    v323[75] = @"ANE_DROOP_TRIG_ACT";
    v165 = [MEMORY[0x1E4F929D8] sharedInstance];
    v164 = objc_msgSend(v165, "commonTypeDict_RealFormat");
    v324[75] = v164;
    v323[76] = @"ANE_DROOP_TRIG_INACT";
    v163 = [MEMORY[0x1E4F929D8] sharedInstance];
    v162 = objc_msgSend(v163, "commonTypeDict_RealFormat");
    v324[76] = v162;
    v323[77] = @"ANE_DROOP_TRIG_Transitions";
    v161 = [MEMORY[0x1E4F929D8] sharedInstance];
    v160 = objc_msgSend(v161, "commonTypeDict_IntegerFormat");
    v324[77] = v160;
    v323[78] = @"ANE_UVWRN_TRIG_ACT";
    v159 = [MEMORY[0x1E4F929D8] sharedInstance];
    v158 = objc_msgSend(v159, "commonTypeDict_RealFormat");
    v324[78] = v158;
    v323[79] = @"ANE_UVWRN_TRIG_INACT";
    v157 = [MEMORY[0x1E4F929D8] sharedInstance];
    v156 = objc_msgSend(v157, "commonTypeDict_RealFormat");
    v324[79] = v156;
    v323[80] = @"ANE_UVWRN_TRIG_Transitions";
    v155 = [MEMORY[0x1E4F929D8] sharedInstance];
    v154 = objc_msgSend(v155, "commonTypeDict_IntegerFormat");
    v324[80] = v154;
    v323[81] = @"DCS_VMID_ACT";
    v153 = [MEMORY[0x1E4F929D8] sharedInstance];
    v152 = objc_msgSend(v153, "commonTypeDict_RealFormat");
    v324[81] = v152;
    v323[82] = @"DCS_VMID_INACT";
    v151 = [MEMORY[0x1E4F929D8] sharedInstance];
    v150 = objc_msgSend(v151, "commonTypeDict_RealFormat");
    v324[82] = v150;
    v323[83] = @"DCS_VMID_Transitions";
    v149 = [MEMORY[0x1E4F929D8] sharedInstance];
    v148 = objc_msgSend(v149, "commonTypeDict_IntegerFormat");
    v324[83] = v148;
    v323[84] = @"ECPU_DROOP_TRIG_ACT";
    v147 = [MEMORY[0x1E4F929D8] sharedInstance];
    v146 = objc_msgSend(v147, "commonTypeDict_RealFormat");
    v324[84] = v146;
    v323[85] = @"ECPU_DROOP_TRIG_INACT";
    v145 = [MEMORY[0x1E4F929D8] sharedInstance];
    v144 = objc_msgSend(v145, "commonTypeDict_RealFormat");
    v324[85] = v144;
    v323[86] = @"ECPU_DROOP_TRIG_Transitions";
    v143 = [MEMORY[0x1E4F929D8] sharedInstance];
    v142 = objc_msgSend(v143, "commonTypeDict_IntegerFormat");
    v324[86] = v142;
    v323[87] = @"ECPU_UVWRN_TRIG_ACT";
    v141 = [MEMORY[0x1E4F929D8] sharedInstance];
    v140 = objc_msgSend(v141, "commonTypeDict_RealFormat");
    v324[87] = v140;
    v323[88] = @"ECPU_UVWRN_TRIG_INACT";
    v139 = [MEMORY[0x1E4F929D8] sharedInstance];
    v138 = objc_msgSend(v139, "commonTypeDict_RealFormat");
    v324[88] = v138;
    v323[89] = @"ECPU_UVWRN_TRIG_Transitions";
    v137 = [MEMORY[0x1E4F929D8] sharedInstance];
    v136 = objc_msgSend(v137, "commonTypeDict_IntegerFormat");
    v324[89] = v136;
    v323[90] = @"GPU_ILIMIT_TRIG_ACT";
    v135 = [MEMORY[0x1E4F929D8] sharedInstance];
    v134 = objc_msgSend(v135, "commonTypeDict_RealFormat");
    v324[90] = v134;
    v323[91] = @"GPU_ILIMIT_TRIG_INACT";
    v133 = [MEMORY[0x1E4F929D8] sharedInstance];
    v132 = objc_msgSend(v133, "commonTypeDict_RealFormat");
    v324[91] = v132;
    v323[92] = @"GPU_ILIMIT_TRIG_Transitions";
    v131 = [MEMORY[0x1E4F929D8] sharedInstance];
    v130 = objc_msgSend(v131, "commonTypeDict_IntegerFormat");
    v324[92] = v130;
    v323[93] = @"GPU_UVWRN_TRIG_ACT";
    v129 = [MEMORY[0x1E4F929D8] sharedInstance];
    v128 = objc_msgSend(v129, "commonTypeDict_RealFormat");
    v324[93] = v128;
    v323[94] = @"GPU_UVWRN_TRIG_INACT";
    uint64_t v127 = [MEMORY[0x1E4F929D8] sharedInstance];
    v126 = objc_msgSend(v127, "commonTypeDict_RealFormat");
    v324[94] = v126;
    v323[95] = @"GPU_UVWRN_TRIG_Transitions";
    v125 = [MEMORY[0x1E4F929D8] sharedInstance];
    v124 = objc_msgSend(v125, "commonTypeDict_IntegerFormat");
    v324[95] = v124;
    v323[96] = @"PCPU_DROOP_TRIG_ACT";
    v123 = [MEMORY[0x1E4F929D8] sharedInstance];
    v122 = objc_msgSend(v123, "commonTypeDict_RealFormat");
    v324[96] = v122;
    v323[97] = @"PCPU_DROOP_TRIG_INACT";
    long long v121 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v120 = objc_msgSend(v121, "commonTypeDict_RealFormat");
    v324[97] = v120;
    v323[98] = @"PCPU_DROOP_TRIG_Transitions";
    long long v119 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v118 = objc_msgSend(v119, "commonTypeDict_IntegerFormat");
    v324[98] = v118;
    v323[99] = @"PCPU_UVWRN_TRIG_ACT";
    v117 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v116 = objc_msgSend(v117, "commonTypeDict_RealFormat");
    v324[99] = v116;
    v323[100] = @"PCPU_UVWRN_TRIG_INACT";
    long long v115 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v114 = objc_msgSend(v115, "commonTypeDict_RealFormat");
    v324[100] = v114;
    v323[101] = @"PCPU_UVWRN_TRIG_Transitions";
    long long v113 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v112 = objc_msgSend(v113, "commonTypeDict_IntegerFormat");
    v324[101] = v112;
    v323[102] = @"SOC_VMID_ACT";
    long long v111 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v110 = objc_msgSend(v111, "commonTypeDict_RealFormat");
    v324[102] = v110;
    v323[103] = @"SOC_VMID_INACT";
    long long v109 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v108 = objc_msgSend(v109, "commonTypeDict_RealFormat");
    v324[103] = v108;
    v323[104] = @"SOC_VMID_Transitions";
    v107 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v106 = objc_msgSend(v107, "commonTypeDict_IntegerFormat");
    v324[104] = v106;
    v323[105] = @"DISP_VMIN_ACT";
    v105 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v104 = objc_msgSend(v105, "commonTypeDict_RealFormat");
    v324[105] = v104;
    v323[106] = @"DISP_VNOM_ACT";
    uint64_t v103 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v102 = objc_msgSend(v103, "commonTypeDict_RealFormat");
    v324[106] = v102;
    v323[107] = @"DISP_VNOM2_ACT";
    v101 = [MEMORY[0x1E4F929D8] sharedInstance];
    v100 = objc_msgSend(v101, "commonTypeDict_RealFormat");
    v324[107] = v100;
    v323[108] = @"DISP_VMAX_ACT";
    v99 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v98 = objc_msgSend(v99, "commonTypeDict_RealFormat");
    v324[108] = v98;
    v323[109] = @"SLP_MEDIA_ACT";
    id v97 = [MEMORY[0x1E4F929D8] sharedInstance];
    v96 = objc_msgSend(v97, "commonTypeDict_RealFormat");
    v324[109] = v96;
    v323[110] = @"SLP_MEDIA_INACT";
    id v95 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v94 = objc_msgSend(v95, "commonTypeDict_RealFormat");
    v324[110] = v94;
    v323[111] = @"SLP_MEDIA_Transitions";
    v93 = [MEMORY[0x1E4F929D8] sharedInstance];
    v92 = objc_msgSend(v93, "commonTypeDict_IntegerFormat");
    v324[111] = v92;
    v323[112] = @"SOC_VOVD_ACT";
    uint64_t v91 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v90 = objc_msgSend(v91, "commonTypeDict_RealFormat");
    v324[112] = v90;
    v323[113] = @"DCS_F1_ACT";
    v89 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v88 = objc_msgSend(v89, "commonTypeDict_RealFormat");
    v324[113] = v88;
    v323[114] = @"DCS_F2_ACT";
    v87 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v86 = objc_msgSend(v87, "commonTypeDict_RealFormat");
    v324[114] = v86;
    v323[115] = @"DCS_F3_ACT";
    v85 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v84 = objc_msgSend(v85, "commonTypeDict_RealFormat");
    v324[115] = v84;
    v323[116] = @"DCS_F4_ACT";
    int v83 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v82 = objc_msgSend(v83, "commonTypeDict_RealFormat");
    v324[116] = v82;
    v323[117] = @"DCS_F5_ACT";
    char v81 = [MEMORY[0x1E4F929D8] sharedInstance];
    v80 = objc_msgSend(v81, "commonTypeDict_RealFormat");
    v324[117] = v80;
    v323[118] = @"DCS_F6_ACT";
    uint64_t v79 = [MEMORY[0x1E4F929D8] sharedInstance];
    v78 = objc_msgSend(v79, "commonTypeDict_RealFormat");
    v324[118] = v78;
    v323[119] = @"VBAT_CHOKE_ACT";
    uint64_t v77 = [MEMORY[0x1E4F929D8] sharedInstance];
    v76 = objc_msgSend(v77, "commonTypeDict_RealFormat");
    v324[119] = v76;
    v323[120] = @"AF_FAST_CLK_SLO_ACT";
    uint64_t v75 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v74 = objc_msgSend(v75, "commonTypeDict_RealFormat");
    v324[120] = v74;
    v323[121] = @"PCPU_ADCLK_TRIG0_ACT";
    uint64_t v73 = [MEMORY[0x1E4F929D8] sharedInstance];
    v72 = objc_msgSend(v73, "commonTypeDict_RealFormat");
    v324[121] = v72;
    v323[122] = @"ECPU_DITHR_TRIG0_ACT";
    uint64_t v71 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v70 = objc_msgSend(v71, "commonTypeDict_RealFormat");
    v324[122] = v70;
    v323[123] = @"PCPU_DITHR_TRIG0_ACT";
    uint64_t v69 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v68 = objc_msgSend(v69, "commonTypeDict_RealFormat");
    v324[123] = v68;
    v323[124] = @"ECPU_EXT_TRIG0_ACT";
    uint64_t v67 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v66 = objc_msgSend(v67, "commonTypeDict_RealFormat");
    v324[124] = v66;
    v323[125] = @"ECPU_EXT_TRIG1_ACT";
    uint64_t v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v64 = objc_msgSend(v65, "commonTypeDict_RealFormat");
    v324[125] = v64;
    v323[126] = @"ECPU_EXT_TRIG2_ACT";
    id v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v62 = objc_msgSend(v63, "commonTypeDict_RealFormat");
    v324[126] = v62;
    v323[127] = @"ECPU_EXT_TRIG3_ACT";
    double v61 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v60 = objc_msgSend(v61, "commonTypeDict_RealFormat");
    v324[127] = v60;
    v323[128] = @"PCPU_EXT_TRIG0_ACT";
    uint64_t v59 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v58 = objc_msgSend(v59, "commonTypeDict_RealFormat");
    v324[128] = v58;
    v323[129] = @"PCPU_EXT_TRIG1_ACT";
    v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat");
    v324[129] = v56;
    v323[130] = @"PCPU_EXT_TRIG2_ACT";
    v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v54 = objc_msgSend(v55, "commonTypeDict_RealFormat");
    v324[130] = v54;
    v323[131] = @"PCPU_EXT_TRIG3_ACT";
    uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v52 = objc_msgSend(v53, "commonTypeDict_RealFormat");
    v324[131] = v52;
    v323[132] = @"GPU_EXT_TRIG0_ACT";
    double v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v50 = objc_msgSend(v51, "commonTypeDict_RealFormat");
    v324[132] = v50;
    v323[133] = @"GPU_EXT_TRIG1_ACT";
    v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v49, "commonTypeDict_RealFormat");
    v324[133] = v48;
    v323[134] = @"GPU_EXT_TRIG2_ACT";
    double v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_RealFormat");
    v324[134] = v46;
    v323[135] = @"GPU_EXT_TRIG3_ACT";
    uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_RealFormat");
    v324[135] = v44;
    v323[136] = @"ANE_EXT_TRIG0_ACT";
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_RealFormat");
    v324[136] = v42;
    v323[137] = @"ANE_EXT_TRIG1_ACT";
    double v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_RealFormat");
    v324[137] = v40;
    v323[138] = @"ANE_EXT_TRIG2_ACT";
    v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v38 = objc_msgSend(v39, "commonTypeDict_RealFormat");
    v324[138] = v38;
    v323[139] = @"ANE_EXT_TRIG3_ACT";
    double v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_RealFormat");
    v324[139] = v36;
    v323[140] = @"AVE_VMIN_ACT";
    id v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_RealFormat");
    v324[140] = v34;
    v323[141] = @"AVE_VMIN_INACT";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
    v324[141] = v32;
    v323[142] = @"AVE_VMIN_Transitions";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v324[142] = v30;
    v323[143] = @"AVE_VNOM_ACT";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
    v324[143] = v28;
    v323[144] = @"AVE_VNOM_INACT";
    double v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v26 = objc_msgSend(v27, "commonTypeDict_RealFormat");
    v324[144] = v26;
    v323[145] = @"AVE_VNOM_Transitions";
    id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v16 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v324[145] = v16;
    v323[146] = @"AVE_VMAX_ACT";
    id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v17, "commonTypeDict_RealFormat");
    v324[146] = v18;
    v323[147] = @"AVE_VMAX_INACT";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v19, "commonTypeDict_RealFormat");
    v324[147] = v20;
    v323[148] = @"AVE_VMAX_Transitions";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v22 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v324[148] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v324 forKeys:v323 count:149];
    v328[1] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v328 forKeys:v327 count:2];

    double v6 = v209;
    uint64_t v3 = (void *)v218;

    id v9 = (void *)v206;
    uint64_t v4 = v215;

    id v8 = v208;
    uint64_t v11 = v204;

    BOOL v5 = (void *)v217;
    uint64_t v12 = (void *)v24;

    double v7 = (void *)v214;
    id v10 = v211;
  }
  else
  {
    if (![MEMORY[0x1E4F92A38] isWatch]
      || !+[PLIOReportAgent shouldLogSleepMedia])
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
      goto LABEL_9;
    }
    v321[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C60];
    v319[0] = *MEMORY[0x1E4F92CD0];
    v319[1] = v2;
    v320[0] = &unk_1F29F0750;
    v320[1] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v320 forKeys:v319 count:2];
    v322[0] = v3;
    v321[1] = *MEMORY[0x1E4F92CA8];
    v317[0] = @"SampleTime";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat_withUnit_s");
    v318[0] = v5;
    v317[1] = @"AWAKE_ACT";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    v318[1] = v7;
    v317[2] = @"AWAKE_HOT_ACT";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v318[2] = v9;
    v317[3] = @"SLP_S2R_ACT";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    v316 = objc_msgSend(v10, "commonTypeDict_RealFormat");
    v318[3] = v316;
    v317[4] = @"SLP_MEDIA_ACT";
    uint64_t v11 = [MEMORY[0x1E4F929D8] sharedInstance];
    v315 = objc_msgSend(v11, "commonTypeDict_RealFormat");
    v318[4] = v315;
    v314 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v318 forKeys:v317 count:5];
    v322[1] = v314;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v322 forKeys:v321 count:2];
  }

LABEL_9:
  return v12;
}

+ (id)entryEventBackwardDefinitionEnergyModel
{
  v362[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v361[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v359[0] = *MEMORY[0x1E4F92CD0];
    v359[1] = v2;
    v360[0] = &unk_1F29F0780;
    v360[1] = @"logEventBackwardIOReport";
    v359[2] = *MEMORY[0x1E4F92C60];
    v360[2] = MEMORY[0x1E4F1CC28];
    v356 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v360 forKeys:v359 count:3];
    v362[0] = v356;
    v361[1] = *MEMORY[0x1E4F92CA8];
    v357[0] = @"SampleTime";
    v355 = [MEMORY[0x1E4F929D8] sharedInstance];
    v354 = objc_msgSend(v355, "commonTypeDict_RealFormat_withUnit_s");
    v358[0] = v354;
    v357[1] = @"CPU Energy";
    v353 = [MEMORY[0x1E4F929D8] sharedInstance];
    v352 = objc_msgSend(v353, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[1] = v352;
    v357[2] = @"VENC Energy";
    v351 = [MEMORY[0x1E4F929D8] sharedInstance];
    v350 = objc_msgSend(v351, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[2] = v350;
    v357[3] = @"VDEC Energy";
    v349 = [MEMORY[0x1E4F929D8] sharedInstance];
    v348 = objc_msgSend(v349, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[3] = v348;
    v357[4] = @"ISP Energy";
    v347 = [MEMORY[0x1E4F929D8] sharedInstance];
    v346 = objc_msgSend(v347, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[4] = v346;
    v357[5] = @"Rest of SoC Energy";
    v345 = [MEMORY[0x1E4F929D8] sharedInstance];
    v344 = objc_msgSend(v345, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[5] = v344;
    v357[6] = @"GPU Energy";
    v343 = [MEMORY[0x1E4F929D8] sharedInstance];
    v342 = objc_msgSend(v343, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[6] = v342;
    v357[7] = @"DRAM Energy";
    v341 = [MEMORY[0x1E4F929D8] sharedInstance];
    v340 = objc_msgSend(v341, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[7] = v340;
    v357[8] = @"SoC Energy";
    v339 = [MEMORY[0x1E4F929D8] sharedInstance];
    v338 = objc_msgSend(v339, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[8] = v338;
    v357[9] = @"GPU";
    v337 = [MEMORY[0x1E4F929D8] sharedInstance];
    v336 = objc_msgSend(v337, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[9] = v336;
    v357[10] = @"ANE";
    v335 = [MEMORY[0x1E4F929D8] sharedInstance];
    v334 = objc_msgSend(v335, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[10] = v334;
    v357[11] = @"ISP";
    v333 = [MEMORY[0x1E4F929D8] sharedInstance];
    v332 = objc_msgSend(v333, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[11] = v332;
    v357[12] = @"AVE";
    v331 = [MEMORY[0x1E4F929D8] sharedInstance];
    v330 = objc_msgSend(v331, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[12] = v330;
    v357[13] = @"VDEC";
    v329 = [MEMORY[0x1E4F929D8] sharedInstance];
    v328 = objc_msgSend(v329, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[13] = v328;
    v357[14] = @"MSR";
    v327 = [MEMORY[0x1E4F929D8] sharedInstance];
    v326 = objc_msgSend(v327, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[14] = v326;
    v357[15] = @"DISP";
    v325 = [MEMORY[0x1E4F929D8] sharedInstance];
    v324 = objc_msgSend(v325, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[15] = v324;
    v357[16] = @"SOC_AON";
    v323 = [MEMORY[0x1E4F929D8] sharedInstance];
    v322 = objc_msgSend(v323, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[16] = v322;
    v357[17] = @"SOC_REST";
    v321 = [MEMORY[0x1E4F929D8] sharedInstance];
    v320 = objc_msgSend(v321, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[17] = v320;
    v357[18] = @"DCS";
    v319 = [MEMORY[0x1E4F929D8] sharedInstance];
    v318 = objc_msgSend(v319, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[18] = v318;
    v357[19] = @"DRAM";
    v317 = [MEMORY[0x1E4F929D8] sharedInstance];
    v316 = objc_msgSend(v317, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[19] = v316;
    v357[20] = @"GPU SRAM";
    v315 = [MEMORY[0x1E4F929D8] sharedInstance];
    v314 = objc_msgSend(v315, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[20] = v314;
    v357[21] = @"PCIe Port 1 Energy";
    v313 = [MEMORY[0x1E4F929D8] sharedInstance];
    v312 = objc_msgSend(v313, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[21] = v312;
    v357[22] = @"CPUDTL00";
    v311 = [MEMORY[0x1E4F929D8] sharedInstance];
    v310 = objc_msgSend(v311, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[22] = v310;
    v357[23] = @"CPUDTL01";
    v309 = [MEMORY[0x1E4F929D8] sharedInstance];
    v308 = objc_msgSend(v309, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[23] = v308;
    v357[24] = @"CPUDTL02";
    v307 = [MEMORY[0x1E4F929D8] sharedInstance];
    v306 = objc_msgSend(v307, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[24] = v306;
    v357[25] = @"CPUDTL03";
    v305 = [MEMORY[0x1E4F929D8] sharedInstance];
    v304 = objc_msgSend(v305, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[25] = v304;
    v357[26] = @"CPUDTL04";
    v303 = [MEMORY[0x1E4F929D8] sharedInstance];
    v302 = objc_msgSend(v303, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[26] = v302;
    v357[27] = @"CPUDTL05";
    v301 = [MEMORY[0x1E4F929D8] sharedInstance];
    v300 = objc_msgSend(v301, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[27] = v300;
    v357[28] = @"CPUDTL06";
    v299 = [MEMORY[0x1E4F929D8] sharedInstance];
    v298 = objc_msgSend(v299, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[28] = v298;
    v357[29] = @"CPUDTL07";
    v297 = [MEMORY[0x1E4F929D8] sharedInstance];
    v296 = objc_msgSend(v297, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[29] = v296;
    v357[30] = @"CPUDTL08";
    v295 = [MEMORY[0x1E4F929D8] sharedInstance];
    v294 = objc_msgSend(v295, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[30] = v294;
    v357[31] = @"CPUDTL09";
    v293 = [MEMORY[0x1E4F929D8] sharedInstance];
    v292 = objc_msgSend(v293, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[31] = v292;
    v357[32] = @"CPUDTL10";
    v291 = [MEMORY[0x1E4F929D8] sharedInstance];
    v290 = objc_msgSend(v291, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[32] = v290;
    v357[33] = @"CPUDTL11";
    v289 = [MEMORY[0x1E4F929D8] sharedInstance];
    v288 = objc_msgSend(v289, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[33] = v288;
    v357[34] = @"CPUDTL12";
    v287 = [MEMORY[0x1E4F929D8] sharedInstance];
    v286 = objc_msgSend(v287, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[34] = v286;
    v357[35] = @"CPUDTL13";
    v285 = [MEMORY[0x1E4F929D8] sharedInstance];
    v284 = objc_msgSend(v285, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[35] = v284;
    v357[36] = @"CPUDTL14";
    v283 = [MEMORY[0x1E4F929D8] sharedInstance];
    v282 = objc_msgSend(v283, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[36] = v282;
    v357[37] = @"CPUDTL15";
    v281 = [MEMORY[0x1E4F929D8] sharedInstance];
    v280 = objc_msgSend(v281, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[37] = v280;
    v357[38] = @"CPUDTL16";
    v279 = [MEMORY[0x1E4F929D8] sharedInstance];
    v278 = objc_msgSend(v279, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[38] = v278;
    v357[39] = @"CPUDTL17";
    v277 = [MEMORY[0x1E4F929D8] sharedInstance];
    v276 = objc_msgSend(v277, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[39] = v276;
    v357[40] = @"CPUDTL18";
    v275 = [MEMORY[0x1E4F929D8] sharedInstance];
    v274 = objc_msgSend(v275, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[40] = v274;
    v357[41] = @"CPUDTL19";
    v273 = [MEMORY[0x1E4F929D8] sharedInstance];
    v272 = objc_msgSend(v273, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[41] = v272;
    v357[42] = @"CPUDTL20";
    v271 = [MEMORY[0x1E4F929D8] sharedInstance];
    v270 = objc_msgSend(v271, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[42] = v270;
    v357[43] = @"CPUDTL21";
    v269 = [MEMORY[0x1E4F929D8] sharedInstance];
    v268 = objc_msgSend(v269, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[43] = v268;
    v357[44] = @"CPUDTL22";
    v267 = [MEMORY[0x1E4F929D8] sharedInstance];
    v266 = objc_msgSend(v267, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[44] = v266;
    v357[45] = @"CPUDTL23";
    v265 = [MEMORY[0x1E4F929D8] sharedInstance];
    v264 = objc_msgSend(v265, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[45] = v264;
    v357[46] = @"CPUDTL24";
    v263 = [MEMORY[0x1E4F929D8] sharedInstance];
    v262 = objc_msgSend(v263, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[46] = v262;
    v357[47] = @"CPUDTL25";
    v261 = [MEMORY[0x1E4F929D8] sharedInstance];
    v260 = objc_msgSend(v261, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[47] = v260;
    v357[48] = @"CPUDTL26";
    v259 = [MEMORY[0x1E4F929D8] sharedInstance];
    v258 = objc_msgSend(v259, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[48] = v258;
    v357[49] = @"CPUDTL27";
    v257 = [MEMORY[0x1E4F929D8] sharedInstance];
    v256 = objc_msgSend(v257, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[49] = v256;
    v357[50] = @"CPUDTL30";
    v255 = [MEMORY[0x1E4F929D8] sharedInstance];
    v254 = objc_msgSend(v255, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[50] = v254;
    v357[51] = @"CPUDTL31";
    v253 = [MEMORY[0x1E4F929D8] sharedInstance];
    v252 = objc_msgSend(v253, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[51] = v252;
    v357[52] = @"CPUDTL32";
    v251 = [MEMORY[0x1E4F929D8] sharedInstance];
    v250 = objc_msgSend(v251, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[52] = v250;
    v357[53] = @"CPUDTL33";
    v249 = [MEMORY[0x1E4F929D8] sharedInstance];
    v248 = objc_msgSend(v249, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[53] = v248;
    v357[54] = @"CPUDTL34";
    v247 = [MEMORY[0x1E4F929D8] sharedInstance];
    v246 = objc_msgSend(v247, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[54] = v246;
    v357[55] = @"CPUDTL35";
    v245 = [MEMORY[0x1E4F929D8] sharedInstance];
    v244 = objc_msgSend(v245, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[55] = v244;
    v357[56] = @"CPUDTL36";
    v243 = [MEMORY[0x1E4F929D8] sharedInstance];
    v242 = objc_msgSend(v243, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[56] = v242;
    v357[57] = @"CPUDTL37";
    v241 = [MEMORY[0x1E4F929D8] sharedInstance];
    v240 = objc_msgSend(v241, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[57] = v240;
    v357[58] = @"CPUDTL40";
    v239 = [MEMORY[0x1E4F929D8] sharedInstance];
    v238 = objc_msgSend(v239, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[58] = v238;
    v357[59] = @"CPUDTL41";
    v237 = [MEMORY[0x1E4F929D8] sharedInstance];
    v236 = objc_msgSend(v237, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[59] = v236;
    v357[60] = @"CPUDTL42";
    v235 = [MEMORY[0x1E4F929D8] sharedInstance];
    v234 = objc_msgSend(v235, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[60] = v234;
    v357[61] = @"CPUDTL43";
    v233 = [MEMORY[0x1E4F929D8] sharedInstance];
    v232 = objc_msgSend(v233, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[61] = v232;
    v357[62] = @"CPUDTL44";
    v231 = [MEMORY[0x1E4F929D8] sharedInstance];
    v230 = objc_msgSend(v231, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[62] = v230;
    v357[63] = @"CPUDTL45";
    v229 = [MEMORY[0x1E4F929D8] sharedInstance];
    v228 = objc_msgSend(v229, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[63] = v228;
    v357[64] = @"CPUDTL46";
    v227 = [MEMORY[0x1E4F929D8] sharedInstance];
    v226 = objc_msgSend(v227, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[64] = v226;
    v357[65] = @"CPUDTL47";
    v225 = [MEMORY[0x1E4F929D8] sharedInstance];
    v224 = objc_msgSend(v225, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[65] = v224;
    v357[66] = @"CPUDTL50";
    v223 = [MEMORY[0x1E4F929D8] sharedInstance];
    v222 = objc_msgSend(v223, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[66] = v222;
    v357[67] = @"CPUDTL51";
    v221 = [MEMORY[0x1E4F929D8] sharedInstance];
    v220 = objc_msgSend(v221, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[67] = v220;
    v357[68] = @"CPUDTL52";
    v219 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v218 = objc_msgSend(v219, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[68] = v218;
    v357[69] = @"CPUDTL53";
    uint64_t v217 = [MEMORY[0x1E4F929D8] sharedInstance];
    v216 = objc_msgSend(v217, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[69] = v216;
    v357[70] = @"CPUDTL54";
    v215 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v214 = objc_msgSend(v215, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[70] = v214;
    v357[71] = @"CPUDTL55";
    v213 = [MEMORY[0x1E4F929D8] sharedInstance];
    v212 = objc_msgSend(v213, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[71] = v212;
    v357[72] = @"CPUDTL56";
    v211 = [MEMORY[0x1E4F929D8] sharedInstance];
    v210 = objc_msgSend(v211, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[72] = v210;
    v357[73] = @"CPUDTL57";
    v209 = [MEMORY[0x1E4F929D8] sharedInstance];
    v208 = objc_msgSend(v209, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[73] = v208;
    v357[74] = @"PCPUDTL00";
    v207 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v206 = objc_msgSend(v207, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[74] = v206;
    v357[75] = @"PCPUDTL01";
    v205 = [MEMORY[0x1E4F929D8] sharedInstance];
    v204 = objc_msgSend(v205, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[75] = v204;
    v357[76] = @"PCPUDTL02";
    v203 = [MEMORY[0x1E4F929D8] sharedInstance];
    v202 = objc_msgSend(v203, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[76] = v202;
    v357[77] = @"PCPUDTL03";
    v201 = [MEMORY[0x1E4F929D8] sharedInstance];
    v200 = objc_msgSend(v201, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[77] = v200;
    v357[78] = @"PCPUDTL04";
    v199 = [MEMORY[0x1E4F929D8] sharedInstance];
    v198 = objc_msgSend(v199, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[78] = v198;
    v357[79] = @"PCPUDTL05";
    v197 = [MEMORY[0x1E4F929D8] sharedInstance];
    v196 = objc_msgSend(v197, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[79] = v196;
    v357[80] = @"PCPUDTL06";
    v195 = [MEMORY[0x1E4F929D8] sharedInstance];
    v194 = objc_msgSend(v195, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[80] = v194;
    v357[81] = @"PCPUDTL07";
    v193 = [MEMORY[0x1E4F929D8] sharedInstance];
    v192 = objc_msgSend(v193, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[81] = v192;
    v357[82] = @"PCPUDTL08";
    v191 = [MEMORY[0x1E4F929D8] sharedInstance];
    v190 = objc_msgSend(v191, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[82] = v190;
    v357[83] = @"PCPUDTL09";
    v189 = [MEMORY[0x1E4F929D8] sharedInstance];
    v188 = objc_msgSend(v189, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[83] = v188;
    v357[84] = @"PCPUDTL0a";
    v187 = [MEMORY[0x1E4F929D8] sharedInstance];
    v186 = objc_msgSend(v187, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[84] = v186;
    v357[85] = @"PCPUDTL0b";
    v185 = [MEMORY[0x1E4F929D8] sharedInstance];
    v184 = objc_msgSend(v185, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[85] = v184;
    v357[86] = @"PCPUDTL0c";
    v183 = [MEMORY[0x1E4F929D8] sharedInstance];
    v182 = objc_msgSend(v183, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[86] = v182;
    v357[87] = @"PCPUDTL0d";
    v181 = [MEMORY[0x1E4F929D8] sharedInstance];
    v180 = objc_msgSend(v181, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[87] = v180;
    v357[88] = @"PCPUDTL0e";
    v179 = [MEMORY[0x1E4F929D8] sharedInstance];
    v178 = objc_msgSend(v179, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[88] = v178;
    v357[89] = @"PCPUDTL0f";
    v177 = [MEMORY[0x1E4F929D8] sharedInstance];
    v176 = objc_msgSend(v177, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[89] = v176;
    v357[90] = @"PCPUDTL010";
    v175 = [MEMORY[0x1E4F929D8] sharedInstance];
    v174 = objc_msgSend(v175, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[90] = v174;
    v357[91] = @"PCPUDTL011";
    v173 = [MEMORY[0x1E4F929D8] sharedInstance];
    v172 = objc_msgSend(v173, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[91] = v172;
    v357[92] = @"PCPUDTL10";
    v171 = [MEMORY[0x1E4F929D8] sharedInstance];
    v170 = objc_msgSend(v171, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[92] = v170;
    v357[93] = @"PCPUDTL11";
    v169 = [MEMORY[0x1E4F929D8] sharedInstance];
    v168 = objc_msgSend(v169, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[93] = v168;
    v357[94] = @"PCPUDTL12";
    v167 = [MEMORY[0x1E4F929D8] sharedInstance];
    v166 = objc_msgSend(v167, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[94] = v166;
    v357[95] = @"PCPUDTL13";
    v165 = [MEMORY[0x1E4F929D8] sharedInstance];
    v164 = objc_msgSend(v165, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[95] = v164;
    v357[96] = @"PCPUDTL14";
    v163 = [MEMORY[0x1E4F929D8] sharedInstance];
    v162 = objc_msgSend(v163, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[96] = v162;
    v357[97] = @"PCPUDTL15";
    v161 = [MEMORY[0x1E4F929D8] sharedInstance];
    v160 = objc_msgSend(v161, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[97] = v160;
    v357[98] = @"PCPUDTL16";
    v159 = [MEMORY[0x1E4F929D8] sharedInstance];
    v158 = objc_msgSend(v159, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[98] = v158;
    v357[99] = @"PCPUDTL17";
    v157 = [MEMORY[0x1E4F929D8] sharedInstance];
    v156 = objc_msgSend(v157, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[99] = v156;
    v357[100] = @"PCPUDTL18";
    v155 = [MEMORY[0x1E4F929D8] sharedInstance];
    v154 = objc_msgSend(v155, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[100] = v154;
    v357[101] = @"PCPUDTL19";
    v153 = [MEMORY[0x1E4F929D8] sharedInstance];
    v152 = objc_msgSend(v153, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[101] = v152;
    v357[102] = @"PCPUDTL1a";
    v151 = [MEMORY[0x1E4F929D8] sharedInstance];
    v150 = objc_msgSend(v151, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[102] = v150;
    v357[103] = @"PCPUDTL1b";
    v149 = [MEMORY[0x1E4F929D8] sharedInstance];
    v148 = objc_msgSend(v149, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[103] = v148;
    v357[104] = @"PCPUDTL1c";
    v147 = [MEMORY[0x1E4F929D8] sharedInstance];
    v146 = objc_msgSend(v147, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[104] = v146;
    v357[105] = @"PCPUDTL1d";
    v145 = [MEMORY[0x1E4F929D8] sharedInstance];
    v144 = objc_msgSend(v145, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[105] = v144;
    v357[106] = @"PCPUDTL1e";
    v143 = [MEMORY[0x1E4F929D8] sharedInstance];
    v142 = objc_msgSend(v143, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[106] = v142;
    v357[107] = @"PCPUDTL1f";
    v141 = [MEMORY[0x1E4F929D8] sharedInstance];
    v140 = objc_msgSend(v141, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[107] = v140;
    v357[108] = @"PCPUDTL110";
    v139 = [MEMORY[0x1E4F929D8] sharedInstance];
    v138 = objc_msgSend(v139, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[108] = v138;
    v357[109] = @"PCPUDTL111";
    v137 = [MEMORY[0x1E4F929D8] sharedInstance];
    v136 = objc_msgSend(v137, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[109] = v136;
    v357[110] = @"PCPUDTL20";
    v135 = [MEMORY[0x1E4F929D8] sharedInstance];
    v134 = objc_msgSend(v135, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[110] = v134;
    v357[111] = @"PCPUDTL21";
    v133 = [MEMORY[0x1E4F929D8] sharedInstance];
    v132 = objc_msgSend(v133, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[111] = v132;
    v357[112] = @"PCPUDTL22";
    v131 = [MEMORY[0x1E4F929D8] sharedInstance];
    v130 = objc_msgSend(v131, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[112] = v130;
    v357[113] = @"PCPUDTL23";
    v129 = [MEMORY[0x1E4F929D8] sharedInstance];
    v128 = objc_msgSend(v129, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[113] = v128;
    v357[114] = @"PCPUDTL24";
    uint64_t v127 = [MEMORY[0x1E4F929D8] sharedInstance];
    v126 = objc_msgSend(v127, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[114] = v126;
    v357[115] = @"PCPUDTL25";
    v125 = [MEMORY[0x1E4F929D8] sharedInstance];
    v124 = objc_msgSend(v125, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[115] = v124;
    v357[116] = @"PCPUDTL26";
    v123 = [MEMORY[0x1E4F929D8] sharedInstance];
    v122 = objc_msgSend(v123, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[116] = v122;
    v357[117] = @"PCPUDTL27";
    long long v121 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v120 = objc_msgSend(v121, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[117] = v120;
    v357[118] = @"PCPUDTL28";
    long long v119 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v118 = objc_msgSend(v119, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[118] = v118;
    v357[119] = @"PCPUDTL29";
    v117 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v116 = objc_msgSend(v117, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[119] = v116;
    v357[120] = @"PCPUDTL2a";
    long long v115 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v114 = objc_msgSend(v115, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[120] = v114;
    v357[121] = @"PCPUDTL2b";
    long long v113 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v112 = objc_msgSend(v113, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[121] = v112;
    v357[122] = @"PCPUDTL2c";
    long long v111 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v110 = objc_msgSend(v111, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[122] = v110;
    v357[123] = @"PCPUDTL2d";
    long long v109 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v108 = objc_msgSend(v109, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[123] = v108;
    v357[124] = @"PCPUDTL2e";
    v107 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v106 = objc_msgSend(v107, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[124] = v106;
    v357[125] = @"PCPUDTL2f";
    v105 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v104 = objc_msgSend(v105, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[125] = v104;
    v357[126] = @"PCPUDTL210";
    uint64_t v103 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v102 = objc_msgSend(v103, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[126] = v102;
    v357[127] = @"PCPUDTL211";
    v101 = [MEMORY[0x1E4F929D8] sharedInstance];
    v100 = objc_msgSend(v101, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[127] = v100;
    v357[128] = @"PCPUDTL30";
    v99 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v98 = objc_msgSend(v99, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[128] = v98;
    v357[129] = @"PCPUDTL31";
    id v97 = [MEMORY[0x1E4F929D8] sharedInstance];
    v96 = objc_msgSend(v97, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[129] = v96;
    v357[130] = @"PCPUDTL32";
    id v95 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v94 = objc_msgSend(v95, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[130] = v94;
    v357[131] = @"PCPUDTL33";
    v93 = [MEMORY[0x1E4F929D8] sharedInstance];
    v92 = objc_msgSend(v93, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[131] = v92;
    v357[132] = @"PCPUDTL34";
    uint64_t v91 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v90 = objc_msgSend(v91, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[132] = v90;
    v357[133] = @"PCPUDTL35";
    v89 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v88 = objc_msgSend(v89, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[133] = v88;
    v357[134] = @"PCPUDTL36";
    v87 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v86 = objc_msgSend(v87, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[134] = v86;
    v357[135] = @"PCPUDTL37";
    v85 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v84 = objc_msgSend(v85, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[135] = v84;
    v357[136] = @"PCPUDTL38";
    int v83 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v82 = objc_msgSend(v83, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[136] = v82;
    v357[137] = @"PCPUDTL39";
    char v81 = [MEMORY[0x1E4F929D8] sharedInstance];
    v80 = objc_msgSend(v81, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[137] = v80;
    v357[138] = @"PCPUDTL3a";
    uint64_t v79 = [MEMORY[0x1E4F929D8] sharedInstance];
    v78 = objc_msgSend(v79, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[138] = v78;
    v357[139] = @"PCPUDTL3b";
    uint64_t v77 = [MEMORY[0x1E4F929D8] sharedInstance];
    v76 = objc_msgSend(v77, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[139] = v76;
    v357[140] = @"PCPUDTL3c";
    uint64_t v75 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v74 = objc_msgSend(v75, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[140] = v74;
    v357[141] = @"PCPUDTL3d";
    uint64_t v73 = [MEMORY[0x1E4F929D8] sharedInstance];
    v72 = objc_msgSend(v73, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[141] = v72;
    v357[142] = @"PCPUDTL3e";
    uint64_t v71 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v70 = objc_msgSend(v71, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[142] = v70;
    v357[143] = @"PCPUDTL3f";
    uint64_t v69 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v68 = objc_msgSend(v69, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[143] = v68;
    v357[144] = @"PCPUDTL310";
    uint64_t v67 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[144] = v66;
    v357[145] = @"ECPU0";
    uint64_t v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[145] = v64;
    v357[146] = @"ECPU1";
    id v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[146] = v62;
    v357[147] = @"ECPU2";
    double v61 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v60 = objc_msgSend(v61, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[147] = v60;
    v357[148] = @"ECPU3";
    uint64_t v59 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[148] = v58;
    v357[149] = @"ECPU4";
    v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[149] = v56;
    v357[150] = @"ECPU5";
    v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[150] = v54;
    v357[151] = @"PCPU0";
    uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[151] = v52;
    v357[152] = @"PCPU1";
    double v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[152] = v50;
    v357[153] = @"PCPU2";
    v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[153] = v48;
    v357[154] = @"PCPU3";
    double v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[154] = v46;
    v357[155] = @"ECPM";
    uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[155] = v44;
    v357[156] = @"PCPM";
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[156] = v42;
    v357[157] = @"ECPU";
    double v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[157] = v40;
    v357[158] = @"PCPU";
    v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[158] = v38;
    v357[159] = @"ECPM_SRAM";
    double v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[159] = v36;
    v357[160] = @"ECPU0_SRAM";
    id v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[160] = v34;
    v357[161] = @"ECPU1_SRAM";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[161] = v32;
    v357[162] = @"ECPU2_SRAM";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[162] = v30;
    v357[163] = @"ECPU3_SRAM";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[163] = v28;
    v357[164] = @"ECPU4_SRAM";
    double v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[164] = v26;
    v357[165] = @"ECPU5_SRAM";
    double v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[165] = v24;
    v357[166] = @"PCIe Port 0 Energy";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[166] = v22;
    v357[167] = @"PCIe Port 2 Energy";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[167] = v20;
    v357[168] = @"PCPM_SRAM";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[168] = v18;
    v357[169] = @"PCPU0_SRAM";
    id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[169] = v16;
    v357[170] = @"PCPU1_SRAM";
    id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[170] = v14;
    v357[171] = @"PCPU2_SRAM";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[171] = v4;
    v357[172] = @"PCPU3_SRAM";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[172] = v6;
    v357[173] = @"DISPEXT";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[173] = v8;
    v357[174] = @"AMCC";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat_withUnit_mJ");
    v358[174] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v358 forKeys:v357 count:175];
    v362[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v362 forKeys:v361 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionPMPEnergyCounters
{
  v70[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v69[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v67[0] = *MEMORY[0x1E4F92CD0];
    v67[1] = v2;
    v68[0] = &unk_1F29F0790;
    v68[1] = @"logEventBackwardIOReport";
    v67[2] = *MEMORY[0x1E4F92C60];
    v68[2] = MEMORY[0x1E4F1CC28];
    uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:3];
    v70[0] = v64;
    v69[1] = *MEMORY[0x1E4F92CA8];
    v65[0] = @"SampleTime";
    id v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v62 = objc_msgSend(v63, "commonTypeDict_RealFormat_withUnit_s");
    v66[0] = v62;
    v65[1] = @"DRAM";
    double v61 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v60 = objc_msgSend(v61, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[1] = v60;
    v65[2] = @"DISP";
    uint64_t v59 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v58 = objc_msgSend(v59, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[2] = v58;
    v65[3] = @"SOC_AON";
    v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[3] = v56;
    v65[4] = @"SOC_REST";
    v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v54 = objc_msgSend(v55, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[4] = v54;
    v65[5] = @"ECPU";
    uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v52 = objc_msgSend(v53, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[5] = v52;
    v65[6] = @"PCPU";
    double v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v50 = objc_msgSend(v51, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[6] = v50;
    v65[7] = @"ECPM";
    v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v49, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[7] = v48;
    v65[8] = @"PCPM";
    double v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[8] = v46;
    v65[9] = @"ISP";
    uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[9] = v44;
    v65[10] = @"VENC";
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[10] = v42;
    v65[11] = @"VDEC";
    double v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[11] = v40;
    v65[12] = @"MSR";
    v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v38 = objc_msgSend(v39, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[12] = v38;
    v65[13] = @"DCS";
    double v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[13] = v36;
    v65[14] = @"ANE";
    id v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[14] = v34;
    v65[15] = @"ECORE0";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[15] = v32;
    v65[16] = @"ECORE1";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[16] = v30;
    v65[17] = @"ECORE2";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v28 = objc_msgSend(v29, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[17] = v28;
    v65[18] = @"ECORE3";
    double v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v26 = objc_msgSend(v27, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[18] = v26;
    v65[19] = @"PCORE0";
    double v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[19] = v24;
    v65[20] = @"PCORE1";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v22 = objc_msgSend(v23, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[20] = v22;
    v65[21] = @"PCORE2";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[21] = v20;
    v65[22] = @"PCORE3";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[22] = v18;
    v65[23] = @"DISP0";
    id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v16 = objc_msgSend(v17, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[23] = v16;
    v65[24] = @"DISPX";
    id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[24] = v14;
    v65[25] = @"BAT";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[25] = v4;
    v65[26] = @"GPU";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[26] = v6;
    v65[27] = @"AVE";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[27] = v8;
    v65[28] = @"GPU SRAM";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat_withUnit_mJ");
    v66[28] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:29];
    v70[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionPMPPerfDrivers
{
  if (+[PLIOReportAgent shouldLogSoCStats]) {
    [MEMORY[0x1E4F92A38] isWatch];
  }
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitionSocStatsDvdStats
{
  v39[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v38[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v36[0] = *MEMORY[0x1E4F92CD0];
    v36[1] = v2;
    v37[0] = &unk_1F29F06F0;
    v37[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v36[2] = *MEMORY[0x1E4F92C60];
    v36[3] = v3;
    v37[2] = MEMORY[0x1E4F1CC28];
    v37[3] = MEMORY[0x1E4F1CC38];
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:4];
    v39[0] = v33;
    v38[1] = *MEMORY[0x1E4F92CA8];
    v34[0] = @"SampleTime";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_RealFormat_withUnit_s");
    v35[0] = v31;
    v34[1] = @"DVD States_0-9%";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v35[1] = v29;
    v34[2] = @"DVD States_10-19%";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_RealFormat");
    void v35[2] = v27;
    void v34[3] = @"DVD States_20-29%";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v35[3] = v25;
    void v34[4] = @"DVD States_30-39%";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_RealFormat");
    void v35[4] = v23;
    v34[5] = @"DVD States_40-49%";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v35[5] = v21;
    v34[6] = @"DVD States_50-59%";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
    v35[6] = v19;
    v34[7] = @"DVD States_60-69%";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v35[7] = v17;
    v34[8] = @"DVD States_70-79%";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_RealFormat");
    v35[8] = v15;
    v34[9] = @"DVD States_80-89%";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v35[9] = v5;
    v34[10] = @"DVD States_90-99%";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    v35[10] = v7;
    v34[11] = @"DVD States_100%";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v35[11] = v9;
    v34[12] = @"DVD States_Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v35[12] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:13];
    v39[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionAMCStatsPerfCounters
{
  v443[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v442[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v440[0] = *MEMORY[0x1E4F92CD0];
    v440[1] = v2;
    v441[0] = &unk_1F29F07A0;
    v441[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v440[2] = *MEMORY[0x1E4F92C60];
    v440[3] = v3;
    v441[2] = MEMORY[0x1E4F1CC28];
    v441[3] = MEMORY[0x1E4F1CC38];
    v437 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v441 forKeys:v440 count:4];
    v443[0] = v437;
    v442[1] = *MEMORY[0x1E4F92CA8];
    v438[0] = @"SampleTime";
    v436 = [MEMORY[0x1E4F929D8] sharedInstance];
    v435 = objc_msgSend(v436, "commonTypeDict_RealFormat_withUnit_s");
    v439[0] = v435;
    v438[1] = @"APWakeTime";
    v434 = [MEMORY[0x1E4F929D8] sharedInstance];
    v433 = objc_msgSend(v434, "commonTypeDict_RealFormat_withUnit_s");
    v439[1] = v433;
    v438[2] = @"ATC0 RD";
    v432 = [MEMORY[0x1E4F929D8] sharedInstance];
    v431 = objc_msgSend(v432, "commonTypeDict_IntegerFormat");
    v439[2] = v431;
    v438[3] = @"ATC0 WR";
    v430 = [MEMORY[0x1E4F929D8] sharedInstance];
    v429 = objc_msgSend(v430, "commonTypeDict_IntegerFormat");
    v439[3] = v429;
    v438[4] = @"ATC0 DCS RD";
    v428 = [MEMORY[0x1E4F929D8] sharedInstance];
    v427 = objc_msgSend(v428, "commonTypeDict_IntegerFormat");
    v439[4] = v427;
    v438[5] = @"ATC0 DCS WR";
    v426 = [MEMORY[0x1E4F929D8] sharedInstance];
    v425 = objc_msgSend(v426, "commonTypeDict_IntegerFormat");
    v439[5] = v425;
    v438[6] = @"ATC1 RD";
    v424 = [MEMORY[0x1E4F929D8] sharedInstance];
    v423 = objc_msgSend(v424, "commonTypeDict_IntegerFormat");
    v439[6] = v423;
    v438[7] = @"ATC1 WR";
    v422 = [MEMORY[0x1E4F929D8] sharedInstance];
    v421 = objc_msgSend(v422, "commonTypeDict_IntegerFormat");
    v439[7] = v421;
    v438[8] = @"ATC1 NRO RD";
    v420 = [MEMORY[0x1E4F929D8] sharedInstance];
    v419 = objc_msgSend(v420, "commonTypeDict_IntegerFormat");
    v439[8] = v419;
    v438[9] = @"ATC1 NRO WR";
    v418 = [MEMORY[0x1E4F929D8] sharedInstance];
    v417 = objc_msgSend(v418, "commonTypeDict_IntegerFormat");
    v439[9] = v417;
    v438[10] = @"ATC1 DCS RD";
    v416 = [MEMORY[0x1E4F929D8] sharedInstance];
    v415 = objc_msgSend(v416, "commonTypeDict_IntegerFormat");
    v439[10] = v415;
    v438[11] = @"ATC1 DCS WR";
    v414 = [MEMORY[0x1E4F929D8] sharedInstance];
    v413 = objc_msgSend(v414, "commonTypeDict_IntegerFormat");
    v439[11] = v413;
    v438[12] = @"ATC2 RD";
    v412 = [MEMORY[0x1E4F929D8] sharedInstance];
    v411 = objc_msgSend(v412, "commonTypeDict_IntegerFormat");
    v439[12] = v411;
    v438[13] = @"ATC2 WR";
    v410 = [MEMORY[0x1E4F929D8] sharedInstance];
    v409 = objc_msgSend(v410, "commonTypeDict_IntegerFormat");
    v439[13] = v409;
    v438[14] = @"ATC2 DCS RD";
    v408 = [MEMORY[0x1E4F929D8] sharedInstance];
    v407 = objc_msgSend(v408, "commonTypeDict_IntegerFormat");
    v439[14] = v407;
    v438[15] = @"ATC2 DCS WR";
    v406 = [MEMORY[0x1E4F929D8] sharedInstance];
    v405 = objc_msgSend(v406, "commonTypeDict_IntegerFormat");
    v439[15] = v405;
    v438[16] = @"ATC3 RD";
    v404 = [MEMORY[0x1E4F929D8] sharedInstance];
    v403 = objc_msgSend(v404, "commonTypeDict_IntegerFormat");
    v439[16] = v403;
    v438[17] = @"ATC3 WR";
    v402 = [MEMORY[0x1E4F929D8] sharedInstance];
    v401 = objc_msgSend(v402, "commonTypeDict_IntegerFormat");
    v439[17] = v401;
    v438[18] = @"ATC3 DCS RD";
    v400 = [MEMORY[0x1E4F929D8] sharedInstance];
    v399 = objc_msgSend(v400, "commonTypeDict_IntegerFormat");
    v439[18] = v399;
    v438[19] = @"ATC3 DCS WR";
    v398 = [MEMORY[0x1E4F929D8] sharedInstance];
    v397 = objc_msgSend(v398, "commonTypeDict_IntegerFormat");
    v439[19] = v397;
    v438[20] = @"Bandwidth";
    v396 = [MEMORY[0x1E4F929D8] sharedInstance];
    v395 = objc_msgSend(v396, "commonTypeDict_IntegerFormat");
    v439[20] = v395;
    v438[21] = @"Fabric Bandwidth";
    v394 = [MEMORY[0x1E4F929D8] sharedInstance];
    v393 = objc_msgSend(v394, "commonTypeDict_IntegerFormat");
    v439[21] = v393;
    v438[22] = @"AMCC CPU Read";
    v392 = [MEMORY[0x1E4F929D8] sharedInstance];
    v391 = objc_msgSend(v392, "commonTypeDict_IntegerFormat");
    v439[22] = v391;
    v438[23] = @"AMCC CPU Write";
    v390 = [MEMORY[0x1E4F929D8] sharedInstance];
    v389 = objc_msgSend(v390, "commonTypeDict_IntegerFormat");
    v439[23] = v389;
    v438[24] = @"AMCC ANS Read";
    v388 = [MEMORY[0x1E4F929D8] sharedInstance];
    v387 = objc_msgSend(v388, "commonTypeDict_IntegerFormat");
    v439[24] = v387;
    v438[25] = @"AMCC ANS Write";
    v386 = [MEMORY[0x1E4F929D8] sharedInstance];
    v385 = objc_msgSend(v386, "commonTypeDict_IntegerFormat");
    v439[25] = v385;
    v438[26] = @"AMCC ISP BW";
    v384 = [MEMORY[0x1E4F929D8] sharedInstance];
    v383 = objc_msgSend(v384, "commonTypeDict_IntegerFormat");
    v439[26] = v383;
    v438[27] = @"AMCC Media BW";
    v382 = [MEMORY[0x1E4F929D8] sharedInstance];
    v381 = objc_msgSend(v382, "commonTypeDict_IntegerFormat");
    v439[27] = v381;
    v438[28] = @"AMCX Memory Bandwidth";
    v380 = [MEMORY[0x1E4F929D8] sharedInstance];
    v379 = objc_msgSend(v380, "commonTypeDict_IntegerFormat");
    v439[28] = v379;
    v438[29] = @"AMCX CAS Count";
    v378 = [MEMORY[0x1E4F929D8] sharedInstance];
    v377 = objc_msgSend(v378, "commonTypeDict_IntegerFormat");
    v439[29] = v377;
    v438[30] = @"AMCX RAS Count";
    v376 = [MEMORY[0x1E4F929D8] sharedInstance];
    v375 = objc_msgSend(v376, "commonTypeDict_IntegerFormat");
    v439[30] = v375;
    v438[31] = @"AMCX SlfRfr Cycles";
    v374 = [MEMORY[0x1E4F929D8] sharedInstance];
    v373 = objc_msgSend(v374, "commonTypeDict_IntegerFormat");
    v439[31] = v373;
    v438[32] = @"AMCX SlfRfr Entries";
    v372 = [MEMORY[0x1E4F929D8] sharedInstance];
    v371 = objc_msgSend(v372, "commonTypeDict_IntegerFormat");
    v439[32] = v371;
    v438[33] = @"ANE DCS";
    v370 = [MEMORY[0x1E4F929D8] sharedInstance];
    v369 = objc_msgSend(v370, "commonTypeDict_IntegerFormat");
    v439[33] = v369;
    v438[34] = @"ANE RD";
    v368 = [MEMORY[0x1E4F929D8] sharedInstance];
    v367 = objc_msgSend(v368, "commonTypeDict_IntegerFormat");
    v439[34] = v367;
    v438[35] = @"ANE WR";
    v366 = [MEMORY[0x1E4F929D8] sharedInstance];
    v365 = objc_msgSend(v366, "commonTypeDict_IntegerFormat");
    v439[35] = v365;
    v438[36] = @"CPU DCS";
    v364 = [MEMORY[0x1E4F929D8] sharedInstance];
    v363 = objc_msgSend(v364, "commonTypeDict_IntegerFormat");
    v439[36] = v363;
    v438[37] = @"CPU RD";
    v362 = [MEMORY[0x1E4F929D8] sharedInstance];
    v361 = objc_msgSend(v362, "commonTypeDict_IntegerFormat");
    v439[37] = v361;
    v438[38] = @"CPU WR";
    v360 = [MEMORY[0x1E4F929D8] sharedInstance];
    v359 = objc_msgSend(v360, "commonTypeDict_IntegerFormat");
    v439[38] = v359;
    v438[39] = @"DCS";
    v358 = [MEMORY[0x1E4F929D8] sharedInstance];
    v357 = objc_msgSend(v358, "commonTypeDict_IntegerFormat");
    v439[39] = v357;
    v438[40] = @"DCS CAS";
    v356 = [MEMORY[0x1E4F929D8] sharedInstance];
    v355 = objc_msgSend(v356, "commonTypeDict_IntegerFormat");
    v439[40] = v355;
    v438[41] = @"DCS PD ENTRIES";
    v354 = [MEMORY[0x1E4F929D8] sharedInstance];
    v353 = objc_msgSend(v354, "commonTypeDict_IntegerFormat");
    v439[41] = v353;
    v438[42] = @"DCS RAS";
    v352 = [MEMORY[0x1E4F929D8] sharedInstance];
    v351 = objc_msgSend(v352, "commonTypeDict_IntegerFormat");
    v439[42] = v351;
    v438[43] = @"DCS RD";
    v350 = [MEMORY[0x1E4F929D8] sharedInstance];
    v349 = objc_msgSend(v350, "commonTypeDict_IntegerFormat");
    v439[43] = v349;
    v438[44] = @"DCS SR ENTRIES";
    v348 = [MEMORY[0x1E4F929D8] sharedInstance];
    v347 = objc_msgSend(v348, "commonTypeDict_IntegerFormat");
    v439[44] = v347;
    v438[45] = @"DCS WR";
    v346 = [MEMORY[0x1E4F929D8] sharedInstance];
    v345 = objc_msgSend(v346, "commonTypeDict_IntegerFormat");
    v439[45] = v345;
    v438[46] = @"DISP DCS";
    v344 = [MEMORY[0x1E4F929D8] sharedInstance];
    v343 = objc_msgSend(v344, "commonTypeDict_IntegerFormat");
    v439[46] = v343;
    v438[47] = @"DISP RD";
    v342 = [MEMORY[0x1E4F929D8] sharedInstance];
    v341 = objc_msgSend(v342, "commonTypeDict_IntegerFormat");
    v439[47] = v341;
    v438[48] = @"DISP WR";
    v340 = [MEMORY[0x1E4F929D8] sharedInstance];
    v339 = objc_msgSend(v340, "commonTypeDict_IntegerFormat");
    v439[48] = v339;
    v438[49] = @"DISPDFR RD";
    v338 = [MEMORY[0x1E4F929D8] sharedInstance];
    v337 = objc_msgSend(v338, "commonTypeDict_IntegerFormat");
    v439[49] = v337;
    v438[50] = @"DISPDFR WR";
    v336 = [MEMORY[0x1E4F929D8] sharedInstance];
    v335 = objc_msgSend(v336, "commonTypeDict_IntegerFormat");
    v439[50] = v335;
    v438[51] = @"DFR DCS RD";
    v334 = [MEMORY[0x1E4F929D8] sharedInstance];
    v333 = objc_msgSend(v334, "commonTypeDict_IntegerFormat");
    v439[51] = v333;
    v438[52] = @"DFR DCS WR";
    v332 = [MEMORY[0x1E4F929D8] sharedInstance];
    v331 = objc_msgSend(v332, "commonTypeDict_IntegerFormat");
    v439[52] = v331;
    v438[53] = @"GFX DCS";
    v330 = [MEMORY[0x1E4F929D8] sharedInstance];
    v329 = objc_msgSend(v330, "commonTypeDict_IntegerFormat");
    v439[53] = v329;
    v438[54] = @"GFX RD";
    v328 = [MEMORY[0x1E4F929D8] sharedInstance];
    v327 = objc_msgSend(v328, "commonTypeDict_IntegerFormat");
    v439[54] = v327;
    v438[55] = @"GFX WR";
    v326 = [MEMORY[0x1E4F929D8] sharedInstance];
    v325 = objc_msgSend(v326, "commonTypeDict_IntegerFormat");
    v439[55] = v325;
    v438[56] = @"GFX1 RD";
    v324 = [MEMORY[0x1E4F929D8] sharedInstance];
    v323 = objc_msgSend(v324, "commonTypeDict_IntegerFormat");
    v439[56] = v323;
    v438[57] = @"GFX1 WR";
    v322 = [MEMORY[0x1E4F929D8] sharedInstance];
    v321 = objc_msgSend(v322, "commonTypeDict_IntegerFormat");
    v439[57] = v321;
    v438[58] = @"ISP DCS";
    v320 = [MEMORY[0x1E4F929D8] sharedInstance];
    v319 = objc_msgSend(v320, "commonTypeDict_IntegerFormat");
    v439[58] = v319;
    v438[59] = @"ISP RD";
    v318 = [MEMORY[0x1E4F929D8] sharedInstance];
    v317 = objc_msgSend(v318, "commonTypeDict_IntegerFormat");
    v439[59] = v317;
    v438[60] = @"ISP WR";
    v316 = [MEMORY[0x1E4F929D8] sharedInstance];
    v315 = objc_msgSend(v316, "commonTypeDict_IntegerFormat");
    v439[60] = v315;
    v438[61] = @"JPG RD";
    v314 = [MEMORY[0x1E4F929D8] sharedInstance];
    v313 = objc_msgSend(v314, "commonTypeDict_IntegerFormat");
    v439[61] = v313;
    v438[62] = @"JPG WR";
    v312 = [MEMORY[0x1E4F929D8] sharedInstance];
    v311 = objc_msgSend(v312, "commonTypeDict_IntegerFormat");
    v439[62] = v311;
    v438[63] = @"MSR DCS";
    v310 = [MEMORY[0x1E4F929D8] sharedInstance];
    v309 = objc_msgSend(v310, "commonTypeDict_IntegerFormat");
    v439[63] = v309;
    v438[64] = @"MSR RD";
    v308 = [MEMORY[0x1E4F929D8] sharedInstance];
    v307 = objc_msgSend(v308, "commonTypeDict_IntegerFormat");
    v439[64] = v307;
    v438[65] = @"MSR WR";
    v306 = [MEMORY[0x1E4F929D8] sharedInstance];
    v305 = objc_msgSend(v306, "commonTypeDict_IntegerFormat");
    v439[65] = v305;
    v438[66] = @"PCIE RD";
    v304 = [MEMORY[0x1E4F929D8] sharedInstance];
    v303 = objc_msgSend(v304, "commonTypeDict_IntegerFormat");
    v439[66] = v303;
    v438[67] = @"PCIE WR";
    v302 = [MEMORY[0x1E4F929D8] sharedInstance];
    v301 = objc_msgSend(v302, "commonTypeDict_IntegerFormat");
    v439[67] = v301;
    v438[68] = @"SBR RD";
    v300 = [MEMORY[0x1E4F929D8] sharedInstance];
    v299 = objc_msgSend(v300, "commonTypeDict_IntegerFormat");
    v439[68] = v299;
    v438[69] = @"SBR WR";
    v298 = [MEMORY[0x1E4F929D8] sharedInstance];
    v297 = objc_msgSend(v298, "commonTypeDict_IntegerFormat");
    v439[69] = v297;
    v438[70] = @"SEP RD";
    v296 = [MEMORY[0x1E4F929D8] sharedInstance];
    v295 = objc_msgSend(v296, "commonTypeDict_IntegerFormat");
    v439[70] = v295;
    v438[71] = @"SEP WR";
    v294 = [MEMORY[0x1E4F929D8] sharedInstance];
    v293 = objc_msgSend(v294, "commonTypeDict_IntegerFormat");
    v439[71] = v293;
    v438[72] = @"SOC RD";
    v292 = [MEMORY[0x1E4F929D8] sharedInstance];
    v291 = objc_msgSend(v292, "commonTypeDict_IntegerFormat");
    v439[72] = v291;
    v438[73] = @"SOC WR";
    v290 = [MEMORY[0x1E4F929D8] sharedInstance];
    v289 = objc_msgSend(v290, "commonTypeDict_IntegerFormat");
    v439[73] = v289;
    v438[74] = @"VDEC DCS";
    v288 = [MEMORY[0x1E4F929D8] sharedInstance];
    v287 = objc_msgSend(v288, "commonTypeDict_IntegerFormat");
    v439[74] = v287;
    v438[75] = @"VDEC RD";
    v286 = [MEMORY[0x1E4F929D8] sharedInstance];
    v285 = objc_msgSend(v286, "commonTypeDict_IntegerFormat");
    v439[75] = v285;
    v438[76] = @"VDEC WR";
    v284 = [MEMORY[0x1E4F929D8] sharedInstance];
    v283 = objc_msgSend(v284, "commonTypeDict_IntegerFormat");
    v439[76] = v283;
    v438[77] = @"VENC DCS";
    v282 = [MEMORY[0x1E4F929D8] sharedInstance];
    v281 = objc_msgSend(v282, "commonTypeDict_IntegerFormat");
    v439[77] = v281;
    v438[78] = @"VENC RD";
    v280 = [MEMORY[0x1E4F929D8] sharedInstance];
    v279 = objc_msgSend(v280, "commonTypeDict_IntegerFormat");
    v439[78] = v279;
    v438[79] = @"VENC WR";
    v278 = [MEMORY[0x1E4F929D8] sharedInstance];
    v277 = objc_msgSend(v278, "commonTypeDict_IntegerFormat");
    v439[79] = v277;
    v438[80] = @"DISPEXT RD";
    v276 = [MEMORY[0x1E4F929D8] sharedInstance];
    v275 = objc_msgSend(v276, "commonTypeDict_IntegerFormat");
    v439[80] = v275;
    v438[81] = @"DISPEXT WR";
    v274 = [MEMORY[0x1E4F929D8] sharedInstance];
    v273 = objc_msgSend(v274, "commonTypeDict_IntegerFormat");
    v439[81] = v273;
    v438[82] = @"USB RD";
    v272 = [MEMORY[0x1E4F929D8] sharedInstance];
    v271 = objc_msgSend(v272, "commonTypeDict_IntegerFormat");
    v439[82] = v271;
    v438[83] = @"USB WR";
    v270 = [MEMORY[0x1E4F929D8] sharedInstance];
    v269 = objc_msgSend(v270, "commonTypeDict_IntegerFormat");
    v439[83] = v269;
    v438[84] = @"ANE DCS RD";
    v268 = [MEMORY[0x1E4F929D8] sharedInstance];
    v267 = objc_msgSend(v268, "commonTypeDict_IntegerFormat");
    v439[84] = v267;
    v438[85] = @"ANE DCS WR";
    v266 = [MEMORY[0x1E4F929D8] sharedInstance];
    v265 = objc_msgSend(v266, "commonTypeDict_IntegerFormat");
    v439[85] = v265;
    v438[86] = @"ANS2 DCS RD";
    v264 = [MEMORY[0x1E4F929D8] sharedInstance];
    v263 = objc_msgSend(v264, "commonTypeDict_IntegerFormat");
    v439[86] = v263;
    v438[87] = @"ANS2 DCS WR";
    v262 = [MEMORY[0x1E4F929D8] sharedInstance];
    v261 = objc_msgSend(v262, "commonTypeDict_IntegerFormat");
    v439[87] = v261;
    v438[88] = @"ANS2 RD";
    v260 = [MEMORY[0x1E4F929D8] sharedInstance];
    v259 = objc_msgSend(v260, "commonTypeDict_IntegerFormat");
    v439[88] = v259;
    v438[89] = @"ANS2 WR";
    v258 = [MEMORY[0x1E4F929D8] sharedInstance];
    v257 = objc_msgSend(v258, "commonTypeDict_IntegerFormat");
    v439[89] = v257;
    v438[90] = @"DCS PD CYCLES";
    v256 = [MEMORY[0x1E4F929D8] sharedInstance];
    v255 = objc_msgSend(v256, "commonTypeDict_IntegerFormat");
    v439[90] = v255;
    v438[91] = @"DCS SR CYCLES";
    v254 = [MEMORY[0x1E4F929D8] sharedInstance];
    v253 = objc_msgSend(v254, "commonTypeDict_IntegerFormat");
    v439[91] = v253;
    v438[92] = @"DISP DCS RD";
    v252 = [MEMORY[0x1E4F929D8] sharedInstance];
    v251 = objc_msgSend(v252, "commonTypeDict_IntegerFormat");
    v439[92] = v251;
    v438[93] = @"DISP DCS WR";
    v250 = [MEMORY[0x1E4F929D8] sharedInstance];
    v249 = objc_msgSend(v250, "commonTypeDict_IntegerFormat");
    v439[93] = v249;
    v438[94] = @"ISP DCS RD";
    v248 = [MEMORY[0x1E4F929D8] sharedInstance];
    v247 = objc_msgSend(v248, "commonTypeDict_IntegerFormat");
    v439[94] = v247;
    v438[95] = @"ISP DCS WR";
    v246 = [MEMORY[0x1E4F929D8] sharedInstance];
    v245 = objc_msgSend(v246, "commonTypeDict_IntegerFormat");
    v439[95] = v245;
    v438[96] = @"JPG DCS RD";
    v244 = [MEMORY[0x1E4F929D8] sharedInstance];
    v243 = objc_msgSend(v244, "commonTypeDict_IntegerFormat");
    v439[96] = v243;
    v438[97] = @"JPG DCS WR";
    v242 = [MEMORY[0x1E4F929D8] sharedInstance];
    v241 = objc_msgSend(v242, "commonTypeDict_IntegerFormat");
    v439[97] = v241;
    v438[98] = @"MSR DCS RD";
    v240 = [MEMORY[0x1E4F929D8] sharedInstance];
    v239 = objc_msgSend(v240, "commonTypeDict_IntegerFormat");
    v439[98] = v239;
    v438[99] = @"MSR DCS WR";
    v238 = [MEMORY[0x1E4F929D8] sharedInstance];
    v237 = objc_msgSend(v238, "commonTypeDict_IntegerFormat");
    v439[99] = v237;
    v438[100] = @"NRT DISP RD";
    v236 = [MEMORY[0x1E4F929D8] sharedInstance];
    v235 = objc_msgSend(v236, "commonTypeDict_IntegerFormat");
    v439[100] = v235;
    v438[101] = @"NRT DISP WR";
    v234 = [MEMORY[0x1E4F929D8] sharedInstance];
    v233 = objc_msgSend(v234, "commonTypeDict_IntegerFormat");
    v439[101] = v233;
    v438[102] = @"RT ISP RD";
    v232 = [MEMORY[0x1E4F929D8] sharedInstance];
    v231 = objc_msgSend(v232, "commonTypeDict_IntegerFormat");
    v439[102] = v231;
    v438[103] = @"RT ISP WR";
    v230 = [MEMORY[0x1E4F929D8] sharedInstance];
    v229 = objc_msgSend(v230, "commonTypeDict_IntegerFormat");
    v439[103] = v229;
    v438[104] = @"NRT ISP RD";
    v228 = [MEMORY[0x1E4F929D8] sharedInstance];
    v227 = objc_msgSend(v228, "commonTypeDict_IntegerFormat");
    v439[104] = v227;
    v438[105] = @"NRT ISP WR";
    v226 = [MEMORY[0x1E4F929D8] sharedInstance];
    v225 = objc_msgSend(v226, "commonTypeDict_IntegerFormat");
    v439[105] = v225;
    v438[106] = @"PCIE DCS RD";
    v224 = [MEMORY[0x1E4F929D8] sharedInstance];
    v223 = objc_msgSend(v224, "commonTypeDict_IntegerFormat");
    v439[106] = v223;
    v438[107] = @"PCIE DCS WR";
    v222 = [MEMORY[0x1E4F929D8] sharedInstance];
    v221 = objc_msgSend(v222, "commonTypeDict_IntegerFormat");
    v439[107] = v221;
    v438[108] = @"RT DISP RD";
    v220 = [MEMORY[0x1E4F929D8] sharedInstance];
    v219 = objc_msgSend(v220, "commonTypeDict_IntegerFormat");
    v439[108] = v219;
    v438[109] = @"RT DISP WR";
    uint64_t v218 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v217 = objc_msgSend(v218, "commonTypeDict_IntegerFormat");
    v439[109] = v217;
    v438[110] = @"SBR DCS RD";
    v216 = [MEMORY[0x1E4F929D8] sharedInstance];
    v215 = objc_msgSend(v216, "commonTypeDict_IntegerFormat");
    v439[110] = v215;
    v438[111] = @"SBR DCS WR";
    uint64_t v214 = [MEMORY[0x1E4F929D8] sharedInstance];
    v213 = objc_msgSend(v214, "commonTypeDict_IntegerFormat");
    v439[111] = v213;
    v438[112] = @"USB DCS RD";
    v212 = [MEMORY[0x1E4F929D8] sharedInstance];
    v211 = objc_msgSend(v212, "commonTypeDict_IntegerFormat");
    v439[112] = v211;
    v438[113] = @"USB DCS WR";
    v210 = [MEMORY[0x1E4F929D8] sharedInstance];
    v209 = objc_msgSend(v210, "commonTypeDict_IntegerFormat");
    v439[113] = v209;
    v438[114] = @"VDEC DCS RD";
    v208 = [MEMORY[0x1E4F929D8] sharedInstance];
    v207 = objc_msgSend(v208, "commonTypeDict_IntegerFormat");
    v439[114] = v207;
    v438[115] = @"VDEC DCS WR";
    uint64_t v206 = [MEMORY[0x1E4F929D8] sharedInstance];
    v205 = objc_msgSend(v206, "commonTypeDict_IntegerFormat");
    v439[115] = v205;
    v438[116] = @"VENC DCS RD";
    v204 = [MEMORY[0x1E4F929D8] sharedInstance];
    v203 = objc_msgSend(v204, "commonTypeDict_IntegerFormat");
    v439[116] = v203;
    v438[117] = @"VENC DCS WR";
    v202 = [MEMORY[0x1E4F929D8] sharedInstance];
    v201 = objc_msgSend(v202, "commonTypeDict_IntegerFormat");
    v439[117] = v201;
    v438[118] = @"ECPU DCS RD";
    v200 = [MEMORY[0x1E4F929D8] sharedInstance];
    v199 = objc_msgSend(v200, "commonTypeDict_IntegerFormat");
    v439[118] = v199;
    v438[119] = @"ECPU DCS WR";
    v198 = [MEMORY[0x1E4F929D8] sharedInstance];
    v197 = objc_msgSend(v198, "commonTypeDict_IntegerFormat");
    v439[119] = v197;
    v438[120] = @"ECPU RD";
    v196 = [MEMORY[0x1E4F929D8] sharedInstance];
    v195 = objc_msgSend(v196, "commonTypeDict_IntegerFormat");
    v439[120] = v195;
    v438[121] = @"ECPU WR";
    v194 = [MEMORY[0x1E4F929D8] sharedInstance];
    v193 = objc_msgSend(v194, "commonTypeDict_IntegerFormat");
    v439[121] = v193;
    v438[122] = @"GFX DCS RD";
    v192 = [MEMORY[0x1E4F929D8] sharedInstance];
    v191 = objc_msgSend(v192, "commonTypeDict_IntegerFormat");
    v439[122] = v191;
    v438[123] = @"GFX DCS WR";
    v190 = [MEMORY[0x1E4F929D8] sharedInstance];
    v189 = objc_msgSend(v190, "commonTypeDict_IntegerFormat");
    v439[123] = v189;
    v438[124] = @"PCPU DCS RD";
    v188 = [MEMORY[0x1E4F929D8] sharedInstance];
    v187 = objc_msgSend(v188, "commonTypeDict_IntegerFormat");
    v439[124] = v187;
    v438[125] = @"PCPU DCS WR";
    v186 = [MEMORY[0x1E4F929D8] sharedInstance];
    v185 = objc_msgSend(v186, "commonTypeDict_IntegerFormat");
    v439[125] = v185;
    v438[126] = @"PCPU RD";
    v184 = [MEMORY[0x1E4F929D8] sharedInstance];
    v183 = objc_msgSend(v184, "commonTypeDict_IntegerFormat");
    v439[126] = v183;
    v438[127] = @"PCPU WR";
    v182 = [MEMORY[0x1E4F929D8] sharedInstance];
    v181 = objc_msgSend(v182, "commonTypeDict_IntegerFormat");
    v439[127] = v181;
    v438[128] = @"ANS3 DCS RD";
    v180 = [MEMORY[0x1E4F929D8] sharedInstance];
    v179 = objc_msgSend(v180, "commonTypeDict_IntegerFormat");
    v439[128] = v179;
    v438[129] = @"ANS3 DCS WR";
    v178 = [MEMORY[0x1E4F929D8] sharedInstance];
    v177 = objc_msgSend(v178, "commonTypeDict_IntegerFormat");
    v439[129] = v177;
    v438[130] = @"ANS3 RD";
    v176 = [MEMORY[0x1E4F929D8] sharedInstance];
    v175 = objc_msgSend(v176, "commonTypeDict_IntegerFormat");
    v439[130] = v175;
    v438[131] = @"ANS3 WR";
    v174 = [MEMORY[0x1E4F929D8] sharedInstance];
    v173 = objc_msgSend(v174, "commonTypeDict_IntegerFormat");
    v439[131] = v173;
    v438[132] = @"FABRIC RD";
    v172 = [MEMORY[0x1E4F929D8] sharedInstance];
    v171 = objc_msgSend(v172, "commonTypeDict_IntegerFormat");
    v439[132] = v171;
    v438[133] = @"FABRIC WR";
    v170 = [MEMORY[0x1E4F929D8] sharedInstance];
    v169 = objc_msgSend(v170, "commonTypeDict_IntegerFormat");
    v439[133] = v169;
    v438[134] = @"GFX0 RD";
    v168 = [MEMORY[0x1E4F929D8] sharedInstance];
    v167 = objc_msgSend(v168, "commonTypeDict_IntegerFormat");
    v439[134] = v167;
    v438[135] = @"GFX0 WR";
    v166 = [MEMORY[0x1E4F929D8] sharedInstance];
    v165 = objc_msgSend(v166, "commonTypeDict_IntegerFormat");
    v439[135] = v165;
    v438[136] = @"GFXC";
    v164 = [MEMORY[0x1E4F929D8] sharedInstance];
    v163 = objc_msgSend(v164, "commonTypeDict_IntegerFormat");
    v439[136] = v163;
    v438[137] = @"GFXC RD";
    v162 = [MEMORY[0x1E4F929D8] sharedInstance];
    v161 = objc_msgSend(v162, "commonTypeDict_IntegerFormat");
    v439[137] = v161;
    v438[138] = @"GFXC WR";
    v160 = [MEMORY[0x1E4F929D8] sharedInstance];
    v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat");
    v439[138] = v159;
    v438[139] = @"GFXC DCS RD";
    v158 = [MEMORY[0x1E4F929D8] sharedInstance];
    v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat");
    v439[139] = v157;
    v438[140] = @"GFXC DCS WR";
    v156 = [MEMORY[0x1E4F929D8] sharedInstance];
    v155 = objc_msgSend(v156, "commonTypeDict_IntegerFormat");
    v439[140] = v155;
    v438[141] = @"GRT DISP RD";
    v154 = [MEMORY[0x1E4F929D8] sharedInstance];
    v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat");
    v439[141] = v153;
    v438[142] = @"JPG";
    v152 = [MEMORY[0x1E4F929D8] sharedInstance];
    v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat");
    v439[142] = v151;
    v438[143] = @"MSR";
    v150 = [MEMORY[0x1E4F929D8] sharedInstance];
    v149 = objc_msgSend(v150, "commonTypeDict_IntegerFormat");
    v439[143] = v149;
    v438[144] = @"NUB_SMC_MTP";
    v148 = [MEMORY[0x1E4F929D8] sharedInstance];
    v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat");
    v439[144] = v147;
    v438[145] = @"NUB_SMC_MTP RD";
    v146 = [MEMORY[0x1E4F929D8] sharedInstance];
    v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat");
    v439[145] = v145;
    v438[146] = @"NUB_SMC_MTP WR";
    v144 = [MEMORY[0x1E4F929D8] sharedInstance];
    v143 = objc_msgSend(v144, "commonTypeDict_IntegerFormat");
    v439[146] = v143;
    v438[147] = @"PD duration(usec)";
    v142 = [MEMORY[0x1E4F929D8] sharedInstance];
    v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat");
    v439[147] = v141;
    v438[148] = @"SIO_PMS_AOP";
    v140 = [MEMORY[0x1E4F929D8] sharedInstance];
    v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat");
    v439[148] = v139;
    v438[149] = @"SIO_PMS_AOP RD";
    v138 = [MEMORY[0x1E4F929D8] sharedInstance];
    v137 = objc_msgSend(v138, "commonTypeDict_IntegerFormat");
    v439[149] = v137;
    v438[150] = @"SIO_PMS_AOP WR";
    v136 = [MEMORY[0x1E4F929D8] sharedInstance];
    v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat");
    v439[150] = v135;
    v438[151] = @"SR duration(usec)";
    v134 = [MEMORY[0x1E4F929D8] sharedInstance];
    v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat");
    v439[151] = v133;
    v438[152] = @"SOC0 RD";
    v132 = [MEMORY[0x1E4F929D8] sharedInstance];
    v131 = objc_msgSend(v132, "commonTypeDict_IntegerFormat");
    v439[152] = v131;
    v438[153] = @"SOC0 WR";
    v130 = [MEMORY[0x1E4F929D8] sharedInstance];
    v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat");
    v439[153] = v129;
    v438[154] = @"FABRIC";
    v128 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v127 = objc_msgSend(v128, "commonTypeDict_IntegerFormat");
    v439[154] = v127;
    v438[155] = @"SEP DCS WR";
    v126 = [MEMORY[0x1E4F929D8] sharedInstance];
    v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat");
    v439[155] = v125;
    v438[156] = @"SEP DCS RD";
    v124 = [MEMORY[0x1E4F929D8] sharedInstance];
    v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat");
    v439[156] = v123;
    v438[157] = @"SEP";
    v122 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat");
    v439[157] = v121;
    v438[158] = @"SCODEC RT RD";
    long long v120 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat");
    v439[158] = v119;
    v438[159] = @"SCODEC RT WR";
    long long v118 = [MEMORY[0x1E4F929D8] sharedInstance];
    v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat");
    v439[159] = v117;
    v438[160] = @"SCODEC DCS RD";
    long long v116 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
    v439[160] = v115;
    v438[161] = @"SCODEC DCS WR";
    long long v114 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v113 = objc_msgSend(v114, "commonTypeDict_IntegerFormat");
    v439[161] = v113;
    v438[162] = @"SCODEC NRT RD";
    long long v112 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v439[162] = v111;
    v438[163] = @"SCODEC NRT WR";
    long long v110 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat");
    v439[163] = v109;
    v438[164] = @"DISPDFR RT RD";
    id v108 = [MEMORY[0x1E4F929D8] sharedInstance];
    v107 = objc_msgSend(v108, "commonTypeDict_IntegerFormat");
    v439[164] = v107;
    v438[165] = @"DISPDFR RT WR";
    uint64_t v106 = [MEMORY[0x1E4F929D8] sharedInstance];
    v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat");
    v439[165] = v105;
    v438[166] = @"DISPDFR NRT RD";
    uint64_t v104 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat");
    v439[166] = v103;
    v438[167] = @"DISPDFR NRT WR";
    id v102 = [MEMORY[0x1E4F929D8] sharedInstance];
    v101 = objc_msgSend(v102, "commonTypeDict_IntegerFormat");
    v439[167] = v101;
    v438[168] = @"DISPDFR DCS RD";
    v100 = [MEMORY[0x1E4F929D8] sharedInstance];
    v99 = objc_msgSend(v100, "commonTypeDict_IntegerFormat");
    v439[168] = v99;
    v438[169] = @"DISPDFR DCS WR";
    int v98 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v97 = objc_msgSend(v98, "commonTypeDict_IntegerFormat");
    v439[169] = v97;
    v438[170] = @"DISPEXT RT RD";
    v96 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v95 = objc_msgSend(v96, "commonTypeDict_IntegerFormat");
    v439[170] = v95;
    v438[171] = @"DISPEXT RT WR";
    uint64_t v94 = [MEMORY[0x1E4F929D8] sharedInstance];
    v93 = objc_msgSend(v94, "commonTypeDict_IntegerFormat");
    v439[171] = v93;
    v438[172] = @"DISPEXT NRT RD";
    v92 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v91 = objc_msgSend(v92, "commonTypeDict_IntegerFormat");
    v439[172] = v91;
    v438[173] = @"DISPEXT NRT WR";
    id v90 = [MEMORY[0x1E4F929D8] sharedInstance];
    v89 = objc_msgSend(v90, "commonTypeDict_IntegerFormat");
    v439[173] = v89;
    v438[174] = @"DISPEXT DCS RD";
    uint64_t v88 = [MEMORY[0x1E4F929D8] sharedInstance];
    v87 = objc_msgSend(v88, "commonTypeDict_IntegerFormat");
    v439[174] = v87;
    v438[175] = @"DISPEXT DCS WR";
    uint64_t v86 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
    v439[175] = v85;
    v438[176] = @"ANS RD";
    uint64_t v84 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v83 = objc_msgSend(v84, "commonTypeDict_IntegerFormat");
    v439[176] = v83;
    v438[177] = @"ANS WR";
    char v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v81 = objc_msgSend(v82, "commonTypeDict_IntegerFormat");
    v439[177] = v81;
    v438[178] = @"ANS DCS RD";
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v79 = objc_msgSend(v80, "commonTypeDict_IntegerFormat");
    v439[178] = v79;
    v438[179] = @"ANS DCS WR";
    v78 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v77 = objc_msgSend(v78, "commonTypeDict_IntegerFormat");
    v439[179] = v77;
    v438[180] = @"GFXR0 RD";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat");
    v439[180] = v75;
    v438[181] = @"GFXW0 WR";
    uint64_t v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat");
    v439[181] = v73;
    v438[182] = @"GFXR1 RD";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v439[182] = v71;
    v438[183] = @"GFXW1 WR";
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat");
    v439[183] = v69;
    v438[184] = @"JPEG DCS RD";
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
    v439[184] = v67;
    v438[185] = @"JPEG DCS WR";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_IntegerFormat");
    v439[185] = v65;
    v438[186] = @"JPEG RD";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v439[186] = v63;
    v438[187] = @"JPEG WR";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
    v439[187] = v61;
    v438[188] = @"NUB_SMC_MTP DCS RD";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v439[188] = v59;
    v438[189] = @"NUB_SMC_MTP DCS WR";
    uint64_t v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat");
    v439[189] = v57;
    v438[190] = @"PRORES";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v439[190] = v55;
    v438[191] = @"SIO_PMS_AOP DCS RD";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat");
    v439[191] = v53;
    v438[192] = @"SIO_PMS_AOP DCS WR";
    uint64_t v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v439[192] = v51;
    v438[193] = @"ATC DCS RD";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
    v439[193] = v49;
    v438[194] = @"ATC DCS WR";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v439[194] = v47;
    v438[195] = @"ATC RD";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
    v439[195] = v45;
    v438[196] = @"ATC WR";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v439[196] = v43;
    v438[197] = @"AVD DCS RD";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
    v439[197] = v41;
    v438[198] = @"AVD DCS WR";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v439[198] = v39;
    v438[199] = @"AVD RD";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
    v439[199] = v37;
    v438[200] = @"AVD WR";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v439[200] = v35;
    v438[201] = @"AVE DCS RD";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v439[201] = v33;
    v438[202] = @"AVE DCS WR";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v439[202] = v31;
    v438[203] = @"AVE RD";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v439[203] = v29;
    v438[204] = @"AVE WR";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v439[204] = v27;
    v438[205] = @"NRT DISPEXT RD";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v439[205] = v25;
    v438[206] = @"NRT DISPEXT WR";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v439[206] = v23;
    v438[207] = @"RT DISPEXT RD";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v439[207] = v21;
    v438[208] = @"RT DISPEXT WR";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v439[208] = v19;
    v438[209] = @"SIO DCS RD";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v439[209] = v17;
    v438[210] = @"SIO DCS WR";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v439[210] = v15;
    v438[211] = @"SIO RD";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v439[211] = v5;
    v438[212] = @"SIO WR";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v439[212] = v7;
    v438[213] = @"SOC0NRO RD";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v439[213] = v9;
    v438[214] = @"SOC0NRO WR";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v439[214] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v439 forKeys:v438 count:215];
    v443[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v443 forKeys:v442 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionAppleEmbeddedPCIELinkStates
{
  v141[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v140[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v138[0] = *MEMORY[0x1E4F92CD0];
    v138[1] = v2;
    v139[0] = &unk_1F29F0730;
    v139[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v138[2] = *MEMORY[0x1E4F92C60];
    v138[3] = v3;
    v139[2] = MEMORY[0x1E4F1CC28];
    v139[3] = MEMORY[0x1E4F1CC38];
    v135 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v139 forKeys:v138 count:4];
    v141[0] = v135;
    v140[1] = *MEMORY[0x1E4F92CA8];
    v136[0] = @"Port 0 Link States_L0";
    v134 = [MEMORY[0x1E4F929D8] sharedInstance];
    v133 = objc_msgSend(v134, "commonTypeDict_RealFormat");
    v137[0] = v133;
    v136[1] = @"Port 0 Link States_L1.0";
    v132 = [MEMORY[0x1E4F929D8] sharedInstance];
    v131 = objc_msgSend(v132, "commonTypeDict_RealFormat");
    v137[1] = v131;
    v136[2] = @"Port 0 Link States_L1.1";
    v130 = [MEMORY[0x1E4F929D8] sharedInstance];
    v129 = objc_msgSend(v130, "commonTypeDict_RealFormat");
    v137[2] = v129;
    v136[3] = @"Port 0 Link States_L1.2";
    v128 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v127 = objc_msgSend(v128, "commonTypeDict_RealFormat");
    v137[3] = v127;
    v136[4] = @"Port 0 Link States_L0_Transitions";
    v126 = [MEMORY[0x1E4F929D8] sharedInstance];
    v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat");
    v137[4] = v125;
    v136[5] = @"Port 0 Link States_L1.0_Transitions";
    v124 = [MEMORY[0x1E4F929D8] sharedInstance];
    v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat");
    v137[5] = v123;
    v136[6] = @"Port 0 Link States_L1.1_Transitions";
    v122 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat");
    v137[6] = v121;
    v136[7] = @"Port 0 Link States_L1.2_Transitions";
    long long v120 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat");
    v137[7] = v119;
    v136[8] = @"Port 1 Link States_L0";
    long long v118 = [MEMORY[0x1E4F929D8] sharedInstance];
    v117 = objc_msgSend(v118, "commonTypeDict_RealFormat");
    v137[8] = v117;
    v136[9] = @"Port 1 Link States_L1.0";
    long long v116 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v115 = objc_msgSend(v116, "commonTypeDict_RealFormat");
    v137[9] = v115;
    v136[10] = @"Port 1 Link States_L1.1";
    long long v114 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v113 = objc_msgSend(v114, "commonTypeDict_RealFormat");
    v137[10] = v113;
    v136[11] = @"Port 1 Link States_L1.2";
    long long v112 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v111 = objc_msgSend(v112, "commonTypeDict_RealFormat");
    v137[11] = v111;
    v136[12] = @"Port 1 Link States_L0_Transitions";
    long long v110 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat");
    v137[12] = v109;
    v136[13] = @"Port 1 Link States_L1.0_Transitions";
    id v108 = [MEMORY[0x1E4F929D8] sharedInstance];
    v107 = objc_msgSend(v108, "commonTypeDict_IntegerFormat");
    v137[13] = v107;
    v136[14] = @"Port 1 Link States_L1.1_Transitions";
    uint64_t v106 = [MEMORY[0x1E4F929D8] sharedInstance];
    v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat");
    v137[14] = v105;
    v136[15] = @"Port 1 Link States_L1.2_Transitions";
    uint64_t v104 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat");
    v137[15] = v103;
    v136[16] = @"Port 2 Link States_L0";
    id v102 = [MEMORY[0x1E4F929D8] sharedInstance];
    v101 = objc_msgSend(v102, "commonTypeDict_RealFormat");
    v137[16] = v101;
    v136[17] = @"Port 2 Link States_L1.0";
    v100 = [MEMORY[0x1E4F929D8] sharedInstance];
    v99 = objc_msgSend(v100, "commonTypeDict_RealFormat");
    v137[17] = v99;
    v136[18] = @"Port 2 Link States_L1.1";
    int v98 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v97 = objc_msgSend(v98, "commonTypeDict_RealFormat");
    v137[18] = v97;
    v136[19] = @"Port 2 Link States_L1.2";
    v96 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v95 = objc_msgSend(v96, "commonTypeDict_RealFormat");
    v137[19] = v95;
    v136[20] = @"Port 2 Link States_L0_Transitions";
    uint64_t v94 = [MEMORY[0x1E4F929D8] sharedInstance];
    v93 = objc_msgSend(v94, "commonTypeDict_IntegerFormat");
    v137[20] = v93;
    v136[21] = @"Port 2 Link States_L1.0_Transitions";
    v92 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v91 = objc_msgSend(v92, "commonTypeDict_IntegerFormat");
    v137[21] = v91;
    v136[22] = @"Port 2 Link States_L1.1_Transitions";
    id v90 = [MEMORY[0x1E4F929D8] sharedInstance];
    v89 = objc_msgSend(v90, "commonTypeDict_IntegerFormat");
    v137[22] = v89;
    v136[23] = @"Port 2 Link States_L1.2_Transitions";
    uint64_t v88 = [MEMORY[0x1E4F929D8] sharedInstance];
    v87 = objc_msgSend(v88, "commonTypeDict_IntegerFormat");
    v137[23] = v87;
    v136[24] = @"Port 3 Link States_L0";
    uint64_t v86 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v86, "commonTypeDict_RealFormat");
    v137[24] = v85;
    v136[25] = @"Port 3 Link States_L1.0";
    uint64_t v84 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v83 = objc_msgSend(v84, "commonTypeDict_RealFormat");
    v137[25] = v83;
    v136[26] = @"Port 3 Link States_L1.1";
    char v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v81 = objc_msgSend(v82, "commonTypeDict_RealFormat");
    v137[26] = v81;
    v136[27] = @"Port 3 Link States_L1.2";
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v79 = objc_msgSend(v80, "commonTypeDict_RealFormat");
    v137[27] = v79;
    v136[28] = @"Port 3 Link States_L0_Transitions";
    v78 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v77 = objc_msgSend(v78, "commonTypeDict_IntegerFormat");
    v137[28] = v77;
    v136[29] = @"Port 3 Link States_L1.0_Transitions";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat");
    v137[29] = v75;
    v136[30] = @"Port 3 Link States_L1.1_Transitions";
    uint64_t v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat");
    v137[30] = v73;
    v136[31] = @"Port 3 Link States_L1.2_Transitions";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v137[31] = v71;
    v136[32] = @"apciec0 Link States_L0";
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v69 = objc_msgSend(v70, "commonTypeDict_RealFormat");
    v137[32] = v69;
    v136[33] = @"apciec0 Link States_L1.0";
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v67 = objc_msgSend(v68, "commonTypeDict_RealFormat");
    v137[33] = v67;
    v136[34] = @"apciec0 Link States_L1.1";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_RealFormat");
    v137[34] = v65;
    v136[35] = @"apciec0 Link States_L1.2";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v63 = objc_msgSend(v64, "commonTypeDict_RealFormat");
    v137[35] = v63;
    v136[36] = @"apciec0 Link States_L0_Transitions";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v61 = objc_msgSend(v62, "commonTypeDict_RealFormat");
    v137[36] = v61;
    v136[37] = @"apciec0 Link States_L1.0_Transitions";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v59 = objc_msgSend(v60, "commonTypeDict_RealFormat");
    v137[37] = v59;
    v136[38] = @"apciec0 Link States_L1.1_Transitions";
    uint64_t v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v58, "commonTypeDict_RealFormat");
    v137[38] = v57;
    v136[39] = @"apciec0 Link States_L1.2_Transitions";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_RealFormat");
    v137[39] = v55;
    v136[40] = @"apciec1 Link States_L0";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_RealFormat");
    v137[40] = v53;
    v136[41] = @"apciec1 Link States_L1.0";
    uint64_t v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v51 = objc_msgSend(v52, "commonTypeDict_RealFormat");
    v137[41] = v51;
    v136[42] = @"apciec1 Link States_L1.1";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_RealFormat");
    v137[42] = v49;
    v136[43] = @"apciec1 Link States_L1.2";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v48, "commonTypeDict_RealFormat");
    v137[43] = v47;
    v136[44] = @"apciec1 Link States_L0_Transitions";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v46, "commonTypeDict_RealFormat");
    v137[44] = v45;
    v136[45] = @"apciec1 Link States_L1.0_Transitions";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_RealFormat");
    v137[45] = v43;
    v136[46] = @"apciec1 Link States_L1.1_Transitions";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v41 = objc_msgSend(v42, "commonTypeDict_RealFormat");
    v137[46] = v41;
    v136[47] = @"apciec1 Link States_L1.2_Transitions";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_RealFormat");
    v137[47] = v39;
    v136[48] = @"apciec2 Link States_L0";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
    v137[48] = v37;
    v136[49] = @"apciec2 Link States_L1.0";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_RealFormat");
    v137[49] = v35;
    v136[50] = @"apciec2 Link States_L1.1";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v137[50] = v33;
    v136[51] = @"apciec2 Link States_L1.2";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_RealFormat");
    v137[51] = v31;
    v136[52] = @"apciec2 Link States_L0_Transitions";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v137[52] = v29;
    v136[53] = @"apciec2 Link States_L1.0_Transitions";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_RealFormat");
    v137[53] = v27;
    v136[54] = @"apciec2 Link States_L1.1_Transitions";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v137[54] = v25;
    v136[55] = @"apciec2 Link States_L1.2_Transitions";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_RealFormat");
    v137[55] = v23;
    v136[56] = @"apciec3 Link States_L0";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v137[56] = v21;
    v136[57] = @"apciec3 Link States_L1.0";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
    v137[57] = v19;
    v136[58] = @"apciec3 Link States_L1.1";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v137[58] = v17;
    v136[59] = @"apciec3 Link States_L1.2";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_RealFormat");
    v137[59] = v15;
    v136[60] = @"apciec3 Link States_L0_Transitions";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v137[60] = v5;
    v136[61] = @"apciec3 Link States_L1.0_Transitions";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    v137[61] = v7;
    v136[62] = @"apciec3 Link States_L1.1_Transitions";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v137[62] = v9;
    v136[63] = @"apciec3 Link States_L1.2_Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_RealFormat");
    v137[63] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v137 forKeys:v136 count:64];
    v141[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v141 forKeys:v140 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionWifiChipHSICActivity
{
  v29[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v28[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v26[0] = *MEMORY[0x1E4F92CD0];
    v26[1] = v2;
    v27[0] = &unk_1F29F06F0;
    v27[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v26[2] = *MEMORY[0x1E4F92C60];
    v26[3] = v3;
    void v27[2] = MEMORY[0x1E4F1CC28];
    v27[3] = MEMORY[0x1E4F1CC38];
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
    v29[0] = v23;
    v28[1] = *MEMORY[0x1E4F92CA8];
    v24[0] = @"SampleTime";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat_withUnit_s");
    v25[0] = v21;
    v24[1] = @"        Suspend Count";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
    v25[1] = v19;
    void v24[2] = @"        Suspend Dur  ";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    void v25[2] = v17;
    void v24[3] = @"         Resume Count";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_RealFormat");
    v25[3] = v15;
    void v24[4] = @"     Disconnect Count";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v25[4] = v5;
    v24[5] = @"     Disconnect Dur  ";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    void v25[5] = v7;
    v24[6] = @"      Reconnect Count";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    void v25[6] = v9;
    v24[7] = @"         Active Dur  ";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_RealFormat");
    v25[7] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:8];
    v29[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionWifiChipTxStatCounters
{
  v39[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v38[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v36[0] = *MEMORY[0x1E4F92CD0];
    v36[1] = v2;
    v37[0] = &unk_1F29F06F0;
    v37[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v36[2] = *MEMORY[0x1E4F92C60];
    v36[3] = v3;
    v37[2] = MEMORY[0x1E4F1CC28];
    v37[3] = MEMORY[0x1E4F1CC38];
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:4];
    v39[0] = v33;
    v38[1] = *MEMORY[0x1E4F92CA8];
    v34[0] = @"SampleTime";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_RealFormat_withUnit_s");
    v35[0] = v31;
    v34[1] = @" tx data frames           ";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v35[1] = v29;
    v34[2] = @" tx data bytes            ";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_RealFormat");
    void v35[2] = v27;
    void v34[3] = @" tx mac retransmits       ";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v35[3] = v25;
    void v34[4] = @" tx data errors           ";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_RealFormat");
    void v35[4] = v23;
    v34[5] = @" tx management frames     ";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v35[5] = v21;
    v34[6] = @" tx short preamble frames ";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
    v35[6] = v19;
    v34[7] = @" tx status errors         ";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v35[7] = v17;
    v34[8] = @" tx out of buffers errors ";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_RealFormat");
    v35[8] = v15;
    v34[9] = @" tx discard not associated";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v35[9] = v5;
    v34[10] = @" tx runt frames           ";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    v35[10] = v7;
    v34[11] = @" tx header cache hit      ";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v35[11] = v9;
    v34[12] = @" tx header cache miss     ";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_RealFormat");
    v35[12] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:13];
    v39[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionWifiChipPCIeActivity
{
  v61[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v60[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v58[0] = *MEMORY[0x1E4F92CD0];
    v58[1] = v2;
    v59[0] = &unk_1F29F06F0;
    v59[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v58[2] = *MEMORY[0x1E4F92C60];
    v58[3] = v3;
    v59[2] = MEMORY[0x1E4F1CC28];
    v59[3] = MEMORY[0x1E4F1CC38];
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:4];
    v61[0] = v55;
    v60[1] = *MEMORY[0x1E4F92CA8];
    v56[0] = @"SampleTime";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_RealFormat_withUnit_s");
    v57[0] = v53;
    v56[1] = @" PCIe Active         Dur  ";
    uint64_t v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v51 = objc_msgSend(v52, "commonTypeDict_RealFormat");
    v57[1] = v51;
    v56[2] = @" PCIe D3 Suspend     Count";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_RealFormat");
    v57[2] = v49;
    v56[3] = @" PCIe D3 Suspend     Dur  ";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v48, "commonTypeDict_RealFormat");
    v57[3] = v47;
    void v56[4] = @" PCIe D0 Resume      Count";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v46, "commonTypeDict_RealFormat");
    void v57[4] = v45;
    v56[5] = @" PCIe PERST Assert   Count";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_RealFormat");
    v57[5] = v43;
    v56[6] = @" PCIe PERST Deassert Count";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v41 = objc_msgSend(v42, "commonTypeDict_RealFormat");
    v57[6] = v41;
    v56[7] = @" PCIe PERST          Dur  ";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_RealFormat");
    v57[7] = v39;
    v56[8] = @" PCIe L0 Entry       Count";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
    v57[8] = v37;
    v56[9] = @" PCIe L0             Dur  ";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_RealFormat");
    v57[9] = v35;
    v56[10] = @" PCIe L1 Entry       Count";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v57[10] = v33;
    v56[11] = @" PCIe L1             Dur  ";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_RealFormat");
    v57[11] = v31;
    v56[12] = @" PCIe L1.1 Entry     Count";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v57[12] = v29;
    v56[13] = @" PCIe L1.1           Dur  ";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_RealFormat");
    v57[13] = v27;
    v56[14] = @" PCIe L1.2 Entry     Count";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v57[14] = v25;
    v56[15] = @" PCIe L1.2           Dur  ";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_RealFormat");
    v57[15] = v23;
    v56[16] = @" PCIe H2D Doorbell                   Count";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v57[16] = v21;
    v56[17] = @" PCIe D2H Doorbell                   Count";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
    v57[17] = v19;
    v56[18] = @" PCIe Submissions                    Count";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v57[18] = v17;
    v56[19] = @" PCIe Completions                    Count";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_RealFormat");
    v57[19] = v15;
    v56[20] = @" PCIe Rx Completions                 Count";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v57[20] = v5;
    v56[21] = @" PCIe Interrupt count Due to Rx Completion";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    v57[21] = v7;
    v56[22] = @" PCIe Tx Completions                 Count";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v57[22] = v9;
    v56[23] = @" PCIe Interrupt count Due to Tx Completion";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_RealFormat");
    v57[23] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:24];
    v61[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionWifiChipRxStatCounters
{
  v47[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v46[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v44[0] = *MEMORY[0x1E4F92CD0];
    v44[1] = v2;
    v45[0] = &unk_1F29F06F0;
    v45[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v44[2] = *MEMORY[0x1E4F92C60];
    v44[3] = v3;
    v45[2] = MEMORY[0x1E4F1CC28];
    v45[3] = MEMORY[0x1E4F1CC38];
    double v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:4];
    v47[0] = v41;
    v46[1] = *MEMORY[0x1E4F92CA8];
    v42[0] = @"SampleTime";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_RealFormat_withUnit_s");
    v43[0] = v39;
    v42[1] = @" rx data frames                     ";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
    v43[1] = v37;
    v42[2] = @" rx data bytes                      ";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_RealFormat");
    v43[2] = v35;
    v42[3] = @" rx data errors                     ";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v43[3] = v33;
    void v42[4] = @" rx management frames               ";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_RealFormat");
    void v43[4] = v31;
    v42[5] = @" rx out of buffers errors           ";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v43[5] = v29;
    v42[6] = @" rx non data frames in data channel ";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_RealFormat");
    v43[6] = v27;
    v42[7] = @" rx bad DS errors                   ";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v43[7] = v25;
    v42[8] = @" rx bad control or management frames";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_RealFormat");
    v43[8] = v23;
    v42[9] = @" rx fragmentation errors            ";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v43[9] = v21;
    v42[10] = @" tx runt frames                     ";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
    v43[10] = v19;
    v42[11] = @" rx giant frames                    ";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v43[11] = v17;
    v42[12] = @" rx no scb error                    ";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_RealFormat");
    v43[12] = v15;
    v42[13] = @" rx invalid frames                  ";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v43[13] = v5;
    v42[14] = @" rx frames with Invalid Src Mac     ";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    v43[14] = v7;
    v42[15] = @" rx frames tossed for invalid da    ";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v43[15] = v9;
    v42[16] = @" rx frames filtered out             ";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_RealFormat");
    v43[16] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:17];
    v47[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionWifiChipConnectionActivity
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v16[0] = *MEMORY[0x1E4F92CD0];
    v16[1] = v2;
    v17[0] = &unk_1F29F06F0;
    v17[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v16[2] = *MEMORY[0x1E4F92C60];
    void v16[3] = v3;
    void v17[2] = MEMORY[0x1E4F1CC28];
    void v17[3] = MEMORY[0x1E4F1CC38];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    v19[0] = v4;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"SampleTime";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_withUnit_s");
    v15[0] = v6;
    v14[1] = @"        Connections Made";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v15[1] = v8;
    void v14[2] = @"        Connections  Dur";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v15[2] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    v19[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionWifiChipAWDLActivity
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v22[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v20[0] = *MEMORY[0x1E4F92CD0];
    v20[1] = v2;
    v21[0] = &unk_1F29F06F0;
    v21[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v20[2] = *MEMORY[0x1E4F92C60];
    void v20[3] = v3;
    v21[2] = MEMORY[0x1E4F1CC28];
    void v21[3] = MEMORY[0x1E4F1CC38];
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    v23[0] = v17;
    v22[1] = *MEMORY[0x1E4F92CA8];
    v18[0] = @"SampleTime";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_RealFormat_withUnit_s");
    v19[0] = v15;
    v18[1] = @" AWDL Radio Tx Dur";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v19[1] = v5;
    void v18[2] = @" AWDL Radio Rx Dur";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    void v19[2] = v7;
    void v18[3] = @" AWDL       Aw Dur";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v19[3] = v9;
    void v18[4] = @" AWDL    PScan Dur";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    void v19[4] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
    v23[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionWifiChipPMAwakeActivity
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v16[0] = *MEMORY[0x1E4F92CD0];
    v16[1] = v2;
    v17[0] = &unk_1F29F06F0;
    v17[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v16[2] = *MEMORY[0x1E4F92C60];
    void v16[3] = v3;
    void v17[2] = MEMORY[0x1E4F1CC28];
    void v17[3] = MEMORY[0x1E4F1CC38];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    v19[0] = v4;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"SampleTime";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_withUnit_s");
    v15[0] = v6;
    v14[1] = @"        PM Associated   Dur";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v15[1] = v8;
    void v14[2] = @"        PM Unassociated Dur";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v15[2] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    v19[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionWifiChipRadioPhyicalLayerActivity
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v16[0] = *MEMORY[0x1E4F92CD0];
    v16[1] = v2;
    v17[0] = &unk_1F29F06F0;
    v17[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v16[2] = *MEMORY[0x1E4F92C60];
    void v16[3] = v3;
    void v17[2] = MEMORY[0x1E4F1CC28];
    void v17[3] = MEMORY[0x1E4F1CC38];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    v19[0] = v4;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"SampleTime";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_withUnit_s");
    v15[0] = v6;
    v14[1] = @"      Radio Tx Dur";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v15[1] = v8;
    void v14[2] = @"      Radio Rx Dur";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v15[2] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    v19[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionWifiChipScanActivity
{
  v39[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v38[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v36[0] = *MEMORY[0x1E4F92CD0];
    v36[1] = v2;
    v37[0] = &unk_1F29F06F0;
    v37[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v36[2] = *MEMORY[0x1E4F92C60];
    v36[3] = v3;
    v37[2] = MEMORY[0x1E4F1CC28];
    v37[3] = MEMORY[0x1E4F1CC38];
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:4];
    v39[0] = v33;
    v38[1] = *MEMORY[0x1E4F92CA8];
    v34[0] = @"SampleTime";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_RealFormat_withUnit_s");
    v35[0] = v31;
    v34[1] = @"         User Scan Count";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v35[1] = v29;
    v34[2] = @"        User Scan Dur  ";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    void v35[2] = v27;
    void v34[3] = @"       Assoc Scan Count";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v35[3] = v25;
    void v34[4] = @"       Assoc Scan Dur  ";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    void v35[4] = v23;
    v34[5] = @"        Roam Scan Count";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v35[5] = v21;
    v34[6] = @"        Roam Scan Dur  ";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v35[6] = v19;
    v34[7] = @"   PNO BSSID Scan Count";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v35[7] = v17;
    v34[8] = @"   PNO BSSID Scan Dur  ";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v35[8] = v15;
    v34[9] = @"   PNO SSID  Scan Count";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v35[9] = v5;
    v34[10] = @"   PNO SSID  Scan Dur  ";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v35[10] = v7;
    v34[11] = @"       Other Scan Count";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v35[11] = v9;
    v34[12] = @"         Other Scan Dur";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v35[12] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:13];
    v39[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionWifiChipRxChipErrorCounters
{
  void v35[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v34[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v32[0] = *MEMORY[0x1E4F92CD0];
    v32[1] = v2;
    v33[0] = &unk_1F29F06F0;
    v33[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v32[2] = *MEMORY[0x1E4F92C60];
    v32[3] = v3;
    v33[2] = MEMORY[0x1E4F1CC28];
    void v33[3] = MEMORY[0x1E4F1CC38];
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:4];
    v35[0] = v29;
    v34[1] = *MEMORY[0x1E4F92CA8];
    v30[0] = @"SampleTime";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_RealFormat_withUnit_s");
    v31[0] = v27;
    v30[1] = @" rx fifo overflow errors               ";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v31[1] = v25;
    void v30[2] = @" rx dma descriptor underflow errors 0  ";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v31[2] = v23;
    v30[3] = @" rx dma descriptor underflow errors 1  ";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v31[3] = v21;
    v30[4] = @" rx dma descriptor underflow errors 2  ";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    void v31[4] = v19;
    v30[5] = @" rx dma descriptor underflow errors 3  ";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v31[5] = v17;
    v30[6] = @" rx dma descriptor underflow errors 4  ";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v31[6] = v15;
    v30[7] = @" rx dma descriptor underflow errors 5  ";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v31[7] = v5;
    v30[8] = @" d11cnt   txrts value when reset d11cnt";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v31[8] = v7;
    v30[9] = @" d11cnt   rxcrc value when reset d11cnt";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v31[9] = v9;
    v30[10] = @" d11cnt txnocts value when reset d11cnt";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v31[10] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:11];
    v35[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionWifiChipTxChipErrorCounters
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v16[0] = *MEMORY[0x1E4F92CD0];
    v16[1] = v2;
    v17[0] = &unk_1F29F06F0;
    v17[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v16[2] = *MEMORY[0x1E4F92C60];
    void v16[3] = v3;
    void v17[2] = MEMORY[0x1E4F1CC28];
    void v17[3] = MEMORY[0x1E4F1CC38];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    v19[0] = v4;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"SampleTime";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_withUnit_s");
    v15[0] = v6;
    v14[1] = @" tx fifo underflows       ";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v15[1] = v8;
    void v14[2] = @" tx phy errors            ";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v15[2] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    v19[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionWifiChipRxPerRateCounters
{
  v57[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v56[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v54[0] = *MEMORY[0x1E4F92CD0];
    v54[1] = v2;
    v55[0] = &unk_1F29F06F0;
    v55[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v54[2] = *MEMORY[0x1E4F92C60];
    v54[3] = v3;
    v55[2] = MEMORY[0x1E4F1CC28];
    v55[3] = MEMORY[0x1E4F1CC38];
    double v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:4];
    v57[0] = v51;
    v56[1] = *MEMORY[0x1E4F92CA8];
    v52[0] = @"SampleTime";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_RealFormat_withUnit_s");
    v53[0] = v49;
    v52[1] = @" packets rx at 1    Mbps          ";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v53[1] = v47;
    v52[2] = @" packets rx at 2    Mbps          ";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
    v53[2] = v45;
    v52[3] = @" packets rx at 5.5  Mbps          ";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v53[3] = v43;
    v52[4] = @" packets rx at 6    Mbps          ";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
    v53[4] = v41;
    v52[5] = @" packets rx at 9    Mbps          ";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v53[5] = v39;
    v52[6] = @" packets rx at 11   Mbps          ";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
    v53[6] = v37;
    v52[7] = @" packets rx at 12   Mbps          ";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v53[7] = v35;
    v52[8] = @" packets rx at 18   Mbps          ";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v53[8] = v33;
    v52[9] = @" packets rx at 24   Mbps          ";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v53[9] = v31;
    v52[10] = @" packets rx at 36   Mbps          ";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v53[10] = v29;
    v52[11] = @" packets rx at 48   Mbps          ";
    double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v53[11] = v27;
    v52[12] = @" packets rx at 54   Mbps          ";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v53[12] = v25;
    v52[13] = @" packets rx at 108  Mbps          ";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v53[13] = v23;
    v52[14] = @" packets rx at 162  Mbps          ";
    double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v53[14] = v21;
    v52[15] = @" packets rx at 216  Mbps          ";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v53[15] = v19;
    v52[16] = @" packets rx at 270  Mbps          ";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v53[16] = v17;
    v52[17] = @" packets rx at 324  Mbps          ";
    int v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v53[17] = v15;
    v52[18] = @" packets rx at 378  Mbps          ";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v53[18] = v5;
    v52[19] = @" packets rx at 432  Mbps          ";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v53[19] = v7;
    v52[20] = @" packets rx at 486  Mbps          ";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v53[20] = v9;
    v52[21] = @" packets rx at 540  Mbps          ";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v53[21] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:22];
    v57[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionOpticalInterfaceStats
{
  v335[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogOpticalInterfaceStats])
  {
    v334[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v332[0] = *MEMORY[0x1E4F92CD0];
    v332[1] = v2;
    v333[0] = &unk_1F29F07B0;
    v333[1] = @"logEventBackwardIOReport";
    v332[2] = *MEMORY[0x1E4F92C60];
    v333[2] = MEMORY[0x1E4F1CC28];
    long long v115 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v333 forKeys:v332 count:3];
    v335[0] = v115;
    v334[1] = *MEMORY[0x1E4F92CA8];
    v330[0] = @"SampleTime";
    uint64_t v4 = *MEMORY[0x1E4F92D18];
    v328[0] = *MEMORY[0x1E4F92D10];
    uint64_t v3 = v328[0];
    v328[1] = v4;
    v329[0] = &unk_1F29E5608;
    v329[1] = @"s";
    long long v114 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v329 forKeys:v328 count:2];
    v331[0] = v114;
    v330[1] = @"OPTICAL_POWER_UNKNOWN";
    uint64_t v326 = v3;
    v327 = &unk_1F29E5608;
    long long v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v327 forKeys:&v326 count:1];
    v331[1] = v113;
    v330[2] = @"OPTICAL_POWER_UNKNOWN_Transitions";
    uint64_t v324 = v3;
    v325 = &unk_1F29E5620;
    long long v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v325 forKeys:&v324 count:1];
    v331[2] = v112;
    v330[3] = @"OPTICAL_POWER_BG0_1";
    uint64_t v322 = v3;
    v323 = &unk_1F29E5608;
    long long v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v323 forKeys:&v322 count:1];
    v331[3] = v111;
    v330[4] = @"OPTICAL_POWER_BG0_1_Transitions";
    uint64_t v320 = v3;
    v321 = &unk_1F29E5620;
    long long v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v321 forKeys:&v320 count:1];
    v331[4] = v110;
    v330[5] = @"OPTICAL_POWER_BG2_19";
    uint64_t v318 = v3;
    v319 = &unk_1F29E5608;
    long long v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v319 forKeys:&v318 count:1];
    v331[5] = v109;
    v330[6] = @"OPTICAL_POWER_BG2_19_Transitions";
    uint64_t v316 = v3;
    v317 = &unk_1F29E5620;
    id v108 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v317 forKeys:&v316 count:1];
    v331[6] = v108;
    v330[7] = @"OPTICAL_POWER_BG1_19";
    uint64_t v314 = v3;
    v315 = &unk_1F29E5608;
    v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v315 forKeys:&v314 count:1];
    v331[7] = v107;
    v330[8] = @"OPTICAL_POWER_BG1_19_Transitions";
    uint64_t v312 = v3;
    v313 = &unk_1F29E5620;
    uint64_t v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v313 forKeys:&v312 count:1];
    v331[8] = v106;
    v330[9] = @"OPTICAL_POWER_BG2_2";
    uint64_t v310 = v3;
    v311 = &unk_1F29E5608;
    v105 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v311 forKeys:&v310 count:1];
    v331[9] = v105;
    v330[10] = @"OPTICAL_POWER_BG2_2_Transitions";
    uint64_t v308 = v3;
    v309 = &unk_1F29E5620;
    uint64_t v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v309 forKeys:&v308 count:1];
    v331[10] = v104;
    v330[11] = @"OPTICAL_POWER_BG1_2";
    uint64_t v306 = v3;
    v307 = &unk_1F29E5608;
    uint64_t v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v307 forKeys:&v306 count:1];
    v331[11] = v103;
    v330[12] = @"OPTICAL_POWER_BG1_2_Transitions";
    uint64_t v304 = v3;
    v305 = &unk_1F29E5620;
    id v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v305 forKeys:&v304 count:1];
    v331[12] = v102;
    v330[13] = @"OPTICAL_POWER_BG2_6";
    uint64_t v302 = v3;
    v303 = &unk_1F29E5608;
    v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v303 forKeys:&v302 count:1];
    v331[13] = v101;
    v330[14] = @"OPTICAL_POWER_BG2_6_Transitions";
    uint64_t v300 = v3;
    v301 = &unk_1F29E5620;
    v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v301 forKeys:&v300 count:1];
    v331[14] = v100;
    v330[15] = @"OPTICAL_POWER_BG1_6";
    uint64_t v298 = v3;
    v299 = &unk_1F29E5608;
    v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v299 forKeys:&v298 count:1];
    v331[15] = v99;
    v330[16] = @"OPTICAL_POWER_BG1_6_Transitions";
    uint64_t v296 = v3;
    v297 = &unk_1F29E5620;
    int v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v297 forKeys:&v296 count:1];
    v331[16] = v98;
    v330[17] = @"OPTICAL_POWER_FL2_3";
    uint64_t v294 = v3;
    v295 = &unk_1F29E5608;
    id v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v295 forKeys:&v294 count:1];
    v331[17] = v97;
    v330[18] = @"OPTICAL_POWER_FL2_3_Transitions";
    uint64_t v292 = v3;
    v293 = &unk_1F29E5620;
    v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v293 forKeys:&v292 count:1];
    v331[18] = v96;
    v330[19] = @"OPTICAL_POWER_TA2_2";
    uint64_t v290 = v3;
    v291 = &unk_1F29E5608;
    id v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v291 forKeys:&v290 count:1];
    v331[19] = v95;
    v330[20] = @"OPTICAL_POWER_TA2_2_Transitions";
    uint64_t v288 = v3;
    v289 = &unk_1F29E5620;
    uint64_t v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v289 forKeys:&v288 count:1];
    v331[20] = v94;
    v330[21] = @"OPTICAL_POWER_TA1_2";
    uint64_t v286 = v3;
    v287 = &unk_1F29E5608;
    v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v287 forKeys:&v286 count:1];
    v331[21] = v93;
    v330[22] = @"OPTICAL_POWER_TA1_2_Transitions";
    uint64_t v284 = v3;
    v285 = &unk_1F29E5620;
    v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v285 forKeys:&v284 count:1];
    v331[22] = v92;
    v330[23] = @"OPTICAL_POWER_HN2_6";
    uint64_t v282 = v3;
    v283 = &unk_1F29E5608;
    uint64_t v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v283 forKeys:&v282 count:1];
    v331[23] = v91;
    v330[24] = @"OPTICAL_POWER_HN2_6_Transitions";
    uint64_t v280 = v3;
    v281 = &unk_1F29E5620;
    id v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v281 forKeys:&v280 count:1];
    v331[24] = v90;
    v330[25] = @"OPTICAL_POWER_HN1_6";
    uint64_t v278 = v3;
    v279 = &unk_1F29E5608;
    v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v279 forKeys:&v278 count:1];
    v331[25] = v89;
    v330[26] = @"OPTICAL_POWER_HN1_6_Transitions";
    uint64_t v276 = v3;
    v277 = &unk_1F29E5620;
    uint64_t v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v277 forKeys:&v276 count:1];
    v331[26] = v88;
    v330[27] = @"OPTICAL_POWER_BL1_8";
    uint64_t v274 = v3;
    v275 = &unk_1F29E5608;
    v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v275 forKeys:&v274 count:1];
    v331[27] = v87;
    v330[28] = @"OPTICAL_POWER_BL1_8_Transitions";
    uint64_t v272 = v3;
    v273 = &unk_1F29E5620;
    uint64_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v273 forKeys:&v272 count:1];
    v331[28] = v86;
    v330[29] = @"OPTICAL_POWER_OS0_10";
    uint64_t v270 = v3;
    v271 = &unk_1F29E5608;
    v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v271 forKeys:&v270 count:1];
    v331[29] = v85;
    v330[30] = @"OPTICAL_POWER_OS0_10_Transitions";
    uint64_t v268 = v3;
    v269 = &unk_1F29E5620;
    uint64_t v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v269 forKeys:&v268 count:1];
    v331[30] = v84;
    v330[31] = @"OPTICAL_POWER_SC2_16";
    uint64_t v266 = v3;
    v267 = &unk_1F29E5608;
    int v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v267 forKeys:&v266 count:1];
    v331[31] = v83;
    v330[32] = @"OPTICAL_POWER_SC2_16_Transitions";
    uint64_t v264 = v3;
    v265 = &unk_1F29E5620;
    char v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v265 forKeys:&v264 count:1];
    v331[32] = v82;
    v330[33] = @"OPTICAL_POWER_SC1_16";
    uint64_t v262 = v3;
    v263 = &unk_1F29E5608;
    char v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v263 forKeys:&v262 count:1];
    v331[33] = v81;
    v330[34] = @"OPTICAL_POWER_SC1_16_Transitions";
    uint64_t v260 = v3;
    v261 = &unk_1F29E5620;
    v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v261 forKeys:&v260 count:1];
    v331[34] = v80;
    v330[35] = @"OPTICAL_POWER_SC0_17";
    uint64_t v258 = v3;
    v259 = &unk_1F29E5608;
    uint64_t v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v259 forKeys:&v258 count:1];
    v331[35] = v79;
    v330[36] = @"OPTICAL_POWER_SC0_17_Transitions";
    uint64_t v256 = v3;
    v257 = &unk_1F29E5620;
    v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v257 forKeys:&v256 count:1];
    v331[36] = v78;
    v330[37] = @"OPTICAL_POWER_SC2_17";
    uint64_t v254 = v3;
    v255 = &unk_1F29E5608;
    uint64_t v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v255 forKeys:&v254 count:1];
    v331[37] = v77;
    v330[38] = @"OPTICAL_POWER_SC2_17_Transitions";
    uint64_t v252 = v3;
    v253 = &unk_1F29E5620;
    v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v253 forKeys:&v252 count:1];
    v331[38] = v76;
    v330[39] = @"OPTICAL_POWER_SC1_17";
    uint64_t v250 = v3;
    v251 = &unk_1F29E5608;
    uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v251 forKeys:&v250 count:1];
    v331[39] = v75;
    v330[40] = @"OPTICAL_POWER_SC1_17_Transitions";
    uint64_t v248 = v3;
    v249 = &unk_1F29E5620;
    uint64_t v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v249 forKeys:&v248 count:1];
    v331[40] = v74;
    v330[41] = @"OPTICAL_POWER_SC2_BGHR";
    uint64_t v246 = v3;
    v247 = &unk_1F29E5608;
    uint64_t v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v247 forKeys:&v246 count:1];
    v331[41] = v73;
    v330[42] = @"OPTICAL_POWER_SC2_BGHR_Transitions";
    uint64_t v244 = v3;
    v245 = &unk_1F29E5620;
    v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v245 forKeys:&v244 count:1];
    v331[42] = v72;
    v330[43] = @"OPTICAL_POWER_SC2_PO";
    uint64_t v242 = v3;
    v243 = &unk_1F29E5608;
    uint64_t v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v243 forKeys:&v242 count:1];
    v331[43] = v71;
    v330[44] = @"OPTICAL_POWER_SC2_PO_Transitions";
    uint64_t v240 = v3;
    v241 = &unk_1F29E5620;
    char v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v241 forKeys:&v240 count:1];
    v331[44] = v70;
    v330[45] = @"OPTICAL_POWER_SC2_FL";
    uint64_t v238 = v3;
    v239 = &unk_1F29E5608;
    uint64_t v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v239 forKeys:&v238 count:1];
    v331[45] = v69;
    v330[46] = @"OPTICAL_POWER_SC2_FL_Transitions";
    uint64_t v236 = v3;
    v237 = &unk_1F29E5620;
    long long v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v237 forKeys:&v236 count:1];
    v331[46] = v68;
    v330[47] = @"OPTICAL_POWER_SC2_TACH";
    uint64_t v234 = v3;
    v235 = &unk_1F29E5608;
    uint64_t v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v235 forKeys:&v234 count:1];
    v331[47] = v67;
    v330[48] = @"OPTICAL_POWER_SC2_TACH_Transitions";
    uint64_t v232 = v3;
    v233 = &unk_1F29E5620;
    long long v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v233 forKeys:&v232 count:1];
    v331[48] = v66;
    v330[49] = @"OPTICAL_POWER_SC2_HRNN";
    uint64_t v230 = v3;
    v231 = &unk_1F29E5608;
    uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v231 forKeys:&v230 count:1];
    v331[49] = v65;
    v330[50] = @"OPTICAL_POWER_SC2_HRNN_Transitions";
    uint64_t v228 = v3;
    v229 = &unk_1F29E5620;
    uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v229 forKeys:&v228 count:1];
    v331[50] = v64;
    v330[51] = @"OPTICAL_POWER_PO2_19";
    uint64_t v226 = v3;
    v227 = &unk_1F29E5608;
    id v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v227 forKeys:&v226 count:1];
    v331[51] = v63;
    v330[52] = @"OPTICAL_POWER_PO2_19_Transitions";
    uint64_t v224 = v3;
    v225 = &unk_1F29E5620;
    double v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v225 forKeys:&v224 count:1];
    v331[52] = v62;
    v330[53] = @"OPTICAL_POWER_PO1_19";
    uint64_t v222 = v3;
    v223 = &unk_1F29E5608;
    double v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v223 forKeys:&v222 count:1];
    v331[53] = v61;
    v330[54] = @"OPTICAL_POWER_PO1_19_Transitions";
    uint64_t v220 = v3;
    v221 = &unk_1F29E5620;
    uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v221 forKeys:&v220 count:1];
    v331[54] = v60;
    v330[55] = @"OPTICAL_POWER_BG4_6";
    uint64_t v218 = v3;
    v219 = &unk_1F29E5608;
    uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v219 forKeys:&v218 count:1];
    v331[55] = v59;
    v330[56] = @"OPTICAL_POWER_BG4_6_Transitions";
    uint64_t v216 = v3;
    uint64_t v217 = &unk_1F29E5620;
    uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v217 forKeys:&v216 count:1];
    v331[56] = v58;
    v330[57] = @"OPTICAL_POWER_BG3_6";
    uint64_t v214 = v3;
    v215 = &unk_1F29E5608;
    v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v215 forKeys:&v214 count:1];
    v331[57] = v57;
    v330[58] = @"OPTICAL_POWER_BG3_6_Transitions";
    uint64_t v212 = v3;
    v213 = &unk_1F29E5620;
    int v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v213 forKeys:&v212 count:1];
    v331[58] = v56;
    v330[59] = @"OPTICAL_POWER_HN4_6";
    uint64_t v210 = v3;
    v211 = &unk_1F29E5608;
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v211 forKeys:&v210 count:1];
    v331[59] = v55;
    v330[60] = @"OPTICAL_POWER_HN4_6_Transitions";
    uint64_t v208 = v3;
    v209 = &unk_1F29E5620;
    uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v209 forKeys:&v208 count:1];
    v331[60] = v54;
    v330[61] = @"OPTICAL_POWER_HN3_6";
    uint64_t v206 = v3;
    v207 = &unk_1F29E5608;
    uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v207 forKeys:&v206 count:1];
    v331[61] = v53;
    v330[62] = @"OPTICAL_POWER_HN3_6_Transitions";
    uint64_t v204 = v3;
    v205 = &unk_1F29E5620;
    uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v205 forKeys:&v204 count:1];
    v331[62] = v52;
    v330[63] = @"OPTICAL_POWER_HN0_21";
    uint64_t v202 = v3;
    v203 = &unk_1F29E5608;
    double v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v203 forKeys:&v202 count:1];
    v331[63] = v51;
    v330[64] = @"OPTICAL_POWER_HN0_21_Transitions";
    uint64_t v200 = v3;
    v201 = &unk_1F29E5620;
    double v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v201 forKeys:&v200 count:1];
    v331[64] = v50;
    v330[65] = @"OPTICAL_POWER_SC1_BGHR";
    uint64_t v198 = v3;
    v199 = &unk_1F29E5608;
    v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v199 forKeys:&v198 count:1];
    v331[65] = v49;
    v330[66] = @"OPTICAL_POWER_SC1_BGHR_Transitions";
    uint64_t v196 = v3;
    v197 = &unk_1F29E5620;
    uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v197 forKeys:&v196 count:1];
    v331[66] = v48;
    v330[67] = @"OPTICAL_POWER_SC1_PO";
    uint64_t v194 = v3;
    v195 = &unk_1F29E5608;
    double v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v195 forKeys:&v194 count:1];
    v331[67] = v47;
    v330[68] = @"OPTICAL_POWER_SC1_PO_Transitions";
    uint64_t v192 = v3;
    v193 = &unk_1F29E5620;
    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v193 forKeys:&v192 count:1];
    v331[68] = v46;
    v330[69] = @"OPTICAL_POWER_SC1_FL";
    uint64_t v190 = v3;
    v191 = &unk_1F29E5608;
    uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
    v331[69] = v45;
    v330[70] = @"OPTICAL_POWER_SC1_FL_Transitions";
    uint64_t v188 = v3;
    v189 = &unk_1F29E5620;
    v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v189 forKeys:&v188 count:1];
    v331[70] = v44;
    v330[71] = @"OPTICAL_POWER_SC1_TACH";
    uint64_t v186 = v3;
    v187 = &unk_1F29E5608;
    uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v187 forKeys:&v186 count:1];
    v331[71] = v43;
    v330[72] = @"OPTICAL_POWER_SC1_TACH_Transitions";
    uint64_t v184 = v3;
    v185 = &unk_1F29E5620;
    uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v185 forKeys:&v184 count:1];
    v331[72] = v42;
    v330[73] = @"OPTICAL_POWER_SC1_HRNN";
    uint64_t v182 = v3;
    v183 = &unk_1F29E5608;
    double v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v183 forKeys:&v182 count:1];
    v331[73] = v41;
    v330[74] = @"OPTICAL_POWER_SC1_HRNN_Transitions";
    uint64_t v180 = v3;
    v181 = &unk_1F29E5620;
    double v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v181 forKeys:&v180 count:1];
    v331[74] = v40;
    v330[75] = @"OPTICAL_POWER_SC1_BL";
    uint64_t v178 = v3;
    v179 = &unk_1F29E5608;
    v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v179 forKeys:&v178 count:1];
    v331[75] = v39;
    v330[76] = @"OPTICAL_POWER_SC1_BL_Transitions";
    uint64_t v176 = v3;
    v177 = &unk_1F29E5620;
    double v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v177 forKeys:&v176 count:1];
    v331[76] = v38;
    v330[77] = @"OPTICAL_POWER_SC2_BL";
    uint64_t v174 = v3;
    v175 = &unk_1F29E5608;
    double v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v175 forKeys:&v174 count:1];
    v331[77] = v37;
    v330[78] = @"OPTICAL_POWER_SC2_BL_Transitions";
    uint64_t v172 = v3;
    v173 = &unk_1F29E5620;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v172 count:1];
    v331[78] = v36;
    v330[79] = @"OPTICAL_POWER_BG4_19";
    uint64_t v170 = v3;
    v171 = &unk_1F29E5608;
    id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v171 forKeys:&v170 count:1];
    v331[79] = v35;
    v330[80] = @"OPTICAL_POWER_BG4_19_Transitions";
    uint64_t v168 = v3;
    v169 = &unk_1F29E5620;
    char v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v169 forKeys:&v168 count:1];
    v331[80] = v34;
    v330[81] = @"OPTICAL_POWER_BG4_2";
    uint64_t v166 = v3;
    v167 = &unk_1F29E5608;
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v167 forKeys:&v166 count:1];
    v331[81] = v33;
    v330[82] = @"OPTICAL_POWER_BG4_2_Transitions";
    uint64_t v164 = v3;
    v165 = &unk_1F29E5620;
    uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v165 forKeys:&v164 count:1];
    v331[82] = v32;
    v330[83] = @"OPTICAL_POWER_FL4_3";
    uint64_t v162 = v3;
    v163 = &unk_1F29E5608;
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v163 forKeys:&v162 count:1];
    v331[83] = v31;
    v330[84] = @"OPTICAL_POWER_FL4_3_Transitions";
    uint64_t v160 = v3;
    v161 = &unk_1F29E5620;
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v161 forKeys:&v160 count:1];
    v331[84] = v30;
    v330[85] = @"OPTICAL_POWER_GR1_24";
    uint64_t v158 = v3;
    v159 = &unk_1F29E5608;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v159 forKeys:&v158 count:1];
    v331[85] = v29;
    v330[86] = @"OPTICAL_POWER_GR1_24_Transitions";
    uint64_t v156 = v3;
    v157 = &unk_1F29E5620;
    double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v157 forKeys:&v156 count:1];
    v331[86] = v28;
    v330[87] = @"OPTICAL_POWER_PO4_19";
    uint64_t v154 = v3;
    v155 = &unk_1F29E5608;
    double v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v155 forKeys:&v154 count:1];
    v331[87] = v27;
    v330[88] = @"OPTICAL_POWER_PO4_19_Transitions";
    uint64_t v152 = v3;
    v153 = &unk_1F29E5620;
    double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
    v331[88] = v26;
    v330[89] = @"OPTICAL_POWER_SC4_16";
    uint64_t v150 = v3;
    v151 = &unk_1F29E5608;
    double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v151 forKeys:&v150 count:1];
    v331[89] = v25;
    v330[90] = @"OPTICAL_POWER_SC4_16_Transitions";
    uint64_t v148 = v3;
    v149 = &unk_1F29E5620;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v149 forKeys:&v148 count:1];
    v331[90] = v24;
    v330[91] = @"OPTICAL_POWER_SC4_17";
    uint64_t v146 = v3;
    v147 = &unk_1F29E5608;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v147 forKeys:&v146 count:1];
    v331[91] = v23;
    v330[92] = @"OPTICAL_POWER_SC4_17_Transitions";
    uint64_t v144 = v3;
    v145 = &unk_1F29E5620;
    double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v145 forKeys:&v144 count:1];
    v331[92] = v22;
    v330[93] = @"OPTICAL_POWER_SC4_BGHR";
    uint64_t v142 = v3;
    v143 = &unk_1F29E5608;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
    v331[93] = v21;
    v330[94] = @"OPTICAL_POWER_SC4_BGHR_Transitions";
    uint64_t v140 = v3;
    v141 = &unk_1F29E5620;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
    v331[94] = v20;
    v330[95] = @"OPTICAL_POWER_SC4_BL";
    uint64_t v138 = v3;
    v139 = &unk_1F29E5608;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];
    v331[95] = v19;
    v330[96] = @"OPTICAL_POWER_SC4_BL_Transitions";
    uint64_t v136 = v3;
    v137 = &unk_1F29E5620;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];
    v331[96] = v18;
    v330[97] = @"OPTICAL_POWER_SC4_FL";
    uint64_t v134 = v3;
    v135 = &unk_1F29E5608;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
    v331[97] = v17;
    v330[98] = @"OPTICAL_POWER_SC4_FL_Transitions";
    uint64_t v132 = v3;
    v133 = &unk_1F29E5620;
    int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v133 forKeys:&v132 count:1];
    v331[98] = v16;
    v330[99] = @"OPTICAL_POWER_SC4_HRNN";
    uint64_t v130 = v3;
    v131 = &unk_1F29E5608;
    BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v131 forKeys:&v130 count:1];
    v331[99] = v5;
    v330[100] = @"OPTICAL_POWER_SC4_HRNN_Transitions";
    uint64_t v128 = v3;
    v129 = &unk_1F29E5620;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
    v331[100] = v6;
    v330[101] = @"OPTICAL_POWER_SC4_PO";
    uint64_t v126 = v3;
    uint64_t v127 = &unk_1F29E5608;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
    v331[101] = v7;
    v330[102] = @"OPTICAL_POWER_SC4_PO_Transitions";
    uint64_t v124 = v3;
    v125 = &unk_1F29E5620;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v125 forKeys:&v124 count:1];
    v331[102] = v8;
    v330[103] = @"OPTICAL_POWER_SC4_TACH";
    uint64_t v122 = v3;
    v123 = &unk_1F29E5608;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
    v331[103] = v9;
    v330[104] = @"OPTICAL_POWER_SC4_TACH_Transitions";
    uint64_t v120 = v3;
    long long v121 = &unk_1F29E5620;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v121 forKeys:&v120 count:1];
    v331[104] = v10;
    v330[105] = @"OPTICAL_POWER_TA4_2";
    uint64_t v118 = v3;
    long long v119 = &unk_1F29E5608;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
    v331[105] = v11;
    v330[106] = @"OPTICAL_POWER_TA4_2_Transitions";
    uint64_t v116 = v3;
    v117 = &unk_1F29E5620;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
    v331[106] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v331 forKeys:v330 count:107];
    v335[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v335 forKeys:v334 count:2];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v14;
}

+ (id)entryEventBackwardDefinitionBonnLisaStats
{
  void v82[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] == 1001201)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v81[0] = *MEMORY[0x1E4F92C50];
    uint64_t v3 = *MEMORY[0x1E4F92CB0];
    v79[0] = *MEMORY[0x1E4F92CD0];
    v79[1] = v3;
    v80[0] = &unk_1F29F0700;
    v80[1] = @"logEventBackwardIOReport";
    v79[2] = *MEMORY[0x1E4F92C60];
    v80[2] = MEMORY[0x1E4F1CC28];
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:3];
    v82[0] = v30;
    v81[1] = *MEMORY[0x1E4F92CA8];
    v77[0] = @"LISA_POW_ALG_512";
    uint64_t v75 = *MEMORY[0x1E4F92D10];
    uint64_t v4 = v75;
    v76 = &unk_1F29E5608;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    v78[0] = v29;
    v77[1] = @"LISA_POW_ALG_512_Transitions";
    uint64_t v73 = v4;
    uint64_t v74 = &unk_1F29E5620;
    double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    v78[1] = v28;
    v77[2] = @"LISA_POW_ALG_1K";
    uint64_t v71 = v4;
    v72 = &unk_1F29E5608;
    double v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    void v78[2] = v27;
    v77[3] = @"LISA_POW_ALG_1K_Transitions";
    uint64_t v69 = v4;
    char v70 = &unk_1F29E5620;
    double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    v78[3] = v26;
    void v77[4] = @"LISA_POW_ALG_2K";
    uint64_t v67 = v4;
    long long v68 = &unk_1F29E5608;
    double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    v78[4] = v25;
    v77[5] = @"LISA_POW_ALG_2K_Transitions";
    uint64_t v65 = v4;
    long long v66 = &unk_1F29E5620;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    v78[5] = v24;
    v77[6] = @"LISA_POW_ALG_4K";
    uint64_t v63 = v4;
    uint64_t v64 = &unk_1F29E5608;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    v78[6] = v23;
    v77[7] = @"LISA_POW_ALG_4K_Transitions";
    uint64_t v61 = v4;
    double v62 = &unk_1F29E5620;
    double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    v78[7] = v22;
    v77[8] = @"LISA_POW_ALG_8K";
    uint64_t v59 = v4;
    uint64_t v60 = &unk_1F29E5608;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    v78[8] = v21;
    v77[9] = @"LISA_POW_ALG_8K_Transitions";
    uint64_t v57 = v4;
    uint64_t v58 = &unk_1F29E5620;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    v78[9] = v20;
    v77[10] = @"LISA_POW_CNF_1K";
    uint64_t v55 = v4;
    int v56 = &unk_1F29E5608;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    v78[10] = v19;
    v77[11] = @"LISA_POW_CNF_1K_Transitions";
    uint64_t v53 = v4;
    uint64_t v54 = &unk_1F29E5620;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    v78[11] = v18;
    v77[12] = @"LISA_POW_CNF_2K";
    uint64_t v51 = v4;
    uint64_t v52 = &unk_1F29E5608;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    v78[12] = v17;
    v77[13] = @"LISA_POW_CNF_2K_Transitions";
    uint64_t v49 = v4;
    double v50 = &unk_1F29E5620;
    int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    v78[13] = v16;
    v77[14] = @"LISA_POW_CNF_4K";
    uint64_t v47 = v4;
    uint64_t v48 = &unk_1F29E5608;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v78[14] = v15;
    v77[15] = @"LISA_POW_CNF_4K_Transitions";
    uint64_t v45 = v4;
    v46 = &unk_1F29E5620;
    BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v78[15] = v5;
    v77[16] = @"LISA_POW_CNF_8K";
    uint64_t v43 = v4;
    v44 = &unk_1F29E5608;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v78[16] = v6;
    v77[17] = @"LISA_POW_CNF_8K_Transitions";
    uint64_t v41 = v4;
    uint64_t v42 = &unk_1F29E5620;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    v78[17] = v7;
    v77[18] = @"LISA_POW_BURST_32";
    uint64_t v39 = v4;
    double v40 = &unk_1F29E5608;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v78[18] = v8;
    v77[19] = @"LISA_POW_BURST_32_Transitions";
    uint64_t v37 = v4;
    double v38 = &unk_1F29E5620;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    v78[19] = v9;
    v77[20] = @"LISA_POW_OFF";
    uint64_t v35 = v4;
    v36 = &unk_1F29E5608;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v78[20] = v10;
    v77[21] = @"LISA_POW_OFF_Transitions";
    uint64_t v33 = v4;
    char v34 = &unk_1F29E5620;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v78[21] = v11;
    v77[22] = @"SampleTime";
    uint64_t v31 = v4;
    uint64_t v32 = &unk_1F29E5608;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v78[22] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:23];
    v82[1] = v13;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];
  }
  return v2;
}

+ (id)entryEventBackwardDefinitionCoronetPowerStats
{
  v31[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] kPLDeviceClass] == 200039)
  {
    v30[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v28[0] = *MEMORY[0x1E4F92CD0];
    v28[1] = v2;
    v29[0] = &unk_1F29F06F0;
    v29[1] = @"logEventBackwardIOReport";
    void v28[2] = *MEMORY[0x1E4F92C60];
    v29[2] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
    v31[0] = v3;
    v30[1] = *MEMORY[0x1E4F92CA8];
    v26[0] = @"CORONET_POW_VERN_120";
    uint64_t v24 = *MEMORY[0x1E4F92D10];
    uint64_t v4 = v24;
    double v25 = &unk_1F29E5608;
    BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v27[0] = v5;
    v26[1] = @"CORONET_POW_VERN_120_Transitions";
    uint64_t v22 = v4;
    uint64_t v23 = &unk_1F29E5620;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v27[1] = v6;
    void v26[2] = @"CORONET_POW_SNIFF_16";
    uint64_t v20 = v4;
    uint64_t v21 = &unk_1F29E5608;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    void v27[2] = v7;
    v26[3] = @"CORONET_POW_SNIFF_16_Transitions";
    uint64_t v18 = v4;
    uint64_t v19 = &unk_1F29E5620;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v27[3] = v8;
    void v26[4] = @"CORONET_POW_OFF";
    uint64_t v16 = v4;
    id v17 = &unk_1F29E5608;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    void v27[4] = v9;
    v26[5] = @"CORONET_POW_OFF_Transitions";
    uint64_t v14 = v4;
    id v15 = &unk_1F29E5620;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v27[5] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:6];
    v31[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionSpeakerPowerState
{
  void v34[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isWatch] & 1) != 0
    || [MEMORY[0x1E4F92A38] isHomePod])
  {
    v33[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v31[0] = *MEMORY[0x1E4F92CD0];
    v31[1] = v2;
    v32[0] = &unk_1F29F06F0;
    v32[1] = @"logEventBackwardIOReport";
    v31[2] = *MEMORY[0x1E4F92C60];
    v32[2] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
    v34[0] = v3;
    v33[1] = *MEMORY[0x1E4F92CA8];
    v29[0] = @"State_OFF";
    uint64_t v27 = *MEMORY[0x1E4F92D10];
    uint64_t v4 = v27;
    double v28 = &unk_1F29E5608;
    BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v30[0] = v5;
    v29[1] = @"State_OFF_Transitions";
    uint64_t v25 = v4;
    double v26 = &unk_1F29E5620;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v30[1] = v6;
    v29[2] = @"State_ON";
    uint64_t v23 = v4;
    uint64_t v24 = &unk_1F29E5608;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    void v30[2] = v7;
    void v29[3] = @"State_ON_Transitions";
    uint64_t v21 = v4;
    uint64_t v22 = &unk_1F29E5620;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v30[3] = v8;
    void v29[4] = @"State_PREWARM";
    uint64_t v19 = v4;
    uint64_t v20 = &unk_1F29E5608;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v30[4] = v9;
    v29[5] = @"State_PREWARM_Transitions";
    uint64_t v17 = v4;
    uint64_t v18 = &unk_1F29E5620;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v30[5] = v10;
    v29[6] = @"SampleTime";
    uint64_t v15 = v4;
    uint64_t v16 = &unk_1F29E5608;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v30[6] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:7];
    v34[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionActuatorPowerState
{
  void v34[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isWatch])
  {
    v33[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v31[0] = *MEMORY[0x1E4F92CD0];
    v31[1] = v2;
    v32[0] = &unk_1F29F06F0;
    v32[1] = @"logEventBackwardIOReport";
    v31[2] = *MEMORY[0x1E4F92C60];
    v32[2] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
    v34[0] = v3;
    v33[1] = *MEMORY[0x1E4F92CA8];
    v29[0] = @"State_OFF";
    uint64_t v27 = *MEMORY[0x1E4F92D10];
    uint64_t v4 = v27;
    double v28 = &unk_1F29E5608;
    BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v30[0] = v5;
    v29[1] = @"State_OFF_Transitions";
    uint64_t v25 = v4;
    double v26 = &unk_1F29E5620;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v30[1] = v6;
    v29[2] = @"State_ON";
    uint64_t v23 = v4;
    uint64_t v24 = &unk_1F29E5608;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    void v30[2] = v7;
    void v29[3] = @"State_ON_Transitions";
    uint64_t v21 = v4;
    uint64_t v22 = &unk_1F29E5620;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v30[3] = v8;
    void v29[4] = @"State_PREWARM";
    uint64_t v19 = v4;
    uint64_t v20 = &unk_1F29E5608;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v30[4] = v9;
    v29[5] = @"State_PREWARM_Transitions";
    uint64_t v17 = v4;
    uint64_t v18 = &unk_1F29E5620;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v30[5] = v10;
    v29[6] = @"SampleTime";
    uint64_t v15 = v4;
    uint64_t v16 = &unk_1F29E5608;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v30[6] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:7];
    v34[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionAOPAOP_Haptics
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isWatch])
  {
    v36[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v34[0] = *MEMORY[0x1E4F92CD0];
    v34[1] = v2;
    v35[0] = &unk_1F29F06F0;
    v35[1] = @"logEventBackwardIOReport";
    void v34[2] = *MEMORY[0x1E4F92C60];
    void v35[2] = MEMORY[0x1E4F1CC28];
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];
    v37[0] = v15;
    v36[1] = *MEMORY[0x1E4F92CA8];
    v32[0] = @"Req received(0)";
    uint64_t v30 = *MEMORY[0x1E4F92D10];
    uint64_t v3 = v30;
    uint64_t v31 = &unk_1F29E5620;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v33[0] = v4;
    v32[1] = @"Req received(1)";
    uint64_t v28 = v3;
    uint64_t v29 = &unk_1F29E5620;
    BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v33[1] = v5;
    v32[2] = @"Dropped-QueFull(0)";
    uint64_t v26 = v3;
    uint64_t v27 = &unk_1F29E5620;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    void v33[2] = v6;
    void v32[3] = @"Dropped-QueFull(1)";
    uint64_t v24 = v3;
    uint64_t v25 = &unk_1F29E5620;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    void v33[3] = v7;
    void v32[4] = @"Dropped-Policy(0)";
    uint64_t v22 = v3;
    uint64_t v23 = &unk_1F29E5620;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    void v33[4] = v8;
    v32[5] = @"Dropped-Policy(1)";
    uint64_t v20 = v3;
    uint64_t v21 = &unk_1F29E5620;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v33[5] = v9;
    v32[6] = @"Dropped-Error(0)";
    uint64_t v18 = v3;
    uint64_t v19 = &unk_1F29E5620;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v33[6] = v10;
    v32[7] = @"Dropped-Error(1)";
    uint64_t v16 = v3;
    uint64_t v17 = &unk_1F29E5620;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v33[7] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:8];
    v37[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionAOPAOPAudioFW
{
  void v34[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent hasAOMSupport])
  {
    v33[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v31[0] = *MEMORY[0x1E4F92CD0];
    v31[1] = v2;
    v32[0] = &unk_1F29F06F0;
    v32[1] = @"logEventBackwardIOReport";
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    v34[0] = v3;
    v33[1] = *MEMORY[0x1E4F92CA8];
    v29[0] = @"HPMicStartCnt";
    uint64_t v27 = *MEMORY[0x1E4F92D10];
    uint64_t v4 = v27;
    uint64_t v28 = &unk_1F29E5620;
    BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v30[0] = v5;
    v29[1] = @"HPMicStopCnt";
    uint64_t v25 = v4;
    uint64_t v26 = &unk_1F29E5620;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v30[1] = v6;
    v29[2] = @"LPMicStartCnt";
    uint64_t v23 = v4;
    uint64_t v24 = &unk_1F29E5620;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    void v30[2] = v7;
    void v29[3] = @"LPMicStopCnt";
    uint64_t v21 = v4;
    uint64_t v22 = &unk_1F29E5620;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v30[3] = v8;
    void v29[4] = @"TotHPMicOnDur";
    uint64_t v19 = v4;
    uint64_t v20 = &unk_1F29E5620;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v30[4] = v9;
    v29[5] = @"TotLPMicOnDur";
    uint64_t v17 = v4;
    uint64_t v18 = &unk_1F29E5620;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v30[5] = v10;
    v29[6] = @"TotTimeWindDur";
    uint64_t v15 = v4;
    uint64_t v16 = &unk_1F29E5620;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v30[6] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:7];
    v34[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionMultitouchCPUStats
{
  void v34[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isWatch])
  {
    v33[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v31[0] = *MEMORY[0x1E4F92CD0];
    v31[1] = v2;
    v32[0] = &unk_1F29F06F0;
    v32[1] = @"logEventBackwardIOReport";
    void v31[2] = *MEMORY[0x1E4F92C60];
    void v32[2] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
    v34[0] = v3;
    v33[1] = *MEMORY[0x1E4F92CA8];
    v29[0] = @"CPU_PM0";
    uint64_t v27 = *MEMORY[0x1E4F92D10];
    uint64_t v4 = v27;
    uint64_t v28 = &unk_1F29E5608;
    BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v30[0] = v5;
    v29[1] = @"CPU_PM0_Transitions";
    uint64_t v25 = v4;
    uint64_t v26 = &unk_1F29E5620;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v30[1] = v6;
    v29[2] = @"CPU_PM3";
    uint64_t v23 = v4;
    uint64_t v24 = &unk_1F29E5608;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    void v30[2] = v7;
    void v29[3] = @"CPU_PM3_Transitions";
    uint64_t v21 = v4;
    uint64_t v22 = &unk_1F29E5620;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v30[3] = v8;
    void v29[4] = @"CPU_PM4";
    uint64_t v19 = v4;
    uint64_t v20 = &unk_1F29E5608;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v30[4] = v9;
    v29[5] = @"CPU_PM4_Transitions";
    uint64_t v17 = v4;
    uint64_t v18 = &unk_1F29E5620;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v30[5] = v10;
    v29[6] = @"SampleTime";
    uint64_t v15 = v4;
    uint64_t v16 = &unk_1F29E5608;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v30[6] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:7];
    v34[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionVDDOK1
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitionVDDOK2
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitionDisplayPuvloB
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitionCorePerformanceLevelResidency
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v17[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v15[0] = *MEMORY[0x1E4F92CD0];
    v15[1] = v2;
    v16[0] = &unk_1F29F0720;
    v16[1] = @"logEventBackwardIOReport";
    void v15[2] = *MEMORY[0x1E4F92C60];
    v16[2] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    v18[0] = v3;
    v17[1] = *MEMORY[0x1E4F92CA8];
    v13[0] = @"Channel";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v14[0] = v5;
    v13[1] = @"State";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v14[1] = v7;
    void v13[2] = @"Residency";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v14[2] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v18[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionAOPAmpPower
{
  void v26[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiOS]
    && +[PLIOReportAgent hasAOPSupport])
  {
    v25[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v23[0] = *MEMORY[0x1E4F92CD0];
    v23[1] = v2;
    v24[0] = &unk_1F29F0720;
    v24[1] = @"logEventBackwardIOReport";
    void v23[2] = *MEMORY[0x1E4F92C60];
    void v24[2] = MEMORY[0x1E4F1CC28];
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
    v26[0] = v20;
    v25[1] = *MEMORY[0x1E4F92CA8];
    v21[0] = @"SampleTime";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat_withUnit_s");
    v22[0] = v18;
    v21[1] = @"arc_DIS";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
    v22[1] = v16;
    v21[2] = @"arc_DIS_Transitions";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    void v22[2] = v14;
    void v21[3] = @"arc_ENA";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    void v22[3] = v4;
    void v21[4] = @"arc_ENA_Transitions";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v22[4] = v6;
    v21[5] = @"arc_PREW";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    v22[5] = v8;
    v21[6] = @"arc_PREW_Transitions";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v22[6] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
    v26[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionAOPmuxPower
{
  void v26[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiOS]
    && +[PLIOReportAgent hasAOPSupport])
  {
    v25[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v23[0] = *MEMORY[0x1E4F92CD0];
    v23[1] = v2;
    v24[0] = &unk_1F29F0720;
    v24[1] = @"logEventBackwardIOReport";
    void v23[2] = *MEMORY[0x1E4F92C60];
    void v24[2] = MEMORY[0x1E4F1CC28];
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
    v26[0] = v20;
    v25[1] = *MEMORY[0x1E4F92CA8];
    v21[0] = @"SampleTime";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat_withUnit_s");
    v22[0] = v18;
    v21[1] = @"mux_ON";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
    v22[1] = v16;
    v21[2] = @"mux_ON_Transitions";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    void v22[2] = v14;
    void v21[3] = @"mux_OFF";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    void v22[3] = v4;
    void v21[4] = @"mux_OFF_Transitions";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v22[4] = v6;
    v21[5] = @"mux_IDLE";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    v22[5] = v8;
    v21[6] = @"mux_IDLE_Transitions";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v22[6] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
    v26[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionAOPAOPSensors
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent hasAOPSupport])
  {
    v19[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v17[0] = *MEMORY[0x1E4F92CD0];
    v17[1] = v2;
    v18[0] = &unk_1F29F0780;
    v18[1] = @"logEventBackwardIOReport";
    void v17[2] = *MEMORY[0x1E4F92C60];
    void v18[2] = MEMORY[0x1E4F1CC28];
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4F92CA8];
    v15[0] = @"Channel";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v16[0] = v4;
    v15[1] = @"DutyCycle";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
    v16[1] = v6;
    void v15[2] = @"State";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v16[2] = v8;
    void v15[3] = @"Transitions";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v16[3] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionPRLUsagePreCheck
{
  void v31[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isiOS] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWatch])
  {
    v30[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v28[0] = *MEMORY[0x1E4F92CD0];
    v28[1] = v2;
    v29[0] = &unk_1F29F0700;
    v29[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v28[2] = *MEMORY[0x1E4F92C60];
    void v28[3] = v3;
    v29[2] = MEMORY[0x1E4F1CC28];
    void v29[3] = MEMORY[0x1E4F1CC38];
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
    v31[0] = v25;
    v30[1] = *MEMORY[0x1E4F92CA8];
    v26[0] = @"PassCount";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v27[0] = v23;
    v26[1] = @"FailCount";
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v27[1] = v21;
    void v26[2] = @"FloodCount";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    void v27[2] = v19;
    v26[3] = @"SparseCount";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v27[3] = v17;
    void v26[4] = @"DenseCount";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    void v27[4] = v15;
    v26[5] = @"100msCount";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v27[5] = v5;
    void v26[6] = @"250msCount";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    void v27[6] = v7;
    v26[7] = @"400msCount";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v27[7] = v9;
    v26[8] = @"800msCount";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v27[8] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:9];
    v31[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionPRLUsageBCheck
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isiOS] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWatch])
  {
    v22[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v20[0] = *MEMORY[0x1E4F92CD0];
    v20[1] = v2;
    v21[0] = &unk_1F29F06F0;
    v21[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v20[2] = *MEMORY[0x1E4F92C60];
    void v20[3] = v3;
    v21[2] = MEMORY[0x1E4F1CC28];
    void v21[3] = MEMORY[0x1E4F1CC38];
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    v23[0] = v17;
    v22[1] = *MEMORY[0x1E4F92CA8];
    v18[0] = @"PassCount";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v19[0] = v15;
    v18[1] = @"FailCount";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v19[1] = v5;
    void v18[2] = @"FloodCount";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    void v19[2] = v7;
    void v18[3] = @"SparseCount";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v19[3] = v9;
    void v18[4] = @"DenseCount";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    void v19[4] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
    v23[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionPRLUsageProCheck
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isiOS] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWatch])
  {
    v22[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v20[0] = *MEMORY[0x1E4F92CD0];
    v20[1] = v2;
    v21[0] = &unk_1F29F06F0;
    v21[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v20[2] = *MEMORY[0x1E4F92C60];
    void v20[3] = v3;
    v21[2] = MEMORY[0x1E4F1CC28];
    void v21[3] = MEMORY[0x1E4F1CC38];
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    v23[0] = v17;
    v22[1] = *MEMORY[0x1E4F92CA8];
    v18[0] = @"PassCount";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v19[0] = v15;
    v18[1] = @"FailCount";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v19[1] = v5;
    void v18[2] = @"FloodCount";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    void v19[2] = v7;
    void v18[3] = @"SparseCount";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v19[3] = v9;
    void v18[4] = @"DenseCount";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    void v19[4] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
    v23[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionPRLUsageAttCheck
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isiOS] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWatch])
  {
    v22[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v20[0] = *MEMORY[0x1E4F92CD0];
    v20[1] = v2;
    v21[0] = &unk_1F29F06F0;
    v21[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v20[2] = *MEMORY[0x1E4F92C60];
    void v20[3] = v3;
    v21[2] = MEMORY[0x1E4F1CC28];
    void v21[3] = MEMORY[0x1E4F1CC38];
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    v23[0] = v17;
    v22[1] = *MEMORY[0x1E4F92CA8];
    v18[0] = @"PassCount";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v19[0] = v15;
    v18[1] = @"FailCount";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v19[1] = v5;
    void v18[2] = @"FloodCount";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    void v19[2] = v7;
    void v18[3] = @"SparseCount";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v19[3] = v9;
    void v18[4] = @"DenseCount";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    void v19[4] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
    v23[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionPRLUsageJOn
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isiOS] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWatch])
  {
    v16[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v14[0] = *MEMORY[0x1E4F92CD0];
    v14[1] = v2;
    v15[0] = &unk_1F29F06F0;
    v15[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v14[2] = *MEMORY[0x1E4F92C60];
    void v14[3] = v3;
    void v15[2] = MEMORY[0x1E4F1CC28];
    void v15[3] = MEMORY[0x1E4F1CC38];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    v17[0] = v4;
    v16[1] = *MEMORY[0x1E4F92CA8];
    v12[0] = @"AuthCount";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v12[1] = @"AttCount";
    v13[0] = v6;
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v13[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    v17[1] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v10;
}

+ (id)entryEventBackwardDefinitionPRLUsageRStandby
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isiOS] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWatch])
  {
    v16[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v14[0] = *MEMORY[0x1E4F92CD0];
    v14[1] = v2;
    v15[0] = &unk_1F29F06F0;
    v15[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v14[2] = *MEMORY[0x1E4F92C60];
    void v14[3] = v3;
    void v15[2] = MEMORY[0x1E4F1CC28];
    void v15[3] = MEMORY[0x1E4F1CC38];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    v17[0] = v4;
    v16[1] = *MEMORY[0x1E4F92CA8];
    v12[0] = @"AuthDur";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v12[1] = @"AttDur";
    v13[0] = v6;
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v13[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    v17[1] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v10;
}

+ (id)entryEventBackwardDefinitionH13ISPH13ISPEvents
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F06F0;
  v16[1] = @"logEventBackwardIOReport";
  void v15[2] = *MEMORY[0x1E4F92C60];
  void v16[2] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"Number Rgl INT_FAULT_LVT_LATCH";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  BOOL v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v14[0] = v5;
  v13[1] = @"Number Rgl INT_FAULT_VINUVLO_LATCH";
  double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  void v13[2] = @"Number SB IVFM";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v14[2] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventBackwardDefinitionCPUStatsCPUEvents
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v16[0] = *MEMORY[0x1E4F92CD0];
    v16[1] = v2;
    v17[0] = &unk_1F29F06F0;
    v17[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v16[2] = *MEMORY[0x1E4F92C60];
    void v16[3] = v3;
    void v17[2] = MEMORY[0x1E4F1CC28];
    void v17[3] = MEMORY[0x1E4F1CC38];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    v19[0] = v4;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"SampleTime";
    BOOL v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_withUnit_s");
    v15[0] = v6;
    v14[1] = @"DPE0_ACT";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v15[1] = v8;
    void v14[2] = @"DPE0_Transitions";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v15[2] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    v19[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (BOOL)isOldLostPerfLoggingModel
{
  if (qword_1EBD58408 != -1) {
    dispatch_once(&qword_1EBD58408, &__block_literal_global_5806);
  }
  return byte_1EBD583D1;
}

uint64_t __44__PLIOReportAgent_isOldLostPerfLoggingModel__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isiPhone];
  if (result)
  {
    if (([MEMORY[0x1E4F92A38] isDeviceClass:102007] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:102008] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:102009] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:102010] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:102011] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:102012] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:102013] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:102014] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:102015] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:102016] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:102017] & 1) != 0)
    {
      uint64_t result = 1;
    }
    else
    {
      uint64_t result = [MEMORY[0x1E4F92A38] isDeviceClass:102018];
    }
  }
  byte_1EBD583D1 = result;
  return result;
}

+ (BOOL)shouldLogThermalUPOLimiting
{
  if ([MEMORY[0x1E4F929C0] BOOLForKey:@"enableLostPerfLogging" ifNotSet:0]) {
    char v2 = 1;
  }
  else {
    char v2 = [MEMORY[0x1E4F929C0] isTaskFullEPLMode];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PLIOReportAgent_shouldLogThermalUPOLimiting__block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v5 = v2;
  if (qword_1EBD58410 != -1) {
    dispatch_once(&qword_1EBD58410, block);
  }
  if (byte_1EBD583D2) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t __46__PLIOReportAgent_shouldLogThermalUPOLimiting__block_invoke(uint64_t a1)
{
  uint64_t result = +[PLIOReportAgent isOldLostPerfLoggingModel];
  byte_1EBD583D2 = result;
  if (result && !*(unsigned char *)(a1 + 32))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F929C0];
    return [v3 enableRestartAtEPL];
  }
  return result;
}

+ (id)entryEventBackwardDefinitionCPUStatsCPUComplexThermalUPOLimiting
{
  v142[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogThermalUPOLimiting])
  {
    v141[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C60];
    v139[0] = *MEMORY[0x1E4F92CD0];
    v139[1] = v2;
    v140[0] = &unk_1F29F0710;
    v140[1] = MEMORY[0x1E4F1CC28];
    uint64_t v136 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v140 forKeys:v139 count:2];
    v142[0] = v136;
    v141[1] = *MEMORY[0x1E4F92CA8];
    v137[0] = @"SampleTime";
    v135 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v134 = objc_msgSend(v135, "commonTypeDict_RealFormat_withUnit_s");
    v138[0] = v134;
    v137[1] = @"APWakeTime";
    v133 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v132 = objc_msgSend(v133, "commonTypeDict_RealFormat_withUnit_s");
    v138[1] = v132;
    v137[2] = @"CLTM-f_DominantLost_H_H";
    v131 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v130 = objc_msgSend(v131, "commonTypeDict_RealFormat");
    v138[2] = v130;
    v137[3] = @"CLTM-f_DominantLost_H_M";
    v129 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v128 = objc_msgSend(v129, "commonTypeDict_RealFormat");
    v138[3] = v128;
    v137[4] = @"CLTM-f_DominantLost_H_L";
    uint64_t v127 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v126 = objc_msgSend(v127, "commonTypeDict_RealFormat");
    void v138[4] = v126;
    v137[5] = @"CLTM-f_DominantLost_M_M";
    v125 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v124 = objc_msgSend(v125, "commonTypeDict_RealFormat");
    v138[5] = v124;
    v137[6] = @"CLTM-f_DominantLost_M_L";
    v123 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v122 = objc_msgSend(v123, "commonTypeDict_RealFormat");
    v138[6] = v122;
    v137[7] = @"CLTM-f_DominantLost_L_L";
    long long v121 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v120 = objc_msgSend(v121, "commonTypeDict_RealFormat");
    v138[7] = v120;
    v137[8] = @"CLTM-f_DominantNoLost";
    long long v119 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v118 = objc_msgSend(v119, "commonTypeDict_RealFormat");
    v138[8] = v118;
    v137[9] = @"CLTM-f_NotDominantCouldHaveLost";
    v117 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v116 = objc_msgSend(v117, "commonTypeDict_RealFormat");
    v138[9] = v116;
    v137[10] = @"CLTM-f_NotDominantWouldNotLost";
    long long v115 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v114 = objc_msgSend(v115, "commonTypeDict_RealFormat");
    v138[10] = v114;
    v137[11] = @"CLTM-s_DominantLost_H_H";
    long long v113 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v112 = objc_msgSend(v113, "commonTypeDict_RealFormat");
    v138[11] = v112;
    v137[12] = @"CLTM-s_DominantLost_H_M";
    long long v111 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v110 = objc_msgSend(v111, "commonTypeDict_RealFormat");
    v138[12] = v110;
    v137[13] = @"CLTM-s_DominantLost_H_L";
    long long v109 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v108 = objc_msgSend(v109, "commonTypeDict_RealFormat");
    v138[13] = v108;
    v137[14] = @"CLTM-s_DominantLost_M_M";
    v107 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v106 = objc_msgSend(v107, "commonTypeDict_RealFormat");
    v138[14] = v106;
    v137[15] = @"CLTM-s_DominantLost_M_L";
    v105 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v104 = objc_msgSend(v105, "commonTypeDict_RealFormat");
    v138[15] = v104;
    v137[16] = @"CLTM-s_DominantLost_L_L";
    uint64_t v103 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v102 = objc_msgSend(v103, "commonTypeDict_RealFormat");
    v138[16] = v102;
    v137[17] = @"CLTM-s_DominantNoLost";
    v101 = [MEMORY[0x1E4F929D8] sharedInstance];
    v100 = objc_msgSend(v101, "commonTypeDict_RealFormat");
    v138[17] = v100;
    v137[18] = @"CLTM-s_NotDominantCouldHaveLost";
    v99 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v98 = objc_msgSend(v99, "commonTypeDict_RealFormat");
    v138[18] = v98;
    v137[19] = @"CLTM-s_NotDominantWouldNotLost";
    id v97 = [MEMORY[0x1E4F929D8] sharedInstance];
    v96 = objc_msgSend(v97, "commonTypeDict_RealFormat");
    v138[19] = v96;
    v137[20] = @"HIP_DominantLost_H_H";
    id v95 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v94 = objc_msgSend(v95, "commonTypeDict_RealFormat");
    v138[20] = v94;
    v137[21] = @"HIP_DominantLost_H_M";
    v93 = [MEMORY[0x1E4F929D8] sharedInstance];
    v92 = objc_msgSend(v93, "commonTypeDict_RealFormat");
    v138[21] = v92;
    v137[22] = @"HIP_DominantLost_H_L";
    uint64_t v91 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v90 = objc_msgSend(v91, "commonTypeDict_RealFormat");
    v138[22] = v90;
    v137[23] = @"HIP_DominantLost_M_M";
    v89 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v88 = objc_msgSend(v89, "commonTypeDict_RealFormat");
    v138[23] = v88;
    v137[24] = @"HIP_DominantLost_M_L";
    v87 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v86 = objc_msgSend(v87, "commonTypeDict_RealFormat");
    v138[24] = v86;
    v137[25] = @"HIP_DominantLost_L_L";
    v85 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v84 = objc_msgSend(v85, "commonTypeDict_RealFormat");
    v138[25] = v84;
    v137[26] = @"HIP_DominantNoLost";
    int v83 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v82 = objc_msgSend(v83, "commonTypeDict_RealFormat");
    v138[26] = v82;
    v137[27] = @"HIP_NotDominantCouldHaveLost";
    char v81 = [MEMORY[0x1E4F929D8] sharedInstance];
    v80 = objc_msgSend(v81, "commonTypeDict_RealFormat");
    v138[27] = v80;
    v137[28] = @"HIP_NotDominantWouldNotLost";
    uint64_t v79 = [MEMORY[0x1E4F929D8] sharedInstance];
    v78 = objc_msgSend(v79, "commonTypeDict_RealFormat");
    v138[28] = v78;
    v137[29] = @"UPO_DominantLost_H_H";
    uint64_t v77 = [MEMORY[0x1E4F929D8] sharedInstance];
    v76 = objc_msgSend(v77, "commonTypeDict_RealFormat");
    v138[29] = v76;
    v137[30] = @"UPO_DominantLost_H_M";
    uint64_t v75 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v74 = objc_msgSend(v75, "commonTypeDict_RealFormat");
    v138[30] = v74;
    v137[31] = @"UPO_DominantLost_H_L";
    uint64_t v73 = [MEMORY[0x1E4F929D8] sharedInstance];
    v72 = objc_msgSend(v73, "commonTypeDict_RealFormat");
    v138[31] = v72;
    v137[32] = @"UPO_DominantLost_M_M";
    uint64_t v71 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v70 = objc_msgSend(v71, "commonTypeDict_RealFormat");
    v138[32] = v70;
    v137[33] = @"UPO_DominantLost_M_L";
    uint64_t v69 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v68 = objc_msgSend(v69, "commonTypeDict_RealFormat");
    v138[33] = v68;
    v137[34] = @"UPO_DominantLost_L_L";
    uint64_t v67 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v66 = objc_msgSend(v67, "commonTypeDict_RealFormat");
    v138[34] = v66;
    v137[35] = @"UPO_DominantNoLost";
    uint64_t v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v64 = objc_msgSend(v65, "commonTypeDict_RealFormat");
    v138[35] = v64;
    v137[36] = @"UPO_NotDominantCouldHaveLost";
    uint64_t v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v62 = objc_msgSend(v63, "commonTypeDict_RealFormat");
    v138[36] = v62;
    v137[37] = @"UPO_NotDominantWouldNotLost";
    uint64_t v61 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v60 = objc_msgSend(v61, "commonTypeDict_RealFormat");
    v138[37] = v60;
    v137[38] = @"LPM_DominantLost_H_H";
    uint64_t v59 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v58 = objc_msgSend(v59, "commonTypeDict_RealFormat");
    v138[38] = v58;
    v137[39] = @"LPM_DominantLost_H_M";
    uint64_t v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat");
    v138[39] = v56;
    v137[40] = @"LPM_DominantLost_H_L";
    uint64_t v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v54 = objc_msgSend(v55, "commonTypeDict_RealFormat");
    v138[40] = v54;
    v137[41] = @"LPM_DominantLost_M_M";
    uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v52 = objc_msgSend(v53, "commonTypeDict_RealFormat");
    v138[41] = v52;
    v137[42] = @"LPM_DominantLost_M_L";
    uint64_t v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v50 = objc_msgSend(v51, "commonTypeDict_RealFormat");
    v138[42] = v50;
    v137[43] = @"LPM_DominantLost_L_L";
    uint64_t v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v49, "commonTypeDict_RealFormat");
    v138[43] = v48;
    v137[44] = @"LPM_DominantNoLost";
    uint64_t v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_RealFormat");
    v138[44] = v46;
    v137[45] = @"LPM_NotDominantCouldHaveLost";
    uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_RealFormat");
    v138[45] = v44;
    v137[46] = @"LPM_NotDominantWouldNotLost";
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_RealFormat");
    v138[46] = v42;
    v137[47] = @"Droop_DominantLost_H_H";
    uint64_t v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_RealFormat");
    v138[47] = v40;
    v137[48] = @"Droop_DominantLost_H_M";
    uint64_t v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v38 = objc_msgSend(v39, "commonTypeDict_RealFormat");
    v138[48] = v38;
    v137[49] = @"Droop_DominantLost_H_L";
    uint64_t v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_RealFormat");
    v138[49] = v36;
    v137[50] = @"Droop_DominantLost_M_M";
    uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_RealFormat");
    v138[50] = v34;
    v137[51] = @"Droop_DominantLost_M_L";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
    v138[51] = v32;
    v137[52] = @"Droop_DominantLost_L_L";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_RealFormat");
    v138[52] = v30;
    v137[53] = @"Droop_DominantNoLost";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
    v138[53] = v28;
    v137[54] = @"Droop_NotDominantCouldHaveLost";
    uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v26 = objc_msgSend(v27, "commonTypeDict_RealFormat");
    v138[54] = v26;
    v137[55] = @"Droop_NotDominantWouldNotLost";
    uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
    v138[55] = v24;
    v137[56] = @"CLTM-a_DominantLost_H_H";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat");
    v138[56] = v22;
    v137[57] = @"CLTM-a_DominantLost_H_M";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
    v138[57] = v20;
    v137[58] = @"CLTM-a_DominantLost_H_L";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
    v138[58] = v18;
    v137[59] = @"CLTM-a_DominantLost_M_M";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
    v138[59] = v16;
    v137[60] = @"CLTM-a_DominantLost_M_L";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
    v138[60] = v14;
    v137[61] = @"CLTM-a_DominantLost_L_L";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v138[61] = v4;
    v137[62] = @"CLTM-a_DominantNoLost";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
    v138[62] = v6;
    v137[63] = @"CLTM-a_NotDominantCouldHaveLost";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    v138[63] = v8;
    void v137[64] = @"CLTM-a_NotDominantWouldNotLost";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
    v138[64] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v138 forKeys:v137 count:65];
    v142[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:v141 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionSoCStatsClusterPowerStates
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitionPPMStatsDroopController
{
  void v58[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiOS])
  {
    v57[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v55[0] = *MEMORY[0x1E4F92CD0];
    v55[1] = v2;
    v56[0] = &unk_1F29F06F0;
    v56[1] = @"logEventBackwardIOReport";
    v55[2] = *MEMORY[0x1E4F92C60];
    void v56[2] = MEMORY[0x1E4F1CC28];
    uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:3];
    v58[0] = v52;
    v57[1] = *MEMORY[0x1E4F92CA8];
    v53[0] = @"SampleTime";
    uint64_t v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v50 = objc_msgSend(v51, "commonTypeDict_RealFormat_withUnit_s");
    v54[0] = v50;
    v53[1] = @"Utiliztn_0-9%";
    uint64_t v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v49, "commonTypeDict_RealFormat");
    v54[1] = v48;
    v53[2] = @"Utiliztn_0-9%_Transitions";
    uint64_t v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
    v54[2] = v46;
    v53[3] = @"Utiliztn_10-19%";
    uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_RealFormat");
    v54[3] = v44;
    v53[4] = @"Utiliztn_10-19%_Transitions";
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
    void v54[4] = v42;
    v53[5] = @"Utiliztn_20-29%";
    uint64_t v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_RealFormat");
    v54[5] = v40;
    v53[6] = @"Utiliztn_20-29%_Transitions";
    uint64_t v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
    v54[6] = v38;
    v53[7] = @"Utiliztn_30-39%";
    uint64_t v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_RealFormat");
    v54[7] = v36;
    v53[8] = @"Utiliztn_30-39%_Transitions";
    uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
    v54[8] = v34;
    v53[9] = @"Utiliztn_40-49%";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
    v54[9] = v32;
    v53[10] = @"Utiliztn_40-49%_Transitions";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v54[10] = v30;
    v53[11] = @"Utiliztn_50-59%";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
    v54[11] = v28;
    v53[12] = @"Utiliztn_50-59%_Transitions";
    uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v54[12] = v26;
    v53[13] = @"Utiliztn_60-69%";
    uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
    v54[13] = v24;
    v53[14] = @"Utiliztn_60-69%_Transitions";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v54[14] = v22;
    v53[15] = @"Utiliztn_70-79%";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
    v54[15] = v20;
    v53[16] = @"Utiliztn_70-79%_Transitions";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v54[16] = v18;
    v53[17] = @"Utiliztn_80-89%";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
    v54[17] = v16;
    v53[18] = @"Utiliztn_80-89%_Transitions";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v54[18] = v14;
    v53[19] = @"Utiliztn_90-99%";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v54[19] = v4;
    v53[20] = @"Utiliztn_90-99%_Transitions";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v54[20] = v6;
    v53[21] = @"Utiliztn_100%";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    v54[21] = v8;
    void v53[22] = @"Utiliztn_100%_Transitions";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v54[22] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:23];
    v58[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionPPMStatsCPMSPowerReduction
{
  v158[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F56678] isCPMSSupported])
  {
    v157[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v155[0] = *MEMORY[0x1E4F92CD0];
    v155[1] = v2;
    v156[0] = &unk_1F29F06F0;
    v156[1] = @"logEventBackwardIOReport";
    v155[2] = *MEMORY[0x1E4F92C60];
    v156[2] = MEMORY[0x1E4F1CC28];
    uint64_t v152 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v156 forKeys:v155 count:3];
    v158[0] = v152;
    v157[1] = *MEMORY[0x1E4F92CA8];
    v153[0] = @"SampleTime";
    v151 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v150 = objc_msgSend(v151, "commonTypeDict_RealFormat_withUnit_s");
    v154[0] = v150;
    v153[1] = @"Sys100ms_0%";
    v149 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v148 = objc_msgSend(v149, "commonTypeDict_RealFormat");
    v154[1] = v148;
    v153[2] = @"Sys100ms_0%_Transitions";
    v147 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v146 = objc_msgSend(v147, "commonTypeDict_IntegerFormat");
    v154[2] = v146;
    v153[3] = @"Sys100ms_1-9%";
    v145 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v144 = objc_msgSend(v145, "commonTypeDict_RealFormat");
    v154[3] = v144;
    v153[4] = @"Sys100ms_1-9%_Transitions";
    v143 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v142 = objc_msgSend(v143, "commonTypeDict_IntegerFormat");
    v154[4] = v142;
    v153[5] = @"Sys100ms_10-19%";
    v141 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v140 = objc_msgSend(v141, "commonTypeDict_RealFormat");
    v154[5] = v140;
    v153[6] = @"Sys100ms_10-19%_Transitions";
    v139 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v138 = objc_msgSend(v139, "commonTypeDict_IntegerFormat");
    v154[6] = v138;
    v153[7] = @"Sys100ms_20-29%";
    v137 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v136 = objc_msgSend(v137, "commonTypeDict_RealFormat");
    v154[7] = v136;
    v153[8] = @"Sys100ms_20-29%_Transitions";
    v135 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v134 = objc_msgSend(v135, "commonTypeDict_IntegerFormat");
    v154[8] = v134;
    v153[9] = @"Sys100ms_30-39%";
    v133 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v132 = objc_msgSend(v133, "commonTypeDict_RealFormat");
    v154[9] = v132;
    v153[10] = @"Sys100ms_30-39%_Transitions";
    v131 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v130 = objc_msgSend(v131, "commonTypeDict_IntegerFormat");
    v154[10] = v130;
    v153[11] = @"Sys100ms_40-49%";
    v129 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v128 = objc_msgSend(v129, "commonTypeDict_RealFormat");
    v154[11] = v128;
    v153[12] = @"Sys100ms_40-49%_Transitions";
    uint64_t v127 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v126 = objc_msgSend(v127, "commonTypeDict_IntegerFormat");
    v154[12] = v126;
    v153[13] = @"Sys100ms_50-59%";
    v125 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v124 = objc_msgSend(v125, "commonTypeDict_RealFormat");
    v154[13] = v124;
    v153[14] = @"Sys100ms_50-59%_Transitions";
    v123 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v122 = objc_msgSend(v123, "commonTypeDict_IntegerFormat");
    v154[14] = v122;
    v153[15] = @"Sys100ms_60-69%";
    long long v121 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v120 = objc_msgSend(v121, "commonTypeDict_RealFormat");
    v154[15] = v120;
    v153[16] = @"Sys100ms_60-69%_Transitions";
    long long v119 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v118 = objc_msgSend(v119, "commonTypeDict_IntegerFormat");
    v154[16] = v118;
    v153[17] = @"Sys100ms_70-79%";
    v117 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v116 = objc_msgSend(v117, "commonTypeDict_RealFormat");
    v154[17] = v116;
    v153[18] = @"Sys100ms_70-79%_Transitions";
    long long v115 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v114 = objc_msgSend(v115, "commonTypeDict_IntegerFormat");
    v154[18] = v114;
    v153[19] = @"Sys100ms_80-89%";
    long long v113 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v112 = objc_msgSend(v113, "commonTypeDict_RealFormat");
    v154[19] = v112;
    v153[20] = @"Sys100ms_80-89%_Transitions";
    long long v111 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v110 = objc_msgSend(v111, "commonTypeDict_IntegerFormat");
    v154[20] = v110;
    v153[21] = @"Sys100ms_90-99%";
    long long v109 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v108 = objc_msgSend(v109, "commonTypeDict_RealFormat");
    v154[21] = v108;
    v153[22] = @"Sys100ms_90-99%_Transitions";
    v107 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v106 = objc_msgSend(v107, "commonTypeDict_IntegerFormat");
    v154[22] = v106;
    v153[23] = @"Sys100ms_100%";
    v105 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v104 = objc_msgSend(v105, "commonTypeDict_RealFormat");
    v154[23] = v104;
    v153[24] = @"Sys100ms_100%_Transitions";
    uint64_t v103 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v102 = objc_msgSend(v103, "commonTypeDict_IntegerFormat");
    v154[24] = v102;
    v153[25] = @"SysInst_0%";
    v101 = [MEMORY[0x1E4F929D8] sharedInstance];
    v100 = objc_msgSend(v101, "commonTypeDict_RealFormat");
    v154[25] = v100;
    v153[26] = @"SysInst_0%_Transitions";
    v99 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v98 = objc_msgSend(v99, "commonTypeDict_IntegerFormat");
    v154[26] = v98;
    v153[27] = @"SysInst_1-9%";
    id v97 = [MEMORY[0x1E4F929D8] sharedInstance];
    v96 = objc_msgSend(v97, "commonTypeDict_RealFormat");
    v154[27] = v96;
    v153[28] = @"SysInst_1-9%_Transitions";
    id v95 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v94 = objc_msgSend(v95, "commonTypeDict_IntegerFormat");
    v154[28] = v94;
    v153[29] = @"SysInst_10-19%";
    v93 = [MEMORY[0x1E4F929D8] sharedInstance];
    v92 = objc_msgSend(v93, "commonTypeDict_RealFormat");
    v154[29] = v92;
    v153[30] = @"SysInst_10-19%_Transitions";
    uint64_t v91 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v90 = objc_msgSend(v91, "commonTypeDict_IntegerFormat");
    v154[30] = v90;
    v153[31] = @"SysInst_20-29%";
    v89 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v88 = objc_msgSend(v89, "commonTypeDict_RealFormat");
    v154[31] = v88;
    v153[32] = @"SysInst_20-29%_Transitions";
    v87 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v86 = objc_msgSend(v87, "commonTypeDict_IntegerFormat");
    v154[32] = v86;
    v153[33] = @"SysInst_30-39%";
    v85 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v84 = objc_msgSend(v85, "commonTypeDict_RealFormat");
    v154[33] = v84;
    v153[34] = @"SysInst_30-39%_Transitions";
    int v83 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v82 = objc_msgSend(v83, "commonTypeDict_IntegerFormat");
    v154[34] = v82;
    v153[35] = @"SysInst_40-49%";
    char v81 = [MEMORY[0x1E4F929D8] sharedInstance];
    v80 = objc_msgSend(v81, "commonTypeDict_RealFormat");
    v154[35] = v80;
    v153[36] = @"SysInst_40-49%_Transitions";
    uint64_t v79 = [MEMORY[0x1E4F929D8] sharedInstance];
    v78 = objc_msgSend(v79, "commonTypeDict_IntegerFormat");
    v154[36] = v78;
    v153[37] = @"SysInst_50-59%";
    uint64_t v77 = [MEMORY[0x1E4F929D8] sharedInstance];
    v76 = objc_msgSend(v77, "commonTypeDict_RealFormat");
    v154[37] = v76;
    v153[38] = @"SysInst_50-59%_Transitions";
    uint64_t v75 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v74 = objc_msgSend(v75, "commonTypeDict_IntegerFormat");
    v154[38] = v74;
    v153[39] = @"SysInst_60-69%";
    uint64_t v73 = [MEMORY[0x1E4F929D8] sharedInstance];
    v72 = objc_msgSend(v73, "commonTypeDict_RealFormat");
    v154[39] = v72;
    v153[40] = @"SysInst_60-69%_Transitions";
    uint64_t v71 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v70 = objc_msgSend(v71, "commonTypeDict_IntegerFormat");
    v154[40] = v70;
    v153[41] = @"SysInst_70-79%";
    uint64_t v69 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v68 = objc_msgSend(v69, "commonTypeDict_RealFormat");
    v154[41] = v68;
    v153[42] = @"SysInst_70-79%_Transitions";
    uint64_t v67 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat");
    v154[42] = v66;
    v153[43] = @"SysInst_80-89%";
    uint64_t v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v64 = objc_msgSend(v65, "commonTypeDict_RealFormat");
    v154[43] = v64;
    v153[44] = @"SysInst_80-89%_Transitions";
    uint64_t v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat");
    v154[44] = v62;
    v153[45] = @"SysInst_90-99%";
    uint64_t v61 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v60 = objc_msgSend(v61, "commonTypeDict_RealFormat");
    v154[45] = v60;
    v153[46] = @"SysInst_90-99%_Transitions";
    uint64_t v59 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
    v154[46] = v58;
    v153[47] = @"SysInst_100%";
    uint64_t v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat");
    v154[47] = v56;
    v153[48] = @"SysInst_100%_Transitions";
    uint64_t v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
    v154[48] = v54;
    v153[49] = @"Sys1s_0%";
    uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v52 = objc_msgSend(v53, "commonTypeDict_RealFormat");
    v154[49] = v52;
    v153[50] = @"Sys1s_0%_Transitions";
    uint64_t v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
    v154[50] = v50;
    v153[51] = @"Sys1s_1-9%";
    uint64_t v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v49, "commonTypeDict_RealFormat");
    v154[51] = v48;
    v153[52] = @"Sys1s_1-9%_Transitions";
    uint64_t v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
    v154[52] = v46;
    v153[53] = @"Sys1s_10-19%";
    uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_RealFormat");
    v154[53] = v44;
    v153[54] = @"Sys1s_10-19%_Transitions";
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
    v154[54] = v42;
    v153[55] = @"Sys1s_20-29%";
    uint64_t v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_RealFormat");
    v154[55] = v40;
    v153[56] = @"Sys1s_20-29%_Transitions";
    uint64_t v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
    v154[56] = v38;
    v153[57] = @"Sys1s_30-39%";
    uint64_t v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_RealFormat");
    v154[57] = v36;
    v153[58] = @"Sys1s_30-39%_Transitions";
    uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
    v154[58] = v34;
    v153[59] = @"Sys1s_40-49%";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
    v154[59] = v32;
    v153[60] = @"Sys1s_40-49%_Transitions";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v154[60] = v30;
    v153[61] = @"Sys1s_50-59%";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
    v154[61] = v28;
    v153[62] = @"Sys1s_50-59%_Transitions";
    uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v154[62] = v26;
    v153[63] = @"Sys1s_60-69%";
    uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
    v154[63] = v24;
    v153[64] = @"Sys1s_60-69%_Transitions";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v154[64] = v22;
    v153[65] = @"Sys1s_70-79%";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
    v154[65] = v20;
    v153[66] = @"Sys1s_70-79%_Transitions";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v154[66] = v18;
    v153[67] = @"Sys1s_80-89%";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
    v154[67] = v16;
    v153[68] = @"Sys1s_80-89%_Transitions";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v154[68] = v14;
    v153[69] = @"Sys1s_90-99%";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v154[69] = v4;
    v153[70] = @"Sys1s_90-99%_Transitions";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v154[70] = v6;
    v153[71] = @"Sys1s_100%";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    v154[71] = v8;
    v153[72] = @"Sys1s_100%_Transitions";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v154[72] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v154 forKeys:v153 count:73];
    v158[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v158 forKeys:v157 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionPPMStatsCPMSFerocity
{
  v158[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F56678] isCPMSSupported])
  {
    v157[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v155[0] = *MEMORY[0x1E4F92CD0];
    v155[1] = v2;
    v156[0] = &unk_1F29F06F0;
    v156[1] = @"logEventBackwardIOReport";
    v155[2] = *MEMORY[0x1E4F92C60];
    v156[2] = MEMORY[0x1E4F1CC28];
    uint64_t v152 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v156 forKeys:v155 count:3];
    v158[0] = v152;
    v157[1] = *MEMORY[0x1E4F92CA8];
    v153[0] = @"SampleTime";
    v151 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v150 = objc_msgSend(v151, "commonTypeDict_RealFormat_withUnit_s");
    v154[0] = v150;
    v153[1] = @"Fer100ms_0%";
    v149 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v148 = objc_msgSend(v149, "commonTypeDict_RealFormat");
    v154[1] = v148;
    v153[2] = @"Fer100ms_0%_Transitions";
    v147 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v146 = objc_msgSend(v147, "commonTypeDict_IntegerFormat");
    v154[2] = v146;
    v153[3] = @"Fer100ms_1-9%";
    v145 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v144 = objc_msgSend(v145, "commonTypeDict_RealFormat");
    v154[3] = v144;
    v153[4] = @"Fer100ms_1-9%_Transitions";
    v143 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v142 = objc_msgSend(v143, "commonTypeDict_IntegerFormat");
    v154[4] = v142;
    v153[5] = @"Fer100ms_10-19%";
    v141 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v140 = objc_msgSend(v141, "commonTypeDict_RealFormat");
    v154[5] = v140;
    v153[6] = @"Fer100ms_10-19%_Transitions";
    v139 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v138 = objc_msgSend(v139, "commonTypeDict_IntegerFormat");
    v154[6] = v138;
    v153[7] = @"Fer100ms_20-29%";
    v137 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v136 = objc_msgSend(v137, "commonTypeDict_RealFormat");
    v154[7] = v136;
    v153[8] = @"Fer100ms_20-29%_Transitions";
    v135 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v134 = objc_msgSend(v135, "commonTypeDict_IntegerFormat");
    v154[8] = v134;
    v153[9] = @"Fer100ms_30-39%";
    v133 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v132 = objc_msgSend(v133, "commonTypeDict_RealFormat");
    v154[9] = v132;
    v153[10] = @"Fer100ms_30-39%_Transitions";
    v131 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v130 = objc_msgSend(v131, "commonTypeDict_IntegerFormat");
    v154[10] = v130;
    v153[11] = @"Fer100ms_40-49%";
    v129 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v128 = objc_msgSend(v129, "commonTypeDict_RealFormat");
    v154[11] = v128;
    v153[12] = @"Fer100ms_40-49%_Transitions";
    uint64_t v127 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v126 = objc_msgSend(v127, "commonTypeDict_IntegerFormat");
    v154[12] = v126;
    v153[13] = @"Fer100ms_50-59%";
    v125 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v124 = objc_msgSend(v125, "commonTypeDict_RealFormat");
    v154[13] = v124;
    v153[14] = @"Fer100ms_50-59%_Transitions";
    v123 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v122 = objc_msgSend(v123, "commonTypeDict_IntegerFormat");
    v154[14] = v122;
    v153[15] = @"Fer100ms_60-69%";
    long long v121 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v120 = objc_msgSend(v121, "commonTypeDict_RealFormat");
    v154[15] = v120;
    v153[16] = @"Fer100ms_60-69%_Transitions";
    long long v119 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v118 = objc_msgSend(v119, "commonTypeDict_IntegerFormat");
    v154[16] = v118;
    v153[17] = @"Fer100ms_70-79%";
    v117 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v116 = objc_msgSend(v117, "commonTypeDict_RealFormat");
    v154[17] = v116;
    v153[18] = @"Fer100ms_70-79%_Transitions";
    long long v115 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v114 = objc_msgSend(v115, "commonTypeDict_IntegerFormat");
    v154[18] = v114;
    v153[19] = @"Fer100ms_80-89%";
    long long v113 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v112 = objc_msgSend(v113, "commonTypeDict_RealFormat");
    v154[19] = v112;
    v153[20] = @"Fer100ms_80-89%_Transitions";
    long long v111 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v110 = objc_msgSend(v111, "commonTypeDict_IntegerFormat");
    v154[20] = v110;
    v153[21] = @"Fer100ms_90-99%";
    long long v109 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v108 = objc_msgSend(v109, "commonTypeDict_RealFormat");
    v154[21] = v108;
    v153[22] = @"Fer100ms_90-99%_Transitions";
    v107 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v106 = objc_msgSend(v107, "commonTypeDict_IntegerFormat");
    v154[22] = v106;
    v153[23] = @"Fer100ms_100%";
    v105 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v104 = objc_msgSend(v105, "commonTypeDict_RealFormat");
    v154[23] = v104;
    v153[24] = @"Fer100ms_100%_Transitions";
    uint64_t v103 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v102 = objc_msgSend(v103, "commonTypeDict_IntegerFormat");
    v154[24] = v102;
    v153[25] = @"FerInst_0%";
    v101 = [MEMORY[0x1E4F929D8] sharedInstance];
    v100 = objc_msgSend(v101, "commonTypeDict_RealFormat");
    v154[25] = v100;
    v153[26] = @"FerInst_0%_Transitions";
    v99 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v98 = objc_msgSend(v99, "commonTypeDict_IntegerFormat");
    v154[26] = v98;
    v153[27] = @"FerInst_1-9%";
    id v97 = [MEMORY[0x1E4F929D8] sharedInstance];
    v96 = objc_msgSend(v97, "commonTypeDict_RealFormat");
    v154[27] = v96;
    v153[28] = @"FerInst_1-9%_Transitions";
    id v95 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v94 = objc_msgSend(v95, "commonTypeDict_IntegerFormat");
    v154[28] = v94;
    v153[29] = @"FerInst_10-19%";
    v93 = [MEMORY[0x1E4F929D8] sharedInstance];
    v92 = objc_msgSend(v93, "commonTypeDict_RealFormat");
    v154[29] = v92;
    v153[30] = @"FerInst_10-19%_Transitions";
    uint64_t v91 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v90 = objc_msgSend(v91, "commonTypeDict_IntegerFormat");
    v154[30] = v90;
    v153[31] = @"FerInst_20-29%";
    v89 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v88 = objc_msgSend(v89, "commonTypeDict_RealFormat");
    v154[31] = v88;
    v153[32] = @"FerInst_20-29%_Transitions";
    v87 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v86 = objc_msgSend(v87, "commonTypeDict_IntegerFormat");
    v154[32] = v86;
    v153[33] = @"FerInst_30-39%";
    v85 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v84 = objc_msgSend(v85, "commonTypeDict_RealFormat");
    v154[33] = v84;
    v153[34] = @"FerInst_30-39%_Transitions";
    int v83 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v82 = objc_msgSend(v83, "commonTypeDict_IntegerFormat");
    v154[34] = v82;
    v153[35] = @"FerInst_40-49%";
    char v81 = [MEMORY[0x1E4F929D8] sharedInstance];
    v80 = objc_msgSend(v81, "commonTypeDict_RealFormat");
    v154[35] = v80;
    v153[36] = @"FerInst_40-49%_Transitions";
    uint64_t v79 = [MEMORY[0x1E4F929D8] sharedInstance];
    v78 = objc_msgSend(v79, "commonTypeDict_IntegerFormat");
    v154[36] = v78;
    v153[37] = @"FerInst_50-59%";
    uint64_t v77 = [MEMORY[0x1E4F929D8] sharedInstance];
    v76 = objc_msgSend(v77, "commonTypeDict_RealFormat");
    v154[37] = v76;
    v153[38] = @"FerInst_50-59%_Transitions";
    uint64_t v75 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v74 = objc_msgSend(v75, "commonTypeDict_IntegerFormat");
    v154[38] = v74;
    v153[39] = @"FerInst_60-69%";
    uint64_t v73 = [MEMORY[0x1E4F929D8] sharedInstance];
    v72 = objc_msgSend(v73, "commonTypeDict_RealFormat");
    v154[39] = v72;
    v153[40] = @"FerInst_60-69%_Transitions";
    uint64_t v71 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v70 = objc_msgSend(v71, "commonTypeDict_IntegerFormat");
    v154[40] = v70;
    v153[41] = @"FerInst_70-79%";
    uint64_t v69 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v68 = objc_msgSend(v69, "commonTypeDict_RealFormat");
    v154[41] = v68;
    v153[42] = @"FerInst_70-79%_Transitions";
    uint64_t v67 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat");
    v154[42] = v66;
    v153[43] = @"FerInst_80-89%";
    uint64_t v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v64 = objc_msgSend(v65, "commonTypeDict_RealFormat");
    v154[43] = v64;
    v153[44] = @"FerInst_80-89%_Transitions";
    uint64_t v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat");
    v154[44] = v62;
    v153[45] = @"FerInst_90-99%";
    uint64_t v61 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v60 = objc_msgSend(v61, "commonTypeDict_RealFormat");
    v154[45] = v60;
    v153[46] = @"FerInst_90-99%_Transitions";
    uint64_t v59 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
    v154[46] = v58;
    v153[47] = @"FerInst_100%";
    uint64_t v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat");
    v154[47] = v56;
    v153[48] = @"FerInst_100%_Transitions";
    uint64_t v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
    v154[48] = v54;
    v153[49] = @"Fer1s_0%";
    uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v52 = objc_msgSend(v53, "commonTypeDict_RealFormat");
    v154[49] = v52;
    v153[50] = @"Fer1s_0%_Transitions";
    uint64_t v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
    v154[50] = v50;
    v153[51] = @"Fer1s_1-9%";
    uint64_t v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v49, "commonTypeDict_RealFormat");
    v154[51] = v48;
    v153[52] = @"Fer1s_1-9%_Transitions";
    uint64_t v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
    v154[52] = v46;
    v153[53] = @"Fer1s_10-19%";
    uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_RealFormat");
    v154[53] = v44;
    v153[54] = @"Fer1s_10-19%_Transitions";
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
    v154[54] = v42;
    v153[55] = @"Fer1s_20-29%";
    uint64_t v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_RealFormat");
    v154[55] = v40;
    v153[56] = @"Fer1s_20-29%_Transitions";
    uint64_t v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
    v154[56] = v38;
    v153[57] = @"Fer1s_30-39%";
    uint64_t v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_RealFormat");
    v154[57] = v36;
    v153[58] = @"Fer1s_30-39%_Transitions";
    uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
    v154[58] = v34;
    v153[59] = @"Fer1s_40-49%";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
    v154[59] = v32;
    v153[60] = @"Fer1s_40-49%_Transitions";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v154[60] = v30;
    v153[61] = @"Fer1s_50-59%";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
    v154[61] = v28;
    v153[62] = @"Fer1s_50-59%_Transitions";
    uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v154[62] = v26;
    v153[63] = @"Fer1s_60-69%";
    uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
    v154[63] = v24;
    v153[64] = @"Fer1s_60-69%_Transitions";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v154[64] = v22;
    v153[65] = @"Fer1s_70-79%";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
    v154[65] = v20;
    v153[66] = @"Fer1s_70-79%_Transitions";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v154[66] = v18;
    v153[67] = @"Fer1s_80-89%";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
    v154[67] = v16;
    v153[68] = @"Fer1s_80-89%_Transitions";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v154[68] = v14;
    v153[69] = @"Fer1s_90-99%";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v154[69] = v4;
    v153[70] = @"Fer1s_90-99%_Transitions";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v154[70] = v6;
    v153[71] = @"Fer1s_100%";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    v154[71] = v8;
    v153[72] = @"Fer1s_100%_Transitions";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v154[72] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v154 forKeys:v153 count:73];
    v158[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v158 forKeys:v157 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionPPMStatsPeakPowerPressure
{
  void v30[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F56678] isCPMSSupported])
  {
    v29[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v27[0] = *MEMORY[0x1E4F92CD0];
    v27[1] = v2;
    v28[0] = &unk_1F29F06F0;
    v28[1] = @"logEventBackwardIOReport";
    void v27[2] = *MEMORY[0x1E4F92C60];
    void v28[2] = MEMORY[0x1E4F1CC28];
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
    v30[0] = v24;
    v29[1] = *MEMORY[0x1E4F92CA8];
    v25[0] = @"SampleTime";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat_withUnit_s");
    v26[0] = v22;
    v25[1] = @"PPPNotif_0";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
    v26[1] = v20;
    void v25[2] = @"PPPNotif_0_Transitions";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    void v26[2] = v18;
    v25[3] = @"PPPNotif_1";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
    v26[3] = v16;
    v25[4] = @"PPPNotif_1_Transitions";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    void v26[4] = v14;
    void v25[5] = @"PPPNotif_2";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v26[5] = v4;
    void v25[6] = @"PPPNotif_2_Transitions";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v26[6] = v6;
    v25[7] = @"PPPNotif_3";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    v26[7] = v8;
    void v25[8] = @"PPPNotif_3_Transitions";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v26[8] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:9];
    v30[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionPPMStatsPolicyCPMS
{
  v350[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F56678] isCPMSSupported])
  {
    v349[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v347[0] = *MEMORY[0x1E4F92CD0];
    v347[1] = v2;
    v348[0] = &unk_1F29F06F0;
    v348[1] = @"logEventBackwardIOReport";
    v347[2] = *MEMORY[0x1E4F92C60];
    v348[2] = MEMORY[0x1E4F1CC28];
    v344 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v348 forKeys:v347 count:3];
    v350[0] = v344;
    v349[1] = *MEMORY[0x1E4F92CA8];
    v345[0] = @"SampleTime";
    v343 = [MEMORY[0x1E4F929D8] sharedInstance];
    v342 = objc_msgSend(v343, "commonTypeDict_RealFormat_withUnit_s");
    v346[0] = v342;
    v345[1] = @"ServoCE0_0%";
    v341 = [MEMORY[0x1E4F929D8] sharedInstance];
    v340 = objc_msgSend(v341, "commonTypeDict_RealFormat");
    v346[1] = v340;
    v345[2] = @"ServoCE0_0%_Transitions";
    v339 = [MEMORY[0x1E4F929D8] sharedInstance];
    v338 = objc_msgSend(v339, "commonTypeDict_IntegerFormat");
    v346[2] = v338;
    v345[3] = @"ServoCE0_1-9%";
    v337 = [MEMORY[0x1E4F929D8] sharedInstance];
    v336 = objc_msgSend(v337, "commonTypeDict_RealFormat");
    v346[3] = v336;
    v345[4] = @"ServoCE0_1-9%_Transitions";
    v335 = [MEMORY[0x1E4F929D8] sharedInstance];
    v334 = objc_msgSend(v335, "commonTypeDict_IntegerFormat");
    v346[4] = v334;
    v345[5] = @"ServoCE0_10-19%";
    v333 = [MEMORY[0x1E4F929D8] sharedInstance];
    v332 = objc_msgSend(v333, "commonTypeDict_RealFormat");
    v346[5] = v332;
    v345[6] = @"ServoCE0_10-19%_Transitions";
    v331 = [MEMORY[0x1E4F929D8] sharedInstance];
    v330 = objc_msgSend(v331, "commonTypeDict_IntegerFormat");
    v346[6] = v330;
    v345[7] = @"ServoCE0_20-29%";
    v329 = [MEMORY[0x1E4F929D8] sharedInstance];
    v328 = objc_msgSend(v329, "commonTypeDict_RealFormat");
    v346[7] = v328;
    v345[8] = @"ServoCE0_20-29%_Transitions";
    v327 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v326 = objc_msgSend(v327, "commonTypeDict_IntegerFormat");
    v346[8] = v326;
    v345[9] = @"ServoCE0_30-39%";
    v325 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v324 = objc_msgSend(v325, "commonTypeDict_RealFormat");
    v346[9] = v324;
    v345[10] = @"ServoCE0_30-39%_Transitions";
    v323 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v322 = objc_msgSend(v323, "commonTypeDict_IntegerFormat");
    v346[10] = v322;
    v345[11] = @"ServoCE0_40-49%";
    v321 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v320 = objc_msgSend(v321, "commonTypeDict_RealFormat");
    v346[11] = v320;
    v345[12] = @"ServoCE0_40-49%_Transitions";
    v319 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v318 = objc_msgSend(v319, "commonTypeDict_IntegerFormat");
    v346[12] = v318;
    v345[13] = @"ServoCE0_50-59%";
    v317 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v316 = objc_msgSend(v317, "commonTypeDict_RealFormat");
    v346[13] = v316;
    v345[14] = @"ServoCE0_50-59%_Transitions";
    v315 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v314 = objc_msgSend(v315, "commonTypeDict_IntegerFormat");
    v346[14] = v314;
    v345[15] = @"ServoCE0_60-69%";
    v313 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v312 = objc_msgSend(v313, "commonTypeDict_RealFormat");
    v346[15] = v312;
    v345[16] = @"ServoCE0_60-69%_Transitions";
    v311 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v310 = objc_msgSend(v311, "commonTypeDict_IntegerFormat");
    v346[16] = v310;
    v345[17] = @"ServoCE0_70-79%";
    v309 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v308 = objc_msgSend(v309, "commonTypeDict_RealFormat");
    v346[17] = v308;
    v345[18] = @"ServoCE0_70-79%_Transitions";
    v307 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v306 = objc_msgSend(v307, "commonTypeDict_IntegerFormat");
    v346[18] = v306;
    v345[19] = @"ServoCE0_80-89%";
    v305 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v304 = objc_msgSend(v305, "commonTypeDict_RealFormat");
    v346[19] = v304;
    v345[20] = @"ServoCE0_80-89%_Transitions";
    v303 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v302 = objc_msgSend(v303, "commonTypeDict_IntegerFormat");
    v346[20] = v302;
    v345[21] = @"ServoCE0_90-99%";
    v301 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v300 = objc_msgSend(v301, "commonTypeDict_RealFormat");
    v346[21] = v300;
    v345[22] = @"ServoCE0_90-99%_Transitions";
    v299 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v298 = objc_msgSend(v299, "commonTypeDict_IntegerFormat");
    v346[22] = v298;
    v345[23] = @"ServoCE0_100%";
    v297 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v296 = objc_msgSend(v297, "commonTypeDict_RealFormat");
    v346[23] = v296;
    v345[24] = @"ServoCE0_100%_Transitions";
    v295 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v294 = objc_msgSend(v295, "commonTypeDict_IntegerFormat");
    v346[24] = v294;
    v345[25] = @"ServoCE1_0%";
    v293 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v292 = objc_msgSend(v293, "commonTypeDict_RealFormat");
    v346[25] = v292;
    v345[26] = @"ServoCE1_0%_Transitions";
    v291 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v290 = objc_msgSend(v291, "commonTypeDict_IntegerFormat");
    v346[26] = v290;
    v345[27] = @"ServoCE1_1-9%";
    v289 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v288 = objc_msgSend(v289, "commonTypeDict_RealFormat");
    v346[27] = v288;
    v345[28] = @"ServoCE1_1-9%_Transitions";
    v287 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v286 = objc_msgSend(v287, "commonTypeDict_IntegerFormat");
    v346[28] = v286;
    v345[29] = @"ServoCE1_10-19%";
    v285 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v284 = objc_msgSend(v285, "commonTypeDict_RealFormat");
    v346[29] = v284;
    v345[30] = @"ServoCE1_10-19%_Transitions";
    v283 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v282 = objc_msgSend(v283, "commonTypeDict_IntegerFormat");
    v346[30] = v282;
    v345[31] = @"ServoCE1_20-29%";
    v281 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v280 = objc_msgSend(v281, "commonTypeDict_RealFormat");
    v346[31] = v280;
    v345[32] = @"ServoCE1_20-29%_Transitions";
    v279 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v278 = objc_msgSend(v279, "commonTypeDict_IntegerFormat");
    v346[32] = v278;
    v345[33] = @"ServoCE1_30-39%";
    v277 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v276 = objc_msgSend(v277, "commonTypeDict_RealFormat");
    v346[33] = v276;
    v345[34] = @"ServoCE1_30-39%_Transitions";
    v275 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v274 = objc_msgSend(v275, "commonTypeDict_IntegerFormat");
    v346[34] = v274;
    v345[35] = @"ServoCE1_40-49%";
    v273 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v272 = objc_msgSend(v273, "commonTypeDict_RealFormat");
    v346[35] = v272;
    v345[36] = @"ServoCE1_40-49%_Transitions";
    v271 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v270 = objc_msgSend(v271, "commonTypeDict_IntegerFormat");
    v346[36] = v270;
    v345[37] = @"ServoCE1_50-59%";
    v269 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v268 = objc_msgSend(v269, "commonTypeDict_RealFormat");
    v346[37] = v268;
    v345[38] = @"ServoCE1_50-59%_Transitions";
    v267 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v266 = objc_msgSend(v267, "commonTypeDict_IntegerFormat");
    v346[38] = v266;
    v345[39] = @"ServoCE1_60-69%";
    v265 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v264 = objc_msgSend(v265, "commonTypeDict_RealFormat");
    v346[39] = v264;
    v345[40] = @"ServoCE1_60-69%_Transitions";
    v263 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v262 = objc_msgSend(v263, "commonTypeDict_IntegerFormat");
    v346[40] = v262;
    v345[41] = @"ServoCE1_70-79%";
    v261 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v260 = objc_msgSend(v261, "commonTypeDict_RealFormat");
    v346[41] = v260;
    v345[42] = @"ServoCE1_70-79%_Transitions";
    v259 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v258 = objc_msgSend(v259, "commonTypeDict_IntegerFormat");
    v346[42] = v258;
    v345[43] = @"ServoCE1_80-89%";
    v257 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v256 = objc_msgSend(v257, "commonTypeDict_RealFormat");
    v346[43] = v256;
    v345[44] = @"ServoCE1_80-89%_Transitions";
    v255 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v254 = objc_msgSend(v255, "commonTypeDict_IntegerFormat");
    v346[44] = v254;
    v345[45] = @"ServoCE1_90-99%";
    v253 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v252 = objc_msgSend(v253, "commonTypeDict_RealFormat");
    v346[45] = v252;
    v345[46] = @"ServoCE1_90-99%_Transitions";
    v251 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v250 = objc_msgSend(v251, "commonTypeDict_IntegerFormat");
    v346[46] = v250;
    v345[47] = @"ServoCE1_100%";
    v249 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v248 = objc_msgSend(v249, "commonTypeDict_RealFormat");
    v346[47] = v248;
    v345[48] = @"ServoCE1_100%_Transitions";
    v247 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v246 = objc_msgSend(v247, "commonTypeDict_IntegerFormat");
    v346[48] = v246;
    v345[49] = @"ServoCE2_0%";
    v245 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v244 = objc_msgSend(v245, "commonTypeDict_RealFormat");
    v346[49] = v244;
    v345[50] = @"ServoCE2_0%_Transitions";
    v243 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v242 = objc_msgSend(v243, "commonTypeDict_IntegerFormat");
    v346[50] = v242;
    v345[51] = @"ServoCE2_1-9%";
    v241 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v240 = objc_msgSend(v241, "commonTypeDict_RealFormat");
    v346[51] = v240;
    v345[52] = @"ServoCE2_1-9%_Transitions";
    v239 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v238 = objc_msgSend(v239, "commonTypeDict_IntegerFormat");
    v346[52] = v238;
    v345[53] = @"ServoCE2_10-19%";
    v237 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v236 = objc_msgSend(v237, "commonTypeDict_RealFormat");
    v346[53] = v236;
    v345[54] = @"ServoCE2_10-19%_Transitions";
    v235 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v234 = objc_msgSend(v235, "commonTypeDict_IntegerFormat");
    v346[54] = v234;
    v345[55] = @"ServoCE2_20-29%";
    v233 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v232 = objc_msgSend(v233, "commonTypeDict_RealFormat");
    v346[55] = v232;
    v345[56] = @"ServoCE2_20-29%_Transitions";
    v231 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v230 = objc_msgSend(v231, "commonTypeDict_IntegerFormat");
    v346[56] = v230;
    v345[57] = @"ServoCE2_30-39%";
    v229 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v228 = objc_msgSend(v229, "commonTypeDict_RealFormat");
    v346[57] = v228;
    v345[58] = @"ServoCE2_30-39%_Transitions";
    v227 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v226 = objc_msgSend(v227, "commonTypeDict_IntegerFormat");
    v346[58] = v226;
    v345[59] = @"ServoCE2_40-49%";
    v225 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v224 = objc_msgSend(v225, "commonTypeDict_RealFormat");
    v346[59] = v224;
    v345[60] = @"ServoCE2_40-49%_Transitions";
    v223 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v222 = objc_msgSend(v223, "commonTypeDict_IntegerFormat");
    v346[60] = v222;
    v345[61] = @"ServoCE2_50-59%";
    v221 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v220 = objc_msgSend(v221, "commonTypeDict_RealFormat");
    v346[61] = v220;
    v345[62] = @"ServoCE2_50-59%_Transitions";
    v219 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v218 = objc_msgSend(v219, "commonTypeDict_IntegerFormat");
    v346[62] = v218;
    v345[63] = @"ServoCE2_60-69%";
    uint64_t v217 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v216 = objc_msgSend(v217, "commonTypeDict_RealFormat");
    v346[63] = v216;
    v345[64] = @"ServoCE2_60-69%_Transitions";
    v215 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v214 = objc_msgSend(v215, "commonTypeDict_IntegerFormat");
    v346[64] = v214;
    v345[65] = @"ServoCE2_70-79%";
    v213 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v212 = objc_msgSend(v213, "commonTypeDict_RealFormat");
    v346[65] = v212;
    v345[66] = @"ServoCE2_70-79%_Transitions";
    v211 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v210 = objc_msgSend(v211, "commonTypeDict_IntegerFormat");
    v346[66] = v210;
    v345[67] = @"ServoCE2_80-89%";
    v209 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v208 = objc_msgSend(v209, "commonTypeDict_RealFormat");
    v346[67] = v208;
    v345[68] = @"ServoCE2_80-89%_Transitions";
    v207 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v206 = objc_msgSend(v207, "commonTypeDict_IntegerFormat");
    v346[68] = v206;
    v345[69] = @"ServoCE2_90-99%";
    v205 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v204 = objc_msgSend(v205, "commonTypeDict_RealFormat");
    v346[69] = v204;
    v345[70] = @"ServoCE2_90-99%_Transitions";
    v203 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v202 = objc_msgSend(v203, "commonTypeDict_IntegerFormat");
    v346[70] = v202;
    v345[71] = @"ServoCE2_100%";
    v201 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v200 = objc_msgSend(v201, "commonTypeDict_RealFormat");
    v346[71] = v200;
    v345[72] = @"ServoCE2_100%_Transitions";
    v199 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v198 = objc_msgSend(v199, "commonTypeDict_IntegerFormat");
    v346[72] = v198;
    v345[73] = @"ServoCE3_0%";
    v197 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v196 = objc_msgSend(v197, "commonTypeDict_RealFormat");
    v346[73] = v196;
    v345[74] = @"ServoCE3_0%_Transitions";
    v195 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v194 = objc_msgSend(v195, "commonTypeDict_IntegerFormat");
    v346[74] = v194;
    v345[75] = @"ServoCE3_1-9%";
    v193 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v192 = objc_msgSend(v193, "commonTypeDict_RealFormat");
    v346[75] = v192;
    v345[76] = @"ServoCE3_1-9%_Transitions";
    v191 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v190 = objc_msgSend(v191, "commonTypeDict_IntegerFormat");
    v346[76] = v190;
    v345[77] = @"ServoCE3_10-19%";
    v189 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v188 = objc_msgSend(v189, "commonTypeDict_RealFormat");
    v346[77] = v188;
    v345[78] = @"ServoCE3_10-19%_Transitions";
    v187 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v186 = objc_msgSend(v187, "commonTypeDict_IntegerFormat");
    v346[78] = v186;
    v345[79] = @"ServoCE3_20-29%";
    v185 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v184 = objc_msgSend(v185, "commonTypeDict_RealFormat");
    v346[79] = v184;
    v345[80] = @"ServoCE3_20-29%_Transitions";
    v183 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v182 = objc_msgSend(v183, "commonTypeDict_IntegerFormat");
    v346[80] = v182;
    v345[81] = @"ServoCE3_30-39%";
    v181 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v180 = objc_msgSend(v181, "commonTypeDict_RealFormat");
    v346[81] = v180;
    v345[82] = @"ServoCE3_30-39%_Transitions";
    v179 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v178 = objc_msgSend(v179, "commonTypeDict_IntegerFormat");
    v346[82] = v178;
    v345[83] = @"ServoCE3_40-49%";
    v177 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v176 = objc_msgSend(v177, "commonTypeDict_RealFormat");
    v346[83] = v176;
    v345[84] = @"ServoCE3_40-49%_Transitions";
    v175 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v174 = objc_msgSend(v175, "commonTypeDict_IntegerFormat");
    v346[84] = v174;
    v345[85] = @"ServoCE3_50-59%";
    v173 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v172 = objc_msgSend(v173, "commonTypeDict_RealFormat");
    v346[85] = v172;
    v345[86] = @"ServoCE3_50-59%_Transitions";
    v171 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v170 = objc_msgSend(v171, "commonTypeDict_IntegerFormat");
    v346[86] = v170;
    v345[87] = @"ServoCE3_60-69%";
    v169 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v168 = objc_msgSend(v169, "commonTypeDict_RealFormat");
    v346[87] = v168;
    v345[88] = @"ServoCE3_60-69%_Transitions";
    v167 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v166 = objc_msgSend(v167, "commonTypeDict_IntegerFormat");
    v346[88] = v166;
    v345[89] = @"ServoCE3_70-79%";
    v165 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v164 = objc_msgSend(v165, "commonTypeDict_RealFormat");
    v346[89] = v164;
    v345[90] = @"ServoCE3_70-79%_Transitions";
    v163 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v162 = objc_msgSend(v163, "commonTypeDict_IntegerFormat");
    v346[90] = v162;
    v345[91] = @"ServoCE3_80-89%";
    v161 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v160 = objc_msgSend(v161, "commonTypeDict_RealFormat");
    v346[91] = v160;
    v345[92] = @"ServoCE3_80-89%_Transitions";
    v159 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v158 = objc_msgSend(v159, "commonTypeDict_IntegerFormat");
    v346[92] = v158;
    v345[93] = @"ServoCE3_90-99%";
    v157 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v156 = objc_msgSend(v157, "commonTypeDict_RealFormat");
    v346[93] = v156;
    v345[94] = @"ServoCE3_90-99%_Transitions";
    v155 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v154 = objc_msgSend(v155, "commonTypeDict_IntegerFormat");
    v346[94] = v154;
    v345[95] = @"ServoCE3_100%";
    v153 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v152 = objc_msgSend(v153, "commonTypeDict_RealFormat");
    v346[95] = v152;
    v345[96] = @"ServoCE3_100%_Transitions";
    v151 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v150 = objc_msgSend(v151, "commonTypeDict_IntegerFormat");
    v346[96] = v150;
    v345[97] = @"ServoCE4_0%";
    v149 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v148 = objc_msgSend(v149, "commonTypeDict_RealFormat");
    v346[97] = v148;
    v345[98] = @"ServoCE4_0%_Transitions";
    v147 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v146 = objc_msgSend(v147, "commonTypeDict_IntegerFormat");
    v346[98] = v146;
    v345[99] = @"ServoCE4_1-9%";
    v145 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v144 = objc_msgSend(v145, "commonTypeDict_RealFormat");
    v346[99] = v144;
    v345[100] = @"ServoCE4_1-9%_Transitions";
    v143 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v142 = objc_msgSend(v143, "commonTypeDict_IntegerFormat");
    v346[100] = v142;
    v345[101] = @"ServoCE4_10-19%";
    v141 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v140 = objc_msgSend(v141, "commonTypeDict_RealFormat");
    v346[101] = v140;
    v345[102] = @"ServoCE4_10-19%_Transitions";
    v139 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v138 = objc_msgSend(v139, "commonTypeDict_IntegerFormat");
    v346[102] = v138;
    v345[103] = @"ServoCE4_20-29%";
    v137 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v136 = objc_msgSend(v137, "commonTypeDict_RealFormat");
    v346[103] = v136;
    v345[104] = @"ServoCE4_20-29%_Transitions";
    v135 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v134 = objc_msgSend(v135, "commonTypeDict_IntegerFormat");
    v346[104] = v134;
    v345[105] = @"ServoCE4_30-39%";
    v133 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v132 = objc_msgSend(v133, "commonTypeDict_RealFormat");
    v346[105] = v132;
    v345[106] = @"ServoCE4_30-39%_Transitions";
    v131 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v130 = objc_msgSend(v131, "commonTypeDict_IntegerFormat");
    v346[106] = v130;
    v345[107] = @"ServoCE4_40-49%";
    v129 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v128 = objc_msgSend(v129, "commonTypeDict_RealFormat");
    v346[107] = v128;
    v345[108] = @"ServoCE4_40-49%_Transitions";
    uint64_t v127 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v126 = objc_msgSend(v127, "commonTypeDict_IntegerFormat");
    v346[108] = v126;
    v345[109] = @"ServoCE4_50-59%";
    v125 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v124 = objc_msgSend(v125, "commonTypeDict_RealFormat");
    v346[109] = v124;
    v345[110] = @"ServoCE4_50-59%_Transitions";
    v123 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v122 = objc_msgSend(v123, "commonTypeDict_IntegerFormat");
    v346[110] = v122;
    v345[111] = @"ServoCE4_60-69%";
    long long v121 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v120 = objc_msgSend(v121, "commonTypeDict_RealFormat");
    v346[111] = v120;
    v345[112] = @"ServoCE4_60-69%_Transitions";
    long long v119 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v118 = objc_msgSend(v119, "commonTypeDict_IntegerFormat");
    v346[112] = v118;
    v345[113] = @"ServoCE4_70-79%";
    v117 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v116 = objc_msgSend(v117, "commonTypeDict_RealFormat");
    v346[113] = v116;
    v345[114] = @"ServoCE4_70-79%_Transitions";
    long long v115 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v114 = objc_msgSend(v115, "commonTypeDict_IntegerFormat");
    v346[114] = v114;
    v345[115] = @"ServoCE4_80-89%";
    long long v113 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v112 = objc_msgSend(v113, "commonTypeDict_RealFormat");
    v346[115] = v112;
    v345[116] = @"ServoCE4_80-89%_Transitions";
    long long v111 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v110 = objc_msgSend(v111, "commonTypeDict_IntegerFormat");
    v346[116] = v110;
    v345[117] = @"ServoCE4_90-99%";
    long long v109 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v108 = objc_msgSend(v109, "commonTypeDict_RealFormat");
    v346[117] = v108;
    v345[118] = @"ServoCE4_90-99%_Transitions";
    v107 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v106 = objc_msgSend(v107, "commonTypeDict_IntegerFormat");
    v346[118] = v106;
    v345[119] = @"ServoCE4_100%";
    v105 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v104 = objc_msgSend(v105, "commonTypeDict_RealFormat");
    v346[119] = v104;
    v345[120] = @"ServoCE4_100%_Transitions";
    uint64_t v103 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v102 = objc_msgSend(v103, "commonTypeDict_IntegerFormat");
    v346[120] = v102;
    v345[121] = @"ServoCE5_0%";
    v101 = [MEMORY[0x1E4F929D8] sharedInstance];
    v100 = objc_msgSend(v101, "commonTypeDict_RealFormat");
    v346[121] = v100;
    v345[122] = @"ServoCE5_0%_Transitions";
    v99 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v98 = objc_msgSend(v99, "commonTypeDict_IntegerFormat");
    v346[122] = v98;
    v345[123] = @"ServoCE5_1-9%";
    id v97 = [MEMORY[0x1E4F929D8] sharedInstance];
    v96 = objc_msgSend(v97, "commonTypeDict_RealFormat");
    v346[123] = v96;
    v345[124] = @"ServoCE5_1-9%_Transitions";
    id v95 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v94 = objc_msgSend(v95, "commonTypeDict_IntegerFormat");
    v346[124] = v94;
    v345[125] = @"ServoCE5_10-19%";
    v93 = [MEMORY[0x1E4F929D8] sharedInstance];
    v92 = objc_msgSend(v93, "commonTypeDict_RealFormat");
    v346[125] = v92;
    v345[126] = @"ServoCE5_10-19%_Transitions";
    uint64_t v91 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v90 = objc_msgSend(v91, "commonTypeDict_IntegerFormat");
    v346[126] = v90;
    v345[127] = @"ServoCE5_20-29%";
    v89 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v88 = objc_msgSend(v89, "commonTypeDict_RealFormat");
    v346[127] = v88;
    v345[128] = @"ServoCE5_20-29%_Transitions";
    v87 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v86 = objc_msgSend(v87, "commonTypeDict_IntegerFormat");
    v346[128] = v86;
    v345[129] = @"ServoCE5_30-39%";
    v85 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v84 = objc_msgSend(v85, "commonTypeDict_RealFormat");
    v346[129] = v84;
    v345[130] = @"ServoCE5_30-39%_Transitions";
    int v83 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v82 = objc_msgSend(v83, "commonTypeDict_IntegerFormat");
    v346[130] = v82;
    v345[131] = @"ServoCE5_40-49%";
    char v81 = [MEMORY[0x1E4F929D8] sharedInstance];
    v80 = objc_msgSend(v81, "commonTypeDict_RealFormat");
    v346[131] = v80;
    v345[132] = @"ServoCE5_40-49%_Transitions";
    uint64_t v79 = [MEMORY[0x1E4F929D8] sharedInstance];
    v78 = objc_msgSend(v79, "commonTypeDict_IntegerFormat");
    v346[132] = v78;
    v345[133] = @"ServoCE5_50-59%";
    uint64_t v77 = [MEMORY[0x1E4F929D8] sharedInstance];
    v76 = objc_msgSend(v77, "commonTypeDict_RealFormat");
    v346[133] = v76;
    v345[134] = @"ServoCE5_50-59%_Transitions";
    uint64_t v75 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v74 = objc_msgSend(v75, "commonTypeDict_IntegerFormat");
    v346[134] = v74;
    v345[135] = @"ServoCE5_60-69%";
    uint64_t v73 = [MEMORY[0x1E4F929D8] sharedInstance];
    v72 = objc_msgSend(v73, "commonTypeDict_RealFormat");
    v346[135] = v72;
    v345[136] = @"ServoCE5_60-69%_Transitions";
    uint64_t v71 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v70 = objc_msgSend(v71, "commonTypeDict_IntegerFormat");
    v346[136] = v70;
    v345[137] = @"ServoCE5_70-79%";
    uint64_t v69 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v68 = objc_msgSend(v69, "commonTypeDict_RealFormat");
    v346[137] = v68;
    v345[138] = @"ServoCE5_70-79%_Transitions";
    uint64_t v67 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat");
    v346[138] = v66;
    v345[139] = @"ServoCE5_80-89%";
    uint64_t v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v64 = objc_msgSend(v65, "commonTypeDict_RealFormat");
    v346[139] = v64;
    v345[140] = @"ServoCE5_80-89%_Transitions";
    uint64_t v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat");
    v346[140] = v62;
    v345[141] = @"ServoCE5_90-99%";
    uint64_t v61 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v60 = objc_msgSend(v61, "commonTypeDict_RealFormat");
    v346[141] = v60;
    v345[142] = @"ServoCE5_90-99%_Transitions";
    uint64_t v59 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
    v346[142] = v58;
    v345[143] = @"ServoCE5_100%";
    uint64_t v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat");
    v346[143] = v56;
    v345[144] = @"ServoCE5_100%_Transitions";
    uint64_t v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
    v346[144] = v54;
    v345[145] = @"ServoCE6_0%";
    uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v52 = objc_msgSend(v53, "commonTypeDict_RealFormat");
    v346[145] = v52;
    v345[146] = @"ServoCE6_0%_Transitions";
    uint64_t v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
    v346[146] = v50;
    v345[147] = @"ServoCE6_1-9%";
    uint64_t v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v49, "commonTypeDict_RealFormat");
    v346[147] = v48;
    v345[148] = @"ServoCE6_1-9%_Transitions";
    uint64_t v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
    v346[148] = v46;
    v345[149] = @"ServoCE6_10-19%";
    uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_RealFormat");
    v346[149] = v44;
    v345[150] = @"ServoCE6_10-19%_Transitions";
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
    v346[150] = v42;
    v345[151] = @"ServoCE6_20-29%";
    uint64_t v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_RealFormat");
    v346[151] = v40;
    v345[152] = @"ServoCE6_20-29%_Transitions";
    uint64_t v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
    v346[152] = v38;
    v345[153] = @"ServoCE6_30-39%";
    uint64_t v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_RealFormat");
    v346[153] = v36;
    v345[154] = @"ServoCE6_30-39%_Transitions";
    uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
    v346[154] = v34;
    v345[155] = @"ServoCE6_40-49%";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
    v346[155] = v32;
    v345[156] = @"ServoCE6_40-49%_Transitions";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v346[156] = v30;
    v345[157] = @"ServoCE6_50-59%";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
    v346[157] = v28;
    v345[158] = @"ServoCE6_50-59%_Transitions";
    uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v346[158] = v26;
    v345[159] = @"ServoCE6_60-69%";
    uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
    v346[159] = v24;
    v345[160] = @"ServoCE6_60-69%_Transitions";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v346[160] = v22;
    v345[161] = @"ServoCE6_70-79%";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
    v346[161] = v20;
    v345[162] = @"ServoCE6_70-79%_Transitions";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v346[162] = v18;
    v345[163] = @"ServoCE6_80-89%";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
    v346[163] = v16;
    v345[164] = @"ServoCE6_80-89%_Transitions";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v346[164] = v14;
    v345[165] = @"ServoCE6_90-99%";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v346[165] = v4;
    v345[166] = @"ServoCE6_90-99%_Transitions";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v346[166] = v6;
    v345[167] = @"ServoCE6_100%";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    v346[167] = v8;
    v345[168] = @"ServoCE6_100%_Transitions";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v346[168] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v346 forKeys:v345 count:169];
    v350[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v350 forKeys:v349 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionPPMStatsCPMSLanesEngagement
{
  void v78[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F56678] isCPMSSupported])
  {
    v77[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v75[0] = *MEMORY[0x1E4F92CD0];
    v75[1] = v2;
    v76[0] = &unk_1F29F06F0;
    v76[1] = @"logEventBackwardIOReport";
    v75[2] = *MEMORY[0x1E4F92C60];
    v76[2] = MEMORY[0x1E4F1CC28];
    v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];
    v78[0] = v72;
    v77[1] = *MEMORY[0x1E4F92CA8];
    v73[0] = @"SampleTime";
    uint64_t v71 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v70 = objc_msgSend(v71, "commonTypeDict_RealFormat_withUnit_s");
    v74[0] = v70;
    v73[1] = @"LanesEng_0";
    uint64_t v69 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v68 = objc_msgSend(v69, "commonTypeDict_RealFormat_withUnit_s");
    v74[1] = v68;
    v73[2] = @"LanesEng_1";
    uint64_t v67 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v66 = objc_msgSend(v67, "commonTypeDict_RealFormat_withUnit_s");
    v74[2] = v66;
    v73[3] = @"LanesEng_2";
    uint64_t v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v64 = objc_msgSend(v65, "commonTypeDict_RealFormat_withUnit_s");
    v74[3] = v64;
    v73[4] = @"LanesEng_3";
    uint64_t v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v62 = objc_msgSend(v63, "commonTypeDict_RealFormat_withUnit_s");
    v74[4] = v62;
    v73[5] = @"LanesEng_4";
    uint64_t v61 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v60 = objc_msgSend(v61, "commonTypeDict_RealFormat_withUnit_s");
    v74[5] = v60;
    v73[6] = @"LanesEng_5";
    uint64_t v59 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v58 = objc_msgSend(v59, "commonTypeDict_RealFormat_withUnit_s");
    v74[6] = v58;
    v73[7] = @"LanesEng_6";
    uint64_t v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat_withUnit_s");
    v74[7] = v56;
    v73[8] = @"LanesEng_7";
    uint64_t v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v54 = objc_msgSend(v55, "commonTypeDict_RealFormat_withUnit_s");
    v74[8] = v54;
    v73[9] = @"LanesEng_8";
    uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v52 = objc_msgSend(v53, "commonTypeDict_RealFormat_withUnit_s");
    v74[9] = v52;
    v73[10] = @"LanesEng_9";
    uint64_t v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v50 = objc_msgSend(v51, "commonTypeDict_RealFormat_withUnit_s");
    v74[10] = v50;
    v73[11] = @"LanesEng_10";
    uint64_t v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v49, "commonTypeDict_RealFormat_withUnit_s");
    v74[11] = v48;
    v73[12] = @"LanesEng_11";
    uint64_t v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_RealFormat_withUnit_s");
    v74[12] = v46;
    v73[13] = @"LanesEng_12";
    uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_RealFormat_withUnit_s");
    v74[13] = v44;
    v73[14] = @"LanesEng_13";
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_RealFormat_withUnit_s");
    v74[14] = v42;
    v73[15] = @"LanesEng_14";
    uint64_t v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v40 = objc_msgSend(v41, "commonTypeDict_RealFormat_withUnit_s");
    v74[15] = v40;
    v73[16] = @"LanesEng_15";
    uint64_t v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v38 = objc_msgSend(v39, "commonTypeDict_RealFormat_withUnit_s");
    v74[16] = v38;
    v73[17] = @"LanesEng_16";
    uint64_t v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_RealFormat_withUnit_s");
    v74[17] = v36;
    v73[18] = @"LanesEng_17";
    uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_RealFormat_withUnit_s");
    v74[18] = v34;
    v73[19] = @"LanesEng_18";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat_withUnit_s");
    v74[19] = v32;
    v73[20] = @"LanesEng_19";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_RealFormat_withUnit_s");
    v74[20] = v30;
    v73[21] = @"LanesEng_20";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v28 = objc_msgSend(v29, "commonTypeDict_RealFormat_withUnit_s");
    v74[21] = v28;
    v73[22] = @"LanesEng_21";
    uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v26 = objc_msgSend(v27, "commonTypeDict_RealFormat_withUnit_s");
    v74[22] = v26;
    v73[23] = @"LanesEng_22";
    uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_RealFormat_withUnit_s");
    v74[23] = v24;
    v73[24] = @"LanesEng_23";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat_withUnit_s");
    v74[24] = v22;
    v73[25] = @"LanesEng_24";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat_withUnit_s");
    v74[25] = v20;
    v73[26] = @"LanesEng_25";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat_withUnit_s");
    v74[26] = v18;
    v73[27] = @"LanesEng_26";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat_withUnit_s");
    v74[27] = v16;
    v73[28] = @"LanesEng_27";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat_withUnit_s");
    v74[28] = v14;
    v73[29] = @"LanesEng_28";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat_withUnit_s");
    v74[29] = v4;
    v73[30] = @"LanesEng_29";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_withUnit_s");
    v74[30] = v6;
    v73[31] = @"LanesEng_30";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat_withUnit_s");
    v74[31] = v8;
    v73[32] = @"LanesEng_31";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat_withUnit_s");
    v74[32] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:33];
    v78[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionCarnelianVaxholmStats
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isWatch])
  {
    v19[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v17[0] = *MEMORY[0x1E4F92CD0];
    v17[1] = v2;
    v18[0] = &unk_1F29F0720;
    v18[1] = @"logEventBackwardIOReport";
    void v17[2] = *MEMORY[0x1E4F92C60];
    void v18[2] = MEMORY[0x1E4F1CC28];
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4F92CA8];
    v15[0] = @"SampleTime";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat_withUnit_s");
    v16[0] = v4;
    v15[1] = @"VAX_Power_ECG0_0";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_withUnit_s");
    v16[1] = v6;
    void v15[2] = @"VAX_Power_ECG1_0";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat_withUnit_s");
    void v16[2] = v8;
    void v15[3] = @"VAX_Power_EMG0_0";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat_withUnit_s");
    void v16[3] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionHapticsStats
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiOS])
  {
    v13[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v11[0] = *MEMORY[0x1E4F92CD0];
    v11[1] = v2;
    v12[0] = &unk_1F29F06F0;
    v12[1] = @"logEventBackwardIOReport";
    void v11[2] = *MEMORY[0x1E4F92C60];
    void v12[2] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
    v14[0] = v3;
    v13[1] = *MEMORY[0x1E4F92CA8];
    id v9 = @"Haptic.AccumEnergy";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    id v10 = v5;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v14[1] = v6;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    double v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

+ (id)entryEventBackwardDefinitionGPUCStates
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    v19[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v17[0] = *MEMORY[0x1E4F92CD0];
    v17[1] = v2;
    v18[0] = &unk_1F29F06F0;
    v18[1] = @"logEventBackwardIOReport";
    void v17[2] = *MEMORY[0x1E4F92C60];
    void v18[2] = MEMORY[0x1E4F1CC28];
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4F92CA8];
    v15[0] = @"SampleTime";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat_withUnit_s");
    v16[0] = v4;
    v15[1] = @"RC0";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v16[1] = v6;
    void v15[2] = @"RC1";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v16[2] = v8;
    void v15[3] = @"RC6";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v16[3] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionDisplay
{
  void v30[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    v29[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v27[0] = *MEMORY[0x1E4F92CD0];
    v27[1] = v2;
    v28[0] = &unk_1F29F0720;
    v28[1] = @"logEventBackwardIOReport";
    void v27[2] = *MEMORY[0x1E4F92C60];
    void v28[2] = MEMORY[0x1E4F1CC28];
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
    v30[0] = v24;
    v29[1] = *MEMORY[0x1E4F92CA8];
    v25[0] = @"SampleTime";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat_withUnit_s");
    v26[0] = v22;
    v25[1] = @"Dynamic Pixel Backlight State_ON";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v26[1] = v20;
    void v25[2] = @"Panel Self Refresh State_BOTHOFF";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    void v26[2] = v18;
    v25[3] = @"Panel Self Refresh State_GPUON";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v26[3] = v16;
    v25[4] = @"Panel Self Refresh State_TCONON";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    void v26[4] = v14;
    void v25[5] = @"Panel Self Refresh State_BOTHON";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v26[5] = v4;
    void v25[6] = @"Panel Self Refresh State_BYPASS";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v26[6] = v6;
    v25[7] = @"Panel Self Refresh State_FIFO";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v26[7] = v8;
    void v25[8] = @"Panel Self Refresh State_OTHERS";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v26[8] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:9];
    v30[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionNVMeBWLimits
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    v21[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v19[0] = *MEMORY[0x1E4F92CD0];
    v19[1] = v2;
    v20[0] = &unk_1F29F06F0;
    v20[1] = @"logEventBackwardIOReport";
    void v19[2] = *MEMORY[0x1E4F92C60];
    void v20[2] = MEMORY[0x1E4F1CC28];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    v22[0] = v16;
    v21[1] = *MEMORY[0x1E4F92CA8];
    v17[0] = @"SampleTime";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat_withUnit_s");
    v18[0] = v14;
    v17[1] = @"Tier0 BW Scale Factor";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v18[1] = v4;
    void v17[2] = @"Tier1 BW Scale Factor";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v18[2] = v6;
    void v17[3] = @"Tier2 BW Scale Factor";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v18[3] = v8;
    void v17[4] = @"Tier3 BW Scale Factor";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v18[4] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    v22[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionNVMeTimeweightedthrottlestatistics
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    v23[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v21[0] = *MEMORY[0x1E4F92CD0];
    v21[1] = v2;
    v22[0] = &unk_1F29F06F0;
    v22[1] = @"logEventBackwardIOReport";
    void v21[2] = *MEMORY[0x1E4F92C60];
    void v22[2] = MEMORY[0x1E4F1CC28];
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    v24[0] = v18;
    v23[1] = *MEMORY[0x1E4F92CA8];
    v19[0] = @"SampleTime";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat_withUnit_s");
    v20[0] = v16;
    v19[1] = @"Tier0 Throttle Time";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v20[1] = v14;
    void v19[2] = @"Tier1 Throttle Time";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    void v20[2] = v4;
    void v19[3] = @"Tier2 Throttle Time";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v20[3] = v6;
    void v19[4] = @"Tier3 Throttle Time";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v20[4] = v8;
    void v19[5] = @"Total time elapsed";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v20[5] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
    v24[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionNVMe
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    v19[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v17[0] = *MEMORY[0x1E4F92CD0];
    v17[1] = v2;
    v18[0] = &unk_1F29F06F0;
    v18[1] = @"logEventBackwardIOReport";
    void v17[2] = *MEMORY[0x1E4F92C60];
    void v18[2] = MEMORY[0x1E4F1CC28];
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4F92CA8];
    v15[0] = @"SampleTime";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat_withUnit_s");
    v16[0] = v4;
    v15[1] = @"NVMe Power States_OFF";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v16[1] = v6;
    void v15[2] = @"NVMe Power States_PAUSE";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v16[2] = v8;
    void v15[3] = @"NVMe Power States_ACTIVE";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v16[3] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionBluetooth
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    v21[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v19[0] = *MEMORY[0x1E4F92CD0];
    v19[1] = v2;
    v20[0] = &unk_1F29F06F0;
    v20[1] = @"logEventBackwardIOReport";
    void v19[2] = *MEMORY[0x1E4F92C60];
    void v20[2] = MEMORY[0x1E4F1CC28];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    v22[0] = v16;
    v21[1] = *MEMORY[0x1E4F92CA8];
    v17[0] = @"SampleTime";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat_withUnit_s");
    v18[0] = v14;
    v17[1] = @"Bluetooth Internal Power State_OFF";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v18[1] = v4;
    void v17[2] = @"Bluetooth Internal Power State_ON";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v18[2] = v6;
    void v17[3] = @"Bluetooth Internal Power State_SLEEP";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v18[3] = v8;
    void v17[4] = @"Bluetooth Internal Power State_IDLE";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v18[4] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    v22[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionWLANPowerPhyActivity
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    v17[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v15[0] = *MEMORY[0x1E4F92CD0];
    v15[1] = v2;
    v16[0] = &unk_1F29F06F0;
    v16[1] = @"logEventBackwardIOReport";
    void v15[2] = *MEMORY[0x1E4F92C60];
    void v16[2] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    v18[0] = v3;
    v17[1] = *MEMORY[0x1E4F92CA8];
    v13[0] = @"SampleTime";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v5 = objc_msgSend(v4, "commonTypeDict_RealFormat_withUnit_s");
    v14[0] = v5;
    v13[1] = @"      Radio Tx Dur";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v14[1] = v7;
    void v13[2] = @"      Radio Rx Dur";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v14[2] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v18[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionWLANPowerPhyScan
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    v17[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v15[0] = *MEMORY[0x1E4F92CD0];
    v15[1] = v2;
    v16[0] = &unk_1F29F06F0;
    v16[1] = @"logEventBackwardIOReport";
    void v15[2] = *MEMORY[0x1E4F92C60];
    void v16[2] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    v18[0] = v3;
    v17[1] = *MEMORY[0x1E4F92CA8];
    v13[0] = @"SampleTime";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v5 = objc_msgSend(v4, "commonTypeDict_RealFormat_withUnit_s");
    v14[0] = v5;
    v13[1] = @"         User Scan Count";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v14[1] = v7;
    void v13[2] = @"        User Scan Dur  ";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v14[2] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v18[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionWLANPowerConnections
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    v21[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v19[0] = *MEMORY[0x1E4F92CD0];
    v19[1] = v2;
    v20[0] = &unk_1F29F06F0;
    v20[1] = @"logEventBackwardIOReport";
    void v19[2] = *MEMORY[0x1E4F92C60];
    void v20[2] = MEMORY[0x1E4F1CC28];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    v22[0] = v16;
    v21[1] = *MEMORY[0x1E4F92CA8];
    v17[0] = @"SampleTime";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat_withUnit_s");
    v18[0] = v14;
    v17[1] = @" AWDL Radio Tx Dur";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v18[1] = v4;
    void v17[2] = @" AWDL Radio Rx Dur";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v18[2] = v6;
    void v17[3] = @" AWDL       Aw Dur";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v18[3] = v8;
    void v17[4] = @" AWDL    PScan Dur";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v18[4] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    v22[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (BOOL)shouldLogMTRAging
{
  if (qword_1EBD58418 != -1) {
    dispatch_once(&qword_1EBD58418, &__block_literal_global_7216);
  }
  return byte_1EBD583D3;
}

uint64_t __36__PLIOReportAgent_shouldLogMTRAging__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
  byte_1EBD583D3 = (int)result > 1001010;
  return result;
}

+ (id)entryEventBackwardDefinitionMTRAging
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogMTRAging])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C60];
    v16[0] = *MEMORY[0x1E4F92CD0];
    v16[1] = v2;
    v17[0] = &unk_1F29F06F0;
    v17[1] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v16[2] = *MEMORY[0x1E4F92CC0];
    void v16[3] = v3;
    void v17[2] = MEMORY[0x1E4F1CC38];
    void v17[3] = MEMORY[0x1E4F1CC38];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    v19[0] = v4;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"Component";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
    v15[0] = v6;
    v14[1] = @"Node";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v15[1] = v8;
    void v14[2] = @"dF_norm";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v15[2] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    v19[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (BOOL)shouldLogAudioEvent
{
  if (qword_1EBD58420 != -1) {
    dispatch_once(&qword_1EBD58420, &__block_literal_global_7227);
  }
  return byte_1EBD583D4;
}

uint64_t __38__PLIOReportAgent_shouldLogAudioEvent__block_invoke()
{
  if ((([MEMORY[0x1E4F929C0] taskMode] & 1) != 0
     || (uint64_t result = [MEMORY[0x1E4F929C0] fullMode], result))
    && (uint64_t result = [MEMORY[0x1E4F92A38] isWatch], result))
  {
    uint64_t result = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
    BOOL v1 = (int)result > 1001203;
  }
  else
  {
    BOOL v1 = 0;
  }
  byte_1EBD583D4 = v1;
  return result;
}

+ (id)entryEventBackwardDefinitionSpeakerSpeakerEvents
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogAudioEvent])
  {
    v13[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C60];
    v11[0] = *MEMORY[0x1E4F92CD0];
    v11[1] = v2;
    v12[0] = &unk_1F29F06F0;
    v12[1] = MEMORY[0x1E4F1CC28];
    void v11[2] = *MEMORY[0x1E4F92CE8];
    void v12[2] = MEMORY[0x1E4F1CC38];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
    v14[0] = v3;
    v13[1] = *MEMORY[0x1E4F92CA8];
    id v9 = @"SpeakerBdeEvent";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    id v10 = v5;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v14[1] = v6;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    double v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

+ (id)entryEventBackwardDefinitionAOPPowerState
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v20[0] = *MEMORY[0x1E4F92CD0];
  v20[1] = v2;
  v21[0] = &unk_1F29F06F0;
  v21[1] = @"logEventBackwardIOReport";
  uint64_t v3 = *MEMORY[0x1E4F92CE8];
  void v20[2] = *MEMORY[0x1E4F92C60];
  void v20[3] = v3;
  void v21[2] = MEMORY[0x1E4F1CC28];
  void v21[3] = MEMORY[0x1E4F1CC38];
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"SampleTime";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_RealFormat_withUnit_s");
  v19[0] = v15;
  v18[1] = @"CPUPowerGated";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19[1] = v5;
  void v18[2] = @"PreventPowerGate";
  double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  void v19[2] = v7;
  void v18[3] = @"Active";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v19[3] = v9;
  void v18[4] = @"On";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  void v19[4] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
  v23[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v13;
}

+ (id)entryEventBackwardDefinitionAOPPerformance
{
  void v36[2] = *MEMORY[0x1E4F143B8];
  if ((([MEMORY[0x1E4F92A38] isiOS] & 1) != 0
     || [MEMORY[0x1E4F92A38] isWatch])
    && [MEMORY[0x1E4F929C0] fullMode])
  {
    v35[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v33[0] = *MEMORY[0x1E4F92CD0];
    v33[1] = v2;
    v34[0] = &unk_1F29F06F0;
    v34[1] = @"logEventBackwardIOReport";
    void v33[2] = *MEMORY[0x1E4F92C60];
    void v34[2] = MEMORY[0x1E4F1CC28];
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
    v36[0] = v30;
    v35[1] = *MEMORY[0x1E4F92CA8];
    v31[0] = @"SampleTime";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v28 = objc_msgSend(v29, "commonTypeDict_RealFormat_withUnit_s");
    v32[0] = v28;
    v31[1] = @"Threadtime_total";
    uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v32[1] = v26;
    void v31[2] = @"Threadtime_audio";
    uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    void v32[2] = v24;
    void v31[3] = @"Threadtime_main";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    void v32[3] = v22;
    void v31[4] = @"Threadtime_pearl";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    void v32[4] = v20;
    v31[5] = @"Threadtime_prox";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v32[5] = v18;
    v31[6] = @"Threadtime_rtk_ep_w";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v32[6] = v16;
    v31[7] = @"Threadtime_voicetri";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v32[7] = v14;
    v31[8] = @"Threadtime_SVC";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    void v32[8] = v4;
    v31[9] = @"Threadtime_IRQ";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v32[9] = v6;
    v31[10] = @"Threadtime_cma";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v32[10] = v8;
    void v31[11] = @"Threadtime_power";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v32[11] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:12];
    v36[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionAOPgyropower
{
  v95[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiOS])
  {
    v94[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v92[0] = *MEMORY[0x1E4F92CD0];
    v92[1] = v2;
    v93[0] = &unk_1F29F06F0;
    v93[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v92[2] = *MEMORY[0x1E4F92C60];
    v92[3] = v3;
    v93[2] = MEMORY[0x1E4F1CC28];
    v93[3] = MEMORY[0x1E4F1CC38];
    v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:4];
    v95[0] = v89;
    v94[1] = *MEMORY[0x1E4F92CA8];
    v90[0] = @"SampleTime";
    uint64_t v88 = [MEMORY[0x1E4F929D8] sharedInstance];
    v87 = objc_msgSend(v88, "commonTypeDict_RealFormat_withUnit_s");
    v91[0] = v87;
    v90[1] = @"power mode_OFF";
    uint64_t v86 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v86, "commonTypeDict_RealFormat");
    v91[1] = v85;
    v90[2] = @"power mode_OFF_Transitions";
    uint64_t v84 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v83 = objc_msgSend(v84, "commonTypeDict_IntegerFormat");
    void v91[2] = v83;
    void v90[3] = @"power mode_LNM";
    char v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v81 = objc_msgSend(v82, "commonTypeDict_RealFormat");
    v91[3] = v81;
    v90[4] = @"power mode_LNM_Transitions";
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v79 = objc_msgSend(v80, "commonTypeDict_IntegerFormat");
    v91[4] = v79;
    v90[5] = @"power mode_LPM";
    v78 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v77 = objc_msgSend(v78, "commonTypeDict_RealFormat");
    v91[5] = v77;
    v90[6] = @"power mode_LPM_Transitions";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat");
    v91[6] = v75;
    v90[7] = @"sample interval_20000";
    uint64_t v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v73 = objc_msgSend(v74, "commonTypeDict_RealFormat");
    v91[7] = v73;
    v90[8] = @"sample interval_20000_Transitions";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v91[8] = v71;
    v90[9] = @"sample interval_10000";
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v69 = objc_msgSend(v70, "commonTypeDict_RealFormat");
    v91[9] = v69;
    v90[10] = @"sample interval_10000_Transitions";
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
    v91[10] = v67;
    v90[11] = @"sample interval_5000";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_RealFormat");
    v91[11] = v65;
    v90[12] = @"sample interval_5000_Transitions";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v91[12] = v63;
    v90[13] = @"sample interval_2500";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v61 = objc_msgSend(v62, "commonTypeDict_RealFormat");
    v91[13] = v61;
    v90[14] = @"sample interval_2500_Transitions";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v91[14] = v59;
    v90[15] = @"sample interval_1250";
    uint64_t v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v57 = objc_msgSend(v58, "commonTypeDict_RealFormat");
    v91[15] = v57;
    v90[16] = @"sample interval_1250_Transitions";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v91[16] = v55;
    v90[17] = @"sample interval_off";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_RealFormat");
    v91[17] = v53;
    v90[18] = @"sample interval_off_Transitions";
    uint64_t v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v91[18] = v51;
    v90[19] = @"batch interval_1000000";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v49 = objc_msgSend(v50, "commonTypeDict_RealFormat");
    v91[19] = v49;
    v90[20] = @"batch interval_1000000_Transitions";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v91[20] = v47;
    v90[21] = @"batch interval_500000";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v46, "commonTypeDict_RealFormat");
    v91[21] = v45;
    v90[22] = @"batch interval_500000_Transitions";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v91[22] = v43;
    v90[23] = @"batch interval_200000";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v41 = objc_msgSend(v42, "commonTypeDict_RealFormat");
    v91[23] = v41;
    v90[24] = @"batch interval_200000_Transitions";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v91[24] = v39;
    v90[25] = @"batch interval_100000";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
    v91[25] = v37;
    v90[26] = @"batch interval_100000_Transitions";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v91[26] = v35;
    v90[27] = @"batch interval_50000";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v91[27] = v33;
    v90[28] = @"batch interval_50000_Transitions";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v91[28] = v31;
    v90[29] = @"batch interval_20000";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v91[29] = v29;
    v90[30] = @"batch interval_20000_Transitions";
    uint64_t v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v91[30] = v27;
    v90[31] = @"batch interval_10000";
    uint64_t v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v91[31] = v25;
    v90[32] = @"batch interval_10000_Transitions";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v91[32] = v23;
    v90[33] = @"batch interval_5000";
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v91[33] = v21;
    v90[34] = @"batch interval_5000_Transitions";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v91[34] = v19;
    v90[35] = @"batch interval_2000";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v91[35] = v17;
    v90[36] = @"batch interval_2000_Transitions";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v91[36] = v15;
    v90[37] = @"batch interval_1000";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v91[37] = v5;
    v90[38] = @"batch interval_1000_Transitions";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v91[38] = v7;
    v90[39] = @"batch interval_off";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v91[39] = v9;
    v90[40] = @"batch interval_off_Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v91[40] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:41];
    v95[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionAOPcompasspower
{
  v95[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiOS])
  {
    v94[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v92[0] = *MEMORY[0x1E4F92CD0];
    v92[1] = v2;
    v93[0] = &unk_1F29F06F0;
    v93[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v92[2] = *MEMORY[0x1E4F92C60];
    v92[3] = v3;
    v93[2] = MEMORY[0x1E4F1CC28];
    v93[3] = MEMORY[0x1E4F1CC38];
    v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:4];
    v95[0] = v89;
    v94[1] = *MEMORY[0x1E4F92CA8];
    v90[0] = @"SampleTime";
    uint64_t v88 = [MEMORY[0x1E4F929D8] sharedInstance];
    v87 = objc_msgSend(v88, "commonTypeDict_RealFormat_withUnit_s");
    v91[0] = v87;
    v90[1] = @"power mode_OFF";
    uint64_t v86 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v86, "commonTypeDict_RealFormat");
    v91[1] = v85;
    v90[2] = @"power mode_OFF_Transitions";
    uint64_t v84 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v83 = objc_msgSend(v84, "commonTypeDict_IntegerFormat");
    void v91[2] = v83;
    void v90[3] = @"power mode_LNM";
    char v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v81 = objc_msgSend(v82, "commonTypeDict_RealFormat");
    v91[3] = v81;
    v90[4] = @"power mode_LNM_Transitions";
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v79 = objc_msgSend(v80, "commonTypeDict_IntegerFormat");
    v91[4] = v79;
    v90[5] = @"power mode_LPM";
    v78 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v77 = objc_msgSend(v78, "commonTypeDict_RealFormat");
    v91[5] = v77;
    v90[6] = @"power mode_LPM_Transitions";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat");
    v91[6] = v75;
    v90[7] = @"sample interval_20000";
    uint64_t v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v73 = objc_msgSend(v74, "commonTypeDict_RealFormat");
    v91[7] = v73;
    v90[8] = @"sample interval_20000_Transitions";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v91[8] = v71;
    v90[9] = @"sample interval_10000";
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v69 = objc_msgSend(v70, "commonTypeDict_RealFormat");
    v91[9] = v69;
    v90[10] = @"sample interval_10000_Transitions";
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
    v91[10] = v67;
    v90[11] = @"sample interval_5000";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_RealFormat");
    v91[11] = v65;
    v90[12] = @"sample interval_5000_Transitions";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v91[12] = v63;
    v90[13] = @"sample interval_2500";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v61 = objc_msgSend(v62, "commonTypeDict_RealFormat");
    v91[13] = v61;
    v90[14] = @"sample interval_2500_Transitions";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v91[14] = v59;
    v90[15] = @"sample interval_1250";
    uint64_t v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v57 = objc_msgSend(v58, "commonTypeDict_RealFormat");
    v91[15] = v57;
    v90[16] = @"sample interval_1250_Transitions";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v91[16] = v55;
    v90[17] = @"sample interval_off";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_RealFormat");
    v91[17] = v53;
    v90[18] = @"sample interval_off_Transitions";
    uint64_t v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v91[18] = v51;
    v90[19] = @"batch interval_1000000";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v49 = objc_msgSend(v50, "commonTypeDict_RealFormat");
    v91[19] = v49;
    v90[20] = @"batch interval_1000000_Transitions";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v91[20] = v47;
    v90[21] = @"batch interval_500000";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v46, "commonTypeDict_RealFormat");
    v91[21] = v45;
    v90[22] = @"batch interval_500000_Transitions";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v91[22] = v43;
    v90[23] = @"batch interval_200000";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v41 = objc_msgSend(v42, "commonTypeDict_RealFormat");
    v91[23] = v41;
    v90[24] = @"batch interval_200000_Transitions";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v91[24] = v39;
    v90[25] = @"batch interval_100000";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
    v91[25] = v37;
    v90[26] = @"batch interval_100000_Transitions";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v91[26] = v35;
    v90[27] = @"batch interval_50000";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v91[27] = v33;
    v90[28] = @"batch interval_50000_Transitions";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v91[28] = v31;
    v90[29] = @"batch interval_20000";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v91[29] = v29;
    v90[30] = @"batch interval_20000_Transitions";
    uint64_t v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v91[30] = v27;
    v90[31] = @"batch interval_10000";
    uint64_t v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v91[31] = v25;
    v90[32] = @"batch interval_10000_Transitions";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v91[32] = v23;
    v90[33] = @"batch interval_5000";
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v91[33] = v21;
    v90[34] = @"batch interval_5000_Transitions";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v91[34] = v19;
    v90[35] = @"batch interval_2000";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v91[35] = v17;
    v90[36] = @"batch interval_2000_Transitions";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v91[36] = v15;
    v90[37] = @"batch interval_1000";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v91[37] = v5;
    v90[38] = @"batch interval_1000_Transitions";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v91[38] = v7;
    v90[39] = @"batch interval_off";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v91[39] = v9;
    v90[40] = @"batch interval_off_Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v91[40] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:41];
    v95[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionAOPaccelpower
{
  v95[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiOS])
  {
    v94[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v92[0] = *MEMORY[0x1E4F92CD0];
    v92[1] = v2;
    v93[0] = &unk_1F29F06F0;
    v93[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    v92[2] = *MEMORY[0x1E4F92C60];
    v92[3] = v3;
    v93[2] = MEMORY[0x1E4F1CC28];
    v93[3] = MEMORY[0x1E4F1CC38];
    v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:4];
    v95[0] = v89;
    v94[1] = *MEMORY[0x1E4F92CA8];
    v90[0] = @"SampleTime";
    uint64_t v88 = [MEMORY[0x1E4F929D8] sharedInstance];
    v87 = objc_msgSend(v88, "commonTypeDict_RealFormat_withUnit_s");
    v91[0] = v87;
    v90[1] = @"power mode_OFF";
    uint64_t v86 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v86, "commonTypeDict_RealFormat");
    v91[1] = v85;
    v90[2] = @"power mode_OFF_Transitions";
    uint64_t v84 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v83 = objc_msgSend(v84, "commonTypeDict_IntegerFormat");
    void v91[2] = v83;
    void v90[3] = @"power mode_LNM";
    char v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v81 = objc_msgSend(v82, "commonTypeDict_RealFormat");
    v91[3] = v81;
    v90[4] = @"power mode_LNM_Transitions";
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v79 = objc_msgSend(v80, "commonTypeDict_IntegerFormat");
    v91[4] = v79;
    v90[5] = @"power mode_LPM";
    v78 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v77 = objc_msgSend(v78, "commonTypeDict_RealFormat");
    v91[5] = v77;
    v90[6] = @"power mode_LPM_Transitions";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat");
    v91[6] = v75;
    v90[7] = @"sample interval_20000";
    uint64_t v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v73 = objc_msgSend(v74, "commonTypeDict_RealFormat");
    v91[7] = v73;
    v90[8] = @"sample interval_20000_Transitions";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v91[8] = v71;
    v90[9] = @"sample interval_10000";
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v69 = objc_msgSend(v70, "commonTypeDict_RealFormat");
    v91[9] = v69;
    v90[10] = @"sample interval_10000_Transitions";
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
    v91[10] = v67;
    v90[11] = @"sample interval_5000";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_RealFormat");
    v91[11] = v65;
    v90[12] = @"sample interval_5000_Transitions";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v91[12] = v63;
    v90[13] = @"sample interval_2500";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v61 = objc_msgSend(v62, "commonTypeDict_RealFormat");
    v91[13] = v61;
    v90[14] = @"sample interval_2500_Transitions";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v91[14] = v59;
    v90[15] = @"sample interval_1250";
    uint64_t v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v57 = objc_msgSend(v58, "commonTypeDict_RealFormat");
    v91[15] = v57;
    v90[16] = @"sample interval_1250_Transitions";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v91[16] = v55;
    v90[17] = @"sample interval_off";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_RealFormat");
    v91[17] = v53;
    v90[18] = @"sample interval_off_Transitions";
    uint64_t v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v91[18] = v51;
    v90[19] = @"batch interval_1000000";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v49 = objc_msgSend(v50, "commonTypeDict_RealFormat");
    v91[19] = v49;
    v90[20] = @"batch interval_1000000_Transitions";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v91[20] = v47;
    v90[21] = @"batch interval_500000";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v46, "commonTypeDict_RealFormat");
    v91[21] = v45;
    v90[22] = @"batch interval_500000_Transitions";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v91[22] = v43;
    v90[23] = @"batch interval_200000";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v41 = objc_msgSend(v42, "commonTypeDict_RealFormat");
    v91[23] = v41;
    v90[24] = @"batch interval_200000_Transitions";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v91[24] = v39;
    v90[25] = @"batch interval_100000";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
    v91[25] = v37;
    v90[26] = @"batch interval_100000_Transitions";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v91[26] = v35;
    v90[27] = @"batch interval_50000";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v91[27] = v33;
    v90[28] = @"batch interval_50000_Transitions";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v91[28] = v31;
    v90[29] = @"batch interval_20000";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v91[29] = v29;
    v90[30] = @"batch interval_20000_Transitions";
    uint64_t v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v91[30] = v27;
    v90[31] = @"batch interval_10000";
    uint64_t v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v91[31] = v25;
    v90[32] = @"batch interval_10000_Transitions";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v91[32] = v23;
    v90[33] = @"batch interval_5000";
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v91[33] = v21;
    v90[34] = @"batch interval_5000_Transitions";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v91[34] = v19;
    v90[35] = @"batch interval_2000";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v91[35] = v17;
    v90[36] = @"batch interval_2000_Transitions";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v91[36] = v15;
    v90[37] = @"batch interval_1000";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v91[37] = v5;
    v90[38] = @"batch interval_1000_Transitions";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v91[38] = v7;
    v90[39] = @"batch interval_off";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v91[39] = v9;
    v90[40] = @"batch interval_off_Transitions";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v91[40] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:41];
    v95[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionAOPpressurepower
{
  v89[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiOS])
  {
    v88[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v86[0] = *MEMORY[0x1E4F92CD0];
    v86[1] = v2;
    v87[0] = &unk_1F29F0700;
    v87[1] = @"logEventBackwardIOReport";
    uint64_t v3 = *MEMORY[0x1E4F92CE8];
    void v86[2] = *MEMORY[0x1E4F92C60];
    v86[3] = v3;
    v87[2] = MEMORY[0x1E4F1CC28];
    v87[3] = MEMORY[0x1E4F1CC38];
    int v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:4];
    v89[0] = v83;
    v88[1] = *MEMORY[0x1E4F92CA8];
    v84[0] = @"SampleTime";
    char v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v81 = objc_msgSend(v82, "commonTypeDict_RealFormat_withUnit_s");
    v85[0] = v81;
    v84[1] = @"power mode_OFF";
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v79 = objc_msgSend(v80, "commonTypeDict_RealFormat");
    v85[1] = v79;
    v84[2] = @"power mode_OFF_Transitions";
    v78 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v77 = objc_msgSend(v78, "commonTypeDict_IntegerFormat");
    void v85[2] = v77;
    void v84[3] = @"power mode_LNM";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v75 = objc_msgSend(v76, "commonTypeDict_RealFormat");
    v85[3] = v75;
    v84[4] = @"power mode_LNM_Transitions";
    uint64_t v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat");
    v85[4] = v73;
    v84[5] = @"power mode_LPM";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v71 = objc_msgSend(v72, "commonTypeDict_RealFormat");
    v85[5] = v71;
    v84[6] = @"power mode_LPM_Transitions";
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat");
    v85[6] = v69;
    v84[7] = @"sample interval_4000000";
    long long v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v67 = objc_msgSend(v68, "commonTypeDict_RealFormat");
    v85[7] = v67;
    v84[8] = @"sample interval_2000000";
    long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v65 = objc_msgSend(v66, "commonTypeDict_RealFormat");
    v85[8] = v65;
    v84[9] = @"sample interval_1000000";
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v63 = objc_msgSend(v64, "commonTypeDict_RealFormat");
    v85[9] = v63;
    v84[10] = @"sample interval_500000";
    double v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v61 = objc_msgSend(v62, "commonTypeDict_RealFormat");
    v85[10] = v61;
    v84[11] = @"sample interval_200000";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v59 = objc_msgSend(v60, "commonTypeDict_RealFormat");
    v85[11] = v59;
    v84[12] = @"sample interval_100000";
    uint64_t v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v57 = objc_msgSend(v58, "commonTypeDict_RealFormat");
    v85[12] = v57;
    v84[13] = @"sample interval_40000";
    int v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v55 = objc_msgSend(v56, "commonTypeDict_RealFormat");
    v85[13] = v55;
    v84[14] = @"sample interval_off";
    uint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v53 = objc_msgSend(v54, "commonTypeDict_RealFormat");
    v85[14] = v53;
    v84[15] = @"batch interval_1000000";
    uint64_t v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v51 = objc_msgSend(v52, "commonTypeDict_RealFormat");
    v85[15] = v51;
    v84[16] = @"batch interval_500000";
    double v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v49 = objc_msgSend(v50, "commonTypeDict_RealFormat");
    v85[16] = v49;
    v84[17] = @"batch interval_200000";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v47 = objc_msgSend(v48, "commonTypeDict_RealFormat");
    v85[17] = v47;
    v84[18] = @"batch interval_100000";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v46, "commonTypeDict_RealFormat");
    v85[18] = v45;
    v84[19] = @"batch interval_50000";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v43 = objc_msgSend(v44, "commonTypeDict_RealFormat");
    v85[19] = v43;
    v84[20] = @"batch interval_20000";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v41 = objc_msgSend(v42, "commonTypeDict_RealFormat");
    v85[20] = v41;
    v84[21] = @"batch interval_10000";
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v39 = objc_msgSend(v40, "commonTypeDict_RealFormat");
    v85[21] = v39;
    v84[22] = @"batch interval_5000";
    double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
    v85[22] = v37;
    v84[23] = @"batch interval_2000";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v35 = objc_msgSend(v36, "commonTypeDict_RealFormat");
    v85[23] = v35;
    v84[24] = @"batch interval_1000";
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v85[24] = v33;
    v84[25] = @"batch interval_off";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v31 = objc_msgSend(v32, "commonTypeDict_RealFormat");
    v85[25] = v31;
    v84[26] = @"sample interval_4166";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v85[26] = v29;
    v84[27] = @"sample interval_8333";
    uint64_t v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v27 = objc_msgSend(v28, "commonTypeDict_RealFormat");
    v85[27] = v27;
    v84[28] = @"sample interval_16666";
    uint64_t v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
    v85[28] = v25;
    v84[29] = @"sample interval_33333";
    uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_RealFormat");
    v85[29] = v23;
    v84[30] = @"sample interval_66666";
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v85[30] = v21;
    v84[31] = @"sample interval_133333";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
    v85[31] = v19;
    v84[32] = @"sample interval_266666";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v85[32] = v17;
    v84[33] = @"sample interval_531914";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v15 = objc_msgSend(v16, "commonTypeDict_RealFormat");
    v85[33] = v15;
    v84[34] = @"sample interval_1063829";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v85[34] = v5;
    v84[35] = @"sample interval_2127659";
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    v85[35] = v7;
    v84[36] = @"sample interval_4347826";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v85[36] = v9;
    v84[37] = @"sample interval_8333333";
    id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_RealFormat");
    v85[37] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:38];
    v89[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:2];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v13;
}

+ (id)entryEventBackwardDefinitionSMCPower
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitionMTPPower
{
  void v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v27[0] = *MEMORY[0x1E4F92CD0];
  v27[1] = v2;
  v28[0] = &unk_1F29F06F0;
  v28[1] = @"logEventBackwardIOReport";
  void v27[2] = *MEMORY[0x1E4F92CE8];
  void v28[2] = MEMORY[0x1E4F1CC38];
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E4F92CA8];
  v25[0] = @"SampleTime";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat_withUnit_s");
  v26[0] = v22;
  v25[1] = @"Duty cycle";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v26[1] = v20;
  void v25[2] = @"Sleep count";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  void v26[2] = v18;
  v25[3] = @"Wake count";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v26[3] = v16;
  v25[4] = @"Power state_ON";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  void v26[4] = v14;
  void v25[5] = @"Free heap";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v26[5] = v4;
  void v25[6] = @"Total heap";
  char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v26[6] = v6;
  v25[7] = @"Peak heap alloc";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v26[7] = v8;
  void v25[8] = @"CPU count";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v26[8] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:9];
  v30[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionMTPIOPState
{
  void v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v27[0] = *MEMORY[0x1E4F92CD0];
  v27[1] = v2;
  v28[0] = &unk_1F29F06F0;
  v28[1] = @"logEventBackwardIOReport";
  void v27[2] = *MEMORY[0x1E4F92CE8];
  void v28[2] = MEMORY[0x1E4F1CC38];
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E4F92CA8];
  v25[0] = @"SampleTime";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat_withUnit_s");
  v26[0] = v22;
  v25[1] = @"status_Off";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
  v26[1] = v20;
  void v25[2] = @"status_Sleep";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
  void v26[2] = v18;
  v25[3] = @"status_Quiesce";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v26[3] = v16;
  v25[4] = @"status_Wait_Vr";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  void v26[4] = v14;
  void v25[5] = @"status_Vers_OK";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v26[5] = v4;
  void v25[6] = @"status_Ready";
  char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  void v26[6] = v6;
  v25[7] = @"status_Pwr_Dwn";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v26[7] = v8;
  void v25[8] = @"status_Running";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v26[8] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:9];
  v30[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionSIOPower
{
  void v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v27[0] = *MEMORY[0x1E4F92CD0];
  v27[1] = v2;
  v28[0] = &unk_1F29F06F0;
  v28[1] = @"logEventBackwardIOReport";
  void v27[2] = *MEMORY[0x1E4F92CE8];
  void v28[2] = MEMORY[0x1E4F1CC38];
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E4F92CA8];
  v25[0] = @"SampleTime";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat_withUnit_s");
  v26[0] = v22;
  v25[1] = @"Duty cycle";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v26[1] = v20;
  void v25[2] = @"Sleep count";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  void v26[2] = v18;
  v25[3] = @"Wake count";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v26[3] = v16;
  v25[4] = @"Power state_ON";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  void v26[4] = v14;
  void v25[5] = @"Free heap";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v26[5] = v4;
  void v25[6] = @"Total heap";
  char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v26[6] = v6;
  v25[7] = @"Peak heap alloc";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v26[7] = v8;
  void v25[8] = @"CPU count";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v26[8] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:9];
  v30[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionSIOIOPState
{
  void v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v27[0] = *MEMORY[0x1E4F92CD0];
  v27[1] = v2;
  v28[0] = &unk_1F29F06F0;
  v28[1] = @"logEventBackwardIOReport";
  void v27[2] = *MEMORY[0x1E4F92CE8];
  void v28[2] = MEMORY[0x1E4F1CC38];
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E4F92CA8];
  v25[0] = @"SampleTime";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat_withUnit_s");
  v26[0] = v22;
  v25[1] = @"status_Off";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
  v26[1] = v20;
  void v25[2] = @"status_Sleep";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
  void v26[2] = v18;
  v25[3] = @"status_Quiesce";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v26[3] = v16;
  v25[4] = @"status_Wait_Vr";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  void v26[4] = v14;
  void v25[5] = @"status_Vers_OK";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v26[5] = v4;
  void v25[6] = @"status_Ready";
  char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  void v26[6] = v6;
  v25[7] = @"status_Pwr_Dwn";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v26[7] = v8;
  void v25[8] = @"status_Running";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v26[8] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:9];
  v30[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionPMPSOC0
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitionPMPSOC
{
  v98[2] = *MEMORY[0x1E4F143B8];
  v97[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v95[0] = *MEMORY[0x1E4F92CD0];
  v95[1] = v2;
  v96[0] = &unk_1F29F06F0;
  v96[1] = @"logEventBackwardIOReport";
  v95[2] = *MEMORY[0x1E4F92CE8];
  v96[2] = MEMORY[0x1E4F1CC38];
  v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:3];
  v98[0] = v92;
  v97[1] = *MEMORY[0x1E4F92CA8];
  v93[0] = @"SampleTime";
  uint64_t v91 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v90 = objc_msgSend(v91, "commonTypeDict_RealFormat_withUnit_s");
  v94[0] = v90;
  v93[1] = @"EACC0_VMIN";
  v89 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v88 = objc_msgSend(v89, "commonTypeDict_RealFormat");
  v94[1] = v88;
  v93[2] = @"EACC0_VMAX";
  v87 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v86 = objc_msgSend(v87, "commonTypeDict_RealFormat");
  void v94[2] = v86;
  v93[3] = @"PACC0_VMIN";
  v85 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v84 = objc_msgSend(v85, "commonTypeDict_RealFormat");
  v94[3] = v84;
  void v93[4] = @"PACC0_VMAX";
  int v83 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v82 = objc_msgSend(v83, "commonTypeDict_RealFormat");
  v94[4] = v82;
  v93[5] = @"AGX_VMIN";
  char v81 = [MEMORY[0x1E4F929D8] sharedInstance];
  v80 = objc_msgSend(v81, "commonTypeDict_RealFormat");
  v94[5] = v80;
  v93[6] = @"AGX_VMAX";
  uint64_t v79 = [MEMORY[0x1E4F929D8] sharedInstance];
  v78 = objc_msgSend(v79, "commonTypeDict_RealFormat");
  v94[6] = v78;
  v93[7] = @"ANE0_VMIN";
  uint64_t v77 = [MEMORY[0x1E4F929D8] sharedInstance];
  v76 = objc_msgSend(v77, "commonTypeDict_RealFormat");
  v94[7] = v76;
  v93[8] = @"ANE0_VMAX";
  uint64_t v75 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v74 = objc_msgSend(v75, "commonTypeDict_RealFormat");
  v94[8] = v74;
  v93[9] = @"ISP_VMIN";
  uint64_t v73 = [MEMORY[0x1E4F929D8] sharedInstance];
  v72 = objc_msgSend(v73, "commonTypeDict_RealFormat");
  v94[9] = v72;
  v93[10] = @"ISP_VMAX";
  uint64_t v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v70 = objc_msgSend(v71, "commonTypeDict_RealFormat");
  v94[10] = v70;
  v93[11] = @"DISP_VMIN";
  uint64_t v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v68 = objc_msgSend(v69, "commonTypeDict_RealFormat");
  v94[11] = v68;
  v93[12] = @"DISP_VMAX";
  uint64_t v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v66 = objc_msgSend(v67, "commonTypeDict_RealFormat");
  v94[12] = v66;
  v93[13] = @"DISPEXT_VMIN";
  uint64_t v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v64 = objc_msgSend(v65, "commonTypeDict_RealFormat");
  v94[13] = v64;
  v93[14] = @"DISPEXT_VMAX";
  uint64_t v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v62 = objc_msgSend(v63, "commonTypeDict_RealFormat");
  v94[14] = v62;
  v93[15] = @"AVE_VMIN";
  uint64_t v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v60 = objc_msgSend(v61, "commonTypeDict_RealFormat");
  v94[15] = v60;
  v93[16] = @"AVE_VMAX";
  uint64_t v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v58 = objc_msgSend(v59, "commonTypeDict_RealFormat");
  v94[16] = v58;
  v93[17] = @"AVD_VMIN";
  uint64_t v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat");
  v94[17] = v56;
  v93[18] = @"AVD_VMAX";
  uint64_t v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v54 = objc_msgSend(v55, "commonTypeDict_RealFormat");
  v94[18] = v54;
  v93[19] = @"MSR_VMIN";
  uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v52 = objc_msgSend(v53, "commonTypeDict_RealFormat");
  v94[19] = v52;
  v93[20] = @"MSR_VMAX";
  uint64_t v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v50 = objc_msgSend(v51, "commonTypeDict_RealFormat");
  v94[20] = v50;
  v93[21] = @"JPEG_VMIN";
  uint64_t v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v48 = objc_msgSend(v49, "commonTypeDict_RealFormat");
  v94[21] = v48;
  v93[22] = @"JPEG_VMAX";
  uint64_t v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_RealFormat");
  v94[22] = v46;
  v93[23] = @"SCODEC_VMIN";
  uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_RealFormat");
  v94[23] = v44;
  v93[24] = @"SCODEC_VMAX";
  uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v42 = objc_msgSend(v43, "commonTypeDict_RealFormat");
  v94[24] = v42;
  v93[25] = @"AGX-SLOW-AF-RD_VMIN";
  uint64_t v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v40 = objc_msgSend(v41, "commonTypeDict_RealFormat");
  v94[25] = v40;
  v93[26] = @"AGX-SLOW-AF-RD_VMAX";
  uint64_t v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v38 = objc_msgSend(v39, "commonTypeDict_RealFormat");
  v94[26] = v38;
  v93[27] = @"AGX-FAST-AF-RD_VMIN";
  uint64_t v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_RealFormat");
  v94[27] = v36;
  v93[28] = @"AGX-FAST-AF-RD_VMAX";
  uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v34 = objc_msgSend(v35, "commonTypeDict_RealFormat");
  v94[28] = v34;
  v93[29] = @"AGX-SLOW-AF-WR_VMIN";
  uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
  v94[29] = v32;
  v93[30] = @"AGX-SLOW-AF-WR_VMAX";
  uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v30 = objc_msgSend(v31, "commonTypeDict_RealFormat");
  v94[30] = v30;
  v93[31] = @"AGX-FAST-AF-WR_VMIN";
  uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
  v94[31] = v28;
  v93[32] = @"AGX-FAST-AF-WR_VMAX";
  uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v26 = objc_msgSend(v27, "commonTypeDict_RealFormat");
  v94[32] = v26;
  v93[33] = @"ANE-BW_VMIN";
  uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
  v94[33] = v24;
  v93[34] = @"ANE-BW_VMAX";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat");
  v94[34] = v22;
  v93[35] = @"SOC0-RD-BWR_VMIN";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
  v94[35] = v20;
  v93[36] = @"SOC0-RD-BWR_VMAX";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
  v94[36] = v18;
  v93[37] = @"SOC0-WR-BWR_VMIN";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v94[37] = v16;
  v93[38] = @"SOC0-WR-BWR_VMAX";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  v94[38] = v14;
  v93[39] = @"SOC1-RD-BWR_VMIN";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v94[39] = v4;
  v93[40] = @"SOC1-RD-BWR_VMAX";
  char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v94[40] = v6;
  v93[41] = @"SOC1-WR-BWR_VMIN";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v94[41] = v8;
  v93[42] = @"SOC1-WR-BWR_VMAX";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v94[42] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:43];
  v98[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionPMPFAB
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitionPMPDCS
{
  v174[2] = *MEMORY[0x1E4F143B8];
  v173[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v171[0] = *MEMORY[0x1E4F92CD0];
  v171[1] = v2;
  v172[0] = &unk_1F29F0700;
  v172[1] = @"logEventBackwardIOReport";
  v171[2] = *MEMORY[0x1E4F92CE8];
  v172[2] = MEMORY[0x1E4F1CC38];
  uint64_t v168 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v172 forKeys:v171 count:3];
  v174[0] = v168;
  v173[1] = *MEMORY[0x1E4F92CA8];
  v169[0] = @"SampleTime";
  v167 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v166 = objc_msgSend(v167, "commonTypeDict_RealFormat_withUnit_s");
  v170[0] = v166;
  v169[1] = @"EACC0_F1";
  v165 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v164 = objc_msgSend(v165, "commonTypeDict_RealFormat");
  v170[1] = v164;
  v169[2] = @"EACC0_F2";
  v163 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v162 = objc_msgSend(v163, "commonTypeDict_RealFormat");
  v170[2] = v162;
  v169[3] = @"EACC0_F3";
  v161 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v160 = objc_msgSend(v161, "commonTypeDict_RealFormat");
  v170[3] = v160;
  v169[4] = @"EACC0_F5";
  v159 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v158 = objc_msgSend(v159, "commonTypeDict_RealFormat");
  v170[4] = v158;
  v169[5] = @"PACC0_F1";
  v157 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v156 = objc_msgSend(v157, "commonTypeDict_RealFormat");
  v170[5] = v156;
  v169[6] = @"PACC0_F2";
  v155 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v154 = objc_msgSend(v155, "commonTypeDict_RealFormat");
  v170[6] = v154;
  v169[7] = @"PACC0_F3";
  v153 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v152 = objc_msgSend(v153, "commonTypeDict_RealFormat");
  v170[7] = v152;
  v169[8] = @"PACC0_F5";
  v151 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v150 = objc_msgSend(v151, "commonTypeDict_RealFormat");
  v170[8] = v150;
  v169[9] = @"AGX_F1";
  v149 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v148 = objc_msgSend(v149, "commonTypeDict_RealFormat");
  v170[9] = v148;
  v169[10] = @"AGX_F2";
  v147 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v146 = objc_msgSend(v147, "commonTypeDict_RealFormat");
  v170[10] = v146;
  v169[11] = @"AGX_F3";
  v145 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v144 = objc_msgSend(v145, "commonTypeDict_RealFormat");
  v170[11] = v144;
  v169[12] = @"AGX_F5";
  v143 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v142 = objc_msgSend(v143, "commonTypeDict_RealFormat");
  v170[12] = v142;
  v169[13] = @"ANE0_F1";
  v141 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v140 = objc_msgSend(v141, "commonTypeDict_RealFormat");
  v170[13] = v140;
  v169[14] = @"ANE0_F2";
  v139 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v138 = objc_msgSend(v139, "commonTypeDict_RealFormat");
  v170[14] = v138;
  v169[15] = @"ANE0_F3";
  v137 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v136 = objc_msgSend(v137, "commonTypeDict_RealFormat");
  v170[15] = v136;
  v169[16] = @"ANE0_F5";
  v135 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v134 = objc_msgSend(v135, "commonTypeDict_RealFormat");
  v170[16] = v134;
  v169[17] = @"LTR_F1";
  v133 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v132 = objc_msgSend(v133, "commonTypeDict_RealFormat");
  v170[17] = v132;
  v169[18] = @"LTR_F2";
  v131 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v130 = objc_msgSend(v131, "commonTypeDict_RealFormat");
  v170[18] = v130;
  v169[19] = @"LTR_F3";
  v129 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v128 = objc_msgSend(v129, "commonTypeDict_RealFormat");
  v170[19] = v128;
  v169[20] = @"LTR_F5";
  uint64_t v127 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v126 = objc_msgSend(v127, "commonTypeDict_RealFormat");
  v170[20] = v126;
  v169[21] = @"DISP_F1";
  v125 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v124 = objc_msgSend(v125, "commonTypeDict_RealFormat");
  v170[21] = v124;
  v169[22] = @"DISP_F2";
  v123 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v122 = objc_msgSend(v123, "commonTypeDict_RealFormat");
  v170[22] = v122;
  v169[23] = @"DISP_F3";
  long long v121 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v120 = objc_msgSend(v121, "commonTypeDict_RealFormat");
  v170[23] = v120;
  v169[24] = @"DISP_F5";
  long long v119 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v118 = objc_msgSend(v119, "commonTypeDict_RealFormat");
  v170[24] = v118;
  v169[25] = @"DCS-BW_F1";
  v117 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v116 = objc_msgSend(v117, "commonTypeDict_RealFormat");
  v170[25] = v116;
  v169[26] = @"DCS-BW_F2";
  long long v115 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v114 = objc_msgSend(v115, "commonTypeDict_RealFormat");
  v170[26] = v114;
  v169[27] = @"DCS-BW_F3";
  long long v113 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v112 = objc_msgSend(v113, "commonTypeDict_RealFormat");
  v170[27] = v112;
  v169[28] = @"DCS-BW_F5";
  long long v111 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v110 = objc_msgSend(v111, "commonTypeDict_RealFormat");
  v170[28] = v110;
  v169[29] = @"AGX-SLOW-DCS-BW_F1";
  long long v109 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v108 = objc_msgSend(v109, "commonTypeDict_RealFormat");
  v170[29] = v108;
  v169[30] = @"AGX-SLOW-DCS-BW_F2";
  v107 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v106 = objc_msgSend(v107, "commonTypeDict_RealFormat");
  v170[30] = v106;
  v169[31] = @"AGX-SLOW-DCS-BW_F3";
  v105 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v104 = objc_msgSend(v105, "commonTypeDict_RealFormat");
  v170[31] = v104;
  v169[32] = @"AGX-SLOW-DCS-BW_F5";
  uint64_t v103 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v102 = objc_msgSend(v103, "commonTypeDict_RealFormat");
  v170[32] = v102;
  v169[33] = @"AGX-FAST-DCS-BW_F1";
  v101 = [MEMORY[0x1E4F929D8] sharedInstance];
  v100 = objc_msgSend(v101, "commonTypeDict_RealFormat");
  v170[33] = v100;
  v169[34] = @"AGX-FAST-DCS-BW_F2";
  v99 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v98 = objc_msgSend(v99, "commonTypeDict_RealFormat");
  v170[34] = v98;
  v169[35] = @"AGX-FAST-DCS-BW_F3";
  id v97 = [MEMORY[0x1E4F929D8] sharedInstance];
  v96 = objc_msgSend(v97, "commonTypeDict_RealFormat");
  v170[35] = v96;
  v169[36] = @"AGX-FAST-DCS-BW_F5";
  id v95 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v94 = objc_msgSend(v95, "commonTypeDict_RealFormat");
  v170[36] = v94;
  v169[37] = @"DCS-BWR_F1";
  v93 = [MEMORY[0x1E4F929D8] sharedInstance];
  v92 = objc_msgSend(v93, "commonTypeDict_RealFormat");
  v170[37] = v92;
  v169[38] = @"DCS-BWR_F2";
  uint64_t v91 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v90 = objc_msgSend(v91, "commonTypeDict_RealFormat");
  v170[38] = v90;
  v169[39] = @"DCS-BWR_F3";
  v89 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v88 = objc_msgSend(v89, "commonTypeDict_RealFormat");
  v170[39] = v88;
  v169[40] = @"DCS-BWR_F5";
  v87 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v86 = objc_msgSend(v87, "commonTypeDict_RealFormat");
  v170[40] = v86;
  v169[41] = @"ISP_F1";
  v85 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v84 = objc_msgSend(v85, "commonTypeDict_RealFormat");
  v170[41] = v84;
  v169[42] = @"ISP_F2";
  int v83 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v82 = objc_msgSend(v83, "commonTypeDict_RealFormat");
  v170[42] = v82;
  v169[43] = @"ISP_F3";
  char v81 = [MEMORY[0x1E4F929D8] sharedInstance];
  v80 = objc_msgSend(v81, "commonTypeDict_RealFormat");
  v170[43] = v80;
  v169[44] = @"ISP_F5";
  uint64_t v79 = [MEMORY[0x1E4F929D8] sharedInstance];
  v78 = objc_msgSend(v79, "commonTypeDict_RealFormat");
  v170[44] = v78;
  v169[45] = @"DISPEXT_F1";
  uint64_t v77 = [MEMORY[0x1E4F929D8] sharedInstance];
  v76 = objc_msgSend(v77, "commonTypeDict_RealFormat");
  v170[45] = v76;
  v169[46] = @"DISPEXT_F2";
  uint64_t v75 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v74 = objc_msgSend(v75, "commonTypeDict_RealFormat");
  v170[46] = v74;
  v169[47] = @"DISPEXT_F3";
  uint64_t v73 = [MEMORY[0x1E4F929D8] sharedInstance];
  v72 = objc_msgSend(v73, "commonTypeDict_RealFormat");
  v170[47] = v72;
  v169[48] = @"DISPEXT_F5";
  uint64_t v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v70 = objc_msgSend(v71, "commonTypeDict_RealFormat");
  v170[48] = v70;
  v169[49] = @"AVE_F1";
  uint64_t v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v68 = objc_msgSend(v69, "commonTypeDict_RealFormat");
  v170[49] = v68;
  v169[50] = @"AVE_F2";
  uint64_t v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v66 = objc_msgSend(v67, "commonTypeDict_RealFormat");
  v170[50] = v66;
  v169[51] = @"AVE_F3";
  uint64_t v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v64 = objc_msgSend(v65, "commonTypeDict_RealFormat");
  v170[51] = v64;
  v169[52] = @"AVE_F5";
  uint64_t v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v62 = objc_msgSend(v63, "commonTypeDict_RealFormat");
  v170[52] = v62;
  v169[53] = @"AVD_F1";
  uint64_t v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v60 = objc_msgSend(v61, "commonTypeDict_RealFormat");
  v170[53] = v60;
  v169[54] = @"AVD_F2";
  uint64_t v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v58 = objc_msgSend(v59, "commonTypeDict_RealFormat");
  v170[54] = v58;
  v169[55] = @"AVD_F3";
  uint64_t v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat");
  v170[55] = v56;
  v169[56] = @"AVD_F5";
  uint64_t v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v54 = objc_msgSend(v55, "commonTypeDict_RealFormat");
  v170[56] = v54;
  v169[57] = @"MSR_F1";
  uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v52 = objc_msgSend(v53, "commonTypeDict_RealFormat");
  v170[57] = v52;
  v169[58] = @"MSR_F2";
  uint64_t v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v50 = objc_msgSend(v51, "commonTypeDict_RealFormat");
  v170[58] = v50;
  v169[59] = @"MSR_F3";
  uint64_t v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v48 = objc_msgSend(v49, "commonTypeDict_RealFormat");
  v170[59] = v48;
  v169[60] = @"MSR_F5";
  uint64_t v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_RealFormat");
  v170[60] = v46;
  v169[61] = @"JPEG_F1";
  uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_RealFormat");
  v170[61] = v44;
  v169[62] = @"JPEG_F2";
  uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v42 = objc_msgSend(v43, "commonTypeDict_RealFormat");
  v170[62] = v42;
  v169[63] = @"JPEG_F3";
  uint64_t v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v40 = objc_msgSend(v41, "commonTypeDict_RealFormat");
  v170[63] = v40;
  v169[64] = @"JPEG_F5";
  uint64_t v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v38 = objc_msgSend(v39, "commonTypeDict_RealFormat");
  v170[64] = v38;
  v169[65] = @"SCODEC_F1";
  uint64_t v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_RealFormat");
  v170[65] = v36;
  v169[66] = @"SCODEC_F2";
  uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v34 = objc_msgSend(v35, "commonTypeDict_RealFormat");
  v170[66] = v34;
  v169[67] = @"SCODEC_F3";
  uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
  v170[67] = v32;
  v169[68] = @"SOCDEC_F5";
  uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v30 = objc_msgSend(v31, "commonTypeDict_RealFormat");
  v170[68] = v30;
  v169[69] = @"DISPx_F1";
  uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
  v170[69] = v28;
  v169[70] = @"DISPx_F2";
  uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v26 = objc_msgSend(v27, "commonTypeDict_RealFormat");
  v170[70] = v26;
  v169[71] = @"DISPx_F3";
  uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
  v170[71] = v24;
  v169[72] = @"DISPx_F5";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat");
  v170[72] = v22;
  v169[73] = @"DCS-RD-BWR_F1";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
  v170[73] = v20;
  v169[74] = @"DCS-RD-BWR_F2";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
  v170[74] = v18;
  v169[75] = @"DCS-RD-BWR_F3";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v170[75] = v16;
  v169[76] = @"DCS-RD-BWR_F5";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  v170[76] = v14;
  v169[77] = @"DCS-WR-BWR_F1";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v170[77] = v4;
  v169[78] = @"DCS-WR-BWR_F2";
  char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v170[78] = v6;
  v169[79] = @"DCS-WR-BWR_F3";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v170[79] = v8;
  v169[80] = @"DCS-WR-BWR_F5";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v170[80] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v170 forKeys:v169 count:81];
  v174[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v174 forKeys:v173 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionAOPcmareceived
{
  v42[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent hasAOPSupport])
  {
    v41[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v39[0] = *MEMORY[0x1E4F92CD0];
    v39[1] = v2;
    v40[0] = &unk_1F29F06F0;
    v40[1] = @"logEventBackwardIOReport";
    v39[2] = *MEMORY[0x1E4F92CE8];
    v40[2] = MEMORY[0x1E4F1CC38];
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
    v42[0] = v36;
    v41[1] = *MEMORY[0x1E4F92CA8];
    v37[0] = @"SampleTime";
    uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_RealFormat_withUnit_s");
    v38[0] = v34;
    v37[1] = @"Ready reports";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
    v38[1] = v32;
    v37[2] = @"Gyro reports";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    void v38[2] = v30;
    v37[3] = @"Accel reports";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
    v38[3] = v28;
    void v37[4] = @"Compass reports";
    uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v38[4] = v26;
    v37[5] = @"HID reports";
    uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v38[5] = v24;
    v37[6] = @"Grape reports";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v38[6] = v22;
    v37[7] = @"Platinum reports";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v38[7] = v20;
    v37[8] = @"Lisa reports";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v38[8] = v18;
    v37[9] = @"ALS reports";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v38[9] = v16;
    v37[10] = @"Osmium reports";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v38[10] = v14;
    v37[11] = @"Message reports";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v38[11] = v4;
    v37[12] = @"SPI reports";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v38[12] = v6;
    v37[13] = @"Reset reports";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v38[13] = v8;
    v37[14] = @"Responses";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v38[14] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:15];
    v42[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionAOPgyroreceived
{
  v42[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent hasAOPSupport])
  {
    v41[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v39[0] = *MEMORY[0x1E4F92CD0];
    v39[1] = v2;
    v40[0] = &unk_1F29F06F0;
    v40[1] = @"logEventBackwardIOReport";
    v39[2] = *MEMORY[0x1E4F92CE8];
    v40[2] = MEMORY[0x1E4F1CC38];
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
    v42[0] = v36;
    v41[1] = *MEMORY[0x1E4F92CA8];
    v37[0] = @"SampleTime";
    uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_RealFormat_withUnit_s");
    v38[0] = v34;
    v37[1] = @"Ready reports";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
    v38[1] = v32;
    v37[2] = @"Gyro reports";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    void v38[2] = v30;
    v37[3] = @"Accel reports";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
    v38[3] = v28;
    void v37[4] = @"Compass reports";
    uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v38[4] = v26;
    v37[5] = @"HID reports";
    uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v38[5] = v24;
    v37[6] = @"Grape reports";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v38[6] = v22;
    v37[7] = @"Platinum reports";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v38[7] = v20;
    v37[8] = @"Lisa reports";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v38[8] = v18;
    v37[9] = @"ALS reports";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v38[9] = v16;
    v37[10] = @"Osmium reports";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v38[10] = v14;
    v37[11] = @"Message reports";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v38[11] = v4;
    v37[12] = @"SPI reports";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v38[12] = v6;
    v37[13] = @"Reset reports";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v38[13] = v8;
    v37[14] = @"Responses";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v38[14] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:15];
    v42[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionAOPlasreceived
{
  v42[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent hasAOPSupport])
  {
    v41[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v39[0] = *MEMORY[0x1E4F92CD0];
    v39[1] = v2;
    v40[0] = &unk_1F29F06F0;
    v40[1] = @"logEventBackwardIOReport";
    v39[2] = *MEMORY[0x1E4F92CE8];
    v40[2] = MEMORY[0x1E4F1CC38];
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
    v42[0] = v36;
    v41[1] = *MEMORY[0x1E4F92CA8];
    v37[0] = @"SampleTime";
    uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v34 = objc_msgSend(v35, "commonTypeDict_RealFormat_withUnit_s");
    v38[0] = v34;
    v37[1] = @"Ready reports";
    uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
    v38[1] = v32;
    v37[2] = @"Gyro reports";
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    void v38[2] = v30;
    v37[3] = @"Accel reports";
    uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
    v38[3] = v28;
    void v37[4] = @"Compass reports";
    uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v38[4] = v26;
    v37[5] = @"HID reports";
    uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v38[5] = v24;
    v37[6] = @"Grape reports";
    uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v38[6] = v22;
    v37[7] = @"Platinum reports";
    uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v38[7] = v20;
    v37[8] = @"Lisa reports";
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v38[8] = v18;
    v37[9] = @"ALS reports";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v38[9] = v16;
    v37[10] = @"Osmium reports";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v38[10] = v14;
    v37[11] = @"Message reports";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v38[11] = v4;
    v37[12] = @"SPI reports";
    char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v38[12] = v6;
    v37[13] = @"Reset reports";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v38[13] = v8;
    v37[14] = @"Responses";
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v38[14] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:15];
    v42[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionPMPDRAMBW
{
  void v34[2] = *MEMORY[0x1E4F143B8];
  v33[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v31[0] = *MEMORY[0x1E4F92CD0];
  v31[1] = v2;
  v32[0] = &unk_1F29F06F0;
  v32[1] = @"logEventBackwardIOReport";
  void v31[2] = *MEMORY[0x1E4F92CE8];
  void v32[2] = MEMORY[0x1E4F1CC38];
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E4F92CA8];
  v29[0] = @"SampleTime";
  uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v26 = objc_msgSend(v27, "commonTypeDict_RealFormat_withUnit_s");
  v30[0] = v26;
  v29[1] = @"F1 RD";
  uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v30[1] = v24;
  void v29[2] = @"F1 WR";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  void v30[2] = v22;
  void v29[3] = @"F2 RD";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v30[3] = v20;
  void v29[4] = @"F2 WR";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  void v30[4] = v18;
  v29[5] = @"F3 RD";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v30[5] = v16;
  v29[6] = @"F3 WR";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v30[6] = v14;
  void v29[7] = @"F4 RD";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  void v30[7] = v4;
  v29[8] = @"F4 WR";
  char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v30[8] = v6;
  v29[9] = @"F5 RD";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v30[9] = v8;
  v29[10] = @"F5 WR";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v30[10] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:11];
  v34[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionPMPDRAMState
{
  void v44[2] = *MEMORY[0x1E4F143B8];
  v43[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v41[0] = *MEMORY[0x1E4F92CD0];
  v41[1] = v2;
  v42[0] = &unk_1F29F06F0;
  v42[1] = @"logEventBackwardIOReport";
  void v41[2] = *MEMORY[0x1E4F92CE8];
  v42[2] = MEMORY[0x1E4F1CC38];
  double v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];
  v44[0] = v38;
  v43[1] = *MEMORY[0x1E4F92CA8];
  v39[0] = @"SampleTime";
  uint64_t v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_RealFormat_withUnit_s");
  v40[0] = v36;
  v39[1] = @"FxS_F1 AC";
  uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v34 = objc_msgSend(v35, "commonTypeDict_RealFormat");
  v40[1] = v34;
  v39[2] = @"FxS_F1 PD";
  uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
  v40[2] = v32;
  void v39[3] = @"FxS_F1 SR";
  uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v30 = objc_msgSend(v31, "commonTypeDict_RealFormat");
  void v40[3] = v30;
  void v39[4] = @"FxS_F2 AC";
  uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
  v40[4] = v28;
  v39[5] = @"FxS_F2 PD";
  uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v26 = objc_msgSend(v27, "commonTypeDict_RealFormat");
  v40[5] = v26;
  v39[6] = @"FxS_F2 SR";
  uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
  v40[6] = v24;
  v39[7] = @"FxS_F3 AC";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat");
  v40[7] = v22;
  v39[8] = @"FxS_F3 PD";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
  v40[8] = v20;
  v39[9] = @"FxS_F3 SR";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
  v40[9] = v18;
  v39[10] = @"FxS_F4 AC";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v40[10] = v16;
  v39[11] = @"FxS_F4 PD";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  v40[11] = v14;
  v39[12] = @"FxS_F4 SR";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v40[12] = v4;
  v39[13] = @"FxS_F5 AC";
  char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v40[13] = v6;
  v39[14] = @"FxS_F5 PD";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v40[14] = v8;
  v39[15] = @"FxS_F5 SR";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v40[15] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:16];
  v44[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionPMPFabricBW
{
  void v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v27[0] = *MEMORY[0x1E4F92CD0];
  v27[1] = v2;
  v28[0] = &unk_1F29F06F0;
  v28[1] = @"logEventBackwardIOReport";
  void v27[2] = *MEMORY[0x1E4F92CE8];
  void v28[2] = MEMORY[0x1E4F1CC38];
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E4F92CA8];
  v25[0] = @"SampleTime";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat_withUnit_s");
  v26[0] = v22;
  v25[1] = @"VMAX RD";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v26[1] = v20;
  void v25[2] = @"VMAX WR";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  void v26[2] = v18;
  v25[3] = @"VMIN RD";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v26[3] = v16;
  v25[4] = @"VMIN WR";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  void v26[4] = v14;
  void v25[5] = @"VNOM RD";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v26[5] = v4;
  void v25[6] = @"VNOM WR";
  char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v26[6] = v6;
  v25[7] = @"VOVD RD";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v26[7] = v8;
  void v25[8] = @"VOVD WR";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v26[8] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:9];
  v30[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionPMPPMCSOCFloor
{
  void v78[2] = *MEMORY[0x1E4F143B8];
  v77[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v75[0] = *MEMORY[0x1E4F92CD0];
  v75[1] = v2;
  v76[0] = &unk_1F29F06F0;
  v76[1] = @"logEventBackwardIOReport";
  v75[2] = *MEMORY[0x1E4F92CE8];
  v76[2] = MEMORY[0x1E4F1CC38];
  v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];
  v78[0] = v72;
  v77[1] = *MEMORY[0x1E4F92CA8];
  v73[0] = @"SampleTime";
  uint64_t v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v70 = objc_msgSend(v71, "commonTypeDict_RealFormat_withUnit_s");
  v74[0] = v70;
  v73[1] = @"PMP_VMIN";
  uint64_t v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v68 = objc_msgSend(v69, "commonTypeDict_RealFormat");
  v74[1] = v68;
  v73[2] = @"PMP_VNOM";
  uint64_t v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v66 = objc_msgSend(v67, "commonTypeDict_RealFormat");
  v74[2] = v66;
  v73[3] = @"PMP_VMAX";
  uint64_t v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v64 = objc_msgSend(v65, "commonTypeDict_RealFormat");
  v74[3] = v64;
  v73[4] = @"PMP_VOVD";
  uint64_t v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v62 = objc_msgSend(v63, "commonTypeDict_RealFormat");
  v74[4] = v62;
  v73[5] = @"CLPC_VMIN";
  uint64_t v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v60 = objc_msgSend(v61, "commonTypeDict_RealFormat");
  v74[5] = v60;
  v73[6] = @"CLPC_VNOM";
  uint64_t v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v58 = objc_msgSend(v59, "commonTypeDict_RealFormat");
  v74[6] = v58;
  v73[7] = @"CLPC_VMAX";
  uint64_t v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat");
  v74[7] = v56;
  v73[8] = @"CLPC_VOVD";
  uint64_t v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v54 = objc_msgSend(v55, "commonTypeDict_RealFormat");
  v74[8] = v54;
  v73[9] = @"GFX_VMIN";
  uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v52 = objc_msgSend(v53, "commonTypeDict_RealFormat");
  v74[9] = v52;
  v73[10] = @"GFX_VNOM";
  uint64_t v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v50 = objc_msgSend(v51, "commonTypeDict_RealFormat");
  v74[10] = v50;
  v73[11] = @"GFX_VMAX";
  uint64_t v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v48 = objc_msgSend(v49, "commonTypeDict_RealFormat");
  v74[11] = v48;
  v73[12] = @"GFX_VOVD";
  uint64_t v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_RealFormat");
  v74[12] = v46;
  v73[13] = @"AP_VMIN";
  uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_RealFormat");
  v74[13] = v44;
  v73[14] = @"AP_VNOM";
  uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v42 = objc_msgSend(v43, "commonTypeDict_RealFormat");
  v74[14] = v42;
  v73[15] = @"AP_VMAX";
  uint64_t v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v40 = objc_msgSend(v41, "commonTypeDict_RealFormat");
  v74[15] = v40;
  v73[16] = @"AP_VOVD";
  uint64_t v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v38 = objc_msgSend(v39, "commonTypeDict_RealFormat");
  v74[16] = v38;
  v73[17] = @"BWR_VMIN";
  uint64_t v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_RealFormat");
  v74[17] = v36;
  v73[18] = @"BWR_VNOM";
  uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v34 = objc_msgSend(v35, "commonTypeDict_RealFormat");
  v74[18] = v34;
  v73[19] = @"BWR_VMAX";
  uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
  v74[19] = v32;
  v73[20] = @"BWR_VOVD";
  uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v30 = objc_msgSend(v31, "commonTypeDict_RealFormat");
  v74[20] = v30;
  v73[21] = @"RMBS_VMIN";
  uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
  v74[21] = v28;
  v73[22] = @"RMBS_VNOM";
  uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v26 = objc_msgSend(v27, "commonTypeDict_RealFormat");
  v74[22] = v26;
  v73[23] = @"RMBS_VMAX";
  uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
  v74[23] = v24;
  v73[24] = @"RMBS_VOVD";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat");
  v74[24] = v22;
  v73[25] = @"BOOST_VMIN";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
  v74[25] = v20;
  v73[26] = @"BOOST_VNOM";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
  v74[26] = v18;
  v73[27] = @"BOOST_VMAX";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v74[27] = v16;
  v73[28] = @"BOOST_VOVD";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  v74[28] = v14;
  v73[29] = @"MISC_VMIN";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v74[29] = v4;
  v73[30] = @"MISC_VNOM";
  char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v74[30] = v6;
  v73[31] = @"MISC_VMAX";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v74[31] = v8;
  v73[32] = @"MISC_VOVD";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v74[32] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:33];
  v78[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionPMPPMCDCSFloor
{
  v110[2] = *MEMORY[0x1E4F143B8];
  v109[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v107[0] = *MEMORY[0x1E4F92CD0];
  v107[1] = v2;
  v108[0] = &unk_1F29F06F0;
  v108[1] = @"logEventBackwardIOReport";
  v107[2] = *MEMORY[0x1E4F92CE8];
  v108[2] = MEMORY[0x1E4F1CC38];
  uint64_t v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:3];
  v110[0] = v104;
  v109[1] = *MEMORY[0x1E4F92CA8];
  v105[0] = @"SampleTime";
  uint64_t v103 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v102 = objc_msgSend(v103, "commonTypeDict_RealFormat_withUnit_s");
  v106[0] = v102;
  v105[1] = @"PMP_F1";
  v101 = [MEMORY[0x1E4F929D8] sharedInstance];
  v100 = objc_msgSend(v101, "commonTypeDict_RealFormat");
  v106[1] = v100;
  v105[2] = @"PMP_F2";
  v99 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v98 = objc_msgSend(v99, "commonTypeDict_RealFormat");
  v106[2] = v98;
  v105[3] = @"PMP_F3";
  id v97 = [MEMORY[0x1E4F929D8] sharedInstance];
  v96 = objc_msgSend(v97, "commonTypeDict_RealFormat");
  v106[3] = v96;
  v105[4] = @"PMP_F4";
  id v95 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v94 = objc_msgSend(v95, "commonTypeDict_RealFormat");
  v106[4] = v94;
  v105[5] = @"PMP_F5";
  v93 = [MEMORY[0x1E4F929D8] sharedInstance];
  v92 = objc_msgSend(v93, "commonTypeDict_RealFormat");
  v106[5] = v92;
  v105[6] = @"PMP_F6";
  uint64_t v91 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v90 = objc_msgSend(v91, "commonTypeDict_RealFormat");
  v106[6] = v90;
  v105[7] = @"CLPC_F1";
  v89 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v88 = objc_msgSend(v89, "commonTypeDict_RealFormat");
  v106[7] = v88;
  v105[8] = @"CLPC_F2";
  v87 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v86 = objc_msgSend(v87, "commonTypeDict_RealFormat");
  v106[8] = v86;
  v105[9] = @"CLPC_F3";
  v85 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v84 = objc_msgSend(v85, "commonTypeDict_RealFormat");
  v106[9] = v84;
  v105[10] = @"CLPC_F4";
  int v83 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v82 = objc_msgSend(v83, "commonTypeDict_RealFormat");
  v106[10] = v82;
  v105[11] = @"CLPC_F5";
  char v81 = [MEMORY[0x1E4F929D8] sharedInstance];
  v80 = objc_msgSend(v81, "commonTypeDict_RealFormat");
  v106[11] = v80;
  v105[12] = @"CLPC_F6";
  uint64_t v79 = [MEMORY[0x1E4F929D8] sharedInstance];
  v78 = objc_msgSend(v79, "commonTypeDict_RealFormat");
  v106[12] = v78;
  v105[13] = @"GFX_F1";
  uint64_t v77 = [MEMORY[0x1E4F929D8] sharedInstance];
  v76 = objc_msgSend(v77, "commonTypeDict_RealFormat");
  v106[13] = v76;
  v105[14] = @"GFX_F2";
  uint64_t v75 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v74 = objc_msgSend(v75, "commonTypeDict_RealFormat");
  v106[14] = v74;
  v105[15] = @"GFX_F3";
  uint64_t v73 = [MEMORY[0x1E4F929D8] sharedInstance];
  v72 = objc_msgSend(v73, "commonTypeDict_RealFormat");
  v106[15] = v72;
  v105[16] = @"GFX_F4";
  uint64_t v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v70 = objc_msgSend(v71, "commonTypeDict_RealFormat");
  v106[16] = v70;
  v105[17] = @"GFX_F5";
  uint64_t v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v68 = objc_msgSend(v69, "commonTypeDict_RealFormat");
  v106[17] = v68;
  v105[18] = @"GFX_F6";
  uint64_t v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v66 = objc_msgSend(v67, "commonTypeDict_RealFormat");
  v106[18] = v66;
  v105[19] = @"AP_F1";
  uint64_t v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v64 = objc_msgSend(v65, "commonTypeDict_RealFormat");
  v106[19] = v64;
  v105[20] = @"AP_F2";
  uint64_t v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v62 = objc_msgSend(v63, "commonTypeDict_RealFormat");
  v106[20] = v62;
  v105[21] = @"AP_F3";
  uint64_t v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v60 = objc_msgSend(v61, "commonTypeDict_RealFormat");
  v106[21] = v60;
  v105[22] = @"AP_F4";
  uint64_t v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v58 = objc_msgSend(v59, "commonTypeDict_RealFormat");
  v106[22] = v58;
  v105[23] = @"AP_F5";
  uint64_t v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v56 = objc_msgSend(v57, "commonTypeDict_RealFormat");
  v106[23] = v56;
  v105[24] = @"AP_F6";
  uint64_t v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v54 = objc_msgSend(v55, "commonTypeDict_RealFormat");
  v106[24] = v54;
  v105[25] = @"BWR_F1";
  uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v52 = objc_msgSend(v53, "commonTypeDict_RealFormat");
  v106[25] = v52;
  v105[26] = @"BWR_F2";
  uint64_t v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v50 = objc_msgSend(v51, "commonTypeDict_RealFormat");
  v106[26] = v50;
  v105[27] = @"BWR_F3";
  uint64_t v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v48 = objc_msgSend(v49, "commonTypeDict_RealFormat");
  v106[27] = v48;
  v105[28] = @"BWR_F4";
  uint64_t v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_RealFormat");
  v106[28] = v46;
  v105[29] = @"BWR_F5";
  uint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_RealFormat");
  v106[29] = v44;
  v105[30] = @"BWR_F6";
  uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v42 = objc_msgSend(v43, "commonTypeDict_RealFormat");
  v106[30] = v42;
  v105[31] = @"RMBS_F1";
  uint64_t v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v40 = objc_msgSend(v41, "commonTypeDict_RealFormat");
  v106[31] = v40;
  v105[32] = @"RMBS_F2";
  uint64_t v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v38 = objc_msgSend(v39, "commonTypeDict_RealFormat");
  v106[32] = v38;
  v105[33] = @"RMBS_F3";
  uint64_t v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_RealFormat");
  v106[33] = v36;
  v105[34] = @"RMBS_F4";
  uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v34 = objc_msgSend(v35, "commonTypeDict_RealFormat");
  v106[34] = v34;
  v105[35] = @"RMBS_F5";
  uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
  v106[35] = v32;
  v105[36] = @"RMBS_F6";
  uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v30 = objc_msgSend(v31, "commonTypeDict_RealFormat");
  v106[36] = v30;
  v105[37] = @"BOOST_F1";
  uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
  v106[37] = v28;
  v105[38] = @"BOOST_F2";
  uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v26 = objc_msgSend(v27, "commonTypeDict_RealFormat");
  v106[38] = v26;
  v105[39] = @"BOOST_F3";
  uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
  v106[39] = v24;
  v105[40] = @"BOOST_F4";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat");
  v106[40] = v22;
  v105[41] = @"BOOST_F5";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
  v106[41] = v20;
  v105[42] = @"BOOST_F6";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
  v106[42] = v18;
  v105[43] = @"MISC_F1";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v106[43] = v16;
  v105[44] = @"MISC_F2";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  v106[44] = v14;
  v105[45] = @"MISC_F3";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v106[45] = v4;
  v105[46] = @"MISC_F4";
  char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v106[46] = v6;
  v105[47] = @"MISC_F5";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v106[47] = v8;
  v105[48] = @"MISC_F6";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v106[48] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:49];
  v110[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionANS2PCIE0
{
  void v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v27[0] = *MEMORY[0x1E4F92CD0];
  v27[1] = v2;
  v28[0] = &unk_1F29F06F0;
  v28[1] = @"logEventBackwardIOReport";
  void v27[2] = *MEMORY[0x1E4F92CE8];
  void v28[2] = MEMORY[0x1E4F1CC38];
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E4F92CA8];
  v25[0] = @"SampleTime";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_RealFormat_withUnit_s");
  v26[0] = v22;
  v25[1] = @"Link 0 states_L0";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
  v26[1] = v20;
  void v25[2] = @"Link 0 states_L0_Transitions";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  void v26[2] = v18;
  v25[3] = @"Link 0 states_L1.0";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v26[3] = v16;
  v25[4] = @"Link 0 states_L1.0_Transitions";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  void v26[4] = v14;
  void v25[5] = @"Link 0 states_L1.1";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v26[5] = v4;
  void v25[6] = @"Link 0 states_L1.1_Transitions";
  char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v26[6] = v6;
  v25[7] = @"Link 0 states_L1.2";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v26[7] = v8;
  void v25[8] = @"Link 0 states_L1.2_Transitions";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v26[8] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:9];
  v30[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionPMPPWRS0
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitionPMP0PWRS0
{
  return (id)MEMORY[0x1E4F1CC08];
}

uint64_t __41__PLIOReportAgent_shouldLogMemCacheStats__block_invoke()
{
  if (([MEMORY[0x1E4F929C0] BOOLForKey:@"disableMemCacheStatConditions" ifNotSet:0] & 1) != 0
    || ([MEMORY[0x1E4F929C0] taskMode] & 1) != 0
    || (uint64_t result = [MEMORY[0x1E4F929C0] fullMode], result))
  {
    uint64_t result = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
    BOOL v1 = (int)result > 1001012;
  }
  else
  {
    BOOL v1 = 0;
  }
  byte_1EBD583D5 = v1;
  return result;
}

+ (id)entryEventBackwardDefinitionMemCacheStats
{
  v257[2] = *MEMORY[0x1E4F143B8];
  if (+[PLIOReportAgent shouldLogMemCacheStats])
  {
    v256[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C60];
    v254[0] = *MEMORY[0x1E4F92CD0];
    v254[1] = v2;
    v255[0] = &unk_1F29F0700;
    v255[1] = MEMORY[0x1E4F1CC28];
    v251 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v255 forKeys:v254 count:2];
    v257[0] = v251;
    v256[1] = *MEMORY[0x1E4F92CA8];
    v252[0] = @"SampleTime";
    uint64_t v250 = [MEMORY[0x1E4F929D8] sharedInstance];
    v249 = objc_msgSend(v250, "commonTypeDict_RealFormat");
    v253[0] = v249;
    uint64_t v248 = +[PLIOReportAgent keyForSubBlock:0];
    v252[1] = v248;
    v247 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v246 = objc_msgSend(v247, "commonTypeDict_IntegerFormat");
    v253[1] = v246;
    v245 = +[PLIOReportAgent keyForSubBlock:1];
    v252[2] = v245;
    uint64_t v244 = [MEMORY[0x1E4F929D8] sharedInstance];
    v243 = objc_msgSend(v244, "commonTypeDict_IntegerFormat");
    v253[2] = v243;
    uint64_t v242 = +[PLIOReportAgent keyForSubBlock:2];
    v252[3] = v242;
    v241 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v240 = objc_msgSend(v241, "commonTypeDict_IntegerFormat");
    v253[3] = v240;
    v239 = +[PLIOReportAgent keyForSubBlock:3];
    v252[4] = v239;
    uint64_t v238 = [MEMORY[0x1E4F929D8] sharedInstance];
    v237 = objc_msgSend(v238, "commonTypeDict_IntegerFormat");
    void v253[4] = v237;
    uint64_t v236 = +[PLIOReportAgent keyForSubBlock:4];
    v252[5] = v236;
    v235 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v234 = objc_msgSend(v235, "commonTypeDict_IntegerFormat");
    v253[5] = v234;
    v233 = +[PLIOReportAgent keyForSubBlock:5];
    v252[6] = v233;
    uint64_t v232 = [MEMORY[0x1E4F929D8] sharedInstance];
    v231 = objc_msgSend(v232, "commonTypeDict_IntegerFormat");
    v253[6] = v231;
    uint64_t v230 = +[PLIOReportAgent keyForSubBlock:6];
    v252[7] = v230;
    v229 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v228 = objc_msgSend(v229, "commonTypeDict_IntegerFormat");
    v253[7] = v228;
    v227 = +[PLIOReportAgent keyForSubBlock:7];
    v252[8] = v227;
    uint64_t v226 = [MEMORY[0x1E4F929D8] sharedInstance];
    v225 = objc_msgSend(v226, "commonTypeDict_IntegerFormat");
    v253[8] = v225;
    uint64_t v224 = +[PLIOReportAgent keyForSubBlock:8];
    v252[9] = v224;
    v223 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v222 = objc_msgSend(v223, "commonTypeDict_IntegerFormat");
    v253[9] = v222;
    v221 = +[PLIOReportAgent keyForSubBlock:9];
    v252[10] = v221;
    uint64_t v220 = [MEMORY[0x1E4F929D8] sharedInstance];
    v219 = objc_msgSend(v220, "commonTypeDict_IntegerFormat");
    v253[10] = v219;
    uint64_t v218 = +[PLIOReportAgent keyForSubBlock:10];
    v252[11] = v218;
    uint64_t v217 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v216 = objc_msgSend(v217, "commonTypeDict_IntegerFormat");
    v253[11] = v216;
    v215 = +[PLIOReportAgent keyForSubBlock:11];
    v252[12] = v215;
    uint64_t v214 = [MEMORY[0x1E4F929D8] sharedInstance];
    v213 = objc_msgSend(v214, "commonTypeDict_IntegerFormat");
    v253[12] = v213;
    uint64_t v212 = +[PLIOReportAgent keyForSubBlock:12];
    v252[13] = v212;
    v211 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v210 = objc_msgSend(v211, "commonTypeDict_IntegerFormat");
    v253[13] = v210;
    v209 = +[PLIOReportAgent keyForSubBlock:13];
    v252[14] = v209;
    uint64_t v208 = [MEMORY[0x1E4F929D8] sharedInstance];
    v207 = objc_msgSend(v208, "commonTypeDict_IntegerFormat");
    v253[14] = v207;
    uint64_t v206 = +[PLIOReportAgent keyForSubBlock:14];
    v252[15] = v206;
    v205 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v204 = objc_msgSend(v205, "commonTypeDict_IntegerFormat");
    v253[15] = v204;
    v203 = +[PLIOReportAgent keyForSubBlock:15];
    v252[16] = v203;
    uint64_t v202 = [MEMORY[0x1E4F929D8] sharedInstance];
    v201 = objc_msgSend(v202, "commonTypeDict_IntegerFormat");
    v253[16] = v201;
    uint64_t v200 = +[PLIOReportAgent keyForSubBlock:16];
    v252[17] = v200;
    v199 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v198 = objc_msgSend(v199, "commonTypeDict_IntegerFormat");
    v253[17] = v198;
    v197 = +[PLIOReportAgent keyForSubBlock:17];
    v252[18] = v197;
    uint64_t v196 = [MEMORY[0x1E4F929D8] sharedInstance];
    v195 = objc_msgSend(v196, "commonTypeDict_IntegerFormat");
    v253[18] = v195;
    uint64_t v194 = +[PLIOReportAgent keyForSubBlock:18];
    v252[19] = v194;
    v193 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v192 = objc_msgSend(v193, "commonTypeDict_IntegerFormat");
    v253[19] = v192;
    v191 = +[PLIOReportAgent keyForSubBlock:19];
    v252[20] = v191;
    uint64_t v190 = [MEMORY[0x1E4F929D8] sharedInstance];
    v189 = objc_msgSend(v190, "commonTypeDict_IntegerFormat");
    v253[20] = v189;
    uint64_t v188 = +[PLIOReportAgent keyForSubBlock:20];
    v252[21] = v188;
    v187 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v186 = objc_msgSend(v187, "commonTypeDict_IntegerFormat");
    v253[21] = v186;
    v185 = +[PLIOReportAgent keyForSubBlock:21];
    v252[22] = v185;
    uint64_t v184 = [MEMORY[0x1E4F929D8] sharedInstance];
    v183 = objc_msgSend(v184, "commonTypeDict_IntegerFormat");
    v253[22] = v183;
    uint64_t v182 = +[PLIOReportAgent keyForSubBlock:22];
    v252[23] = v182;
    v181 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v180 = objc_msgSend(v181, "commonTypeDict_IntegerFormat");
    v253[23] = v180;
    v179 = +[PLIOReportAgent keyForSubBlock:23];
    v252[24] = v179;
    uint64_t v178 = [MEMORY[0x1E4F929D8] sharedInstance];
    v177 = objc_msgSend(v178, "commonTypeDict_IntegerFormat");
    v253[24] = v177;
    uint64_t v176 = +[PLIOReportAgent keyForSubBlock:24];
    v252[25] = v176;
    v175 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v174 = objc_msgSend(v175, "commonTypeDict_IntegerFormat");
    v253[25] = v174;
    v173 = +[PLIOReportAgent keyForSubBlock:25];
    v252[26] = v173;
    uint64_t v172 = [MEMORY[0x1E4F929D8] sharedInstance];
    v171 = objc_msgSend(v172, "commonTypeDict_IntegerFormat");
    v253[26] = v171;
    uint64_t v170 = +[PLIOReportAgent keyForSubBlock:26];
    v252[27] = v170;
    v169 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v168 = objc_msgSend(v169, "commonTypeDict_IntegerFormat");
    v253[27] = v168;
    v167 = +[PLIOReportAgent keyForSubBlock:27];
    v252[28] = v167;
    uint64_t v166 = [MEMORY[0x1E4F929D8] sharedInstance];
    v165 = objc_msgSend(v166, "commonTypeDict_IntegerFormat");
    v253[28] = v165;
    uint64_t v164 = +[PLIOReportAgent keyForSubBlock:28];
    v252[29] = v164;
    v163 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v162 = objc_msgSend(v163, "commonTypeDict_IntegerFormat");
    v253[29] = v162;
    v161 = +[PLIOReportAgent keyForSubBlock:29];
    v252[30] = v161;
    uint64_t v160 = [MEMORY[0x1E4F929D8] sharedInstance];
    v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat");
    v253[30] = v159;
    uint64_t v158 = +[PLIOReportAgent keyForSubBlock:30];
    v252[31] = v158;
    v157 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v156 = objc_msgSend(v157, "commonTypeDict_IntegerFormat");
    v253[31] = v156;
    v155 = +[PLIOReportAgent keyForSubBlock:31];
    v252[32] = v155;
    uint64_t v154 = [MEMORY[0x1E4F929D8] sharedInstance];
    v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat");
    v253[32] = v153;
    uint64_t v152 = +[PLIOReportAgent keyForSubBlock:32];
    v252[33] = v152;
    v151 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v150 = objc_msgSend(v151, "commonTypeDict_IntegerFormat");
    v253[33] = v150;
    v149 = +[PLIOReportAgent keyForSubBlock:33];
    v252[34] = v149;
    uint64_t v148 = [MEMORY[0x1E4F929D8] sharedInstance];
    v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat");
    v253[34] = v147;
    uint64_t v146 = +[PLIOReportAgent keyForSubBlock:34];
    v252[35] = v146;
    v145 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v144 = objc_msgSend(v145, "commonTypeDict_IntegerFormat");
    v253[35] = v144;
    v143 = +[PLIOReportAgent keyForSubBlock:35];
    v252[36] = v143;
    uint64_t v142 = [MEMORY[0x1E4F929D8] sharedInstance];
    v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat");
    v253[36] = v141;
    uint64_t v140 = +[PLIOReportAgent keyForSubBlock:36];
    v252[37] = v140;
    v139 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v138 = objc_msgSend(v139, "commonTypeDict_IntegerFormat");
    v253[37] = v138;
    v137 = +[PLIOReportAgent keyForSubBlock:37];
    v252[38] = v137;
    uint64_t v136 = [MEMORY[0x1E4F929D8] sharedInstance];
    v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat");
    v253[38] = v135;
    uint64_t v134 = +[PLIOReportAgent keyForSubBlock:38];
    v252[39] = v134;
    v133 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v132 = objc_msgSend(v133, "commonTypeDict_IntegerFormat");
    v253[39] = v132;
    v131 = +[PLIOReportAgent keyForSubBlock:39];
    v252[40] = v131;
    uint64_t v130 = [MEMORY[0x1E4F929D8] sharedInstance];
    v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat");
    v253[40] = v129;
    uint64_t v128 = +[PLIOReportAgent keyForSubBlock:40];
    v252[41] = v128;
    uint64_t v127 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v126 = objc_msgSend(v127, "commonTypeDict_IntegerFormat");
    v253[41] = v126;
    v125 = +[PLIOReportAgent keyForSubBlock:41];
    v252[42] = v125;
    uint64_t v124 = [MEMORY[0x1E4F929D8] sharedInstance];
    v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat");
    v253[42] = v123;
    uint64_t v122 = +[PLIOReportAgent keyForSubBlock:42];
    v252[43] = v122;
    long long v121 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v120 = objc_msgSend(v121, "commonTypeDict_IntegerFormat");
    v253[43] = v120;
    long long v119 = +[PLIOReportAgent keyForSubBlock:43];
    v252[44] = v119;
    uint64_t v118 = [MEMORY[0x1E4F929D8] sharedInstance];
    v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat");
    v253[44] = v117;
    uint64_t v116 = +[PLIOReportAgent keyForSubBlock:44];
    v252[45] = v116;
    long long v115 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v114 = objc_msgSend(v115, "commonTypeDict_IntegerFormat");
    v253[45] = v114;
    long long v113 = +[PLIOReportAgent keyForSubBlock:45];
    v252[46] = v113;
    long long v112 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v253[46] = v111;
    long long v110 = +[PLIOReportAgent keyForSubBlock:46];
    v252[47] = v110;
    long long v109 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v108 = objc_msgSend(v109, "commonTypeDict_IntegerFormat");
    v253[47] = v108;
    v107 = +[PLIOReportAgent keyForSubBlock:47];
    v252[48] = v107;
    uint64_t v106 = [MEMORY[0x1E4F929D8] sharedInstance];
    v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat");
    v253[48] = v105;
    uint64_t v104 = +[PLIOReportAgent keyForSubBlock:48];
    v252[49] = v104;
    uint64_t v103 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v102 = objc_msgSend(v103, "commonTypeDict_IntegerFormat");
    v253[49] = v102;
    v101 = +[PLIOReportAgent keyForSubBlock:49];
    v252[50] = v101;
    v100 = [MEMORY[0x1E4F929D8] sharedInstance];
    v99 = objc_msgSend(v100, "commonTypeDict_IntegerFormat");
    v253[50] = v99;
    int v98 = +[PLIOReportAgent keyForSubBlock:50];
    v252[51] = v98;
    id v97 = [MEMORY[0x1E4F929D8] sharedInstance];
    v96 = objc_msgSend(v97, "commonTypeDict_IntegerFormat");
    v253[51] = v96;
    id v95 = +[PLIOReportAgent keyForSubBlock:51];
    v252[52] = v95;
    uint64_t v94 = [MEMORY[0x1E4F929D8] sharedInstance];
    v93 = objc_msgSend(v94, "commonTypeDict_IntegerFormat");
    v253[52] = v93;
    v92 = +[PLIOReportAgent keyForSubBlock:52];
    v252[53] = v92;
    uint64_t v91 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v90 = objc_msgSend(v91, "commonTypeDict_IntegerFormat");
    v253[53] = v90;
    v89 = +[PLIOReportAgent keyForSubBlock:53];
    v252[54] = v89;
    uint64_t v88 = [MEMORY[0x1E4F929D8] sharedInstance];
    v87 = objc_msgSend(v88, "commonTypeDict_IntegerFormat");
    v253[54] = v87;
    uint64_t v86 = +[PLIOReportAgent keyForSubBlock:54];
    v252[55] = v86;
    v85 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v84 = objc_msgSend(v85, "commonTypeDict_IntegerFormat");
    v253[55] = v84;
    int v83 = +[PLIOReportAgent keyForSubBlock:55];
    v252[56] = v83;
    char v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    char v81 = objc_msgSend(v82, "commonTypeDict_IntegerFormat");
    v253[56] = v81;
    v80 = +[PLIOReportAgent keyForSubBlock:56];
    v252[57] = v80;
    uint64_t v79 = [MEMORY[0x1E4F929D8] sharedInstance];
    v78 = objc_msgSend(v79, "commonTypeDict_IntegerFormat");
    v253[57] = v78;
    uint64_t v77 = +[PLIOReportAgent keyForSubBlock:57];
    v252[58] = v77;
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat");
    v253[58] = v75;
    uint64_t v74 = +[PLIOReportAgent keyForSubBlock:58];
    v252[59] = v74;
    uint64_t v73 = [MEMORY[0x1E4F929D8] sharedInstance];
    v72 = objc_msgSend(v73, "commonTypeDict_IntegerFormat");
    v253[59] = v72;
    uint64_t v71 = +[PLIOReportAgent keyForSubBlock:59];
    v252[60] = v71;
    char v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat");
    v253[60] = v69;
    long long v68 = +[PLIOReportAgent keyForSubBlock:60];
    v252[61] = v68;
    uint64_t v67 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat");
    v253[61] = v66;
    uint64_t v65 = +[PLIOReportAgent keyForSubBlock:61];
    v252[62] = v65;
    uint64_t v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v253[62] = v63;
    double v62 = +[PLIOReportAgent keyForSubBlock:62];
    v252[63] = v62;
    uint64_t v61 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v60 = objc_msgSend(v61, "commonTypeDict_IntegerFormat");
    v253[63] = v60;
    uint64_t v59 = +[PLIOReportAgent keyForSubBlock:63];
    v252[64] = v59;
    uint64_t v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat");
    v253[64] = v57;
    int v56 = +[PLIOReportAgent keyForSubBlock:64];
    v252[65] = v56;
    uint64_t v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
    v253[65] = v54;
    uint64_t v53 = +[PLIOReportAgent keyForSubBlock:65];
    v252[66] = v53;
    uint64_t v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v253[66] = v51;
    double v50 = +[PLIOReportAgent keyForSubBlock:66];
    v252[67] = v50;
    uint64_t v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
    v253[67] = v48;
    uint64_t v47 = +[PLIOReportAgent keyForSubBlock:67];
    v252[68] = v47;
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
    v253[68] = v45;
    v44 = +[PLIOReportAgent keyForSubBlock:68];
    v252[69] = v44;
    uint64_t v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
    v253[69] = v42;
    uint64_t v41 = +[PLIOReportAgent keyForSubBlock:69];
    v252[70] = v41;
    double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v253[70] = v39;
    double v38 = +[PLIOReportAgent keyForSubBlock:70];
    v252[71] = v38;
    uint64_t v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
    v253[71] = v36;
    uint64_t v35 = +[PLIOReportAgent keyForSubBlock:71];
    v252[72] = v35;
    char v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v253[72] = v33;
    uint64_t v32 = +[PLIOReportAgent keyForSubBlock:72];
    v252[73] = v32;
    uint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v253[73] = v30;
    uint64_t v29 = +[PLIOReportAgent keyForSubBlock:73];
    v252[74] = v29;
    uint64_t v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v253[74] = v27;
    uint64_t v26 = +[PLIOReportAgent keyForSubBlock:74];
    v252[75] = v26;
    uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v253[75] = v24;
    uint64_t v23 = +[PLIOReportAgent keyForSubBlock:75];
    v252[76] = v23;
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v253[76] = v21;
    uint64_t v20 = +[PLIOReportAgent keyForSubBlock:76];
    v252[77] = v20;
    uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v253[77] = v18;
    uint64_t v17 = +[PLIOReportAgent keyForSubBlock:77];
    v252[78] = v17;
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v253[78] = v15;
    uint64_t v14 = +[PLIOReportAgent keyForSubBlock:78];
    v252[79] = v14;
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v253[79] = v4;
    char v5 = +[PLIOReportAgent keyForSubBlock:79];
    v252[80] = v5;
    double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v253[80] = v7;
    id v8 = +[PLIOReportAgent keyForSubBlock:80];
    void v252[81] = v8;
    id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v253[81] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v253 forKeys:v252 count:82];
    v257[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v257 forKeys:v256 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionTrackpadPowerStats
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)channelDictionaryWithChannelSet:(id)a3 withMinProcessTime:(double)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v21 = 0;
  CFTypeRef cf = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __70__PLIOReportAgent_channelDictionaryWithChannelSet_withMinProcessTime___block_invoke;
  uint64_t v18 = &unk_1E692CBF8;
  id v7 = v6;
  id v19 = v7;
  uint64_t v20 = self;
  id v8 = (const void *)IOReportCopyFilteredChannels();
  if (IOReportGetChannelCount())
  {
    Subscription = (void *)IOReportCreateSubscription();
    if (v8) {
      CFRelease(v8);
    }
    if (!Subscription) {
      goto LABEL_10;
    }
    if (IOReportGetChannelCount())
    {
      id v10 = objc_opt_new();
      [v10 setObject:Subscription forKey:@"subscription"];

      uint64_t v11 = (void *)cf;
      [v10 setObject:cf forKey:@"subscribedChannels"];

      uint64_t v12 = [NSNumber numberWithDouble:a4];
      [v10 setObject:v12 forKey:@"minNotificationProcessTime"];

      goto LABEL_11;
    }
    CFRelease(Subscription);
    CFTypeRef v13 = cf;
  }
  else
  {
    CFTypeRef v13 = v8;
  }
  CFRelease(v13);
LABEL_10:
  id v10 = 0;
LABEL_11:

  return v10;
}

uint64_t __70__PLIOReportAgent_channelDictionaryWithChannelSet_withMinProcessTime___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D942A350]();
  uint64_t v3 = IOReportChannelGetGroup();
  uint64_t v4 = IOReportChannelGetSubGroup();
  if (v4)
  {
    char v5 = [v3 stringByAppendingString:@","];
    id v6 = [v5 stringByAppendingString:v4];
  }
  else
  {
    id v6 = v3;
  }
  if ([*(id *)(a1 + 32) containsObject:v6])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__PLIOReportAgent_channelDictionaryWithChannelSet_withMinProcessTime___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v7;
      if (qword_1EBD58430 != -1) {
        dispatch_once(&qword_1EBD58430, block);
      }
      if (byte_1EBD583D6)
      {
        id v8 = [NSString stringWithFormat:@"!!! Retain: testObj = %@ !!!", v6];
        id v9 = (void *)MEMORY[0x1E4F929B8];
        id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLIOReportAgent.m"];
        uint64_t v11 = [v10 lastPathComponent];
        uint64_t v12 = [NSString stringWithUTF8String:"-[PLIOReportAgent channelDictionaryWithChannelSet:withMinProcessTime:]_block_invoke"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:8207];

        CFTypeRef v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = v8;
          _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        uint64_t v14 = 0;
LABEL_22:

        goto LABEL_24;
      }
    }
  }
  else if (![MEMORY[0x1E4F92A38] isWatch] {
         || (IOReportChannelGetChannelName(),
  }
             uint64_t v15 = objc_claimAutoreleasedReturnValue(),
             [NSString stringWithFormat:@"%@,%@", v6, v15],
             uint64_t v16 = objc_claimAutoreleasedReturnValue(),
             char v17 = [*(id *)(a1 + 32) containsObject:v16],
             v16,
             v15,
             (v17 & 1) == 0))
  {
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_23;
    }
    uint64_t v18 = objc_opt_class();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __70__PLIOReportAgent_channelDictionaryWithChannelSet_withMinProcessTime___block_invoke_8292;
    void v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v24[4] = v18;
    if (qword_1EBD58438 != -1) {
      dispatch_once(&qword_1EBD58438, v24);
    }
    if (!byte_1EBD583D7)
    {
LABEL_23:
      uint64_t v14 = 16;
      goto LABEL_24;
    }
    id v8 = [NSString stringWithFormat:@"!!! Remove: testObj = %@ !!!", v6];
    id v19 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLIOReportAgent.m"];
    uint64_t v21 = [v20 lastPathComponent];
    uint64_t v22 = [NSString stringWithUTF8String:"-[PLIOReportAgent channelDictionaryWithChannelSet:withMinProcessTime:]_block_invoke_2"];
    [v19 logMessage:v8 fromFile:v21 fromFunction:v22 fromLineNumber:8217];

    CFTypeRef v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v8;
      _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    uint64_t v14 = 16;
    goto LABEL_22;
  }
  uint64_t v14 = 0;
LABEL_24:

  return v14;
}

uint64_t __70__PLIOReportAgent_channelDictionaryWithChannelSet_withMinProcessTime___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD583D6 = result;
  return result;
}

uint64_t __70__PLIOReportAgent_channelDictionaryWithChannelSet_withMinProcessTime___block_invoke_8292(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD583D7 = result;
  return result;
}

uint64_t __70__PLIOReportAgent_channelDictionaryWithChannelSet_withMinProcessTime___block_invoke_8298(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD583D8 = result;
  return result;
}

- (void)subscribeToChannelSets
{
  memset(v27, 0, sizeof(v27));
  int v28 = 0;
  InitializeAllChecks((uint64_t)v27);
  uint64_t v3 = [(PLIOReportAgent *)self buildBaseSet:v27];
  if (v3)
  {
    uint64_t v4 = [(PLIOReportAgent *)self channelDictionaryWithChannelSet:v3 withMinProcessTime:-300.0];
    sampleChannelsSignificantBattery = self->_sampleChannelsSignificantBattery;
    self->_sampleChannelsSignificantBattery = v4;
  }
  id v6 = [(PLIOReportAgent *)self buildHalfHourSet:v27];
  if (v6)
  {
    uint64_t v7 = [(PLIOReportAgent *)self channelDictionaryWithChannelSet:v6 withMinProcessTime:-1800.0];
    sampleChannelsHalfHour = self->_sampleChannelsHalfHour;
    self->_sampleChannelsHalfHour = v7;
  }
  id v9 = [(PLIOReportAgent *)self buildDailySet:v27];
  if (v9)
  {
    id v10 = [(PLIOReportAgent *)self channelDictionaryWithChannelSet:v9 withMinProcessTime:-86400.0];
    sampleChannelsDaily = self->_sampleChannelsDaily;
    self->_sampleChannelsDaily = v10;
  }
  uint64_t v12 = [(PLIOReportAgent *)self buildScreenStateSet:v27];
  if (v12)
  {
    CFTypeRef v13 = [(PLIOReportAgent *)self channelDictionaryWithChannelSet:v12 withMinProcessTime:0.0];
    sampleChannelsScreenState = self->_sampleChannelsScreenState;
    self->_sampleChannelsScreenState = v13;
  }
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    uint64_t v15 = [(PLIOReportAgent *)self buildDisplayStateChangeSet:v27];
    if (v15)
    {
      uint64_t v16 = [(PLIOReportAgent *)self channelDictionaryWithChannelSet:v15 withMinProcessTime:0.0];
      sampleChannelsDisplayStateChange = self->_sampleChannelsDisplayStateChange;
      self->_sampleChannelsDisplayStateChange = v16;
    }
  }
  uint64_t v18 = [(PLIOReportAgent *)self buildAudioEventSet:v27];
  if (v18)
  {
    id v19 = [(PLIOReportAgent *)self channelDictionaryWithChannelSet:v18 withMinProcessTime:-60.0];
    sampleChannelsAudioEvent = self->_sampleChannelsAudioEvent;
    self->_sampleChannelsAudioEvent = v19;
  }
  uint64_t v21 = [(PLIOReportAgent *)self buildWakeSet:v27];
  if (v21)
  {
    uint64_t v22 = [(PLIOReportAgent *)self channelDictionaryWithChannelSet:v21 withMinProcessTime:0.0];
    sampleChannelsWake = self->_sampleChannelsWake;
    self->_sampleChannelsWake = v22;
  }
  uint64_t v24 = [(PLIOReportAgent *)self buildSnapshotSet:v27];
  if (v24)
  {
    uint64_t v25 = [(PLIOReportAgent *)self channelDictionaryWithChannelSet:v24 withMinProcessTime:-300.0];
    sampleChannelsSnapshot = self->_sampleChannelsSnapshot;
    self->_sampleChannelsSnapshot = v25;
  }
}

- (void)sampleDeltaForChannelSets
{
  if (self->_sampleChannelsSignificantBattery) {
    id v3 = -[PLIOReportAgent sampleDeltaForChannelGroup:](self, "sampleDeltaForChannelGroup:");
  }
  if (self->_sampleChannelsHalfHour) {
    id v4 = -[PLIOReportAgent sampleDeltaForChannelGroup:](self, "sampleDeltaForChannelGroup:");
  }
  if (self->_sampleChannelsDaily) {
    id v5 = -[PLIOReportAgent sampleDeltaForChannelGroup:](self, "sampleDeltaForChannelGroup:");
  }
  if (self->_sampleChannelsScreenState) {
    id v6 = -[PLIOReportAgent sampleDeltaForChannelGroup:](self, "sampleDeltaForChannelGroup:");
  }
  if (self->_sampleChannelsAudioEvent) {
    id v7 = -[PLIOReportAgent sampleDeltaForChannelGroup:](self, "sampleDeltaForChannelGroup:");
  }
  if (self->_sampleChannelsWake) {
    id v8 = -[PLIOReportAgent sampleDeltaForChannelGroup:](self, "sampleDeltaForChannelGroup:");
  }
}

- (PLIOReportAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLIOReportAgent;
  return [(PLAgent *)&v3 init];
}

- (id)buildBaseSet:(IOReportGroupChecks *)a3
{
  v147[80] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  v146[0] = @"AOP,Amp Power";
  v146[1] = @"AOP,mux Power";
  v147[0] = MEMORY[0x1E4F1CC38];
  v147[1] = MEMORY[0x1E4F1CC38];
  v146[2] = @"3DTouch,force";
  v146[3] = @"PPM Stats,Droop Controller";
  v147[2] = MEMORY[0x1E4F1CC38];
  v147[3] = MEMORY[0x1E4F1CC38];
  v147[4] = MEMORY[0x1E4F1CC38];
  v146[4] = @"Haptics,Stats";
  v146[5] = @"AOP,gyro power";
  BOOL v5 = a3[1].var2 || a3[2].var0;
  v143 = [NSNumber numberWithInt:v5];
  v147[5] = v143;
  v146[6] = @"AOP,compass power";
  BOOL v6 = a3[1].var2 || a3[2].var0;
  uint64_t v142 = [NSNumber numberWithInt:v6];
  v147[6] = v142;
  v146[7] = @"AOP,accel power";
  BOOL v7 = a3[1].var2 || a3[2].var0;
  v141 = [NSNumber numberWithInt:v7];
  v147[7] = v141;
  v146[8] = @"AOP,pressure power";
  BOOL v8 = a3[1].var2 || a3[2].var0;
  uint64_t v140 = [NSNumber numberWithInt:v8];
  v147[8] = v140;
  v146[9] = @"IOMFB Reporting,frame rate phase";
  BOOL v9 = a3[1].var2 || a3[2].var0;
  v139 = [NSNumber numberWithInt:v9];
  v147[9] = v139;
  v146[10] = @"DCP,scanout stats";
  uint64_t v138 = objc_msgSend(NSNumber, "numberWithBool:", +[PLIOReportAgent shouldLogDCPScanoutStats](PLIOReportAgent, "shouldLogDCPScanoutStats"));
  v147[10] = v138;
  v146[11] = @"H13ISP,H13ISP Events";
  v137 = [NSNumber numberWithBool:a3[4].var1];
  v147[11] = v137;
  v146[12] = @"H16ISP,H16ISP Events";
  uint64_t v136 = [NSNumber numberWithBool:a3[4].var1];
  v147[12] = v136;
  v146[13] = @"CPU Stats,CPU Complex Voltage State Time";
  BOOL v10 = a3[1].var2 || a3[2].var0;
  v135 = [NSNumber numberWithInt:v10];
  v147[13] = v135;
  v146[14] = @"PMP,DRAM BW";
  BOOL v11 = a3[1].var2 || a3[2].var0;
  uint64_t v134 = [NSNumber numberWithInt:v11];
  v147[14] = v134;
  v146[15] = @"PMP,DRAM State";
  BOOL v12 = a3[1].var2 || a3[2].var0;
  v133 = [NSNumber numberWithInt:v12];
  v147[15] = v133;
  v146[16] = @"PMP,Fabric BW";
  BOOL v13 = a3[1].var2 || a3[2].var0;
  uint64_t v132 = [NSNumber numberWithInt:v13];
  v147[16] = v132;
  v146[17] = @"ANS2,PCIE0";
  BOOL v14 = a3[1].var2 || a3[2].var0;
  v131 = [NSNumber numberWithInt:v14];
  v147[17] = v131;
  v147[18] = v4;
  v146[18] = @"MTP,button-capture";
  v146[19] = @"CPU Stats,CPU Complex Performance States";
  BOOL v15 = a3[1].var2 || a3[2].var0;
  uint64_t v130 = [NSNumber numberWithInt:v15];
  v147[19] = v130;
  v146[20] = @"CPU Stats,CPU Core Performance States";
  BOOL v16 = a3[1].var2 || a3[2].var0;
  v129 = [NSNumber numberWithInt:v16];
  v147[20] = v129;
  v147[21] = v4;
  v146[21] = @"AOP,AOP Sensors";
  v146[22] = @"AOP,Power";
  BOOL v17 = a3[1].var2 || a3[2].var0;
  uint64_t v128 = [NSNumber numberWithInt:v17];
  v147[22] = v128;
  v146[23] = @"AOP,Performance";
  uint64_t v127 = [NSNumber numberWithBool:a3[2].var0];
  v147[23] = v127;
  v146[24] = @"Multitouch,Multitouch high level stats";
  uint64_t v126 = [NSNumber numberWithInt:!a3[5].var1];
  v147[24] = v126;
  v146[25] = @"DCP0,swap";
  v125 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F92A38], "kPLDeviceClassIsOneOf:", 302024, 302027, 302025, 302028, 0));
  v147[25] = v125;
  v146[26] = @"DCP0,scanout";
  uint64_t v124 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F92A38], "kPLDeviceClassIsOneOf:", 302024, 302027, 302025, 302028, 0));
  v147[26] = v124;
  v146[27] = @"DCP,swap";
  v123 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F92A38], "hasDCP"));
  v147[27] = v123;
  v146[28] = @"DCP,scanout";
  uint64_t v122 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F92A38], "hasDCP"));
  v147[28] = v122;
  v146[29] = @"DCPEXT0,swap";
  uint64_t v18 = NSNumber;
  if ([MEMORY[0x1E4F92A38] hasDCP]) {
    BOOL v19 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v19 = 0;
  }
  long long v121 = [v18 numberWithInt:v19];
  v147[29] = v121;
  v146[30] = @"DCPEXT0,scanout";
  uint64_t v20 = NSNumber;
  if ([MEMORY[0x1E4F92A38] hasDCP]) {
    BOOL v21 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v21 = 0;
  }
  uint64_t v120 = [v20 numberWithInt:v21];
  v147[30] = v120;
  v146[31] = @"DCPEXT1,swap";
  uint64_t v22 = NSNumber;
  if ([MEMORY[0x1E4F92A38] hasDCP]) {
    BOOL v23 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v23 = 0;
  }
  long long v119 = [v22 numberWithInt:v23];
  v147[31] = v119;
  v146[32] = @"DCPEXT1,scanout";
  uint64_t v24 = NSNumber;
  if ([MEMORY[0x1E4F92A38] hasDCP]) {
    BOOL v25 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v25 = 0;
  }
  uint64_t v118 = [v24 numberWithInt:v25];
  v147[32] = v118;
  v146[33] = @"DCPEXT2,swap";
  uint64_t v26 = NSNumber;
  if ([MEMORY[0x1E4F92A38] hasDCP]) {
    BOOL v27 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v27 = 0;
  }
  v117 = [v26 numberWithInt:v27];
  v147[33] = v117;
  v146[34] = @"DCPEXT2,scanout";
  int v28 = NSNumber;
  if ([MEMORY[0x1E4F92A38] hasDCP]) {
    BOOL v29 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v29 = 0;
  }
  uint64_t v116 = [v28 numberWithInt:v29];
  v147[34] = v116;
  v146[35] = @"DCPEXT3,swap";
  uint64_t v30 = NSNumber;
  if ([MEMORY[0x1E4F92A38] hasDCP]) {
    BOOL v31 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v31 = 0;
  }
  long long v115 = [v30 numberWithInt:v31];
  v147[35] = v115;
  v146[36] = @"DCPEXT3,scanout";
  uint64_t v32 = NSNumber;
  if ([MEMORY[0x1E4F92A38] hasDCP]) {
    BOOL v33 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v33 = 0;
  }
  long long v114 = [v32 numberWithInt:v33];
  v147[36] = v114;
  v146[37] = @"PRLUsage,PreCheck";
  if (a3[4].var1) {
    BOOL v34 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v34 = 0;
  }
  long long v113 = [NSNumber numberWithInt:v34];
  v147[37] = v113;
  v146[38] = @"PRLUsage,BCheck";
  if (a3[4].var1) {
    BOOL v35 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v35 = 0;
  }
  long long v112 = [NSNumber numberWithInt:v35];
  v147[38] = v112;
  v146[39] = @"PRLUsage,ProCheck";
  if (a3[4].var1) {
    BOOL v36 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v36 = 0;
  }
  long long v111 = [NSNumber numberWithInt:v36];
  v147[39] = v111;
  v146[40] = @"PRLUsage,AttCheck";
  if (a3[4].var1) {
    BOOL v37 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v37 = 0;
  }
  long long v110 = [NSNumber numberWithInt:v37];
  v147[40] = v110;
  v146[41] = @"PRLUsage,JOn";
  if (a3[4].var1) {
    BOOL v38 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v38 = 0;
  }
  long long v109 = [NSNumber numberWithInt:v38];
  v147[41] = v109;
  v146[42] = @"PRLUsage,RStandby";
  if (a3[4].var1) {
    BOOL v39 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v39 = 0;
  }
  id v108 = [NSNumber numberWithInt:v39];
  v147[42] = v108;
  v146[43] = @"PPM Stats,CPMS Lanes engagement";
  v107 = [NSNumber numberWithBool:a3[3].var1];
  v147[43] = v107;
  v146[44] = @"PPM Stats,CPMS Ferocity";
  uint64_t v106 = [NSNumber numberWithBool:a3[3].var1];
  v147[44] = v106;
  v146[45] = @"PPM Stats,CPMS Power Reduction";
  v105 = [NSNumber numberWithBool:a3[3].var1];
  v147[45] = v105;
  v146[46] = @"PPM Stats,Policy CPMS";
  uint64_t v104 = [NSNumber numberWithBool:a3[3].var1];
  v147[46] = v104;
  v146[47] = @"PPM Stats,Peak Power Pressure";
  uint64_t v103 = [NSNumber numberWithBool:a3[3].var1];
  v147[47] = v103;
  v146[48] = @"AOP,cma: received";
  BOOL v40 = a3[1].var2 || a3[2].var0;
  id v102 = [NSNumber numberWithInt:v40];
  v147[48] = v102;
  v146[49] = @"AOP,gyro: received";
  BOOL v41 = a3[1].var2 || a3[2].var0;
  v101 = [NSNumber numberWithInt:v41];
  v147[49] = v101;
  v146[50] = @"AOP,las: received";
  BOOL v42 = a3[1].var2 || a3[2].var0;
  v100 = [NSNumber numberWithInt:v42];
  v147[50] = v100;
  v146[51] = @"MTP,Power";
  BOOL v43 = a3[1].var2 || a3[2].var0;
  v99 = [NSNumber numberWithInt:v43];
  v147[51] = v99;
  v146[52] = @"MTP,IOP State";
  BOOL v44 = a3[1].var2 || a3[2].var0;
  int v98 = [NSNumber numberWithInt:v44];
  v147[52] = v98;
  v146[53] = @"PMP,DCS";
  BOOL v45 = a3[1].var2 || a3[2].var0;
  id v97 = [NSNumber numberWithInt:v45];
  v147[53] = v97;
  v146[54] = @"PMP,SOC";
  BOOL v46 = a3[1].var2 || a3[2].var0;
  v96 = [NSNumber numberWithInt:v46];
  v147[54] = v96;
  v146[55] = @"SIO,Power";
  BOOL v47 = a3[1].var2 || a3[2].var0;
  id v95 = [NSNumber numberWithInt:v47];
  v147[55] = v95;
  v146[56] = @"SIO,IOP State";
  BOOL v48 = a3[1].var2 || a3[2].var0;
  uint64_t v94 = [NSNumber numberWithInt:v48];
  v147[56] = v94;
  v146[57] = @"PMP,PMC SOC Floor";
  BOOL v49 = a3[1].var2 || a3[2].var0;
  v93 = [NSNumber numberWithInt:v49];
  v147[57] = v93;
  v146[58] = @"PMP,PMC DCS Floor";
  BOOL v50 = a3[1].var2 || a3[2].var0;
  v92 = [NSNumber numberWithInt:v50];
  v147[58] = v92;
  v146[59] = @"Energy Model";
  uint64_t v91 = [NSNumber numberWithBool:a3[2].var2];
  v147[59] = v91;
  v146[60] = @"IOMFB Reporting,Total native/custom refresh rate";
  id v90 = [NSNumber numberWithBool:a3[2].var2];
  v147[60] = v90;
  v146[61] = @"IOMFB Reporting,VBIs between user swaps";
  v89 = [NSNumber numberWithBool:a3[2].var2];
  v147[61] = v89;
  v146[62] = @"IOMFB Reporting,Subframes per swap request";
  uint64_t v88 = [NSNumber numberWithBool:a3[2].var2];
  v147[62] = v88;
  v146[63] = @"IOMFB Reporting,Subframes per scanout";
  v87 = [NSNumber numberWithBool:a3[2].var2];
  v147[63] = v87;
  v146[64] = @"Core Performance Level";
  uint64_t v86 = [NSNumber numberWithBool:a3[2].var2];
  v147[64] = v86;
  v146[65] = @"PMP,Energy Counters";
  v85 = [NSNumber numberWithBool:a3[2].var2];
  v147[65] = v85;
  v146[66] = @"PMP,Perf Drivers";
  v147[66] = &unk_1F29E5668;
  v146[67] = @"GPU Stats,Idle Time Histogram";
  if (a3[2].var2) {
    BOOL v51 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v51 = 0;
  }
  uint64_t v84 = [NSNumber numberWithInt:v51];
  v147[67] = v84;
  v146[68] = @"GPU Stats,Active Time Histogram";
  if (a3[2].var2) {
    BOOL v52 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v52 = 0;
  }
  int v83 = [NSNumber numberWithInt:v52];
  v147[68] = v83;
  v146[69] = @"GPU Stats,GPU Performance States";
  if (a3[2].var2) {
    BOOL v53 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v53 = 0;
  }
  char v82 = [NSNumber numberWithInt:v53];
  v147[69] = v82;
  v146[70] = @"H11ANE,H11ANE Power State";
  if (a3[1].var1 || a3->var0 || a3[1].var0) {
    BOOL v54 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v54 = 0;
  }
  char v81 = [NSNumber numberWithInt:v54];
  v147[70] = v81;
  v146[71] = @"H11ANE,H11ANE Events";
  if (a3->var0 || a3[1].var0) {
    BOOL v55 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v55 = 0;
  }
  v80 = [NSNumber numberWithInt:v55];
  v147[71] = v80;
  v146[72] = @"GPU Stats,CLTM-induced GPU Performance States";
  if (a3[2].var2) {
    BOOL v56 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v56 = 0;
  }
  uint64_t v57 = [NSNumber numberWithInt:v56];
  v147[72] = v57;
  v146[73] = @"GPU Stats,DVD Request States";
  if (a3[2].var2) {
    BOOL v58 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v58 = 0;
  }
  uint64_t v59 = [NSNumber numberWithInt:v58];
  v147[73] = v59;
  v146[74] = @"CPU Stats,CPU Events";
  if (a3[2].var2) {
    BOOL v60 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v60 = 0;
  }
  uint64_t v61 = [NSNumber numberWithInt:v60];
  v147[74] = v61;
  v146[75] = @"SoC Stats,Voltage Domain Performance States";
  if (a3[2].var2) {
    BOOL v62 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v62 = 0;
  }
  uint64_t v63 = [NSNumber numberWithInt:v62];
  v147[75] = v63;
  v146[76] = @"SoC Stats,Device States";
  if (a3[2].var2) {
    BOOL v64 = a3[1].var2 || a3[2].var0 || a3[5].var0;
  }
  else {
    BOOL v64 = 0;
  }
  uint64_t v65 = [NSNumber numberWithInt:v64];
  v147[76] = v65;
  v146[77] = @"AMC Stats,Perf Counters";
  BOOL v66 = (a3->var0 && a3[1].var2 || a3[2].var2 && a3[2].var0) && a3[5].var2;
  uint64_t v67 = [NSNumber numberWithInt:v66];
  v147[77] = v67;
  v146[78] = @"SoC Stats,Events";
  BOOL v68 = a3[2].var2 && (a3[1].var2 || a3[2].var0) && a3[6].var0;
  uint64_t v69 = [NSNumber numberWithInt:v68];
  v147[78] = v69;
  v146[79] = @"AppleEmbeddedPCIE,Link States";
  if (a3[2].var2) {
    BOOL v70 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v70 = 0;
  }
  uint64_t v71 = [NSNumber numberWithInt:v70];
  v147[79] = v71;
  v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v147 forKeys:v146 count:80];

  uint64_t v73 = objc_opt_new();
  v144[0] = MEMORY[0x1E4F143A8];
  v144[1] = 3221225472;
  v144[2] = __32__PLIOReportAgent_buildBaseSet___block_invoke;
  v144[3] = &unk_1E692CC20;
  id v74 = v73;
  id v145 = v74;
  [v72 enumerateKeysAndObjectsUsingBlock:v144];
  if (+[PLIOReportAgent shouldLogAtAppSwitchTrigger])
  {
    uint64_t v75 = [(PLIOReportAgent *)self buildScreenStateSet:a3];
    [v74 minusSet:v75];
  }
  if ([v74 count]) {
    v76 = v74;
  }
  else {
    v76 = 0;
  }
  id v77 = v76;

  return v77;
}

void __32__PLIOReportAgent_buildBaseSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 BOOLValue])
  {
    [*(id *)(a1 + 32) addObject:v5];
    BOOL v6 = PLLogIOReport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEFAULT, "Base set has following subscription %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)buildHalfHourSet:(IOReportGroupChecks *)a3
{
  v50[18] = *MEMORY[0x1E4F143B8];
  v49[0] = @"AOP,MConnectorPower";
  if (a3->var1) {
    BOOL v4 = a3[1].var2 || a3[2].var0;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v46 = [NSNumber numberWithInt:v4];
  v50[0] = v46;
  v49[1] = @"Mesa,Mesa Power State";
  BOOL v5 = a3[2].var2 && a3[2].var0;
  BOOL v45 = [NSNumber numberWithInt:v5];
  v50[1] = v45;
  v49[2] = @"H6ISP,H6ISP Power State";
  BOOL v6 = a3[2].var2 && a3[2].var0;
  BOOL v44 = [NSNumber numberWithInt:v6];
  v50[2] = v44;
  v49[3] = @"SoC Stats,H6 PMGR Counters";
  BOOL v7 = a3[2].var2 && a3[2].var0;
  BOOL v43 = [NSNumber numberWithInt:v7];
  v50[3] = v43;
  v49[4] = @"backlight report,playback backlight factors report";
  BOOL v8 = a3[2].var2 && a3[2].var0;
  BOOL v42 = [NSNumber numberWithInt:v8];
  v50[4] = v42;
  v49[5] = @"CPU Stats,Voltage Domain Performance States";
  BOOL v9 = a3[2].var2 && a3[2].var0;
  BOOL v41 = [NSNumber numberWithInt:v9];
  v50[5] = v41;
  v49[6] = @"Wifi Chip Connection Activity";
  BOOL v10 = a3[2].var2 && a3[2].var0;
  BOOL v40 = [NSNumber numberWithInt:v10];
  v50[6] = v40;
  v49[7] = @"Wifi Chip AWDL Activity";
  BOOL v11 = a3[2].var2 && a3[2].var0;
  BOOL v39 = [NSNumber numberWithInt:v11];
  v50[7] = v39;
  v49[8] = @"Wifi Chip PM Awake Activity";
  BOOL v12 = a3[2].var2 && a3[2].var0;
  uint64_t v37 = [NSNumber numberWithInt:v12];
  v50[8] = v37;
  v49[9] = @"Wifi Chip Radio Phyical Layer Activity";
  BOOL v13 = a3[2].var2 && a3[2].var0;
  BOOL v14 = objc_msgSend(NSNumber, "numberWithInt:", v13, v37);
  v50[9] = v14;
  v49[10] = @"Wifi Chip PCIe Activity";
  BOOL v15 = a3[2].var2 && a3[2].var0;
  BOOL v16 = [NSNumber numberWithInt:v15];
  v50[10] = v16;
  v49[11] = @"Wifi Chip Tx Stat Counters";
  BOOL v17 = a3[2].var2 && a3[2].var0;
  uint64_t v18 = [NSNumber numberWithInt:v17];
  v50[11] = v18;
  v49[12] = @"Wifi Chip Scan Activity";
  BOOL v19 = a3[2].var2 && a3[2].var0;
  uint64_t v20 = [NSNumber numberWithInt:v19];
  v50[12] = v20;
  v49[13] = @"Wifi Chip HSIC Activity";
  BOOL v21 = a3[2].var2 && a3[2].var0;
  uint64_t v22 = [NSNumber numberWithInt:v21];
  v50[13] = v22;
  v49[14] = @"Wifi Chip Rx Chip Error Counters";
  BOOL v23 = a3[2].var2 && a3[2].var0;
  uint64_t v24 = [NSNumber numberWithInt:v23];
  v50[14] = v24;
  v49[15] = @"Wifi Chip Rx Per Rate Counters";
  BOOL v25 = a3[2].var2 && a3[2].var0;
  uint64_t v26 = [NSNumber numberWithInt:v25];
  v50[15] = v26;
  v49[16] = @"Wifi Chip Tx Chip Error Counters";
  BOOL v27 = a3[2].var2 && a3[2].var0;
  int v28 = [NSNumber numberWithInt:v27];
  v50[16] = v28;
  v49[17] = @"Wifi Chip Rx Stat Counters";
  BOOL v29 = a3[2].var2 && a3[2].var0;
  uint64_t v30 = [NSNumber numberWithInt:v29];
  v50[17] = v30;
  BOOL v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:18];

  uint64_t v32 = objc_opt_new();
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __36__PLIOReportAgent_buildHalfHourSet___block_invoke;
  v47[3] = &unk_1E692CC20;
  id v48 = v32;
  id v33 = v32;
  [v31 enumerateKeysAndObjectsUsingBlock:v47];
  if ([v33 count]) {
    BOOL v34 = v33;
  }
  else {
    BOOL v34 = 0;
  }
  id v35 = v34;

  return v35;
}

void __36__PLIOReportAgent_buildHalfHourSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 BOOLValue])
  {
    [*(id *)(a1 + 32) addObject:v5];
    BOOL v6 = PLLogIOReport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEFAULT, "Half set has following subscription %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)buildDailySet:(IOReportGroupChecks *)a3
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = @"CPU Stats,DVD Stats";
  BOOL v4 = a3[2].var2 && a3[2].var0;
  id v5 = [NSNumber numberWithInt:v4];
  v19[1] = @"CPU Stats,Active Time Histogram";
  v20[0] = v5;
  BOOL v6 = a3[2].var2 && a3[2].var0;
  int v7 = [NSNumber numberWithInt:v6];
  v20[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  uint64_t v9 = objc_opt_new();
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  BOOL v16 = __33__PLIOReportAgent_buildDailySet___block_invoke;
  BOOL v17 = &unk_1E692CC20;
  id v18 = v9;
  id v10 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:&v14];
  if (objc_msgSend(v10, "count", v14, v15, v16, v17)) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = 0;
  }
  id v12 = v11;

  return v12;
}

void __33__PLIOReportAgent_buildDailySet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 BOOLValue])
  {
    [*(id *)(a1 + 32) addObject:v5];
    BOOL v6 = PLLogIOReport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEFAULT, "Daily set has following subscription %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)buildAudioEventSet:(IOReportGroupChecks *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = @"Speaker,SpeakerEvents";
  objc_super v3 = [NSNumber numberWithBool:a3[3].var2];
  v16[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  id v5 = objc_opt_new();
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __38__PLIOReportAgent_buildAudioEventSet___block_invoke;
  BOOL v13 = &unk_1E692CC20;
  id v14 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v10];
  if (objc_msgSend(v6, "count", v10, v11, v12, v13)) {
    int v7 = v6;
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;

  return v8;
}

void __38__PLIOReportAgent_buildAudioEventSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 BOOLValue]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (id)buildScreenStateSet:(IOReportGroupChecks *)a3
{
  v58[27] = *MEMORY[0x1E4F143B8];
  v57[0] = @"IOMFB Reporting,Subframes per swap request";
  BOOL v54 = [NSNumber numberWithBool:a3[3].var0];
  v58[0] = v54;
  v57[1] = @"IOMFB Reporting,Subframes per scanout";
  BOOL v53 = [NSNumber numberWithBool:a3[3].var0];
  v58[1] = v53;
  void v57[2] = @"Energy Model";
  BOOL v4 = a3[2].var2 && a3[3].var0;
  BOOL v52 = [NSNumber numberWithInt:v4];
  void v58[2] = v52;
  v57[3] = @"PMP,Energy Counters";
  BOOL v51 = [NSNumber numberWithBool:a3[3].var0];
  v58[3] = v51;
  void v57[4] = @"IOMFB Reporting,frame rate phase";
  BOOL v50 = [NSNumber numberWithBool:a3[3].var0];
  void v58[4] = v50;
  v57[5] = @"SoC Stats,Device States";
  BOOL v5 = a3[5].var0 && a3[3].var0;
  BOOL v49 = [NSNumber numberWithInt:v5];
  v58[5] = v49;
  v57[6] = @"CPU Stats,CPU Complex Voltage State Time";
  id v48 = [NSNumber numberWithBool:a3[3].var0];
  v58[6] = v48;
  v57[7] = @"PMP,DRAM BW";
  BOOL v47 = [NSNumber numberWithBool:a3[3].var0];
  v58[7] = v47;
  v57[8] = @"PMP,DRAM State";
  BOOL v46 = [NSNumber numberWithBool:a3[3].var0];
  v58[8] = v46;
  v57[9] = @"PMP,Fabric BW";
  BOOL v45 = [NSNumber numberWithBool:a3[3].var0];
  v58[9] = v45;
  v57[10] = @"ANS2,PCIE0";
  BOOL v44 = [NSNumber numberWithBool:a3[3].var0];
  v58[10] = v44;
  v57[11] = @"CPU Stats,CPU Complex Performance States";
  BOOL v6 = a3[2].var2 && a3[3].var0;
  BOOL v43 = [NSNumber numberWithInt:v6];
  v58[11] = v43;
  v57[12] = @"CPU Stats,CPU Core Performance States";
  BOOL v7 = a3[2].var2 && a3[3].var0;
  BOOL v42 = [NSNumber numberWithInt:v7];
  v58[12] = v42;
  v57[13] = @"AMC Stats,Perf Counters";
  BOOL v8 = a3[3].var0 && a3[5].var2;
  BOOL v41 = [NSNumber numberWithInt:v8];
  v58[13] = v41;
  v57[14] = @"GPU Stats,GPU Performance States";
  BOOL v40 = [NSNumber numberWithBool:a3[3].var0];
  v58[14] = v40;
  v57[15] = @"PMP,DCS";
  BOOL v39 = [NSNumber numberWithBool:a3[3].var0];
  v58[15] = v39;
  v57[16] = @"PMP,PMC SOC Floor";
  BOOL v38 = [NSNumber numberWithBool:a3[3].var0];
  v58[16] = v38;
  v57[17] = @"PMP,PMC DCS Floor";
  uint64_t v37 = [NSNumber numberWithBool:a3[3].var0];
  v58[17] = v37;
  v57[18] = @"DCP,swap";
  uint64_t v9 = NSNumber;
  if (a3[3].var0) {
    uint64_t v10 = [MEMORY[0x1E4F92A38] hasDCP];
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [v9 numberWithInt:v10];
  v58[18] = v11;
  v57[19] = @"DCP,scanout";
  id v12 = NSNumber;
  if (a3[3].var0) {
    uint64_t v13 = [MEMORY[0x1E4F92A38] hasDCP];
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = [v12 numberWithInt:v13];
  v58[19] = v14;
  v57[20] = @"DCP0,swap";
  uint64_t v15 = NSNumber;
  if (a3[3].var0) {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F92A38], "kPLDeviceClassIsOneOf:", 302024, 302027, 302025, 302028, 0);
  }
  else {
    uint64_t v16 = 0;
  }
  BOOL v17 = [v15 numberWithInt:v16];
  v58[20] = v17;
  v57[21] = @"DCP0,scanout";
  id v18 = NSNumber;
  if (a3[3].var0) {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F92A38], "kPLDeviceClassIsOneOf:", 302024, 302027, 302025, 302028, 0);
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = [v18 numberWithInt:v19];
  v58[21] = v20;
  v57[22] = @"DCP,scanout stats";
  BOOL v21 = NSNumber;
  BOOL v22 = a3[3].var0
     && +[PLIOReportAgent shouldLogDCPScanoutStats];
  BOOL v23 = [v21 numberWithInt:v22];
  v58[22] = v23;
  v57[23] = @"CPU Stats,CPU Complex Thermal/UPO Limiting";
  uint64_t v24 = [NSNumber numberWithBool:a3[4].var0];
  v58[23] = v24;
  void v57[24] = @"SoC Stats,Events";
  BOOL v25 = a3[2].var2 && a3[3].var0 && a3[6].var0;
  uint64_t v26 = [NSNumber numberWithInt:v25];
  v58[24] = v26;
  v57[25] = @"AppleEmbeddedPCIE,Link States";
  BOOL v27 = a3[2].var2 && a3[3].var0;
  int v28 = [NSNumber numberWithInt:v27];
  v58[25] = v28;
  v57[26] = @"Core Performance Level";
  BOOL v29 = a3[2].var2 && a3[3].var0;
  uint64_t v30 = [NSNumber numberWithInt:v29];
  v58[26] = v30;
  BOOL v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:27];

  uint64_t v32 = objc_opt_new();
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __39__PLIOReportAgent_buildScreenStateSet___block_invoke;
  void v55[3] = &unk_1E692CC20;
  id v56 = v32;
  id v33 = v32;
  [v31 enumerateKeysAndObjectsUsingBlock:v55];
  if ([v33 count]) {
    BOOL v34 = v33;
  }
  else {
    BOOL v34 = 0;
  }
  id v35 = v34;

  return v35;
}

void __39__PLIOReportAgent_buildScreenStateSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 BOOLValue])
  {
    [*(id *)(a1 + 32) addObject:v5];
    BOOL v6 = PLLogIOReport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEFAULT, "ScreenState set has following subscription %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)buildDisplayStateChangeSet:(IOReportGroupChecks *)a3
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    v19[0] = @"AOP,Prox";
    BOOL v4 = a3[1].var2 || a3[2].var0;
    BOOL v6 = [NSNumber numberWithInt:v4];
    v19[1] = @"Multitouch,Multitouch high level stats";
    v20[0] = v6;
    BOOL v7 = a3[1].var2 || a3[2].var0;
    id v8 = [NSNumber numberWithInt:v7];
    v20[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

    uint64_t v10 = objc_opt_new();
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __46__PLIOReportAgent_buildDisplayStateChangeSet___block_invoke;
    BOOL v17 = &unk_1E692CC20;
    id v18 = v10;
    id v11 = v10;
    [v9 enumerateKeysAndObjectsUsingBlock:&v14];
    if (objc_msgSend(v11, "count", v14, v15, v16, v17)) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v5 = v12;
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void __46__PLIOReportAgent_buildDisplayStateChangeSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 BOOLValue])
  {
    [*(id *)(a1 + 32) addObject:v5];
    BOOL v6 = PLLogIOReport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEFAULT, "Display TriState set has following subscription %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)buildWakeSet:(IOReportGroupChecks *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = @"SoC Stats,Events";
  objc_super v3 = [NSNumber numberWithBool:a3[4].var2];
  v16[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  id v5 = objc_opt_new();
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __32__PLIOReportAgent_buildWakeSet___block_invoke;
  uint64_t v13 = &unk_1E692CC20;
  id v14 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v10];
  if (objc_msgSend(v6, "count", v10, v11, v12, v13)) {
    int v7 = v6;
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;

  return v8;
}

void __32__PLIOReportAgent_buildWakeSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 BOOLValue]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (id)buildSnapshotSet:(IOReportGroupChecks *)a3
{
  void v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"AOP,HSCDTD602A_Cmps";
  v17[1] = @"AOP,HSCDTD602A_Jarv";
  v18[0] = MEMORY[0x1E4F1CC38];
  v18[1] = MEMORY[0x1E4F1CC38];
  void v18[2] = MEMORY[0x1E4F1CC38];
  void v17[2] = @"SoC Stats,Events";
  void v17[3] = @"SoC Stats,oprtp";
  objc_super v3 = NSNumber;
  if (a3->var0 || a3[1].var1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [MEMORY[0x1E4F92A38] isARMMac];
  }
  id v5 = [v3 numberWithInt:v4];
  void v18[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  int v7 = objc_opt_new();
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __36__PLIOReportAgent_buildSnapshotSet___block_invoke;
  uint64_t v15 = &unk_1E692CC20;
  id v16 = v7;
  id v8 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:&v12];
  if (objc_msgSend(v8, "count", v12, v13, v14, v15)) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  return v10;
}

void __36__PLIOReportAgent_buildSnapshotSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 BOOLValue])
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v6 = PLLogIOReport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEFAULT, "Snapshot set has following subscription %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

+ (BOOL)shouldLogAtAppSwitchTrigger
{
  if (qword_1EBD58448 != -1) {
    dispatch_once(&qword_1EBD58448, &__block_literal_global_8638);
  }
  return byte_1EBD583D9;
}

void __46__PLIOReportAgent_shouldLogAtAppSwitchTrigger__block_invoke()
{
  byte_1EBD583D9 = [MEMORY[0x1E4F929C0] BOOLForKey:@"enable_AppSwitchTrigger" ifNotSet:0];
  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    v0 = (void *)MEMORY[0x1E4F929E0];
    id v1 = [MEMORY[0x1E4F929C8] className];
    byte_1EBD583D9 = [v0 isEntryKeySetup:@"PLEnhancedTaskingAgent_EventNone_AppSwitchTrigger" forOperatorName:v1];
  }
}

+ (BOOL)shouldLogAmcStatsPerfCounters
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PLIOReportAgent_shouldLogAmcStatsPerfCounters__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (qword_1EBD58450 != -1) {
    dispatch_once(&qword_1EBD58450, block);
  }
  return byte_1EBD583DA;
}

void __48__PLIOReportAgent_shouldLogAmcStatsPerfCounters__block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F929E0];
    id v3 = [*(id *)(a1 + 32) className];
    byte_1EBD583DA = [v2 isEntryKeySetup:@"PLIOReportAgent_EventBackward_AMCStatsPerfCounters" forOperatorName:v3];
  }
}

+ (BOOL)shouldLogSocStatsEvents
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PLIOReportAgent_shouldLogSocStatsEvents__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (qword_1EBD58458 != -1) {
    dispatch_once(&qword_1EBD58458, block);
  }
  return byte_1EBD583DB;
}

void __42__PLIOReportAgent_shouldLogSocStatsEvents__block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F929E0];
    id v3 = [*(id *)(a1 + 32) className];
    byte_1EBD583DB = [v2 isEntryKeySetup:@"PLIOReportAgent_EventBackward_SoCStatsEvents" forOperatorName:v3];
  }
}

+ (BOOL)shouldLogSocStatsPmgrCounters
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PLIOReportAgent_shouldLogSocStatsPmgrCounters__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (qword_1EBD58460 != -1) {
    dispatch_once(&qword_1EBD58460, block);
  }
  return byte_1EBD583DC;
}

void __48__PLIOReportAgent_shouldLogSocStatsPmgrCounters__block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F929E0];
    id v3 = [*(id *)(a1 + 32) className];
    byte_1EBD583DC = [v2 isEntryKeySetup:@"PLIOReportAgent_EventBackward_SoCStatsPMGRCountersID" forOperatorName:v3];
  }
}

uint64_t __54__PLIOReportAgent_processNotificationForChannelGroup___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  byte_1EBD583DD = result;
  return result;
}

uint64_t __54__PLIOReportAgent_processNotificationForChannelGroup___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD583DE = result;
  return result;
}

- (void)initOperatorDependancies
{
  if (+[PLIOReportAgent shouldLogMemCacheStats])
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sampledBundleIDs = self->_sampledBundleIDs;
    self->_sampledBundleIDs = v3;

    self->_collectionEnabled = 0;
    lastSampleDate = self->_lastSampleDate;
    self->_lastSampleDate = 0;
  }
  if (+[PLIOReportAgent shouldLogMTRAging])
  {
    id v6 = (PLIOKitOperatorComposition *)[objc_alloc(MEMORY[0x1E4F92A00]) initWithOperator:self forService:@"ApplePMGR"];
    iokitAging = self->_iokitAging;
    self->_iokitAging = v6;
  }
  [(PLIOReportAgent *)self subscribeToChannelSets];
  [(PLIOReportAgent *)self sampleDeltaForChannelSets];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  void v41[2] = __43__PLIOReportAgent_initOperatorDependancies__block_invoke;
  void v41[3] = &unk_1E692A0F0;
  v41[4] = self;
  id v8 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v41];
  [(PLIOReportAgent *)self setBatteryLevelChangedNotifications:v8];

  if (+[PLIOReportAgent shouldLogAudioEvent])
  {
    id v9 = objc_alloc(MEMORY[0x1E4F92A00]);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8678;
    void v40[3] = &unk_1E692CC48;
    v40[4] = self;
    id v10 = (PLIOKitOperatorComposition *)[v9 initWithOperator:self forService:@"AppleEmbeddedAudio" withBlock:v40];
    iokitAudio = self->_iokitAudio;
    self->_iokitAudio = v10;
  }
  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F92A28]);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8687;
    void v39[3] = &unk_1E692A0F0;
    void v39[4] = self;
    uint64_t v13 = (PLNSNotificationOperatorComposition *)[v12 initWithOperator:self forNotification:@"com.apple.powerlog.EnhancedScreenState" withBlock:v39];
    enhancedScreenStateChangeListener = self->_enhancedScreenStateChangeListener;
    self->_enhancedScreenStateChangeListener = v13;
  }
  uint64_t v15 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ScreenState"];
  id v16 = objc_alloc(MEMORY[0x1E4F929E8]);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  void v38[2] = __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8689;
  v38[3] = &unk_1E692A0F0;
  v38[4] = self;
  BOOL v17 = (void *)[v16 initWithOperator:self forEntryKey:v15 withBlock:v38];
  [(PLIOReportAgent *)self setScreenstateChangedNotifications:v17];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __43__PLIOReportAgent_initOperatorDependancies__block_invoke_2_8690;
  v37[3] = &unk_1E692A0F0;
  void v37[4] = self;
  id v18 = [MEMORY[0x1E4F929E8] displayOffNotificationWithOperator:self withBlock:v37];
  [(PLIOReportAgent *)self setDisplayOffNotification:v18];

  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    uint64_t v19 = [MEMORY[0x1E4F92A50] sharedInstance];
    [(PLIOReportAgent *)self setStateTracker:v19];

    uint64_t v20 = [(PLIOReportAgent *)self stateTracker];
    [v20 registerForStates:8 withOperator:self withBlock:&__block_literal_global_8693];

    if ([MEMORY[0x1E4F92A38] hasAOD])
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      void v36[2] = __43__PLIOReportAgent_initOperatorDependancies__block_invoke_4;
      v36[3] = &unk_1E692A0F0;
      void v36[4] = self;
      uint64_t v21 = [MEMORY[0x1E4F929E8] displayOffOrAODNotificationWithOperator:self withBlock:v36];
    }
    else
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      void v35[2] = __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8694;
      void v35[3] = &unk_1E692A0F0;
      void v35[4] = self;
      uint64_t v21 = [MEMORY[0x1E4F929E8] displayOffNotificationWithOperator:self withBlock:v35];
    }
    BOOL v22 = (void *)v21;
    [(PLIOReportAgent *)self setDisplayOffNotification:v21];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    void v34[2] = __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8695;
    void v34[3] = &unk_1E692A0F0;
    void v34[4] = self;
    BOOL v23 = [MEMORY[0x1E4F929E8] displayOnNotificationWithOperator:self withBlock:v34];
    [(PLIOReportAgent *)self setDisplayOnNotification:v23];
  }
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    void v33[2] = __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8696;
    void v33[3] = &unk_1E692A0F0;
    void v33[4] = self;
    uint64_t v24 = [MEMORY[0x1E4F929E8] displayStateChangeNotificationWithOperator:self withBlock:v33];
    [(PLIOReportAgent *)self setDisplayStateChangeNotification:v24];
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  void v32[2] = __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8697;
  void v32[3] = &unk_1E692A0F0;
  void v32[4] = self;
  BOOL v25 = [MEMORY[0x1E4F929E8] wakeEntryNotificationWithOperator:self withBlock:v32];
  [(PLIOReportAgent *)self setWakeNotification:v25];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  void v31[2] = __43__PLIOReportAgent_initOperatorDependancies__block_invoke_2_8698;
  void v31[3] = &unk_1E692A0F0;
  void v31[4] = self;
  uint64_t v26 = [MEMORY[0x1E4F929E8] canSleepEntryNotificationWithOperator:self withBlock:v31];
  [(PLIOReportAgent *)self setSleepNotification:v26];

  id v27 = objc_alloc(MEMORY[0x1E4F92A28]);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  void v30[2] = __43__PLIOReportAgent_initOperatorDependancies__block_invoke_3_8702;
  v30[3] = &unk_1E692A0F0;
  void v30[4] = self;
  int v28 = (PLNSNotificationOperatorComposition *)[v27 initWithOperator:self forNotification:@"PLThermalMonitorNotification" withBlock:v30];
  thermalMonitorListener = self->_thermalMonitorListener;
  self->_thermalMonitorListener = v28;
}

uint64_t __43__PLIOReportAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) logEventBackwardIOReport];
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    uint64_t v2 = PLLogIOReport();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "Received SBC Notification, logging AOD tables", v4, 2u);
    }

    [*(id *)(a1 + 32) logEventBackwardIOReportAtDisplayStateChange];
  }
  [*(id *)(a1 + 32) logEventPointIOReport];
  return [*(id *)(a1 + 32) logEventBackwardPSRToCA];
}

void __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8678(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __43__PLIOReportAgent_initOperatorDependancies__block_invoke_2;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (qword_1EBD58478 != -1) {
      dispatch_once(&qword_1EBD58478, &block);
    }
    if (byte_1EBD583DF)
    {
      id v6 = [NSString stringWithFormat:@"Get message from %@\n", @"AppleEmbeddedAudio", block, v13, v14, v15, v16];
      int v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLIOReportAgent.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLIOReportAgent initOperatorDependancies]_block_invoke"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:8951];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (a3 == -469794554) {
    [*(id *)(a1 + 32) logEventBackwardIOReportAtAudioEvent];
  }
}

uint64_t __43__PLIOReportAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD583DF = result;
  return result;
}

void __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8687(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLLogIOReport();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Notification for ScreenState change: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardIOReportAtScreenStateChange:0];
}

uint64_t __43__PLIOReportAgent_initOperatorDependancies__block_invoke_2_8690(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) logEventBackwardIOReportAtScreenStateChange:0];
  }
  return result;
}

uint64_t __43__PLIOReportAgent_initOperatorDependancies__block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id v3 = PLLogIOReport();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "AOD case: Received Display OFF Notification", v4, 2u);
    }

    return [*(id *)(v2 + 32) startDisplayOffPeriodicTimer];
  }
  return result;
}

uint64_t __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8694(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id v3 = PLLogIOReport();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "Non-AOD case: Received Display OFF Notification", v4, 2u);
    }

    return [*(id *)(v2 + 32) startDisplayOffPeriodicTimer];
  }
  return result;
}

uint64_t __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8695(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id v3 = PLLogIOReport();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "Received Display ON Notification", v4, 2u);
    }

    return [*(id *)(v2 + 32) stopDisplayOffPeriodicTimer];
  }
  return result;
}

uint64_t __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8696(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id v3 = PLLogIOReport();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "Received Display State Change Notification, logging AOD tables", v4, 2u);
    }

    return [*(id *)(v2 + 32) logEventBackwardIOReportAtDisplayStateChange];
  }
  return result;
}

uint64_t __43__PLIOReportAgent_initOperatorDependancies__block_invoke_8697(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) logEventBackwardIOReportAtWake];
  }
  return result;
}

uint64_t __43__PLIOReportAgent_initOperatorDependancies__block_invoke_2_8698(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) logEventBackwardIOReportAtWake];
  }
  return result;
}

- (void)initTaskOperatorDependancies
{
  id v3 = [[PLIOReportAgentIOReportStats alloc] initWithAgent:self];
  SoCIOReportStats = self->_SoCIOReportStats;
  self->_SoCIOReportStats = v3;

  int v5 = [(PLIOReportAgent *)self SoCIOReportStats];

  if (v5)
  {
    if ([MEMORY[0x1E4F92A38] isiOS]
      && +[PLIOReportAgent shouldLogAtAppSwitchTrigger])
    {
      return;
    }
    if (+[PLIOReportAgent shouldLogSocStatsPmgrCounters])
    {
      id v6 = [(PLIOReportAgent *)self SoCIOReportStats];
      [v6 initTaskOperatorDependancies];
    }
  }
  [(PLIOReportAgent *)self logEventForwardSoCStatsOperatingPoints];
}

- (void)startDisplayOffPeriodicTimer
{
  if (!self->_displayOffTimer)
  {
    id v3 = (void *)MEMORY[0x1E4F92A18];
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    int v5 = [(PLOperator *)self workQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__PLIOReportAgent_startDisplayOffPeriodicTimer__block_invoke;
    void v10[3] = &unk_1E692B308;
    v10[4] = self;
    id v6 = [v3 scheduledTimerWithMonotonicFireDate:v4 withInterval:v5 withQueue:v10 withBlock:180.0];
    displayOffTimer = self->_displayOffTimer;
    self->_displayOffTimer = v6;

    id v8 = PLLogIOReport();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v9 = 0;
      _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Display OFF timer started", v9, 2u);
    }
  }
}

uint64_t __47__PLIOReportAgent_startDisplayOffPeriodicTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logDisplayOffAPWakeStats];
}

- (void)stopDisplayOffPeriodicTimer
{
  displayOffTimer = self->_displayOffTimer;
  if (displayOffTimer)
  {
    [(PLMonotonicTimer *)displayOffTimer cancel];
    uint64_t v4 = self->_displayOffTimer;
    self->_displayOffTimer = 0;

    int v5 = PLLogIOReport();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Display OFF timer stopped", v6, 2u);
    }
  }
}

- (void)logDisplayOffAPWakeStats
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    id v3 = [(PLStateTrackingComposition *)self->_stateTracker getCurrState:8];
    int v4 = [v3 BOOLValue];
    int v5 = PLLogIOReport();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "logDisplayOffAPWakeStats: AP ON is %d", (uint8_t *)v7, 8u);
    }

    if (v4)
    {
      id v6 = PLLogIOReport();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v7[0]) = 0;
        _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "Log table entries at display OFF + AP ON occurrence", (uint8_t *)v7, 2u);
      }

      [(PLIOReportAgent *)self logEventBackwardIOReportAtDisplayOffAPWake];
    }
  }
}

- (id)sampleSnapshotForChannelGroup:(id)a3
{
  id v3 = a3;
  int v4 = (void *)MEMORY[0x1D942A350]();
  int v5 = [v3 objectForKeyedSubscript:@"subscription"];

  uint64_t v6 = [v3 objectForKeyedSubscript:@"subscribedChannels"];
  uint64_t v7 = (void *)v6;
  Samples = 0;
  if (v3 && v5 && v6)
  {
    id v9 = [v3 objectForKey:@"cachedSample"];

    if (v9)
    {
      Samples = [v3 objectForKeyedSubscript:@"cachedSample"];
      if (!IOReportUpdateSamples())
      {
        [v3 removeObjectForKey:@"cachedSample"];
        goto LABEL_9;
      }
    }
    else
    {
      Samples = (void *)IOReportCreateSamples();
      if (!Samples) {
        goto LABEL_9;
      }
    }
    [v3 setObject:Samples forKeyedSubscript:@"cachedSample"];
  }
LABEL_9:

  return Samples;
}

void __81__PLIOReportAgent_entryForReportingGroup_withKey_withChannelGroup_withEntryDate___block_invoke()
{
  v0 = (void *)qword_1EBD58488;
  qword_1EBD58488 = (uint64_t)&unk_1F29ED8C8;
}

- (void)log
{
  [(PLIOReportAgent *)self logEventBackwardIOReport];
  [(PLIOReportAgent *)self logEventBackwardIOReportAtScreenStateChange:0];
  if (+[PLIOReportAgent shouldLogAudioEvent]) {
    [(PLIOReportAgent *)self logEventBackwardIOReportAtAudioEvent];
  }
  if (+[PLIOReportAgent shouldLogMTRAging]) {
    [(PLIOReportAgent *)self logEventBackwardMTRAging];
  }
  if (+[PLIOReportAgent shouldLogMemCacheStats]) {
    [(PLIOReportAgent *)self logEventForwardMemCacheLabels];
  }
  [(PLIOReportAgent *)self logEventPointIOReport];
  [(PLIOReportAgent *)self logEventForwardSoCStatsOperatingPoints];
}

- (BOOL)allowlistedChannelID:(unint64_t)a3
{
  if (qword_1EBD58498 != -1) {
    dispatch_once(&qword_1EBD58498, &__block_literal_global_8803);
  }
  int v4 = (void *)qword_1EBD58490;
  if (!qword_1EBD58490) {
    return 0;
  }
  int v5 = [NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v6 = [v4 objectForKey:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

void __40__PLIOReportAgent_allowlistedChannelID___block_invoke()
{
  v15[11] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] == 1001013)
  {
    v14[0] = &unk_1F29E5680;
    v14[1] = &unk_1F29E5698;
    v15[0] = @"ANE_SYS";
    v15[1] = @"APCIE";
    void v14[2] = &unk_1F29E56B0;
    void v14[3] = &unk_1F29E56C8;
    void v15[2] = @"AUDIO";
    void v15[3] = @"AVD_SYS";
    void v14[4] = &unk_1F29E56E0;
    v14[5] = &unk_1F29E56F8;
    void v15[4] = @"ISP-SOC-VNOM";
    v15[5] = @"PMGR-SOC-VMAX";
    v14[6] = &unk_1F29E5710;
    v14[7] = &unk_1F29E5728;
    v15[6] = @"PMGR-DCS-VMAX";
    v15[7] = @"VENC_SYS";
    v14[8] = &unk_1F29E5740;
    v14[9] = &unk_1F29E5758;
    v15[8] = @"VENC-SOC-VMAX";
    v15[9] = @"AVD-SOC-VNOM";
    v14[10] = &unk_1F29E5770;
    v15[10] = @"VENC-SOC-VNOM";
    v0 = (void *)MEMORY[0x1E4F1C9E8];
    id v1 = v15;
    uint64_t v2 = v14;
    uint64_t v3 = 11;
LABEL_8:
    uint64_t v4 = [v0 dictionaryWithObjects:v1 forKeys:v2 count:v3];
    int v5 = (void *)qword_1EBD58490;
    qword_1EBD58490 = v4;

    return;
  }
  if ([MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] == 1001014)
  {
    v12[0] = &unk_1F29E5788;
    v12[1] = &unk_1F29E57A0;
    v13[0] = @"ANE_SYS";
    v13[1] = @"APCIE";
    void v12[2] = &unk_1F29E57B8;
    void v12[3] = &unk_1F29E57D0;
    void v13[2] = @"AUDIO_P";
    void v13[3] = @"AVD_SYS";
    v12[4] = &unk_1F29E57E8;
    v12[5] = &unk_1F29E5800;
    v13[4] = @"ISP-SOC-VNOM";
    v13[5] = @"VENC_SYS";
    v12[6] = &unk_1F29E5818;
    v12[7] = &unk_1F29E5830;
    v13[6] = @"AVD-SOC-VNOM";
    v13[7] = @"C0_USBCTL";
    v0 = (void *)MEMORY[0x1E4F1C9E8];
    id v1 = v13;
    uint64_t v2 = v12;
LABEL_7:
    uint64_t v3 = 8;
    goto LABEL_8;
  }
  if ([MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] == 1001016)
  {
    v10[0] = &unk_1F29E5848;
    v10[1] = &unk_1F29E5860;
    v11[0] = @"ANE_SYS";
    v11[1] = @"APCIE";
    v10[2] = &unk_1F29E5878;
    void v10[3] = &unk_1F29E5800;
    void v11[2] = @"AUDIO_P";
    void v11[3] = @"AVD_SYS";
    v10[4] = &unk_1F29E5890;
    void v10[5] = &unk_1F29E58A8;
    v11[4] = @"ISP-SOC-VNOM";
    v11[5] = @"VENC_SYS";
    v10[6] = &unk_1F29E58C0;
    v10[7] = &unk_1F29E58D8;
    v11[6] = @"AVD-SOC-VNOM";
    v11[7] = @"C0_USBCTL";
    v0 = (void *)MEMORY[0x1E4F1C9E8];
    id v1 = v11;
    uint64_t v2 = v10;
    goto LABEL_7;
  }
  if ([MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] == 1001017)
  {
    v8[0] = &unk_1F29E58F0;
    v8[1] = &unk_1F29E5908;
    v9[0] = @"ANE-SYS-V";
    v9[1] = @"AVD-SYS-V";
    v8[2] = &unk_1F29E5920;
    void v8[3] = &unk_1F29E5938;
    v9[2] = @"AVD-SOC-VNOM";
    void v9[3] = @"AVD-SOC-VMAX";
    v8[4] = &unk_1F29E5950;
    v8[5] = &unk_1F29E5968;
    v9[4] = @"CLPC-SOC-VNOM";
    v9[5] = @"CLPC-SOC-VMAX";
    v8[6] = &unk_1F29E5980;
    v8[7] = &unk_1F29E5998;
    v9[6] = @"CLPC-DCS-VNOM";
    v9[7] = @"CLPC-DCS-VMAX";
    v8[8] = &unk_1F29E59B0;
    v8[9] = &unk_1F29E59C8;
    uint8_t v9[8] = @"SDEC-SOC-VNOM";
    v9[9] = @"SDEC-SOC-VMAX";
    v8[10] = &unk_1F29E59E0;
    v8[11] = &unk_1F29E59F8;
    v9[10] = @"DP-SOC-VMAX";
    v9[11] = @"DP0_VMAX-V";
    v8[12] = &unk_1F29E5A10;
    v8[13] = &unk_1F29E5A28;
    v9[12] = @"DP1_VMAX-V";
    v9[13] = @"ISP-SOC-VNOM";
    v8[14] = &unk_1F29E5A40;
    v8[15] = &unk_1F29E5A58;
    v9[14] = @"ISP-SOC-VMAX";
    v9[15] = @"JPG-SOC-VNOM";
    v8[16] = &unk_1F29E5A70;
    v8[17] = &unk_1F29E5A88;
    v9[16] = @"JPG-SOC-VMAX";
    v9[17] = @"PRORES_VNOM-V";
    v8[18] = &unk_1F29E5AA0;
    v8[19] = &unk_1F29E5AB8;
    v9[18] = @"PRORES_VMAX-V";
    v9[19] = @"SCDC_VNOM-V";
    v8[20] = &unk_1F29E5AD0;
    v8[21] = &unk_1F29E5AE8;
    v9[20] = @"SCDC_VMAX-V";
    v9[21] = @"VENC-AVE-VMAX";
    v8[22] = &unk_1F29E5B00;
    v9[22] = @"VENC-SYS-V";
    v0 = (void *)MEMORY[0x1E4F1C9E8];
    id v1 = v9;
    uint64_t v2 = v8;
    uint64_t v3 = 23;
    goto LABEL_8;
  }
  if ([MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] == 1001018)
  {
    v6[0] = &unk_1F29E5B18;
    v6[1] = &unk_1F29E5B30;
    v7[0] = @"ANE_SYS";
    v7[1] = @"APCIE";
    v6[2] = &unk_1F29E5B48;
    v6[3] = &unk_1F29E5B60;
    _DWORD v7[2] = @"AUDIO_P";
    v7[3] = @"AVD_SYS";
    v6[4] = &unk_1F29E57E8;
    v6[5] = &unk_1F29E5B78;
    v7[4] = @"ISP-SOC-VNOM";
    v7[5] = @"VENC_SYS";
    v6[6] = &unk_1F29E5818;
    v6[7] = &unk_1F29E5B90;
    v7[6] = @"AVD-SOC-VNOM";
    v7[7] = @"C0_USBCTL";
    v6[8] = &unk_1F29E5BA8;
    v6[9] = &unk_1F29E5BC0;
    v7[8] = @"AP_TMM_PS";
    v7[9] = @"DISP0_PHY";
    v6[10] = &unk_1F29E5BD8;
    v6[11] = &unk_1F29E5BF0;
    v7[10] = @"ECPM_NRG";
    v7[11] = @"ECPU0_SRAM";
    v6[12] = &unk_1F29E5C08;
    v6[13] = &unk_1F29E5C20;
    v7[12] = @"ECPU1_SRAM";
    v7[13] = @"ECPU2_SRAM";
    v6[14] = &unk_1F29E5C38;
    v6[15] = &unk_1F29E5C50;
    v7[14] = @"ECPU3_SRAM";
    v7[15] = @"ECPU_SRAM";
    uint8_t v6[16] = &unk_1F29E5C68;
    v6[17] = &unk_1F29E5C80;
    v7[16] = @"PCPM_NRG";
    v7[17] = @"PCPU0_SRAM";
    v6[18] = &unk_1F29E5C98;
    v6[19] = &unk_1F29E5CB0;
    v7[18] = @"PCPU1_SRAM";
    v7[19] = @"PCPU_SRAM";
    v6[20] = &unk_1F29E5CC8;
    v6[21] = &unk_1F29E5CE0;
    v7[20] = @"PMS_C1PPT_PS";
    v7[21] = @"SOC_RC_PS";
    v0 = (void *)MEMORY[0x1E4F1C9E8];
    id v1 = v7;
    uint64_t v2 = v6;
    uint64_t v3 = 22;
    goto LABEL_8;
  }
}

- (void)logEventBackwardSoCStatsDeviceStatesChannelID:(id)a3 withChannelGroup:(id)a4 withEntryDate:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"SoCStatsDeviceStatesChannelID"];
  id v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v13 = (void *)MEMORY[0x1D942A350]();
  uint64_t v15 = MEMORY[0x1E4F143A8];
  id v16 = v11;
  id v17 = v10;
  id v18 = v9;
  id v19 = v12;
  IOReportIterate();

  id v20 = v16;
  v21[0] = v19;
  id v14 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1, v15, 3221225472, __96__PLIOReportAgent_logEventBackwardSoCStatsDeviceStatesChannelID_withChannelGroup_withEntryDate___block_invoke, &unk_1E692CC98, self);
  [(PLOperator *)self logEntries:v14 withGroupID:v16];
}

uint64_t __96__PLIOReportAgent_logEventBackwardSoCStatsDeviceStatesChannelID_withChannelGroup_withEntryDate___block_invoke(uint64_t a1)
{
  uint64_t ChannelID = IOReportChannelGetChannelID();
  if ([*(id *)(a1 + 32) allowlistedChannelID:ChannelID]
    && (int)IOReportStateGetCount() >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = IOReportStateGetNameForIndex();
      if (!v4)
      {
        uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v3);
      }
      if ([v4 caseInsensitiveCompare:@"PWROFF"])
      {
        int v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 40) withDate:*(void *)(a1 + 48)];
        uint64_t v6 = NSNumber;
        BOOL v7 = [*(id *)(a1 + 56) objectForKey:@"currentSampleDate"];
        id v8 = [*(id *)(a1 + 56) objectForKey:@"lastSampleDate"];
        [v7 timeIntervalSinceDate:v8];
        id v9 = objc_msgSend(v6, "numberWithDouble:");
        [v5 setObject:v9 forKeyedSubscript:@"SampleTime"];

        id v10 = [NSNumber numberWithUnsignedLongLong:ChannelID];
        [v5 setObject:v10 forKeyedSubscript:@"channelID"];

        uint64_t v11 = [NSNumber numberWithUnsignedLongLong:IOReportStateGetResidency()];
        [v5 setObject:v11 forKeyedSubscript:@"value"];

        if ([MEMORY[0x1E4F92A38] internalBuild])
        {
          id v12 = IOReportChannelGetChannelName();
          uint64_t v13 = [NSString stringWithFormat:@"%@_%@", v12, v4];
          [v5 setObject:v13 forKeyedSubscript:@"channelName"];
        }
        [*(id *)(a1 + 64) addObject:v5];
      }
      uint64_t v3 = (v3 + 1);
    }
    while ((int)v3 < (int)IOReportStateGetCount());
  }
  return 0;
}

- (void)logEventForwardSoCStatsOperatingPoints
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (((int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] > 1001012
     || ([MEMORY[0x1E4F92A38] isHomePod] & 1) != 0
     || [MEMORY[0x1E4F92A38] isARMMac])
    && (([MEMORY[0x1E4F92A88] deviceRebooted] & 1) != 0
     || [MEMORY[0x1E4F929C0] taskMode]))
  {
    uint64_t v3 = [(NSMutableDictionary *)self->_sampleChannelsSnapshot objectForKeyedSubscript:@"cachedSample"];
    if (v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      int v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SoCStatsoprtp"];
      id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      BOOL v7 = [MEMORY[0x1E4F1CA48] array];
      id v8 = objc_opt_new();
      uint64_t v18 = MEMORY[0x1E4F143A8];
      id v9 = v6;
      id v10 = v5;
      id v11 = v4;
      id v12 = v7;
      id v13 = v8;
      IOReportIterate();
      id v14 = PLLogIOReport();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v12;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "Log OPRTP entries: %@", buf, 0xCu);
      }

      id v19 = v10;
      id v20 = v12;
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1, v18, 3221225472, __57__PLIOReportAgent_logEventForwardSoCStatsOperatingPoints__block_invoke, &unk_1E692CCC0);
      [(PLOperator *)self logEntries:v15 withGroupID:v10];

      id v16 = [MEMORY[0x1E4F1CA60] dictionary];
      [v16 setObject:v13 forKeyedSubscript:@"__PPSKVPairs__"];
      id v17 = PLLogIOReport();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v13;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "Log OPRTP entries in UTF: %@", buf, 0xCu);
      }

      [(PLOperator *)self logForSubsystem:@"IOReportMetrics" category:@"SoCStatsoprtp" data:v16 date:v11];
    }
  }
}

uint64_t __57__PLIOReportAgent_logEventForwardSoCStatsOperatingPoints__block_invoke(uint64_t a1)
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IOReportChannelGetChannelName();
  if ([v2 hasPrefix:*(void *)(a1 + 32)])
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = objc_msgSend(v2, "substringFromIndex:", objc_msgSend(*(id *)(a1 + 32), "length"));
    int v5 = [v3 numberFromString:v4];

    if (v5)
    {
      unint64_t ChannelID = IOReportChannelGetChannelID();
      uint64_t v7 = IOReportSimpleGetIntegerValue() ^ HIDWORD(ChannelID);
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 48) withDate:*(void *)(a1 + 56)];
      [v8 setObject:v5 forKeyedSubscript:@"Channel"];
      id v9 = [NSNumber numberWithUnsignedLongLong:v7];
      [v8 setObject:v9 forKeyedSubscript:@"Value"];

      [*(id *)(a1 + 64) addObject:v8];
      id v10 = *(void **)(a1 + 72);
      v14[1] = @"Value";
      v15[0] = v5;
      v14[0] = @"Channel";
      id v11 = [NSNumber numberWithUnsignedLongLong:v7];
      v15[1] = v11;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
      [v10 addObject:v12];
    }
  }

  return 0;
}

- (void)logEventPointIOReport
{
  if ([MEMORY[0x1E4F92A38] isMac]) {
    [(PLIOReportAgent *)self logEventPointPMTelemetryFlex];
  }
  id v4 = [(PLIOReportAgent *)self sampleChannelsSnapshot];
  uint64_t v3 = [(PLIOReportAgent *)self sampleSnapshotForChannelGroup:v4];
  [(PLIOReportAgent *)self logSnapshotValues:v3];
}

- (void)logEventPointPMTelemetryFlex
{
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"pmtelemetry_flex"];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
  if (qword_1EBD584A8 != -1) {
    dispatch_once(&qword_1EBD584A8, &__block_literal_global_9079);
  }
  int v5 = [(id)qword_1EBD584A0 getCurrentStats];
  if (v5)
  {
    id v6 = v4;
    IOReportIterate();
    [(PLOperator *)self logEntry:v6];
  }
}

uint64_t __47__PLIOReportAgent_logEventPointPMTelemetryFlex__block_invoke()
{
  qword_1EBD584A0 = [objc_alloc(MEMORY[0x1E4F92A08]) initWithDriverName:@"com_apple_driver_pmtelemetry" withGroup:@"pmtelemetry_flex"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __47__PLIOReportAgent_logEventPointPMTelemetryFlex__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = IOReportChannelGetChannelName();
  if (([v2 isEqualToString:@"SAGV Average Ratio"] & 1) != 0
    || ([v2 isEqualToString:@"IA HWP Clipped Bins"] & 1) != 0
    || [v2 isEqualToString:@"IA IccMax Clipped Bins"])
  {
    uint64_t v3 = [NSNumber numberWithLongLong:IOReportSimpleGetIntegerValue()];
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v2];
  }
  return 0;
}

- (void)logEventPointIOReportSaturation:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F92A38] hasCapability:7])
  {
    if ((int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] >= 1001018
      && [MEMORY[0x1E4F92A38] isiOS])
    {
      int v5 = PLLogIOReport();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v6 = "Saturation telemetry not supported";
LABEL_8:
        _os_log_error_impl(&dword_1D2690000, v5, OS_LOG_TYPE_ERROR, v6, buf, 2u);
      }
    }
    else
    {
      int v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SampleSaturation"];
      id v7 = (id)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
      IOReportIterate();
      id v8 = [(PLOperator *)self storage];
      id v9 = [v8 lastEntryForKey:v5];

      if (v9 && ![v9 compare:v7])
      {
        id v10 = PLLogIOReport();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D2690000, v10, OS_LOG_TYPE_INFO, "Last Sample Saturation entry is same as current", buf, 2u);
        }
      }
      else
      {
        [(PLOperator *)self logEntry:v7];
      }
    }
  }
  else
  {
    int v5 = PLLogIOReport();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v6 = "Accessory Power not supported";
      goto LABEL_8;
    }
  }
}

uint64_t __51__PLIOReportAgent_logEventPointIOReportSaturation___block_invoke(uint64_t a1)
{
  uint64_t v2 = IOReportChannelGetSubGroup();
  if ([v2 isEqualToString:@"HSCDTD602A_Cmps"])
  {
    uint64_t v3 = IOReportChannelGetChannelName();
    if ([v3 isEqualToString:@"Sample_Saturati"])
    {
      id v4 = [NSNumber numberWithLongLong:IOReportSimpleGetIntegerValue()];
      int v5 = *(void **)(a1 + 32);
      id v6 = @"CmpsSampleSaturationCount";
LABEL_7:
      [v5 setObject:v4 forKeyedSubscript:v6];

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([v2 isEqualToString:@"HSCDTD602A_Jarv"])
  {
    uint64_t v3 = IOReportChannelGetChannelName();
    if ([v3 isEqualToString:@"Sample_Saturati"])
    {
      id v4 = [NSNumber numberWithLongLong:IOReportSimpleGetIntegerValue()];
      int v5 = *(void **)(a1 + 32);
      id v6 = @"MagSampleSaturationCount";
      goto LABEL_7;
    }
LABEL_8:
  }
  return 0;
}

- (void)logEventBackwardIOReportAtAudioEvent
{
  if (+[PLIOReportAgent shouldLogAudioEvent])
  {
    uint64_t v3 = [(PLIOReportAgent *)self sampleChannelsAudioEvent];
    BOOL v4 = [(PLIOReportAgent *)self processNotificationForChannelGroup:v3];

    if (v4)
    {
      id v7 = [(PLIOReportAgent *)self sampleChannelsAudioEvent];
      int v5 = [(PLIOReportAgent *)self sampleDeltaForChannelGroup:v7];
      id v6 = [(PLIOReportAgent *)self sampleChannelsAudioEvent];
      [(PLIOReportAgent *)self logEventBackwardIOReportWithDelta:v5 forChannelGroup:v6];
    }
  }
}

- (void)logEventBackwardIOReportAtScreenStateChange:(id)a3
{
  BOOL v4 = [(PLIOReportAgent *)self sampleChannelsScreenState];
  BOOL v5 = [(PLIOReportAgent *)self processNotificationForChannelGroup:v4];

  if (v5)
  {
    id v6 = [(PLIOReportAgent *)self sampleChannelsScreenState];
    id v7 = [(PLIOReportAgent *)self sampleDeltaForChannelGroup:v6];
    id v8 = [(PLIOReportAgent *)self sampleChannelsScreenState];
    [(PLIOReportAgent *)self logEventBackwardIOReportWithDelta:v7 forChannelGroup:v8];
  }
  id v9 = [(PLIOReportAgent *)self SoCIOReportStats];
  if (v9)
  {
    id v11 = v9;
    if ([MEMORY[0x1E4F92A38] isiOS])
    {
      BOOL v10 = +[PLIOReportAgent shouldLogAtAppSwitchTrigger];

      if (!v10
        || !+[PLIOReportAgent shouldLogSocStatsPmgrCounters])
      {
        return;
      }
      id v11 = [(PLIOReportAgent *)self SoCIOReportStats];
      [v11 logEventBackwardSoCStatsPMGRCounters];
    }
    id v9 = v11;
  }
}

- (void)logEventBackwardIOReportAtWake
{
  uint64_t v3 = [(PLIOReportAgent *)self sampleChannelsWake];
  BOOL v4 = [(PLIOReportAgent *)self processNotificationForChannelGroup:v3];

  if (v4)
  {
    id v7 = [(PLIOReportAgent *)self sampleChannelsWake];
    BOOL v5 = [(PLIOReportAgent *)self sampleDeltaForChannelGroup:v7];
    id v6 = [(PLIOReportAgent *)self sampleChannelsWake];
    [(PLIOReportAgent *)self logEventBackwardIOReportWithDelta:v5 forChannelGroup:v6];
  }
}

- (void)logEventBackwardIOReportAtDisplayOffAPWake
{
  uint64_t v3 = [(PLIOReportAgent *)self sampleChannelsScreenState];
  BOOL v4 = [(PLIOReportAgent *)self processNotificationForChannelGroup:v3];

  if (v4)
  {
    id v7 = [(PLIOReportAgent *)self sampleChannelsScreenState];
    BOOL v5 = [(PLIOReportAgent *)self sampleDeltaForChannelGroup:v7];
    id v6 = [(PLIOReportAgent *)self sampleChannelsScreenState];
    [(PLIOReportAgent *)self logEventBackwardIOReportWithDelta:v5 forChannelGroup:v6];
  }
}

- (void)logEventBackwardIOReportAtDisplayStateChange
{
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    uint64_t v3 = [(PLIOReportAgent *)self sampleChannelsDisplayStateChange];
    BOOL v4 = [(PLIOReportAgent *)self processNotificationForChannelGroup:v3];

    if (v4)
    {
      id v7 = [(PLIOReportAgent *)self sampleChannelsDisplayStateChange];
      BOOL v5 = [(PLIOReportAgent *)self sampleDeltaForChannelGroup:v7];
      id v6 = [(PLIOReportAgent *)self sampleChannelsDisplayStateChange];
      [(PLIOReportAgent *)self logEventBackwardIOReportWithDelta:v5 forChannelGroup:v6];
    }
  }
}

- (void)logEventBackwardComplexPerformanceStates:(id)a3
{
}

uint64_t __60__PLIOReportAgent_logEventBackwardComplexPerformanceStates___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IOReportChannelGetChannelName();
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  BOOL v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"CPUStatsCPUComplexPerformanceStatesData"];
  uint64_t v5 = [*(id *)(a1 + 32) getChannelId:v2];
  int Count = IOReportStateGetCount();
  id v7 = PLLogIOReport();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v2;
    __int16 v19 = 1024;
    int v20 = Count;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Logging IOReport Complex Performance States channel %@ with %d states", buf, 0x12u);
  }
  id v16 = (void *)v2;

  if (Count >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      if (v5 <= 5)
      {
        id v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withDate:v3];
        BOOL v10 = [NSNumber numberWithInt:v5];
        [v9 setObject:v10 forKeyedSubscript:@"Channel"];

        id v11 = [NSNumber numberWithInt:v8];
        [v9 setObject:v11 forKeyedSubscript:@"State"];

        id v12 = NSNumber;
        IOReportStateGetDutyCycle();
        id v13 = objc_msgSend(v12, "numberWithDouble:");
        [v9 setObject:v13 forKeyedSubscript:@"DutyCycle"];

        id v14 = [NSNumber numberWithUnsignedLongLong:IOReportStateGetInTransitions()];
        [v9 setObject:v14 forKeyedSubscript:@"Transitions"];

        [*(id *)(a1 + 32) logEntry:v9];
      }
      uint64_t v8 = (v8 + 1);
    }
    while (Count != v8);
  }

  return 0;
}

- (int)getCoreChannelId:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"ECPU000"] & 1) != 0
    || ([v3 isEqualToString:@"ECPU001"] & 1) != 0
    || ([v3 isEqualToString:@"ECPU0"] & 1) != 0
    || [v3 isEqualToString:@"CPU0"])
  {
    if ([v3 isEqualToString:@"ECPU001"]) {
      int v4 = 18;
    }
    else {
      int v4 = 0;
    }
  }
  else if (([v3 isEqualToString:@"ECPU010"] & 1) != 0 {
         || ([v3 isEqualToString:@"ECPU011"] & 1) != 0
  }
         || ([v3 isEqualToString:@"ECPU1"] & 1) != 0
         || [v3 isEqualToString:@"CPU1"])
  {
    if ([v3 isEqualToString:@"ECPU011"]) {
      int v4 = 19;
    }
    else {
      int v4 = 1;
    }
  }
  else
  {
    if (([v3 isEqualToString:@"ECPU020"] & 1) != 0
      || ([v3 isEqualToString:@"ECPU021"] & 1) != 0
      || ([v3 isEqualToString:@"ECPU2"] & 1) != 0
      || [v3 isEqualToString:@"CPU2"])
    {
      BOOL v6 = [v3 isEqualToString:@"ECPU021"] == 0;
      int v7 = 2;
      int v8 = 20;
    }
    else if (([v3 isEqualToString:@"ECPU030"] & 1) != 0 {
           || ([v3 isEqualToString:@"ECPU031"] & 1) != 0
    }
           || [v3 isEqualToString:@"ECPU3"])
    {
      BOOL v6 = [v3 isEqualToString:@"ECPU031"] == 0;
      int v7 = 3;
      int v8 = 21;
    }
    else if (([v3 isEqualToString:@"ECPU040"] & 1) != 0 {
           || ([v3 isEqualToString:@"ECPU041"] & 1) != 0
    }
           || [v3 isEqualToString:@"ECPU4"])
    {
      BOOL v6 = [v3 isEqualToString:@"ECPU041"] == 0;
      int v7 = 4;
      int v8 = 22;
    }
    else if (([v3 isEqualToString:@"ECPU050"] & 1) != 0 {
           || ([v3 isEqualToString:@"ECPU051"] & 1) != 0
    }
           || [v3 isEqualToString:@"ECPU5"])
    {
      BOOL v6 = [v3 isEqualToString:@"ECPU051"] == 0;
      int v7 = 5;
      int v8 = 23;
    }
    else if (([v3 isEqualToString:@"PCPU000"] & 1) != 0 {
           || ([v3 isEqualToString:@"PCPU001"] & 1) != 0
    }
           || [v3 isEqualToString:@"PCPU0"])
    {
      BOOL v6 = [v3 isEqualToString:@"PCPU001"] == 0;
      int v7 = 6;
      int v8 = 24;
    }
    else if (([v3 isEqualToString:@"PCPU010"] & 1) != 0 {
           || ([v3 isEqualToString:@"PCPU011"] & 1) != 0
    }
           || [v3 isEqualToString:@"PCPU1"])
    {
      BOOL v6 = [v3 isEqualToString:@"PCPU011"] == 0;
      int v7 = 7;
      int v8 = 25;
    }
    else if (([v3 isEqualToString:@"PCPU020"] & 1) != 0 {
           || ([v3 isEqualToString:@"PCPU021"] & 1) != 0
    }
           || [v3 isEqualToString:@"PCPU2"])
    {
      BOOL v6 = [v3 isEqualToString:@"PCPU021"] == 0;
      int v7 = 8;
      int v8 = 26;
    }
    else if (([v3 isEqualToString:@"PCPU030"] & 1) != 0 {
           || ([v3 isEqualToString:@"PCPU031"] & 1) != 0
    }
           || [v3 isEqualToString:@"PCPU3"])
    {
      BOOL v6 = [v3 isEqualToString:@"PCPU031"] == 0;
      int v7 = 9;
      int v8 = 27;
    }
    else if (([v3 isEqualToString:@"PCPU040"] & 1) != 0 {
           || ([v3 isEqualToString:@"PCPU041"] & 1) != 0
    }
           || [v3 isEqualToString:@"PCPU4"])
    {
      BOOL v6 = [v3 isEqualToString:@"PCPU041"] == 0;
      int v7 = 10;
      int v8 = 28;
    }
    else if (([v3 isEqualToString:@"PCPU050"] & 1) != 0 {
           || ([v3 isEqualToString:@"PCPU051"] & 1) != 0
    }
           || [v3 isEqualToString:@"PCPU5"])
    {
      BOOL v6 = [v3 isEqualToString:@"PCPU051"] == 0;
      int v7 = 11;
      int v8 = 29;
    }
    else if (([v3 isEqualToString:@"PCPU100"] & 1) != 0 {
           || [v3 isEqualToString:@"PCPU101"])
    }
    {
      BOOL v6 = [v3 isEqualToString:@"PCPU101"] == 0;
      int v7 = 12;
      int v8 = 30;
    }
    else if (([v3 isEqualToString:@"PCPU110"] & 1) != 0 {
           || [v3 isEqualToString:@"PCPU111"])
    }
    {
      BOOL v6 = [v3 isEqualToString:@"PCPU111"] == 0;
      int v7 = 13;
      int v8 = 31;
    }
    else if (([v3 isEqualToString:@"PCPU120"] & 1) != 0 {
           || [v3 isEqualToString:@"PCPU121"])
    }
    {
      BOOL v6 = [v3 isEqualToString:@"PCPU121"] == 0;
      int v7 = 14;
      int v8 = 32;
    }
    else if (([v3 isEqualToString:@"PCPU130"] & 1) != 0 {
           || [v3 isEqualToString:@"PCPU131"])
    }
    {
      BOOL v6 = [v3 isEqualToString:@"PCPU131"] == 0;
      int v7 = 15;
      int v8 = 33;
    }
    else if (([v3 isEqualToString:@"PCPU140"] & 1) != 0 {
           || [v3 isEqualToString:@"PCPU141"])
    }
    {
      BOOL v6 = [v3 isEqualToString:@"PCPU141"] == 0;
      int v7 = 16;
      int v8 = 34;
    }
    else
    {
      if (([v3 isEqualToString:@"PCPU150"] & 1) == 0
        && ![v3 isEqualToString:@"PCPU151"])
      {
        int v4 = -1;
        goto LABEL_8;
      }
      BOOL v6 = [v3 isEqualToString:@"PCPU151"] == 0;
      int v7 = 17;
      int v8 = 35;
    }
    if (v6) {
      int v4 = v7;
    }
    else {
      int v4 = v8;
    }
  }
LABEL_8:

  return v4;
}

- (void)logEventBackwardCorePerformanceStates:(id)a3 withChannels:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v5 objectForKey:@"currentSampleAPWakeTime"];
  uint64_t v8 = [v7 unsignedLongLongValue];

  id v9 = [v5 objectForKey:@"lastSampleAPWakeTime"];

  uint64_t v10 = [v9 unsignedLongLongValue];
  [MEMORY[0x1E4F92A88] secondsFromMachTime:v8];
  [MEMORY[0x1E4F92A88] secondsFromMachTime:v10];
  IOReportIterate();
}

uint64_t __70__PLIOReportAgent_logEventBackwardCorePerformanceStates_withChannels___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IOReportChannelGetChannelName();
  id v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  int v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"CPUStatsCPUCorePerformanceStatesData"];
  uint64_t v5 = [*(id *)(a1 + 32) getCoreChannelId:v2];
  int Count = IOReportStateGetCount();
  int v7 = PLLogIOReport();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v2;
    __int16 v20 = 1024;
    int v21 = Count;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Logging IOReport Core Performance States channel %@ with %d states", buf, 0x12u);
  }
  id v17 = (void *)v2;

  if (Count >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      if (v5 <= 0x23)
      {
        id v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withDate:v3];
        uint64_t v10 = [NSNumber numberWithInt:v5];
        [v9 setObject:v10 forKeyedSubscript:@"Channel"];

        id v11 = [NSNumber numberWithInt:v8];
        [v9 setObject:v11 forKeyedSubscript:@"State"];

        id v12 = NSNumber;
        IOReportStateGetDutyCycle();
        id v13 = objc_msgSend(v12, "numberWithDouble:");
        [v9 setObject:v13 forKeyedSubscript:@"DutyCycle"];

        id v14 = [NSNumber numberWithUnsignedLongLong:IOReportStateGetInTransitions()];
        [v9 setObject:v14 forKeyedSubscript:@"Transitions"];

        uint64_t v15 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
        [v9 setObject:v15 forKeyedSubscript:@"APWakeTime"];

        [*(id *)(a1 + 32) logEntry:v9];
      }
      uint64_t v8 = (v8 + 1);
    }
    while (Count != v8);
  }

  return 0;
}

- (int)getComplexVoltageStateTimeChannelId:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ECPM v1"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ECPM v1 idle"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ECPM v2"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ECPM v2 idle"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ECPM v3"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ECPM v3 idle"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ECPM v4"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ECPM v4 idle"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ECPM v5"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ECPM v5 idle"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"PCPM v1"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PCPM v1 idle"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PCPM v2"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"PCPM v2 idle"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"PCPM v3"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"PCPM v3 idle"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"PCPM v4"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"PCPM v4 idle"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"PCPM v5"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"PCPM v5 idle"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"PCPM v6"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"PCPM v6 idle"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"PCPM v7"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"PCPM v7 idle"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"PCPM v8"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"PCPM v8 idle"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"PCPM v9"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"PCPM v9 idle"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"PCPM v10"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"PCPM v10 idle"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"PCPM v11"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"PCPM v11 idle"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"PCPM v12"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"PCPM v12 idle"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"PCPM v13"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"PCPM v13 idle"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"PCPM v14"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"PCPM v14 idle"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"PCPM v15"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"PCPM v15 idle"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"PCPM v16"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"PCPM v16 idle"])
  {
    int v4 = 41;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (void)logEventBackwardComplexVoltageStateTime:(id)a3 withChannels:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v5 objectForKey:@"currentSampleAPWakeTime"];
  uint64_t v8 = [v7 unsignedLongLongValue];

  id v9 = [v5 objectForKey:@"lastSampleAPWakeTime"];

  uint64_t v10 = [v9 unsignedLongLongValue];
  [MEMORY[0x1E4F92A88] secondsFromMachTime:v8];
  [MEMORY[0x1E4F92A88] secondsFromMachTime:v10];
  IOReportIterate();
}

uint64_t __72__PLIOReportAgent_logEventBackwardComplexVoltageStateTime_withChannels___block_invoke(uint64_t a1)
{
  uint64_t v2 = IOReportChannelGetChannelName();
  id v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  int v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"CPUStatsCPUComplexVoltageStateTime"];
  uint64_t v5 = [*(id *)(a1 + 32) getComplexVoltageStateTimeChannelId:v2];
  if (v5 <= 0x29)
  {
    uint64_t v6 = v5;
    int v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withDate:v3];
    uint64_t v8 = [NSNumber numberWithInt:v6];
    [v7 setObject:v8 forKeyedSubscript:@"Channel"];

    id v9 = [NSNumber numberWithLongLong:IOReportSimpleGetIntegerValue()];
    [v7 setObject:v9 forKeyedSubscript:@"Value"];

    uint64_t v10 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    [v7 setObject:v10 forKeyedSubscript:@"APWakeTime"];

    [*(id *)(a1 + 32) logEntry:v7];
  }

  return 0;
}

- (id)getBucketName:(int)a3
{
  if ((a3 - 1) > 0x15) {
    return 0;
  }
  else {
    return off_1E692CE48[a3 - 1];
  }
}

- (void)logEventBackwardComplexThermalUPOLimiting:(id)a3 withChannels:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[PLIOReportAgent shouldLogThermalUPOLimiting])
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    id v9 = [(PLIOReportAgent *)self entryKeyForEventWithGroupName:@"CPU Stats" withSubGroupName:@"CPU Complex Thermal/UPO Limiting"];
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9 withDate:v8];
    id v11 = NSNumber;
    id v12 = [v7 objectForKey:@"currentSampleDate"];
    id v13 = [v7 objectForKey:@"lastSampleDate"];
    [v12 timeIntervalSinceDate:v13];
    id v14 = objc_msgSend(v11, "numberWithDouble:");
    [v10 setObject:v14 forKeyedSubscript:@"SampleTime"];

    uint64_t v15 = [v7 objectForKey:@"currentSampleAPWakeTime"];
    uint64_t v16 = [v15 unsignedLongLongValue];

    id v17 = [v7 objectForKey:@"lastSampleAPWakeTime"];
    uint64_t v18 = [v17 unsignedLongLongValue];

    [MEMORY[0x1E4F92A88] secondsFromMachTime:v16];
    double v20 = v19;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v18];
    uint64_t v22 = [NSNumber numberWithDouble:v20 - v21];
    [v10 setObject:v22 forKeyedSubscript:@"APWakeTime"];

    uint64_t v24 = MEMORY[0x1E4F143A8];
    BOOL v25 = v10;
    id v23 = v10;
    IOReportIterate();
    -[PLOperator logEntry:](self, "logEntry:", v23, v24, 3221225472, __74__PLIOReportAgent_logEventBackwardComplexThermalUPOLimiting_withChannels___block_invoke, &unk_1E692CBF8, self);
  }
}

uint64_t __74__PLIOReportAgent_logEventBackwardComplexThermalUPOLimiting_withChannels___block_invoke(uint64_t a1)
{
  uint64_t v2 = IOReportChannelGetChannelName();
  if ((int)IOReportStateGetCount() >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      int v4 = [*(id *)(a1 + 32) getBucketName:v3];
      if (v4)
      {
        uint64_t v5 = [NSString stringWithFormat:@"%@_%@", v2, v4];
        id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];

        id v7 = NSNumber;
        if (v6)
        {
          uint64_t v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
          [v8 doubleValue];
          double v10 = v9;
          IOReportStateGetDutyCycle();
          id v12 = [v7 numberWithDouble:v10 + v11];
          [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:v5];
        }
        else
        {
          IOReportStateGetDutyCycle();
          uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
          [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v5];
        }
      }
      uint64_t v3 = (v3 + 1);
    }
    while ((int)v3 < (int)IOReportStateGetCount());
  }

  return 0;
}

- (void)logEventBackwardAOPPerformance:(id)a3 withChannels:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F929C0] fullMode])
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    double v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"AOPPerformance"];
    double v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9 withDate:v8];
    double v11 = NSNumber;
    id v12 = [v7 objectForKey:@"currentSampleDate"];
    id v13 = [v7 objectForKey:@"lastSampleDate"];
    [v12 timeIntervalSinceDate:v13];
    id v14 = objc_msgSend(v11, "numberWithDouble:");
    [v10 setObject:v14 forKeyedSubscript:@"SampleTime"];

    id v17 = v10;
    id v15 = v10;
    IOReportIterate();
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[PLIOReportAgent AOPTotalThreadTime](self, "AOPTotalThreadTime"));
    [v15 setObject:v16 forKeyedSubscript:@"Threadtime_total"];

    [(PLOperator *)self logEntry:v15];
  }
  else
  {
    IOReportIterate();
  }
}

uint64_t __63__PLIOReportAgent_logEventBackwardAOPPerformance_withChannels___block_invoke(uint64_t a1)
{
  id v7 = IOReportChannelGetChannelName();
  if ([v7 isEqualToString:@"Thread time"] && (int)IOReportStateGetCount() >= 1)
  {
    uint64_t v2 = 0;
    do
    {
      uint64_t v3 = IOReportStateGetNameForIndex();
      if (!v3)
      {
        uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v2);
      }
      if (([v3 containsString:@"main"] & 1) != 0
        || ([v3 containsString:@"voicetri"] & 1) != 0
        || ([v3 containsString:@"prox"] & 1) != 0
        || ([v3 containsString:@"pearl"] & 1) != 0
        || ([v3 containsString:@"audio"] & 1) != 0
        || ([v3 containsString:@"rtk_ep_w"] & 1) != 0
        || ([v3 containsString:@"SVC"] & 1) != 0
        || ([v3 containsString:@"IRQ"] & 1) != 0
        || ([v3 containsString:@"cma"] & 1) != 0
        || [v3 containsString:@"power"])
      {
        int v4 = [NSString stringWithFormat:@"%@_%@", @"Threadtime", v3];
        uint64_t v5 = [NSNumber numberWithUnsignedLongLong:IOReportStateGetResidency()];
        [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
      }
      objc_msgSend(*(id *)(a1 + 40), "setAOPTotalThreadTime:", IOReportStateGetResidency() + objc_msgSend(*(id *)(a1 + 40), "AOPTotalThreadTime"));

      uint64_t v2 = (v2 + 1);
    }
    while ((int)v2 < (int)IOReportStateGetCount());
  }

  return 0;
}

uint64_t __63__PLIOReportAgent_logEventBackwardAOPPerformance_withChannels___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = IOReportChannelGetChannelName();
  if ([v2 isEqualToString:@"Thread time"] && (int)IOReportStateGetCount() >= 1)
  {
    int v3 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "setAOPTotalThreadTime:", IOReportStateGetResidency() + objc_msgSend(*(id *)(a1 + 32), "AOPTotalThreadTime"));
      ++v3;
    }
    while (v3 < (int)IOReportStateGetCount());
  }

  return 0;
}

- (void)logEventBackwardAOPPowerState:(id)a3 withChannels:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 monotonicDate];
  double v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"AOPPowerState"];
  double v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10 withDate:v9];
  id v12 = NSNumber;
  id v13 = [v7 objectForKey:@"currentSampleDate"];
  id v14 = [v7 objectForKey:@"lastSampleDate"];

  [v13 timeIntervalSinceDate:v14];
  id v15 = objc_msgSend(v12, "numberWithDouble:");
  [v11 setObject:v15 forKeyedSubscript:@"SampleTime"];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[PLIOReportAgent AOPTotalThreadTime](self, "AOPTotalThreadTime"));
  [v11 setObject:v16 forKeyedSubscript:@"Active"];

  id v17 = v11;
  IOReportIterate();

  uint64_t v18 = [v17 objectForKeyedSubscript:@"Active"];
  if (v18)
  {
    double v19 = (void *)v18;
    double v20 = [v17 objectForKeyedSubscript:@"On"];

    if (v20)
    {
      double v21 = NSNumber;
      uint64_t v22 = [v17 objectForKeyedSubscript:@"On"];
      [v22 doubleValue];
      double v24 = v23;
      BOOL v25 = [v17 objectForKeyedSubscript:@"Active"];
      [v25 doubleValue];
      id v27 = [v21 numberWithDouble:v24 - v26];
      [v17 setObject:v27 forKeyedSubscript:@"PreventPowerGate"];
    }
  }
  [(PLOperator *)self logEntry:v17];
}

uint64_t __62__PLIOReportAgent_logEventBackwardAOPPowerState_withChannels___block_invoke(uint64_t a1)
{
  uint64_t v2 = IOReportChannelGetChannelName();
  if ([v2 isEqualToString:@"Power state"] && (int)IOReportStateGetCount() >= 1)
  {
    int v3 = 0;
    while (1)
    {
      int v4 = IOReportStateGetNameForIndex();
      if ([v4 isEqualToString:@"ON"]) {
        break;
      }
      if ([v4 isEqualToString:@"OFF"])
      {
        uint64_t v5 = [NSNumber numberWithUnsignedLongLong:IOReportStateGetResidency()];
        id v6 = *(void **)(a1 + 32);
        id v7 = v5;
        id v8 = @"CPUPowerGated";
        goto LABEL_8;
      }
LABEL_9:

      if (++v3 >= (int)IOReportStateGetCount()) {
        goto LABEL_10;
      }
    }
    uint64_t v5 = [NSNumber numberWithUnsignedLongLong:IOReportStateGetResidency()];
    id v6 = *(void **)(a1 + 32);
    id v7 = v5;
    id v8 = @"On";
LABEL_8:
    [v6 setObject:v7 forKeyedSubscript:v8];

    goto LABEL_9;
  }
LABEL_10:

  return 0;
}

uint64_t __69__PLIOReportAgent_logEventBackwardIOReportWithDelta_forChannelGroup___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD583E0 = result;
  return result;
}

id __69__PLIOReportAgent_logEventBackwardIOReportWithDelta_forChannelGroup___block_invoke_9558(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __69__PLIOReportAgent_logEventBackwardIOReportWithDelta_forChannelGroup___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD583E1 = result;
  return result;
}

- (void)logEventBackwardMTRAging
{
  uint64_t v2 = self;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F92000uLL;
  if (self->_iokitAging)
  {
    if ([MEMORY[0x1E4F92A38] isiOS])
    {
      int v4 = &unk_1F29E9608;
    }
    else
    {
      int v11 = [MEMORY[0x1E4F92A38] isWatch];
      int v4 = (void *)MEMORY[0x1E4F1CC08];
      if (v11) {
        int v4 = &unk_1F29E9630;
      }
    }
    id obj = v4;
    BOOL v47 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    id v48 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MTRAging"];
    BOOL v52 = objc_opt_new();
    if (([MEMORY[0x1E4F929C0] fullMode] & 1) != 0
      || [MEMORY[0x1E4F929C0] taskMode])
    {
      BOOL v46 = objc_opt_new();
      int v51 = 1;
    }
    else
    {
      int v51 = 0;
      BOOL v46 = 0;
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v54 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
    if (v54)
    {
      uint64_t v53 = *(void *)v59;
      BOOL v50 = v2;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v59 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v58 + 1) + 8 * v12);
          id v14 = [obj objectForKeyedSubscript:v13];
          id v15 = [v14 stringByAppendingString:@"Data"];

          uint64_t v16 = (void *)MEMORY[0x1E4F92A00];
          id v17 = [(PLIOReportAgent *)v2 iokitAging];
          uint64_t v18 = objc_msgSend(v16, "snapshotFromIOEntry:forKey:", objc_msgSend(v17, "service"), v15);

          if (v18)
          {
            if (__ROR8__(0xAAAAAAAAAAAAAAABLL * [v18 length], 3) < 0xAAAAAAAAAAAAAABuLL)
            {
              id v26 = v18;
              uint64_t v27 = [v26 bytes];
              unint64_t v28 = [v26 length];
              if (v28 >= 0x18)
              {
                unint64_t v29 = v28 / 0x18;
                uint64_t v30 = (void *)(v27 + 16);
                do
                {
                  if (*((_DWORD *)v30 - 4) == 1
                    && *((_DWORD *)v30 - 3) == 1
                    && *((_DWORD *)v30 - 2) == 2
                    && !*((_WORD *)v30 - 1))
                  {
                    if ([*(id *)(v3 + 2496) debugEnabled])
                    {
                      uint64_t v31 = objc_opt_class();
                      block[0] = MEMORY[0x1E4F143A8];
                      block[1] = 3221225472;
                      block[2] = __43__PLIOReportAgent_logEventBackwardMTRAging__block_invoke_9600;
                      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                      void block[4] = v31;
                      if (qword_1EBD584D0 != -1) {
                        dispatch_once(&qword_1EBD584D0, block);
                      }
                      if (byte_1EBD583E4)
                      {
                        uint64_t v32 = [NSString stringWithFormat:@"value = %llu, node=%d (id=%d, type=%d, unit=%d, flags=%d, counter=%d)", *v30 & 0xFFFFFFFFFFFFFFLL, *((unsigned __int16 *)v30 - 2), *((unsigned int *)v30 - 4), *((unsigned int *)v30 - 3), *((unsigned int *)v30 - 2), *((unsigned __int16 *)v30 - 1), HIBYTE(*v30)];
                        BOOL v49 = (void *)MEMORY[0x1E4F929B8];
                        id v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLIOReportAgent.m"];
                        BOOL v34 = [v33 lastPathComponent];
                        id v35 = [NSString stringWithUTF8String:"-[PLIOReportAgent logEventBackwardMTRAging]"];
                        [v49 logMessage:v32 fromFile:v34 fromFunction:v35 fromLineNumber:10913];

                        BOOL v36 = (void *)v32;
                        uint64_t v37 = PLLogCommon();
                        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412290;
                          uint64_t v67 = (uint64_t)v36;
                          _os_log_debug_impl(&dword_1D2690000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                        }
                      }
                    }
                    BOOL v38 = [NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v30 - 2)];
                    BOOL v39 = [NSNumber numberWithUnsignedLongLong:*v30 & 0xFFFFFFFFFFFFFFLL];
                    BOOL v40 = [NSString stringWithFormat:@"com.apple.mtr.%@.%@", v13, v38];
                    [v52 setObject:v39 forKeyedSubscript:v40];
                    id v41 = v38;
                    id v42 = v39;
                    AnalyticsSendEventLazy();
                    if (v51)
                    {
                      BOOL v43 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v48 withDate:v47];
                      [v43 setObject:v13 forKeyedSubscript:@"Component"];
                      [v43 setObject:v41 forKeyedSubscript:@"Node"];
                      [v43 setObject:v42 forKeyedSubscript:@"dF_norm"];
                      [v46 addObject:v43];
                    }
                    uint64_t v2 = v50;
                    unint64_t v3 = 0x1E4F92000;
                  }
                  v30 += 3;
                  --v29;
                }
                while (v29);
              }
            }
            else if ([*(id *)(v3 + 2496) debugEnabled])
            {
              uint64_t v19 = objc_opt_class();
              v57[0] = MEMORY[0x1E4F143A8];
              v57[1] = 3221225472;
              void v57[2] = __43__PLIOReportAgent_logEventBackwardMTRAging__block_invoke_9594;
              v57[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              void v57[4] = v19;
              if (qword_1EBD584C8 != -1) {
                dispatch_once(&qword_1EBD584C8, v57);
              }
              if (byte_1EBD583E3)
              {
                double v20 = [NSString stringWithFormat:@"rawData is not a multiple of RoscData"];
                double v21 = (void *)MEMORY[0x1E4F929B8];
                uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLIOReportAgent.m"];
                double v23 = [v22 lastPathComponent];
                double v24 = [NSString stringWithUTF8String:"-[PLIOReportAgent logEventBackwardMTRAging]"];
                [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:10904];

                BOOL v25 = PLLogCommon();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v67 = (uint64_t)v20;
                  _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                unint64_t v3 = 0x1E4F92000;
              }
            }
          }

          ++v12;
        }
        while (v12 != v54);
        uint64_t v44 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
        uint64_t v54 = v44;
      }
      while (v44);
    }
    if ([v52 count]) {
      MEMORY[0x1D94294D0](0, v52);
    }
    if (v51)
    {
      if ([v46 count])
      {
        uint64_t v63 = v48;
        BOOL v64 = v46;
        BOOL v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        [(PLOperator *)v2 logEntries:v45 withGroupID:v48];
      }
    }

LABEL_57:
    return;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __43__PLIOReportAgent_logEventBackwardMTRAging__block_invoke;
    void v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v62[4] = v5;
    if (qword_1EBD584C0 != -1) {
      dispatch_once(&qword_1EBD584C0, v62);
    }
    if (byte_1EBD583E2)
    {
      uint64_t v6 = [NSString stringWithFormat:@"iokitAging is nil"];
      id v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLIOReportAgent.m"];
      double v9 = [v8 lastPathComponent];
      double v10 = [NSString stringWithUTF8String:"-[PLIOReportAgent logEventBackwardMTRAging]"];
      BOOL v47 = (void *)v6;
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:10831];

      id v48 = PLLogCommon();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v67 = v6;
        _os_log_debug_impl(&dword_1D2690000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_57;
    }
  }
}

uint64_t __43__PLIOReportAgent_logEventBackwardMTRAging__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD583E2 = result;
  return result;
}

uint64_t __43__PLIOReportAgent_logEventBackwardMTRAging__block_invoke_9594(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD583E3 = result;
  return result;
}

uint64_t __43__PLIOReportAgent_logEventBackwardMTRAging__block_invoke_9600(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD583E4 = result;
  return result;
}

id __43__PLIOReportAgent_logEventBackwardMTRAging__block_invoke_9607(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v1 = *(_OWORD *)(a1 + 32);
  v4[0] = @"component";
  v4[1] = @"node";
  long long v5 = v1;
  v4[2] = @"df_norm";
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v5 forKeys:v4 count:3];
  return v2;
}

id __37__PLIOReportAgent_logEngagementToCA___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"area"];
  unint64_t v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
  [v2 setObject:v3 forKeyedSubscript:@"timeScale"];

  int v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:1];
  [v2 setObject:v4 forKeyedSubscript:@"bin"];

  long long v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v2 setObject:v5 forKeyedSubscript:@"transitionCount"];

  return v2;
}

- (id)allowSamplingMemCacheStats:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F929C0] BOOLForKey:@"disableMemCacheStatConditions" ifNotSet:0];
  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(PLIOReportAgent *)self sampledBundleIDs];
    unint64_t v7 = [v6 count];

    if (v7 >= 0xB)
    {
      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v29) = 0;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Met max collection threshold", (uint8_t *)&v29, 2u);
      }
      goto LABEL_24;
    }
  }
  if (!v4)
  {
LABEL_25:
    id v8 = 0;
    goto LABEL_26;
  }
  id v8 = [v4 objectForKeyedSubscript:@"entry"];

  if (!v8) {
    goto LABEL_26;
  }
  double v9 = [v4 objectForKeyedSubscript:@"entry"];
  id v8 = [v9 objectForKeyedSubscript:@"bundleID"];

  if (!v8 || ([v8 isEqualToString:self->_lastFgApp] & 1) != 0)
  {
LABEL_24:

    goto LABEL_25;
  }
  objc_storeStrong((id *)&self->_lastFgApp, v8);
  double v10 = [MEMORY[0x1E4F1C9C8] date];
  lastFgAppSwitch = self->_lastFgAppSwitch;
  self->_lastFgAppSwitch = v10;

  uint64_t v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    lastFgApp = self->_lastFgApp;
    uint64_t v27 = self->_lastFgAppSwitch;
    int v29 = 138412546;
    uint64_t v30 = lastFgApp;
    __int16 v31 = 2112;
    uint64_t v32 = v27;
    _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "Fg App Switch app: %@ at : %@", (uint8_t *)&v29, 0x16u);
  }

  if ([(PLIOReportAgent *)self collectionEnabled])
  {
    uint64_t v13 = PLLogCommon();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
LABEL_23:

      goto LABEL_24;
    }
    LOWORD(v29) = 0;
    id v14 = "Collection enabled for another app";
    id v15 = v13;
    uint32_t v16 = 2;
LABEL_14:
    _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v29, v16);
    goto LABEL_23;
  }
  if (v5) {
    goto LABEL_26;
  }
  id v17 = [(PLIOReportAgent *)self sampledBundleIDs];
  int v18 = [v17 containsObject:v8];

  if (v18)
  {
    uint64_t v13 = PLLogCommon();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_23;
    }
    int v29 = 138412290;
    uint64_t v30 = v8;
    id v14 = "App %@ already sampled";
    id v15 = v13;
    uint32_t v16 = 12;
    goto LABEL_14;
  }
  uint64_t v19 = [(PLIOReportAgent *)self lastSampleDate];
  if (v19)
  {
    double v20 = (void *)v19;
    double v21 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v22 = [(PLIOReportAgent *)self lastSampleDate];
    [v21 timeIntervalSinceDate:v22];
    double v24 = v23;

    if (v24 < 3600.0)
    {
      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v28 = [(PLIOReportAgent *)self lastSampleDate];
        int v29 = 138412290;
        uint64_t v30 = v28;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "Not enough time since last sample: %@", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_23;
    }
  }
LABEL_26:

  return v8;
}

- (void)connectToMemCacheDriver
{
  kern_return_t v7;
  kern_return_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  _DWORD v13[2];
  uint64_t v14;
  uint64_t vars8;

  id v14 = *MEMORY[0x1E4F143B8];
  p_memCacheDriverConn = &self->_memCacheDriverConn;
  if (!self->_memCacheDriverConn)
  {
    mach_port_t v3 = *MEMORY[0x1E4F2EF00];
    CFDictionaryRef v4 = IOServiceMatching("AppleMemCacheController");
    io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
    if (!MatchingService)
    {
      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13[0]) = 0;
        double v10 = "Could not find object for AppleMemCacheController";
        int v11 = v9;
        uint64_t v12 = 2;
        goto LABEL_13;
      }
LABEL_7:

      return;
    }
    io_object_t v6 = MatchingService;
    unint64_t v7 = IOServiceOpen(MatchingService, *MEMORY[0x1E4F14960], 0, p_memCacheDriverConn);
    if (v7)
    {
      id v8 = v7;
      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13[0] = 67109120;
        v13[1] = v8;
        double v10 = "Cannot open AppleMemCacheController service with ret: 0x%x";
        int v11 = v9;
        uint64_t v12 = 8;
LABEL_13:
        _os_log_error_impl(&dword_1D2690000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)v13, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
    IOObjectRelease(v6);
  }
}

+ (id)keyForSubBlock:(int)a3
{
  return (id)[NSString stringWithFormat:@"%@%d", @"IPSubBlock", *(void *)&a3];
}

- (void)readAndLogMemCacheStats
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  BOOL v25 = 0;
  int v3 = MEMORY[0x1D9428C80](self->_memCacheDriverConn, 1, *MEMORY[0x1E4F14960], &v25, &v24, 1);
  if (v3)
  {
    int v4 = v3;
    log = PLLogCommon();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v4;
      _os_log_error_impl(&dword_1D2690000, log, OS_LOG_TYPE_ERROR, "Failed to map data collection memory ret:0x%x\n", buf, 8u);
    }
  }
  else
  {
    char v5 = v25;
    log = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MemCacheStats"];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v7 = IODataQueuePeek(v5);
    if (v7)
    {
      id v8 = v7;
      while (1)
      {
        double v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:log];
        double v10 = [NSNumber numberWithUnsignedLongLong:*(void *)v8->data];
        [v9 setObject:v10 forKeyedSubscript:@"SampleTime"];

        if (*(_DWORD *)v8[1].data)
        {
          unint64_t v11 = 0;
          do
          {
            uint64_t v12 = +[PLIOReportAgent keyForSubBlock:v11];
            uint64_t v13 = [NSNumber numberWithUnsignedInt:*(&v8[2].size + v11)];
            [v9 setObject:v13 forKeyedSubscript:v12];

            ++v11;
          }
          while (v11 < *(unsigned int *)v8[1].data);
        }
        [v6 addObject:v9];
        if ([v6 count] == 256) {
          break;
        }
        IOReturn v14 = IODataQueueDequeue(v5, 0, 0);
        if (v14)
        {
          IOReturn v15 = v14;
          uint32_t v16 = PLLogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v29) = v15;
            _os_log_error_impl(&dword_1D2690000, v16, OS_LOG_TYPE_ERROR, "Failed to move to next entry in queue. ret:0x%x\n", buf, 8u);
          }

          break;
        }

        id v8 = IODataQueuePeek(v5);
        if (!v8) {
          goto LABEL_17;
        }
      }
    }
LABEL_17:
    if ([v6 count])
    {
      id v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = [v6 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v29 = v22;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "Num stats entries: %lu", buf, 0xCu);
      }

      id v26 = log;
      id v27 = v6;
      int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      [(PLOperator *)self logEntries:v18 withGroupID:log];
    }
    int v19 = MEMORY[0x1D9428C90](self->_memCacheDriverConn, 1, *MEMORY[0x1E4F14960], v25);
    if (v19)
    {
      int v20 = v19;
      double v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v29) = v20;
        _os_log_error_impl(&dword_1D2690000, v21, OS_LOG_TYPE_ERROR, "Failed to unmap memory ret:0x%x\n", buf, 8u);
      }
    }
  }
}

- (BOOL)fgAppChangedSince:(unint64_t)a3
{
  [(NSDate *)self->_lastFgAppSwitch timeIntervalSinceNow];
  return fabs(v4) < (double)a3;
}

- (void)triggerMemCacheLogging:(id)a3 withDelay:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(input[0]) = 138412290;
    *(uint64_t *)((char *)input + 4) = (uint64_t)v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Triggered MemCache logging for app: %@", (uint8_t *)input, 0xCu);
  }

  if (![(PLIOReportAgent *)self fgAppChangedSince:a4]
    && ![(PLIOReportAgent *)self collectionEnabled])
  {
    [(PLIOReportAgent *)self connectToMemCacheDriver];
    if (self->_memCacheDriverConn)
    {
      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(input[0]) = 138412290;
        *(uint64_t *)((char *)input + 4) = (uint64_t)v6;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Enabling data collection for app: %@", (uint8_t *)input, 0xCu);
      }

      *(_OWORD *)input = xmmword_1D2B02C60;
      [(PLIOReportAgent *)self setCollectionEnabled:1];
      IOConnectCallScalarMethod(self->_memCacheDriverConn, 0xEu, input, 2u, 0, 0);
      dispatch_time_t v9 = dispatch_time(0, 6096000000);
      double v10 = [(PLOperator *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__PLIOReportAgent_triggerMemCacheLogging_withDelay___block_invoke;
      block[3] = &unk_1E692CE00;
      void block[4] = self;
      uint64_t v13 = 6096000000;
      id v12 = v6;
      dispatch_after(v9, v10, block);
    }
  }
}

uint64_t __52__PLIOReportAgent_triggerMemCacheLogging_withDelay___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) fgAppChangedSince:*(void *)(a1 + 48) / 0x3B9ACA00uLL] & 1) == 0)
  {
    uint64_t v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "Reading collected samples for app: %@", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 32) readAndLogMemCacheStats];
    int v3 = [*(id *)(a1 + 32) sampledBundleIDs];
    [v3 addObject:*(void *)(a1 + 40)];

    double v4 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(a1 + 32) setLastSampleDate:v4];
  }
  char v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138412290;
    uint64_t v10 = v7;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Disabling data collection for app: %@", (uint8_t *)&v9, 0xCu);
  }

  IOConnectCallScalarMethod(*(_DWORD *)(*(void *)(a1 + 32) + 52), 0xFu, 0, 0, 0, 0);
  return [*(id *)(a1 + 32) setCollectionEnabled:0];
}

- (void)logEventBackwardMemCacheStats:(id)a3
{
  double v4 = [(PLIOReportAgent *)self allowSamplingMemCacheStats:a3];
  if (v4)
  {
    if (arc4random_uniform(2u))
    {
      dispatch_time_t v5 = dispatch_time(0, 10000000000);
      id v6 = [(PLOperator *)self workQueue];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      _DWORD v7[2] = __49__PLIOReportAgent_logEventBackwardMemCacheStats___block_invoke;
      v7[3] = &unk_1E692B128;
      v7[4] = self;
      id v8 = v4;
      dispatch_after(v5, v6, v7);
    }
    else
    {
      [(PLIOReportAgent *)self triggerMemCacheLogging:v4 withDelay:0];
    }
  }
}

uint64_t __49__PLIOReportAgent_logEventBackwardMemCacheStats___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerMemCacheLogging:*(void *)(a1 + 40) withDelay:10];
}

- (void)logEventForwardMemCacheLabels
{
  kern_return_t v5;
  kern_return_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  size_t outputStructCnt;
  uint8_t buf[4];
  kern_return_t v18;
  uint8_t outputStruct[2056];
  uint64_t v20;

  int v20 = *MEMORY[0x1E4F143B8];
  int v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)outputStruct = 0;
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "Log MemCache Labels", outputStruct, 2u);
  }

  [(PLIOReportAgent *)self connectToMemCacheDriver];
  mach_port_t memCacheDriverConn = self->_memCacheDriverConn;
  if (memCacheDriverConn)
  {
    outputStructCnt = 2048;
    dispatch_time_t v5 = IOConnectCallStructMethod(memCacheDriverConn, 0x10u, 0, 0, outputStruct, &outputStructCnt);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v18 = v6;
        _os_log_error_impl(&dword_1D2690000, v7, OS_LOG_TYPE_ERROR, "Failed to get the data header with ret: 0x%x\n", buf, 8u);
      }
    }
    else
    {
      uint64_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"MemCacheLabels"];
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
      int v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", outputStruct);
      uint64_t v10 = [v9 componentsSeparatedByString:@","];
      if ([v10 count])
      {
        uint64_t v11 = 0;
        do
        {
          id v12 = [v10 objectAtIndexedSubscript:v11];
          uint64_t v13 = [v12 length];

          if (v13)
          {
            IOReturn v14 = +[PLIOReportAgent keyForSubBlock:v11];
            uint64_t v15 = [v10 objectAtIndexedSubscript:v11];
            [v8 setObject:v15 forKeyedSubscript:v14];
          }
          ++v11;
        }
        while ([v10 count] > v11);
      }
      [(PLOperator *)self logEntry:v8];
    }
  }
}

uint64_t __35__PLIOReportAgent_modelAPSoCPower___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD583E5 = result;
  return result;
}

- (void)modelPMPAPSocPower:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [MEMORY[0x1E4F92A38] isHomePod];
  if (v3 && (v4 & 1) == 0)
  {
    dispatch_time_t v5 = [v3 objectForKeyedSubscript:@"SampleTime"];
    [v5 doubleValue];
    double v7 = v6;

    id v8 = [v3 entryDate];
    int v9 = [v8 dateByAddingTimeInterval:-v7];

    uint64_t v10 = [v3 entryDate];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v11 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__PLIOReportAgent_modelPMPAPSocPower___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v11;
      if (qword_1EBD584E0 != -1) {
        dispatch_once(&qword_1EBD584E0, block);
      }
      if (byte_1EBD583E6)
      {
        id v12 = [NSString stringWithFormat:@"lastSampleDate=%@, currentSampleDate=%@, sampleTime=%f", v9, v10, *(void *)&v7];
        uint64_t v13 = (void *)MEMORY[0x1E4F929B8];
        IOReturn v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLIOReportAgent.m"];
        uint64_t v15 = [v14 lastPathComponent];
        uint32_t v16 = [NSString stringWithUTF8String:"-[PLIOReportAgent modelPMPAPSocPower:]"];
        [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:11408];

        id v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v83 = (uint64_t)v12;
          _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    int v18 = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
    if (v18 == 1001010)
    {
      int v19 = [v3 objectForKeyedSubscript:@"DRAM"];

      if (!v19)
      {
LABEL_66:

        goto LABEL_67;
      }
      int v20 = [v3 objectForKeyedSubscript:@"DRAM"];
      [v20 doubleValue];
      double v22 = v21;

      double v23 = [MEMORY[0x1E4F92900] sharedInstance];
      [v23 createPowerEventIntervalWithRootNodeID:9 withPower:v9 withStartDate:v10 withEndDate:v22 / v7];
    }
    else
    {
      int v74 = v18;
      [(id)objc_opt_class() energyKeyToRootNodeID];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      uint64_t v75 = v79 = 0u;
      uint64_t v24 = [v75 allKeys];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v76 objects:v81 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v77;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v77 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v76 + 1) + 8 * v28);
            uint64_t v30 = [v3 objectForKeyedSubscript:v29];

            if (v30)
            {
              __int16 v31 = [v75 objectForKeyedSubscript:v29];
              uint64_t v32 = [v3 objectForKeyedSubscript:v29];
              [v32 doubleValue];
              double v34 = v33;

              double v35 = v34 / v7;
              switch(v74)
              {
                case 1001011:
                  int v36 = [v31 intValue];
                  double v37 = v35 * 1.5;
                  goto LABEL_34;
                case 1001013:
                  if ([v31 intValue] == 7
                    && (([MEMORY[0x1E4F92A38] isDeviceClass:100062] & 1) != 0
                     || [MEMORY[0x1E4F92A38] isDeviceClass:100063]))
                  {
                    double v35 = v35 + v35;
                  }
                  break;
                case 1001014:
                  if ([v31 intValue] == 7)
                  {
                    if (([MEMORY[0x1E4F92A38] isDeviceClass:100052] & 1) != 0
                      || ([MEMORY[0x1E4F92A38] isDeviceClass:100053] & 1) != 0
                      || ([MEMORY[0x1E4F92A38] isDeviceClass:102034] & 1) != 0
                      || ([MEMORY[0x1E4F92A38] isDeviceClass:102035] & 1) != 0
                      || [MEMORY[0x1E4F92A38] isDeviceClass:102036])
                    {
                      double v35 = v35 * 4.0;
                    }
                    else if ([MEMORY[0x1E4F92A38] isDeviceClass:102037])
                    {
                      double v35 = v35 * 1.25;
                    }
                  }
                  break;
                case 1001015:
                  int v36 = [v31 intValue];
                  double v37 = v35 + v35;
                  goto LABEL_34;
                case 1001021:
                  int v36 = [v31 intValue];
                  double v37 = v35 * 1.27;
LABEL_34:
                  if (v36 == 7) {
                    double v35 = v37;
                  }
                  break;
                default:
                  break;
              }
              if ([v31 intValue] == 54)
              {
                BOOL v38 = PLLogCommon();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  uint64_t v83 = 0x403E000000000000;
                  _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "Adjusting APSOCBase power to default value: %f", buf, 0xCu);
                }

                double v35 = 30.0;
              }
              BOOL v39 = [MEMORY[0x1E4F92900] sharedInstance];
              objc_msgSend(v39, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", objc_msgSend(v31, "intValue"), v9, v10, v35);

              if ([v31 intValue] == 54)
              {
                BOOL v40 = [MEMORY[0x1E4F92900] sharedInstance];
                [v40 createQualificationEventIntervalWithQualificationID:13 withChildNodeNames:&unk_1F29ED910 withStartDate:v9 withEndDate:v10];
              }
            }
            ++v28;
          }
          while (v26 != v28);
          uint64_t v41 = [v24 countByEnumeratingWithState:&v76 objects:v81 count:16];
          uint64_t v26 = v41;
        }
        while (v41);
      }

      uint64_t v42 = [v3 objectForKeyedSubscript:@"DRAM"];
      if (v42)
      {
        BOOL v43 = (void *)v42;
        uint64_t v44 = [v3 objectForKeyedSubscript:@"DCS"];

        if (v44)
        {
          BOOL v45 = [v3 objectForKeyedSubscript:@"DRAM"];
          [v45 doubleValue];
          double v47 = v46;
          id v48 = [v3 objectForKeyedSubscript:@"DCS"];
          [v48 doubleValue];
          double v50 = v47 + v49;

          int v51 = [MEMORY[0x1E4F92900] sharedInstance];
          [v51 createPowerEventIntervalWithRootNodeID:9 withPower:v9 withStartDate:v10 withEndDate:v50 / v7];
        }
      }
      uint64_t v52 = [v3 objectForKeyedSubscript:@"ECPU"];
      if (v52)
      {
        uint64_t v53 = (void *)v52;
        uint64_t v54 = [v3 objectForKeyedSubscript:@"PCPU"];

        if (v54)
        {
          BOOL v55 = [v3 objectForKeyedSubscript:@"ECPU"];
          [v55 doubleValue];
          double v57 = v56;
          long long v58 = [v3 objectForKeyedSubscript:@"PCPU"];
          [v58 doubleValue];
          double v60 = v57 + v59;

          if (v74 == 1001011) {
            double v61 = v60 / v7 * 1.4;
          }
          else {
            double v61 = v60 / v7;
          }
          BOOL v62 = [MEMORY[0x1E4F92900] sharedInstance];
          [v62 createPowerEventIntervalWithRootNodeID:2 withPower:v9 withStartDate:v10 withEndDate:v61];
        }
      }
      uint64_t v63 = [v3 objectForKeyedSubscript:@"DISP"];
      if (v63
        && (BOOL v64 = (void *)v63,
            [v3 objectForKeyedSubscript:@"MSR"],
            uint64_t v65 = objc_claimAutoreleasedReturnValue(),
            v65,
            v64,
            v65))
      {
        BOOL v66 = [v3 objectForKeyedSubscript:@"DISP"];
        [v66 doubleValue];
        double v68 = v67;
        uint64_t v69 = [v3 objectForKeyedSubscript:@"MSR"];
        [v69 doubleValue];
        double v71 = v68 + v70;

        double v72 = v71 / v7;
        if (([MEMORY[0x1E4F92A38] isDeviceClass:100052] & 1) != 0
          || [MEMORY[0x1E4F92A38] isDeviceClass:100053])
        {
          double v72 = v72 + v72;
        }
        double v23 = v75;
        uint64_t v73 = [MEMORY[0x1E4F92900] sharedInstance];
        [v73 createPowerEventIntervalWithRootNodeID:57 withPower:v9 withStartDate:v10 withEndDate:v72];
      }
      else
      {
        double v23 = v75;
      }
    }

    goto LABEL_66;
  }
LABEL_67:
}

uint64_t __38__PLIOReportAgent_modelPMPAPSocPower___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD583E6 = result;
  return result;
}

uint64_t __40__PLIOReportAgent_energyKeyToRootNodeID__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v1 = (void *)qword_1EBD584F0;
  qword_1EBD584F0 = v0;

  int v2 = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
  if (v2 >= 1001003)
  {
    unsigned int v6 = v2;
    if (v2 >= 0xF4633)
    {
      if (v2 >= 0xF4638)
      {
        [(id)qword_1EBD584F0 setObject:&unk_1F29E5D10 forKeyedSubscript:@"AVE"];
        [(id)qword_1EBD584F0 setObject:&unk_1F29E5D28 forKeyedSubscript:@"VDEC"];
        [(id)qword_1EBD584F0 setObject:&unk_1F29E5650 forKeyedSubscript:@"ISP"];
        [(id)qword_1EBD584F0 setObject:&unk_1F29E5B48 forKeyedSubscript:@"SOC_AON"];
        if (v6 >= 0xF463C) {
          id v8 = @"AMCC";
        }
        else {
          id v8 = @"SOC_REST";
        }
        [(id)qword_1EBD584F0 setObject:&unk_1F29E5CF8 forKeyedSubscript:v8];
        [(id)qword_1EBD584F0 setObject:&unk_1F29E5D40 forKeyedSubscript:@"GPU"];
        id v3 = &unk_1F29E5D88;
        char v4 = (void *)qword_1EBD584F0;
        dispatch_time_t v5 = @"ANE";
      }
      else
      {
        [(id)qword_1EBD584F0 setObject:&unk_1F29E5D10 forKeyedSubscript:@"VENC"];
        [(id)qword_1EBD584F0 setObject:&unk_1F29E5D28 forKeyedSubscript:@"VDEC"];
        [(id)qword_1EBD584F0 setObject:&unk_1F29E5650 forKeyedSubscript:@"ISP"];
        [(id)qword_1EBD584F0 setObject:&unk_1F29E5B48 forKeyedSubscript:@"SOC_AON"];
        [(id)qword_1EBD584F0 setObject:&unk_1F29E5CF8 forKeyedSubscript:@"SOC_REST"];
        id v3 = &unk_1F29E5D40;
        char v4 = (void *)qword_1EBD584F0;
        dispatch_time_t v5 = @"GPU Energy";
      }
    }
    else
    {
      [(id)qword_1EBD584F0 setObject:&unk_1F29E5D10 forKeyedSubscript:@"VENC Energy"];
      [(id)qword_1EBD584F0 setObject:&unk_1F29E5D28 forKeyedSubscript:@"VDEC Energy"];
      [(id)qword_1EBD584F0 setObject:&unk_1F29E5650 forKeyedSubscript:@"ISP Energy"];
      [(id)qword_1EBD584F0 setObject:&unk_1F29E5B48 forKeyedSubscript:@"SoC Base Energy"];
      [(id)qword_1EBD584F0 setObject:&unk_1F29E5CF8 forKeyedSubscript:@"Rest of SoC Energy"];
      [(id)qword_1EBD584F0 setObject:&unk_1F29E5D40 forKeyedSubscript:@"GPU Energy"];
      uint64_t result = [(id)qword_1EBD584F0 setObject:&unk_1F29E5D58 forKeyedSubscript:@"CPU Energy"];
      if (v6 - 1001004 > 5) {
        return result;
      }
      id v3 = &unk_1F29E5D70;
      char v4 = (void *)qword_1EBD584F0;
      dispatch_time_t v5 = @"DRAM Energy";
    }
  }
  else
  {
    id v3 = &unk_1F29E5CF8;
    char v4 = (void *)qword_1EBD584F0;
    dispatch_time_t v5 = @"SoC Energy";
  }
  return [v4 setObject:v3 forKeyedSubscript:v5];
}

- (void)logSnapshotValues:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [v4 objectForKey:@"IOReportChannelGroups"];
  unsigned int v6 = [v5 allKeys];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__PLIOReportAgent_logSnapshotValues___block_invoke;
  void v8[3] = &unk_1E692CDD8;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __37__PLIOReportAgent_logSnapshotValues___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKey:@"IOReportChannelGroups"];
  dispatch_time_t v5 = [v4 objectForKey:v3];

  if ([v3 isEqualToString:@"AOP"])
  {
    [*(id *)(a1 + 40) logEventPointIOReportSaturation:v5];
  }
  else
  {
    unsigned int v6 = [v5 objectForKey:@"IOReportChannelGroups"];
    id v7 = [v6 allKeys];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__PLIOReportAgent_logSnapshotValues___block_invoke_2;
    void v10[3] = &unk_1E692CE28;
    id v11 = v5;
    id v8 = v3;
    uint64_t v9 = *(void *)(a1 + 40);
    id v12 = v8;
    uint64_t v13 = v9;
    [v7 enumerateObjectsUsingBlock:v10];
  }
}

void __37__PLIOReportAgent_logSnapshotValues___block_invoke_2(id *a1, void *a2)
{
  id v5 = a2;
  id v3 = [a1[4] objectForKey:@"IOReportChannelGroups"];
  id v4 = [v3 objectForKey:v5];

  if ([a1[5] isEqualToString:@"SoC Stats"]
    && [v5 isEqualToString:@"Events"])
  {
    [a1[6] logSOCHOT0Snapshot:v4];
  }
  else if ([a1[5] isEqualToString:@"NULL"] {
         && [v5 isEqualToString:@"NULL"])
  }
  {
    [a1[6] logDroopSnapshot:v4];
  }
}

- (void)logSOCHOT0Snapshot:(id)a3
{
  id v4 = a3;
  if (+[PLIOReportAgent shouldLogSoCStats])
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"SoCStatsEventsRaw"];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
    id v6 = v7;
    IOReportIterate();
    [(PLOperator *)self logEntry:v6];
  }
}

uint64_t __38__PLIOReportAgent_logSOCHOT0Snapshot___block_invoke(uint64_t a1)
{
  int v2 = IOReportChannelGetChannelName();
  if ([v2 isEqualToString:@"SOCHOT0"]
    && IOReportStateGetCount() == 2)
  {
    id v3 = [NSNumber numberWithUnsignedLongLong:IOReportStateGetResidency()];
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"SOCHOT0_ACT"];

    id v4 = [NSNumber numberWithUnsignedLongLong:IOReportStateGetInTransitions()];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"SOCHOT0_Transitions"];
  }
  return 0;
}

+ (BOOL)shouldLogSoCStats
{
  if (qword_1EBD584F8 != -1) {
    dispatch_once(&qword_1EBD584F8, &__block_literal_global_9718);
  }
  return byte_1EBD583E7;
}

uint64_t __36__PLIOReportAgent_shouldLogSoCStats__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isArchARM];
  byte_1EBD583E7 = result;
  return result;
}

+ (BOOL)shouldLogDCPScanoutStats
{
  if (qword_1EBD58500 != -1) {
    dispatch_once(&qword_1EBD58500, &__block_literal_global_9720);
  }
  return byte_1EBD583E8;
}

uint64_t __43__PLIOReportAgent_shouldLogDCPScanoutStats__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isiPhone];
  if (result)
  {
    uint64_t result = [MEMORY[0x1E4F92A38] hasDCP];
    if (result) {
      uint64_t result = MGGetBoolAnswer();
    }
  }
  byte_1EBD583E8 = result;
  return result;
}

+ (BOOL)hasPlatinumCapability
{
  if (qword_1EBD58508 != -1) {
    dispatch_once(&qword_1EBD58508, &__block_literal_global_9725);
  }
  return byte_1EBD583E9;
}

uint64_t __40__PLIOReportAgent_hasPlatinumCapability__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EBD583E9 = result;
  return result;
}

+ (BOOL)hasAOPSupport
{
  if (qword_1EBD58510 != -1) {
    dispatch_once(&qword_1EBD58510, &__block_literal_global_9730);
  }
  return byte_1EBD583EA;
}

uint64_t __32__PLIOReportAgent_hasAOPSupport__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EBD583EA = result;
  return result;
}

+ (BOOL)hasAOMSupport
{
  if (qword_1EBD58518 != -1) {
    dispatch_once(&qword_1EBD58518, &__block_literal_global_9735);
  }
  return byte_1EBD583EB;
}

uint64_t __32__PLIOReportAgent_hasAOMSupport__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isWatch];
  if (result) {
    uint64_t result = MGGetBoolAnswer();
  }
  byte_1EBD583EB = result;
  return result;
}

+ (BOOL)hasMesa
{
  if (qword_1EBD58520 != -1) {
    dispatch_once(&qword_1EBD58520, &__block_literal_global_9740);
  }
  return byte_1EBD583EC;
}

uint64_t __26__PLIOReportAgent_hasMesa__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EBD583EC = result;
  return result;
}

+ (BOOL)shouldLogOpticalInterfaceStats
{
  return 0;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChangedNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBatteryLevelChangedNotifications:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)screenstateChangedNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setScreenstateChangedNotifications:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)displayOffNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisplayOffNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)displayOnNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDisplayOnNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)displayStateChangeNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDisplayStateChangeNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)wakeNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWakeNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)sleepNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSleepNotification:(id)a3
{
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
}

- (PLNSNotificationOperatorComposition)enhancedScreenStateChangeListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setEnhancedScreenStateChangeListener:(id)a3
{
}

- (void)setSampleChannelsSignificantBattery:(id)a3
{
}

- (void)setSampleChannelsHalfHour:(id)a3
{
}

- (void)setSampleChannelsDaily:(id)a3
{
}

- (NSMutableDictionary)sampleChannelsAudioEvent
{
  return self->_sampleChannelsAudioEvent;
}

- (void)setSampleChannelsAudioEvent:(id)a3
{
}

- (NSMutableDictionary)sampleChannelsScreenState
{
  return self->_sampleChannelsScreenState;
}

- (void)setSampleChannelsScreenState:(id)a3
{
}

- (NSMutableDictionary)sampleChannelsWake
{
  return self->_sampleChannelsWake;
}

- (void)setSampleChannelsWake:(id)a3
{
}

- (NSMutableDictionary)sampleChannelsSnapshot
{
  return self->_sampleChannelsSnapshot;
}

- (void)setSampleChannelsSnapshot:(id)a3
{
}

- (NSMutableDictionary)sampleChannelsDisplayStateChange
{
  return self->_sampleChannelsDisplayStateChange;
}

- (void)setSampleChannelsDisplayStateChange:(id)a3
{
}

- (NSDictionary)entryTransformation
{
  return self->_entryTransformation;
}

- (void)setEntryTransformation:(id)a3
{
}

- (PLIOKitOperatorComposition)iokitAging
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (PLIOKitOperatorComposition)iokitAudio
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 208, 1);
}

- (unsigned)memCacheDriverConn
{
  return self->_memCacheDriverConn;
}

- (void)setMemCacheDriverConn:(unsigned int)a3
{
  self->_mach_port_t memCacheDriverConn = a3;
}

- (NSMutableArray)sampledBundleIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSampledBundleIDs:(id)a3
{
}

- (NSString)lastFgApp
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setLastFgApp:(id)a3
{
}

- (NSDate)lastFgAppSwitch
{
  return (NSDate *)objc_getProperty(self, a2, 232, 1);
}

- (void)setLastFgAppSwitch:(id)a3
{
}

- (BOOL)collectionEnabled
{
  return self->_collectionEnabled;
}

- (void)setCollectionEnabled:(BOOL)a3
{
  self->_collectionEnabled = a3;
}

- (NSDate)lastSampleDate
{
  return (NSDate *)objc_getProperty(self, a2, 240, 1);
}

- (void)setLastSampleDate:(id)a3
{
}

- (int64_t)AOPTotalThreadTime
{
  return self->_AOPTotalThreadTime;
}

- (PLMonotonicTimer)displayOffTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 256, 1);
}

- (void)setDisplayOffTimer:(id)a3
{
}

- (PLIOReportAgentIOReportStats)SoCIOReportStats
{
  return (PLIOReportAgentIOReportStats *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSoCIOReportStats:(id)a3
{
}

- (PLStateTrackingComposition)stateTracker
{
  return (PLStateTrackingComposition *)objc_getProperty(self, a2, 272, 1);
}

- (void)setStateTracker:(id)a3
{
}

- (PLIOReportStats)deviceStates
{
  return (PLIOReportStats *)objc_getProperty(self, a2, 280, 1);
}

- (void)setDeviceStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceStates, 0);
  objc_storeStrong((id *)&self->_stateTracker, 0);
  objc_storeStrong((id *)&self->_SoCIOReportStats, 0);
  objc_storeStrong((id *)&self->_displayOffTimer, 0);
  objc_storeStrong((id *)&self->_lastSampleDate, 0);
  objc_storeStrong((id *)&self->_lastFgAppSwitch, 0);
  objc_storeStrong((id *)&self->_lastFgApp, 0);
  objc_storeStrong((id *)&self->_sampledBundleIDs, 0);
  objc_storeStrong((id *)&self->_iokitAudio, 0);
  objc_storeStrong((id *)&self->_iokitAging, 0);
  objc_storeStrong((id *)&self->_entryTransformation, 0);
  objc_storeStrong((id *)&self->_sampleChannelsDisplayStateChange, 0);
  objc_storeStrong((id *)&self->_sampleChannelsSnapshot, 0);
  objc_storeStrong((id *)&self->_sampleChannelsWake, 0);
  objc_storeStrong((id *)&self->_sampleChannelsScreenState, 0);
  objc_storeStrong((id *)&self->_sampleChannelsAudioEvent, 0);
  objc_storeStrong((id *)&self->_sampleChannelsDaily, 0);
  objc_storeStrong((id *)&self->_sampleChannelsHalfHour, 0);
  objc_storeStrong((id *)&self->_sampleChannelsSignificantBattery, 0);
  objc_storeStrong((id *)&self->_enhancedScreenStateChangeListener, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_sleepNotification, 0);
  objc_storeStrong((id *)&self->_wakeNotification, 0);
  objc_storeStrong((id *)&self->_displayStateChangeNotification, 0);
  objc_storeStrong((id *)&self->_displayOnNotification, 0);
  objc_storeStrong((id *)&self->_displayOffNotification, 0);
  objc_storeStrong((id *)&self->_screenstateChangedNotifications, 0);
  objc_storeStrong((id *)&self->_batteryLevelChangedNotifications, 0);
}

@end