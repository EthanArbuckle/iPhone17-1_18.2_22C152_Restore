@interface PLPerformanceAgent
+ (BOOL)shouldCreateJetsamPriorityTable;
+ (id)entryEventIntervalDefinitionExperiment;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventPointDefinitionAPFSFragmentation;
+ (id)entryEventPointDefinitionDiskFragmentation;
+ (id)entryEventPointDefinitionDiskUsage;
+ (id)entryEventPointDefinitionJetsamPriority;
+ (id)entryEventPointDefinitionRollout;
+ (id)entryEventPointDefinitionSystemMemory;
+ (id)entryEventPointDefinitionVMTunables;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (NSSet)systemMemoryProcessNames;
- (PLCFNotificationOperatorComposition)llmOverheadNotification;
- (PLCFNotificationOperatorComposition)vmTuningNotification;
- (PLEntryNotificationOperatorComposition)batteryEntryLogged;
- (PLEntryNotificationOperatorComposition)batteryLevelChanged;
- (PLNSNotificationOperatorComposition)dailyTaskNotification;
- (PLPerformanceAgent)init;
- (id)descriptionForMemoryPressure:(int)a3;
- (int)countFD:(int)a3;
- (int)countMachPort:(int)a3;
- (int)randomSample;
- (int)sampleCounter;
- (void)initOperatorDependancies;
- (void)log;
- (void)logEventIntervalExperiment;
- (void)logEventPointAPFSFragmentation;
- (void)logEventPointAPFSFragmentationWithContainer:(const char *)a3;
- (void)logEventPointDiskFragmentation;
- (void)logEventPointDiskUsage;
- (void)logEventPointJetsamPrority;
- (void)logEventPointRollout;
- (void)logEventPointSystemMemory;
- (void)logEventPointSystemMemoryPerProcess:(id)a3;
- (void)logEventPointVMTunables;
- (void)logSharedCacheStatisticsToCA:(id)a3;
- (void)logSystemMemoryToCA:(id)a3;
- (void)setBatteryEntryLogged:(id)a3;
- (void)setBatteryLevelChanged:(id)a3;
- (void)setDailyTaskNotification:(id)a3;
- (void)setLlmOverheadNotification:(id)a3;
- (void)setRandomSample:(int)a3;
- (void)setSampleCounter:(int)a3;
- (void)setVmTuningNotification:(id)a3;
@end

@implementation PLPerformanceAgent

+ (BOOL)shouldCreateJetsamPriorityTable
{
  if (qword_1EBD57968 != -1) {
    dispatch_once(&qword_1EBD57968, &__block_literal_global_8);
  }
  return _MergedGlobals_1_6;
}

uint64_t __53__PLPerformanceAgent_shouldCreateJetsamPriorityTable__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isiOS];
  _MergedGlobals_1_6 = result;
  return result;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLPerformanceAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v12[7] = *MEMORY[0x1E4F143B8];
  v11[0] = @"SystemMemory";
  objc_super v2 = +[PLPerformanceAgent entryEventPointDefinitionSystemMemory];
  v12[0] = v2;
  v11[1] = @"DiskUsage";
  v3 = +[PLPerformanceAgent entryEventPointDefinitionDiskUsage];
  v12[1] = v3;
  v11[2] = @"DiskFragmentation";
  v4 = +[PLPerformanceAgent entryEventPointDefinitionDiskFragmentation];
  v12[2] = v4;
  v11[3] = @"JetsamPriority";
  v5 = +[PLPerformanceAgent entryEventPointDefinitionJetsamPriority];
  v12[3] = v5;
  v11[4] = @"APFSFragmentation";
  v6 = +[PLPerformanceAgent entryEventPointDefinitionAPFSFragmentation];
  v12[4] = v6;
  v11[5] = @"Rollout";
  v7 = +[PLPerformanceAgent entryEventPointDefinitionRollout];
  v12[5] = v7;
  v11[6] = @"VMTunables";
  v8 = +[PLPerformanceAgent entryEventPointDefinitionVMTunables];
  v12[6] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:7];

  return v9;
}

+ (id)entryEventPointDefinitionSystemMemory
{
  v82[3] = *MEMORY[0x1E4F143B8];
  v81[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v79[0] = *MEMORY[0x1E4F92CD0];
  v79[1] = v2;
  v80[0] = &unk_1F29F0340;
  v80[1] = MEMORY[0x1E4F1CC38];
  v79[2] = *MEMORY[0x1E4F92C60];
  v80[2] = MEMORY[0x1E4F1CC38];
  v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:3];
  v82[0] = v72;
  v81[1] = *MEMORY[0x1E4F92CA8];
  v77[0] = @"FreeCount";
  v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  v70 = objc_msgSend(v71, "commonTypeDict_IntegerFormat");
  v78[0] = v70;
  v77[1] = @"WiredCount";
  v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  v68 = objc_msgSend(v69, "commonTypeDict_IntegerFormat");
  v78[1] = v68;
  v77[2] = @"CompressorPageCount";
  v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat");
  v78[2] = v66;
  v77[3] = @"PurgeableCount";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat");
  v78[3] = v64;
  v77[4] = @"Purges";
  v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat");
  v78[4] = v62;
  v77[5] = @"Faults";
  v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  v60 = objc_msgSend(v61, "commonTypeDict_IntegerFormat");
  v78[5] = v60;
  v77[6] = @"ZeroFills";
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v78[6] = v58;
  v77[7] = @"Reactivations";
  v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v78[7] = v56;
  v77[8] = @"PageIns";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v78[8] = v54;
  v77[9] = @"PageOuts";
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v78[9] = v52;
  v77[10] = @"Decompressions";
  v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v78[10] = v50;
  v77[11] = @"Compressions";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v78[11] = v48;
  v77[12] = @"SwapIns";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v78[12] = v46;
  v77[13] = @"SwapOuts";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v78[13] = v44;
  v77[14] = @"CompressedPageCount";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v78[14] = v42;
  v77[15] = @"InternalPageCount";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v78[15] = v40;
  v77[16] = @"ExternalPageCount";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v78[16] = v38;
  v77[17] = @"SwapAvailSize";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v78[17] = v36;
  v77[18] = @"SwapUsedSize";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v78[18] = v34;
  v77[19] = @"MemoryPressureLevel";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_StringFormat");
  v78[19] = v32;
  v77[20] = @"FreeVnodeCount";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v78[20] = v30;
  v77[21] = @"SharedCacheVirtualSize";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v78[21] = v28;
  v77[22] = @"SharedCacheResidentSize";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v78[22] = v26;
  v77[23] = @"SharedCacheResidencyPercent";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v78[23] = v24;
  v77[24] = @"PagesGrabbed";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v78[24] = v22;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:25];
  v82[1] = v21;
  v81[2] = *MEMORY[0x1E4F92C68];
  v75[0] = @"key";
  v73[0] = @"ProcessName";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_StringFormat_withProcessName");
  v74[0] = v19;
  v73[1] = @"PG_indiv";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v74[1] = v17;
  v73[2] = @"PG_upl";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v74[2] = v15;
  v73[3] = @"PG_iopl";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v74[3] = v3;
  v73[4] = @"PG_kern";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v74[4] = v5;
  v73[5] = @"PG_other";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v74[5] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:6];
  v76[0] = v8;
  v75[1] = @"value";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v76[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];
  v82[2] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:3];

  return v12;
}

