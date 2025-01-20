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
  v23 = &unk_1F4011F88;
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
  v19[0] = &unk_1F4011F88;
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
  v24[0] = &unk_1F4011F98;
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
  v24[0] = &unk_1F4011F88;
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
  v20[0] = &unk_1F4011F88;
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
  v14[0] = &unk_1F4011F88;
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
  v14[0] = &unk_1F4011F88;
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
  v16[0] = &unk_1F4011F88;
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
  v16[0] = &unk_1F4011F88;
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
  v12[0] = &unk_1F4011F88;
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
  v19[0] = &unk_1F4011F98;
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
    v11 = &unk_1F4011F88;
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
    v20[0] = &unk_1F4011F88;
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
  v16[0] = &unk_1F4011F88;
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
  v27[0] = &unk_1F4011FA8;
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
  v22[0] = &unk_1F4011F98;
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
  v28[0] = &unk_1F4011F88;
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
  return &unk_1F400F768;
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
}

uint64_t __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E4220000, v2, OS_LOG_TYPE_DEFAULT, "ProcessMonitor: Received SBC notification!", v5, 2u);
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
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) logProcDirtyStats];
  [*(id *)(a1 + 32) logThreadStats];
  return [*(id *)(a1 + 32) logEventPointAppNapEnabled];
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_423(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  v7 = PLLogProcessMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_423_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointAppResumePredictions:v6];
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_432(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  v7 = PLLogProcessMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_432_cold_1();
  }

  [*(id *)(a1 + 32) logEventPointAppNotFrozen:v6];
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_437(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  v7 = PLLogProcessMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_437_cold_1();
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
    _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_INFO, "MemoryKills query received with info: %@", (uint8_t *)&v13, 0xCu);
  }

  id v8 = [*(id *)(a1 + 32) getProcessExits:v6];
  v9 = v8;
  if (v8 && [v8 count])
  {
    objc_super v10 = objc_opt_new();
    [v10 setObject:v9 forKeyedSubscript:@"ProcessExits"];
  }
  else
  {
    v11 = PLLogProcessMonitor();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_449_cold_1();
    }

    objc_super v10 = 0;
  }

  return v10;
}

id __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_464(uint64_t a1)
{
  uint64_t v2 = PLLogProcessMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1E4220000, v2, OS_LOG_TYPE_INFO, "HUD Terminations query received", v8, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) getAllProcessExitsInLastHour];
  v4 = v3;
  if (v3 && [v3 count])
  {
    v5 = objc_opt_new();
    [v5 setObject:v4 forKeyedSubscript:@"ProcessExits"];
  }
  else
  {
    id v6 = PLLogProcessMonitor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_464_cold_1();
    }

    v5 = 0;
  }

  return v5;
}

- (void)updateProcessExitSummary
{
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
    if (updateProcessExitSummary_defaultOnce != -1) {
      dispatch_once(&updateProcessExitSummary_defaultOnce, v15);
    }
    if (updateProcessExitSummary_classDebugEnabled)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Init processExitSummaryCount = %d\n", self->_processExitSummaryCount);
      v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      v9 = [v8 lastPathComponent];
      objc_super v10 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent updateProcessExitSummary]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:796];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  dispatch_time_t v12 = dispatch_time(0, 86400000000000);
  int v13 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke_472;
  block[3] = &unk_1E6E47848;
  block[4] = self;
  dispatch_after(v12, v13, block);
}

uint64_t __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateProcessExitSummary_classDebugEnabled = result;
  return result;
}

void __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke_472(uint64_t a1)
{
  [*(id *)(a1 + 32) setProcessExitSummaryCount:0];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    int v13 = __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke_2;
    id v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v15 = v2;
    if (kPLProcessMonitorAgentAddProcessesOfInterestNotificationName_block_invoke_defaultOnce != -1) {
      dispatch_once(&kPLProcessMonitorAgentAddProcessesOfInterestNotificationName_block_invoke_defaultOnce, &block);
    }
    if (kPLProcessMonitorAgentAddProcessesOfInterestNotificationName_block_invoke_classDebugEnabled)
    {
      uint64_t v3 = NSString;
      uint64_t v4 = [*(id *)(a1 + 32) processExitSummaryCount];
      uint64_t v5 = objc_msgSend(v3, "stringWithFormat:", @"Reset processExitSummaryCount = %d\n", v4, block, v12, v13, v14, v15);
      id v6 = (void *)MEMORY[0x1E4F929B8];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      id v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent updateProcessExitSummary]_block_invoke"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:802];

      objc_super v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLProcessMonitorAgentAddProcessesOfInterestNotificationName_block_invoke_classDebugEnabled = result;
  return result;
}

- (void)enableProcessExitLogging
{
  strerror(a1);
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_10_4(&dword_1E4220000, v1, v2, "Failed to enable launch_service_stats(%d):%s", v3, v4, v5, v6, v7);
}

uint64_t __49__PLProcessMonitorAgent_enableProcessExitLogging__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  enableProcessExitLogging_classDebugEnabled = result;
  return result;
}

- (void)disableProcessExitLogging
{
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
      v18 = __50__PLProcessMonitorAgent_disableProcessExitLogging__block_invoke_484;
      v19 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v20 = v4;
      if (disableProcessExitLogging_defaultOnce_482 != -1) {
        dispatch_once(&disableProcessExitLogging_defaultOnce_482, &block);
      }
      if (disableProcessExitLogging_classDebugEnabled_483)
      {
        uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to disable launch_service_stats(%d):%s", v2, strerror(v2), block, v17, v18, v19, v20);
        uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
        uint8_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
        id v8 = [v7 lastPathComponent];
        v9 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent disableProcessExitLogging]"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:833];

        objc_super v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
LABEL_14:
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
    if (disableProcessExitLogging_defaultOnce != -1) {
      dispatch_once(&disableProcessExitLogging_defaultOnce, v21);
    }
    if (disableProcessExitLogging_classDebugEnabled)
    {
      uint64_t v5 = [NSString stringWithFormat:@"launch_service_stats successfully disabled."];
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      int v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      id v14 = [v13 lastPathComponent];
      uint64_t v15 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent disableProcessExitLogging]"];
      [v12 logMessage:v5 fromFile:v14 fromFunction:v15 fromLineNumber:830];

      objc_super v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
      goto LABEL_14;
    }
  }
}

