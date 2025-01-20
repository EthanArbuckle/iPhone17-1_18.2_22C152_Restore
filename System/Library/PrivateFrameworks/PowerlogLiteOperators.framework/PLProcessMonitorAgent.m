@interface PLProcessMonitorAgent
+ (BOOL)enableThreadStatsLogging;
+ (id)defaults;
+ (id)entryEventBackwardAppLaunchTimeSeries;
+ (id)entryEventBackwardDefinitionThreadStats;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventBackwardProcessExitHistogram;
+ (id)entryEventForwardAppResumeInferredCarry;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventForwardProcessID;
+ (id)entryEventIntervalDefinitionKernelTaskMonitor;
+ (id)entryEventIntervalDefinitionProcessMonitorDiff;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointAppNapEnabled;
+ (id)entryEventPointAppNotFrozen;
+ (id)entryEventPointAppResumePredictions;
+ (id)entryEventPointDefinitions;
+ (id)entryEventPointFreezerDemotion;
+ (id)entryEventPointFreezerStats;
+ (id)entryEventPointMemoryTracking;
+ (id)entryEventPointProcessExit;
+ (id)entryEventPointProcessSnapshot;
+ (id)entryEventPointSharedCacheReslid;
+ (id)entryEventPointSystemFreezerStats;
+ (unint64_t)PIDToCoalitionID:(int)a3;
+ (void)load;
- (BOOL)firstBoot;
- (BOOL)launchServiceStatsEnabled;
- (NSDate)currentCachedDate;
- (NSDate)lastEntryDate;
- (NSDate)previousCacheDate;
- (NSDictionary)diffFreezerProcs;
- (NSDictionary)lastCPUTimeDict;
- (NSDictionary)lastFreezerProcs;
- (NSDictionary)lastThreadIdToKTMonitorEntryDict;
- (NSMutableSet)processes;
- (PLEntryNotificationOperatorComposition)batteryLevelChanged;
- (PLMonotonicTimer)logTimer;
- (PLNSNotificationOperatorComposition)asertionNotifications;
- (PLProcessMonitorAgent)init;
- (PLThreadStats)threadStats;
- (PLXPCListenerOperatorComposition)appNotFrozenListener;
- (PLXPCListenerOperatorComposition)appResumeInferredCarryListener;
- (PLXPCListenerOperatorComposition)appResumePredictionsListener;
- (PLXPCResponderOperatorComposition)hudKillsResponder;
- (PLXPCResponderOperatorComposition)memoryKillsResponder;
- (double)currentCachedTotalCPUTime;
- (id)eventForwardProcessIDForPID:(int)a3;
- (id)fetchSnapshotWithFlags:(unsigned int)a3;
- (id)getAllProcessExitsInLastHour;
- (id)getFrozenProcesses;
- (id)getJSEIdleTime;
- (id)getJetsamSnapshotEntries:(jetsam_snapshot *)a3;
- (id)getProcessExits:(id)a3;
- (id)getProcessName:(char *)a3;
- (id)getProcessesNotInFreezer:(id)a3 withCurrentProcesses:(id)a4;
- (id)ledgerDataAtIndex:(int)a3 forPid:(int64_t)a4;
- (id)processMonitorMultiKeyFromProcessID:(int)a3;
- (int)getFrozenToSwapLedgerIndex:(int64_t)a3;
- (int)getLedgerIndex:(int64_t)a3 forKey:(id)a4;
- (int)getProcDirtyTimeLedgerIndex:(int64_t)a3;
- (int)get_kthread_list:(unint64_t *)a3;
- (int64_t)processExitSummaryCount;
- (void)disableProcessExitLogging;
- (void)enableProcessExitLogging;
- (void)getCpuUsageAndMemoryForPid:(int)a3 withBuffer:(void *)a4 withNewProcessArray:(id)a5 withTotalCpu:(unint64_t *)a6 withActiveProcesses:(id)a7;
- (void)initOperatorDependancies;
- (void)initializeThreadStatsLogging;
- (void)log;
- (void)logEventBackwardAppLaunchTimeSeries:(id)a3;
- (void)logEventBackwardProcessExitHistogram:(id)a3 withStats:(id *)a4 withDate:(id)a5;
- (void)logEventForwardAppResumeInferredCarry:(id)a3;
- (void)logEventIntervalKernelTaskMonitor;
- (void)logEventIntervalProcessMonitorInterval;
- (void)logEventIntervalProcessMonitorIntervalUsingCache;
- (void)logEventPointAppNapEnabled;
- (void)logEventPointAppNotFrozen:(id)a3;
- (void)logEventPointAppResumePredictions:(id)a3;
- (void)logEventPointFreezerDemotion;
- (void)logEventPointFreezerStats;
- (void)logEventPointMemoryTracking;
- (void)logEventPointProcessExit:(id)a3 excludeProcesses:(id)a4 withStats:(id *)a5 withDate:(id)a6 withNowInSec:(unint64_t)a7;
- (void)logEventPointProcessSnapshot;
- (void)logEventPointSharedCacheReslid:(int)a3;
- (void)logEventPointSystemFreezerStats;
- (void)logProcDirtyStats;
- (void)logProcessExit;
- (void)logThreadStats;
- (void)processesOfInterest:(id)a3;
- (void)setAppNotFrozenListener:(id)a3;
- (void)setAppResumeInferredCarryListener:(id)a3;
- (void)setAppResumePredictionsListener:(id)a3;
- (void)setAsertionNotifications:(id)a3;
- (void)setBatteryLevelChanged:(id)a3;
- (void)setCurrentCachedDate:(id)a3;
- (void)setCurrentCachedTotalCPUTime:(double)a3;
- (void)setDiffFreezerProcs:(id)a3;
- (void)setFirstBoot:(BOOL)a3;
- (void)setHudKillsResponder:(id)a3;
- (void)setLastCPUTimeDict:(id)a3;
- (void)setLastEntryDate:(id)a3;
- (void)setLastFreezerProcs:(id)a3;
- (void)setLastThreadIdToKTMonitorEntryDict:(id)a3;
- (void)setLaunchServiceStatsEnabled:(BOOL)a3;
- (void)setLogTimer:(id)a3;
- (void)setMemoryKillsResponder:(id)a3;
- (void)setPreviousCacheDate:(id)a3;
- (void)setProcessExitSummaryCount:(int64_t)a3;
- (void)setProcesses:(id)a3;
- (void)setThreadStats:(id)a3;
- (void)updateProcessExitSummary;
- (void)updateProcessMonitorCache;
@end

@implementation PLProcessMonitorAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLProcessMonitorAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v16[10] = *MEMORY[0x1E4F143B8];
  v15[0] = @"MemoryTracking";
  v14 = [a1 entryEventPointMemoryTracking];
  v16[0] = v14;
  v15[1] = @"ProcessSnapshot";
  v3 = [a1 entryEventPointProcessSnapshot];
  v16[1] = v3;
  v15[2] = @"ProcessExit";
  v4 = [a1 entryEventPointProcessExit];
  v16[2] = v4;
  v15[3] = @"FreezerStats";
  v5 = [a1 entryEventPointFreezerStats];
  v16[3] = v5;
  v15[4] = @"FreezerDemotion";
  v6 = [a1 entryEventPointFreezerDemotion];
  v16[4] = v6;
  v15[5] = @"SharedCacheReslid";
  v7 = [a1 entryEventPointSharedCacheReslid];
  v16[5] = v7;
  v15[6] = @"AppResumePredictions";
  v8 = [a1 entryEventPointAppResumePredictions];
  v16[6] = v8;
  v15[7] = @"AppNotFrozen";
  v9 = [a1 entryEventPointAppNotFrozen];
  v16[7] = v9;
  v15[8] = @"SystemFreezerStats";
  v10 = [a1 entryEventPointSystemFreezerStats];
  v16[8] = v10;
  v15[9] = @"AppNapEnabled";
  v11 = [a1 entryEventPointAppNapEnabled];
  v16[9] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:10];

  return v12;
}

+ (id)entryEventPointMemoryTracking
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v24[0] = *MEMORY[0x1E4F92C50];
  uint64_t v22 = *MEMORY[0x1E4F92CD0];
  v23 = &unk_1F29F0C40;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v25[0] = v19;
  v24[1] = *MEMORY[0x1E4F92CA8];
  v20[0] = @"HeapTotal";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
  v21[0] = v17;
  v20[1] = @"HeapUsed";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_RealFormat");
  v21[1] = v15;
  v20[2] = @"HeapFree";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_RealFormat");
  v21[2] = v13;
  v20[3] = @"MallocBlocks";
  objc_super v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v21[3] = v3;
  v20[4] = @"MallocSize";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
  v21[4] = v5;
  v20[5] = @"MallocMaxSize";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
  v21[5] = v7;
  v20[6] = @"MallocAllocated";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
  v21[6] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];
  v25[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

  return v11;
}

+ (id)entryEventPointProcessSnapshot
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v18[0] = *MEMORY[0x1E4F92CD0];
  v18[1] = v2;
  v19[0] = &unk_1F29F0C40;
  v19[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F92CE8];
  v18[2] = *MEMORY[0x1E4F92CB8];
  v18[3] = v3;
  v19[2] = MEMORY[0x1E4F1CC28];
  v19[3] = MEMORY[0x1E4F1CC38];
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E4F92CA8];
  v16[0] = @"PID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v17[0] = v5;
  v16[1] = @"BundleID";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v17[1] = v7;
  v16[2] = @"PhyFootprint";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v17[2] = v9;
  v16[3] = @"StartOrder";
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v17[3] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  v21[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v13;
}

+ (id)entryEventPointProcessExit
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v25[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v23[0] = *MEMORY[0x1E4F92CD0];
  v23[1] = v2;
  v24[0] = &unk_1F29F0C50;
  v24[1] = MEMORY[0x1E4F1CC38];
  v23[2] = *MEMORY[0x1E4F92C08];
  void v24[2] = MEMORY[0x1E4F1CC38];
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E4F92CA8];
  v21[0] = @"PID";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v22[0] = v18;
  v21[1] = @"ProcessName";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_StringFormat_withProcessName");
  v22[1] = v16;
  v21[2] = @"timeSinceSpawn";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v22[2] = v14;
  v21[3] = @"lastTimeToRelaunch";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v22[3] = v4;
  void v21[4] = @"ReasonNamespace";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v22[4] = v6;
  v21[5] = @"ReasonCode";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v22[5] = v8;
  v21[6] = @"JetsamPriority";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v22[6] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
  v26[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v12;
}

+ (id)entryEventPointSystemFreezerStats
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v25[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v23[0] = *MEMORY[0x1E4F92CD0];
  v23[1] = v2;
  v24[0] = &unk_1F29F0C40;
  v24[1] = MEMORY[0x1E4F1CC38];
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E4F92CA8];
  v21[0] = @"RemainingPages";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v22[0] = v18;
  v21[1] = @"ThawCount";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v22[1] = v16;
  v21[2] = @"ThawPercentage";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v22[2] = v14;
  v21[3] = @"RefreezeAvgBytes";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v22[3] = v4;
  void v21[4] = @"ThawsPerGB";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v22[4] = v6;
  v21[5] = @"SwapTotal";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v22[5] = v8;
  v21[6] = @"SwapUsed";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v22[6] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
  v26[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v12;
}