+ (id)entryEventPointDefinitionDiskUsage
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F29F0350;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"FreeSize";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"SystemSize";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventPointDefinitionDiskFragmentation
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F29F0350;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"INDPoolFull";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventPointDefinitionAPFSFragmentation
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v14 = *MEMORY[0x1E4F92CD0];
  v15 = &unk_1F29F0350;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"container";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v13[0] = v4;
  v12[1] = @"fragmentedExtent";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v13[1] = v6;
  void v12[2] = @"fileCount";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventPointDefinitionJetsamPriority
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (+[PLPerformanceAgent shouldCreateJetsamPriorityTable])
  {
    v36[0] = *MEMORY[0x1E4F92C50];
    uint64_t v34 = *MEMORY[0x1E4F92CD0];
    v35 = &unk_1F29F0360;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v37[0] = v31;
    v36[1] = *MEMORY[0x1E4F92CA8];
    v32[0] = @"pid";
    v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v33[0] = v29;
    v32[1] = @"name";
    v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    v27 = objc_msgSend(v28, "commonTypeDict_StringFormat");
    v33[1] = v27;
    v32[2] = @"priority";
    v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v33[2] = v25;
    v32[3] = @"footprint";
    v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v33[3] = v23;
    v32[4] = @"peakFootprint";
    v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v33[4] = v21;
    v32[5] = @"activeLimit";
    v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v33[5] = v19;
    v32[6] = @"activeLimitIsHard";
    v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    v17 = objc_msgSend(v18, "commonTypeDict_BoolFormat");
    v33[6] = v17;
    v32[7] = @"inactiveLimit";
    v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v33[7] = v15;
    v32[8] = @"inactiveLimitIsHard";
    uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    v13 = objc_msgSend(v14, "commonTypeDict_BoolFormat");
    v33[8] = v13;
    v32[9] = @"frozen";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    v3 = objc_msgSend(v2, "commonTypeDict_BoolFormat");
    v33[9] = v3;
    v32[10] = @"pressuredExit";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
    v33[10] = v5;
    v32[11] = @"fds";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v33[11] = v7;
    v32[12] = @"machPorts";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v33[12] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:13];
    v37[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventPointDefinitionRollout
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F29F0350;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"rolloutID";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v10[1] = @"deploymentID";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventPointDefinitionVMTunables
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F29F0350;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"BallastOffset";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventIntervalDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"Experiment";
  uint64_t v2 = +[PLPerformanceAgent entryEventIntervalDefinitionExperiment];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventIntervalDefinitionExperiment
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v20 = *MEMORY[0x1E4F92CD0];
  v21 = &unk_1F29F0370;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"namespace";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_StringFormat");
  v19[0] = v15;
  v18[1] = @"experimentID";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_StringFormat");
  v19[1] = v13;
  v18[2] = @"treatmentID";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
  v19[2] = v3;
  v18[3] = @"deploymentID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19[3] = v5;
  v18[4] = @"startDate";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_DateFormat");
  v19[4] = v7;
  v18[5] = @"EndDate";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_DateFormat");
  v19[5] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  v23[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v11;
}

- (PLPerformanceAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLPerformanceAgent;
  return [(PLAgent *)&v3 init];
}

- (void)initOperatorDependancies
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] internalBuild] & 1) != 0
    || [MEMORY[0x1E4F929C0] taskMode])
  {
    int v3 = [MEMORY[0x1E4F92A38] isiOS];
  }
  else
  {
    int v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"TGOnDeviceInferenceProviderService", @"VisualGenerationInference", @"aned", 0);
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  systemMemoryProcessNames = self->_systemMemoryProcessNames;
  self->_systemMemoryProcessNames = v4;

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __46__PLPerformanceAgent_initOperatorDependancies__block_invoke;
  v30[3] = &unk_1E692A0F0;
  v30[4] = self;
  v6 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v30];
  batteryLevelChanged = self->_batteryLevelChanged;
  self->_batteryLevelChanged = v6;

  if (v3)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F929E8]);
    v9 = [(PLOperator *)self workQueue];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_2;
    v29[3] = &unk_1E692A0F0;
    v29[4] = self;
    uint64_t v10 = (PLEntryNotificationOperatorComposition *)[v8 initWithWorkQueue:v9 forEntryKey:@"PLBatteryAgent_EventBackward_Battery" withBlock:v29];
    batteryEntryLogged = self->_batteryEntryLogged;
    self->_batteryEntryLogged = v10;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F92A28]);
  v13 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
  uint64_t v14 = *MEMORY[0x1E4F1C2E0];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_242;
  v28[3] = &unk_1E692A0F0;
  v28[4] = self;
  v15 = (void *)[v12 initWithWorkQueue:v13 forNotification:v14 withBlock:v28];

  [(PLPerformanceAgent *)self setDailyTaskNotification:v15];
  id v16 = objc_alloc(MEMORY[0x1E4F929A0]);
  v17 = [(PLOperator *)self workQueue];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_2_261;
  v27[3] = &unk_1E692A0F0;
  v27[4] = self;
  v18 = (PLCFNotificationOperatorComposition *)[v16 initWithWorkQueue:v17 forNotification:@"com.apple.trial.NamespaceUpdate.MEMORY_ANALYSIS_LLM_OVERHEAD" requireState:1 withBlock:v27];
  llmOverheadNotification = self->_llmOverheadNotification;
  self->_llmOverheadNotification = v18;

  id v20 = objc_alloc(MEMORY[0x1E4F929A0]);
  v21 = [(PLOperator *)self workQueue];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_265;
  v26[3] = &unk_1E692A0F0;
  v26[4] = self;
  v22 = (PLCFNotificationOperatorComposition *)[v20 initWithWorkQueue:v21 forNotification:@"com.apple.trial.NamespaceUpdate.COREOS_GMPOWER_VM_TUNING_PAGE_SHORTAGE_THRESHOLDS" requireState:1 withBlock:v26];
  vmTuningNotification = self->_vmTuningNotification;
  self->_vmTuningNotification = v22;

  [(PLPerformanceAgent *)self logEventIntervalExperiment];
  [(PLPerformanceAgent *)self logEventPointRollout];
  self->_int randomSample = arc4random_uniform(0x30u);
  self->_sampleCounter = 0;
  v24 = PLLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    int randomSample = self->_randomSample;
    *(_DWORD *)buf = 67109120;
    int v32 = randomSample;
    _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "Picked random sample value as %d for sending stats to CA", buf, 8u);
  }
}

uint64_t __46__PLPerformanceAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) logEventPointSystemMemory];
  [*(id *)(a1 + 32) logEventPointDiskUsage];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 logEventPointJetsamPrority];
}

uint64_t __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "Logging SystemMemory stats for new EventBackward_Battery entry logged", v4, 2u);
  }

  return [*(id *)(a1 + 32) logEventPointSystemMemory];
}

void __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_242(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_2_246;
    block[3] = &unk_1E692A830;
    v25 = @"DailyTasks";
    uint64_t v26 = v10;
    if (qword_1EBD57970 != -1) {
      dispatch_once(&qword_1EBD57970, block);
    }
    BOOL v11 = byte_1EBD57941 == 0;

    if (!v11)
    {
      id v12 = [NSString stringWithFormat:@"DailyTasks notification!"];
      v13 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
      v15 = [v14 lastPathComponent];
      id v16 = [NSString stringWithUTF8String:"-[PLPerformanceAgent initOperatorDependancies]_block_invoke"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:456];

      v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v12;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)location, 0xCu);
      }
    }
  }
  objc_initWeak(location, *(id *)(a1 + 32));
  id v18 = objc_alloc(MEMORY[0x1E4F92A80]);
  v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:30.0];
  id v20 = [*(id *)(a1 + 32) workQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_255;
  v22[3] = &unk_1E692AC18;
  objc_copyWeak(&v23, location);
  v21 = (void *)[v18 initWithFireDate:v19 withInterval:0 withTolerance:0 repeats:v20 withUserInfo:v22 withQueue:0.0 withBlock:0.0];

  [v21 arm];
  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

uint64_t __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_2_246(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  byte_1EBD57941 = result;
  return result;
}

void __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_255(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained logEventPointDiskFragmentation];

  id v3 = objc_loadWeakRetained(v1);
  [v3 logEventPointAPFSFragmentation];
}

uint64_t __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_2_261(uint64_t a1)
{
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_INFO, "MEMORY_ANALYSIS_LLM_OVERHEAD was fired, logging Trial data", v4, 2u);
  }

  [*(id *)(a1 + 32) logEventIntervalExperiment];
  return [*(id *)(a1 + 32) logEventPointRollout];
}

uint64_t __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_265(uint64_t a1)
{
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_INFO, "COREOS_GMPOWER_VM_TUNING_PAGE_SHORTAGE_THRESHOLDS was fired, logging Trial data", v4, 2u);
  }

  [*(id *)(a1 + 32) logEventIntervalExperiment];
  [*(id *)(a1 + 32) logEventPointRollout];
  return [*(id *)(a1 + 32) logEventPointVMTunables];
}

- (void)logEventIntervalExperiment
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] internalBuild] & 1) != 0
    || ([MEMORY[0x1E4F929C0] liteMode] & 1) == 0)
  {
    id v3 = objc_opt_new();
    v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"Experiment"];
    v5 = [MEMORY[0x1E4FB0058] defaultProvider];
    id v16 = 0;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __48__PLPerformanceAgent_logEventIntervalExperiment__block_invoke;
    v13 = &unk_1E692AC40;
    id v6 = v4;
    id v14 = v6;
    id v7 = v3;
    id v15 = v7;
    [v5 enumerateSampledActiveExperimentsForEnvironment:0 correlationID:@"com.apple.powerlog" error:&v16 block:&v10];
    id v8 = v16;
    if (objc_msgSend(v7, "count", v10, v11, v12, v13))
    {
      id v17 = v6;
      v18[0] = v7;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      [(PLOperator *)self logEntries:v9 withGroupID:v6];
    }
  }
}