uint64_t __50__PLProcessMonitorAgent_disableProcessExitLogging__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  disableProcessExitLogging_classDebugEnabled = result;
  return result;
}

uint64_t __50__PLProcessMonitorAgent_disableProcessExitLogging__block_invoke_484(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  disableProcessExitLogging_classDebugEnabled_483 = result;
  return result;
}

- (id)eventForwardProcessIDForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v5 = +[PLProcessMonitorAgent PIDToCoalitionID:](PLProcessMonitorAgent, "PIDToCoalitionID:");
  uint64_t v6 = [(PLProcessMonitorAgent *)self processMonitorMultiKeyFromProcessID:v3];
  uint8_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ProcessID"];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v6];
  v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
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
    +[PLUtilities secondsFromMachTime:*((void *)a4 + 2)];
    [(ProcessMonitorStats *)v17 setCpu_time:(unint64_t)v18];
    [(ProcessMonitorStats *)v17 setShared_cache_reslid:*((_DWORD *)a4 + 74) & 1];
    v19 = [(PLProcessMonitorAgent *)self lastCPUTimeDict];
    uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithInt:v10];
    v21 = [v19 objectForKeyedSubscript:v20];

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
        _os_log_debug_impl(&dword_1E4220000, v22, OS_LOG_TYPE_DEBUG, "CPU Time Difference calculation for pid[%d] %llu %llu", (uint8_t *)v24, 0x1Cu);
      }
    }
    else
    {
      [(ProcessMonitorStats *)v17 setCpu_time_diff:0];
    }
    if ([(ProcessMonitorStats *)v17 cpu_time_diff]) {
      *a6 += [(ProcessMonitorStats *)v17 cpu_time_diff];
    }
    v23 = [MEMORY[0x1E4F28ED0] numberWithInt:v10];
    [v13 setObject:v17 forKeyedSubscript:v23];
  }
}

- (void)updateProcessMonitorCache
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4E7EF70](self, a2);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  unint64_t v5 = objc_opt_new();
  unint64_t v34 = 0;
  uint64_t v6 = objc_opt_new();
  memset(__b, 255, sizeof(__b));
  unint64_t v7 = 0x1E6E46000uLL;
  if (+[PLUtilities isPowerlogHelperd])
  {
    id v8 = [(PLProcessMonitorAgent *)self processes];
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
            v16 = (void *)MEMORY[0x1E4E7EF70]();
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
      unint64_t v7 = 0x1E6E46000;
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
        v21 = (void *)MEMORY[0x1E4E7EF70](v18);
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
  if ([v6 count] && (objc_msgSend(*(id *)(v7 + 3800), "isPowerlogHelperd") & 1) == 0)
  {
    uint64_t v22 = [v6 objectAtIndexedSubscript:0];
    v23 = [v22 entryKey];
    v35 = v23;
    v36 = v6;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
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
      if (getFrozenProcesses_defaultOnce != -1) {
        dispatch_once(&getFrozenProcesses_defaultOnce, &block);
      }
      if (getFrozenProcesses_classDebugEnabled)
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
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
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
          uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*((unsigned int *)v4 - 1)];
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
  getFrozenProcesses_classDebugEnabled = result;
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
  v4[3] = &unk_1E6E47F58;
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
  v4[3] = &unk_1E6E47F58;
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  if ((ledger() & 0x80000000) != 0)
  {
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_27;
    }
    uint64_t v10 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (ledgerDataAtIndex_forPid__defaultOnce != -1) {
      dispatch_once(&ledgerDataAtIndex_forPid__defaultOnce, block);
    }
    if (!ledgerDataAtIndex_forPid__classDebugEnabled) {
      goto LABEL_27;
    }
    uint64_t v11 = [NSString stringWithFormat:@"Error in ledger info"];
    uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
    id v14 = [v13 lastPathComponent];
    uint64_t v15 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent ledgerDataAtIndex:forPid:]"];
    [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1056];

    v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v32 = *((void *)&v36 + 1);
  id v6 = (char *)malloc_type_malloc(48 * *((void *)&v36 + 1), 0x3DE92795uLL);
  if (!v6)
  {
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_27;
    }
    uint64_t v24 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke_508;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (ledgerDataAtIndex_forPid__defaultOnce_506 != -1) {
      dispatch_once(&ledgerDataAtIndex_forPid__defaultOnce_506, v31);
    }
    if (!ledgerDataAtIndex_forPid__classDebugEnabled_507) {
      goto LABEL_27;
    }
    uint64_t v11 = [NSString stringWithFormat:@"Failed to allocate ledger entry info"];
    __int16 v25 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
    __int16 v27 = [v26 lastPathComponent];
    uint64_t v28 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent ledgerDataAtIndex:forPid:]"];
    [v25 logMessage:v11 fromFile:v27 fromFunction:v28 fromLineNumber:1065];

    v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }
    goto LABEL_26;
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
    goto LABEL_28;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke_514;
    v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v30[4] = v17;
    if (ledgerDataAtIndex_forPid__defaultOnce_512 != -1) {
      dispatch_once(&ledgerDataAtIndex_forPid__defaultOnce_512, v30);
    }
    if (ledgerDataAtIndex_forPid__classDebugEnabled_513)
    {
      long long v18 = objc_msgSend(NSString, "stringWithFormat:", @"Could not get ledger entry info for pid %ld and frozen to swap index %d and ledger count %lld", a4, v5, v32);
      long long v19 = (void *)MEMORY[0x1E4F929B8];
      long long v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      uint64_t v21 = [v20 lastPathComponent];
      uint64_t v22 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent ledgerDataAtIndex:forPid:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:1069];

      v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  free(v7);
LABEL_27:
  id v8 = 0;
LABEL_28:
  return v8;
}

uint64_t __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  ledgerDataAtIndex_forPid__classDebugEnabled = result;
  return result;
}

uint64_t __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke_508(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  ledgerDataAtIndex_forPid__classDebugEnabled_507 = result;
  return result;
}