+ (id)entryEventPointFreezerStats
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F29F0C40;
  v20[1] = MEMORY[0x1E4F1CC38];
  v19[2] = *MEMORY[0x1E4F92C08];
  void v20[2] = MEMORY[0x1E4F1CC38];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"PID";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v18[0] = v14;
  v17[1] = @"ProcessName";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat_withProcessName");
  v18[1] = v4;
  v17[2] = @"Credits";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v18[2] = v6;
  v17[3] = @"Debits";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v18[3] = v8;
  void v17[4] = @"Balance";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  void v18[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventPointFreezerDemotion
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0C40;
  v14[1] = MEMORY[0x1E4F1CC38];
  v13[2] = *MEMORY[0x1E4F92C08];
  v14[2] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"PID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"ProcessName";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat_withProcessName");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointSharedCacheReslid
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0C40;
  v14[1] = MEMORY[0x1E4F1CC38];
  v13[2] = *MEMORY[0x1E4F92C08];
  v14[2] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"PID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"ProcessName";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat_withProcessName");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointAppResumePredictions
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F0C40;
  v16[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"BundleID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v14[0] = v5;
  v13[1] = @"PredictionScore";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
  v14[1] = v7;
  v13[2] = @"PredictionType";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v14[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventPointAppNotFrozen
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F0C40;
  v16[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"BundleID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v14[0] = v5;
  v13[1] = @"PID";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  v13[2] = @"Reason";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v14[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventPointAppNapEnabled
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0C40;
  v12[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"PID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"ProcessID";
  uint64_t v3 = [a1 entryEventForwardProcessID];
  v7[1] = @"AppResumeInferredCarry";
  v8[0] = v3;
  v4 = [a1 entryEventForwardAppResumeInferredCarry];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventForwardProcessID
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v18[0] = *MEMORY[0x1E4F92CD0];
  v18[1] = v2;
  v19[0] = &unk_1F29F0C50;
  v19[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92C08];
  v18[2] = *MEMORY[0x1E4F92C40];
  void v18[3] = v3;
  v19[2] = MEMORY[0x1E4F1CC38];
  void v19[3] = MEMORY[0x1E4F1CC38];
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E4F92CA8];
  v16[0] = @"PID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v17[0] = v5;
  v16[1] = @"BundleID";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v17[1] = v7;
  void v16[2] = @"ProcessName";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat_withProcessName");
  void v17[2] = v9;
  void v16[3] = @"CoalitionID";
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v17[3] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  v21[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v13;
}

+ (id)entryEventForwardAppResumeInferredCarry
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    v12[0] = *MEMORY[0x1E4F92C50];
    uint64_t v10 = *MEMORY[0x1E4F92CD0];
    v11 = &unk_1F29F0C40;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v13[0] = v2;
    v12[1] = *MEMORY[0x1E4F92CA8];
    v8 = @"CarryType";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
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

+ (id)entryEventBackwardDefinitions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"ProcessExitHistogram";
  uint64_t v3 = [a1 entryEventBackwardProcessExitHistogram];
  v9[0] = v3;
  v8[1] = @"ThreadStats";
  v4 = [a1 entryEventBackwardDefinitionThreadStats];
  v9[1] = v4;
  v8[2] = @"AppLaunchTimeSeries";
  v5 = [a1 entryEventBackwardAppLaunchTimeSeries];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)entryEventBackwardDefinitionThreadStats
{
  v22[2] = *MEMORY[0x1E4F143B8];
  if (+[PLProcessMonitorAgent enableThreadStatsLogging])
  {
    v21[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C40];
    v19[0] = *MEMORY[0x1E4F92CD0];
    v19[1] = v2;
    v20[0] = &unk_1F29F0C40;
    v20[1] = MEMORY[0x1E4F1CC38];
    v19[2] = *MEMORY[0x1E4F92C08];
    void v20[2] = MEMORY[0x1E4F1CC38];
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    v22[0] = v16;
    v21[1] = *MEMORY[0x1E4F92CA8];
    v17[0] = @"PID";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v18[0] = v14;
    v17[1] = @"ProcessName";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_StringFormat_withProcessName");
    v18[1] = v4;
    void v17[2] = @"ThreadName";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
    v18[2] = v6;
    v17[3] = @"SysTime";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v18[3] = v8;
    void v17[4] = @"UsrTime";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v18[4] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    v22[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardAppLaunchTimeSeries
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F0C40;
  v16[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"BundleID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v14[0] = v5;
  v13[1] = @"Duration";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  void v13[2] = @"IsForeground";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_BoolFormat");
  v14[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventIntervalDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"ProcessMonitorInterval";
  uint64_t v3 = [a1 entryEventIntervalDefinitionProcessMonitorDiff];
  v7[1] = @"KernelTaskMonitor";
  v8[0] = v3;
  v4 = [a1 entryEventIntervalDefinitionKernelTaskMonitor];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventIntervalDefinitionProcessMonitorDiff
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v28[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v26[0] = *MEMORY[0x1E4F92CD0];
  v26[1] = v2;
  v27[0] = &unk_1F29F0C60;
  v27[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F92C08];
  v26[2] = *MEMORY[0x1E4F92C40];
  v26[3] = v3;
  v27[2] = MEMORY[0x1E4F1CC38];
  v27[3] = MEMORY[0x1E4F1CC38];
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  v29[0] = v19;
  v28[1] = *MEMORY[0x1E4F92CA8];
  v24 = @"timestampEnd";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_DateFormat");
  v25 = v17;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v29[1] = v16;
  v28[2] = *MEMORY[0x1E4F92C68];
  v22[0] = @"key";
  v20[0] = @"PID";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v21[0] = v4;
  v20[1] = @"ProcessName";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withProcessName");
  v21[1] = v6;
  void v20[2] = @"BundleID";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat_withBundleID");
  void v21[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  v22[1] = @"value";
  v23[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v23[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v29[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];

  return v13;
}

+ (id)entryEventIntervalDefinitionKernelTaskMonitor
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F29F0C50;
  v22[1] = MEMORY[0x1E4F1CC38];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"timestampEnd";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_DateFormat");
  v20[0] = v16;
  v19[1] = @"ThreadID";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v20[1] = v14;
  v19[2] = @"ThreadName";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  void v20[2] = v4;
  void v19[3] = @"CPUTime";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  void v20[3] = v6;
  void v19[4] = @"CPUEnergyP";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v20[4] = v8;
  v19[5] = @"CPUEnergyE";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v20[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventBackwardProcessExitHistogram
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v27[0] = *MEMORY[0x1E4F92CD0];
  v27[1] = v2;
  v28[0] = &unk_1F29F0C40;
  v28[1] = MEMORY[0x1E4F1CC38];
  v27[2] = *MEMORY[0x1E4F92C08];
  v28[2] = MEMORY[0x1E4F1CC38];
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E4F92CA8];
  v25[0] = @"ProcessName";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_StringFormat_withProcessName");
  v26[0] = v22;
  v25[1] = @"lastTimeToRelaunch";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v26[1] = v20;
  void v25[2] = @"ReasonNamespace";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v26[2] = v18;
  v25[3] = @"ReasonCode";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v26[3] = v16;
  void v25[4] = @"0s-5s";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  void v26[4] = v14;
  v25[5] = @"5s-10s";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v26[5] = v4;
  v25[6] = @"10s-60s";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v26[6] = v6;
  v25[7] = @"60s+";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v26[7] = v8;
  v25[8] = @"UnknownDuration";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v26[8] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:9];
  v30[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  return v12;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)defaults
{
  return &unk_1F29EA4B8;
}

- (PLProcessMonitorAgent)init
{
  v10.receiver = self;
  v10.super_class = (Class)PLProcessMonitorAgent;
  uint64_t v2 = [(PLAgent *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    processes = v2->_processes;
    v2->_processes = (NSMutableSet *)v3;

    v2->_launchServiceStatsEnabled = 0;
    v2->_processExitSummaryCount = 0;
    diffFreezerProcs = v2->_diffFreezerProcs;
    v2->_diffFreezerProcs = 0;

    lastFreezerProcs = v2->_lastFreezerProcs;
    v2->_lastFreezerProcs = 0;

    lastCPUTimeDict = v2->_lastCPUTimeDict;
    v2->_lastCPUTimeDict = 0;

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel_processesOfInterest_ name:@"PLProcessMonitorAgent.addProcessesOfInterest" object:0];
  }
  return v2;
}

- (void)processesOfInterest:(id)a3
{
  v4 = [a3 userInfo];
  if (v4)
  {
    id v8 = v4;
    v5 = [v4 objectForKeyedSubscript:@"entry"];
    if (v5)
    {
      v6 = [(PLProcessMonitorAgent *)self processes];
      v7 = [v8 objectForKeyedSubscript:@"entry"];
      [v6 unionSet:v7];
    }
    v4 = v8;
  }
}

- (void)initOperatorDependancies
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) == 0) {
    [(PLProcessMonitorAgent *)self enableProcessExitLogging];
  }
  [(PLProcessMonitorAgent *)self initializeThreadStatsLogging];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  void v29[2] = __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke;
  v29[3] = &unk_1E692A0F0;
  v29[4] = self;
  uint64_t v3 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v29];
  batteryLevelChanged = self->_batteryLevelChanged;
  self->_batteryLevelChanged = v3;

  id v5 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_423;
  void v28[3] = &unk_1E692A6F8;
  v28[4] = self;
  v6 = (PLXPCListenerOperatorComposition *)[v5 initWithOperator:self withRegistration:&unk_1F29EA4E0 withBlock:v28];
  appResumePredictionsListener = self->_appResumePredictionsListener;
  self->_appResumePredictionsListener = v6;

  id v8 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_432;
  void v27[3] = &unk_1E692A6F8;
  void v27[4] = self;
  v9 = (PLXPCListenerOperatorComposition *)[v8 initWithOperator:self withRegistration:&unk_1F29EA508 withBlock:v27];
  appNotFrozenListener = self->_appNotFrozenListener;
  self->_appNotFrozenListener = v9;

  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    id v11 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_437;
    v26[3] = &unk_1E692A6F8;
    void v26[4] = self;
    v12 = (PLXPCListenerOperatorComposition *)[v11 initWithOperator:self withRegistration:&unk_1F29EA530 withBlock:v26];
    appResumeInferredCarryListener = self->_appResumeInferredCarryListener;
    self->_appResumeInferredCarryListener = v12;
  }
  v14 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v15 = [v14 dateByAddingTimeInterval:(double)arc4random_uniform(0x15180u)];
  v16 = (void *)_reportProcDirtyStatsAfterTime;
  _reportProcDirtyStatsAfterTime = v15;

  v17 = PLLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = _reportProcDirtyStatsAfterTime;
    _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "ProcDirtyStats: Picked random time in next 24 hours for sending stats to CA: %@", buf, 0xCu);
  }

  id v18 = objc_alloc(MEMORY[0x1E4F92AA8]);
  v19 = [(PLOperator *)self workQueue];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_449;
  v25[3] = &unk_1E692A118;
  void v25[4] = self;
  v20 = (void *)[v18 initWithWorkQueue:v19 withRegistration:&unk_1F29EA558 withBlock:v25];
  [(PLProcessMonitorAgent *)self setMemoryKillsResponder:v20];

  id v21 = objc_alloc(MEMORY[0x1E4F92AA8]);
  uint64_t v22 = [(PLOperator *)self workQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_464;
  void v24[3] = &unk_1E692A118;
  void v24[4] = self;
  v23 = (void *)[v21 initWithWorkQueue:v22 withRegistration:&unk_1F29EA580 withBlock:v24];
  [(PLProcessMonitorAgent *)self setHudKillsResponder:v23];
}

uint64_t __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "ProcessMonitor: Received SBC notification!", buf, 2u);
  }

  [*(id *)(a1 + 32) updateProcessMonitorCache];
  [*(id *)(a1 + 32) logEventIntervalProcessMonitorIntervalUsingCache];
  [*(id *)(a1 + 32) logEventPointMemoryTracking];
  [*(id *)(a1 + 32) logEventIntervalKernelTaskMonitor];
  [*(id *)(a1 + 32) logProcessExit];
  [*(id *)(a1 + 32) logEventPointFreezerStats];
  [*(id *)(a1 + 32) logEventPointFreezerDemotion];
  [*(id *)(a1 + 32) logEventPointSystemFreezerStats];
  uint64_t v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "ProcDirtyStats: BatteryLevelChanged -> should log to CoreAnalytics?", v5, 2u);
  }

  [*(id *)(a1 + 32) logProcDirtyStats];
  [*(id *)(a1 + 32) logThreadStats];
  return [*(id *)(a1 + 32) logEventPointAppNapEnabled];
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_423(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogProcessMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLProcessMonitorAgent_EventPoint_AppResumePredictions: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointAppResumePredictions:v6];
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_432(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogProcessMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLProcessMonitorAgent_EventPoint_AppNotFrozen: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointAppNotFrozen:v6];
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_437(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogProcessMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLProcessMonitorAgent_EventForward_AppResumeInferredCarry: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardAppResumeInferredCarry:v6];
}

id __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_449(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogProcessMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_1D2690000, v7, OS_LOG_TYPE_INFO, "MemoryKills query received with info: %@", (uint8_t *)&v13, 0xCu);
  }

  int v8 = [*(id *)(a1 + 32) getProcessExits:v6];
  id v9 = v8;
  if (v8 && [v8 count])
  {
    uint64_t v10 = objc_opt_new();
    [v10 setObject:v9 forKeyedSubscript:@"ProcessExits"];
  }
  else
  {
    id v11 = PLLogProcessMonitor();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1D2690000, v11, OS_LOG_TYPE_ERROR, "MemoryKills query did not succeed", (uint8_t *)&v13, 2u);
    }

    uint64_t v10 = 0;
  }

  return v10;
}

id __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_464(uint64_t a1)
{
  uint64_t v2 = PLLogProcessMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_INFO, "HUD Terminations query received", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) getAllProcessExitsInLastHour];
  v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = objc_opt_new();
    [v5 setObject:v4 forKeyedSubscript:@"ProcessExits"];
  }
  else
  {
    id v6 = PLLogProcessMonitor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v8 = 0;
      _os_log_error_impl(&dword_1D2690000, v6, OS_LOG_TYPE_ERROR, "HUD Terminations query did not succeed", v8, 2u);
    }

    id v5 = 0;
  }

  return v5;
}

- (void)updateProcessExitSummary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"ProcessExitHistogram"];
  v4 = [(PLOperator *)self storage];
  self->_processExitSummaryCount = [v4 countOfEntriesForKey:v3];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke;
    v15[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v15[4] = v5;
    if (qword_1EBD58AE8 != -1) {
      dispatch_once(&qword_1EBD58AE8, v15);
    }
    if (_MergedGlobals_1_38)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Init processExitSummaryCount = %d\n", self->_processExitSummaryCount);
      v7 = (void *)MEMORY[0x1E4F929B8];
      int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      id v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent updateProcessExitSummary]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:796];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  dispatch_time_t v12 = dispatch_time(0, 86400000000000);
  int v13 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke_472;
  block[3] = &unk_1E692A250;
  block[4] = self;
  dispatch_after(v12, v13, block);
}

uint64_t __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_38 = result;
  return result;
}

void __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke_472(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setProcessExitSummaryCount:0];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    int v13 = __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke_2;
    id v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v15 = v2;
    if (qword_1EBD58AF0 != -1) {
      dispatch_once(&qword_1EBD58AF0, &block);
    }
    if (byte_1EBD58AC1)
    {
      uint64_t v3 = NSString;
      uint64_t v4 = [*(id *)(a1 + 32) processExitSummaryCount];
      uint64_t v5 = objc_msgSend(v3, "stringWithFormat:", @"Reset processExitSummaryCount = %d\n", v4, block, v12, v13, v14, v15);
      id v6 = (void *)MEMORY[0x1E4F929B8];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      int v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent updateProcessExitSummary]_block_invoke"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:802];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AC1 = result;
  return result;
}

- (void)enableProcessExitLogging
{
  *(void *)&void v15[5] = *MEMORY[0x1E4F143B8];
  if (launch_service_stats_is_enabled_4ppse())
  {
    [(PLProcessMonitorAgent *)self setLaunchServiceStatsEnabled:1];
    uint64_t v3 = PLLogProcessMonitor();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2690000, v3, OS_LOG_TYPE_INFO, "launch_service_stats is enabled", buf, 2u);
    }
LABEL_7:

    return;
  }
  [(PLProcessMonitorAgent *)self updateProcessExitSummary];
  int v4 = launch_service_stats_enable_4ppse();
  if (v4)
  {
    int v5 = v4;
    uint64_t v3 = PLLogProcessMonitor();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v15[0] = v5;
      LOWORD(v15[1]) = 2080;
      *(void *)((char *)&v15[1] + 2) = strerror(v5);
      _os_log_error_impl(&dword_1D2690000, v3, OS_LOG_TYPE_ERROR, "Failed to enable launch_service_stats(%d):%s", buf, 0x12u);
    }
    goto LABEL_7;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PLProcessMonitorAgent_enableProcessExitLogging__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD58AF8 != -1) {
      dispatch_once(&qword_1EBD58AF8, block);
    }
    if (byte_1EBD58AC2)
    {
      v7 = [NSString stringWithFormat:@"launch_service_stats enabled."];
      int v8 = (void *)MEMORY[0x1E4F929B8];
      id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      uint64_t v10 = [v9 lastPathComponent];
      id v11 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent enableProcessExitLogging]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:818];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v15 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLProcessMonitorAgent *)self setLaunchServiceStatsEnabled:1];
}

uint64_t __49__PLProcessMonitorAgent_enableProcessExitLogging__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AC2 = result;
  return result;
}

- (void)disableProcessExitLogging
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(PLProcessMonitorAgent *)self setLaunchServiceStatsEnabled:0];
  uint64_t v2 = launch_service_stats_disable_4ppse();
  int v3 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (v2)
  {
    if (v3)
    {
      uint64_t v4 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __50__PLProcessMonitorAgent_disableProcessExitLogging__block_invoke_484;
      v19 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v20 = v4;
      if (qword_1EBD58B08 != -1) {
        dispatch_once(&qword_1EBD58B08, &block);
      }
      if (byte_1EBD58AC4)
      {
        int v5 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to disable launch_service_stats(%d):%s", v2, strerror(v2), block, v17, v18, v19, v20);
        uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
        v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
        int v8 = [v7 lastPathComponent];
        id v9 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent disableProcessExitLogging]"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:833];

        uint64_t v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v5;
LABEL_16:
          _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
  }
  else if (v3)
  {
    uint64_t v11 = objc_opt_class();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __50__PLProcessMonitorAgent_disableProcessExitLogging__block_invoke;
    void v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v21[4] = v11;
    if (qword_1EBD58B00 != -1) {
      dispatch_once(&qword_1EBD58B00, v21);
    }
    if (byte_1EBD58AC3)
    {
      int v5 = [NSString stringWithFormat:@"launch_service_stats successfully disabled."];
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      int v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      id v14 = [v13 lastPathComponent];
      uint64_t v15 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent disableProcessExitLogging]"];
      [v12 logMessage:v5 fromFile:v14 fromFunction:v15 fromLineNumber:830];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v5;
        goto LABEL_16;
      }
LABEL_13:
    }
  }
}