void __48__PLPerformanceAgent_logEventIntervalExperiment__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = objc_msgSend(v4, "namespaces", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v20 + 1) + 8 * v10) name];
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    id v12 = objc_opt_new();
    v13 = [v5 componentsJoinedByString:@","];
    [v12 setObject:v13 forKeyedSubscript:@"namespace"];

    id v14 = [v4 experimentId];
    [v12 setObject:v14 forKeyedSubscript:@"experimentID"];

    id v15 = [v4 treatmentId];
    [v12 setObject:v15 forKeyedSubscript:@"treatmentID"];

    id v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "deploymentId"));
    [v12 setObject:v16 forKeyedSubscript:@"deploymentID"];

    id v17 = [v4 date];
    [v12 setObject:v17 forKeyedSubscript:@"startDate"];

    id v18 = [MEMORY[0x1E4F1C9C8] date];
    [v12 setObject:v18 forKeyedSubscript:@"EndDate"];

    v19 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 32) withRawData:v12];
    [*(id *)(a1 + 40) addObject:v19];
  }
}

- (id)descriptionForMemoryPressure:(int)a3
{
  if ((a3 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_1E692AC88[a3 - 1];
  }
}

- (void)logSystemMemoryToCA:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v28 = 0;
  size_t v27 = 4;
  if (!sysctlbyname("vm.pagesize", &v28, &v27, 0, 0))
  {
    id v5 = NSNumber;
    id v6 = [v3 objectForKeyedSubscript:@"WiredCount"];
    uint64_t v7 = [v6 unsignedLongLongValue];
    uint64_t v8 = [v5 numberWithUnsignedLongLong:(unint64_t)(v7 * v28) >> 10];
    [v4 setObject:v8 forKeyedSubscript:@"wired_down"];

    uint64_t v9 = NSNumber;
    uint64_t v10 = [v3 objectForKeyedSubscript:@"ExternalPageCount"];
    uint64_t v11 = [v10 unsignedLongLongValue];
    id v12 = [v9 numberWithUnsignedLongLong:(unint64_t)(v11 * v28) >> 10];
    [v4 setObject:v12 forKeyedSubscript:@"file_backed"];

    v13 = NSNumber;
    id v14 = [v3 objectForKeyedSubscript:@"CompressorPageCount"];
    uint64_t v15 = [v14 unsignedLongLongValue];
    id v16 = [v13 numberWithUnsignedLongLong:(unint64_t)(v15 * v28) >> 10];
    [v4 setObject:v16 forKeyedSubscript:@"occupied_by_compressor"];

    id v17 = NSNumber;
    id v18 = [v3 objectForKeyedSubscript:@"CompressedPageCount"];
    uint64_t v19 = [v18 unsignedLongLongValue];
    long long v20 = [v17 numberWithUnsignedLongLong:(unint64_t)(v19 * v28) >> 10];
    [v4 setObject:v20 forKeyedSubscript:@"stored_in_compressor"];

    long long v21 = NSNumber;
    long long v22 = [v3 objectForKeyedSubscript:@"FreeCount"];
    uint64_t v23 = [v22 unsignedLongLongValue];
    v24 = [v21 numberWithUnsignedLongLong:(unint64_t)(v23 * v28) >> 10];
    [v4 setObject:v24 forKeyedSubscript:@"free"];

    uint64_t v25 = PLLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v4;
      _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "Log System Memory Stats to CA %@", buf, 0xCu);
    }

    id v26 = v4;
    AnalyticsSendEventLazy();
  }
}

id __42__PLPerformanceAgent_logSystemMemoryToCA___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logSharedCacheStatisticsToCA:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  id v6 = [v4 objectForKeyedSubscript:@"SharedCacheVirtualSize"];
  [v5 setObject:v6 forKeyedSubscript:@"virtual_shared_cache"];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"SharedCacheResidentSize"];
  [v5 setObject:v7 forKeyedSubscript:@"resident_shared_cache"];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"SharedCacheResidencyPercent"];

  [v5 setObject:v8 forKeyedSubscript:@"shared_cache_resident_percent"];
  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "Log Shared Cache Stats to CA %@", buf, 0xCu);
  }

  uint64_t v11 = v5;
  id v10 = v5;
  AnalyticsSendEventLazy();
}

id __51__PLPerformanceAgent_logSharedCacheStatisticsToCA___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logEventPointSystemMemoryPerProcess:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (qword_1EBD57980 != -1) {
    dispatch_once(&qword_1EBD57980, &__block_literal_global_324);
  }
  unsigned int v5 = proc_listpids(1u, 0, 0, 0);
  if ((v5 & 0x80000000) == 0)
  {
    int v6 = v5;
    size_t v7 = v5;
    uint64_t v8 = malloc_type_malloc(v5, 0x9C6E935FuLL);
    if (v8)
    {
      uint64_t v9 = v8;
      memset(v8, 255, v7);
      int v10 = proc_listpids(1u, 0, v9, v6);
      uint64_t v11 = malloc_type_malloc(48 * qword_1EBD57978, 0xF6A819DBuLL);
      if (v11)
      {
        v13 = v11;
        v41 = v9;
        if (v10 >= 4)
        {
          v44 = 0;
          if ((unint64_t)v10 >> 2 <= 1) {
            unint64_t v15 = 1;
          }
          else {
            unint64_t v15 = (unint64_t)v10 >> 2;
          }
          unint64_t v16 = 0x1E4F92000uLL;
          unint64_t v17 = 0x1EBD52000uLL;
          *(void *)&long long v12 = 134218242;
          long long v40 = v12;
          id v18 = (unsigned int *)v9;
          v42 = v4;
          v43 = self;
          do
          {
            unsigned int v20 = *v18++;
            int v19 = v20;
            long long v21 = objc_msgSend(*(id *)(v16 + 2696), "fullProcessNameForPid:", v20, v40);
            if ([*(id *)((char *)&self->super.super.super.isa + *(int *)(v17 + 2116)) containsObject:v21])
            {
              long long v22 = PLLogCommon();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(buffer[0]) = 138412290;
                *(rusage_info_t *)((char *)buffer + 4) = v21;
                _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "SystemMemory found processName:%@ pid", (uint8_t *)buffer, 0xCu);
              }

              if (v19 == -1)
              {
                uint64_t v45 = -1;
              }
              else
              {
                long long v75 = 0u;
                long long v76 = 0u;
                long long v73 = 0u;
                long long v74 = 0u;
                long long v71 = 0u;
                long long v72 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                long long v67 = 0u;
                long long v68 = 0u;
                long long v65 = 0u;
                long long v66 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                long long v61 = 0u;
                long long v62 = 0u;
                long long v59 = 0u;
                long long v60 = 0u;
                long long v57 = 0u;
                long long v58 = 0u;
                long long v55 = 0u;
                long long v56 = 0u;
                long long v53 = 0u;
                long long v54 = 0u;
                long long v52 = 0u;
                memset(buffer, 0, sizeof(buffer));
                int v23 = proc_pid_rusage(v19, 6, buffer);
                if (v23)
                {
                  int v24 = v23;
                  uint64_t v25 = PLLogCommon();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v49 = v24;
                    *(_WORD *)&v49[4] = 1024;
                    *(_DWORD *)&v49[6] = v19;
                    _os_log_error_impl(&dword_1D2690000, v25, OS_LOG_TYPE_ERROR, "SystemMemory retVal failed with %d for pid %d", buf, 0xEu);
                  }
                  uint64_t v26 = -1;
                }
                else
                {
                  uint64_t v26 = (uint64_t)buffer[6];
                  uint64_t v25 = PLLogCommon();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = v40;
                    *(void *)v49 = v26;
                    *(_WORD *)&v49[8] = 2112;
                    v50 = v21;
                    _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "SystemMemory pageins : %llu for processName: %@", buf, 0x16u);
                  }
                }
                uint64_t v45 = v26;
              }
              bzero(v13, 48 * qword_1EBD57978);
              if ((ledger() & 0x80000000) != 0)
              {
                v39 = PLLogCommon();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(buffer[0]) = 0;
                  _os_log_error_impl(&dword_1D2690000, v39, OS_LOG_TYPE_ERROR, "SystemMemory pages_grabbed failure", (uint8_t *)buffer, 2u);
                }
              }
              else
              {
                size_t v27 = (unsigned char *)*((void *)v13 + 6 * dword_1EBD57954);
                int v28 = (void *)*((void *)v13 + 6 * dword_1EBD57960);
                v29 = (void *)*((void *)v13 + 6 * dword_1EBD5795C);
                v30 = (unsigned char *)*((void *)v13 + 6 * dword_1EBD57958);
                unint64_t v31 = v27 - v30 - ((unint64_t)v29 + (void)v28);
                int v32 = PLLogCommon();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  LODWORD(buffer[0]) = 138413570;
                  *(rusage_info_t *)((char *)buffer + 4) = v21;
                  WORD2(buffer[1]) = 2048;
                  *(rusage_info_t *)((char *)&buffer[1] + 6) = v27;
                  HIWORD(buffer[2]) = 2048;
                  buffer[3] = v28;
                  LOWORD(buffer[4]) = 2048;
                  *(rusage_info_t *)((char *)&buffer[4] + 2) = v29;
                  WORD1(buffer[5]) = 2048;
                  *(rusage_info_t *)((char *)&buffer[5] + 4) = v30;
                  WORD2(buffer[6]) = 2048;
                  *(rusage_info_t *)((char *)&buffer[6] + 6) = (rusage_info_t)(v27
                                                                             - v30
                                                                             - ((unint64_t)v29
                                                                              + (void)v28));
                  _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "SystemMemory processName: %@ \n pages_grabbed: %lld, upl: %lld, iopl: %lld, kern: %lld, other:%lld", (uint8_t *)buffer, 0x3Eu);
                }

                v47[0] = v21;
                v46[0] = @"ProcessName";
                v46[1] = @"PG_indiv";
                uint64_t v33 = [NSNumber numberWithLongLong:v27];
                v47[1] = v33;
                v46[2] = @"PG_upl";
                uint64_t v34 = [NSNumber numberWithLongLong:v28];
                v47[2] = v34;
                v46[3] = @"PG_iopl";
                v35 = [NSNumber numberWithLongLong:v29];
                v47[3] = v35;
                v46[4] = @"PG_kern";
                v36 = [NSNumber numberWithLongLong:v30];
                v47[4] = v36;
                v46[5] = @"PG_other";
                v37 = [NSNumber numberWithLongLong:v31];
                v47[5] = v37;
                uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:6];

                v39 = [NSNumber numberWithUnsignedLongLong:v45];
                id v4 = v42;
                [v42 setObject:v39 forKeyedSubscript:v38];
                v44 = (void *)v38;
                self = v43;
              }
              unint64_t v16 = 0x1E4F92000;

              unint64_t v17 = 0x1EBD52000;
            }

            --v15;
          }
          while (v15);
        }
        else
        {
          v44 = 0;
        }
        free(v41);
        free(v13);
      }
      else
      {
        uint64_t v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buffer[0]) = 0;
          _os_log_error_impl(&dword_1D2690000, v14, OS_LOG_TYPE_ERROR, "SystemMemory Error Failed to allocate memory for ledger values", (uint8_t *)buffer, 2u);
        }

        free(v9);
      }
    }
  }
  [(PLOperator *)self logEntry:v4];
}

