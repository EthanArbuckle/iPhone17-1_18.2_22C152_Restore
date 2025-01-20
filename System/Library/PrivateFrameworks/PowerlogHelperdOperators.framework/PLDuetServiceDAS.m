@interface PLDuetServiceDAS
+ (id)entryEventBackwardDefinitionsDASEnergyBudgetReport;
+ (id)entryEventForwardDefinitionsDASApplicationPrediction;
+ (id)entryEventForwardDefinitionsDASDataBudgetAvailable;
+ (id)entryEventForwardDefinitionsDASEnergyBudgetAvailable;
+ (id)entryEventForwardDefinitionsDASPrediction;
+ (id)entryEventForwardDefinitionsDASTrial;
+ (id)entryEventNoneDefinitionsDASActivity;
+ (id)entryEventNoneDefinitionsDASActivityDropCount;
+ (id)entryEventNoneDefinitionsDASActivityLifecycle;
+ (id)entryEventNoneDefinitionsDASInfo;
+ (id)entryEventNoneDefinitionsDASPoliciesBlockingCriteria;
- (PLDuetServiceDAS)init;
- (PLService)duetService;
- (PLXPCListenerOperatorComposition)dasActivityEventListener;
- (PLXPCListenerOperatorComposition)dasActivityLifecycleEventListener;
- (PLXPCListenerOperatorComposition)dasBudgetEventListener;
- (PLXPCListenerOperatorComposition)dasDataBudgetEventListener;
- (PLXPCListenerOperatorComposition)dasEnergyReportEventListener;
- (PLXPCListenerOperatorComposition)dasInfoEventListener;
- (PLXPCListenerOperatorComposition)dasPoliciesBlockingCriteriaEventListener;
- (PLXPCListenerOperatorComposition)dasPredictionEventListener;
- (PLXPCListenerOperatorComposition)dasTrialEventListener;
- (int64_t)fileProtectionTypeStringToEnum:(id)a3;
- (void)didReceiveDASActivityEventWithPayload:(id)a3;
- (void)didReceiveDASActivityLifecycleEventWithPayload:(id)a3;
- (void)didReceiveDASBudgetEventWithPayload:(id)a3;
- (void)didReceiveDASDataBudgetEventWithPayload:(id)a3;
- (void)didReceiveDASInfoEventWithPayload:(id)a3;
- (void)didReceiveDASPoliciesBlockingCriteriaEventWithPayload:(id)a3;
- (void)didReceiveDASPredictionEventWithPayload:(id)a3;
- (void)didReceiveDASReportEventWithPayload:(id)a3;
- (void)didReceiveDASTrialEventWithPayload:(id)a3;
- (void)initOperatorDependanciesDAS:(id)a3;
- (void)setDasActivityEventListener:(id)a3;
- (void)setDasActivityLifecycleEventListener:(id)a3;
- (void)setDasBudgetEventListener:(id)a3;
- (void)setDasDataBudgetEventListener:(id)a3;
- (void)setDasEnergyReportEventListener:(id)a3;
- (void)setDasInfoEventListener:(id)a3;
- (void)setDasPoliciesBlockingCriteriaEventListener:(id)a3;
- (void)setDasPredictionEventListener:(id)a3;
- (void)setDasTrialEventListener:(id)a3;
- (void)setDuetService:(id)a3;
- (void)stopService;
@end

@implementation PLDuetServiceDAS

- (PLDuetServiceDAS)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PLDuetServiceDAS;
    v4 = [(PLDuetServiceDAS *)&v6 init];
    [(PLDuetServiceDAS *)v4 setDuetService:0];
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)stopService
{
}

+ (id)entryEventNoneDefinitionsDASPoliciesBlockingCriteria
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  [v2 setObject:&unk_1F40122B8 forKeyedSubscript:*MEMORY[0x1E4F92CD0]];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F92C40]];
  v15[0] = @"Policy";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v16[0] = v4;
  v15[1] = @"Utility";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  objc_super v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v16[1] = v6;
  v15[2] = @"Maintenance";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v16[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  uint64_t v10 = *MEMORY[0x1E4F92CA8];
  v13[0] = *MEMORY[0x1E4F92C50];
  v13[1] = v10;
  v14[0] = v2;
  v14[1] = v9;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v11;
}