uint64_t __50__PLProcessMonitorAgent_disableProcessExitLogging__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AC3 = result;
  return result;
}

uint64_t __50__PLProcessMonitorAgent_disableProcessExitLogging__block_invoke_484(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AC4 = result;
  return result;
}

- (id)eventForwardProcessIDForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v5 = +[PLProcessMonitorAgent PIDToCoalitionID:](PLProcessMonitorAgent, "PIDToCoalitionID:");
  uint64_t v6 = [(PLProcessMonitorAgent *)self processMonitorMultiKeyFromProcessID:v3];
  v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ProcessID"];
  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v6];
  id v9 = [NSNumber numberWithUnsignedLongLong:v5];
  [v8 setObject:v9 forKeyedSubscript:@"CoalitionID"];

  return v8;
}

- (void)getCpuUsageAndMemoryForPid:(int)a3 withBuffer:(void *)a4 withNewProcessArray:(id)a5 withTotalCpu:(unint64_t *)a6 withActiveProcesses:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a7;
  if (!proc_pid_rusage(v10, 5, (rusage_info_t *)a4))
  {
    id v14 = [(PLOperator *)self storage];
    uint64_t v15 = [v14 processIDEntryForPid:v10];

    if (!v15)
    {
      v16 = [(PLProcessMonitorAgent *)self eventForwardProcessIDForPID:v10];
      [v12 addObject:v16];
    }
    uint64_t v17 = objc_alloc_init(ProcessMonitorStats);
    [MEMORY[0x1E4F92A88] secondsFromMachTime:*((void *)a4 + 2)];
    [(ProcessMonitorStats *)v17 setCpu_time:(unint64_t)v18];
    [(ProcessMonitorStats *)v17 setShared_cache_reslid:*((_DWORD *)a4 + 74) & 1];
    v19 = [(PLProcessMonitorAgent *)self lastCPUTimeDict];
    uint64_t v20 = [NSNumber numberWithInt:v10];
    id v21 = [v19 objectForKeyedSubscript:v20];

    if (v21)
    {
      -[ProcessMonitorStats setCpu_time_diff:](v17, "setCpu_time_diff:", -[ProcessMonitorStats cpu_time](v17, "cpu_time") - objc_msgSend(v21, "cpu_time"));
      uint64_t v22 = PLLogProcessMonitor();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v24[0] = 67109632;
        v24[1] = v10;
        __int16 v25 = 2048;
        uint64_t v26 = [(ProcessMonitorStats *)v17 cpu_time];
        __int16 v27 = 2048;
        uint64_t v28 = objc_msgSend(v21, "cpu_time");
        _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "CPU Time Difference calculation for pid[%d] %llu %llu", (uint8_t *)v24, 0x1Cu);
      }
    }
    else
    {
      [(ProcessMonitorStats *)v17 setCpu_time_diff:0];
    }
    if ([(ProcessMonitorStats *)v17 cpu_time_diff]) {
      *a6 += [(ProcessMonitorStats *)v17 cpu_time_diff];
    }
    v23 = [NSNumber numberWithInt:v10];
    [v13 setObject:v17 forKeyedSubscript:v23];
  }
}

- (void)updateProcessMonitorCache
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D942A350](self, a2);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  unint64_t v5 = objc_opt_new();
  unint64_t v34 = 0;
  uint64_t v6 = objc_opt_new();
  memset(__b, 255, sizeof(__b));
  unint64_t v7 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
  {
    int v8 = [(PLProcessMonitorAgent *)self processes];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      uint64_t v29 = v3;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v10 = [(PLProcessMonitorAgent *)self processes];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v56 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v16 = (void *)MEMORY[0x1D942A350]();
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            long long v37 = 0u;
            -[PLProcessMonitorAgent getCpuUsageAndMemoryForPid:withBuffer:withNewProcessArray:withTotalCpu:withActiveProcesses:](self, "getCpuUsageAndMemoryForPid:withBuffer:withNewProcessArray:withTotalCpu:withActiveProcesses:", [v15 intValue], &v37, v6, &v34, v5);
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v56 count:16];
        }
        while (v12);
      }

      uint64_t v3 = v29;
      unint64_t v7 = 0x1E4F92000;
    }
  }
  else
  {
    int v17 = proc_listpids(1u, 0, 0, 0);
    uint64_t v18 = proc_listpids(1u, 0, __b, 4096);
    if (v17 >= 4)
    {
      unint64_t v19 = 0;
      unint64_t v20 = (unint64_t)v17 >> 2;
      do
      {
        id v21 = (void *)MEMORY[0x1D942A350](v18);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v37 = 0u;
        [(PLProcessMonitorAgent *)self getCpuUsageAndMemoryForPid:__b[v19] withBuffer:&v37 withNewProcessArray:v6 withTotalCpu:&v34 withActiveProcesses:v5];
        if (v19 > 0x3FE) {
          break;
        }
        ++v19;
      }
      while (v20 > v19);
    }
  }
  if ([v6 count] && (objc_msgSend(*(id *)(v7 + 2696), "isPowerlogHelperd") & 1) == 0)
  {
    uint64_t v22 = [v6 objectAtIndexedSubscript:0];
    v23 = [v22 entryKey];
    v35 = v23;
    v36 = v6;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    [v6 objectAtIndexedSubscript:0];
    v26 = __int16 v25 = v3;
    __int16 v27 = [v26 entryKey];
    [(PLOperator *)self logEntries:v24 withGroupID:v27];

    uint64_t v3 = v25;
  }
  [(PLProcessMonitorAgent *)self setLastCPUTimeDict:v5];
  uint64_t v28 = [(PLProcessMonitorAgent *)self currentCachedDate];
  [(PLProcessMonitorAgent *)self setPreviousCacheDate:v28];

  [(PLProcessMonitorAgent *)self setCurrentCachedDate:v4];
  [(PLProcessMonitorAgent *)self setCurrentCachedTotalCPUTime:(double)v34];
}

- (id)getFrozenProcesses
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  memset(v25, 0, sizeof(v25));
  if ((int)memorystatus_control() < 1)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __43__PLProcessMonitorAgent_getFrozenProcesses__block_invoke;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v24 = v9;
      if (qword_1EBD58B10 != -1) {
        dispatch_once(&qword_1EBD58B10, &block);
      }
      if (byte_1EBD58AC5)
      {
        uint64_t v10 = NSString;
        uint64_t v11 = __error();
        uint64_t v12 = strerror(*v11);
        uint64_t v13 = objc_msgSend(v10, "stringWithFormat:", @"Error: Could not get frozen process list: %s\n", v12, block, v21, v22, v23, v24);
        id v14 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
        v16 = [v15 lastPathComponent];
        int v17 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent getFrozenProcesses]"];
        [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:973];

        uint64_t v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v27 = v13;
          _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v8 = 0;
  }
  else
  {
    uint64_t v3 = LODWORD(v25[0]);
    if (LODWORD(v25[0]))
    {
      uint64_t v4 = (unsigned char *)((unint64_t)v25 | 0xC);
      do
      {
        if (*v4)
        {
          unint64_t v5 = [NSString stringWithUTF8String:v4];
          uint64_t v6 = [NSNumber numberWithInt:*((unsigned int *)v4 - 1)];
          if (v5) {
            unint64_t v7 = v5;
          }
          else {
            unint64_t v7 = @"Unknown Name";
          }
          [v2 setObject:v7 forKey:v6];
        }
        v4 += 40;
        --v3;
      }
      while (v3);
    }
    id v8 = v2;
  }

  return v8;
}

uint64_t __43__PLProcessMonitorAgent_getFrozenProcesses__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AC5 = result;
  return result;
}

- (id)getProcessesNotInFreezer:(id)a3 withCurrentProcesses:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v14 = objc_msgSend(v6, "objectForKeyedSubscript:", v13, (void)v17);

        if (!v14)
        {
          uint64_t v15 = [v8 objectForKeyedSubscript:v13];
          [v7 setObject:v15 forKeyedSubscript:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (int)getLedgerIndex:(int64_t)a3 forKey:(id)a4
{
  id v4 = a4;
  if ((ledger() & 0x80000000) == 0)
  {
    id v5 = malloc_type_malloc(0, 0x1000040565EDBD2uLL);
    if (v5)
    {
      id v6 = v5;
      ledger();
      free(v6);
    }
  }

  return -1;
}

- (int)getFrozenToSwapLedgerIndex:(int64_t)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__PLProcessMonitorAgent_getFrozenToSwapLedgerIndex___block_invoke;
  v4[3] = &unk_1E692D360;
  v4[4] = self;
  v4[5] = a3;
  if (getFrozenToSwapLedgerIndex__onceToken != -1) {
    dispatch_once(&getFrozenToSwapLedgerIndex__onceToken, v4);
  }
  return getFrozenToSwapLedgerIndex__frozenToSwapOffset;
}

uint64_t __52__PLProcessMonitorAgent_getFrozenToSwapLedgerIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) getLedgerIndex:*(void *)(a1 + 40) forKey:@"frozen_to_swap"];
  getFrozenToSwapLedgerIndex__frozenToSwapOffset = result;
  return result;
}

- (int)getProcDirtyTimeLedgerIndex:(int64_t)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PLProcessMonitorAgent_getProcDirtyTimeLedgerIndex___block_invoke;
  v4[3] = &unk_1E692D360;
  v4[4] = self;
  v4[5] = a3;
  if (getProcDirtyTimeLedgerIndex__onceToken != -1) {
    dispatch_once(&getProcDirtyTimeLedgerIndex__onceToken, v4);
  }
  return getProcDirtyTimeLedgerIndex__procDirtyTimeOffset;
}

uint64_t __53__PLProcessMonitorAgent_getProcDirtyTimeLedgerIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) getLedgerIndex:*(void *)(a1 + 40) forKey:@"memorystatus_dirty_time"];
  getProcDirtyTimeLedgerIndex__procDirtyTimeOffset = result;
  return result;
}

- (id)ledgerDataAtIndex:(int)a3 forPid:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  if ((ledger() & 0x80000000) != 0)
  {
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_26;
    }
    uint64_t v10 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD58B18 != -1) {
      dispatch_once(&qword_1EBD58B18, block);
    }
    if (!byte_1EBD58AC6) {
      goto LABEL_26;
    }
    uint64_t v11 = [NSString stringWithFormat:@"Error in ledger info"];
    uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
    id v14 = [v13 lastPathComponent];
    uint64_t v15 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent ledgerDataAtIndex:forPid:]"];
    [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1056];

    v16 = PLLogCommon();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 138412290;
    v35 = v11;
LABEL_31:
    _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v32 = *((void *)&v38 + 1);
  id v6 = (char *)malloc_type_malloc(48 * *((void *)&v38 + 1), 0x3DE92795uLL);
  if (!v6)
  {
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_26;
    }
    uint64_t v24 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke_508;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1EBD58B20 != -1) {
      dispatch_once(&qword_1EBD58B20, v31);
    }
    if (!byte_1EBD58AC7) {
      goto LABEL_26;
    }
    uint64_t v11 = [NSString stringWithFormat:@"Failed to allocate ledger entry info"];
    __int16 v25 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
    __int16 v27 = [v26 lastPathComponent];
    uint64_t v28 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent ledgerDataAtIndex:forPid:]"];
    [v25 logMessage:v11 fromFile:v27 fromFunction:v28 fromLineNumber:1065];

    v16 = PLLogCommon();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 138412290;
    v35 = v11;
    goto LABEL_31;
  }
  unint64_t v7 = v6;
  if ((ledger() & 0x80000000) == 0 && v32 > (int)v5)
  {
    id v8 = objc_alloc_init(PLLedgerEntryData);
    uint64_t v9 = &v7[48 * (int)v5];
    [(PLLedgerEntryData *)v8 setCredit:*((void *)v9 + 1)];
    [(PLLedgerEntryData *)v8 setDebit:*((void *)v9 + 2)];
    [(PLLedgerEntryData *)v8 setBalance:*(void *)v9];
    free(v7);
    goto LABEL_27;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke_514;
    v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v30[4] = v17;
    if (qword_1EBD58B28 != -1) {
      dispatch_once(&qword_1EBD58B28, v30);
    }
    if (byte_1EBD58AC8)
    {
      long long v18 = objc_msgSend(NSString, "stringWithFormat:", @"Could not get ledger entry info for pid %ld and frozen to swap index %d and ledger count %lld", a4, v5, v32);
      long long v19 = (void *)MEMORY[0x1E4F929B8];
      long long v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      uint64_t v21 = [v20 lastPathComponent];
      uint64_t v22 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent ledgerDataAtIndex:forPid:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:1069];

      v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v18;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  free(v7);
LABEL_26:
  id v8 = 0;
LABEL_27:
  return v8;
}

uint64_t __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AC6 = result;
  return result;
}

uint64_t __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke_508(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AC7 = result;
  return result;
}

uint64_t __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke_514(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AC8 = result;
  return result;
}

- (void)log
{
  [(PLProcessMonitorAgent *)self updateProcessMonitorCache];
  [(PLProcessMonitorAgent *)self logEventIntervalProcessMonitorIntervalUsingCache];
  [(PLProcessMonitorAgent *)self logEventPointMemoryTracking];
  [(PLProcessMonitorAgent *)self logEventIntervalKernelTaskMonitor];
  [(PLProcessMonitorAgent *)self logProcessExit];
}

