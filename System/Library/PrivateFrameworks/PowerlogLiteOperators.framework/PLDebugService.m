@interface PLDebugService
+ (id)entryAggregateDefinitionAggregateTest;
+ (id)entryAggregateDefinitionAggregateTestSmall;
+ (id)entryAggregateDefinitionAggregateTestSplitAndBucket;
+ (id)entryAggregateDefinitionAggregateTestVerySmall;
+ (id)entryAggregateDefinitions;
+ (id)entryEventNoneDefinitionArrayTest;
+ (id)entryEventNoneDefinitionFastInsertTest;
+ (id)entryEventNoneDefinitionPLAPITest;
+ (id)entryEventNoneDefinitionSleepNotificationTest;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionTest;
+ (id)entryEventPointDefinitions;
+ (id)railDefinitions;
+ (void)load;
- (BOOL)rawRead:(id)a3;
- (BOOL)rawWrite:(id)a3;
- (NSDictionary)clientFrameworkTestData;
- (NSMutableArray)clientFrameworkTestDataBatch;
- (PLAccountingDebugService)accDS;
- (PLDebugService)init;
- (PLDiscretionaryEnergyMonitor)energyMonitorDebugInstance;
- (PLEntryNotificationOperatorComposition)assertionListener;
- (PLEntryNotificationOperatorComposition)assertionNewListener;
- (PLEntryNotificationOperatorComposition)assertionUpdateListener;
- (PLEntryNotificationOperatorComposition)canSleepNotification;
- (PLEntryNotificationOperatorComposition)sleepNotification;
- (PLEntryNotificationOperatorComposition)wakeNotification;
- (PLSemaphore)canSleepSemaphore;
- (PLXPCListenerOperatorComposition)aggregateTestListener;
- (PLXPCListenerOperatorComposition)clientFrameworkTestListener;
- (PLXPCListenerOperatorComposition)clientFrameworkTestListenerBatch;
- (PLXPCListenerOperatorComposition)clientFrameworkTestListenerNonAllowlisted;
- (PLXPCListenerOperatorComposition)schemaTestListener;
- (PLXPCListenerOperatorComposition)xpcListenerPLLog;
- (PLXPCResponderOperatorComposition)aggregateTestResponder;
- (PLXPCResponderOperatorComposition)clientFrameworkTestResponder;
- (PLXPCResponderOperatorComposition)clientFrameworkTestResponderBatch;
- (PLXPCResponderOperatorComposition)clientFrameworkTestResponderNonAllowlisted;
- (PLXPCResponderOperatorComposition)energyMonitorDebugResponder;
- (PLXPCResponderOperatorComposition)xpcResponderPLAPITest;
- (PLXPCResponderOperatorComposition)xpcResponderPLLog;
- (id)filledTestArrayEntry;
- (id)getValueForPropertyName:(id)a3 forEnergyMonitor:(id)a4;
- (id)handleEnergyMonitorDebugQuery:(id)a3;
- (id)testPLAPIAccounting_AddPowerMeasurementEventInterval:(id)a3;
- (id)testPLAPIAccounting_CreateDistributionEventForwardAdd:(id)a3;
- (id)testPLAPIAccounting_CreateDistributionEventForwardChild:(id)a3;
- (id)testPLAPIAccounting_CreateDistributionEventForwardRem:(id)a3;
- (id)testPLAPIAccounting_CreateDistributionEventInterval:(id)a3;
- (id)testPLAPIAccounting_CreateDistributionEventPoint:(id)a3;
- (id)testPLAPIAccounting_CreatePowerEventBackward:(id)a3;
- (id)testPLAPIAccounting_CreatePowerEventForward:(id)a3;
- (id)testPLAPIAccounting_CreatePowerEventInterval:(id)a3;
- (id)testPLAPIAccounting_CreateQualificationEventBackward:(id)a3;
- (id)testPLAPIAccounting_CreateQualificationEventForwardAdd:(id)a3;
- (id)testPLAPIAccounting_CreateQualificationEventForwardChild:(id)a3;
- (id)testPLAPIAccounting_CreateQualificationEventForwardRem:(id)a3;
- (id)testPLAPIAccounting_CreateQualificationEventInterval:(id)a3;
- (id)testPLAPIAccounting_CreateQualificationEventPoint:(id)a3;
- (id)testPLAPIAccounting_ExistingTest:(id)a3;
- (id)testPLAPICore_DeleteAllEntriesForKey:(id)a3;
- (id)testPLAPICore_DeleteAllEntriesForKeyBTWF:(id)a3;
- (id)testPLAPICore_DeleteAllEntriesForKeyWF:(id)a3;
- (id)testPLAPICore_DeleteEntry:(id)a3;
- (id)testPLAPICore_DeleteEntryForKey:(id)a3;
- (id)testPLAPICore_EntriesForKeyBeforeTICWF:(id)a3;
- (id)testPLAPICore_EntriesForKeyInTimeRange:(id)a3;
- (id)testPLAPICore_EntriesForKeyWithProperties:(id)a3;
- (id)testPLAPICore_LastEntryForKeyWC:(id)a3;
- (id)testPLAPICore_LastEntryForKeyWSEK:(id)a3;
- (id)testPLAPICore_UpdateEntry:(id)a3;
- (id)testPLAPICore_WriteEntries:(id)a3;
- (id)testPLAPICore_WriteEntry:(id)a3;
- (id)test_LogErr:(id)a3 str:(id)a4;
- (id)test_LogPass:(id)a3 str:(id)a4;
- (void)aggregateDataFromSignpost;
- (void)constructAppIdentifierColumns;
- (void)constructAppIdentifierTables;
- (void)constructDMATables;
- (void)constructTrimQueries;
- (void)currentBasebandTime;
- (void)fireSignificantBatteryChangeNotification;
- (void)initOperatorDependancies;
- (void)iterateAgents;
- (void)iterateServices;
- (void)populateIdentifiers:(id)a3;
- (void)printNullTestResultsForEntry:(id)a3 withDescription:(id)a4;
- (void)setAccDS:(id)a3;
- (void)setAggregateTestListener:(id)a3;
- (void)setAggregateTestResponder:(id)a3;
- (void)setAssertionListener:(id)a3;
- (void)setAssertionNewListener:(id)a3;
- (void)setAssertionUpdateListener:(id)a3;
- (void)setCanSleepNotification:(id)a3;
- (void)setCanSleepSemaphore:(id)a3;
- (void)setClientFrameworkTestData:(id)a3;
- (void)setClientFrameworkTestDataBatch:(id)a3;
- (void)setClientFrameworkTestListener:(id)a3;
- (void)setClientFrameworkTestListenerBatch:(id)a3;
- (void)setClientFrameworkTestListenerNonAllowlisted:(id)a3;
- (void)setClientFrameworkTestResponder:(id)a3;
- (void)setClientFrameworkTestResponderBatch:(id)a3;
- (void)setClientFrameworkTestResponderNonAllowlisted:(id)a3;
- (void)setEnergyMonitorDebugInstance:(id)a3;
- (void)setEnergyMonitorDebugResponder:(id)a3;
- (void)setSchemaTestListener:(id)a3;
- (void)setSleepNotification:(id)a3;
- (void)setWakeNotification:(id)a3;
- (void)setXpcListenerPLLog:(id)a3;
- (void)setXpcResponderPLAPITest:(id)a3;
- (void)setXpcResponderPLLog:(id)a3;
- (void)stressActivityScheduler;
- (void)stressAggregateSmall;
- (void)stressAggregateVerySmall;
- (void)stressCache;
- (void)stressCacheSmall;
- (void)stressMidnightCalculation;
- (void)stressMonotonicTimer;
- (void)stressMonotonicTimer2;
- (void)stressMonotonicTimer3;
- (void)stressObjectForKey;
- (void)stressPLEntry;
- (void)stressSetObjectForKey;
- (void)stressTaskingSubmission;
- (void)stressTimer;
- (void)testABM;
- (void)testAllEntryKeyRequests;
- (void)testArchive;
- (void)testArray;
- (void)testBlockingFlushCaches;
- (void)testCompression;
- (void)testDailyTasks;
- (void)testEntryApplicationAgent;
- (void)testEntryDelete;
- (void)testEntryLogRequestedForEntryKey:(id)a3;
- (void)testEntryQueries;
- (void)testEntrySleep;
- (void)testEntryWake;
- (void)testExit;
- (void)testFastInserts;
- (void)testGenerateOTASubmission;
- (void)testGenerateSafeguardSubmission;
- (void)testMonotonicAggregateEntries;
- (void)testMonotonicAggregateEntriesExtendedTime;
- (void)testMonotonicTimerThroughSleep;
- (void)testProportionateAggregateEntries;
- (void)testQuarantineExit;
- (void)testScheduleSafeguardSubmission;
- (void)testTrimBGSQL;
- (void)testTrimCESQL;
- (void)testTrimEPSQL;
- (void)testTrimXCSQL;
- (void)testUTF8;
@end

@implementation PLDebugService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLDebugService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"Test";
  objc_super v2 = [a1 entryEventPointDefinitionTest];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventPointDefinitionTest
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v16[0] = *MEMORY[0x1E4F92CD0];
  v16[1] = v2;
  v17[0] = &unk_1F29F11C0;
  v17[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[0] = v3;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"StringKey1";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v15[0] = v5;
  v14[1] = @"StringKey2";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v15[1] = v7;
  v14[2] = @"DefaultKey1";
  uint64_t v12 = *MEMORY[0x1E4F92D10];
  v13 = &unk_1F29E7888;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v19[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v10;
}

+ (id)entryAggregateDefinitions
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"AggregateTest";
  v3 = [a1 entryAggregateDefinitionAggregateTest];
  v10[0] = v3;
  v9[1] = @"AggregateTestSmall";
  v4 = [a1 entryAggregateDefinitionAggregateTestSmall];
  v10[1] = v4;
  v9[2] = @"AggregateTestVerySmall";
  v5 = [a1 entryAggregateDefinitionAggregateTestVerySmall];
  v10[2] = v5;
  v9[3] = @"AggregateTestSplitAndBucket";
  v6 = [a1 entryAggregateDefinitionAggregateTestSplitAndBucket];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

+ (id)entryAggregateDefinitionAggregateTest
{
  v49[4] = *MEMORY[0x1E4F143B8];
  v48[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v46[0] = *MEMORY[0x1E4F92CD0];
  v46[1] = v2;
  v47[0] = &unk_1F29F11D0;
  v47[1] = MEMORY[0x1E4F1CC28];
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  v49[0] = v28;
  v48[1] = *MEMORY[0x1E4F92CA8];
  v44[0] = @"PrimaryKey1";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_StringFormat");
  v45[0] = v26;
  v44[1] = @"PrimaryKey2";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_StringFormat");
  v45[1] = v24;
  v44[2] = @"SumField";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v45[2] = v22;
  v44[3] = @"SumField2";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v45[3] = v20;
  v44[4] = @"MinField";
  uint64_t v4 = *MEMORY[0x1E4F92C98];
  v41[0] = *MEMORY[0x1E4F92D10];
  uint64_t v3 = v41[0];
  v41[1] = v4;
  uint64_t v5 = MEMORY[0x1E4F1CC38];
  v43[0] = &unk_1F29E78A0;
  v43[1] = MEMORY[0x1E4F1CC38];
  uint64_t v42 = *MEMORY[0x1E4F92BE8];
  uint64_t v6 = v42;
  v43[2] = &unk_1F29E78B8;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v41 count:3];
  v45[4] = v19;
  v44[5] = @"AverageField";
  v39[0] = v3;
  v39[1] = v4;
  v40[0] = &unk_1F29E78A0;
  v40[1] = v5;
  v39[2] = v6;
  v40[2] = &unk_1F29E78D0;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
  v45[5] = v7;
  v44[6] = @"MaxField";
  v37[0] = v3;
  v37[1] = v4;
  v38[0] = &unk_1F29E78A0;
  v38[1] = v5;
  v37[2] = v6;
  v38[2] = &unk_1F29E78E8;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
  v45[6] = v8;
  v44[7] = @"NumericalField";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v45[7] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:8];
  v49[1] = v11;
  v48[2] = *MEMORY[0x1E4F92BE0];
  v35[0] = &unk_1F29F11E0;
  uint64_t v33 = *MEMORY[0x1E4F92BD8];
  uint64_t v12 = v33;
  v34 = &unk_1F29F11F0;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v36[0] = v13;
  v35[1] = &unk_1F29F11F0;
  uint64_t v31 = v12;
  v32 = &unk_1F29F1200;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  v36[1] = v14;
  v35[2] = &unk_1F29F1200;
  uint64_t v29 = v12;
  v30 = &unk_1F29F1210;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  v36[2] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
  v48[3] = *MEMORY[0x1E4F92BF0];
  v49[2] = v16;
  v49[3] = &unk_1F29EFE60;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:4];

  return v17;
}

+ (id)entryAggregateDefinitionAggregateTestSmall
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v25[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v23[0] = *MEMORY[0x1E4F92CD0];
  v23[1] = v2;
  v24[0] = &unk_1F29F1220;
  v24[1] = MEMORY[0x1E4F1CC28];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v26[0] = v16;
  v25[1] = *MEMORY[0x1E4F92CA8];
  v21[0] = @"PrimaryKey1";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v22[0] = v14;
  v21[1] = @"PrimaryKey2";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v22[1] = v4;
  v21[2] = @"SumField";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v22[2] = v6;
  v21[3] = @"SumField2";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v22[3] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];
  v26[1] = v9;
  v25[2] = *MEMORY[0x1E4F92BE0];
  v19 = &unk_1F29F1230;
  uint64_t v17 = *MEMORY[0x1E4F92BD8];
  v18 = &unk_1F29F11F0;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v20 = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v25[3] = *MEMORY[0x1E4F92BF0];
  v26[2] = v11;
  v26[3] = &unk_1F29EFE78;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];

  return v12;
}

+ (id)entryAggregateDefinitionAggregateTestVerySmall
{
  void v22[4] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F29F11C0;
  v20[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v3;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"PrimaryKey1";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v17[1] = @"SumField";
  v18[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v18[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v22[1] = v8;
  v21[2] = *MEMORY[0x1E4F92BE0];
  v15 = &unk_1F29F1230;
  uint64_t v13 = *MEMORY[0x1E4F92BD8];
  v14 = &unk_1F29F11F0;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v16 = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v21[3] = *MEMORY[0x1E4F92BF0];
  v22[2] = v10;
  v22[3] = &unk_1F29EFE90;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];

  return v11;
}

+ (id)entryAggregateDefinitionAggregateTestSplitAndBucket
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v30[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v28[0] = *MEMORY[0x1E4F92CD0];
  v28[1] = v2;
  v29[0] = &unk_1F29F11C0;
  v29[1] = MEMORY[0x1E4F1CC28];
  v28[2] = *MEMORY[0x1E4F92BF8];
  v29[2] = MEMORY[0x1E4F1CC38];
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
  v31[0] = v17;
  v30[1] = *MEMORY[0x1E4F92CA8];
  v26[0] = @"PrimaryKey1";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v27[0] = v15;
  v26[1] = @"SumField";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v27[1] = v4;
  v26[2] = @"SumField2";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v27[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  v31[1] = v7;
  v30[2] = *MEMORY[0x1E4F92BE0];
  v24[0] = &unk_1F29F1230;
  uint64_t v22 = *MEMORY[0x1E4F92BD8];
  uint64_t v8 = v22;
  v23 = &unk_1F29F11F0;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v25[0] = v9;
  v24[1] = &unk_1F29F11F0;
  uint64_t v20 = v8;
  v21 = &unk_1F29F11F0;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v25[1] = v10;
  void v24[2] = &unk_1F29F1200;
  uint64_t v18 = v8;
  v19 = &unk_1F29F11F0;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v25[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  v30[3] = *MEMORY[0x1E4F92BF0];
  v31[2] = v12;
  v31[3] = &unk_1F29EFEA8;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];

  return v13;
}

+ (id)entryEventNoneDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"PLAPITest";
  uint64_t v3 = [a1 entryEventNoneDefinitionPLAPITest];
  v7[1] = @"ArrayTest";
  v8[0] = v3;
  uint64_t v4 = [a1 entryEventNoneDefinitionArrayTest];
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventNoneDefinitionPLAPITest
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  uint64_t v13 = &unk_1F29F1240;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"entry1";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"entry2";
  v11[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventNoneDefinitionArrayTest
{
  void v25[3] = *MEMORY[0x1E4F143B8];
  v24[0] = *MEMORY[0x1E4F92C50];
  uint64_t v22 = *MEMORY[0x1E4F92CD0];
  v23 = &unk_1F29F11C0;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v25[0] = v14;
  v24[1] = *MEMORY[0x1E4F92CA8];
  v20[0] = @"RandomString";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
  v21[0] = v3;
  v20[1] = @"RandomNumber";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
  v21[1] = v5;
  void v20[2] = @"StaticArrayType";
  uint64_t v7 = *MEMORY[0x1E4F92D00];
  v17[0] = *MEMORY[0x1E4F92D10];
  uint64_t v6 = v17[0];
  v17[1] = v7;
  v19[0] = &unk_1F29E7900;
  v19[1] = &unk_1F29E7918;
  uint64_t v18 = *MEMORY[0x1E4F92D08];
  uint64_t v8 = v18;
  void v19[2] = &unk_1F29E7930;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v17 count:3];
  v21[2] = v9;
  v20[3] = @"DynamicArrayType";
  v15[0] = v6;
  v15[1] = v8;
  v16[0] = &unk_1F29E7900;
  v16[1] = &unk_1F29E7930;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v21[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  void v24[2] = *MEMORY[0x1E4F92C18];
  v25[1] = v11;
  v25[2] = &unk_1F29EFEC0;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

  return v12;
}

+ (id)entryEventNoneDefinitionSleepNotificationTest
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v14 = *MEMORY[0x1E4F92CD0];
  v15 = &unk_1F29F11C0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"NotificationType";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v13[0] = v4;
  v12[1] = @"Listener";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v13[1] = v6;
  v12[2] = @"FiredTimestamp";
  uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_DateFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventNoneDefinitionFastInsertTest
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F29F11C0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  uint64_t v8 = @"iteration";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v9 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

- (PLDebugService)init
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F92000uLL;
  if (([MEMORY[0x1E4F929C0] BOOLForKey:@"PLDebugService_Enabled" ifNotSet:0] & 1) != 0
    || [MEMORY[0x1E4F929C0] debugEnabled])
  {
    v99.receiver = self;
    v99.super_class = (Class)PLDebugService;
    uint64_t v4 = [(PLOperator *)&v99 init];
    if (v4)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testMonotonicAggregateEntries", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v6, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testMonotonicAggregateEntriesExtendedTime", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v7 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v7, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testProportionateAggregateEntries", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v8 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v8, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testEntryQueries", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v9 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v9, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testEntryDelete", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v10 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v10, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testEntryApplicationAgent", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v11 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v11, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testEntrySleep", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v12 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v12, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testEntryWake", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v13 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v13, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testAllEntryKeyRequests", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v14 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v14, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testFastInserts", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v15 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v15, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.ABM", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v16 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v16, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.TestArrays", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v17 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v17, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.generateOTASubmission", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v18 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v18, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.generateSafeguardSubmission", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v19 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v19, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.scheduleSafeguardSubmission", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v20 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v20, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stressTaskingSubmission", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v21 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v21, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.dailyTasks", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v22 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v22, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.archive", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v23 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v23, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.trimEPSQL", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v24 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v24, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.trimCESQL", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v25 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v25, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.trimXCSQL", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v26 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v26, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.logSizeOfStagingEntryCache", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v27 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v27, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.dumpStagingEntryCache", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v28 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v28, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stresstimer", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v29 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v29, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stressplentry", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v30 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v30, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stresscache", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v31 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v31, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stresscachesmall", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v32 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v32, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stressObjectForKey", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v33 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v33, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stressSetObjectForKey", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v34 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v34, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stressActivityScheduler", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v35 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v35, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stressMidnightCalculation", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v36 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v36, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stressMonotonicTimer", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v37 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v37, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stressMonotonicTimer2", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v38 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v38, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stressMonotonicTimer3", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v39 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v39, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testMonotonicTimerThroughSleep", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v40 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v40, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.currentBasebandTime", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v41 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v41, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testExit", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v42 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v42, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testQuarantineExit", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v43 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v43, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stressAggregateSmall", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v44 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v44, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.stressAggregateVerySmall", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v45 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v45, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testUTF8", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v46 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v46, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testCompression", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v47 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v47, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.testBlockingFlushCaches", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v48 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v48, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.fireSBC", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v49 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v49, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.aggregateDataFromSignpost", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v50 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v50, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.appIdentifierTables", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v51 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v51, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.appIdentifierColumns", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v52 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v52, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.DMATables", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v53 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v53, v4, (CFNotificationCallback)TestEntryQueriesRequested, @"com.apple.powerlogd.trimQueries", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v54 = [MEMORY[0x1E4F929A8] registeredOperators];
      v55 = [NSString stringWithFormat:@"allAgentClasses=%@", v54];
      v56 = (void *)MEMORY[0x1E4F929B8];
      v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
      v58 = [v57 lastPathComponent];
      v59 = [NSString stringWithUTF8String:"-[PLDebugService init]"];
      [v56 logMessage:v55 fromFile:v58 fromFunction:v59 fromLineNumber:386];

      v60 = PLLogCommon();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v103 = v55;
        _os_log_debug_impl(&dword_1D2690000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id obj = v54;
      unint64_t v61 = 0x1E4F29000uLL;
      uint64_t v85 = [obj countByEnumeratingWithState:&v95 objects:v101 count:16];
      if (v85)
      {
        uint64_t v84 = *(void *)v96;
        v62 = @"com.apple.powerlogd.testEntryLog.%@";
        do
        {
          uint64_t v63 = 0;
          do
          {
            if (*(void *)v96 != v84) {
              objc_enumerationMutation(obj);
            }
            uint64_t v86 = v63;
            v64 = *(void **)(*((void *)&v95 + 1) + 8 * v63);
            long long v91 = 0u;
            long long v92 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            id v89 = [v64 entryKeys];
            uint64_t v65 = [v89 countByEnumeratingWithState:&v91 objects:v100 count:16];
            if (v65)
            {
              uint64_t v66 = v65;
              uint64_t v67 = *(void *)v92;
              uint64_t v87 = *(void *)v92;
              do
              {
                uint64_t v68 = 0;
                uint64_t v88 = v66;
                do
                {
                  if (*(void *)v92 != v67) {
                    objc_enumerationMutation(v89);
                  }
                  objc_msgSend(*(id *)(v61 + 24), "stringWithFormat:", v62, *(void *)(*((void *)&v91 + 1) + 8 * v68));
                  v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  if ([*(id *)(v3 + 2496) debugEnabled])
                  {
                    uint64_t v70 = objc_opt_class();
                    block[0] = MEMORY[0x1E4F143A8];
                    block[1] = 3221225472;
                    block[2] = __22__PLDebugService_init__block_invoke;
                    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                    block[4] = v70;
                    if (qword_1EBD5A818 != -1) {
                      dispatch_once(&qword_1EBD5A818, block);
                    }
                    if (_MergedGlobals_1_58)
                    {
                      v71 = v62;
                      v72 = v4;
                      unint64_t v73 = v3;
                      v74 = [*(id *)(v61 + 24) stringWithFormat:@"signing up for notification %@", v69];
                      v75 = (void *)MEMORY[0x1E4F929B8];
                      v76 = [*(id *)(v61 + 24) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
                      v77 = [v76 lastPathComponent];
                      v78 = [*(id *)(v61 + 24) stringWithUTF8String:"-[PLDebugService init]"];
                      [v75 logMessage:v74 fromFile:v77 fromFunction:v78 fromLineNumber:390];

                      v79 = PLLogCommon();
                      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v103 = v74;
                        _os_log_debug_impl(&dword_1D2690000, v79, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }

                      unint64_t v3 = v73;
                      uint64_t v4 = v72;
                      unint64_t v61 = 0x1E4F29000;
                      v62 = v71;
                      uint64_t v67 = v87;
                      uint64_t v66 = v88;
                    }
                  }
                  v80 = CFNotificationCenterGetDarwinNotifyCenter();
                  CFNotificationCenterAddObserver(v80, v4, (CFNotificationCallback)TestEntryLogRequested, v69, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

                  ++v68;
                }
                while (v66 != v68);
                uint64_t v66 = [v89 countByEnumeratingWithState:&v91 objects:v100 count:16];
              }
              while (v66);
            }

            uint64_t v63 = v86 + 1;
          }
          while (v86 + 1 != v85);
          uint64_t v85 = [obj countByEnumeratingWithState:&v95 objects:v101 count:16];
        }
        while (v85);
      }
    }
    self = v4;
    v81 = self;
  }
  else
  {
    v81 = 0;
  }

  return v81;
}

uint64_t __22__PLDebugService_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_58 = result;
  return result;
}

- (void)printNullTestResultsForEntry:(id)a3 withDescription:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F28E78];
  id v6 = a3;
  uint64_t v7 = [v5 stringWithFormat:@"%@:\n***\n", a4];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"RandomString"];
  [v7 appendFormat:@"RandomString=%@\n", v8];

  v9 = [v6 objectForKeyedSubscript:@"RandomString"];
  [v7 appendFormat:@"RandomString.class=%@\n", objc_opt_class()];

  uint64_t v10 = [v6 keys];
  [v7 appendFormat:@"allKeys=%@\n", v10];

  v11 = [v6 allValues];
  [v7 appendFormat:@"allValues=%@\n", v11];

  uint64_t v12 = [v6 dictionary];
  [v7 appendFormat:@"dictionary=%@\n", v12];

  [v7 appendFormat:@"entry=%@\n", v6];
  uint64_t v13 = [v6 objectForKeyedSubscript:@"RandomString"];

  if (v13) {
    [v7 appendString:@"\n!!!!!!!!!!!!!!!!!This should not log!!!!!!!!!!!!!!!!!!!!!!!!!\n"];
  }
  [v7 appendString:@" \n***\n\n\n"];
  uint64_t v14 = [NSString stringWithFormat:@"%@", v7];
  v15 = (void *)MEMORY[0x1E4F929B8];
  v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v17 = [v16 lastPathComponent];
  uint64_t v18 = [NSString stringWithUTF8String:"-[PLDebugService printNullTestResultsForEntry:withDescription:]"];
  [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:413];

  v19 = PLLogCommon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v14;
    _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)initOperatorDependancies
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  if ([(PLOperator *)self isDebugEnabledForKey:@"NULLTest"])
  {
    uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"ArrayTest"];
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
    [v4 setObject:0 forKeyedSubscript:@"RandomString"];
    [(PLDebugService *)self printNullTestResultsForEntry:v4 withDescription:@"nilSetEntry"];
    [(PLOperator *)self logEntry:v4];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
    id v6 = [MEMORY[0x1E4F1CA98] null];
    [v5 setObject:v6 forKeyedSubscript:@"RandomString"];

    [(PLDebugService *)self printNullTestResultsForEntry:v5 withDescription:@"nsnullSetEntry"];
    [(PLOperator *)self logEntry:v5];
    uint64_t v68 = (void *)v3;
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
    [(PLDebugService *)self printNullTestResultsForEntry:v7 withDescription:@"notSetEntry"];
    [(PLOperator *)self logEntry:v7];
    uint64_t v8 = NSString;
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
    v11 = [MEMORY[0x1E4F1CA98] null];
    [v8 stringWithFormat:@"nil=%@ nil.class=%@ NSNull=%@ NSNull.class=%@", 0, v9, v10, objc_opt_class()];
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v13 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
    v15 = [v14 lastPathComponent];
    v16 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]"];
    [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:435];

    uint64_t v17 = PLLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v85 = v12;
      _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    uint64_t v18 = [NSString stringWithFormat:@"Null test done"];
    v19 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
    v21 = [v20 lastPathComponent];
    uint64_t v22 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]"];
    [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:436];

    v23 = PLLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v85 = v18;
      _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F92AA0]) initWithOperator:self withRegistration:&unk_1F29EB368 withBlock:&__block_literal_global_46];
  [(PLDebugService *)self setXpcListenerPLLog:v24];
  id v25 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_379;
  v83[3] = &unk_1E692A6F8;
  v83[4] = self;
  v26 = (void *)[v25 initWithOperator:self withRegistration:&unk_1F29EB390 withBlock:v83];
  [(PLDebugService *)self setAggregateTestListener:v26];
  id v27 = objc_alloc(MEMORY[0x1E4F92AA8]);
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_2;
  v82[3] = &unk_1E692A118;
  v82[4] = self;
  v69 = (void *)[v27 initWithOperator:self withRegistration:&unk_1F29EB3B8 withBlock:v82];
  -[PLDebugService setAggregateTestResponder:](self, "setAggregateTestResponder:");
  id v28 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_416;
  v81[3] = &unk_1E692A6F8;
  v81[4] = self;
  uint64_t v67 = (void *)[v28 initWithOperator:self withRegistration:&unk_1F29EB3E0 withBlock:v81];
  -[PLDebugService setSchemaTestListener:](self, "setSchemaTestListener:");
  if ([(PLOperator *)self isDebugEnabledForKey:@"PowerAssertion"])
  {
    uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F929E8]) initWithOperator:self forEntryKey:@"PLPowerAssertionAgent_EventInterval_Assertion" forUpdateOrInsert:2 withBlock:&__block_literal_global_439];
    [(PLDebugService *)self setAssertionListener:v29];
    v30 = (void *)[objc_alloc(MEMORY[0x1E4F929E8]) initWithOperator:self forEntryKey:@"PLPowerAssertionAgent_EventInterval_Assertion" forUpdateOrInsert:1 withBlock:&__block_literal_global_445];
    [(PLDebugService *)self setAssertionNewListener:v30];
    uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F929E8]) initWithOperator:self forEntryKey:@"PLPowerAssertionAgent_EventInterval_Assertion" forUpdateOrInsert:0 withBlock:&__block_literal_global_451];
    [(PLDebugService *)self setAssertionUpdateListener:v31];
  }
  if ([(PLOperator *)self isDebugEnabledForKey:@"SleepNotification"])
  {
    uint64_t v66 = v26;
    v32 = v24;
    uint64_t v33 = [NSString stringWithFormat:@"Setup SleepNotification test!"];
    v34 = (void *)MEMORY[0x1E4F929B8];
    v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
    v36 = [v35 lastPathComponent];
    v37 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]"];
    [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:532];

    v38 = PLLogCommon();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v85 = v33;
      _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_461;
    v80[3] = &unk_1E692A0F0;
    v80[4] = self;
    v39 = [MEMORY[0x1E4F929E8] sleepEntryNotificationWithOperator:self withBlock:v80];
    [(PLDebugService *)self setSleepNotification:v39];
    v40 = [MEMORY[0x1E4F92A48] sharedSemaphoreForKey:*MEMORY[0x1E4F92BD0]];
    [(PLDebugService *)self setCanSleepSemaphore:v40];

    v41 = [(PLDebugService *)self canSleepSemaphore];
    [v41 signalInterestByObject:self];

    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_478;
    v79[3] = &unk_1E692A0F0;
    v79[4] = self;
    uint64_t v42 = [MEMORY[0x1E4F929E8] canSleepEntryNotificationWithOperator:self withBlock:v79];
    [(PLDebugService *)self setCanSleepNotification:v42];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_485;
    v78[3] = &unk_1E692A0F0;
    v78[4] = self;
    v43 = [MEMORY[0x1E4F929E8] wakeEntryNotificationWithOperator:self withBlock:v78];
    [(PLDebugService *)self setWakeNotification:v43];

    v24 = v32;
    v26 = v66;
  }
  id v44 = objc_alloc(MEMORY[0x1E4F92AA8]);
  v45 = dispatch_get_global_queue(-32768, 0);
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_499;
  v77[3] = &unk_1E692A118;
  v77[4] = self;
  v46 = (void *)[v44 initWithWorkQueue:v45 withRegistration:&unk_1F29EB408 withBlock:v77];

  [(PLDebugService *)self setXpcResponderPLAPITest:v46];
  id v47 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_619;
  v76[3] = &unk_1E692A6F8;
  v76[4] = self;
  v48 = (void *)[v47 initWithOperator:self withRegistration:&unk_1F29EB430 withBlock:v76];
  [(PLDebugService *)self setClientFrameworkTestListener:v48];

  id v49 = objc_alloc(MEMORY[0x1E4F92AA8]);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_2_624;
  v75[3] = &unk_1E692A118;
  v75[4] = self;
  v50 = (void *)[v49 initWithOperator:self withRegistration:&unk_1F29EB458 withBlock:v75];
  [(PLDebugService *)self setClientFrameworkTestResponder:v50];

  id v51 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_3;
  v74[3] = &unk_1E692A6F8;
  v74[4] = self;
  v52 = (void *)[v51 initWithOperator:self withRegistration:&unk_1F29EB480 withBlock:v74];
  [(PLDebugService *)self setClientFrameworkTestListenerNonAllowlisted:v52];

  id v53 = objc_alloc(MEMORY[0x1E4F92AA8]);
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_4;
  v73[3] = &unk_1E692A118;
  v73[4] = self;
  v54 = (void *)[v53 initWithOperator:self withRegistration:&unk_1F29EB4A8 withBlock:v73];
  [(PLDebugService *)self setClientFrameworkTestResponderNonAllowlisted:v54];

  v55 = [MEMORY[0x1E4F1CA48] array];
  [(PLDebugService *)self setClientFrameworkTestDataBatch:v55];

  id v56 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_5;
  v72[3] = &unk_1E692A6F8;
  v72[4] = self;
  v57 = (void *)[v56 initWithOperator:self withRegistration:&unk_1F29EB4D0 withBlock:v72];
  [(PLDebugService *)self setClientFrameworkTestListenerBatch:v57];

  id v58 = objc_alloc(MEMORY[0x1E4F92AA8]);
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_6;
  v71[3] = &unk_1E692A118;
  v71[4] = self;
  v59 = (void *)[v58 initWithOperator:self withRegistration:&unk_1F29EB4F8 withBlock:v71];
  [(PLDebugService *)self setClientFrameworkTestResponderBatch:v59];

  if ([(PLOperator *)self isDebugEnabledForKey:@"EnergyMonitorDebug"])
  {
    v60 = PLLogCommon();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v85 = @"/tmp/energy_monitor_debug_config.plist";
      _os_log_impl(&dword_1D2690000, v60, OS_LOG_TYPE_INFO, "EnergyMonitor Debug mode enabled, reading from plist at %@", buf, 0xCu);
    }

    unint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/tmp/energy_monitor_debug_config.plist"];
    v62 = PLLogCommon();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v85 = v61;
      _os_log_impl(&dword_1D2690000, v62, OS_LOG_TYPE_INFO, "mockData=%@", buf, 0xCu);
    }

    if (v61)
    {
      uint64_t v63 = [objc_alloc(MEMORY[0x1E4F92880]) initWithDebugMode:1 andMockData:v61 andCompletionBlock:&__block_literal_global_663];
      [(PLDebugService *)self setEnergyMonitorDebugInstance:v63];
    }
    else
    {
      uint64_t v63 = PLLogCommon();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v85 = 0;
        __int16 v86 = 2112;
        uint64_t v87 = @"/tmp/energy_monitor_debug_config.plist";
        _os_log_error_impl(&dword_1D2690000, v63, OS_LOG_TYPE_ERROR, "error: mockData=%@ at path=%@", buf, 0x16u);
      }
    }
  }
  id v64 = objc_alloc(MEMORY[0x1E4F92AA8]);
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_668;
  v70[3] = &unk_1E692A118;
  v70[4] = self;
  uint64_t v65 = (void *)[v64 initWithOperator:self withRegistration:&unk_1F29EB520 withBlock:v70];
  [(PLDebugService *)self setEnergyMonitorDebugResponder:v65];
}