+ (id)entryEventNoneDefinitionsDASActivityLifecycle
{
  v79[34] = *MEMORY[0x1E4F143B8];
  v75 = objc_opt_new();
  [v75 setObject:&unk_1F40122C8 forKeyedSubscript:*MEMORY[0x1E4F92CD0]];
  uint64_t v2 = MEMORY[0x1E4F1CC38];
  [v75 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F92C08]];
  [v75 setObject:v2 forKeyedSubscript:*MEMORY[0x1E4F92C40]];
  v78[0] = @"Name";
  v74 = [MEMORY[0x1E4F929D8] sharedInstance];
  v73 = objc_msgSend(v74, "commonTypeDict_StringFormat");
  v79[0] = v73;
  v78[1] = @"ProcessName";
  v72 = [MEMORY[0x1E4F929D8] sharedInstance];
  v71 = objc_msgSend(v72, "commonTypeDict_StringFormat_withProcessName");
  v79[1] = v71;
  v78[2] = @"Priority";
  v70 = [MEMORY[0x1E4F929D8] sharedInstance];
  v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat");
  v79[2] = v69;
  v78[3] = @"PID";
  v68 = [MEMORY[0x1E4F929D8] sharedInstance];
  v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
  v79[3] = v67;
  v78[4] = @"StartDate";
  v66 = [MEMORY[0x1E4F929D8] sharedInstance];
  v65 = objc_msgSend(v66, "commonTypeDict_DateFormat");
  v79[4] = v65;
  v78[5] = @"EndDate";
  v64 = [MEMORY[0x1E4F929D8] sharedInstance];
  v63 = objc_msgSend(v64, "commonTypeDict_DateFormat");
  v79[5] = v63;
  v78[6] = @"Duration";
  v62 = [MEMORY[0x1E4F929D8] sharedInstance];
  v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
  v79[6] = v61;
  v78[7] = @"SuspendRequestDate";
  v60 = [MEMORY[0x1E4F929D8] sharedInstance];
  v59 = objc_msgSend(v60, "commonTypeDict_DateFormat");
  v79[7] = v59;
  v78[8] = @"SuspensionDelay";
  v58 = [MEMORY[0x1E4F929D8] sharedInstance];
  v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat");
  v79[8] = v57;
  v78[9] = @"ScheduleAfterDate";
  v56 = [MEMORY[0x1E4F929D8] sharedInstance];
  v55 = objc_msgSend(v56, "commonTypeDict_DateFormat");
  v79[9] = v55;
  v78[10] = @"ScheduleBeforeDate";
  v54 = [MEMORY[0x1E4F929D8] sharedInstance];
  v53 = objc_msgSend(v54, "commonTypeDict_DateFormat");
  v79[10] = v53;
  v78[11] = @"BeyondDeadline";
  v52 = [MEMORY[0x1E4F929D8] sharedInstance];
  v51 = objc_msgSend(v52, "commonTypeDict_BoolFormat");
  v79[11] = v51;
  v78[12] = @"Interval";
  v50 = [MEMORY[0x1E4F929D8] sharedInstance];
  v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v79[12] = v49;
  v78[13] = @"FileProtection";
  v48 = [MEMORY[0x1E4F929D8] sharedInstance];
  v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v79[13] = v47;
  v78[14] = @"IsCPUIntensive";
  v46 = [MEMORY[0x1E4F929D8] sharedInstance];
  v45 = objc_msgSend(v46, "commonTypeDict_BoolFormat");
  v79[14] = v45;
  v78[15] = @"IsMemoryIntensive";
  v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  v43 = objc_msgSend(v44, "commonTypeDict_BoolFormat");
  v79[15] = v43;
  v78[16] = @"RequiresPlugin";
  v42 = [MEMORY[0x1E4F929D8] sharedInstance];
  v41 = objc_msgSend(v42, "commonTypeDict_BoolFormat");
  v79[16] = v41;
  v78[17] = @"RequiresNetwork";
  v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  v39 = objc_msgSend(v40, "commonTypeDict_BoolFormat");
  v79[17] = v39;
  v78[18] = @"RequiresInexpensiveNetworking";
  v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  v37 = objc_msgSend(v38, "commonTypeDict_BoolFormat");
  v79[18] = v37;
  v78[19] = @"RequiresUnconstrainedNetworking";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  v35 = objc_msgSend(v36, "commonTypeDict_BoolFormat");
  v79[19] = v35;
  v78[20] = @"RequiresDeviceInactivity";
  v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  v33 = objc_msgSend(v34, "commonTypeDict_BoolFormat");
  v79[20] = v33;
  v78[21] = @"RequiresSignificantUserInactivity";
  v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_BoolFormat");
  v79[21] = v31;
  v78[22] = @"TriggersRestart";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_BoolFormat");
  v79[22] = v28;
  v78[23] = @"Energy";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v79[23] = v26;
  v78[24] = @"NetworkTaskSize";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v79[24] = v24;
  v78[25] = @"OptimalScore";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v79[25] = v22;
  v78[26] = @"ScoreWhenRun";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v79[26] = v20;
  v78[27] = @"OptimalScorePercentage";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v79[27] = v18;
  v78[28] = @"BundleID";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v79[28] = v16;
  v78[29] = @"Application";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat_withAppName");
  v79[29] = v4;
  v78[30] = @"InvolvedProcesses";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  objc_super v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withProcessName");
  v79[30] = v6;
  v78[31] = @"GroupName";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v79[31] = v8;
  v78[32] = @"SuspensionReason";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v79[32] = v10;
  v78[33] = @"Limitations";
  v11 = [MEMORY[0x1E4F929D8] sharedInstance];
  v12 = objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v79[33] = v12;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:34];

  uint64_t v13 = *MEMORY[0x1E4F92CA8];
  v76[0] = *MEMORY[0x1E4F92C50];
  v76[1] = v13;
  v77[0] = v75;
  v77[1] = v30;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:2];

  return v14;
}