- (void)logEventPointMemoryTracking
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(PLOperator *)self isDebugEnabled])
  {
    uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"MemoryTracking"];
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
    uint64_t v26 = 0;
    int v25 = 0;
    memset(&stats, 0, sizeof(stats));
    if (malloc_get_all_zones())
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v5 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v5;
        if (qword_1EBD58B30 != -1) {
          dispatch_once(&qword_1EBD58B30, block);
        }
        if (byte_1EBD58AC9)
        {
          id v6 = [NSString stringWithFormat:@"error with malloc_get_all_zones"];
          unint64_t v7 = (void *)MEMORY[0x1E4F929B8];
          id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
          uint64_t v9 = [v8 lastPathComponent];
          uint64_t v10 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent logEventPointMemoryTracking]"];
          [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1104];

          uint64_t v11 = PLLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(v29.bytes_total) = 138412290;
            *(size_t *)((char *)&v29.bytes_total + 4) = (size_t)v6;
            _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v29, 0xCu);
          }
        }
      }
    }
    else
    {
      memset(&v29, 0, sizeof(v29));
      mstats(&v29);
      uint64_t v12 = [NSNumber numberWithDouble:(double)v29.bytes_total * 0.0009765625];
      [v4 setObject:v12 forKeyedSubscript:@"HeapTotal"];

      uint64_t v13 = [NSNumber numberWithDouble:(double)v29.bytes_used * 0.0009765625];
      [v4 setObject:v13 forKeyedSubscript:@"HeapUsed"];

      id v14 = [NSNumber numberWithDouble:(double)v29.bytes_free * 0.0009765625];
      [v4 setObject:v14 forKeyedSubscript:@"HeapFree"];

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v15 = objc_opt_class();
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        void v22[2] = __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke_536;
        v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        void v22[4] = v15;
        if (qword_1EBD58B48 != -1) {
          dispatch_once(&qword_1EBD58B48, v22);
        }
        if (byte_1EBD58ACC)
        {
          v16 = objc_msgSend(NSString, "stringWithFormat:", @"heap: total=%f used=%f free=%f", (double)v29.bytes_total * 0.0009765625, (double)v29.bytes_used * 0.0009765625, (double)v29.bytes_free * 0.0009765625);
          uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
          long long v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
          long long v19 = [v18 lastPathComponent];
          long long v20 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent logEventPointMemoryTracking]"];
          [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:1127];

          uint64_t v21 = PLLogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v28 = v16;
            _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      [(PLOperator *)self logEntry:v4];
    }
  }
}

uint64_t __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AC9 = result;
  return result;
}

uint64_t __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke_524(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ACA = result;
  return result;
}

uint64_t __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke_530(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ACB = result;
  return result;
}

uint64_t __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke_536(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ACC = result;
  return result;
}

- (void)logEventPointProcessSnapshot
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = proc_listpids(1u, 0, 0, 0);
  if ((v3 & 0x80000000) == 0)
  {
    int v4 = v3;
    size_t v5 = v3;
    id v6 = (int *)malloc_type_malloc(v3, 0xD59F943uLL);
    if (v6)
    {
      unint64_t v7 = v6;
      long long v44 = self;
      memset(v6, 255, v5);
      long long v45 = v7;
      int v8 = proc_listpids(1u, 0, v7, v4);
      uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ProcessSnapshot"];
      uint64_t v10 = objc_opt_new();
      uint64_t v11 = objc_opt_new();
      if (v8 >= 4)
      {
        if ((unint64_t)v8 >> 2 <= 1) {
          unint64_t v12 = 1;
        }
        else {
          unint64_t v12 = (unint64_t)v8 >> 2;
        }
        unint64_t v13 = 0x1E4F92000uLL;
        do
        {
          int v15 = *v7++;
          uint64_t v14 = v15;
          if (v15 >= 1)
          {
            memset(buffer, 0, sizeof(buffer));
            if (proc_pidinfo(v14, 18, 0, buffer, 192) == 192 && DWORD1(buffer[0]) != 5)
            {
              long long v65 = 0u;
              long long v66 = 0u;
              long long v63 = 0u;
              long long v64 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              *(_OWORD *)uint64_t v58 = 0u;
              if (!proc_pid_rusage(v14, 1, v58))
              {
                v16 = (void *)[objc_alloc(*(Class *)(v13 + 2512)) initWithEntryKey:v9];
                if (v16)
                {
                  [NSNumber numberWithInt:v14];
                  long long v18 = v17 = v13;
                  [v16 setObject:v18 forKeyedSubscript:@"PID"];

                  unint64_t v13 = v17;
                  long long v19 = [MEMORY[0x1E4F92A88] bundleIDFromPid:v14];
                  [v16 setObject:v19 forKeyedSubscript:@"BundleID"];

                  long long v20 = [NSNumber numberWithUnsignedLongLong:*((void *)&v62 + 1)];
                  [v16 setObject:v20 forKeyedSubscript:@"PhyFootprint"];

                  uint64_t v21 = [NSNumber numberWithUnsignedLongLong:(void)v63];
                  [v16 setObject:v21 forKeyedSubscript:@"StartOrder"];

                  [v10 addObject:v16];
                  uint64_t v22 = [v16 objectForKeyedSubscript:@"StartOrder"];
                  [v11 addObject:v22];
                }
              }
            }
          }
          --v12;
        }
        while (v12);
      }
      long long v43 = (void *)v9;
      uint64_t v23 = objc_msgSend(v11, "count", v10);
      uint64_t v24 = objc_opt_new();
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v25 = v11;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v57 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v51;
        do
        {
          uint64_t v29 = 0;
          uint64_t v30 = v23;
          do
          {
            if (*(void *)v51 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v31 = *(void *)(*((void *)&v50 + 1) + 8 * v29);
            uint64_t v23 = (v30 - 1);
            uint64_t v32 = [NSNumber numberWithInt:v30];
            [v24 setObject:v32 forKeyedSubscript:v31];

            ++v29;
            uint64_t v30 = v23;
          }
          while (v27 != v29);
          uint64_t v27 = [v25 countByEnumeratingWithState:&v50 objects:v57 count:16];
        }
        while (v27);
      }

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v33 = v42;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v47 != v36) {
              objc_enumerationMutation(v33);
            }
            long long v38 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            uint64_t v39 = [v38 objectForKeyedSubscript:@"StartOrder"];
            long long v40 = [v24 objectForKeyedSubscript:v39];
            [v38 setObject:v40 forKeyedSubscript:@"StartOrder"];
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v46 objects:v56 count:16];
        }
        while (v35);
      }

      long long v54 = v43;
      id v55 = v33;
      long long v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      [(PLOperator *)v44 logEntries:v41 withGroupID:v43];

      free(v45);
    }
  }
}

- (void)logProcessExit
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(PLProcessMonitorAgent *)self launchServiceStatsEnabled])
  {
    int64_t processExitSummaryCount = self->_processExitSummaryCount;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __39__PLProcessMonitorAgent_logProcessExit__block_invoke;
    void v18[3] = &unk_1E692A250;
    void v18[4] = self;
    if (qword_1EBD58B50 != -1) {
      dispatch_once(&qword_1EBD58B50, v18);
    }
    if (processExitSummaryCount <= qword_1EBD58B58)
    {
      xpc_object_t xarray = 0;
      v16 = 0;
      uint64_t v17 = 0;
      int v5 = _launch_service_stats_copy_4ppse_impl();
      id v6 = PLLogProcessMonitor();
      unint64_t v7 = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          int v8 = strerror(v5);
          *(_DWORD *)buf = 67109378;
          int v20 = v5;
          __int16 v21 = 2080;
          uint64_t v22 = v8;
          _os_log_error_impl(&dword_1D2690000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch launch_service_stats(%d):%s", buf, 0x12u);
        }
      }
      else
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          int v20 = v17;
          _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got %d process exit records", buf, 8u);
        }

        context = (void *)MEMORY[0x1D942A350]();
        unint64_t v12 = [MEMORY[0x1E4F1C9C8] monotonicDate];
        __uint64_t v11 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        uint64_t v9 = objc_opt_new();
        uint64_t v14 = objc_opt_new();
        unint64_t v13 = objc_opt_new();
        [(PLProcessMonitorAgent *)self logEventPointProcessExit:v9 excludeProcesses:v13 withStats:&xarray withDate:v12 withNowInSec:v11 / 0xF4240];
        [(PLProcessMonitorAgent *)self logEventBackwardProcessExitHistogram:v14 withStats:&xarray withDate:v12];

        if (v16) {
          free(v16);
        }
        unint64_t v7 = xarray;
        xpc_object_t xarray = 0;
      }
    }
    else
    {
      int v4 = PLLogProcessMonitor();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(xarray) = 0;
        _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "ProcessExitSummaryCount exceeds threshold and logging skipped.", (uint8_t *)&xarray, 2u);
      }
    }
  }
}

uint64_t __39__PLProcessMonitorAgent_logProcessExit__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"ProcessExitSummaryRowThreshold"];
  qword_1EBD58B58 = result;
  return result;
}

uint64_t __39__PLProcessMonitorAgent_logProcessExit__block_invoke_548(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"ThresholdToSkipAppExitDetail"];
  qword_1EBD58B68 = result;
  return result;
}

uint64_t __39__PLProcessMonitorAgent_logProcessExit__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"ThresholdToSkipProcessExitDetail"];
  qword_1EBD58B78 = result;
  return result;
}

- (void)logEventPointProcessExit:(id)a3 excludeProcesses:(id)a4 withStats:(id *)a5 withDate:(id)a6 withNowInSec:(unint64_t)a7
{
  long long v40 = self;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v54 = a4;
  id v50 = a6;
  long long v43 = v9;
  uint64_t v10 = [v9 allKeys];
  __uint64_t v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_553];

  long long v49 = objc_opt_new();
  long long v48 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ProcessExit"];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v11;
  uint64_t v44 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v66;
    uint64_t v12 = *MEMORY[0x1E4F92DE0];
    uint64_t v46 = *MEMORY[0x1E4F92DD8];
    uint64_t v53 = *MEMORY[0x1E4F92DE0];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v66 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = v13;
        uint64_t v14 = objc_msgSend(v43, "objectForKeyedSubscript:", *(void *)(*((void *)&v65 + 1) + 8 * v13), v40);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v51 = v14;
        uint64_t v55 = [v51 countByEnumeratingWithState:&v61 objects:v71 count:16];
        if (v55)
        {
          uint64_t v15 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v55; ++i)
            {
              if (*(void *)v62 != v15) {
                objc_enumerationMutation(v51);
              }
              uint64_t v17 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              context = (void *)MEMORY[0x1D942A350]();
              int v18 = [v17 intValue];
              var1 = a5->var1;
              int v20 = (unsigned int *)((char *)var1 + 51 * v18);
              __int16 v21 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_array_get_string(a5->var0, *v20));
              if (([v54 containsObject:v21] & 1) == 0)
              {
                uint64_t v22 = (char *)var1 + 51 * v18;
                uint64_t v24 = *(void *)(v22 + 12);
                uint64_t v23 = v22 + 12;
                long long v52 = [v50 dateByAddingTimeInterval:(double)(a7 - v24) / -1000.0];
                id v25 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v48 withDate:v52];
                uint64_t v26 = [NSNumber numberWithInt:*((unsigned int *)v23 + 2)];
                [v25 setObject:v26 forKeyedSubscript:@"PID"];

                size_t v27 = *v20;
                if (xpc_array_get_count(a5->var0) > v27) {
                  [v25 setObject:v21 forKeyedSubscript:@"ProcessName"];
                }
                unint64_t v28 = *(void *)((char *)var1 + 51 * v18 + 4);
                if (*(void *)v23 > v28 && v28 != 0)
                {
                  uint64_t v30 = [NSNumber numberWithUnsignedLongLong:*(void *)v23 - v28];
                  [v25 setObject:v30 forKeyedSubscript:@"timeSinceSpawn"];
                }
                if (*(_DWORD *)((char *)var1 + 51 * v18 + 24) != -1)
                {
                  uint64_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
                  [v25 setObject:v31 forKeyedSubscript:@"lastTimeToRelaunch"];
                }
                uint64_t v32 = (char *)var1 + 51 * v18;
                id v33 = [NSNumber numberWithUnsignedChar:v32[28]];
                [v25 setObject:v33 forKeyedSubscript:@"ReasonNamespace"];

                uint64_t v34 = [NSNumber numberWithUnsignedLongLong:*(void *)(v32 + 29)];
                [v25 setObject:v34 forKeyedSubscript:@"ReasonCode"];

                uint64_t v35 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v32 + 49)];
                [v25 setObject:v35 forKeyedSubscript:@"JetsamPriority"];

                [v49 addObject:v25];
                uint64_t v12 = v53;
              }
              if ([v21 hasPrefix:v12])
              {
                uint64_t v36 = [v21 stringByReplacingOccurrencesOfString:v12 withString:&stru_1F294E108];

                uint64_t v37 = [v36 rangeOfString:@"["];
                if (v37 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v38 = [v36 substringToIndex:v37];
                  goto LABEL_28;
                }
              }
              else
              {
                if ([v21 hasPrefix:v46])
                {
                  uint64_t v38 = [MEMORY[0x1E4F92A88] cleanLaunchdApplicationMacOS:v21];
                  uint64_t v36 = v21;
LABEL_28:

                  uint64_t v36 = (void *)v38;
                  uint64_t v12 = v53;
                  goto LABEL_30;
                }
                uint64_t v36 = v21;
              }
LABEL_30:
              if (([v36 containsString:@"/"] & 1) == 0)
              {
                if (*(_DWORD *)((char *)var1 + 51 * v18 + 24) != -1)
                {
                  id v60 = v36;
                  AnalyticsSendEventLazy();
                }
                id v59 = v36;
                AnalyticsSendEventLazy();
                id v58 = v59;
                AnalyticsSendEventLazy();
              }
            }
            uint64_t v55 = [v51 countByEnumeratingWithState:&v61 objects:v71 count:16];
          }
          while (v55);
        }

        uint64_t v13 = v45 + 1;
      }
      while (v45 + 1 != v44);
      uint64_t v44 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    }
    while (v44);
  }

  if ([v49 count])
  {
    v69 = v48;
    v70 = v49;
    uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    [(PLOperator *)v40 logEntries:v39 withGroupID:v48];
  }
}

uint64_t __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

id __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"procname"];
  unsigned int v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1 + 40) + 24)];
  [v2 setObject:v3 forKeyedSubscript:@"time_to_relaunch_ms"];

  int v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v2;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "ProcessRelaunchTime: processName %@'s statistics: %@", (uint8_t *)&v7, 0x16u);
  }

  return v2;
}

id __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke_576(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F92A88] intervalPeakCADictionaryForLaunchdName:*(void *)(a1 + 32) intervalMaxKB:*(unsigned int *)(*(void *)(a1 + 40) + 41)];
  unsigned int v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v2 setObject:v3 forKeyedSubscript:@"is_uikit_app"];

  int v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  [v2 setObject:v4 forKeyedSubscript:@"is_mac_app"];

  int v5 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(*(void *)(a1 + 40) + 28)];
  [v2 setObject:v5 forKeyedSubscript:@"exit_reason_namespace"];

  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1 + 40) + 29)];
  [v2 setObject:v6 forKeyedSubscript:@"exit_reason_code"];

  int v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1 + 40) + 37)];
  [v2 setObject:v7 forKeyedSubscript:@"lifetime_peak_footprint_kb"];

  uint64_t v8 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(*(void *)(a1 + 40) + 49)];
  [v2 setObject:v8 forKeyedSubscript:@"jetsam_priority"];

  return v2;
}

uint64_t __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke_2_598(uint64_t a1)
{
  return [MEMORY[0x1E4F92A88] intervalPeakCADictionaryForLaunchdName:*(void *)(a1 + 32) intervalMaxKB:*(unsigned int *)(*(void *)(a1 + 40) + 41)];
}