void __42__PLDebugService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [NSString stringWithFormat:@"got callback! %@", a5];
  id v6 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v8 = [v7 lastPathComponent];
  uint64_t v9 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]_block_invoke"];
  [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:440];

  uint64_t v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v5;
    _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_379(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = *MEMORY[0x1E4F92D20];
  id v7 = a5;
  id v26 = +[PLOperator entryKeyForType:v6 andName:@"AggregateTest"];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v26];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"PrimaryKey1"];
  [v8 setObject:v9 forKeyedSubscript:@"PrimaryKey1"];

  uint64_t v10 = [v7 objectForKeyedSubscript:@"PrimaryKey2"];
  [v8 setObject:v10 forKeyedSubscript:@"PrimaryKey2"];

  v11 = NSNumber;
  uint64_t v12 = [v7 objectForKeyedSubscript:@"SumField"];
  [v12 doubleValue];
  uint64_t v13 = objc_msgSend(v11, "numberWithDouble:");
  [v8 setObject:v13 forKeyedSubscript:@"SumField"];

  uint64_t v14 = NSNumber;
  v15 = [v7 objectForKeyedSubscript:@"SumField2"];
  [v15 doubleValue];
  v16 = objc_msgSend(v14, "numberWithDouble:");
  [v8 setObject:v16 forKeyedSubscript:@"SumField2"];

  uint64_t v17 = NSNumber;
  uint64_t v18 = [v7 objectForKeyedSubscript:@"AverageField"];
  [v18 doubleValue];
  v19 = objc_msgSend(v17, "numberWithDouble:");
  [v8 setObject:v19 forKeyedSubscript:@"AverageField"];

  uint64_t v20 = NSNumber;
  v21 = [v7 objectForKeyedSubscript:@"MaxField"];
  [v21 doubleValue];
  uint64_t v22 = objc_msgSend(v20, "numberWithDouble:");
  [v8 setObject:v22 forKeyedSubscript:@"MaxField"];

  v23 = NSNumber;
  v24 = [v7 objectForKeyedSubscript:@"MinField"];

  [v24 doubleValue];
  id v25 = objc_msgSend(v23, "numberWithDouble:");
  [v8 setObject:v25 forKeyedSubscript:@"MinField"];

  [*(id *)(a1 + 32) logEntry:v8];
}

id __42__PLDebugService_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AggregateTest"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"bucketLength"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [v6 objectForKeyedSubscript:@"location"];
  [v11 doubleValue];
  double v13 = v12;
  id v49 = v6;
  uint64_t v14 = [v6 objectForKeyedSubscript:@"length"];
  [v14 doubleValue];
  double v16 = v15;

  uint64_t v17 = [*(id *)(a1 + 32) storage];
  v48 = (void *)v7;
  uint64_t v18 = objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v7, v10, v13, v16);

  v19 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v55 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = [*(id *)(*((void *)&v54 + 1) + 8 * i) serializedForJSON];
        [v19 addObject:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v22);
  }

  id v26 = [MEMORY[0x1E4F929D0] summarizeAggregateEntries:v20];
  id v27 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v28 = v26;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v51 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = [*(id *)(*((void *)&v50 + 1) + 8 * j) serializedForJSON];
        [v27 addObject:v33];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v30);
  }

  v34 = [NSString stringWithFormat:@"summarizedEntries=%@", v28];
  v35 = (void *)MEMORY[0x1E4F929B8];
  v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  v37 = [v36 lastPathComponent];
  v38 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]_block_invoke_2"];
  [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:479];

  v39 = PLLogCommon();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v61 = v34;
    _os_log_debug_impl(&dword_1D2690000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v40 = [NSString stringWithFormat:@"resultEntries=%@", v20];
  v41 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  v43 = [v42 lastPathComponent];
  id v44 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]_block_invoke"];
  [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:480];

  v45 = PLLogCommon();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v61 = v40;
    _os_log_debug_impl(&dword_1D2690000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v58[0] = @"results";
  v58[1] = @"summarizedResults";
  v59[0] = v19;
  v59[1] = v27;
  v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];

  return v46;
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_416(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v47 = v6;
  id obj = [v6 allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v55;
    uint64_t v40 = *MEMORY[0x1E4F92D40];
    uint64_t v41 = *(void *)v55;
    do
    {
      uint64_t v11 = 0;
      uint64_t v42 = v9;
      do
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v54 + 1) + 8 * v11);
        if (([v12 isEqualToString:@"count"] & 1) == 0)
        {
          uint64_t v46 = v11;
          double v13 = +[PLOperator entryKeyForType:v40 andName:v12];
          v45 = [MEMORY[0x1E4F929D8] definitionForEntryKey:v13];
          uint64_t v14 = [NSString stringWithFormat:@"Logging entryKey %@ with definition %@", v13, v45];
          double v15 = (void *)MEMORY[0x1E4F929B8];
          double v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
          uint64_t v17 = [v16 lastPathComponent];
          uint64_t v18 = (void *)v14;
          v19 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]_block_invoke"];
          [v15 logMessage:v18 fromFile:v17 fromFunction:v19 fromLineNumber:492];

          id v20 = PLLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v18;
            _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          uint64_t v21 = objc_opt_new();
          [v7 setObject:v21 forKeyedSubscript:v13];

          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v44 = v12;
          uint64_t v22 = [v47 objectForKeyedSubscript:v12];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v51;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v51 != v25) {
                  objc_enumerationMutation(v22);
                }
                id v27 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                id v28 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13];
                v48[0] = MEMORY[0x1E4F143A8];
                v48[1] = 3221225472;
                v48[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_424;
                v48[3] = &unk_1E692EF68;
                id v49 = v28;
                id v29 = v28;
                [v27 enumerateKeysAndObjectsUsingBlock:v48];
                uint64_t v30 = [v7 objectForKeyedSubscript:v13];
                [v30 addObject:v29];

                [*(id *)(a1 + 32) logEntry:v29];
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v50 objects:v58 count:16];
            }
            while (v24);
          }

          uint64_t v31 = NSString;
          v32 = [v47 objectForKeyedSubscript:v44];
          uint64_t v33 = [v7 objectForKeyedSubscript:v13];
          v34 = [v31 stringWithFormat:@"payload[%@]=%@ entries[%@]=%@", v44, v32, v13, v33];

          v35 = (void *)MEMORY[0x1E4F929B8];
          v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
          v37 = [v36 lastPathComponent];
          v38 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]_block_invoke_2"];
          [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:506];

          v39 = PLLogCommon();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v34;
            _os_log_debug_impl(&dword_1D2690000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          uint64_t v10 = v41;
          uint64_t v9 = v42;
          uint64_t v11 = v46;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v9);
  }
}

uint64_t __42__PLDebugService_initOperatorDependancies__block_invoke_424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_436(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [NSString stringWithFormat:@"AssertionListener callback: name=%@ userInfo=%@", a3, a2];
  uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]_block_invoke"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:516];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_443(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [NSString stringWithFormat:@"AssertionNewListener callback: name=%@ userInfo=%@", a3, a2];
  uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]_block_invoke"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:521];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_449(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [NSString stringWithFormat:@"AssertionUpdateListener callback: name=%@ userInfo=%@", a3, a2];
  uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]_block_invoke"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:526];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_461(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  id v4 = a2;
  uint64_t v5 = [v3 stringWithFormat:@"sleepListener block: %@", v4];
  id v6 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v8 = [v7 lastPathComponent];
  uint64_t v9 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]_block_invoke"];
  [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:534];

  uint64_t v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v5;
    _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v11 = [v4 objectForKeyedSubscript:@"entry"];

  double v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"SleepNotificationTest"];
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12];
  uint64_t v14 = [v11 objectForKeyedSubscript:@"Event"];
  [v13 setObject:v14 forKeyedSubscript:@"NotificationType"];

  [v13 setObject:@"sleepListener" forKeyedSubscript:@"Listener"];
  double v15 = [v11 entryDate];
  [v13 setObject:v15 forKeyedSubscript:@"FiredTimestamp"];

  [*(id *)(a1 + 32) logEntry:v13];
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_478(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  id v4 = a2;
  uint64_t v5 = [v3 stringWithFormat:@"canSleepListener block: %@", v4];
  id v6 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v8 = [v7 lastPathComponent];
  uint64_t v9 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]_block_invoke"];
  [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:549];

  uint64_t v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v5;
    _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v11 = [v4 objectForKeyedSubscript:@"entry"];

  double v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"SleepNotificationTest"];
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12];
  uint64_t v14 = [v11 objectForKeyedSubscript:@"Event"];
  [v13 setObject:v14 forKeyedSubscript:@"NotificationType"];

  [v13 setObject:@"canSleepListener" forKeyedSubscript:@"Listener"];
  double v15 = [v11 entryDate];
  [v13 setObject:v15 forKeyedSubscript:@"FiredTimestamp"];

  double v16 = [*(id *)(a1 + 32) canSleepSemaphore];
  [v16 signalDoneByObject:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) logEntry:v13];
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_485(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  id v4 = a2;
  uint64_t v5 = [v3 stringWithFormat:@"wakeListener block: %@", v4];
  id v6 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v8 = [v7 lastPathComponent];
  uint64_t v9 = [NSString stringWithUTF8String:"-[PLDebugService initOperatorDependancies]_block_invoke"];
  [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:562];

  uint64_t v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v5;
    _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v11 = [v4 objectForKeyedSubscript:@"entry"];

  double v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"SleepNotificationTest"];
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12];
  uint64_t v14 = [v11 objectForKeyedSubscript:@"Event"];
  [v13 setObject:v14 forKeyedSubscript:@"NotificationType"];

  [v13 setObject:@"wakeListener" forKeyedSubscript:@"Listener"];
  double v15 = [v11 entryDate];
  [v13 setObject:v15 forKeyedSubscript:@"FiredTimestamp"];

  [*(id *)(a1 + 32) logEntry:v13];
}

id __42__PLDebugService_initOperatorDependancies__block_invoke_499(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"testBucket"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"testName"];
  uint64_t v9 = (void *)[v6 mutableCopy];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [v9 setObject:v11 forKeyedSubscript:@"pass"];

  double v12 = (void *)[v10 mutableCopy];
  [v9 setObject:v12 forKeyedSubscript:@"error"];

  if ([v7 isEqualToString:@"PLCore"])
  {
    if ([v8 isEqualToString:@"WriteEntry"]
      || [v8 isEqualToString:@"WriteEntries"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_WriteEntry:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"UpdateEntry"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_UpdateEntry:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"DeleteEntry"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_DeleteEntry:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"DeleteEntryForKey"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_DeleteEntryForKey:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"DeleteAllEntriesForKey"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_DeleteAllEntriesForKey:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"DeleteAllEntriesForKeyWF"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_DeleteAllEntriesForKeyWF:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"DeleteAllEntriesForKeyBTWF"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_DeleteAllEntriesForKeyBTWF:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"EntriesForKeyWithProperties"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_EntriesForKeyWithProperties:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"EntriesForKeyInTimeRange"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_EntriesForKeyInTimeRange:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"EntriesForKeyBeforeTICWF"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_EntriesForKeyBeforeTICWF:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"LastEntryForKeyWSEK"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_LastEntryForKeyWSEK:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"LastEntryForKeyWC"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_LastEntryForKeyWC:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
  }
  else if ([v7 isEqualToString:@"PLAccountingEngineInput"])
  {
    uint64_t v14 = *(void **)(a1 + 32);
    double v15 = objc_opt_new();
    [v14 setAccDS:v15];

    double v16 = [MEMORY[0x1E4F92900] debugInstance];
    [v16 reset];

    if ([v8 isEqualToString:@"CreatePowerEventForward"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreatePowerEventForward:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"CreatePowerEventBackward"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreatePowerEventBackward:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"CreatePowerEventInterval"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreatePowerEventInterval:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"AddPowerMeasurementEventInterval"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_AddPowerMeasurementEventInterval:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"CreateDistributionEventForwardAdd"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateDistributionEventForwardAdd:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"CreateDistributionEventForwardRem"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateDistributionEventForwardRem:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"CreateDistributionEventForwardChild"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateDistributionEventForwardChild:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"CreateDistributionEventInterval"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateDistributionEventInterval:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"CreateDistributionEventPoint"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateDistributionEventPoint:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"CreateQualificationEventForwardAdd"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateQualificationEventForwardAdd:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"CreateQualificationEventForwardRem"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateQualificationEventForwardRem:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"CreateQualificationEventForwardChild"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateQualificationEventForwardChild:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"CreateQualificationEventBackward"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateQualificationEventBackward:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"CreateQualificationEventInterval"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateQualificationEventInterval:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if ([v8 isEqualToString:@"CreateQualificationEventPoint"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateQualificationEventPoint:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
  }
  else if ([v7 isEqualToString:@"PLAccountingEngineCore"])
  {
    uint64_t v17 = *(void **)(a1 + 32);
    uint64_t v18 = objc_opt_new();
    [v17 setAccDS:v18];

    uint64_t v19 = [MEMORY[0x1E4F92900] debugInstance];
    [v19 reset];

    if ([v8 isEqualToString:@"ExistingTest"])
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_ExistingTest:", v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
  }
  id v13 = v9;
LABEL_62:
  id v20 = v13;

  return v20;
}

uint64_t __42__PLDebugService_initOperatorDependancies__block_invoke_619(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) setClientFrameworkTestData:a5];
}

uint64_t __42__PLDebugService_initOperatorDependancies__block_invoke_2_624(uint64_t a1)
{
  return [*(id *)(a1 + 32) clientFrameworkTestData];
}

uint64_t __42__PLDebugService_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) setClientFrameworkTestData:a5];
}

uint64_t __42__PLDebugService_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) clientFrameworkTestData];
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v10 = a5;
  id v6 = [v10 objectForKeyedSubscript:@"ClearData"];
  int v7 = [v6 BOOLValue];

  uint64_t v8 = [*(id *)(a1 + 32) clientFrameworkTestDataBatch];
  uint64_t v9 = v8;
  if (v7) {
    [v8 removeAllObjects];
  }
  else {
    [v8 addObject:v10];
  }
}