+ (id)entryEventNoneDefinitionsDASActivity
{
  v56[2] = *MEMORY[0x1E4F143B8];
  v55[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v53[0] = *MEMORY[0x1E4F92CD0];
  v53[1] = v2;
  v54[0] = &unk_1F40122D8;
  v54[1] = MEMORY[0x1E4F1CC38];
  v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
  v56[0] = v50;
  v55[1] = *MEMORY[0x1E4F92CA8];
  v51[0] = @"taskName";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_StringFormat");
  v52[0] = v48;
  v51[1] = @"startTime";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_DateFormat");
  v52[1] = v46;
  v51[2] = @"endTime";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_DateFormat");
  v52[2] = v44;
  v51[3] = @"duration";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v52[3] = v42;
  v51[4] = @"optimalScore";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v52[4] = v40;
  v51[5] = @"scoreWhenRun";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v52[5] = v38;
  v51[6] = @"networkTaskSize";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v52[6] = v36;
  v51[7] = @"priority";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v52[7] = v34;
  v51[8] = @"requiresPlugin";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_BoolFormat");
  v52[8] = v32;
  v51[9] = @"requiresInexpensiveNetworking";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_BoolFormat");
  v52[9] = v30;
  v51[10] = @"application";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_StringFormat_withBundleID");
  v52[10] = v28;
  v51[11] = @"bundleID";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_StringFormat_withBundleID");
  v52[11] = v26;
  v51[12] = @"involvedProcesses";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_StringFormat_withBundleID");
  v52[12] = v24;
  v51[13] = @"requiresDeviceInactivity";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_BoolFormat");
  v52[13] = v22;
  v51[14] = @"isCpuIntensive";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_BoolFormat");
  v52[14] = v20;
  v51[15] = @"isMemoryIntensive";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_BoolFormat");
  v52[15] = v18;
  v51[16] = @"scoreNetworkQualityPolicy";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v52[16] = v16;
  v51[17] = @"scoreBatteryLevelPolicy";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v52[17] = v14;
  v51[18] = @"scoreEnergyBudgetPolicy";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v52[18] = v4;
  v51[19] = @"scoreChargerPluggedInPolicy";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  objc_super v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v52[19] = v6;
  v51[20] = @"scoreDeviceActivityPolicy";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v52[20] = v8;
  v51[21] = @"scoreApplicationPolicy";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v52[21] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:22];
  v56[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];

  return v12;
}