- (id)getAllProcessExitsInLastHour
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(PLProcessMonitorAgent *)self logProcessExit];
  unsigned int v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"ProcessExitHistogram"];
  int v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  int v5 = [v4 dateByAddingTimeInterval:-3600.0];
  uint64_t v6 = NSString;
  [v5 timeIntervalSince1970];
  uint64_t v8 = v7;
  [v4 timeIntervalSince1970];
  id v10 = [v6 stringWithFormat:@"SELECT ID, %@, %@, %@, timestamp from %@ WHERE timestamp > %f AND timestamp <= %f", @"ProcessName", @"ReasonNamespace", @"ReasonCode", v3, v8, v9];
  uint64_t v11 = PLLogProcessMonitor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = (uint64_t)v10;
    _os_log_impl(&dword_1D2690000, v11, OS_LOG_TYPE_INFO, "LastHourKills Query is %@", buf, 0xCu);
  }

  uint64_t v12 = [(PLOperator *)self storage];
  uint64_t v13 = [v12 connection];
  uint64_t v14 = [v13 performQuery:v10];

  uint64_t v15 = PLLogProcessMonitor();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [v14 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v19 = v16;
    __int16 v20 = 2112;
    __int16 v21 = v14;
    _os_log_impl(&dword_1D2690000, v15, OS_LOG_TYPE_INFO, "LastHourKills Result Count is %lu and result %@", buf, 0x16u);
  }

  return v14;
}

- (id)getProcessExits:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (!v4)
  {
    uint64_t v26 = PLLogProcessMonitor();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
LABEL_13:
      size_t v27 = 0;
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    unint64_t v28 = "Nil payload sent to query";
    uint64_t v29 = v26;
    uint32_t v30 = 2;
LABEL_18:
    _os_log_error_impl(&dword_1D2690000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    goto LABEL_13;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"lastNHours"];
  uint64_t v7 = [v6 longLongValue];

  uint64_t v8 = [v5 objectForKeyedSubscript:@"ReasonCode"];
  uint64_t v9 = [v8 longLongValue];

  id v10 = [v5 objectForKeyedSubscript:@"ReasonNamespace"];
  uint64_t v11 = [v10 longLongValue];

  if ((unint64_t)v7 > 0x18 || v9 < 0 || v11 < 0)
  {
    uint64_t v26 = PLLogProcessMonitor();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 134218496;
    uint64_t v33 = v7;
    __int16 v34 = 2048;
    uint64_t v35 = v9;
    __int16 v36 = 2048;
    uint64_t v37 = v11;
    unint64_t v28 = "Invalid payload sent to query lastNHours %lld reasonCode %lld reasonNamespace %lld";
    uint64_t v29 = v26;
    uint32_t v30 = 32;
    goto LABEL_18;
  }
  uint64_t v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"ProcessExitHistogram"];
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v14 = [v13 dateByAddingTimeInterval:(double)v7 * -3600.0];
  uint64_t v15 = NSString;
  [v14 timeIntervalSince1970];
  uint64_t v17 = v16;
  [v13 timeIntervalSince1970];
  objc_msgSend(v15, "stringWithFormat:", @"SELECT %@ as LaunchdName, SUM(\"0s-5s\" + \"10s-60s\" + \"5s-10s\" + \"60s+\" + \"UnknownDuration\") as count from %@ WHERE %@ = %lld AND %@ = %lld AND timestamp > %f AND timestamp <= %f GROUP BY %@;",
    @"ProcessName",
    v12,
    @"ReasonNamespace",
    v11,
    @"ReasonCode",
    v9,
    v17,
    v18,
  uint64_t v19 = @"ProcessName");
  __int16 v20 = PLLogProcessMonitor();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = (uint64_t)v19;
    _os_log_impl(&dword_1D2690000, v20, OS_LOG_TYPE_INFO, "MemoryKills Query is %@", buf, 0xCu);
  }

  __int16 v21 = [(PLOperator *)self storage];
  uint64_t v22 = [v21 connection];
  uint64_t v23 = [v22 performQuery:v19];

  uint64_t v24 = PLLogProcessMonitor();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = [v23 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v33 = v25;
    __int16 v34 = 2112;
    uint64_t v35 = (uint64_t)v23;
    _os_log_impl(&dword_1D2690000, v24, OS_LOG_TYPE_INFO, "MemoryKills Result Count is %lu and result %@", buf, 0x16u);
  }

  uint64_t v26 = v23;
  size_t v27 = v26;
LABEL_14:

  return v27;
}

- (void)logEventPointSystemFreezerStats
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unsigned int v34 = 0;
  unint64_t v32 = 0;
  size_t v33 = 4;
  size_t v31 = 8;
  unsigned int v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SystemFreezerStats"];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
  int v5 = NSNumber;
  if (sysctlbyname("kern.memorystatus_freeze_budget_pages_remaining", &v32, &v31, 0, 0)) {
    uint64_t v6 = -1;
  }
  else {
    uint64_t v6 = v32;
  }
  uint64_t v7 = [v5 numberWithUnsignedLongLong:v6];
  [v4 setObject:v7 forKeyedSubscript:@"RemainingPages"];

  uint64_t v8 = NSNumber;
  if (sysctlbyname("kern.memorystatus_thaw_count", &v34, &v33, 0, 0)) {
    uint64_t v9 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v9 = v34;
  }
  id v10 = [v8 numberWithUnsignedInt:v9];
  [v4 setObject:v10 forKeyedSubscript:@"ThawCount"];

  uint64_t v11 = NSNumber;
  if (sysctlbyname("kern.memorystatus_freezer_thaw_percentage", &v32, &v31, 0, 0)) {
    uint64_t v12 = -1;
  }
  else {
    uint64_t v12 = v32;
  }
  uint64_t v13 = [v11 numberWithUnsignedLongLong:v12];
  [v4 setObject:v13 forKeyedSubscript:@"ThawPercentage"];

  int v14 = sysctlbyname("kern.memorystatus_freeze_pageouts", &v32, &v31, 0, 0);
  uint64_t v15 = v32;
  if (v14) {
    uint64_t v15 = -1;
  }
  if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
  {
    [v4 setObject:&unk_1F29E6538 forKeyedSubscript:@"ThawsPerGB"];
  }
  else
  {
    double v16 = (double)(unint64_t)(*MEMORY[0x1E4F14AE8] * v15) * 9.31322575e-10;
    uint64_t v17 = NSNumber;
    int v18 = sysctlbyname("kern.memorystatus_thaw_count_since_boot", &v32, &v31, 0, 0);
    double v19 = (double)v32;
    if (v18) {
      double v19 = 1.84467441e19;
    }
    __int16 v20 = [v17 numberWithDouble:v19 / v16];
    [v4 setObject:v20 forKeyedSubscript:@"ThawsPerGB"];
  }
  if (sysctlbyname("kern.memorystatus_freezer_refreeze_count", &v32, &v31, 0, 0)) {
    unint64_t v21 = -1;
  }
  else {
    unint64_t v21 = v32;
  }
  if (v21 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {
    [v4 setObject:&unk_1F29E6538 forKeyedSubscript:@"RefreezeAvgBytes"];
  }
  else
  {
    int v22 = sysctlbyname("kern.memorystatus_freezer_bytes_refrozen", &v32, &v31, 0, 0);
    unint64_t v23 = v32;
    if (v22) {
      unint64_t v23 = -1;
    }
    uint64_t v24 = [NSNumber numberWithUnsignedLongLong:v23 / v21];
    [v4 setObject:v24 forKeyedSubscript:@"RefreezeAvgBytes"];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  size_t v28 = 32;
  if (!sysctlbyname("vm.swapusage", &v29, &v28, 0, 0))
  {
    uint64_t v25 = [NSNumber numberWithUnsignedLongLong:(void)v30];
    [v4 setObject:v25 forKeyedSubscript:@"SwapUsed"];

    uint64_t v26 = [NSNumber numberWithUnsignedLongLong:(void)v29];
    [v4 setObject:v26 forKeyedSubscript:@"SwapTotal"];
  }
  size_t v27 = PLLogProcessMonitor();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v36 = v4;
    _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "Entry for System Freezer Stats : %@", buf, 0xCu);
  }

  [(PLOperator *)self logEntry:v4];
}

- (void)logEventPointFreezerStats
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(PLProcessMonitorAgent *)self getFrozenProcesses];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    int v5 = [v4 allKeys];
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    int v7 = -[PLProcessMonitorAgent getFrozenToSwapLedgerIndex:](self, "getFrozenToSwapLedgerIndex:", (int)[v6 intValue]);

    if (v7 == -1)
    {
      id v10 = PLLogProcessMonitor();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v41 = @"frozen_to_swap";
        _os_log_error_impl(&dword_1D2690000, v10, OS_LOG_TYPE_ERROR, "Ledger does not have key %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"FreezerStats"];
      uint64_t v9 = objc_opt_new();
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      unint64_t v32 = __50__PLProcessMonitorAgent_logEventPointFreezerStats__block_invoke;
      size_t v33 = &unk_1E692E578;
      unsigned int v34 = self;
      int v37 = v7;
      id v10 = v8;
      uint64_t v35 = v10;
      id v11 = v9;
      id v36 = v11;
      [v4 enumerateKeysAndObjectsUsingBlock:&v30];
      if ([v11 count])
      {
        uint64_t v38 = v10;
        id v39 = v11;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        [(PLOperator *)self logEntries:v12 withGroupID:v10];
      }
      uint64_t v13 = [(PLProcessMonitorAgent *)self lastFreezerProcs];

      if (v13)
      {
        int v14 = [(PLProcessMonitorAgent *)self lastFreezerProcs];
        uint64_t v15 = [(PLProcessMonitorAgent *)self getProcessesNotInFreezer:v14 withCurrentProcesses:v4];
        [(PLProcessMonitorAgent *)self setDiffFreezerProcs:v15];

        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v16 = objc_opt_class();
          uint64_t block = MEMORY[0x1E4F143A8];
          uint64_t v26 = 3221225472;
          size_t v27 = __50__PLProcessMonitorAgent_logEventPointFreezerStats__block_invoke_2;
          size_t v28 = &__block_descriptor_40_e5_v8__0lu32l8;
          uint64_t v29 = v16;
          if (qword_1EBD58B80 != -1) {
            dispatch_once(&qword_1EBD58B80, &block);
          }
          if (byte_1EBD58ACD)
          {
            uint64_t v17 = NSString;
            int v18 = [(PLProcessMonitorAgent *)self diffFreezerProcs];
            double v19 = [v17 stringWithFormat:@"Processes that moved out of freezer %@", v18, block, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35];

            __int16 v20 = (void *)MEMORY[0x1E4F929B8];
            unint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
            int v22 = [v21 lastPathComponent];
            unint64_t v23 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent logEventPointFreezerStats]"];
            [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:1487];

            uint64_t v24 = PLLogCommon();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v41 = v19;
              _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
      }
      [(PLProcessMonitorAgent *)self setLastFreezerProcs:v4];
    }
  }
}

void __50__PLProcessMonitorAgent_logEventPointFreezerStats__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a3;
  uint64_t v5 = (int)[a2 intValue];
  uint64_t v6 = [*(id *)(a1 + 32) ledgerDataAtIndex:*(unsigned int *)(a1 + 56) forPid:v5];
  if (v6)
  {
    int v7 = objc_opt_new();
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "credit") / 1024);
    [v7 setObject:v8 forKeyedSubscript:@"Credits"];

    uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "debit") / 1024);
    [v7 setObject:v9 forKeyedSubscript:@"Debits"];

    id v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "balance") / 1024);
    [v7 setObject:v10 forKeyedSubscript:@"Balance"];

    [v7 setObject:v14 forKeyedSubscript:@"ProcessName"];
    id v11 = [NSNumber numberWithLong:v5];
    [v7 setObject:v11 forKeyedSubscript:@"PID"];

    uint64_t v12 = [MEMORY[0x1E4F92A88] bundleIDFromPid:v5];
    [v7 setObject:v12 forKeyedSubscript:@"BundleID"];

    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 40) withRawData:v7];
    [*(id *)(a1 + 48) addObject:v13];
  }
}

uint64_t __50__PLProcessMonitorAgent_logEventPointFreezerStats__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ACD = result;
  return result;
}

- (void)logEventPointFreezerDemotion
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(PLProcessMonitorAgent *)self diffFreezerProcs];

  if (v3)
  {
    id v4 = objc_opt_new();
    uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"FreezerDemotion"];
    uint64_t v6 = [(PLProcessMonitorAgent *)self diffFreezerProcs];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __53__PLProcessMonitorAgent_logEventPointFreezerDemotion__block_invoke_625;
    v15[3] = &unk_1E692DA48;
    int v7 = v5;
    uint64_t v16 = v7;
    id v8 = v4;
    id v17 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v15];

    if ([v8 count])
    {
      double v19 = v7;
      id v20 = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      [(PLOperator *)self logEntries:v9 withGroupID:v7];
    }
LABEL_5:

    return;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PLProcessMonitorAgent_logEventPointFreezerDemotion__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD58B88 != -1) {
      dispatch_once(&qword_1EBD58B88, block);
    }
    if (byte_1EBD58ACE)
    {
      id v8 = [NSString stringWithFormat:@"No processes were evicted out of freezer"];
      id v11 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      uint64_t v13 = [v12 lastPathComponent];
      id v14 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent logEventPointFreezerDemotion]"];
      [v11 logMessage:v8 fromFile:v13 fromFunction:v14 fromLineNumber:1496];

      int v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v8;
        _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_5;
    }
  }
}

uint64_t __53__PLProcessMonitorAgent_logEventPointFreezerDemotion__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ACE = result;
  return result;
}

void __53__PLProcessMonitorAgent_logEventPointFreezerDemotion__block_invoke_625(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  uint64_t v5 = [a2 intValue];
  if (![MEMORY[0x1E4F92A88] getJetamPriority:v5])
  {
    uint64_t v6 = objc_opt_new();
    [v6 setObject:v10 forKeyedSubscript:@"ProcessName"];
    int v7 = [NSNumber numberWithInt:v5];
    [v6 setObject:v7 forKeyedSubscript:@"PID"];

    id v8 = [MEMORY[0x1E4F92A88] bundleIDFromPid:v5];
    [v6 setObject:v8 forKeyedSubscript:@"BundleID"];

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 32) withRawData:v6];
    [*(id *)(a1 + 40) addObject:v9];
  }
}

- (void)logEventPointSharedCacheReslid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SharedCacheReslid"];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8];
  uint64_t v6 = [MEMORY[0x1E4F92A88] processNameForPid:v3];
  [v5 setObject:v6 forKeyedSubscript:@"ProcessName"];

  int v7 = [NSNumber numberWithInt:v3];
  [v5 setObject:v7 forKeyedSubscript:@"PID"];

  [(PLOperator *)self logEntry:v5];
}

- (void)logEventPointAppResumePredictions:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    id v5 = a3;
    uint64_t v6 = [v4 now];
    int v7 = [v6 convertFromSystemToMonotonic];

    id v8 = [v5 objectForKeyedSubscript:@"appResumePredictions"];

    uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"AppResumePredictions"];
    id v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __59__PLProcessMonitorAgent_logEventPointAppResumePredictions___block_invoke;
    int v18 = &unk_1E692E5A0;
    id v11 = v9;
    id v19 = v11;
    id v12 = v7;
    id v20 = v12;
    id v13 = v10;
    id v21 = v13;
    [v8 enumerateObjectsUsingBlock:&v15];
    if (objc_msgSend(v13, "count", v15, v16, v17, v18))
    {
      id v22 = v11;
      v23[0] = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      [(PLOperator *)self logEntries:v14 withGroupID:v11];
    }
  }
}