uint64_t __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke_514(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  ledgerDataAtIndex_forPid__classDebugEnabled_513 = result;
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
  if ([(PLOperator *)self isDebugEnabled])
  {
    uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"MemoryTracking"];
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
    uint64_t v27 = 0;
    int v26 = 0;
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
        if (logEventPointMemoryTracking_defaultOnce != -1) {
          dispatch_once(&logEventPointMemoryTracking_defaultOnce, block);
        }
        if (logEventPointMemoryTracking_classDebugEnabled)
        {
          id v6 = [NSString stringWithFormat:@"error with malloc_get_all_zones"];
          unint64_t v7 = (void *)MEMORY[0x1E4F929B8];
          id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
          uint64_t v9 = [v8 lastPathComponent];
          uint64_t v10 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent logEventPointMemoryTracking]"];
          [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1104];

          uint64_t v11 = PLLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
    }
    else
    {
      memset(&v23, 0, sizeof(v23));
      mstats(&v23);
      uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)v23.bytes_total * 0.0009765625];
      [v4 setObject:v12 forKeyedSubscript:@"HeapTotal"];

      uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)v23.bytes_used * 0.0009765625];
      [v4 setObject:v13 forKeyedSubscript:@"HeapUsed"];

      id v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)v23.bytes_free * 0.0009765625];
      [v4 setObject:v14 forKeyedSubscript:@"HeapFree"];

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v15 = objc_opt_class();
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        void v22[2] = __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke_536;
        v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        void v22[4] = v15;
        if (logEventPointMemoryTracking_defaultOnce_534 != -1) {
          dispatch_once(&logEventPointMemoryTracking_defaultOnce_534, v22);
        }
        if (logEventPointMemoryTracking_classDebugEnabled_535)
        {
          v16 = objc_msgSend(NSString, "stringWithFormat:", @"heap: total=%f used=%f free=%f", (double)v23.bytes_total * 0.0009765625, (double)v23.bytes_used * 0.0009765625, (double)v23.bytes_free * 0.0009765625);
          uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
          long long v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
          long long v19 = [v18 lastPathComponent];
          long long v20 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent logEventPointMemoryTracking]"];
          [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:1127];

          uint64_t v21 = PLLogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
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
  logEventPointMemoryTracking_classDebugEnabled = result;
  return result;
}

uint64_t __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke_524(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointMemoryTracking_classDebugEnabled_523 = result;
  return result;
}

uint64_t __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke_530(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointMemoryTracking_classDebugEnabled_529 = result;
  return result;
}

uint64_t __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke_536(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointMemoryTracking_classDebugEnabled_535 = result;
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
                  [MEMORY[0x1E4F28ED0] numberWithInt:v14];
                  v18 = unint64_t v17 = v13;
                  [v16 setObject:v18 forKeyedSubscript:@"PID"];

                  unint64_t v13 = v17;
                  long long v19 = +[PLUtilities bundleIDFromPid:v14];
                  [v16 setObject:v19 forKeyedSubscript:@"BundleID"];

                  long long v20 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*((void *)&v62 + 1)];
                  [v16 setObject:v20 forKeyedSubscript:@"PhyFootprint"];

                  uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:(void)v63];
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
            uint64_t v32 = [MEMORY[0x1E4F28ED0] numberWithInt:v30];
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
            long long v39 = [v38 objectForKeyedSubscript:@"StartOrder"];
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
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 2080;
  *(void *)(buf + 10) = a1;
  _os_log_error_impl(&dword_1E4220000, log, OS_LOG_TYPE_ERROR, "Failed to fetch launch_service_stats(%d):%s", buf, 0x12u);
}

uint64_t __39__PLProcessMonitorAgent_logProcessExit__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"ProcessExitSummaryRowThreshold"];
  logProcessExit_objectForKey = result;
  return result;
}

uint64_t __39__PLProcessMonitorAgent_logProcessExit__block_invoke_548(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"ThresholdToSkipAppExitDetail"];
  logProcessExit_objectForKey_547 = result;
  return result;
}

uint64_t __39__PLProcessMonitorAgent_logProcessExit__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"ThresholdToSkipProcessExitDetail"];
  logProcessExit_objectForKey_550 = result;
  return result;
}

- (void)logEventPointProcessExit:(id)a3 excludeProcesses:(id)a4 withStats:(id *)a5 withDate:(id)a6 withNowInSec:(unint64_t)a7
{
  long long v39 = self;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v51 = a4;
  id v48 = a6;
  long long v42 = v9;
  uint64_t v10 = [v9 allKeys];
  uint64_t v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_553];

  long long v47 = objc_opt_new();
  long long v46 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ProcessExit"];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v11;
  uint64_t v43 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v43)
  {
    uint64_t v41 = *(void *)v63;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v63 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v12;
        unint64_t v13 = objc_msgSend(v42, "objectForKeyedSubscript:", *(void *)(*((void *)&v62 + 1) + 8 * v12), v39);
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v49 = v13;
        uint64_t v52 = [v49 countByEnumeratingWithState:&v58 objects:v68 count:16];
        if (v52)
        {
          uint64_t v14 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v52; ++i)
            {
              if (*(void *)v59 != v14) {
                objc_enumerationMutation(v49);
              }
              v16 = *(void **)(*((void *)&v58 + 1) + 8 * i);
              context = (void *)MEMORY[0x1E4E7EF70]();
              int v17 = [v16 intValue];
              var1 = a5->var1;
              long long v19 = (unsigned int *)((char *)var1 + 51 * v17);
              long long v20 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_array_get_string(a5->var0, *v19));
              if (([v51 containsObject:v20] & 1) == 0)
              {
                uint64_t v21 = (char *)var1 + 51 * v17;
                uint64_t v23 = *(void *)(v21 + 12);
                uint64_t v22 = v21 + 12;
                long long v50 = [v48 dateByAddingTimeInterval:(double)(a7 - v23) / -1000.0];
                uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v46 withDate:v50];
                id v25 = [MEMORY[0x1E4F28ED0] numberWithInt:*((unsigned int *)v22 + 2)];
                [v24 setObject:v25 forKeyedSubscript:@"PID"];

                size_t v26 = *v19;
                if (xpc_array_get_count(a5->var0) > v26) {
                  [v24 setObject:v20 forKeyedSubscript:@"ProcessName"];
                }
                unint64_t v27 = *(void *)((char *)var1 + 51 * v17 + 4);
                if (*(void *)v22 > v27 && v27 != 0)
                {
                  uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)v22 - v27];
                  [v24 setObject:v29 forKeyedSubscript:@"timeSinceSpawn"];
                }
                if (*(_DWORD *)((char *)var1 + 51 * v17 + 24) != -1)
                {
                  uint64_t v30 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:");
                  [v24 setObject:v30 forKeyedSubscript:@"lastTimeToRelaunch"];
                }
                uint64_t v31 = (char *)var1 + 51 * v17;
                uint64_t v32 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:v31[28]];
                [v24 setObject:v32 forKeyedSubscript:@"ReasonNamespace"];

                id v33 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(v31 + 29)];
                [v24 setObject:v33 forKeyedSubscript:@"ReasonCode"];

                uint64_t v34 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:*(unsigned __int16 *)(v31 + 49)];
                [v24 setObject:v34 forKeyedSubscript:@"JetsamPriority"];

                [v47 addObject:v24];
              }
              if ([v20 hasPrefix:@"UIKitApplication:"])
              {
                uint64_t v35 = [v20 stringByReplacingOccurrencesOfString:@"UIKitApplication:" withString:&stru_1F3FCA098];

                uint64_t v36 = [v35 rangeOfString:@"["];
                if (v36 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v37 = [v35 substringToIndex:v36];
                  goto LABEL_28;
                }
              }
              else
              {
                if ([v20 hasPrefix:@"application."])
                {
                  uint64_t v37 = +[PLUtilities cleanLaunchdApplicationMacOS:v20];
                  uint64_t v35 = v20;
LABEL_28:

                  uint64_t v35 = (void *)v37;
                  goto LABEL_30;
                }
                uint64_t v35 = v20;
              }