void __58__PLPerformanceAgent_logEventPointSystemMemoryPerProcess___block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  int v1 = [v0 processIdentifier];

  if ((ledger() & 0x80000000) == 0)
  {
    qword_1EBD57978 = *((void *)&v13 + 1);
    uint64_t v2 = (char *)malloc_type_malloc(96 * *((void *)&v13 + 1), 0x1000040565EDBD2uLL);
    if (v2)
    {
      if ((ledger() & 0x80000000) == 0)
      {
        uint64_t v3 = qword_1EBD57978;
        if (qword_1EBD57978 >= 1)
        {
          uint64_t v4 = 0;
          unsigned int v5 = v2;
          while (strcmp(v5, "pages_grabbed"))
          {
            if (!strcmp(v5, "pages_grabbed_kern"))
            {
              int v6 = &dword_1EBD57958;
              goto LABEL_14;
            }
            if (!strcmp(v5, "pages_grabbed_iopl"))
            {
              int v6 = &dword_1EBD5795C;
              goto LABEL_14;
            }
            if (!strcmp(v5, "pages_grabbed_upl"))
            {
              int v6 = &dword_1EBD57960;
LABEL_14:
              int *v6 = v4;
            }
            ++v4;
            v5 += 96;
            if (v3 == v4) {
              goto LABEL_24;
            }
          }
          int v6 = &dword_1EBD57954;
          goto LABEL_14;
        }
        goto LABEL_24;
      }
      uint64_t v8 = PLLogCommon();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_23:

LABEL_24:
        free(v2);
        return;
      }
      LOWORD(v10[0]) = 0;
      uint64_t v9 = "SystemMemory Error Failed to get ledger_template_info";
    }
    else
    {
      uint64_t v8 = PLLogCommon();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      LOWORD(v10[0]) = 0;
      uint64_t v9 = "SystemMemory Error Failed to allocate memory for ledger_template_info";
    }
    _os_log_error_impl(&dword_1D2690000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)v10, 2u);
    goto LABEL_23;
  }
  size_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 67109120;
    v10[1] = v1;
    _os_log_error_impl(&dword_1D2690000, v7, OS_LOG_TYPE_ERROR, "SystemMemory ERROR GETTING LEDGER INFO FOR MYSELF %d", (uint8_t *)v10, 8u);
  }
}