void __59__PLProcessMonitorAgent_logEventPointAppResumePredictions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F929D0];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithEntryKey:*(void *)(a1 + 32) withRawData:v4];

  [v5 setEntryDate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObject:v5];
}

- (void)logEventPointAppNotFrozen:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    id v5 = a3;
    uint64_t v6 = [v4 now];
    int v7 = [v6 convertFromSystemToMonotonic];

    id v8 = [v5 objectForKeyedSubscript:@"Applications"];

    uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"AppNotFrozen"];
    id v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __51__PLProcessMonitorAgent_logEventPointAppNotFrozen___block_invoke;
    int v18 = &unk_1E692E5A0;
    id v11 = v9;
    id v19 = v11;
    id v12 = v7;
    id v20 = v12;
    id v13 = v10;
    id v21 = v13;
    [v8 enumerateObjectsUsingBlock:&v15];
    if (objc_msgSend(v13, "count", v15, v16, v17, v18))
    {
      id v22 = v11;
      v23[0] = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      [(PLOperator *)self logEntries:v14 withGroupID:v11];
    }
  }
}

void __51__PLProcessMonitorAgent_logEventPointAppNotFrozen___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F929D0];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithEntryKey:*(void *)(a1 + 32) withRawData:v4];

  [v5 setEntryDate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObject:v5];
}

- (void)logEventPointAppNapEnabled
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = proc_listpids(1u, 0, 0, 0);
  if ((v3 & 0x80000000) == 0)
  {
    int v4 = v3;
    size_t v5 = v3;
    uint64_t v6 = malloc_type_malloc(v3, 0x3F53CFA3uLL);
    if (v6)
    {
      int v7 = v6;
      id v19 = self;
      memset(v6, 255, v5);
      int v8 = proc_listpids(1u, 0, v7, v4);
      uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      id v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"AppNapEnabled"];
      id v11 = objc_opt_new();
      if (v8 >= 4)
      {
        if ((unint64_t)v8 >> 2 <= 1) {
          unint64_t v12 = 1;
        }
        else {
          unint64_t v12 = (unint64_t)v8 >> 2;
        }
        id v13 = (int *)v7;
        do
        {
          id v14 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10 withDate:v9];
          int v16 = *v13++;
          uint64_t v15 = v16;
          if (v16 >= 1)
          {
            memset(buffer, 0, sizeof(buffer));
            if (proc_pidinfo(v15, 18, 0, buffer, 192) == 192
              && DWORD1(buffer[0]) != 5
              && (BYTE2(buffer[0]) & 0x80) != 0)
            {
              id v17 = [NSNumber numberWithInt:v15];
              [v14 setObject:v17 forKeyedSubscript:@"PID"];

              [v11 addObject:v14];
            }
          }

          --v12;
        }
        while (v12);
      }
      if ([v11 count])
      {
        id v20 = v10;
        id v21 = v11;
        int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        [(PLOperator *)v19 logEntries:v18 withGroupID:v10];
      }
      free(v7);
    }
    else
    {
      uint64_t v9 = PLLogProcessMonitor();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buffer[0]) = 0;
        _os_log_error_impl(&dword_1D2690000, v9, OS_LOG_TYPE_ERROR, "Not enough memory to log AppNap Enabled, returning.", (uint8_t *)buffer, 2u);
      }
    }
  }
}

- (id)getJetsamSnapshotEntries:(jetsam_snapshot *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    size_t v5 = objc_opt_new();
    if (a3->var4)
    {
      unint64_t v6 = 0;
      var1 = a3->var5[0].var1;
      do
      {
        int v8 = [(PLProcessMonitorAgent *)self getProcessName:var1];
        if (v8)
        {
          uint64_t v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(var1 + 204)];
          [v5 setObject:v9 forKeyedSubscript:v8];
        }
        ++v6;
        var1 += 280;
      }
      while (a3->var4 > v6);
    }
    id v10 = PLLogProcessMonitor();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "getJSEIdleTime: memoryJetsamEntries %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    size_t v5 = 0;
  }
  return v5;
}

- (id)fetchSnapshotWithFlags:(unsigned int)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = memorystatus_control();
  if ((v4 & 0x80000000) != 0)
  {
    int v7 = PLLogProcessMonitor();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    id v11 = __error();
    int v12 = strerror(*v11);
    int v27 = 136315138;
    *(void *)size_t v28 = v12;
    int v8 = "memorystatus_control(MEMORYSTATUS_CMD_GET_JETSAM_SNAPSHOT) failed: %s";
LABEL_18:
    uint64_t v9 = v7;
    uint32_t v10 = 12;
    goto LABEL_19;
  }
  unsigned int v5 = v4;
  if (!v4)
  {
    int v7 = PLLogProcessMonitor();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    id v20 = __error();
    id v21 = strerror(*v20);
    int v27 = 136315138;
    *(void *)size_t v28 = v21;
    int v8 = "kernel returned (0) from memorystatus_control(MEMORYSTATUS_CMD_GET_JETSAM_SNAPSHOT) -- no jetsam data available %s";
    goto LABEL_18;
  }
  uint64_t v6 = v4;
  if (v4 >= 0xC9 && __ROR8__(0xAF8AF8AF8AF8AF8BLL * (v4 - 200), 3) >= 0xEA0EA0EA0EA0EBuLL)
  {
    int v7 = PLLogProcessMonitor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v27 = 134218240;
      *(void *)size_t v28 = v5 - 200;
      *(_WORD *)&v28[8] = 2048;
      *(void *)&v28[10] = 280;
      int v8 = "memorystatus_control gave snapshot size (%lu) not multiple of jetsam entry type (%lu)";
      uint64_t v9 = v7;
      uint32_t v10 = 22;
LABEL_19:
      _os_log_error_impl(&dword_1D2690000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v27, v10);
    }
LABEL_21:

LABEL_22:
    id v19 = 0;
    goto LABEL_23;
  }
  id v13 = malloc_type_malloc(v4, 0x66BF9BF9uLL);
  if (!v13)
  {
    int v7 = PLLogProcessMonitor();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    int v27 = 67109120;
    *(_DWORD *)size_t v28 = v5;
    int v8 = "unable to allocate %d bytes for jetsam snapshot";
    uint64_t v9 = v7;
    uint32_t v10 = 8;
    goto LABEL_19;
  }
  uint64_t v14 = v13;
  int v15 = memorystatus_control();
  if (v15 != v5)
  {
    int v23 = v15;
    uint64_t v24 = PLLogProcessMonitor();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = __error();
      uint64_t v26 = strerror(*v25);
      int v27 = 67109378;
      *(_DWORD *)size_t v28 = v23;
      *(_WORD *)&v28[4] = 2080;
      *(void *)&v28[6] = v26;
      _os_log_error_impl(&dword_1D2690000, v24, OS_LOG_TYPE_ERROR, "memorystatus_control returned unexpected value - %d: %s", (uint8_t *)&v27, 0x12u);
    }

    free(v14);
    goto LABEL_22;
  }
  unint64_t v16 = ((unint64_t)v5 - 200) / 0x118;
  if (v16 < v14[24])
  {
    id v17 = PLLogProcessMonitor();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v14[24];
      int v27 = 134218240;
      *(void *)size_t v28 = (v6 - 200) / 0x118uLL;
      *(_WORD *)&v28[8] = 2048;
      *(void *)&v28[10] = v18;
      _os_log_impl(&dword_1D2690000, v17, OS_LOG_TYPE_INFO, "Got fewer jetsam entries from the kernel; received %zu, expected %zu",
        (uint8_t *)&v27,
        0x16u);
    }

    v14[24] = v16;
  }
  id v19 = [(PLProcessMonitorAgent *)self getJetsamSnapshotEntries:v14];
  free(v14);
LABEL_23:
  return v19;
}

- (id)getProcessName:(char *)a3
{
  *(void *)&v9[4071] = *MEMORY[0x1E4F143B8];
  bzero(v9, 0xFDFuLL);
  long long v4 = *((_OWORD *)a3 + 1);
  v7[0] = *(_OWORD *)a3;
  v7[1] = v4;
  char v8 = a3[32];
  if (LOBYTE(v7[0]))
  {
    unsigned int v5 = [NSString stringWithUTF8String:v7];
  }
  else
  {
    unsigned int v5 = @"Unknown";
  }
  return v5;
}

- (id)getJSEIdleTime
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = [(PLProcessMonitorAgent *)self fetchSnapshotWithFlags:0];
  unsigned int v3 = PLLogProcessMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    uint64_t v6 = v2;
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "getJSEIdleTime: memoryJetsamEntries %@", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (void)logProcDirtyStats
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v4 = [(id)_reportProcDirtyStatsAfterTime compare:v3];
  int v5 = PLLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 != -1)
  {
    if (v6)
    {
      LODWORD(v32[0]) = 138412546;
      *(rusage_info_t *)((char *)v32 + 4) = v3;
      WORD2(v32[1]) = 2112;
      *(rusage_info_t *)((char *)&v32[1] + 6) = (rusage_info_t)_reportProcDirtyStatsAfterTime;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "ProcDirtyStats: Should Not Log to CoreAnalytics (current_time=%@ is not greater than report_stats_time=%@)", (uint8_t *)v32, 0x16u);
    }
    goto LABEL_4;
  }
  if (v6)
  {
    LODWORD(v32[0]) = 138412546;
    *(rusage_info_t *)((char *)v32 + 4) = v3;
    WORD2(v32[1]) = 2112;
    *(rusage_info_t *)((char *)&v32[1] + 6) = (rusage_info_t)_reportProcDirtyStatsAfterTime;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "ProcDirtyStats: Should Log to CoreAnalytics (current_time=%@ is greater than report_stats_time=%@)", (uint8_t *)v32, 0x16u);
  }

  uint64_t v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v8 = [v7 dateByAddingTimeInterval:(double)arc4random_uniform(0x15180u)];
  uint64_t v9 = (void *)_reportProcDirtyStatsAfterTime;
  _reportProcDirtyStatsAfterTime = v8;

  int v5 = [(PLProcessMonitorAgent *)self getJSEIdleTime];
  unsigned int v10 = proc_listpids(1u, 0, 0, 0);
  if ((v10 & 0x80000000) == 0)
  {
    int v11 = v10;
    size_t v12 = v10;
    id v13 = malloc_type_malloc(v10, 0x58EAFF28uLL);
    if (v13)
    {
      uint64_t v14 = v13;
      memset(v13, 255, v12);
      int v15 = proc_listpids(1u, 0, v14, v11);
      if (v15 < 4) {
        goto LABEL_10;
      }
      if ((unint64_t)v15 >> 2 <= 1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (unint64_t)v15 >> 2;
      }
      unint64_t v17 = 0x1E4F92000uLL;
      uint64_t v18 = (int *)v14;
      uint64_t v29 = v14;
      while (1)
      {
        int v20 = *v18++;
        uint64_t v19 = v20;
        if (v20 < 1) {
          goto LABEL_36;
        }
        memset(buffer, 0, sizeof(buffer));
        if (proc_pidinfo(v19, 18, 0, buffer, 192) != 192 || DWORD1(buffer[0]) == 5) {
          goto LABEL_36;
        }
        id v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(v32[0]) = 67109120;
          HIDWORD(v32[0]) = v19;
          _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "ProcDirtyStats: pid %d is not corpse, check if it is daemon", (uint8_t *)v32, 8u);
        }

        if (![*(id *)(v17 + 2696) isDaemonOrAppleXPCService:v19]) {
          goto LABEL_36;
        }
        uint64_t v22 = [(PLProcessMonitorAgent *)self getProcDirtyTimeLedgerIndex:v19];
        if (v22 == -1)
        {
          size_t v28 = PLLogProcessMonitor();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v32[0]) = 138412290;
            *(rusage_info_t *)((char *)v32 + 4) = @"memorystatus_dirty_time";
            _os_log_error_impl(&dword_1D2690000, v28, OS_LOG_TYPE_ERROR, "Ledger does not have key %@", (uint8_t *)v32, 0xCu);
          }

LABEL_10:
          free(v14);
          goto LABEL_4;
        }
        int v23 = [(PLProcessMonitorAgent *)self ledgerDataAtIndex:v22 forPid:v19];
        uint64_t v24 = v23;
        if (!v23)
        {
          uint64_t v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(v32[0]) = 0;
            _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "ProcDirtyStats: Error getting process dirty via ledger", (uint8_t *)v32, 2u);
          }

          goto LABEL_35;
        }
        [v23 balance];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v33 = 0u;
        memset(v32, 0, sizeof(v32));
        if (proc_pid_rusage(v19, 1, v32)) {
          break;
        }
        [*(id *)(v17 + 2696) secondsFromMachTime:mach_absolute_time() - (void)v36];
        if (v27 <= 0.0)
        {
          uint64_t v25 = PLLogCommon();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "ProcDirtyStats: Error encouncetered due to process lifetime <= 0", buf, 2u);
          }
          goto LABEL_33;
        }
LABEL_34:
        uint64_t v14 = v29;
LABEL_35:
        uint64_t v30 = v5;
        AnalyticsSendEventLazy();

        unint64_t v17 = 0x1E4F92000;
LABEL_36:
        if (!--v16) {
          goto LABEL_10;
        }
      }
      uint64_t v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "ProcDirtyStats: Error getting lifetime via rusage", buf, 2u);
      }
LABEL_33:

      goto LABEL_34;
    }
  }
LABEL_4:
}

id __42__PLProcessMonitorAgent_logProcDirtyStats__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unsigned int v3 = [MEMORY[0x1E4F92A88] binaryPathForPid:*(unsigned int *)(a1 + 56)];
  uint64_t v4 = [v3 lastPathComponent];

  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = @"Unknown";
  }
  [v2 setObject:v5 forKeyedSubscript:@"daemon_procname"];
  BOOL v6 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v2 setObject:v6 forKeyedSubscript:@"time_dirty_seconds"];

  uint64_t v7 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  [v2 setObject:v7 forKeyedSubscript:@"lifetime_seconds"];

  if (v4)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];

    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
      [v2 setObject:v9 forKeyedSubscript:@"jse_idle_time"];
    }
  }
  __int16 v10 = *(_WORD *)(a1 + 60);
  if (!v10)
  {
    double v11 = *(double *)(a1 + 48);
    if (v11 <= 0.0)
    {
      __int16 v10 = 0;
    }
    else
    {
      size_t v12 = [NSNumber numberWithDouble:*(double *)(a1 + 40) / v11 * 100.0];
      [v2 setObject:v12 forKeyedSubscript:@"percent_dirty"];

      __int16 v10 = *(_WORD *)(a1 + 60);
    }
  }
  id v13 = [NSNumber numberWithShort:v10];
  [v2 setObject:v13 forKeyedSubscript:@"collection_status"];

  uint64_t v14 = PLLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v16 = *(_DWORD *)(a1 + 56);
    v17[0] = 67109378;
    v17[1] = v16;
    __int16 v18 = 2112;
    id v19 = v2;
    _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "ProcDirtyStats: pid %d's statistics: %@", (uint8_t *)v17, 0x12u);
  }

  return v2;
}