id __42__PLDebugService_initOperatorDependancies__block_invoke_6(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"Data";
  v1 = [*(id *)(a1 + 32) clientFrameworkTestDataBatch];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_660(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1D2690000, v3, OS_LOG_TYPE_INFO, "Running completion block in debug mode with energyReport=%@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __42__PLDebugService_initOperatorDependancies__block_invoke_668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) handleEnergyMonitorDebugQuery:a5];
}

- (id)test_LogErr:(id)a3 str:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 objectForKeyedSubscript:@"error"];
  uint64_t v8 = [NSString stringWithFormat:@"--> ERROR: %@", v6];

  [v7 addObject:v8];
  uint64_t v9 = [v5 objectForKeyedSubscript:@"error"];
  id v10 = [v9 lastObject];
  NSLog(&stru_1F294D328.isa, v10);

  return v5;
}

- (id)test_LogPass:(id)a3 str:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 objectForKeyedSubscript:@"pass"];
  uint64_t v8 = [NSString stringWithFormat:@"--> PASS: %@", v6];

  [v7 addObject:v8];
  uint64_t v9 = [v5 objectForKeyedSubscript:@"pass"];
  id v10 = [v9 lastObject];
  NSLog(&stru_1F294D328.isa, v10);

  return v5;
}

- (BOOL)rawRead:(id)a3
{
  return 1;
}

- (BOOL)rawWrite:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v58 = dispatch_semaphore_create(0);
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PLAPITest"];
  id v6 = [v4 objectForKeyedSubscript:@"objT"];
  int v7 = [v6 objectForKeyedSubscript:@"iterations"];
  uint64_t v8 = [v7 longValue];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"objT"];
  id v10 = [v9 objectForKeyedSubscript:@"flush"];
  int v55 = [v10 BOOLValue];

  uint64_t v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  int v13 = [v12 intValue];
  int v14 = v13 != -1;

  double v15 = [MEMORY[0x1E4F92AD0] sharedCore];
  double v16 = [v15 storage];
  uint64_t v17 = [v16 countOfEntriesForKey:v5];

  uint64_t v18 = [v4 objectForKeyedSubscript:@"testName"];
  uint64_t v56 = v17;
  if (([v18 isEqualToString:@"WriteEntry"] & 1) == 0)
  {
    uint64_t v19 = [v4 objectForKeyedSubscript:@"testName"];
    int v20 = [v19 isEqualToString:@"WriteEntries"];

    if (v13 == -1) {
      int v14 = v20 ^ 1;
    }
    else {
      int v14 = 1;
    }
  }

  uint64_t v21 = [v4 objectForKeyedSubscript:@"testName"];
  char v22 = [v21 isEqualToString:@"WriteEntries"];

  long long v57 = v4;
  if (v22)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    if (v8 >= 1)
    {
      uint64_t v24 = 0;
      if (v14) {
        uint64_t v25 = v5;
      }
      else {
        uint64_t v25 = 0;
      }
      do
      {
        id v26 = objc_alloc(MEMORY[0x1E4F929D0]);
        id v27 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v24];
        id v28 = (void *)[v26 initWithEntryKey:v25 withDate:v27];
        [v23 addObject:v28];

        ++v24;
      }
      while (v8 != v24);
    }
    id v29 = [MEMORY[0x1E4F92AD0] sharedCore];
    uint64_t v30 = [v29 storage];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __27__PLDebugService_rawWrite___block_invoke;
    v61[3] = &unk_1E692A250;
    uint64_t v31 = v58;
    uint64_t v62 = v31;
    [v30 writeEntries:v23 withCompletionBlock:v61];

    LOBYTE(v32) = v14;
    if (v14) {
      dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    int v32 = v14;
    if (v8 >= 1)
    {
      uint64_t v33 = 0;
      if (v14) {
        v34 = v5;
      }
      else {
        v34 = 0;
      }
      do
      {
        id v35 = objc_alloc(MEMORY[0x1E4F929D0]);
        v36 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v33];
        v37 = (void *)[v35 initWithEntryKey:v34 withDate:v36];

        v38 = [MEMORY[0x1E4F92AD0] sharedCore];
        v39 = [v38 storage];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        void v59[2] = __27__PLDebugService_rawWrite___block_invoke_2;
        v59[3] = &unk_1E692A250;
        uint64_t v40 = v58;
        v60 = v40;
        [v39 writeEntry:v37 withCompletionBlock:v59];

        if (v32) {
          dispatch_semaphore_wait(v40, 0xFFFFFFFFFFFFFFFFLL);
        }

        ++v33;
      }
      while (v8 != v33);
    }
  }
  if (v55)
  {
    uint64_t v41 = [MEMORY[0x1E4F92AD0] sharedCore];
    uint64_t v42 = [v41 storage];
    [v42 blockingFlushCachesWithReason:@"testAPI"];
  }
  v43 = [MEMORY[0x1E4F92AD0] sharedCore];
  id v44 = [v43 storage];
  uint64_t v45 = [v44 countOfEntriesForKey:v5];

  if (v56 + v8 == v45) {
    char v46 = 0;
  }
  else {
    char v46 = v32;
  }
  id v47 = NSString;
  v48 = [v57 objectForKeyedSubscript:@"testName"];
  int v49 = [v48 isEqualToString:@"WriteEntries"];
  long long v50 = @"y";
  if (v49) {
    long long v50 = @"ies";
  }
  if (v46)
  {
    long long v51 = [v47 stringWithFormat:@"WriteEntr%@ (%ld times) failed.  Before:%ld, After:%ld", v50, v8, v56, v45];
    id v52 = [(PLDebugService *)self test_LogErr:v57 str:v51];
  }
  else
  {
    long long v51 = [v47 stringWithFormat:@"WriteEntr%@ (%ld times) passed.  Before:%ld, After:%ld", v50, v8, v56, v45];
    id v53 = [(PLDebugService *)self test_LogPass:v57 str:v51];
  }

  return 1;
}

intptr_t __27__PLDebugService_rawWrite___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __27__PLDebugService_rawWrite___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)testPLAPICore_WriteEntry:(id)a3
{
  id v4 = a3;
  [(PLDebugService *)self rawWrite:v4];
  return v4;
}

- (id)testPLAPICore_WriteEntries:(id)a3
{
  id v4 = a3;
  [(PLDebugService *)self rawWrite:v4];
  return v4;
}

- (id)testPLAPICore_UpdateEntry:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v45 = dispatch_semaphore_create(0);
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PLAPITest"];
  id v6 = [v4 objectForKeyedSubscript:@"objT"];
  int v7 = [v6 objectForKeyedSubscript:@"iterations"];
  uint64_t v8 = [v7 longValue];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"objT"];
  id v10 = [v9 objectForKeyedSubscript:@"flush"];
  char v40 = [v10 BOOLValue];

  uint64_t v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  int v13 = [v12 intValue];

  uint64_t v41 = self;
  id v42 = v4;
  [(PLDebugService *)self rawWrite:v4];
  int v14 = [MEMORY[0x1E4F92AD0] sharedCore];
  double v15 = [v14 storage];
  v43 = (void *)v5;
  id v44 = [v15 entriesForKey:v5];

  if (v8 >= 1)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v17 = [MEMORY[0x1E4F92AD0] sharedCore];
      uint64_t v18 = [v17 storage];
      if (v13 == -1)
      {
        int v20 = 0;
        uint64_t v19 = v44;
      }
      else
      {
        uint64_t v19 = v44;
        self = [v44 objectAtIndexedSubscript:i];
        int v20 = self;
      }
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      void v46[2] = __44__PLDebugService_testPLAPICore_UpdateEntry___block_invoke;
      v46[3] = &unk_1E692CE00;
      id v47 = v19;
      uint64_t v49 = i;
      uint64_t v21 = v45;
      v48 = v21;
      [v18 updateEntry:v20 withBlock:v46];
      if (v13 == -1)
      {
      }
      else
      {

        dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
  }
  if (v40)
  {
    char v22 = [MEMORY[0x1E4F92AD0] sharedCore];
    uint64_t v23 = [v22 storage];
    [v23 blockingFlushCachesWithReason:@"testAPI"];
  }
  uint64_t v24 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v25 = [v24 storage];
  id v26 = [v25 entriesForKey:v5];

  id v27 = v4;
  if (v8 < 1) {
    goto LABEL_22;
  }
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  do
  {
    uint64_t v30 = v28 + 1;
    uint64_t v31 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(v28 + 1)];
    int v32 = [v26 objectAtIndexedSubscript:v28];
    uint64_t v33 = [v32 entryDate];
    uint64_t v34 = [v33 compare:v31];

    if (v34) {
      ++v29;
    }

    uint64_t v28 = v30;
  }
  while (v8 != v30);
  BOOL v35 = !v29 || v13 == -1;
  id v27 = v42;
  if (v35)
  {
LABEL_22:
    v37 = objc_msgSend(NSString, "stringWithFormat:", @"UpdateEntry (%ld times) passed.", v8);
    id v36 = [(PLDebugService *)v41 test_LogPass:v27 str:v37];
  }
  else
  {
    v37 = [NSString stringWithFormat:@"UpdateEntry (%ld times) failed - times .  Failures: %ld, array:%@", v8, v29, v26];
    id v38 = [(PLDebugService *)v41 test_LogErr:v42 str:v37];
  }

  return v27;
}

intptr_t __44__PLDebugService_testPLAPICore_UpdateEntry___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(*(void *)(a1 + 48) + 1)];
  uint64_t v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(a1 + 48)];
  [v3 setEntryDate:v2];

  id v4 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v4);
}

- (id)testPLAPICore_DeleteEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PLAPITest"];
  id v6 = [v4 objectForKeyedSubscript:@"objT"];
  int v7 = [v6 objectForKeyedSubscript:@"iterations"];
  uint64_t v8 = [v7 longValue];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"objT"];
  id v10 = [v9 objectForKeyedSubscript:@"flush"];
  char v34 = [v10 BOOLValue];

  uint64_t v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  int v13 = [v12 intValue];

  [(PLDebugService *)self rawWrite:v4];
  int v14 = [MEMORY[0x1E4F92AD0] sharedCore];
  double v15 = [v14 storage];
  uint64_t v16 = [v15 countOfEntriesForKey:v5];

  uint64_t v17 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v18 = [v17 storage];
  BOOL v35 = (void *)v5;
  uint64_t v19 = [v18 entriesForKey:v5];

  if (v8 >= 1)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v21 = [MEMORY[0x1E4F92AD0] sharedCore];
      char v22 = [v21 storage];
      uint64_t v23 = v22;
      if (v13 == -1)
      {
        [v22 deleteEntry:0];
      }
      else
      {
        uint64_t v24 = [v19 objectAtIndexedSubscript:i];
        [v23 deleteEntry:v24];
      }
    }
  }
  if (v34)
  {
    uint64_t v25 = [MEMORY[0x1E4F92AD0] sharedCore];
    id v26 = [v25 storage];
    [v26 blockingFlushCachesWithReason:@"testAPI"];
  }
  id v27 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v28 = [v27 storage];
  uint64_t v29 = [v28 countOfEntriesForKey:v35];

  if (v29 == ((v16 - v8) & ~((v16 - v8) >> 63)))
  {
    uint64_t v30 = [NSString stringWithFormat:@"deleteEntry (%ld times) passed.  Before:%ld, After:%ld", v8, v16, v29];
    id v31 = [(PLDebugService *)self test_LogPass:v4 str:v30];
  }
  else
  {
    uint64_t v30 = [NSString stringWithFormat:@"deleteEntry (%ld times) failed.  Before:%ld, After:%ld", v8, v16, v29];
    id v32 = [(PLDebugService *)self test_LogErr:v4 str:v30];
  }

  return v4;
}

- (id)testPLAPICore_DeleteEntryForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PLAPITest"];
  id v6 = [v4 objectForKeyedSubscript:@"objT"];
  int v7 = [v6 objectForKeyedSubscript:@"iterations"];
  uint64_t v8 = [v7 longValue];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"objT"];
  id v10 = [v9 objectForKeyedSubscript:@"flush"];
  char v50 = [v10 BOOLValue];

  uint64_t v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  int v13 = [v12 intValue];

  id v52 = self;
  id v53 = v4;
  [(PLDebugService *)self rawWrite:v4];
  unint64_t v14 = 0x1E4F92000uLL;
  double v15 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v16 = [v15 storage];
  uint64_t v17 = [v16 entriesForKey:v5];
  NSLog(&cfstr_Before.isa, v17);

  uint64_t v18 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v19 = [v18 storage];
  uint64_t v51 = [v19 countOfEntriesForKey:v5];

  int v20 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v21 = [v20 storage];
  char v22 = (void *)v5;
  uint64_t v23 = [v21 entriesForKey:v5];

  if (v8 >= 1)
  {
    uint64_t v24 = 0;
    if (v13 == -1) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = v5;
    }
    do
    {
      id v26 = [v23 objectAtIndexedSubscript:v24];
      uint64_t v27 = [v26 entryID];

      uint64_t v28 = [*(id *)(v14 + 2768) sharedCore];
      uint64_t v29 = [v28 storage];
      [v29 deleteEntryForKey:v25 WithRowID:v27];

      uint64_t v30 = [v23 objectAtIndexedSubscript:v24];
      id v31 = [*(id *)(v14 + 2768) sharedCore];
      [v31 storage];
      uint64_t v32 = v8;
      v34 = unint64_t v33 = v14;
      NSLog(&cfstr_DeletingWithRo.isa, v30, v27, [v34 countOfEntriesForKey:v22]);

      unint64_t v14 = v33;
      uint64_t v8 = v32;

      ++v24;
    }
    while (v32 != v24);
  }
  if (v50)
  {
    [*(id *)(v14 + 2768) sharedCore];
    v36 = unint64_t v35 = v14;
    v37 = [v36 storage];
    [v37 blockingFlushCachesWithReason:@"testAPI"];

    unint64_t v14 = v35;
  }
  [*(id *)(v14 + 2768) sharedCore];
  v39 = unint64_t v38 = v14;
  char v40 = [v39 storage];
  uint64_t v41 = [v40 entriesForKey:v22];
  NSLog(&cfstr_After.isa, v41);

  id v42 = [*(id *)(v38 + 2768) sharedCore];
  v43 = [v42 storage];
  uint64_t v44 = [v43 countOfEntriesForKey:v22];

  if (v44 == ((v51 - v8) & ~((v51 - v8) >> 63)))
  {
    dispatch_semaphore_t v45 = [NSString stringWithFormat:@"deleteEntryForKey (%ld times) passed.  Before:%ld, After:%ld", v8, v51, v44];
    char v46 = v53;
    id v47 = [(PLDebugService *)v52 test_LogPass:v53 str:v45];
  }
  else
  {
    dispatch_semaphore_t v45 = [NSString stringWithFormat:@"deleteEntryForKey (%ld times) failed.  Before:%ld, After:%ld", v8, v51, v44];
    char v46 = v53;
    id v48 = [(PLDebugService *)v52 test_LogErr:v53 str:v45];
  }

  return v46;
}

- (id)testPLAPICore_DeleteAllEntriesForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PLAPITest"];
  id v6 = [v4 objectForKeyedSubscript:@"objT"];
  int v7 = [v6 objectForKeyedSubscript:@"flush"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"objT"];
  id v10 = [v9 objectForKeyedSubscript:@"validity"];
  int v11 = [v10 intValue];

  [(PLDebugService *)self rawWrite:v4];
  double v12 = [MEMORY[0x1E4F92AD0] sharedCore];
  int v13 = [v12 storage];
  uint64_t v14 = [v13 countOfEntriesForKey:v5];

  double v15 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v16 = [v15 storage];
  uint64_t v17 = v16;
  if (v11 == -1) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = v5;
  }
  [v16 deleteAllEntriesForKey:v18];

  if (v8)
  {
    uint64_t v19 = [MEMORY[0x1E4F92AD0] sharedCore];
    int v20 = [v19 storage];
    [v20 blockingFlushCachesWithReason:@"testAPI"];
  }
  uint64_t v21 = [MEMORY[0x1E4F92AD0] sharedCore];
  char v22 = [v21 storage];
  uint64_t v23 = [v22 countOfEntriesForKey:v5];

  if (!v23 || v11 == -1)
  {
    uint64_t v24 = [NSString stringWithFormat:@"deleteAllEntriesForKey passed.  Before:%ld, After:%ld", v14, v23];
    id v26 = [(PLDebugService *)self test_LogPass:v4 str:v24];
  }
  else
  {
    uint64_t v24 = [NSString stringWithFormat:@"deleteAllEntriesForKey failed.  Before:%ld, After:%ld", v14, v23];
    id v25 = [(PLDebugService *)self test_LogErr:v4 str:v24];
  }

  return v4;
}

- (id)testPLAPICore_DeleteAllEntriesForKeyWF:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PLAPITest"];
  id v6 = [v4 objectForKeyedSubscript:@"objT"];
  int v7 = [v6 objectForKeyedSubscript:@"flush"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"objT"];
  id v10 = [v9 objectForKeyedSubscript:@"validity"];
  int v11 = [v10 intValue];

  [(PLDebugService *)self rawWrite:v4];
  double v12 = [MEMORY[0x1E4F92AD0] sharedCore];
  int v13 = [v12 storage];
  uint64_t v14 = [v13 countOfEntriesForKey:v5];

  double v15 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v16 = [v15 storage];
  uint64_t v17 = v16;
  if (v11 == -1) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = v5;
  }
  [v16 deleteAllEntriesForKey:v18 withFilters:0];

  if (v8)
  {
    uint64_t v19 = [MEMORY[0x1E4F92AD0] sharedCore];
    int v20 = [v19 storage];
    [v20 blockingFlushCachesWithReason:@"testAPI"];
  }
  uint64_t v21 = [MEMORY[0x1E4F92AD0] sharedCore];
  char v22 = [v21 storage];
  uint64_t v23 = [v22 countOfEntriesForKey:v5];

  if (!v23 || v11 == -1)
  {
    uint64_t v24 = [NSString stringWithFormat:@"deleteAllEntriesForKeyWF passed.  Before:%ld, After:%ld", v14, v23];
    id v26 = [(PLDebugService *)self test_LogPass:v4 str:v24];
  }
  else
  {
    uint64_t v24 = [NSString stringWithFormat:@"deleteAllEntriesForKeyWF failed.  Before:%ld, After:%ld", v14, v23];
    id v25 = [(PLDebugService *)self test_LogErr:v4 str:v24];
  }

  return v4;
}

- (id)testPLAPICore_DeleteAllEntriesForKeyBTWF:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PLAPITest"];
  id v6 = [v4 objectForKeyedSubscript:@"objT"];
  int v7 = [v6 objectForKeyedSubscript:@"flush"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"objT"];
  id v10 = [v9 objectForKeyedSubscript:@"validity"];
  int v11 = [v10 intValue];

  [(PLDebugService *)self rawWrite:v4];
  double v12 = [MEMORY[0x1E4F92AD0] sharedCore];
  int v13 = [v12 storage];
  uint64_t v14 = [v13 countOfEntriesForKey:v5];

  double v15 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v16 = [v15 storage];
  if (v11 == -1) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v5;
  }
  uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
  [v16 deleteAllEntriesForKey:v17 beforeTimestamp:v18 withFilters:0];

  if (v8)
  {
    uint64_t v19 = [MEMORY[0x1E4F92AD0] sharedCore];
    int v20 = [v19 storage];
    [v20 blockingFlushCachesWithReason:@"testAPI"];
  }
  uint64_t v21 = [MEMORY[0x1E4F92AD0] sharedCore];
  char v22 = [v21 storage];
  uint64_t v23 = [v22 countOfEntriesForKey:v5];

  if (!v23 || v11 == -1)
  {
    uint64_t v24 = [NSString stringWithFormat:@"deleteAllEntriesForKeyBTWF passed.  Before:%ld, After:%ld", v14, v23];
    id v26 = [(PLDebugService *)self test_LogPass:v4 str:v24];
  }
  else
  {
    uint64_t v24 = [NSString stringWithFormat:@"deleteAllEntriesForKeyBTWF failed.  Before:%ld, After:%ld", v14, v23];
    id v25 = [(PLDebugService *)self test_LogErr:v4 str:v24];
  }

  return v4;
}

- (id)testPLAPICore_EntriesForKeyWithProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PLAPITest"];
  [(PLDebugService *)self rawWrite:v4];
  id v6 = [v4 objectForKeyedSubscript:@"objT"];
  int v7 = [v6 objectForKeyedSubscript:@"flush"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"objT"];
  id v10 = [v9 objectForKeyedSubscript:@"validity"];
  int v11 = [v10 intValue];

  double v12 = [MEMORY[0x1E4F92AD0] sharedCore];
  int v13 = [v12 storage];
  uint64_t v14 = [v13 countOfEntriesForKey:v5];

  if (v8)
  {
    double v15 = [MEMORY[0x1E4F92AD0] sharedCore];
    uint64_t v16 = [v15 storage];
    [v16 blockingFlushCachesWithReason:@"testAPI"];
  }
  uint64_t v17 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v18 = [v17 storage];
  uint64_t v19 = v18;
  if (v11 == -1) {
    int v20 = 0;
  }
  else {
    int v20 = v5;
  }
  uint64_t v21 = [v18 entriesForKey:v20 withProperties:0];
  uint64_t v22 = [v21 count];

  if (v14 == v22 || v11 == -1)
  {
    uint64_t v23 = [NSString stringWithFormat:@"EntriesForKeyWithProperties passed.  Before:%ld, After:%ld", v14, v22];
    id v25 = [(PLDebugService *)self test_LogPass:v4 str:v23];
  }
  else
  {
    uint64_t v23 = [NSString stringWithFormat:@"EntriesForKeyWithProperties failed.  Before:%ld, After:%ld", v14, v22];
    id v24 = [(PLDebugService *)self test_LogErr:v4 str:v23];
  }

  return v4;
}

- (id)testPLAPICore_EntriesForKeyInTimeRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PLAPITest"];
  id v6 = [v4 objectForKeyedSubscript:@"objT"];
  int v7 = [v6 objectForKeyedSubscript:@"flush"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"objT"];
  id v10 = [v9 objectForKeyedSubscript:@"validity"];
  int v11 = [v10 intValue];

  double v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  int v13 = [MEMORY[0x1E4F1C9C8] date];
  [v12 timeIntervalSince1970];
  double v15 = v14;
  [v13 timeIntervalSince1970];
  double v17 = v16 - v15;

  [(PLDebugService *)self rawWrite:v4];
  uint64_t v18 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v19 = [v18 storage];
  uint64_t v20 = [v19 countOfEntriesForKey:v5];

  if (v8)
  {
    uint64_t v21 = [MEMORY[0x1E4F92AD0] sharedCore];
    uint64_t v22 = [v21 storage];
    [v22 blockingFlushCachesWithReason:@"testAPI"];
  }
  uint64_t v23 = [MEMORY[0x1E4F92AD0] sharedCore];
  id v24 = [v23 storage];
  id v25 = v24;
  if (v11 == -1) {
    id v26 = 0;
  }
  else {
    id v26 = v5;
  }
  uint64_t v27 = objc_msgSend(v24, "entriesForKey:inTimeRange:withFilters:", v26, 0, v15, v17);
  uint64_t v28 = [v27 count];

  if (v20 == v28 || v11 == -1)
  {
    uint64_t v29 = [NSString stringWithFormat:@"EntriesForKeyInTimeRange passed.  Before:%ld, After:%ld", v20, v28];
    id v31 = [(PLDebugService *)self test_LogPass:v4 str:v29];
  }
  else
  {
    uint64_t v29 = [NSString stringWithFormat:@"EntriesForKeyInTimeRange failed.  Before:%ld, After:%ld", v20, v28];
    id v30 = [(PLDebugService *)self test_LogErr:v4 str:v29];
  }

  return v4;
}

- (id)testPLAPICore_EntriesForKeyBeforeTICWF:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PLAPITest"];
  id v6 = [v4 objectForKeyedSubscript:@"objT"];
  int v7 = [v6 objectForKeyedSubscript:@"flush"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"objT"];
  id v10 = [v9 objectForKeyedSubscript:@"validity"];
  int v11 = [v10 intValue];

  [(PLDebugService *)self rawWrite:v4];
  double v12 = [MEMORY[0x1E4F92AD0] sharedCore];
  int v13 = [v12 storage];
  uint64_t v14 = [v13 countOfEntriesForKey:v5];

  if (v8)
  {
    double v15 = [MEMORY[0x1E4F92AD0] sharedCore];
    double v16 = [v15 storage];
    [v16 blockingFlushCachesWithReason:@"testAPI"];
  }
  double v17 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v18 = [v17 storage];
  uint64_t v19 = v18;
  if (v11 == -1) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = v5;
  }
  uint64_t v21 = [v18 entriesForKey:v20 before:1 timeInterval:v14 count:0 withFilters:1.79769313e308];
  uint64_t v22 = [v21 count];

  if (v14 == v22 || v11 == -1)
  {
    uint64_t v23 = [NSString stringWithFormat:@"EntriesForKeyBeforeTICWF passed.  Before:%ld, After:%ld", v14, v22];
    id v25 = [(PLDebugService *)self test_LogPass:v4 str:v23];
  }
  else
  {
    uint64_t v23 = [NSString stringWithFormat:@"EntriesForKeyBeforeTICWF failed.  Before:%ld, After:%ld", v14, v22];
    id v24 = [(PLDebugService *)self test_LogErr:v4 str:v23];
  }

  return v4;
}