+ (id)entryEventNoneDefinitionsDASActivityDropCount
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F40122B8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"droppedCount";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventNoneDefinitionsDASInfo
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  uint64_t v13 = &unk_1F40122B8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"eventsCoalesced";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"queuedTasks";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  objc_super v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitionsDASPrediction
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F92D00];
  v14[0] = *MEMORY[0x1E4F92D10];
  v14[1] = v2;
  v15[0] = &unk_1F400DBB8;
  v15[1] = &unk_1F400DBD0;
  void v14[2] = *MEMORY[0x1E4F92D08];
  v15[2] = &unk_1F400DBE8;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F40122B8;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v4;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8[0] = @"powerPluggedInPrediction";
  v8[1] = @"cellQualityPrediction";
  v9[0] = v3;
  v9[1] = v3;
  v8[2] = @"deviceActivityPrediction";
  v8[3] = @"wiFiAssociatedPrediction";
  v9[2] = v3;
  v9[3] = v3;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];
  v13[1] = v5;
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitionsDASTrial
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F40122B8;
  v20[1] = MEMORY[0x1E4F1CC38];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"trialExperimentId";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v18[0] = v14;
  v17[1] = @"trialTreatmentId";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v18[1] = v4;
  v17[2] = @"trialDeploymentId";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  objc_super v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v18[2] = v6;
  v17[3] = @"trialStartDate";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_DateFormat");
  v18[3] = v8;
  v17[4] = @"trialEndDate";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_DateFormat");
  v18[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionsDASApplicationPrediction
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F40122B8;
  v16[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"applicationBundleID";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v13[1] = @"applicationPredictionArray";
  v14[0] = v5;
  uint64_t v6 = *MEMORY[0x1E4F92D00];
  v11[0] = *MEMORY[0x1E4F92D10];
  v11[1] = v6;
  v12[0] = &unk_1F400DBB8;
  v12[1] = &unk_1F400DBD0;
  void v11[2] = *MEMORY[0x1E4F92D08];
  void v12[2] = &unk_1F400DBE8;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v14[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v18[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v9;
}

+ (id)entryEventForwardDefinitionsDASEnergyBudgetAvailable
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F40122B8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"energyAvailable";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitionsDASDataBudgetAvailable
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F40122B8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"dataAvailable";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventBackwardDefinitionsDASEnergyBudgetReport
{
  v33[2] = *MEMORY[0x1E4F143B8];
  v32[0] = *MEMORY[0x1E4F92C50];
  uint64_t v30 = *MEMORY[0x1E4F92CD0];
  v31 = &unk_1F40122B8;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  v33[0] = v27;
  v32[1] = *MEMORY[0x1E4F92CA8];
  v28[0] = @"PowerlogEnergyReportedPrevious";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v29[0] = v25;
  v28[1] = @"PowerlogEnergyReportedLast";
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v29[1] = v23;
  v28[2] = @"PowerlogTimestampPrevious";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_DateFormat");
  v29[2] = v21;
  v28[3] = @"PowerlogTimestampLast";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_DateFormat");
  v29[3] = v19;
  v28[4] = @"CPUEnergyPrevious";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v29[4] = v17;
  v28[5] = @"NetworkEnergyPrevious";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v29[5] = v15;
  v28[6] = @"CPUEnergyLast";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v29[6] = v13;
  v28[7] = @"NetworkEnergyLast";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v29[7] = v3;
  v28[8] = @"CPUEnergyCurrent";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v29[8] = v5;
  v28[9] = @"NetworkEnergyCurrent";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v29[9] = v7;
  v28[10] = @"DidReport";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_BoolFormat");
  v29[10] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:11];
  v33[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

  return v11;
}

- (void)initOperatorDependanciesDAS:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!+[PLUtilities isPowerlogHelperd])
    {
      [(PLDuetServiceDAS *)self setDuetService:v4];
      id v5 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke;
      v34[3] = &unk_1E6E47740;
      v34[4] = self;
      uint64_t v6 = (void *)[v5 initWithOperator:v4 withRegistration:&unk_1F4011310 withBlock:v34];
      [(PLDuetServiceDAS *)self setDasTrialEventListener:v6];

      id v7 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_2;
      v33[3] = &unk_1E6E47740;
      void v33[4] = self;
      v8 = (void *)[v7 initWithOperator:v4 withRegistration:&unk_1F4011338 withBlock:v33];
      [(PLDuetServiceDAS *)self setDasActivityEventListener:v8];

      id v9 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      void v32[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_3;
      v32[3] = &unk_1E6E47740;
      v32[4] = self;
      uint64_t v10 = (void *)[v9 initWithOperator:v4 withRegistration:&unk_1F4011360 withBlock:v32];
      [(PLDuetServiceDAS *)self setDasActivityLifecycleEventListener:v10];

      id v11 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_4;
      v31[3] = &unk_1E6E47740;
      v31[4] = self;
      uint64_t v12 = (void *)[v11 initWithOperator:v4 withRegistration:&unk_1F4011388 withBlock:v31];
      [(PLDuetServiceDAS *)self setDasInfoEventListener:v12];

      id v13 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_5;
      v30[3] = &unk_1E6E47740;
      v30[4] = self;
      v14 = (void *)[v13 initWithOperator:v4 withRegistration:&unk_1F40113B0 withBlock:v30];
      [(PLDuetServiceDAS *)self setDasPoliciesBlockingCriteriaEventListener:v14];

      id v15 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_6;
      v29[3] = &unk_1E6E47740;
      v29[4] = self;
      v16 = (void *)[v15 initWithOperator:v4 withRegistration:&unk_1F40113D8 withBlock:v29];
      [(PLDuetServiceDAS *)self setDasPredictionEventListener:v16];

      id v17 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_340;
      v28[3] = &unk_1E6E47740;
      v28[4] = self;
      v18 = (void *)[v17 initWithOperator:v4 withRegistration:&unk_1F4011400 withBlock:v28];
      [(PLDuetServiceDAS *)self setDasBudgetEventListener:v18];

      id v19 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_2_348;
      v27[3] = &unk_1E6E47740;
      v27[4] = self;
      v20 = (void *)[v19 initWithOperator:v4 withRegistration:&unk_1F4011428 withBlock:v27];
      [(PLDuetServiceDAS *)self setDasDataBudgetEventListener:v20];

      id v21 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_3_356;
      v26[3] = &unk_1E6E47740;
      v26[4] = self;
      v22 = (void *)[v21 initWithOperator:v4 withRegistration:&unk_1F4011450 withBlock:v26];
      [(PLDuetServiceDAS *)self setDasEnergyReportEventListener:v22];

      if ([MEMORY[0x1E4F929C0] taskMode])
      {
        v23 = PLLogDuetServiceDAS();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_1E4220000, v23, OS_LOG_TYPE_DEFAULT, "PerfPowerServices is ready to receive Background Processing Payload", v25, 2u);
        }

        dispatch_time_t v24 = dispatch_time(0, 60000000000);
        dispatch_after(v24, MEMORY[0x1E4F14428], &__block_literal_global_360);
      }
    }
  }
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveDASTrialEventWithPayload:a5];
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveDASActivityEventWithPayload:a5];
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveDASActivityLifecycleEventWithPayload:a5];
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveDASInfoEventWithPayload:a5];
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveDASPoliciesBlockingCriteriaEventWithPayload:a5];
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveDASPredictionEventWithPayload:a5];
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveDASBudgetEventWithPayload:a5];
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_2_348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveDASDataBudgetEventWithPayload:a5];
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_3_356(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveDASReportEventWithPayload:a5];
}