- (void)logEventForwardAppResumeInferredCarry:(id)a3
{
  if (a3)
  {
    uint64_t v4 = *MEMORY[0x1E4F92D30];
    id v5 = a3;
    id v9 = +[PLOperator entryKeyForType:v4 andName:@"AppResumeInferredCarry"];
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9 withRawData:v5];

    [(PLOperator *)self logEntry:v6];
    uint64_t v7 = [v6 dictionary];
    uint64_t v8 = [v6 entryDate];
    [(PLOperator *)self logForSubsystem:@"BackgroundProcessing" category:@"AppResumeInferredCarry" data:v7 date:v8];
  }
}

- (void)logEventBackwardProcessExitHistogram:(id)a3 withStats:(id *)a4 withDate:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  context = (void *)MEMORY[0x1D942A350]();
  long long v42 = objc_opt_new();
  long long v45 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"ProcessExitHistogram"];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v9 = v7;
  id v40 = v8;
  id v43 = v9;
  uint64_t v46 = [v9 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v46)
  {
    uint64_t v44 = *(void *)v50;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v50 != v44) {
          objc_enumerationMutation(v9);
        }
        double v11 = *(void **)(*((void *)&v49 + 1) + 8 * v10);
        size_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v45 withDate:v8];
        id v13 = [v9 objectForKey:v11];
        unsigned int v14 = [v11 labelIdx];
        if (xpc_array_get_count(a4->var0) > v14)
        {
          int v15 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_array_get_string(a4->var0, objc_msgSend(v11, "labelIdx")));
          [v12 setObject:v15 forKeyedSubscript:@"ProcessName"];

          if ([v11 lastTTR] != -1)
          {
            int v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "lastTTR"));
            [v12 setObject:v16 forKeyedSubscript:@"lastTimeToRelaunch"];
          }
          unint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v11, "exitReasonNamespace"));
          [v12 setObject:v17 forKeyedSubscript:@"ReasonNamespace"];

          __int16 v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "exitReasonCode"));
          [v12 setObject:v18 forKeyedSubscript:@"ReasonCode"];

          id v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "duration_0"));
          [v12 setObject:v19 forKeyedSubscript:@"0s-5s"];

          uint64_t v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "duration_5"));
          [v12 setObject:v20 forKeyedSubscript:@"5s-10s"];

          id v21 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "duration_10"));
          [v12 setObject:v21 forKeyedSubscript:@"10s-60s"];

          uint64_t v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "duration_60_above"));
          [v12 setObject:v22 forKeyedSubscript:@"60s+"];

          int v23 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "duration_unknown"));
          [v12 setObject:v23 forKeyedSubscript:@"UnknownDuration"];

          [v42 addObject:v12];
LABEL_17:
          id v9 = v43;
          goto LABEL_18;
        }
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v24 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __81__PLProcessMonitorAgent_logEventBackwardProcessExitHistogram_withStats_withDate___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v24;
          if (qword_1EBD58B90 != -1) {
            dispatch_once(&qword_1EBD58B90, block);
          }
          if (byte_1EBD58ACF)
          {
            uint64_t v25 = [NSString stringWithFormat:@"Error: process exit buffer label index out of range."];
            uint64_t v26 = (void *)MEMORY[0x1E4F929B8];
            double v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
            size_t v28 = [v27 lastPathComponent];
            uint64_t v29 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent logEventBackwardProcessExitHistogram:withStats:withDate:]"];
            [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:1812];

            uint64_t v30 = PLLogCommon();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v56 = v25;
              _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            id v8 = v40;
            goto LABEL_17;
          }
        }
LABEL_18:

        ++v10;
      }
      while (v46 != v10);
      uint64_t v46 = [v9 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v46);
  }

  if ([v42 count])
  {
    long long v53 = v45;
    long long v54 = v42;
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    [(PLOperator *)self logEntries:v31 withGroupID:v45];
  }
  self->_processExitSummaryCount += [v42 count];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v32 = objc_opt_class();
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __81__PLProcessMonitorAgent_logEventBackwardProcessExitHistogram_withStats_withDate___block_invoke_665;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v32;
    if (qword_1EBD58B98 != -1) {
      dispatch_once(&qword_1EBD58B98, v47);
    }
    if (byte_1EBD58AD0)
    {
      long long v33 = objc_msgSend(NSString, "stringWithFormat:", @"processExitSummaryCount = %d\n", self->_processExitSummaryCount, context);
      long long v34 = (void *)MEMORY[0x1E4F929B8];
      long long v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      long long v36 = [v35 lastPathComponent];
      long long v37 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent logEventBackwardProcessExitHistogram:withStats:withDate:]"];
      [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:1837];

      long long v38 = PLLogCommon();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v56 = v33;
        _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v8 = v40;
      id v9 = v43;
    }
  }
}

uint64_t __81__PLProcessMonitorAgent_logEventBackwardProcessExitHistogram_withStats_withDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ACF = result;
  return result;
}

uint64_t __81__PLProcessMonitorAgent_logEventBackwardProcessExitHistogram_withStats_withDate___block_invoke_665(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AD0 = result;
  return result;
}

- (id)processMonitorMultiKeyFromProcessID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (proc_name(a3, buffer, 0x40u) < 1)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [NSString stringWithUTF8String:buffer];
  }
  BOOL v6 = [MEMORY[0x1E4F92A88] bundleIDFromPid:v3];
  if (!v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"PluginExecutableName" withValue:v5 withComparisonOperation:0];
    id v8 = [(PLOperator *)self storage];
    __int16 v18 = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    uint64_t v10 = [v8 lastEntryForKey:@"PLApplicationAgent_EventNone_AllPlugins" withComparisons:v9 isSingleton:1];

    if (v10)
    {
      BOOL v6 = [v10 objectForKeyedSubscript:@"PluginId"];
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  double v11 = objc_msgSend(NSNumber, "numberWithInt:", v3, @"PID");
  v17[0] = v11;
  v16[1] = @"ProcessName";
  size_t v12 = v5;
  if (!v5)
  {
    size_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v12;
  void v16[2] = @"BundleID";
  id v13 = v6;
  if (!v6)
  {
    id v13 = [MEMORY[0x1E4F1CA98] null];
  }
  _DWORD v17[2] = v13;
  unsigned int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  if (v6)
  {
    if (v5) {
      goto LABEL_15;
    }
  }
  else
  {

    if (v5) {
      goto LABEL_15;
    }
  }

LABEL_15:
  return v14;
}

- (void)logEventIntervalProcessMonitorIntervalUsingCache
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLProcessMonitorAgent *)self previousCacheDate];

  if (v3)
  {
    uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"ProcessMonitorInterval"];
    id v5 = objc_alloc(MEMORY[0x1E4F92A20]);
    BOOL v6 = [(PLProcessMonitorAgent *)self previousCacheDate];
    id v7 = (void *)[v5 initWithEntryKey:v4 withDate:v6];

    id v8 = [(PLProcessMonitorAgent *)self currentCachedDate];
    [v7 setObject:v8 forKeyedSubscript:@"timestampEnd"];

    [(PLProcessMonitorAgent *)self currentCachedTotalCPUTime];
    if (v9 > 0.0)
    {
      uint64_t v25 = v4;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v10 = [(PLProcessMonitorAgent *)self lastCPUTimeDict];
      double v11 = [v10 allKeys];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v27;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            int v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
            unint64_t v17 = [(PLProcessMonitorAgent *)self lastCPUTimeDict];
            __int16 v18 = [v17 objectForKeyedSubscript:v16];

            double v19 = (double)(unint64_t)objc_msgSend(v18, "cpu_time_diff");
            [(PLProcessMonitorAgent *)self currentCachedTotalCPUTime];
            if (v19 / v20 > 0.01)
            {
              id v21 = -[PLProcessMonitorAgent processMonitorMultiKeyFromProcessID:](self, "processMonitorMultiKeyFromProcessID:", [v16 intValue]);
              if (v21)
              {
                uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "cpu_time_diff"));
                [v7 setObject:v22 forKeyedSubscript:v21];
              }
            }
            if (objc_msgSend(v18, "shared_cache_reslid"))
            {
              int v23 = PLLogProcessMonitor();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                int v24 = [v16 intValue];
                *(_DWORD *)buf = 67109120;
                int v31 = v24;
                _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "Cache reslid for %d", buf, 8u);
              }

              -[PLProcessMonitorAgent logEventPointSharedCacheReslid:](self, "logEventPointSharedCacheReslid:", [v16 intValue]);
            }

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v13);
      }

      uint64_t v4 = v25;
    }
    [(PLOperator *)self logEntry:v7];
  }
  else
  {
    uint64_t v4 = PLLogProcessMonitor();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "ProcessMonitor cache not set yet", buf, 2u);
    }
  }
}

- (void)logEventIntervalProcessMonitorInterval
{
  if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
  {
    [(PLProcessMonitorAgent *)self updateProcessMonitorCache];
    [(PLProcessMonitorAgent *)self logEventIntervalProcessMonitorIntervalUsingCache];
  }
}

- (int)get_kthread_list:(unint64_t *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  memset(buffer, 0, sizeof(buffer));
  proc_pidinfo(0, 4, 0, buffer, 96);
  int v4 = DWORD1(v23);
  uint64_t v5 = 8 * SDWORD1(v23);
  int v6 = v5 + 120;
  id v7 = malloc_type_malloc(v5 + 120, 0xD6B13E90uLL);
  int v8 = proc_pidinfo(0, 28, 0, v7, v5 + 120);
  if (v8)
  {
    int v9 = v8;
    if (v8 == v5)
    {
      *a3 = (unint64_t *)v7;
    }
    else
    {
      if (v8 >= (int)v5)
      {
        if (v8 <= (int)v5) {
          return 0;
        }
        if (v8 >= v6)
        {
          *a3 = (unint64_t *)v7;
          return v6 >> 3;
        }
        size_t v17 = v8;
        __int16 v18 = v7;
        malloc_type_id_t v19 = 119782195;
      }
      else
      {
        size_t v17 = v8;
        __int16 v18 = v7;
        malloc_type_id_t v19 = 3594044251;
      }
      *a3 = (unint64_t *)malloc_type_realloc(v18, v17, v19);
      return v9 / 8;
    }
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__PLProcessMonitorAgent_get_kthread_list___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v10;
      if (qword_1EBD58BA0 != -1) {
        dispatch_once(&qword_1EBD58BA0, block);
      }
      if (byte_1EBD58AD1)
      {
        double v11 = [NSString stringWithFormat:@"proc_pidinfo(PROC_PIDLISTTHREADIDS) failed"];
        uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
        uint64_t v14 = [v13 lastPathComponent];
        uint64_t v15 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent get_kthread_list:]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1945];

        int v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v11;
          _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    return -1;
  }
  return v4;
}

uint64_t __42__PLProcessMonitorAgent_get_kthread_list___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AD1 = result;
  return result;
}