- (id)testPLAPICore_LastEntryForKeyWSEK:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PLAPITest"];
  id v6 = [v4 objectForKeyedSubscript:@"objT"];
  int v7 = [v6 objectForKeyedSubscript:@"flush"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"objT"];
  id v10 = [v9 objectForKeyedSubscript:@"validity"];
  int v11 = [v10 intValue];

  [(PLDebugService *)self rawWrite:v4];
  double v12 = [MEMORY[0x1E4F92AD0] sharedCore];
  int v13 = [v12 storage];
  uint64_t v14 = [v13 entriesForKey:v5];
  double v15 = [v14 lastObject];

  if (v8)
  {
    double v16 = [MEMORY[0x1E4F92AD0] sharedCore];
    double v17 = [v16 storage];
    [v17 blockingFlushCachesWithReason:@"testAPI"];
  }
  uint64_t v18 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v19 = [v18 storage];
  uint64_t v20 = v19;
  if (v11 == -1) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = v5;
  }
  uint64_t v22 = [v19 lastEntryForKey:v21 withSubEntryKey:0];

  if ([v15 compare:v22])
  {
    uint64_t v23 = [NSString stringWithFormat:@"EntriesForKeyInTimeRange failed.  Array:%@, LEFK:%@", v15, v22];
    id v24 = [(PLDebugService *)self test_LogErr:v4 str:v23];
  }
  else
  {
    uint64_t v23 = [NSString stringWithFormat:@"EntriesForKeyInTimeRange passed.  Array:%@, LEFK:%@", v15, v22];
    id v25 = [(PLDebugService *)self test_LogPass:v4 str:v23];
  }

  return v4;
}

- (id)testPLAPICore_LastEntryForKeyWC:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PLAPITest"];
  id v6 = [v4 objectForKeyedSubscript:@"objT"];
  int v7 = [v6 objectForKeyedSubscript:@"flush"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"objT"];
  id v10 = [v9 objectForKeyedSubscript:@"validity"];
  int v11 = [v10 intValue];

  [(PLDebugService *)self rawWrite:v4];
  double v12 = [MEMORY[0x1E4F92AD0] sharedCore];
  int v13 = [v12 storage];
  uint64_t v14 = [v13 entriesForKey:v5];
  double v15 = [v14 lastObject];

  double v16 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:v5 withValue:v5 withComparisonOperation:0];
  if (v8)
  {
    double v17 = [MEMORY[0x1E4F92AD0] sharedCore];
    uint64_t v18 = [v17 storage];
    [v18 blockingFlushCachesWithReason:@"testAPI"];
  }
  uint64_t v19 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v20 = [v19 storage];
  if (v11 == -1) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = v5;
  }
  v28[0] = v16;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  uint64_t v23 = [v20 lastEntryForKey:v21 withComparisons:v22 isSingleton:1];

  if ([v15 compare:v23])
  {
    id v24 = [NSString stringWithFormat:@"EntriesForKeyInTimeRange failed.  Array:%@, LEFK:%@", v15, v23];
    id v25 = [(PLDebugService *)self test_LogErr:v4 str:v24];
  }
  else
  {
    id v24 = [NSString stringWithFormat:@"EntriesForKeyInTimeRange passed.  Array:%@, LEFK:%@", v15, v23];
    id v26 = [(PLDebugService *)self test_LogPass:v4 str:v24];
  }

  return v4;
}

- (id)testPLAPIAccounting_CreatePowerEventForward:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    if (v7 >= 1)
    {
      do
      {
        uint64_t v20 = [MEMORY[0x1E4F92900] debugInstance];
        uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
        [v20 createPowerEventForwardWithRootNodeID:0 withPower:v21 withStartDate:1.0];

        uint64_t v22 = [MEMORY[0x1E4F92900] debugInstance];
        uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
        [v22 createPowerEventForwardWithRootNodeID:10 withPower:v23 withStartDate:-1.0];

        id v24 = [MEMORY[0x1E4F92900] debugInstance];
        [v24 createPowerEventForwardWithRootNodeID:10 withPower:0 withStartDate:1.0];

        --v7;
      }
      while (v7);
    }
    uint64_t v19 = @"CreatePowerEventForward (negative) passed.";
    goto LABEL_11;
  }
  if (v7 >= 1)
  {
    do
    {
      int v13 = [MEMORY[0x1E4F92900] debugInstance];
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
      [v13 createPowerEventForwardWithRootNodeID:10 withPower:v14 withStartDate:1.0];

      --v7;
    }
    while (v7);
  }
  if (v10)
  {
    double v15 = [MEMORY[0x1E4F92AD0] sharedCore];
    double v16 = [v15 storage];
    [v16 blockingFlushCachesWithReason:@"testAPI"];
  }
  double v17 = [(PLDebugService *)self accDS];
  int v18 = [v17 verifyLastPowerEventWithRootNodeID:10 withPower:1.0];

  if (v18)
  {
    uint64_t v19 = @"CreatePowerEventForward passed.";
LABEL_11:
    id v25 = [(PLDebugService *)self test_LogPass:v4 str:v19];
    goto LABEL_13;
  }
  id v26 = [(PLDebugService *)self test_LogErr:v4 str:@"CreatePowerEventForward failed."];
LABEL_13:
  return v4;
}

- (id)testPLAPIAccounting_CreatePowerEventBackward:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    if (v7 >= 1)
    {
      do
      {
        uint64_t v20 = [MEMORY[0x1E4F92900] debugInstance];
        uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
        [v20 createPowerEventBackwardWithRootNodeID:0 withPower:v21 withEndDate:2.0];

        uint64_t v22 = [MEMORY[0x1E4F92900] debugInstance];
        uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
        [v22 createPowerEventBackwardWithRootNodeID:11 withPower:v23 withEndDate:-1.0];

        id v24 = [MEMORY[0x1E4F92900] debugInstance];
        [v24 createPowerEventBackwardWithRootNodeID:11 withPower:0 withEndDate:2.0];

        --v7;
      }
      while (v7);
    }
    uint64_t v19 = @"CreatePowerEventBackward (negative) passed.";
    goto LABEL_11;
  }
  if (v7 >= 1)
  {
    do
    {
      int v13 = [MEMORY[0x1E4F92900] debugInstance];
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
      [v13 createPowerEventBackwardWithRootNodeID:11 withPower:v14 withEndDate:2.0];

      --v7;
    }
    while (v7);
  }
  if (v10)
  {
    double v15 = [MEMORY[0x1E4F92AD0] sharedCore];
    double v16 = [v15 storage];
    [v16 blockingFlushCachesWithReason:@"testAPI"];
  }
  double v17 = [(PLDebugService *)self accDS];
  int v18 = [v17 verifyLastPowerEventWithRootNodeID:11 withPower:2.0];

  if (v18)
  {
    uint64_t v19 = @"CreatePowerEventBackward passed.";
LABEL_11:
    id v25 = [(PLDebugService *)self test_LogPass:v4 str:v19];
    goto LABEL_13;
  }
  id v26 = [(PLDebugService *)self test_LogErr:v4 str:@"CreatePowerEventBackward failed."];
LABEL_13:
  return v4;
}

- (id)testPLAPIAccounting_CreatePowerEventInterval:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    if (v7 >= 1)
    {
      do
      {
        uint64_t v21 = [MEMORY[0x1E4F92900] debugInstance];
        uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
        [v21 createPowerEventIntervalWithRootNodeID:0 withPower:v22 withStartDate:v23 withEndDate:3.0];

        id v24 = [MEMORY[0x1E4F92900] debugInstance];
        id v25 = [MEMORY[0x1E4F1C9C8] date];
        id v26 = [MEMORY[0x1E4F1C9C8] date];
        [v24 createPowerEventIntervalWithRootNodeID:2 withPower:v25 withStartDate:v26 withEndDate:-1.0];

        uint64_t v27 = [MEMORY[0x1E4F92900] debugInstance];
        uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
        [v27 createPowerEventIntervalWithRootNodeID:2 withPower:0 withStartDate:v28 withEndDate:3.0];

        uint64_t v29 = [MEMORY[0x1E4F92900] debugInstance];
        id v30 = [MEMORY[0x1E4F1C9C8] date];
        [v29 createPowerEventIntervalWithRootNodeID:2 withPower:v30 withStartDate:0 withEndDate:3.0];

        --v7;
      }
      while (v7);
    }
    uint64_t v20 = @"CreatePowerEventInterval (negative) passed.";
    goto LABEL_11;
  }
  if (v7 >= 1)
  {
    do
    {
      int v13 = [MEMORY[0x1E4F92900] debugInstance];
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
      double v15 = [MEMORY[0x1E4F1C9C8] date];
      [v13 createPowerEventIntervalWithRootNodeID:2 withPower:v14 withStartDate:v15 withEndDate:3.0];

      --v7;
    }
    while (v7);
  }
  if (v10)
  {
    double v16 = [MEMORY[0x1E4F92AD0] sharedCore];
    double v17 = [v16 storage];
    [v17 blockingFlushCachesWithReason:@"testAPI"];
  }
  int v18 = [(PLDebugService *)self accDS];
  int v19 = [v18 verifyLastPowerEventWithRootNodeID:2 withPower:3.0];

  if (v19)
  {
    uint64_t v20 = @"CreatePowerEventInterval passed.";
LABEL_11:
    id v31 = [(PLDebugService *)self test_LogPass:v4 str:v20];
    goto LABEL_13;
  }
  id v32 = [(PLDebugService *)self test_LogErr:v4 str:@"CreatePowerEventInterval failed."];
LABEL_13:
  return v4;
}

- (id)testPLAPIAccounting_AddPowerMeasurementEventInterval:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    if (v7 < 1)
    {
      int v18 = @"AddPowerMeasurementEventInterval (negative) passed.";
    }
    else
    {
      int v18 = @"AddPowerMeasurementEventInterval (negative) passed.";
      do
      {
        int v19 = [MEMORY[0x1E4F92900] debugInstance];
        uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
        [v19 addPowerMeasurementEventIntervalWithPower:v20 withStartDate:v21 withEndDate:-1.0];

        uint64_t v22 = [MEMORY[0x1E4F92900] debugInstance];
        uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
        [v22 addPowerMeasurementEventIntervalWithPower:0 withStartDate:v23 withEndDate:4.0];

        id v24 = [MEMORY[0x1E4F92900] debugInstance];
        id v25 = [MEMORY[0x1E4F1C9C8] date];
        [v24 addPowerMeasurementEventIntervalWithPower:v25 withStartDate:0 withEndDate:4.0];

        --v7;
      }
      while (v7);
    }
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        int v13 = [MEMORY[0x1E4F92900] debugInstance];
        uint64_t v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
        double v15 = [MEMORY[0x1E4F1C9C8] date];
        [v13 addPowerMeasurementEventIntervalWithPower:v14 withStartDate:v15 withEndDate:4.0];

        --v7;
      }
      while (v7);
    }
    if (v10)
    {
      double v16 = [MEMORY[0x1E4F92AD0] sharedCore];
      double v17 = [v16 storage];
      [v17 blockingFlushCachesWithReason:@"testAPI"];
    }
    int v18 = @"AddPowerMeasurementEventInterval passed.";
  }
  id v26 = [(PLDebugService *)self test_LogPass:v4 str:v18];
  return v4;
}

- (id)testPLAPIAccounting_CreateDistributionEventForwardAdd:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    if (v7 >= 1)
    {
      do
      {
        uint64_t v21 = [MEMORY[0x1E4F92900] debugInstance];
        uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
        [v21 createDistributionEventForwardWithDistributionID:1 withAddingChildNodeName:&stru_1F294E108 withStartDate:v22];

        uint64_t v23 = [MEMORY[0x1E4F92900] debugInstance];
        id v24 = [MEMORY[0x1E4F1C9C8] date];
        [v23 createDistributionEventForwardWithDistributionID:1 withAddingChildNodeName:0 withStartDate:v24];

        id v25 = [MEMORY[0x1E4F92900] debugInstance];
        [v25 createDistributionEventForwardWithDistributionID:1 withAddingChildNodeName:@"App1" withStartDate:0];

        --v7;
      }
      while (v7);
    }
    uint64_t v20 = @"CreateDistributionEventForwardAdd (negative) passed.";
    goto LABEL_11;
  }
  if (v7 >= 1)
  {
    do
    {
      int v13 = [MEMORY[0x1E4F92900] debugInstance];
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
      double v15 = [v14 dateByAddingTimeInterval:-5.0];
      [v13 createDistributionEventForwardWithDistributionID:1 withAddingChildNodeName:@"App1" withStartDate:v15];

      --v7;
    }
    while (v7);
  }
  if (v10)
  {
    double v16 = [MEMORY[0x1E4F92AD0] sharedCore];
    double v17 = [v16 storage];
    [v17 blockingFlushCachesWithReason:@"testAPI"];
  }
  int v18 = [(PLDebugService *)self accDS];
  int v19 = [v18 verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:1.0];

  if (v19)
  {
    uint64_t v20 = @"CreateDistributionEventForwardAdd passed.";
LABEL_11:
    id v26 = [(PLDebugService *)self test_LogPass:v4 str:v20];
    goto LABEL_13;
  }
  id v27 = [(PLDebugService *)self test_LogErr:v4 str:@"CreateDistributionEventForwardAdd failed."];
LABEL_13:
  return v4;
}

- (id)testPLAPIAccounting_CreateDistributionEventForwardRem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    if (v7 >= 1)
    {
      do
      {
        uint64_t v22 = [MEMORY[0x1E4F92900] debugInstance];
        uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
        [v22 createDistributionEventForwardWithDistributionID:1 withRemovingChildNodeName:&stru_1F294E108 withStartDate:v23];

        id v24 = [MEMORY[0x1E4F92900] debugInstance];
        id v25 = [MEMORY[0x1E4F1C9C8] date];
        [v24 createDistributionEventForwardWithDistributionID:1 withRemovingChildNodeName:0 withStartDate:v25];

        id v26 = [MEMORY[0x1E4F92900] debugInstance];
        [v26 createDistributionEventForwardWithDistributionID:1 withRemovingChildNodeName:@"App1" withStartDate:0];

        --v7;
      }
      while (v7);
    }
    uint64_t v21 = @"CreateDistributionEventForwardRem (negative) passed.";
    goto LABEL_11;
  }
  if (v7 >= 1)
  {
    do
    {
      int v13 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v14 = [v13 dateByAddingTimeInterval:-5.0];

      double v15 = [MEMORY[0x1E4F92900] debugInstance];
      [v15 createDistributionEventForwardWithDistributionID:1 withAddingChildNodeName:@"App1" withStartDate:v14];

      double v16 = [MEMORY[0x1E4F92900] debugInstance];
      [v16 createDistributionEventForwardWithDistributionID:1 withRemovingChildNodeName:@"App1" withStartDate:v14];

      --v7;
    }
    while (v7);
  }
  if (v10)
  {
    double v17 = [MEMORY[0x1E4F92AD0] sharedCore];
    int v18 = [v17 storage];
    [v18 blockingFlushCachesWithReason:@"testAPI"];
  }
  int v19 = [(PLDebugService *)self accDS];
  int v20 = [v19 verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:1.0];

  if (v20)
  {
    uint64_t v21 = @"CreateDistributionEventForwardRem passed.";
LABEL_11:
    id v27 = [(PLDebugService *)self test_LogPass:v4 str:v21];
    goto LABEL_13;
  }
  id v28 = [(PLDebugService *)self test_LogErr:v4 str:@"CreateDistributionEventForwardRem failed."];
LABEL_13:
  return v4;
}

- (id)testPLAPIAccounting_CreateDistributionEventForwardChild:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    if (v7 >= 1)
    {
      uint64_t v21 = MEMORY[0x1E4F1CC08];
      do
      {
        uint64_t v22 = [MEMORY[0x1E4F92900] debugInstance];
        uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
        [v22 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29EB570 withStartDate:v23];

        id v24 = [MEMORY[0x1E4F92900] debugInstance];
        id v25 = [MEMORY[0x1E4F1C9C8] date];
        [v24 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:v21 withStartDate:v25];

        id v26 = [MEMORY[0x1E4F92900] debugInstance];
        [v26 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29EB598 withStartDate:0];

        --v7;
      }
      while (v7);
    }
    int v20 = @"CreateDistributionEventForwardChild (negative) passed.";
    goto LABEL_12;
  }
  if (v7 >= 1)
  {
    do
    {
      int v13 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v14 = [v13 dateByAddingTimeInterval:-5.0];

      double v15 = [MEMORY[0x1E4F92900] debugInstance];
      [v15 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29EB548 withStartDate:v14];

      --v7;
    }
    while (v7);
  }
  if (v10)
  {
    double v16 = [MEMORY[0x1E4F92AD0] sharedCore];
    double v17 = [v16 storage];
    [v17 blockingFlushCachesWithReason:@"testAPI"];
  }
  int v18 = [(PLDebugService *)self accDS];
  int v19 = [v18 verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:1.0];

  if (v19)
  {
    int v20 = @"CreateDistributionEventForwardChild passed.";
LABEL_12:
    id v27 = [(PLDebugService *)self test_LogPass:v4 str:v20];
    goto LABEL_14;
  }
  id v28 = [(PLDebugService *)self test_LogErr:v4 str:@"CreateDistributionEventForwardChild failed."];
LABEL_14:
  return v4;
}

- (id)testPLAPIAccounting_CreateDistributionEventInterval:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    id v36 = self;
    id v37 = v4;
    if (v7 >= 1)
    {
      uint64_t v23 = MEMORY[0x1E4F1CC08];
      do
      {
        id v24 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v36, v37);
        id v25 = [v24 dateByAddingTimeInterval:-5.0];

        id v26 = [MEMORY[0x1E4F92900] debugInstance];
        id v27 = [v25 dateByAddingTimeInterval:-10.0];
        [v26 createDistributionEventIntervalWithDistributionID:20 withChildNodeNameToWeight:&unk_1F29EB5E8 withStartDate:v27 withEndDate:v25];

        id v28 = [MEMORY[0x1E4F92900] debugInstance];
        uint64_t v29 = [v25 dateByAddingTimeInterval:-10.0];
        [v28 createDistributionEventIntervalWithDistributionID:20 withChildNodeNameToWeight:v23 withStartDate:v29 withEndDate:v25];

        id v30 = [MEMORY[0x1E4F92900] debugInstance];
        [v30 createDistributionEventIntervalWithDistributionID:20 withChildNodeNameToWeight:&unk_1F29EB610 withStartDate:0 withEndDate:v25];

        id v31 = [MEMORY[0x1E4F92900] debugInstance];
        id v32 = [v25 dateByAddingTimeInterval:-10.0];
        [v31 createDistributionEventIntervalWithDistributionID:20 withChildNodeNameToWeight:&unk_1F29EB638 withStartDate:v32 withEndDate:0];

        --v7;
      }
      while (v7);
    }
    uint64_t v21 = @"CreateDistributionEventInterval (negative) passed.";
    uint64_t v22 = v36;
    id v4 = v37;
    goto LABEL_12;
  }
  if (v7 >= 1)
  {
    do
    {
      int v13 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v14 = [v13 dateByAddingTimeInterval:-5.0];

      double v15 = [MEMORY[0x1E4F92900] debugInstance];
      double v16 = [v14 dateByAddingTimeInterval:-10.0];
      [v15 createDistributionEventIntervalWithDistributionID:20 withChildNodeNameToWeight:&unk_1F29EB5C0 withStartDate:v16 withEndDate:v14];

      --v7;
    }
    while (v7);
  }
  if (v10)
  {
    double v17 = [MEMORY[0x1E4F92AD0] sharedCore];
    int v18 = [v17 storage];
    [v18 blockingFlushCachesWithReason:@"testAPI"];
  }
  int v19 = [(PLDebugService *)self accDS];
  int v20 = [v19 verifyLastDistributionEventWithDistributionID:20 withNodeName:@"App1" withWeight:1.0];

  if (v20)
  {
    uint64_t v21 = @"CreateDistributionEventInterval passed.";
    uint64_t v22 = self;
LABEL_12:
    id v33 = -[PLDebugService test_LogPass:str:](v22, "test_LogPass:str:", v4, v21, v36, v37);
    goto LABEL_14;
  }
  id v34 = [(PLDebugService *)self test_LogErr:v4 str:@"CreateDistributionEventInterval failed."];
LABEL_14:
  return v4;
}

- (id)testPLAPIAccounting_CreateDistributionEventPoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    if (v7 >= 1)
    {
      uint64_t v21 = MEMORY[0x1E4F1CC08];
      do
      {
        uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v23 = [v22 dateByAddingTimeInterval:-5.0];

        id v24 = [MEMORY[0x1E4F92900] debugInstance];
        [v24 createDistributionEventPointWithDistributionID:4 withChildNodeNameToWeight:&unk_1F29EB688 withStartDate:v23];

        id v25 = [MEMORY[0x1E4F92900] debugInstance];
        [v25 createDistributionEventPointWithDistributionID:4 withChildNodeNameToWeight:v21 withStartDate:v23];

        id v26 = [MEMORY[0x1E4F92900] debugInstance];
        [v26 createDistributionEventPointWithDistributionID:4 withChildNodeNameToWeight:&unk_1F29EB6B0 withStartDate:0];

        --v7;
      }
      while (v7);
    }
    int v20 = @"CreateDistributionEventPoint (negative) passed.";
    goto LABEL_12;
  }
  if (v7 >= 1)
  {
    do
    {
      int v13 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v14 = [v13 dateByAddingTimeInterval:-5.0];

      double v15 = [MEMORY[0x1E4F92900] debugInstance];
      [v15 createDistributionEventPointWithDistributionID:4 withChildNodeNameToWeight:&unk_1F29EB660 withStartDate:v14];

      --v7;
    }
    while (v7);
  }
  if (v10)
  {
    double v16 = [MEMORY[0x1E4F92AD0] sharedCore];
    double v17 = [v16 storage];
    [v17 blockingFlushCachesWithReason:@"testAPI"];
  }
  int v18 = [(PLDebugService *)self accDS];
  int v19 = [v18 verifyLastDistributionEventWithDistributionID:4 withNodeName:@"App1" withWeight:1.0];

  if (v19)
  {
    int v20 = @"CreateDistributionEventPoint passed.";
LABEL_12:
    id v27 = [(PLDebugService *)self test_LogPass:v4 str:v20];
    goto LABEL_14;
  }
  id v28 = [(PLDebugService *)self test_LogErr:v4 str:@"CreateDistributionEventPoint failed."];
LABEL_14:
  return v4;
}

- (id)testPLAPIAccounting_CreateQualificationEventForwardAdd:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    id v30 = v4;
    if (v7 >= 1)
    {
      do
      {
        uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v23 = [v22 dateByAddingTimeInterval:-5.0];

        NSLog(&cfstr_HereLineD.isa, 1555);
        id v24 = [MEMORY[0x1E4F92900] debugInstance];
        [v24 createQualificationEventForwardWithQualificationID:2 withAddingChildNodeName:0 withStartDate:v23];

        NSLog(&cfstr_HereLineD.isa, 1559);
        id v25 = [MEMORY[0x1E4F92900] debugInstance];
        [v25 createQualificationEventForwardWithQualificationID:2 withAddingChildNodeName:&stru_1F294E108 withStartDate:v23];

        NSLog(&cfstr_HereLineD.isa, 1563);
        id v26 = [MEMORY[0x1E4F92900] debugInstance];
        [v26 createQualificationEventForwardWithQualificationID:2 withAddingChildNodeName:@"App2" withStartDate:0];

        NSLog(&cfstr_HereLineD.isa, 1567);
        --v7;
      }
      while (v7);
    }
    int v20 = @"CreateQualificationEventForwardAdd (negative) passed.";
    uint64_t v21 = self;
    id v4 = v30;
    goto LABEL_11;
  }
  if (v7 >= 1)
  {
    do
    {
      int v13 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v14 = [v13 dateByAddingTimeInterval:-5.0];

      double v15 = [MEMORY[0x1E4F92900] debugInstance];
      [v15 createQualificationEventForwardWithQualificationID:2 withAddingChildNodeName:@"App2" withStartDate:v14];

      --v7;
    }
    while (v7);
  }
  if (v10)
  {
    double v16 = [MEMORY[0x1E4F92AD0] sharedCore];
    double v17 = [v16 storage];
    [v17 blockingFlushCachesWithReason:@"testAPI"];
  }
  int v18 = [(PLDebugService *)self accDS];
  int v19 = [v18 verifyLastQualificationEventWithQualificationID:2 withNodeName:@"App2"];

  if (v19)
  {
    int v20 = @"CreateQualificationEventForwardAdd passed.";
    uint64_t v21 = self;
LABEL_11:
    id v27 = [(PLDebugService *)v21 test_LogPass:v4 str:v20];
    goto LABEL_13;
  }
  id v28 = [(PLDebugService *)self test_LogErr:v4 str:@"CreateQualificationEventForwardAdd failed."];
LABEL_13:
  return v4;
}