void __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_358()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint32_t v0 = notify_post("com.apple.perfpowerservices.reportfeaturestatus");
  v1 = PLLogDuetServiceDAS();
  uint64_t v2 = v1;
  if (v0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_358_cold_1(v0, v2);
    }
  }
  else if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    id v4 = "com.apple.perfpowerservices.reportfeaturestatus";
    _os_log_impl(&dword_1E4220000, v2, OS_LOG_TYPE_INFO, "Posted %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)didReceiveDASActivityEventWithPayload:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PLDuetServiceDAS_didReceiveDASActivityEventWithPayload___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didReceiveDASActivityEventWithPayload__defaultOnce != -1) {
      dispatch_once(&didReceiveDASActivityEventWithPayload__defaultOnce, block);
    }
    if (didReceiveDASActivityEventWithPayload__classDebugEnabled)
    {
      uint64_t v6 = [NSString stringWithFormat:@"payload=%@", v4];
      id v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetServiceDAS.m"];
      id v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLDuetServiceDAS didReceiveDASActivityEventWithPayload:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:482];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[PLDuetServiceDAS didReceiveDASActivityEventWithPayload:]();
  }

  if (v4)
  {
    uint64_t v13 = [v4 objectForKeyedSubscript:@"dasTasks"];
    if (v13)
    {
      v14 = (void *)v13;
      id v15 = [(PLDuetServiceDAS *)self duetService];

      if (v15)
      {
        v61 = self;
        context = (void *)MEMORY[0x1E4E7EF70]();
        uint64_t v59 = *MEMORY[0x1E4F92D40];
        v65 = +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:");
        v64 = objc_opt_new();
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        v62 = v4;
        id obj = [v4 objectForKeyedSubscript:@"dasTasks"];
        uint64_t v16 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          v18 = @"timeWhenRun";
          uint64_t v19 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v67 != v19) {
                objc_enumerationMutation(obj);
              }
              id v21 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              v22 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v65];
              v23 = [v21 objectForKeyedSubscript:@"taskName"];
              [v22 setObject:v23 forKeyedSubscript:@"taskName"];

              dispatch_time_t v24 = [v21 objectForKeyedSubscript:@"startTime"];
              [v22 setObject:v24 forKeyedSubscript:@"startTime"];

              v25 = [v21 objectForKeyedSubscript:@"endTime"];
              [v22 setObject:v25 forKeyedSubscript:@"endTime"];

              v26 = [v21 objectForKey:v18];

              if (v26)
              {
                v27 = [v21 objectForKeyedSubscript:v18];
                [v27 timeIntervalSince1970];
                v29 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:floor(v28)];
                [v29 convertFromSystemToMonotonic];
                v31 = uint64_t v30 = v18;
                [v22 setEntryDate:v31];

                v18 = v30;
              }
              v32 = [v21 objectForKeyedSubscript:@"duration"];
              [v22 setObject:v32 forKeyedSubscript:@"duration"];

              v33 = [v21 objectForKeyedSubscript:@"optimalScore"];
              [v22 setObject:v33 forKeyedSubscript:@"optimalScore"];

              v34 = [v21 objectForKeyedSubscript:@"scoreWhenRun"];
              [v22 setObject:v34 forKeyedSubscript:@"scoreWhenRun"];

              v35 = [v21 objectForKeyedSubscript:@"networkTaskSize"];
              [v22 setObject:v35 forKeyedSubscript:@"networkTaskSize"];

              v36 = [v21 objectForKeyedSubscript:@"priority"];
              [v22 setObject:v36 forKeyedSubscript:@"priority"];

              v37 = [v21 objectForKeyedSubscript:@"requiresPlugin"];
              [v22 setObject:v37 forKeyedSubscript:@"requiresPlugin"];

              v38 = [v21 objectForKeyedSubscript:@"requiresInexpensiveNetworking"];
              [v22 setObject:v38 forKeyedSubscript:@"requiresInexpensiveNetworking"];

              v39 = [v21 objectForKeyedSubscript:@"application"];
              [v22 setObject:v39 forKeyedSubscript:@"application"];

              v40 = [v21 objectForKeyedSubscript:@"bundleID"];
              [v22 setObject:v40 forKeyedSubscript:@"bundleID"];

              v41 = [v21 objectForKeyedSubscript:@"involvedProcesses"];
              [v22 setObject:v41 forKeyedSubscript:@"involvedProcesses"];

              if ([MEMORY[0x1E4F929C0] fullMode])
              {
                v42 = [v21 objectForKeyedSubscript:@"requiresDeviceInactivity"];
                [v22 setObject:v42 forKeyedSubscript:@"requiresDeviceInactivity"];

                v43 = [v21 objectForKeyedSubscript:@"isCpuIntensive"];
                [v22 setObject:v43 forKeyedSubscript:@"isCpuIntensive"];

                v44 = [v21 objectForKeyedSubscript:@"isMemoryIntensive"];
                [v22 setObject:v44 forKeyedSubscript:@"isMemoryIntensive"];

                v45 = [v21 objectForKeyedSubscript:@"scoreNetworkQualityPolicy"];
                [v22 setObject:v45 forKeyedSubscript:@"scoreNetworkQualityPolicy"];

                v46 = [v21 objectForKeyedSubscript:@"scoreBatteryLevelPolicy"];
                [v22 setObject:v46 forKeyedSubscript:@"scoreBatteryLevelPolicy"];

                v47 = [v21 objectForKeyedSubscript:@"scoreEnergyBudgetPolicy"];
                [v22 setObject:v47 forKeyedSubscript:@"scoreEnergyBudgetPolicy"];

                v48 = [v21 objectForKeyedSubscript:@"scoreChargerPluggedInPolicy"];
                [v22 setObject:v48 forKeyedSubscript:@"scoreChargerPluggedInPolicy"];

                v49 = [v21 objectForKeyedSubscript:@"scoreDeviceActivityPolicy"];
                [v22 setObject:v49 forKeyedSubscript:@"scoreDeviceActivityPolicy"];

                v50 = [v21 objectForKeyedSubscript:@"scoreApplicationPolicy"];
                [v22 setObject:v50 forKeyedSubscript:@"scoreApplicationPolicy"];
              }
              [v64 addObject:v22];
            }
            uint64_t v17 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
          }
          while (v17);
        }

        v51 = [(PLDuetServiceDAS *)v61 duetService];

        if (v51)
        {
          v52 = [(PLDuetServiceDAS *)v61 duetService];
          v71 = v65;
          v72 = v64;
          v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
          [v52 logEntries:v53 withGroupID:v65];
        }
        v54 = +[PLOperator entryKeyForType:v59 andName:@"DASDropCount"];
        v55 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v54];
        id v4 = v62;
        v56 = [v62 objectForKeyedSubscript:@"droppedCount"];
        [v55 setObject:v56 forKeyedSubscript:@"droppedCount"];

        v57 = [(PLDuetServiceDAS *)v61 duetService];

        if (v57)
        {
          v58 = [(PLDuetServiceDAS *)v61 duetService];
          [v58 logEntry:v55];
        }
      }
    }
  }
}