- (void)logEventPointSystemMemory
{
  kern_return_t v5;
  ipc_space_t *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  vm_map_read_t v32;
  uint64_t shared_cache;
  uint64_t v34;
  uint64_t v35;
  mach_vm_address_t v36;
  uint64_t v37;
  BOOL v38;
  mach_vm_address_t v39;
  NSObject *v41;
  NSObject *v42;
  unint64_t v43;
  unint64_t v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  NSObject *v52;
  void *v53;
  int sampleCounter;
  char *v55;
  char *v56;
  char *v57;
  int v58;
  host_t v59;
  unsigned int v60;
  size_t v61;
  unsigned int v62;
  size_t v63;
  long long v64;
  long long v65;
  mach_msg_type_number_t host_info64_outCnt;
  integer_t host_info64_out[4];
  long long v68;
  long long v69;
  long long v70;
  long long v71;
  long long v72;
  long long v73;
  long long v74;
  long long v75;
  uint64_t v76;
  natural_t nesting_depth;
  mach_vm_address_t address;
  mach_msg_type_number_t infoCnt;
  mach_vm_size_t size;
  mach_error_t v81;
  uint64_t v82;
  unsigned char v83[12];
  __int16 v84;
  uint64_t v85;
  long long buf;
  long long v87;
  long long v88;
  unsigned char v89[28];
  uint64_t v90;

  v90 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] fullMode]
    && [MEMORY[0x1E4F92A38] internalBuild])
  {
    int v3 = [MEMORY[0x1E4F92A38] isiOS];
  }
  else
  {
    int v3 = 0;
  }
  host_t v4 = MEMORY[0x1D942A0E0]();
  long long v76 = 0;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v71 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  *(_OWORD *)host_info64_out = 0u;
  long long v68 = 0u;
  host_info64_outCnt = 38;
  unsigned int v5 = host_statistics64(v4, 4, host_info64_out, &host_info64_outCnt);
  int v6 = (ipc_space_t *)MEMORY[0x1E4F14960];
  if (v5) {
    goto LABEL_59;
  }
  size_t v7 = objc_alloc(MEMORY[0x1E4F929D0]);
  uint64_t v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SystemMemory"];
  uint64_t v9 = (void *)[v7 initWithEntryKey:v8];

  int v10 = [NSNumber numberWithUnsignedInt:(host_info64_out[0] - HIDWORD(v72))];
  [v9 setObject:v10 forKeyedSubscript:@"FreeCount"];

  long long v11 = [NSNumber numberWithUnsignedInt:host_info64_out[3]];
  [v9 setObject:v11 forKeyedSubscript:@"WiredCount"];

  long long v12 = [NSNumber numberWithUnsignedLongLong:(void)v68];
  [v9 setObject:v12 forKeyedSubscript:@"ZeroFills"];

  long long v13 = [NSNumber numberWithUnsignedLongLong:*((void *)&v68 + 1)];
  [v9 setObject:v13 forKeyedSubscript:@"Reactivations"];

  uint64_t v14 = [NSNumber numberWithUnsignedLongLong:(void)v69];
  [v9 setObject:v14 forKeyedSubscript:@"PageIns"];

  unint64_t v15 = [NSNumber numberWithUnsignedLongLong:*((void *)&v69 + 1)];
  [v9 setObject:v15 forKeyedSubscript:@"PageOuts"];

  unint64_t v16 = [NSNumber numberWithUnsignedLongLong:(void)v70];
  [v9 setObject:v16 forKeyedSubscript:@"Faults"];

  unint64_t v17 = [NSNumber numberWithUnsignedLongLong:(void)v72];
  [v9 setObject:v17 forKeyedSubscript:@"Purges"];

  id v18 = [NSNumber numberWithUnsignedInt:DWORD2(v72)];
  [v9 setObject:v18 forKeyedSubscript:@"PurgeableCount"];

  int v19 = [NSNumber numberWithUnsignedLongLong:(void)v73];
  [v9 setObject:v19 forKeyedSubscript:@"Decompressions"];

  unsigned int v20 = [NSNumber numberWithUnsignedLongLong:*((void *)&v73 + 1)];
  [v9 setObject:v20 forKeyedSubscript:@"Compressions"];

  long long v21 = [NSNumber numberWithUnsignedLongLong:(void)v74];
  [v9 setObject:v21 forKeyedSubscript:@"SwapIns"];

  long long v22 = [NSNumber numberWithUnsignedLongLong:*((void *)&v74 + 1)];
  [v9 setObject:v22 forKeyedSubscript:@"SwapOuts"];

  int v23 = [NSNumber numberWithUnsignedInt:v75];
  [v9 setObject:v23 forKeyedSubscript:@"CompressorPageCount"];

  int v24 = [NSNumber numberWithUnsignedInt:DWORD2(v75)];
  [v9 setObject:v24 forKeyedSubscript:@"ExternalPageCount"];

  uint64_t v25 = [NSNumber numberWithUnsignedInt:HIDWORD(v75)];
  [v9 setObject:v25 forKeyedSubscript:@"InternalPageCount"];

  uint64_t v26 = [NSNumber numberWithUnsignedLongLong:v76];
  [v9 setObject:v26 forKeyedSubscript:@"CompressedPageCount"];

  v82 = 0x500000002;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v63 = 32;
  if (!sysctl((int *)&v82, 2u, &v64, &v63, 0, 0))
  {
    size_t v27 = [NSNumber numberWithUnsignedLongLong:*((void *)&v64 + 1)];
    [v9 setObject:v27 forKeyedSubscript:@"SwapAvailSize"];

    int v28 = [NSNumber numberWithUnsignedLongLong:(void)v65];
    [v9 setObject:v28 forKeyedSubscript:@"SwapUsedSize"];
  }
  long long v62 = 1;
  long long v61 = 4;
  if (!sysctlbyname("kern.memorystatus_vm_pressure_level", &v62, &v61, 0, 0))
  {
    v29 = [(PLPerformanceAgent *)self descriptionForMemoryPressure:v62];
    [v9 setObject:v29 forKeyedSubscript:@"MemoryPressureLevel"];
  }
  long long v60 = 0;
  long long v61 = 4;
  if (sysctlbyname("kern.free_vnodes", &v60, &v61, 0, 0))
  {
    v30 = PLLogCommon();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1D2690000, v30, OS_LOG_TYPE_ERROR, "Error getting free vnode count from sysctl", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    unint64_t v31 = [NSNumber numberWithInt:v60];
    [v9 setObject:v31 forKeyedSubscript:@"FreeVnodeCount"];

    v30 = PLLogCommon();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v60;
      _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "Freevnode count %d", (uint8_t *)&buf, 8u);
    }
  }

  int v32 = *v6;
  v81 = 0;
  if (dyld_process_create_for_task())
  {
    if (dyld_process_snapshot_create_for_process())
    {
      long long v59 = v4;
      shared_cache = dyld_process_snapshot_get_shared_cache();
      if (!shared_cache)
      {
        uint64_t v45 = PLLogCommon();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_1D2690000, v45, OS_LOG_TYPE_ERROR, "failed to get shared cache", (uint8_t *)&buf, 2u);
        }

        dyld_process_dispose();
        dyld_process_snapshot_dispose();
        int v6 = (ipc_space_t *)MEMORY[0x1E4F14960];
        goto LABEL_48;
      }
      uint64_t v34 = shared_cache;
      long long v58 = v3;
      v35 = MEMORY[0x1D9429F10]();
      v36 = MEMORY[0x1D9429F00](v34);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v35;
        _os_log_debug_impl(&dword_1D2690000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "sharedRegionSize = %llu", (uint8_t *)&buf, 0xCu);
      }
      v37 = 0;
      size = 0;
      v88 = 0u;
      memset(v89, 0, sizeof(v89));
      buf = 0u;
      v87 = 0u;
      infoCnt = 19;
      address = v36;
      uint64_t v38 = __CFADD__(v36, v35);
      v39 = v36 + v35;
      if (!v38)
      {
        v37 = 0;
        while (1)
        {
          nesting_depth = 1;
          v81 = mach_vm_region_recurse(v32, &address, &size, &nesting_depth, (vm_region_recurse_info_t)&buf, &infoCnt);
          if (v81 == 1) {
            break;
          }
          if (HIBYTE(v88) <= 5u && ((1 << SHIBYTE(v88)) & 0x32) != 0) {
            v37 += DWORD2(v87);
          }
          address += size;
          if (address > v39) {
            goto LABEL_44;
          }
        }
        v46 = PLLogCommon();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          long long v57 = mach_error_string(v81);
          *(_DWORD *)v83 = 136315138;
          *(void *)&v83[4] = v57;
          _os_log_error_impl(&dword_1D2690000, v46, OS_LOG_TYPE_ERROR, "reached last region:%s", v83, 0xCu);
        }
      }
LABEL_44:
      v43 = *MEMORY[0x1E4F14AE8] * v37;
      v47 = PLLogCommon();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v83 = 134218240;
        *(void *)&v83[4] = v43;
        v84 = 2048;
        v85 = v35;
        _os_log_debug_impl(&dword_1D2690000, v47, OS_LOG_TYPE_DEBUG, "sharedCacheResidentSize = %llu sharedCacheVirtualSize = %llu", v83, 0x16u);
      }

      dyld_process_dispose();
      dyld_process_snapshot_dispose();
      v44 = v35;
      host_t v4 = v59;
      int v6 = (ipc_space_t *)MEMORY[0x1E4F14960];
      int v3 = v58;
      if (v81) {
        goto LABEL_48;
      }
      goto LABEL_47;
    }
    v42 = PLLogCommon();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      long long v56 = mach_error_string(v81);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v56;
      _os_log_error_impl(&dword_1D2690000, v42, OS_LOG_TYPE_ERROR, "failed to create snapshot of the process:%s", (uint8_t *)&buf, 0xCu);
    }

    dyld_process_dispose();
  }
  else
  {
    v41 = PLLogCommon();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      long long v55 = mach_error_string(v81);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v55;
      _os_log_error_impl(&dword_1D2690000, v41, OS_LOG_TYPE_ERROR, "failed to create dyld process:%s", (uint8_t *)&buf, 0xCu);
    }
  }
  v43 = 0;
  v44 = 0;
  if (!v81)
  {
LABEL_47:
    v48 = [NSNumber numberWithUnsignedLongLong:v44 >> 10];
    [v9 setObject:v48 forKeyedSubscript:@"SharedCacheVirtualSize"];

    v49 = [NSNumber numberWithUnsignedLongLong:v43 >> 10];
    [v9 setObject:v49 forKeyedSubscript:@"SharedCacheResidentSize"];

    v50 = (double)v43 * 100.0 / (double)v44;
    *(float *)&v50 = v50;
    *(float *)&v50 = roundf(*(float *)&v50);
    v51 = [NSNumber numberWithFloat:v50];
    [v9 setObject:v51 forKeyedSubscript:@"SharedCacheResidencyPercent"];
  }
LABEL_48:
  *(void *)v83 = 0;
  long long v61 = 8;
  if (sysctlbyname("vm.pages_grabbed", v83, &v61, 0, 0))
  {
    long long v52 = PLLogCommon();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1D2690000, v52, OS_LOG_TYPE_ERROR, "Error getting pages grabbed from sysctl", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    long long v53 = [NSNumber numberWithUnsignedLongLong:*(void *)v83];
    [v9 setObject:v53 forKeyedSubscript:@"PagesGrabbed"];

    long long v52 = PLLogCommon();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = *(void *)v83;
      _os_log_debug_impl(&dword_1D2690000, v52, OS_LOG_TYPE_DEBUG, "Pages Grabbed count %llu", (uint8_t *)&buf, 0xCu);
    }
  }

  if (v3) {
    [(PLPerformanceAgent *)self logEventPointSystemMemoryPerProcess:v9];
  }
  else {
    [(PLOperator *)self logEntry:v9];
  }
  [(PLPerformanceAgent *)self logSharedCacheStatisticsToCA:v9];
  sampleCounter = self->_sampleCounter;
  if (sampleCounter == self->_randomSample)
  {
    [(PLPerformanceAgent *)self logSystemMemoryToCA:v9];
    sampleCounter = self->_sampleCounter;
  }
  self->_sampleCounter = sampleCounter + 1;

LABEL_59:
  mach_port_deallocate(*v6, v4);
}