LABEL_30:
              if (([v35 containsString:@"/"] & 1) == 0)
              {
                if (*(_DWORD *)((char *)var1 + 51 * v17 + 24) != -1)
                {
                  id v57 = v35;
                  AnalyticsSendEventLazy();
                }
                id v56 = v35;
                AnalyticsSendEventLazy();
                id v55 = v56;
                AnalyticsSendEventLazy();
              }
            }
            uint64_t v52 = [v49 countByEnumeratingWithState:&v58 objects:v68 count:16];
          }
          while (v52);
        }

        uint64_t v12 = v44 + 1;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v43);
  }

  if ([v47 count])
  {
    long long v66 = v46;
    v67 = v47;
    long long v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    [(PLOperator *)v39 logEntries:v38 withGroupID:v46];
  }
}

uint64_t __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

id __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v3 = (uint64_t *)(a1 + 32);
  [v2 setObject:v4 forKeyedSubscript:@"procname"];
  size_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:*(unsigned int *)(v3[1] + 24)];
  [v2 setObject:v5 forKeyedSubscript:@"time_to_relaunch_ms"];

  id v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke_2_cold_1(v3, (uint64_t)v2, v6);
  }

  return v2;
}

id __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke_576(uint64_t a1)
{
  id v2 = +[PLUtilities intervalPeakCADictionaryForLaunchdName:*(void *)(a1 + 32) intervalMaxKB:*(unsigned int *)(*(void *)(a1 + 40) + 41)];
  unsigned int v3 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v2 setObject:v3 forKeyedSubscript:@"is_uikit_app"];

  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  [v2 setObject:v4 forKeyedSubscript:@"is_mac_app"];

  size_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:*(unsigned __int8 *)(*(void *)(a1 + 40) + 28)];
  [v2 setObject:v5 forKeyedSubscript:@"exit_reason_namespace"];

  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(*(void *)(a1 + 40) + 29)];
  [v2 setObject:v6 forKeyedSubscript:@"exit_reason_code"];

  unint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1 + 40) + 37)];
  [v2 setObject:v7 forKeyedSubscript:@"lifetime_peak_footprint_kb"];

  int v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:*(unsigned __int16 *)(*(void *)(a1 + 40) + 49)];
  [v2 setObject:v8 forKeyedSubscript:@"jetsam_priority"];

  return v2;
}

id __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke_2_598(uint64_t a1)
{
  return +[PLUtilities intervalPeakCADictionaryForLaunchdName:*(void *)(a1 + 32) intervalMaxKB:*(unsigned int *)(*(void *)(a1 + 40) + 41)];
}

- (id)getAllProcessExitsInLastHour
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(PLProcessMonitorAgent *)self logProcessExit];
  unsigned int v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"ProcessExitHistogram"];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  size_t v5 = [v4 dateByAddingTimeInterval:-3600.0];
  id v6 = NSString;
  [v5 timeIntervalSince1970];
  uint64_t v8 = v7;
  [v4 timeIntervalSince1970];
  uint64_t v10 = [v6 stringWithFormat:@"SELECT ID, %@, %@, %@, timestamp from %@ WHERE timestamp > %f AND timestamp <= %f", @"ProcessName", @"ReasonNamespace", @"ReasonCode", v3, v8, v9];
  uint64_t v11 = PLLogProcessMonitor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = (uint64_t)v10;
    _os_log_impl(&dword_1E4220000, v11, OS_LOG_TYPE_INFO, "LastHourKills Query is %@", buf, 0xCu);
  }

  uint64_t v12 = [(PLOperator *)self storage];
  unint64_t v13 = [v12 connection];
  uint64_t v14 = [v13 performQuery:v10];

  int v15 = PLLogProcessMonitor();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [v14 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v19 = v16;
    __int16 v20 = 2112;
    uint64_t v21 = v14;
    _os_log_impl(&dword_1E4220000, v15, OS_LOG_TYPE_INFO, "LastHourKills Result Count is %lu and result %@", buf, 0x16u);
  }

  return v14;
}

- (id)getProcessExits:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  size_t v5 = v4;
  if (!v4)
  {
    size_t v26 = PLLogProcessMonitor();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[PLProcessMonitorAgent getProcessExits:]();
    }
    goto LABEL_14;
  }
  id v6 = [v4 objectForKeyedSubscript:@"lastNHours"];
  uint64_t v7 = [v6 longLongValue];

  uint64_t v8 = [v5 objectForKeyedSubscript:@"ReasonCode"];
  uint64_t v9 = [v8 longLongValue];

  uint64_t v10 = [v5 objectForKeyedSubscript:@"ReasonNamespace"];
  uint64_t v11 = [v10 longLongValue];

  if ((unint64_t)v7 > 0x18 || v9 < 0 || v11 < 0)
  {
    size_t v26 = PLLogProcessMonitor();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v30 = v7;
      __int16 v31 = 2048;
      uint64_t v32 = v9;
      __int16 v33 = 2048;
      uint64_t v34 = v11;
      _os_log_error_impl(&dword_1E4220000, v26, OS_LOG_TYPE_ERROR, "Invalid payload sent to query lastNHours %lld reasonCode %lld reasonNamespace %lld", buf, 0x20u);
    }