uint64_t __58__PLDuetServiceDAS_didReceiveDASActivityEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveDASActivityEventWithPayload__classDebugEnabled = result;
  return result;
}

- (void)didReceiveDASActivityLifecycleEventWithPayload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLDuetServiceDAS didReceiveDASActivityLifecycleEventWithPayload:]();
  }

  uint64_t v6 = (void *)MEMORY[0x1E4E7EF70]();
  id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"DASActivityLifecycle"];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v4];
  id v9 = [v4 objectForKeyedSubscript:@"FileProtection"];
  int64_t v10 = [(PLDuetServiceDAS *)self fileProtectionTypeStringToEnum:v9];

  id v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:v10];
  [v8 setObject:v11 forKeyedSubscript:@"FileProtection"];

  uint64_t v12 = [(PLDuetServiceDAS *)self duetService];

  if (v12)
  {
    uint64_t v13 = [(PLDuetServiceDAS *)self duetService];
    [v13 logEntry:v8];
  }
}

- (void)didReceiveDASInfoEventWithPayload:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __54__PLDuetServiceDAS_didReceiveDASInfoEventWithPayload___block_invoke;
    v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v24 = v5;
    if (didReceiveDASInfoEventWithPayload__defaultOnce != -1) {
      dispatch_once(&didReceiveDASInfoEventWithPayload__defaultOnce, &block);
    }
    if (didReceiveDASInfoEventWithPayload__classDebugEnabled)
    {
      uint64_t v6 = [NSString stringWithFormat:@"payload=%@", v4, block, v21, v22, v23, v24];
      id v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetServiceDAS.m"];
      id v9 = [v8 lastPathComponent];
      int64_t v10 = [NSString stringWithUTF8String:"-[PLDuetServiceDAS didReceiveDASInfoEventWithPayload:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:549];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if (v4)
  {
    uint64_t v12 = [(PLDuetServiceDAS *)self duetService];

    if (v12)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4E7EF70]();
      v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"DASInfo"];
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14];
      uint64_t v16 = [v4 objectForKeyedSubscript:@"eventsCoalesced"];
      [v15 setObject:v16 forKeyedSubscript:@"eventsCoalesced"];

      uint64_t v17 = [v4 objectForKeyedSubscript:@"queuedTasks"];
      [v15 setObject:v17 forKeyedSubscript:@"queuedTasks"];

      v18 = [(PLDuetServiceDAS *)self duetService];

      if (v18)
      {
        uint64_t v19 = [(PLDuetServiceDAS *)self duetService];
        [v19 logEntry:v15];
      }
    }
  }
}

uint64_t __54__PLDuetServiceDAS_didReceiveDASInfoEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveDASInfoEventWithPayload__classDebugEnabled = result;
  return result;
}

- (void)didReceiveDASBudgetEventWithPayload:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __56__PLDuetServiceDAS_didReceiveDASBudgetEventWithPayload___block_invoke;
    v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v24 = v5;
    if (didReceiveDASBudgetEventWithPayload__defaultOnce != -1) {
      dispatch_once(&didReceiveDASBudgetEventWithPayload__defaultOnce, &block);
    }
    if (didReceiveDASBudgetEventWithPayload__classDebugEnabled)
    {
      uint64_t v6 = [NSString stringWithFormat:@"payload=%@", v4, block, v21, v22, v23, v24];
      id v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetServiceDAS.m"];
      id v9 = [v8 lastPathComponent];
      int64_t v10 = [NSString stringWithUTF8String:"-[PLDuetServiceDAS didReceiveDASBudgetEventWithPayload:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:563];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[PLDuetServiceDAS didReceiveDASBudgetEventWithPayload:]();
  }

  if (v4)
  {
    uint64_t v13 = [(PLDuetServiceDAS *)self duetService];

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E4E7EF70]();
      id v15 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"DASEnergyBudgetAvailable"];
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15];
      uint64_t v17 = [v4 objectForKeyedSubscript:@"energyAvailable"];
      [v16 setObject:v17 forKeyedSubscript:@"energyAvailable"];

      v18 = [(PLDuetServiceDAS *)self duetService];

      if (v18)
      {
        uint64_t v19 = [(PLDuetServiceDAS *)self duetService];
        [v19 logEntry:v16];
      }
    }
  }
}

uint64_t __56__PLDuetServiceDAS_didReceiveDASBudgetEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveDASBudgetEventWithPayload__classDebugEnabled = result;
  return result;
}