- (void)logEventPointVMTunables
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F929D0]);
  host_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"VMTunables"];
  unsigned int v5 = (void *)[v3 initWithEntryKey:v4];

  int v6 = [MEMORY[0x1E4FB0098] clientWithIdentifier:227];
  size_t v7 = [v6 levelForFactor:@"BallastOffset" withNamespaceName:@"COREOS_GMPOWER_VM_TUNING_PAGE_SHORTAGE_THRESHOLDS"];
  uint64_t v8 = [v7 longValue];
  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    uint64_t v13 = v8;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "logEventPointVMTunables VM_TUNING_PAGE_SHORTAGE_THRESHOLDS ballast offset: %lu", (uint8_t *)&v12, 0xCu);
  }

  int v10 = [NSNumber numberWithUnsignedInteger:v8];
  if (v10)
  {
    long long v11 = [NSNumber numberWithUnsignedInteger:v8];
    [v5 setObject:v11 forKeyedSubscript:@"BallastOffset"];
  }
  else
  {
    [v5 setObject:&unk_1F29E4C78 forKeyedSubscript:@"BallastOffset"];
  }

  [(PLOperator *)self logEntry:v5];
}

- (void)logEventPointDiskUsage
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] isTaskFullEPLMode])
  {
    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v22 = 0;
    host_t v4 = [v3 attributesOfFileSystemForPath:@"/" error:&v22];
    id v5 = v22;
    if (v4)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F929D0]);
      size_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"DiskUsage"];
      uint64_t v8 = (void *)[v6 initWithEntryKey:v7];

      uint64_t v9 = NSNumber;
      int v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F283A0]];
      long long v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") & 0xFFFFFFFFFFFFFC00);
      [v8 setObject:v11 forKeyedSubscript:@"FreeSize"];

      int v12 = NSNumber;
      uint64_t v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F283B0]];
      uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "unsignedIntegerValue") & 0xFFFFFFFFFFFFFC00);
      [v8 setObject:v14 forKeyedSubscript:@"SystemSize"];

      [(PLOperator *)self logEntry:v8];
    }
    else
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_12;
      }
      uint64_t v15 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__PLPerformanceAgent_logEventPointDiskUsage__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v15;
      if (qword_1EBD57988 != -1) {
        dispatch_once(&qword_1EBD57988, block);
      }
      if (!byte_1EBD57942) {
        goto LABEL_12;
      }
      uint64_t v8 = [NSString stringWithFormat:@"Could not get root dir attributes. Error: %@", v5];
      unint64_t v16 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
      id v18 = [v17 lastPathComponent];
      int v19 = [NSString stringWithUTF8String:"-[PLPerformanceAgent logEventPointDiskUsage]"];
      [v16 logMessage:v8 fromFile:v18 fromFunction:v19 fromLineNumber:828];

      unsigned int v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        int v24 = v8;
        _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
LABEL_12:
  }
}

uint64_t __44__PLPerformanceAgent_logEventPointDiskUsage__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57942 = result;
  return result;
}

- (void)logEventPointDiskFragmentation
{
  if ([MEMORY[0x1E4F929C0] isTaskFullEPLMode])
  {
    CFDictionaryRef IndirectionTableStatistics = ASP_GetIndirectionTableStatistics();
    if (IndirectionTableStatistics)
    {
      CFDictionaryRef v12 = IndirectionTableStatistics;
      host_t v4 = [(__CFDictionary *)IndirectionTableStatistics objectForKeyedSubscript:@"INDPool"];
      CFDictionaryRef IndirectionTableStatistics = v12;
      if (v4)
      {
        id v5 = [(__CFDictionary *)v12 objectForKeyedSubscript:@"INDPool"];
        id v6 = [v5 objectForKeyedSubscript:@"INDPoolFull"];

        CFDictionaryRef IndirectionTableStatistics = v12;
        if (v6)
        {
          id v7 = objc_alloc(MEMORY[0x1E4F929D0]);
          uint64_t v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"DiskFragmentation"];
          uint64_t v9 = (void *)[v7 initWithEntryKey:v8];

          int v10 = [(__CFDictionary *)v12 objectForKeyedSubscript:@"INDPool"];
          long long v11 = [v10 objectForKeyedSubscript:@"INDPoolFull"];
          [v9 setObject:v11 forKeyedSubscript:@"INDPoolFull"];

          [(PLOperator *)self logEntry:v9];
          CFDictionaryRef IndirectionTableStatistics = v12;
        }
      }
    }
  }
}

- (void)logEventPointJetsamPrority
{
  uint64_t v2 = (void *)MEMORY[0x1F4188790](self);
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  if (+[PLPerformanceAgent shouldCreateJetsamPriorityTable])
  {
    unint64_t v3 = 0x1E4F92000uLL;
    if ([MEMORY[0x1E4F929C0] eplEnabled])
    {
      int v4 = memorystatus_control();
      if (v4 < 1)
      {
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v11 = objc_opt_class();
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke_367;
          v65[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v65[4] = v11;
          if (qword_1EBD579A8 != -1) {
            dispatch_once(&qword_1EBD579A8, v65);
          }
          if (byte_1EBD57946)
          {
            CFDictionaryRef v12 = NSString;
            uint64_t v13 = __error();
            uint64_t v14 = objc_msgSend(v12, "stringWithFormat:", @"Could not get jetsam priority list size: %s\n", strerror(*v13));
            uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
            unint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
            unint64_t v17 = [v16 lastPathComponent];
            id v18 = [NSString stringWithUTF8String:"-[PLPerformanceAgent logEventPointJetsamPrority]"];
            [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:920];

            int v19 = PLLogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              int buffer = 138412290;
              v105 = v14;
              _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buffer, 0xCu);
            }
          }
        }
      }
      else
      {
        id v5 = malloc_type_malloc(v4, 0x2ED340CEuLL);
        int v6 = memorystatus_control();
        if (v6 > 0)
        {
          unsigned int v7 = v6;
          long long v60 = v5;
          uint64_t v8 = objc_opt_new();
          uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"JetsamPriority"];
          long long v63 = [MEMORY[0x1E4F1C9C8] monotonicDate];
          if (v7 < 0x18)
          {
LABEL_6:
            long long v71 = v9;
            long long v72 = v8;
            int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
            [v2 logEntries:v10 withGroupID:v9];

            free(v60);
            return;
          }
          unint64_t v29 = v7 / 0x18uLL;
          v30 = (unsigned int *)v60;
          long long v61 = v9;
          long long v62 = v8;
          while (1)
          {
            context = (void *)MEMORY[0x1D942A350]();
            unint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9 withDate:v63];
            int v32 = [NSNumber numberWithInt:*v30];
            [v31 setObject:v32 forKeyedSubscript:@"pid"];

            bzero(&buffer, 0x1000uLL);
            proc_pidpath(*v30, &buffer, 0x1000u);
            char v106 = 0;
            uint64_t v33 = [NSString stringWithUTF8String:basename((char *)&buffer)];
            [v31 setObject:v33 forKeyedSubscript:@"name"];

            uint64_t v68 = 0;
            uint64_t v69 = 0;
            if (memorystatus_control() && [*(id *)(v3 + 2496) debugEnabled])
            {
              uint64_t v34 = objc_opt_class();
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke_355;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              void block[4] = v34;
              if (qword_1EBD57998 != -1) {
                dispatch_once(&qword_1EBD57998, block);
              }
              if (byte_1EBD57944)
              {
                v35 = objc_msgSend(NSString, "stringWithFormat:", @"Warning: Failed to get memory limit info for pid %d.  Limits will appear as 0MB and not fatal.\n", *v30);
                v36 = (void *)MEMORY[0x1E4F929B8];
                v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
                uint64_t v38 = [v37 lastPathComponent];
                v39 = [NSString stringWithUTF8String:"-[PLPerformanceAgent logEventPointJetsamPrority]"];
                [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:886];

                long long v40 = PLLogCommon();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                {
                  LODWORD(v75[0]) = 138412290;
                  *(rusage_info_t *)((char *)v75 + 4) = v35;
                  _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)v75, 0xCu);
                }

                unint64_t v3 = 0x1E4F92000uLL;
                uint64_t v9 = v61;
                uint64_t v8 = v62;
              }
            }
            v41 = [NSNumber numberWithInt:v68];
            [v31 setObject:v41 forKeyedSubscript:@"activeLimit"];

            v42 = [NSNumber numberWithInt:v69];
            [v31 setObject:v42 forKeyedSubscript:@"inactiveLimit"];

            v43 = [NSNumber numberWithInt:BYTE4(v68) & 1];
            [v31 setObject:v43 forKeyedSubscript:@"activeLimitIsHard"];

            v44 = [NSNumber numberWithInt:BYTE4(v69) & 1];
            [v31 setObject:v44 forKeyedSubscript:@"inactiveLimitIsHard"];

            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            long long v98 = 0u;
            long long v99 = 0u;
            long long v96 = 0u;
            long long v97 = 0u;
            long long v94 = 0u;
            long long v95 = 0u;
            long long v92 = 0u;
            long long v93 = 0u;
            long long v90 = 0u;
            long long v91 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            long long v84 = 0u;
            long long v85 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            *(_OWORD *)long long v75 = 0u;
            if (proc_pid_rusage(*v30, 6, v75))
            {
              if (![*(id *)(v3 + 2496) debugEnabled]) {
                goto LABEL_42;
              }
              uint64_t v45 = objc_opt_class();
              v66[0] = MEMORY[0x1E4F143A8];
              v66[1] = 3221225472;
              v66[2] = __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke_361;
              v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v66[4] = v45;
              if (qword_1EBD579A0 != -1) {
                dispatch_once(&qword_1EBD579A0, v66);
              }
              if (!byte_1EBD57945) {
                goto LABEL_42;
              }
              v46 = objc_msgSend(NSString, "stringWithFormat:", @"Warning: Could not get rusage for pid %d.\n", *v30);
              v47 = (void *)MEMORY[0x1E4F929B8];
              v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
              v49 = [v48 lastPathComponent];
              v50 = [NSString stringWithUTF8String:"-[PLPerformanceAgent logEventPointJetsamPrority]"];
              [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:896];

              v51 = PLLogCommon();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                long long v74 = v46;
                _os_log_debug_impl(&dword_1D2690000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v3 = 0x1E4F92000;
              uint64_t v9 = v61;
              uint64_t v8 = v62;
            }
            else
            {
              long long v52 = [NSNumber numberWithUnsignedLongLong:(void)v90];
              [v31 setObject:v52 forKeyedSubscript:@"peakFootprint"];

              v46 = [NSNumber numberWithUnsignedLongLong:*((void *)&v79 + 1)];
              [v31 setObject:v46 forKeyedSubscript:@"footprint"];
            }

LABEL_42:
            long long v53 = [NSNumber numberWithInt:v30[1]];
            [v31 setObject:v53 forKeyedSubscript:@"priority"];

            long long v54 = [NSNumber numberWithUnsignedInt:v30[5] & 0x10];
            [v31 setObject:v54 forKeyedSubscript:@"pressuredExit"];

            long long v55 = [NSNumber numberWithUnsignedInt:v30[5] & 2];
            [v31 setObject:v55 forKeyedSubscript:@"frozen"];

            uint64_t v56 = [v2 countFD:*v30];
            if (v56 != -1)
            {
              long long v57 = [NSNumber numberWithInt:v56];
              [v31 setObject:v57 forKeyedSubscript:@"fds"];
            }
            uint64_t v58 = [v2 countMachPort:*v30];
            if (v58 != -1)
            {
              long long v59 = [NSNumber numberWithInt:v58];
              [v31 setObject:v59 forKeyedSubscript:@"machPorts"];
            }
            [v8 addObject:v31];

            v30 += 6;
            if (!--v29) {
              goto LABEL_6;
            }
          }
        }
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v20 = objc_opt_class();
          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke;
          v70[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v70[4] = v20;
          if (qword_1EBD57990 != -1) {
            dispatch_once(&qword_1EBD57990, v70);
          }
          if (byte_1EBD57943)
          {
            long long v21 = NSString;
            id v22 = __error();
            int v23 = objc_msgSend(v21, "stringWithFormat:", @"Error: Could not get jetsam priority list: %s\n", strerror(*v22));
            int v24 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
            uint64_t v26 = [v25 lastPathComponent];
            size_t v27 = [NSString stringWithUTF8String:"-[PLPerformanceAgent logEventPointJetsamPrority]"];
            [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:863];

            int v28 = PLLogCommon();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              int buffer = 138412290;
              v105 = v23;
              _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buffer, 0xCu);
            }
          }
        }
        free(v5);
      }
    }
  }
}