LABEL_14:
    unint64_t v27 = 0;
    goto LABEL_15;
  }
  uint64_t v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"ProcessExitHistogram"];
  unint64_t v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v14 = [v13 dateByAddingTimeInterval:(double)v7 * -3600.0];
  int v15 = NSString;
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
    uint64_t v30 = (uint64_t)v19;
    _os_log_impl(&dword_1E4220000, v20, OS_LOG_TYPE_INFO, "MemoryKills Query is %@", buf, 0xCu);
  }

  uint64_t v21 = [(PLOperator *)self storage];
  uint64_t v22 = [v21 connection];
  uint64_t v23 = [v22 performQuery:v19];

  uint64_t v24 = PLLogProcessMonitor();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = [v23 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v30 = v25;
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v23;
    _os_log_impl(&dword_1E4220000, v24, OS_LOG_TYPE_INFO, "MemoryKills Result Count is %lu and result %@", buf, 0x16u);
  }

  size_t v26 = v23;
  unint64_t v27 = v26;
LABEL_15:

  return v27;
}

- (void)logEventPointSystemFreezerStats
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Entry for System Freezer Stats : %@", v2, v3, v4, v5, v6);
}

- (void)logEventPointFreezerStats
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = @"frozen_to_swap";
  OUTLINED_FUNCTION_5_1(&dword_1E4220000, a1, a3, "Ledger does not have key %@", (uint8_t *)&v3);
}

void __50__PLProcessMonitorAgent_logEventPointFreezerStats__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a3;
  uint64_t v5 = (int)[a2 intValue];
  uint8_t v6 = [*(id *)(a1 + 32) ledgerDataAtIndex:*(unsigned int *)(a1 + 56) forPid:v5];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v6, "credit") / 1024);
    [v7 setObject:v8 forKeyedSubscript:@"Credits"];

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v6, "debit") / 1024);
    [v7 setObject:v9 forKeyedSubscript:@"Debits"];

    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v6, "balance") / 1024);
    [v7 setObject:v10 forKeyedSubscript:@"Balance"];

    [v7 setObject:v14 forKeyedSubscript:@"ProcessName"];
    uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithLong:v5];
    [v7 setObject:v11 forKeyedSubscript:@"PID"];

    uint64_t v12 = +[PLUtilities bundleIDFromPid:v5];
    [v7 setObject:v12 forKeyedSubscript:@"BundleID"];

    unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 40) withRawData:v7];
    [*(id *)(a1 + 48) addObject:v13];
  }
}

uint64_t __50__PLProcessMonitorAgent_logEventPointFreezerStats__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointFreezerStats_classDebugEnabled = result;
  return result;
}

- (void)logEventPointFreezerDemotion
{
  v23[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(PLProcessMonitorAgent *)self diffFreezerProcs];

  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"FreezerDemotion"];
    uint8_t v6 = [(PLProcessMonitorAgent *)self diffFreezerProcs];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __53__PLProcessMonitorAgent_logEventPointFreezerDemotion__block_invoke_625;
    uint64_t v18 = &unk_1E6E47BD0;
    uint64_t v7 = v5;
    uint64_t v19 = v7;
    id v8 = v4;
    id v20 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:&v15];

    if (objc_msgSend(v8, "count", v15, v16, v17, v18))
    {
      uint64_t v22 = v7;
      v23[0] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
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
    if (logEventPointFreezerDemotion_defaultOnce != -1) {
      dispatch_once(&logEventPointFreezerDemotion_defaultOnce, block);
    }
    if (logEventPointFreezerDemotion_classDebugEnabled)
    {
      id v8 = [NSString stringWithFormat:@"No processes were evicted out of freezer"];
      uint64_t v11 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      unint64_t v13 = [v12 lastPathComponent];
      id v14 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent logEventPointFreezerDemotion]"];
      [v11 logMessage:v8 fromFile:v13 fromFunction:v14 fromLineNumber:1496];

      uint64_t v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
      goto LABEL_5;
    }
  }
}

uint64_t __53__PLProcessMonitorAgent_logEventPointFreezerDemotion__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointFreezerDemotion_classDebugEnabled = result;
  return result;
}

void __53__PLProcessMonitorAgent_logEventPointFreezerDemotion__block_invoke_625(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  uint64_t v5 = [a2 intValue];
  if (!+[PLUtilities getJetamPriority:v5])
  {
    uint8_t v6 = objc_opt_new();
    [v6 setObject:v10 forKeyedSubscript:@"ProcessName"];
    uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInt:v5];
    [v6 setObject:v7 forKeyedSubscript:@"PID"];

    id v8 = +[PLUtilities bundleIDFromPid:v5];
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
  uint8_t v6 = +[PLUtilities processNameForPid:v3];
  [v5 setObject:v6 forKeyedSubscript:@"ProcessName"];

  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
  [v5 setObject:v7 forKeyedSubscript:@"PID"];

  [(PLOperator *)self logEntry:v5];
}

- (void)logEventPointAppResumePredictions:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
    id v5 = a3;
    uint8_t v6 = [v4 now];
    uint64_t v7 = [v6 convertFromSystemToMonotonic];

    id v8 = [v5 objectForKeyedSubscript:@"appResumePredictions"];

    uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"AppResumePredictions"];
    id v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __59__PLProcessMonitorAgent_logEventPointAppResumePredictions___block_invoke;
    uint64_t v18 = &unk_1E6E49280;
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
    uint8_t v6 = [v4 now];
    uint64_t v7 = [v6 convertFromSystemToMonotonic];

    id v8 = [v5 objectForKeyedSubscript:@"Applications"];

    uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"AppNotFrozen"];
    id v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __51__PLProcessMonitorAgent_logEventPointAppNotFrozen___block_invoke;
    uint64_t v18 = &unk_1E6E49280;
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
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Not enough memory to log AppNap Enabled, returning.", v2, v3, v4, v5, v6);
}