- (void)didReceiveDASDataBudgetEventWithPayload:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(PLDuetServiceDAS *)self duetService],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v6 = PLLogDuetServiceDAS();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PLDuetServiceDAS didReceiveDASDataBudgetEventWithPayload:]();
    }

    id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"DASDataBudgetAvailable"];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
    id v9 = [v4 objectForKeyedSubscript:@"dataAvailable"];
    [v8 setObject:v9 forKeyedSubscript:@"dataAvailable"];

    int64_t v10 = [(PLDuetServiceDAS *)self duetService];

    if (v10)
    {
      id v11 = [(PLDuetServiceDAS *)self duetService];
      [v11 logEntry:v8];
    }
  }
  else
  {
    id v7 = PLLogDuetServiceDAS();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PLDuetServiceDAS didReceiveDASDataBudgetEventWithPayload:]();
    }
  }
}

- (void)didReceiveDASReportEventWithPayload:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __56__PLDuetServiceDAS_didReceiveDASReportEventWithPayload___block_invoke;
    v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v23 = v5;
    if (didReceiveDASReportEventWithPayload__defaultOnce != -1) {
      dispatch_once(&didReceiveDASReportEventWithPayload__defaultOnce, &block);
    }
    if (didReceiveDASReportEventWithPayload__classDebugEnabled)
    {
      uint64_t v6 = [NSString stringWithFormat:@"payload=%@", v4, block, v20, v21, v22, v23];
      id v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetServiceDAS.m"];
      id v9 = [v8 lastPathComponent];
      int64_t v10 = [NSString stringWithUTF8String:"-[PLDuetServiceDAS didReceiveDASReportEventWithPayload:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:596];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[PLDuetServiceDAS didReceiveDASReportEventWithPayload:]();
  }

  if (v4)
  {
    uint64_t v13 = [(PLDuetServiceDAS *)self duetService];

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E4E7EF70]();
      id v15 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"DASEnergyBudgetReport"];
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15 withRawData:v4];
      uint64_t v17 = [(PLDuetServiceDAS *)self duetService];

      if (v17)
      {
        v18 = [(PLDuetServiceDAS *)self duetService];
        [v18 logEntry:v16];
      }
    }
  }
}

uint64_t __56__PLDuetServiceDAS_didReceiveDASReportEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveDASReportEventWithPayload__classDebugEnabled = result;
  return result;
}

- (void)didReceiveDASPredictionEventWithPayload:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PLDuetServiceDAS_didReceiveDASPredictionEventWithPayload___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didReceiveDASPredictionEventWithPayload__defaultOnce != -1) {
      dispatch_once(&didReceiveDASPredictionEventWithPayload__defaultOnce, block);
    }
    if (didReceiveDASPredictionEventWithPayload__classDebugEnabled)
    {
      uint64_t v6 = [NSString stringWithFormat:@"payload=%@", v4];
      id v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetServiceDAS.m"];
      id v9 = [v8 lastPathComponent];
      int64_t v10 = [NSString stringWithUTF8String:"-[PLDuetServiceDAS didReceiveDASPredictionEventWithPayload:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:609];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if (v4)
  {
    uint64_t v12 = [(PLDuetServiceDAS *)self duetService];

    if (v12)
    {
      context = (void *)MEMORY[0x1E4E7EF70]();
      uint64_t v41 = *MEMORY[0x1E4F92D30];
      v35 = +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:");
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v35];
      v14 = [v4 objectForKeyedSubscript:@"powerPluggedInPrediction"];
      [v13 setObject:v14 forKeyedSubscript:@"powerPluggedInPrediction"];

      id v15 = [v4 objectForKeyedSubscript:@"cellQualityPrediction"];
      [v13 setObject:v15 forKeyedSubscript:@"cellQualityPrediction"];

      uint64_t v16 = [v4 objectForKeyedSubscript:@"deviceActivityPrediction"];
      [v13 setObject:v16 forKeyedSubscript:@"deviceActivityPrediction"];

      uint64_t v17 = [v4 objectForKeyedSubscript:@"wiFiAssociatedPrediction"];
      [v13 setObject:v17 forKeyedSubscript:@"wiFiAssociatedPrediction"];

      v18 = [(PLDuetServiceDAS *)self duetService];

      if (v18)
      {
        uint64_t v19 = [(PLDuetServiceDAS *)self duetService];
        [v19 logEntry:v13];
      }
      v34 = v13;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v37 = v4;
      id obj = [v4 objectForKeyedSubscript:@"applicationUsagePrediction"];
      uint64_t v42 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v42)
      {
        uint64_t v39 = *(void *)v50;
        v40 = self;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v50 != v39) {
              objc_enumerationMutation(obj);
            }
            uint64_t v44 = v20;
            uint64_t v21 = *(void **)(*((void *)&v49 + 1) + 8 * v20);
            v43 = +[PLOperator entryKeyForType:v41 andName:@"DASApplicationUsagePrediction"];
            v22 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v43];
            uint64_t v23 = objc_opt_new();
            uint64_t v24 = [v21 allKeys];
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v56 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v46;
              do
              {
                for (uint64_t i = 0; i != v26; ++i)
                {
                  if (*(void *)v46 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v29 = *(void *)(*((void *)&v45 + 1) + 8 * i);
                  [v22 setObject:v29 forKeyedSubscript:@"applicationBundleID"];
                  uint64_t v30 = [v21 objectForKeyedSubscript:v29];
                  [v22 setObject:v30 forKeyedSubscript:@"applicationPredictionArray"];

                  [v23 addObject:v22];
                }
                uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v56 count:16];
              }
              while (v26);
            }
            v31 = [(PLDuetServiceDAS *)v40 duetService];

            if (v31)
            {
              v32 = [(PLDuetServiceDAS *)v40 duetService];
              v54 = v43;
              v55 = v23;
              v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
              [v32 logEntries:v33 withGroupID:v43];
            }
            uint64_t v20 = v44 + 1;
          }
          while (v44 + 1 != v42);
          uint64_t v42 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v42);
      }

      id v4 = v37;
    }
  }
}