uint64_t __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57943 = result;
  return result;
}

uint64_t __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke_355(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57944 = result;
  return result;
}

uint64_t __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke_361(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57945 = result;
  return result;
}

uint64_t __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke_367(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57946 = result;
  return result;
}

- (int)countFD:(int)a3
{
  int v4 = proc_pidinfo(a3, 1, 0, 0, 0);
  if (v4 < 1) {
    return -1;
  }
  int v5 = v4;
  int v6 = (char *)malloc_type_malloc(v4, 0xB98EF18BuLL);
  if (!v6) {
    return 0;
  }
  unsigned int v7 = v6;
  int v8 = proc_pidinfo(a3, 1, 0, v6, v5);
  if (v8 >= 8)
  {
    uint64_t v9 = 0;
    int v10 = 0;
    uint64_t v11 = v8 & 0xFFFFFFF8;
    while (1)
    {
      if (*(_DWORD *)&v7[v9 + 4] == 1)
      {
        memset(v14, 0, sizeof(v14));
        int v12 = proc_pidfdinfo(a3, *(_DWORD *)&v7[v9], 1, v14, 176);
        if (v12 <= 0)
        {
          if (*__error() != 2)
          {
LABEL_15:
            free(v7);
            return -1;
          }
        }
        else
        {
          if (v12 < 0xB0) {
            goto LABEL_15;
          }
          ++v10;
        }
      }
      v9 += 8;
      if (v11 == v9) {
        goto LABEL_14;
      }
    }
  }
  int v10 = 0;
LABEL_14:
  free(v7);
  return v10;
}

- (int)countMachPort:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t buffer = 0;
  uint64_t v4 = proc_pidinfo(a3, 32, 0, &buffer, 8);
  if (v4 != 8)
  {
    uint64_t v13 = v4;
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      return -1;
    }
    uint64_t v14 = objc_opt_class();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __36__PLPerformanceAgent_countMachPort___block_invoke_376;
    v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = v14;
    if (qword_1EBD579B8 != -1) {
      dispatch_once(&qword_1EBD579B8, v20);
    }
    if (!byte_1EBD57948) {
      return -1;
    }
    unsigned int v7 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to get mach port count for pid(%d) with error=%d\n", v3, v13);
    uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
    unint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
    unint64_t v17 = [v16 lastPathComponent];
    id v18 = [NSString stringWithUTF8String:"-[PLPerformanceAgent countMachPort:]"];
    [v15 logMessage:v7 fromFile:v17 fromFunction:v18 fromLineNumber:981];

    int v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      int v24 = v7;
      _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    int v5 = -1;
    goto LABEL_15;
  }
  int v5 = buffer - HIDWORD(buffer);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__PLPerformanceAgent_countMachPort___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v6;
    if (qword_1EBD579B0 != -1) {
      dispatch_once(&qword_1EBD579B0, block);
    }
    if (byte_1EBD57947)
    {
      unsigned int v7 = [NSString stringWithFormat:@"mach port for pid(%d): table_size = %u, table_free = %u\n", v3, buffer, HIDWORD(buffer)];
      int v8 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
      int v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PLPerformanceAgent countMachPort:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:978];

      int v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        int v24 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
LABEL_15:
    }
  }
  return v5;
}

uint64_t __36__PLPerformanceAgent_countMachPort___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57947 = result;
  return result;
}

uint64_t __36__PLPerformanceAgent_countMachPort___block_invoke_376(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57948 = result;
  return result;
}

- (void)logEventPointAPFSFragmentation
{
  if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
  {
    if ([MEMORY[0x1E4F929C0] isTaskFullEPLMode])
    {
      uint64_t v3 = [(PLOperator *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke;
      block[3] = &unk_1E692A250;
      void block[4] = self;
      dispatch_async(v3, block);
    }
  }
}

void __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  io_iterator_t existing = 0;
  mach_port_t v2 = *MEMORY[0x1E4F2EF00];
  CFDictionaryRef v3 = IOServiceMatching("AppleAPFSContainer");
  if (IOServiceGetMatchingServices(v2, v3, &existing))
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_2;
      v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v39[4] = v4;
      if (qword_1EBD579C0 != -1) {
        dispatch_once(&qword_1EBD579C0, v39);
      }
      if (byte_1EBD57949)
      {
        int v5 = [NSString stringWithFormat:@"Unable to scan IORegistry for APFS container object."];
        uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
        unsigned int v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
        int v8 = [v7 lastPathComponent];
        uint64_t v9 = [NSString stringWithUTF8String:"-[PLPerformanceAgent logEventPointAPFSFragmentation]_block_invoke"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:994];

        int v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buffer[0]) = 138412290;
          *(void *)((char *)buffer + 4) = v5;
LABEL_39:
          _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buffer, 0xCu);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
    }
    return;
  }
  io_object_t v11 = IOIteratorNext(existing);
  if (v11)
  {
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    io_registry_entry_t v13 = v11;
    while (1)
    {
      io_registry_entry_t parent = 0;
      CFMutableDictionaryRef properties = 0;
      if (IORegistryEntryGetParentEntry(v13, "IOService", &parent)) {
        break;
      }
      if (!IORegistryEntryCreateCFProperties(parent, &properties, v12, 0))
      {
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name");
        memset(buffer, 0, sizeof(buffer));
        if (Value && CFStringGetCString(Value, (char *)buffer, 64, 0x8000100u)) {
          [*(id *)(a1 + 32) logEventPointAPFSFragmentationWithContainer:buffer];
        }
        CFRelease(properties);
        IOObjectRelease(parent);
        IOObjectRelease(v13);
        goto LABEL_28;
      }
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v21 = objc_opt_class();
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_391;
        v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v35[4] = v21;
        if (qword_1EBD579D0 != -1) {
          dispatch_once(&qword_1EBD579D0, v35);
        }
        if (byte_1EBD5794B)
        {
          uint64_t v15 = [NSString stringWithFormat:@"Unable to fetch IORegistry properties for APFS container object."];
          id v22 = (void *)MEMORY[0x1E4F929B8];
          int v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
          int v24 = [v23 lastPathComponent];
          uint64_t v25 = [NSString stringWithUTF8String:"-[PLPerformanceAgent logEventPointAPFSFragmentation]_block_invoke_2"];
          [v22 logMessage:v15 fromFile:v24 fromFunction:v25 fromLineNumber:1009];

          uint64_t v20 = PLLogCommon();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
LABEL_23:

            goto LABEL_28;
          }
LABEL_30:
          LODWORD(buffer[0]) = 138412290;
          *(void *)((char *)buffer + 4) = v15;
          _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buffer, 0xCu);
          goto LABEL_23;
        }
      }