- (id)getJetsamSnapshotEntries:(jetsam_snapshot *)a3
{
  if (a3)
  {
    uint64_t v5 = objc_opt_new();
    if (a3->var4)
    {
      unint64_t v6 = 0;
      var1 = a3->var5[0].var1;
      do
      {
        id v8 = [(PLProcessMonitorAgent *)self getProcessName:var1];
        if (v8)
        {
          uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(var1 + 204)];
          [v5 setObject:v9 forKeyedSubscript:v8];
        }
        ++v6;
        var1 += 280;
      }
      while (a3->var4 > v6);
    }
    id v10 = PLLogProcessMonitor();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PLProcessMonitorAgent getJetsamSnapshotEntries:]();
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)fetchSnapshotWithFlags:(unsigned int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = memorystatus_control();
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v7 = PLLogProcessMonitor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PLProcessMonitorAgent fetchSnapshotWithFlags:](v7);
    }
    goto LABEL_20;
  }
  unsigned int v5 = v4;
  if (!v4)
  {
    uint64_t v7 = PLLogProcessMonitor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PLProcessMonitorAgent fetchSnapshotWithFlags:](v7);
    }
    goto LABEL_20;
  }
  uint64_t v6 = v4;
  if (v4 >= 0xC9 && __ROR8__(0xAF8AF8AF8AF8AF8BLL * (v4 - 200), 3) >= 0xEA0EA0EA0EA0EBuLL)
  {
    uint64_t v7 = PLLogProcessMonitor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PLProcessMonitorAgent fetchSnapshotWithFlags:].cold.5();
    }
LABEL_20:

LABEL_21:
    id v13 = 0;
    goto LABEL_22;
  }
  id v8 = malloc_type_malloc(v4, 0x66BF9BF9uLL);
  if (!v8)
  {
    uint64_t v7 = PLLogProcessMonitor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PLProcessMonitorAgent fetchSnapshotWithFlags:](v5, v7);
    }
    goto LABEL_20;
  }
  uint64_t v9 = v8;
  if (memorystatus_control() != v5)
  {
    uint64_t v15 = PLLogProcessMonitor();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[PLProcessMonitorAgent fetchSnapshotWithFlags:].cold.4();
    }

    free(v9);
    goto LABEL_21;
  }
  unint64_t v10 = ((unint64_t)v5 - 200) / 0x118;
  if (v10 < v9[24])
  {
    id v11 = PLLogProcessMonitor();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = v9[24];
      int v16 = 134218240;
      unint64_t v17 = (v6 - 200) / 0x118uLL;
      __int16 v18 = 2048;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1E4220000, v11, OS_LOG_TYPE_INFO, "Got fewer jetsam entries from the kernel; received %zu, expected %zu",
        (uint8_t *)&v16,
        0x16u);
    }

    v9[24] = v10;
  }
  id v13 = [(PLProcessMonitorAgent *)self getJetsamSnapshotEntries:v9];
  free(v9);
LABEL_22:
  return v13;
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
  uint64_t v2 = [(PLProcessMonitorAgent *)self fetchSnapshotWithFlags:0];
  uint64_t v3 = PLLogProcessMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PLProcessMonitorAgent getJetsamSnapshotEntries:]();
  }

  return v2;
}

- (void)logProcDirtyStats
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7_3();
  _os_log_debug_impl(&dword_1E4220000, v0, OS_LOG_TYPE_DEBUG, "ProcDirtyStats: Should Not Log to CoreAnalytics (current_time=%@ is not greater than report_stats_time=%@)", v1, 0x16u);
}

id __42__PLProcessMonitorAgent_logProcDirtyStats__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = (int *)(a1 + 56);
  long long v4 = +[PLUtilities binaryPathForPid:*(unsigned int *)(a1 + 56)];
  unsigned int v5 = [v4 lastPathComponent];

  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = @"Unknown";
  }
  [v2 setObject:v6 forKeyedSubscript:@"daemon_procname"];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 40)];
  [v2 setObject:v7 forKeyedSubscript:@"time_dirty_seconds"];

  char v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 48)];
  [v2 setObject:v8 forKeyedSubscript:@"lifetime_seconds"];

  if (v5)
  {
    uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

    if (v9)
    {
      unint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
      [v2 setObject:v10 forKeyedSubscript:@"jse_idle_time"];
    }
  }
  __int16 v11 = *(_WORD *)(a1 + 60);
  if (!v11)
  {
    double v12 = *(double *)(a1 + 48);
    if (v12 <= 0.0)
    {
      __int16 v11 = 0;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 40) / v12 * 100.0];
      [v2 setObject:v13 forKeyedSubscript:@"percent_dirty"];

      __int16 v11 = *(_WORD *)(a1 + 60);
    }
  }
  id v14 = [MEMORY[0x1E4F28ED0] numberWithShort:v11];
  [v2 setObject:v14 forKeyedSubscript:@"collection_status"];

  uint64_t v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    __42__PLProcessMonitorAgent_logProcDirtyStats__block_invoke_cold_1(v3, (uint64_t)v2, v15);
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
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9 withRawData:v5];

    [(PLOperator *)self logEntry:v6];
    uint64_t v7 = [v6 dictionary];
    char v8 = [v6 entryDate];
    [(PLOperator *)self logForSubsystem:@"BackgroundProcessing" category:@"AppResumeInferredCarry" data:v7 date:v8];
  }
}