uint64_t __60__PLDuetServiceDAS_didReceiveDASPredictionEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveDASPredictionEventWithPayload__classDebugEnabled = result;
  return result;
}

- (void)didReceiveDASPoliciesBlockingCriteriaEventWithPayload:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLDuetServiceDAS didReceiveDASPoliciesBlockingCriteriaEventWithPayload:]();
  }

  uint64_t v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"DASPoliciesBlockingCriteria"];
  context = (void *)MEMORY[0x1E4E7EF70]();
  [v4 objectForKeyedSubscript:@"Evaluations"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
        uint64_t v13 = [v11 objectForKeyedSubscript:@"Policy"];
        [v12 setObject:v13 forKeyedSubscript:@"Policy"];

        v14 = [v11 objectForKeyedSubscript:&unk_1F400DC30];
        [v12 setObject:v14 forKeyedSubscript:@"Utility"];

        id v15 = [v11 objectForKeyedSubscript:&unk_1F400DC48];
        [v12 setObject:v15 forKeyedSubscript:@"Maintenance"];

        uint64_t v16 = [(PLDuetServiceDAS *)self duetService];
        [v16 logEntry:v12];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

- (void)didReceiveDASTrialEventWithPayload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLDuetServiceDAS didReceiveDASTrialEventWithPayload:]();
  }

  uint64_t v6 = (void *)MEMORY[0x1E4E7EF70]();
  uint64_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"DASTrial"];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v4];
  uint64_t v9 = [(PLDuetServiceDAS *)self duetService];

  if (v9)
  {
    int64_t v10 = [(PLDuetServiceDAS *)self duetService];
    [v10 logEntry:v8];
  }
}

- (int64_t)fileProtectionTypeStringToEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ClassA"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"ClassB"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"ClassC"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (PLService)duetService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_duetService);
  return (PLService *)WeakRetained;
}

- (void)setDuetService:(id)a3
{
}

- (PLXPCListenerOperatorComposition)dasActivityEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDasActivityEventListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)dasActivityLifecycleEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDasActivityLifecycleEventListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)dasInfoEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDasInfoEventListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)dasPredictionEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDasPredictionEventListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)dasBudgetEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDasBudgetEventListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)dasDataBudgetEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDasDataBudgetEventListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)dasEnergyReportEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDasEnergyReportEventListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)dasPoliciesBlockingCriteriaEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDasPoliciesBlockingCriteriaEventListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)dasTrialEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDasTrialEventListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dasTrialEventListener, 0);
  objc_storeStrong((id *)&self->_dasPoliciesBlockingCriteriaEventListener, 0);
  objc_storeStrong((id *)&self->_dasEnergyReportEventListener, 0);
  objc_storeStrong((id *)&self->_dasDataBudgetEventListener, 0);
  objc_storeStrong((id *)&self->_dasBudgetEventListener, 0);
  objc_storeStrong((id *)&self->_dasPredictionEventListener, 0);
  objc_storeStrong((id *)&self->_dasInfoEventListener, 0);
  objc_storeStrong((id *)&self->_dasActivityLifecycleEventListener, 0);
  objc_storeStrong((id *)&self->_dasActivityEventListener, 0);
  objc_destroyWeak((id *)&self->_duetService);
}

void __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_358_cold_1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "com.apple.perfpowerservices.reportfeaturestatus";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1E4220000, a2, OS_LOG_TYPE_ERROR, "Failed to post %s : %d", (uint8_t *)&v2, 0x12u);
}

- (void)didReceiveDASActivityEventWithPayload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "didReceiveDASActivityEvent: payload=%@", v2, v3, v4, v5, v6);
}

- (void)didReceiveDASActivityLifecycleEventWithPayload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "didReceiveDASActivityLifecycle payload=%@", v2, v3, v4, v5, v6);
}

- (void)didReceiveDASBudgetEventWithPayload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "energyBudget payload=%@", v2, v3, v4, v5, v6);
}

- (void)didReceiveDASDataBudgetEventWithPayload:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "Empty Payload for dataBudget %@", v1, 0xCu);
}

- (void)didReceiveDASDataBudgetEventWithPayload:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Received dataBudget payload: %@", v2, v3, v4, v5, v6);
}

- (void)didReceiveDASReportEventWithPayload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "energyReport payload=%@", v2, v3, v4, v5, v6);
}

- (void)didReceiveDASPoliciesBlockingCriteriaEventWithPayload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "DASPoliciesBlockingCriteria payload=%@", v2, v3, v4, v5, v6);
}

- (void)didReceiveDASTrialEventWithPayload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "DASTrial payload=%@", v2, v3, v4, v5, v6);
}

@end