- (id)testPLAPIAccounting_CreateQualificationEventForwardRem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    if (v7 >= 1)
    {
      do
      {
        uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
        id v24 = [v23 dateByAddingTimeInterval:-5.0];

        id v25 = [MEMORY[0x1E4F92900] debugInstance];
        [v25 createQualificationEventForwardWithQualificationID:2 withRemovingChildNodeName:0 withStartDate:v24];

        id v26 = [MEMORY[0x1E4F92900] debugInstance];
        [v26 createQualificationEventForwardWithQualificationID:2 withRemovingChildNodeName:&stru_1F294E108 withStartDate:v24];

        id v27 = [MEMORY[0x1E4F92900] debugInstance];
        [v27 createQualificationEventForwardWithQualificationID:2 withRemovingChildNodeName:@"App2" withStartDate:0];

        --v7;
      }
      while (v7);
    }
    uint64_t v22 = @"CreateQualificationEventForwardRem (negative) passed.";
    goto LABEL_11;
  }
  if (v7 >= 1)
  {
    do
    {
      int v13 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v14 = [v13 dateByAddingTimeInterval:-5.0];

      double v15 = [MEMORY[0x1E4F92900] debugInstance];
      [v15 createQualificationEventForwardWithQualificationID:2 withAddingChildNodeName:@"App3" withStartDate:v14];

      double v16 = [MEMORY[0x1E4F92900] debugInstance];
      [v16 createQualificationEventForwardWithQualificationID:2 withAddingChildNodeName:@"App2" withStartDate:v14];

      double v17 = [MEMORY[0x1E4F92900] debugInstance];
      [v17 createQualificationEventForwardWithQualificationID:2 withRemovingChildNodeName:@"App2" withStartDate:v14];

      --v7;
    }
    while (v7);
  }
  if (v10)
  {
    int v18 = [MEMORY[0x1E4F92AD0] sharedCore];
    int v19 = [v18 storage];
    [v19 blockingFlushCachesWithReason:@"testAPI"];
  }
  int v20 = [(PLDebugService *)self accDS];
  int v21 = [v20 verifyLastQualificationEventWithQualificationID:2 withNodeName:@"App3"];

  if (v21)
  {
    uint64_t v22 = @"CreateQualificationEventForwardRem passed.";
LABEL_11:
    id v28 = [(PLDebugService *)self test_LogPass:v4 str:v22];
    goto LABEL_13;
  }
  id v29 = [(PLDebugService *)self test_LogErr:v4 str:@"CreateQualificationEventForwardRem failed."];
LABEL_13:
  return v4;
}

- (id)testPLAPIAccounting_CreateQualificationEventForwardChild:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    if (v7 >= 1)
    {
      uint64_t v21 = MEMORY[0x1E4F1CBF0];
      do
      {
        uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v23 = [v22 dateByAddingTimeInterval:-5.0];

        id v24 = [MEMORY[0x1E4F92900] debugInstance];
        [v24 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:&unk_1F29EFEF0 withStartDate:v23];

        id v25 = [MEMORY[0x1E4F92900] debugInstance];
        [v25 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:v21 withStartDate:v23];

        id v26 = [MEMORY[0x1E4F92900] debugInstance];
        [v26 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:&unk_1F29EFF08 withStartDate:0];

        --v7;
      }
      while (v7);
    }
    int v20 = @"CreateQualificationEventForwardChild (negative) passed.";
    goto LABEL_12;
  }
  if (v7 >= 1)
  {
    do
    {
      int v13 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v14 = [v13 dateByAddingTimeInterval:-5.0];

      double v15 = [MEMORY[0x1E4F92900] debugInstance];
      [v15 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:&unk_1F29EFED8 withStartDate:v14];

      --v7;
    }
    while (v7);
  }
  if (v10)
  {
    double v16 = [MEMORY[0x1E4F92AD0] sharedCore];
    double v17 = [v16 storage];
    [v17 blockingFlushCachesWithReason:@"testAPI"];
  }
  int v18 = [(PLDebugService *)self accDS];
  int v19 = [v18 verifyLastQualificationEventWithQualificationID:2 withNodeName:@"App2"];

  if (v19)
  {
    int v20 = @"CreateQualificationEventForwardChild passed.";
LABEL_12:
    id v27 = [(PLDebugService *)self test_LogPass:v4 str:v20];
    goto LABEL_14;
  }
  id v28 = [(PLDebugService *)self test_LogErr:v4 str:@"CreateQualificationEventForwardChild failed."];
LABEL_14:
  return v4;
}

- (id)testPLAPIAccounting_CreateQualificationEventBackward:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    if (v7 < 1)
    {
      int v18 = @"CreateQualificationEventBackward (negative) passed.";
    }
    else
    {
      id v27 = self;
      uint64_t v19 = MEMORY[0x1E4F1CBF0];
      int v18 = @"CreateQualificationEventBackward (negative) passed.";
      do
      {
        int v20 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v21 = [v20 dateByAddingTimeInterval:-5.0];

        uint64_t v22 = [MEMORY[0x1E4F92900] debugInstance];
        [v22 createQualificationEventBackwardWithQualificationID:1 withChildNodeNames:&unk_1F29EFF38 withEndDate:v21];

        uint64_t v23 = [MEMORY[0x1E4F92900] debugInstance];
        [v23 createQualificationEventBackwardWithQualificationID:1 withChildNodeNames:v19 withEndDate:v21];

        id v24 = [MEMORY[0x1E4F92900] debugInstance];
        [v24 createQualificationEventBackwardWithQualificationID:1 withChildNodeNames:&unk_1F29EFF50 withEndDate:0];

        --v7;
      }
      while (v7);
      self = v27;
    }
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        int v13 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v14 = [v13 dateByAddingTimeInterval:-5.0];

        double v15 = [MEMORY[0x1E4F92900] debugInstance];
        [v15 createQualificationEventBackwardWithQualificationID:0 withChildNodeNames:&unk_1F29EFF20 withEndDate:v14];

        --v7;
      }
      while (v7);
    }
    if (v10)
    {
      double v16 = [MEMORY[0x1E4F92AD0] sharedCore];
      double v17 = [v16 storage];
      [v17 blockingFlushCachesWithReason:@"testAPI"];
    }
    int v18 = @"CreateQualificationEventBackward passed.";
  }
  id v25 = [(PLDebugService *)self test_LogPass:v4 str:v18];
  return v4;
}

- (id)testPLAPIAccounting_CreateQualificationEventInterval:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    id v36 = self;
    id v37 = v4;
    if (v7 >= 1)
    {
      uint64_t v23 = MEMORY[0x1E4F1CBF0];
      do
      {
        id v24 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v36, v37);
        id v25 = [v24 dateByAddingTimeInterval:-5.0];

        id v26 = [MEMORY[0x1E4F92900] debugInstance];
        id v27 = [v25 dateByAddingTimeInterval:-10.0];
        [v26 createQualificationEventIntervalWithQualificationID:12 withChildNodeNames:&unk_1F29EFF80 withStartDate:v27 withEndDate:v25];

        id v28 = [MEMORY[0x1E4F92900] debugInstance];
        id v29 = [v25 dateByAddingTimeInterval:-10.0];
        [v28 createQualificationEventIntervalWithQualificationID:12 withChildNodeNames:v23 withStartDate:v29 withEndDate:v25];

        id v30 = [MEMORY[0x1E4F92900] debugInstance];
        [v30 createQualificationEventIntervalWithQualificationID:12 withChildNodeNames:&unk_1F29EFF98 withStartDate:0 withEndDate:v25];

        id v31 = [MEMORY[0x1E4F92900] debugInstance];
        id v32 = [v25 dateByAddingTimeInterval:-10.0];
        [v31 createQualificationEventIntervalWithQualificationID:12 withChildNodeNames:&unk_1F29EFFB0 withStartDate:v32 withEndDate:0];

        --v7;
      }
      while (v7);
    }
    uint64_t v21 = @"CreateQualificationEventInterval (negative) passed.";
    uint64_t v22 = v36;
    id v4 = v37;
    goto LABEL_12;
  }
  if (v7 >= 1)
  {
    do
    {
      int v13 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v14 = [v13 dateByAddingTimeInterval:-5.0];

      double v15 = [MEMORY[0x1E4F92900] debugInstance];
      double v16 = [v14 dateByAddingTimeInterval:-10.0];
      [v15 createQualificationEventIntervalWithQualificationID:12 withChildNodeNames:&unk_1F29EFF68 withStartDate:v16 withEndDate:v14];

      --v7;
    }
    while (v7);
  }
  if (v10)
  {
    double v17 = [MEMORY[0x1E4F92AD0] sharedCore];
    int v18 = [v17 storage];
    [v18 blockingFlushCachesWithReason:@"testAPI"];
  }
  uint64_t v19 = [(PLDebugService *)self accDS];
  int v20 = [v19 verifyLastQualificationEventWithQualificationID:12 withNodeName:@"App2"];

  if (v20)
  {
    uint64_t v21 = @"CreateQualificationEventInterval passed.";
    uint64_t v22 = self;
LABEL_12:
    id v33 = -[PLDebugService test_LogPass:str:](v22, "test_LogPass:str:", v4, v21, v36, v37);
    goto LABEL_14;
  }
  id v34 = [(PLDebugService *)self test_LogErr:v4 str:@"CreateQualificationEventInterval failed."];
LABEL_14:
  return v4;
}

- (id)testPLAPIAccounting_CreateQualificationEventPoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  uint64_t v7 = [v6 longValue];

  int v8 = [v4 objectForKeyedSubscript:@"objT"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"flush"];
  char v10 = [v9 BOOLValue];

  int v11 = [v4 objectForKeyedSubscript:@"objT"];
  double v12 = [v11 objectForKeyedSubscript:@"validity"];
  LODWORD(v9) = [v12 intValue];

  if (v9 == -1)
  {
    if (v7 >= 1)
    {
      id v30 = self;
      uint64_t v20 = MEMORY[0x1E4F1CBF0];
      do
      {
        uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v22 = [v21 dateByAddingTimeInterval:-5.0];

        uint64_t v23 = [MEMORY[0x1E4F92900] debugInstance];
        id v24 = [v22 dateByAddingTimeInterval:-10.0];
        [v23 createQualificationEventPointWithQualificationID:0 withChildNodeNames:&unk_1F29EFFE0 withStartDate:v24];

        id v25 = [MEMORY[0x1E4F92900] debugInstance];
        id v26 = [v22 dateByAddingTimeInterval:-10.0];
        [v25 createQualificationEventPointWithQualificationID:0 withChildNodeNames:v20 withStartDate:v26];

        id v27 = [MEMORY[0x1E4F92900] debugInstance];
        [v27 createQualificationEventPointWithQualificationID:0 withChildNodeNames:&unk_1F29EFFF8 withStartDate:0];

        --v7;
      }
      while (v7);
      self = v30;
    }
    uint64_t v19 = @"CreateQualificationEventPoint (negative) passed.";
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        int v13 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v14 = [v13 dateByAddingTimeInterval:-5.0];

        double v15 = [MEMORY[0x1E4F92900] debugInstance];
        double v16 = [v14 dateByAddingTimeInterval:-10.0];
        [v15 createQualificationEventPointWithQualificationID:0 withChildNodeNames:&unk_1F29EFFC8 withStartDate:v16];

        --v7;
      }
      while (v7);
    }
    if (v10)
    {
      double v17 = [MEMORY[0x1E4F92AD0] sharedCore];
      int v18 = [v17 storage];
      [v18 blockingFlushCachesWithReason:@"testAPI"];
    }
    uint64_t v19 = @"CreateQualificationEventPoint passed.";
  }
  id v28 = [(PLDebugService *)self test_LogPass:v4 str:v19];
  return v4;
}

- (id)testPLAPIAccounting_ExistingTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"objT"];
  id v6 = [v5 objectForKeyedSubscript:@"iterations"];
  [v6 longValue];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"objT"];
  int v8 = [v7 objectForKeyedSubscript:@"flush"];
  LODWORD(v6) = [v8 BOOLValue];

  if (v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F92AD0] sharedCore];
    char v10 = [v9 storage];
    [v10 blockingFlushCachesWithReason:@"testAPI"];
  }
  id v11 = [(PLDebugService *)self test_LogPass:v4 str:@"CreateQualificationEventPoint passed."];
  return v4;
}

- (void)constructTrimQueries
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v3 = [MEMORY[0x1E4F929B8] allOperatorTablesToTrimConditionsForTrimDate:v2];
  id v4 = [NSString stringWithFormat:@"Trim Queries %@", v3];
  uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
  id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v7 = [v6 lastPathComponent];
  int v8 = [NSString stringWithUTF8String:"-[PLDebugService constructTrimQueries]"];
  [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1977];

  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (void)constructAppIdentifierTables
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v3 = [MEMORY[0x1E4F92AD0] sharedCore];
  id v4 = [v3 agents];
  uint64_t v5 = [v4 operators];
  id v6 = [v5 allValues];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        char v10 = [*(id *)(*((void *)&v29 + 1) + 8 * i) entryKeys];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * j);
              double v16 = [MEMORY[0x1E4F929D8] definitionForEntryKey:v15];
              if ([MEMORY[0x1E4F929D8] hasAppIdentifierKeysForEntryDefinition:v16]) {
                [v2 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
          }
          while (v12);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v8);
  }

  double v17 = [NSString stringWithFormat:@"App identifier tables are %@", v2];
  int v18 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v20 = [v19 lastPathComponent];
  uint64_t v21 = [NSString stringWithUTF8String:"-[PLDebugService constructAppIdentifierTables]"];
  [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:1997];

  uint64_t v22 = PLLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v17;
    _os_log_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (void)constructDMATables
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v3 = [MEMORY[0x1E4F92AD0] sharedCore];
  id v4 = [v3 agents];
  uint64_t v5 = [v4 operators];
  id v6 = [v5 allValues];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(obj);
        }
        char v10 = [*(id *)(*((void *)&v24 + 1) + 8 * i) entryKeys];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * j);
              double v16 = [MEMORY[0x1E4F929D8] definitionForEntryKey:v15];
              if ([MEMORY[0x1E4F929D8] hasDMAKeysForEntryDefinition:v16]) {
                [v2 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
          }
          while (v12);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v8);
  }

  double v17 = PLLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v29 = v2;
    _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "DMA tables are %@", buf, 0xCu);
  }
}

- (void)populateIdentifiers:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    unint64_t v7 = 0x1E4F92000uLL;
    id v21 = v3;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * v8);
        char v10 = (void *)MEMORY[0x1D942A350]();
        uint64_t v11 = [*(id *)(v7 + 2624) sharedSQLiteConnection];
        int v12 = [v11 tableExistsForTableName:v9];

        if (v12)
        {
          uint64_t v13 = [MEMORY[0x1E4F929D8] definitionForEntryKey:v9];
          if ([MEMORY[0x1E4F929D8] hasAppIdentifierKeysForEntryDefinition:v13])
          {
            uint64_t v14 = objc_opt_new();
            uint64_t v15 = objc_opt_new();
            double v16 = objc_opt_new();
            double v17 = [MEMORY[0x1E4F929D8] keyConfigsForEntryDefinition:v13];
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __38__PLDebugService_populateIdentifiers___block_invoke;
            v22[3] = &unk_1E69312A8;
            id v18 = v14;
            id v23 = v18;
            id v19 = v15;
            id v24 = v19;
            id v20 = v16;
            id v25 = v20;
            [v17 enumerateKeysAndObjectsUsingBlock:v22];
            if ([v18 count]) {
              [(id)qword_1EBD5A820 setObject:v18 forKeyedSubscript:v9];
            }
            if ([v19 count]) {
              [(id)qword_1EBD5A828 setObject:v19 forKeyedSubscript:v9];
            }
            if ([v20 count]) {
              [(id)qword_1EBD5A830 setObject:v20 forKeyedSubscript:v9];
            }

            id v3 = v21;
            unint64_t v7 = 0x1E4F92000;
          }
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v5);
  }
}

void __38__PLDebugService_populateIdentifiers___block_invoke(id *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F92C38]];
  int v7 = [v6 BOOLValue];

  if (v7) {
    [a1[4] addObject:v12];
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F92C10]];
  int v9 = [v8 BOOLValue];

  if (v9) {
    [a1[5] addObject:v12];
  }
  char v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F92CC8]];
  int v11 = [v10 BOOLValue];

  if (v11) {
    [a1[6] addObject:v12];
  }
}

- (void)iterateAgents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(MEMORY[0x1E4F92AD0], "sharedCore", 0);
  uint64_t v4 = [v3 agents];
  id v5 = [v4 operators];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) entryKeys];
        [(PLDebugService *)self populateIdentifiers:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)iterateServices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(MEMORY[0x1E4F92AD0], "sharedCore", 0);
  uint64_t v4 = [v3 services];
  id v5 = [v4 operators];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) entryKeys];
        [(PLDebugService *)self populateIdentifiers:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)constructAppIdentifierColumns
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = (void *)qword_1EBD5A820;
  qword_1EBD5A820 = v3;

  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = (void *)qword_1EBD5A828;
  qword_1EBD5A828 = v5;

  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v8 = (void *)qword_1EBD5A830;
  qword_1EBD5A830 = v7;

  [(PLDebugService *)self iterateAgents];
  [(PLDebugService *)self iterateServices];
  [(id)qword_1EBD5A820 setObject:&unk_1F29F0010 forKeyedSubscript:@"PLAccountingOperator_EventNone_Nodes"];
  uint64_t v9 = [NSString stringWithFormat:@"tableNameToBundleIdentifier is %@", qword_1EBD5A820];
  uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
  int v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  long long v12 = [v11 lastPathComponent];
  long long v13 = [NSString stringWithUTF8String:"-[PLDebugService constructAppIdentifierColumns]"];
  [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:2086];

  long long v14 = PLLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v28 = v9;
    _os_log_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  long long v15 = [NSString stringWithFormat:@"tableNameToAppIdentifier is %@", qword_1EBD5A828];
  double v16 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v18 = [v17 lastPathComponent];
  id v19 = [NSString stringWithUTF8String:"-[PLDebugService constructAppIdentifierColumns]"];
  [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:2087];

  id v20 = PLLogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v28 = v15;
    _os_log_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v21 = [NSString stringWithFormat:@"tableNameToProcessIdentifier is %@", qword_1EBD5A830];
  long long v22 = (void *)MEMORY[0x1E4F929B8];
  id v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v24 = [v23 lastPathComponent];
  id v25 = [NSString stringWithUTF8String:"-[PLDebugService constructAppIdentifierColumns]"];
  [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:2088];

  long long v26 = PLLogCommon();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v28 = v21;
    _os_log_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (void)aggregateDataFromSignpost
{
  id v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "Manually aggregate data from Signpost", v3, 2u);
  }

  [MEMORY[0x1E4F929C8] logAggregatedDataFromSignpostWithStartDate:0 withEndDate:0];
}

- (void)fireSignificantBatteryChangeNotification
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEFAULT, "Manually firing SBC", v5, 2u);
  }

  [MEMORY[0x1E4F92A88] postNotificationName:@"PLBatteryAgent_EventBackward_Battery.filtered.Level_0_1.Level_7_1800.Level_8_300" object:self userInfo:v3];
}

- (void)testCompression
{
  id v2 = [(PLOperator *)self workQueue];
  dispatch_async(v2, &__block_literal_global_1026);
}

void __33__PLDebugService_testCompression__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unsigned int v0 = [MEMORY[0x1E4F92A88] compressWithSource:@"/tmp/test.txt" withDestination:@"/tmp/test_out.gz" withLevel:4];
  v1 = objc_msgSend(NSString, "stringWithFormat:", @"compression result=%i", v0);
  id v2 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v4 = [v3 lastPathComponent];
  uint64_t v5 = [NSString stringWithUTF8String:"-[PLDebugService testCompression]_block_invoke"];
  [v2 logMessage:v1 fromFile:v4 fromFunction:v5 fromLineNumber:2114];

  uint64_t v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v1;
    _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testUTF8
{
  uint64_t v3 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__PLDebugService_testUTF8__block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  dispatch_async(v3, block);
}

void __26__PLDebugService_testUTF8__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"begin"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService testUTF8]_block_invoke"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2120];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412290;
    id v18 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v17, 0xCu);
  }

  id v8 = objc_alloc(MEMORY[0x1E4F929D0]);
  uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Test"];
  uint64_t v10 = (void *)[v8 initWithEntryKey:v9];

  [v10 setObject:@"MyEuro=€" forKeyedSubscript:@"StringKey1"];
  [v10 setObject:@"test" forKeyedSubscript:@"StringKey2"];
  [v10 setObject:&unk_1F29EB6D8 forKeyedSubscript:@"DefaultKey1"];
  [*(id *)(a1 + 32) logEntry:v10];
  int v11 = [NSString stringWithFormat:@"end"];
  long long v12 = (void *)MEMORY[0x1E4F929B8];
  long long v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  long long v14 = [v13 lastPathComponent];
  long long v15 = [NSString stringWithUTF8String:"-[PLDebugService testUTF8]_block_invoke"];
  [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:2129];

  double v16 = PLLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412290;
    id v18 = v11;
    _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v17, 0xCu);
  }
}

- (void)stressAggregateSmall
{
  id v2 = [(PLOperator *)self workQueue];
  dispatch_async(v2, &__block_literal_global_1064);
}

void __38__PLDebugService_stressAggregateSmall__block_invoke()
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unsigned int v0 = [NSString stringWithFormat:@"begin"];
  v1 = (void *)MEMORY[0x1E4F929B8];
  id v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v3 = [v2 lastPathComponent];
  uint64_t v4 = [NSString stringWithUTF8String:"-[PLDebugService stressAggregateSmall]_block_invoke"];
  [v1 logMessage:v0 fromFile:v3 fromFunction:v4 fromLineNumber:2135];

  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v29 = 138412290;
    long long v30 = v0;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v29, 0xCu);
  }

  uint64_t v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AggregateTestSmall"];
  uint64_t v7 = [MEMORY[0x1E4F92AD0] sharedCore];
  id v8 = [v7 storage];
  [v8 deleteAllEntriesForKey:v6];

  uint64_t v9 = 0;
  do
  {
    id v10 = objc_alloc(MEMORY[0x1E4F929D0]);
    int v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    long long v12 = (void *)[v10 initWithEntryKey:v6 withDate:v11];

    long long v13 = [NSNumber numberWithInt:(unsigned __int16)v9 / 0x96u];
    [v12 setObject:v13 forKeyedSubscript:@"PrimaryKey1"];

    [v12 setObject:@"TestKey" forKeyedSubscript:@"PrimaryKey2"];
    [v12 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField"];
    [v12 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField2"];
    long long v14 = [MEMORY[0x1E4F92AD0] sharedCore];
    long long v15 = [v14 storage];
    [v15 writeAggregateEntry:v12];

    id v16 = objc_alloc(MEMORY[0x1E4F929D0]);
    int v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    id v18 = (void *)[v16 initWithEntryKey:@"PLDisplayAgent_EventForward_Display" withDate:v17];

    uint64_t v19 = [NSNumber numberWithInt:v9];
    [v18 setObject:v19 forKeyedSubscript:@"Brightness"];

    id v20 = [MEMORY[0x1E4F92AD0] sharedCore];
    [v20 storage];
    long long v22 = v21 = (void *)v6;
    [v22 writeEntry:v18 withCompletionBlock:0];

    uint64_t v6 = (uint64_t)v21;
    uint64_t v9 = (v9 + 1);
  }
  while (v9 != 15000);
  id v23 = [NSString stringWithFormat:@"end"];
  id v24 = (void *)MEMORY[0x1E4F929B8];
  id v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  long long v26 = [v25 lastPathComponent];
  long long v27 = [NSString stringWithUTF8String:"-[PLDebugService stressAggregateSmall]_block_invoke"];
  [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:2162];

  long long v28 = PLLogCommon();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    int v29 = 138412290;
    long long v30 = v23;
    _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v29, 0xCu);
  }
}

- (void)stressAggregateVerySmall
{
  id v2 = [(PLOperator *)self workQueue];
  dispatch_async(v2, &__block_literal_global_1075);
}