- (void)logEventBackwardProcessExitHistogram:(id)a3 withStats:(id *)a4 withDate:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  context = (void *)MEMORY[0x1E4E7EF70]();
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
        __int16 v11 = *(void **)(*((void *)&v49 + 1) + 8 * v10);
        double v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v45 withDate:v8];
        id v13 = [v9 objectForKey:v11];
        unsigned int v14 = [v11 labelIdx];
        if (xpc_array_get_count(a4->var0) > v14)
        {
          uint64_t v15 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_array_get_string(a4->var0, objc_msgSend(v11, "labelIdx")));
          [v12 setObject:v15 forKeyedSubscript:@"ProcessName"];

          if ([v11 lastTTR] != -1)
          {
            int v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v11, "lastTTR"));
            [v12 setObject:v16 forKeyedSubscript:@"lastTimeToRelaunch"];
          }
          unint64_t v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v11, "exitReasonNamespace"));
          [v12 setObject:v17 forKeyedSubscript:@"ReasonNamespace"];

          __int16 v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v11, "exitReasonCode"));
          [v12 setObject:v18 forKeyedSubscript:@"ReasonCode"];

          uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v13, "duration_0"));
          [v12 setObject:v19 forKeyedSubscript:@"0s-5s"];

          uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v13, "duration_5"));
          [v12 setObject:v20 forKeyedSubscript:@"5s-10s"];

          id v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v13, "duration_10"));
          [v12 setObject:v21 forKeyedSubscript:@"10s-60s"];

          id v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v13, "duration_60_above"));
          [v12 setObject:v22 forKeyedSubscript:@"60s+"];

          uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v13, "duration_unknown"));
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
          if (logEventBackwardProcessExitHistogram_withStats_withDate__defaultOnce != -1) {
            dispatch_once(&logEventBackwardProcessExitHistogram_withStats_withDate__defaultOnce, block);
          }
          if (logEventBackwardProcessExitHistogram_withStats_withDate__classDebugEnabled)
          {
            uint64_t v25 = [NSString stringWithFormat:@"Error: process exit buffer label index out of range."];
            size_t v26 = (void *)MEMORY[0x1E4F929B8];
            unint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
            uint64_t v28 = [v27 lastPathComponent];
            uint64_t v29 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent logEventBackwardProcessExitHistogram:withStats:withDate:]"];
            [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:1812];

            uint64_t v30 = PLLogCommon();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v56 = v25;
              _os_log_debug_impl(&dword_1E4220000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
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
    __int16 v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
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
    if (logEventBackwardProcessExitHistogram_withStats_withDate__defaultOnce_663 != -1) {
      dispatch_once(&logEventBackwardProcessExitHistogram_withStats_withDate__defaultOnce_663, v47);
    }
    if (logEventBackwardProcessExitHistogram_withStats_withDate__classDebugEnabled_664)
    {
      __int16 v33 = objc_msgSend(NSString, "stringWithFormat:", @"processExitSummaryCount = %d\n", self->_processExitSummaryCount, context);
      uint64_t v34 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      uint64_t v36 = [v35 lastPathComponent];
      uint64_t v37 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent logEventBackwardProcessExitHistogram:withStats:withDate:]"];
      [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:1837];

      long long v38 = PLLogCommon();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

      id v8 = v40;
      id v9 = v43;
    }
  }
}

uint64_t __81__PLProcessMonitorAgent_logEventBackwardProcessExitHistogram_withStats_withDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardProcessExitHistogram_withStats_withDate__classDebugEnabled = result;
  return result;
}

uint64_t __81__PLProcessMonitorAgent_logEventBackwardProcessExitHistogram_withStats_withDate___block_invoke_665(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardProcessExitHistogram_withStats_withDate__classDebugEnabled_664 = result;
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
  uint64_t v6 = +[PLUtilities bundleIDFromPid:v3];
  if (!v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"PluginExecutableName" withValue:v5 withComparisonOperation:0];
    id v8 = [(PLOperator *)self storage];
    __int16 v18 = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    uint64_t v10 = [v8 lastEntryForKey:@"PLApplicationAgent_EventNone_AllPlugins" withComparisons:v9 isSingleton:1];

    if (v10)
    {
      uint64_t v6 = [v10 objectForKeyedSubscript:@"PluginId"];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  __int16 v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", v3, @"PID");
  v17[0] = v11;
  v16[1] = @"ProcessName";
  double v12 = v5;
  if (!v5)
  {
    double v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v12;
  void v16[2] = @"BundleID";
  id v13 = v6;
  if (!v6)
  {
    id v13 = [MEMORY[0x1E4F1CA98] null];
  }
  void v17[2] = v13;
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
  int v7 = [a2 intValue];
  *(_DWORD *)a1 = 67109120;
  *a3 = v7;
  _os_log_debug_impl(&dword_1E4220000, a4, OS_LOG_TYPE_DEBUG, "Cache reslid for %d", a1, 8u);
}

- (void)logEventIntervalProcessMonitorInterval
{
  if (+[PLUtilities isPowerlogHelperd])
  {
    [(PLProcessMonitorAgent *)self updateProcessMonitorCache];
    [(PLProcessMonitorAgent *)self logEventIntervalProcessMonitorIntervalUsingCache];
  }
}

- (int)get_kthread_list:(unint64_t *)a3
{
  long long v23 = 0u;
  memset(buffer, 0, sizeof(buffer));
  proc_pidinfo(0, 4, 0, buffer, 96);
  int v4 = DWORD1(v23);
  uint64_t v5 = 8 * SDWORD1(v23);
  int v6 = v5 + 120;
  int v7 = malloc_type_malloc(v5 + 120, 0xD6B13E90uLL);
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
      if (get_kthread_list__defaultOnce != -1) {
        dispatch_once(&get_kthread_list__defaultOnce, block);
      }
      if (get_kthread_list__classDebugEnabled)
      {
        __int16 v11 = [NSString stringWithFormat:@"proc_pidinfo(PROC_PIDLISTTHREADIDS) failed"];
        double v12 = (void *)MEMORY[0x1E4F929B8];
        id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
        unsigned int v14 = [v13 lastPathComponent];
        uint64_t v15 = [NSString stringWithUTF8String:"-[PLProcessMonitorAgent get_kthread_list:]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1945];

        int v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
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
  get_kthread_list__classDebugEnabled = result;
  return result;
}

- (void)logEventIntervalKernelTaskMonitor
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Error in allocating memory for proc_threadcounts", v2, v3, v4, v5, v6);
}

uint64_t __58__PLProcessMonitorAgent_logEventIntervalKernelTaskMonitor__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventIntervalKernelTaskMonitor_classDebugEnabled = result;
  return result;
}

uint64_t __58__PLProcessMonitorAgent_logEventIntervalKernelTaskMonitor__block_invoke_690(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventIntervalKernelTaskMonitor_classDebugEnabled_689 = result;
  return result;
}

+ (unint64_t)PIDToCoalitionID:(int)a3
{
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
    if (PIDToCoalitionID__defaultOnce != -1) {
      dispatch_once(&PIDToCoalitionID__defaultOnce, block);
    }
    if (PIDToCoalitionID__classDebugEnabled)
    {
      int v7 = [NSString stringWithFormat:@"proc_pidinfo(PROC_PIDCOALITIONINFO) failed\n"];
      int v8 = (void *)MEMORY[0x1E4F929B8];
      int v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m"];
      uint64_t v10 = [v9 lastPathComponent];
      __int16 v11 = [NSString stringWithUTF8String:"+[PLProcessMonitorAgent PIDToCoalitionID:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:2109];

      double v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  return -v5;
}

uint64_t __42__PLProcessMonitorAgent_PIDToCoalitionID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  PIDToCoalitionID__classDebugEnabled = result;
  return result;
}

+ (BOOL)enableThreadStatsLogging
{
  if (enableThreadStatsLogging_onceToken != -1) {
    dispatch_once(&enableThreadStatsLogging_onceToken, &__block_literal_global_699);
  }
  return enableThreadStatsLogging_threadStatsEnabled;
}

void __49__PLProcessMonitorAgent_enableThreadStatsLogging__block_invoke()
{
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    int v0 = [MEMORY[0x1E4F929C0] BOOLForKey:@"PLThreadStats_Enabled" ifNotSet:0];
    enableThreadStatsLogging_threadStatsEnabled = v0;
    if (!v0) {
      return;
    }
  }
  else if (!enableThreadStatsLogging_threadStatsEnabled)
  {
    return;
  }
  uint64_t v1 = PLLogCommon();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1E4220000, v1, OS_LOG_TYPE_INFO, "thread stats: enabled", v2, 2u);
  }
}