- (void)logEventIntervalKernelTaskMonitor
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  v81 = 0;
  int v3 = [(PLProcessMonitorAgent *)self get_kthread_list:&v81];
  if (v3 != -1)
  {
    int v4 = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    int v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"KernelTaskMonitor"];
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    v72 = [MEMORY[0x1E4F1CA48] array];
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    *(_OWORD *)buf = 0u;
    unsigned int v8 = [MEMORY[0x1E4F92A88] getHardwarePerfLevels];
    if (v8 - 3 > 0xFFFFFFFD)
    {
      unsigned int v16 = v8;
      uint64_t v73 = 40 * v8 + 8;
      size_t v17 = malloc_type_malloc(v73, 0x3979524uLL);
      if (v17)
      {
        v74 = v17;
        long long v67 = v5;
        long long v68 = v6;
        v70 = v7;
        if (v4 < 1)
        {
          double v20 = 0.0;
        }
        else
        {
          unsigned int v69 = v16;
          uint64_t v18 = 0;
          uint64_t v19 = 8 * v4;
          double v20 = 0.0;
          uint64_t v71 = v19;
          do
          {
            id v21 = (void *)MEMORY[0x1D942A350]();
            *(_OWORD *)buf = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            long long v90 = 0u;
            long long v91 = 0u;
            long long v92 = 0u;
            long long v93 = 0u;
            uint64_t v22 = proc_pidinfo(0, 15, *(void *)((char *)v81 + v18), buf, 112);
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v23 = objc_opt_class();
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __58__PLProcessMonitorAgent_logEventIntervalKernelTaskMonitor__block_invoke_690;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v23;
              if (qword_1EBD58BB0 != -1) {
                dispatch_once(&qword_1EBD58BB0, block);
              }
              if (byte_1EBD58AD3)
              {
                int v24 = objc_msgSend(NSString, "stringWithFormat:", @"retval = %d", v22);
                uint64_t v25 = (void *)MEMORY[0x1E4F929B8];
                uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
                long long v27 = [v26 lastPathComponent];
                long long v28 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent logEventIntervalKernelTaskMonitor]"];
                [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:2018];

                long long v29 = PLLogCommon();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v85 = 138412290;
                  *(void *)v86 = v24;
                  _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", v85, 0xCu);
                }
              }
            }
            if ((BYTE12(v88) & 2) == 0)
            {
              uint64_t v30 = [(PLProcessMonitorAgent *)self lastEntryDate];

              if (v30)
              {
                uint64_t v31 = *(void *)((char *)v81 + v18);
                uint64_t v32 = objc_alloc_init(KernelTaskMonitorStats);
                [(KernelTaskMonitorStats *)v32 setThread_id:v31];
                [(KernelTaskMonitorStats *)v32 setCpu_time:(double)(unint64_t)(*(void *)&buf[8] + *(void *)buf) / 1000000000.0];
                uint64_t v33 = [NSString stringWithUTF8String:&v90];
                [(KernelTaskMonitorStats *)v32 setThread_name:v33];
                bzero(v74, v73);
                int v34 = proc_pidinfo(0, 34, v31, v74, v73);
                if (v73 == v34)
                {
                  [(KernelTaskMonitorStats *)v32 setCpu_energy_p:v74[5] + [(KernelTaskMonitorStats *)v32 cpu_energy_p]];
                  if (v69 >= 2) {
                    [(KernelTaskMonitorStats *)v32 setCpu_energy_e:v74[10] + [(KernelTaskMonitorStats *)v32 cpu_energy_e]];
                  }
                  long long v35 = [NSNumber numberWithUnsignedLongLong:v31];
                  [v7 setObject:v32 forKeyedSubscript:v35];

                  long long v36 = [(PLProcessMonitorAgent *)self lastThreadIdToKTMonitorEntryDict];
                  long long v37 = [NSNumber numberWithUnsignedLongLong:v31];
                  long long v38 = [v36 objectForKeyedSubscript:v37];

                  if (v38)
                  {
                    long long v39 = [v38 thread_name];
                    id v40 = [(KernelTaskMonitorStats *)v32 thread_name];
                    int v41 = [v39 isEqualToString:v40];

                    if (v41)
                    {
                      id v42 = objc_alloc(MEMORY[0x1E4F929D0]);
                      id v43 = [(PLProcessMonitorAgent *)self lastEntryDate];
                      uint64_t v44 = (void *)[v42 initWithEntryKey:v68 withDate:v43];

                      [v44 setObject:v67 forKeyedSubscript:@"timestampEnd"];
                      long long v45 = [NSNumber numberWithUnsignedLongLong:v31];
                      [v44 setObject:v45 forKeyedSubscript:@"ThreadID"];

                      uint64_t v46 = [v38 thread_name];
                      [v44 setObject:v46 forKeyedSubscript:@"ThreadName"];

                      [(KernelTaskMonitorStats *)v32 cpu_time];
                      double v48 = v47;
                      [v38 cpu_time];
                      double v50 = v48 - v49;
                      long long v51 = [NSNumber numberWithDouble:v50];
                      [v44 setObject:v51 forKeyedSubscript:@"CPUTime"];

                      if (v50 > 0.0)
                      {
                        long long v52 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[KernelTaskMonitorStats cpu_energy_p](v32, "cpu_energy_p")- -[NSObject cpu_energy_p](v38, "cpu_energy_p"));
                        [v44 setObject:v52 forKeyedSubscript:@"CPUEnergyP"];

                        long long v53 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[KernelTaskMonitorStats cpu_energy_e](v32, "cpu_energy_e")- -[NSObject cpu_energy_e](v38, "cpu_energy_e"));
                        [v44 setObject:v53 forKeyedSubscript:@"CPUEnergyE"];

                        [v72 addObject:v44];
                      }
                      double v20 = v20 + v50;
                    }
                  }
                  id v7 = v70;
                }
                else
                {
                  int v54 = v34;
                  long long v38 = PLLogProcessMonitor();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)v85 = 67109376;
                    *(_DWORD *)v86 = v54;
                    *(_WORD *)&v86[4] = 2048;
                    *(void *)&v86[6] = v73;
                    _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "threadcounts syscall return size = %d, expected size = %zu", v85, 0x12u);
                  }
                }
                uint64_t v19 = v71;
              }
            }
            v18 += 8;
          }
          while (v19 != v18);
        }
        free(v74);
        free(v81);
        long long v55 = [(PLProcessMonitorAgent *)self lastEntryDate];

        uint64_t v5 = v67;
        int v6 = v68;
        if (v55)
        {
          long long v56 = objc_opt_new();
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          id v57 = v72;
          uint64_t v58 = [v57 countByEnumeratingWithState:&v75 objects:v84 count:16];
          if (v58)
          {
            uint64_t v59 = v58;
            uint64_t v60 = *(void *)v76;
            do
            {
              for (uint64_t i = 0; i != v59; ++i)
              {
                if (*(void *)v76 != v60) {
                  objc_enumerationMutation(v57);
                }
                long long v62 = *(void **)(*((void *)&v75 + 1) + 8 * i);
                long long v63 = [v62 objectForKeyedSubscript:@"CPUTime"];
                [v63 doubleValue];
                double v65 = v64 / v20;

                if (v65 > 0.01) {
                  [v56 addObject:v62];
                }
              }
              uint64_t v59 = [v57 countByEnumeratingWithState:&v75 objects:v84 count:16];
            }
            while (v59);
          }

          int v6 = v68;
          if ([v56 count])
          {
            v82 = v68;
            v83 = v56;
            long long v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
            [(PLOperator *)self logEntries:v66 withGroupID:v68];
          }
          id v7 = v70;
        }
        [(PLProcessMonitorAgent *)self setLastEntryDate:v67];
        [(PLProcessMonitorAgent *)self setLastThreadIdToKTMonitorEntryDict:v7];
        goto LABEL_54;
      }
      int v9 = PLLogProcessMonitor();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v85 = 0;
        uint64_t v10 = "Error in allocating memory for proc_threadcounts";
        goto LABEL_58;
      }
    }
    else
    {
      int v9 = PLLogProcessMonitor();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v85 = 0;
        uint64_t v10 = "Error in retrieving hardware performance levels";
LABEL_58:
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, v10, v85, 2u);
      }
    }

LABEL_54:
LABEL_55:

    return;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __58__PLProcessMonitorAgent_logEventIntervalKernelTaskMonitor__block_invoke;
    v80[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v80[4] = v11;
    if (qword_1EBD58BA8 != -1) {
      dispatch_once(&qword_1EBD58BA8, v80);
    }
    if (byte_1EBD58AD2)
    {
      uint64_t v5 = [NSString stringWithFormat:@"Error in retrieving thread id list"];
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      uint64_t v14 = [v13 lastPathComponent];
      uint64_t v15 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent logEventIntervalKernelTaskMonitor]"];
      [v12 logMessage:v5 fromFile:v14 fromFunction:v15 fromLineNumber:1984];

      int v6 = PLLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_55;
    }
  }
}

uint64_t __58__PLProcessMonitorAgent_logEventIntervalKernelTaskMonitor__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AD2 = result;
  return result;
}

uint64_t __58__PLProcessMonitorAgent_logEventIntervalKernelTaskMonitor__block_invoke_690(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AD3 = result;
  return result;
}

+ (unint64_t)PIDToCoalitionID:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  memset(buffer, 0, sizeof(buffer));
  int v3 = proc_pidinfo(a3, 20, 1uLL, buffer, 40);
  if (v3 == 40) {
    return *(void *)&buffer[0];
  }
  int v5 = v3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLProcessMonitorAgent_PIDToCoalitionID___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD58BB8 != -1) {
      dispatch_once(&qword_1EBD58BB8, block);
    }
    if (byte_1EBD58AD4)
    {
      id v7 = [NSString stringWithFormat:@"proc_pidinfo(PROC_PIDCOALITIONINFO) failed\n"];
      unsigned int v8 = (void *)MEMORY[0x1E4F929B8];
      int v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      uint64_t v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"+[PLProcessMonitorAgent PIDToCoalitionID:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:2109];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        size_t v17 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  return -v5;
}

uint64_t __42__PLProcessMonitorAgent_PIDToCoalitionID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58AD4 = result;
  return result;
}

+ (BOOL)enableThreadStatsLogging
{
  if (qword_1EBD58BC0 != -1) {
    dispatch_once(&qword_1EBD58BC0, &__block_literal_global_699);
  }
  return byte_1EBD58AD5;
}

void __49__PLProcessMonitorAgent_enableThreadStatsLogging__block_invoke()
{
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    int v0 = [MEMORY[0x1E4F929C0] BOOLForKey:@"PLThreadStats_Enabled" ifNotSet:0];
    byte_1EBD58AD5 = v0;
    if (!v0) {
      return;
    }
  }
  else if (!byte_1EBD58AD5)
  {
    return;
  }
  v1 = PLLogCommon();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1D2690000, v1, OS_LOG_TYPE_INFO, "thread stats: enabled", v2, 2u);
  }
}

- (void)initializeThreadStatsLogging
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (+[PLProcessMonitorAgent enableThreadStatsLogging])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F92A70]);
    double v4 = *MEMORY[0x1E4F92DD0];
    uint64_t v5 = *MEMORY[0x1E4F92DC8];
    id v10 = 0;
    uint64_t v6 = (void *)[v3 initWithTimeFilter:v5 withPercentFilter:0 withProcessThreadMapping:&v10 withError:v4];
    id v7 = v10;
    [(PLProcessMonitorAgent *)self setThreadStats:v6];

    if (v7)
    {
      unsigned int v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_error_impl(&dword_1D2690000, v8, OS_LOG_TYPE_ERROR, "thread stats: error initializing: %@", buf, 0xCu);
      }

      [(PLProcessMonitorAgent *)self setThreadStats:0];
    }
    int v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2690000, v9, OS_LOG_TYPE_INFO, "thread stats: initialized", buf, 2u);
    }
  }
}

- (void)logThreadStats
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLProcessMonitorAgent *)self threadStats];

  if (v3)
  {
    double v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"ThreadStats"];
    uint64_t v6 = [(PLProcessMonitorAgent *)self threadStats];
    id v7 = [v6 diffSinceLastSnapshot];

    unsigned int v8 = [MEMORY[0x1E4F1CA48] array];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __39__PLProcessMonitorAgent_logThreadStats__block_invoke;
    v15[3] = &unk_1E692E618;
    id v9 = v5;
    id v16 = v9;
    id v10 = v4;
    id v17 = v10;
    id v11 = v8;
    id v18 = v11;
    [v7 enumerateKeysAndObjectsUsingBlock:v15];
    if ([v11 count])
    {
      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [v11 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v22 = v13;
        _os_log_impl(&dword_1D2690000, v12, OS_LOG_TYPE_INFO, "thread stats: logging %lu entries", buf, 0xCu);
      }

      id v19 = v9;
      id v20 = v11;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      [(PLOperator *)self logEntries:v14 withGroupID:v9];
    }
  }
}

void __39__PLProcessMonitorAgent_logThreadStats__block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 threadNameToInfo];
  if (v7)
  {
    unsigned int v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "pid"));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__PLProcessMonitorAgent_logThreadStats__block_invoke_2;
    v10[3] = &unk_1E692E5F0;
    id v11 = a1[4];
    id v12 = a1[5];
    id v13 = v8;
    id v14 = v5;
    id v15 = a1[6];
    id v9 = v8;
    [v7 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

void __39__PLProcessMonitorAgent_logThreadStats__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F929D0];
  id v6 = a3;
  id v7 = a2;
  id v14 = (id)[[v5 alloc] initWithEntryKey:*(void *)(a1 + 32) withDate:*(void *)(a1 + 40)];
  [v14 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"PID"];
  [v14 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"ProcessName"];
  [v14 setObject:v7 forKeyedSubscript:@"ThreadName"];

  [v6 systemTime];
  unint64_t v9 = (unint64_t)(v8 * 1000.0);
  [v6 userTime];
  double v11 = v10;

  id v12 = [NSNumber numberWithUnsignedLongLong:v9];
  [v14 setObject:v12 forKeyedSubscript:@"SysTime"];

  id v13 = [NSNumber numberWithUnsignedLongLong:(unint64_t)(v11 * 1000.0)];
  [v14 setObject:v13 forKeyedSubscript:@"UsrTime"];

  [*(id *)(a1 + 64) addObject:v14];
}

- (void)logEventBackwardAppLaunchTimeSeries:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v22 = self;
    id v6 = PLLogProcessMonitor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v5;
      _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "Got payload for App Launch Signposts : %@", buf, 0xCu);
    }

    id v7 = objc_opt_new();
    double v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"AppLaunchTimeSeries"];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v23 = v5;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
          id v14 = objc_opt_new();
          id v15 = [v13 objectForKeyedSubscript:@"bundleID"];
          [v14 setObject:v15 forKeyedSubscript:@"BundleID"];

          id v16 = [v13 objectForKeyedSubscript:@"IsForeground"];
          [v14 setObject:v16 forKeyedSubscript:@"IsForeground"];

          id v17 = [v13 objectForKeyedSubscript:@"duration"];
          [v14 setObject:v17 forKeyedSubscript:@"Duration"];

          id v18 = [v13 objectForKeyedSubscript:@"beginDate"];
          id v19 = [v18 convertFromSystemToMonotonic];

          id v20 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v14];
          [v20 setEntryDate:v19];
          [v7 addObject:v20];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      long long v29 = v8;
      uint64_t v30 = v7;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      [(PLOperator *)v22 logEntries:v21 withGroupID:v8];
    }
    id v5 = v23;
  }
  else
  {
    id v7 = PLLogProcessMonitor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Empty App Launch Payload", buf, 2u);
    }
  }
}

- (NSDate)currentCachedDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentCachedDate:(id)a3
{
}

- (NSDate)previousCacheDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPreviousCacheDate:(id)a3
{
}

- (double)currentCachedTotalCPUTime
{
  return self->_currentCachedTotalCPUTime;
}

- (void)setCurrentCachedTotalCPUTime:(double)a3
{
  self->_currentCachedTotalCPUTime = a3;
}

- (BOOL)firstBoot
{
  return self->_firstBoot;
}

- (void)setFirstBoot:(BOOL)a3
{
  self->_firstBoot = a3;
}

- (PLMonotonicTimer)logTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLogTimer:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
}

- (PLNSNotificationOperatorComposition)asertionNotifications
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAsertionNotifications:(id)a3
{
}

- (NSMutableSet)processes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setProcesses:(id)a3
{
}

- (NSDictionary)lastCPUTimeDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastCPUTimeDict:(id)a3
{
}

- (NSDictionary)lastThreadIdToKTMonitorEntryDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLastThreadIdToKTMonitorEntryDict:(id)a3
{
}

- (NSDate)lastEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastEntryDate:(id)a3
{
}

- (BOOL)launchServiceStatsEnabled
{
  return self->_launchServiceStatsEnabled;
}

- (void)setLaunchServiceStatsEnabled:(BOOL)a3
{
  self->_launchServiceStatsEnabled = a3;
}

- (int64_t)processExitSummaryCount
{
  return self->_processExitSummaryCount;
}

- (void)setProcessExitSummaryCount:(int64_t)a3
{
  self->_int64_t processExitSummaryCount = a3;
}

- (NSDictionary)lastFreezerProcs
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastFreezerProcs:(id)a3
{
}

- (NSDictionary)diffFreezerProcs
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDiffFreezerProcs:(id)a3
{
}

- (PLXPCListenerOperatorComposition)appResumePredictionsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAppResumePredictionsListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)appResumeInferredCarryListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAppResumeInferredCarryListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)appNotFrozenListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAppNotFrozenListener:(id)a3
{
}

- (PLXPCResponderOperatorComposition)memoryKillsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setMemoryKillsResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)hudKillsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setHudKillsResponder:(id)a3
{
}

- (PLThreadStats)threadStats
{
  return (PLThreadStats *)objc_getProperty(self, a2, 200, 1);
}

- (void)setThreadStats:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadStats, 0);
  objc_storeStrong((id *)&self->_hudKillsResponder, 0);
  objc_storeStrong((id *)&self->_memoryKillsResponder, 0);
  objc_storeStrong((id *)&self->_appNotFrozenListener, 0);
  objc_storeStrong((id *)&self->_appResumeInferredCarryListener, 0);
  objc_storeStrong((id *)&self->_appResumePredictionsListener, 0);
  objc_storeStrong((id *)&self->_diffFreezerProcs, 0);
  objc_storeStrong((id *)&self->_lastFreezerProcs, 0);
  objc_storeStrong((id *)&self->_lastEntryDate, 0);
  objc_storeStrong((id *)&self->_lastThreadIdToKTMonitorEntryDict, 0);
  objc_storeStrong((id *)&self->_lastCPUTimeDict, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_asertionNotifications, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->_logTimer, 0);
  objc_storeStrong((id *)&self->_previousCacheDate, 0);
  objc_storeStrong((id *)&self->_currentCachedDate, 0);
}

@end