void __42__PLDebugService_stressAggregateVerySmall__block_invoke()
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unsigned int v0 = [NSString stringWithFormat:@"begin"];
  v1 = (void *)MEMORY[0x1E4F929B8];
  id v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v3 = [v2 lastPathComponent];
  uint64_t v4 = [NSString stringWithUTF8String:"-[PLDebugService stressAggregateVerySmall]_block_invoke"];
  [v1 logMessage:v0 fromFile:v3 fromFunction:v4 fromLineNumber:2168];

  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 138412290;
    int v29 = v0;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v28, 0xCu);
  }

  uint64_t v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AggregateTestVerySmall"];
  uint64_t v7 = [MEMORY[0x1E4F92AD0] sharedCore];
  id v8 = [v7 storage];
  [v8 deleteAllEntriesForKey:v6];

  uint64_t v9 = 0;
  do
  {
    id v10 = objc_alloc(MEMORY[0x1E4F929D0]);
    int v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    long long v12 = (void *)[v10 initWithEntryKey:v6 withDate:v11];

    long long v13 = [NSNumber numberWithInt:(unsigned __int16)v9 / 0x96u];
    [v12 setObject:v13 forKeyedSubscript:@"PrimaryKey1"];

    [v12 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField"];
    long long v14 = [MEMORY[0x1E4F92AD0] sharedCore];
    long long v15 = [v14 storage];
    [v15 writeAggregateEntry:v12];

    id v16 = objc_alloc(MEMORY[0x1E4F929D0]);
    int v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    id v18 = (void *)[v16 initWithEntryKey:@"PLDisplayAgent_EventForward_Display" withDate:v17];

    uint64_t v19 = [NSNumber numberWithInt:v9];
    [v18 setObject:v19 forKeyedSubscript:@"Brightness"];

    id v20 = [MEMORY[0x1E4F92AD0] sharedCore];
    id v21 = [v20 storage];
    [v21 writeEntry:v18 withCompletionBlock:0];

    uint64_t v9 = (v9 + 1);
  }
  while (v9 != 15000);
  long long v22 = [NSString stringWithFormat:@"end"];
  id v23 = (void *)MEMORY[0x1E4F929B8];
  id v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v25 = [v24 lastPathComponent];
  long long v26 = [NSString stringWithUTF8String:"-[PLDebugService stressAggregateVerySmall]_block_invoke"];
  [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:2193];

  long long v27 = PLLogCommon();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 138412290;
    int v29 = v22;
    _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v28, 0xCu);
  }
}

- (void)testExit
{
  id v2 = [(PLOperator *)self workQueue];
  dispatch_async(v2, &__block_literal_global_1077);
}

uint64_t __26__PLDebugService_testExit__block_invoke()
{
  return [MEMORY[0x1E4F92A88] exitWithReason:2];
}

- (void)testQuarantineExit
{
  id v2 = [(PLOperator *)self workQueue];
  dispatch_async(v2, &__block_literal_global_1079);
}

uint64_t __36__PLDebugService_testQuarantineExit__block_invoke()
{
  return [MEMORY[0x1E4F92A88] exitWithReason:1006];
}

- (void)testBlockingFlushCaches
{
  uint64_t v3 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PLDebugService_testBlockingFlushCaches__block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  dispatch_async(v3, block);
}

void __41__PLDebugService_testBlockingFlushCaches__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) storage];
  [v1 blockingFlushCachesWithReason:@"PLDebugService"];
}

- (void)stressMonotonicTimer
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D942A350](self, a2);
  unint64_t v3 = 0x1E4F1C000uLL;
  int v29 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v4 = [NSString stringWithFormat:@"PLDebugService::stressMonotonicTimer: begin"];
  uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v7 = [v6 lastPathComponent];
  id v8 = [NSString stringWithUTF8String:"-[PLDebugService stressMonotonicTimer]"];
  [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:2218];

  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = v4;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F1CA48] array];
  int v11 = 10;
  do
  {
    long long v12 = (void *)MEMORY[0x1E4F92A18];
    long long v13 = [*(id *)(v3 + 2504) monotonicDateWithTimeIntervalSinceNow:5.0];
    long long v14 = [(PLOperator *)self workQueue];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __38__PLDebugService_stressMonotonicTimer__block_invoke;
    v34[3] = &unk_1E692B308;
    id v15 = v29;
    id v35 = v15;
    [v12 debugScheduledTimerWithMonotonicFireDate:v13 withInterval:v14 withQueue:v34 withBlock:0.0];
    int v17 = v16 = v3;

    [v10 addObject:v17];
    dispatch_time_t v18 = dispatch_time(0, 2000000000);
    uint64_t v19 = [(PLOperator *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PLDebugService_stressMonotonicTimer__block_invoke_1091;
    block[3] = &unk_1E692B128;
    id v20 = v15;
    id v32 = v20;
    id v33 = v17;
    id v21 = v17;
    unint64_t v3 = v16;
    id v22 = v21;
    dispatch_after(v18, v19, block);

    sleep(3u);
    --v11;
  }
  while (v11);
  id v23 = [NSString stringWithFormat:@"PLDebugService::stressMonotonicTimer: end"];
  id v24 = (void *)MEMORY[0x1E4F929B8];
  id v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  long long v26 = [v25 lastPathComponent];
  long long v27 = [NSString stringWithUTF8String:"-[PLDebugService stressMonotonicTimer]"];
  [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:2241];

  int v28 = PLLogCommon();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = v23;
    _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

void __38__PLDebugService_stressMonotonicTimer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = NSString;
  [a2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v4 = objc_msgSend(v2, "stringWithFormat:", @"PLDebugService::stressMonotonicTimer: *********fired********* at now=%f", v3);
  uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v7 = [v6 lastPathComponent];
  id v8 = [NSString stringWithUTF8String:"-[PLDebugService stressMonotonicTimer]_block_invoke"];
  [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:2228];

  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    int v11 = v4;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

void __38__PLDebugService_stressMonotonicTimer__block_invoke_1091(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = NSString;
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v5 = objc_msgSend(v2, "stringWithFormat:", @"PLDebugService::stressMonotonicTimer: reschedule at now=%f", v4);

  uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v8 = [v7 lastPathComponent];
  uint64_t v9 = [NSString stringWithUTF8String:"-[PLDebugService stressMonotonicTimer]_block_invoke"];
  [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:2234];

  id v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v13 = v5;
    _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  int v11 = [MEMORY[0x1E4F1C9C8] monotonicDateWithTimeIntervalSinceNow:2.0];
  [*(id *)(a1 + 40) setMonotonicFireDate:v11];
}

- (void)stressMonotonicTimer2
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D942A350](self, a2);
  id v21 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v2 = [NSString stringWithFormat:@"PLDebugService::stressMonotonicTimer2: begin"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService stressMonotonicTimer2]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2248];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v27 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  id v8 = 0;
  int v9 = 10;
  do
  {
    id v10 = v8;
    int v11 = (void *)MEMORY[0x1E4F92A18];
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] monotonicDateWithTimeIntervalSinceNow:5.0];
    long long v13 = [(PLOperator *)self workQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __39__PLDebugService_stressMonotonicTimer2__block_invoke;
    void v24[3] = &unk_1E692B308;
    id v14 = v21;
    id v25 = v14;
    id v8 = [v11 debugScheduledTimerWithMonotonicFireDate:v12 withInterval:v13 withQueue:v24 withBlock:0.0];

    sleep(1u);
    --v9;
  }
  while (v9);
  id v15 = [NSString stringWithFormat:@"PLDebugService::stressMonotonicTimer2: end"];
  unint64_t v16 = (void *)MEMORY[0x1E4F929B8];
  int v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  dispatch_time_t v18 = [v17 lastPathComponent];
  uint64_t v19 = [NSString stringWithUTF8String:"-[PLDebugService stressMonotonicTimer2]"];
  [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:2263];

  id v20 = PLLogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v27 = v15;
    _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

void __39__PLDebugService_stressMonotonicTimer2__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = NSString;
  [a2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v4 = objc_msgSend(v2, "stringWithFormat:", @"PLDebugService::stressMonotonicTimer2: *********fired********* at now=%f", v3);
  uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v7 = [v6 lastPathComponent];
  id v8 = [NSString stringWithUTF8String:"-[PLDebugService stressMonotonicTimer2]_block_invoke"];
  [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:2258];

  int v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    int v11 = v4;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)stressMonotonicTimer3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D942A350](self, a2);
  id v20 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v2 = [NSString stringWithFormat:@"PLDebugService::stressMonotonicTimer3: begin"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService stressMonotonicTimer3]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2270];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v26 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  int v8 = 10;
  do
  {
    int v9 = (void *)MEMORY[0x1E4F92A18];
    id v10 = [MEMORY[0x1E4F1C9C8] monotonicDateWithTimeIntervalSinceNow:3.0];
    int v11 = [(PLOperator *)self workQueue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __39__PLDebugService_stressMonotonicTimer3__block_invoke;
    v23[3] = &unk_1E692B308;
    id v12 = v20;
    id v24 = v12;
    long long v13 = [v9 debugScheduledTimerWithMonotonicFireDate:v10 withInterval:v11 withQueue:v23 withBlock:3.0];

    sleep(1u);
    sleep(1u);

    --v8;
  }
  while (v8);
  id v14 = [NSString stringWithFormat:@"PLDebugService::stressMonotonicTimer3: end"];
  id v15 = (void *)MEMORY[0x1E4F929B8];
  unint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  int v17 = [v16 lastPathComponent];
  dispatch_time_t v18 = [NSString stringWithUTF8String:"-[PLDebugService stressMonotonicTimer3]"];
  [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:2287];

  uint64_t v19 = PLLogCommon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v26 = v14;
    _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

void __39__PLDebugService_stressMonotonicTimer3__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = NSString;
  [a2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v4 = objc_msgSend(v2, "stringWithFormat:", @"PLDebugService::stressMonotonicTimer3: *********fired********* at now=%f", v3);
  uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v7 = [v6 lastPathComponent];
  int v8 = [NSString stringWithUTF8String:"-[PLDebugService stressMonotonicTimer3]_block_invoke"];
  [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:2280];

  int v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    int v11 = v4;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testMonotonicTimerThroughSleep
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v4 timeIntervalSince1970];
  uint64_t v6 = objc_msgSend(v3, "stringWithFormat:", @"PLDebugService::testMonotonicTimerThroughSleep: begin at now=%f", v5);

  uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
  int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  int v9 = [v8 lastPathComponent];
  id v10 = [NSString stringWithUTF8String:"-[PLDebugService testMonotonicTimerThroughSleep]"];
  [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:2293];

  int v11 = PLLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v12 = (void *)MEMORY[0x1E4F92A18];
  long long v13 = [MEMORY[0x1E4F1C9C8] monotonicDateWithTimeIntervalSinceNow:60.0];
  id v14 = [(PLOperator *)self workQueue];
  uint64_t v15 = [v12 debugScheduledTimerWithMonotonicFireDate:v13 withInterval:v14 withQueue:&__block_literal_global_1120 withBlock:300.0];
  unint64_t v16 = (void *)monotonicTimer;
  monotonicTimer = v15;

  int v17 = [NSString stringWithFormat:@"PLDebugService::testMonotonicTimerThroughSleep: end"];
  dispatch_time_t v18 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v20 = [v19 lastPathComponent];
  id v21 = [NSString stringWithUTF8String:"-[PLDebugService testMonotonicTimerThroughSleep]"];
  [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:2300];

  id v22 = PLLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v17;
    _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

void __48__PLDebugService_testMonotonicTimerThroughSleep__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = NSString;
  [a2 timeIntervalSince1970];
  uint64_t v4 = objc_msgSend(v2, "stringWithFormat:", @"PLDebugService::testMonotonicTimerThroughSleep: *********fired********* at now=%f", v3);
  uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v7 = [v6 lastPathComponent];
  int v8 = [NSString stringWithUTF8String:"-[PLDebugService testMonotonicTimerThroughSleep]_block_invoke"];
  [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:2298];

  int v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    int v11 = v4;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)stressActivityScheduler
{
  v33[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [NSString stringWithFormat:@"PLDebugService::stressActivityScheduler: begin"];
  uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLDebugService stressActivityScheduler]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:2304];

  int v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
  }

  int v9 = [MEMORY[0x1E4F92978] timeCriterionWithInterval:60.0];
  v33[0] = v9;
  id v10 = [MEMORY[0x1E4F92970] pluggedInCriterion];
  v33[1] = v10;
  int v11 = [MEMORY[0x1E4F92970] displayOffCriterion];
  v33[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__16;
  uint64_t v31 = __Block_byref_object_dispose__16;
  id v32 = @"PLDebugService::scheduler";
  long long v13 = [MEMORY[0x1E4F92980] sharedInstance];
  uint64_t v14 = *(void *)(*((void *)&buf + 1) + 40);
  uint64_t v15 = [MEMORY[0x1E4F92978] timeCriterionWithInterval:3600.0];
  unint64_t v16 = [(PLOperator *)self workQueue];
  [v13 scheduleActivityWithIdentifier:v14 withCriteria:v12 withMustRunCriterion:v15 withQueue:v16 withInterruptBlock:&__block_literal_global_1133 withActivityBlock:&__block_literal_global_1144];

  dispatch_time_t v17 = dispatch_time(0, 120000000000);
  dispatch_time_t v18 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PLDebugService_stressActivityScheduler__block_invoke_1152;
  block[3] = &unk_1E692ACB0;
  void block[4] = &buf;
  dispatch_after(v17, v18, block);

  uint64_t v19 = [NSString stringWithFormat:@"PLDebugService::stressActivityScheduler: end"];
  id v20 = (void *)MEMORY[0x1E4F929B8];
  id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v22 = [v21 lastPathComponent];
  id v23 = [NSString stringWithUTF8String:"-[PLDebugService stressActivityScheduler]"];
  [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:2340];

  id v24 = PLLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long v26 = 138412290;
    uint64_t v27 = v19;
    _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", v26, 0xCu);
  }

  _Block_object_dispose(&buf, 8);
}

void __41__PLDebugService_stressActivityScheduler__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unsigned int v0 = [NSString stringWithFormat:@"PLDebugService::scheduler interrupted!"];
  id v1 = (void *)MEMORY[0x1E4F929B8];
  id v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v3 = [v2 lastPathComponent];
  uint64_t v4 = [NSString stringWithUTF8String:"-[PLDebugService stressActivityScheduler]_block_invoke"];
  [v1 logMessage:v0 fromFile:v3 fromFunction:v4 fromLineNumber:2315];

  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    uint64_t v7 = v0;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v6, 0xCu);
  }
}

void __41__PLDebugService_stressActivityScheduler__block_invoke_1141()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int v0 = [NSString stringWithFormat:@"PLDebugService::stressActivityScheduler: BLOCK begin"];
  id v1 = (void *)MEMORY[0x1E4F929B8];
  id v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v3 = [v2 lastPathComponent];
  uint64_t v4 = [NSString stringWithUTF8String:"-[PLDebugService stressActivityScheduler]_block_invoke"];
  [v1 logMessage:v0 fromFile:v3 fromFunction:v4 fromLineNumber:2326];

  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v19 = v0;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  uint64_t v8 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PLDebugService_stressActivityScheduler__block_invoke_1148;
  block[3] = &unk_1E692A250;
  int v9 = v6;
  dispatch_time_t v17 = v9;
  dispatch_after(v7, v8, block);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = [NSString stringWithFormat:@"PLDebugService::stressActivityScheduler: BLOCK end"];
  int v11 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  long long v13 = [v12 lastPathComponent];
  uint64_t v14 = [NSString stringWithUTF8String:"-[PLDebugService stressActivityScheduler]_block_invoke_2"];
  [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:2332];

  uint64_t v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v19 = v10;
    _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

intptr_t __41__PLDebugService_stressActivityScheduler__block_invoke_1148(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __41__PLDebugService_stressActivityScheduler__block_invoke_1152(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F92980] sharedInstance];
  [v2 cancelActivityWithIdentifier:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (void)currentBasebandTime
{
  id v2 = [(PLOperator *)self workQueue];
  dispatch_async(v2, &__block_literal_global_1157);
}

void __37__PLDebugService_currentBasebandTime__block_invoke()
{
  id v1 = [MEMORY[0x1E4F92A78] sharedInstance];
  id v0 = (id)[v1 currentTimeFromTimeReference:3 toTimeReference:3];
}

- (void)stressMidnightCalculation
{
  id v2 = [(PLOperator *)self workQueue];
  dispatch_async(v2, &__block_literal_global_1160);
}

void __43__PLDebugService_stressMidnightCalculation__block_invoke()
{
  v36[6] = *MEMORY[0x1E4F143B8];
  id v0 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1414915200.0];
  v36[0] = v0;
  id v1 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1414918800.0];
  v36[1] = v1;
  id v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1414922400.0];
  v36[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1425805200.0];
  void v36[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1425808800.0];
  v36[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1425812400.0];
  v36[5] = v5;
  dispatch_semaphore_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:6];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v28 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        int v11 = [MEMORY[0x1E4F1C9C8] nearestMidnightBeforeDate:v10];
        [v11 timeIntervalSinceDate:v10];
        if (v12 > 0.0)
        {
          long long v13 = [NSString stringWithFormat:@"Error: d=%@, previousMidnight=%@", v10, v11];
          uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
          unint64_t v16 = [v15 lastPathComponent];
          dispatch_time_t v17 = [NSString stringWithUTF8String:"-[PLDebugService stressMidnightCalculation]_block_invoke"];
          [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:2368];

          dispatch_time_t v18 = PLLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            id v34 = v13;
            _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
        uint64_t v19 = [MEMORY[0x1E4F1C9C8] nearestMidnightAfterDate:v10];
        [v19 timeIntervalSinceDate:v10];
        if (v20 < 0.0)
        {
          id v21 = [NSString stringWithFormat:@"Error: d=%@, nextMidnight=%@", v10, v11];
          id v22 = (void *)MEMORY[0x1E4F929B8];
          id v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
          id v24 = [v23 lastPathComponent];
          uint64_t v25 = [NSString stringWithUTF8String:"-[PLDebugService stressMidnightCalculation]_block_invoke"];
          [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:2373];

          long long v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            id v34 = v21;
            _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }
}

- (void)stressCacheSmall
{
  uint64_t v3 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PLDebugService_stressCacheSmall__block_invoke;
  block[3] = &unk_1E692A250;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __34__PLDebugService_stressCacheSmall__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v1 = [NSString stringWithFormat:@"stressCacheSmall::begin"];
  id v2 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v4 = [v3 lastPathComponent];
  uint64_t v5 = [NSString stringWithUTF8String:"-[PLDebugService stressCacheSmall]_block_invoke"];
  [v2 logMessage:v1 fromFile:v4 fromFunction:v5 fromLineNumber:2381];

  dispatch_semaphore_t v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v26 = v1;
    _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AggregateTestSmall"];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  for (int i = 0; i != 5000; ++i)
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)((unsigned __int16)i / 0x1F4u) * 3600.0 + 1.0];
    int v11 = (void *)v7;
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withDate:v10];
    [v12 setObject:@"TestApp" forKeyedSubscript:@"PrimaryKey1"];
    [v12 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField"];
    [v8 addObject:v12];

    uint64_t v7 = (uint64_t)v11;
  }
  long long v13 = *(void **)(a1 + 32);
  id v23 = v11;
  id v24 = v8;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  [v13 logEntries:v14 withGroupID:v11];

  uint64_t v15 = [*(id *)(a1 + 32) storage];
  [v15 flushCachesWithReason:@"debug stressCache"];

  unint64_t v16 = [NSString stringWithFormat:@"stressCacheSmall::end"];
  dispatch_time_t v17 = (void *)MEMORY[0x1E4F929B8];
  dispatch_time_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v19 = [v18 lastPathComponent];
  double v20 = [NSString stringWithUTF8String:"-[PLDebugService stressCacheSmall]_block_invoke"];
  [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:2401];

  id v21 = PLLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v26 = v16;
    _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)stressCache
{
  uint64_t v3 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PLDebugService_stressCache__block_invoke;
  block[3] = &unk_1E692A250;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __29__PLDebugService_stressCache__block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v1 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AggregateTest"];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = 1;
  do
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v1];
    [v4 setObject:@"TestApp" forKeyedSubscript:@"PrimaryKey1"];
    [v4 setObject:@"TestApp2" forKeyedSubscript:@"PrimaryKey2"];
    uint64_t v5 = [NSNumber numberWithInt:v3];
    [v4 setObject:v5 forKeyedSubscript:@"SumField"];

    [v2 addObject:v4];
    uint64_t v3 = (v3 + 1);
  }
  while (v3 != 11);
  dispatch_semaphore_t v6 = *(void **)(a1 + 32);
  uint64_t v10 = v1;
  v11[0] = v2;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v6 logEntries:v7 withGroupID:v1];

  uint64_t v8 = [*(id *)(a1 + 32) storage];
  [v8 flushCachesWithReason:@"debug stressCache"];
}

- (void)stressSetObjectForKey
{
  id v2 = [(PLOperator *)self workQueue];
  dispatch_async(v2, &__block_literal_global_1183);
}

void __39__PLDebugService_stressSetObjectForKey__block_invoke()
{
  id v0 = (void *)MEMORY[0x1D942A350]();
  id v1 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:@"PLDebugService_Aggregate_AggregateTest"];
  int v2 = 10000000;
  do
  {
    [v1 setObject:&unk_1F29E7960 forKeyedSubscript:@"NumericalField"];
    --v2;
  }
  while (v2);
}

- (void)stressObjectForKey
{
  int v2 = [(PLOperator *)self workQueue];
  dispatch_async(v2, &__block_literal_global_1188);
}

void __36__PLDebugService_stressObjectForKey__block_invoke()
{
  id v0 = (void *)MEMORY[0x1D942A350]();
  id v1 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:@"PLDebugService_Aggregate_AggregateTest"];
  [v1 setObject:&unk_1F29E7960 forKeyedSubscript:@"NumericalField"];
  int v2 = 10000000;
  do
  {
    uint64_t v3 = [v1 objectForKeyedSubscript:@"NumericalField"];
    [v3 doubleValue];

    --v2;
  }
  while (v2);
}

- (void)stressPLEntry
{
  uint64_t v3 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PLDebugService_stressPLEntry__block_invoke;
  block[3] = &unk_1E692A250;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __31__PLDebugService_stressPLEntry__block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D942A350]();
  int v2 = objc_opt_new();
  uint64_t v3 = [NSString stringWithFormat:@"Filling Array of Entries"];
  unint64_t v4 = 0x1E4F92000uLL;
  uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
  dispatch_semaphore_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v7 = [v6 lastPathComponent];
  uint64_t v8 = [NSString stringWithUTF8String:"-[PLDebugService stressPLEntry]_block_invoke"];
  [v5 logMessage:v3 fromFile:v7 fromFunction:v8 fromLineNumber:2458];

  int v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v42 = v3;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  int v10 = 0;
  uint64_t v38 = a1;
  do
  {
    HIDWORD(v11) = -858993459 * (unsigned __int16)v10;
    LODWORD(v11) = HIDWORD(v11);
    if ((v11 >> 1) <= 0x19999999)
    {
      double v12 = v2;
      long long v13 = objc_msgSend(NSString, "stringWithFormat:", @"entries.count=%lu", objc_msgSend(v2, "count"));
      unint64_t v14 = v4;
      uint64_t v15 = *(void **)(v4 + 2488);
      unint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
      dispatch_time_t v17 = [v16 lastPathComponent];
      dispatch_time_t v18 = [NSString stringWithUTF8String:"-[PLDebugService stressPLEntry]_block_invoke"];
      [v15 logMessage:v13 fromFile:v17 fromFunction:v18 fromLineNumber:2460];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v42 = v13;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      unint64_t v4 = v14;
      int v2 = v12;
      a1 = v38;
    }
    double v20 = [*(id *)(a1 + 32) filledTestArrayEntry];
    [v2 addObject:v20];

    ++v10;
  }
  while (v10 != 10000);
  id v21 = [NSString stringWithFormat:@"Filled array of entries to count of %lu, sleeping for 10 seconds", objc_msgSend(v2, "count")];
  id v22 = *(void **)(v4 + 2488);
  id v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v24 = [v23 lastPathComponent];
  uint64_t v25 = [NSString stringWithUTF8String:"-[PLDebugService stressPLEntry]_block_invoke"];
  [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:2463];

  long long v26 = PLLogCommon();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v42 = v21;
    _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  sleep(0xAu);
  uint64_t v27 = [v2 objectAtIndexedSubscript:0];
  uint64_t v28 = [v27 entryKey];

  long long v29 = *(void **)(v38 + 32);
  v39 = v28;
  char v40 = v2;
  long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  [v29 logEntries:v30 withGroupID:v28];

  long long v31 = [NSString stringWithFormat:@"Logged and done!"];
  long long v32 = *(void **)(v4 + 2488);
  id v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v34 = [v33 lastPathComponent];
  id v35 = [NSString stringWithUTF8String:"-[PLDebugService stressPLEntry]_block_invoke"];
  [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:2467];

  id v36 = PLLogCommon();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v42 = v31;
    _os_log_debug_impl(&dword_1D2690000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)stressTimer
{
  int v2 = dispatch_get_global_queue(0, 0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__PLDebugService_stressTimer__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  long long v4 = xmmword_1D2B03390;
  dispatch_async(v2, v3);
}

void __29__PLDebugService_stressTimer__block_invoke(uint64_t a1)
{
  while (1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F92A80]);
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:*(double *)(a1 + 32)];
    double v4 = *(double *)(a1 + 32);
    uint64_t v5 = dispatch_get_global_queue(2, 0);
    uint64_t v6 = [v2 initWithFireDate:v3 withInterval:0 withTolerance:0 repeats:v5 withUserInfo:&__block_literal_global_1204 withQueue:v4 withBlock:0.0];
    uint64_t v7 = (void *)timer;
    timer = v6;

    sleep(*(double *)(a1 + 40));
  }
}