- (void)initializeThreadStatsLogging
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1(&dword_1E4220000, v0, v1, "thread stats: error initializing: %@", v2);
}

- (void)logThreadStats
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLProcessMonitorAgent *)self threadStats];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    int v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"ThreadStats"];
    uint64_t v6 = [(PLProcessMonitorAgent *)self threadStats];
    int v7 = [v6 diffSinceLastSnapshot];

    int v8 = [MEMORY[0x1E4F1CA48] array];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __39__PLProcessMonitorAgent_logThreadStats__block_invoke;
    v15[3] = &unk_1E6E492F8;
    id v9 = v5;
    id v16 = v9;
    id v10 = v4;
    id v17 = v10;
    id v11 = v8;
    id v18 = v11;
    [v7 enumerateKeysAndObjectsUsingBlock:v15];
    if ([v11 count])
    {
      double v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [v11 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v22 = v13;
        _os_log_impl(&dword_1E4220000, v12, OS_LOG_TYPE_INFO, "thread stats: logging %lu entries", buf, 0xCu);
      }

      id v19 = v9;
      id v20 = v11;
      unsigned int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      [(PLOperator *)self logEntries:v14 withGroupID:v9];
    }
  }
}

void __39__PLProcessMonitorAgent_logThreadStats__block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [v6 threadNameToInfo];
  if (v7)
  {
    int v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v6, "pid"));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__PLProcessMonitorAgent_logThreadStats__block_invoke_2;
    v10[3] = &unk_1E6E492D0;
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

  id v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v9];
  [v14 setObject:v12 forKeyedSubscript:@"SysTime"];

  id v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:(unint64_t)(v11 * 1000.0)];
  [v14 setObject:v13 forKeyedSubscript:@"UsrTime"];

  [*(id *)(a1 + 64) addObject:v14];
}

- (void)logEventBackwardAppLaunchTimeSeries:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v22 = self;
    id v6 = PLLogProcessMonitor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PLProcessMonitorAgent logEventBackwardAppLaunchTimeSeries:]();
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
      uint64_t v29 = v8;
      uint64_t v30 = v7;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      [(PLOperator *)v22 logEntries:v21 withGroupID:v8];
    }
    id v5 = v23;
  }
  else
  {
    id v7 = PLLogProcessMonitor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PLProcessMonitorAgent logEventBackwardAppLaunchTimeSeries:]();
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
  self->_processExitSummaryCount = a3;
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

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "ProcDirtyStats: BatteryLevelChanged -> should log to CoreAnalytics?", v2, v3, v4, v5, v6);
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_423_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Got callback for PLProcessMonitorAgent_EventPoint_AppResumePredictions: %@", v2, v3, v4, v5, v6);
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_432_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Got callback for PLProcessMonitorAgent_EventPoint_AppNotFrozen: %@", v2, v3, v4, v5, v6);
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_437_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Got callback for PLProcessMonitorAgent_EventForward_AppResumeInferredCarry: %@", v2, v3, v4, v5, v6);
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_449_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "MemoryKills query did not succeed", v2, v3, v4, v5, v6);
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_464_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "HUD Terminations query did not succeed", v2, v3, v4, v5, v6);
}

void __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke_2_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "ProcessRelaunchTime: processName %@'s statistics: %@", (uint8_t *)&v4, 0x16u);
}

- (void)getProcessExits:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Nil payload sent to query", v2, v3, v4, v5, v6);
}

- (void)getJetsamSnapshotEntries:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "getJSEIdleTime: memoryJetsamEntries %@", v2, v3, v4, v5, v6);
}

- (void)fetchSnapshotWithFlags:(NSObject *)a1 .cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1(&dword_1E4220000, a1, v3, "memorystatus_control(MEMORYSTATUS_CMD_GET_JETSAM_SNAPSHOT) failed: %s", v4);
}

- (void)fetchSnapshotWithFlags:(NSObject *)a1 .cold.2(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1(&dword_1E4220000, a1, v3, "kernel returned (0) from memorystatus_control(MEMORYSTATUS_CMD_GET_JETSAM_SNAPSHOT) -- no jetsam data available %s", v4);
}

- (void)fetchSnapshotWithFlags:(int)a1 .cold.3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1E4220000, a2, OS_LOG_TYPE_ERROR, "unable to allocate %d bytes for jetsam snapshot", (uint8_t *)v2, 8u);
}

- (void)fetchSnapshotWithFlags:.cold.4()
{
  int v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_10_4(&dword_1E4220000, v1, v2, "memorystatus_control returned unexpected value - %d: %s", v3, v4, v5, v6, v7);
}

- (void)fetchSnapshotWithFlags:.cold.5()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v2 = 2048;
  uint64_t v3 = 280;
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "memorystatus_control gave snapshot size (%lu) not multiple of jetsam entry type (%lu)", v1, 0x16u);
}

void __42__PLProcessMonitorAgent_logProcDirtyStats__block_invoke_cold_1(int *a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "ProcDirtyStats: pid %d's statistics: %@", (uint8_t *)v4, 0x12u);
}

- (void)logEventBackwardAppLaunchTimeSeries:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Empty App Launch Payload", v2, v3, v4, v5, v6);
}

- (void)logEventBackwardAppLaunchTimeSeries:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Got payload for App Launch Signposts : %@", v2, v3, v4, v5, v6);
}

@end