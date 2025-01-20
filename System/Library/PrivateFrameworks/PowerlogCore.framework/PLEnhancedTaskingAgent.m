@interface PLEnhancedTaskingAgent
+ (id)allowlistForSignpostAggregatedData;
+ (id)defaults;
+ (id)entryEventIntervalDefinitionInProcessAnimation;
+ (id)entryEventIntervalDefinitionScrollView;
+ (id)entryEventIntervalDefinitionUINavigationController;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitionAppSwitchTrigger;
+ (id)entryEventNoneDefinitions;
+ (void)load;
+ (void)logAggregatedDataFromSignpostWithStartDate:(id)a3 withEndDate:(id)a4;
- (PLEnhancedTaskingAgent)init;
- (id)aggregatedSignpostDataWithEntryKey:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5 withSignpostName:(id)a6 withProcess:(id)a7 withDataDict:(id)a8;
- (int)getSignpostNameValueGroupTypeFor:(id)a3;
- (void)logAggregatedDataFromSignpostWithPayload:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5;
@end

@implementation PLEnhancedTaskingAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLEnhancedTaskingAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"AppSwitchTrigger";
  objc_super v2 = [a1 entryEventNoneDefinitionAppSwitchTrigger];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventNoneDefinitionAppSwitchTrigger
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"Configs";
  v10[0] = @"SchemaVersion";
  v10[1] = @"TaskModeTable";
  v11[0] = &unk_1F1584AD0;
  v11[1] = MEMORY[0x1E4F1CC38];
  v10[2] = @"OnDemandQuery";
  v11[2] = MEMORY[0x1E4F1CC28];
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  v13[0] = v2;
  v12[1] = @"Keys";
  v8 = @"Enabled";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventIntervalDefinitions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"UINavigationController";
  v3 = [a1 entryEventIntervalDefinitionUINavigationController];
  v9[0] = v3;
  v8[1] = @"ScrollView";
  v4 = [a1 entryEventIntervalDefinitionScrollView];
  v9[1] = v4;
  v8[2] = @"InProcessAnimation";
  v5 = [a1 entryEventIntervalDefinitionInProcessAnimation];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)entryEventIntervalDefinitionUINavigationController
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = @"Configs";
  v18[0] = @"SchemaVersion";
  v18[1] = @"TaskModeTable";
  v19[0] = &unk_1F1584AD0;
  v19[1] = MEMORY[0x1E4F1CC38];
  v18[2] = @"OnDemandQuery";
  v18[3] = @"AppIdentifierKeys";
  v19[2] = MEMORY[0x1E4F1CC28];
  v19[3] = MEMORY[0x1E4F1CC38];
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  v21[0] = v15;
  v20[1] = @"Keys";
  v16[0] = @"timestampEnd";
  v14 = +[PLEntryDefinition sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_DateFormat");
  v17[0] = v13;
  v16[1] = @"SignpostName";
  objc_super v2 = +[PLEntryDefinition sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v17[1] = v3;
  v16[2] = @"ProcessName";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withProcessName");
  v17[2] = v5;
  v16[3] = @"Duration";
  v6 = +[PLEntryDefinition sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_withUnit_ms");
  v17[3] = v7;
  v16[4] = @"Count";
  v8 = +[PLEntryDefinition sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v17[4] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  v21[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v11;
}

+ (id)entryEventIntervalDefinitionInProcessAnimation
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = @"Configs";
  v18[0] = @"SchemaVersion";
  v18[1] = @"TaskModeTable";
  v19[0] = &unk_1F1584AD0;
  v19[1] = MEMORY[0x1E4F1CC38];
  v18[2] = @"OnDemandQuery";
  v18[3] = @"AppIdentifierKeys";
  v19[2] = MEMORY[0x1E4F1CC28];
  v19[3] = MEMORY[0x1E4F1CC38];
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  v21[0] = v15;
  v20[1] = @"Keys";
  v16[0] = @"timestampEnd";
  v14 = +[PLEntryDefinition sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_DateFormat");
  v17[0] = v13;
  v16[1] = @"SignpostName";
  objc_super v2 = +[PLEntryDefinition sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v17[1] = v3;
  v16[2] = @"ProcessName";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withProcessName");
  v17[2] = v5;
  v16[3] = @"Duration";
  v6 = +[PLEntryDefinition sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_withUnit_ms");
  v17[3] = v7;
  v16[4] = @"Count";
  v8 = +[PLEntryDefinition sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v17[4] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  v21[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v11;
}

+ (id)entryEventIntervalDefinitionScrollView
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = @"Configs";
  v20[0] = @"SchemaVersion";
  v20[1] = @"TaskModeTable";
  v21[0] = &unk_1F1584AE0;
  v21[1] = MEMORY[0x1E4F1CC38];
  void v20[2] = @"OnDemandQuery";
  v20[3] = @"AppIdentifierKeys";
  v21[2] = MEMORY[0x1E4F1CC28];
  v21[3] = MEMORY[0x1E4F1CC38];
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  v23[0] = v17;
  v22[1] = @"Keys";
  v18[0] = @"timestampEnd";
  v16 = +[PLEntryDefinition sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_DateFormat");
  v19[0] = v15;
  v18[1] = @"SignpostName";
  v14 = +[PLEntryDefinition sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v19[1] = v13;
  v18[2] = @"ValueGroup";
  objc_super v2 = +[PLEntryDefinition sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v19[2] = v3;
  v18[3] = @"ProcessName";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withProcessName");
  v19[3] = v5;
  void v18[4] = @"highRateDuration";
  v6 = +[PLEntryDefinition sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_withUnit_ms");
  void v19[4] = v7;
  v18[5] = @"Count";
  v8 = +[PLEntryDefinition sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v19[5] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  v23[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v11;
}

- (PLEnhancedTaskingAgent)init
{
  v11.receiver = self;
  v11.super_class = (Class)PLEnhancedTaskingAgent;
  objc_super v2 = [(PLAgent *)&v11 init];
  if (v2)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v3 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __30__PLEnhancedTaskingAgent_init__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v3;
      if (init_defaultOnce != -1) {
        dispatch_once(&init_defaultOnce, block);
      }
      if (init_classDebugEnabled)
      {
        v4 = [NSString stringWithFormat:@"PLEnhancedTaskingAgent enabled"];
        v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Agents/PLEnhancedTaskingAgent.m"];
        v6 = [v5 lastPathComponent];
        v7 = [NSString stringWithUTF8String:"-[PLEnhancedTaskingAgent init]"];
        +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:161];

        v8 = PLLogCommon();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    objc_storeStrong((id *)&_enhancedTaskingAgent, v2);
  }
  return v2;
}

BOOL __30__PLEnhancedTaskingAgent_init__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled = result;
  return result;
}

+ (void)logAggregatedDataFromSignpostWithStartDate:(id)a3 withEndDate:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    v7 = (void *)v6;
    if (!v5) {
      goto LABEL_19;
    }
  }
  else
  {
    v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    unint64_t v5 = (unint64_t)(id)logAggregatedDataFromSignpostWithStartDate_withEndDate__previousEndDate;
    objc_storeStrong((id *)&logAggregatedDataFromSignpostWithStartDate_withEndDate__previousEndDate, v7);
    if (!v5) {
      goto LABEL_19;
    }
  }
  if (v7)
  {
    v8 = +[PLEnhancedTaskingAgent allowlistForSignpostAggregatedData];
    if ([v8 count]) {
      BOOL v9 = _enhancedTaskingAgent == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v10 = objc_opt_class();
        uint64_t block = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        v22 = __81__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithStartDate_withEndDate___block_invoke;
        v23 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v24 = v10;
        if (logAggregatedDataFromSignpostWithStartDate_withEndDate__defaultOnce != -1) {
          dispatch_once(&logAggregatedDataFromSignpostWithStartDate_withEndDate__defaultOnce, &block);
        }
        if (logAggregatedDataFromSignpostWithStartDate_withEndDate__classDebugEnabled)
        {
          objc_super v11 = [NSString stringWithFormat:@"getSignpostSummary with allowlist = %@, startDate = %@, endDate = %@", v8, v5, v7, block, v21, v22, v23, v24];
          v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Agents/PLEnhancedTaskingAgent.m"];
          v13 = [v12 lastPathComponent];
          v14 = [NSString stringWithUTF8String:"+[PLEnhancedTaskingAgent logAggregatedDataFromSignpostWithStartDate:withEndDate:]"];
          +[PLCoreStorage logMessage:v11 fromFile:v13 fromFunction:v14 fromLineNumber:187];

          v15 = PLLogCommon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      v16 = objc_alloc_init(SignpostReaderHelper);
      v17 = [(id)v5 convertFromMonotonicToSystem];
      v18 = [v7 convertFromMonotonicToSystem];
      v19 = [(SignpostReaderHelper *)v16 getSignpostSummaryWithAllowlist:v8 withStartDate:v17 withEndDate:v18];
      [(id)_enhancedTaskingAgent logAggregatedDataFromSignpostWithPayload:v19 withStartDate:v5 withEndDate:v7];
    }
  }
LABEL_19:
}

BOOL __81__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithStartDate_withEndDate___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  logAggregatedDataFromSignpostWithStartDate_withEndDate__classDebugEnabled = result;
  return result;
}

+ (id)allowlistForSignpostAggregatedData
{
  if (+[PLDefaults taskMode]
    || +[PLDefaults fullMode])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v3 = +[PLOperator className];
    BOOL v4 = +[PLEntryKey isEntryKeySetup:@"PLEnhancedTaskingAgent_EventInterval_UINavigationController" forOperatorName:v3];

    if (v4) {
      [v2 addObject:@"UINavigationController"];
    }
    unint64_t v5 = +[PLOperator className];
    BOOL v6 = +[PLEntryKey isEntryKeySetup:@"PLEnhancedTaskingAgent_EventInterval_InProcessAnimation" forOperatorName:v5];

    if (v6) {
      [v2 addObject:@"InProcessAnimation"];
    }
    v7 = +[PLOperator className];
    BOOL v8 = +[PLEntryKey isEntryKeySetup:@"PLEnhancedTaskingAgent_EventInterval_ScrollView" forOperatorName:v7];

    if (v8) {
      [v2 addObject:@"ScrollView"];
    }
    if ([v2 count])
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v9 setObject:v2 forKey:@"com.apple.UIKit"];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __60__PLEnhancedTaskingAgent_allowlistForSignpostAggregatedData__block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v21 = v10;
    if (allowlistForSignpostAggregatedData_defaultOnce != -1) {
      dispatch_once(&allowlistForSignpostAggregatedData_defaultOnce, &block);
    }
    if (allowlistForSignpostAggregatedData_classDebugEnabled)
    {
      objc_super v11 = [NSString stringWithFormat:@"allowlistForSignpostAggregatedData=%@\n", v9, block, v18, v19, v20, v21];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Agents/PLEnhancedTaskingAgent.m"];
      v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"+[PLEnhancedTaskingAgent allowlistForSignpostAggregatedData]"];
      +[PLCoreStorage logMessage:v11 fromFile:v13 fromFunction:v14 fromLineNumber:221];

      v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  return v9;
}

BOOL __60__PLEnhancedTaskingAgent_allowlistForSignpostAggregatedData__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  allowlistForSignpostAggregatedData_classDebugEnabled = result;
  return result;
}

- (id)aggregatedSignpostDataWithEntryKey:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5 withSignpostName:(id)a6 withProcess:(id)a7 withDataDict:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [[PLEntry alloc] initWithEntryKey:v19 withDate:v18];

  [(PLEntry *)v20 setObject:v17 forKeyedSubscript:@"timestampEnd"];
  uint64_t v21 = [v14 objectForKeyedSubscript:@"Duration"];
  [v21 doubleValue];
  double v23 = v22;

  uint64_t v24 = NSNumber;
  uint64_t v25 = [(PLEnhancedTaskingAgent *)self getSignpostNameValueGroupTypeFor:v16];

  v26 = [v24 numberWithUnsignedInt:v25];
  [(PLEntry *)v20 setObject:v26 forKeyedSubscript:@"SignpostName"];

  [(PLEntry *)v20 setObject:v15 forKeyedSubscript:@"ProcessName"];
  v27 = [NSNumber numberWithUnsignedLongLong:(unint64_t)(v23 * 1000.0)];
  [(PLEntry *)v20 setObject:v27 forKeyedSubscript:@"Duration"];

  v28 = [v14 objectForKeyedSubscript:@"Count"];

  [(PLEntry *)v20 setObject:v28 forKeyedSubscript:@"Count"];
  return v20;
}

- (void)logAggregatedDataFromSignpostWithPayload:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate__defaultOnce != -1) {
      dispatch_once(&logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate__defaultOnce, block);
    }
    if (logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate__classDebugEnabled)
    {
      v12 = [NSString stringWithFormat:@"logAggregatedDataFromSignpostWithPayload:%@\n", v8];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Agents/PLEnhancedTaskingAgent.m"];
      id v14 = [v13 lastPathComponent];
      id v15 = [NSString stringWithUTF8String:"-[PLEnhancedTaskingAgent logAggregatedDataFromSignpostWithPayload:withStartDate:withEndDate:]"];
      +[PLCoreStorage logMessage:v12 fromFile:v14 fromFunction:v15 fromLineNumber:250];

      id v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_119;
  v19[3] = &unk_1E6253BD0;
  void v19[4] = self;
  id v20 = v9;
  id v21 = v10;
  id v17 = v10;
  id v18 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v19];
}

BOOL __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate__classDebugEnabled = result;
  return result;
}

void __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  BOOL v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = [v6 array];
  id v9 = [(id)objc_opt_class() entryKeyForType:@"EventInterval" andName:v5];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_2;
  v15[3] = &unk_1E6253BA8;
  v15[4] = *(void *)(a1 + 32);
  id v10 = v9;
  id v16 = v10;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v11 = v8;
  id v19 = v11;
  id v12 = v5;
  id v20 = v12;
  [v7 enumerateKeysAndObjectsUsingBlock:v15];

  if ([v11 count])
  {
    v13 = *(void **)(a1 + 32);
    id v21 = v10;
    v22[0] = v11;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    [v13 logEntries:v14 withGroupID:v10];
  }
}

void __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_3;
  void v8[3] = &unk_1E6253B80;
  BOOL v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = v5;
  id v13 = *(id *)(a1 + 64);
  id v14 = *(id *)(a1 + 72);
  id v7 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v6 objectForKeyedSubscript:@"Duration"],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    id v8 = [*(id *)(a1 + 32) aggregatedSignpostDataWithEntryKey:*(void *)(a1 + 40) withStartDate:*(void *)(a1 + 48) withEndDate:*(void *)(a1 + 56) withSignpostName:*(void *)(a1 + 64) withProcess:v5 withDataDict:v6];
    [*(id *)(a1 + 72) addObject:v8];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_4;
    void v10[3] = &unk_1E6253B58;
    id v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    id v15 = v5;
    id v16 = *(id *)(a1 + 80);
    id v17 = *(id *)(a1 + 72);
    [v6 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

void __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [*(id *)(a1 + 32) aggregatedSignpostDataWithEntryKey:*(void *)(a1 + 40) withStartDate:*(void *)(a1 + 48) withEndDate:*(void *)(a1 + 56) withSignpostName:*(void *)(a1 + 64) withProcess:*(void *)(a1 + 72) withDataDict:v5];
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "getSignpostNameValueGroupTypeFor:", v13));
    [v6 setObject:v7 forKeyedSubscript:@"ValueGroup"];

    if ([*(id *)(a1 + 80) isEqualToString:@"ScrollView"])
    {
      id v8 = [v5 objectForKeyedSubscript:@"highRateDuration"];

      if (v8)
      {
        id v9 = [v5 objectForKeyedSubscript:@"highRateDuration"];
        [v9 doubleValue];
        double v11 = v10;

        id v12 = [NSNumber numberWithUnsignedLongLong:(unint64_t)(v11 * 1000.0)];
        [v6 setObject:v12 forKeyedSubscript:@"highRateDuration"];
      }
    }
    [*(id *)(a1 + 88) addObject:v6];
  }
}

- (int)getSignpostNameValueGroupTypeFor:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NavigationTransition"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CustomNavigationTransition"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SwitchTabs"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Scroll_Dragging"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Scroll_Deceleration"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Scroll_Animating"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Vertical"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Horizontal"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Diagonal"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"AnimatorRunning"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Scroll_Zooming"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

@end