LABEL_28:
      io_registry_entry_t v13 = IOIteratorNext(existing);
      if (!v13)
      {
        IOObjectRelease(existing);
        return;
      }
    }
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_28;
    }
    uint64_t v14 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_387;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v14;
    if (qword_1EBD579C8 != -1) {
      dispatch_once(&qword_1EBD579C8, block);
    }
    if (!byte_1EBD5794A) {
      goto LABEL_28;
    }
    uint64_t v15 = [NSString stringWithFormat:@"Unable to scan IORegistry for APFS container object."];
    unint64_t v16 = (void *)MEMORY[0x1E4F929B8];
    unint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
    id v18 = [v17 lastPathComponent];
    int v19 = [NSString stringWithUTF8String:"-[PLPerformanceAgent logEventPointAPFSFragmentation]_block_invoke_2"];
    [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:1005];

    uint64_t v20 = PLLogCommon();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_23;
    }
    goto LABEL_30;
  }
  IOObjectRelease(existing);
  if (objc_msgSend(MEMORY[0x1E4F929C0], "debugEnabled", v32, v33))
  {
    uint64_t v27 = objc_opt_class();
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_400;
    v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v34[4] = v27;
    if (qword_1EBD579D8 != -1) {
      dispatch_once(&qword_1EBD579D8, v34);
    }
    if (byte_1EBD5794C)
    {
      int v5 = [NSString stringWithFormat:@"no APFS containers found."];
      int v28 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
      v30 = [v29 lastPathComponent];
      unint64_t v31 = [NSString stringWithUTF8String:"-[PLPerformanceAgent logEventPointAPFSFragmentation]_block_invoke_2"];
      [v28 logMessage:v5 fromFile:v30 fromFunction:v31 fromLineNumber:1024];

      int v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buffer[0]) = 138412290;
        *(void *)((char *)buffer + 4) = v5;
        goto LABEL_39;
      }
LABEL_36:
    }
  }
}

uint64_t __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57949 = result;
  return result;
}

uint64_t __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_387(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5794A = result;
  return result;
}

uint64_t __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_391(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5794B = result;
  return result;
}

uint64_t __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_400(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5794C = result;
  return result;
}

- (void)logEventPointAPFSFragmentationWithContainer:(const char *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __66__PLPerformanceAgent_logEventPointAPFSFragmentationWithContainer___block_invoke;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = v4;
    if (qword_1EBD579E0 != -1) {
      dispatch_once(&qword_1EBD579E0, v24);
    }
    if (byte_1EBD5794D)
    {
      int v5 = objc_msgSend(NSString, "stringWithFormat:", @"logEventPointAPFSFragmentationWithContainer:%s\n", a3);
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      unsigned int v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
      int v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PLPerformanceAgent logEventPointAPFSFragmentationWithContainer:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1033];

      int v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  CFArrayRef theArray = 0;
  int valuePtr = 0;
  APFSGetFragmentationHistogram();
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __66__PLPerformanceAgent_logEventPointAPFSFragmentationWithContainer___block_invoke_409;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = v11;
    if (qword_1EBD579E8 != -1) {
      dispatch_once(&qword_1EBD579E8, v21);
    }
    if (byte_1EBD5794E)
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"unable to get fragmentation histogram for %s", a3);
      io_registry_entry_t v13 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m"];
      uint64_t v15 = [v14 lastPathComponent];
      unint64_t v16 = [NSString stringWithUTF8String:"-[PLPerformanceAgent logEventPointAPFSFragmentationWithContainer:]"];
      unint64_t v17 = v13;
      id v18 = (void *)v12;
      [v17 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:1039];

      int v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v18;
        uint64_t v26 = v18;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      else
      {
        uint64_t v20 = v18;
      }
    }
  }
}

uint64_t __66__PLPerformanceAgent_logEventPointAPFSFragmentationWithContainer___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5794D = result;
  return result;
}

uint64_t __66__PLPerformanceAgent_logEventPointAPFSFragmentationWithContainer___block_invoke_409(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5794E = result;
  return result;
}

uint64_t __66__PLPerformanceAgent_logEventPointAPFSFragmentationWithContainer___block_invoke_415(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5794F = result;
  return result;
}

uint64_t __66__PLPerformanceAgent_logEventPointAPFSFragmentationWithContainer___block_invoke_421(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57950 = result;
  return result;
}

- (void)logEventPointRollout
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] internalBuild] & 1) != 0
    || ([MEMORY[0x1E4F929C0] liteMode] & 1) == 0)
  {
    CFDictionaryRef v3 = objc_opt_new();
    uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Rollout"];
    int v5 = [MEMORY[0x1E4FB0058] defaultProvider];
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    id v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __42__PLPerformanceAgent_logEventPointRollout__block_invoke;
    void v12[3] = &unk_1E692AC68;
    id v7 = v4;
    id v13 = v7;
    id v8 = v6;
    id v14 = v8;
    id v9 = v3;
    id v15 = v9;
    [v5 enumerateSampledActiveRolloutsForCorrelationID:@"com.apple.powerlog" error:&v16 block:v12];
    id v10 = v16;
    if ([v9 count])
    {
      id v17 = v7;
      v18[0] = v9;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      [(PLOperator *)self logEntries:v11 withGroupID:v7];
    }
  }
}

void __42__PLPerformanceAgent_logEventPointRollout__block_invoke(uint64_t a1, void *a2)
{
  CFDictionaryRef v3 = (objc_class *)MEMORY[0x1E4F929D0];
  id v4 = a2;
  id v9 = (id)[[v3 alloc] initWithEntryKey:*(void *)(a1 + 32) withDate:*(void *)(a1 + 40)];
  int v5 = [v4 rolloutId];
  [v9 setObject:v5 forKeyedSubscript:@"rolloutID"];

  uint64_t v6 = NSNumber;
  uint64_t v7 = [v4 deploymentId];

  id v8 = [v6 numberWithInt:v7];
  [v9 setObject:v8 forKeyedSubscript:@"deploymentID"];

  [*(id *)(a1 + 48) addObject:v9];
}

- (void)log
{
  [(PLPerformanceAgent *)self logEventPointSystemMemory];
  [(PLPerformanceAgent *)self logEventPointDiskUsage];
  [(PLPerformanceAgent *)self logEventPointJetsamPrority];
  [(PLPerformanceAgent *)self logEventPointDiskFragmentation];
  [(PLPerformanceAgent *)self logEventPointAPFSFragmentation];
  [(PLPerformanceAgent *)self logEventPointVMTunables];
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryEntryLogged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBatteryEntryLogged:(id)a3
{
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
}

- (PLCFNotificationOperatorComposition)llmOverheadNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLlmOverheadNotification:(id)a3
{
}

- (PLCFNotificationOperatorComposition)vmTuningNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setVmTuningNotification:(id)a3
{
}

- (int)randomSample
{
  return self->_randomSample;
}

- (void)setRandomSample:(int)a3
{
  self->_int randomSample = a3;
}

- (int)sampleCounter
{
  return self->_sampleCounter;
}

- (void)setSampleCounter:(int)a3
{
  self->_sampleCounter = a3;
}

- (NSSet)systemMemoryProcessNames
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMemoryProcessNames, 0);
  objc_storeStrong((id *)&self->_vmTuningNotification, 0);
  objc_storeStrong((id *)&self->_llmOverheadNotification, 0);
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
  objc_storeStrong((id *)&self->_batteryEntryLogged, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
}

@end