void __29__PLDebugService_stressTimer__block_invoke_2()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v0 = [NSString stringWithFormat:@"PLDebugService::stressTimer: timer fired, timer=%@", timer];
  id v1 = (void *)MEMORY[0x1E4F929B8];
  id v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v3 = [v2 lastPathComponent];
  double v4 = [NSString stringWithUTF8String:"-[PLDebugService stressTimer]_block_invoke_2"];
  [v1 logMessage:v0 fromFile:v3 fromFunction:v4 fromLineNumber:2485];

  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v7 = v0;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testDailyTasks
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"fire Daily Tasks"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService testDailyTasks]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2493];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    unint64_t v11 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = [MEMORY[0x1E4F92AD0] sharedCore];
  int v9 = [v8 storage];
  [v9 dailyTasks];
}

- (void)testArchive
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"PLDebugService::testArchive"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService testArchive]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2498];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    unint64_t v11 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = [MEMORY[0x1E4F92998] sharedInstance];
  int v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v8 runActivityWithLastCompletedDate:v9];
}

- (void)testTrimEPSQL
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"PLDebugService::testTrimEPSQL"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService testTrimEPSQL]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2503];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    int v10 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = [MEMORY[0x1E4F92998] sharedInstance];
  [v8 trimExtendedPersistenceLog];
}

- (void)testTrimCESQL
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"PLDebugService::testTrimCESQL"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService testTrimCESQL]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2508];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    int v10 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = [MEMORY[0x1E4F92998] sharedInstance];
  [v8 trimCleanEnergyLog];
}

- (void)testTrimXCSQL
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"PLDebugService::testTrimXCSQL"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService testTrimXCSQL]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2513];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    int v10 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = [MEMORY[0x1E4F92998] sharedInstance];
  [v8 trimXcodeOrganizerLog];
}

- (void)testTrimBGSQL
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"PLDebugService::testTrimBGSQL"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService testTrimBGSQL]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2518];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    int v10 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = [MEMORY[0x1E4F92998] sharedInstance];
  [v8 trimBackgroundProcessingLog];
}

- (id)filledTestArrayEntry
{
  id v2 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"ArrayTest"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v2];
  double v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = [v4 UUIDString];
  [v3 setObject:v5 forKeyedSubscript:@"RandomString"];

  uint64_t v6 = [NSNumber numberWithInt:rand()];
  [v3 setObject:v6 forKeyedSubscript:@"RandomNumber"];

  uint64_t v7 = objc_opt_new();
  int v8 = 10;
  do
  {
    int v9 = [NSNumber numberWithInt:rand()];
    [v7 addObject:v9];

    --v8;
  }
  while (v8);
  [v3 setObject:v7 forKeyedSubscript:@"StaticArrayType"];
  [v3 setObject:v7 forKeyedSubscript:@"DynamicArrayType"];

  return v3;
}

- (void)testABM
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"firing ABM tests"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService testABM]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2539];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v29 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  int v8 = NSString;
  int v9 = [MEMORY[0x1E4F92960] sharedABMClient];
  int v10 = [v9 getLTESleepManagerStats];
  uint64_t v11 = [v8 stringWithFormat:@"ABM LTE Sleep MGR stats = %@", v10];

  uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
  long long v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  unint64_t v14 = [v13 lastPathComponent];
  uint64_t v15 = [NSString stringWithUTF8String:"-[PLDebugService testABM]"];
  [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:2540];

  unint64_t v16 = PLLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v29 = v11;
    _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  dispatch_time_t v17 = [MEMORY[0x1E4F92960] sharedABMClient];
  dispatch_time_t v18 = [v17 getBasebandTimeAndLatency];

  uint64_t v19 = NSString;
  double v20 = [v18 time];
  [v18 latency];
  id v22 = [v19 stringWithFormat:@"ABM BB time = %@, latency = %f", v20, v21];

  id v23 = (void *)MEMORY[0x1E4F929B8];
  id v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v25 = [v24 lastPathComponent];
  long long v26 = [NSString stringWithUTF8String:"-[PLDebugService testABM]"];
  [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:2543];

  uint64_t v27 = PLLogCommon();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v29 = v22;
    _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testArray
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLDebugService *)self filledTestArrayEntry];
  double v4 = [NSString stringWithFormat:@"Test array!! entry=%@", v3];
  uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v7 = [v6 lastPathComponent];
  int v8 = [NSString stringWithUTF8String:"-[PLDebugService testArray]"];
  [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:2549];

  int v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    double v20 = v4;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  [(PLOperator *)self logEntry:v3];
  int v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"ArrayTest"];
  uint64_t v11 = [(PLOperator *)self storage];
  uint64_t v12 = [v11 lastEntryForKey:v10];

  long long v13 = [NSString stringWithFormat:@"Test array!! dbRead=%@", v12];
  unint64_t v14 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  unint64_t v16 = [v15 lastPathComponent];
  dispatch_time_t v17 = [NSString stringWithUTF8String:"-[PLDebugService testArray]"];
  [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:2554];

  dispatch_time_t v18 = PLLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    double v20 = v13;
    _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testGenerateOTASubmission
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"Starting generateOTASubmission"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService testGenerateOTASubmission]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2558];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    int v10 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  int v8 = [MEMORY[0x1E4F92A68] sharedInstance];
  [v8 generateOTASubmissionAndSendTaskingEndSubmission:1];
}

- (void)testGenerateSafeguardSubmission
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"Starting generateSafeguardSubmission"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService testGenerateSafeguardSubmission]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2564];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    int v10 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  int v8 = [MEMORY[0x1E4F92AC8] sharedInstance];
  [v8 performSubmission];
}

- (void)testScheduleSafeguardSubmission
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"Starting generateSafeguardSubmission"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService testScheduleSafeguardSubmission]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2571];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    int v10 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  int v8 = [MEMORY[0x1E4F92AC8] sharedInstance];
  [v8 scheduleSubmission];
}

- (void)stressTaskingSubmission
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"Starting stressTaskingSubmission"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService stressTaskingSubmission]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2577];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    uint64_t v11 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v10, 0xCu);
  }

  int v8 = 100;
  do
  {
    int v9 = [MEMORY[0x1E4F92A68] sharedInstance];
    [v9 generateOTASubmissionAndSendTaskingEndSubmission:1];

    --v8;
  }
  while (v8);
}

- (void)testFastInserts
{
  id v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"FastInsertTest"];
  uint64_t v3 = 0;
  do
  {
    double v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
    uint64_t v5 = [NSNumber numberWithInt:v3];
    [v4 setObject:v5 forKeyedSubscript:@"iteration"];

    [(PLOperator *)self logEntry:v4];
    uint64_t v3 = (v3 + 1);
  }
  while (v3 != 2000);
}

- (void)testAllEntryKeyRequests
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  v60 = [MEMORY[0x1E4F92A88] allSubClassesForClass:objc_opt_class()];
  id v2 = [v60 sortedArrayUsingComparator:&__block_literal_global_1259];
  group = dispatch_group_create();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v73 objects:v80 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v74;
    uint64_t v61 = *(void *)v74;
    id v62 = v3;
    do
    {
      uint64_t v7 = 0;
      uint64_t v63 = v5;
      do
      {
        if (*(void *)v74 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v73 + 1) + 8 * v7);
        int v9 = [v8 className];
        int v10 = [v9 hasPrefix:@"PLBBAgent"];

        uint64_t v64 = v7;
        if (v10)
        {
          uint64_t v11 = [NSString stringWithFormat:@"<rdar://problem/16693449> BBAgent: selector for entryDefinition has to be available on the Operator"];
          uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
          long long v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
          unint64_t v14 = [v13 lastPathComponent];
          uint64_t v15 = [NSString stringWithUTF8String:"-[PLDebugService testAllEntryKeyRequests]"];
          [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:2613];

          unint64_t v16 = PLLogCommon();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_33;
          }
LABEL_14:
          *(_DWORD *)long long buf = 138412290;
          v79 = v11;
          _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_33;
        }
        dispatch_time_t v17 = [v8 className];
        int v18 = [v17 hasPrefix:@"PLIOReport"];

        if (v18)
        {
          uint64_t v11 = [NSString stringWithFormat:@"<rdar://problem/16694077> PLIOReport should use kPLEDLogSelector in the definitions to setup trigger for requests"];
          uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
          double v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
          uint64_t v21 = [v20 lastPathComponent];
          id v22 = [NSString stringWithUTF8String:"-[PLDebugService testAllEntryKeyRequests]"];
          [v19 logMessage:v11 fromFile:v21 fromFunction:v22 fromLineNumber:2615];

          unint64_t v16 = PLLogCommon();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_33;
          }
          goto LABEL_14;
        }
        id v23 = [v8 className];
        int v24 = [v23 hasPrefix:@"PLVideoAgent"];

        if (v24)
        {
          uint64_t v11 = [NSString stringWithFormat:@"<rdar://problem/16694177> PLVideoAgent_EventForward_VRPStatus needs to either be kPLEDOnDemandQuery: @(NO) or have method for requesting"];
          uint64_t v25 = (void *)MEMORY[0x1E4F929B8];
          long long v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
          uint64_t v27 = [v26 lastPathComponent];
          uint64_t v28 = [NSString stringWithUTF8String:"-[PLDebugService testAllEntryKeyRequests]"];
          [v25 logMessage:v11 fromFile:v27 fromFunction:v28 fromLineNumber:2617];

          unint64_t v16 = PLLogCommon();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_33;
          }
          goto LABEL_14;
        }
        long long v29 = [v8 entryKeys];
        uint64_t v30 = [v29 sortedArrayUsingSelector:sel_compare_];

        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        unint64_t v16 = v30;
        uint64_t v31 = [v16 countByEnumeratingWithState:&v69 objects:v77 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v67 = *(void *)v70;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v70 != v67) {
                objc_enumerationMutation(v16);
              }
              uint64_t v34 = *(void *)(*((void *)&v69 + 1) + 8 * i);
              id v35 = [NSString stringWithFormat:@"!!! entryKey=%@, entryKeys=%@", v34, v16];
              id v36 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
              uint64_t v38 = [v37 lastPathComponent];
              v39 = [NSString stringWithUTF8String:"-[PLDebugService testAllEntryKeyRequests]"];
              [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:2622];

              char v40 = PLLogCommon();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = 138412290;
                v79 = v35;
                _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              if ([MEMORY[0x1E4F929D8] isOnDemandQueryableForEntryKey:v34])
              {
                uint64_t v41 = [NSString stringWithFormat:@"** Requesting %@", v34];
                id v42 = (void *)MEMORY[0x1E4F929B8];
                uint64_t v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
                uint64_t v44 = [v43 lastPathComponent];
                dispatch_semaphore_t v45 = [NSString stringWithUTF8String:"-[PLDebugService testAllEntryKeyRequests]"];
                [v42 logMessage:v41 fromFile:v44 fromFunction:v45 fromLineNumber:2624];

                char v46 = PLLogCommon();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 138412290;
                  v79 = v41;
                  _os_log_debug_impl(&dword_1D2690000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                id v47 = dispatch_get_global_queue(2, 0);
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __41__PLDebugService_testAllEntryKeyRequests__block_invoke_1286;
                block[3] = &unk_1E692B128;
                void block[4] = v34;
                void block[5] = self;
                dispatch_group_async(group, v47, block);
              }
              else
              {
                id v48 = [NSString stringWithFormat:@"** Skipping %@", v34];
                uint64_t v49 = (void *)MEMORY[0x1E4F929B8];
                char v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
                uint64_t v51 = [v50 lastPathComponent];
                id v52 = [NSString stringWithUTF8String:"-[PLDebugService testAllEntryKeyRequests]"];
                [v49 logMessage:v48 fromFile:v51 fromFunction:v52 fromLineNumber:2635];

                id v53 = PLLogCommon();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 138412290;
                  v79 = v48;
                  _os_log_debug_impl(&dword_1D2690000, v53, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
              }
            }
            uint64_t v32 = [v16 countByEnumeratingWithState:&v69 objects:v77 count:16];
          }
          while (v32);
          uint64_t v11 = v16;
          id v3 = v62;
          uint64_t v5 = v63;
          uint64_t v6 = v61;
        }
        else
        {
          uint64_t v11 = v16;
        }
LABEL_33:

        uint64_t v7 = v64 + 1;
      }
      while (v64 + 1 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v73 objects:v80 count:16];
    }
    while (v5);
  }

  long long v54 = [NSString stringWithFormat:@"all requests sent... wait time."];
  int v55 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v56 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  long long v57 = [v56 lastPathComponent];
  dispatch_semaphore_t v58 = [NSString stringWithUTF8String:"-[PLDebugService testAllEntryKeyRequests]"];
  [v55 logMessage:v54 fromFile:v57 fromFunction:v58 fromLineNumber:2642];

  v59 = PLLogCommon();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    v79 = v54;
    _os_log_debug_impl(&dword_1D2690000, v59, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __41__PLDebugService_testAllEntryKeyRequests__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 className];
  uint64_t v6 = [v4 className];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __41__PLDebugService_testAllEntryKeyRequests__block_invoke_1286(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v16 = 0;
  id v4 = [MEMORY[0x1E4F929E8] requestEntryForEntryKey:v2 forOperator:v3 withTimeout:&v16 error:60.0];
  id v5 = v16;
  if (v5)
  {
    uint64_t v6 = [NSString stringWithFormat:@"** Timeout %@: %@", *(void *)(a1 + 32), v5];
    uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
    int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
    int v9 = [v8 lastPathComponent];
    int v10 = [NSString stringWithUTF8String:"-[PLDebugService testAllEntryKeyRequests]_block_invoke"];
    [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:2631];

    uint64_t v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      int v18 = v6;
LABEL_7:
      _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = [NSString stringWithFormat:@"** Response %@: %@", *(void *)(a1 + 32), v4];
    uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
    long long v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
    unint64_t v14 = [v13 lastPathComponent];
    uint64_t v15 = [NSString stringWithUTF8String:"-[PLDebugService testAllEntryKeyRequests]_block_invoke"];
    [v12 logMessage:v6 fromFile:v14 fromFunction:v15 fromLineNumber:2629];

    uint64_t v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      int v18 = v6;
      goto LABEL_7;
    }
  }
}

- (void)testEntrySleep
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"faking a sleep"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService testEntrySleep]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2647];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    int v10 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"DEBUG_FakeSleep" object:0];
}

- (void)testEntryWake
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"faking a wake"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLDebugService testEntryWake]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2652];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    int v10 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"DEBUG_FakeWake" object:0];
}

- (void)testEntryLogRequestedForEntryKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D942A350]();
  uint64_t v6 = [NSString stringWithFormat:@"posting %@", v4];
  uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
  int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  int v9 = [v8 lastPathComponent];
  int v10 = [NSString stringWithUTF8String:"-[PLDebugService testEntryLogRequestedForEntryKey:]"];
  [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:2658];

  uint64_t v11 = PLLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    double v20 = v6;
    _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v12 = [MEMORY[0x1E4F929E8] requestEntryForEntryKey:v4 forOperator:self withTimeout:0 error:60.0];
  long long v13 = [NSString stringWithFormat:@"DONE! %@=%@", v4, v12];
  unint64_t v14 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  id v16 = [v15 lastPathComponent];
  dispatch_time_t v17 = [NSString stringWithUTF8String:"-[PLDebugService testEntryLogRequestedForEntryKey:]"];
  [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:2660];

  int v18 = PLLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    double v20 = v13;
    _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testEntryApplicationAgent
{
  uint64_t v3 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PLDebugService_testEntryApplicationAgent__block_invoke;
  block[3] = &unk_1E692A250;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __43__PLDebugService_testEntryApplicationAgent__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D942A350]();
  uint64_t v3 = [*(id *)(a1 + 32) storage];
  id v4 = [v3 lastEntryForKey:@"PLApplicationAgent_EventForward_Application"];

  id v5 = [NSString stringWithFormat:@"lastApp=%@", v4];
  uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  int v8 = [v7 lastPathComponent];
  int v9 = [NSString stringWithUTF8String:"-[PLDebugService testEntryApplicationAgent]_block_invoke"];
  [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:2668];

  int v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v19 = v5;
    _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v11 = [*(id *)(a1 + 32) storage];
  [v11 loadDynamicValuesIntoEntry:v4];

  uint64_t v12 = [NSString stringWithFormat:@"lastApp(w/D)=%@", v4];
  long long v13 = (void *)MEMORY[0x1E4F929B8];
  unint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v15 = [v14 lastPathComponent];
  id v16 = [NSString stringWithUTF8String:"-[PLDebugService testEntryApplicationAgent]_block_invoke"];
  [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:2670];

  dispatch_time_t v17 = PLLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v19 = v12;
    _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testEntryDelete
{
  uint64_t v3 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PLDebugService_testEntryDelete__block_invoke;
  block[3] = &unk_1E692A250;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __33__PLDebugService_testEntryDelete__block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D942A350]();
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x3032000000;
  uint64_t v65 = __Block_byref_object_copy__16;
  uint64_t v66 = __Block_byref_object_dispose__16;
  uint64_t v60 = a1;
  uint64_t v2 = [*(id *)(a1 + 32) storage];
  id v67 = [v2 lastEntryForKey:@"PLBatteryAgent_EventBackward_Battery"];

  uint64_t v3 = [NSString stringWithFormat:@"Deleting %@ in...", v63[5]];
  id v4 = (void *)MEMORY[0x1E4F929B8];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLDebugService testEntryDelete]_block_invoke"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:2679];

  int v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v69 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  LODWORD(v9) = 11;
  do
  {
    sleep(1u);
    uint64_t v9 = (v9 - 1);
    int v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d...", v9);
    uint64_t v11 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
    long long v13 = [v12 lastPathComponent];
    unint64_t v14 = [NSString stringWithUTF8String:"-[PLDebugService testEntryDelete]_block_invoke"];
    [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:2682];

    uint64_t v15 = PLLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v69 = v10;
      _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  while (v9 > 1);
  id v16 = [*(id *)(v60 + 32) storage];
  [v16 deleteEntry:v63[5]];

  dispatch_time_t v17 = [*(id *)(v60 + 32) storage];
  v59 = [v17 lastEntryForKey:@"PLIOReportAgent_EventBackward_IOReport"];

  int v18 = [NSString stringWithFormat:@"Deleting %@ in...", v59];
  uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v21 = [v20 lastPathComponent];
  id v22 = [NSString stringWithUTF8String:"-[PLDebugService testEntryDelete]_block_invoke"];
  [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:2687];

  id v23 = PLLogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v69 = v18;
    _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  LODWORD(v24) = 11;
  do
  {
    sleep(1u);
    uint64_t v24 = (v24 - 1);
    uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"%d...", v24);
    long long v26 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
    uint64_t v28 = [v27 lastPathComponent];
    long long v29 = [NSString stringWithUTF8String:"-[PLDebugService testEntryDelete]_block_invoke"];
    [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:2690];

    uint64_t v30 = PLLogCommon();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v69 = v25;
      _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  while (v24 > 1);
  uint64_t v31 = [*(id *)(v60 + 32) storage];
  [v31 deleteEntry:v59];

  uint64_t v32 = [*(id *)(v60 + 32) storage];
  uint64_t v33 = [v32 lastEntryForKey:@"PLBatteryAgent_EventBackward_Battery"];
  uint64_t v34 = (void *)v63[5];
  v63[5] = v33;

  id v35 = [NSString stringWithFormat:@"updating %@ in...", v63[5]];
  id v36 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v38 = [v37 lastPathComponent];
  v39 = [NSString stringWithUTF8String:"-[PLDebugService testEntryDelete]_block_invoke"];
  [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:2695];

  char v40 = PLLogCommon();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v69 = v35;
    _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  LODWORD(v41) = 11;
  do
  {
    sleep(1u);
    uint64_t v41 = (v41 - 1);
    id v42 = objc_msgSend(NSString, "stringWithFormat:", @"%d...", v41);
    uint64_t v43 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
    dispatch_semaphore_t v45 = [v44 lastPathComponent];
    char v46 = [NSString stringWithUTF8String:"-[PLDebugService testEntryDelete]_block_invoke"];
    [v43 logMessage:v42 fromFile:v45 fromFunction:v46 fromLineNumber:2698];

    id v47 = PLLogCommon();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v69 = v42;
      _os_log_debug_impl(&dword_1D2690000, v47, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  while (v41 > 1);
  id v48 = *(void **)(v60 + 32);
  uint64_t v49 = v63[5];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __33__PLDebugService_testEntryDelete__block_invoke_1342;
  v61[3] = &unk_1E692ACB0;
  void v61[4] = &v62;
  [v48 updateEntry:v49 withBlock:v61];
  char v50 = [*(id *)(v60 + 32) storage];
  uint64_t v51 = objc_msgSend(v50, "entryForKey:withID:", @"PLBatteryAgent_EventBackward_Battery", objc_msgSend((id)v63[5], "entryID"));

  id v52 = [NSString stringWithFormat:@"PreUpdate=%@\nPostUpdate=%@", v63[5], v51];
  id v53 = (void *)MEMORY[0x1E4F929B8];
  long long v54 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  int v55 = [v54 lastPathComponent];
  uint64_t v56 = [NSString stringWithUTF8String:"-[PLDebugService testEntryDelete]_block_invoke"];
  [v53 logMessage:v52 fromFile:v55 fromFunction:v56 fromLineNumber:2708];

  long long v57 = PLLogCommon();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v69 = v52;
    _os_log_debug_impl(&dword_1D2690000, v57, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  _Block_object_dispose(&v62, 8);
}

uint64_t __33__PLDebugService_testEntryDelete__block_invoke_1342(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsCharging"];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:&unk_1F29E7978 forKeyedSubscript:@"ChemID"];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return [v2 setObject:&unk_1F29E7990 forKeyedSubscript:@"DesignCapacity"];
}

- (void)testEntryQueries
{
  uint64_t v3 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PLDebugService_testEntryQueries__block_invoke;
  block[3] = &unk_1E692A250;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __34__PLDebugService_testEntryQueries__block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D942A350]();
  uint64_t v2 = [*(id *)(a1 + 32) storage];
  uint64_t v3 = [v2 lastEntryForKey:@"PLBatteryAgent_EventBackward_Battery"];

  id v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  long long v72 = (void *)v3;
  uint64_t v7 = [v4 stringWithFormat:@"Last Battery(%@)=%@", v6, v3];

  int v8 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  int v10 = [v9 lastPathComponent];
  uint64_t v11 = [NSString stringWithUTF8String:"-[PLDebugService testEntryQueries]_block_invoke"];
  [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:2718];

  uint64_t v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v75 = v7;
    _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  long long v13 = [*(id *)(a1 + 32) storage];
  unint64_t v14 = [v13 entriesForKey:@"PLBatteryAgent_EventBackward_Battery" startingFromRowID:232 count:1 withFilters:0];

  uint64_t v15 = [NSString stringWithFormat:@"row %lld=%@", 232, v14];
  id v16 = (void *)MEMORY[0x1E4F929B8];
  dispatch_time_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  int v18 = [v17 lastPathComponent];
  uint64_t v19 = [NSString stringWithUTF8String:"-[PLDebugService testEntryQueries]_block_invoke"];
  [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:2725];

  uint64_t v20 = PLLogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v75 = v15;
    _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v21 = [*(id *)(a1 + 32) storage];
  id v22 = [v21 entriesForKey:@"PLBatteryAgent_EventBackward_Battery" startingFromRowID:232 count:5 withFilters:0];

  id v23 = [NSString stringWithFormat:@"row %lld + 5=%@", 232, v22];
  uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  long long v26 = [v25 lastPathComponent];
  uint64_t v27 = [NSString stringWithUTF8String:"-[PLDebugService testEntryQueries]_block_invoke"];
  [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:2728];

  uint64_t v28 = PLLogCommon();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v75 = v23;
    _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  long long v29 = [*(id *)(a1 + 32) storage];
  uint64_t v30 = [v29 entriesForKey:@"PLBatteryAgent_EventBackward_Battery" startingFromRowID:232 count:-5 withFilters:0];

  uint64_t v31 = [NSString stringWithFormat:@"row %lld - 5=%@", 232, v30];
  uint64_t v32 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v34 = [v33 lastPathComponent];
  id v35 = [NSString stringWithUTF8String:"-[PLDebugService testEntryQueries]_block_invoke"];
  [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:2731];

  id v36 = PLLogCommon();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v75 = v31;
    _os_log_debug_impl(&dword_1D2690000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v37 = [v30 objectAtIndexedSubscript:0];
  uint64_t v38 = [v37 entryDate];

  v39 = [MEMORY[0x1E4F92A98] formattedStringForDate:v38];
  char v40 = [v38 dateByAddingTimeInterval:300.0];
  uint64_t v41 = [MEMORY[0x1E4F92A98] formattedStringForDate:v40];
  id v42 = v40;
  long long v71 = v38;
  [v38 timeIntervalSince1970];
  double v44 = v43;
  [v42 timeIntervalSince1970];
  double v46 = v45;

  double v47 = v46 - v44;
  [*(id *)(a1 + 32) storage];
  uint64_t v49 = v48 = a1;
  char v50 = objc_msgSend(v49, "entriesForKey:inTimeRange:withFilters:", @"PLBatteryAgent_EventBackward_Battery", 0, v44, v47);

  uint64_t v51 = [NSString stringWithFormat:@"row %@ - %@=%@", v39, v41, v50];
  id v52 = (void *)MEMORY[0x1E4F929B8];
  id v53 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  long long v54 = [v53 lastPathComponent];
  int v55 = [NSString stringWithUTF8String:"-[PLDebugService testEntryQueries]_block_invoke"];
  [v52 logMessage:v51 fromFile:v54 fromFunction:v55 fromLineNumber:2740];

  uint64_t v56 = PLLogCommon();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v75 = v51;
    _os_log_debug_impl(&dword_1D2690000, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  long long v57 = [*(id *)(v48 + 32) storage];
  dispatch_semaphore_t v58 = objc_msgSend(v57, "entriesForKey:inTimeRange:withCountOfEntriesBefore:withCountOfEntriesAfter:withFilters:", @"PLBatteryAgent_EventBackward_Battery", 10, 10, 0, v44, v47);

  v59 = [NSString stringWithFormat:@"row %@ - %@ +/- 10=%@", v39, v41, v58];
  uint64_t v60 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v61 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v62 = [v61 lastPathComponent];
  uint64_t v63 = [NSString stringWithUTF8String:"-[PLDebugService testEntryQueries]_block_invoke"];
  [v60 logMessage:v59 fromFile:v62 fromFunction:v63 fromLineNumber:2743];

  uint64_t v64 = PLLogCommon();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v75 = v59;
    _os_log_debug_impl(&dword_1D2690000, v64, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  sleep(5u);
  uint64_t v65 = [NSString stringWithFormat:@"alright memory go down!"];
  uint64_t v66 = (void *)MEMORY[0x1E4F929B8];
  id v67 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v68 = [v67 lastPathComponent];
  long long v69 = [NSString stringWithUTF8String:"-[PLDebugService testEntryQueries]_block_invoke"];
  [v66 logMessage:v65 fromFile:v68 fromFunction:v69 fromLineNumber:2746];

  uint64_t v70 = PLLogCommon();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v75 = v65;
    _os_log_debug_impl(&dword_1D2690000, v70, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testMonotonicAggregateEntries
{
  uint64_t v2 = [(PLOperator *)self workQueue];
  dispatch_async(v2, &__block_literal_global_1382);
}

void __47__PLDebugService_testMonotonicAggregateEntries__block_invoke()
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D942A350]();
  id v0 = [NSString stringWithFormat:@"begin testMonotonicAggregateEntries"];
  id v1 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v3 = [v2 lastPathComponent];
  id v4 = [NSString stringWithUTF8String:"-[PLDebugService testMonotonicAggregateEntries]_block_invoke"];
  [v1 logMessage:v0 fromFile:v3 fromFunction:v4 fromLineNumber:2755];

  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v24 = v0;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AggregateTestSplitAndBucket"];
  uint64_t v7 = [MEMORY[0x1E4F92AD0] sharedCore];
  int v8 = [v7 storage];
  [v8 deleteAllEntriesForKey:v6];

  for (int i = 0; i != 15000; ++i)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F929D0]);
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    uint64_t v12 = (void *)[v10 initWithEntryKey:v6 withDate:v11];

    long long v13 = [NSNumber numberWithInt:(unsigned __int16)i / 0x96u];
    [v12 setObject:v13 forKeyedSubscript:@"PrimaryKey1"];

    [v12 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField"];
    [v12 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField2"];
    unint64_t v14 = [MEMORY[0x1E4F92AD0] sharedCore];
    uint64_t v15 = [v14 storage];
    [v15 writeAggregateEntry:v12];
  }
  id v16 = [NSString stringWithFormat:@"end testMonotonicAggregateEntries"];
  dispatch_time_t v17 = (void *)MEMORY[0x1E4F929B8];
  int v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v19 = [v18 lastPathComponent];
  uint64_t v20 = [NSString stringWithUTF8String:"-[PLDebugService testMonotonicAggregateEntries]_block_invoke"];
  [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:2775];

  uint64_t v21 = PLLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v24 = v16;
    _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testMonotonicAggregateEntriesExtendedTime
{
  uint64_t v2 = [(PLOperator *)self workQueue];
  dispatch_async(v2, &__block_literal_global_1390);
}

void __59__PLDebugService_testMonotonicAggregateEntriesExtendedTime__block_invoke()
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D942A350]();
  id v0 = [NSString stringWithFormat:@"begin testMonotonicAggregateEntriesExtendedTime"];
  id v1 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v3 = [v2 lastPathComponent];
  id v4 = [NSString stringWithUTF8String:"-[PLDebugService testMonotonicAggregateEntriesExtendedTime]_block_invoke"];
  [v1 logMessage:v0 fromFile:v3 fromFunction:v4 fromLineNumber:2783];

  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v26 = v0;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AggregateTestSplitAndBucket"];
  uint64_t v7 = [MEMORY[0x1E4F92AD0] sharedCore];
  int v8 = [v7 storage];
  [v8 deleteAllEntriesForKey:v6];

  int v9 = 0;
  double v10 = 0.0;
  do
  {
    id v11 = objc_alloc(MEMORY[0x1E4F929D0]);
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    long long v13 = [v12 dateByAddingTimeInterval:v10 * 60.0];
    unint64_t v14 = (void *)[v11 initWithEntryKey:v6 withDate:v13];

    uint64_t v15 = [NSNumber numberWithInt:(unsigned __int16)v9 / 0x96u];
    [v14 setObject:v15 forKeyedSubscript:@"PrimaryKey1"];

    [v14 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField"];
    [v14 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField2"];
    id v16 = [MEMORY[0x1E4F92AD0] sharedCore];
    dispatch_time_t v17 = [v16 storage];
    [v17 writeAggregateEntry:v14];

    double v10 = v10 + 1.0;
    ++v9;
  }
  while (v9 != 15000);
  int v18 = [NSString stringWithFormat:@"end testMonotonicAggregateEntriesExtendedTime"];
  uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v21 = [v20 lastPathComponent];
  id v22 = [NSString stringWithUTF8String:"-[PLDebugService testMonotonicAggregateEntriesExtendedTime]_block_invoke"];
  [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:2803];

  id v23 = PLLogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v26 = v18;
    _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testProportionateAggregateEntries
{
  uint64_t v2 = [(PLOperator *)self workQueue];
  dispatch_async(v2, &__block_literal_global_1398);
}

void __51__PLDebugService_testProportionateAggregateEntries__block_invoke()
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D942A350]();
  id v0 = [NSString stringWithFormat:@"begin testProportionateAggregateEntries"];
  id v1 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  uint64_t v3 = [v2 lastPathComponent];
  id v4 = [NSString stringWithUTF8String:"-[PLDebugService testProportionateAggregateEntries]_block_invoke"];
  [v1 logMessage:v0 fromFile:v3 fromFunction:v4 fromLineNumber:2811];

  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v51 = v0;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AggregateTestSplitAndBucket"];
  uint64_t v7 = [MEMORY[0x1E4F92AD0] sharedCore];
  int v8 = [v7 storage];
  [v8 deleteAllEntriesForKey:v6];

  id v9 = objc_alloc(MEMORY[0x1E4F929D0]);
  double v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v11 = (void *)[v9 initWithEntryKey:v6 withDate:v10];

  [v11 setObject:&unk_1F29E7960 forKeyedSubscript:@"PrimaryKey1"];
  [v11 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField"];
  [v11 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField2"];
  uint64_t v12 = [MEMORY[0x1E4F92AD0] sharedCore];
  long long v13 = [v12 storage];
  unint64_t v14 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v16 = [v15 dateByAddingTimeInterval:60.0];
  double v47 = v11;
  [v13 writeProportionateAggregateEntry:v11 withStartDate:v14 withEndDate:v16];

  id v17 = objc_alloc(MEMORY[0x1E4F929D0]);
  int v18 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v19 = (void *)[v17 initWithEntryKey:v6 withDate:v18];

  [v19 setObject:&unk_1F29E79A8 forKeyedSubscript:@"PrimaryKey1"];
  [v19 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField"];
  [v19 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField2"];
  uint64_t v20 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v21 = [v20 storage];
  id v22 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v23 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v24 = [v23 dateByAddingTimeInterval:3600.0];
  [v21 writeProportionateAggregateEntry:v19 withStartDate:v22 withEndDate:v24];

  id v25 = objc_alloc(MEMORY[0x1E4F929D0]);
  long long v26 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v27 = (void *)[v25 initWithEntryKey:v6 withDate:v26];

  [v27 setObject:&unk_1F29E79C0 forKeyedSubscript:@"PrimaryKey1"];
  [v27 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField"];
  [v27 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField2"];
  uint64_t v28 = [MEMORY[0x1E4F92AD0] sharedCore];
  long long v29 = [v28 storage];
  uint64_t v30 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v31 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v32 = [v31 dateByAddingTimeInterval:7200.0];
  [v29 writeProportionateAggregateEntry:v27 withStartDate:v30 withEndDate:v32];

  id v33 = objc_alloc(MEMORY[0x1E4F929D0]);
  uint64_t v34 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v48 = (void *)v6;
  id v35 = (void *)[v33 initWithEntryKey:v6 withDate:v34];

  [v35 setObject:&unk_1F29E79D8 forKeyedSubscript:@"PrimaryKey1"];
  [v35 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField"];
  [v35 setObject:&unk_1F29E7960 forKeyedSubscript:@"SumField2"];
  id v36 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v37 = [v36 storage];
  uint64_t v38 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  v39 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  char v40 = [v39 dateByAddingTimeInterval:93600.0];
  [v37 writeProportionateAggregateEntry:v35 withStartDate:v38 withEndDate:v40];

  uint64_t v41 = [NSString stringWithFormat:@"end testProportionateAggregateEntries"];
  id v42 = (void *)MEMORY[0x1E4F929B8];
  double v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m"];
  double v44 = [v43 lastPathComponent];
  double v45 = [NSString stringWithUTF8String:"-[PLDebugService testProportionateAggregateEntries]_block_invoke"];
  [v42 logMessage:v41 fromFile:v44 fromFunction:v45 fromLineNumber:2858];

  double v46 = PLLogCommon();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v51 = v41;
    _os_log_debug_impl(&dword_1D2690000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (id)handleEnergyMonitorDebugQuery:(id)a3
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLDebugService *)self energyMonitorDebugInstance];

  if (!v5)
  {
    id v17 = &unk_1F29EB700;
    goto LABEL_12;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"queryType"];
  if (([v6 isEqualToString:@"reportStartEvent"] & 1) == 0
    && ![v6 isEqualToString:@"reportStopEvent"])
  {
    if ([v6 isEqualToString:@"getValueForPropertyName"])
    {
      uint64_t v20 = v6;
      uint64_t v21 = [v4 objectForKeyedSubscript:@"propertyName"];
      id v22 = [(PLDebugService *)self energyMonitorDebugInstance];
      id v23 = [(PLDebugService *)self getValueForPropertyName:v21 forEnergyMonitor:v22];

      if ([v21 isEqualToString:@"discretionaryIntervals"])
      {
        uint64_t v24 = objc_opt_new();
        id v25 = [v23 objectForKeyedSubscript:@"discretionaryIntervals"];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __48__PLDebugService_handleEnergyMonitorDebugQuery___block_invoke;
        void v43[3] = &unk_1E6931350;
        double v44 = v24;
        id v26 = v24;
        [v25 enumerateKeysAndObjectsUsingBlock:v43];
        uint64_t v51 = @"response";
        v52[0] = v26;
        int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
        uint64_t v27 = v44;
      }
      else
      {
        if (![v21 isEqualToString:@"quickEnergySnapshots"])
        {
          double v47 = @"response";
          uint64_t v48 = v23;
          int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          goto LABEL_29;
        }
        uint64_t v31 = objc_opt_new();
        id v25 = [v23 objectForKeyedSubscript:@"quickEnergySnapshots"];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        void v41[2] = __48__PLDebugService_handleEnergyMonitorDebugQuery___block_invoke_3;
        v41[3] = &unk_1E692BAE0;
        id v42 = v31;
        id v26 = v31;
        [v25 enumerateObjectsUsingBlock:v41];
        uint64_t v49 = @"response";
        id v50 = v26;
        int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
        uint64_t v27 = v42;
      }

LABEL_29:
      uint64_t v6 = v20;
      goto LABEL_11;
    }
    if ([v6 isEqualToString:@"updateMockData"])
    {
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/tmp/energy_monitor_debug_config.plist"];
      if (v28)
      {
        long long v29 = PLLogCommon();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          double v46 = v28;
          _os_log_impl(&dword_1D2690000, v29, OS_LOG_TYPE_INFO, "Updating mockData with newMockData=%@", buf, 0xCu);
        }

        uint64_t v30 = [(PLDebugService *)self energyMonitorDebugInstance];
        [v30 updateMockData:v28];

        int v18 = &unk_1F29EB728;
      }
      else
      {
        int v18 = 0;
      }

      goto LABEL_11;
    }
    if ([v6 isEqualToString:@"reportChargingStatus"])
    {
      uint64_t v32 = [v4 objectForKeyedSubscript:@"chargingStatus"];
      uint64_t v33 = [v32 BOOLValue];

      uint64_t v34 = [(PLDebugService *)self energyMonitorDebugInstance];
      [v34 reportChargingStatus:v33];

      int v18 = &unk_1F29EB750;
      goto LABEL_11;
    }
    if (![v6 isEqualToString:@"runMethod"])
    {
      int v18 = &unk_1F29EB7A0;
      goto LABEL_11;
    }
    id v35 = [v4 objectForKeyedSubscript:@"methodName"];
    if ([v35 isEqualToString:@"generateEnergyReport"])
    {
      id v36 = v6;
      uint64_t v37 = [(PLDebugService *)self energyMonitorDebugInstance];
      [v37 generateEnergyReport];
    }
    else
    {
      if (![v35 isEqualToString:@"queryPowerlogForDiscretionaryEnergy"])
      {
LABEL_39:

        int v18 = &unk_1F29EB778;
        goto LABEL_11;
      }
      id v36 = v6;
      uint64_t v37 = [(PLDebugService *)self energyMonitorDebugInstance];
      [v37 queryPowerlogForDiscretionaryEnergy];
    }

    uint64_t v6 = v36;
    goto LABEL_39;
  }
  uint64_t v39 = objc_msgSend(v4, "objectForKeyedSubscript:", @"activityName", self);
  uint64_t v7 = [v4 objectForKeyedSubscript:@"involvedIdentifiers"];
  int v8 = NSNumber;
  id v9 = [v4 objectForKeyedSubscript:@"requiresNetwork"];
  double v10 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "BOOLValue"));

  id v11 = [v4 objectForKeyedSubscript:@"quality"];
  uint64_t v12 = [v4 objectForKeyedSubscript:@"cell"];
  id v40 = v4;
  long long v13 = [v4 objectForKeyedSubscript:@"wifi"];
  unint64_t v14 = objc_opt_new();
  [v14 setObject:v7 forKeyedSubscript:@"involvedIdentifiers"];
  [v14 setObject:v10 forKeyedSubscript:@"requiresNetwork"];
  [v14 setObject:v11 forKeyedSubscript:@"quality"];
  [v14 setObject:v12 forKeyedSubscript:@"cell"];
  [v14 setObject:v13 forKeyedSubscript:@"wifi"];
  if ([v6 isEqualToString:@"reportStartEvent"])
  {
    uint64_t v15 = [v38 energyMonitorDebugInstance];
    id v16 = (void *)v39;
    [v15 reportStartEvent:v39 withInfo:v14];
LABEL_9:

    goto LABEL_10;
  }
  id v16 = (void *)v39;
  if ([v6 isEqualToString:@"reportStopEvent"])
  {
    uint64_t v15 = [v38 energyMonitorDebugInstance];
    [v15 reportStopEvent:v39 withInfo:v14];
    goto LABEL_9;
  }
LABEL_10:

  int v18 = 0;
  id v4 = v40;
LABEL_11:
  id v17 = v18;

LABEL_12:
  return v17;
}

void __48__PLDebugService_handleEnergyMonitorDebugQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__PLDebugService_handleEnergyMonitorDebugQuery___block_invoke_2;
  v9[3] = &unk_1E692BAE0;
  id v10 = v7;
  id v8 = v7;
  [v5 enumerateObjectsUsingBlock:v9];

  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];
}

void __48__PLDebugService_handleEnergyMonitorDebugQuery___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithFormat:@"%@", a2];
  [v2 addObject:v3];
}

void __48__PLDebugService_handleEnergyMonitorDebugQuery___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithFormat:@"%@", a2];
  [v2 addObject:v3];
}

- (id)getValueForPropertyName:(id)a3 forEnergyMonitor:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v50 = v5;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Getting value for propertyName=%@", buf, 0xCu);
  }

  if ([v5 isEqualToString:@"discretionaryIntervals"])
  {
    id v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = [v6 intervalManager];
      uint64_t v20 = [v19 identifierToDiscretionaryIntervals];
      *(_DWORD *)long long buf = 138412290;
      id v50 = v20;
      _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "value=%@", buf, 0xCu);
    }
    id v47 = v5;
    id v9 = [v6 intervalManager];
    id v10 = [v9 identifierToDiscretionaryIntervals];
    uint64_t v48 = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];

    goto LABEL_30;
  }
  if ([v5 isEqualToString:@"quickEnergySnapshots"])
  {
    uint64_t v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v22 = [v6 quickEnergySnapshots];
      *(_DWORD *)long long buf = 138412290;
      id v50 = v22;
      _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "value=%@", buf, 0xCu);
    }
    id v45 = v5;
    id v9 = [v6 quickEnergySnapshots];
    double v46 = v9;
    long long v13 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v14 = &v46;
    uint64_t v15 = &v45;
    goto LABEL_29;
  }
  if ([v5 isEqualToString:@"lastPowerlogResponse"])
  {
    id v43 = v5;
    id v9 = [v6 lastPowerlogResponse];
    double v44 = v9;
    long long v13 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v14 = &v44;
    uint64_t v15 = &v43;
LABEL_29:
    id v11 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
LABEL_30:

    goto LABEL_31;
  }
  if ([v5 isEqualToString:@"lastReportedTotalEnergy"])
  {
    id v41 = v5;
    id v16 = NSNumber;
    [v6 lastReportedTotalEnergy];
    id v9 = objc_msgSend(v16, "numberWithDouble:");
    id v42 = v9;
    long long v13 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v14 = &v42;
    uint64_t v15 = &v41;
    goto LABEL_29;
  }
  if ([v5 isEqualToString:@"lastReportedCPUEnergy"])
  {
    id v39 = v5;
    id v17 = NSNumber;
    [v6 lastReportedCPUEnergy];
    id v9 = objc_msgSend(v17, "numberWithDouble:");
    id v40 = v9;
    long long v13 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v14 = &v40;
    uint64_t v15 = &v39;
    goto LABEL_29;
  }
  if ([v5 isEqualToString:@"lastReportedNetworkEnergy"])
  {
    id v37 = v5;
    int v18 = NSNumber;
    [v6 lastReportedNetworkEnergy];
    id v9 = objc_msgSend(v18, "numberWithDouble:");
    uint64_t v38 = v9;
    long long v13 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v14 = &v38;
    uint64_t v15 = &v37;
    goto LABEL_29;
  }
  if ([v5 isEqualToString:@"accumulatedCPUEnergy"])
  {
    id v35 = v5;
    uint64_t v21 = NSNumber;
    [v6 accumulatedCPUEnergy];
    id v9 = objc_msgSend(v21, "numberWithDouble:");
    id v36 = v9;
    long long v13 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v14 = &v36;
    uint64_t v15 = &v35;
    goto LABEL_29;
  }
  if ([v5 isEqualToString:@"accumulatedNetworkEnergy"])
  {
    id v33 = v5;
    id v23 = NSNumber;
    [v6 accumulatedNetworkEnergy];
    id v9 = objc_msgSend(v23, "numberWithDouble:");
    uint64_t v34 = v9;
    long long v13 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v14 = &v34;
    uint64_t v15 = &v33;
    goto LABEL_29;
  }
  if ([v5 isEqualToString:@"isCharging"])
  {
    id v31 = v5;
    id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isCharging"));
    uint64_t v32 = v9;
    long long v13 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v14 = &v32;
    uint64_t v15 = &v31;
    goto LABEL_29;
  }
  if ([v5 isEqualToString:@"mockData"])
  {
    uint64_t v24 = PLLogCommon();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      id v26 = [v6 mockData];
      *(_DWORD *)long long buf = 138412290;
      id v50 = v26;
      _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "value=%@", buf, 0xCu);
    }
    id v29 = v5;
    id v9 = [v6 mockData];
    uint64_t v30 = v9;
    long long v13 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v14 = &v30;
    uint64_t v15 = &v29;
    goto LABEL_29;
  }
  id v27 = v5;
  uint64_t v28 = @"No value found for propertyName";
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
LABEL_31:

  return v11;
}

- (PLXPCListenerOperatorComposition)xpcListenerPLLog
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setXpcListenerPLLog:(id)a3
{
}

- (PLXPCResponderOperatorComposition)xpcResponderPLLog
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setXpcResponderPLLog:(id)a3
{
}

- (PLXPCResponderOperatorComposition)xpcResponderPLAPITest
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setXpcResponderPLAPITest:(id)a3
{
}

- (PLXPCListenerOperatorComposition)aggregateTestListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAggregateTestListener:(id)a3
{
}

- (PLXPCResponderOperatorComposition)aggregateTestResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAggregateTestResponder:(id)a3
{
}

- (PLXPCListenerOperatorComposition)schemaTestListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSchemaTestListener:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)assertionListener
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAssertionListener:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)assertionNewListener
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAssertionNewListener:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)assertionUpdateListener
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAssertionUpdateListener:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)canSleepNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCanSleepNotification:(id)a3
{
}

- (PLSemaphore)canSleepSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCanSleepSemaphore:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)sleepNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSleepNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)wakeNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setWakeNotification:(id)a3
{
}

- (PLAccountingDebugService)accDS
{
  return (PLAccountingDebugService *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAccDS:(id)a3
{
}

- (PLXPCListenerOperatorComposition)clientFrameworkTestListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setClientFrameworkTestListener:(id)a3
{
}

- (PLXPCResponderOperatorComposition)clientFrameworkTestResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setClientFrameworkTestResponder:(id)a3
{
}

- (PLXPCListenerOperatorComposition)clientFrameworkTestListenerNonAllowlisted
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setClientFrameworkTestListenerNonAllowlisted:(id)a3
{
}

- (PLXPCResponderOperatorComposition)clientFrameworkTestResponderNonAllowlisted
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setClientFrameworkTestResponderNonAllowlisted:(id)a3
{
}

- (PLXPCListenerOperatorComposition)clientFrameworkTestListenerBatch
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setClientFrameworkTestListenerBatch:(id)a3
{
}

- (PLXPCResponderOperatorComposition)clientFrameworkTestResponderBatch
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setClientFrameworkTestResponderBatch:(id)a3
{
}

- (NSDictionary)clientFrameworkTestData
{
  return (NSDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setClientFrameworkTestData:(id)a3
{
}

- (NSMutableArray)clientFrameworkTestDataBatch
{
  return (NSMutableArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setClientFrameworkTestDataBatch:(id)a3
{
}

- (PLXPCResponderOperatorComposition)energyMonitorDebugResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 224, 1);
}

- (void)setEnergyMonitorDebugResponder:(id)a3
{
}

- (PLDiscretionaryEnergyMonitor)energyMonitorDebugInstance
{
  return (PLDiscretionaryEnergyMonitor *)objc_getProperty(self, a2, 232, 1);
}

- (void)setEnergyMonitorDebugInstance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyMonitorDebugInstance, 0);
  objc_storeStrong((id *)&self->_energyMonitorDebugResponder, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestDataBatch, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestData, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestResponderBatch, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestListenerBatch, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestResponderNonAllowlisted, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestListenerNonAllowlisted, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestResponder, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestListener, 0);
  objc_storeStrong((id *)&self->_accDS, 0);
  objc_storeStrong((id *)&self->_wakeNotification, 0);
  objc_storeStrong((id *)&self->_sleepNotification, 0);
  objc_storeStrong((id *)&self->_canSleepSemaphore, 0);
  objc_storeStrong((id *)&self->_canSleepNotification, 0);
  objc_storeStrong((id *)&self->_assertionUpdateListener, 0);
  objc_storeStrong((id *)&self->_assertionNewListener, 0);
  objc_storeStrong((id *)&self->_assertionListener, 0);
  objc_storeStrong((id *)&self->_schemaTestListener, 0);
  objc_storeStrong((id *)&self->_aggregateTestResponder, 0);
  objc_storeStrong((id *)&self->_aggregateTestListener, 0);
  objc_storeStrong((id *)&self->_xpcResponderPLAPITest, 0);
  objc_storeStrong((id *)&self->_xpcResponderPLLog, 0);
  objc_storeStrong((id *)&self->_xpcListenerPLLog, 0);
}

@end